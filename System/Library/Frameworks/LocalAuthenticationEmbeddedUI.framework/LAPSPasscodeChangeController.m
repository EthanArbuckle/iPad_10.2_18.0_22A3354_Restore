@implementation LAPSPasscodeChangeController

- (LAPSPasscodeChangeController)initWithSystem:(id)a3 authorizer:(id)a4 ui:(id)a5
{
  id v8;
  id v9;
  id v10;
  LAPSPasscodeChangeControllerOptions *v11;
  LAPSPasscodeChangeController *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(LAPSPasscodeChangeControllerOptions);
  v12 = -[LAPSPasscodeChangeController initWithSystem:authorizer:ui:options:](self, "initWithSystem:authorizer:ui:options:", v10, v9, v8, v11);

  return v12;
}

- (LAPSPasscodeChangeController)initWithSystem:(id)a3 authorizer:(id)a4 ui:(id)a5 options:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  LAPSPasscodeChangeController *v15;
  LAPSPasscodeChangeController *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)LAPSPasscodeChangeController;
  v15 = -[LAPSPasscodeChangeController init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_system, a3);
    objc_storeStrong((id *)&v16->_authorizer, a4);
    objc_storeStrong((id *)&v16->_ui, a5);
    objc_storeStrong((id *)&v16->_options, a6);
    -[LAPSPasscodeChangeUI setDelegate:](v16->_ui, "setDelegate:", v16);
  }

  return v16;
}

- (void)startWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id handler;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, void *);
  void *v11;
  id v12;
  id location;

  v4 = a3;
  v5 = (void *)MEMORY[0x2348AF9C0]();
  handler = self->_handler;
  self->_handler = v5;

  objc_initWeak(&location, self);
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __52__LAPSPasscodeChangeController_startWithCompletion___block_invoke;
  v11 = &unk_24FDCE2C8;
  objc_copyWeak(&v12, &location);
  v7 = (void *)MEMORY[0x2348AF9C0](&v8);
  -[LAPSPasscodeChangeController _runWithCompletion:](self, "_runWithCompletion:", v7, v8, v9, v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __52__LAPSPasscodeChangeController_startWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_notifyCompletionWithPasscode:error:", v8, v5);

}

- (void)cancel
{
  id v3;

  +[LAPSErrorBuilder clientCanceledError](LAPSErrorBuilder, "clientCanceledError");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeController _notifyCompletionWithPasscode:error:](self, "_notifyCompletionWithPasscode:error:", 0, v3);

}

- (void)passcodeChangeUI:(id)a3 verifyPasscode:(id)a4 completion:(id)a5
{
  -[LAPSPasscodeChangeSystem verifyPasscode:completion:](self->_system, "verifyPasscode:completion:", a4, a5);
}

- (void)passcodeChangeUI:(id)a3 verifyNewPasscode:(id)a4 completion:(id)a5
{
  -[LAPSPasscodeChangeSystem verifyNewPasscode:completion:](self->_system, "verifyNewPasscode:completion:", a4, a5);
}

- (void)passcodeChangeUIDidDisappear:(id)a3
{
  id v4;

  +[LAPSErrorBuilder systemCanceledErrorWithDebugDescription:](LAPSErrorBuilder, "systemCanceledErrorWithDebugDescription:", CFSTR("Service UI was dismissed"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeChangeController _notifyCompletionWithPasscode:error:](self, "_notifyCompletionWithPasscode:error:", 0, v4);

}

- (void)_notifyCompletionWithPasscode:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  id handler;
  _QWORD v13[4];
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  LAPSPasscodeChangeController *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self->_handler == 0;
  LACLogPasscodeService();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138543362;
      v19 = self;
      _os_log_impl(&dword_22FE91000, v9, OS_LOG_TYPE_INFO, "%{public}@ Ignoring redundant completion call", buf, 0xCu);
    }
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 138543362;
      v19 = self;
      _os_log_impl(&dword_22FE91000, v9, OS_LOG_TYPE_INFO, "%{public}@ will notify completion", buf, 0xCu);
    }

    v11 = (void *)objc_msgSend(self->_handler, "copy");
    handler = self->_handler;
    self->_handler = 0;

    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __68__LAPSPasscodeChangeController__notifyCompletionWithPasscode_error___block_invoke;
    v13[3] = &unk_24FDCE338;
    objc_copyWeak(&v17, (id *)buf);
    v9 = v11;
    v16 = v9;
    v14 = v6;
    v15 = v7;
    -[LAPSPasscodeChangeController _presentErrorIfNeed:completion:](self, "_presentErrorIfNeed:completion:", v15, v13);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }

}

