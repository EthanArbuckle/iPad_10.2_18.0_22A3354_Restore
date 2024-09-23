@implementation GKRemoteUIController

+ (id)remoteUIController
{
  return objc_alloc_init((Class)a1);
}

- (GKRemoteUIController)initWithObjectModel:(id)a3
{
  id v4;
  GKRemoteUIController *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *playerID;
  uint64_t v10;
  NSString *appleID;
  NSMutableArray *v12;
  NSMutableArray *objectModels;
  void *v14;
  objc_class *v15;
  RUILoader *v16;
  RUILoader *loader;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  GKRemoteUIController *v23;
  objc_super v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)GKRemoteUIController;
  v5 = -[GKRemoteUIController init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v5->_playerForRemoteUI, v6);
    objc_msgSend(v6, "internal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playerID");
    v8 = objc_claimAutoreleasedReturnValue();
    playerID = v5->_playerID;
    v5->_playerID = (NSString *)v8;

    objc_msgSend(v6, "accountName");
    v10 = objc_claimAutoreleasedReturnValue();
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objectModels = v5->_objectModels;
    v5->_objectModels = v12;

    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v14 = (void *)getRUILoaderClass_softClass;
    v30 = getRUILoaderClass_softClass;
    if (!getRUILoaderClass_softClass)
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __getRUILoaderClass_block_invoke;
      v26[3] = &unk_1E59C4690;
      v26[4] = &v27;
      __getRUILoaderClass_block_invoke((uint64_t)v26);
      v14 = (void *)v28[3];
    }
    v15 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v27, 8);
    v16 = (RUILoader *)objc_alloc_init(v15);
    loader = v5->_loader;
    v5->_loader = v16;

    v5->_shouldApplyGameCenterTheme = 1;
    v5->_isServerAuthenticated = 1;
    v5->_layoutStyle = -[GKRemoteUIController preferredLayoutStyle](v5, "preferredLayoutStyle");
    v5->_previousUseCustomBackButtonActionValue = objc_msgSend(MEMORY[0x1E0DC3A28], "_useCustomBackButtonAction");
    objc_msgSend(MEMORY[0x1E0DC3A28], "_setUseCustomBackButtonAction:", 1);
    if ((objc_msgSend(MEMORY[0x1E0DC3A28], "_useCustomBackButtonAction") & 1) == 0)
    {
      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Must have custom back button action"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/RemoteUI/GKRemoteUIController.m");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastPathComponent");
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%@ (useCustomBackButtonAction == YES)\n[%s (%s:%d)]"), v19, "-[GKRemoteUIController initWithObjectModel:]", objc_msgSend(v21, "UTF8String"), 134);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v22);
    }
    -[RUILoader setDelegate:](v5->_loader, "setDelegate:", v5);
    if (v4)
      -[GKRemoteUIController pushObjectModel:animated:](v5, "pushObjectModel:animated:", v4, 0);
    v23 = v5;

  }
  return v5;
}

- (GKRemoteUIController)init
{
  return -[GKRemoteUIController initWithObjectModel:](self, "initWithObjectModel:", 0);
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
  NSString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *altDSID;
  NSString *v13;

  v5 = (NSString *)a3;
  if (self->_appleID != v5)
  {
    v13 = v5;
    objc_storeStrong((id *)&self->_appleID, a3);
    if (self->_appleID)
    {
      objc_msgSend(MEMORY[0x1E0D253B0], "shared");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "environment");

      objc_msgSend(MEMORY[0x1E0D253A0], "sharedController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLocalPlayer internal](self->_playerForRemoteUI, "internal");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "credentialForPlayer:environment:", v9, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "altDSID");
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      altDSID = self->_altDSID;
      self->_altDSID = v11;

    }
    else
    {
      -[GKRemoteUIController setAltDSID:](self, "setAltDSID:", 0);
    }
    v5 = v13;
  }

}

