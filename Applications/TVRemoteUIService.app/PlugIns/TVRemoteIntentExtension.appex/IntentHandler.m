@implementation IntentHandler

- (id)handlerForIntent:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;

  v4 = a3;
  v5 = _TVRIntentExtensionLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[IntentHandler handlerForIntent:]";
    v10 = 2114;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", (uint8_t *)&v8, 0x16u);
  }

  return self;
}

- (void)handleWakeAppleTV:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;

  v5 = a3;
  v6 = a4;
  v7 = _TVRIntentExtensionLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[IntentHandler handleWakeAppleTV:completion:]";
    v19 = 2114;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", buf, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVRIntentExtensionDeviceManager sharedInstance](TVRIntentExtensionDeviceManager, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "device"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __46__IntentHandler_handleWakeAppleTV_completion___block_invoke;
  v14[3] = &unk_100010378;
  v15 = v5;
  v16 = v6;
  v12 = v6;
  v13 = v5;
  objc_msgSend(v9, "resolveDeviceWithIdentifier:handler:", v11, v14);

}

void __46__IntentHandler_handleWakeAppleTV_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  id v22;

  v5 = a2;
  v6 = a3;
  v7 = _TVRIntentExtensionLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v19 = 138543618;
      v20 = v10;
      v21 = 2114;
      v22 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Resolved device for intent=%{public}@, device=%{public}@", (uint8_t *)&v19, 0x16u);
    }

    v11 = objc_msgSend(objc_alloc((Class)TVRCButton), "_initWithButtonType:", 21);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCButtonEvent buttonEventForButton:eventType:](TVRCButtonEvent, "buttonEventForButton:eventType:", v11, 2));
    objc_msgSend(v5, "sendButtonEvent:", v12);

    v13 = objc_msgSend(objc_alloc((Class)WakeAppleTVIntentResponse), "initWithCode:userActivity:", 4, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCAnalytics sharedInstance](TVRCAnalytics, "sharedInstance"));
    objc_msgSend(v14, "logShortcutActionRunWithType:", CFSTR("Wake_AppleTV"));

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __46__IntentHandler_handleWakeAppleTV_completion___block_invoke_cold_1();

    v13 = objc_msgSend(objc_alloc((Class)WakeAppleTVIntentResponse), "initWithCode:userActivity:", 5, 0);
  }
  v15 = _TVRIntentExtensionLog();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(_QWORD *)(a1 + 32);
    v19 = 138543618;
    v20 = v17;
    v21 = 2114;
    v22 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Calling completion for intent=%{public}@, response=%{public}@", (uint8_t *)&v19, 0x16u);
  }

  v18 = *(_QWORD *)(a1 + 40);
  if (v18)
    (*(void (**)(uint64_t, id))(v18 + 16))(v18, v13);

}

- (void)provideDeviceOptionsCollectionForWakeAppleTV:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = _TVRIntentExtensionLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[IntentHandler provideDeviceOptionsCollectionForWakeAppleTV:withCompletion:]";
    v12 = 2114;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", (uint8_t *)&v10, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVRIntentExtensionDeviceQuery sharedInstance](TVRIntentExtensionDeviceQuery, "sharedInstance"));
  objc_msgSend(v9, "provideDeviceOptionsWithCompletion:", v6);

}

- (void)resolveDeviceForWakeAppleTV:(id)a3 withCompletion:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "device"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler _resolveDevice:](self, "_resolveDevice:", v9));
  (*((void (**)(id, void *))a4 + 2))(v7, v8);

}

- (void)handleSleepAppleTV:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;

  v5 = a3;
  v6 = a4;
  v7 = _TVRIntentExtensionLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[IntentHandler handleSleepAppleTV:completion:]";
    v19 = 2114;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", buf, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVRIntentExtensionDeviceManager sharedInstance](TVRIntentExtensionDeviceManager, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "device"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __47__IntentHandler_handleSleepAppleTV_completion___block_invoke;
  v14[3] = &unk_100010378;
  v15 = v5;
  v16 = v6;
  v12 = v6;
  v13 = v5;
  objc_msgSend(v9, "resolveDeviceWithIdentifier:handler:", v11, v14);

}

void __47__IntentHandler_handleSleepAppleTV_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  id v22;

  v5 = a2;
  v6 = a3;
  v7 = _TVRIntentExtensionLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v19 = 138543618;
      v20 = v10;
      v21 = 2114;
      v22 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Resolved device for intent=%{public}@, device=%{public}@", (uint8_t *)&v19, 0x16u);
    }

    v11 = objc_msgSend(objc_alloc((Class)TVRCButton), "_initWithButtonType:", 22);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCButtonEvent buttonEventForButton:eventType:](TVRCButtonEvent, "buttonEventForButton:eventType:", v11, 2));
    objc_msgSend(v5, "sendButtonEvent:", v12);

    v13 = objc_msgSend(objc_alloc((Class)SleepAppleTVIntentResponse), "initWithCode:userActivity:", 4, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCAnalytics sharedInstance](TVRCAnalytics, "sharedInstance"));
    objc_msgSend(v14, "logShortcutActionRunWithType:", CFSTR("Sleep_AppleTV"));

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __46__IntentHandler_handleWakeAppleTV_completion___block_invoke_cold_1();

    v13 = objc_msgSend(objc_alloc((Class)SleepAppleTVIntentResponse), "initWithCode:userActivity:", 5, 0);
  }
  v15 = _TVRIntentExtensionLog();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(_QWORD *)(a1 + 32);
    v19 = 138543618;
    v20 = v17;
    v21 = 2114;
    v22 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Calling completion for intent=%{public}@, response=%{public}@", (uint8_t *)&v19, 0x16u);
  }

  v18 = *(_QWORD *)(a1 + 40);
  if (v18)
    (*(void (**)(uint64_t, id))(v18 + 16))(v18, v13);

}

- (void)provideDeviceOptionsCollectionForSleepAppleTV:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = _TVRIntentExtensionLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[IntentHandler provideDeviceOptionsCollectionForSleepAppleTV:withCompletion:]";
    v12 = 2114;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", (uint8_t *)&v10, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVRIntentExtensionDeviceQuery sharedInstance](TVRIntentExtensionDeviceQuery, "sharedInstance"));
  objc_msgSend(v9, "provideDeviceOptionsWithCompletion:", v6);

}

- (void)resolveDeviceForSleepAppleTV:(id)a3 withCompletion:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "device"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler _resolveDevice:](self, "_resolveDevice:", v9));
  (*((void (**)(id, void *))a4 + 2))(v7, v8);

}

- (void)handleLaunchRemote:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, id);
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  void **v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  uint64_t v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;

  v5 = a3;
  v6 = (void (**)(id, id))a4;
  v7 = _TVRIntentExtensionLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[IntentHandler handleLaunchRemote:completion:]";
    v28 = 2114;
    v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", buf, 0x16u);
  }

  v9 = TVRViewServiceDeviceIdentifierTypeNone;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "device"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
  if (!v11)
    goto LABEL_6;
  v12 = objc_msgSend(0, "length");

  if (v12)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "device"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    v9 = 1;
LABEL_6:

    goto LABEL_8;
  }
  v11 = 0;
