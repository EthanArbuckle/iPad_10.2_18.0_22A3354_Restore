@implementation FontProviderManager

- (FontProviderManager)init
{
  FontProviderManager *v2;
  FontProviderManager *v3;
  uint64_t v4;
  NSDictionary *appSubscriptionIndo;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FontProviderManager;
  v2 = -[FontProviderManager init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[FontProviderManager appSubscriotionInfo](v2, "appSubscriotionInfo");
    v4 = objc_claimAutoreleasedReturnValue();
    appSubscriptionIndo = v3->_appSubscriptionIndo;
    v3->_appSubscriptionIndo = (NSDictionary *)v4;

  }
  return v3;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_4);
  return (id)sharedManager_manager;
}

void __36__FontProviderManager_sharedManager__block_invoke()
{
  FontProviderManager *v0;
  void *v1;

  GSFontInitialize();
  v0 = objc_alloc_init(FontProviderManager);
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;

}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  void *v4;
  void *v5;
  $115C4C562B26FF47E01F9F4EA65B5887 *result;
  id v7;

  -[FontProviderManager ping](self, "ping");
  +[FontProviderManager sharedManager](FontProviderManager, "sharedManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "auditToken");
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

- (NSXPCConnection)connection
{
  FontProviderManager *v2;
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  uint64_t v5;
  NSXPCConnection *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[5];

  v2 = self;
  objc_sync_enter(v2);
  connection = v2->_connection;
  if (connection)
  {
    v4 = connection;
  }
  else
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.FontServices.FontProviderLoader"));
    v6 = v2->_connection;
    v2->_connection = (NSXPCConnection *)v5;

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __33__FontProviderManager_connection__block_invoke;
    v19[3] = &unk_1E612C2A0;
    v19[4] = v2;
    -[NSXPCConnection setInvalidationHandler:](v2->_connection, "setInvalidationHandler:", v19);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEEB9FE8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_registerFonts_enabled_sceneID_appInfo_completionHandler_, 0, 0);
    objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_registerFonts_enabled_sceneID_appInfo_completionHandler_, 0, 1);
    objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_registerFonts_enabled_sceneID_appInfo_completionHandler_, 1, 1);
    objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_unregisterFonts_appInfo_completionHandler_, 0, 0);
    objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_unregisterFonts_appInfo_completionHandler_, 0, 1);
    objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_unregisterFonts_appInfo_completionHandler_, 1, 1);
    objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_registeredFontsInfo_appInfo_completionHandler_, 0, 1);
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v7);
    -[NSXPCConnection resume](v2->_connection, "resume");
    v4 = v2->_connection;

  }
  objc_sync_exit(v2);

  return v4;
}

void __33__FontProviderManager_connection__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  void *v10;
  uint64_t v11;

  FSLog_Debug(CFSTR("FontProvider"), CFSTR("XPC connection for 'com.apple.FontServices.FontProviderLoader' was invalidated"), a3, a4, a5, a6, a7, a8, v11);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 8);
  *(_QWORD *)(v9 + 8) = 0;

}

- (id)normalizeURLs:(id)a3 addSandboxExtension:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  uint64_t v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v4 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v32 = 0u;
  v33 = 0u;
  v7 = v4;
  if (v4)
    -[FontProviderManager auditToken](self, "auditToken");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v13, "objectForKey:", CFSTR("NSCTFontFileURLAttribute"));
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)v14;
          v16 = (void *)objc_msgSend(v13, "mutableCopy");
          objc_msgSend(v15, "absoluteURL");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "URLByStandardizingPath");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "setObject:forKey:", v18, CFSTR("NSCTFontFileURLAttribute"));
          if (v7)
          {
            objc_msgSend(v18, "path");
            v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v20 = objc_msgSend(v19, "UTF8String");

            v25 = v20;
            if (sandbox_check_by_audit_token())
            {
              v21 = (const char *)sandbox_extension_issue_file_to_process();
              if (v21)
              {
                objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v21, strlen(v21) + 1, 1, v20);
                v22 = objc_claimAutoreleasedReturnValue();
                if (v22)
                {
                  v23 = (void *)v22;
                  objc_msgSend(v16, "setValue:forKey:", v22, CFSTR("sandbox"));

                }
              }
            }
          }
          objc_msgSend(v8, "addObject:", v16, v25);

        }
        else
        {
          objc_msgSend(v8, "addObject:", v13);
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v10);
  }

  return v8;
}

+ (void)registerFonts:(id)a3 enabled:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v9 = a3;
  v7 = a5;
  +[FontProviderManager updateAppInfo](FontProviderManager, "updateAppInfo");
  if (objc_msgSend(v9, "count"))
  {
    +[FontProviderManager sharedManager](FontProviderManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_registerFonts:enabled:completionHandler:", v9, v6, v7);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, MEMORY[0x1E0C9AA60], 0);
  }

}

