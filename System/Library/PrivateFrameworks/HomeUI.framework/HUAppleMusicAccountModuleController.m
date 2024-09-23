@implementation HUAppleMusicAccountModuleController

- (HUAppleMusicAccountModuleController)initWithModule:(id)a3
{
  HUAppleMusicAccountModuleController *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUAppleMusicAccountModuleController;
  v3 = -[HUItemModuleController initWithModule:](&v6, sel_initWithModule_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAppleMusicAccountModuleController setItemToCellMap:](v3, "setItemToCellMap:", v4);

  }
  return v3;
}

- (HUAppleMusicAccountModule)module
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUAppleMusicAccountModuleController;
  -[HUItemModuleController module](&v3, sel_module);
  return (HUAppleMusicAccountModule *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[HUAppleMusicAccountModuleController loginFuture](self, "loginFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[HUAppleMusicAccountModuleController logoutFuture](self, "logoutFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  v5.receiver = self;
  v5.super_class = (Class)HUAppleMusicAccountModuleController;
  -[HUAppleMusicAccountModuleController dealloc](&v5, sel_dealloc);
}

- (Class)cellClassForItem:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;

  v5 = a3;
  -[HUAppleMusicAccountModuleController module](self, "module");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logoutItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v5)
    goto LABEL_6;
  -[HUAppleMusicAccountModuleController module](self, "module");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "loginItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v5
    || (-[HUAppleMusicAccountModuleController module](self, "module"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "loggedInUsernameItem"),
        v11 = (id)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11 == v5))
  {
LABEL_6:
    objc_opt_class();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HUAppleMusicAccountModuleController module](self, "module");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appleMusicAccountItemProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "items");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsObject:", v5);

    if ((v15 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAppleMusicAccountModuleController.m"), 79, CFSTR("Missing cell class for item %@"), v5);

    }
    objc_opt_class();
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (Class)v16;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  -[HUAppleMusicAccountModuleController module](self, "module");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logoutItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[HUAppleMusicAccountModuleController setLogoutButton:](self, "setLogoutButton:", v17);
  }
  else
  {
    -[HUAppleMusicAccountModuleController module](self, "module");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loginItem");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10 == v6)
    {
      -[HUAppleMusicAccountModuleController setLoginButton:](self, "setLoginButton:", v17);
    }
    else
    {
      -[HUAppleMusicAccountModuleController module](self, "module");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "loggedInUsernameItem");
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v12 == v6)
      {
        objc_opt_class();
        v13 = v17;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
        v15 = v14;

        objc_msgSend(v15, "setHideIcon:", 1);
      }
    }
  }
  -[HUAppleMusicAccountModuleController itemToCellMap](self, "itemToCellMap");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v17, v6);

}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  HUAppleMusicAccountModuleController *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;

  v35 = a3;
  v7 = a4;
  -[HUAppleMusicAccountModuleController module](self, "module");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logoutItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v7)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v35, "setAccessoryView:", v21);

    -[HUAppleMusicAccountModuleController logoutButton](self, "logoutButton");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[HUAppleMusicAccountModuleController logoutFuture](self, "logoutFuture");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v19, "isFinished") ^ 1;
    v23 = self;
    v24 = v16;
LABEL_13:
    -[HUAppleMusicAccountModuleController _setupButtonCell:enabled:](v23, "_setupButtonCell:enabled:", v24, v22);
    goto LABEL_14;
  }
  -[HUAppleMusicAccountModuleController module](self, "module");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "loginItem");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 != v7)
  {
    -[HUAppleMusicAccountModuleController module](self, "module");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loggedInUsernameItem");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13 != v7)
      goto LABEL_15;
    objc_opt_class();
    v14 = v35;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    objc_msgSend(v7, "latestResults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTitleText:", v18);

    objc_msgSend(v7, "latestResults");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setValueText:", v20);
    goto LABEL_11;
  }
  -[HUAppleMusicAccountModuleController loginButton](self, "loginButton");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[HUAppleMusicAccountModuleController loginFuture](self, "loginFuture");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    v23 = self;
    v24 = v16;
    v22 = 1;
    goto LABEL_13;
  }
  -[HUAppleMusicAccountModuleController loginFuture](self, "loginFuture");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAppleMusicAccountModuleController _setupButtonCell:enabled:](self, "_setupButtonCell:enabled:", v16, objc_msgSend(v20, "isFinished"));
LABEL_11:

