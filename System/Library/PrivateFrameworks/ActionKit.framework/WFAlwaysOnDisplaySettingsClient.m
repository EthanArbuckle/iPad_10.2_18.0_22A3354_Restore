@implementation WFAlwaysOnDisplaySettingsClient

- (BOOL)alwaysOnDisplayState
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 1;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("SBEnableAlwaysOn"), CFSTR("com.apple.springboard"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 0;
  return !v3;
}

- (void)getStateWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  void (**v6)(id, BOOL, _QWORD);

  v6 = (void (**)(id, BOOL, _QWORD))a3;
  if (+[WFAlwaysOnDisplaySettingsClient canRunIntent](WFAlwaysOnDisplaySettingsClient, "canRunIntent"))
  {
    v6[2](v6, -[WFAlwaysOnDisplaySettingsClient alwaysOnDisplayState](self, "alwaysOnDisplayState"), 0);
    v4 = v6;
  }
  else
  {
    WFSettingsClientError();
    v5 = objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v5);

    v4 = (void *)v5;
  }

}

- (void)setState:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void (**v5)(id, _QWORD);
  void *v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v4 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, _QWORD))a4;
  if (+[WFAlwaysOnDisplaySettingsClient canRunIntent](WFAlwaysOnDisplaySettingsClient, "canRunIntent"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.springboard"));
    objc_msgSend(v6, "setBool:forKey:", v4, CFSTR("SBEnableAlwaysOn"));
    getWFBundledIntentsLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[WFAlwaysOnDisplaySettingsClient setState:completionHandler:]";
      v11 = 1024;
      v12 = v4;
      _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_DEFAULT, "%s Shortcuts action set Always On enabled to: %i", buf, 0x12u);
    }

    v5[2](v5, 0);
  }
  else
  {
    WFSettingsClientError();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    ((void (*)(void (**)(id, _QWORD)))v5[2])(v5);

  }
}

+ (void)createClientWithCompletionHandler:(id)a3
{
  void (**v3)(id, WFAlwaysOnDisplaySettingsClient *, _QWORD);
  WFAlwaysOnDisplaySettingsClient *v4;

  v3 = (void (**)(id, WFAlwaysOnDisplaySettingsClient *, _QWORD))a3;
  if (+[WFAlwaysOnDisplaySettingsClient canRunIntent](WFAlwaysOnDisplaySettingsClient, "canRunIntent"))
  {
    v4 = objc_alloc_init(WFAlwaysOnDisplaySettingsClient);
    v3[2](v3, v4, 0);
  }
  else
  {
    WFSettingsClientError();
    v4 = (WFAlwaysOnDisplaySettingsClient *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, WFAlwaysOnDisplaySettingsClient *, WFAlwaysOnDisplaySettingsClient *))v3)[2](v3, 0, v4);
  }

}

+ (BOOL)canRunIntent
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = !objc_msgSend(v2, "idiom") && (objc_msgSend(v2, "hasCapability:", *MEMORY[0x24BEC1840]) & 1) != 0;

  return v3;
}

+ (id)filteredPublisherForAlwaysOnPublisher:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  _QWORD v7[3];
  int v8;

  v3 = a3;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v8 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __73__WFAlwaysOnDisplaySettingsClient_filteredPublisherForAlwaysOnPublisher___block_invoke;
  v6[3] = &unk_24F8B05C0;
  v6[4] = v7;
  objc_msgSend(v3, "filterWithIsIncluded:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v7, 8);

  return v4;
}

+ (id)alwaysOnPublisher
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  BiomeLibrary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "Device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "Display");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "AlwaysOn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "publisher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filteredPublisherForAlwaysOnPublisher:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)reverseAlwaysOnPublisher
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  BiomeLibrary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "Device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "Display");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "AlwaysOn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC4018], "reversePublisherOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "publisherWithOptions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filteredPublisherForAlwaysOnPublisher:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)reversalArbiter
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BEC4018]);
  objc_msgSend(a1, "alwaysOnPublisher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "reverseAlwaysOnPublisher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithPublisher:reversePublisher:", v4, v5);

  return v6;
}

+ (void)getBookmarkForCurrentStateWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(a1, "reversalArbiter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __83__WFAlwaysOnDisplaySettingsClient_getBookmarkForCurrentStateWithCompletionHandler___block_invoke;
  v7[3] = &unk_24F8B5BE0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getBookmarkForCurrentStateWithCompletionHandler:", v7);

}

+ (void)getReversalStateWithBookmark:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "reversalArbiter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "biomeBookmark");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __82__WFAlwaysOnDisplaySettingsClient_getReversalStateWithBookmark_completionHandler___block_invoke;
  v11[3] = &unk_24F8B05E8;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v8, "getReversalStateWithBookmark:completionHandler:", v9, v11);

}

void __82__WFAlwaysOnDisplaySettingsClient_getReversalStateWithBookmark_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  _BOOL8 v3;
  uint64_t v4;
  id v5;

  if (a2)
  {
    v3 = objc_msgSend(a2, "userSetState") == 1;
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v4 + 16))(v4, v5, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __83__WFAlwaysOnDisplaySettingsClient_getBookmarkForCurrentStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  if (v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC4020]), "initWithBiomeBookmark:", v5);
    (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v7, 0);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 16))(v6, 0, a3);
  }

}

uint64_t __73__WFAlwaysOnDisplaySettingsClient_filteredPublisherForAlwaysOnPublisher___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  int v5;
  uint64_t v6;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v5 = objc_msgSend(v3, "userSetState");
  if (!v4)
    goto LABEL_5;
  if (v4 != v5)
  {
    v5 = objc_msgSend(v3, "userSetState");
LABEL_5:
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
    v6 = 1;
    goto LABEL_6;
  }
  v6 = 0;
LABEL_6:

  return v6;
}

@end