void __68__LAPSPasscodeChangeController__notifyCompletionWithPasscode_error___block_invoke(id *a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  WeakRetained = (id *)objc_loadWeakRetained(a1 + 7);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained[4], "dismissUIAfterCompletion"))
    {
      (*((void (**)(void))a1[6] + 2))();
      objc_msgSend(v3[2], "deactivateWithCompletion:", &__block_literal_global_7);
    }
    else
    {
      v4 = v3[2];
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = __68__LAPSPasscodeChangeController__notifyCompletionWithPasscode_error___block_invoke_3;
      v5[3] = &unk_24FDCE310;
      v8 = a1[6];
      v6 = a1[4];
      v7 = a1[5];
      objc_msgSend(v4, "deactivateWithCompletion:", v5);

    }
  }

}

uint64_t __68__LAPSPasscodeChangeController__notifyCompletionWithPasscode_error___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_presentErrorIfNeed:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (v14
    && (v8 = +[LAPSErrorBuilder checkErrorIsInteractive:](LAPSErrorBuilder, "checkErrorIsInteractive:", v14), v6 = v14, v8))
  {
    objc_msgSend(v14, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDD0FC8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BDD0FF0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[LALocalizedString ok](LALocalizedString, "ok");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[LAPSPasscodeChangeUI presentAlertWithTitle:message:button:completion:](self->_ui, "presentAlertWithTitle:message:button:completion:", v10, v12, v13, v7);

  }
  else
  {
    ((void (**)(id, id))v7)[2](v7, v6);
  }

}

- (void)_runWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__LAPSPasscodeChangeController__runWithCompletion___block_invoke;
  v6[3] = &unk_24FDCD980;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[LAPSPasscodeChangeController _checkCanChangePasscodeWithCompletion:](self, "_checkCanChangePasscodeWithCompletion:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __51__LAPSPasscodeChangeController__runWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      objc_msgSend(WeakRetained[1], "oldPasscodeRequest");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __51__LAPSPasscodeChangeController__runWithCompletion___block_invoke_2;
      v7[3] = &unk_24FDCE3B0;
      objc_copyWeak(&v9, (id *)(a1 + 40));
      v8 = *(id *)(a1 + 32);
      objc_msgSend(v5, "_fetchOldPasscode:completion:", v6, v7);

      objc_destroyWeak(&v9);
    }
  }

}

void __51__LAPSPasscodeChangeController__runWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  id *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      v9 = (void *)objc_msgSend(WeakRetained[1], "newPasscodeRequest");
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __51__LAPSPasscodeChangeController__runWithCompletion___block_invoke_3;
      v10[3] = &unk_24FDCE388;
      objc_copyWeak(&v13, (id *)(a1 + 40));
      v12 = *(id *)(a1 + 32);
      v11 = v5;
      objc_msgSend(v8, "_fetchNewPasscode:completion:", v9, v10);

      objc_destroyWeak(&v13);
    }
  }

}

void __51__LAPSPasscodeChangeController__runWithCompletion___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      (*((void (**)(void))a1[5] + 2))();
    }
    else
    {
      v9 = (void *)*((_QWORD *)WeakRetained + 1);
      v10 = a1[4];
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __51__LAPSPasscodeChangeController__runWithCompletion___block_invoke_4;
      v11[3] = &unk_24FDCE360;
      objc_copyWeak(&v15, a1 + 6);
      v14 = a1[5];
      v12 = a1[4];
      v13 = v5;
      objc_msgSend(v9, "changePasscode:to:completion:", v10, v13, v11);

      objc_destroyWeak(&v15);
    }
  }

}

void __51__LAPSPasscodeChangeController__runWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = *(_QWORD *)(a1 + 48);
    if (v8)
    {
      (*(void (**)(_QWORD, _QWORD))(v5 + 16))(*(_QWORD *)(a1 + 48), 0);
    }
    else
    {
      if ((objc_msgSend(WeakRetained[4], "skipNewPasscode") & 1) != 0)
        v6 = *(void **)(a1 + 32);
      else
        v6 = *(void **)(a1 + 40);
      objc_msgSend(v6, "passcode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v7, 0);

    }
  }

}

