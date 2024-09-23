@implementation GKReportProblemRemoteUIController

+ (id)controllerForProblemPlayer:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  GKReportProblemRemoteUIController *v11;
  void *v13;
  void *v14;
  GKReportProblemRemoteUIController *v15;
  id v16;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("GKReportProblemRemoteUIController.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("problemPlayer!=nil"));

  }
  objc_msgSend(v7, "internal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "playerID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("GKReportProblemRemoteUIController.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("problemPlayer.internal.playerID!=nil"));

    if (!v8)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (v8)
  {
LABEL_5:
    v15 = -[GKReportProblemRemoteUIController initWithProblemPlayer:]([GKReportProblemRemoteUIController alloc], "initWithProblemPlayer:", v7);
    v16 = v8;
    v11 = v15;
    gk_dispatch_as_group();

  }
LABEL_6:

  return 0;
}

void __82__GKReportProblemRemoteUIController_controllerForProblemPlayer_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;

  v4 = MEMORY[0x1E0C809B0];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __82__GKReportProblemRemoteUIController_controllerForProblemPlayer_completionHandler___block_invoke_2;
  v13 = &unk_1E59C4A28;
  v14 = *(id *)(a1 + 32);
  v5 = a2;
  gk_dispatch_group_do();
  v6 = dispatch_queue_create(0, 0);
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __82__GKReportProblemRemoteUIController_controllerForProblemPlayer_completionHandler___block_invoke_3;
  block[3] = &unk_1E59C53C8;
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  dispatch_group_notify(v5, v6, block);

}

void __82__GKReportProblemRemoteUIController_controllerForProblemPlayer_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "bagKey");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configureFromBagKey:player:withCompletionHandler:", v5, v4, v3);

}

void __82__GKReportProblemRemoteUIController_controllerForProblemPlayer_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "error");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v5);

  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __82__GKReportProblemRemoteUIController_controllerForProblemPlayer_completionHandler___block_invoke_4;
    v6[3] = &unk_1E59C4210;
    v4 = *(void **)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v4, "loadInitialRemoteUIWithHandler:", v6);

  }
}

uint64_t __82__GKReportProblemRemoteUIController_controllerForProblemPlayer_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v3 + 16))(v3, 0, a2);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
}

- (GKReportProblemRemoteUIController)initWithProblemPlayer:(id)a3
{
  id v5;
  GKReportProblemRemoteUIController *v6;
  GKReportProblemRemoteUIController *v7;
  GKReportProblemRemoteUIController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GKReportProblemRemoteUIController;
  v6 = -[GKRemoteUIController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_problemPlayer, a3);
    v8 = v7;
  }

  return v7;
}

- (int)preferredLayoutStyle
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  return v3 == 1;
}

- (id)fallbackURL
{
  void *v2;
  void *v3;

  GKGameCenterUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("GameCenterMissingUI"), CFSTR("xml"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bagKey
{
  return (id)*MEMORY[0x1E0D24FA0];
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
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)GKReportProblemRemoteUIController;
  -[GKRemoteUIController postBodyForInitialLoad](&v15, sel_postBodyForInitialLoad);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKRemoteUIController playerID](self, "playerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[GKRemoteUIController playerID](self, "playerID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("playerID"));

  }
  -[GKRemoteUIController authToken](self, "authToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[GKRemoteUIController authToken](self, "authToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("authToken"));

  }
  -[GKReportProblemRemoteUIController problemPlayer](self, "problemPlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "internal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "playerID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[GKReportProblemRemoteUIController problemPlayer](self, "problemPlayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "internal");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "playerID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("problemPlayerID"));

  }
  return v3;
}

- (GKPlayer)problemPlayer
{
  return self->_problemPlayer;
}

- (void)setProblemPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_problemPlayer, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_problemPlayer, 0);
}

@end