- (void)_registerFonts:(id)a3 enabled:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSDictionary *appSubscriptionIndo;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[FontProviderManager connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __64__FontProviderManager__registerFonts_enabled_completionHandler___block_invoke;
  v24[3] = &unk_1E612C5D0;
  v12 = v9;
  v25 = v12;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0;
  v28 = &v27;
  v29 = 0x2050000000;
  v14 = (void *)getUIWindowClass_softClass_0;
  v30 = getUIWindowClass_softClass_0;
  if (!getUIWindowClass_softClass_0)
  {
    v26[0] = v11;
    v26[1] = 3221225472;
    v26[2] = __getUIWindowClass_block_invoke_0;
    v26[3] = &unk_1E612C590;
    v26[4] = &v27;
    __getUIWindowClass_block_invoke_0((uint64_t)v26);
    v14 = (void *)v28[3];
  }
  v15 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v27, 8);
  objc_msgSend(v15, "_applicationKeyWindow");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "windowScene");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_sceneIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  NSLog(CFSTR("FontProvider: got sceneID: %@"), v18);
  -[FontProviderManager normalizeURLs:addSandboxExtension:](self, "normalizeURLs:addSandboxExtension:", v8, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  appSubscriptionIndo = self->_appSubscriptionIndo;
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = __64__FontProviderManager__registerFonts_enabled_completionHandler___block_invoke_2;
  v22[3] = &unk_1E612C810;
  v23 = v12;
  v21 = v12;
  objc_msgSend(v13, "registerFonts:enabled:sceneID:appInfo:completionHandler:", v19, v6, v18, appSubscriptionIndo, v22);

}

void __64__FontProviderManager__registerFonts_enabled_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v6[0] = a2;
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = a2;
    objc_msgSend(v3, "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v2 + 16))(v2, v5, 0);

  }
}

void __64__FontProviderManager__registerFonts_enabled_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.FontServices.FontProviderDidChange"), 0, 0, 0);
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);

}

+ (void)unregisterFonts:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  +[FontProviderManager updateAppInfo](FontProviderManager, "updateAppInfo");
  if (objc_msgSend(v7, "count"))
  {
    +[FontProviderManager sharedManager](FontProviderManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_unregisterFonts:completionHandler:", v7, v5);

  }
  else if (v5)
  {
    (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, MEMORY[0x1E0C9AA60], 0);
  }

}

- (void)_unregisterFonts:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  NSDictionary *appSubscriptionIndo;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v6 = a4;
  v7 = a3;
  +[FontProviderManager sharedManager](FontProviderManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __58__FontProviderManager__unregisterFonts_completionHandler___block_invoke;
  v18[3] = &unk_1E612C5D0;
  v11 = v6;
  v19 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[FontProviderManager normalizeURLs:addSandboxExtension:](self, "normalizeURLs:addSandboxExtension:", v7, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  appSubscriptionIndo = self->_appSubscriptionIndo;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __58__FontProviderManager__unregisterFonts_completionHandler___block_invoke_2;
  v16[3] = &unk_1E612C810;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v12, "unregisterFonts:appInfo:completionHandler:", v13, appSubscriptionIndo, v16);

}

void __58__FontProviderManager__unregisterFonts_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v6[0] = a2;
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = a2;
    objc_msgSend(v3, "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v2 + 16))(v2, v5, 0);

  }
}

void __58__FontProviderManager__unregisterFonts_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.FontServices.FontProviderDidChange"), 0, 0, 0);
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);

}

+ (id)registeredFontsInfo:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[FontProviderManager updateAppInfo](FontProviderManager, "updateAppInfo");
  +[FontProviderManager sharedManager](FontProviderManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registeredFontsInfo:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)registeredFontsInfo:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  NSDictionary *appSubscriptionIndo;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a3;
  -[FontProviderManager connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_39);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  appSubscriptionIndo = self->_appSubscriptionIndo;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__FontProviderManager_registeredFontsInfo___block_invoke_42;
  v10[3] = &unk_1E612C858;
  v10[4] = &v11;
  objc_msgSend(v6, "registeredFontsInfo:appInfo:completionHandler:", v3, appSubscriptionIndo, v10);
  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __43__FontProviderManager_registeredFontsInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("xpc error: %s - %@"), "-[FontProviderManager registeredFontsInfo:]_block_invoke", a2);
}

void __43__FontProviderManager_registeredFontsInfo___block_invoke_42(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)ping
{
  void *v2;
  id v3;

  -[FontProviderManager connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_44);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "ping:", &__block_literal_global_45);
}

void __27__FontProviderManager_ping__block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("xpc error: %s - %@"), "-[FontProviderManager ping]_block_invoke", a2);
}

+ (void)updateAppInfo
{
  if (updateAppInfo_onceToken != -1)
    dispatch_once(&updateAppInfo_onceToken, &__block_literal_global_46);
}