- (void)updateAccountAndMarkComplete:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void (**v6)(_QWORD);
  NSObject **v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  void (**v26)(_QWORD);
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v4 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a4;
  v7 = (NSObject **)MEMORY[0x1E0D25460];
  v8 = *MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
  {
    v9 = (id)GKOSLoggers();
    v8 = *v7;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = v8;
    -[GKRemoteUIController authToken](self, "authToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKRemoteUIController appleID](self, "appleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKRemoteUIController playerID](self, "playerID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v28 = v11;
    v29 = 2112;
    v30 = v12;
    v31 = 2112;
    v32 = v13;
    _os_log_impl(&dword_1AB361000, v10, OS_LOG_TYPE_INFO, "Updating account with authToken = “%@”, appleID = “%@”, playerID = “%@”", buf, 0x20u);

  }
  -[GKRemoteUIController authToken](self, "authToken");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "length"))
    goto LABEL_10;
  -[GKRemoteUIController appleID](self, "appleID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "length"))
  {

LABEL_10:
    goto LABEL_11;
  }
  -[GKRemoteUIController playerID](self, "playerID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  if (!v17)
  {
LABEL_11:
    v6[2](v6);
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "accountServicePrivate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKRemoteUIController appleID](self, "appleID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKRemoteUIController playerID](self, "playerID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKRemoteUIController authToken](self, "authToken");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKRemoteUIController alias](self, "alias");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKRemoteUIController altDSID](self, "altDSID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __71__GKRemoteUIController_updateAccountAndMarkComplete_completionHandler___block_invoke;
  v25[3] = &unk_1E59C7A80;
  v26 = v6;
  objc_msgSend(v19, "accountCreated:playerID:authenticationToken:alias:altDSID:finished:handler:", v20, v21, v22, v23, v24, v4, v25);

LABEL_12:
}

void __71__GKRemoteUIController_updateAccountAndMarkComplete_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (!*MEMORY[0x1E0D25460])
      v7 = (id)GKOSLoggers();
    v8 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      __71__GKRemoteUIController_updateAccountAndMarkComplete_completionHandler___block_invoke_cold_1((uint64_t)v6, v8);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)isUserInteractionEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[GKRemoteUIController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUserInteractionEnabled");

  return v4;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[GKRemoteUIController navigationController](self, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", v3);

}

- (void)fireCompletionHandler
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  GKRemoteUIController *v6;

  if (!-[GKRemoteUIController complete](self, "complete"))
  {
    -[GKRemoteUIController setComplete:](self, "setComplete:", 1);
    -[GKRemoteUIController setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
    v6 = self;
    -[GKRemoteUIController completionHandler](v6, "completionHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[GKRemoteUIController completionHandler](v6, "completionHandler");
      v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[GKRemoteUIController error](v6, "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, GKRemoteUIController *, void *))v4)[2](v4, v6, v5);

    }
    objc_msgSend(MEMORY[0x1E0DC3A28], "_setUseCustomBackButtonAction:", -[GKRemoteUIController previousUseCustomBackButtonActionValue](v6, "previousUseCustomBackButtonActionValue"));
    -[GKRemoteUIController setCompletionHandler:](v6, "setCompletionHandler:", 0);

  }
}

- (void)presentInParentNavigationController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a4;
  v13 = a3;
  -[GKRemoteUIController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GKRemoteUIController.m"), 221, CFSTR("Can't call -presentInParentNavigationController: if the remote UI has already been presented"));

  }
  -[GKRemoteUIController setNavigationController:](self, "setNavigationController:", v13);
  objc_msgSend(v13, "viewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  -[GKRemoteUIController setStaticViewControllers:](self, "setStaticViewControllers:", v9);

  -[GKRemoteUIController objectModels](self, "objectModels");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v11, "presentInParentViewController:animated:", v13, v4);

}

- (id)addThemeInfoToAttributes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[GKRemoteUIController layoutStyle](self, "layoutStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("GKLayoutStyle"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GKRemoteUIController shouldApplyGameCenterTheme](self, "shouldApplyGameCenterTheme"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("GKApplyTheme"));

  return v4;
}

- (void)configureFromBagKey:(id)a3 player:(id)a4 withCompletionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GKRemoteUIController.m"), 245, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler!=nil"));

  }
  objc_msgSend(MEMORY[0x1E0D25298], "proxyForPlayer:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "utilityServicePrivate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __73__GKRemoteUIController_configureFromBagKey_player_withCompletionHandler___block_invoke;
  v18[3] = &unk_1E59C7AA8;
  v19 = v9;
  v20 = v11;
  v18[4] = self;
  v15 = v9;
  v16 = v11;
  objc_msgSend(v13, "getCredentialInfoAndStoreBagValuesForKeys:handler:", v14, v18);

}

void __73__GKRemoteUIController_configureFromBagKey_player_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  if (a7)
  {
    objc_msgSend(*(id *)(a1 + 32), "setError:", a7);
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(a6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "URLWithString:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setUrl:", v19);

    objc_msgSend(*(id *)(a1 + 32), "url");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      objc_msgSend(*(id *)(a1 + 32), "fallbackURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setUrl:", v21);

    }
    objc_msgSend(*(id *)(a1 + 32), "url");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(*(id *)(a1 + 32), "playerID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
        objc_msgSend(*(id *)(a1 + 32), "setPlayerID:", v13);
      objc_msgSend(*(id *)(a1 + 32), "appleID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
        objc_msgSend(*(id *)(a1 + 32), "setAppleID:", v15);
      objc_msgSend(*(id *)(a1 + 32), "setAuthToken:", v14);
      objc_msgSend(*(id *)(a1 + 32), "setPushToken:", v16);
    }
    else
    {
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v30 = *MEMORY[0x1E0CB2D50];
      GKGameCenterUIFrameworkBundle();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("GKRemoteUIErrorDomain"), 1, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setError:", v29);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)postbackDataForDictionary:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 100, 0, 0);
}

- (void)loadInitialRemoteUIWithHandler:(id)a3
{
  void *v4;
  id v5;

  -[GKRemoteUIController setLoadHandler:](self, "setLoadHandler:", a3);
  -[GKRemoteUIController setLoadingInitialUI:](self, "setLoadingInitialUI:", 1);
  -[GKRemoteUIController postBodyForInitialLoad](self, "postBodyForInitialLoad");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[GKRemoteUIController url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKRemoteUIController loadURL:postBody:](self, "loadURL:postBody:", v4, v5);

}

- (void)loadInitialRemoteUIForPlayer:(id)a3 handler:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[GKRemoteUIController setLoadHandler:](self, "setLoadHandler:", a4);
  -[GKRemoteUIController setLoadingInitialUI:](self, "setLoadingInitialUI:", 1);
  -[GKRemoteUIController postBodyForInitialLoad](self, "postBodyForInitialLoad");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[GKRemoteUIController url](self, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKRemoteUIController loadURL:forPlayer:postBody:](self, "loadURL:forPlayer:postBody:", v7, v6, v8);

}

