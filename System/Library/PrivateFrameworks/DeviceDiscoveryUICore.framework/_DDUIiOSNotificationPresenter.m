@implementation _DDUIiOSNotificationPresenter

- (_DDUIiOSNotificationPresenter)init
{
  void *v3;
  uint64_t v4;
  void *v5;
  _DDUIiOSNotificationPresenter *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEC7A0]), "initWithBundleIdentifier:", CFSTR("com.apple.UserNotifications.DeviceDiscoveryUIAgent"));
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D23170], "serviceWithDefaultShellEndpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_DDUIiOSNotificationPresenter initWithNotificationCenter:applicationRecordVendor:openApplicationService:](self, "initWithNotificationCenter:applicationRecordVendor:openApplicationService:", v3, v4, v5);

  return v6;
}

- (_DDUIiOSNotificationPresenter)initWithNotificationCenter:(id)a3 applicationRecordVendor:(id)a4 openApplicationService:(id)a5
{
  id v9;
  id v10;
  id v11;
  _DDUIiOSNotificationPresenter *v12;
  _DDUIiOSNotificationPresenter *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_DDUIiOSNotificationPresenter;
  v12 = -[_DDUIiOSNotificationPresenter init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_notificationCenter, a3);
    objc_storeStrong((id *)&v13->_applicationRecordVendor, a4);
    objc_storeStrong((id *)&v13->_openApplicationService, a5);
  }

  return v13;
}