void __36__FontProviderManager_updateAppInfo__block_invoke()
{
  id v0;

  +[FontProviderManager sharedManager](FontProviderManager, "sharedManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_updateAppInfo");

}

- (void)_updateAppInfo
{
  void *v3;
  id v4;

  -[FontProviderManager connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_47);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "updateAppInfo:", self->_appSubscriptionIndo);
}

void __37__FontProviderManager__updateAppInfo__block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("xpc error: %s - %@"), "-[FontProviderManager _updateAppInfo]_block_invoke", a2);
}

- (id)appSubscriotionInfo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  char isKindOfClass;
  __CFString *v15;
  void *v16;
  void *v17;
  BOOL v18;
  int v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  uint64_t v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "objectForKey:", CFSTR("FontProviderSubscriptionSupportInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v40 = v4;
      objc_msgSend(v5, "objectForKey:", CFSTR("url"));
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v7 = 0;
      }
      else
      {
        NSLog(CFSTR("FontProvider subscription support: url is missing"));
        v7 = 1;
      }
      objc_msgSend(v5, "objectForKey:", CFSTR("scheme"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v42 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        NSLog(CFSTR("FontProvider subscription support: scheme is missing"));
        v7 = 1;
      }
      v43 = (void *)v6;
      v41 = v3;
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v8 = objc_msgSend(&unk_1E6130660, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v53;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v53 != v10)
              objc_enumerationMutation(&unk_1E6130660);
            v12 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
            objc_msgSend(v5, "objectForKey:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v13)
            {
              v15 = CFSTR("FontProvider subscription support: \"%@\" is missing");
LABEL_19:
              NSLog(&v15->isa, v12);
              v7 = 1;
              goto LABEL_20;
            }
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();
            v15 = CFSTR("FontProvider subscription support: \"%@\" should be number");
            if ((isKindOfClass & 1) == 0)
              goto LABEL_19;
LABEL_20:

          }
          v9 = objc_msgSend(&unk_1E6130660, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
        }
        while (v9);
      }
      objc_msgSend(v5, "objectForKey:", CFSTR("test"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        NSLog(CFSTR("FontProvider subscription support: \"%@\" should be number"), CFSTR("test"));
        v3 = v41;
        v17 = v43;
      }
      else
      {
        v17 = v43;
        if (v43)
          v18 = v42 == 0;
        else
          v18 = 1;
        v19 = v18;
        v3 = v41;
        if (((v19 | v7) & 1) == 0)
        {
          v39 = v16;
          objc_msgSend(v41, "objectForKey:", *MEMORY[0x1E0C9AB38]);
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v20 = (id)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v49;
            v24 = *MEMORY[0x1E0C9AB28];
            v25 = *MEMORY[0x1E0C9AB30];
            while (2)
            {
              for (j = 0; j != v22; ++j)
              {
                if (*(_QWORD *)v49 != v23)
                  objc_enumerationMutation(v20);
                v27 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
                objc_msgSend(v27, "objectForKey:", v24);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v43, "isEqualToString:", v28))
                {
                  objc_msgSend(v27, "objectForKey:", v25);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = objc_msgSend(v29, "containsObject:", v42);

                  if ((v30 & 1) != 0)
                  {

                    v31 = (void *)objc_opt_new();
                    v44 = 0u;
                    v45 = 0u;
                    v46 = 0u;
                    v47 = 0u;
                    v32 = objc_msgSend(&unk_1E6130678, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
                    v3 = v41;
                    if (v32)
                    {
                      v33 = v32;
                      v34 = *(_QWORD *)v45;
                      do
                      {
                        for (k = 0; k != v33; ++k)
                        {
                          if (*(_QWORD *)v45 != v34)
                            objc_enumerationMutation(&unk_1E6130678);
                          v36 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * k);
                          objc_msgSend(v5, "objectForKey:", v36);
                          v37 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v37)
                            objc_msgSend(v31, "setObject:forKey:", v37, v36);

                        }
                        v33 = objc_msgSend(&unk_1E6130678, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
                      }
                      while (v33);
                    }
                    objc_msgSend(v40, "setObject:forKey:", v31, CFSTR("FontProviderSubscriptionSupportInfo"));

                    v17 = v43;
                    goto LABEL_52;
                  }
                }

              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
              if (v22)
                continue;
              break;
            }
          }

          v17 = v43;
          NSLog(CFSTR("FontProvider subscription support: url \"%@\" and scheme \"%@\" not defined in kCFBundleURLNameKey"), v43, v42);
          v3 = v41;
LABEL_52:

          v16 = v39;
        }
      }

      v4 = v40;
    }
  }

  return v4;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSDictionary)appSubscriptionIndo
{
  return self->_appSubscriptionIndo;
}

- (void)setAppSubscriptionIndo:(id)a3
{
  objc_storeStrong((id *)&self->_appSubscriptionIndo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSubscriptionIndo, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
