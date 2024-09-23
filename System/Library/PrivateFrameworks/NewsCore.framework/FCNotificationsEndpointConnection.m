@implementation FCNotificationsEndpointConnection

void __111__FCNotificationsEndpointConnection_initWithEndpointConnection_configurationManager_bundleSubscriptionManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __111__FCNotificationsEndpointConnection_initWithEndpointConnection_configurationManager_bundleSubscriptionManager___block_invoke_2;
  v6[3] = &unk_1E463F0E8;
  v4 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "fetchConfigurationIfNeededWithCompletion:", v6);

}

void __111__FCNotificationsEndpointConnection_initWithEndpointConnection_configurationManager_bundleSubscriptionManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      v8 = 138543362;
      v9 = v6;
      _os_log_error_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch endpoint configuration with error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "updateBaseURL:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)updateBaseURL:(id)a3
{
  id v4;

  +[FCBaseURLConfiguration notificationsBaseURLForConfiguration:](FCBaseURLConfiguration, "notificationsBaseURLForConfiguration:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FCNotificationsEndpointConnection setBaseURL:](self, "setBaseURL:", v4);

}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (FCNotificationsEndpointConnection)initWithConfigurationManager:(id)a3 bundleSubscriptionManager:(id)a4
{
  id v6;
  id v7;
  FCEndpointConnection *v8;
  FCNotificationsEndpointConnection *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(FCEndpointConnection);
  v9 = -[FCNotificationsEndpointConnection initWithEndpointConnection:configurationManager:bundleSubscriptionManager:](self, "initWithEndpointConnection:configurationManager:bundleSubscriptionManager:", v8, v7, v6);

  return v9;
}

- (FCNotificationsEndpointConnection)initWithEndpointConnection:(id)a3 configurationManager:(id)a4 bundleSubscriptionManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  FCNotificationsEndpointConnection *v12;
  FCNotificationsEndpointConnection *v13;
  FCAsyncSerialQueue *v14;
  FCAsyncSerialQueue *serialQueue;
  uint64_t v16;
  NSString *deviceType;
  uint64_t v18;
  NSString *deviceOSVersion;
  FCFileCoordinatedNotificationDropbox *v20;
  void *v21;
  uint64_t v22;
  FCFileCoordinatedNotificationDropbox *fileCoordinatedNotificationDropbox;
  void *v24;
  _QWORD v26[4];
  id v27;
  FCNotificationsEndpointConnection *v28;
  objc_super v29;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)FCNotificationsEndpointConnection;
  v12 = -[FCNotificationsEndpointConnection init](&v29, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_endpointConnection, a3);
    objc_storeStrong((id *)&v13->_configurationManager, a4);
    objc_storeStrong((id *)&v13->_bundleSubscriptionManager, a5);
    v14 = objc_alloc_init(FCAsyncSerialQueue);
    serialQueue = v13->_serialQueue;
    v13->_serialQueue = v14;

    NFGeneralDeviceString();
    v16 = objc_claimAutoreleasedReturnValue();
    deviceType = v13->_deviceType;
    v13->_deviceType = (NSString *)v16;

    NFDeviceOSVersion();
    v18 = objc_claimAutoreleasedReturnValue();
    deviceOSVersion = v13->_deviceOSVersion;
    v13->_deviceOSVersion = (NSString *)v18;

    v20 = [FCFileCoordinatedNotificationDropbox alloc];
    FCURLForNotificationDropbox();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[FCFileCoordinatedNotificationDropbox initWithFileURL:](v20, "initWithFileURL:", v21);
    fileCoordinatedNotificationDropbox = v13->_fileCoordinatedNotificationDropbox;
    v13->_fileCoordinatedNotificationDropbox = (FCFileCoordinatedNotificationDropbox *)v22;

    objc_msgSend(v10, "addObserver:", v13);
    -[FCNotificationsEndpointConnection serialQueue](v13, "serialQueue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __111__FCNotificationsEndpointConnection_initWithEndpointConnection_configurationManager_bundleSubscriptionManager___block_invoke;
    v26[3] = &unk_1E463FC88;
    v27 = v10;
    v28 = v13;
    objc_msgSend(v24, "enqueueBlock:", v26);

  }
  return v13;
}

- (FCAsyncSerialQueue)serialQueue
{
  return self->_serialQueue;
}

- (FCNotificationsEndpointConnection)initWithBaseURLString:(id)a3
{
  id v4;
  FCNotificationsEndpointConnection *v5;
  FCEndpointConnection *v6;
  FCEndpointConnection *endpointConnection;
  uint64_t v8;
  NSString *deviceType;
  uint64_t v10;
  NSString *deviceOSVersion;
  FCAsyncSerialQueue *v12;
  FCAsyncSerialQueue *serialQueue;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FCNotificationsEndpointConnection;
  v5 = -[FCNotificationsEndpointConnection init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(FCEndpointConnection);
    endpointConnection = v5->_endpointConnection;
    v5->_endpointConnection = v6;

    NFGeneralDeviceString();
    v8 = objc_claimAutoreleasedReturnValue();
    deviceType = v5->_deviceType;
    v5->_deviceType = (NSString *)v8;

    NFDeviceOSVersion();
    v10 = objc_claimAutoreleasedReturnValue();
    deviceOSVersion = v5->_deviceOSVersion;
    v5->_deviceOSVersion = (NSString *)v10;

    v12 = objc_alloc_init(FCAsyncSerialQueue);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = v12;

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCNotificationsEndpointConnection setBaseURL:](v5, "setBaseURL:", v14);

  }
  return v5;
}