LABEL_14:
LABEL_15:
  -[HUAppleMusicAccountModuleController module](self, "module");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "appleMusicAccountItemProvider");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "items");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "containsObject:", v7);

  if (v28)
  {
    objc_opt_class();
    v29 = v35;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v30 = v29;
    else
      v30 = 0;
    v31 = v30;

    objc_msgSend(v7, "latestResults");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "textLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setText:", v33);

    objc_msgSend(v31, "setTextColorFollowsTintColor:", 1);
  }

}

- (void)_setupButtonCell:(id)a3 enabled:(BOOL)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  id v12;

  v4 = a4;
  v12 = a3;
  objc_opt_class();
  objc_msgSend(v12, "accessoryView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  -[HUAppleMusicAccountModuleController activeAuthCell](self, "activeAuthCell");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v12)
  {
    if (!v8)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
      objc_msgSend(v6, "setHidesWhenStopped:", 1);
      objc_msgSend(v12, "setAccessoryView:", v6);
    }
    v11 = objc_msgSend(v6, "isAnimating");
    if (!v11 || (v4 & 1) != 0)
    {
      if (((v11 | v4 ^ 1) & 1) == 0)
        objc_msgSend(v6, "startAnimating");
    }
    else
    {
      objc_msgSend(v6, "stopAnimating");
      v4 = 0;
    }
    v10 = v12;
  }
  else
  {
    objc_msgSend(v8, "stopAnimating");
    objc_msgSend(v12, "setAccessoryView:", 0);
    v10 = v12;
    v4 = v4 ^ 1;
    v6 = v8;
  }
  objc_msgSend(v10, "setDisabled:", v4);

}

- (BOOL)canSelectItem:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HUAppleMusicAccountModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loggedInUsernameItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  return v6 != v4;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  void *v27;

  v4 = a3;
  -[HUAppleMusicAccountModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appleMusicAccountItemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUAppleMusicAccountModuleController module](self, "module");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mediaProfileContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hf_homePodSupportsMultiUser");

  -[HUAppleMusicAccountModuleController module](self, "module");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "loginItem");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v4)
  {
    if (!v9)
      goto LABEL_8;
    objc_msgSend(v6, "mediaProfileContainer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "hf_appleMusicCurrentLoggedInAccount");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
      goto LABEL_8;
    -[HUAppleMusicAccountModuleController module](self, "module");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "mediaProfileContainer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "hf_supportsPreferredMediaUser");

    if (!v24)
    {
      -[HUAppleMusicAccountModuleController delegate](self, "delegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "appleMusicModuleControllerPresentSignInFlow:", self);

    }
    else
    {
LABEL_8:
      v25 = -[HUAppleMusicAccountModuleController kickOffManualLogin](self, "kickOffManualLogin");
    }
  }
  else
  {
    -[HUAppleMusicAccountModuleController module](self, "module");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logoutItem");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13 == v4)
    {
      -[HUAppleMusicAccountModuleController logout](self, "logout");
    }
    else
    {
      objc_msgSend(v6, "items");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "containsObject:", v4);

      if (v15)
      {
        -[HUAppleMusicAccountModuleController itemToCellMap](self, "itemToCellMap");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKey:", v4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "latestResults");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("HOAppleMusicAccountKey"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUAppleMusicAccountModuleController _setupCompanionAuthenticationForAccount:cell:](self, "_setupCompanionAuthenticationForAccount:cell:", v19, v17);

      }
    }
  }

  return 0;
}

- (void)setLoginFuture:(id)a3
{
  NAFuture *v5;
  NAFuture *loginFuture;
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  v5 = (NAFuture *)a3;
  if (self->_loginFuture != v5)
  {
    objc_storeStrong((id *)&self->_loginFuture, a3);
    objc_initWeak(&location, self);
    loginFuture = self->_loginFuture;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__HUAppleMusicAccountModuleController_setLoginFuture___block_invoke;
    v8[3] = &unk_1E6F4E380;
    objc_copyWeak(&v9, &location);
    v7 = (id)-[NAFuture addCompletionBlock:](loginFuture, "addCompletionBlock:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __54__HUAppleMusicAccountModuleController_setLoginFuture___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setActiveAuthCell:", 0);
  objc_msgSend(WeakRetained, "_enableCells");
  if (v4)
  {
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_error_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_ERROR, "Login future completed with NSError = [%@]", (uint8_t *)&v13, 0xCu);
    }

  }
  objc_msgSend(v4, "hf_errorWithOperationType:options:", *MEMORY[0x1E0D309A0], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v7;
      _os_log_error_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_ERROR, "Login future completed with HFError = [%@]", (uint8_t *)&v13, 0xCu);
    }

    objc_msgSend(v7, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB28A8]) || objc_msgSend(v7, "code") != 3072)
    {
      objc_msgSend(v7, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CFFF10]) & 1) != 0)
      {
        v12 = objc_msgSend(v7, "code");

        if (v12 == -7003)
          goto LABEL_19;
      }
      else
      {

      }
      objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleError:", v7);
    }