LABEL_8:
  v20 = _NSConcreteStackBlock;
  v21 = 3221225472;
  v22 = __47__IntentHandler_handleLaunchRemote_completion___block_invoke;
  v23 = &unk_1000103A0;
  v13 = v11;
  v24 = v13;
  v25 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v20);
  v14 = _TVRIntentExtensionLog();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v27 = (const char *)v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Lauching the TVRemote with deviceIdentifier=%{public}@", buf, 0xCu);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCAnalytics sharedInstance](TVRCAnalytics, "sharedInstance", v20, v21, v22, v23));
  objc_msgSend(v16, "logShortcutActionRunWithType:", CFSTR("LaunchRemote_AppleTV"));

  if (v6)
  {
    v17 = objc_msgSend(objc_alloc((Class)LaunchRemoteIntentResponse), "initWithCode:userActivity:", 4, 0);
    v18 = _TVRIntentExtensionLog();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v27 = (const char *)v5;
      v28 = 2114;
      v29 = v17;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Calling completion for intent=%{public}@, response=%{public}@", buf, 0x16u);
    }

    v6[2](v6, v17);
  }

}

void __47__IntentHandler_handleLaunchRemote_completion___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = objc_msgSend(objc_alloc((Class)TVRViewServiceConfigContext), "initWithDeviceIdentifier:identifierType:deviceType:launchContext:launchMethod:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1, 4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[TVRViewServiceManager sharedInstance](TVRViewServiceManager, "sharedInstance"));
  objc_msgSend(v1, "presentWithContext:", v2);

}

- (void)provideDeviceOptionsCollectionForLaunchRemote:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = _TVRIntentExtensionLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[IntentHandler provideDeviceOptionsCollectionForLaunchRemote:withCompletion:]";
    v12 = 2114;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", (uint8_t *)&v10, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVRIntentExtensionDeviceQuery sharedInstance](TVRIntentExtensionDeviceQuery, "sharedInstance"));
  objc_msgSend(v9, "provideDeviceOptionsWithCompletion:", v6);

}

- (void)resolveDeviceForLaunchRemote:(id)a3 withCompletion:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "device"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler _resolveDevice:](self, "_resolveDevice:", v9));
  (*((void (**)(id, void *))a4 + 2))(v7, v8);

}

- (void)handlePauseContent:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;

  v5 = a3;
  v6 = a4;
  v7 = _TVRIntentExtensionLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[IntentHandler handlePauseContent:completion:]";
    v19 = 2114;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", buf, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "device"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVRIntentExtensionDeviceManager sharedInstance](TVRIntentExtensionDeviceManager, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __47__IntentHandler_handlePauseContent_completion___block_invoke;
  v14[3] = &unk_100010378;
  v15 = v5;
  v16 = v6;
  v12 = v6;
  v13 = v5;
  objc_msgSend(v10, "resolveDeviceWithIdentifier:handler:", v11, v14);

}

void __47__IntentHandler_handlePauseContent_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  unint64_t v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  id v27;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "mediaCommand");
  if (!v3 || (v5 = (unint64_t)v4) == 0)
  {
    v14 = objc_alloc((Class)PauseContentIntentResponse);
    v15 = 5;
    goto LABEL_15;
  }
  v6 = _TVRIntentExtensionLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v24 = 138543618;
    v25 = v8;
    v26 = 2114;
    v27 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Resolved device for intent=%{public}@, device=%{public}@", (uint8_t *)&v24, 0x16u);
  }

  if ((v5 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v9 = objc_alloc((Class)TVRCButton);
    if (v5 == 3)
      v10 = 204;
    else
      v10 = 205;
    v11 = objc_msgSend(v9, "_initWithButtonType:", v10);
    v12 = v11;
    v13 = 0;
    goto LABEL_13;
  }
  if (v5 == 1)
  {
    v11 = objc_msgSend(objc_alloc((Class)TVRCButton), "_initWithButtonType:", 5);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCButtonEvent buttonEventForButton:eventType:](TVRCButtonEvent, "buttonEventForButton:eventType:", v11, 1));
    objc_msgSend(v3, "sendButtonEvent:", v16);

    v12 = v11;
    v13 = 2;
LABEL_13:
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCButtonEvent buttonEventForButton:eventType:](TVRCButtonEvent, "buttonEventForButton:eventType:", v12, v13));
    objc_msgSend(v3, "sendButtonEvent:", v17);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCAnalytics sharedInstance](TVRCAnalytics, "sharedInstance"));
  objc_msgSend(v18, "logShortcutActionRunWithType:", CFSTR("PlayPause_AppleTV"));

  v14 = objc_alloc((Class)PauseContentIntentResponse);
  v15 = 4;
LABEL_15:
  v19 = objc_msgSend(v14, "initWithCode:userActivity:", v15, 0);
  v20 = _TVRIntentExtensionLog();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = *(_QWORD *)(a1 + 32);
    v24 = 138543618;
    v25 = v22;
    v26 = 2114;
    v27 = v19;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Calling completion for intent=%{public}@, response=%{public}@", (uint8_t *)&v24, 0x16u);
  }

  v23 = *(_QWORD *)(a1 + 40);
  if (v23)
    (*(void (**)(uint64_t, id))(v23 + 16))(v23, v19);

}

- (void)provideDeviceOptionsCollectionForPauseContent:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = _TVRIntentExtensionLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[IntentHandler provideDeviceOptionsCollectionForPauseContent:withCompletion:]";
    v12 = 2114;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", (uint8_t *)&v10, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVRIntentExtensionDeviceQuery sharedInstance](TVRIntentExtensionDeviceQuery, "sharedInstance"));
  objc_msgSend(v9, "provideDeviceOptionsWithCompletion:", v6);

}

- (void)resolveDeviceForPauseContent:(id)a3 withCompletion:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "device"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler _resolveDevice:](self, "_resolveDevice:", v9));
  (*((void (**)(id, void *))a4 + 2))(v7, v8);

}

- (void)resolveMediaCommandForPauseContent:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;

  v7 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[IntentHandler _resolveMediaCommand:](self, "_resolveMediaCommand:", objc_msgSend(a3, "mediaCommand")));
  (*((void (**)(id, id))a4 + 2))(v7, v8);

}

- (void)handleLaunchTVApp:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;

  v5 = a3;
  v6 = a4;
  v7 = _TVRIntentExtensionLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[IntentHandler handleLaunchTVApp:completion:]";
    v19 = 2114;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", buf, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "device"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVRIntentExtensionDeviceManager sharedInstance](TVRIntentExtensionDeviceManager, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __46__IntentHandler_handleLaunchTVApp_completion___block_invoke;
  v14[3] = &unk_100010378;
  v15 = v5;
  v16 = v6;
  v12 = v6;
  v13 = v5;
  objc_msgSend(v10, "resolveDeviceWithIdentifier:handler:", v11, v14);

}