- (void)registerDeviceWithUserID:(id)a3 deviceToken:(id)a4 storefrontID:(id)a5 deviceDigestMode:(int)a6 callbackQueue:(id)a7 completion:(id)a8
{
  uint64_t v10;
  char *v14;
  char *v15;
  id v16;
  id v17;
  void (**v18)(id, uint64_t, _QWORD);
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  _QWORD v34[4];
  void (**v35)(id, uint64_t, _QWORD);
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v10 = *(_QWORD *)&a6;
  v44 = *MEMORY[0x1E0C80C00];
  v14 = (char *)a3;
  v15 = (char *)a4;
  v16 = a5;
  v17 = a7;
  v18 = (void (**)(id, uint64_t, _QWORD))a8;
  if (!v14 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "userID");
    *(_DWORD *)buf = 136315906;
    v37 = "-[FCNotificationsEndpointConnection registerDeviceWithUserID:deviceToken:storefrontID:deviceDigestMode:callbac"
          "kQueue:completion:]";
    v38 = 2080;
    v39 = "FCNotificationsEndpointConnection.m";
    v40 = 1024;
    v41 = 113;
    v42 = 2114;
    v43 = v30;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v15)
      goto LABEL_6;
  }
  else if (v15)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "deviceToken");
    *(_DWORD *)buf = 136315906;
    v37 = "-[FCNotificationsEndpointConnection registerDeviceWithUserID:deviceToken:storefrontID:deviceDigestMode:callbac"
          "kQueue:completion:]";
    v38 = 2080;
    v39 = "FCNotificationsEndpointConnection.m";
    v40 = 1024;
    v41 = 114;
    v42 = 2114;
    v43 = v31;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (v16)
  {
    if (v14 && v15)
    {
      -[FCNotificationsEndpointConnection _notificationDataInDropbox](self, "_notificationDataInDropbox");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "deviceToken");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isEqualToString:", v20))
      {
        objc_msgSend(v19, "notificationUserID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "isEqualToString:", v21) & 1) != 0)
        {
          v33 = objc_msgSend(v19, "deviceDigestMode");

          if (v33 == (_DWORD)v10)
          {
            v22 = FCPushNotificationsLog;
            if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412802;
              v37 = v15;
              v38 = 2112;
              v39 = v14;
              v40 = 1024;
              v41 = v10;
              _os_log_impl(&dword_1A1B90000, v22, OS_LOG_TYPE_INFO, "the device token is already registered: %@ for userID: %@ and the digestMode: %d hasn't changed", buf, 0x1Cu);
            }
            if (v18)
              v18[2](v18, 1, 0);
            goto LABEL_24;
          }
LABEL_23:
          -[FCNotificationsEndpointConnection _pushNotifySubscriptionRequestWithChannelIDs:paidChannelIDs:userID:deviceToken:storefrontID:deviceDigestMode:](self, "_pushNotifySubscriptionRequestWithChannelIDs:paidChannelIDs:userID:deviceToken:storefrontID:deviceDigestMode:", 0, 0, v14, v15, v16, v10);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v34[0] = MEMORY[0x1E0C809B0];
          v34[1] = 3221225472;
          v34[2] = __129__FCNotificationsEndpointConnection_registerDeviceWithUserID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke;
          v34[3] = &unk_1E46460D0;
          v35 = v18;
          -[FCNotificationsEndpointConnection _sendNotificationsSubscriptionRequest:pathComponent:callbackQueue:completion:](self, "_sendNotificationsSubscriptionRequest:pathComponent:callbackQueue:completion:", v24, CFSTR("pushnotify/subscribe"), v17, v34);
          -[FCNotificationsEndpointConnection baseURL](self, "baseURL");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "absoluteString");
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = v10;
          v28 = v17;
          v29 = (void *)v26;
          -[FCNotificationsEndpointConnection _updateNotificationDropboxDataWithBaseURL:notificationUserID:deviceToken:storefrontID:deviceDigestMode:](self, "_updateNotificationDropboxDataWithBaseURL:notificationUserID:deviceToken:storefrontID:deviceDigestMode:", v26, v14, v15, v16, v27);

          v17 = v28;
LABEL_24:

          goto LABEL_25;
        }

      }
      goto LABEL_23;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "storefrontID");
    *(_DWORD *)buf = 136315906;
    v37 = "-[FCNotificationsEndpointConnection registerDeviceWithUserID:deviceToken:storefrontID:deviceDigestMode:callbac"
          "kQueue:completion:]";
    v38 = 2080;
    v39 = "FCNotificationsEndpointConnection.m";
    v40 = 1024;
    v41 = 115;
    v42 = 2114;
    v43 = v32;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v23 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A1B90000, v23, OS_LOG_TYPE_ERROR, "failed to submit request for register device token, invalid parameters", buf, 2u);
  }
  v18[2](v18, 0, 0);
LABEL_25:

}

void __129__FCNotificationsEndpointConnection_registerDeviceWithUserID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      v8 = 138543362;
      v9 = v5;
      _os_log_error_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_ERROR, "failed to register device token with error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

- (void)unregisterDeviceWithUserID:(id)a3 deviceToken:(id)a4 storefrontID:(id)a5 deviceDigestMode:(int)a6 callbackQueue:(id)a7 completion:(id)a8
{
  uint64_t v10;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v10 = *(_QWORD *)&a6;
  v34 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  if (!v14 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "userID");
    *(_DWORD *)buf = 136315906;
    v27 = "-[FCNotificationsEndpointConnection unregisterDeviceWithUserID:deviceToken:storefrontID:deviceDigestMode:callb"
          "ackQueue:completion:]";
    v28 = 2080;
    v29 = "FCNotificationsEndpointConnection.m";
    v30 = 1024;
    v31 = 169;
    v32 = 2114;
    v33 = v21;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v15)
      goto LABEL_6;
  }
  else if (v15)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "deviceToken");
    *(_DWORD *)buf = 136315906;
    v27 = "-[FCNotificationsEndpointConnection unregisterDeviceWithUserID:deviceToken:storefrontID:deviceDigestMode:callb"
          "ackQueue:completion:]";
    v28 = 2080;
    v29 = "FCNotificationsEndpointConnection.m";
    v30 = 1024;
    v31 = 170;
    v32 = 2114;
    v33 = v22;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (v16)
  {
    if (v14 && v15)
    {
      -[FCNotificationsEndpointConnection _pushNotifySubscriptionRequestWithChannelIDs:paidChannelIDs:userID:deviceToken:storefrontID:deviceDigestMode:](self, "_pushNotifySubscriptionRequestWithChannelIDs:paidChannelIDs:userID:deviceToken:storefrontID:deviceDigestMode:", 0, 0, v14, v15, v16, v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __131__FCNotificationsEndpointConnection_unregisterDeviceWithUserID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke;
      v24[3] = &unk_1E46460D0;
      v25 = v18;
      -[FCNotificationsEndpointConnection _sendNotificationsSubscriptionRequest:pathComponent:callbackQueue:completion:](self, "_sendNotificationsSubscriptionRequest:pathComponent:callbackQueue:completion:", v19, CFSTR("pushnotify/unsubscribe"), v17, v24);
      -[FCNotificationsEndpointConnection _updateNotificationDropboxDataWithBaseURL:notificationUserID:deviceToken:storefrontID:deviceDigestMode:](self, "_updateNotificationDropboxDataWithBaseURL:notificationUserID:deviceToken:storefrontID:deviceDigestMode:", 0, 0, 0, 0, 0);

      goto LABEL_15;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "storefrontID");
    *(_DWORD *)buf = 136315906;
    v27 = "-[FCNotificationsEndpointConnection unregisterDeviceWithUserID:deviceToken:storefrontID:deviceDigestMode:callb"
          "ackQueue:completion:]";
    v28 = 2080;
    v29 = "FCNotificationsEndpointConnection.m";
    v30 = 1024;
    v31 = 171;
    v32 = 2114;
    v33 = v23;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v20 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A1B90000, v20, OS_LOG_TYPE_ERROR, "failed to submit request to unregister device token, invalid parameters", buf, 2u);
  }
  (*((void (**)(id, _QWORD, _QWORD))v18 + 2))(v18, 0, 0);
LABEL_15:

}

void __131__FCNotificationsEndpointConnection_unregisterDeviceWithUserID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      v8 = 138543362;
      v9 = v5;
      _os_log_error_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_ERROR, "failed to unregister device token with error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