LABEL_19:
    objc_msgSend(WeakRetained, "_updateModuleState:notifyDelegate:", 0, 1);
    goto LABEL_20;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Login future completed Successfully", (uint8_t *)&v13, 2u);
  }

  objc_msgSend(WeakRetained, "_updateModuleState:notifyDelegate:", 1, 1);
  objc_msgSend(WeakRetained, "_reloadForAuthEvent");
LABEL_20:

}

- (void)setLogoutFuture:(id)a3
{
  NAFuture *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  v5 = (NAFuture *)a3;
  if (self->_logoutFuture != v5)
  {
    objc_storeStrong((id *)&self->_logoutFuture, a3);
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55__HUAppleMusicAccountModuleController_setLogoutFuture___block_invoke;
    v7[3] = &unk_1E6F4E380;
    objc_copyWeak(&v8, &location);
    v6 = (id)-[NAFuture addCompletionBlock:](v5, "addCompletionBlock:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __55__HUAppleMusicAccountModuleController_setLogoutFuture___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(WeakRetained, "setActiveAuthCell:", 0);
  objc_msgSend(WeakRetained, "_enableCells");
  if (v6 && (objc_msgSend(v6, "na_isCancelledError") & 1) == 0)
  {
    objc_msgSend(v6, "hf_errorWithOperationType:options:", *MEMORY[0x1E0D309A8], 0);
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __55__HUAppleMusicAccountModuleController_setLogoutFuture___block_invoke_2;
    v11[3] = &unk_1E6F4DD08;
    objc_copyWeak(&v12, v7);
    objc_msgSend(v10, "handleError:retryBlock:cancelBlock:", v9, v11, 0);

    objc_destroyWeak(&v12);
    v6 = (id)v9;
  }
  else
  {
    objc_msgSend(WeakRetained, "_reloadForAuthEvent");
  }
  objc_msgSend(WeakRetained, "clearLogoutFuture");

}

void __55__HUAppleMusicAccountModuleController_setLogoutFuture___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "logout");

}

- (void)clearLogoutFuture
{
  NAFuture *logoutFuture;

  logoutFuture = self->_logoutFuture;
  self->_logoutFuture = 0;

}

- (id)kickOffManualLogin
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  HUAppleMusicAccountModuleController *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D319D0];
  -[HUAppleMusicAccountModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaProfileContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemIdentifierForAccessories:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v20 = self;
    v21 = 2112;
    v22 = v10;
    v23 = 2112;
    v24 = v8;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ Now posting HFAppleMusicAccountStartManualLoginNotification with task identifier %@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0D30480];
  v17 = *MEMORY[0x1E0D31A30];
  v18 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:userInfo:", v12, 0, v13);

  -[HUAppleMusicAccountModuleController loginButton](self, "loginButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAppleMusicAccountModuleController _setupProxyAuthenticationForAccount:cell:](self, "_setupProxyAuthenticationForAccount:cell:", 0, v14);

  -[HUAppleMusicAccountModuleController loginFuture](self, "loginFuture");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)_setupProxyAuthenticationForAccount:(id)a3 cell:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  HUAppleMusicAccountModuleController *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAppleMusicAccountModuleController loginFuture](self, "loginFuture");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAppleMusicAccountModuleController logoutFuture](self, "logoutFuture");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138413058;
    v15 = self;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    v20 = 2112;
    v21 = v12;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ loginFuture=[%@] logoutFuture=[%@]", (uint8_t *)&v14, 0x2Au);

  }
  if (-[HUAppleMusicAccountModuleController _canExecuteAccountAction](self, "_canExecuteAccountAction"))
  {
    -[HUAppleMusicAccountModuleController setActiveAuthCell:](self, "setActiveAuthCell:", v8);
    -[HUAppleMusicAccountModuleController _disableCells](self, "_disableCells");
    -[HUAppleMusicAccountModuleController _setupButtonCell:enabled:](self, "_setupButtonCell:enabled:", v8, 1);
    -[HUAppleMusicAccountModuleController _proxyLoginWithAccount:cell:](self, "_proxyLoginWithAccount:cell:", v7, v8);
    v13 = objc_claimAutoreleasedReturnValue();
    -[HUAppleMusicAccountModuleController setLoginFuture:](self, "setLoginFuture:", v13);
  }
  else
  {
    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "-[HUAppleMusicAccountModuleController _setupProxyAuthenticationForAccount:] returning", (uint8_t *)&v14, 2u);
    }
  }

}

