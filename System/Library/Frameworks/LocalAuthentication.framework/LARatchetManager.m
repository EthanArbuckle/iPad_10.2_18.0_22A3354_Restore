@implementation LARatchetManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_sharedInstance;
}

void __34__LARatchetManager_sharedInstance__block_invoke()
{
  LARatchetManager *v0;
  void *v1;

  v0 = objc_alloc_init(LARatchetManager);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (LARatchetManager)init
{
  LARatchetManager *v2;
  uint64_t v3;
  LACDTORatchetManager *coreManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LARatchetManager;
  v2 = -[LARatchetManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D443C0]), "initWithContextProvider:", v2);
    coreManager = v2->_coreManager;
    v2->_coreManager = (LACDTORatchetManager *)v3;

  }
  return v2;
}

- (BOOL)isFeatureEnabled
{
  return -[LACDTORatchetManager isFeatureEnabled](self->_coreManager, "isFeatureEnabled");
}

- (BOOL)isFeatureSupported
{
  return -[LACDTORatchetManager isFeatureSupported](self->_coreManager, "isFeatureSupported");
}

- (BOOL)isFeatureAvailable
{
  return -[LACDTORatchetManager isFeatureAvailable](self->_coreManager, "isFeatureAvailable");
}

- (BOOL)isFeatureStrictModeEnabled
{
  return -[LACDTORatchetManager isFeatureStrictModeEnabled](self->_coreManager, "isFeatureStrictModeEnabled");
}

- (BOOL)isSensorTrusted
{
  return -[LACDTORatchetManager isSensorTrusted](self->_coreManager, "isSensorTrusted");
}

- (LARatchetState)ratchetState
{
  void *v2;
  LARatchetState *v3;

  -[LACDTORatchetManager ratchetState](self->_coreManager, "ratchetState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[LARatchetState initWithState:]([LARatchetState alloc], "initWithState:", v2);

  return v3;
}

- (void)stateWithCompletion:(id)a3
{
  id v4;
  LACDTORatchetManager *coreManager;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  coreManager = self->_coreManager;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__LARatchetManager_stateWithCompletion___block_invoke;
  v7[3] = &unk_1E70791D0;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v7[4] = self;
  v8 = v6;
  -[LACDTORatchetManager stateWithCompletion:](coreManager, "stateWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __40__LARatchetManager_stateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  LARatchetState *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      objc_msgSend((id)objc_opt_class(), "ratchetErrorForError:", v5);
      v8 = (LARatchetState *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, LARatchetState *))(v7 + 16))(v7, 0, v8);
    }
    else
    {
      v8 = -[LARatchetState initWithState:]([LARatchetState alloc], "initWithState:", v9);
      (*(void (**)(uint64_t, LARatchetState *, _QWORD))(v7 + 16))(v7, v8, 0);
    }

  }
}

- (void)checkCanEnableFeatureWithCompletion:(id)a3
{
  id v4;
  LACDTORatchetManager *coreManager;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  coreManager = self->_coreManager;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__LARatchetManager_checkCanEnableFeatureWithCompletion___block_invoke;
  v7[3] = &unk_1E70791F8;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v7[4] = self;
  v8 = v6;
  -[LACDTORatchetManager checkCanEnableFeatureWithCompletion:](coreManager, "checkCanEnableFeatureWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __56__LARatchetManager_checkCanEnableFeatureWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      objc_msgSend((id)objc_opt_class(), "ratchetErrorForError:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id, void *))(v7 + 16))(v7, v9, v8);

    }
    else
    {
      (*(void (**)(_QWORD, id, _QWORD))(v7 + 16))(*(_QWORD *)(a1 + 40), v9, 0);
    }
  }

}