- (void)subscribeNotificationsForChannelIDs:(id)a3 paidChannelIDs:(id)a4 userID:(id)a5 deviceToken:(id)a6 storefrontID:(id)a7 deviceDigestMode:(int)a8 callbackQueue:(id)a9 completion:(id)a10
{
  uint64_t v10;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v10 = *(_QWORD *)&a8;
  v40 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a9;
  v22 = a10;
  if (objc_msgSend(v16, "count")
    || objc_msgSend(v17, "count")
    || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    if (v18)
      goto LABEL_7;
  }
  else
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("either channelIDs or paidChannelIDs should include some values"));
    *(_DWORD *)buf = 136315906;
    v33 = "-[FCNotificationsEndpointConnection subscribeNotificationsForChannelIDs:paidChannelIDs:userID:deviceToken:stor"
          "efrontID:deviceDigestMode:callbackQueue:completion:]";
    v34 = 2080;
    v35 = "FCNotificationsEndpointConnection.m";
    v36 = 1024;
    v37 = 217;
    v38 = 2114;
    v39 = v29;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v18)
      goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "userID");
    *(_DWORD *)buf = 136315906;
    v33 = "-[FCNotificationsEndpointConnection subscribeNotificationsForChannelIDs:paidChannelIDs:userID:deviceToken:stor"
          "efrontID:deviceDigestMode:callbackQueue:completion:]";
    v34 = 2080;
    v35 = "FCNotificationsEndpointConnection.m";
    v36 = 1024;
    v37 = 218;
    v38 = 2114;
    v39 = v26;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_7:
  if (!v19 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "deviceToken");
    *(_DWORD *)buf = 136315906;
    v33 = "-[FCNotificationsEndpointConnection subscribeNotificationsForChannelIDs:paidChannelIDs:userID:deviceToken:stor"
          "efrontID:deviceDigestMode:callbackQueue:completion:]";
    v34 = 2080;
    v35 = "FCNotificationsEndpointConnection.m";
    v36 = 1024;
    v37 = 219;
    v38 = 2114;
    v39 = v27;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v20)
      goto LABEL_12;
  }
  else if (v20)
  {
    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "storefrontID");
    *(_DWORD *)buf = 136315906;
    v33 = "-[FCNotificationsEndpointConnection subscribeNotificationsForChannelIDs:paidChannelIDs:userID:deviceToken:stor"
          "efrontID:deviceDigestMode:callbackQueue:completion:]";
    v34 = 2080;
    v35 = "FCNotificationsEndpointConnection.m";
    v36 = 1024;
    v37 = 220;
    v38 = 2114;
    v39 = v28;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_12:
  if (!objc_msgSend(v16, "count"))
  {
    v23 = objc_msgSend(v17, "count");
    if (!v18 || !v19 || !v20 || !v23)
      goto LABEL_22;
LABEL_21:
    -[FCNotificationsEndpointConnection _pushNotifySubscriptionRequestWithChannelIDs:paidChannelIDs:userID:deviceToken:storefrontID:deviceDigestMode:](self, "_pushNotifySubscriptionRequestWithChannelIDs:paidChannelIDs:userID:deviceToken:storefrontID:deviceDigestMode:", v16, v17, v18, v19, v20, v10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __162__FCNotificationsEndpointConnection_subscribeNotificationsForChannelIDs_paidChannelIDs_userID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke;
    v30[3] = &unk_1E46460D0;
    v31 = v22;
    -[FCNotificationsEndpointConnection _sendNotificationsSubscriptionRequest:pathComponent:callbackQueue:completion:](self, "_sendNotificationsSubscriptionRequest:pathComponent:callbackQueue:completion:", v24, CFSTR("pushnotify/subscribe"), v21, v30);

    goto LABEL_25;
  }
  if (v18 && v19 && v20)
    goto LABEL_21;
LABEL_22:
  v25 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A1B90000, v25, OS_LOG_TYPE_ERROR, "failed to submit request for subscribe notifications, invalid parameters", buf, 2u);
  }
  (*((void (**)(id, _QWORD, _QWORD))v22 + 2))(v22, 0, 0);
LABEL_25:

}

void __162__FCNotificationsEndpointConnection_subscribeNotificationsForChannelIDs_paidChannelIDs_userID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      v8 = 138543362;
      v9 = v5;
      _os_log_error_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_ERROR, "failed to subscribe notifications for channels error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

- (void)unsubscribeNotificationsForChannelIDs:(id)a3 userID:(id)a4 deviceToken:(id)a5 storefrontID:(id)a6 deviceDigestMode:(int)a7 callbackQueue:(id)a8 completion:(id)a9
{
  uint64_t v10;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v10 = *(_QWORD *)&a7;
  v38 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = a9;
  if (!objc_msgSend(v15, "count") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("channelIDs should not be empty"));
    *(_DWORD *)buf = 136315906;
    v31 = "-[FCNotificationsEndpointConnection unsubscribeNotificationsForChannelIDs:userID:deviceToken:storefrontID:devi"
          "ceDigestMode:callbackQueue:completion:]";
    v32 = 2080;
    v33 = "FCNotificationsEndpointConnection.m";
    v34 = 1024;
    v35 = 256;
    v36 = 2114;
    v37 = v24;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v16)
      goto LABEL_6;
  }
  else if (v16)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "userID");
    *(_DWORD *)buf = 136315906;
    v31 = "-[FCNotificationsEndpointConnection unsubscribeNotificationsForChannelIDs:userID:deviceToken:storefrontID:devi"
          "ceDigestMode:callbackQueue:completion:]";
    v32 = 2080;
    v33 = "FCNotificationsEndpointConnection.m";
    v34 = 1024;
    v35 = 257;
    v36 = 2114;
    v37 = v25;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (!v17 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "deviceToken");
    *(_DWORD *)buf = 136315906;
    v31 = "-[FCNotificationsEndpointConnection unsubscribeNotificationsForChannelIDs:userID:deviceToken:storefrontID:devi"
          "ceDigestMode:callbackQueue:completion:]";
    v32 = 2080;
    v33 = "FCNotificationsEndpointConnection.m";
    v34 = 1024;
    v35 = 258;
    v36 = 2114;
    v37 = v26;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v18)
      goto LABEL_11;
  }
  else if (v18)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "storefrontID");
    *(_DWORD *)buf = 136315906;
    v31 = "-[FCNotificationsEndpointConnection unsubscribeNotificationsForChannelIDs:userID:deviceToken:storefrontID:devi"
          "ceDigestMode:callbackQueue:completion:]";
    v32 = 2080;
    v33 = "FCNotificationsEndpointConnection.m";
    v34 = 1024;
    v35 = 259;
    v36 = 2114;
    v37 = v27;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_11:
  v21 = objc_msgSend(v15, "count");
  if (v18 && v17 && v16 && v21)
  {
    -[FCNotificationsEndpointConnection _pushNotifySubscriptionRequestWithChannelIDs:paidChannelIDs:userID:deviceToken:storefrontID:deviceDigestMode:](self, "_pushNotifySubscriptionRequestWithChannelIDs:paidChannelIDs:userID:deviceToken:storefrontID:deviceDigestMode:", v15, 0, v16, v17, v18, v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __149__FCNotificationsEndpointConnection_unsubscribeNotificationsForChannelIDs_userID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke;
    v28[3] = &unk_1E46460D0;
    v29 = v20;
    -[FCNotificationsEndpointConnection _sendNotificationsSubscriptionRequest:pathComponent:callbackQueue:completion:](self, "_sendNotificationsSubscriptionRequest:pathComponent:callbackQueue:completion:", v22, CFSTR("pushnotify/unsubscribe"), v19, v28);

  }
  else
  {
    v23 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A1B90000, v23, OS_LOG_TYPE_ERROR, "failed to submit request for unsubscribe notifications, invalid parameters", buf, 2u);
    }
    (*((void (**)(id, _QWORD, _QWORD))v20 + 2))(v20, 0, 0);
  }

}

