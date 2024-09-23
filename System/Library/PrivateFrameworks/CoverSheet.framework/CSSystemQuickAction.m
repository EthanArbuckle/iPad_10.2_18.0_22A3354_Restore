@implementation CSSystemQuickAction

- (CSSystemQuickAction)initWithQuickActionControlIdentity:(id)a3 instance:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  CSSystemQuickAction *v12;
  CSSystemQuickAction *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CSSystemQuickAction;
  v12 = -[CSSystemQuickAction init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_controlIdentity, a3);
    objc_storeStrong((id *)&v13->_controlInstance, a4);
    objc_storeWeak((id *)&v13->_systemQuickActionDelegate, v11);
    -[CHUISControlInstance setDelegate:](v13->_controlInstance, "setDelegate:", v13);
    -[CHUISControlInstance registerObserver:](v13->_controlInstance, "registerObserver:", v13);
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[CHUISControlInstance invalidate](self->_controlInstance, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CSSystemQuickAction;
  -[CSSystemQuickAction dealloc](&v3, sel_dealloc);
}

- (id)statisticsIdentifier
{
  return CFSTR("system");
}

- (id)accessoryTitleKey
{
  return 0;
}

- (int64_t)appearance
{
  void *v3;
  char v4;
  void *v6;
  unsigned int v7;

  -[CSSystemQuickAction viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDisabled");

  if ((v4 & 1) != 0)
    return 2;
  -[CSSystemQuickAction viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isRedacted");

  return v7;
}

- (BOOL)allowsInteraction
{
  void *v2;
  char v3;

  -[CSSystemQuickAction viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisabled") ^ 1;

  return v3;
}

- (BOOL)_intentIsCameraCaptureIntent:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  if (!a3)
    return 0;
  objc_msgSend(a3, "linkAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemProtocols");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_firstObjectPassingTest:", &__block_literal_global_17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5 != 0;
  return v6;
}

uint64_t __52__CSSystemQuickAction__intentIsCameraCaptureIntent___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D44268], "cameraCaptureProtocol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isEqualToString:", v4);

  return v5;
}

- (void)touchBegan
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_systemQuickActionDelegate);
  objc_msgSend(WeakRetained, "systemQuickActionTouchBegan:", self);

}

- (void)fireAction
{
  NSObject *v3;
  void *v4;
  CHUISControlInstance *controlInstance;
  _QWORD v6[5];
  uint8_t buf[4];
  CSSystemQuickAction *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SBLogDashBoard();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[CHSControlIdentity kind](self->_controlIdentity, "kind");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v8 = self;
    v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_1D0337000, v3, OS_LOG_TYPE_DEFAULT, "[Quick Action] Will fire action %{public}@: %{public}@", buf, 0x16u);

  }
  controlInstance = self->_controlInstance;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__CSSystemQuickAction_fireAction__block_invoke;
  v6[3] = &unk_1E8E2FC20;
  v6[4] = self;
  -[CHUISControlInstance performControlActionWithCompletion:](controlInstance, "performControlActionWithCompletion:", v6);
}

void __33__CSSystemQuickAction_fireAction__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "systemQuickActionActionFired:", *(_QWORD *)(a1 + 32));

}

- (void)touchEnded
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_systemQuickActionDelegate);
  objc_msgSend(WeakRetained, "systemQuickActionTouchEnded:", self);

}

- (BOOL)controlInstance:(id)a3 handlePerformAction:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  char v13;

  v5 = a3;
  objc_msgSend(v5, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isCameraCapture");

  if (v8)
  {
    objc_msgSend(v5, "control");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "extensionIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "containerBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_systemQuickActionDelegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = objc_msgSend(WeakRetained, "systemQuickActionLaunchCaptureApplication:", v11);
    else
      v13 = 0;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)controlInstanceViewModelDidChange:(id)a3
{
  id v4;

  -[CSQuickAction delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "isSelectedDidChangeForAction:", self);
  objc_msgSend(v4, "allowsInteractionDidChangeForAction:", self);

}

- (CHUISControlViewModel)viewModel
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;

  -[CSSystemQuickAction controlInstance](self, "controlInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CSSystemQuickAction controlInstance](self, "controlInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    v11 = v9;
    if (v10)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
    }
    v13 = v12;

    if (v13)
    {
      objc_msgSend(v13, "viewModel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  return (CHUISControlViewModel *)v8;
}

- (CHSControlIdentity)controlIdentity
{
  return self->_controlIdentity;
}

- (CHUISControlInstance)controlInstance
{
  return self->_controlInstance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlInstance, 0);
  objc_storeStrong((id *)&self->_controlIdentity, 0);
  objc_destroyWeak((id *)&self->_systemQuickActionDelegate);
}

@end