- (void)finishLoadingWithError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__GKRemoteUIController_finishLoadingWithError___block_invoke;
  v6[3] = &unk_1E59C4708;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __47__GKRemoteUIController_finishLoadingWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setUserInteractionEnabled:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setError:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setLoading:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setLoadingInitialUI:", 0);
  objc_msgSend(*(id *)(a1 + 32), "loadHandler");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (id)v2;
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 40));
  }
  else if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "fireCompletionHandler");
  }
  objc_msgSend(*(id *)(a1 + 32), "setLoadHandler:", 0);

}

- (void)loadURL:(id)a3 forPlayer:(id)a4 postBody:(id)a5
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a4;
  if (a5)
  {
    -[GKRemoteUIController postbackDataForDictionary:](self, "postbackDataForDictionary:", a5);
    a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[GKRemoteUIController loadURL:forPlayer:postData:](self, "loadURL:forPlayer:postData:", v9, v8, a5);

}

- (void)loadURL:(id)a3 postBody:(id)a4
{
  id v6;

  v6 = a3;
  if (a4)
  {
    -[GKRemoteUIController postbackDataForDictionary:](self, "postbackDataForDictionary:", a4);
    a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[GKRemoteUIController loadURL:postData:](self, "loadURL:postData:", v6, a4);

}

- (void)didLoadURL:(id)a3 data:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v10, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      GKGameCenterUIFrameworkBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, v14);

    }
    v18 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v11, "domain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, objc_msgSend(v11, "code"), v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[GKRemoteUIController finishLoadingWithError:](self, "finishLoadingWithError:", v20);
  }
  else
  {
    if (v9)
    {
      -[GKRemoteUIController loader](self, "loader");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "loadXMLUIWithData:baseURL:", v9, v8);

      goto LABEL_10;
    }
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2D50];
    GKGameCenterUIFrameworkBundle();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("GKRemoteUIErrorDomain"), 2, v25);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[GKRemoteUIController finishLoadingWithError:](self, "finishLoadingWithError:", v11);
  }

LABEL_10:
}

- (void)loadURL:(id)a3 postData:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GKRemoteUIController.m"), 378, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url != nil"));

  }
  -[GKRemoteUIController setLoading:](self, "setLoading:", 1);
  if (objc_msgSend(v7, "isFileURL"))
  {
    v16 = 0;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v7, 1, &v16);
    v10 = v16;
    -[GKRemoteUIController didLoadURL:data:error:](self, "didLoadURL:data:error:", v7, v9, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "utilityServicePrivate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __41__GKRemoteUIController_loadURL_postData___block_invoke;
    v14[3] = &unk_1E59C7AD0;
    v14[4] = self;
    v15 = v7;
    objc_msgSend(v12, "loadDataForURL:postBody:completionHandler:", v15, v8, v14);

  }
}

uint64_t __41__GKRemoteUIController_loadURL_postData___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "didLoadURL:data:error:", *(_QWORD *)(a1 + 40), a2, a3);
}

- (void)loadURL:(id)a3 forPlayer:(id)a4 postData:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GKRemoteUIController.m"), 395, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url != nil"));

  }
  -[GKRemoteUIController setLoading:](self, "setLoading:", 1);
  if (objc_msgSend(v9, "isFileURL"))
  {
    v19 = 0;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v9, 1, &v19);
    v13 = v19;
    -[GKRemoteUIController didLoadURL:data:error:](self, "didLoadURL:data:error:", v9, v12, v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D25298], "proxyForPlayer:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "utilityServicePrivate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __51__GKRemoteUIController_loadURL_forPlayer_postData___block_invoke;
    v17[3] = &unk_1E59C7AD0;
    v17[4] = self;
    v18 = v9;
    objc_msgSend(v15, "loadDataForURL:postBody:completionHandler:", v18, v11, v17);

  }
}

uint64_t __51__GKRemoteUIController_loadURL_forPlayer_postData___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "didLoadURL:data:error:", *(_QWORD *)(a1 + 40), a2, a3);
}

- (int)preferredLayoutStyle
{
  int v2;
  int v3;
  void *v4;
  uint64_t v5;
  int v6;

  v2 = objc_msgSend(MEMORY[0x1E0D252C0], "isPreferences");
  v3 = objc_msgSend(MEMORY[0x1E0D252C0], "isGameCenter");
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v2 | v3 ^ 1)
    v6 = 1;
  else
    v6 = 2;
  if (v5 == 1)
    return v6;
  else
    return 0;
}

- (NSURL)fallbackURL
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GKRemoteUIController.m"), 427, CFSTR("Subclasses MUST implement fallbackURL"));

  return 0;
}

- (NSString)bagKey
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GKRemoteUIController.m"), 433, CFSTR("Subclasses MUST implement bagKey"));

  return 0;
}

- (id)postBodyForInitialLoad
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
}