- (void)_setupIfNeeded
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SFWirelessSettingsController *v21;
  SFWirelessSettingsController *wirelessSettingsController;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[2];
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  if (!-[_DDUIiOSNotificationPresenter setup](self, "setup"))
  {
    -[_DDUIiOSNotificationPresenter notificationCenter](self, "notificationCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDelegate:", self);

    -[_DDUIiOSNotificationPresenter notificationCenter](self, "notificationCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWantsNotificationResponsesDelivered");

    -[_DDUIiOSNotificationPresenter notificationCenter](self, "notificationCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestAuthorizationWithOptions:completionHandler:", 4, &__block_literal_global_2);

    DDUICoreLocalizedString(CFSTR("LAUNCH_APPLICTION"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    DDUICoreLocalizedString(CFSTR("LAUNCH_APP_STORE"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    DDUICoreLocalizedString(CFSTR("CONTINUITYCAMERA_ACCEPT"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    DDUICoreLocalizedString(CFSTR("CONTINUITYCAMERA_DECLINE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEC700], "actionWithIdentifier:title:options:", CFSTR("OPEN_APPLICATION"), v27, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CEC720];
    v30[0] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("LAUNCH_CATEGORY"), v9, MEMORY[0x1E0C9AA60], 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEC700], "actionWithIdentifier:title:options:", CFSTR("OPEN_APP_STORE"), v25, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CEC720];
    v29 = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C9AA60];
    objc_msgSend(v10, "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("APP_STORE_CATEGORY"), v11, MEMORY[0x1E0C9AA60], 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEC700], "actionWithIdentifier:title:options:", CFSTR("CONTINUITYCAPTURE_ACCEPT"), v6, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEC700], "actionWithIdentifier:title:options:", CFSTR("CONTINUITYCAPTURE_DECLINE"), v7, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CEC720];
    v28[0] = v14;
    v28[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("CONTINUITYCAPTURE_CATEGORY"), v17, v12, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[_DDUIiOSNotificationPresenter notificationCenter](self, "notificationCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v23, v13, v18, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setNotificationCategories:", v20);

    v21 = (SFWirelessSettingsController *)objc_alloc_init(MEMORY[0x1E0D97480]);
    wirelessSettingsController = self->_wirelessSettingsController;
    self->_wirelessSettingsController = v21;

    -[_DDUIiOSNotificationPresenter setSetup:](self, "setSetup:", 1);
  }
}

- (void)dismissNotificationWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  -[_DDUIiOSNotificationPresenter presentedNotification](self, "presentedNotification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_DDUIiOSNotificationPresenter presentedNotification](self, "presentedNotification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "notificationID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if (v8)
      -[_DDUIiOSNotificationPresenter _clearPresentedNotificationIfNeeded](self, "_clearPresentedNotificationIfNeeded");
  }

}

- (void)showNotificationForApplication:(id)a3 deviceName:(id)a4 identifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, uint64_t);
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  NSObject *v27;
  void *v28;
  _DDUIiOSPresentedNotification *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  NSObject *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, uint64_t))a6;
  -[_DDUIiOSNotificationPresenter applicationRecordVendor](self, "applicationRecordVendor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "applicationID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleRecordWithApplicationIdentifier:error:", v15, 0);
  v16 = objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = v16;
    objc_msgSend(v10, "serviceIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[_DDUIiOSNotificationPresenter _applicationSupportsServiceIdentifier:serviceIdentifier:](self, "_applicationSupportsServiceIdentifier:serviceIdentifier:", v17, v18);

    if (!v19)
    {
      -[_DDUIiOSNotificationPresenter _clearPresentedNotificationIfNeeded](self, "_clearPresentedNotificationIfNeeded");
      v13[2](v13, 4);

      goto LABEL_17;
    }
    v33 = v11;
    if (v17
      && (-[NSObject iTunesMetadata](v17, "iTunesMetadata"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v21 = objc_msgSend(v20, "storeItemIdentifier"),
          v22 = objc_msgSend(v10, "adamID"),
          v20,
          v21 == v22))
    {
      -[NSObject localizedName](v17, "localizedName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DDUIiOSNotificationPresenter _createConnectNotificationWithDeviceName:appName:](self, "_createConnectNotificationWithDeviceName:appName:", v11, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
    }
    else
    {
      v13[2](v13, 3);
      objc_msgSend(v10, "appName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DDUIiOSNotificationPresenter _createAppStoreNotification:](self, "_createAppStoreNotification:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 1;
    }

    _DDUICoreLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v38 = v10;
      v39 = 2112;
      v40 = v17;
      _os_log_impl(&dword_1C87B2000, v27, OS_LOG_TYPE_DEFAULT, "Posting app launch request notification {applicationInfo: %@, applicationRecord: %@}", buf, 0x16u);
    }

  }
  else
  {
    v33 = v11;
    v13[2](v13, 3);
    objc_msgSend(v10, "appName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DDUIiOSNotificationPresenter _createAppStoreNotification:](self, "_createAppStoreNotification:", v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    _DDUICoreLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v38 = v10;
      v39 = 2112;
      v40 = v16;
      _os_log_impl(&dword_1C87B2000, v17, OS_LOG_TYPE_DEFAULT, "Posting app not installed notification {applicationInfo: %@, bundleRecord: %@}", buf, 0x16u);
    }
    v25 = 1;
  }

  -[_DDUIiOSNotificationPresenter _setupIfNeeded](self, "_setupIfNeeded");
  -[_DDUIiOSNotificationPresenter _clearPresentedNotificationIfNeeded](self, "_clearPresentedNotificationIfNeeded");
  objc_msgSend(v12, "UUIDString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_alloc_init(_DDUIiOSPresentedNotification);
  -[_DDUIiOSPresentedNotification setApplicationInfo:](v29, "setApplicationInfo:", v10);
  -[_DDUIiOSPresentedNotification setNotificationID:](v29, "setNotificationID:", v28);
  if ((v25 & 1) == 0)
    -[_DDUIiOSPresentedNotification setCompletion:](v29, "setCompletion:", v13);
  objc_msgSend(MEMORY[0x1E0CEC740], "requestWithIdentifier:content:trigger:", v28, v24, 0, v33);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DDUIiOSNotificationPresenter notificationCenter](self, "notificationCenter");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __97___DDUIiOSNotificationPresenter_showNotificationForApplication_deviceName_identifier_completion___block_invoke;
  v35[3] = &unk_1E81B4790;
  v36 = v28;
  v32 = v28;
  objc_msgSend(v31, "addNotificationRequest:withCompletionHandler:", v30, v35);

  -[_DDUIiOSNotificationPresenter setPresentedNotification:](self, "setPresentedNotification:", v29);
  -[_DDUIiOSNotificationPresenter _configureNotificationTimeout](self, "_configureNotificationTimeout");

  v11 = v34;
LABEL_17:

}

- (void)showContinuityCameraConfirmation:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _DDUIiOSPresentedNotification *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[_DDUIiOSNotificationPresenter _setupIfNeeded](self, "_setupIfNeeded");
  -[_DDUIiOSNotificationPresenter _clearPresentedNotificationIfNeeded](self, "_clearPresentedNotificationIfNeeded");
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DDUIiOSNotificationPresenter _createContinuityCameraNotificationWithDeviceName:](self, "_createContinuityCameraNotificationWithDeviceName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(_DDUIiOSPresentedNotification);
  -[_DDUIiOSPresentedNotification setNotificationID:](v14, "setNotificationID:", v13);
  -[_DDUIiOSPresentedNotification setCompletion:](v14, "setCompletion:", v8);

  objc_msgSend(v10, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[_DDUIiOSPresentedNotification setRemoteDeviceIdentifier:](v14, "setRemoteDeviceIdentifier:", v15);
  objc_msgSend(MEMORY[0x1E0CEC740], "requestWithIdentifier:content:trigger:", v13, v12, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DDUIiOSNotificationPresenter notificationCenter](self, "notificationCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __88___DDUIiOSNotificationPresenter_showContinuityCameraConfirmation_identifier_completion___block_invoke;
  v19[3] = &unk_1E81B4790;
  v20 = v13;
  v18 = v13;
  objc_msgSend(v17, "addNotificationRequest:withCompletionHandler:", v16, v19);

  -[_DDUIiOSNotificationPresenter setPresentedNotification:](self, "setPresentedNotification:", v14);
  -[_DDUIiOSNotificationPresenter _configureNotificationTimeout](self, "_configureNotificationTimeout");

}

- (BOOL)_applicationSupportsServiceIdentifier:(id)a3 serviceIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  DDUIFetchInfoPlistFromRecord(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "advertisesByIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8 != 0;
}

- (void)_configureNotificationTimeout
{
  NSObject *v3;
  dispatch_source_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD handler[5];

  DDUICorePrimaryQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v3);
  -[_DDUIiOSNotificationPresenter setClearNotificationTimer:](self, "setClearNotificationTimer:", v4);

  -[_DDUIiOSNotificationPresenter clearNotificationTimer](self, "clearNotificationTimer");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0);

  -[_DDUIiOSNotificationPresenter clearNotificationTimer](self, "clearNotificationTimer");
  v7 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __62___DDUIiOSNotificationPresenter__configureNotificationTimeout__block_invoke;
  handler[3] = &unk_1E81B43C8;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);

  -[_DDUIiOSNotificationPresenter clearNotificationTimer](self, "clearNotificationTimer");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v8);

}

- (void)_clearNotificationTimeout
{
  void *v3;
  NSObject *v4;

  -[_DDUIiOSNotificationPresenter clearNotificationTimer](self, "clearNotificationTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_DDUIiOSNotificationPresenter clearNotificationTimer](self, "clearNotificationTimer");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

    -[_DDUIiOSNotificationPresenter setClearNotificationTimer:](self, "setClearNotificationTimer:", 0);
  }
}

- (void)_clearPresentedNotificationIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[_DDUIiOSNotificationPresenter presentedNotification](self, "presentedNotification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_DDUIiOSNotificationPresenter _clearNotificationTimeout](self, "_clearNotificationTimeout");
    -[_DDUIiOSNotificationPresenter notificationCenter](self, "notificationCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DDUIiOSNotificationPresenter presentedNotification](self, "presentedNotification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "notificationID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeDeliveredNotificationsWithIdentifiers:", v7);

    -[_DDUIiOSNotificationPresenter setPresentedNotification:](self, "setPresentedNotification:", 0);
  }
}

