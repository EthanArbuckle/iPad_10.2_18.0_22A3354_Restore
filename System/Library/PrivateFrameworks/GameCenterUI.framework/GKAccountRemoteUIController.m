@implementation GKAccountRemoteUIController

+ (void)accountRemoteUIControllerForPlayer:(id)a3 mode:(int64_t)a4 completionHandler:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "accountRemoteUIControllerForPlayer:mode:url:postBody:completionHandler:", v8, a4, 0, 0, v7);

}

+ (void)accountRemoteUIControllerForPlayer:(id)a3 mode:(int64_t)a4 url:(id)a5 postBody:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  GKAccountRemoteUIController *v19;
  GKAccountRemoteUIController *v20;
  uint64_t v21;
  GKAccountRemoteUIController *v22;
  _QWORD v23[4];
  GKAccountRemoteUIController *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  GKAccountRemoteUIController *v28;
  id v29;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setInsideAuthenticatorInvocation:", 1);

    v16 = (void *)MEMORY[0x1E0D252A8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/RemoteUI/GKAccountRemoteUIController.m", 45, "+[GKAccountRemoteUIController accountRemoteUIControllerForPlayer:mode:url:postBody:completionHandler:]");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dispatchGroupWithName:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = -[GKAccountRemoteUIController initWithMode:player:]([GKAccountRemoteUIController alloc], "initWithMode:player:", a4, v11);
    v20 = v19;
    v21 = MEMORY[0x1E0C809B0];
    if (v12)
    {
      -[GKAccountRemoteUIController setUrl:](v19, "setUrl:", v12);
      if (v13)
        -[GKAccountRemoteUIController setPostBody:](v20, "setPostBody:", v13);
    }
    else
    {
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __102__GKAccountRemoteUIController_accountRemoteUIControllerForPlayer_mode_url_postBody_completionHandler___block_invoke;
      v27[3] = &unk_1E59C41C0;
      v28 = v19;
      v29 = v11;
      objc_msgSend(v18, "perform:", v27);

    }
    v23[0] = v21;
    v23[1] = 3221225472;
    v23[2] = __102__GKAccountRemoteUIController_accountRemoteUIControllerForPlayer_mode_url_postBody_completionHandler___block_invoke_2;
    v23[3] = &unk_1E59C41E8;
    v24 = v20;
    v26 = v14;
    v25 = v11;
    v22 = v20;
    objc_msgSend(v18, "notifyOnMainQueueWithBlock:", v23);

  }
}

void __102__GKAccountRemoteUIController_accountRemoteUIControllerForPlayer_mode_url_postBody_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "bagKey");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configureFromBagKey:player:withCompletionHandler:", v5, *(_QWORD *)(a1 + 40), v4);

}

void __102__GKAccountRemoteUIController_accountRemoteUIControllerForPlayer_mode_url_postBody_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "error");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v6);

  }
  else
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __102__GKAccountRemoteUIController_accountRemoteUIControllerForPlayer_mode_url_postBody_completionHandler___block_invoke_3;
    v7[3] = &unk_1E59C4210;
    v9 = *(id *)(a1 + 48);
    v8 = *(id *)(a1 + 32);
    objc_msgSend(v4, "loadInitialRemoteUIForPlayer:handler:", v5, v7);

  }
}