- (void)_setupCompanionAuthenticationForAccount:(id)a3 cell:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (-[HUAppleMusicAccountModuleController _canExecuteAccountAction](self, "_canExecuteAccountAction"))
  {
    -[HUAppleMusicAccountModuleController setActiveAuthCell:](self, "setActiveAuthCell:", v6);
    -[HUAppleMusicAccountModuleController _disableCells](self, "_disableCells");
    -[HUAppleMusicAccountModuleController _setupButtonCell:enabled:](self, "_setupButtonCell:enabled:", v6, 1);
    -[HUAppleMusicAccountModuleController _companionLoginWithAccount:cell:](self, "_companionLoginWithAccount:cell:", v8, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAppleMusicAccountModuleController setLoginFuture:](self, "setLoginFuture:", v7);

  }
}

- (id)_proxyLoginWithAccount:(id)a3 cell:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t, void *, void *);
  void *v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[HUAppleMusicAccountModuleController module](self, "module");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaProfileContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x1E0D31180]);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __67__HUAppleMusicAccountModuleController__proxyLoginWithAccount_cell___block_invoke;
  v18 = &unk_1E6F57760;
  objc_copyWeak(&v19, &location);
  v12 = (void *)objc_msgSend(v11, "initWithAccessories:account:contextGenerator:", v10, v6, &v15);
  objc_msgSend(v12, "setLoginType:", 2, v15, v16, v17, v18);
  -[HUAppleMusicAccountModuleController _updateModuleState:notifyDelegate:](self, "_updateModuleState:notifyDelegate:", 2, 1);
  objc_msgSend(v12, "pendingArbitrationExecutionFuture");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v13;
}

id __67__HUAppleMusicAccountModuleController__proxyLoginWithAccount_cell___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_authenticationContextForAccessory:account:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_companionLoginWithAccount:(id)a3 cell:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t, void *, void *);
  void *v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[HUAppleMusicAccountModuleController module](self, "module");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaProfileContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x1E0D31180]);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __71__HUAppleMusicAccountModuleController__companionLoginWithAccount_cell___block_invoke;
  v18 = &unk_1E6F57760;
  objc_copyWeak(&v19, &location);
  v12 = (void *)objc_msgSend(v11, "initWithAccessories:account:contextGenerator:", v10, v6, &v15);
  objc_msgSend(v12, "setLoginType:", 0, v15, v16, v17, v18);
  -[HUAppleMusicAccountModuleController _updateModuleState:notifyDelegate:](self, "_updateModuleState:notifyDelegate:", 2, 1);
  objc_msgSend(v12, "pendingArbitrationExecutionFuture");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v13;
}

id __71__HUAppleMusicAccountModuleController__companionLoginWithAccount_cell___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_authenticationContextForAccessory:account:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)logout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  if (-[HUAppleMusicAccountModuleController _canExecuteAccountAction](self, "_canExecuteAccountAction"))
  {
    -[HUAppleMusicAccountModuleController logoutButton](self, "logoutButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAppleMusicAccountModuleController setActiveAuthCell:](self, "setActiveAuthCell:", v3);

    -[HUAppleMusicAccountModuleController _disableCells](self, "_disableCells");
    -[HUAppleMusicAccountModuleController logoutButton](self, "logoutButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAppleMusicAccountModuleController _setupButtonCell:enabled:](self, "_setupButtonCell:enabled:", v4, 1);

    -[HUAppleMusicAccountModuleController _updateModuleState:notifyDelegate:](self, "_updateModuleState:notifyDelegate:", 3, 1);
    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x1E0D31188];
    -[HUAppleMusicAccountModuleController module](self, "module");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaProfileContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessories");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logoutAccessories:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __45__HUAppleMusicAccountModuleController_logout__block_invoke;
    v14 = &unk_1E6F52E88;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v9, "addCompletionBlock:", &v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAppleMusicAccountModuleController setLogoutFuture:](self, "setLogoutFuture:", v10, v11, v12, v13, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __45__HUAppleMusicAccountModuleController_logout__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateModuleState:notifyDelegate:", 0, 1);
  objc_msgSend(WeakRetained, "_enableCells");

}

- (BOOL)_canExecuteAccountAction
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  uint8_t v12[16];

  -[HUAppleMusicAccountModuleController logoutFuture](self, "logoutFuture");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 1;
  v4 = (void *)v3;
  -[HUAppleMusicAccountModuleController logoutFuture](self, "logoutFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isFinished")
    || (-[HUAppleMusicAccountModuleController loginFuture](self, "loginFuture"),
        (v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    return 1;
  }
  v7 = (void *)v6;
  -[HUAppleMusicAccountModuleController loginFuture](self, "loginFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isFinished");

  if ((v9 & 1) != 0)
    return 1;
  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v12 = 0;
    _os_log_debug_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEBUG, "-[HUAppleMusicAccountModuleController _canExecuteAccountAction:] returning NO", v12, 2u);
  }

  return 0;
}