- (void)_checkCanChangePasscodeWithCompletion:(id)a3
{
  id v4;
  LAPSPasscodeChangeSystem *system;
  char v6;
  id v7;
  void *v8;
  LAPSPasscodeChangeAuthorizer *authorizer;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;
  id v14;

  v4 = a3;
  system = self->_system;
  v14 = 0;
  v6 = -[LAPSPasscodeChangeSystem canChangePasscodeWithError:](system, "canChangePasscodeWithError:", &v14);
  v7 = v14;
  v8 = v7;
  if ((v6 & 1) != 0)
  {
    objc_initWeak(&location, self);
    authorizer = self->_authorizer;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __70__LAPSPasscodeChangeController__checkCanChangePasscodeWithCompletion___block_invoke;
    v10[3] = &unk_24FDCD980;
    objc_copyWeak(&v12, &location);
    v11 = v4;
    -[LAPSPasscodeChangeAuthorizer authorizeWithCompletion:](authorizer, "authorizeWithCompletion:", v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    if (!v7)
      -[LAPSPasscodeChangeController _checkCanChangePasscodeWithCompletion:].cold.1();
    (*((void (**)(id, id))v4 + 2))(v4, v7);
  }

}

void __70__LAPSPasscodeChangeController__checkCanChangePasscodeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_fetchOldPasscode:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  LAPSPasscodeChangeUI *ui;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  if (-[LAPSPasscodeChangeControllerOptions skipOldPasscode](self->_options, "skipOldPasscode")
    || (-[LAPSPasscodeChangeControllerOptions oldPasscode](self->_options, "oldPasscode"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    -[LAPSPasscodeChangeController _injectOldPasscodeWithCompletion:](self, "_injectOldPasscodeWithCompletion:", v7);
  }
  else
  {
    objc_initWeak(&location, self);
    ui = self->_ui;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __61__LAPSPasscodeChangeController__fetchOldPasscode_completion___block_invoke;
    v10[3] = &unk_24FDCE3B0;
    objc_copyWeak(&v12, &location);
    v11 = v7;
    -[LAPSPasscodeChangeUI fetchOldPasscode:completion:](ui, "fetchOldPasscode:completion:", v6, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __61__LAPSPasscodeChangeController__fetchOldPasscode_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  if (!(v5 | v6))
    __61__LAPSPasscodeChangeController__fetchOldPasscode_completion___block_invoke_cold_1();
  v7 = (void *)v6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v7)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      v10 = (void *)*((_QWORD *)WeakRetained + 1);
      objc_msgSend((id)v5, "passcode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __61__LAPSPasscodeChangeController__fetchOldPasscode_completion___block_invoke_2;
      v12[3] = &unk_24FDCE3D8;
      objc_copyWeak(&v15, (id *)(a1 + 40));
      v14 = *(id *)(a1 + 32);
      v13 = (id)v5;
      objc_msgSend(v10, "verifyPasscode:completion:", v11, v12);

      objc_destroyWeak(&v15);
    }
  }

}

void __61__LAPSPasscodeChangeController__fetchOldPasscode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_injectOldPasscodeWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  LAPSFetchOldPasscodeResult *v6;
  void *v7;
  LAPSFetchOldPasscodeResult *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  void (**v13)(id, void *, _QWORD);

  v4 = (void (**)(id, void *, _QWORD))a3;
  if (!-[LAPSPasscodeChangeControllerOptions skipOldPasscode](self->_options, "skipOldPasscode"))
  {
    -[LAPSPasscodeChangeControllerOptions oldPasscode](self->_options, "oldPasscode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      -[LAPSPasscodeChangeController _injectOldPasscodeWithCompletion:].cold.1();

  }
  if (-[LAPSPasscodeChangeControllerOptions skipOldPasscode](self->_options, "skipOldPasscode"))
  {
    v6 = [LAPSFetchOldPasscodeResult alloc];
    +[LAPSPasscode emptyPasscode](LAPSPasscode, "emptyPasscode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[LAPSFetchOldPasscodeResult initWithPasscode:](v6, "initWithPasscode:", v7);
    v4[2](v4, v8, 0);

  }
  else
  {
    -[LAPSPasscodeChangeControllerOptions oldPasscode](self->_options, "oldPasscode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[LAPSPasscodeChangeControllerOptions oldPasscode](self->_options, "oldPasscode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __65__LAPSPasscodeChangeController__injectOldPasscodeWithCompletion___block_invoke;
      v12[3] = &unk_24FDCE400;
      v13 = v4;
      -[LAPSPasscodeChangeController _extractPasscode:completion:](self, "_extractPasscode:completion:", v10, v12);

    }
    else
    {
      +[LAPSErrorBuilder genericErrorWithDebugDescription:](LAPSErrorBuilder, "genericErrorWithDebugDescription:", CFSTR("Unexpected controller configuration"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v4)[2](v4, 0, v11);

    }
  }

}

void __65__LAPSPasscodeChangeController__injectOldPasscodeWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  LAPSFetchOldPasscodeResult *v6;
  id v7;

  v7 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 16))(v5, 0, a3);
  }
  else
  {
    v6 = -[LAPSFetchOldPasscodeResult initWithPasscode:]([LAPSFetchOldPasscodeResult alloc], "initWithPasscode:", v7);
    (*(void (**)(uint64_t, LAPSFetchOldPasscodeResult *, _QWORD))(v5 + 16))(v5, v6, 0);

  }
}

