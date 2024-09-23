@implementation CKCustomPluginNotificationViewController

+ (void)connectIfNeeded
{
  if (qword_10000CA90 != -1)
    dispatch_once(&qword_10000CA90, &stru_100008568);
}

- (CKCustomPluginNotificationViewController)init
{
  CKCustomPluginNotificationViewController *v2;
  CKCustomPluginNotificationViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKCustomPluginNotificationViewController;
  v2 = -[CKCustomPluginNotificationViewController init](&v5, "init");
  v3 = v2;
  if (v2)
    objc_msgSend((id)objc_opt_class(v2), "connectIfNeeded");
  return v3;
}

- (void)loadView
{
  void *v3;
  id v4;

  v4 = objc_alloc_init((Class)UIView);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[CKCustomPluginNotificationViewController setView:](self, "setView:", v4);
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 1.0;
  v3 = 1.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)customNotificationManagerForBalloonBundleID:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  int v15;
  id v16;

  v3 = a3;
  v4 = IMBalloonExtensionIDWithSuffix(IMBalloonBundleIdentifierAskTo);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  v8 = IMOSLoggingEnabled(v7);
  if (v6)
  {
    if (v8)
    {
      v9 = OSLogHandleForIMFoundationCategory("CKCustomPluginNotificationViewController");
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v15 = 138412290;
        v16 = v3;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Using AskTo custom notification manager for balloon bundle ID %@", (uint8_t *)&v15, 0xCu);
      }

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CKAskToNotificationManager sharedManager](CKAskToNotificationManager, "sharedManager"));
  }
  else
  {
    if (v8)
    {
      v12 = OSLogHandleForIMFoundationCategory("CKCustomPluginNotificationViewController");
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v15 = 138412290;
        v16 = v3;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "No custom notification manager for balloon bundle ID %@", (uint8_t *)&v15, 0xCu);
      }

    }
    v11 = 0;
  }

  return v11;
}

- (void)didReceiveNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  id v23;
  __int16 v24;
  void *v25;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "request"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "content"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CKBBContextKeyBalloonBundleID")));
  if (IMOSLoggingEnabled(v8))
  {
    v9 = OSLogHandleForIMFoundationCategory("CKCustomPluginNotificationViewController");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v22 = 138412290;
      v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Received notification for balloon bundle ID %@", (uint8_t *)&v22, 0xCu);
    }

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CKCustomPluginNotificationViewController customNotificationManagerForBalloonBundleID:](CKCustomPluginNotificationViewController, "customNotificationManagerForBalloonBundleID:", v8));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "notificationActionsFromNotification:", v4));
  v13 = objc_msgSend(v12, "count");
  v14 = v13 == 0;
  v15 = IMOSLoggingEnabled(v13);
  if (v14)
  {
    if (v15)
    {
      v20 = OSLogHandleForIMFoundationCategory("CKCustomPluginNotificationViewController");
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = 138412290;
        v23 = v8;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Custom notification manager returned no actions for balloon bundle ID %@", (uint8_t *)&v22, 0xCu);
      }

    }
  }
  else
  {
    if (v15)
    {
      v16 = OSLogHandleForIMFoundationCategory("CKCustomPluginNotificationViewController");
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = objc_msgSend(v12, "count");
        v22 = 134218242;
        v23 = v18;
        v24 = 2112;
        v25 = v8;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Custom notification manager returned %li actions for balloon bundle ID %@", (uint8_t *)&v22, 0x16u);
      }

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKCustomPluginNotificationViewController extensionContext](self, "extensionContext"));
    objc_msgSend(v19, "setNotificationActions:", v12);

  }
}

- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "notification"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "request"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "content"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userInfo"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CKBBContextKeyBalloonBundleID")));
  if (IMOSLoggingEnabled(v11))
  {
    v12 = OSLogHandleForIMFoundationCategory("CKCustomPluginNotificationViewController");
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v15 = 138412290;
      v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Received notification response for balloon bundle ID %@", (uint8_t *)&v15, 0xCu);
    }

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CKCustomPluginNotificationViewController customNotificationManagerForBalloonBundleID:](CKCustomPluginNotificationViewController, "customNotificationManagerForBalloonBundleID:", v11));
  objc_msgSend(v14, "handleResponse:completion:", v5, v6);

}

@end