- (void)_handleContinuityCameraDisabledAlertResponseWithState:(int64_t)a3
{
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;

  v3 = CFSTR("prefs:root=General");
  if (a3 == 1)
    v3 = CFSTR("prefs:root=General&path=CONTINUITY_SPEC");
  if (a3)
    v4 = v3;
  else
    v4 = CFSTR("prefs:root=WIFI");
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create("RPOpenURL", 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87___DDUIiOSNotificationPresenter__handleContinuityCameraDisabledAlertResponseWithState___block_invoke;
  block[3] = &unk_1E81B43C8;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

- (void)_showContinuityCameraDisabledAlertWithState:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  DDUICorePrimaryQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77___DDUIiOSNotificationPresenter__showContinuityCameraDisabledAlertWithState___block_invoke;
  v6[3] = &unk_1E81B4938;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (id)_createConnectNotificationWithDeviceName:(id)a3 appName:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (objc_class *)MEMORY[0x1E0CEC6E0];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setTitle:", v7);

  DDUICoreLocalizedString(CFSTR("CONNECT_IPHONE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v9, v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setBody:", v10);
  objc_msgSend(MEMORY[0x1E0CEC738], "iconForSystemImageNamed:", CFSTR("appletv.fill"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIcon:", v11);
  objc_msgSend(v8, "setCategoryIdentifier:", CFSTR("LAUNCH_CATEGORY"));
  objc_msgSend(v8, "setShouldIgnoreDoNotDisturb:", 1);
  objc_msgSend(v8, "setShouldBackgroundDefaultAction:", 1);
  objc_msgSend(v8, "setShouldAuthenticateDefaultAction:", 1);

  return v8;
}

- (id)_createAppStoreNotification:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0CEC6E0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  DDUICoreLocalizedString(CFSTR("APP_STORE_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  DDUICoreLocalizedString(CFSTR("APP_STORE_BODY"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v7, v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setBody:", v8);
  objc_msgSend(MEMORY[0x1E0CEC738], "iconForSystemImageNamed:", CFSTR("appletv.fill"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIcon:", v9);
  objc_msgSend(v5, "setCategoryIdentifier:", CFSTR("APP_STORE_CATEGORY"));
  objc_msgSend(v5, "setShouldIgnoreDoNotDisturb:", 1);
  objc_msgSend(v5, "setShouldBackgroundDefaultAction:", 1);
  objc_msgSend(v5, "setShouldAuthenticateDefaultAction:", 1);

  return v5;
}

- (id)_createContinuityCameraNotificationWithDeviceName:(id)a3
{
  id v3;
  id v4;
  void *v5;
  int DeviceClass;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CEC6E0]);
  DDUICoreLocalizedString(CFSTR("CONTINUITYCAMERA_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  DeviceClass = GestaltGetDeviceClass();
  if (DeviceClass == 3)
  {
    v7 = CFSTR("CONNECT_CONTINUITYCAMERA_IPAD");
  }
  else
  {
    if (DeviceClass != 1)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v7 = CFSTR("CONNECT_CONTINUITYCAMERA_IPHONE");
  }
  DDUICoreLocalizedString(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v8, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBody:", v9);

  objc_msgSend(MEMORY[0x1E0CEC738], "iconForSystemImageNamed:", CFSTR("rectangle.inset.filled.and.camera"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIcon:", v10);
  objc_msgSend(MEMORY[0x1E0CEC760], "defaultSound");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSound:", v11);

  objc_msgSend(v4, "setCategoryIdentifier:", CFSTR("CONTINUITYCAPTURE_CATEGORY"));
  objc_msgSend(v4, "setShouldIgnoreDoNotDisturb:", 1);
  objc_msgSend(v4, "setShouldBackgroundDefaultAction:", 1);
  objc_msgSend(v4, "setShouldAuthenticateDefaultAction:", 1);
  objc_msgSend(v4, "setShouldSuppressDefaultAction:", 1);

  return v4;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void (**v27)(_QWORD, _QWORD);
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  const char *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  uint64_t v51;
  void *v52;
  int v53;
  uint64_t v54;
  _DDUIiOSNotificationPresenter *v55;
  uint64_t v56;
  _QWORD v57[4];
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint8_t buf[4];
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  -[_DDUIiOSNotificationPresenter presentedNotification](self, "presentedNotification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_DDUIiOSNotificationPresenter presentedNotification](self, "presentedNotification");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "notificationID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "notification");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "request");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v11, "isEqual:", v14);

    if ((v15 & 1) != 0)
    {
      -[_DDUIiOSNotificationPresenter presentedNotification](self, "presentedNotification");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "completion");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "notification");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "request");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "content");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "categoryIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("LAUNCH_CATEGORY"));

      if (v22)
      {
        _DDUICoreLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          -[_DDUIiOSNotificationPresenter presentedNotification](self, "presentedNotification");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "applicationInfo");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "bundleID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v62 = v26;
          _os_log_impl(&dword_1C87B2000, v23, OS_LOG_TYPE_DEFAULT, "Attempting to launch application %@", buf, 0xCu);

        }
        v59 = *MEMORY[0x1E0D22D88];
        v60 = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
        v27 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D23158], "optionsWithDictionary:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DDUIiOSNotificationPresenter openApplicationService](self, "openApplicationService");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DDUIiOSNotificationPresenter presentedNotification](self, "presentedNotification");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "applicationInfo");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "bundleID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v57[0] = MEMORY[0x1E0C809B0];
        v57[1] = 3221225472;
        v57[2] = __109___DDUIiOSNotificationPresenter_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke;
        v57[3] = &unk_1E81B4960;
        v58 = v17;
        objc_msgSend(v29, "openApplication:withOptions:completion:", v32, v28, v57);

        goto LABEL_16;
      }
      objc_msgSend(v7, "notification");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "request");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "content");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "categoryIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("APP_STORE_CATEGORY"));

      if (v39)
      {
        -[_DDUIiOSNotificationPresenter delegate](self, "delegate");
        v27 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        -[_DDUIiOSNotificationPresenter presentedNotification](self, "presentedNotification");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "applicationInfo");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "deepLinkToAppStoreForApplication:", v40);