void __149__FCNotificationsEndpointConnection_unsubscribeNotificationsForChannelIDs_userID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      v8 = 138543362;
      v9 = v5;
      _os_log_error_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_ERROR, "failed to unsubscribe notifications for channels with error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

- (void)refreshNotificationsForChannelIDs:(id)a3 paidChannelIDs:(id)a4 userID:(id)a5 deviceToken:(id)a6 storefrontID:(id)a7 deviceDigestMode:(int)a8 callbackQueue:(id)a9 completion:(id)a10
{
  uint64_t v10;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v10 = *(_QWORD *)&a8;
  v38 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a9;
  v22 = a10;
  if (!v18 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "userID");
    *(_DWORD *)buf = 136315906;
    v31 = "-[FCNotificationsEndpointConnection refreshNotificationsForChannelIDs:paidChannelIDs:userID:deviceToken:storef"
          "rontID:deviceDigestMode:callbackQueue:completion:]";
    v32 = 2080;
    v33 = "FCNotificationsEndpointConnection.m";
    v34 = 1024;
    v35 = 296;
    v36 = 2114;
    v37 = v25;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v19)
      goto LABEL_6;
  }
  else if (v19)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "deviceToken");
    *(_DWORD *)buf = 136315906;
    v31 = "-[FCNotificationsEndpointConnection refreshNotificationsForChannelIDs:paidChannelIDs:userID:deviceToken:storef"
          "rontID:deviceDigestMode:callbackQueue:completion:]";
    v32 = 2080;
    v33 = "FCNotificationsEndpointConnection.m";
    v34 = 1024;
    v35 = 297;
    v36 = 2114;
    v37 = v26;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (v20)
  {
    if (v18 && v19)
    {
      -[FCNotificationsEndpointConnection _pushNotifySubscriptionRequestWithChannelIDs:paidChannelIDs:userID:deviceToken:storefrontID:deviceDigestMode:](self, "_pushNotifySubscriptionRequestWithChannelIDs:paidChannelIDs:userID:deviceToken:storefrontID:deviceDigestMode:", v16, v17, v18, v19, v20, v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __160__FCNotificationsEndpointConnection_refreshNotificationsForChannelIDs_paidChannelIDs_userID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke;
      v28[3] = &unk_1E46460D0;
      v29 = v22;
      -[FCNotificationsEndpointConnection _sendNotificationsSubscriptionRequest:pathComponent:callbackQueue:completion:](self, "_sendNotificationsSubscriptionRequest:pathComponent:callbackQueue:completion:", v23, CFSTR("pushnotify/updatetoken"), v21, v28);

      goto LABEL_15;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "storefrontID");
    *(_DWORD *)buf = 136315906;
    v31 = "-[FCNotificationsEndpointConnection refreshNotificationsForChannelIDs:paidChannelIDs:userID:deviceToken:storef"
          "rontID:deviceDigestMode:callbackQueue:completion:]";
    v32 = 2080;
    v33 = "FCNotificationsEndpointConnection.m";
    v34 = 1024;
    v35 = 298;
    v36 = 2114;
    v37 = v27;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v24 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A1B90000, v24, OS_LOG_TYPE_ERROR, "failed to submit refresh request for subscribe notifications, invalid parameters", buf, 2u);
  }
  (*((void (**)(id, _QWORD, _QWORD))v22 + 2))(v22, 0, 0);
LABEL_15:

}

void __160__FCNotificationsEndpointConnection_refreshNotificationsForChannelIDs_paidChannelIDs_userID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      v8 = 138543362;
      v9 = v5;
      _os_log_error_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_ERROR, "failed to refresh notifications for channels with error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

- (void)subscribeNotificationsForTopicIDs:(id)a3 withTopicGroupingID:(id)a4 fromChannelID:(id)a5 userID:(id)a6 deviceToken:(id)a7 storefrontID:(id)a8 deviceDigestMode:(int)a9 callbackQueue:(id)a10 completion:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a10;
  v24 = a11;
  if (!objc_msgSend(v17, "count") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("topicIDs should include some values"));
    *(_DWORD *)buf = 136315906;
    v37 = "-[FCNotificationsEndpointConnection subscribeNotificationsForTopicIDs:withTopicGroupingID:fromChannelID:userID"
          ":deviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:]";
    v38 = 2080;
    v39 = "FCNotificationsEndpointConnection.m";
    v40 = 1024;
    v41 = 337;
    v42 = 2114;
    v43 = v28;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v19)
      goto LABEL_6;
  }
  else if (v19)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "channelID");
    *(_DWORD *)buf = 136315906;
    v37 = "-[FCNotificationsEndpointConnection subscribeNotificationsForTopicIDs:withTopicGroupingID:fromChannelID:userID"
          ":deviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:]";
    v38 = 2080;
    v39 = "FCNotificationsEndpointConnection.m";
    v40 = 1024;
    v41 = 338;
    v42 = 2114;
    v43 = v29;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (!v20 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "userID");
    *(_DWORD *)buf = 136315906;
    v37 = "-[FCNotificationsEndpointConnection subscribeNotificationsForTopicIDs:withTopicGroupingID:fromChannelID:userID"
          ":deviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:]";
    v38 = 2080;
    v39 = "FCNotificationsEndpointConnection.m";
    v40 = 1024;
    v41 = 339;
    v42 = 2114;
    v43 = v30;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v21)
      goto LABEL_11;
  }
  else if (v21)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "deviceToken");
    *(_DWORD *)buf = 136315906;
    v37 = "-[FCNotificationsEndpointConnection subscribeNotificationsForTopicIDs:withTopicGroupingID:fromChannelID:userID"
          ":deviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:]";
    v38 = 2080;
    v39 = "FCNotificationsEndpointConnection.m";
    v40 = 1024;
    v41 = 340;
    v42 = 2114;
    v43 = v31;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_11:
  if (!v22 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "storefrontID");
    *(_DWORD *)buf = 136315906;
    v37 = "-[FCNotificationsEndpointConnection subscribeNotificationsForTopicIDs:withTopicGroupingID:fromChannelID:userID"
          ":deviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:]";
    v38 = 2080;
    v39 = "FCNotificationsEndpointConnection.m";
    v40 = 1024;
    v41 = 341;
    v42 = 2114;
    v43 = v32;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v25 = objc_msgSend(v17, "count");
  if (v22 && v21 && v20 && v19 && v25)
  {
    LODWORD(v33) = a9;
    -[FCNotificationsEndpointConnection _pushNotifySubscriptionRequestWithTopicIDs:fromChannelID:withTopicGroupingID:userID:deviceToken:storefrontID:deviceDigestMode:](self, "_pushNotifySubscriptionRequestWithTopicIDs:fromChannelID:withTopicGroupingID:userID:deviceToken:storefrontID:deviceDigestMode:", v17, v19, v18, v20, v21, v22, v33);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __179__FCNotificationsEndpointConnection_subscribeNotificationsForTopicIDs_withTopicGroupingID_fromChannelID_userID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke;
    v34[3] = &unk_1E46460D0;
    v35 = v24;
    -[FCNotificationsEndpointConnection _sendNotificationsSubscriptionRequest:pathComponent:callbackQueue:completion:](self, "_sendNotificationsSubscriptionRequest:pathComponent:callbackQueue:completion:", v26, CFSTR("pushnotify/subscribe"), v23, v34);

  }
  else
  {
    v27 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A1B90000, v27, OS_LOG_TYPE_ERROR, "failed to submit request for subscribe notifications, invalid parameters", buf, 2u);
    }
    (*((void (**)(id, _QWORD, _QWORD))v24 + 2))(v24, 0, 0);
  }

}

