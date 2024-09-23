@implementation SRSiriDebugManager

+ (void)invokeSiriDebugFeedbackBannerFor:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t Name;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;

  v6 = a4;
  v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    Name = SASRequestSourceGetName(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(Name);
    *(_DWORD *)buf = 136315394;
    v14 = "+[SRSiriDebugManager invokeSiriDebugFeedbackBannerFor:completionHandler:]";
    v15 = 2112;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s SiriDebug: RequestSource to invoke Siri Banner: %@", buf, 0x16u);

  }
  if ((a3 | 4) == 0xC)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000162F4;
    v11[3] = &unk_100122688;
    v12 = v6;
    objc_msgSend(a1, "_notifySiriDebugAppWithMessage:completionHandler:", CFSTR("com.apple.siri.SiriDebug.FeedbackBanner.VoiceTrigger.Notify"), v11);

  }
}

+ (void)_notifySiriDebugAppWithMessage:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  v6 = a4;
  if (AFIsInternalInstall(v6, v7))
  {
    v8 = objc_msgSend(objc_alloc((Class)AFUIApplicationSiriTaskDeliverer), "initWithAppBundleIdentifier:", CFSTR("com.apple.siri.SiriDebug"));
    v9 = objc_msgSend(objc_alloc((Class)AFSiriTaskmaster), "initWithTaskDeliverer:", v8);
    v10 = objc_msgSend(objc_alloc((Class)AFSiriDebugUIRequest), "initWithMessage:makeAppFrontmost:", v5, 0);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001644C;
    v14[3] = &unk_1001225C0;
    v15 = v5;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100016504;
    v11[3] = &unk_100122A58;
    v12 = v15;
    v13 = v6;
    objc_msgSend(v9, "handleSiriRequest:deliveryHandler:completionHandler:", v10, v14, v11);

  }
}

@end