void __102__GKAccountRemoteUIController_accountRemoteUIControllerForPlayer_mode_url_postBody_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__GKAccountRemoteUIController_accountRemoteUIControllerForPlayer_mode_url_postBody_completionHandler___block_invoke_4;
  block[3] = &unk_1E59C41E8;
  v6 = v3;
  v8 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __102__GKAccountRemoteUIController_accountRemoteUIControllerForPlayer_mode_url_postBody_completionHandler___block_invoke_4(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[4];
  v3 = a1[6];
  if (v2)
    return (*(uint64_t (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(v3 + 16))(v3, a1[5]);
}

- (GKAccountRemoteUIController)initWithMode:(int64_t)a3
{
  GKAccountRemoteUIController *v4;
  GKAccountRemoteUIController *v5;
  GKAccountRemoteUIController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKAccountRemoteUIController;
  v4 = -[GKRemoteUIController init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_mode = a3;
    v6 = v4;
  }

  return v5;
}

- (GKAccountRemoteUIController)initWithMode:(int64_t)a3 player:(id)a4
{
  id v6;
  GKAccountRemoteUIController *v7;
  GKAccountRemoteUIController *v8;
  GKAccountRemoteUIController *v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GKAccountRemoteUIController;
  v7 = -[GKRemoteUIController init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    -[GKRemoteUIController setPlayerForRemoteUI:](v7, "setPlayerForRemoteUI:", v6);
    v8->_mode = a3;
    v9 = v8;
  }

  return v8;
}

- (void)fireCompletionHandler
{
  void *v3;
  _QWORD v4[5];
  objc_super v5;

  -[GKRemoteUIController error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 || !-[GKAccountRemoteUIController authenticatePlayerOnCompletion](self, "authenticatePlayerOnCompletion"))
  {

  }
  else if (-[GKAccountRemoteUIController mode](self, "mode") != 3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __52__GKAccountRemoteUIController_fireCompletionHandler__block_invoke;
    v4[3] = &unk_1E59C4148;
    v4[4] = self;
    -[GKRemoteUIController updateAccountAndMarkComplete:completionHandler:](self, "updateAccountAndMarkComplete:completionHandler:", 1, v4);
    return;
  }
  v5.receiver = self;
  v5.super_class = (Class)GKAccountRemoteUIController;
  -[GKRemoteUIController fireCompletionHandler](&v5, sel_fireCompletionHandler);
}

void __52__GKAccountRemoteUIController_fireCompletionHandler__block_invoke(uint64_t a1)
{
  void *v2;
  objc_super v3;

  objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInsideAuthenticatorInvocation:", 0);
  if (objc_msgSend(*(id *)(a1 + 32), "mode") == 1 && objc_msgSend(v2, "isPurpleBuddyAccount"))
    objc_msgSend(v2, "setNewToGameCenter:", 1);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)GKAccountRemoteUIController;
  objc_msgSendSuper2(&v3, sel_fireCompletionHandler);

}

- (id)fallbackURL
{
  void *v2;
  void *v3;

  if (-[GKAccountRemoteUIController mode](self, "mode") == 3)
  {
    v2 = 0;
  }
  else
  {
    GKGameCenterUIFrameworkBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("GameCenterMissingUI"), CFSTR("xml"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)bagKey
{
  char *v2;

  v2 = -[GKAccountRemoteUIController mode](self, "mode");
  if ((unint64_t)(v2 - 1) <= 2)
    v2 = (char *)**((id **)&unk_1E59C4230 + (_QWORD)(v2 - 1));
  return v2;
}

- (id)postBodyForInitialLoad
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
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)GKAccountRemoteUIController;
  -[GKRemoteUIController postBodyForInitialLoad](&v16, sel_postBodyForInitialLoad);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKRemoteUIController authToken](self, "authToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[GKRemoteUIController authToken](self, "authToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("authToken"));

  }
  -[GKRemoteUIController pushToken](self, "pushToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[GKRemoteUIController pushToken](self, "pushToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("pushToken"));

  }
  -[GKRemoteUIController appleID](self, "appleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[GKRemoteUIController altDSID](self, "altDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("appleID"));
    }
    else
    {
      -[GKRemoteUIController appleID](self, "appleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("appleID"));

    }
  }
  -[GKRemoteUIController playerID](self, "playerID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[GKRemoteUIController playerID](self, "playerID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("playerID"));

  }
  -[GKAccountRemoteUIController availableExternalServices](self, "availableExternalServices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[GKAccountRemoteUIController availableExternalServices](self, "availableExternalServices");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("availableExternalServices"));

  }
  if (self->_postBody)
    objc_msgSend(v3, "addEntriesFromDictionary:");
  return v3;
}

- (void)takeValuesFromClientInfo:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("finished"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isAuthenticated"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    -[GKAccountRemoteUIController setAuthenticatePlayerOnCompletion:](self, "setAuthenticatePlayerOnCompletion:", objc_msgSend(v9, "BOOLValue"));
  if (v8)
    -[GKAccountRemoteUIController setAuthenticatePlayerOnCompletion:](self, "setAuthenticatePlayerOnCompletion:", objc_msgSend(v8, "BOOLValue"));
  if (-[GKAccountRemoteUIController mode](self, "mode") == 1)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("alias"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      -[GKAccountRemoteUIController setAuthenticatePlayerOnCompletion:](self, "setAuthenticatePlayerOnCompletion:", 0);
  }
  v12.receiver = self;
  v12.super_class = (Class)GKAccountRemoteUIController;
  -[GKRemoteUIController takeValuesFromClientInfo:withCompletionHandler:](&v12, sel_takeValuesFromClientInfo_withCompletionHandler_, v6, v7);

}

- (void)updatePostbackDictionary:(id)a3 withHandler:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (NSArray)availableExternalServices
{
  return self->_availableExternalServices;
}

- (void)setAvailableExternalServices:(id)a3
{
  objc_storeStrong((id *)&self->_availableExternalServices, a3);
}

- (BOOL)authenticatePlayerOnCompletion
{
  return self->_authenticatePlayerOnCompletion;
}

- (void)setAuthenticatePlayerOnCompletion:(BOOL)a3
{
  self->_authenticatePlayerOnCompletion = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSDictionary)postBody
{
  return self->_postBody;
}

- (void)setPostBody:(id)a3
{
  objc_storeStrong((id *)&self->_postBody, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postBody, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_availableExternalServices, 0);
}

@end
