@implementation LAPSPasscodeOptionsAlertViewController

- (LAPSPasscodeOptionsAlertViewController)initWithConfiguration:(id)a3
{
  id v5;
  LAPSPasscodeOptionsAlertViewController *v6;
  LAPSPasscodeOptionsAlertViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LAPSPasscodeOptionsAlertViewController;
  v6 = -[LAPSPasscodeOptionsAlertViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_config, a3);

  return v7;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LAPSPasscodeOptionsAlertViewController;
  -[LAPSPasscodeOptionsAlertViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[LAPSPasscodeOptionsAlertViewController _setup](self, "_setup");
}

- (void)viewDidDisappear:(BOOL)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LAPSPasscodeOptionsAlertViewController;
  -[LAPSPasscodeOptionsAlertViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "passcodeOptionsViewControllerDidDisappear:", self);

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return 30;
  else
    return 2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_setup
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[LAPSPasscodeOptionsAlertViewController _addSectionDelimiter](self, "_addSectionDelimiter");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[LAPSPasscodeOptionsViewControllerConfiguration allowedPasscodeTypes](self->_config, "allowedPasscodeTypes", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[LAPSPasscodeOptionsAlertViewController _addActionForPasscodeType:](self, "_addActionForPasscodeType:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  if (-[LAPSPasscodeOptionsViewControllerConfiguration isPasscodeRecoverySupported](self->_config, "isPasscodeRecoverySupported")&& -[LAPSPasscodeOptionsViewControllerConfiguration isPasscodeRecoveryOptionVisible](self->_config, "isPasscodeRecoveryOptionVisible"))
  {
    -[LAPSPasscodeOptionsAlertViewController _addActionForRecoveryEnabled:restricted:](self, "_addActionForRecoveryEnabled:restricted:", -[LAPSPasscodeOptionsViewControllerConfiguration isPasscodeRecoveryEnabled](self->_config, "isPasscodeRecoveryEnabled"), -[LAPSPasscodeOptionsViewControllerConfiguration isPasscodeRecoveryRestricted](self->_config, "isPasscodeRecoveryRestricted"));
  }
  -[LAPSPasscodeOptionsViewControllerConfiguration cancelTitle](self->_config, "cancelTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeOptionsAlertViewController _addActionWithTitle:style:completion:](self, "_addActionWithTitle:style:completion:", v8, 1, &__block_literal_global_6);

}

- (void)_addActionForPasscodeType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__LAPSPasscodeOptionsAlertViewController__addActionForPasscodeType___block_invoke;
  v7[3] = &unk_24FDCE1F0;
  v8 = v4;
  v6 = v4;
  -[LAPSPasscodeOptionsAlertViewController _addActionWithTitle:style:completion:](self, "_addActionWithTitle:style:completion:", v5, 0, v7);

}

void __68__LAPSPasscodeOptionsAlertViewController__addActionForPasscodeType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "passcodeOptionsViewController:didSelectPasscodeType:", v3, *(_QWORD *)(a1 + 32));

}

- (void)_addActionForRecoveryEnabled:(BOOL)a3 restricted:(BOOL)a4
{
  BOOL v6;
  LAPSPasscodeOptionsViewControllerConfiguration *config;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  BOOL v11;

  v6 = -[LAPSPasscodeOptionsViewControllerConfiguration isPasscodeRecoveryEnabled](self->_config, "isPasscodeRecoveryEnabled", a3, a4);
  config = self->_config;
  if (v6)
    -[LAPSPasscodeOptionsViewControllerConfiguration passcodeRecoveryEnabledTitle](config, "passcodeRecoveryEnabledTitle");
  else
    -[LAPSPasscodeOptionsViewControllerConfiguration passcodeRecoveryDisabledTitle](config, "passcodeRecoveryDisabledTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[LAPSPasscodeOptionsViewControllerConfiguration isPasscodeRecoveryEnabled](self->_config, "isPasscodeRecoveryEnabled"))
  {
    v9 = 2;
  }
  else
  {
    v9 = 0;
  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __82__LAPSPasscodeOptionsAlertViewController__addActionForRecoveryEnabled_restricted___block_invoke;
  v10[3] = &__block_descriptor_33_e48_v16__0__LAPSPasscodeOptionsAlertViewController_8l;
  v11 = a3;
  -[LAPSPasscodeOptionsAlertViewController _addActionWithTitle:style:completion:](self, "_addActionWithTitle:style:completion:", v8, v9, v10);
  -[LAPSPasscodeOptionsAlertViewController _setActionWithTitle:enabled:](self, "_setActionWithTitle:enabled:", v8, -[LAPSPasscodeOptionsViewControllerConfiguration isPasscodeRecoveryRestricted](self->_config, "isPasscodeRecoveryRestricted") ^ 1);

}

void __82__LAPSPasscodeOptionsAlertViewController__addActionForRecoveryEnabled_restricted___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "passcodeOptionsViewController:didSetPasscodeRecoveryEnabled:", v3, *(_BYTE *)(a1 + 32) == 0);

}

- (void)_addActionWithTitle:(id)a3 style:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __79__LAPSPasscodeOptionsAlertViewController__addActionWithTitle_style_completion___block_invoke;
  v11[3] = &unk_24FDCD9A8;
  objc_copyWeak(&v13, &location);
  v10 = v9;
  v12 = v10;
  -[LAPSPasscodeOptionsAlertViewController _addActionWithTitle:style:handler:shouldDismissHandler:](self, "_addActionWithTitle:style:handler:shouldDismissHandler:", v8, a4, v11, &__block_literal_global_7_0);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __79__LAPSPasscodeOptionsAlertViewController__addActionWithTitle_style_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    objc_msgSend(v3, "_dismiss");
    WeakRetained = v3;
  }

}

uint64_t __79__LAPSPasscodeOptionsAlertViewController__addActionWithTitle_style_completion___block_invoke_2()
{
  return 0;
}

- (void)_setActionWithTitle:(id)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[LAPSPasscodeOptionsAlertViewController actions](self, "actions", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v12, "title");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v6);

        if (v14)
          objc_msgSend(v12, "setEnabled:", v4);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

- (void)_dismiss
{
  void *v3;

  -[LAPSPasscodeOptionsAlertViewController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[LAPSPasscodeOptionsAlertViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_8);
}

- (LAPSPasscodeOptionsViewControllerDelegate)delegate
{
  return (LAPSPasscodeOptionsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