void __46__IntentHandler_handleLaunchTVApp_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  id v28;

  v5 = a2;
  v6 = a3;
  v7 = _TVRIntentExtensionLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v26 = v10;
      v27 = 2114;
      v28 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Resolved device for intent=%{public}@, device=%{public}@", buf, 0x16u);
    }

    v11 = objc_msgSend(objc_alloc((Class)TVRCButton), "_initWithButtonType:", 21);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCButtonEvent buttonEventForButton:eventType:](TVRCButtonEvent, "buttonEventForButton:eventType:", v11, 2));
    objc_msgSend(v5, "sendButtonEvent:", v12);

    v13 = objc_alloc((Class)TVRCButton);
    v23 = TVRCButtonApplicationBundleIDKey;
    v24 = CFSTR("com.apple.TVWatchList");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    v15 = objc_msgSend(v13, "_initWithButtonType:hasTapAction:properties:", 20, 1, v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCButtonEvent buttonEventForButton:eventType:](TVRCButtonEvent, "buttonEventForButton:eventType:", v15, 0));
    objc_msgSend(v5, "sendButtonEvent:", v16);

    v17 = objc_msgSend(objc_alloc((Class)LaunchTVAppIntentResponse), "initWithCode:userActivity:", 4, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCAnalytics sharedInstance](TVRCAnalytics, "sharedInstance"));
    objc_msgSend(v18, "logShortcutActionRunWithType:", CFSTR("LaunchApp_AppleTV"));

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __46__IntentHandler_handleWakeAppleTV_completion___block_invoke_cold_1();

    v17 = objc_msgSend(objc_alloc((Class)LaunchTVAppIntentResponse), "initWithCode:userActivity:", 5, 0);
  }
  v19 = _TVRIntentExtensionLog();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v26 = v21;
    v27 = 2114;
    v28 = v17;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Calling completion for intent=%{public}@, response=%{public}@", buf, 0x16u);
  }

  v22 = *(_QWORD *)(a1 + 40);
  if (v22)
    (*(void (**)(uint64_t, id))(v22 + 16))(v22, v17);

}

- (void)confirmLaunchTVApp:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, id);
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;

  v5 = a3;
  v6 = (void (**)(id, id))a4;
  v7 = _TVRIntentExtensionLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136315394;
    v20 = "-[IntentHandler confirmLaunchTVApp:completion:]";
    v21 = 2114;
    v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", (uint8_t *)&v19, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "device"));
  v10 = v9;
  if (v9 && (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier")), v11, v11))
  {
    v12 = _TVRIntentExtensionLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138543618;
      v20 = (const char *)v5;
      v21 = 2114;
      v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Resolved device for intent=%{public}@, device=%{public}@", (uint8_t *)&v19, 0x16u);
    }
    v14 = 1;
  }
  else
  {
    v15 = _TVRIntentExtensionLog();
    v13 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[IntentHandler confirmLaunchTVApp:completion:].cold.1((uint64_t)v10, v13);
    v14 = 5;
  }

  v16 = objc_msgSend(objc_alloc((Class)LaunchTVAppIntentResponse), "initWithCode:userActivity:", v14, 0);
  v17 = _TVRIntentExtensionLog();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138543618;
    v20 = (const char *)v5;
    v21 = 2114;
    v22 = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Calling completion for intent=%{public}@, response=%{public}@", (uint8_t *)&v19, 0x16u);
  }

  if (v6)
    v6[2](v6, v16);

}

- (void)handleLaunchApplication:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;

  v5 = a3;
  v6 = a4;
  v7 = _TVRIntentExtensionLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[IntentHandler handleLaunchApplication:completion:]";
    v19 = 2114;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", buf, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVRIntentExtensionDeviceManager sharedInstance](TVRIntentExtensionDeviceManager, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "device"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __52__IntentHandler_handleLaunchApplication_completion___block_invoke;
  v14[3] = &unk_100010378;
  v15 = v5;
  v16 = v6;
  v12 = v6;
  v13 = v5;
  objc_msgSend(v9, "resolveDeviceWithIdentifier:handler:", v11, v14);

}

void __52__IntentHandler_handleLaunchApplication_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char **v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  id v33;

  v5 = a2;
  v6 = a3;
  v7 = (const char **)(a1 + 32);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "application"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));

  v10 = _TVRIntentExtensionLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (v5 && v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *v7;
      *(_DWORD *)buf = 138543618;
      v31 = v13;
      v32 = 2114;
      v33 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Resolved device for intent=%{public}@, device=%{public}@", buf, 0x16u);
    }

    v14 = _TVRIntentExtensionLog();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[IntentHandler handleLaunchApplication:completion:]_block_invoke";
      v32 = 2112;
      v33 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s with bundleID %@", buf, 0x16u);
    }

    v16 = objc_msgSend(objc_alloc((Class)TVRCButton), "_initWithButtonType:", 21);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCButtonEvent buttonEventForButton:eventType:](TVRCButtonEvent, "buttonEventForButton:eventType:", v16, 2));
    objc_msgSend(v5, "sendButtonEvent:", v17);

    v18 = objc_alloc((Class)TVRCButton);
    v28 = TVRCButtonApplicationBundleIDKey;
    v29 = v9;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
    v20 = objc_msgSend(v18, "_initWithButtonType:hasTapAction:properties:", 20, 1, v19);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCButtonEvent buttonEventForButton:eventType:](TVRCButtonEvent, "buttonEventForButton:eventType:", v20, 0));
    objc_msgSend(v5, "sendButtonEvent:", v21);

    v22 = objc_msgSend(objc_alloc((Class)LaunchApplicationIntentResponse), "initWithCode:userActivity:", 4, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCAnalytics sharedInstance](TVRCAnalytics, "sharedInstance"));
    objc_msgSend(v23, "logShortcutActionRunWithType:", CFSTR("LaunchApp_AppleTV"));

  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __52__IntentHandler_handleLaunchApplication_completion___block_invoke_cold_1();

    v22 = objc_msgSend(objc_alloc((Class)LaunchApplicationIntentResponse), "initWithCode:userActivity:", 5, 0);
  }
  v24 = _TVRIntentExtensionLog();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = *v7;
    *(_DWORD *)buf = 138543618;
    v31 = v26;
    v32 = 2114;
    v33 = v22;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Calling completion for intent=%{public}@, response=%{public}@", buf, 0x16u);
  }

  v27 = *(_QWORD *)(a1 + 40);
  if (v27)
    (*(void (**)(uint64_t, id))(v27 + 16))(v27, v22);

}

- (id)defaultApplicationForLaunchApplication:(id)a3
{
  return objc_msgSend(objc_alloc((Class)TVRApplication), "initWithIdentifier:displayString:", CFSTR("com.apple.TVWatchList"), CFSTR("TV"));
}

- (void)provideApplicationOptionsCollectionForLaunchApplication:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  NSErrorUserInfoKey v29;
  void *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;

  v6 = a3;
  v7 = a4;
  v8 = _TVRIntentExtensionLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v32 = "-[IntentHandler provideApplicationOptionsCollectionForLaunchApplication:withCompletion:]";
    v33 = 2114;
    v34 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", buf, 0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "device"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("TVRI_APPLICATION_FETCH_ERROR"), &stru_100010700, 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayString"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v13));

  if (v10)
  {
    objc_initWeak((id *)buf, self);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[TVRIntentExtensionDeviceManager sharedInstance](TVRIntentExtensionDeviceManager, "sharedInstance"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = __88__IntentHandler_provideApplicationOptionsCollectionForLaunchApplication_withCompletion___block_invoke;
    v24[3] = &unk_1000103F0;
    objc_copyWeak(&v28, (id *)buf);
    v25 = v6;
    v26 = v14;
    v27 = v7;
    objc_msgSend(v15, "resolveDeviceWithIdentifier:handler:", v16, v24);

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v29 = NSLocalizedDescriptionKey;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("TVRI_APPLICATION_FETCH_ERROR_TV_NOT_FOUND"), &stru_100010700, 0));
    v30 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
    v20 = TVRCMakeError(103, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

    v22 = _TVRIntentExtensionLog();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[IntentHandler provideApplicationOptionsCollectionForLaunchApplication:withCompletion:].cold.1();

    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v21);
  }

}