void __179__FCNotificationsEndpointConnection_subscribeNotificationsForTopicIDs_withTopicGroupingID_fromChannelID_userID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      v8 = 138543362;
      v9 = v5;
      _os_log_error_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_ERROR, "failed to subscribe notifications for topic error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

- (void)unsubscribeNotificationsForTopicIDs:(id)a3 withTopicGroupingID:(id)a4 fromChannelID:(id)a5 userID:(id)a6 deviceToken:(id)a7 storefrontID:(id)a8 deviceDigestMode:(int)a9 callbackQueue:(id)a10 completion:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a10;
  v24 = a11;
  if (!v19 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "channelID");
    *(_DWORD *)buf = 136315906;
    v35 = "-[FCNotificationsEndpointConnection unsubscribeNotificationsForTopicIDs:withTopicGroupingID:fromChannelID:user"
          "ID:deviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:]";
    v36 = 2080;
    v37 = "FCNotificationsEndpointConnection.m";
    v38 = 1024;
    v39 = 380;
    v40 = 2114;
    v41 = v26;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v20)
      goto LABEL_6;
  }
  else if (v20)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "userID");
    *(_DWORD *)buf = 136315906;
    v35 = "-[FCNotificationsEndpointConnection unsubscribeNotificationsForTopicIDs:withTopicGroupingID:fromChannelID:user"
          "ID:deviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:]";
    v36 = 2080;
    v37 = "FCNotificationsEndpointConnection.m";
    v38 = 1024;
    v39 = 381;
    v40 = 2114;
    v41 = v27;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (!v21 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "deviceToken");
    *(_DWORD *)buf = 136315906;
    v35 = "-[FCNotificationsEndpointConnection unsubscribeNotificationsForTopicIDs:withTopicGroupingID:fromChannelID:user"
          "ID:deviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:]";
    v36 = 2080;
    v37 = "FCNotificationsEndpointConnection.m";
    v38 = 1024;
    v39 = 382;
    v40 = 2114;
    v41 = v28;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v22)
      goto LABEL_9;
LABEL_16:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "storefrontID");
      *(_DWORD *)buf = 136315906;
      v35 = "-[FCNotificationsEndpointConnection unsubscribeNotificationsForTopicIDs:withTopicGroupingID:fromChannelID:us"
            "erID:deviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:]";
      v36 = 2080;
      v37 = "FCNotificationsEndpointConnection.m";
      v38 = 1024;
      v39 = 383;
      v40 = 2114;
      v41 = v30;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    goto LABEL_18;
  }
  if (!v22)
    goto LABEL_16;
LABEL_9:
  if (v19 && v20 && v21)
  {
    LODWORD(v31) = a9;
    -[FCNotificationsEndpointConnection _pushNotifySubscriptionRequestWithTopicIDs:fromChannelID:withTopicGroupingID:userID:deviceToken:storefrontID:deviceDigestMode:](self, "_pushNotifySubscriptionRequestWithTopicIDs:fromChannelID:withTopicGroupingID:userID:deviceToken:storefrontID:deviceDigestMode:", v17, v19, v18, v20, v21, v22, v31);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __181__FCNotificationsEndpointConnection_unsubscribeNotificationsForTopicIDs_withTopicGroupingID_fromChannelID_userID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke;
    v32[3] = &unk_1E46460D0;
    v33 = v24;
    -[FCNotificationsEndpointConnection _sendNotificationsSubscriptionRequest:pathComponent:callbackQueue:completion:](self, "_sendNotificationsSubscriptionRequest:pathComponent:callbackQueue:completion:", v25, CFSTR("pushnotify/unsubscribe"), v23, v32);

    goto LABEL_21;
  }
LABEL_18:
  v29 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A1B90000, v29, OS_LOG_TYPE_ERROR, "failed to submit request for unsubscribe notifications, invalid parameters", buf, 2u);
  }
  (*((void (**)(id, _QWORD, _QWORD))v24 + 2))(v24, 0, 0);
LABEL_21:

}

void __181__FCNotificationsEndpointConnection_unsubscribeNotificationsForTopicIDs_withTopicGroupingID_fromChannelID_userID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      v8 = 138543362;
      v9 = v5;
      _os_log_error_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_ERROR, "failed to unsubscribe notifications for topic error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