- (void)enableFeatureWithReply:(id)a3
{
  id v4;
  LACDTORatchetManager *coreManager;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  coreManager = self->_coreManager;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__LARatchetManager_enableFeatureWithReply___block_invoke;
  v7[3] = &unk_1E70791F8;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v7[4] = self;
  v8 = v6;
  -[LACDTORatchetManager enableFeatureWithReply:](coreManager, "enableFeatureWithReply:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __43__LARatchetManager_enableFeatureWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      objc_msgSend((id)objc_opt_class(), "ratchetErrorForError:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id, void *))(v7 + 16))(v7, v9, v8);

    }
    else
    {
      (*(void (**)(_QWORD, id, _QWORD))(v7 + 16))(*(_QWORD *)(a1 + 40), v9, 0);
    }
  }

}

- (void)disableFeatureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  LACDTORatchetManager *coreManager;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  coreManager = self->_coreManager;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__LARatchetManager_disableFeatureWithContext_completion___block_invoke;
  v10[3] = &unk_1E7079220;
  objc_copyWeak(&v12, &location);
  v9 = v7;
  v11 = v9;
  -[LACDTORatchetManager disableFeatureWithContext:completion:](coreManager, "disableFeatureWithContext:completion:", v6, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __57__LARatchetManager_disableFeatureWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)enableFeatureStrictModeWithCompletion:(id)a3
{
  id v4;
  LACDTORatchetManager *coreManager;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  coreManager = self->_coreManager;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__LARatchetManager_enableFeatureStrictModeWithCompletion___block_invoke;
  v7[3] = &unk_1E7079248;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v7[4] = self;
  v8 = v6;
  -[LACDTORatchetManager enableFeatureStrictModeWithCompletion:](coreManager, "enableFeatureStrictModeWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __58__LARatchetManager_enableFeatureStrictModeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend((id)objc_opt_class(), "ratchetErrorForError:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

- (void)disableFeatureStrictModeWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id location;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v16 = &unk_1E7087E58;
  v17[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__LARatchetManager_disableFeatureStrictModeWithContext_completion___block_invoke;
  v11[3] = &unk_1E7079270;
  objc_copyWeak(&v14, &location);
  v9 = v7;
  v13 = v9;
  v11[4] = self;
  v10 = v6;
  v12 = v10;
  objc_msgSend(v10, "evaluatePolicy:options:reply:", 1026, v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __67__LARatchetManager_disableFeatureStrictModeWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      v9 = *(_QWORD *)(a1 + 48);
      objc_msgSend((id)objc_opt_class(), "ratchetErrorForError:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

    }
    else
    {
      v11 = (void *)*((_QWORD *)WeakRetained + 1);
      v12 = *(_QWORD *)(a1 + 40);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __67__LARatchetManager_disableFeatureStrictModeWithContext_completion___block_invoke_2;
      v14[3] = &unk_1E7079248;
      objc_copyWeak(&v16, (id *)(a1 + 56));
      v13 = *(id *)(a1 + 48);
      v14[4] = *(_QWORD *)(a1 + 32);
      v15 = v13;
      objc_msgSend(v11, "disableFeatureStrictModeWithContext:completion:", v12, v14);

      objc_destroyWeak(&v16);
    }
  }

}

void __67__LARatchetManager_disableFeatureStrictModeWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend((id)objc_opt_class(), "ratchetErrorForError:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

- (void)addObserver:(id)a3
{
  id v4;
  LARatchetObserverWrapper *v5;

  v4 = a3;
  v5 = -[LARatchetObserverWrapper initWithObserver:]([LARatchetObserverWrapper alloc], "initWithObserver:", v4);
  objc_setAssociatedObject(v4, &LARatchetManagerObserverAssociatedObjectKey, v5, (void *)1);

  -[LACDTORatchetManager addObserver:](self->_coreManager, "addObserver:", v5);
}

- (void)removeObserver:(id)a3
{
  id v4;
  LARatchetObserverWrapper *v5;

  v4 = a3;
  v5 = -[LARatchetObserverWrapper initWithObserver:]([LARatchetObserverWrapper alloc], "initWithObserver:", v4);
  -[LACDTORatchetManager removeObserver:](self->_coreManager, "removeObserver:", v5);
  objc_setAssociatedObject(v4, &LARatchetManagerObserverAssociatedObjectKey, 0, (void *)1);

}

- (void)reset
{
  -[LACDTORatchetManager reset](self->_coreManager, "reset");
}

- (void)performArmRequestWithIdentifier:(id)a3 context:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  LACDTORatchetManager *coreManager;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  coreManager = self->_coreManager;
  objc_msgSend((id)objc_opt_class(), "optionsForRatchetArmOptions:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __79__LARatchetManager_performArmRequestWithIdentifier_context_options_completion___block_invoke;
  v17[3] = &unk_1E70791F8;
  objc_copyWeak(&v19, &location);
  v16 = v13;
  v17[4] = self;
  v18 = v16;
  -[LACDTORatchetManager performArmRequestWithIdentifier:context:options:completion:](coreManager, "performArmRequestWithIdentifier:context:options:completion:", v10, v11, v15, v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __79__LARatchetManager_performArmRequestWithIdentifier_context_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v7 = *(_QWORD *)(a1 + 40);
    v8 = (void *)objc_opt_class();
    if (v5)
    {
      objc_msgSend(v8, "ratchetErrorForError:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v9);
    }
    else
    {
      objc_msgSend(v8, "ratchetResultForResult:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v9, 0);
    }

  }
}

- (void)stateInContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  LACDTORatchetManager *coreManager;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  coreManager = self->_coreManager;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__LARatchetManager_stateInContext_completion___block_invoke;
  v10[3] = &unk_1E70791D0;
  objc_copyWeak(&v12, &location);
  v9 = v7;
  v10[4] = self;
  v11 = v9;
  -[LACDTORatchetManager stateInContext:completion:](coreManager, "stateInContext:completion:", v6, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __46__LARatchetManager_stateInContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  LARatchetState *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      objc_msgSend((id)objc_opt_class(), "ratchetErrorForError:", v5);
      v8 = (LARatchetState *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, LARatchetState *))(v7 + 16))(v7, 0, v8);
    }
    else
    {
      v8 = -[LARatchetState initWithState:]([LARatchetState alloc], "initWithState:", v9);
      (*(void (**)(uint64_t, LARatchetState *, _QWORD))(v7 + 16))(v7, v8, 0);
    }

  }
}

- (void)cancelArmRequestWithIdentifier:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  LACDTORatchetManager *coreManager;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  coreManager = self->_coreManager;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__LARatchetManager_cancelArmRequestWithIdentifier_reason_completion___block_invoke;
  v13[3] = &unk_1E7079220;
  objc_copyWeak(&v15, &location);
  v12 = v10;
  v14 = v12;
  -[LACDTORatchetManager cancelArmRequestWithIdentifier:reason:completion:](coreManager, "cancelArmRequestWithIdentifier:reason:completion:", v8, v9, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __69__LARatchetManager_cancelArmRequestWithIdentifier_reason_completion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (id)ratchetResultForResult:(id)a3
{
  id v3;
  LARatchetState *v4;
  void *v5;
  void *v6;
  LARatchetState *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v3 = a3;
  v4 = [LARatchetState alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *MEMORY[0x1E0D443A8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[LARatchetState initWithState:](v4, "initWithState:", v6);

  v20[0] = &unk_1E7087E70;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *MEMORY[0x1E0D44390]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v9;
  v21[1] = v7;
  v20[1] = &unk_1E7087E88;
  v20[2] = &unk_1E7087EA0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *MEMORY[0x1E0D44398]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = (void *)MEMORY[0x1E0C9AAA0];
  if (v11)
    v14 = v11;
  else
    v14 = MEMORY[0x1E0C9AAA0];
  v21[2] = v14;
  v20[3] = &unk_1E7087EB8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *MEMORY[0x1E0D443A0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    v17 = v16;
  else
    v17 = v13;
  v21[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)ratchetErrorForError:(id)a3
{
  if (!a3)
    return 0;
  +[LARatchetErrorBuilder ratchetErrorWithError:](LARatchetErrorBuilder, "ratchetErrorWithError:");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)optionsForRatchetArmOptions:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v3, "allKeys", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          v11 = objc_msgSend((id)objc_opt_class(), "_optionForRatchetOption:", objc_msgSend(v10, "integerValue"));
          if (v11 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v12 = v11;
            objc_msgSend(v3, "objectForKeyedSubscript:", v10);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v14);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (int64_t)_optionForRatchetOption:(int64_t)a3
{
  int64_t result;
  int64_t *v4;

  result = 0x7FFFFFFFFFFFFFFFLL;
  switch(a3)
  {
    case 0:
      v4 = (int64_t *)MEMORY[0x1E0D44328];
      goto LABEL_20;
    case 1:
      v4 = (int64_t *)MEMORY[0x1E0D44318];
      goto LABEL_20;
    case 2:
      v4 = (int64_t *)MEMORY[0x1E0D44320];
      goto LABEL_20;
    case 4:
      v4 = (int64_t *)MEMORY[0x1E0D44368];
      goto LABEL_20;
    case 5:
      v4 = (int64_t *)MEMORY[0x1E0D44388];
      goto LABEL_20;
    case 7:
      v4 = (int64_t *)MEMORY[0x1E0D44380];
      goto LABEL_20;
    case 8:
      v4 = (int64_t *)MEMORY[0x1E0D44338];
      goto LABEL_20;
    case 9:
      v4 = (int64_t *)MEMORY[0x1E0D44330];
      goto LABEL_20;
    case 10:
      v4 = (int64_t *)MEMORY[0x1E0D44340];
      goto LABEL_20;
    case 11:
      v4 = (int64_t *)MEMORY[0x1E0D44358];
      goto LABEL_20;
    case 12:
      v4 = (int64_t *)MEMORY[0x1E0D44370];
      goto LABEL_20;
    case 13:
      v4 = (int64_t *)MEMORY[0x1E0D44350];
      goto LABEL_20;
    case 14:
      v4 = (int64_t *)MEMORY[0x1E0D44360];
      goto LABEL_20;
    case 15:
      v4 = (int64_t *)MEMORY[0x1E0D44300];
      goto LABEL_20;
    case 16:
      v4 = (int64_t *)MEMORY[0x1E0D44308];
      goto LABEL_20;
    case 17:
      v4 = (int64_t *)MEMORY[0x1E0D44378];
      goto LABEL_20;
    case 18:
      v4 = (int64_t *)MEMORY[0x1E0D44310];
      goto LABEL_20;
    case 19:
      v4 = (int64_t *)MEMORY[0x1E0D44348];
LABEL_20:
      result = *v4;
      break;
    default:
      return result;
  }
  return result;
}

- (void)enableFeatureWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__LARatchetManager_enableFeatureWithCompletion___block_invoke;
  v6[3] = &unk_1E7079298;
  v7 = v4;
  v5 = v4;
  -[LARatchetManager enableFeatureWithReply:](self, "enableFeatureWithReply:", v6);

}

uint64_t __48__LARatchetManager_enableFeatureWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)currentRatchetWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[LARatchetErrorBuilder genericErrorWithDebugDescription:](LARatchetErrorBuilder, "genericErrorWithDebugDescription:", CFSTR("This method has been deprecated"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a3 + 2))(v4, 0, v5);

}

- (void)cancelCurrentRatchetWithReason:(id)a3 completion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  +[LARatchetErrorBuilder genericErrorWithDebugDescription:](LARatchetErrorBuilder, "genericErrorWithDebugDescription:", CFSTR("This method has been deprecated"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v5, v6);

}

- (id)createContext
{
  return objc_alloc_init(LAContext);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreManager, 0);
}

@end