- (void)updatePostbackDictionary:(id)a3 withHandler:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)takeValuesFromClientInfo:(id)a3 withCompletionHandler:(id)a4
{
  void (**v7)(_QWORD);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  void *v28;
  char v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;

  v56 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GKRemoteUIController.m"), 450, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler != nil"));

  }
  objc_msgSend(MEMORY[0x1E0D253B0], "shared");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("firstName"));
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("lastName"));
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("appleID"));
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("altDSID"));
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("playerID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("alias"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("authToken"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("shouldAllowNearbyMultiplayer"));
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("isAuthenticated"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v49, "isEqualToString:", CFSTR("false")))
    -[GKRemoteUIController setIsServerAuthenticated:](self, "setIsServerAuthenticated:", 0);
  v54 = (void *)v15;
  v55 = (void *)v11;
  v52 = (void *)v8;
  if (v8)
  {
    -[GKRemoteUIController firstName](self, "firstName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", v8);

    if ((v17 & 1) == 0)
    {
      -[GKRemoteUIController setFirstName:](self, "setFirstName:", v8);
      LODWORD(v8) = 1;
      if (!v9)
        goto LABEL_13;
      goto LABEL_11;
    }
    LODWORD(v8) = 0;
  }
  if (!v9)
    goto LABEL_13;
LABEL_11:
  -[GKRemoteUIController lastName](self, "lastName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", v9);

  if ((v19 & 1) == 0)
  {
    -[GKRemoteUIController setLastName:](self, "setLastName:", v9);
    LODWORD(v8) = 1;
  }
LABEL_13:
  if (v10)
  {
    -[GKRemoteUIController appleID](self, "appleID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", v10);

    if ((v21 & 1) == 0)
    {
      -[GKRemoteUIController setAppleID:](self, "setAppleID:", v10);
      LODWORD(v8) = 1;
    }
  }
  if (v55)
  {
    -[GKRemoteUIController altDSID](self, "altDSID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", v55);

    if ((v23 & 1) == 0)
    {
      -[GKRemoteUIController setAltDSID:](self, "setAltDSID:", v55);
      LODWORD(v8) = 1;
    }
  }
  if (v12)
  {
    -[GKRemoteUIController playerID](self, "playerID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqualToString:", v12);

    if ((v25 & 1) == 0)
    {
      -[GKRemoteUIController setPlayerID:](self, "setPlayerID:", v12);
      LODWORD(v8) = 1;
    }
  }
  if (v13)
  {
    -[GKRemoteUIController alias](self, "alias");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEqualToString:", v13);

    if ((v27 & 1) == 0)
    {
      -[GKRemoteUIController setAlias:](self, "setAlias:", v13);
      LODWORD(v8) = 1;
    }
  }
  v50 = (void *)v10;
  v51 = (void *)v9;
  if (v14
    && (-[GKRemoteUIController authToken](self, "authToken"),
        v28 = (void *)objc_claimAutoreleasedReturnValue(),
        v29 = objc_msgSend(v28, "isEqualToString:", v14),
        v28,
        (v29 & 1) == 0))
  {
    -[GKRemoteUIController setAuthToken:](self, "setAuthToken:", v14);
    v30 = 1;
    LODWORD(v8) = 1;
  }
  else
  {
    v30 = 0;
  }
  if (v54)
  {
    objc_msgSend(v53, "setShouldAllowNearbyMultiplayer:", objc_msgSend(v54, "BOOLValue"));
    objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "utilityServicePrivate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "refreshPreferences");

  }
  objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("authOkUrl"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("authTitle"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("authTitle"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v36, CFSTR("authTitle"));

    }
    objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("authOkUrl"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("authOkUrl"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v38, CFSTR("authOkUrl"));

    }
    objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("cancelUrl"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("cancelUrl"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v40, CFSTR("cancelUrl"));

    }
    objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("authUsername"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("authUsername"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v42, CFSTR("authUsername"));
      -[GKRemoteUIController appleID](self, "appleID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v43)
        -[GKRemoteUIController setAppleID:](self, "setAppleID:", v42);

    }
    objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("altDSID"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("altDSID"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v45, CFSTR("altDSID"));

    }
    objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("authErrorMessage"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("authErrorMessage"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v47, CFSTR("authErrorMessage"));

    }
    -[GKRemoteUIController setAuthInfo:](self, "setAuthInfo:", v34);

  }
  if ((v30 | v8) == 1)
    -[GKRemoteUIController updateAccountAndMarkComplete:completionHandler:](self, "updateAccountAndMarkComplete:completionHandler:", 0, v7);
  else
    v7[2](v7);

}

- (id)viewControllers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKRemoteUIController staticViewControllers](self, "staticViewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObjectsFromArray:", v4);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[GKRemoteUIController objectModels](self, "objectModels", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "displayedPages");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v3;
}

- (int64_t)indexOfVisiblePage
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v12;
  void *v14;

  -[GKRemoteUIController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GKRemoteUIController.m"), 562, CFSTR("Not presented, so no pages can be visible"));

  }
  -[GKRemoteUIController objectModels](self, "objectModels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKRemoteUIController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "displayedPages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  while (v10-- >= 1)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v12)
      goto LABEL_8;
  }
  v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_8:

  return v10;
}

- (void)pushObjectModel:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a4;
  v14 = a3;
  objc_msgSend(v14, "setDelegate:", self);
  -[GKRemoteUIController objectModels](self, "objectModels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultPages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  GKGameCenterUIFrameworkBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackButtonTitle:", v11);

  -[GKRemoteUIController objectModels](self, "objectModels");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v14);

  -[GKRemoteUIController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v14, "presentInParentViewController:animated:", v13, v4);

}