- (void)refreshNotificationsForTopicIDs:(id)a3 withTopicGroupingID:(id)a4 fromChannelID:(id)a5 userID:(id)a6 deviceToken:(id)a7 storefrontID:(id)a8 deviceDigestMode:(int)a9 callbackQueue:(id)a10 completion:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a10;
  v24 = a11;
  if (!v20 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "userID");
    *(_DWORD *)buf = 136315906;
    v34 = "-[FCNotificationsEndpointConnection refreshNotificationsForTopicIDs:withTopicGroupingID:fromChannelID:userID:d"
          "eviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:]";
    v35 = 2080;
    v36 = "FCNotificationsEndpointConnection.m";
    v37 = 1024;
    v38 = 424;
    v39 = 2114;
    v40 = v27;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v21)
      goto LABEL_6;
  }
  else if (v21)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "deviceToken");
    *(_DWORD *)buf = 136315906;
    v34 = "-[FCNotificationsEndpointConnection refreshNotificationsForTopicIDs:withTopicGroupingID:fromChannelID:userID:d"
          "eviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:]";
    v35 = 2080;
    v36 = "FCNotificationsEndpointConnection.m";
    v37 = 1024;
    v38 = 425;
    v39 = 2114;
    v40 = v28;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (v22)
  {
    if (v20 && v21)
    {
      LODWORD(v30) = a9;
      -[FCNotificationsEndpointConnection _pushNotifySubscriptionRequestWithTopicIDs:fromChannelID:withTopicGroupingID:userID:deviceToken:storefrontID:deviceDigestMode:](self, "_pushNotifySubscriptionRequestWithTopicIDs:fromChannelID:withTopicGroupingID:userID:deviceToken:storefrontID:deviceDigestMode:", v17, v19, v18, v20, v21, v22, v30);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __177__FCNotificationsEndpointConnection_refreshNotificationsForTopicIDs_withTopicGroupingID_fromChannelID_userID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke;
      v31[3] = &unk_1E46460D0;
      v32 = v24;
      -[FCNotificationsEndpointConnection _sendNotificationsSubscriptionRequest:pathComponent:callbackQueue:completion:](self, "_sendNotificationsSubscriptionRequest:pathComponent:callbackQueue:completion:", v25, CFSTR("pushnotify/updatetoken"), v23, v31);

      goto LABEL_15;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "storefrontID");
    *(_DWORD *)buf = 136315906;
    v34 = "-[FCNotificationsEndpointConnection refreshNotificationsForTopicIDs:withTopicGroupingID:fromChannelID:userID:d"
          "eviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:]";
    v35 = 2080;
    v36 = "FCNotificationsEndpointConnection.m";
    v37 = 1024;
    v38 = 426;
    v39 = 2114;
    v40 = v29;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v26 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A1B90000, v26, OS_LOG_TYPE_ERROR, "failed to submit refresh request for subscribe notifications, invalid parameters", buf, 2u);
  }
  (*((void (**)(id, _QWORD, _QWORD))v24 + 2))(v24, 0, 0);
LABEL_15:

}

void __177__FCNotificationsEndpointConnection_refreshNotificationsForTopicIDs_withTopicGroupingID_fromChannelID_userID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      v8 = 138543362;
      v9 = v5;
      _os_log_error_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_ERROR, "failed to refresh notifications for topics with error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

- (void)modifyMarketingSubscriptionWithType:(int)a3 action:(int)a4 dsid:(id)a5 callbackQueue:(id)a6 completion:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v9 = *(_QWORD *)&a4;
  v10 = *(_QWORD *)&a3;
  v12 = a6;
  v13 = a7;
  -[FCNotificationsEndpointConnection _marketingSubscriptionRequestWithType:action:dsid:](self, "_marketingSubscriptionRequestWithType:action:dsid:", v10, v9, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNotificationsEndpointConnection serialQueue](self, "serialQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __110__FCNotificationsEndpointConnection_modifyMarketingSubscriptionWithType_action_dsid_callbackQueue_completion___block_invoke;
  v19[3] = &unk_1E46460F8;
  v19[4] = self;
  v20 = v14;
  v21 = v12;
  v22 = v13;
  v16 = v13;
  v17 = v12;
  v18 = v14;
  objc_msgSend(v15, "enqueueBlock:", v19);

}

void __110__FCNotificationsEndpointConnection_modifyMarketingSubscriptionWithType_action_dsid_callbackQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  id v13;
  double v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  void (**v19)(_QWORD);
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "baseURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "baseURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("marketingNotification/subscription"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v22 = v6;
      v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_INFO, "ModifyMarketingSubscription url: %@ request: %@", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "endpointConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0C92BC8];
    v12 = *(_QWORD *)(a1 + 48);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __110__FCNotificationsEndpointConnection_modifyMarketingSubscriptionWithType_action_dsid_callbackQueue_completion___block_invoke_27;
    v17[3] = &unk_1E463FC10;
    v18 = v6;
    v19 = v3;
    v20 = *(id *)(a1 + 56);
    v13 = v6;
    LODWORD(v14) = v11;
    objc_msgSend(v9, "performHTTPRequestWithURL:method:data:contentType:priority:requiresMescalSigning:callbackQueue:completion:", v13, CFSTR("POST"), v10, CFSTR("application/x-protobuf"), 1, v12, v14, v17);

  }
  else
  {
    v3[2](v3);
    v15 = *(_QWORD *)(a1 + 56);
    if (v15)
    {
      +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", -2000, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v16);

    }
  }

}

void __110__FCNotificationsEndpointConnection_modifyMarketingSubscriptionWithType_action_dsid_callbackQueue_completion___block_invoke_27(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_INFO))
  {
    v14 = 138412546;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_INFO, "ModifyMarketingSubscription response: %@ error: %@", (uint8_t *)&v14, 0x16u);
  }
  if (v8)
  {
    +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", objc_msgSend(v8, "statusCode"), a1[4]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(a1[5] + 16))();
    v12 = a1[6];
    if (v12)
      (*(void (**)(uint64_t, BOOL, void *))(v12 + 16))(v12, v11 == 0, v11);

  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
    v13 = a1[6];
    if (v13)
      (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v9);
  }

}

- (id)_marketingSubscriptionRequestWithType:(int)a3 action:(int)a4 dsid:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;

  v8 = (objc_class *)MEMORY[0x1E0D62730];
  v9 = a5;
  v10 = objc_alloc_init(v8);
  -[FCNotificationsEndpointConnection _deviceInfoWithDeviceToken:deviceDigestMode:](self, "_deviceInfoWithDeviceToken:deviceDigestMode:", 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDeviceInfo:", v11);
  objc_msgSend(v10, "setDsid:", v9);

  if (a4 == 2)
    v12 = 2;
  else
    v12 = a4 == 1;
  objc_msgSend(v10, "setSubscriptionAction:", v12);
  objc_msgSend(v10, "setSubscriptionType:", a3 != 0);

  return v10;
}

- (void)_sendNotificationsSubscriptionRequest:(id)a3 pathComponent:(id)a4 callbackQueue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "subscriptionRequest");
      *(_DWORD *)buf = 136315906;
      v22 = "-[FCNotificationsEndpointConnection _sendNotificationsSubscriptionRequest:pathComponent:callbackQueue:completion:]";
      v23 = 2080;
      v24 = "FCNotificationsEndpointConnection.m";
      v25 = 1024;
      v26 = 522;
      v27 = 2114;
      v28 = v15;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      if (!v13)
        goto LABEL_6;
    }
    else if (!v13)
    {
      goto LABEL_6;
    }
    (*((void (**)(id, _QWORD, _QWORD))v13 + 2))(v13, 0, 0);
    goto LABEL_6;
  }
  -[FCNotificationsEndpointConnection serialQueue](self, "serialQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __114__FCNotificationsEndpointConnection__sendNotificationsSubscriptionRequest_pathComponent_callbackQueue_completion___block_invoke;
  v16[3] = &unk_1E4646120;
  v16[4] = self;
  v17 = v11;
  v18 = v10;
  v19 = v12;
  v20 = v13;
  objc_msgSend(v14, "enqueueBlock:", v16);

LABEL_6:
}