LABEL_15:

LABEL_16:
LABEL_17:
        -[_DDUIiOSNotificationPresenter _clearNotificationTimeout](self, "_clearNotificationTimeout");
        -[_DDUIiOSNotificationPresenter setPresentedNotification:](self, "setPresentedNotification:", 0);
        v8[2](v8);

        goto LABEL_18;
      }
      objc_msgSend(v7, "notification");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "request");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "content");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "categoryIdentifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "isEqualToString:", CFSTR("CONTINUITYCAPTURE_CATEGORY"));

      if (!v45)
        goto LABEL_17;
      _DDUICoreLog();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v62 = v7;
        _os_log_impl(&dword_1C87B2000, v46, OS_LOG_TYPE_DEFAULT, "Received Continuity Camera confirmation response: %@\n", buf, 0xCu);
      }

      -[_DDUIiOSNotificationPresenter presentedNotification](self, "presentedNotification");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "completion");
      v27 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      -[_DDUIiOSNotificationPresenter presentedNotification](self, "presentedNotification");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "remoteDeviceIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "actionIdentifier");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "isEqualToString:", CFSTR("CONTINUITYCAPTURE_ACCEPT"));

      if (!v50)
      {
        objc_msgSend(v7, "actionIdentifier");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "isEqualToString:", CFSTR("CONTINUITYCAPTURE_DECLINE"));

        if (v53)
          v54 = 7;
        else
          v54 = 2;
        v27[2](v27, v54);
        goto LABEL_16;
      }
      +[_DDUIRemoteDisplaySessionHandler sharedInstance](_DDUIRemoteDisplaySessionHandler, "sharedInstance");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v40, "isWifiStateOn") & 1) != 0)
      {
        if ((objc_msgSend(v40, "isContinuityCaptureUserPreferenceEnabled") & 1) != 0)
        {
          objc_msgSend(v40, "enterSessionWithRemoteDeviceID:reason:", v28, CFSTR("Phone accepted confirmation notification"));
          v51 = 1;
LABEL_33:
          v27[2](v27, v51);
          goto LABEL_15;
        }
        v55 = self;
        v56 = 1;
      }
      else
      {
        v55 = self;
        v56 = 0;
      }
      -[_DDUIiOSNotificationPresenter _showContinuityCameraDisabledAlertWithState:](v55, "_showContinuityCameraDisabledAlertWithState:", v56);
      v51 = 2;
      goto LABEL_33;
    }
    _DDUICoreLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v34 = "Notification selected -- doesn't match presented ID, ignoring";
      goto LABEL_11;
    }
  }
  else
  {
    _DDUICoreLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v34 = "Notification selected -- nothing should be presented, ignoring";
LABEL_11:
      _os_log_impl(&dword_1C87B2000, v33, OS_LOG_TYPE_DEFAULT, v34, buf, 2u);
    }
  }

  v8[2](v8);
