@implementation WFAppearanceSettingsClient

- (WFAppearanceSettingsClient)initWithStyleMode:(id)a3
{
  id v6;
  WFAppearanceSettingsClient *v7;
  WFAppearanceSettingsClient *v8;
  WFAppearanceSettingsClient *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAppearanceSettingsClient.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("styleMode"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFAppearanceSettingsClient;
  v7 = -[WFAppearanceSettingsClient init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_styleMode, a3);
    v9 = v8;
  }

  return v8;
}

- (void)setAppearance:(int64_t)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD);
  NSObject *v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD))a4;
  getWFBundledIntentsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v16 = 136315394;
    v17 = "-[WFAppearanceSettingsClient setAppearance:completionHandler:]";
    v18 = 2048;
    v19 = a3;
    _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_INFO, "%s Applying device appearance style %ld", (uint8_t *)&v16, 0x16u);
  }

  if (a3)
  {
    -[WFAppearanceSettingsClient styleMode](self, "styleMode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "modeValue");
    v10 = softLinkUISUserInterfaceStyleModeValueIsAutomatic(v9);

    if (a3 == 1)
      v11 = 2;
    else
      v11 = 1;
    -[WFAppearanceSettingsClient styleMode](self, "styleMode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v10)
      objc_msgSend(v12, "setOverride:", v11, 1);
    else
      objc_msgSend(v12, "setModeValue:", v11);

    v6[2](v6, 0);
  }
  else
  {
    getWFBundledIntentsLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315138;
      v17 = "-[WFAppearanceSettingsClient setAppearance:completionHandler:]";
      _os_log_impl(&dword_22D353000, v14, OS_LOG_TYPE_ERROR, "%s Tried to set unknown appearance!", (uint8_t *)&v16, 0xCu);
    }

    WFSettingsClientError();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v6)[2](v6, v15);

  }
}

- (int64_t)currentAppearance
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  int64_t v5;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  getUISCurrentUserInterfaceStyleValueClass();
  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(v2, "userInterfaceStyle");
  getWFBundledIntentsLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[WFAppearanceSettingsClient currentAppearance]";
    v9 = 2048;
    v10 = v3;
    _os_log_impl(&dword_22D353000, v4, OS_LOG_TYPE_INFO, "%s Retrieved current appearance: %ld", (uint8_t *)&v7, 0x16u);
  }

  if (v3 == 2)
    v5 = 1;
  else
    v5 = 2 * (v3 == 1);

  return v5;
}

- (void)getStateWithCompletionHandler:(id)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  void (*v7)(void);
  id v8;

  v8 = a3;
  v4 = -[WFAppearanceSettingsClient currentAppearance](self, "currentAppearance");
  if (v4 == 2)
  {
    v7 = (void (*)(void))*((_QWORD *)v8 + 2);
LABEL_7:
    v7();
    goto LABEL_8;
  }
  if (v4 == 1)
  {
    v7 = (void (*)(void))*((_QWORD *)v8 + 2);
    goto LABEL_7;
  }
  v5 = v8;
  if (!v4)
  {
    WFSettingsClientError();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v6);

LABEL_8:
    v5 = v8;
  }

}

- (void)setState:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__WFAppearanceSettingsClient_setState_completionHandler___block_invoke;
  v8[3] = &unk_24F8B5BB8;
  v8[4] = self;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  -[WFAppearanceSettingsClient getStateWithCompletionHandler:](self, "getStateWithCompletionHandler:", v8);

}

- (UISUserInterfaceStyleMode)styleMode
{
  return self->_styleMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleMode, 0);
}

void __57__WFAppearanceSettingsClient_setState_completionHandler___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x24BE0C3B0]);
    if (a2)
      v6 = 2;
    else
      v6 = 1;
    v10 = (id)objc_msgSend(v5, "initWithState:reason:", v6, 0);
    objc_msgSend((id)objc_opt_class(), "appearanceStream");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "source");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendEvent:", v10);

    if (*(_BYTE *)(a1 + 48))
      v9 = 1;
    else
      v9 = 2;
    objc_msgSend(*(id *)(a1 + 32), "setAppearance:completionHandler:", v9, *(_QWORD *)(a1 + 40));

  }
}

+ (void)createClientWithCompletionHandler:(id)a3
{
  Class (__cdecl *v4)();
  void (**v5)(id, void *, _QWORD);
  void *v6;
  id v7;

  v4 = (Class (__cdecl *)())getUISUserInterfaceStyleModeClass;
  v5 = (void (**)(id, void *, _QWORD))a3;
  v7 = (id)objc_msgSend(objc_alloc(v4()), "initWithDelegate:", 0);
  if (v7)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStyleMode:", v7);
    v5[2](v5, v6, 0);
  }
  else
  {
    WFSettingsClientError();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v5)[2](v5, 0, v6);
  }

}

+ (id)appearanceStream
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  BiomeLibrary();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "Device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "Display");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "Appearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)reversalArbiter
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BEC4018]);
  objc_msgSend(a1, "appearanceStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithBiomeStream:", v4);

  return v5;
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
  v7[2] = __78__WFAppearanceSettingsClient_getBookmarkForCurrentStateWithCompletionHandler___block_invoke;
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
  v11[2] = __77__WFAppearanceSettingsClient_getReversalStateWithBookmark_completionHandler___block_invoke;
  v11[3] = &unk_24F8B5C08;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v8, "getReversalStateWithBookmark:completionHandler:", v9, v11);

}

void __77__WFAppearanceSettingsClient_getReversalStateWithBookmark_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  _BOOL8 v3;
  uint64_t v4;
  id v5;

  if (a2)
  {
    v3 = objc_msgSend(a2, "state") == 2;
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

void __78__WFAppearanceSettingsClient_getBookmarkForCurrentStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
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

@end