void __114__FCNotificationsEndpointConnection__sendNotificationsSubscriptionRequest_pathComponent_callbackQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  id v13;
  double v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  void (**v19)(_QWORD);
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "baseURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "baseURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByAppendingPathComponent:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v22 = v6;
      v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_INFO, "PushNotify url: %@ request: %@", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "endpointConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0C92BC8];
    v12 = *(_QWORD *)(a1 + 56);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __114__FCNotificationsEndpointConnection__sendNotificationsSubscriptionRequest_pathComponent_callbackQueue_completion___block_invoke_31;
    v17[3] = &unk_1E463FC10;
    v18 = v6;
    v19 = v3;
    v20 = *(id *)(a1 + 64);
    v13 = v6;
    LODWORD(v14) = v11;
    objc_msgSend(v9, "performHTTPRequestWithURL:method:data:contentType:priority:requiresMescalSigning:callbackQueue:completion:", v13, CFSTR("POST"), v10, CFSTR("application/x-protobuf"), 1, v12, v14, v17);

  }
  else
  {
    v3[2](v3);
    v15 = *(_QWORD *)(a1 + 64);
    if (v15)
    {
      +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", -2000, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v16);

    }
  }

}

void __114__FCNotificationsEndpointConnection__sendNotificationsSubscriptionRequest_pathComponent_callbackQueue_completion___block_invoke_31(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_INFO))
  {
    v14 = 138412546;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_INFO, "PushNotify response: %@ error: %@", (uint8_t *)&v14, 0x16u);
  }
  if (v8)
  {
    +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", objc_msgSend(v8, "statusCode"), a1[4]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(a1[5] + 16))();
    v12 = a1[6];
    if (v12)
      (*(void (**)(uint64_t, BOOL, void *))(v12 + 16))(v12, v11 == 0, v11);

  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
    v13 = a1[6];
    if (v13)
      (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v9);
  }

}

- (id)_pushNotifySubscriptionRequestWithChannelIDs:(id)a3 paidChannelIDs:(id)a4 userID:(id)a5 deviceToken:(id)a6 storefrontID:(id)a7 deviceDigestMode:(int)a8
{
  uint64_t v8;
  id v14;
  id v15;
  objc_class *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v38[2];

  v8 = *(_QWORD *)&a8;
  v38[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = (objc_class *)MEMORY[0x1E0D627D0];
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = objc_alloc_init(v16);
  objc_msgSend(v20, "setNotificationUserId:", v19);

  objc_msgSend(v20, "setUserStorefrontId:", v17);
  -[FCNotificationsEndpointConnection _deviceInfoWithDeviceToken:deviceDigestMode:](self, "_deviceInfoWithDeviceToken:deviceDigestMode:", v18, v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setDeviceInfo:", v21);
  -[FCNotificationsEndpointConnection configurationManager](self, "configurationManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "configuration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "editorialChannelID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCNotificationsEndpointConnection bundleSubscriptionManager](self, "bundleSubscriptionManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    -[FCNotificationsEndpointConnection bundleSubscriptionManager](self, "bundleSubscriptionManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "cachedSubscription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "subscriptionState");

  }
  else
  {
    v28 = 3;
  }

  if (objc_msgSend(v14, "containsObject:", v24) && v28 <= 1)
  {
    objc_msgSend(v14, "fc_arrayByRemovingObject:", v24);
    v29 = objc_claimAutoreleasedReturnValue();

    v30 = (void *)MEMORY[0x1E0C99D20];
    v38[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "fc_arrayByAddingUniqueObjectsFromArray:toArray:", v31, v15);
    v32 = objc_claimAutoreleasedReturnValue();

    v15 = (id)v32;
    v14 = (id)v29;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    -[FCNotificationsEndpointConnection _notificationEntitiesWithChannelIDs:isPaid:paidBundleSubscriptionStatus:editorialChannelID:](self, "_notificationEntitiesWithChannelIDs:isPaid:paidBundleSubscriptionStatus:editorialChannelID:", v14, 0, v28, v24);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObjectsFromArray:", v34);

  }
  if (objc_msgSend(v15, "count"))
  {
    -[FCNotificationsEndpointConnection _notificationEntitiesWithChannelIDs:isPaid:paidBundleSubscriptionStatus:editorialChannelID:](self, "_notificationEntitiesWithChannelIDs:isPaid:paidBundleSubscriptionStatus:editorialChannelID:", v15, 1, v28, v24);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObjectsFromArray:", v35);

  }
  if (!objc_msgSend(v14, "count") && !objc_msgSend(v15, "count"))
  {
    -[FCNotificationsEndpointConnection _notificationEntitiesWithChannelIDs:isPaid:paidBundleSubscriptionStatus:editorialChannelID:](self, "_notificationEntitiesWithChannelIDs:isPaid:paidBundleSubscriptionStatus:editorialChannelID:", 0, 0, v28, v24);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObjectsFromArray:", v36);

  }
  objc_msgSend(v20, "setNotificationEntitys:", v33);

  return v20;
}

- (id)_pushNotifySubscriptionRequestWithTopicIDs:(id)a3 fromChannelID:(id)a4 withTopicGroupingID:(id)a5 userID:(id)a6 deviceToken:(id)a7 storefrontID:(id)a8 deviceDigestMode:(int)a9
{
  objc_class *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v36;
  id v37;
  id v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v15 = (objc_class *)MEMORY[0x1E0D627D0];
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v36 = a5;
  v19 = a4;
  v20 = a3;
  v21 = objc_alloc_init(v15);
  objc_msgSend(v21, "setNotificationUserId:", v18);

  objc_msgSend(v21, "setUserStorefrontId:", v16);
  -[FCNotificationsEndpointConnection _deviceInfoWithDeviceToken:deviceDigestMode:](self, "_deviceInfoWithDeviceToken:deviceDigestMode:", v17, a9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setDeviceInfo:", v22);
  -[FCNotificationsEndpointConnection bundleSubscriptionManager](self, "bundleSubscriptionManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    -[FCNotificationsEndpointConnection bundleSubscriptionManager](self, "bundleSubscriptionManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "cachedSubscription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "subscriptionState");

  }
  else
  {
    v26 = 3;
  }

  v38 = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNotificationsEndpointConnection _notificationEntityWithChannelIDs:isPaid:paidBundleSubscriptionStatus:notificationType:](self, "_notificationEntityWithChannelIDs:isPaid:paidBundleSubscriptionStatus:notificationType:", v27, 0, v26, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)objc_msgSend(v29, "mutableCopy");
  objc_msgSend(v21, "setNotificationEntitys:", v30);

  v31 = objc_alloc_init(MEMORY[0x1E0D62890]);
  objc_msgSend(v31, "setTopicGroupingId:", v36);

  v32 = (void *)objc_msgSend(v20, "mutableCopy");
  objc_msgSend(v31, "setTopicIds:", v32);

  v37 = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = (void *)objc_msgSend(v33, "mutableCopy");
  objc_msgSend(v21, "setTopicsFolloweds:", v34);

  return v21;
}

- (id)_deviceInfoWithDeviceToken:(id)a3 deviceDigestMode:(int)a4
{
  uint64_t v4;
  objc_class *v6;
  id v7;
  id v8;
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
  double v19;

  v4 = *(_QWORD *)&a4;
  v6 = (objc_class *)MEMORY[0x1E0D626A0];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "setDevicePushToken:", v7);

  -[FCNotificationsEndpointConnection deviceType](self, "deviceType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDeviceType:", v9);

  objc_msgSend(v8, "setDeviceTokenEnv:", 2);
  objc_msgSend(MEMORY[0x1E0C99DC8], "fc_preferredLanguageCodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v8, "setDevicePreferredLanguages:", v11);

  -[FCNotificationsEndpointConnection deviceOSVersion](self, "deviceOSVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDeviceOsVersion:", v12);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDeviceAppVersion:", v14);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDeviceAppBundleId:", v16);

  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "abbreviation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDeviceTimezone:", v18);

  objc_msgSend(v8, "setDeviceUtcOffset:", objc_msgSend(v17, "secondsFromGMT"));
  objc_msgSend(v17, "daylightSavingTimeOffset");
  objc_msgSend(v8, "setDeviceDstOffset:", (uint64_t)v19);
  objc_msgSend(v8, "setDeviceDigestMode:", v4);

  return v8;
}