void __88__IntentHandler_provideApplicationOptionsCollectionForLaunchApplication_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void **v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *, uint64_t, uint64_t);
  void *v23;
  id v24;
  id v25;
  NSErrorUserInfoKey v26;
  uint64_t v27;
  NSErrorUserInfoKey v28;
  uint64_t v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  id v33;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v3)
    {
      v5 = _TVRIntentExtensionLog();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v31 = v7;
        v32 = 2114;
        v33 = v3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Resolved device for intent=%{public}@, device=%{public}@", buf, 0x16u);
      }

      v8 = objc_alloc((Class)TVRCDeviceEventManager);
      v20 = _NSConcreteStackBlock;
      v21 = 3221225472;
      v22 = __88__IntentHandler_provideApplicationOptionsCollectionForLaunchApplication_withCompletion___block_invoke_36;
      v23 = &unk_1000103C8;
      v24 = *(id *)(a1 + 40);
      v25 = *(id *)(a1 + 48);
      v9 = objc_msgSend(v8, "initWithDevice:responseHandler:", v3, &v20);
      objc_msgSend(WeakRetained, "setEventManager:", v9, v20, v21, v22, v23);

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "eventManager"));
      v11 = TVRCFetchLaunchableApplicationsEvent;
      v12 = *(_QWORD *)(a1 + 40);
      v28 = NSLocalizedDescriptionKey;
      v29 = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
      objc_msgSend(v10, "sendEvent:options:", v11, v13);

      v14 = v24;
    }
    else
    {
      v15 = *(_QWORD *)(a1 + 40);
      v26 = NSLocalizedDescriptionKey;
      v27 = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
      v17 = TVRCMakeError(103, v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v17);

      v18 = _TVRIntentExtensionLog();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[IntentHandler provideApplicationOptionsCollectionForLaunchApplication:withCompletion:].cold.1();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
}

void __88__IntentHandler_provideApplicationOptionsCollectionForLaunchApplication_withCompletion___block_invoke_36(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  void *v34;
  _BYTE v35[128];
  NSErrorUserInfoKey v36;
  uint64_t v37;

  v8 = a3;
  if (a5)
  {
    v9 = *(_QWORD *)(a1 + 32);
    v36 = NSLocalizedDescriptionKey;
    v37 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
    v11 = TVRCMakeError(103, v10);
    v12 = (id)objc_claimAutoreleasedReturnValue(v11);

    v13 = _TVRIntentExtensionLog();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __88__IntentHandler_provideApplicationOptionsCollectionForLaunchApplication_withCompletion___block_invoke_36_cold_2();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_19:

    goto LABEL_20;
  }
  if (objc_msgSend(a2, "isEqualToString:", TVRCFetchLaunchableApplicationsEvent))
  {
    v12 = objc_alloc_init((Class)NSMutableArray);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allKeys", 0));
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v20));
          v22 = objc_msgSend(objc_alloc((Class)TVRApplication), "initWithIdentifier:displayString:pronunciationHint:", v20, v21, v21);
          objc_msgSend(v12, "addObject:", v22);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v17);
    }

    if (objc_msgSend(v12, "count"))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("displayString"), 1));
      v34 = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
      objc_msgSend(v12, "sortUsingDescriptors:", v24);

      v25 = *(_QWORD *)(a1 + 40);
      v26 = objc_msgSend(objc_alloc((Class)INObjectCollection), "initWithItems:", v12);
      (*(void (**)(uint64_t, id, _QWORD))(v25 + 16))(v25, v26, 0);
    }
    else
    {
      v27 = TVRCMakeError(103, 0);
      v26 = (id)objc_claimAutoreleasedReturnValue(v27);
      v28 = _TVRIntentExtensionLog();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[IntentHandler provideApplicationOptionsCollectionForLaunchApplication:withCompletion:].cold.1();

      (*(void (**)(_QWORD, _QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, v26);
    }

    goto LABEL_19;
  }
LABEL_20:

}

- (void)provideDeviceOptionsCollectionForLaunchApplication:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = _TVRIntentExtensionLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[IntentHandler provideDeviceOptionsCollectionForLaunchApplication:withCompletion:]";
    v12 = 2114;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", (uint8_t *)&v10, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVRIntentExtensionDeviceQuery sharedInstance](TVRIntentExtensionDeviceQuery, "sharedInstance"));
  objc_msgSend(v9, "provideDeviceOptionsWithCompletion:", v6);

}

- (void)resolveApplicationForLaunchApplication:(id)a3 withCompletion:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "application"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler _resolveApplication:](self, "_resolveApplication:", v9));
  (*((void (**)(id, void *))a4 + 2))(v7, v8);

}

- (void)resolveDeviceForLaunchApplication:(id)a3 withCompletion:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "device"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler _resolveDevice:](self, "_resolveDevice:", v9));
  (*((void (**)(id, void *))a4 + 2))(v7, v8);

}

- (void)handleLaunchScreenSaver:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;

  v5 = a3;
  v6 = a4;
  v7 = _TVRIntentExtensionLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[IntentHandler handleLaunchScreenSaver:completion:]";
    v19 = 2114;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", buf, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "device"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVRIntentExtensionDeviceManager sharedInstance](TVRIntentExtensionDeviceManager, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __52__IntentHandler_handleLaunchScreenSaver_completion___block_invoke;
  v14[3] = &unk_100010378;
  v15 = v5;
  v16 = v6;
  v12 = v6;
  v13 = v5;
  objc_msgSend(v10, "resolveDeviceWithIdentifier:handler:", v11, v14);

}

void __52__IntentHandler_handleLaunchScreenSaver_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  id v21;

  v5 = a2;
  v6 = a3;
  v7 = _TVRIntentExtensionLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v18 = 138543618;
      v19 = v10;
      v20 = 2114;
      v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Resolved device for intent=%{public}@, device=%{public}@", (uint8_t *)&v18, 0x16u);
    }

    v11 = objc_msgSend(objc_alloc((Class)TVRCButton), "_initWithButtonType:", 19);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCButtonEvent buttonEventForButton:eventType:](TVRCButtonEvent, "buttonEventForButton:eventType:", v11, 2));
    objc_msgSend(v5, "sendButtonEvent:", v12);

    v13 = objc_msgSend(objc_alloc((Class)LaunchScreenSaverIntentResponse), "initWithCode:userActivity:", 4, 0);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __46__IntentHandler_handleWakeAppleTV_completion___block_invoke_cold_1();

    v13 = objc_msgSend(objc_alloc((Class)LaunchScreenSaverIntentResponse), "initWithCode:userActivity:", 5, 0);
  }
  v14 = _TVRIntentExtensionLog();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(a1 + 32);
    v18 = 138543618;
    v19 = v16;
    v20 = 2114;
    v21 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Calling completion for intent=%{public}@, response=%{public}@", (uint8_t *)&v18, 0x16u);
  }

  v17 = *(_QWORD *)(a1 + 40);
  if (v17)
    (*(void (**)(uint64_t, id))(v17 + 16))(v17, v13);

}

- (void)provideDeviceOptionsCollectionForLaunchScreenSaver:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = _TVRIntentExtensionLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[IntentHandler provideDeviceOptionsCollectionForLaunchScreenSaver:withCompletion:]";
    v12 = 2114;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", (uint8_t *)&v10, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVRIntentExtensionDeviceQuery sharedInstance](TVRIntentExtensionDeviceQuery, "sharedInstance"));
  objc_msgSend(v9, "provideDeviceOptionsWithCompletion:", v6);

}

- (void)resolveDeviceForLaunchScreenSaver:(id)a3 withCompletion:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "device"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler _resolveDevice:](self, "_resolveDevice:", v9));
  (*((void (**)(id, void *))a4 + 2))(v7, v8);

}

