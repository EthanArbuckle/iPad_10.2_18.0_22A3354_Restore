@implementation _DDUINotificationManager

- (_DDUINotificationManager)init
{
  _DDUINotificationManager *v2;
  _DDUIiOSNotificationPresenter *v3;
  _DDUINotificationPresenter *notificationPresenter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_DDUINotificationManager;
  v2 = -[_DDUINotificationManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_DDUIiOSNotificationPresenter);
    notificationPresenter = v2->_notificationPresenter;
    v2->_notificationPresenter = (_DDUINotificationPresenter *)v3;

    -[_DDUINotificationPresenter setDelegate:](v2->_notificationPresenter, "setDelegate:", v2);
  }
  return v2;
}

- (void)handleApplicationInfo:(id)a3 withID:(id)a4 fromDevice:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  _DDUICoreLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v10;
    v20 = 2112;
    v21 = v15;
    _os_log_impl(&dword_1C87B2000, v14, OS_LOG_TYPE_DEFAULT, "remoteDevice %@ deviceName %@", (uint8_t *)&v18, 0x16u);

  }
  -[_DDUINotificationManager notificationPresenter](self, "notificationPresenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "showNotificationForApplication:deviceName:identifier:completion:", v13, v17, v12, v11);

}

- (void)handleContinuityCameraConfirmationWithID:(id)a3 fromDevice:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  _DDUICoreLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v8;
    v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_1C87B2000, v11, OS_LOG_TYPE_DEFAULT, "remoteDevice %@ deviceName %@", (uint8_t *)&v14, 0x16u);

  }
  -[_DDUINotificationManager notificationPresenter](self, "notificationPresenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "showContinuityCameraConfirmation:identifier:completion:", v8, v10, v9);

}

- (void)cancelMessageWithID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_DDUINotificationManager notificationPresenter](self, "notificationPresenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissNotificationWithIdentifier:", v4);

}

- (void)deepLinkToAppStoreForApplication:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _DDUICoreLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v10 = objc_msgSend(v3, "adamID");
    _os_log_impl(&dword_1C87B2000, v4, OS_LOG_TYPE_DEFAULT, "Attempting to launch app store for adamID %lld", buf, 0xCu);
  }

  objc_msgSend(CFSTR("itms-apps://apple.com/app/id"), "stringByAppendingFormat:", CFSTR("%lld"), objc_msgSend(v3, "adamID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D22D88];
  v8 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);

}

- (_DDUINotificationPresenter)notificationPresenter
{
  return self->_notificationPresenter;
}

- (void)setNotificationPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationPresenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationPresenter, 0);
}

@end