- (id)_notificationEntitiesWithChannelIDs:(id)a3 isPaid:(BOOL)a4 paidBundleSubscriptionStatus:(unint64_t)a5 editorialChannelID:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v8 = a4;
  v17[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "containsObject:", v11))
  {
    v17[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCNotificationsEndpointConnection _notificationEntityWithChannelIDs:isPaid:paidBundleSubscriptionStatus:notificationType:](self, "_notificationEntityWithChannelIDs:isPaid:paidBundleSubscriptionStatus:notificationType:", v13, a5 < 2, a5, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "addObject:", v14);
  }
  -[FCNotificationsEndpointConnection _notificationEntityWithChannelIDs:isPaid:paidBundleSubscriptionStatus:notificationType:](self, "_notificationEntityWithChannelIDs:isPaid:paidBundleSubscriptionStatus:notificationType:", v10, v8, a5, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v15);

  return v12;
}

- (id)_notificationEntityWithChannelIDs:(id)a3 isPaid:(BOOL)a4 paidBundleSubscriptionStatus:(unint64_t)a5 notificationType:(int)a6
{
  uint64_t v6;
  _BOOL4 v8;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;

  v6 = *(_QWORD *)&a6;
  v8 = a4;
  v10 = (objc_class *)MEMORY[0x1E0D62750];
  v11 = a3;
  v12 = objc_alloc_init(v10);
  v13 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(v12, "setTagIds:", v13);
  if (v8)
    v14 = 2;
  else
    v14 = 1;
  objc_msgSend(v12, "setSubscriberType:", v14);
  objc_msgSend(v12, "setPaidBundleSubscriptionStatus:", -[FCNotificationsEndpointConnection _pbNotificationEntityPaidBundleSubscriptionStatusFromSubscriptionState:](self, "_pbNotificationEntityPaidBundleSubscriptionStatusFromSubscriptionState:", a5));
  objc_msgSend(v12, "setNotificationType:", v6);
  return v12;
}

- (int)_pbNotificationEntityPaidBundleSubscriptionStatusFromSubscriptionState:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return 1;
  else
    return dword_1A1E827CC[a3 - 1];
}

- (void)_updateNotificationDropboxDataWithBaseURL:(id)a3 notificationUserID:(id)a4 deviceToken:(id)a5 storefrontID:(id)a6 deviceDigestMode:(int)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  int v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  -[FCNotificationsEndpointConnection fileCoordinatedNotificationDropbox](self, "fileCoordinatedNotificationDropbox");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __140__FCNotificationsEndpointConnection__updateNotificationDropboxDataWithBaseURL_notificationUserID_deviceToken_storefrontID_deviceDigestMode___block_invoke;
  v21[3] = &unk_1E4646148;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v25 = v15;
  v26 = a7;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  objc_msgSend(v16, "depositWithAccessor:completion:", v21, 0);

}

void __140__FCNotificationsEndpointConnection__updateNotificationDropboxDataWithBaseURL_notificationUserID_deviceToken_storefrontID_deviceDigestMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setBaseURLString:", v3);
  objc_msgSend(v4, "setNotificationUserID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setDeviceToken:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setStorefrontID:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "setDeviceDigestMode:", *(unsigned int *)(a1 + 64));

}

- (id)_notificationDataInDropbox
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__48;
  v15 = __Block_byref_object_dispose__48;
  v16 = 0;
  v3 = dispatch_semaphore_create(0);
  -[FCNotificationsEndpointConnection fileCoordinatedNotificationDropbox](self, "fileCoordinatedNotificationDropbox");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__FCNotificationsEndpointConnection__notificationDataInDropbox__block_invoke;
  v8[3] = &unk_1E4646170;
  v10 = &v11;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "peekWithAccessor:", v8);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __63__FCNotificationsEndpointConnection__notificationDataInDropbox__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)configurationManager:(id)a3 configurationDidChange:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[FCNotificationsEndpointConnection serialQueue](self, "serialQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__FCNotificationsEndpointConnection_configurationManager_configurationDidChange___block_invoke;
  v8[3] = &unk_1E463FC88;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "enqueueBlock:", v8);

}

void __81__FCNotificationsEndpointConnection_configurationManager_configurationDidChange___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void (**v4)(void);

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "updateBaseURL:", v3);
  v4[2]();

}

- (FCEndpointConnection)endpointConnection
{
  return self->_endpointConnection;
}

- (void)setEndpointConnection:(id)a3
{
  objc_storeStrong((id *)&self->_endpointConnection, a3);
}

- (FCCoreConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_configurationManager, a3);
}

- (FCBundleSubscriptionManagerType)bundleSubscriptionManager
{
  return self->_bundleSubscriptionManager;
}

- (void)setBundleSubscriptionManager:(id)a3
{
  objc_storeStrong((id *)&self->_bundleSubscriptionManager, a3);
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)deviceOSVersion
{
  return self->_deviceOSVersion;
}

- (void)setDeviceOSVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (FCFileCoordinatedNotificationDropbox)fileCoordinatedNotificationDropbox
{
  return self->_fileCoordinatedNotificationDropbox;
}

- (void)setFileCoordinatedNotificationDropbox:(id)a3
{
  objc_storeStrong((id *)&self->_fileCoordinatedNotificationDropbox, a3);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_fileCoordinatedNotificationDropbox, 0);
  objc_storeStrong((id *)&self->_deviceOSVersion, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_bundleSubscriptionManager, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_endpointConnection, 0);
}

@end