- (void)popObjectModelAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  _BOOL8 v10;
  id v11;
  void *v12;
  id v13;

  v3 = a3;
  -[GKRemoteUIController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GKRemoteUIController.m"), 596, CFSTR("Must be presented before popping an object model"));

  }
  -[GKRemoteUIController objectModels](self, "objectModels");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKRemoteUIController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[GKRemoteUIController indexOfVisiblePage](self, "indexOfVisiblePage");
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v9)
      v10 = 0;
    else
      v10 = v3;
    v11 = (id)objc_msgSend(v8, "popViewControllerAnimated:", v10);
  }
  objc_msgSend(v7, "setDelegate:", 0);
  objc_msgSend(v13, "removeLastObject");
  if (!objc_msgSend(v13, "count"))
    -[GKRemoteUIController fireCompletionHandler](self, "fireCompletionHandler");

}

- (void)replaceObjectModelAtIndex:(unint64_t)a3 withObjectObjectModel:(id)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  SEL v14;

  v7 = a4;
  -[GKRemoteUIController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GKRemoteUIController.m"), 617, CFSTR("Should be presented before replacing an object model"));

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__GKRemoteUIController_replaceObjectModelAtIndex_withObjectObjectModel___block_invoke;
  v11[3] = &unk_1E59C7AF8;
  v13 = a3;
  v14 = a2;
  v11[4] = self;
  v12 = v7;
  v9 = v7;
  objc_msgSend(v9, "presentWithBlock:", v11);

}

void __72__GKRemoteUIController_replaceObjectModelAtIndex_withObjectObjectModel___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "objectModels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  v7 = v2;
  if (v3 >= objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("GKRemoteUIController.m"), 622, CFSTR("Index out of range of object models"));

  }
  objc_msgSend(v7, "replaceObjectAtIndex:withObject:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_gkSetViewControllers:transition:", v4, *MEMORY[0x1E0CD3170]);

}

- (void)presentObjectModel:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  GKRemoteUIController *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, void *);
  void *v21;
  id v22;
  GKRemoteUIController *v23;

  v4 = a4;
  v7 = a3;
  -[GKRemoteUIController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GKRemoteUIController.m"), 634, CFSTR("Can't present a modal object model until the original object model is presented"));

  }
  -[GKRemoteUIController presentedRemoteUIController](self, "presentedRemoteUIController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GKRemoteUIController.m"), 635, CFSTR("Already presenting a modal remote UI controller"));

  }
  v10 = objc_alloc_init(MEMORY[0x1E0DC3A40]);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  if (v12 == 1)
    objc_msgSend(v10, "setModalPresentationStyle:", 16);
  -[GKRemoteUIController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[GKRemoteUIController initWithObjectModel:]([GKRemoteUIController alloc], "initWithObjectModel:", v7);

  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __52__GKRemoteUIController_presentObjectModel_animated___block_invoke;
  v21 = &unk_1E59C50E0;
  v22 = v13;
  v23 = self;
  v15 = v13;
  -[GKRemoteUIController setCompletionHandler:](v14, "setCompletionHandler:", &v18);
  -[GKRemoteUIController presentInParentNavigationController:animated:](v14, "presentInParentNavigationController:animated:", v10, v4, v18, v19, v20, v21);
  -[GKRemoteUIController setPresentedRemoteUIController:](self, "setPresentedRemoteUIController:", v14);
  objc_msgSend(v15, "presentViewController:animated:completion:", v10, 1, 0);

}

void __52__GKRemoteUIController_presentObjectModel_animated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(*(id *)(a1 + 40), "setPresentedRemoteUIController:", 0);
  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "setError:", v5);
    objc_msgSend(*(id *)(a1 + 40), "fireCompletionHandler");
    v4 = v5;
  }

}

- (void)loader:(id)a3 didFailWithError:(id)a4
{
  -[GKRemoteUIController finishLoadingWithError:](self, "finishLoadingWithError:", a4);
}

- (void)performAction:(unint64_t)a3 withObjectModel:(id)a4
{
  void *v7;
  BOOL v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  id v16;

  v16 = a4;
  -[GKRemoteUIController objectModels](self, "objectModels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
    v8 = 1;
  else
    v8 = a3 - 3 >= 2;
  if (v8)
    v9 = a3;
  else
    v9 = 2;
  switch(v9)
  {
    case 1uLL:
      -[GKRemoteUIController fireCompletionHandler](self, "fireCompletionHandler");
      break;
    case 2uLL:
      -[GKRemoteUIController pushObjectModel:animated:](self, "pushObjectModel:animated:", v16, 1);
      break;
    case 3uLL:
      -[GKRemoteUIController replaceObjectModelAtIndex:withObjectObjectModel:](self, "replaceObjectModelAtIndex:withObjectObjectModel:", objc_msgSend(v7, "count") - 1, v16);
      break;
    case 4uLL:
      objc_msgSend(v16, "defaultPages");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v12)
      {
        v13 = objc_msgSend(v7, "count");
        if (v13 <= 1)
        {
          v14 = v13;
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GKRemoteUIController.m"), 689, CFSTR("Pop + replace requires at least 2 existing object models"));

          v13 = v14;
        }
        -[GKRemoteUIController replaceObjectModelAtIndex:withObjectObjectModel:](self, "replaceObjectModelAtIndex:withObjectObjectModel:", v13 - 2, v16);
      }
      -[GKRemoteUIController popObjectModelAnimated:](self, "popObjectModelAnimated:", 1);
      break;
    case 5uLL:
      -[GKRemoteUIController presentObjectModel:animated:](self, "presentObjectModel:animated:", v16, 1);
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GKRemoteUIController.m"), 709, CFSTR("Unhandled action signal type: %d"), v9);

      break;
  }

}