- (void)_disableCells
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[HUAppleMusicAccountModuleController _authCells](self, "_authCells");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[HUAppleMusicAccountModuleController _setupButtonCell:enabled:](self, "_setupButtonCell:enabled:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_enableCells
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[HUAppleMusicAccountModuleController _authCells](self, "_authCells");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[HUAppleMusicAccountModuleController _setupButtonCell:enabled:](self, "_setupButtonCell:enabled:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), 1);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (id)_authCells
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUAppleMusicAccountModuleController itemToCellMap](self, "itemToCellMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_filter:", &__block_literal_global_143);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __49__HUAppleMusicAccountModuleController__authCells__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_updateModuleState:(unint64_t)a3 notifyDelegate:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  char v9;
  id v10;

  v4 = a4;
  -[HUAppleMusicAccountModuleController module](self, "module");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setState:", a3);

  if (v4)
  {
    -[HUAppleMusicAccountModuleController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[HUAppleMusicAccountModuleController delegate](self, "delegate");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appleMusicModuleControllerDidUpdateAuthenticationState:", self);

    }
  }
}

- (void)_reloadForAuthEvent
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (void *)MEMORY[0x1E0D314C0];
  -[HUAppleMusicAccountModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemProviders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestToReloadItemProviders:senderSelector:", v6, a2);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[HUAppleMusicAccountModuleController module](self, "module");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemUpdater");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend((id)v8, "performItemUpdateRequest:", v12);

  -[HUAppleMusicAccountModuleController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[HUAppleMusicAccountModuleController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appleMusicModuleControllerDidUpdateAuthenticationState:", self);

  }
}

- (id)_authenticationContextForAccessory:(id)a3 account:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;

  v6 = a4;
  objc_msgSend(a3, "remoteLoginHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hu_appleMusicInAppAuthenticationContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reschedule:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__HUAppleMusicAccountModuleController__authenticationContextForAccessory_account___block_invoke;
  v14[3] = &unk_1E6F56A18;
  v14[4] = self;
  v15 = v6;
  v11 = v6;
  objc_msgSend(v10, "flatMap:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __82__HUAppleMusicAccountModuleController__authenticationContextForAccessory_account___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appleMusicModuleController:willPresentContext:account:", *(_QWORD *)(a1 + 32), v3, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(v3, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    NSLog(CFSTR("Presenting view controller needs to be populated!"));
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HUAppleMusicAccountModuleControllerDelegate)delegate
{
  return (HUAppleMusicAccountModuleControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HUButtonCell)logoutButton
{
  return (HUButtonCell *)objc_loadWeakRetained((id *)&self->_logoutButton);
}

- (void)setLogoutButton:(id)a3
{
  objc_storeWeak((id *)&self->_logoutButton, a3);
}

- (NAFuture)logoutFuture
{
  return self->_logoutFuture;
}

- (HUButtonCell)loginButton
{
  return (HUButtonCell *)objc_loadWeakRetained((id *)&self->_loginButton);
}

- (void)setLoginButton:(id)a3
{
  objc_storeWeak((id *)&self->_loginButton, a3);
}

- (NAFuture)loginFuture
{
  return self->_loginFuture;
}

- (HUButtonCell)activeAuthCell
{
  return (HUButtonCell *)objc_loadWeakRetained((id *)&self->_activeAuthCell);
}

- (void)setActiveAuthCell:(id)a3
{
  objc_storeWeak((id *)&self->_activeAuthCell, a3);
}

- (NSMapTable)itemToCellMap
{
  return self->_itemToCellMap;
}

- (void)setItemToCellMap:(id)a3
{
  objc_storeStrong((id *)&self->_itemToCellMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemToCellMap, 0);
  objc_destroyWeak((id *)&self->_activeAuthCell);
  objc_storeStrong((id *)&self->_loginFuture, 0);
  objc_destroyWeak((id *)&self->_loginButton);
  objc_storeStrong((id *)&self->_logoutFuture, 0);
  objc_destroyWeak((id *)&self->_logoutButton);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