- (void)_fetchNewPasscode:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  LAPSPasscodeChangeUI *ui;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  if (-[LAPSPasscodeChangeControllerOptions skipNewPasscode](self->_options, "skipNewPasscode")
    || (-[LAPSPasscodeChangeControllerOptions newPasscode](self->_options, "newPasscode"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    -[LAPSPasscodeChangeController _injectNewPasscodeWithCompletion:](self, "_injectNewPasscodeWithCompletion:", v7);
  }
  else
  {
    objc_initWeak(&location, self);
    ui = self->_ui;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __61__LAPSPasscodeChangeController__fetchNewPasscode_completion___block_invoke;
    v10[3] = &unk_24FDCE428;
    objc_copyWeak(&v12, &location);
    v11 = v7;
    -[LAPSPasscodeChangeUI fetchNewPasscode:completion:](ui, "fetchNewPasscode:completion:", v6, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __61__LAPSPasscodeChangeController__fetchNewPasscode_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  if (!(v5 | v6))
    __61__LAPSPasscodeChangeController__fetchNewPasscode_completion___block_invoke_cold_1();
  v7 = (void *)v6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v7)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      v10 = (void *)*((_QWORD *)WeakRetained + 1);
      objc_msgSend((id)v5, "passcode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __61__LAPSPasscodeChangeController__fetchNewPasscode_completion___block_invoke_2;
      v12[3] = &unk_24FDCE3D8;
      objc_copyWeak(&v15, (id *)(a1 + 40));
      v14 = *(id *)(a1 + 32);
      v13 = (id)v5;
      objc_msgSend(v10, "verifyNewPasscode:completion:", v11, v12);

      objc_destroyWeak(&v15);
    }
  }

}

void __61__LAPSPasscodeChangeController__fetchNewPasscode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void (*v6)(void);
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v7)
    {
      objc_msgSend(v7, "domain");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.LocalAuthentication.LAPSErrorDomain")) & 1) != 0)
      {
        v5 = objc_msgSend(v7, "code");

        if (v5 == 5)
          goto LABEL_5;
      }
      else
      {

      }
      v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
      goto LABEL_8;
    }
LABEL_5:
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_8:
    v6();
  }

}