LABEL_18:

}

- (_DDUINotificationPresenterDelegate)delegate
{
  return (_DDUINotificationPresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)setup
{
  return self->_setup;
}

- (void)setSetup:(BOOL)a3
{
  self->_setup = a3;
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCenter, a3);
}

- (_DDUIiOSNotificationPresenterApplicationRecordVendor)applicationRecordVendor
{
  return self->_applicationRecordVendor;
}

- (void)setApplicationRecordVendor:(id)a3
{
  objc_storeStrong((id *)&self->_applicationRecordVendor, a3);
}

- (FBSOpenApplicationService)openApplicationService
{
  return self->_openApplicationService;
}

- (void)setOpenApplicationService:(id)a3
{
  objc_storeStrong((id *)&self->_openApplicationService, a3);
}

- (SFWirelessSettingsController)wirelessSettingsController
{
  return self->_wirelessSettingsController;
}

- (void)setWirelessSettingsController:(id)a3
{
  objc_storeStrong((id *)&self->_wirelessSettingsController, a3);
}

- (_DDUIiOSPresentedNotification)presentedNotification
{
  return self->_presentedNotification;
}

- (void)setPresentedNotification:(id)a3
{
  objc_storeStrong((id *)&self->_presentedNotification, a3);
}

- (OS_dispatch_source)clearNotificationTimer
{
  return self->_clearNotificationTimer;
}

- (void)setClearNotificationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_clearNotificationTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clearNotificationTimer, 0);
  objc_storeStrong((id *)&self->_presentedNotification, 0);
  objc_storeStrong((id *)&self->_wirelessSettingsController, 0);
  objc_storeStrong((id *)&self->_openApplicationService, 0);
  objc_storeStrong((id *)&self->_applicationRecordVendor, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
