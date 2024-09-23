@implementation ContinuityCaptureShieldUIBackgroundActivityManager

+ (id)sharedInstance
{
  if (qword_10001A110 != -1)
    dispatch_once(&qword_10001A110, &stru_1000144E0);
  return (id)qword_10001A108;
}

- (ContinuityCaptureShieldUIBackgroundActivityManager)init
{
  ContinuityCaptureShieldUIBackgroundActivityManager *v2;
  ContinuityCaptureShieldUIBackgroundActivityController *v3;
  ContinuityCaptureShieldUIBackgroundActivityController *v4;
  ContinuityCaptureShieldUIBackgroundActivityController *v5;
  uint64_t v6;
  NSDictionary *backgroundActivityControllers;
  objc_super v9;
  _QWORD v10[3];
  _QWORD v11[3];

  v9.receiver = self;
  v9.super_class = (Class)ContinuityCaptureShieldUIBackgroundActivityManager;
  v2 = -[ContinuityCaptureShieldUIBackgroundActivityManager init](&v9, "init");
  if (v2)
  {
    v3 = -[ContinuityCaptureShieldUIBackgroundActivityController initWithBackgroundActivityIdentifier:]([ContinuityCaptureShieldUIBackgroundActivityController alloc], "initWithBackgroundActivityIdentifier:", CFSTR("com.apple.systemstatus.background-activity.continuitycapture.streaming-video"));
    v4 = -[ContinuityCaptureShieldUIBackgroundActivityController initWithBackgroundActivityIdentifier:]([ContinuityCaptureShieldUIBackgroundActivityController alloc], "initWithBackgroundActivityIdentifier:", CFSTR("com.apple.systemstatus.background-activity.continuitycapture.streaming-audio"));
    v5 = -[ContinuityCaptureShieldUIBackgroundActivityController initWithBackgroundActivityIdentifier:]([ContinuityCaptureShieldUIBackgroundActivityController alloc], "initWithBackgroundActivityIdentifier:", CFSTR("com.apple.systemstatus.background-activity.continuitycapture.streaming-none"));
    v10[0] = CFSTR("com.apple.systemstatus.background-activity.continuitycapture.streaming-video");
    v10[1] = CFSTR("com.apple.systemstatus.background-activity.continuitycapture.streaming-audio");
    v11[0] = v3;
    v11[1] = v4;
    v10[2] = CFSTR("com.apple.systemstatus.background-activity.continuitycapture.streaming-none");
    v11[2] = v5;
    v6 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 3));
    backgroundActivityControllers = v2->_backgroundActivityControllers;
    v2->_backgroundActivityControllers = (NSDictionary *)v6;

  }
  return v2;
}

- (void)updateState:(int64_t)a3
{
  -[ContinuityCaptureShieldUIBackgroundActivityManager updateState:withUserInteractionHandler:](self, "updateState:withUserInteractionHandler:", a3, 0);
}

- (void)updateState:(int64_t)a3 withUserInteractionHandler:(id)a4
{
  char v4;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  int v24;
  ContinuityCaptureShieldUIBackgroundActivityManager *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;

  v4 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if ((v4 & 0x30) == 0x10)
  {
    v7 = CMContinuityCaptureLog(0);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138412290;
      v25 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ removing background activity", (uint8_t *)&v24, 0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIBackgroundActivityManager backgroundActivityControllers](self, "backgroundActivityControllers"));
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", &stru_100014520);
  }
  else
  {
    if ((v4 & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIBackgroundActivityManager backgroundActivityControllers](self, "backgroundActivityControllers"));
      v11 = v10;
      v12 = CFSTR("com.apple.systemstatus.background-activity.continuitycapture.streaming-none");
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIBackgroundActivityManager backgroundActivityControllers](self, "backgroundActivityControllers"));
      v11 = v10;
      if ((v4 & 6) == 2)
      {
        v12 = CFSTR("com.apple.systemstatus.background-activity.continuitycapture.streaming-audio");
      }
      else if ((v4 & 4) != 0)
      {
        v12 = CFSTR("com.apple.systemstatus.background-activity.continuitycapture.streaming-video");
      }
      else
      {
        v12 = CFSTR("com.apple.systemstatus.background-activity.continuitycapture.streaming-none");
      }
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v12));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIBackgroundActivityManager _currentBackgroundActivityIdentifier](self, "_currentBackgroundActivityIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "backgroundActivityIdentifier"));
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

    if ((v15 & 1) == 0)
    {
      if (v13)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIBackgroundActivityManager backgroundActivityControllers](self, "backgroundActivityControllers"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", v13));

        objc_msgSend(v17, "deactivateBackgroundActivity");
      }
      v18 = CMContinuityCaptureLog(0);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "backgroundActivityIdentifier"));
        v24 = 138412802;
        v25 = self;
        v26 = 2112;
        v27 = v13;
        v28 = 2112;
        v29 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@ updating backgroundActivity %@ -> %@", (uint8_t *)&v24, 0x20u);

      }
      objc_msgSend(v9, "activateBackgroundActivityWithUserInteractionHandler:", v6);
      v21 = CMContinuityCaptureLog(0);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "backgroundActivityIdentifier"));
        v24 = 138412802;
        v25 = self;
        v26 = 2112;
        v27 = v13;
        v28 = 2112;
        v29 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@ updated backgroundActivity %@ -> %@", (uint8_t *)&v24, 0x20u);

      }
    }

  }
}

- (id)_currentBackgroundActivityIdentifier
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1000027DC;
  v10 = sub_1000027EC;
  v11 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIBackgroundActivityManager backgroundActivityControllers](self, "backgroundActivityControllers"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000027F4;
  v5[3] = &unk_100014548;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NSDictionary)backgroundActivityControllers
{
  return self->_backgroundActivityControllers;
}

- (void)setBackgroundActivityControllers:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundActivityControllers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundActivityControllers, 0);
}

@end