- (void)loader:(id)a3 receivedObjectModel:(id)a4 actionSignal:(unint64_t)a5
{
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  unint64_t v12;

  v7 = a4;
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "clientInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__GKRemoteUIController_loader_receivedObjectModel_actionSignal___block_invoke;
  v10[3] = &unk_1E59C5150;
  v11 = v7;
  v12 = a5;
  v10[4] = self;
  v9 = v7;
  -[GKRemoteUIController takeValuesFromClientInfo:withCompletionHandler:](self, "takeValuesFromClientInfo:withCompletionHandler:", v8, v10);

}

void __64__GKRemoteUIController_loader_receivedObjectModel_actionSignal___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;

  v2 = *(id **)(a1 + 32);
  if (v2[13])
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = *(id **)(a1 + 32);
    if (!v3)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = (void *)objc_msgSend(v2[13], "copy");
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("GKRemoteUIErrorDomain"), 3, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "finishLoadingWithError:", v21);

      objc_msgSend(*(id *)(a1 + 32), "setAuthInfo:", 0);
      return;
    }
    if (v2[13])
    {
      objc_msgSend(*(id *)(a1 + 32), "navigationController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v2 = *(id **)(a1 + 32);
      if (v4)
      {
        v5 = (void *)objc_msgSend(v2[13], "copy");
        objc_msgSend(*(id *)(a1 + 32), "setAuthInfo:", 0);
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("authUsername"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("authOkUrl"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "URLWithString:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cancelUrl"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "URLWithString:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = (void *)MEMORY[0x1E0D25B00];
        objc_msgSend(*(id *)(a1 + 32), "navigationController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "authenticatorForPlayerWithUsername:password:withPresentingViewController:", v6, 0, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __64__GKRemoteUIController_loader_receivedObjectModel_actionSignal___block_invoke_2;
        v23[3] = &unk_1E59C7B20;
        v23[4] = *(_QWORD *)(a1 + 32);
        v24 = v9;
        v25 = v12;
        v16 = v12;
        v17 = v9;
        objc_msgSend(v15, "authenticateUsingAuthUIAllowingAppleIDCreation:usernameEditable:dismissHandler:completionHandler:", 0, 0, 0, v23);

        return;
      }
    }
  }
  if (objc_msgSend(v2, "loadingInitialUI") && *(_QWORD *)(a1 + 48) == 1)
  {
    v18 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("GKRemoteUIErrorDomain"), 0, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "finishLoadingWithError:", v22);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishLoadingWithError:", 0);
    objc_msgSend(*(id *)(a1 + 32), "performAction:withObjectModel:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }
}

void __64__GKRemoteUIController_loader_receivedObjectModel_actionSignal___block_invoke_2(_QWORD *a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v9 = (void *)a1[4];
  if (a2 && a3 && !a7)
  {
    v10 = a1[5];
    if (a4)
      v11 = a4;
    else
      v11 = a2;
    v18[0] = CFSTR("authUsername");
    v18[1] = CFSTR("authPassword");
    v19[0] = v11;
    v19[1] = a3;
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = a4;
    v14 = a3;
    v15 = a2;
    objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loadURL:postBody:", v10, v16);

  }
  else
  {
    v17 = a1[6];
    v14 = a4;
    v15 = a3;
    v16 = a2;
    objc_msgSend(v9, "loadURL:postBody:", v17, 0);
  }

}

- (id)viewControllerForAlertPresentation
{
  void *v2;
  void *v3;

  -[GKRemoteUIController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)objectModelPressedBack:(id)a3
{
  void *v4;
  id v5;

  -[GKRemoteUIController objectModels](self, "objectModels", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "goBack") & 1) == 0)
    -[GKRemoteUIController popObjectModelAnimated:](self, "popObjectModelAnimated:", 1);

}

- (void)objectModel:(id)a3 elementDidChange:(id)a4
{
  void *v5;
  int v6;

  objc_msgSend(a4, "name", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Dismiss"));

  if (v6)
    -[GKRemoteUIController fireCompletionHandler](self, "fireCompletionHandler");
}

- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[GKRemoteUIController setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  objc_msgSend(v10, "lowercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v10) = objc_msgSend(v11, "isEqualToString:", CFSTR("post"));
  if ((v10 & 1) != 0)
  {
    objc_msgSend(v8, "postbackDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59__GKRemoteUIController_objectModel_pressedLink_httpMethod___block_invoke;
    v14[3] = &unk_1E59C54B8;
    v14[4] = self;
    v15 = v12;
    v16 = v9;
    v13 = v12;
    -[GKRemoteUIController updatePostbackDictionary:withHandler:](self, "updatePostbackDictionary:withHandler:", v13, v14);

  }
  else
  {
    -[GKRemoteUIController playerForRemoteUI](self, "playerForRemoteUI");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[GKRemoteUIController loadURL:forPlayer:postBody:](self, "loadURL:forPlayer:postBody:", v9, v13, 0);
  }

}

void __59__GKRemoteUIController_objectModel_pressedLink_httpMethod___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "postbackDataForDictionary:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "playerForRemoteUI");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadURL:forPlayer:postData:", v3, v4, v5);

}

- (BOOL)objectModel:(id)a3 shouldShowModalHTMLViewWithURL:(id)a4
{
  return 1;
}

- (void)objectModel:(id)a3 configureTableView:(id)a4 page:(id)a5
{
  void *v7;
  int v8;
  double v9;
  int v10;
  id v11;

  v11 = a5;
  objc_msgSend(a4, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setTopPadding:", 0.0);
  objc_msgSend(v7, "_setBottomPadding:", 0.0);
  if (-[GKRemoteUIController shouldApplyGameCenterTheme](self, "shouldApplyGameCenterTheme"))
  {
    objc_msgSend(v7, "setSectionFooterHeight:", 0.0);
    v8 = -[GKRemoteUIController layoutStyle](self, "layoutStyle");
    v9 = 60.0;
    if (v8 == 2)
      v9 = 72.0;
    objc_msgSend(v7, "setRowHeight:", v9);
    v10 = -[GKRemoteUIController layoutStyle](self, "layoutStyle");
    if (v10 <= 2)
      objc_msgSend(v11, "setCustomMargin:", dbl_1AB7F82C0[v10]);
  }

}

- (void)objectModel:(id)a3 configureTableSection:(id)a4 page:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  objc_msgSend(v9, "footerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v9, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("drawTopSeparator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v9, "setDrawTopSeparator:", objc_msgSend(v8, "BOOLValue"));

}

- (void)objectModel:(id)a3 configureTableRow:(id)a4 page:(id)a5
{
  _BOOL4 v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  Class *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  int v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;

  v50 = a4;
  v6 = -[GKRemoteUIController shouldApplyGameCenterTheme](self, "shouldApplyGameCenterTheme");
  v7 = v50;
  if (v6)
  {
    objc_msgSend(v50, "tableCell");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[GKRemoteUIController layoutStyle](self, "layoutStyle") == 2)
    {
      v9 = 134.0;
    }
    else
    {
      -[GKRemoteUIController layoutStyle](self, "layoutStyle");
      v9 = 88.0;
    }
    objc_msgSend(v8, "setTextFieldOffset:", v9);
    objc_msgSend(v50, "attributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(v11, "removeObjectForKey:", CFSTR("height"));
    objc_msgSend(v50, "setAttributes:", v11);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceIdiom");

    v14 = (Class *)0x1E0D25B38;
    if (v13 == 1 && (*MEMORY[0x1E0D25B68] || *MEMORY[0x1E0D253F8] == 0))
      v14 = (Class *)0x1E0D25B30;
    v49 = objc_alloc_init(*v14);
    objc_msgSend(MEMORY[0x1E0D25B28], "textStyle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "editableTextField");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("editFieldStyle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "styleWithName:fallback:layoutMode:", v18, CFSTR("remoteUIEditField"), -[GKRemoteUIController layoutStyle](self, "layoutStyle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = v19;
    if (v17)
    {
      if (!-[GKRemoteUIController layoutStyle](self, "layoutStyle"))
        objc_msgSend(v50, "setHeight:", 50.0);
      if (v19)
      {
        objc_msgSend(v19, "replayOnBaseStyle:systemContentSizeDidChange:", v49, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "applyToEditField:", v17);

      }
      v21 = CFSTR("remoteUIEditLabel");
    }
    else
    {
      v21 = CFSTR("remoteUILabel");
    }
    objc_msgSend(v8, "textLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("class"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("selectPage"));

    if (v24)
      v25 = CFSTR("remoteUISelectLabel");
    else
      v25 = v21;
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("labelStyle"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "styleWithName:fallback:layoutMode:", v26, v25, -[GKRemoteUIController layoutStyle](self, "layoutStyle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = v27;
    if (v27)
    {
      objc_msgSend(v22, "text");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        objc_msgSend(v27, "replayOnBaseStyle:systemContentSizeDidChange:", v49, 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(v22, "text");
        v46 = v17;
        v31 = v8;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "attributes");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)objc_msgSend(v30, "initWithString:attributes:", v32, v33);

        v8 = v31;
        v17 = v46;
        objc_msgSend(v22, "setAttributedText:", v34);

      }
    }
    v47 = v8;
    objc_msgSend(v8, "detailTextLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      v36 = CFSTR("remoteUISelectField");
    else
      v36 = CFSTR("remoteUIDetailLabel");
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("detailLabelStyle"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "styleWithName:fallback:layoutMode:", v37, v36, -[GKRemoteUIController layoutStyle](self, "layoutStyle"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend(v35, "text");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        objc_msgSend(v38, "replayOnBaseStyle:systemContentSizeDidChange:", v49, 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(v35, "text");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "attributes");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (void *)objc_msgSend(v41, "initWithString:attributes:", v42, v43);

        objc_msgSend(v35, "setAttributedText:", v44);
      }
    }

    v7 = v50;
  }

}

- (Class)objectModel:(id)a3 customHeaderClassForSection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  objc_msgSend(v5, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("header"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[GKRemoteUIController addThemeInfoToAttributes:](self, "addThemeInfoToAttributes:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttributes:", v8);

    objc_opt_class();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return (Class)v9;
}

- (Class)objectModel:(id)a3 customFooterClassForSection:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = a4;
  objc_msgSend(v5, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("footer"));
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("button"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (v7 | v8)
  {
    -[GKRemoteUIController addThemeInfoToAttributes:](self, "addThemeInfoToAttributes:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttributes:", v9);

    objc_opt_class();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return (Class)v10;
}

- (id)objectModel:(id)a3 tableHeaderViewForAttributes:(id)a4 page:(id)a5
{
  void *v6;
  GKRemoteUITableHeaderView *v7;

  -[GKRemoteUIController addThemeInfoToAttributes:](self, "addThemeInfoToAttributes:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[GKRemoteUITableHeaderView initWithAttributes:]([GKRemoteUITableHeaderView alloc], "initWithAttributes:", v6);
  -[GKRemoteUITableHeaderView setDelegate:](v7, "setDelegate:", self);

  return v7;
}

- (id)objectModel:(id)a3 tableFooterViewForAttributes:(id)a4 page:(id)a5
{
  void *v6;
  GKRemoteUITableFooterView *v7;

  -[GKRemoteUIController addThemeInfoToAttributes:](self, "addThemeInfoToAttributes:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[GKRemoteUITableFooterView initWithAttributes:]([GKRemoteUITableFooterView alloc], "initWithAttributes:", v6);
  -[GKRemoteUITableFooterView setDelegate:](v7, "setDelegate:", self);

  return v7;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (BOOL)loading
{
  return self->_loading;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (BOOL)shouldApplyGameCenterTheme
{
  return self->_shouldApplyGameCenterTheme;
}

- (void)setShouldApplyGameCenterTheme:(BOOL)a3
{
  self->_shouldApplyGameCenterTheme = a3;
}

- (NSMutableArray)objectModels
{
  return self->_objectModels;
}

- (void)setObjectModels:(id)a3
{
  objc_storeStrong((id *)&self->_objectModels, a3);
}

- (UINavigationController)navigationController
{
  return (UINavigationController *)objc_loadWeakRetained((id *)&self->_navigationController);
}

- (void)setNavigationController:(id)a3
{
  objc_storeWeak((id *)&self->_navigationController, a3);
}

- (NSArray)staticViewControllers
{
  return self->_staticViewControllers;
}

- (void)setStaticViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_staticViewControllers, a3);
}

- (RUILoader)loader
{
  return self->_loader;
}

- (void)setLoader:(id)a3
{
  objc_storeStrong((id *)&self->_loader, a3);
}

- (GKRemoteUIController)presentedRemoteUIController
{
  return self->_presentedRemoteUIController;
}

- (void)setPresentedRemoteUIController:(id)a3
{
  objc_storeStrong((id *)&self->_presentedRemoteUIController, a3);
}

- (BOOL)previousUseCustomBackButtonActionValue
{
  return self->_previousUseCustomBackButtonActionValue;
}

- (void)setPreviousUseCustomBackButtonActionValue:(BOOL)a3
{
  self->_previousUseCustomBackButtonActionValue = a3;
}

- (BOOL)loadingInitialUI
{
  return self->_loadingInitialUI;
}

- (void)setLoadingInitialUI:(BOOL)a3
{
  self->_loadingInitialUI = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (id)loadHandler
{
  return self->_loadHandler;
}

- (void)setLoadHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (int)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(int)a3
{
  self->_layoutStyle = a3;
}

- (BOOL)complete
{
  return self->_complete;
}

- (void)setComplete:(BOOL)a3
{
  self->_complete = a3;
}

- (NSDictionary)authInfo
{
  return self->_authInfo;
}

- (void)setAuthInfo:(id)a3
{
  objc_storeStrong((id *)&self->_authInfo, a3);
}

- (NSString)authToken
{
  return self->_authToken;
}

- (void)setAuthToken:(id)a3
{
  objc_storeStrong((id *)&self->_authToken, a3);
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
  objc_storeStrong((id *)&self->_pushToken, a3);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_storeStrong((id *)&self->_altDSID, a3);
}

- (NSString)playerID
{
  return self->_playerID;
}

- (void)setPlayerID:(id)a3
{
  objc_storeStrong((id *)&self->_playerID, a3);
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
  objc_storeStrong((id *)&self->_firstName, a3);
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
  objc_storeStrong((id *)&self->_lastName, a3);
}

- (NSString)alias
{
  return self->_alias;
}

- (void)setAlias:(id)a3
{
  objc_storeStrong((id *)&self->_alias, a3);
}

- (BOOL)isServerAuthenticated
{
  return self->_isServerAuthenticated;
}

- (void)setIsServerAuthenticated:(BOOL)a3
{
  self->_isServerAuthenticated = a3;
}

- (GKLocalPlayer)playerForRemoteUI
{
  return self->_playerForRemoteUI;
}

- (void)setPlayerForRemoteUI:(id)a3
{
  objc_storeStrong((id *)&self->_playerForRemoteUI, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerForRemoteUI, 0);
  objc_storeStrong((id *)&self->_alias, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_playerID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_authToken, 0);
  objc_storeStrong((id *)&self->_authInfo, 0);
  objc_storeStrong(&self->_loadHandler, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_presentedRemoteUIController, 0);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_staticViewControllers, 0);
  objc_destroyWeak((id *)&self->_navigationController);
  objc_storeStrong((id *)&self->_objectModels, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
}

void __71__GKRemoteUIController_updateAccountAndMarkComplete_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AB361000, a2, OS_LOG_TYPE_ERROR, "couldn't create account due to error = %@", (uint8_t *)&v2, 0xCu);
}

@end