- (void)handleToggleCaptions:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;

  v5 = a3;
  v6 = a4;
  v7 = _TVRIntentExtensionLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[IntentHandler handleToggleCaptions:completion:]";
    v19 = 2114;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", buf, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVRIntentExtensionDeviceManager sharedInstance](TVRIntentExtensionDeviceManager, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "device"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __49__IntentHandler_handleToggleCaptions_completion___block_invoke;
  v14[3] = &unk_100010378;
  v15 = v5;
  v16 = v6;
  v12 = v6;
  v13 = v5;
  objc_msgSend(v9, "resolveDeviceWithIdentifier:handler:", v11, v14);

}

void __49__IntentHandler_handleToggleCaptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  id v22;

  v5 = a2;
  v6 = a3;
  v7 = _TVRIntentExtensionLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v19 = 138543618;
      v20 = v10;
      v21 = 2114;
      v22 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Resolved device for intent=%{public}@, device=%{public}@", (uint8_t *)&v19, 0x16u);
    }

    if (objc_msgSend(*(id *)(a1 + 32), "toggle") == (id)1)
      v11 = 17;
    else
      v11 = 18;
    v12 = objc_msgSend(objc_alloc((Class)TVRCButton), "_initWithButtonType:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCButtonEvent buttonEventForButton:eventType:](TVRCButtonEvent, "buttonEventForButton:eventType:", v12, 0));
    objc_msgSend(v5, "sendButtonEvent:", v13);

    v14 = objc_msgSend(objc_alloc((Class)ToggleCaptionsIntentResponse), "initWithCode:userActivity:", 4, 0);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __46__IntentHandler_handleWakeAppleTV_completion___block_invoke_cold_1();

    v14 = objc_msgSend(objc_alloc((Class)ToggleCaptionsIntentResponse), "initWithCode:userActivity:", 5, 0);
  }
  v15 = _TVRIntentExtensionLog();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(_QWORD *)(a1 + 32);
    v19 = 138543618;
    v20 = v17;
    v21 = 2114;
    v22 = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Calling completion for intent=%{public}@, response=%{public}@", (uint8_t *)&v19, 0x16u);
  }

  v18 = *(_QWORD *)(a1 + 40);
  if (v18)
    (*(void (**)(uint64_t, id))(v18 + 16))(v18, v14);

}

- (void)provideDeviceOptionsCollectionForToggleCaptions:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = _TVRIntentExtensionLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[IntentHandler provideDeviceOptionsCollectionForToggleCaptions:withCompletion:]";
    v12 = 2114;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", (uint8_t *)&v10, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVRIntentExtensionDeviceQuery sharedInstance](TVRIntentExtensionDeviceQuery, "sharedInstance"));
  objc_msgSend(v9, "provideDeviceOptionsWithCompletion:", v6);

}

- (void)resolveToggleForToggleCaptions:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;

  v7 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[IntentHandler _resolveCaptionsToggle:](self, "_resolveCaptionsToggle:", objc_msgSend(a3, "toggle")));
  (*((void (**)(id, id))a4 + 2))(v7, v8);

}

- (void)resolveDeviceForToggleCaptions:(id)a3 withCompletion:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "device"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler _resolveDevice:](self, "_resolveDevice:", v9));
  (*((void (**)(id, void *))a4 + 2))(v7, v8);

}

- (void)handleSwitchUserAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  _BYTE *v22;
  _BYTE buf[24];
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  v8 = _TVRIntentExtensionLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[IntentHandler handleSwitchUserAccount:completion:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "account"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVRIntentExtensionDeviceManager sharedInstance](TVRIntentExtensionDeviceManager, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "device"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __52__IntentHandler_handleSwitchUserAccount_completion___block_invoke;
  v18[3] = &unk_100010458;
  v18[4] = self;
  v15 = v11;
  v19 = v15;
  v22 = buf;
  v16 = v6;
  v20 = v16;
  v17 = v7;
  v21 = v17;
  objc_msgSend(v12, "resolveDeviceWithIdentifier:handler:", v14, v18);

  _Block_object_dispose(buf, 8);
}

void __52__IntentHandler_handleSwitchUserAccount_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id location;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v5 = a2;
  v6 = a3;
  objc_initWeak(&location, *(id *)(a1 + 32));
  if (v5)
  {
    v7 = objc_loadWeakRetained(&location);
    if (v7)
    {
      v8 = _TVRIntentExtensionLog();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v29 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sending switch account for accountID=%{public}@", buf, 0xCu);
      }

      v11 = objc_msgSend(objc_alloc((Class)TVRCDeviceEventManager), "initWithDevice:responseHandler:", v5, &__block_literal_global);
      objc_msgSend(v7, "setEventManager:", v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "eventManager"));
      v13 = *(_QWORD *)(a1 + 40);
      v32 = TVRCSwitchAccountID;
      v33 = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
      objc_msgSend(v12, "sendEvent:options:", TVRCSwitchUserAccountEvent, v14);

      v15 = objc_msgSend(objc_alloc((Class)SwitchUserAccountIntentResponse), "initWithCode:userActivity:", 4, 0);
    }
    else
    {
      v18 = _TVRIntentExtensionLog();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __52__IntentHandler_handleSwitchUserAccount_completion___block_invoke_cold_1(v19);

      v15 = objc_msgSend(objc_alloc((Class)SwitchUserAccountIntentResponse), "initWithCode:userActivity:", 5, 0);
    }
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v15;

  }
  else
  {
    v16 = objc_msgSend(objc_alloc((Class)SwitchUserAccountIntentResponse), "initWithCode:userActivity:", 5, 0);
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v7 = *(id *)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;
  }

  v22 = _TVRIntentExtensionLog();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = *(_QWORD *)(a1 + 48);
    v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    *(_DWORD *)buf = 138543618;
    v29 = v24;
    v30 = 2114;
    v31 = v25;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Calling completion for intent=%{public}@, response=%{public}@", buf, 0x16u);
  }

  v26 = *(_QWORD *)(a1 + 56);
  if (v26)
    (*(void (**)(uint64_t, _QWORD))(v26 + 16))(v26, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  objc_destroyWeak(&location);

}

- (void)provideDeviceOptionsCollectionForSwitchUserAccount:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = _TVRIntentExtensionLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[IntentHandler provideDeviceOptionsCollectionForSwitchUserAccount:withCompletion:]";
    v12 = 2114;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", (uint8_t *)&v10, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVRIntentExtensionDeviceQuery sharedInstance](TVRIntentExtensionDeviceQuery, "sharedInstance"));
  objc_msgSend(v9, "provideDeviceOptionsWithCompletion:", v6);

}

- (void)provideAccountOptionsCollectionForSwitchUserAccount:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  NSErrorUserInfoKey v24;
  void *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;

  v6 = a3;
  v7 = a4;
  v8 = _TVRIntentExtensionLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[IntentHandler provideAccountOptionsCollectionForSwitchUserAccount:withCompletion:]";
    v28 = 2114;
    v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", buf, 0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "device"));
  if (v10)
  {
    objc_initWeak((id *)buf, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVRIntentExtensionDeviceManager sharedInstance](TVRIntentExtensionDeviceManager, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __84__IntentHandler_provideAccountOptionsCollectionForSwitchUserAccount_withCompletion___block_invoke;
    v20[3] = &unk_1000104A8;
    objc_copyWeak(&v23, (id *)buf);
    v21 = v6;
    v22 = v7;
    objc_msgSend(v11, "resolveDeviceWithIdentifier:handler:", v12, v20);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v24 = NSLocalizedDescriptionKey;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("TVRI_INVALID_APPLE_TV"), &stru_100010700, 0));
    v25 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
    v16 = TVRCMakeError(103, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

    v18 = _TVRIntentExtensionLog();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[IntentHandler provideAccountOptionsCollectionForSwitchUserAccount:withCompletion:].cold.1();

    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v17);
  }

}