- (void)_injectNewPasscodeWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  LAPSFetchNewPasscodeResult *v6;
  void *v7;
  LAPSFetchNewPasscodeResult *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  void (**v13)(id, void *, _QWORD);

  v4 = (void (**)(id, void *, _QWORD))a3;
  if (!-[LAPSPasscodeChangeControllerOptions skipNewPasscode](self->_options, "skipNewPasscode"))
  {
    -[LAPSPasscodeChangeControllerOptions newPasscode](self->_options, "newPasscode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      -[LAPSPasscodeChangeController _injectNewPasscodeWithCompletion:].cold.1();

  }
  if (-[LAPSPasscodeChangeControllerOptions skipNewPasscode](self->_options, "skipNewPasscode"))
  {
    v6 = [LAPSFetchNewPasscodeResult alloc];
    +[LAPSPasscode emptyPasscode](LAPSPasscode, "emptyPasscode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[LAPSFetchNewPasscodeResult initWithPasscode:isPasscodeRecoveryEnabled:](v6, "initWithPasscode:isPasscodeRecoveryEnabled:", v7, -[LAPSPasscodeChangeControllerOptions skipNewPasscode](self->_options, "skipNewPasscode") ^ 1);
    v4[2](v4, v8, 0);

  }
  else
  {
    -[LAPSPasscodeChangeControllerOptions newPasscode](self->_options, "newPasscode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[LAPSPasscodeChangeControllerOptions newPasscode](self->_options, "newPasscode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __65__LAPSPasscodeChangeController__injectNewPasscodeWithCompletion___block_invoke;
      v12[3] = &unk_24FDCE450;
      v12[4] = self;
      v13 = v4;
      -[LAPSPasscodeChangeController _extractPasscode:completion:](self, "_extractPasscode:completion:", v10, v12);

    }
    else
    {
      +[LAPSErrorBuilder genericErrorWithDebugDescription:](LAPSErrorBuilder, "genericErrorWithDebugDescription:", CFSTR("Unexpected controller configuration"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v4)[2](v4, 0, v11);

    }
  }

}

void __65__LAPSPasscodeChangeController__injectNewPasscodeWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  LAPSFetchNewPasscodeResult *v6;
  id v7;

  v7 = a2;
  v5 = *(_QWORD *)(a1 + 40);
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t))(v5 + 16))(*(_QWORD *)(a1 + 40), 0, a3);
  }
  else
  {
    v6 = -[LAPSFetchNewPasscodeResult initWithPasscode:isPasscodeRecoveryEnabled:]([LAPSFetchNewPasscodeResult alloc], "initWithPasscode:isPasscodeRecoveryEnabled:", v7, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "skipNewPasscode") ^ 1);
    (*(void (**)(uint64_t, LAPSFetchNewPasscodeResult *, _QWORD))(v5 + 16))(v5, v6, 0);

  }
}

- (void)_extractPasscode:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__LAPSPasscodeChangeController__extractPasscode_completion___block_invoke;
  v7[3] = &unk_24FDCE478;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "extractPasswordWithCompletion:", v7);

}

void __60__LAPSPasscodeChangeController__extractPasscode_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  LAPSPasscode *v7;
  LAPSPasscode *v8;
  id v9;

  v9 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    +[LAPSErrorBuilder genericErrorWithUnderlyingError:](LAPSErrorBuilder, "genericErrorWithUnderlyingError:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);
  }
  else
  {
    v7 = [LAPSPasscode alloc];
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v9, 4);
    v8 = -[LAPSPasscode initWithPasscode:](v7, "initWithPasscode:", v6);
    (*(void (**)(uint64_t, LAPSPasscode *, _QWORD))(v5 + 16))(v5, v8, 0);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_authorizer, 0);
  objc_storeStrong((id *)&self->_ui, 0);
  objc_storeStrong((id *)&self->_system, 0);
}

- (void)_checkCanChangePasscodeWithCompletion:.cold.1()
{
  __assert_rtn("-[LAPSPasscodeChangeController _checkCanChangePasscodeWithCompletion:]", "LAPSPasscodeChangeController.m", 188, "outError");
}

void __61__LAPSPasscodeChangeController__fetchOldPasscode_completion___block_invoke_cold_1()
{
  __assert_rtn("-[LAPSPasscodeChangeController _fetchOldPasscode:completion:]_block_invoke", "LAPSPasscodeChangeController.m", 216, "result != nil || error != nil");
}

- (void)_injectOldPasscodeWithCompletion:.cold.1()
{
  __assert_rtn("-[LAPSPasscodeChangeController _injectOldPasscodeWithCompletion:]", "LAPSPasscodeChangeController.m", 242, "[_options skipOldPasscode] || [_options oldPasscode]");
}

void __61__LAPSPasscodeChangeController__fetchNewPasscode_completion___block_invoke_cold_1()
{
  __assert_rtn("-[LAPSPasscodeChangeController _fetchNewPasscode:completion:]_block_invoke", "LAPSPasscodeChangeController.m", 273, "result != nil || error != nil");
}

- (void)_injectNewPasscodeWithCompletion:.cold.1()
{
  __assert_rtn("-[LAPSPasscodeChangeController _injectNewPasscodeWithCompletion:]", "LAPSPasscodeChangeController.m", 299, "[_options skipNewPasscode] || [_options newPasscode]");
}

@end