void __84__IntentHandler_provideAccountOptionsCollectionForSwitchUserAccount_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  id v25;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v8 = _TVRIntentExtensionLog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = v9;
    if (v5)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v23 = v11;
        v24 = 2114;
        v25 = v5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Resolved device for intent=%{public}@, device=%{public}@", buf, 0x16u);
      }

      v12 = objc_alloc((Class)TVRCDeviceEventManager);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = __84__IntentHandler_provideAccountOptionsCollectionForSwitchUserAccount_withCompletion___block_invoke_50;
      v18[3] = &unk_100010480;
      v19 = v5;
      v21 = *(id *)(a1 + 40);
      v20 = v6;
      v13 = objc_msgSend(v12, "initWithDevice:responseHandler:", v19, v18);
      objc_msgSend(WeakRetained, "setEventManager:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "eventManager"));
      objc_msgSend(v14, "sendEvent:options:", TVRCFetchUserAccountsEvent, 0);

      v15 = v19;
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __46__IntentHandler_handleWakeAppleTV_completion___block_invoke_cold_1();

      v16 = *(_QWORD *)(a1 + 40);
      v17 = TVRCMakeError(103, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v17);
      (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v15);
    }

  }
}

void __84__IntentHandler_provideAccountOptionsCollectionForSwitchUserAccount_withCompletion___block_invoke_50(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  void *v35;
  uint8_t v36[128];
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    v10 = TVRCMakeError(103, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue(v10);
    v12 = _TVRIntentExtensionLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v29 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v38 = v29;
      v39 = 2114;
      v40 = v9;
      v41 = 2114;
      v42 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to create event manager with device=%{public}@, eventManagerError=%{public}@, error=%{public}@", buf, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_19:

    goto LABEL_20;
  }
  if (objc_msgSend(a2, "isEqualToString:", TVRCFetchUserAccountsEvent))
  {
    v30 = a1;
    v11 = objc_alloc_init((Class)NSMutableArray);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allKeys"));
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v19));
          v21 = objc_msgSend(objc_alloc((Class)TVRUserAccount), "initWithIdentifier:displayString:pronunciationHint:", v19, v20, v20);
          objc_msgSend(v11, "addObject:", v21);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v16);
    }

    if (objc_msgSend(v11, "count"))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("displayString"), 1));
      v35 = v22;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1));
      objc_msgSend(v11, "sortUsingDescriptors:", v23);

      v24 = *(_QWORD *)(v30 + 48);
      v25 = objc_msgSend(objc_alloc((Class)INObjectCollection), "initWithItems:", v11);
      (*(void (**)(uint64_t, id, _QWORD))(v24 + 16))(v24, v25, 0);
    }
    else
    {
      v26 = TVRCMakeError(103, 0);
      v25 = (id)objc_claimAutoreleasedReturnValue(v26);
      v27 = _TVRIntentExtensionLog();
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        __84__IntentHandler_provideAccountOptionsCollectionForSwitchUserAccount_withCompletion___block_invoke_50_cold_1();

      (*(void (**)(_QWORD, _QWORD, id))(*(_QWORD *)(v30 + 48) + 16))(*(_QWORD *)(v30 + 48), 0, v25);
    }

    goto LABEL_19;
  }
LABEL_20:

}

- (void)resolveDeviceForSwitchUserAccount:(id)a3 withCompletion:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "device"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler _resolveDevice:](self, "_resolveDevice:", v9));
  (*((void (**)(id, void *))a4 + 2))(v7, v8);

}

- (void)resolveAccountForSwitchUserAccount:(id)a3 withCompletion:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "account"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler _resolveUserAccount:](self, "_resolveUserAccount:", v9));
  (*((void (**)(id, void *))a4 + 2))(v7, v8);

}

- (void)handleSkipContent:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;

  v5 = a3;
  v6 = a4;
  v7 = _TVRIntentExtensionLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[IntentHandler handleSkipContent:completion:]";
    v19 = 2114;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", buf, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVRIntentExtensionDeviceManager sharedInstance](TVRIntentExtensionDeviceManager, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "device"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __46__IntentHandler_handleSkipContent_completion___block_invoke;
  v14[3] = &unk_100010378;
  v15 = v5;
  v16 = v6;
  v12 = v6;
  v13 = v5;
  objc_msgSend(v9, "resolveDeviceWithIdentifier:handler:", v11, v14);

}

void __46__IntentHandler_handleSkipContent_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  double v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  id v33;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)SkipContentIntentResponse), "initWithCode:userActivity:", 4, 0);
  v8 = _TVRIntentExtensionLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v31 = v11;
      v32 = 2114;
      v33 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Resolved device for intent=%{public}@, device=%{public}@", buf, 0x16u);
    }

    v12 = objc_msgSend(*(id *)(a1 + 32), "skipCommand");
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "skipDuration"));
    v10 = v13;
    if (v12 && v13)
    {
      v14 = objc_alloc((Class)TVRCButton);
      if (v12 == (id)1)
      {
        v28 = TVRCButtonSkipIntervalKey;
        v29 = v10;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
        v16 = objc_msgSend(v14, "_initWithButtonType:hasTapAction:properties:", 6, 1, v15);
      }
      else
      {
        -[NSObject doubleValue](v10, "doubleValue", TVRCButtonSkipIntervalKey);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -v18));
        v27 = v15;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
        v16 = objc_msgSend(v14, "_initWithButtonType:hasTapAction:properties:", 7, 1, v19);

      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[TVRCButtonEvent buttonEventForButton:eventType:](TVRCButtonEvent, "buttonEventForButton:eventType:", v16, 0));
      objc_msgSend(v5, "sendButtonEvent:", v20);

      v21 = objc_msgSend(objc_alloc((Class)SkipContentIntentResponse), "initWithCode:userActivity:", 4, 0);
      v7 = v21;
    }
    else
    {
      v17 = _TVRIntentExtensionLog();
      v16 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "TVRIntentExtension: Inavlid configuration for SkipContentIntent", buf, 2u);
      }
    }

  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    __46__IntentHandler_handleWakeAppleTV_completion___block_invoke_cold_1();
  }

  v22 = _TVRIntentExtensionLog();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v31 = v24;
    v32 = 2114;
    v33 = v7;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Calling completion for intent=%{public}@, response=%{public}@", buf, 0x16u);
  }

  v25 = *(_QWORD *)(a1 + 40);
  if (v25)
    (*(void (**)(uint64_t, id))(v25 + 16))(v25, v7);

}

- (void)provideDeviceOptionsCollectionForSkipContent:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = _TVRIntentExtensionLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[IntentHandler provideDeviceOptionsCollectionForSkipContent:withCompletion:]";
    v12 = 2114;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", (uint8_t *)&v10, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVRIntentExtensionDeviceQuery sharedInstance](TVRIntentExtensionDeviceQuery, "sharedInstance"));
  objc_msgSend(v9, "provideDeviceOptionsWithCompletion:", v6);

}

- (void)resolveDeviceForSkipContent:(id)a3 withCompletion:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "device"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler _resolveDevice:](self, "_resolveDevice:", v9));
  (*((void (**)(id, void *))a4 + 2))(v7, v8);

}

- (void)resolveSkipCommandForSkipContent:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;

  v7 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[IntentHandler _resolveSkipCommand:](self, "_resolveSkipCommand:", objc_msgSend(a3, "skipCommand")));
  (*((void (**)(id, id))a4 + 2))(v7, v8);

}

- (void)resolveSkipDurationForSkipContent:(id)a3 withCompletion:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "skipDuration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler _resolveSkipDuration:](self, "_resolveSkipDuration:", v9));
  (*((void (**)(id, void *))a4 + 2))(v7, v8);

}

- (void)handleReduceLoudSounds:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = _TVRIntentExtensionLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[IntentHandler handleReduceLoudSounds:completion:]";
    v21 = 2114;
    v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVRIntentExtensionDeviceManager sharedInstance](TVRIntentExtensionDeviceManager, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "device"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __51__IntentHandler_handleReduceLoudSounds_completion___block_invoke;
  v15[3] = &unk_1000104A8;
  objc_copyWeak(&v18, (id *)buf);
  v13 = v6;
  v16 = v13;
  v14 = v7;
  v17 = v14;
  objc_msgSend(v10, "resolveDeviceWithIdentifier:handler:", v12, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);

}

void __51__IntentHandler_handleReduceLoudSounds_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  id v6;
  NSObject *v7;
  __CFString *v8;
  id v9;
  void *v10;
  unsigned int v11;
  __CFString *v12;
  __CFString *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  __CFString *v25;
  uint8_t buf[4];
  __CFString *v27;
  __int16 v28;
  id v29;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = objc_msgSend(objc_alloc((Class)ReduceLoudSoundsIntentResponse), "initWithCode:userActivity:", 4, 0);
  if (v3)
  {
    v6 = _TVRIntentExtensionLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(__CFString **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v27 = v8;
      v28 = 2114;
      v29 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Resolved device for intent=%{public}@, device=%{public}@", buf, 0x16u);
    }

    if (WeakRetained)
    {
      v9 = objc_msgSend(objc_alloc((Class)TVRCDeviceEventManager), "initWithDevice:responseHandler:", v3, &__block_literal_global_58);
      objc_msgSend(WeakRetained, "setEventManager:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "toggle"));
      v11 = objc_msgSend(v10, "BOOLValue");
      v12 = CFSTR("NO");
      if (v11)
        v12 = CFSTR("YES");
      v13 = v12;
      v14 = _TVRIntentExtensionLog();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v27 = v13;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Sending TVRCToggleReduceLoudSounds with value=%{public}@", buf, 0xCu);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "eventManager"));
      v17 = TVRCToggleReduceLoudSounds;
      v24 = TVRCReduceLoundSoundsEnabled;
      v25 = v13;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
      objc_msgSend(v16, "sendEvent:options:", v17, v18);

      v19 = objc_msgSend(objc_alloc((Class)ReduceLoudSoundsIntentResponse), "initWithCode:userActivity:", 4, 0);
      v5 = v19;
    }
  }
  v20 = _TVRIntentExtensionLog();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = *(__CFString **)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v27 = v22;
    v28 = 2114;
    v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Calling completion for intent=%{public}@, response=%{public}@", buf, 0x16u);
  }

  v23 = *(_QWORD *)(a1 + 40);
  if (v23)
    (*(void (**)(uint64_t, id))(v23 + 16))(v23, v5);

}

- (void)provideDeviceOptionsCollectionForReduceLoudSounds:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = _TVRIntentExtensionLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[IntentHandler provideDeviceOptionsCollectionForReduceLoudSounds:withCompletion:]";
    v12 = 2114;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", (uint8_t *)&v10, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVRIntentExtensionDeviceQuery sharedInstance](TVRIntentExtensionDeviceQuery, "sharedInstance"));
  objc_msgSend(v9, "provideDeviceOptionsWithCompletion:", v6);

}

- (void)resolveDeviceForReduceLoudSounds:(id)a3 withCompletion:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "device"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler _resolveDevice:](self, "_resolveDevice:", v9));
  (*((void (**)(id, void *))a4 + 2))(v7, v8);

}

- (void)resolveToggleForReduceLoudSounds:(id)a3 withCompletion:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "toggle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler _resolveReduceLoudSoundsToggle:](self, "_resolveReduceLoudSoundsToggle:", v9));
  (*((void (**)(id, void *))a4 + 2))(v7, v8);

}

- (void)handleToggleSystemAppearance:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = _TVRIntentExtensionLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[IntentHandler handleToggleSystemAppearance:completion:]";
    v21 = 2114;
    v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVRIntentExtensionDeviceManager sharedInstance](TVRIntentExtensionDeviceManager, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "device"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __57__IntentHandler_handleToggleSystemAppearance_completion___block_invoke;
  v15[3] = &unk_100010510;
  v13 = v6;
  v16 = v13;
  objc_copyWeak(&v18, (id *)buf);
  v14 = v7;
  v17 = v14;
  objc_msgSend(v10, "resolveDeviceWithIdentifier:handler:", v12, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);

}

void __57__IntentHandler_handleToggleSystemAppearance_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id WeakRetained;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __CFString *v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  NSObject *v33;
  __int16 v34;
  id v35;

  v5 = a2;
  v6 = a3;
  v7 = _TVRIntentExtensionLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v31 = v9;
    v32 = 2112;
    v33 = v5;
    v34 = 2112;
    v35 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "TVRIntentExtension: Resolved device for intent %@. Device - %@. Error - %@", buf, 0x20u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v11 = objc_msgSend(objc_alloc((Class)ToggleSystemAppearanceIntentResponse), "initWithCode:userActivity:", 4, 0);
  v12 = _TVRIntentExtensionLog();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (!v5)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __46__IntentHandler_handleWakeAppleTV_completion___block_invoke_cold_1();
    goto LABEL_12;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v31 = v15;
    v32 = 2114;
    v33 = v5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Resolved device for intent=%{public}@, device=%{public}@", buf, 0x16u);
  }

  if (WeakRetained)
  {
    v16 = objc_msgSend(objc_alloc((Class)TVRCDeviceEventManager), "initWithDevice:responseHandler:", v5, &__block_literal_global_65);
    objc_msgSend(WeakRetained, "setEventManager:", v16);

    v17 = objc_msgSend(*(id *)(a1 + 32), "appearanceToggle");
    v18 = CFSTR("NO");
    if (v17 == (id)1)
      v18 = CFSTR("YES");
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "eventManager"));
    v21 = TVRCToggleSystemAppearance;
    v28 = TVRCSystemAppearanceLight;
    v29 = v19;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
    objc_msgSend(v20, "sendEvent:options:", v21, v22);

    v23 = objc_alloc((Class)ToggleSystemAppearanceIntentResponse);
    v14 = v11;
    v11 = objc_msgSend(v23, "initWithCode:userActivity:", 4, 0);
LABEL_12:

  }
  v24 = _TVRIntentExtensionLog();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v31 = v26;
    v32 = 2114;
    v33 = v11;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Calling completion for intent=%{public}@, response=%{public}@", buf, 0x16u);
  }

  v27 = *(_QWORD *)(a1 + 40);
  if (v27)
    (*(void (**)(uint64_t, NSObject *))(v27 + 16))(v27, v11);

}

- (void)provideDeviceOptionsCollectionForToggleSystemAppearance:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = _TVRIntentExtensionLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[IntentHandler provideDeviceOptionsCollectionForToggleSystemAppearance:withCompletion:]";
    v12 = 2114;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", (uint8_t *)&v10, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVRIntentExtensionDeviceQuery sharedInstance](TVRIntentExtensionDeviceQuery, "sharedInstance"));
  objc_msgSend(v9, "provideDeviceOptionsWithCompletion:", v6);

}

- (void)resolveDeviceForToggleSystemAppearance:(id)a3 withCompletion:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "device"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler _resolveDevice:](self, "_resolveDevice:", v9));
  (*((void (**)(id, void *))a4 + 2))(v7, v8);

}

- (void)resolveAppearanceToggleForToggleSystemAppearance:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;

  v7 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[IntentHandler _resolveSystemAppearanceToggle:](self, "_resolveSystemAppearanceToggle:", objc_msgSend(a3, "appearanceToggle")));
  (*((void (**)(id, id))a4 + 2))(v7, v8);

}

- (id)_resolveDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

    if (v5)
      v6 = objc_claimAutoreleasedReturnValue(+[TVRDeviceResolutionResult successWithResolvedDevice:](TVRDeviceResolutionResult, "successWithResolvedDevice:", v4));
    else
      v6 = objc_claimAutoreleasedReturnValue(+[TVRDeviceResolutionResult confirmationRequiredWithDeviceToConfirm:](TVRDeviceResolutionResult, "confirmationRequiredWithDeviceToConfirm:", v4));
  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(+[TVRDeviceResolutionResult notRequired](TVRDeviceResolutionResult, "notRequired"));
  }
  v7 = (void *)v6;

  return v7;
}

- (id)_resolveApplication:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

    if (v5)
      v6 = objc_claimAutoreleasedReturnValue(+[TVRApplicationResolutionResult successWithResolvedApplication:](TVRApplicationResolutionResult, "successWithResolvedApplication:", v4));
    else
      v6 = objc_claimAutoreleasedReturnValue(+[TVRApplicationResolutionResult confirmationRequiredWithApplicationToConfirm:](TVRApplicationResolutionResult, "confirmationRequiredWithApplicationToConfirm:", v4));
  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(+[TVRApplicationResolutionResult notRequired](TVRApplicationResolutionResult, "notRequired"));
  }
  v7 = (void *)v6;

  return v7;
}

- (id)_resolveMediaCommand:(int64_t)a3
{
  void *v3;

  if (a3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVRMediaCommandResolutionResult successWithResolvedMediaCommand:](TVRMediaCommandResolutionResult, "successWithResolvedMediaCommand:"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVRMediaCommandResolutionResult confirmationRequiredWithMediaCommandToConfirm:](TVRMediaCommandResolutionResult, "confirmationRequiredWithMediaCommandToConfirm:"));
  return v3;
}

- (id)_resolveCaptionsToggle:(int64_t)a3
{
  if ((unint64_t)a3 <= 1)
    a3 = 1;
  return (id)objc_claimAutoreleasedReturnValue(+[TVRCaptionsToggleResolutionResult successWithResolvedCaptionsToggle:](TVRCaptionsToggleResolutionResult, "successWithResolvedCaptionsToggle:", a3));
}

- (id)_resolveUserAccount:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

    if (v5)
      v6 = objc_claimAutoreleasedReturnValue(+[TVRUserAccountResolutionResult successWithResolvedUserAccount:](TVRUserAccountResolutionResult, "successWithResolvedUserAccount:", v4));
    else
      v6 = objc_claimAutoreleasedReturnValue(+[TVRUserAccountResolutionResult confirmationRequiredWithUserAccountToConfirm:](TVRUserAccountResolutionResult, "confirmationRequiredWithUserAccountToConfirm:", v4));
  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(+[TVRUserAccountResolutionResult notRequired](TVRUserAccountResolutionResult, "notRequired"));
  }
  v7 = (void *)v6;

  return v7;
}

- (id)_resolveSkipCommand:(int64_t)a3
{
  void *v3;

  if (a3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVRSkipCommandResolutionResult successWithResolvedSkipCommand:](TVRSkipCommandResolutionResult, "successWithResolvedSkipCommand:"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVRSkipCommandResolutionResult confirmationRequiredWithSkipCommandToConfirm:](TVRSkipCommandResolutionResult, "confirmationRequiredWithSkipCommandToConfirm:"));
  return v3;
}

- (id)_resolveSkipDuration:(id)a3
{
  id v3;
  void *v4;
  double v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "doubleValue"), v5 >= 0.0))
  {
    objc_msgSend(v4, "doubleValue");
    v6 = objc_claimAutoreleasedReturnValue(+[SkipContentSkipDurationResolutionResult successWithResolvedValue:](SkipContentSkipDurationResolutionResult, "successWithResolvedValue:"));
  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(+[SkipContentSkipDurationResolutionResult confirmationRequiredWithValueToConfirm:](SkipContentSkipDurationResolutionResult, "confirmationRequiredWithValueToConfirm:", v4));
  }
  v7 = (void *)v6;

  return v7;
}

- (id)_resolveReduceLoudSoundsToggle:(id)a3
{
  void *v3;

  if (a3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[INBooleanResolutionResult successWithResolvedValue:](INBooleanResolutionResult, "successWithResolvedValue:", objc_msgSend(a3, "BOOLValue")));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[INBooleanResolutionResult confirmationRequiredWithValueToConfirm:](INBooleanResolutionResult, "confirmationRequiredWithValueToConfirm:"));
  return v3;
}

- (id)_resolveSystemAppearanceToggle:(int64_t)a3
{
  void *v3;

  if (a3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVRSystemAppearanceToggleResolutionResult successWithResolvedSystemAppearanceToggle:](TVRSystemAppearanceToggleResolutionResult, "successWithResolvedSystemAppearanceToggle:"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVRSystemAppearanceToggleResolutionResult confirmationRequiredWithSystemAppearanceToggleToConfirm:](TVRSystemAppearanceToggleResolutionResult, "confirmationRequiredWithSystemAppearanceToggleToConfirm:"));
  return v3;
}

- (TVRCDeviceEventManager)eventManager
{
  return self->_eventManager;
}

- (void)setEventManager:(id)a3
{
  objc_storeStrong((id *)&self->_eventManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventManager, 0);
}

void __46__IntentHandler_handleWakeAppleTV_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(__stack_chk_guard);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Error resolving device for intent=%{public}@, error=%{public}@");
  OUTLINED_FUNCTION_3();
}

- (void)confirmLaunchTVApp:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;

  v2 = 136315394;
  v3 = "-[IntentHandler confirmLaunchTVApp:completion:]";
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s called with invalid device=%{public}@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_3();
}

void __52__IntentHandler_handleLaunchApplication_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Error resolving device for intent=%{public}@, error=%{public}@");
  OUTLINED_FUNCTION_3();
}

- (void)provideApplicationOptionsCollectionForLaunchApplication:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "Device not found  error=%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __88__IntentHandler_provideApplicationOptionsCollectionForLaunchApplication_withCompletion___block_invoke_36_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "Event manager error=%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __52__IntentHandler_handleSwitchUserAccount_completion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Switch user account intent failed", v1, 2u);
}

- (void)provideAccountOptionsCollectionForSwitchUserAccount:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "Invalid Apple TV, error=%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __84__IntentHandler_provideAccountOptionsCollectionForSwitchUserAccount_withCompletion___block_invoke_50_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "Device not found, error=%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
