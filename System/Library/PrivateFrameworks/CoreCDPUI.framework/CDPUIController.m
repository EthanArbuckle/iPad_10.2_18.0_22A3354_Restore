@implementation CDPUIController

- (void)cancelTapped:(id)a3
{
  NSObject *v4;
  CDPRecoveryKeyEntryViewModel *recoveryKeyViewModel;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  _QWORD v8[5];
  uint8_t buf[16];

  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DC8F000, v4, OS_LOG_TYPE_DEFAULT, "\"Cancel was tapped in CDPUIController\", buf, 2u);
  }

  recoveryKeyViewModel = self->_recoveryKeyViewModel;
  if (recoveryKeyViewModel)
  {
    -[CDPRecoveryKeyEntryViewModel completionHandler](recoveryKeyViewModel, "completionHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    _CDPStateError();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v6)[2](v6, 0, v7);

  }
  else
  {
    -[CDPUIController dismissRemoteApprovalWaitingScreenWithAction:](self, "dismissRemoteApprovalWaitingScreenWithAction:", 1);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __32__CDPUIController_cancelTapped___block_invoke;
    v8[3] = &unk_24C8541C0;
    v8[4] = self;
    -[CDPUIController _dismissPresentedViewControllerWithReason:completion:](self, "_dismissPresentedViewControllerWithReason:completion:", CFSTR("com.apple.CoreCDPUI.CDPEnrollmentCancelled"), v8);
  }
}

void __32__CDPUIController_cancelTapped___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  _CDPStateError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cancelValidationWithError:", v2);

}

- (void)tryAgainLaterTapped:(id)a3
{
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DC8F000, v4, OS_LOG_TYPE_DEFAULT, "\"Try Again Later was tapped in CDPUIController\", buf, 2u);
  }

  -[CDPUIController dismissRemoteApprovalWaitingScreenWithAction:](self, "dismissRemoteApprovalWaitingScreenWithAction:", 1);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__CDPUIController_tryAgainLaterTapped___block_invoke;
  v5[3] = &unk_24C8541C0;
  v5[4] = self;
  -[CDPUIController _dismissPresentedViewControllerWithReason:completion:](self, "_dismissPresentedViewControllerWithReason:completion:", CFSTR("com.apple.CoreCDPUI.CDPEnrollmentCancelled"), v5);
}

void __39__CDPUIController_tryAgainLaterTapped___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  _CDPStateError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cancelValidationWithError:", v2);

}

- (BOOL)forceInlinePresentation
{
  return self->_forceInlinePresentation;
}

- (void)backTappedFromRoot:(id)a3
{
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  uint8_t buf[16];

  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DC8F000, v4, OS_LOG_TYPE_DEFAULT, "\"Back was tapped from root view controller. Popping root view controller...\", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BEBD788], "_setUseCustomBackButtonAction:", 0);
  v5 = -[UINavigationController popViewControllerAnimated:](self->_navController, "popViewControllerAnimated:", 1);
  -[UINavigationController transitionCoordinator](self->_navController, "transitionCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __38__CDPUIController_backTappedFromRoot___block_invoke_23;
    v9[3] = &unk_24C854228;
    v9[4] = self;
    objc_msgSend(v6, "animateAlongsideTransition:completion:", &__block_literal_global, v9);
  }
  else
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DC8F000, v8, OS_LOG_TYPE_DEFAULT, "\"Finished popping root controller (no animate), cancelling validation\", buf, 2u);
    }

    -[CDPUIController handleBackPopCompletion](self, "handleBackPopCompletion");
  }

}

void __38__CDPUIController_backTappedFromRoot___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  _CDPLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20DC8F000, v0, OS_LOG_TYPE_DEFAULT, "\"Animating back event...\", v1, 2u);
  }

}

uint64_t __38__CDPUIController_backTappedFromRoot___block_invoke_23(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20DC8F000, v2, OS_LOG_TYPE_DEFAULT, "\"Finished popping root controller, cancelling validation\", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "handleBackPopCompletion");
}

- (void)handleBackPopCompletion
{
  void *v2;
  CDPRemoteDeviceSecretValidator *remoteSecretValidator;
  void (**v4)(id, _QWORD, void *);

  if (self->_recoveryKeyViewModel)
  {
    -[CDPRecoveryKeyEntryViewModel completionHandler](self->_recoveryKeyViewModel, "completionHandler");
    v4 = (void (**)(id, _QWORD, void *))objc_claimAutoreleasedReturnValue();
    _CDPStateError();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v2);

  }
  else
  {
    remoteSecretValidator = self->_remoteSecretValidator;
    _CDPStateError();
    v4 = (void (**)(id, _QWORD, void *))objc_claimAutoreleasedReturnValue();
    -[CDPRemoteDeviceSecretValidator cancelValidationWithError:](remoteSecretValidator, "cancelValidationWithError:");
  }

}

- (void)_dismissPresentedViewControllerCompletion:(id)a3
{
  void (**v4)(_QWORD);
  BOOL v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;

  v4 = (void (**)(_QWORD))a3;
  v5 = -[CDPUIController forceInlinePresentation](self, "forceInlinePresentation");
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
      -[CDPUIController _dismissPresentedViewControllerCompletion:].cold.1(self);

    if (v4)
      v4[2](v4);
  }
  else
  {
    if (v7)
      -[CDPUIController _dismissPresentedViewControllerCompletion:].cold.2(self);

    -[CDPUIBaseController presentingViewController](self, "presentingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, v4);

  }
}

- (void)_presentRootController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id WeakRetained;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  id v13;
  char v14;
  id v15;
  _QWORD aBlock[5];
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super._presentingViewController);
    *(_DWORD *)buf = 138412546;
    v20 = v6;
    v21 = 2112;
    v22 = WeakRetained;
    _os_log_impl(&dword_20DC8F000, v8, OS_LOG_TYPE_DEFAULT, "\"Presenting %@ onto %@\", buf, 0x16u);

  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__CDPUIController__presentRootController_completion___block_invoke;
  aBlock[3] = &unk_24C8542A0;
  aBlock[4] = self;
  v10 = v6;
  v17 = v10;
  v11 = v7;
  v18 = v11;
  v12 = (void (**)(_QWORD))_Block_copy(aBlock);
  v13 = objc_loadWeakRetained((id *)&self->_delegate);
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    v15 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v15, "uiController:preparePresentationContext:", self, v12);

  }
  else
  {
    v12[2](v12);
  }

}

void __53__CDPUIController__presentRootController_completion___block_invoke(id *a1)
{
  id *v2;
  id *v3;
  char isKindOfClass;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  _QWORD *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  double v53;
  NSObject *v54;
  dispatch_time_t v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  __int128 buf;
  Class (*v72)(uint64_t);
  void *v73;
  uint64_t *v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v2 = a1 + 5;
  v3 = a1 + 4;
  objc_storeStrong((id *)a1[4] + 6, a1[5]);
  objc_msgSend(*v2, "setPreferredContentSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (!objc_msgSend(*v3, "forceInlinePresentation") || (isKindOfClass & 1) == 0)
  {
    v5 = a1[4];
    v6 = v5[14];
    v7 = v5[6];
    v8 = objc_alloc(MEMORY[0x24BEBD410]);
    v9 = a1[4];
    if (v6 == v7)
    {
      v12 = (void *)objc_msgSend(v8, "initWithBarButtonSystemItem:target:action:", 1, v9, sel_remoteSecretEntryDidRequestCancellation);
      objc_msgSend(a1[5], "navigationItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setLeftBarButtonItem:", v12);

      objc_msgSend(a1[5], "navigationItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "leftBarButtonItem");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = a1[4];
      v11 = (void *)v15[13];
      v15[13] = v14;
    }
    else
    {
      v10 = (void *)objc_msgSend(v8, "initWithBarButtonSystemItem:target:action:", 1, v9, sel_cancelTapped_);
      objc_msgSend(a1[5], "navigationItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setLeftBarButtonItem:", v10);
    }

    objc_msgSend(a1[5], "setModalInPresentation:", 1);
  }
  if (!objc_msgSend(a1[4], "forceInlinePresentation"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "userInterfaceIdiom");

      if (v25 == 1)
        objc_msgSend(a1[5], "setModalPresentationStyle:", 2);
      objc_msgSend(a1[4], "presentingViewController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      v28 = a1[5];
      v29 = 0;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = objc_alloc_init(MEMORY[0x24BE75588]);
        objc_msgSend(a1[4], "presentingViewController");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_opt_respondsToSelector();

        if ((v31 & 1) != 0)
        {
          objc_msgSend(a1[4], "presentingViewController");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "rootController");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setRootController:", v33);

        }
        objc_msgSend(a1[4], "presentingViewController");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "conformsToProtocol:", &unk_2549F7A08);

        if (v35)
        {
          objc_msgSend(a1[4], "presentingViewController");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setParentController:", v36);

        }
        objc_storeStrong((id *)a1[4] + 4, v27);
        objc_msgSend(v27, "showController:", a1[5]);
        objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "userInterfaceIdiom");

        if (v38 == 1)
          objc_msgSend(a1[5], "setModalPresentationStyle:", 2);
        objc_msgSend(a1[4], "presentingViewController");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "presentViewController:animated:completion:", v27, 1, 0);

        goto LABEL_31;
      }
      v48 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", a1[5]);
      v49 = a1[4];
      v50 = (void *)v49[4];
      v49[4] = v48;

      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "userInterfaceIdiom");

      if (v52 == 1)
        objc_msgSend(*((id *)a1[4] + 4), "setModalPresentationStyle:", 2);
      objc_msgSend(a1[4], "presentingViewController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      v28 = (id)*((_QWORD *)a1[4] + 4);
      v29 = a1[6];
    }
    objc_msgSend(v26, "presentViewController:animated:completion:", v28, 1, v29);
LABEL_31:

    goto LABEL_41;
  }
  objc_msgSend(a1[4], "presentingViewController");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)*((_QWORD *)a1[4] + 4);
  *((_QWORD *)a1[4] + 4) = v16;

  objc_msgSend(*((id *)a1[4] + 4), "setNavigationBarHidden:", 0);
  objc_msgSend(*((id *)a1[4] + 4), "viewControllers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  objc_msgSend(*((id *)a1[4] + 4), "topViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v21 = objc_opt_isKindOfClass();

  if ((v21 & 1) != 0)
  {
    _CDPLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      __53__CDPUIController__presentRootController_completion___block_invoke_cold_1();

    objc_msgSend(*((id *)a1[4] + 4), "topViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(*((id *)a1[4] + 4), "viewControllers");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "count");

      if (v41)
      {
        objc_msgSend(MEMORY[0x24BEBD788], "_setUseCustomBackButtonAction:", 1);
        v42 = objc_alloc(MEMORY[0x24BEBD410]);
        objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("GENERIC_BACK_BUTTON"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "localizedString");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)objc_msgSend(v42, "initWithTitle:style:target:action:", v44, 0, a1[4], sel_backTappedFromRoot_);
        objc_msgSend(*((id *)a1[4] + 4), "topViewController");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "navigationItem");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setBackBarButtonItem:", v45);

      }
      else
      {
        v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, a1[4], sel_cancelTapped_);
        objc_msgSend(a1[5], "navigationItem");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setLeftBarButtonItem:", v43);
      }

    }
    v23 = 0;
  }
  objc_msgSend(v19, "addObject:", a1[5]);
  objc_msgSend(v19, "removeObject:", v23);
  if (objc_msgSend(*((id *)a1[4] + 7), "idmsMasterKeyRecovery"))
    v53 = 2.0;
  else
    v53 = 0.0;
  _CDPLogSystem();
  v54 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(double *)((char *)&buf + 4) = v53;
    _os_log_impl(&dword_20DC8F000, v54, OS_LOG_TYPE_DEFAULT, "\"Attempting to push with delay: %f\", (uint8_t *)&buf, 0xCu);
  }

  v55 = dispatch_time(0, (uint64_t)(v53 * 1000000000.0));
  v62[0] = MEMORY[0x24BDAC760];
  v62[1] = 3221225472;
  v62[2] = __53__CDPUIController__presentRootController_completion___block_invoke_34;
  v62[3] = &unk_24C854278;
  v56 = a1[5];
  v57 = a1[4];
  v63 = v56;
  v64 = v57;
  v65 = v19;
  v66 = a1[6];
  v58 = v19;
  dispatch_after(v55, MEMORY[0x24BDAC9B8], v62);

LABEL_41:
  v67 = 0;
  v68 = &v67;
  v69 = 0x2050000000;
  v59 = (void *)getBFFStyleClass_softClass;
  v70 = getBFFStyleClass_softClass;
  if (!getBFFStyleClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v72 = __getBFFStyleClass_block_invoke;
    v73 = &unk_24C854C48;
    v74 = &v67;
    __getBFFStyleClass_block_invoke((uint64_t)&buf);
    v59 = (void *)v68[3];
  }
  v60 = objc_retainAutorelease(v59);
  _Block_object_dispose(&v67, 8);
  objc_msgSend(v60, "sharedStyle");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "applyThemeToNavigationController:", *((_QWORD *)a1[4] + 4));

}

void __53__CDPUIController__presentRootController_completion___block_invoke_34(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __53__CDPUIController__presentRootController_completion___block_invoke_34_cold_1();

  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
  v4 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  objc_msgSend(v3, "setViewControllers:animated:", v4, 1);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "transitionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__CDPUIController__presentRootController_completion___block_invoke_35;
  v8[3] = &unk_24C854250;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9 = v6;
  v10 = v7;
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v5, "animateAlongsideTransition:completion:", 0, v8);

}

uint64_t __53__CDPUIController__presentRootController_completion___block_invoke_35(_QWORD *a1)
{
  NSObject *v2;
  id WeakRetained;
  char v4;
  id v5;
  uint64_t result;

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __53__CDPUIController__presentRootController_completion___block_invoke_35_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 152));
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)(a1[5] + 152));
    objc_msgSend(v5, "uiController:didPresentRootViewController:", a1[5], a1[4]);

  }
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)cdpContext:(id)a3 promptForInteractiveAuthenticationWithCompletion:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  char v9;
  id v10;
  objc_super v11;
  _QWORD v12[4];
  id v13;
  CDPUIController *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __79__CDPUIController_cdpContext_promptForInteractiveAuthenticationWithCompletion___block_invoke;
    v12[3] = &unk_24C8542C8;
    v13 = v6;
    v14 = self;
    v15 = v7;
    objc_msgSend(v10, "uiController:prepareAlertContext:", self, v12);

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CDPUIController;
    -[CDPUIBaseController cdpContext:promptForInteractiveAuthenticationWithCompletion:](&v11, sel_cdpContext_promptForInteractiveAuthenticationWithCompletion_, v6, v7);
  }

}

id __79__CDPUIController_cdpContext_promptForInteractiveAuthenticationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 48);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)CDPUIController;
  return objc_msgSendSuper2(&v4, sel_cdpContext_promptForInteractiveAuthenticationWithCompletion_, v1, v2);
}

- (void)cdpContext:(id)a3 showError:(id)a4 withDefaultIndex:(int64_t)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  char v14;
  id v15;
  objc_super v16;
  _QWORD v17[4];
  id v18;
  id v19;
  CDPUIController *v20;
  id v21;
  int64_t v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    v15 = objc_loadWeakRetained((id *)&self->_delegate);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __72__CDPUIController_cdpContext_showError_withDefaultIndex_withCompletion___block_invoke;
    v17[3] = &unk_24C8542F0;
    v18 = v10;
    v19 = v11;
    v22 = a5;
    v20 = self;
    v21 = v12;
    objc_msgSend(v15, "uiController:prepareAlertContext:", self, v17);

  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)CDPUIController;
    -[CDPUIBaseController cdpContext:showError:withDefaultIndex:withCompletion:](&v16, sel_cdpContext_showError_withDefaultIndex_withCompletion_, v10, v11, a5, v12);
  }

}

id __72__CDPUIController_cdpContext_showError_withDefaultIndex_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 64);
  v6.receiver = *(id *)(a1 + 48);
  v6.super_class = (Class)CDPUIController;
  return objc_msgSendSuper2(&v6, sel_cdpContext_showError_withDefaultIndex_withCompletion_, v1, v2, v3, v4);
}

- (void)cdpContext:(id)a3 promptForICSCWithIsNumeric:(BOOL)a4 numericLength:(id)a5 isRandom:(BOOL)a6 validator:(id)a7
{
  _BOOL4 v8;
  id v13;
  id v14;
  id v15;
  CDPSingleICSCEntryViewController *v16;
  CDPRemoteDeviceSecretValidator *remoteSecretValidator;
  _QWORD v18[4];
  id v19;
  CDPUIController *v20;
  id v21;
  BOOL v22;
  id location;

  v8 = a6;
  v13 = a3;
  v14 = a5;
  v15 = a7;
  objc_storeStrong((id *)&self->_activeContext, a3);
  objc_storeStrong((id *)&self->_remoteSecretValidator, a7);
  if (v8)
  {
    v16 = objc_alloc_init(CDPSingleICSCEntryViewController);
    -[PSKeychainSyncSecurityCodeController setMode:](v16, "setMode:", 2);
    -[PSKeychainSyncSecurityCodeController setSecurityCodeType:](v16, "setSecurityCodeType:", 2);
    -[PSKeychainSyncViewController setDelegate:](v16, "setDelegate:", self);
    -[CDPUIController _presentRootController:completion:](self, "_presentRootController:completion:", v16, 0);

  }
  else
  {
    objc_initWeak(&location, self);
    remoteSecretValidator = self->_remoteSecretValidator;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __90__CDPUIController_cdpContext_promptForICSCWithIsNumeric_numericLength_isRandom_validator___block_invoke;
    v18[3] = &unk_24C854318;
    objc_copyWeak(&v21, &location);
    v22 = a4;
    v19 = v14;
    v20 = self;
    -[CDPRemoteDeviceSecretValidator supportedEscapeOfferMaskCompletion:](remoteSecretValidator, "supportedEscapeOfferMaskCompletion:", v18);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

}

void __90__CDPUIController_cdpContext_promptForICSCWithIsNumeric_numericLength_isRandom_validator___block_invoke(uint64_t a1, uint64_t a2)
{
  CDPRemoteSecretEntryViewController *v4;
  void *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = -[CDPRemoteSecretEntryViewController initWithIsNumeric:numericLength:validator:delegate:]([CDPRemoteSecretEntryViewController alloc], "initWithIsNumeric:numericLength:validator:delegate:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), WeakRetained);
    objc_msgSend(WeakRetained, "_singleICSCEscapeOfferWithMask:withController:", a2, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPRemoteSecretEntryViewController setEscapeOffer:](v4, "setEscapeOffer:", v5);

    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24C857A78, 0, 0, 0, 0, 13, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEditPaneClass:", objc_opt_class());
    objc_msgSend(v6, "setProperty:forKey:", WeakRetained, *MEMORY[0x24BE75E10]);
    -[DevicePINController setSpecifier:](v4, "setSpecifier:", v6);
    objc_msgSend(WeakRetained, "_presentRootController:completion:", v4, 0);

  }
}

- (void)cdpContext:(id)a3 promptForLocalSecretWithCompletion:(id)a4
{
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  CDPUIController *v29;
  id v30;
  _QWORD *v31;
  _BYTE *v32;
  _QWORD v33[4];
  id v34;
  _QWORD *v35;
  _BYTE *v36;
  _QWORD v37[3];
  char v38;
  _QWORD v39[5];
  id v40;
  _BYTE *v41;
  id v42;
  id location;
  id v44;
  id v45;
  _BYTE buf[24];
  void (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  const __CFString *v50;
  _QWORD v51[4];

  v51[1] = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_activeContext, a3);
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DC8F000, v8, OS_LOG_TYPE_DEFAULT, "\"Attempting to show local secret prompt\", buf, 2u);
  }

  v9 = objc_alloc_init(MEMORY[0x24BDD1560]);
  v50 = CFSTR("forceInlineMode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CDPUIController forceInlinePresentation](self, "forceInlinePresentation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  -[CDPUIController titleText](self, "titleText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("title"));

  _CDPLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v12;
    _os_log_impl(&dword_20DC8F000, v14, OS_LOG_TYPE_DEFAULT, "\"%@: userInfo: %@\", buf, 0x16u);

  }
  v17 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v9, "setUserInfo:", v17);

  v44 = 0;
  objc_msgSend(MEMORY[0x24BDD1550], "extensionWithIdentifier:error:", CFSTR("com.apple.CoreCDPUI.localSecretPrompt"), &v44);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v44;
  objc_initWeak(&location, v18);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3042000000;
  v47 = __Block_byref_object_copy_;
  v48 = __Block_byref_object_dispose_;
  v49 = 0;
  v45 = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x24BDAC760];
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke;
  v39[3] = &unk_24C854340;
  v41 = buf;
  objc_copyWeak(&v42, &location);
  v39[4] = self;
  v22 = v7;
  v40 = v22;
  objc_msgSend(v18, "instantiateViewControllerWithInputItems:connectionHandler:", v20, v39);

  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v38 = 0;
  v33[0] = v21;
  v33[1] = 3221225472;
  v33[2] = __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_168;
  v33[3] = &unk_24C8543B8;
  v35 = v37;
  v36 = buf;
  v23 = v22;
  v34 = v23;
  objc_msgSend(v18, "setRequestInterruptionBlock:", v33);
  v27[0] = v21;
  v27[1] = 3221225472;
  v27[2] = __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_171;
  v27[3] = &unk_24C854458;
  v31 = v37;
  v24 = v26;
  v28 = v24;
  v25 = v23;
  v29 = self;
  v30 = v25;
  v32 = buf;
  objc_msgSend(v18, "set_requestPostCompletionBlockWithItems:", v27);

  _Block_object_dispose(v37, 8);
  objc_destroyWeak(&v42);
  _Block_object_dispose(buf, 8);
  objc_destroyWeak(&v49);
  objc_destroyWeak(&location);

}

void __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  char isKindOfClass;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id WeakRetained;
  uint64_t v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_storeWeak((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v8);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  _CDPLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((isKindOfClass & 1) != 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412546;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_20DC8F000, v12, OS_LOG_TYPE_DEFAULT, "\"Presented a remoteUI view controller: %@ - %@\", (uint8_t *)&v16, 0x16u);
    }

    v13 = v8;
    objc_msgSend(v13, "setRequest:", v7);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v13, "setWeakExtension:", WeakRetained);

    objc_msgSend(*(id *)(a1 + 32), "_presentRootController:completion:", v13, 0);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_cold_1();

    v15 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", 5906);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v15 + 16))(v15, 0, v13);
  }

}

void __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_168(uint64_t a1)
{
  id v1;
  __int128 v2;
  _QWORD block[4];
  __int128 v4;
  uint64_t v5;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_2;
  block[3] = &unk_24C854390;
  v5 = *(_QWORD *)(a1 + 48);
  v2 = *(_OWORD *)(a1 + 32);
  v1 = (id)v2;
  v4 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  NSObject *v4;
  id WeakRetained;
  _QWORD v6[4];
  NSObject *v7;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
  {
    _CDPLogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_2_cold_2();
  }
  else
  {
    *(_BYTE *)(v1 + 24) = 1;
    _CDPLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_2_cold_1();

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_169;
    v6[3] = &unk_24C854368;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, v6);

    v2 = v7;
  }

}

void __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_169(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  _CDPStateError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_171(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_2_172;
  v7[3] = &unk_24C854430;
  v12 = *(_QWORD *)(a1 + 56);
  v8 = v4;
  v9 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = v5;
  v13 = *(_QWORD *)(a1 + 64);
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_2_172(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  NSObject *v4;
  uint64_t v5;
  void (**v6)(void *, void *, uint64_t);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  _QWORD v14[4];
  id v15;
  void (**v16)(void *, void *, uint64_t);
  _QWORD aBlock[4];
  NSObject *v18;
  id v19;
  uint8_t buf[16];

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  if (*(_BYTE *)(v1 + 24))
  {
    _CDPLogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_2_172_cold_1();
  }
  else
  {
    *(_BYTE *)(v1 + 24) = 1;
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      _CDPLogSystem();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DC8F000, v4, OS_LOG_TYPE_DEFAULT, "\"Local secret prompt came back with data\", buf, 2u);
      }

    }
    v5 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_173;
    aBlock[3] = &unk_24C8543E0;
    v18 = *(id *)(a1 + 40);
    v19 = *(id *)(a1 + 56);
    v6 = (void (**)(void *, void *, uint64_t))_Block_copy(aBlock);
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 48), "forceInlinePresentation")
      || (objc_msgSend(*(id *)(a1 + 48), "forceInlinePresentation") & 1) == 0
      && (objc_msgSend(*(id *)(a1 + 48), "titleText"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          v8))
    {
      objc_msgSend(v7, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("localSecret"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("secretType"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v10, objc_msgSend(v12, "integerValue"));

    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
      v14[0] = v5;
      v14[1] = 3221225472;
      v14[2] = __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_2_180;
      v14[3] = &unk_24C854408;
      v16 = v6;
      v15 = v7;
      objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, v14);

      v9 = v16;
    }

    v2 = v18;
  }

}

void __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_173(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  if (v9)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A450]), "initWithValidatedSecret:secretType:", v9, a3);
    v6 = v5;
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(v5, "validatedSecret");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setCachedLocalSecret:", v7);

      objc_msgSend(*(id *)(a1 + 32), "setCachedLocalSecretType:", objc_msgSend(v6, "secretType"));
    }
    (*(void (**)(_QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v6, 0);
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    _CDPStateError();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v6);
  }

}

void __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_2_180(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("localSecret"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secretType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t))(v2 + 16))(v2, v3, objc_msgSend(v5, "integerValue"));

}

- (void)cdpContext:(id)a3 presentRemoteApprovalWithCompletion:(id)a4
{
  CDPContext *v6;
  id v7;
  CDPContext *activeContext;
  CDPContext *v9;
  CDPWaitingApprovalViewController *v10;
  UIViewController *rootViewController;
  id v12;
  CDPWaitingApprovalViewController *v13;
  _QWORD v14[4];
  CDPWaitingApprovalViewController *v15;
  id v16;

  v6 = (CDPContext *)a3;
  v7 = a4;
  activeContext = self->_activeContext;
  self->_activeContext = v6;
  v9 = v6;

  v10 = -[CDPWaitingApprovalViewController initWithEscapeOffer:]([CDPWaitingApprovalViewController alloc], "initWithEscapeOffer:", 0);
  objc_storeStrong((id *)&self->_rootViewController, v10);
  -[CDPUIController sendRemoteApprovalStartedBreadCrumbEventWithContext:](self, "sendRemoteApprovalStartedBreadCrumbEventWithContext:", v9);
  rootViewController = self->_rootViewController;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __66__CDPUIController_cdpContext_presentRemoteApprovalWithCompletion___block_invoke;
  v14[3] = &unk_24C854480;
  v15 = v10;
  v16 = v7;
  v12 = v7;
  v13 = v10;
  -[CDPUIController _presentRootController:completion:](self, "_presentRootController:completion:", rootViewController, v14);

}

uint64_t __66__CDPUIController_cdpContext_presentRemoteApprovalWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRemoteApprovalCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)dismissRemoteApprovalWaitingScreenWithAction:(unint64_t)a3
{
  UIViewController *v5;
  UIViewController *v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = self->_rootViewController;
  else
    v5 = 0;
  v6 = v5;
  if (a3 == 1)
  {
    -[UIViewController cancelRemoteApproval](v5, "cancelRemoteApproval");
  }
  else if (a3 == 2)
  {
    -[UIViewController remoteApprovalSucceeded](v5, "remoteApprovalSucceeded");
  }
  -[CDPUIController _dismissPresentedViewControllerCompletion:](self, "_dismissPresentedViewControllerCompletion:", 0);

}

- (void)sendRemoteApprovalStartedBreadCrumbEventWithContext:(id)a3
{
  void *v3;
  id v4;

  -[CDPUIController _makeRemoteApprovalStartedBreadCrumbEventWithContext:](self, "_makeRemoteApprovalStartedBreadCrumbEventWithContext:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendEvent:", v4);

}

- (id)_makeRemoteApprovalStartedBreadCrumbEventWithContext:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithContext:eventName:category:", a3, *MEMORY[0x24BE1A768], *MEMORY[0x24BE1A860]);
}

- (void)sendRemoteApprovalCompletedEventWithContext:(id)a3 didApprove:(BOOL)a4 error:(id)a5
{
  void *v5;
  id v6;

  -[CDPUIController _makeRemoteApprovalCompletedEventWithContext:didApprove:error:](self, "_makeRemoteApprovalCompletedEventWithContext:didApprove:error:", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendEvent:", v6);

}

- (id)_makeRemoteApprovalCompletedEventWithContext:(id)a3 didApprove:(BOOL)a4 error:(id)a5
{
  _BOOL4 v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v5 = a4;
  v7 = (void *)MEMORY[0x24BDFC2A0];
  v8 = *MEMORY[0x24BE1A760];
  v9 = *MEMORY[0x24BE1A860];
  v10 = a5;
  objc_msgSend(v7, "analyticsEventWithContext:eventName:category:", a3, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v5)
    v13 = MEMORY[0x24BDBD1C8];
  else
    v13 = MEMORY[0x24BDBD1C0];
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE1A640]);
  objc_msgSend(v12, "populateUnderlyingErrorsStartingWithRootError:", v10);

  return v12;
}

- (void)cdpContext:(id)a3 presentRecoveryKeyWithValidator:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  CDPRecoveryKeyEntryViewModel *v11;
  CDPRecoveryKeyEntryViewController *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[CDPRecoveryKeyEntryViewModel initWithContext:validator:mode:]([CDPRecoveryKeyEntryViewModel alloc], "initWithContext:validator:mode:", v8, v9, 1);
  v12 = -[CDPRecoveryKeyEntryViewController initWithRecoveryContext:cdpContext:]([CDPRecoveryKeyEntryViewController alloc], "initWithRecoveryContext:cdpContext:", v11, self->_activeContext);
  objc_storeStrong((id *)&self->_recoveryKeyViewModel, v11);
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __73__CDPUIController_cdpContext_presentRecoveryKeyWithValidator_completion___block_invoke;
  v16[3] = &unk_24C8544D0;
  objc_copyWeak(&v20, &location);
  v13 = v8;
  v17 = v13;
  v14 = v9;
  v18 = v14;
  v15 = v10;
  v19 = v15;
  -[CDPRecoveryKeyEntryViewModel setCompletionHandler:](v11, "setCompletionHandler:", v16);
  -[CDPUIController _presentRootController:completion:](self, "_presentRootController:completion:", v12, 0);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __73__CDPUIController_cdpContext_presentRecoveryKeyWithValidator_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      objc_msgSend(WeakRetained, "cdpContext:confirmRecoveryKeyWithValidator:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
    else
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __73__CDPUIController_cdpContext_presentRecoveryKeyWithValidator_completion___block_invoke_2;
      v8[3] = &unk_24C8544A8;
      v10 = *(id *)(a1 + 48);
      v11 = 0;
      v9 = v5;
      objc_msgSend(v7, "_dismissPresentedViewControllerCompletion:", v8);

    }
  }

}

uint64_t __73__CDPUIController_cdpContext_presentRecoveryKeyWithValidator_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)cdpContext:(id)a3 confirmRecoveryKeyWithValidator:(id)a4 completion:(id)a5
{
  id v6;

  -[CDPUIController _recoveryKeyControllerWithContext:validator:completion:](self, "_recoveryKeyControllerWithContext:validator:completion:", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UINavigationController pushViewController:animated:](self->_navController, "pushViewController:animated:", v6, 1);

}

- (void)cdpContext:(id)a3 promptForRecoveryKeyWithValidator:(id)a4 completion:(id)a5
{
  id v6;

  -[CDPUIController _recoveryKeyControllerWithContext:validator:completion:](self, "_recoveryKeyControllerWithContext:validator:completion:", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CDPUIController _presentRootController:completion:](self, "_presentRootController:completion:", v6, 0);

}

- (void)cdpContext:(id)a3 promptForRecoveryKeyWithSecretValidator:(id)a4 completion:(id)a5
{
  id v6;

  -[CDPUIController _recoveryKeyControllerWithContext:secretValidator:completion:](self, "_recoveryKeyControllerWithContext:secretValidator:completion:", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CDPUIController _presentRootController:completion:](self, "_presentRootController:completion:", v6, 0);

}

- (id)_recoveryKeyControllerWithContext:(id)a3 validator:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  CDPRecoveryKeyEntryViewModel *v12;
  CDPRecoveryKeyEntryViewController *v13;
  id v14;
  _QWORD v16[5];
  id v17;

  v9 = a3;
  v10 = a5;
  objc_storeStrong((id *)&self->_activeContext, a3);
  v11 = a4;
  v12 = -[CDPRecoveryKeyEntryViewModel initWithContext:validator:mode:]([CDPRecoveryKeyEntryViewModel alloc], "initWithContext:validator:mode:", v9, v11, 2);

  if (!self->_recoveryKeyViewModel)
    objc_storeStrong((id *)&self->_recoveryKeyViewModel, v12);
  v13 = -[CDPRecoveryKeyEntryViewController initWithRecoveryContext:cdpContext:]([CDPRecoveryKeyEntryViewController alloc], "initWithRecoveryContext:cdpContext:", v12, self->_activeContext);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __74__CDPUIController__recoveryKeyControllerWithContext_validator_completion___block_invoke;
  v16[3] = &unk_24C8544F8;
  v16[4] = self;
  v17 = v10;
  v14 = v10;
  -[CDPRecoveryKeyEntryViewModel setCompletionHandler:](v12, "setCompletionHandler:", v16);

  return v13;
}

void __74__CDPUIController__recoveryKeyControllerWithContext_validator_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __74__CDPUIController__recoveryKeyControllerWithContext_validator_completion___block_invoke_2;
  v9[3] = &unk_24C8544A8;
  v6 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  objc_msgSend(v6, "_dismissPresentedViewControllerCompletion:", v9);

}

uint64_t __74__CDPUIController__recoveryKeyControllerWithContext_validator_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (id)_recoveryKeyControllerWithContext:(id)a3 secretValidator:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  CDPRecoveryKeyEntryViewModel *v12;
  CDPRecoveryKeyEntryViewController *v13;
  id v14;
  _QWORD v16[5];
  id v17;

  v9 = a3;
  v10 = a5;
  objc_storeStrong((id *)&self->_activeContext, a3);
  v11 = a4;
  v12 = -[CDPRecoveryKeyEntryViewModel initWithContext:validator:]([CDPRecoveryKeyEntryViewModel alloc], "initWithContext:validator:", v9, v11);

  if (!self->_recoveryKeyViewModel)
    objc_storeStrong((id *)&self->_recoveryKeyViewModel, v12);
  v13 = -[CDPRecoveryKeyEntryViewController initWithRecoveryContext:cdpContext:]([CDPRecoveryKeyEntryViewController alloc], "initWithRecoveryContext:cdpContext:", v12, self->_activeContext);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __80__CDPUIController__recoveryKeyControllerWithContext_secretValidator_completion___block_invoke;
  v16[3] = &unk_24C8544F8;
  v16[4] = self;
  v17 = v10;
  v14 = v10;
  -[CDPRecoveryKeyEntryViewModel setCompletionHandler:](v12, "setCompletionHandler:", v16);

  return v13;
}

void __80__CDPUIController__recoveryKeyControllerWithContext_secretValidator_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __80__CDPUIController__recoveryKeyControllerWithContext_secretValidator_completion___block_invoke_2;
  v9[3] = &unk_24C8544A8;
  v6 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  objc_msgSend(v6, "_dismissPresentedViewControllerCompletion:", v9);

}

uint64_t __80__CDPUIController__recoveryKeyControllerWithContext_secretValidator_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)_presentSwiftUIRemoteSecretPromptWithDevice:(id)a3 didSelectDevice:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  NSArray *devices;
  void *v9;
  _BOOL8 v10;
  BOOL offeringRemoteApproval;
  BOOL isWalrusEnabled;
  id v13;
  uint64_t v14;
  CDPRemoteDeviceSecretValidator *remoteSecretValidator;
  CDPContext *activeContext;
  BOOL v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  BOOL v22;
  id location;

  v4 = a4;
  v6 = a3;
  objc_initWeak(&location, self);
  v18 = v6;
  v17 = -[CDPUIController _canShowRPD](self, "_canShowRPD");
  if (v4)
    v7 = v6;
  else
    v7 = 0;
  activeContext = self->_activeContext;
  remoteSecretValidator = self->_remoteSecretValidator;
  devices = self->_devices;
  -[CDPUIBaseController presentingViewController](self, "presentingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CDPUIController performingAccountRecovery](self, "performingAccountRecovery");
  offeringRemoteApproval = self->_offeringRemoteApproval;
  isWalrusEnabled = self->_isWalrusEnabled;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __79__CDPUIController__presentSwiftUIRemoteSecretPromptWithDevice_didSelectDevice___block_invoke;
  v19[3] = &unk_24C854548;
  objc_copyWeak(&v21, &location);
  v19[4] = self;
  v22 = v4;
  v13 = v18;
  v20 = v13;
  BYTE2(v14) = isWalrusEnabled;
  BYTE1(v14) = v17;
  LOBYTE(v14) = offeringRemoteApproval;
  +[CDPStateSwiftUIProvider makeSwiftUIViewForRemoteSecretDuringSignInCdpContext:validator:devices:presentingViewController:performingAccountRecovery:delegate:offeringRemoteApproval:canShowRPD:isADPEnabled:selectedDevice:completionHandler:](_TtC9CoreCDPUI23CDPStateSwiftUIProvider, "makeSwiftUIViewForRemoteSecretDuringSignInCdpContext:validator:devices:presentingViewController:performingAccountRecovery:delegate:offeringRemoteApproval:canShowRPD:isADPEnabled:selectedDevice:completionHandler:", activeContext, remoteSecretValidator, devices, v9, v10, self, v14, v7, v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __79__CDPUIController__presentSwiftUIRemoteSecretPromptWithDevice_didSelectDevice___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id *WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id *v9;
  id v10;

  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), a2);
  if (v4)
  {
    objc_msgSend(WeakRetained, "remoteSecretEntryDidRequestDisableUserInteraction");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("remote-secret-entry-view"));

    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(WeakRetained[4], "pushViewController:animated:", v4, 1);
      objc_msgSend(WeakRetained, "sendRemoteSecretInputEventWithContext:device:", WeakRetained[7], *(_QWORD *)(a1 + 40));
    }
    else
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __79__CDPUIController__presentSwiftUIRemoteSecretPromptWithDevice_didSelectDevice___block_invoke_188;
      v8[3] = &unk_24C854520;
      v9 = WeakRetained;
      v10 = *(id *)(a1 + 40);
      objc_msgSend(v9, "_presentRootController:completion:", v4, v8);

    }
  }
  else
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __79__CDPUIController__presentSwiftUIRemoteSecretPromptWithDevice_didSelectDevice___block_invoke_cold_1();

  }
}

uint64_t __79__CDPUIController__presentSwiftUIRemoteSecretPromptWithDevice_didSelectDevice___block_invoke_188(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendRemoteSecretInputEventWithContext:device:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), *(_QWORD *)(a1 + 40));
}

- (void)cdpContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 offeringRemoteApproval:(BOOL)a5 validator:(id)a6
{
  id v11;
  id v12;
  void *v13;
  id v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  CDPRPDLedger *v20;
  CDPRPDLedger *ledger;
  uint64_t v22;
  id v23;
  id v24;

  v24 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v11, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_activeContext, a3);
  objc_storeStrong((id *)&self->_remoteSecretValidator, a6);
  objc_storeStrong((id *)&self->_devices, a4);
  self->_offeringRemoteApproval = a5;
  v14 = objc_alloc_init(MEMORY[0x24BE1A480]);
  objc_msgSend(v14, "setContext:", v24);
  objc_msgSend(v14, "setIsWalrusEnabled:", self->_isWalrusEnabled);
  objc_msgSend(v14, "setRpdProbationDuration:", self->_rpdProbationDuration);
  v15 = 0x24BE1A000;
  if (!self->_ledger)
  {
    v23 = objc_alloc(MEMORY[0x24BE1A9E8]);
    v22 = objc_msgSend(v12, "supportedEscapeOfferMask");
    objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "hasLocalSecret");
    objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
    v18 = v12;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (CDPRPDLedger *)objc_msgSend(v23, "initWithExpectedEscapeOffers:recoveryFlowContext:deviceHasPasscode:probationChecker:deviceIsVM:", v22, v14, v17, v19, objc_msgSend(MEMORY[0x24BE1A4A0], "isVirtualMachine"));
    ledger = self->_ledger;
    self->_ledger = v20;

    v12 = v18;
    v15 = 0x24BE1A000uLL;
  }
  if (objc_msgSend(*(id *)(v15 + 1184), "isICSCHarmonizationEnabled")
    && -[NSArray count](self->_devices, "count"))
  {
    -[CDPUIController _presentSwiftUIRemoteSecretPromptWithDevice:didSelectDevice:](self, "_presentSwiftUIRemoteSecretPromptWithDevice:didSelectDevice:", v13, 0);
  }
  else
  {
    -[CDPUIController _presentRemoteSecretControllerWithNewestDevice:](self, "_presentRemoteSecretControllerWithNewestDevice:", v13);
    -[CDPUIController sendRemoteSecretInputEventWithContext:device:](self, "sendRemoteSecretInputEventWithContext:device:", v24, v13);
  }

}

- (void)sendRemoteSecretInputEventWithContext:(id)a3 device:(id)a4
{
  void *v4;
  id v5;

  -[CDPUIController _makeRemoteSecretInputEventWithContext:device:](self, "_makeRemoteSecretInputEventWithContext:device:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendEvent:", v5);

}

- (id)_makeRemoteSecretInputEventWithContext:(id)a3 device:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = (void *)MEMORY[0x24BDFC2A0];
  v6 = *MEMORY[0x24BE1A770];
  v7 = *MEMORY[0x24BE1A860];
  v8 = a4;
  objc_msgSend(v5, "analyticsEventWithContext:eventName:category:", a3, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "remainingAttempts"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE1A758]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "hasNumericSecret"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE1A6A8]);

  objc_msgSend(v8, "numericSecretLength");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE1A6E8]);

  v13 = (void *)MEMORY[0x24BDD16E0];
  v14 = objc_msgSend(v8, "isCurrentDevice");

  objc_msgSend(v13, "numberWithBool:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BE1A6B8]);

  return v9;
}

- (void)cdpRecoveryFlowContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 validator:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  uint64_t v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  self->_isWalrusEnabled = objc_msgSend(v10, "isWalrusEnabled");
  objc_msgSend(v10, "rpdProbationDuration");
  self->_rpdProbationDuration = v11;
  objc_msgSend(v10, "context");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "hasPeersForRemoteApproval");

  -[CDPUIController cdpContext:promptForRemoteSecretWithDevices:offeringRemoteApproval:validator:](self, "cdpContext:promptForRemoteSecretWithDevices:offeringRemoteApproval:validator:", v13, v9, v12, v8);
}

- (void)cdpContext:(id)a3 promptForBeneficiaryAccessKeyWithCompletion:(id)a4
{
  id v6;
  id v7;
  CDPUIInheritanceUIProviderImpl *v8;
  void *v9;
  CDPUIInheritanceUIProvider *v10;
  CDPUIInheritanceUIProvider *inheritanceUIProvider;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  CDPUIInheritanceUIProvider *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CDPUIInheritanceUIProviderImpl alloc];
  -[CDPUIBaseController presentingViewController](self, "presentingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CDPUIInheritanceUIProviderImpl initWithPresentingViewController:](v8, "initWithPresentingViewController:", v9);
  inheritanceUIProvider = self->_inheritanceUIProvider;
  self->_inheritanceUIProvider = v10;

  v12 = objc_alloc(MEMORY[0x24BE0AD98]);
  objc_msgSend(v6, "beneficiaryIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithBeneficiairyIdentifier:", v13);

  objc_msgSend(v6, "beneficiaryWrappedKeyData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWrappedKeyData:", v15);

  objc_initWeak(&location, self);
  v16 = self->_inheritanceUIProvider;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __74__CDPUIController_cdpContext_promptForBeneficiaryAccessKeyWithCompletion___block_invoke;
  v18[3] = &unk_24C854570;
  objc_copyWeak(&v20, &location);
  v17 = v7;
  v19 = v17;
  -[CDPUIInheritanceUIProvider promptForAccessCodeForAccessKey:completion:](v16, "promptForAccessCodeForAccessKey:completion:", v14, v18);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __74__CDPUIController_cdpContext_promptForBeneficiaryAccessKeyWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = (void *)*((_QWORD *)WeakRetained + 11);
    *((_QWORD *)WeakRetained + 11) = 0;

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (id)_remoteSecretControllerForDevice:(id)a3
{
  id v4;
  CDPRemoteSecretEntryViewController *v5;
  void *v6;

  v4 = a3;
  v5 = -[CDPRemoteSecretEntryViewController initWithDevice:validator:delegate:]([CDPRemoteSecretEntryViewController alloc], "initWithDevice:validator:delegate:", v4, self->_remoteSecretValidator, self);

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24C857A78, 0, 0, 0, 0, 13, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEditPaneClass:", objc_opt_class());
  objc_msgSend(v6, "setProperty:forKey:", self, *MEMORY[0x24BE75E10]);
  -[DevicePINController setSpecifier:](v5, "setSpecifier:", v6);

  return v5;
}

- (void)_presentRemoteSecretControllerWithNewestDevice:(id)a3
{
  id v4;
  CDPRemoteDeviceSecretValidator *remoteSecretValidator;
  id v6;
  _QWORD v7[4];
  id v8;
  CDPUIController *v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  remoteSecretValidator = self->_remoteSecretValidator;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__CDPUIController__presentRemoteSecretControllerWithNewestDevice___block_invoke;
  v7[3] = &unk_24C854598;
  objc_copyWeak(&v10, &location);
  v6 = v4;
  v8 = v6;
  v9 = self;
  -[CDPRemoteDeviceSecretValidator supportedEscapeOfferMaskCompletion:](remoteSecretValidator, "supportedEscapeOfferMaskCompletion:", v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __66__CDPUIController__presentRemoteSecretControllerWithNewestDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *WeakRetained;
  _QWORD *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (!WeakRetained[17])
    {
      _CDPLogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        __66__CDPUIController__presentRemoteSecretControllerWithNewestDevice___block_invoke_cold_2(v6, v7, v8, v9, v10, v11, v12, v13);

    }
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(v5, "_remoteSecretControllerForNewestDevice:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_escapeOfferForDevice:withMask:", *(_QWORD *)(a1 + 32), a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setEscapeOffer:", v15);
      objc_msgSend(v5, "_presentRootController:completion:", v14, 0);

LABEL_19:
      goto LABEL_20;
    }
    if ((a2 & 0x80) != 0)
    {
      objc_msgSend(v5, "_piggybackingViewControllerWithSupportedEscapeOfferMask:", a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_presentRootController:completion:", v14, 0);
      v18 = (void *)v5[17];
      if (!v18)
        goto LABEL_19;
      v19 = 128;
    }
    else if ((a2 & 0x20) != 0)
    {
      objc_msgSend(v5, "recoveryKeyEntryControllerForCircleJoinWithCancel:supportedEscapeOfferMask:", 1, a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_presentRootController:completion:", v14, 0);
      v18 = (void *)v5[17];
      v19 = 32;
    }
    else
    {
      if ((a2 & 0x40) == 0)
      {
        _CDPLogSystem();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          __66__CDPUIController__presentRemoteSecretControllerWithNewestDevice___block_invoke_cold_1();

        v17 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
        _CDPStateError();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "cancelValidationWithError:", v14);
        goto LABEL_19;
      }
      objc_msgSend(v5, "_custodianAskHelpViewControllerWithSupportedEscapeOfferMask:", a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_presentRootController:completion:", v14, 0);
      v18 = (void *)v5[17];
      v19 = 64;
    }
    objc_msgSend(v18, "insert:", v19);
    goto LABEL_19;
  }
LABEL_20:

}

- (void)cdpContext:(id)a3 promptForAdoptionOfMultipleICSC:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v5 = a4;
  v6 = (void *)MEMORY[0x24BEBD3A8];
  CDPLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __62__CDPUIController_cdpContext_promptForAdoptionOfMultipleICSC___block_invoke;
  v16[3] = &unk_24C8545C0;
  v8 = v5;
  v17 = v8;
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BEBD3B0];
  CDPLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CDPLocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "alertControllerWithTitle:message:preferredStyle:", v11, v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addAction:", v9);
  _CDPLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[CDPUIController cdpContext:promptForAdoptionOfMultipleICSC:].cold.1(self, v14);

  -[CDPUIBaseController presentingViewController](self, "presentingViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presentViewController:animated:completion:", v13, 1, 0);

}

uint64_t __62__CDPUIController_cdpContext_promptForAdoptionOfMultipleICSC___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void)approveFromAnotherDevice:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  CDPWaitingApprovalViewController *v6;
  void *v7;
  CDPWaitingApprovalViewController *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  CDPRemoteDeviceSecretValidator *remoteSecretValidator;
  CDPWaitingApprovalViewController *v13;
  _QWORD v14[5];
  CDPWaitingApprovalViewController *v15;
  uint8_t buf[4];
  _BOOL4 v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v17 = v3;
    _os_log_impl(&dword_20DC8F000, v5, OS_LOG_TYPE_DEFAULT, "\"Trying to approve from another device, with cancel support: %{BOOL}d\", buf, 8u);
  }

  v6 = [CDPWaitingApprovalViewController alloc];
  -[CDPUIController _escapeOfferForMultiApprovalWithMask:](self, "_escapeOfferForMultiApprovalWithMask:", -[CDPRemoteDeviceSecretValidator supportedEscapeOfferMask](self->_remoteSecretValidator, "supportedEscapeOfferMask"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CDPWaitingApprovalViewController initWithEscapeOffer:](v6, "initWithEscapeOffer:", v7);

  if (v3)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelRemoteApprovalTapped_);
    -[CDPWaitingApprovalViewController navigationItem](v8, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLeftBarButtonItem:", v9);

  }
  _CDPLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DC8F000, v11, OS_LOG_TYPE_DEFAULT, "\"Starting remote approval flow\", buf, 2u);
  }

  -[UINavigationController pushViewController:animated:](self->_navController, "pushViewController:animated:", v8, 1);
  -[CDPUIController sendRemoteApprovalStartedBreadCrumbEventWithContext:](self, "sendRemoteApprovalStartedBreadCrumbEventWithContext:", self->_activeContext);
  remoteSecretValidator = self->_remoteSecretValidator;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __44__CDPUIController_approveFromAnotherDevice___block_invoke;
  v14[3] = &unk_24C8545E8;
  v14[4] = self;
  v15 = v8;
  v13 = v8;
  -[CDPRemoteDeviceSecretValidator approveFromAnotherDeviceWithCompletion:](remoteSecretValidator, "approveFromAnotherDeviceWithCompletion:", v14);

}

uint64_t __44__CDPUIController_approveFromAnotherDevice___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t result;

  v3 = a2;
  result = objc_msgSend(*(id *)(a1 + 32), "sendRemoteApprovalCompletedEventWithContext:didApprove:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), a2, a3);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "remoteApprovalSucceeded");
    return objc_msgSend(*(id *)(a1 + 32), "_dismissPresentedViewControllerCompletion:", 0);
  }
  return result;
}

- (void)devicePicker:(id)a3 didSelectDevice:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  if (objc_msgSend(MEMORY[0x24BE1A4A0], "isICSCHarmonizationEnabled"))
  {
    -[CDPUIController _presentSwiftUIRemoteSecretPromptWithDevice:didSelectDevice:](self, "_presentSwiftUIRemoteSecretPromptWithDevice:didSelectDevice:", v7, 1);
  }
  else
  {
    -[CDPUIController _remoteSecretControllerForDevice:](self, "_remoteSecretControllerForDevice:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidesCancelButton:", 1);
    -[CDPUIController _escapeOfferForDevice:withMask:](self, "_escapeOfferForDevice:withMask:", v7, -[CDPRemoteDeviceSecretValidator supportedEscapeOfferMask](self->_remoteSecretValidator, "supportedEscapeOfferMask"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEscapeOffer:", v6);

    -[UINavigationController pushViewController:animated:](self->_navController, "pushViewController:animated:", v5, 1);
  }

}

- (id)devicePicker:(id)a3 escapeOffersForDevices:(id)a4
{
  CDPRemoteDeviceSecretValidator *remoteSecretValidator;
  id v7;
  id v8;
  void *v9;

  remoteSecretValidator = self->_remoteSecretValidator;
  v7 = a4;
  v8 = a3;
  -[CDPUIController _escapeOffersForgotAllWithMask:presenter:devices:](self, "_escapeOffersForgotAllWithMask:presenter:devices:", -[CDPRemoteDeviceSecretValidator supportedEscapeOfferMask](remoteSecretValidator, "supportedEscapeOfferMask"), v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)remoteSecretEntry:(id)a3 didAcceptValidRemoteSecretForDevice:(id)a4
{
  if (!-[CDPUIController forceInlinePresentation](self, "forceInlinePresentation", a3, a4))
    -[CDPUIController _dismissPresentedViewControllerCompletion:](self, "_dismissPresentedViewControllerCompletion:", 0);
}

- (void)cancelledRemoteSecretEntry:(id)a3
{
  CDPRemoteDeviceSecretValidator *remoteSecretValidator;
  id v5;

  if (self->_rootViewController == a3)
  {
    -[CDPRemoteDeviceSecretValidator cancelApproveFromAnotherDevice](self->_remoteSecretValidator, "cancelApproveFromAnotherDevice");
    if (!-[CDPUIController forceInlinePresentation](self, "forceInlinePresentation"))
      -[CDPUIController _dismissPresentedViewControllerCompletion:](self, "_dismissPresentedViewControllerCompletion:", 0);
    remoteSecretValidator = self->_remoteSecretValidator;
    _CDPStateError();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[CDPRemoteDeviceSecretValidator cancelValidationWithError:](remoteSecretValidator, "cancelValidationWithError:", v5);

  }
}

- (void)performRecoveryKeyRecovery:(id)a3
{
  id v4;
  CDPRemoteDeviceSecretValidator *remoteSecretValidator;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  remoteSecretValidator = self->_remoteSecretValidator;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__CDPUIController_performRecoveryKeyRecovery___block_invoke;
  v7[3] = &unk_24C854638;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[CDPRemoteDeviceSecretValidator supportedEscapeOfferMaskCompletion:](remoteSecretValidator, "supportedEscapeOfferMaskCompletion:", v7);

}

void __46__CDPUIController_performRecoveryKeyRecovery___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD block[5];
  id v4;
  uint64_t v5;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__CDPUIController_performRecoveryKeyRecovery___block_invoke_2;
  block[3] = &unk_24C854610;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = a2;
  v4 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __46__CDPUIController_performRecoveryKeyRecovery___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "recoveryKeyEntryControllerForCircleJoinWithCancel:supportedEscapeOfferMask:", 1, *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_replaceViewController:withNewController:", *(_QWORD *)(a1 + 40), v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "insert:", 32);

}

- (void)performCustodianRecovery:(id)a3
{
  id v4;
  NSObject *v5;
  CDPRemoteDeviceSecretValidator *remoteSecretValidator;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DC8F000, v5, OS_LOG_TYPE_DEFAULT, "\"User elected to start Custodian Flow, Showing OS picker\", buf, 2u);
  }

  remoteSecretValidator = self->_remoteSecretValidator;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__CDPUIController_performCustodianRecovery___block_invoke;
  v8[3] = &unk_24C854638;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[CDPRemoteDeviceSecretValidator supportedEscapeOfferMaskCompletion:](remoteSecretValidator, "supportedEscapeOfferMaskCompletion:", v8);

}

void __44__CDPUIController_performCustodianRecovery___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD block[5];
  id v4;
  uint64_t v5;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__CDPUIController_performCustodianRecovery___block_invoke_2;
  block[3] = &unk_24C854610;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = a2;
  v4 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __44__CDPUIController_performCustodianRecovery___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE1A400]), "initWithContext:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(*(id *)(a1 + 32), "custodianOSSelectionViewControllerWithCustodianController:supportedEscapeOfferMask:", v3, *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_replaceViewController:withNewController:", *(_QWORD *)(a1 + 40), v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "insert:", 64);

}

- (void)performPiggybackingRecovery:(id)a3
{
  id v4;
  CDPRemoteDeviceSecretValidator *remoteSecretValidator;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  remoteSecretValidator = self->_remoteSecretValidator;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__CDPUIController_performPiggybackingRecovery___block_invoke;
  v7[3] = &unk_24C854638;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[CDPRemoteDeviceSecretValidator supportedEscapeOfferMaskCompletion:](remoteSecretValidator, "supportedEscapeOfferMaskCompletion:", v7);

}

void __47__CDPUIController_performPiggybackingRecovery___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD block[5];
  id v4;
  uint64_t v5;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__CDPUIController_performPiggybackingRecovery___block_invoke_2;
  block[3] = &unk_24C854610;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = a2;
  v4 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __47__CDPUIController_performPiggybackingRecovery___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_piggybackingViewControllerWithSupportedEscapeOfferMask:", *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_replaceViewController:withNewController:", *(_QWORD *)(a1 + 40), v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "insert:", 128);

}

- (void)performRemoteApproval:(id)a3
{
  -[CDPUIController approveFromAnotherDevice:](self, "approveFromAnotherDevice:", 1);
}

- (void)performAccountReset:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __39__CDPUIController_performAccountReset___block_invoke;
  v3[3] = &unk_24C8541C0;
  v3[4] = self;
  -[CDPUIController dismissRecoveryFlow:reason:completion:](self, "dismissRecoveryFlow:reason:completion:", a3, CFSTR("com.apple.CoreCDPUI.CDPEnrollmentCompleted"), v3);
}

uint64_t __39__CDPUIController_performAccountReset___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v14[16];

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_20DC8F000, v2, OS_LOG_TYPE_DEFAULT, "\"UI dismissed, resetting account state\", v14, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 136);
  if (!v4)
  {
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __39__CDPUIController_performAccountReset___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);

    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 136);
  }
  return objc_msgSend(*(id *)(v3 + 24), "resetAccountCDPStateWithEscapeOptionsOffered:", objc_msgSend(v4, "escapeOffersPresented"));
}

- (void)finishValidation:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__CDPUIController_finishValidation_withError___block_invoke;
  v8[3] = &unk_24C854520;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[CDPUIController dismissRecoveryFlow:reason:completion:](self, "dismissRecoveryFlow:reason:completion:", a3, CFSTR("com.apple.CoreCDPUI.CDPEnrollmentCancelled"), v8);

}

uint64_t __46__CDPUIController_finishValidation_withError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20DC8F000, v2, OS_LOG_TYPE_DEFAULT, "\"UI dismissed, cancelling validation\", v4, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "cancelValidationWithError:", *(_QWORD *)(a1 + 40));
}

- (void)dismissRecoveryFlow:(id)a3 completion:(id)a4
{
  -[CDPUIController dismissRecoveryFlow:reason:completion:](self, "dismissRecoveryFlow:reason:completion:", a3, 0, a4);
}

- (void)dismissRecoveryFlow:(id)a3 reason:(id)a4 completion:(id)a5
{
  -[CDPUIController _dismissPresentedViewControllerWithReason:completion:](self, "_dismissPresentedViewControllerWithReason:completion:", a4, a5);
}

- (void)exceededMaximumAttemptsForRemoteSecretEntry:(id)a3
{
  -[CDPUIController dismissRecoveryFlow:reason:completion:](self, "dismissRecoveryFlow:reason:completion:", a3, CFSTR("com.apple.CoreCDPUI.CDPEnrollmentCancelled"), 0);
}

- (BOOL)performingAccountRecovery
{
  return 0;
}

- (void)remoteSecretEntry:(id)a3 depletedRemainingAttemptsForDevice:(id)a4
{
  id v6;
  id v7;
  NSArray *v8;
  NSArray *devices;
  CDPRemoteDeviceSecretValidator *remoteSecretValidator;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  -[NSArray aaf_arrayByRemovingObject:](self->_devices, "aaf_arrayByRemovingObject:", v7);
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  devices = self->_devices;
  self->_devices = v8;

  objc_initWeak(&location, self);
  remoteSecretValidator = self->_remoteSecretValidator;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __72__CDPUIController_remoteSecretEntry_depletedRemainingAttemptsForDevice___block_invoke;
  v13[3] = &unk_24C854598;
  objc_copyWeak(&v16, &location);
  v11 = v7;
  v14 = v11;
  v12 = v6;
  v15 = v12;
  -[CDPRemoteDeviceSecretValidator supportedEscapeOfferMaskCompletion:](remoteSecretValidator, "supportedEscapeOfferMaskCompletion:", v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __72__CDPUIController_remoteSecretEntry_depletedRemainingAttemptsForDevice___block_invoke(id *a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;
  id v7[2];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __72__CDPUIController_remoteSecretEntry_depletedRemainingAttemptsForDevice___block_invoke_2;
  v4[3] = &unk_24C854660;
  objc_copyWeak(v7, a1 + 6);
  v5 = a1[4];
  v6 = a1[5];
  v7[1] = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v4);

  objc_destroyWeak(v7);
}

void __72__CDPUIController_remoteSecretEntry_depletedRemainingAttemptsForDevice___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleDepletedRemainingAttemptsForDevice:fromViewController:mask:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
    WeakRetained = v3;
  }

}

- (void)_handleDepletedRemainingAttemptsForDevice:(id)a3 fromViewController:(id)a4 mask:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  CDPRPDLedger *ledger;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (-[NSArray count](self->_devices, "count"))
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DC8F000, v10, OS_LOG_TYPE_DEFAULT, "\"Device limit reached, but other devices are available, show device selection screen\", buf, 2u);
    }

    -[CDPUIController _deviceLimitOfferDeviceSelectionForDevice:fromViewController:](self, "_deviceLimitOfferDeviceSelectionForDevice:fromViewController:", v8, v9);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if ((a5 & 0x80) != 0)
  {
    -[CDPUIController _deviceLimitOfferPiggybackingForDevice:supportedEscapeOfferMask:](self, "_deviceLimitOfferPiggybackingForDevice:supportedEscapeOfferMask:", v8, a5);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if ((a5 & 0x20) != 0)
  {
    v12 = objc_msgSend(MEMORY[0x24BE1A4A0], "isICSCHarmonizationEnabled");
    if ((a5 & 0x40) != 0 && v12)
    {
      -[CDPUIController _deviceLimitOfferRecoveryKeyAndCustodianForDevice:supportedEscapeOfferMask:](self, "_deviceLimitOfferRecoveryKeyAndCustodianForDevice:supportedEscapeOfferMask:", v8, a5);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CDPUIController _deviceLimitOfferRecoveryKeyForDevice:supportedEscapeOfferMask:](self, "_deviceLimitOfferRecoveryKeyForDevice:supportedEscapeOfferMask:", v8, a5);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_16;
  }
  if ((a5 & 0x40) != 0)
  {
    -[CDPUIController _deviceLimitOfferCustodianForDevice:supportedEscapeOfferMask:](self, "_deviceLimitOfferCustodianForDevice:supportedEscapeOfferMask:", v8, a5);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if ((a5 & 8) == 0)
  {
    -[CDPUIController _deviceLimitOfferSkipForDevice:](self, "_deviceLimitOfferSkipForDevice:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v13 = (void *)v11;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_INCORRECT_TITLE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSecretType:", objc_msgSend(v8, "localSecretType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedString");
  v42 = objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(MEMORY[0x24BE1A4A0], "isICSCHarmonizationEnabled");
  v17 = (void *)MEMORY[0x24BDD17C8];
  if (v16)
    v18 = CFSTR("REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_NO_RECOVERY_RPD");
  else
    v18 = CFSTR("REMOTE_SECRET_RECOVERY_HARD_LIMIT_LAST_DEVICE_RESET");
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSecretType:", objc_msgSend(v8, "localSecretType"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithValidatedFormat:validFormatSpecifiers:error:", v21, CFSTR("%@"), 0, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x24BE1A4A0], "isICSCHarmonizationEnabled"))
  {
    -[CDPUIController _iCSCSkipOrDeleteiCloudDataEscapeOfferWithTitle:message:skipButtonTitle:supportedEscapeOfferMask:withDevice:](self, "_iCSCSkipOrDeleteiCloudDataEscapeOfferWithTitle:message:skipButtonTitle:supportedEscapeOfferMask:withDevice:", v42, v23, &stru_24C857A78, a5, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("WALRUS_ALERT_BUTTON_TITLE_DELETE_ICLOUD_DATA"), CFSTR("Localizable-Walrus"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "escapeOptions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTitle:", v25);

    if (objc_msgSend(MEMORY[0x24BE1A4A0], "shouldCentralizeRPDFlow"))
    {
      ledger = self->_ledger;
      if (!ledger)
      {
        _CDPLogSystem();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
          -[CDPUIController _handleDepletedRemainingAttemptsForDevice:fromViewController:mask:].cold.1(v29, v30, v31, v32, v33, v34, v35, v36);

        ledger = self->_ledger;
      }
      if ((-[CDPRPDLedger canOfferRPD](ledger, "canOfferRPD") & 1) == 0)
      {
        _CDPLogSystem();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          -[CDPRPDLedger rpdBlockingError](self->_ledger, "rpdBlockingError");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v44 = v38;
          _os_log_impl(&dword_20DC8F000, v37, OS_LOG_TYPE_DEFAULT, "\"Cannot offer RPD. Reason: %@\", buf, 0xCu);

        }
        -[CDPUIController _deviceLimitOfferSkipForDevice:](self, "_deviceLimitOfferSkipForDevice:", v8);
        v39 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v39;
      }
    }
    v40 = (void *)v42;
  }
  else
  {
    CDPLocalizedString();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)v42;
    -[CDPUIController _skipOrDeleteiCloudDataEscapeOfferWithTitle:message:skipButtonTitle:supportedEscapeOfferMask:](self, "_skipOrDeleteiCloudDataEscapeOfferWithTitle:message:skipButtonTitle:supportedEscapeOfferMask:", v42, v23, v41, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_17:
  objc_msgSend(v13, "setPresentingViewController:", self->_navController);
  objc_msgSend(v13, "handleEscapeAction:", self);

}

- (void)_beginDevicePickerFlowFromEntryController:(id)a3
{
  UIViewController *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  UIViewController *v10;
  uint8_t buf[16];

  v4 = (UIViewController *)a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DC8F000, v5, OS_LOG_TYPE_DEFAULT, "\"Trying another device\", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithContext:eventName:category:", self->_activeContext, *MEMORY[0x24BE1A630], *MEMORY[0x24BE1A860]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendEvent:", v6);

  if (self->_rootViewController == v4)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __61__CDPUIController__beginDevicePickerFlowFromEntryController___block_invoke;
    v9[3] = &unk_24C854688;
    v9[4] = self;
    v10 = v4;
    -[CDPUIController _setupDevicePickerController:](self, "_setupDevicePickerController:", v9);

  }
  else
  {
    -[CDPDevicePickerViewController setDevices:](self->_devicePicker, "setDevices:", self->_devices);
    v8 = -[UINavigationController popViewControllerAnimated:](self->_navController, "popViewControllerAnimated:", 1);
  }

}

uint64_t __61__CDPUIController__beginDevicePickerFlowFromEntryController___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_replaceViewController:withNewController:", *(_QWORD *)(a1 + 40), a2);
}

- (void)_replaceViewController:(id)a3 withNewController:(id)a4
{
  UINavigationController *navController;
  UIViewController *v7;
  void *v8;
  void *v9;
  UIViewController *rootViewController;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  navController = self->_navController;
  v7 = (UIViewController *)a3;
  -[UINavigationController viewControllers](navController, "viewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "replaceObjectAtIndex:withObject:", objc_msgSend(v9, "indexOfObject:", v7), v13);
  rootViewController = self->_rootViewController;

  if (rootViewController == v7)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelTapped_);
    objc_msgSend(v13, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLeftBarButtonItem:", v11);

  }
  -[UINavigationController setViewControllers:animated:](self->_navController, "setViewControllers:animated:", v9, 1);

}

- (id)_escapeOfferForDevice:(id)a3 withMask:(unint64_t)a4
{
  id v6;
  CDPRemoteValidationEscapeOffer *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  NSUInteger v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  CDPRemoteValidationEscapeOffer *v38;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  CDPRemoteValidationEscapeOffer *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;

  v6 = a3;
  v7 = -[CDPRemoteValidationEscapeOffer initWithCDPContext:]([CDPRemoteValidationEscapeOffer alloc], "initWithCDPContext:", self->_activeContext);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_FORGOT_HATCH"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modelClass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addDeviceClass:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSecretType:", objc_msgSend(v6, "localSecretType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setEscapeOfferName:](v7, "setEscapeOfferName:", v12);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_FORGOT_TITLE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSecretType:", objc_msgSend(v6, "localSecretType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setTitle:](v7, "setTitle:", v15);

  -[CDPUIController _escapeOfferMessageForDevice:withMask:](self, "_escapeOfferMessageForDevice:withMask:", v6, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setMessage:](v7, "setMessage:", v16);

  if (-[CDPUIController _isSOSCompatibilityCFUForSingleICSC](self, "_isSOSCompatibilityCFUForSingleICSC"))
  {
    CDPLocalizedString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPRemoteValidationEscapeOffer setTitle:](v7, "setTitle:", v17);

    v18 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_SOS_SINGLE_ICSC_ESCAPE_OFFER_MESSAGE"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSecretType:", objc_msgSend(v6, "localSecretType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithValidatedFormat:validFormatSpecifiers:error:", v21, CFSTR("%@"), 0, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPRemoteValidationEscapeOffer setMessage:](v7, "setMessage:", v23);

  }
  if ((a4 & 2) != 0 && -[NSArray count](self->_devices, "count") >= 2)
  {
    -[CDPUIController _chooseDeviceEscapeOption](self, "_chooseDeviceEscapeOption");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
    v33 = v24;
    objc_msgSend(v24, "setStyle:", 4);
LABEL_17:
    -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v7, "addEscapeOptionsObject:", v33);

    goto LABEL_18;
  }
  if ((a4 & 0x80) != 0)
  {
    -[CDPUIController _beginPiggybackingRecoveryEscapeOptionWithSupportedEscapeOfferMask:](self, "_beginPiggybackingRecoveryEscapeOptionWithSupportedEscapeOfferMask:", a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if ((a4 & 0x20) != 0)
  {
    -[CDPUIController _recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:](self, "_recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:", a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if ((a4 & 0x40) != 0)
  {
    -[CDPUIController _beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:](self, "_beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:", a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if ((a4 & 4) != 0 && self->_offeringRemoteApproval)
  {
    v25 = -[NSArray count](self->_devices, "count");
    v26 = (void *)MEMORY[0x24BDD17C8];
    if (v25 == 1)
    {
      objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_SOS_SINGLE_ICSC_ESCAPE_OFFER_MESSAGE_REMOTE_APPROVAL"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addSecretType:", objc_msgSend(v6, "localSecretType"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithValidatedFormat:validFormatSpecifiers:error:", v29, CFSTR("%@"), 0, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDPRemoteValidationEscapeOffer setMessage:](v7, "setMessage:", v31);

      -[CDPUIController _remoteApprovalEscapeOption](self, "_remoteApprovalEscapeOption");
      v32 = objc_claimAutoreleasedReturnValue();
      -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v7, "addEscapeOptionsObject:", v32);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_SOS_MULTI_ICSC_ESCAPE_OFFER_MESSAGE_CHOOSE_DEVICE"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "addSecretType:", objc_msgSend(v6, "localSecretType"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "localizedString");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedName");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithValidatedFormat:validFormatSpecifiers:error:", v54, CFSTR("%@"), 0, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDPRemoteValidationEscapeOffer setMessage:](v7, "setMessage:", v56);

      _CDPLogSystem();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        -[CDPUIController _escapeOfferForDevice:withMask:].cold.1();
    }

    +[CDPEscapeOption cancelOption](CDPEscapeOption, "cancelOption");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if ((a4 & 0x18) != 0)
  {
    v40 = -[NSArray prevailingLocalSecretType](self->_devices, "prevailingLocalSecretType");
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("DATA_RECOVERY_DEVICE_SELECTION_SKIP_TITLE"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addSecretType:", v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "localizedString");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("DATA_RECOVERY_DEVICE_SELECTION_SKIP_MESSAGE"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addSecretType:", v40);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "localizedString");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    CDPLocalizedString();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPUIController _skipOrDeleteiCloudDataEscapeOfferWithTitle:message:skipButtonTitle:supportedEscapeOfferMask:](self, "_skipOrDeleteiCloudDataEscapeOfferWithTitle:message:skipButtonTitle:supportedEscapeOfferMask:", v58, v57, v45, a4);
    v46 = (CDPRemoteValidationEscapeOffer *)(id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_FORGOT_HATCH"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "modelClass");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addDeviceClass:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addSecretType:", objc_msgSend(v6, "localSecretType"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "localizedString");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPRemoteValidationEscapeOffer setEscapeOfferName:](v46, "setEscapeOfferName:", v51);

    v7 = v46;
  }
LABEL_18:
  -[CDPRemoteValidationEscapeOffer escapeOptions](v7, "escapeOptions");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "count");

  if (!v35)
  {
    if (!-[CDPUIController _isSOSCompatibilityCFUForSingleICSC](self, "_isSOSCompatibilityCFUForSingleICSC"))
    {
      v38 = 0;
      goto LABEL_25;
    }
    +[CDPEscapeOption okOption](CDPEscapeOption, "okOption");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v7, "addEscapeOptionsObject:", v37);
    goto LABEL_23;
  }
  if (!self->_isWalrusEnabled)
  {
    -[CDPContext telemetryDeviceSessionID](self->_activeContext, "telemetryDeviceSessionID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPRemoteValidationEscapeOffer setDeviceSessionID:](v7, "setDeviceSessionID:", v36);

    -[CDPContext telemetryFlowID](self->_activeContext, "telemetryFlowID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPRemoteValidationEscapeOffer setFlowID:](v7, "setFlowID:", v37);
LABEL_23:

  }
  v38 = v7;
LABEL_25:

  return v38;
}

- (BOOL)_isSOSCompatibilityCFUForSingleICSC
{
  return -[CDPContext keychainSyncSystem](self->_activeContext, "keychainSyncSystem") == 1
      && -[NSArray count](self->_devices, "count") < 2;
}

- (void)sendEscapeOfferSelectedEvent:(id)a3
{
  void *v3;
  CDPContext *activeContext;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x24BDFC2A0];
  activeContext = self->_activeContext;
  v5 = *MEMORY[0x24BE1A660];
  v6 = *MEMORY[0x24BE1A860];
  v7 = a3;
  objc_msgSend(v3, "analyticsEventWithContext:eventName:category:", activeContext, v5, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE1A658]);

  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendEvent:", v9);

}

- (id)_chooseDeviceEscapeOption
{
  CDPEscapeOption *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v2 = objc_alloc_init(CDPEscapeOption);
  CDPLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPEscapeOption setTitle:](v2, "setTitle:", v3);

  -[CDPEscapeOption setTitleLocalizationKey:](v2, "setTitleLocalizationKey:", CFSTR("REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_CHOOSE_DEVICE"));
  -[CDPEscapeOption setTitleTelemetryKey:](v2, "setTitleTelemetryKey:", *MEMORY[0x24BE1A8C0]);
  v5 = MEMORY[0x24BDAC760];
  v6 = 3221225472;
  v7 = __44__CDPUIController__chooseDeviceEscapeOption__block_invoke;
  v8 = &unk_24C8546D8;
  objc_copyWeak(&v9, &location);
  -[CDPEscapeOption setEscapeAction:](v2, "setEscapeAction:", &v5);
  -[CDPEscapeOption setStyle:](v2, "setStyle:", 3, v5, v6, v7, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v2;
}

void __44__CDPUIController__chooseDeviceEscapeOption__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD v3[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "sendEscapeOfferSelectedEvent:", *MEMORY[0x24BE1A8C0]);
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __44__CDPUIController__chooseDeviceEscapeOption__block_invoke_2;
    v3[3] = &unk_24C8546B0;
    v3[4] = v2;
    objc_msgSend(v2, "_setupDevicePickerController:", v3);
  }

}

uint64_t __44__CDPUIController__chooseDeviceEscapeOption__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "pushViewController:animated:", a2, 1);
}

- (id)_escapeOfferMessageForDevice:(id)a3 withMask:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  id v25;

  v5 = a3;
  v6 = -[NSArray prevailingLocalSecretType](self->_devices, "prevailingLocalSecretType");
  if (objc_msgSend(MEMORY[0x24BE1A3F8], "isSubsetOfContextTypeSignIn:", -[CDPContext type](self->_activeContext, "type")))
  {
    v7 = objc_alloc_init(MEMORY[0x24BE1A4A8]);
    v25 = 0;
    v8 = objc_msgSend(v7, "walrusStatus:", &v25);
    v9 = v25;
    v10 = v9;
    if (v8 == 1)
    {
      v11 = -[CDPContext isAttemptingBackupRestore](self->_activeContext, "isAttemptingBackupRestore");
      v12 = (void *)MEMORY[0x24BDD17C8];
      if (v11)
      {
        objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_MESSAGE_WALRUS_BUDDY_BACKUP"), CFSTR("Localizable-Walrus"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addSecretType:", objc_msgSend(v5, "localSecretType"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "modelClass");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addDeviceClass:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "localizedName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithValidatedFormat:validFormatSpecifiers:error:", v17, CFSTR("%@"), 0, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_MESSAGE_WALRUS_SIGNIN"), CFSTR("Localizable-Walrus"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addSecretType:", objc_msgSend(v5, "localSecretType"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "localizedString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "localizedName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithValidatedFormat:validFormatSpecifiers:error:", v15, CFSTR("%@"), 0, v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_14;
    }

  }
  if (-[NSArray count](self->_devices, "count") != 1)
  {
    v23 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_MESSAGE_ANOTHER_DEVICE"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSecretType:", objc_msgSend(v5, "localSecretType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSecretType:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithValidatedFormat:validFormatSpecifiers:error:", v14, CFSTR("%@"), 0, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

    goto LABEL_15;
  }
  v20 = -[CDPContext type](self->_activeContext, "type");
  v21 = (void *)MEMORY[0x24BDD17C8];
  if (v20 == 2)
    v22 = CFSTR("REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_MESSAGE_RESET");
  else
    v22 = CFSTR("REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_MESSAGE");
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", v22);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSecretType:", objc_msgSend(v5, "localSecretType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithValidatedFormat:validFormatSpecifiers:error:", v13, CFSTR("%@"), 0, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v19;
}

- (id)_tryAgainLaterEscapeOption
{
  CDPEscapeOption *v3;
  void *v4;
  _QWORD v6[5];
  id v7;
  id location;

  v3 = objc_alloc_init(CDPEscapeOption);
  if ((objc_msgSend(MEMORY[0x24BE1A4A0], "isICSCHarmonizationEnabled") & 1) == 0)
    -[CDPEscapeOption setStyle:](v3, "setStyle:", 1);
  CDPLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPEscapeOption setTitle:](v3, "setTitle:", v4);

  -[CDPEscapeOption setTitleLocalizationKey:](v3, "setTitleLocalizationKey:", CFSTR("REMOTE_SECRET_RECOVERY_LIMIT_TRY_AGAIN_LATER"));
  -[CDPEscapeOption setTitleTelemetryKey:](v3, "setTitleTelemetryKey:", *MEMORY[0x24BE1A978]);
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__CDPUIController__tryAgainLaterEscapeOption__block_invoke;
  v6[3] = &unk_24C854700;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  -[CDPEscapeOption setEscapeAction:](v3, "setEscapeAction:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v3;
}

void __45__CDPUIController__tryAgainLaterEscapeOption__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "tryAgainLaterTapped:", *(_QWORD *)(a1 + 32));

}

- (id)_deviceLimitOfferDeviceSelectionForDevice:(id)a3 fromViewController:(id)a4
{
  id v6;
  id v7;
  CDPRemoteValidationEscapeOffer *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CDPEscapeOption *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = -[CDPRemoteValidationEscapeOffer initWithCDPContext:]([CDPRemoteValidationEscapeOffer alloc], "initWithCDPContext:", self->_activeContext);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_INCORRECT_TITLE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSecretType:", objc_msgSend(v6, "localSecretType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setTitle:](v8, "setTitle:", v11);

  if (objc_msgSend(MEMORY[0x24BE1A4A0], "isICSCHarmonizationEnabled"))
  {
    v12 = -[CDPContext idmsRecovery](self->_activeContext, "idmsRecovery");
    v13 = (void *)MEMORY[0x24BDD17C8];
    v14 = (void *)MEMORY[0x24BE1A458];
    if (v12)
      v15 = CFSTR("RECOVERY_REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_OTHER_ICSC");
    else
      v15 = CFSTR("REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_OTHER_ICSC");
  }
  else
  {
    v13 = (void *)MEMORY[0x24BDD17C8];
    v14 = (void *)MEMORY[0x24BE1A458];
    v15 = CFSTR("REMOTE_SECRET_RECOVERY_HARD_LIMIT_CHOOSE_DEVICE");
  }
  objc_msgSend(v14, "builderForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSecretType:", objc_msgSend(v6, "localSecretType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithValidatedFormat:validFormatSpecifiers:error:", v18, CFSTR("%@"), 0, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setMessage:](v8, "setMessage:", v20);

  objc_initWeak(&location, self);
  v21 = objc_alloc_init(CDPEscapeOption);
  CDPLocalizedString();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPEscapeOption setTitle:](v21, "setTitle:", v22);

  -[CDPEscapeOption setStyle:](v21, "setStyle:", 3);
  -[CDPEscapeOption setTitleTelemetryKey:](v21, "setTitleTelemetryKey:", *MEMORY[0x24BE1A8C0]);
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __80__CDPUIController__deviceLimitOfferDeviceSelectionForDevice_fromViewController___block_invoke;
  v26[3] = &unk_24C854700;
  objc_copyWeak(&v28, &location);
  v23 = v7;
  v27 = v23;
  -[CDPEscapeOption setEscapeAction:](v21, "setEscapeAction:", v26);
  -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v8, "addEscapeOptionsObject:", v21);
  -[CDPUIController _tryAgainLaterEscapeOption](self, "_tryAgainLaterEscapeOption");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v8, "addEscapeOptionsObject:", v24);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

  return v8;
}

void __80__CDPUIController__deviceLimitOfferDeviceSelectionForDevice_fromViewController___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_beginDevicePickerFlowFromEntryController:", *(_QWORD *)(a1 + 32));

}

- (id)_deviceLimitOfferPiggybackingForDevice:(id)a3 supportedEscapeOfferMask:(unint64_t)a4
{
  id v6;
  CDPRemoteValidationEscapeOffer *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v6 = a3;
  v7 = -[CDPRemoteValidationEscapeOffer initWithCDPContext:]([CDPRemoteValidationEscapeOffer alloc], "initWithCDPContext:", self->_activeContext);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_INCORRECT_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSecretType:", objc_msgSend(v6, "localSecretType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setTitle:](v7, "setTitle:", v10);

  v11 = objc_msgSend(MEMORY[0x24BE1A4A0], "isICSCHarmonizationEnabled");
  v12 = (void *)MEMORY[0x24BDD17C8];
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_TRUSTED_DEVICES"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSecretType:", objc_msgSend(v6, "localSecretType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithValidatedFormat:validFormatSpecifiers:error:", v15, CFSTR("%@"), 0, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPRemoteValidationEscapeOffer setMessage:](v7, "setMessage:", v17);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("PIGGYBACKING_RECOVERY_HELP_PROMPT_MESSAGE"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSecretType:", objc_msgSend(v6, "localSecretType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithValidatedFormat:validFormatSpecifiers:error:", v15, CFSTR("%@%@"), 0, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPRemoteValidationEscapeOffer setMessage:](v7, "setMessage:", v18);

  }
  -[CDPUIController _beginPiggybackingRecoveryEscapeOptionWithSupportedEscapeOfferMask:](self, "_beginPiggybackingRecoveryEscapeOptionWithSupportedEscapeOfferMask:", a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setStyle:", 3);
  if (objc_msgSend(MEMORY[0x24BE1A4A0], "isICSCHarmonizationEnabled"))
  {
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_ALERT_PIGGYBACKING"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTitle:", v21);

    objc_msgSend(v19, "setTitleLocalizationKey:", CFSTR("REMOTE_SECRET_ENTRY_ALERT_PIGGYBACKING"));
  }
  -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v7, "addEscapeOptionsObject:", v19);
  -[CDPUIController _tryAgainLaterEscapeOption](self, "_tryAgainLaterEscapeOption");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v7, "addEscapeOptionsObject:", v22);

  return v7;
}

- (id)_deviceLimitOfferRecoveryKeyForDevice:(id)a3 supportedEscapeOfferMask:(unint64_t)a4
{
  id v6;
  CDPRemoteValidationEscapeOffer *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  const __CFString *v14;
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
  void *v26;

  v6 = a3;
  v7 = -[CDPRemoteValidationEscapeOffer initWithCDPContext:]([CDPRemoteValidationEscapeOffer alloc], "initWithCDPContext:", self->_activeContext);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_INCORRECT_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSecretType:", objc_msgSend(v6, "localSecretType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setTitle:](v7, "setTitle:", v10);

  -[CDPUIController _recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:](self, "_recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE1A4A0], "isICSCHarmonizationEnabled"))
  {
    v12 = -[CDPContext idmsRecovery](self->_activeContext, "idmsRecovery");
    v13 = (void *)MEMORY[0x24BDD17C8];
    if (v12)
      v14 = CFSTR("RECOVERY_REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_RK");
    else
      v14 = CFSTR("REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_RK");
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSecretType:", objc_msgSend(v6, "localSecretType"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithValidatedFormat:validFormatSpecifiers:error:", v23, CFSTR("%@"), 0, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPRemoteValidationEscapeOffer setMessage:](v7, "setMessage:", v25);

    objc_msgSend(v11, "setStyle:", 3);
  }
  else
  {
    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_RECOVERY_HARD_LIMIT_LAST_DEVICE_RECOVERY_KEY"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSecretType:", objc_msgSend(v6, "localSecretType"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithValidatedFormat:validFormatSpecifiers:error:", v18, CFSTR("%@"), 0, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPRemoteValidationEscapeOffer setMessage:](v7, "setMessage:", v20);

  }
  -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v7, "addEscapeOptionsObject:", v11);
  -[CDPUIController _tryAgainLaterEscapeOption](self, "_tryAgainLaterEscapeOption");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v7, "addEscapeOptionsObject:", v26);

  return v7;
}

- (id)_deviceLimitOfferCustodianForDevice:(id)a3 supportedEscapeOfferMask:(unint64_t)a4
{
  id v6;
  CDPRemoteValidationEscapeOffer *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  const __CFString *v14;
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
  void *v26;

  v6 = a3;
  v7 = -[CDPRemoteValidationEscapeOffer initWithCDPContext:]([CDPRemoteValidationEscapeOffer alloc], "initWithCDPContext:", self->_activeContext);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_INCORRECT_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSecretType:", objc_msgSend(v6, "localSecretType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setTitle:](v7, "setTitle:", v10);

  -[CDPUIController _beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:](self, "_beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE1A4A0], "isICSCHarmonizationEnabled"))
  {
    v12 = -[CDPContext idmsRecovery](self->_activeContext, "idmsRecovery");
    v13 = (void *)MEMORY[0x24BDD17C8];
    if (v12)
      v14 = CFSTR("RECOVERY_REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_RC");
    else
      v14 = CFSTR("REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_RC");
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSecretType:", objc_msgSend(v6, "localSecretType"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithValidatedFormat:validFormatSpecifiers:error:", v23, CFSTR("%@"), 0, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPRemoteValidationEscapeOffer setMessage:](v7, "setMessage:", v25);

    objc_msgSend(v11, "setStyle:", 3);
  }
  else
  {
    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_RECOVERY_HARD_LIMIT_LAST_DEVICE_CUSTODIAN"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSecretType:", objc_msgSend(v6, "localSecretType"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithValidatedFormat:validFormatSpecifiers:error:", v18, CFSTR("%@"), 0, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPRemoteValidationEscapeOffer setMessage:](v7, "setMessage:", v20);

  }
  -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v7, "addEscapeOptionsObject:", v11);
  -[CDPUIController _tryAgainLaterEscapeOption](self, "_tryAgainLaterEscapeOption");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v7, "addEscapeOptionsObject:", v26);

  return v7;
}

- (id)_deviceLimitOfferRecoveryKeyAndCustodianForDevice:(id)a3 supportedEscapeOfferMask:(unint64_t)a4
{
  id v6;
  CDPRemoteValidationEscapeOffer *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = -[CDPRemoteValidationEscapeOffer initWithCDPContext:]([CDPRemoteValidationEscapeOffer alloc], "initWithCDPContext:", self->_activeContext);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_INCORRECT_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSecretType:", objc_msgSend(v6, "localSecretType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setTitle:](v7, "setTitle:", v10);

  v11 = -[CDPContext idmsRecovery](self->_activeContext, "idmsRecovery");
  v12 = (void *)MEMORY[0x24BDD17C8];
  if (v11)
    v13 = CFSTR("RECOVERY_REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_RK_AND_RC");
  else
    v13 = CFSTR("REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_RK_AND_RC");
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSecretType:", objc_msgSend(v6, "localSecretType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithValidatedFormat:validFormatSpecifiers:error:", v16, CFSTR("%@"), 0, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setMessage:](v7, "setMessage:", v18);

  -[CDPUIController _recoveryMethodEscapeOptionWithSupportedEscapeOfferMask:](self, "_recoveryMethodEscapeOptionWithSupportedEscapeOfferMask:", a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setStyle:", 3);
  -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v7, "addEscapeOptionsObject:", v19);
  -[CDPUIController _tryAgainLaterEscapeOption](self, "_tryAgainLaterEscapeOption");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v7, "addEscapeOptionsObject:", v20);

  return v7;
}

- (id)_deviceLimitOfferSkipForDevice:(id)a3
{
  id v4;
  CDPRemoteValidationEscapeOffer *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id location;

  v4 = a3;
  v5 = -[CDPRemoteValidationEscapeOffer initWithCDPContext:]([CDPRemoteValidationEscapeOffer alloc], "initWithCDPContext:", self->_activeContext);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_INCORRECT_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSecretType:", objc_msgSend(v4, "localSecretType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setTitle:](v5, "setTitle:", v8);

  -[CDPUIController _tryAgainLaterEscapeOption](self, "_tryAgainLaterEscapeOption");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(MEMORY[0x24BE1A4A0], "isICSCHarmonizationEnabled");
  v11 = (void *)MEMORY[0x24BDD17C8];
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_NO_RECOVERY_METHOD"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSecretType:", objc_msgSend(v4, "localSecretType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithValidatedFormat:validFormatSpecifiers:error:", v14, CFSTR("%@"), 0, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPRemoteValidationEscapeOffer setMessage:](v5, "setMessage:", v16);

    objc_msgSend(v9, "setStyle:", 3);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_RECOVERY_HARD_LIMIT_LAST_DEVICE_SKIP"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSecretType:", objc_msgSend(v4, "localSecretType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithValidatedFormat:validFormatSpecifiers:error:", v19, CFSTR("%@"), 0, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPRemoteValidationEscapeOffer setMessage:](v5, "setMessage:", v21);

  }
  objc_initWeak(&location, self);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __50__CDPUIController__deviceLimitOfferSkipForDevice___block_invoke;
  v23[3] = &unk_24C8546D8;
  objc_copyWeak(&v24, &location);
  objc_msgSend(v9, "setEscapeAction:", v23);
  -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v5, "addEscapeOptionsObject:", v9);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v5;
}

void __50__CDPUIController__deviceLimitOfferSkipForDevice___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "tryAgainLaterTapped:", WeakRetained);

}

- (id)_escapeOfferForMultiApprovalWithMask:(unint64_t)a3
{
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;

  -[CDPUIController _waitingForApprovalEscapeOffer](self, "_waitingForApprovalEscapeOffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CDPContext type](self->_activeContext, "type") == 2)
    v6 = CFSTR("WAITING_APPROVAL_RESET_DIALOG_MESSAGE_REPAIR");
  else
    v6 = CFSTR("WAITING_APPROVAL_RESET_DIALOG_MESSAGE");
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIController _localDeviceClass](self, "_localDeviceClass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addDeviceClass:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessage:", v10);

  if ((a3 & 0x10) != 0)
  {
    -[CDPUIController _enterSecretLaterEscapeOptionWithSecret:](self, "_enterSecretLaterEscapeOptionWithSecret:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("WAITING_APPROVAL_RESET_DIALOG_BUTTON_LATER"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTitle:", v18);

    objc_msgSend(v16, "setStyle:", 3);
    objc_msgSend(v5, "addEscapeOptionsObject:", v16);

    if ((a3 & 8) == 0)
    {
LABEL_6:
      if ((a3 & 0x40) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((a3 & 8) == 0)
  {
    goto LABEL_6;
  }
  v19 = -[NSArray prevailingLocalSecretType](self->_devices, "prevailingLocalSecretType");
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("DATA_RECOVERY_DEVICE_SELECTION_SKIP_TITLE"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSecretType:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("DATA_RECOVERY_DEVICE_SELECTION_SKIP_MESSAGE"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSecretType:", v19);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  CDPLocalizedString();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIController _skipOrDeleteiCloudDataEscapeOfferWithTitle:message:skipButtonTitle:supportedEscapeOfferMask:](self, "_skipOrDeleteiCloudDataEscapeOfferWithTitle:message:skipButtonTitle:supportedEscapeOfferMask:", v22, v25, v26, a3);
  v27 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)v27;
  if ((a3 & 0x40) != 0)
  {
LABEL_7:
    -[CDPUIController _beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:](self, "_beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addEscapeOptionsObject:", v11);

  }
LABEL_8:
  objc_msgSend(v5, "escapeOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    +[CDPEscapeOption cancelOption](CDPEscapeOption, "cancelOption");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addEscapeOptionsObject:", v14);

    v15 = v5;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_escapeOfferForSingleApprovalWithMask:(unint64_t)a3
{
  void *v4;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if ((a3 & 8) != 0)
  {
    v6 = -[NSArray prevailingLocalSecretType](self->_devices, "prevailingLocalSecretType");
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("DATA_RECOVERY_DEVICE_SELECTION_SKIP_TITLE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSecretType:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("DATA_RECOVERY_DEVICE_SELECTION_SKIP_MESSAGE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSecretType:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    CDPLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPUIController _skipOrDeleteiCloudDataEscapeOfferWithTitle:message:skipButtonTitle:supportedEscapeOfferMask:](self, "_skipOrDeleteiCloudDataEscapeOfferWithTitle:message:skipButtonTitle:supportedEscapeOfferMask:", v9, v12, v13, a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)dismissAndResetAccountCDPState:(id)a3 localSecret:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  CDPUIController *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __62__CDPUIController_dismissAndResetAccountCDPState_localSecret___block_invoke;
  v11[3] = &unk_24C854728;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  v10 = self;
  -[CDPUIController _dismissPresentedViewControllerWithReason:completion:](v10, "_dismissPresentedViewControllerWithReason:completion:", CFSTR("com.apple.CoreCDPUI.CDPEnrollmentCompleted"), v11);

}

uint64_t __62__CDPUIController_dismissAndResetAccountCDPState_localSecret___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "escapeOfferSelectedWithOption:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "sendEscapeOfferSelectedEvent:", *MEMORY[0x24BE1A948]);
  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  v5 = objc_msgSend(*(id *)(v3 + 136), "escapeOffersPresented");
  if (v2)
    return objc_msgSend(v4, "resetAccountCDPStateWithEscapeOptionsOffered:andSetSecret:", v5, *(_QWORD *)(a1 + 48));
  else
    return objc_msgSend(v4, "resetAccountCDPStateWithEscapeOptionsOffered:", v5);
}

- (id)_beginPiggybackingRecoveryEscapeOptionWithSupportedEscapeOfferMask:(unint64_t)a3
{
  CDPEscapeOption *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  id v10[2];
  id location;

  objc_initWeak(&location, self);
  v5 = objc_alloc_init(CDPEscapeOption);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("DATA_RECOVERY_PROX_PIGGYBACKING_DIALOG"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPEscapeOption setTitle:](v5, "setTitle:", v7);

  -[CDPEscapeOption setTitleLocalizationKey:](v5, "setTitleLocalizationKey:", CFSTR("DATA_RECOVERY_PROX_PIGGYBACKING_DIALOG"));
  -[CDPEscapeOption setTitleTelemetryKey:](v5, "setTitleTelemetryKey:", *MEMORY[0x24BE1A8E0]);
  -[CDPEscapeOption setStyle:](v5, "setStyle:", 4);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __86__CDPUIController__beginPiggybackingRecoveryEscapeOptionWithSupportedEscapeOfferMask___block_invoke;
  v9[3] = &unk_24C854750;
  objc_copyWeak(v10, &location);
  v9[4] = self;
  v10[1] = (id)a3;
  -[CDPEscapeOption setEscapeAction:](v5, "setEscapeAction:", v9);
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
  return v5;
}

void __86__CDPUIController__beginPiggybackingRecoveryEscapeOptionWithSupportedEscapeOfferMask___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int16 v14[8];

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 0;
    _os_log_impl(&dword_20DC8F000, v2, OS_LOG_TYPE_DEFAULT, "\"User elected to start piggybacking flow\", (uint8_t *)v14, 2u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "sendEscapeOfferSelectedEvent:", *MEMORY[0x24BE1A8E0]);
    objc_msgSend(*(id *)(a1 + 32), "_piggybackingViewControllerWithSupportedEscapeOfferMask:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[4], "pushViewController:animated:", v4, 1);
    v5 = WeakRetained[17];
    if (v5)
    {
      objc_msgSend(v5, "insert:", 128);
    }
    else
    {
      _CDPLogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        __86__CDPUIController__beginPiggybackingRecoveryEscapeOptionWithSupportedEscapeOfferMask___block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);

    }
  }

}

- (id)updateContextWithAuthResults:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (objc_class *)MEMORY[0x24BE1A3F8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithAuthenticationResults:", v5);

  objc_msgSend(v6, "set_alwaysCreateEscrowRecord:", -[CDPContext _alwaysCreateEscrowRecord](self->_activeContext, "_alwaysCreateEscrowRecord"));
  objc_msgSend(v6, "setType:", -[CDPContext type](self->_activeContext, "type"));
  objc_msgSend(v6, "setSosCompatibilityType:", -[CDPContext sosCompatibilityType](self->_activeContext, "sosCompatibilityType"));
  objc_msgSend(v6, "setKeychainSyncSystem:", -[CDPContext keychainSyncSystem](self->_activeContext, "keychainSyncSystem"));
  objc_msgSend(v6, "setIsSOSCFUFlow:", -[CDPContext isSOSCFUFlow](self->_activeContext, "isSOSCFUFlow"));
  -[CDPContext telemetryFlowID](self->_activeContext, "telemetryFlowID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTelemetryFlowID:", v7);

  -[CDPContext telemetryDeviceSessionID](self->_activeContext, "telemetryDeviceSessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTelemetryDeviceSessionID:", v8);

  -[CDPContext password](self->_activeContext, "password");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPassword:", v9);

  -[CDPContext cachedLocalSecret](self->_activeContext, "cachedLocalSecret");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCachedLocalSecret:", v10);

  objc_msgSend(v6, "setCachedLocalSecretType:", -[CDPContext cachedLocalSecretType](self->_activeContext, "cachedLocalSecretType"));
  -[CDPContext sharingChannel](self->_activeContext, "sharingChannel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSharingChannel:", v11);

  return v6;
}

- (void)piggybackingUserDidNotGetACode:(unint64_t)a3
{
  CDPRemoteValidationEscapeOffer *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CDPEscapeOption *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  CDPRemoteValidationEscapeOffer *v17;
  _QWORD v18[4];
  CDPRemoteValidationEscapeOffer *v19;
  CDPUIController *v20;
  _QWORD v21[5];
  id v22[2];
  id location;

  objc_initWeak(&location, self);
  v5 = -[CDPRemoteValidationEscapeOffer initWithCDPContext:]([CDPRemoteValidationEscapeOffer alloc], "initWithCDPContext:", self->_activeContext);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("DATA_RECOVERY_PROX_PIGGYBACKING_DID_NOT_GET_CODE_MESSAGE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setMessage:](v5, "setMessage:", v7);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("DATA_RECOVERY_PROX_PIGGYBACKING_DID_NOT_GET_CODE_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setTitle:](v5, "setTitle:", v9);

  CDPLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIController _piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers:title:localizationKey:](self, "_piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers:title:localizationKey:", a3, v10, CFSTR("DATA_RECOVERY_PROX_PIGGYBACKING_RESEND_CODE_TO_MY_DEVICES_TITLE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v5, "addEscapeOptionsObject:", v11);
  v12 = objc_alloc_init(CDPEscapeOption);
  CDPLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPEscapeOption setTitle:](v12, "setTitle:", v13);

  -[CDPEscapeOption setTitleLocalizationKey:](v12, "setTitleLocalizationKey:", CFSTR("DATA_RECOVERY_PROX_PIGGYBACKING_CANT_GET_TO_MY_DEVICES_TITLE"));
  -[CDPEscapeOption setStyle:](v12, "setStyle:", 4);
  -[CDPEscapeOption setTitleTelemetryKey:](v12, "setTitleTelemetryKey:", *MEMORY[0x24BE1A890]);
  v14 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __50__CDPUIController_piggybackingUserDidNotGetACode___block_invoke;
  v21[3] = &unk_24C854750;
  objc_copyWeak(v22, &location);
  v21[4] = self;
  v22[1] = (id)a3;
  -[CDPEscapeOption setEscapeAction:](v12, "setEscapeAction:", v21);
  -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v5, "addEscapeOptionsObject:", v12);
  +[CDPEscapeOption cancelOption](CDPEscapeOption, "cancelOption");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v5, "addEscapeOptionsObject:", v15);

  -[UINavigationController topViewController](self->_navController, "topViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setPresentingViewController:](v5, "setPresentingViewController:", v16);

  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __50__CDPUIController_piggybackingUserDidNotGetACode___block_invoke_2;
  v18[3] = &unk_24C854520;
  v19 = v5;
  v20 = self;
  v17 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v18);

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
}

void __50__CDPUIController_piggybackingUserDidNotGetACode___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "sendEscapeOfferSelectedEvent:", *MEMORY[0x24BE1A890]);
  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __50__CDPUIController_piggybackingUserDidNotGetACode___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "_piggybackingEscapeOfferCantGetToDevicesWithSupportedEscapeOffers:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresentingViewController:", v5);

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__CDPUIController_piggybackingUserDidNotGetACode___block_invoke_311;
  v7[3] = &unk_24C854520;
  v8 = v4;
  v9 = WeakRetained;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __50__CDPUIController_piggybackingUserDidNotGetACode___block_invoke_311(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleEscapeAction:", *(_QWORD *)(a1 + 40));
}

uint64_t __50__CDPUIController_piggybackingUserDidNotGetACode___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleEscapeAction:", *(_QWORD *)(a1 + 40));
}

- (id)_piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers:(unint64_t)a3 title:(id)a4 localizationKey:(id)a5
{
  id v8;
  id v9;
  CDPEscapeOption *v10;
  _QWORD v12[5];
  id v13[2];
  id location;

  v8 = a4;
  v9 = a5;
  objc_initWeak(&location, self);
  v10 = objc_alloc_init(CDPEscapeOption);
  -[CDPEscapeOption setTitle:](v10, "setTitle:", v8);
  -[CDPEscapeOption setTitleLocalizationKey:](v10, "setTitleLocalizationKey:", v9);
  -[CDPEscapeOption setTitleTelemetryKey:](v10, "setTitleTelemetryKey:", *MEMORY[0x24BE1A958]);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke;
  v12[3] = &unk_24C8547C8;
  v12[4] = self;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a3;
  -[CDPEscapeOption setEscapeAction:](v10, "setEscapeAction:", v12);
  objc_destroyWeak(v13);
  objc_destroyWeak(&location);

  return v10;
}

void __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[7];
  uint8_t buf[16];

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DC8F000, v2, OS_LOG_TYPE_DEFAULT, "\"User elected to send code, starting piggybacking based data recovery\", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "sendEscapeOfferSelectedEvent:", *MEMORY[0x24BE1A958]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(v4 + 56);
    objc_msgSend(*(id *)(v4 + 32), "topViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_313;
    v9[3] = &unk_24C8547A0;
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 32);
    v9[4] = WeakRetained;
    v9[5] = v8;
    v9[6] = v7;
    +[CDPUIAuthenticationHelper proxAuthenticationForContext:viewController:withCompletion:](CDPUIAuthenticationHelper, "proxAuthenticationForContext:viewController:withCompletion:", v5, v6, v9);

  }
}

void __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_313(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[6];
  _QWORD block[5];
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_313_cold_1();

    if (objc_msgSend(v6, "code") == -7035)
    {
      objc_msgSend(v7, "piggybackingUserDidNotGetACode:", *(_QWORD *)(a1 + 48));
    }
    else if (objc_msgSend(v6, "code") != -7064 && objc_msgSend(v6, "code") != -7003)
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_314;
      v14[3] = &unk_24C854610;
      v15 = v6;
      v16 = v7;
      v17 = *(_QWORD *)(a1 + 48);
      dispatch_async(MEMORY[0x24BDAC9B8], v14);

    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v5;
      _os_log_impl(&dword_20DC8F000, v9, OS_LOG_TYPE_DEFAULT, "\"Piggybacking handshake is completed with authResults %@...start circle join\", buf, 0xCu);
    }

    objc_msgSend(v7, "updateContextWithAuthResults:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isPiggybackingRecovery"))
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_315;
      block[3] = &unk_24C8541C0;
      block[4] = *(_QWORD *)(a1 + 40);
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      objc_msgSend(v7, "attemptToJoinCircleWithPiggybacking:mask:", v10, *(_QWORD *)(a1 + 48));
    }
    else
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_317;
      v12[3] = &unk_24C854778;
      v11 = *(_QWORD *)(a1 + 48);
      v12[4] = v7;
      v12[5] = v11;
      dispatch_async(MEMORY[0x24BDAC9B8], v12);
    }

  }
}

void __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_314(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_314_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "_piggybackingSomethingWentWrong:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleEscapeAction:", *(_QWORD *)(a1 + 40));

}

void __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_315(uint64_t a1)
{
  id v2;
  id v3;
  NSObject *v4;

  objc_opt_class();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "topViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  if (v3)
  {
    _CDPLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_315_cold_1();

    objc_msgSend(v3, "startSpinning");
  }

}

void __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_317(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_317_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "_piggybackingHandleNonProxError:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPresentingViewController:", v4);

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_318;
  v7[3] = &unk_24C854520;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_318(uint64_t a1)
{
  NSObject *v2;

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_318_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "handleEscapeAction:", *(_QWORD *)(a1 + 40));
}

- (id)_piggybackingHandleNonProxError:(unint64_t)a3
{
  CDPRemoteValidationEscapeOffer *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CDPEscapeOption *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  CDPUIController *v19;
  id v20[2];
  id location;

  v5 = -[CDPRemoteValidationEscapeOffer initWithCDPContext:]([CDPRemoteValidationEscapeOffer alloc], "initWithCDPContext:", self->_activeContext);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("DATA_RECOVERY_PROX_PIGGYBACKING_NON_PROX_ERROR_MESSAGE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setMessage:](v5, "setMessage:", v7);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("DATA_RECOVERY_PROX_PIGGYBACKING_NON_PROX_ERROR_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setTitle:](v5, "setTitle:", v9);

  CDPLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIController _piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers:title:localizationKey:](self, "_piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers:title:localizationKey:", a3, v10, CFSTR("DATA_RECOVERY_PROX_PIGGYBACKING_NON_PROX_ERROR_SEND_NEW_CODE_TITLE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v5, "addEscapeOptionsObject:", v11);
  v12 = objc_alloc_init(CDPEscapeOption);
  CDPLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPEscapeOption setTitle:](v12, "setTitle:", v13);

  -[CDPEscapeOption setTitleLocalizationKey:](v12, "setTitleLocalizationKey:", CFSTR("DATA_RECOVERY_PROX_PIGGYBACKING_CANT_GET_TO_MY_DEVICES_TITLE"));
  -[CDPEscapeOption setStyle:](v12, "setStyle:", 4);
  -[CDPEscapeOption setTitleTelemetryKey:](v12, "setTitleTelemetryKey:", *MEMORY[0x24BE1A890]);
  objc_initWeak(&location, self);
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __51__CDPUIController__piggybackingHandleNonProxError___block_invoke;
  v18 = &unk_24C854750;
  objc_copyWeak(v20, &location);
  v19 = self;
  v20[1] = (id)a3;
  -[CDPEscapeOption setEscapeAction:](v12, "setEscapeAction:", &v15);
  -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v5, "addEscapeOptionsObject:", v12, v15, v16, v17, v18);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  return v5;
}

void __51__CDPUIController__piggybackingHandleNonProxError___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  id *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id *v10;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "sendEscapeOfferSelectedEvent:", *MEMORY[0x24BE1A890]);
  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __50__CDPUIController_piggybackingUserDidNotGetACode___block_invoke_cold_1();

  objc_msgSend(WeakRetained, "_piggybackingEscapeOfferCantGetToDevicesWithSupportedEscapeOffers:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained[4], "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresentingViewController:", v5);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__CDPUIController__piggybackingHandleNonProxError___block_invoke_326;
  v8[3] = &unk_24C854520;
  v9 = v4;
  v10 = WeakRetained;
  v6 = WeakRetained;
  v7 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

uint64_t __51__CDPUIController__piggybackingHandleNonProxError___block_invoke_326(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleEscapeAction:", *(_QWORD *)(a1 + 40));
}

- (void)attemptToJoinCircleWithPiggybacking:(id)a3 mask:(unint64_t)a4 validator:(id)a5
{
  id v8;

  objc_storeStrong((id *)&self->_remoteSecretValidator, a5);
  v8 = a3;
  -[CDPUIController attemptToJoinCircleWithPiggybacking:mask:](self, "attemptToJoinCircleWithPiggybacking:mask:", v8, a4);

}

- (void)attemptToJoinCircleWithPiggybacking:(id)a3 mask:(unint64_t)a4
{
  id v6;
  CDPRemoteDeviceSecretValidator *remoteSecretValidator;
  _QWORD v8[5];
  id v9[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  remoteSecretValidator = self->_remoteSecretValidator;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__CDPUIController_attemptToJoinCircleWithPiggybacking_mask___block_invoke;
  v8[3] = &unk_24C8547F0;
  objc_copyWeak(v9, &location);
  v8[4] = self;
  v9[1] = (id)a4;
  -[CDPRemoteDeviceSecretValidator attemptToJoinCircleWithPiggybacking:withCompletion:](remoteSecretValidator, "attemptToJoinCircleWithPiggybacking:withCompletion:", v6, v8);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);

}

void __60__CDPUIController_attemptToJoinCircleWithPiggybacking_mask___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[16];
  _QWORD block[5];
  id v19;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__CDPUIController_attemptToJoinCircleWithPiggybacking_mask___block_invoke_2;
  block[3] = &unk_24C854520;
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v19 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  if (a2)
  {
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DC8F000, v9, OS_LOG_TYPE_DEFAULT, "\"Piggybacking succeeded, safe to dismiss the view\", buf, 2u);
    }

    objc_msgSend(WeakRetained, "_dismissPresentedViewControllerCompletion:", 0);
  }
  else
  {
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __60__CDPUIController_attemptToJoinCircleWithPiggybacking_mask___block_invoke_327;
    v13[3] = &unk_24C854610;
    v10 = v8;
    v11 = *(_QWORD *)(a1 + 32);
    v14 = v10;
    v15 = v11;
    v16 = *(_QWORD *)(a1 + 48);
    v12 = (void *)MEMORY[0x24BDAC9B8];
    dispatch_async(MEMORY[0x24BDAC9B8], v13);

  }
}

void __60__CDPUIController_attemptToJoinCircleWithPiggybacking_mask___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  NSObject *v4;

  objc_opt_class();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "topViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  if (v3)
  {
    _CDPLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __60__CDPUIController_attemptToJoinCircleWithPiggybacking_mask___block_invoke_2_cold_1();

    objc_msgSend(v3, "stopSpinning");
  }

}

void __60__CDPUIController_attemptToJoinCircleWithPiggybacking_mask___block_invoke_327(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __60__CDPUIController_attemptToJoinCircleWithPiggybacking_mask___block_invoke_327_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "_piggybackingSomethingWentWrong:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleEscapeAction:", *(_QWORD *)(a1 + 40));

}

- (id)_piggybackingCantGetToMyDevices:(id)a3 message:(id)a4 skipButtonTitle:(id)a5 supportedEscapeOfferMask:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  CDPRemoteValidationEscapeOffer *v13;
  void *v14;
  void *v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((a6 & 0x20) != 0)
  {
    v13 = -[CDPRemoteValidationEscapeOffer initWithCDPContext:]([CDPRemoteValidationEscapeOffer alloc], "initWithCDPContext:", self->_activeContext);
    -[CDPUIController _recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:](self, "_recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:", a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v15 = v14;
    objc_msgSend(v14, "setStyle:", 4);
    -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v13, "addEscapeOptionsObject:", v15);

    goto LABEL_8;
  }
  if ((a6 & 0x40) != 0)
  {
    v13 = -[CDPRemoteValidationEscapeOffer initWithCDPContext:]([CDPRemoteValidationEscapeOffer alloc], "initWithCDPContext:", self->_activeContext);
    -[CDPUIController _beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:](self, "_beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:", a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if ((a6 & 8) != 0)
  {
    -[CDPUIController _skipOrDeleteiCloudDataEscapeOfferWithTitle:message:skipButtonTitle:supportedEscapeOfferMask:](self, "_skipOrDeleteiCloudDataEscapeOfferWithTitle:message:skipButtonTitle:supportedEscapeOfferMask:", v10, v11, v12, a6);
    v13 = (CDPRemoteValidationEscapeOffer *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
LABEL_8:

  return v13;
}

- (id)_piggybackingEscapeOfferCantGetToDevicesWithSupportedEscapeOffers:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  CDPLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CDPLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CDPLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIController _piggybackingCantGetToMyDevices:message:skipButtonTitle:supportedEscapeOfferMask:](self, "_piggybackingCantGetToMyDevices:message:skipButtonTitle:supportedEscapeOfferMask:", v5, v6, v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_piggybackingViewControllerWithSupportedEscapeOfferMask:(unint64_t)a3
{
  CDPUIPiggybackingViewModel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CDPUIPiggybackingViewController *v12;

  v5 = objc_alloc_init(CDPUIPiggybackingViewModel);
  -[CDPUIPiggybackingViewModel setIconName:](v5, "setIconName:", CFSTR("piggybacking_prox"));
  CDPLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIPiggybackingViewModel setTitle:](v5, "setTitle:", v6);

  CDPLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIPiggybackingViewModel setMessage:](v5, "setMessage:", v7);

  CDPLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIController _piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers:title:localizationKey:](self, "_piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers:title:localizationKey:", a3, v8, CFSTR("DATA_RECOVERY_PROX_PIGGYBACKING_SEND_CODE_BUTTON_TITLE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDPUIPiggybackingViewModel setSendCodeOption:](v5, "setSendCodeOption:", v9);
  -[CDPUIController _piggybackingEscapeOfferCantGetToDevicesWithSupportedEscapeOffers:](self, "_piggybackingEscapeOfferCantGetToDevicesWithSupportedEscapeOffers:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CDPLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEscapeOfferName:", v11);

  objc_msgSend(v10, "setTitleTelemetryKey:", *MEMORY[0x24BE1A890]);
  -[CDPUIPiggybackingViewModel setCantGetToDeviceOption:](v5, "setCantGetToDeviceOption:", v10);
  v12 = -[CDPUIPiggybackingViewController initWithViewModel:cdpContext:]([CDPUIPiggybackingViewController alloc], "initWithViewModel:cdpContext:", v5, self->_activeContext);
  objc_msgSend(v10, "setPresentingViewController:", v12);

  return v12;
}

- (id)_piggybackingSomethingWentWrong:(unint64_t)a3
{
  char v5;
  CDPRemoteValidationEscapeOffer *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = ~(_BYTE)a3;
  v6 = -[CDPRemoteValidationEscapeOffer initWithCDPContext:]([CDPRemoteValidationEscapeOffer alloc], "initWithCDPContext:", self->_activeContext);
  CDPLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setTitle:](v6, "setTitle:", v7);

  CDPLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIController _piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers:title:localizationKey:](self, "_piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers:title:localizationKey:", a3, v8, CFSTR("DATA_RECOVERY_PROX_PIGGYBACKING_SEND_NEW_CODE_BUTTON_TITLE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v6, "addEscapeOptionsObject:", v9);
  if ((v5 & 0x60) == 0)
  {
    CDPLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPRemoteValidationEscapeOffer setMessage:](v6, "setMessage:", v10);

    -[CDPUIController _recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:](self, "_recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("DATA_RECOVERY_PROX_PIGGYBACKING_USE_RECOVERY_METHOD_TITLE");
LABEL_8:
    CDPLocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:", v16);

    objc_msgSend(v11, "setTitleLocalizationKey:", v12);
    v14 = v11;
    goto LABEL_9;
  }
  if ((a3 & 0x20) != 0)
  {
    CDPLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPRemoteValidationEscapeOffer setMessage:](v6, "setMessage:", v13);

    -[CDPUIController _recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:](self, "_recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;
LABEL_9:
    objc_msgSend(v14, "setStyle:", 4);
    -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v6, "addEscapeOptionsObject:", v11);
    goto LABEL_10;
  }
  if ((a3 & 0x40) != 0)
  {
    CDPLocalizedString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPRemoteValidationEscapeOffer setMessage:](v6, "setMessage:", v15);

    -[CDPUIController _beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:](self, "_beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("DATA_RECOVERY_PROX_PIGGYBACKING_USE_CUSTODIAN_RECOVERY_TITLE");
    goto LABEL_8;
  }
  CDPLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setMessage:](v6, "setMessage:", v11);
LABEL_10:

  -[CDPUIController _tryAgainLaterEscapeOption](self, "_tryAgainLaterEscapeOption");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v6, "addEscapeOptionsObject:", v17);

  -[UINavigationController topViewController](self->_navController, "topViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setPresentingViewController:](v6, "setPresentingViewController:", v18);

  return v6;
}

- (id)_beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:(unint64_t)a3
{
  CDPEscapeOption *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v10[5];
  id v11[2];
  id location;

  objc_initWeak(&location, self);
  v5 = objc_alloc_init(CDPEscapeOption);
  if (objc_msgSend(MEMORY[0x24BE1A4A0], "isICSCHarmonizationEnabled"))
  {
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_ALERT_USE_RECOVERY_CONTACT"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPEscapeOption setTitle:](v5, "setTitle:", v7);
    v8 = CFSTR("REMOTE_SECRET_ENTRY_ALERT_USE_RECOVERY_CONTACT");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_CUSTODIAN"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPEscapeOption setTitle:](v5, "setTitle:", v7);
    v8 = CFSTR("REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_CUSTODIAN");
  }

  -[CDPEscapeOption setTitleLocalizationKey:](v5, "setTitleLocalizationKey:", v8);
  -[CDPEscapeOption setTitleTelemetryKey:](v5, "setTitleTelemetryKey:", *MEMORY[0x24BE1A8E8]);
  -[CDPEscapeOption setStyle:](v5, "setStyle:", 4);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __83__CDPUIController__beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask___block_invoke;
  v10[3] = &unk_24C854750;
  objc_copyWeak(v11, &location);
  v10[4] = self;
  v11[1] = (id)a3;
  -[CDPEscapeOption setEscapeAction:](v5, "setEscapeAction:", v10);
  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
  return v5;
}

void __83__CDPUIController__beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int16 v14[8];

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 0;
    _os_log_impl(&dword_20DC8F000, v2, OS_LOG_TYPE_DEFAULT, "\"Walrus User elected to start Custodian Flow, Showing Ask Help Now View\", (uint8_t *)v14, 2u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "_custodianAskHelpViewControllerWithSupportedEscapeOfferMask:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[4], "pushViewController:animated:", v4, 1);
    v5 = WeakRetained[17];
    if (v5)
    {
      objc_msgSend(v5, "insert:", 64);
    }
    else
    {
      _CDPLogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        __83__CDPUIController__beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask___block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);

    }
  }

}

- (id)_custodianResetProtectedDataEscapeOfferWithSupportedEscapeOffers:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  CDPLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CDPLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CDPLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIController _skipOrDeleteiCloudDataEscapeOfferWithTitle:message:skipButtonTitle:supportedEscapeOfferMask:](self, "_skipOrDeleteiCloudDataEscapeOfferWithTitle:message:skipButtonTitle:supportedEscapeOfferMask:", v5, v6, v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_custodianAskHelpViewControllerWithSupportedEscapeOfferMask:(unint64_t)a3
{
  CDPUICustodianAskHelpViewModel *v5;
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
  uint64_t v16;
  void *v17;
  CDPUICustodianAskHelpViewController *v18;

  v5 = objc_alloc_init(CDPUICustodianAskHelpViewModel);
  -[CDPUICustodianAskHelpViewModel setIconName:](v5, "setIconName:", CFSTR("recovery_contact"));
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("GET_HELP_FROM_RC_VIEW_TITLE"), CFSTR("Localizable-Walrus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUICustodianAskHelpViewModel setTitle:](v5, "setTitle:", v7);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("GET_HELP_FROM_RC_VIEW_MESSAGE"), CFSTR("Localizable-Walrus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUICustodianAskHelpViewModel setMessage:](v5, "setMessage:", v9);

  -[CDPUIController _custodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:](self, "_custodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("GET_HELP_NOW_BUTTON_TITLE"), CFSTR("Localizable-Walrus"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v12);

  objc_msgSend(v10, "setTitleLocalizationKey:", CFSTR("GET_HELP_NOW_BUTTON_TITLE"));
  -[CDPUICustodianAskHelpViewModel setGetHelpNowOption:](v5, "setGetHelpNowOption:", v10);
  -[CDPUIController _custodianResetProtectedDataEscapeOfferWithSupportedEscapeOffers:](self, "_custodianResetProtectedDataEscapeOfferWithSupportedEscapeOffers:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("WALRUS_BUTTON_TITLE_DONT_ASK_FOR_HELP"), CFSTR("Localizable-Walrus"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEscapeOfferName:", v15);

  -[CDPUICustodianAskHelpViewModel setDontAskForHelpOption:](v5, "setDontAskForHelpOption:", v13);
  v16 = *MEMORY[0x24BE1A908];
  -[CDPUICustodianAskHelpViewModel dontAskForHelpOption](v5, "dontAskForHelpOption");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTitleTelemetryKey:", v16);

  v18 = -[CDPUICustodianAskHelpViewController initWithViewModel:cdpContext:]([CDPUICustodianAskHelpViewController alloc], "initWithViewModel:cdpContext:", v5, self->_activeContext);
  objc_msgSend(v13, "setPresentingViewController:", v18);

  return v18;
}

- (id)_custodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:(unint64_t)a3
{
  void *v5;
  CDPEscapeOption *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13[2];
  id location;

  objc_initWeak(&location, self);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A400]), "initWithContext:", self->_activeContext);
  v6 = objc_alloc_init(CDPEscapeOption);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_CUSTODIAN"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPEscapeOption setTitle:](v6, "setTitle:", v8);

  -[CDPEscapeOption setTitleTelemetryKey:](v6, "setTitleTelemetryKey:", *MEMORY[0x24BE1A8E8]);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __78__CDPUIController__custodianRecoveryEscapeOptionWithSupportedEscapeOfferMask___block_invoke;
  v11[3] = &unk_24C854660;
  objc_copyWeak(v13, &location);
  v11[4] = self;
  v9 = v5;
  v12 = v9;
  v13[1] = (id)a3;
  -[CDPEscapeOption setEscapeAction:](v6, "setEscapeAction:", v11);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
  return v6;
}

void __78__CDPUIController__custodianRecoveryEscapeOptionWithSupportedEscapeOfferMask___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  id *v4;
  void *v5;
  uint8_t v6[16];

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_20DC8F000, v2, OS_LOG_TYPE_DEFAULT, "\"User elected to start Custodian Flow, Showing OS picker\", v6, 2u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "sendEscapeOfferSelectedEvent:", *MEMORY[0x24BE1A8E8]);
    objc_msgSend(*(id *)(a1 + 32), "custodianOSSelectionViewControllerWithCustodianController:supportedEscapeOfferMask:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4[4], "pushViewController:animated:", v5, 1);

  }
}

- (id)custodianOSSelectionViewControllerWithCustodianController:(id)a3 supportedEscapeOfferMask:(unint64_t)a4
{
  id v5;
  CDPUICustodianOSSelectionViewModel *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  CDPEscapeOption *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CDPEscapeOption *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  CDPEscapeOption *v25;
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
  void *v36;
  void *v37;
  void *v38;
  CDPUICustodianOSSelectionViewController *v39;
  id v41;
  void *v42;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD aBlock[5];
  id v49;
  id v50[2];
  id buf;
  _QWORD v52[2];
  _QWORD v53[5];

  v53[3] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_alloc_init(CDPUICustodianOSSelectionViewModel);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("CUSTODIAN_RECOVERY_OS_PICKER_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUICustodianOSSelectionViewModel setTitle:](v6, "setTitle:", v8);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("CUSTODIAN_RECOVERY_OS_PICKER_SUBTITLE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUICustodianOSSelectionViewModel setMessage:](v6, "setMessage:", v10);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", CFSTR("recovery_contact"), v42);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUICustodianOSSelectionViewModel setIcon:](v6, "setIcon:", v11);

  -[CDPUICustodianOSSelectionViewModel setTableViewStyle:](v6, "setTableViewStyle:", 2);
  _CDPLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_20DC8F000, v12, OS_LOG_TYPE_DEFAULT, "\"Starting a new recovery recovery session...\", (uint8_t *)&buf, 2u);
  }

  objc_msgSend(v5, "startRecoverySessionWithCompletion:", &__block_literal_global_387);
  objc_initWeak(&buf, self);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __102__CDPUIController_custodianOSSelectionViewControllerWithCustodianController_supportedEscapeOfferMask___block_invoke_388;
  aBlock[3] = &unk_24C854858;
  objc_copyWeak(v50, &buf);
  aBlock[4] = self;
  v41 = v5;
  v49 = v41;
  v50[1] = (id)a4;
  v13 = _Block_copy(aBlock);
  v14 = objc_alloc_init(CDPEscapeOption);
  -[CDPEscapeOption setStyle:](v14, "setStyle:", 0);
  -[CDPEscapeOption setTitleLocalizationKey:](v14, "setTitleLocalizationKey:", CFSTR("CUSTODIAN_RECOVERY_OS_PICKER_INSTRUCTIONS_FOR_CONTACT"));
  v15 = (void *)MEMORY[0x24BE1A458];
  -[CDPEscapeOption titleLocalizationKey](v14, "titleLocalizationKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "builderForKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPEscapeOption setTitle:](v14, "setTitle:", v18);

  v19 = objc_alloc_init(CDPEscapeOption);
  -[CDPEscapeOption setTitleLocalizationKey:](v19, "setTitleLocalizationKey:", CFSTR("CUSTODIAN_RECOVERY_OS_PICKER_DEVICE_IOS"));
  v20 = (void *)MEMORY[0x24BE1A458];
  -[CDPEscapeOption titleLocalizationKey](v19, "titleLocalizationKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "builderForKey:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPEscapeOption setTitle:](v19, "setTitle:", v23);

  -[CDPEscapeOption setTitleTelemetryKey:](v19, "setTitleTelemetryKey:", *MEMORY[0x24BE1A910]);
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3221225472;
  v46[2] = __102__CDPUIController_custodianOSSelectionViewControllerWithCustodianController_supportedEscapeOfferMask___block_invoke_393;
  v46[3] = &unk_24C854368;
  v24 = v13;
  v47 = v24;
  -[CDPEscapeOption setEscapeAction:](v19, "setEscapeAction:", v46);
  v25 = objc_alloc_init(CDPEscapeOption);
  -[CDPEscapeOption setTitleLocalizationKey:](v25, "setTitleLocalizationKey:", CFSTR("CUSTODIAN_RECOVERY_OS_PICKER_DEVICE_MAC"));
  v26 = (void *)MEMORY[0x24BE1A458];
  -[CDPEscapeOption titleLocalizationKey](v25, "titleLocalizationKey");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "builderForKey:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPEscapeOption setTitle:](v25, "setTitle:", v29);

  -[CDPEscapeOption setTitleTelemetryKey:](v25, "setTitleTelemetryKey:", *MEMORY[0x24BE1A918]);
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __102__CDPUIController_custodianOSSelectionViewControllerWithCustodianController_supportedEscapeOfferMask___block_invoke_2;
  v44[3] = &unk_24C854368;
  v30 = v24;
  v45 = v30;
  -[CDPEscapeOption setEscapeAction:](v25, "setEscapeAction:", v44);
  v53[0] = v14;
  v53[1] = v19;
  v53[2] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUICustodianOSSelectionViewModel setOptions:](v6, "setOptions:", v31);

  -[CDPUIController _enterCustodianCodeEscapeOfferWithCustodianController:supportedEscapeOfferMask:](self, "_enterCustodianCodeEscapeOfferWithCustodianController:supportedEscapeOfferMask:", v41, a4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("CUSTODIAN_RECOVERY_OS_PICKER_HAVE_RECOVERY_CODE"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "localizedString");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTitle:", v34);

  objc_msgSend(v32, "setTitleTelemetryKey:", *MEMORY[0x24BE1A8F8]);
  -[CDPUIController _custodianResetProtectedDataEscapeOfferWithSupportedEscapeOffers:](self, "_custodianResetProtectedDataEscapeOfferWithSupportedEscapeOffers:", a4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("CUSTODIAN_RECOVERY_OS_PICKER_ESCAPE_TITLE"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "localizedString");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setEscapeOfferName:", v37);

  objc_msgSend(v35, "setTitleTelemetryKey:", *MEMORY[0x24BE1A928]);
  v52[0] = v32;
  v52[1] = v35;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUICustodianOSSelectionViewModel setEscapeOffers:](v6, "setEscapeOffers:", v38);

  v39 = -[CDPUICustodianOSSelectionViewController initWithViewModel:cdpContext:]([CDPUICustodianOSSelectionViewController alloc], "initWithViewModel:cdpContext:", v6, self->_activeContext);
  objc_msgSend(v35, "setPresentingViewController:", v39);

  objc_destroyWeak(v50);
  objc_destroyWeak(&buf);

  return v39;
}

void __102__CDPUIController_custodianOSSelectionViewControllerWithCustodianController_supportedEscapeOfferMask___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_20DC8F000, v6, OS_LOG_TYPE_DEFAULT, "\"Custodian recovery session started with sessionID: %@, error: %@\", (uint8_t *)&v7, 0x16u);
  }

}

void __102__CDPUIController_custodianOSSelectionViewControllerWithCustodianController_supportedEscapeOfferMask___block_invoke_388(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_20DC8F000, v5, OS_LOG_TYPE_DEFAULT, "\"Initializing custodian recovery session with Apple Account\", v7, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_instructionsControllerForPlatform:controller:supportedEscapeOfferMask:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained[4], "pushViewController:animated:", v6, 1);

}

uint64_t __102__CDPUIController_custodianOSSelectionViewControllerWithCustodianController_supportedEscapeOfferMask___block_invoke_393(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __102__CDPUIController_custodianOSSelectionViewControllerWithCustodianController_supportedEscapeOfferMask___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_instructionsControllerForPlatform:(unint64_t)a3 controller:(id)a4 supportedEscapeOfferMask:(unint64_t)a5
{
  id v8;
  CDPUICustodianInstructionsViewModel *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  CDPEscapeOption *v34;
  void *v35;
  void *v36;
  id v37;
  CDPUICustodianInstructionsViewController *v38;
  _QWORD v40[5];
  id v41;
  id v42[2];
  id location;

  v8 = a4;
  v9 = objc_alloc_init(CDPUICustodianInstructionsViewModel);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("CUSTODIAN_INSTRUCTIONS_TITLE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUICustodianInstructionsViewModel setTitle:](v9, "setTitle:", v11);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("CUSTODIAN_INSTRUCTIONS_SUBTITLE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUICustodianInstructionsViewModel setSubtitle:](v9, "setSubtitle:", v13);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", &stru_24C857A78);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUICustodianInstructionsViewModel setFooterText:](v9, "setFooterText:", v15);

  objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "primaryAccountFullName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("CUSTODIAN_INSTRUCTIONS_OS_DETAIL_MAC"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPUICustodianInstructionsViewModel setInstructionHeader:](v9, "setInstructionHeader:", v24);

    v25 = (void *)MEMORY[0x24BDD17C8];
    v21 = CFSTR("CUSTODIAN_INSTRUCTIONS_OS_INSTRUCTION_MAC");
    if ((objc_msgSend(CFSTR("CUSTODIAN_INSTRUCTIONS_OS_INSTRUCTION_MAC"), "containsString:", CFSTR("REBRAND")) & 1) != 0
      || !_os_feature_enabled_impl())
    {
      v26 = 0;
    }
    else
    {
      objc_msgSend(CFSTR("CUSTODIAN_INSTRUCTIONS_OS_INSTRUCTION_MAC"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v26 = 1;
    }
    CDPLocalizedString();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithValidatedFormat:validFormatSpecifiers:error:", v27, CFSTR("%@"), 0, v17);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPUICustodianInstructionsViewModel setInstructions:](v9, "setInstructions:", v28);

    if (v26)
      goto LABEL_9;
  }
  else if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("CUSTODIAN_INSTRUCTIONS_OS_DETAIL_IOS"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPUICustodianInstructionsViewModel setInstructionHeader:](v9, "setInstructionHeader:", v19);

    v20 = (void *)MEMORY[0x24BDD17C8];
    CDPLocalizedString();
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithValidatedFormat:validFormatSpecifiers:error:", v21, CFSTR("%@"), 0, v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPUICustodianInstructionsViewModel setInstructions:](v9, "setInstructions:", v22);

LABEL_9:
  }
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("CUSTODIAN_INSTRUCTIONS_FOOTER"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "localizedString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUICustodianInstructionsViewModel setFooterText:](v9, "setFooterText:", v30);

  -[CDPUIController _custodianResetProtectedDataEscapeOfferWithSupportedEscapeOffers:](self, "_custodianResetProtectedDataEscapeOfferWithSupportedEscapeOffers:", a5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("CUSTODIAN_INSTRUCTIONS_ESCAPE_TITLE"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "localizedString");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setEscapeOfferName:", v33);

  -[CDPUICustodianInstructionsViewModel setEscapeOffer:](v9, "setEscapeOffer:", v31);
  v34 = objc_alloc_init(CDPEscapeOption);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("CUSTODIAN_INSTRUCTIONS_CONTINUE_TITLE"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "localizedString");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPEscapeOption setTitle:](v34, "setTitle:", v36);

  objc_initWeak(&location, self);
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __90__CDPUIController__instructionsControllerForPlatform_controller_supportedEscapeOfferMask___block_invoke;
  v40[3] = &unk_24C854660;
  objc_copyWeak(v42, &location);
  v40[4] = self;
  v37 = v8;
  v41 = v37;
  v42[1] = (id)a5;
  -[CDPEscapeOption setEscapeAction:](v34, "setEscapeAction:", v40);
  -[CDPUICustodianInstructionsViewModel setContinueOption:](v9, "setContinueOption:", v34);
  v38 = -[CDPUICustodianInstructionsViewController initWithViewModel:]([CDPUICustodianInstructionsViewController alloc], "initWithViewModel:", v9);
  objc_msgSend(v31, "setPresentingViewController:", v38);

  objc_destroyWeak(v42);
  objc_destroyWeak(&location);

  return v38;
}

void __90__CDPUIController__instructionsControllerForPlatform_controller_supportedEscapeOfferMask___block_invoke(uint64_t a1)
{
  void *v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_custodianCodeEntryViewControllerWithController:supportedEscapeOfferMask:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained[4], "pushViewController:animated:", v2, 1);

}

- (id)_custodianCodeEntryViewControllerWithController:(id)a3 supportedEscapeOfferMask:(unint64_t)a4
{
  id v6;
  CDPUICodeEntryViewModel *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  CDPUICustodianCodeEntryViewController *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v6 = a3;
  v7 = objc_alloc_init(CDPUICodeEntryViewModel);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("CUSTODIAN_RECOVERY_CODE_PROMPT_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUICodeEntryViewModel setPromptTitle:](v7, "setPromptTitle:", v9);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("CUSTODIAN_RECOVERY_CODE_PROMPT_MESSAGE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUICodeEntryViewModel setPromptMessage:](v7, "setPromptMessage:", v11);

  -[CDPUIController _custodianResetProtectedDataEscapeOfferWithSupportedEscapeOffers:](self, "_custodianResetProtectedDataEscapeOfferWithSupportedEscapeOffers:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("CUSTODIAN_RECOVERY_CODE_PROMPT_ESCAPE_TITLE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitle:", v14);

  objc_msgSend(v12, "setTitleTelemetryKey:", *MEMORY[0x24BE1A900]);
  -[CDPUICodeEntryViewModel setEscapeOffer:](v7, "setEscapeOffer:", v12);
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __92__CDPUIController__custodianCodeEntryViewControllerWithController_supportedEscapeOfferMask___block_invoke;
  v18[3] = &unk_24C8548A8;
  v15 = v6;
  v19 = v15;
  objc_copyWeak(&v20, &location);
  -[CDPUICodeEntryViewModel setCodeEnteredAction:](v7, "setCodeEnteredAction:", v18);
  v16 = -[CDPUICustodianCodeEntryViewController initWithViewModel:cdpContext:]([CDPUICustodianCodeEntryViewController alloc], "initWithViewModel:cdpContext:", v7, self->_activeContext);
  objc_msgSend(v12, "setPresentingViewController:", v16);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&location);
  return v16;
}

uint64_t __92__CDPUIController__custodianCodeEntryViewControllerWithController_supportedEscapeOfferMask___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __92__CDPUIController__custodianCodeEntryViewControllerWithController_supportedEscapeOfferMask___block_invoke_cold_1();

  v5 = dispatch_semaphore_create(0);
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v6 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __92__CDPUIController__custodianCodeEntryViewControllerWithController_supportedEscapeOfferMask___block_invoke_434;
  v10[3] = &unk_24C854880;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v12 = &v14;
  v7 = v5;
  v11 = v7;
  objc_msgSend(v6, "validateRecoveryCode:withCompletion:", v3, v10);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v8 = *((unsigned __int8 *)v15 + 24);

  objc_destroyWeak(&v13);
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __92__CDPUIController__custodianCodeEntryViewControllerWithController_supportedEscapeOfferMask___block_invoke_434(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD block[5];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v6)
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __92__CDPUIController__custodianCodeEntryViewControllerWithController_supportedEscapeOfferMask___block_invoke_434_cold_1();

    if ((objc_msgSend(v6, "aa_isAACustodianRecoveryErrorWithCode:", -9002) & 1) == 0)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __92__CDPUIController__custodianCodeEntryViewControllerWithController_supportedEscapeOfferMask___block_invoke_435;
      block[3] = &unk_24C8541C0;
      block[4] = WeakRetained;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
  }
  else if (v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __92__CDPUIController__custodianCodeEntryViewControllerWithController_supportedEscapeOfferMask___block_invoke_436;
    v9[3] = &unk_24C854520;
    v10 = v5;
    v11 = WeakRetained;
    dispatch_async(MEMORY[0x24BDAC9B8], v9);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __92__CDPUIController__custodianCodeEntryViewControllerWithController_supportedEscapeOfferMask___block_invoke_435(uint64_t a1)
{
  NSObject *v2;

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __92__CDPUIController__custodianCodeEntryViewControllerWithController_supportedEscapeOfferMask___block_invoke_435_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "_presentCustodianAttemptLimitAlert");
}

uint64_t __92__CDPUIController__custodianCodeEntryViewControllerWithController_supportedEscapeOfferMask___block_invoke_436(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_20DC8F000, v2, OS_LOG_TYPE_DEFAULT, "\"Custodian Recovery Code Attempt: Code validation success! Custodian with recoveryInfo: %@\", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_validateCustodianRecoveryInfo:", *(_QWORD *)(a1 + 32));
}

- (void)_validateCustodianRecoveryInfo:(id)a3
{
  id v4;
  CDPRemoteDeviceSecretValidator *remoteSecretValidator;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  remoteSecretValidator = self->_remoteSecretValidator;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__CDPUIController__validateCustodianRecoveryInfo___block_invoke;
  v6[3] = &unk_24C8548D0;
  objc_copyWeak(&v7, &location);
  -[CDPRemoteDeviceSecretValidator validateCustodianRecoveryInfo:withCompletion:](remoteSecretValidator, "validateCustodianRecoveryInfo:withCompletion:", v4, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __50__CDPUIController__validateCustodianRecoveryInfo___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_20DC8F000, v8, OS_LOG_TYPE_DEFAULT, "@\"Custodian recovery info validated, safe to dismiss the view\", v9, 2u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __50__CDPUIController__validateCustodianRecoveryInfo___block_invoke_cold_1();
  }

  objc_msgSend(WeakRetained, "_dismissPresentedViewControllerCompletion:", 0);
}

- (void)_presentCustodianAttemptLimitAlert
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
  _QWORD v14[5];

  v3 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("CUSTODIAN_RECOVERY_MACOS_DEPLETED_ATTEMPTS_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("CUSTODIAN_RECOVERY_MACOS_DEPLETED_ATTEMPTS_MESSAGE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("GENERIC_ERROR_DEFAULT_BUTTON"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __53__CDPUIController__presentCustodianAttemptLimitAlert__block_invoke;
  v14[3] = &unk_24C8548F8;
  v14[4] = self;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 0, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addAction:", v12);
  -[CDPUIBaseController presentingViewController](self, "presentingViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentViewController:animated:completion:", v8, 1, 0);

}

void __53__CDPUIController__presentCustodianAttemptLimitAlert__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5206);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cancelValidationWithError:", v2);

}

- (id)_recoveryKeyEscapeOfferWithSupportedEscapeOfferMask:(unint64_t)a3
{
  CDPRemoteValidationEscapeOffer *v5;
  void *v6;
  void *v7;

  v5 = -[CDPRemoteValidationEscapeOffer initWithCDPContext:]([CDPRemoteValidationEscapeOffer alloc], "initWithCDPContext:", self->_activeContext);
  -[CDPUIController _recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:](self, "_recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStyle:", 4);
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setEscapeOfferName:](v5, "setEscapeOfferName:", v7);

  -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v5, "addEscapeOptionsObject:", v6);
  return v5;
}

- (id)_recoveryMethodEscapeOptionWithSupportedEscapeOfferMask:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[CDPUIController _recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:](self, "_recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStyle:", 4);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_ALERT_USE_RECOVERY_METHOD"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v5);

  objc_msgSend(v3, "setTitleTelemetryKey:", CFSTR("REMOTE_SECRET_ENTRY_ALERT_USE_RECOVERY_METHOD"));
  return v3;
}

- (id)_recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:(unint64_t)a3
{
  void *v5;
  _QWORD v7[5];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__CDPUIController__recoveryKeyEscapeOptionWithSupportedEscapeOfferMask___block_invoke;
  v7[3] = &unk_24C854920;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  -[CDPUIController _recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:presentationBlock:](self, "_recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:presentationBlock:", a3, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v5;
}

void __72__CDPUIController__recoveryKeyEscapeOptionWithSupportedEscapeOfferMask___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id *WeakRetained;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained[4], "pushViewController:animated:", v4, 1);

  if (!WeakRetained[17])
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      __72__CDPUIController__recoveryKeyEscapeOptionWithSupportedEscapeOfferMask___block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "insert:", 32);

}

- (id)_enterCustodianCodeEscapeOfferWithCustodianController:(id)a3 supportedEscapeOfferMask:(unint64_t)a4
{
  id v6;
  CDPRemoteValidationEscapeOffer *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = -[CDPRemoteValidationEscapeOffer initWithCDPContext:]([CDPRemoteValidationEscapeOffer alloc], "initWithCDPContext:", self->_activeContext);
  -[CDPUIController _enterCustodianCodeEscapeOptionWithCustodianController:supportedEscapeOfferMask:](self, "_enterCustodianCodeEscapeOptionWithCustodianController:supportedEscapeOfferMask:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setStyle:", 4);
  objc_msgSend(v8, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setEscapeOfferName:](v7, "setEscapeOfferName:", v9);

  -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v7, "addEscapeOptionsObject:", v8);
  return v7;
}

- (id)_enterCustodianCodeEscapeOptionWithCustodianController:(id)a3 supportedEscapeOfferMask:(unint64_t)a4
{
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __99__CDPUIController__enterCustodianCodeEscapeOptionWithCustodianController_supportedEscapeOfferMask___block_invoke;
  v9[3] = &unk_24C854948;
  objc_copyWeak(&v10, &location);
  -[CDPUIController _enterCustodianCodeEscapeOptionWithCustodianController:supportedEscapeOfferMask:presentationBlock:](self, "_enterCustodianCodeEscapeOptionWithCustodianController:supportedEscapeOfferMask:presentationBlock:", v6, a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

void __99__CDPUIController__enterCustodianCodeEscapeOptionWithCustodianController_supportedEscapeOfferMask___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;

  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained[4], "pushViewController:animated:", v5, 1);

}

- (id)_enterCustodianCodeEscapeOptionWithCustodianController:(id)a3 supportedEscapeOfferMask:(unint64_t)a4 presentationBlock:(id)a5
{
  id v8;
  id v9;
  CDPEscapeOption *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19[2];
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  v10 = objc_alloc_init(CDPEscapeOption);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("CUSTODIAN_RECOVERY_CODE_PROMPT_TITLE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPEscapeOption setTitle:](v10, "setTitle:", v12);

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __117__CDPUIController__enterCustodianCodeEscapeOptionWithCustodianController_supportedEscapeOfferMask_presentationBlock___block_invoke;
  v16[3] = &unk_24C854970;
  objc_copyWeak(v19, &location);
  v13 = v8;
  v17 = v13;
  v19[1] = (id)a4;
  v14 = v9;
  v18 = v14;
  -[CDPEscapeOption setEscapeAction:](v10, "setEscapeAction:", v16);

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  return v10;
}

void __117__CDPUIController__enterCustodianCodeEscapeOptionWithCustodianController_supportedEscapeOfferMask_presentationBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_custodianCodeEntryViewControllerWithController:supportedEscapeOfferMask:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_20DC8F000, v5, OS_LOG_TYPE_DEFAULT, "\"Initializing custodian code entry controller\", v6, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (id)_recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:(unint64_t)a3 presentationBlock:(id)a4
{
  id v6;
  CDPEscapeOption *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14[2];
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  v7 = objc_alloc_init(CDPEscapeOption);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_RK"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPEscapeOption setTitle:](v7, "setTitle:", v9);

  -[CDPEscapeOption setTitleLocalizationKey:](v7, "setTitleLocalizationKey:", CFSTR("REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_RK"));
  -[CDPEscapeOption setTitleTelemetryKey:](v7, "setTitleTelemetryKey:", *MEMORY[0x24BE1A940]);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __90__CDPUIController__recoveryKeyEscapeOptionWithSupportedEscapeOfferMask_presentationBlock___block_invoke;
  v12[3] = &unk_24C854970;
  objc_copyWeak(v14, &location);
  v12[4] = self;
  v14[1] = (id)a3;
  v10 = v6;
  v13 = v10;
  -[CDPEscapeOption setEscapeAction:](v7, "setEscapeAction:", v12);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);

  return v7;
}

void __90__CDPUIController__recoveryKeyEscapeOptionWithSupportedEscapeOfferMask_presentationBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint8_t v6[16];

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_20DC8F000, v2, OS_LOG_TYPE_DEFAULT, "\"User elected to start RK flow, prompting to confirm\", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "sendEscapeOfferSelectedEvent:", *MEMORY[0x24BE1A940]);
    objc_msgSend(*(id *)(a1 + 32), "recoveryKeyEntryControllerForCircleJoinWithCancel:supportedEscapeOfferMask:", 0, *(_QWORD *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (id)_recoveryKeyResetProtectedDataEscapeOfferWithSupportedEscapeOffers:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  CDPLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CDPLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CDPLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIController _skipOrDeleteiCloudDataEscapeOfferWithTitle:message:skipButtonTitle:supportedEscapeOfferMask:](self, "_skipOrDeleteiCloudDataEscapeOfferWithTitle:message:skipButtonTitle:supportedEscapeOfferMask:", v5, v6, v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)recoveryKeyEntryControllerForCircleJoinWithCancel:(BOOL)a3 supportedEscapeOfferMask:(unint64_t)a4
{
  _BOOL4 v5;
  CDPRecoveryKeyEntryViewModel *v7;
  void *v8;
  void *v9;
  CDPRecoveryKeyEntryViewController *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  unint64_t v15;

  v5 = a3;
  v7 = -[CDPRecoveryKeyEntryViewModel initWithContext:validator:]([CDPRecoveryKeyEntryViewModel alloc], "initWithContext:validator:", self->_activeContext, self->_remoteSecretValidator);
  -[CDPRecoveryKeyEntryViewModel setIsWalrusEnabled:](v7, "setIsWalrusEnabled:", self->_isWalrusEnabled);
  if ((a4 & 0x40) != 0)
  {
    -[CDPUIController _beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:](self, "_beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPRecoveryKeyEntryViewModel setCustodianRecoveryEscapeOption:](v7, "setCustodianRecoveryEscapeOption:", v8);

  }
  -[CDPUIController _recoveryKeyResetProtectedDataEscapeOfferWithSupportedEscapeOffers:](self, "_recoveryKeyResetProtectedDataEscapeOfferWithSupportedEscapeOffers:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRecoveryKeyEntryViewModel setDeleteiCloudDataEscapeOffer:](v7, "setDeleteiCloudDataEscapeOffer:", v9);
  -[CDPRecoveryKeyEntryViewModel setShouldSuppressCancelButton:](v7, "setShouldSuppressCancelButton:", !v5);
  v10 = -[CDPRecoveryKeyEntryViewController initWithRecoveryContext:cdpContext:]([CDPRecoveryKeyEntryViewController alloc], "initWithRecoveryContext:cdpContext:", v7, self->_activeContext);
  objc_msgSend(v9, "setPresentingViewController:", v10);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __94__CDPUIController_recoveryKeyEntryControllerForCircleJoinWithCancel_supportedEscapeOfferMask___block_invoke;
  v13[3] = &unk_24C854998;
  v14 = v9;
  v15 = a4;
  v13[4] = self;
  v11 = v9;
  -[CDPRecoveryKeyEntryViewModel setCompletionHandler:](v7, "setCompletionHandler:", v13);

  return v10;
}

void __94__CDPUIController_recoveryKeyEntryControllerForCircleJoinWithCancel_supportedEscapeOfferMask___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  _QWORD block[6];

  v4 = a3;
  if (objc_msgSend(v4, "cdp_isCDPErrorWithCode:", -5218))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __94__CDPUIController_recoveryKeyEntryControllerForCircleJoinWithCancel_supportedEscapeOfferMask___block_invoke_2;
    block[3] = &unk_24C854778;
    v5 = *(_QWORD *)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else if (objc_msgSend(v4, "cdp_isCDPErrorWithCode:", -5215))
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __94__CDPUIController_recoveryKeyEntryControllerForCircleJoinWithCancel_supportedEscapeOfferMask___block_invoke_456;
    v8[3] = &unk_24C854520;
    v6 = *(id *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 32);
    v9 = v6;
    v10 = v7;
    dispatch_async(MEMORY[0x24BDAC9B8], v8);

  }
}

void __94__CDPUIController_recoveryKeyEntryControllerForCircleJoinWithCancel_supportedEscapeOfferMask___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "sendEscapeOfferSelectedEvent:", *MEMORY[0x24BE1A8E8]);
  objc_msgSend(*(id *)(a1 + 32), "_custodianAskHelpViewControllerWithSupportedEscapeOfferMask:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "pushViewController:animated:", v2, 1);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  if (!v3)
  {
    _CDPLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __94__CDPUIController_recoveryKeyEntryControllerForCircleJoinWithCancel_supportedEscapeOfferMask___block_invoke_2_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  }
  objc_msgSend(v3, "insert:", 64);

}

uint64_t __94__CDPUIController_recoveryKeyEntryControllerForCircleJoinWithCancel_supportedEscapeOfferMask___block_invoke_456(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleEscapeAction:", *(_QWORD *)(a1 + 40));
}

- (void)_dismissPresentedViewControllerWithReason:(id)a3 completion:(id)a4
{
  -[CDPUIController _dismissPresentedViewControllerCompletion:](self, "_dismissPresentedViewControllerCompletion:", a4);
}

- (id)_enterSecretLaterEscapeOptionWithSecret:(unint64_t)a3
{
  CDPEscapeOption *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  objc_initWeak(&location, self);
  v4 = objc_alloc_init(CDPEscapeOption);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_LATER"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSecretType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPEscapeOption setTitle:](v4, "setTitle:", v7);

  -[CDPEscapeOption setTitleLocalizationKey:](v4, "setTitleLocalizationKey:", CFSTR("REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_LATER"));
  -[CDPEscapeOption setTitleTelemetryKey:](v4, "setTitleTelemetryKey:", *MEMORY[0x24BE1A8C8]);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __59__CDPUIController__enterSecretLaterEscapeOptionWithSecret___block_invoke;
  v9[3] = &unk_24C8546D8;
  objc_copyWeak(&v10, &location);
  -[CDPEscapeOption setEscapeAction:](v4, "setEscapeAction:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v4;
}

void __59__CDPUIController__enterSecretLaterEscapeOptionWithSecret___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DC8F000, v2, OS_LOG_TYPE_DEFAULT, "\"User elected to skip CDP flow\", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "sendEscapeOfferSelectedEvent:", *MEMORY[0x24BE1A8C8]);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __59__CDPUIController__enterSecretLaterEscapeOptionWithSecret___block_invoke_459;
    v5[3] = &unk_24C8541C0;
    v5[4] = v4;
    objc_msgSend(v4, "_dismissPresentedViewControllerWithReason:completion:", CFSTR("com.apple.CoreCDPUI.CDPEnrollmentCompleted"), v5);
  }

}

void __59__CDPUIController__enterSecretLaterEscapeOptionWithSecret___block_invoke_459(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  _CDPStateError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cancelValidationWithError:", v2);

}

- (id)_waitingForApprovalEscapeOffer
{
  CDPRemoteValidationEscapeOffer *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[CDPRemoteValidationEscapeOffer initWithCDPContext:]([CDPRemoteValidationEscapeOffer alloc], "initWithCDPContext:", self->_activeContext);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("WAITING_APPROVAL_ESCAPE_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIController _localDeviceClass](self, "_localDeviceClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addDeviceClass:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setEscapeOfferName:](v3, "setEscapeOfferName:", v7);

  return v3;
}

- (id)_localDeviceClass
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_singleICSCEscapeOfferWithMask:(unint64_t)a3 withController:(id)a4
{
  id v6;
  CDPRemoteValidationEscapeOffer *v7;
  void *v8;
  void *v9;
  void *v10;
  CDPEscapeOption *v11;
  void *v12;
  void *v13;
  CDPEscapeOption *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id location;

  v6 = a4;
  v7 = -[CDPRemoteValidationEscapeOffer initWithCDPContext:]([CDPRemoteValidationEscapeOffer alloc], "initWithCDPContext:", self->_activeContext);
  CDPLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setEscapeOfferName:](v7, "setEscapeOfferName:", v8);

  CDPLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setTitle:](v7, "setTitle:", v9);

  CDPLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setMessage:](v7, "setMessage:", v10);

  objc_initWeak(&location, self);
  if ((a3 & 4) != 0)
  {
    v11 = objc_alloc_init(CDPEscapeOption);
    CDPLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPEscapeOption setTitle:](v11, "setTitle:", v12);

    -[CDPEscapeOption setTitleTelemetryKey:](v11, "setTitleTelemetryKey:", *MEMORY[0x24BE1A870]);
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __65__CDPUIController__singleICSCEscapeOfferWithMask_withController___block_invoke;
    v24[3] = &unk_24C8546D8;
    objc_copyWeak(&v25, &location);
    -[CDPEscapeOption setEscapeAction:](v11, "setEscapeAction:", v24);
    -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v7, "addEscapeOptionsObject:", v11);
    objc_destroyWeak(&v25);

  }
  if ((a3 & 0x40) != 0)
  {
    -[CDPUIController _beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:](self, "_beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v7, "addEscapeOptionsObject:", v13);

  }
  if ((a3 & 8) != 0)
  {
    v14 = objc_alloc_init(CDPEscapeOption);
    CDPLocalizedString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPEscapeOption setTitle:](v14, "setTitle:", v15);

    -[CDPEscapeOption setTitleTelemetryKey:](v14, "setTitleTelemetryKey:", *MEMORY[0x24BE1A948]);
    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __65__CDPUIController__singleICSCEscapeOfferWithMask_withController___block_invoke_2;
    v21 = &unk_24C854700;
    objc_copyWeak(&v23, &location);
    v22 = v6;
    -[CDPEscapeOption setEscapeAction:](v14, "setEscapeAction:", &v18);
    -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v7, "addEscapeOptionsObject:", v14, v18, v19, v20, v21);

    objc_destroyWeak(&v23);
  }
  +[CDPEscapeOption cancelOption](CDPEscapeOption, "cancelOption");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v7, "addEscapeOptionsObject:", v16);

  objc_destroyWeak(&location);
  return v7;
}

void __65__CDPUIController__singleICSCEscapeOfferWithMask_withController___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_beginWaitingForApprovalFlow");

}

void __65__CDPUIController__singleICSCEscapeOfferWithMask_withController___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_showResetKeychainConfirmationAlertWithViewController:", *(_QWORD *)(a1 + 32));

}

- (id)_escapeOffersForgotAllWithMask:(unint64_t)a3 presenter:(id)a4 devices:(id)a5
{
  void *v8;
  id v9;
  CDPRemoteValidationEscapeOffer *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  CDPRemoteValidationEscapeOffer *v34;
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
  id v45;
  void *v46;
  id v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[4];
  id v52;

  v48 = a4;
  v8 = (void *)MEMORY[0x24BDBCEB8];
  v9 = a5;
  objc_msgSend(v8, "array");
  v49 = objc_claimAutoreleasedReturnValue();
  v10 = -[CDPRemoteValidationEscapeOffer initWithCDPContext:]([CDPRemoteValidationEscapeOffer alloc], "initWithCDPContext:", self->_activeContext);
  v11 = objc_msgSend(v9, "prevailingLocalSecretType");

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("DEVICE_PICKER_FORGOT_CODE_DIALOG_TITLE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSecretType:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedString");
  v50 = objc_claimAutoreleasedReturnValue();

  if (-[CDPContext type](self->_activeContext, "type") == 2)
  {
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_MESSAGE_FORGOT_ALL_RESET"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSecretType:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPUIController _localDeviceClass](self, "_localDeviceClass");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addDeviceClass:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_MESSAGE_FORGOT_ALL"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSecretType:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("WALRUS_DEVICE_PICKER_FORGOT_ALL"), CFSTR("Localizable-Walrus"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSecretType:", v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setEscapeOfferName:](v10, "setEscapeOfferName:", v21);

  v22 = (void *)v50;
  -[CDPRemoteValidationEscapeOffer setTitle:](v10, "setTitle:", v50);
  -[CDPRemoteValidationEscapeOffer setMessage:](v10, "setMessage:", v18);
  if (-[CDPContext keychainSyncSystem](self->_activeContext, "keychainSyncSystem") == 1)
  {
    if ((a3 & 4) == 0 || !self->_offeringRemoteApproval)
    {
      CDPLocalizedString();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDPRemoteValidationEscapeOffer setTitle:](v10, "setTitle:", v38);

      objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_SOS_MULTI_ICSC_ESCAPE_OFFER_MESSAGE"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addSecretType:", v11);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "localizedString");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDPRemoteValidationEscapeOffer setMessage:](v10, "setMessage:", v41);

      +[CDPEscapeOption okOption](CDPEscapeOption, "okOption");
      v26 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_SOS_MULTI_ICSC_ESCAPE_OFFER_MESSAGE_REMOTE_APPROVAL"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSecretType:", v11);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPRemoteValidationEscapeOffer setMessage:](v10, "setMessage:", v25);

LABEL_8:
    +[CDPEscapeOption cancelOption](CDPEscapeOption, "cancelOption");
    v26 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v29 = (void *)v26;
LABEL_21:
    -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v10, "addEscapeOptionsObject:", v29);
    goto LABEL_22;
  }
  if ((a3 & 0x80) != 0)
  {
    -[CDPUIController _beginPiggybackingRecoveryEscapeOptionWithSupportedEscapeOfferMask:](self, "_beginPiggybackingRecoveryEscapeOptionWithSupportedEscapeOfferMask:", a3);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
    v29 = v42;
    objc_msgSend(v42, "setStyle:", 4);
    goto LABEL_21;
  }
  if ((a3 & 0x20) != 0)
  {
    -[CDPUIController _recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:](self, "_recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:", a3);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if ((a3 & 0x40) != 0)
  {
    -[CDPUIController _beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:](self, "_beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:", a3);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if ((a3 & 4) != 0)
  {
    -[CDPUIController _remoteApprovalEscapeOption](self, "_remoteApprovalEscapeOption");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v10, "addEscapeOptionsObject:", v23);
    goto LABEL_8;
  }
  if ((a3 & 0x18) == 0)
  {
    v44 = v48;
    v43 = (void *)v49;
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("DATA_RECOVERY_DEVICE_SELECTION_SKIP_TITLE"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addSecretType:", v11);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("DATA_RECOVERY_DEVICE_SELECTION_SKIP_MESSAGE"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addSecretType:", v11);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "localizedString");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  CDPLocalizedString();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIController _skipOrDeleteiCloudDataEscapeOfferWithTitle:message:skipButtonTitle:supportedEscapeOfferMask:](self, "_skipOrDeleteiCloudDataEscapeOfferWithTitle:message:skipButtonTitle:supportedEscapeOfferMask:", v29, v32, v33, a3);
  v34 = (CDPRemoteValidationEscapeOffer *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("WALRUS_DEVICE_PICKER_FORGOT_ALL"), CFSTR("Localizable-Walrus"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addSecretType:", v11);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "localizedString");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setEscapeOfferName:](v34, "setEscapeOfferName:", v37);

  v22 = (void *)v50;
  v10 = v34;
LABEL_22:
  v44 = v48;
  v43 = (void *)v49;

LABEL_23:
  objc_msgSend(v43, "addObject:", v10);
  v51[0] = MEMORY[0x24BDAC760];
  v51[1] = 3221225472;
  v51[2] = __68__CDPUIController__escapeOffersForgotAllWithMask_presenter_devices___block_invoke;
  v51[3] = &unk_24C8549C0;
  v52 = v44;
  v45 = v44;
  objc_msgSend(v43, "enumerateObjectsUsingBlock:", v51);
  v46 = (void *)objc_msgSend(v43, "copy");

  return v46;
}

uint64_t __68__CDPUIController__escapeOffersForgotAllWithMask_presenter_devices___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPresentingViewController:", *(_QWORD *)(a1 + 32));
}

- (id)_remoteApprovalEscapeOption
{
  CDPEscapeOption *v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v2 = objc_alloc_init(CDPEscapeOption);
  CDPLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPEscapeOption setTitle:](v2, "setTitle:", v3);

  -[CDPEscapeOption setTitleLocalizationKey:](v2, "setTitleLocalizationKey:", CFSTR("DEVICE_PICKER_FORGOT_CODE_DIALOG_USE_OTHER_DEVICE"));
  -[CDPEscapeOption setTitleTelemetryKey:](v2, "setTitleTelemetryKey:", *MEMORY[0x24BE1A870]);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__CDPUIController__remoteApprovalEscapeOption__block_invoke;
  v5[3] = &unk_24C8546D8;
  objc_copyWeak(&v6, &location);
  -[CDPEscapeOption setEscapeAction:](v2, "setEscapeAction:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v2;
}

void __46__CDPUIController__remoteApprovalEscapeOption__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "sendEscapeOfferSelectedEvent:", *MEMORY[0x24BE1A870]);
    objc_msgSend(v2, "approveFromAnotherDevice:", 0);
    WeakRetained = v2;
  }

}

- (void)_setupDevicePickerController:(id)a3
{
  void *v4;
  uint64_t v5;
  CDPDevicePickerViewController *v6;
  CDPDevicePickerViewController *devicePicker;
  void *v8;
  void (**v9)(id, CDPDevicePickerViewController *);

  v9 = (void (**)(id, CDPDevicePickerViewController *))a3;
  objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithContext:eventName:category:", self->_activeContext, *MEMORY[0x24BE1A630], *MEMORY[0x24BE1A860]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRPDLedger insert:](self->_ledger, "insert:", 2);
  if (self->_isWalrusEnabled)
    v5 = 2;
  else
    v5 = 1;
  v6 = -[CDPDevicePickerViewController initWithDevices:delegate:tableViewStyle:]([CDPDevicePickerViewController alloc], "initWithDevices:delegate:tableViewStyle:", self->_devices, self, v5);
  devicePicker = self->_devicePicker;
  self->_devicePicker = v6;

  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendEvent:", v4);

  if (v9)
    v9[2](v9, self->_devicePicker);

}

- (void)_showResetKeychainConfirmationAlertWithViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  CDPUIController *v21;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BEBD3A8];
  CDPLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionWithTitle:style:handler:", v6, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BEBD3A8];
  CDPLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __73__CDPUIController__showResetKeychainConfirmationAlertWithViewController___block_invoke;
  v19 = &unk_24C8549E8;
  v20 = v4;
  v21 = self;
  v10 = v4;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BEBD3B0];
  CDPLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  CDPLocalizedString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "alertControllerWithTitle:message:preferredStyle:", v13, v14, 1, v16, v17, v18, v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addAction:", v7);
  objc_msgSend(v15, "addAction:", v11);
  -[UINavigationController presentViewController:animated:completion:](self->_navController, "presentViewController:animated:completion:", v15, 1, 0);

}

uint64_t __73__CDPUIController__showResetKeychainConfirmationAlertWithViewController___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v14[16];

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_20DC8F000, v2, OS_LOG_TYPE_DEFAULT, "\"User request keychain reset during iCSC entry challenge\", v14, 2u);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "disableUserInteractionAndStartSpinner");
  objc_msgSend(*(id *)(a1 + 40), "_dismissPresentedViewControllerWithReason:completion:", CFSTR("com.apple.CoreCDPUI.CDPEnrollmentCompleted"), 0);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(v3 + 136);
  if (!v4)
  {
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __73__CDPUIController__showResetKeychainConfirmationAlertWithViewController___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);

    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(v3 + 136);
  }
  return objc_msgSend(*(id *)(v3 + 24), "resetAccountCDPStateWithEscapeOptionsOffered:", objc_msgSend(v4, "escapeOffersPresented"));
}

- (void)_showTryAgainLaterConfirmationAlertWithViewController:(id)a3
{
  id v4;
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
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x24BEBD3A8];
  CDPLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionWithTitle:style:handler:", v6, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BEBD3A8];
  CDPLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __73__CDPUIController__showTryAgainLaterConfirmationAlertWithViewController___block_invoke;
  v18 = &unk_24C854A10;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BEBD3B0];
  CDPLocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CDPLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "alertControllerWithTitle:message:preferredStyle:", v12, v13, 1, v15, v16, v17, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addAction:", v10);
  objc_msgSend(v14, "addAction:", v7);
  -[UINavigationController presentViewController:animated:completion:](self->_navController, "presentViewController:animated:completion:", v14, 1, 0);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __73__CDPUIController__showTryAgainLaterConfirmationAlertWithViewController___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  _QWORD v5[5];

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __73__CDPUIController__showTryAgainLaterConfirmationAlertWithViewController___block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "sendEscapeOfferSelectedEvent:", *MEMORY[0x24BE1A978]);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __73__CDPUIController__showTryAgainLaterConfirmationAlertWithViewController___block_invoke_499;
    v5[3] = &unk_24C8541C0;
    v5[4] = v4;
    objc_msgSend(v4, "_dismissPresentedViewControllerWithReason:completion:", CFSTR("com.apple.CoreCDPUI.CDPEnrollmentCompleted"), v5);
  }

}

void __73__CDPUIController__showTryAgainLaterConfirmationAlertWithViewController___block_invoke_499(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  _CDPStateError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cancelValidationWithError:", v2);

}

- (void)keychainSyncController:(id)a3 didFinishWithResult:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  CDPRemoteDeviceSecretValidator *remoteSecretValidator;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[5];
  uint8_t buf[16];
  _QWORD v16[4];
  id v17;
  CDPUIController *v18;

  v7 = a3;
  v8 = a4;
  v9 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("securityCode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "disableUserInteractionAndStartSpinner");
    remoteSecretValidator = self->_remoteSecretValidator;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __68__CDPUIController_keychainSyncController_didFinishWithResult_error___block_invoke;
    v16[3] = &unk_24C854A60;
    v17 = v9;
    v18 = self;
    -[CDPRemoteDeviceSecretValidator validateSecret:devices:type:withCompletion:](remoteSecretValidator, "validateSecret:devices:type:withCompletion:", v10, 0, 0, v16);

  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("resetKeychain")))
  {
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DC8F000, v12, OS_LOG_TYPE_DEFAULT, "\"User request keychain reset during iCSC entry challenge\", buf, 2u);
    }

    -[CDPUIController _dismissPresentedViewControllerCompletion:](self, "_dismissPresentedViewControllerCompletion:", 0);
    -[CDPRemoteDeviceSecretValidator resetAccountCDPStateWithEscapeOptionsOffered:](self->_remoteSecretValidator, "resetAccountCDPStateWithEscapeOptionsOffered:", -[CDPRPDLedger escapeOffersPresented](self->_ledger, "escapeOffersPresented"));
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("approveFromOtherDevice")))
  {
    _CDPLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[CDPUIController keychainSyncController:didFinishWithResult:error:].cold.1();

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __68__CDPUIController_keychainSyncController_didFinishWithResult_error___block_invoke_514;
    block[3] = &unk_24C8541C0;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

void __68__CDPUIController_keychainSyncController_didFinishWithResult_error___block_invoke(uint64_t a1, int a2, char a3)
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  char v19;

  objc_msgSend(*(id *)(a1 + 32), "enableUserInteractionAndStopSpinner");
  if (a2)
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __68__CDPUIController_keychainSyncController_didFinishWithResult_error___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 40), "_dismissPresentedViewControllerCompletion:", 0);
  }
  else
  {
    v7 = (void *)MEMORY[0x24BEBD3B0];
    CDPLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CDPLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v8, v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x24BEBD3A8];
    CDPLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __68__CDPUIController_keychainSyncController_didFinishWithResult_error___block_invoke_512;
    v16[3] = &unk_24C854A38;
    v19 = a3;
    v13 = *(id *)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 40);
    v17 = v13;
    v18 = v14;
    objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v15);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "presentViewController:animated:completion:", v10, 1, 0);
  }
}

uint64_t __68__CDPUIController_keychainSyncController_didFinishWithResult_error___block_invoke_512(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 32), "setTextEntryText:", &stru_24C857A78);
  else
    return objc_msgSend(*(id *)(a1 + 40), "_dismissPresentedViewControllerCompletion:", 0);
}

uint64_t __68__CDPUIController_keychainSyncController_didFinishWithResult_error___block_invoke_514(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginWaitingForApprovalFlow");
}

- (void)_beginWaitingForApprovalFlow
{
  CDPWaitingApprovalViewController *v3;
  void *v4;
  CDPWaitingApprovalViewController *v5;
  CDPRemoteDeviceSecretValidator *remoteSecretValidator;
  CDPWaitingApprovalViewController *v7;
  _QWORD v8[5];
  CDPWaitingApprovalViewController *v9;

  v3 = [CDPWaitingApprovalViewController alloc];
  -[CDPUIController _escapeOfferForSingleApprovalWithMask:](self, "_escapeOfferForSingleApprovalWithMask:", -[CDPRemoteDeviceSecretValidator supportedEscapeOfferMask](self->_remoteSecretValidator, "supportedEscapeOfferMask"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CDPWaitingApprovalViewController initWithEscapeOffer:](v3, "initWithEscapeOffer:", v4);

  -[UINavigationController pushViewController:animated:](self->_navController, "pushViewController:animated:", v5, 1);
  -[CDPUIController sendRemoteApprovalStartedBreadCrumbEventWithContext:](self, "sendRemoteApprovalStartedBreadCrumbEventWithContext:", self->_activeContext);
  remoteSecretValidator = self->_remoteSecretValidator;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__CDPUIController__beginWaitingForApprovalFlow__block_invoke;
  v8[3] = &unk_24C8545E8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[CDPRemoteDeviceSecretValidator approveFromAnotherDeviceWithCompletion:](remoteSecretValidator, "approveFromAnotherDeviceWithCompletion:", v8);

}

uint64_t __47__CDPUIController__beginWaitingForApprovalFlow__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t result;

  v3 = a2;
  result = objc_msgSend(*(id *)(a1 + 32), "sendRemoteApprovalCompletedEventWithContext:didApprove:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), a2, a3);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "remoteApprovalSucceeded");
    return objc_msgSend(*(id *)(a1 + 32), "_dismissPresentedViewControllerCompletion:", 0);
  }
  return result;
}

- (void)cdpContext:(id)a3 createLocalSecretWithCompletion:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  CDPUIDeviceToDeviceEncryptionFlowContext *v9;
  void *v10;
  void *v11;
  CDPUIDeviceToDeviceEncryptionFlowContext *v12;
  CDPUIDeviceToDeviceEncryptionHelper *v13;
  id v14;

  v14 = a4;
  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasLocalSecret");

  if (!v6)
  {
    -[CDPUIController _noRecoveryFactorsBaseController](self, "_noRecoveryFactorsBaseController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [CDPUIDeviceToDeviceEncryptionFlowContext alloc];
    objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "primaryAccountAltDSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CDPUIDeviceToDeviceEncryptionFlowContext initWithAltDSID:](v9, "initWithAltDSID:", v11);

    -[CDPUIDeviceToDeviceEncryptionFlowContext setPresentingViewController:](v12, "setPresentingViewController:", v8);
    -[CDPUIDeviceToDeviceEncryptionFlowContext setForceInlinePresentation:](v12, "setForceInlinePresentation:", 1);
    -[CDPUIDeviceToDeviceEncryptionFlowContext setShouldSuppressPasscodeCreationCancelPrompt:](v12, "setShouldSuppressPasscodeCreationCancelPrompt:", 1);
    v13 = -[CDPUIDeviceToDeviceEncryptionHelper initWithContext:]([CDPUIDeviceToDeviceEncryptionHelper alloc], "initWithContext:", v12);
    -[CDPUIDeviceToDeviceEncryptionHelper _configureNavigationController](v13, "_configureNavigationController");
    -[CDPUIDeviceToDeviceEncryptionHelper _createLocalSecretForContext:completion:](v13, "_createLocalSecretForContext:completion:", v12, v14);

    goto LABEL_5;
  }
  v7 = v14;
  if (v14)
  {
    _CDPStateError();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v14 + 2))(v14, 0, v8);
LABEL_5:

    v7 = v14;
  }

}

- (id)_noRecoveryFactorsBaseController
{
  UINavigationController *navController;
  UINavigationController *v3;
  UIViewController **p_presentingViewController;
  id WeakRetained;
  void *v6;
  UINavigationController *v7;
  uint64_t v8;

  navController = self->_navController;
  if (navController)
  {
    v3 = navController;
  }
  else
  {
    p_presentingViewController = &self->super._presentingViewController;
    WeakRetained = objc_loadWeakRetained((id *)&self->super._presentingViewController);
    objc_msgSend(WeakRetained, "presentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UINavigationController *)objc_loadWeakRetained((id *)p_presentingViewController);
    v3 = v7;
    if (v6)
    {
      -[UINavigationController presentedViewController](v7, "presentedViewController");
      v8 = objc_claimAutoreleasedReturnValue();

      v3 = (UINavigationController *)v8;
    }

  }
  return v3;
}

- (id)_skipOrDeleteiCloudDataEscapeOfferWithTitle:(id)a3 message:(id)a4 skipButtonTitle:(id)a5 supportedEscapeOfferMask:(unint64_t)a6
{
  char v6;
  id v10;
  id v11;
  id v12;
  CDPRemoteValidationEscapeOffer *v13;
  CDPEscapeOption *v14;
  CDPQuotaStorageAppListRequest *v15;
  void *v16;
  void *v17;
  CDPQuotaStorageAppListRequest *v18;
  _BOOL4 v19;
  CDPEscapeOption *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  id v35;
  _QWORD v36[4];
  CDPQuotaStorageAppListRequest *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id location;
  char v42[16];
  uint64_t v43;

  v6 = a6;
  v43 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = -[CDPRemoteValidationEscapeOffer initWithCDPContext:]([CDPRemoteValidationEscapeOffer alloc], "initWithCDPContext:", self->_activeContext);
  -[CDPRemoteValidationEscapeOffer setTitle:](v13, "setTitle:", v10);
  -[CDPRemoteValidationEscapeOffer setMessage:](v13, "setMessage:", v11);
  objc_initWeak(&location, self);
  v14 = objc_alloc_init(CDPEscapeOption);
  -[CDPEscapeOption setTitle:](v14, "setTitle:", v12);
  -[CDPEscapeOption setTitleTelemetryKey:](v14, "setTitleTelemetryKey:", *MEMORY[0x24BE1A978]);
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke;
  v39[3] = &unk_24C8546D8;
  objc_copyWeak(&v40, &location);
  -[CDPEscapeOption setEscapeAction:](v14, "setEscapeAction:", v39);
  -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v13, "addEscapeOptionsObject:", v14);
  if ((v6 & 8) != 0)
  {
    v15 = [CDPQuotaStorageAppListRequest alloc];
    objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "primaryAppleAccount");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[CDPQuotaStorageAppListRequest initWithAccount:isWalrusEnabled:](v15, "initWithAccount:isWalrusEnabled:", v17, self->_isWalrusEnabled);

    v19 = -[CDPQuotaStorageAppListRequest isUrlAvailable](v18, "isUrlAvailable");
    v20 = objc_alloc_init(CDPEscapeOption);
    if (v19)
    {
      _CDPLogSystem();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        -[CDPQuotaStorageAppListRequest urlString](v18, "urlString");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[CDPUIController _skipOrDeleteiCloudDataEscapeOfferWithTitle:message:skipButtonTitle:supportedEscapeOfferMask:].cold.1(v22, (uint64_t)v42, v21);
      }

      objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("WALRUS_ALERT_BUTTON_TITLE_MORE_INFORMATION"), CFSTR("Localizable-Walrus"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDPEscapeOption setTitle:](v20, "setTitle:", v24);

      -[CDPEscapeOption setStyle:](v20, "setStyle:", 0);
      -[CDPEscapeOption setTitleTelemetryKey:](v20, "setTitleTelemetryKey:", *MEMORY[0x24BE1A950]);
      v36[0] = MEMORY[0x24BDAC760];
      v36[1] = 3221225472;
      v36[2] = __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_521;
      v36[3] = &unk_24C854700;
      v25 = &v38;
      objc_copyWeak(&v38, &location);
      v37 = v18;
      -[CDPEscapeOption setEscapeAction:](v20, "setEscapeAction:", v36);

    }
    else
    {
      _CDPLogSystem();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[CDPUIController _skipOrDeleteiCloudDataEscapeOfferWithTitle:message:skipButtonTitle:supportedEscapeOfferMask:].cold.2();

      objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("WALRUS_ALERT_BUTTON_TITLE_DELETE_ICLOUD_DATA"), CFSTR("Localizable-Walrus"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDPEscapeOption setTitle:](v20, "setTitle:", v28);

      -[CDPEscapeOption setStyle:](v20, "setStyle:", 2);
      -[CDPEscapeOption setTitleTelemetryKey:](v20, "setTitleTelemetryKey:", *MEMORY[0x24BE1A948]);
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_522;
      v34[3] = &unk_24C854700;
      v25 = &v35;
      objc_copyWeak(&v35, &location);
      v34[4] = self;
      -[CDPEscapeOption setEscapeAction:](v20, "setEscapeAction:", v34);
    }
    objc_destroyWeak(v25);
    if (objc_msgSend(MEMORY[0x24BE1A4A0], "shouldCentralizeRPDFlow"))
    {
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_530;
      v33[3] = &unk_24C854A88;
      v33[4] = self;
      -[CDPEscapeOption setCanShowEscapeOption:](v20, "setCanShowEscapeOption:", v33);
    }
    else if (self->_isWalrusEnabled)
    {
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_532;
      v32[3] = &unk_24C854A88;
      v32[4] = self;
      -[CDPEscapeOption setCanShowEscapeOption:](v20, "setCanShowEscapeOption:", v32);
    }
    -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v13, "addEscapeOptionsObject:", v20);

  }
  +[CDPEscapeOption cancelOption](CDPEscapeOption, "cancelOption");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v13, "addEscapeOptionsObject:", v29);

  -[UINavigationController topViewController](self->_navController, "topViewController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setPresentingViewController:](v13, "setPresentingViewController:", v30);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);

  return v13;
}

void __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  _QWORD v5[5];

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __73__CDPUIController__showTryAgainLaterConfirmationAlertWithViewController___block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "sendEscapeOfferSelectedEvent:", *MEMORY[0x24BE1A978]);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_517;
    v5[3] = &unk_24C8541C0;
    v5[4] = v4;
    objc_msgSend(v4, "_dismissPresentedViewControllerWithReason:completion:", CFSTR("com.apple.CoreCDPUI.CDPEnrollmentCompleted"), v5);
  }

}

void __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_517(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  _CDPStateError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cancelValidationWithError:", v2);

}

void __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_521(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_521_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "sendEscapeOfferSelectedEvent:", *MEMORY[0x24BE1A948]);
  objc_msgSend(WeakRetained, "_showQuotaStorageAppListView:", *(_QWORD *)(a1 + 32));

}

void __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_522(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_522_cold_1();

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("WALRUS_STORAGE_LIST_UNAVAILABLE_CONFIRMATION_ALERT_TITLE"), CFSTR("Localizable-Walrus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, 0, (v8 & 0xFFFFFFFFFFFFFFFBLL) == 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("WALRUS_STORAGE_LIST_UNAVAILABLE_CONFIRMATION_DELETE_BUTTON_TITLE"), CFSTR("Localizable-Walrus"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_527;
  v21[3] = &unk_24C854A10;
  objc_copyWeak(&v22, (id *)(a1 + 40));
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 2, v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v9, "addAction:", v13);
  objc_msgSend(v14, "addObject:", *MEMORY[0x24BE1A948]);
  v15 = (void *)MEMORY[0x24BEBD3A8];
  CDPLocalizedString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 1, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v17);

  objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithContext:eventName:category:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), *MEMORY[0x24BE1A650], *MEMORY[0x24BE1A860]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", *MEMORY[0x24BE1A888]);
  objc_msgSend(v14, "aaf_arrayAsCommaSeperatedString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE1A648]);

  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sendEvent:", v18);

  objc_msgSend(WeakRetained[4], "presentViewController:animated:completion:", v9, 1, 0);
  objc_destroyWeak(&v22);

}

void __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_527(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_527_cold_1();

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sendEscapeOfferSelectedEvent:", *MEMORY[0x24BE1A948]);
  objc_msgSend(WeakRetained[3], "resetAccountCDPStateWithEscapeOptionsOffered:", objc_msgSend(WeakRetained[17], "escapeOffersPresented"));

}

uint64_t __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_530(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  if (!v2)
  {
    _CDPLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_530_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  }
  v11 = objc_msgSend(v2, "canOfferRPD");
  if ((v11 & 1) == 0)
  {
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "rpdBlockingError");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v13;
      _os_log_impl(&dword_20DC8F000, v12, OS_LOG_TYPE_DEFAULT, "\"Cannot offer RPD. Reason: %@\", (uint8_t *)&v15, 0xCu);

    }
  }
  return v11;
}

uint64_t __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_532(uint64_t a1)
{
  double *v2;
  double v3;
  void *v4;
  uint64_t v5;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"))
    v2 = (double *)MEMORY[0x24BE1A9B8];
  else
    v2 = (double *)(*(_QWORD *)(a1 + 32) + 72);
  v3 = *v2;
  objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rpdProbationIsInEffectForDuration:context:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), v3);

  return v5;
}

- (void)_rpdEscapeOptionWithOffer:(id)a3
{
  id v4;
  CDPQuotaStorageAppListRequest *v5;
  void *v6;
  void *v7;
  CDPQuotaStorageAppListRequest *v8;
  CDPEscapeOption *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  CDPQuotaStorageAppListRequest *v28;
  id v29;
  id location;
  char v31[24];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = [CDPQuotaStorageAppListRequest alloc];
  objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryAppleAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CDPQuotaStorageAppListRequest initWithAccount:isWalrusEnabled:](v5, "initWithAccount:isWalrusEnabled:", v7, self->_isWalrusEnabled);

  LODWORD(v7) = -[CDPQuotaStorageAppListRequest isUrlAvailable](v8, "isUrlAvailable");
  v9 = objc_alloc_init(CDPEscapeOption);
  if ((_DWORD)v7)
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[CDPQuotaStorageAppListRequest urlString](v8, "urlString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDPUIController _skipOrDeleteiCloudDataEscapeOfferWithTitle:message:skipButtonTitle:supportedEscapeOfferMask:].cold.1(v11, (uint64_t)v31, v10);
    }

    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_ALERT_MORE_OPTIONS"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPEscapeOption setTitle:](v9, "setTitle:", v13);

    -[CDPEscapeOption setStyle:](v9, "setStyle:", 0);
    -[CDPEscapeOption setTitleTelemetryKey:](v9, "setTitleTelemetryKey:", *MEMORY[0x24BE1A950]);
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke;
    v27[3] = &unk_24C854700;
    v14 = &v29;
    objc_copyWeak(&v29, &location);
    v28 = v8;
    -[CDPEscapeOption setEscapeAction:](v9, "setEscapeAction:", v27);

  }
  else
  {
    _CDPLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[CDPUIController _skipOrDeleteiCloudDataEscapeOfferWithTitle:message:skipButtonTitle:supportedEscapeOfferMask:].cold.2();

    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_ALERT_MORE_OPTIONS"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPEscapeOption setTitle:](v9, "setTitle:", v17);

    -[CDPEscapeOption setStyle:](v9, "setStyle:", 0);
    -[CDPEscapeOption setTitleTelemetryKey:](v9, "setTitleTelemetryKey:", *MEMORY[0x24BE1A948]);
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke_535;
    v25[3] = &unk_24C8546D8;
    v14 = &v26;
    objc_copyWeak(&v26, &location);
    -[CDPEscapeOption setEscapeAction:](v9, "setEscapeAction:", v25);
  }
  objc_destroyWeak(v14);
  +[CDPEscapeOption cancelOption](CDPEscapeOption, "cancelOption");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setStyle:", 0);
  if (objc_msgSend(MEMORY[0x24BE1A4A0], "shouldCentralizeRPDFlow"))
  {
    v19 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke_537;
    v24[3] = &unk_24C854A88;
    v24[4] = self;
    -[CDPEscapeOption setCanShowEscapeOption:](v9, "setCanShowEscapeOption:", v24);
    v23[0] = v19;
    v23[1] = 3221225472;
    v23[2] = __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke_538;
    v23[3] = &unk_24C854A88;
    v23[4] = self;
    objc_msgSend(v18, "setCanShowEscapeOption:", v23);
  }
  else if (self->_isWalrusEnabled)
  {
    v20 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke_539;
    v22[3] = &unk_24C854A88;
    v22[4] = self;
    -[CDPEscapeOption setCanShowEscapeOption:](v9, "setCanShowEscapeOption:", v22);
    v21[0] = v20;
    v21[1] = 3221225472;
    v21[2] = __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke_2;
    v21[3] = &unk_24C854A88;
    v21[4] = self;
    objc_msgSend(v18, "setCanShowEscapeOption:", v21);
  }
  objc_msgSend(v4, "addEscapeOptionsObject:", v9);
  objc_msgSend(v4, "addEscapeOptionsObject:", v18);

  objc_destroyWeak(&location);
}

void __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_521_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "sendEscapeOfferSelectedEvent:", *MEMORY[0x24BE1A948]);
  objc_msgSend(WeakRetained, "_showQuotaStorageAppListView:", *(_QWORD *)(a1 + 32));

}

void __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke_535(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_522_cold_1();

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("WALRUS_STORAGE_LIST_UNAVAILABLE_CONFIRMATION_ALERT_TITLE"), CFSTR("Localizable-Walrus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v7, 0, (v9 & 0xFFFFFFFFFFFFFFFBLL) == 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("WALRUS_STORAGE_LIST_UNAVAILABLE_CONFIRMATION_DELETE_BUTTON_TITLE"), CFSTR("Localizable-Walrus"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke_536;
  v22[3] = &unk_24C854A10;
  objc_copyWeak(&v23, v3);
  objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 2, v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v10, "addAction:", v14);
  objc_msgSend(v15, "addObject:", *MEMORY[0x24BE1A948]);
  v16 = (void *)MEMORY[0x24BEBD3A8];
  CDPLocalizedString();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 1, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v18);

  objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithContext:eventName:category:", *((_QWORD *)WeakRetained + 7), *MEMORY[0x24BE1A650], *MEMORY[0x24BE1A860]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", *MEMORY[0x24BE1A888]);
  objc_msgSend(v15, "aaf_arrayAsCommaSeperatedString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, *MEMORY[0x24BE1A648]);

  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sendEvent:", v19);

  objc_msgSend(*((id *)WeakRetained + 4), "presentViewController:animated:completion:", v10, 1, 0);
  objc_destroyWeak(&v23);

}

void __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke_536(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_527_cold_1();

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sendEscapeOfferSelectedEvent:", *MEMORY[0x24BE1A948]);
  objc_msgSend(WeakRetained[3], "resetAccountCDPStateWithEscapeOptionsOffered:", objc_msgSend(WeakRetained[17], "escapeOffersPresented"));

}

uint64_t __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke_537(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  if (!v2)
  {
    _CDPLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke_537_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  }
  v11 = objc_msgSend(v2, "canOfferRPD");
  if ((v11 & 1) == 0)
  {
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "rpdBlockingError");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v13;
      _os_log_impl(&dword_20DC8F000, v12, OS_LOG_TYPE_DEFAULT, "\"Cannot offer RPD. Reason: %@\", (uint8_t *)&v15, 0xCu);

    }
  }
  return v11;
}

uint64_t __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke_538(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  if (!v2)
  {
    _CDPLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke_537_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  }
  v11 = objc_msgSend(v2, "canOfferRPD");
  if ((v11 & 1) == 0)
  {
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "rpdBlockingError");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v13;
      _os_log_impl(&dword_20DC8F000, v12, OS_LOG_TYPE_DEFAULT, "\"Cannot offer RPD. Reason: %@\", (uint8_t *)&v15, 0xCu);

    }
  }
  return v11;
}

uint64_t __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke_539(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rpdProbationIsInEffectForDuration:context:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), *(double *)(*(_QWORD *)(a1 + 32) + 72));

  return v3;
}

uint64_t __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rpdProbationIsInEffectForDuration:context:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), *(double *)(*(_QWORD *)(a1 + 32) + 72));

  return v3;
}

- (id)_iCSCSkipOrDeleteiCloudDataEscapeOfferWithTitle:(id)a3 message:(id)a4 skipButtonTitle:(id)a5 supportedEscapeOfferMask:(unint64_t)a6 withDevice:(id)a7
{
  char v8;
  id v12;
  id v13;
  id v14;
  id v15;
  CDPRemoteValidationEscapeOffer *v16;
  CDPEscapeOption *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id location;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = -[CDPRemoteValidationEscapeOffer initWithCDPContext:]([CDPRemoteValidationEscapeOffer alloc], "initWithCDPContext:", self->_activeContext);
  -[CDPRemoteValidationEscapeOffer setTitle:](v16, "setTitle:", v12);
  -[CDPRemoteValidationEscapeOffer setMessage:](v16, "setMessage:", v13);
  objc_initWeak(&location, self);
  if (objc_msgSend(v14, "length"))
  {
    v17 = objc_alloc_init(CDPEscapeOption);
    -[CDPEscapeOption setTitle:](v17, "setTitle:", v14);
    -[CDPEscapeOption setTitleTelemetryKey:](v17, "setTitleTelemetryKey:", *MEMORY[0x24BE1A978]);
    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = __127__CDPUIController__iCSCSkipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask_withDevice___block_invoke;
    v23 = &unk_24C8546D8;
    objc_copyWeak(&v24, &location);
    -[CDPEscapeOption setEscapeAction:](v17, "setEscapeAction:", &v20);
    -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v16, "addEscapeOptionsObject:", v17, v20, v21, v22, v23);
    objc_destroyWeak(&v24);

  }
  if ((v8 & 8) != 0)
    -[CDPUIController _rpdEscapeOptionWithOffer:](self, "_rpdEscapeOptionWithOffer:", v16);
  -[UINavigationController topViewController](self->_navController, "topViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setPresentingViewController:](v16, "setPresentingViewController:", v18);

  objc_destroyWeak(&location);
  return v16;
}

void __127__CDPUIController__iCSCSkipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask_withDevice___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  _QWORD v5[4];
  id v6;

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __73__CDPUIController__showTryAgainLaterConfirmationAlertWithViewController___block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sendEscapeOfferSelectedEvent:", *MEMORY[0x24BE1A978]);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __127__CDPUIController__iCSCSkipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask_withDevice___block_invoke_540;
  v5[3] = &unk_24C8541C0;
  v6 = WeakRetained;
  v4 = WeakRetained;
  objc_msgSend(v4, "_dismissPresentedViewControllerWithReason:completion:", CFSTR("com.apple.CoreCDPUI.CDPEnrollmentCompleted"), v5);

}

void __127__CDPUIController__iCSCSkipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask_withDevice___block_invoke_540(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  _CDPStateError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cancelValidationWithError:", v2);

}

- (void)cdpContext:(id)a3 showResetCompletedAlertWithCompletion:(id)a4
{
  void *v5;
  UINavigationController *navController;
  NSObject *v7;
  _BOOL4 v8;
  UINavigationController *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  -[CDPUIController _iCloudDeleteConfirmationViewController:](self, "_iCloudDeleteConfirmationViewController:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIController _setResetCompletedView:](self, "_setResetCompletedView:", v5);
  -[CDPUIController _enableUserInteractionAndStopSpinner](self, "_enableUserInteractionAndStopSpinner");
  navController = self->_navController;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (navController)
  {
    if (v8)
      -[CDPUIController cdpContext:showResetCompletedAlertWithCompletion:].cold.2();

    v9 = self->_navController;
    v11[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController setViewControllers:animated:](v9, "setViewControllers:animated:", v10, 1);
  }
  else
  {
    if (v8)
      -[CDPUIController cdpContext:showResetCompletedAlertWithCompletion:].cold.1();

    -[CDPUIController _noRecoveryFactorsBaseController](self, "_noRecoveryFactorsBaseController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presentViewController:animated:completion:", v5, 1, 0);
  }

}

- (void)_setResetCompletedView:(id)a3
{
  objc_storeStrong((id *)&self->_resetCompletedView, a3);
}

- (void)_showQuotaStorageAppListView:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __48__CDPUIController__showQuotaStorageAppListView___block_invoke;
  v3[3] = &unk_24C854AB0;
  v3[4] = self;
  -[CDPUIController _showQuotaStorageAppListView:andCompletion:](self, "_showQuotaStorageAppListView:andCompletion:", a3, v3);
}

void __48__CDPUIController__showQuotaStorageAppListView___block_invoke(uint64_t a1, int a2, void *a3)
{
  id *v5;
  id v6;

  v6 = a3;
  v5 = *(id **)(a1 + 32);
  if (a2)
    objc_msgSend(v5[3], "resetAccountCDPStateWithEscapeOptionsOffered:andSetSecret:", objc_msgSend(v5[17], "escapeOffersPresented"), v6);
  else
    objc_msgSend(v5, "cancelTapped:", *(_QWORD *)(a1 + 32));

}

- (void)_showQuotaStorageAppListView:(id)a3 andCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  RemoteUIController *v10;
  RemoteUIController *storageAppListRemoteUIController;
  RemoteUIController *v12;
  void *v13;
  RemoteUIController *v14;
  uint64_t v15;
  id v16;
  id v17;
  RemoteUIController *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "urlRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[CDPUIController _showQuotaStorageAppListView:andCompletion:].cold.1(v8, v9);

  v10 = (RemoteUIController *)objc_alloc_init(MEMORY[0x24BE7EE20]);
  storageAppListRemoteUIController = self->_storageAppListRemoteUIController;
  self->_storageAppListRemoteUIController = v10;

  -[RemoteUIController setDelegate:](self->_storageAppListRemoteUIController, "setDelegate:", self);
  v12 = self->_storageAppListRemoteUIController;
  -[CDPUIController _noRecoveryFactorsBaseController](self, "_noRecoveryFactorsBaseController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RemoteUIController setHostViewController:](v12, "setHostViewController:", v13);

  objc_initWeak(&location, self);
  v14 = self->_storageAppListRemoteUIController;
  v15 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __62__CDPUIController__showQuotaStorageAppListView_andCompletion___block_invoke_551;
  v21[3] = &unk_24C854B18;
  objc_copyWeak(&v23, &location);
  v16 = v7;
  v22 = v16;
  v17 = (id)-[RemoteUIController setHandlerForElementsMatching:handler:](v14, "setHandlerForElementsMatching:handler:", &__block_literal_global_544, v21);
  v18 = self->_storageAppListRemoteUIController;
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __62__CDPUIController__showQuotaStorageAppListView_andCompletion___block_invoke_553;
  v19[3] = &unk_24C854B68;
  objc_copyWeak(&v20, &location);
  v19[4] = self;
  -[RemoteUIController loadRequest:completion:](v18, "loadRequest:completion:", v8, v19);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

uint64_t __62__CDPUIController__showQuotaStorageAppListView_andCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(v2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("action"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(CFSTR("dismiss"), "isEqualToString:", v4) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(CFSTR("user_wants:cdp_reset"), "isEqualToString:", v4);
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v2, "attributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = 67109634;
    v9[1] = v5;
    v10 = 2112;
    v11 = v4;
    v12 = 2112;
    v13 = v8;
    _os_log_debug_impl(&dword_20DC8F000, v6, OS_LOG_TYPE_DEBUG, "\"iCSS Quota: Elements matches: %{BOOL}d, action = %@, all attributes %@\", (uint8_t *)v9, 0x1Cu);

  }
  return v5;
}

void __62__CDPUIController__showQuotaStorageAppListView_andCompletion___block_invoke_551(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *WeakRetained;
  int v12;
  _BOOL4 v13;
  NSObject *v14;

  v6 = a3;
  v7 = a4;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __62__CDPUIController__showQuotaStorageAppListView_andCompletion___block_invoke_551_cold_4();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("action"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(CFSTR("dismiss"), "isEqualToString:", v9))
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __62__CDPUIController__showQuotaStorageAppListView_andCompletion___block_invoke_551_cold_1();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = objc_msgSend(CFSTR("user_wants:cdp_reset"), "isEqualToString:", v9);
    _CDPLogSystem();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEBUG);
    if (v12)
    {
      if (v13)
        __62__CDPUIController__showQuotaStorageAppListView_andCompletion___block_invoke_551_cold_2();

      v14 = objc_loadWeakRetained((id *)(a1 + 40));
      WeakRetained = v14;
      if (v14)
      {
        -[NSObject _disableUserInteractionAndStartSpinner](v14, "_disableUserInteractionAndStartSpinner");
        -[NSObject _handleResetActionWithCompletion:](WeakRetained, "_handleResetActionWithCompletion:", *(_QWORD *)(a1 + 32));
      }
    }
    else if (v13)
    {
      __62__CDPUIController__showQuotaStorageAppListView_andCompletion___block_invoke_551_cold_3();
    }
  }

}

void __62__CDPUIController__showQuotaStorageAppListView_andCompletion___block_invoke_553(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *WeakRetained;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((a2 & 1) != 0)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DC8F000, v6, OS_LOG_TYPE_DEFAULT, "\"iCSS Quota: Successfully loaded storageAppList remote UI!\", buf, 2u);
    }
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      v16 = v5;
      _os_log_impl(&dword_20DC8F000, v6, OS_LOG_TYPE_DEFAULT, "\"iCSS Quota: Unable to load storageAppList remote UI: %@\", buf, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = WeakRetained;
    if (WeakRetained)
    {
      -[NSObject _quotaScreenRPDErrorWithUnderlyingError:](WeakRetained, "_quotaScreenRPDErrorWithUnderlyingError:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __62__CDPUIController__showQuotaStorageAppListView_andCompletion___block_invoke_554;
      v12[3] = &unk_24C854B40;
      v6 = v6;
      v13 = v6;
      v14 = v9;
      v11 = v9;
      -[NSObject cdpContext:showError:withCompletion:](v6, "cdpContext:showError:withCompletion:", v10, v11, v12);

    }
  }

}

uint64_t __62__CDPUIController__showQuotaStorageAppListView_andCompletion___block_invoke_554(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "cancelValidationWithError:", *(_QWORD *)(a1 + 40));
}

- (void)_handleResetActionWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  char v6;
  CDPContext *activeContext;
  _QWORD v8[4];
  void (**v9)(id, uint64_t, _QWORD);

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasLocalSecret");

  if ((v6 & 1) != 0)
  {
    v4[2](v4, 1, 0);
  }
  else
  {
    activeContext = self->_activeContext;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __52__CDPUIController__handleResetActionWithCompletion___block_invoke;
    v8[3] = &unk_24C854B90;
    v9 = v4;
    -[CDPUIController cdpContext:createLocalSecretWithCompletion:](self, "cdpContext:createLocalSecretWithCompletion:", activeContext, v8);

  }
}

void __52__CDPUIController__handleResetActionWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void (*v9)(void);
  uint8_t v10[16];

  v5 = a2;
  v6 = a3;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_20DC8F000, v8, OS_LOG_TYPE_DEFAULT, "\"Created local secret successfully in CDPUIController\", v10, 2u);
    }

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __52__CDPUIController__handleResetActionWithCompletion___block_invoke_cold_1();

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v9();

}

- (id)_quotaScreenRPDErrorWithUnderlyingError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
  CDPLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDD0FC8]);

  CDPLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDD0FD8]);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("GENERIC_ERROR_DEFAULT_BUTTON"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDD0FE8]);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *MEMORY[0x24BDD1398]);
  _CDPStateError();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_disableUserInteractionAndStartSpinner
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BE75558], "sharedSpinnerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController topViewController](self->_navController, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startAnimatingInNavItem:forIdentifier:hideBackButton:", v5, CFSTR("cdpuicontroller"), 1);

  -[UINavigationController topViewController](self->_navController, "topViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

}

- (void)_enableUserInteractionAndStopSpinner
{
  void *v2;
  void *v3;
  id v4;

  -[UINavigationController topViewController](self->_navController, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

  objc_msgSend(MEMORY[0x24BE75558], "sharedSpinnerManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAnimatingForIdentifier:", CFSTR("cdpuicontroller"));

}

- (id)_iCloudDeleteConfirmationViewController:(id)a3
{
  id v4;
  CDPUIInfoViewModel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CDPEscapeOption *v10;
  void *v11;
  void *v12;
  id v13;
  CDPUIInfoViewController *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(CDPUIInfoViewModel);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("WALRUS_ICLOUD_DELETED_CONFIRM_VIEW_TITLE"), CFSTR("Localizable-Walrus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIInfoViewModel setTitle:](v5, "setTitle:", v7);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("WALRUS_ICLOUD_DELETED_CONFIRM_VIEW_MESSAGE"), CFSTR("Localizable-Walrus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIInfoViewModel setMessage:](v5, "setMessage:", v9);

  objc_initWeak(&location, self);
  v10 = objc_alloc_init(CDPEscapeOption);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("WALRUS_ICLOUD_DELETED_CONFIRM_DONE_BUTTON_TITLE"), CFSTR("Localizable-Walrus"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPEscapeOption setTitle:](v10, "setTitle:", v12);

  -[CDPEscapeOption setTitleTelemetryKey:](v10, "setTitleTelemetryKey:", *MEMORY[0x24BE1A8A8]);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __59__CDPUIController__iCloudDeleteConfirmationViewController___block_invoke;
  v16[3] = &unk_24C854BB8;
  objc_copyWeak(&v18, &location);
  v13 = v4;
  v17 = v13;
  -[CDPEscapeOption setEscapeAction:](v10, "setEscapeAction:", v16);
  -[CDPUIInfoViewModel setOption1:](v5, "setOption1:", v10);
  v14 = -[CDPUIInfoViewController initWithViewModel:]([CDPUIInfoViewController alloc], "initWithViewModel:", v5);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v14;
}

void __59__CDPUIController__iCloudDeleteConfirmationViewController___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DC8F000, v3, OS_LOG_TYPE_DEFAULT, "\"iCSS Quota: Done\", buf, 2u);
  }

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__CDPUIController__iCloudDeleteConfirmationViewController___block_invoke_571;
  v4[3] = &unk_24C854368;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "_dismissPresentedViewControllerWithReason:completion:", CFSTR("com.apple.CoreCDPUI.CDPEnrollmentCompleted"), v4);

}

uint64_t __59__CDPUIController__iCloudDeleteConfirmationViewController___block_invoke_571(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)remoteUIController:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  objc_class *v6;
  void (**v7)(id, uint64_t, _QWORD);
  id v8;
  uint64_t v9;
  id v10;

  v6 = (objc_class *)MEMORY[0x24BDFC2C8];
  v7 = (void (**)(id, uint64_t, _QWORD))a5;
  v8 = a4;
  v10 = objc_alloc_init(v6);
  v9 = objc_msgSend(v10, "validateCertificateTrustWithChallenge:type:", v8, 0);

  v7[2](v7, v9, 0);
}

- (BOOL)_isQuotaServiceHost:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_msgSend(v3, "isEqualToString:", CFSTR("quota.icloud.com")) & 1) != 0
    || objc_msgSend(v3, "rangeOfString:options:", CFSTR("p\\d{2}-quota.icloud.com"), 1024) != 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (BOOL)_canShowRPD
{
  void *v4;
  char v5;

  if (objc_msgSend(MEMORY[0x24BE1A4A0], "shouldCentralizeRPDFlow"))
    return -[CDPRPDLedger canOfferRPD](self->_ledger, "canOfferRPD");
  objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rpdProbationIsInEffectForDuration:context:", self->_activeContext, self->_rpdProbationDuration);

  return v5;
}

- (void)remoteSecretEntryDidAcceptValidSecret
{
  if (!-[CDPUIController forceInlinePresentation](self, "forceInlinePresentation"))
    -[CDPUIController _dismissPresentedViewControllerCompletion:](self, "_dismissPresentedViewControllerCompletion:", 0);
}

- (void)remoteSecretEntryDidRequestCancellation
{
  CDPRemoteDeviceSecretValidator *remoteSecretValidator;
  id v4;

  if (self->_rootViewController)
  {
    -[CDPRemoteDeviceSecretValidator cancelApproveFromAnotherDevice](self->_remoteSecretValidator, "cancelApproveFromAnotherDevice");
    if (!-[CDPUIController forceInlinePresentation](self, "forceInlinePresentation"))
      -[CDPUIController _dismissPresentedViewControllerCompletion:](self, "_dismissPresentedViewControllerCompletion:", 0);
    remoteSecretValidator = self->_remoteSecretValidator;
    _CDPStateError();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CDPRemoteDeviceSecretValidator cancelValidationWithError:](remoteSecretValidator, "cancelValidationWithError:", v4);

  }
}

- (void)remoteSecretEntryDidExceedMaximumAttempts
{
  if (self->_rootViewController)
    -[CDPUIController _dismissPresentedViewControllerWithReason:completion:](self, "_dismissPresentedViewControllerWithReason:completion:", 0, &__block_literal_global_578);
}

void __60__CDPUIController_remoteSecretEntryDidExceedMaximumAttempts__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  _CDPLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20DC8F000, v0, OS_LOG_TYPE_DEFAULT, "\"UI dismissed\", v1, 2u);
  }

}

- (void)remoteSecretEntryDidDepleteRemainingAttemptsForDevice:(id)a3
{
  -[CDPUIController remoteSecretEntry:depletedRemainingAttemptsForDevice:](self, "remoteSecretEntry:depletedRemainingAttemptsForDevice:", self->_hostingController, a3);
}

- (void)remoteSecretEntryDidRequestRecoveryKeyRecovery
{
  -[CDPUIController performRecoveryKeyRecovery:](self, "performRecoveryKeyRecovery:", self->_hostingController);
}

- (void)remoteSecretEntryDidRequestCustodianRecovery
{
  -[CDPUIController performCustodianRecovery:](self, "performCustodianRecovery:", self->_hostingController);
}

- (void)remoteSecretEntryDidRequestRemoteApproval
{
  -[CDPUIController approveFromAnotherDevice:](self, "approveFromAnotherDevice:", 1);
}

- (void)remoteSecretEntryDidRequestAccountReset
{
  _QWORD v2[5];

  if (self->_rootViewController)
  {
    v2[0] = MEMORY[0x24BDAC760];
    v2[1] = 3221225472;
    v2[2] = __58__CDPUIController_remoteSecretEntryDidRequestAccountReset__block_invoke;
    v2[3] = &unk_24C8541C0;
    v2[4] = self;
    -[CDPUIController _dismissPresentedViewControllerWithReason:completion:](self, "_dismissPresentedViewControllerWithReason:completion:", 0, v2);
  }
}

uint64_t __58__CDPUIController_remoteSecretEntryDidRequestAccountReset__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20DC8F000, v2, OS_LOG_TYPE_DEFAULT, "\"UI dismissed, resetting account state\", v4, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "resetAccountCDPStateWithEscapeOptionsOffered:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "escapeOffersPresented"));
}

- (void)remoteSecretEntryDidRequestDeviceSelection
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __61__CDPUIController_remoteSecretEntryDidRequestDeviceSelection__block_invoke;
  v2[3] = &unk_24C8546B0;
  v2[4] = self;
  -[CDPUIController _setupDevicePickerController:](self, "_setupDevicePickerController:", v2);
}

uint64_t __61__CDPUIController_remoteSecretEntryDidRequestDeviceSelection__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "pushViewController:animated:", a2, 1);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "insert:", 2);
}

- (void)remoteSecretEntryDidFinishValidationWithError:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (self->_rootViewController)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __65__CDPUIController_remoteSecretEntryDidFinishValidationWithError___block_invoke;
    v6[3] = &unk_24C854520;
    v6[4] = self;
    v7 = v4;
    -[CDPUIController _dismissPresentedViewControllerWithReason:completion:](self, "_dismissPresentedViewControllerWithReason:completion:", 0, v6);

  }
}

uint64_t __65__CDPUIController_remoteSecretEntryDidFinishValidationWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20DC8F000, v2, OS_LOG_TYPE_DEFAULT, "\"UI dismissed, cancelling validation\", v4, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "cancelValidationWithError:", *(_QWORD *)(a1 + 40));
}

- (void)remoteSecretEntryDidRequestPiggybacking
{
  -[CDPUIController performPiggybackingRecovery:](self, "performPiggybackingRecovery:", self->_hostingController);
}

- (void)remoteSecretEntryDidRequestRecoveryKeyEscapeAction
{
  id v3;

  -[CDPUIController recoveryKeyEntryControllerForCircleJoinWithCancel:supportedEscapeOfferMask:](self, "recoveryKeyEntryControllerForCircleJoinWithCancel:supportedEscapeOfferMask:", 0, -[CDPRemoteDeviceSecretValidator supportedEscapeOfferMask](self->_remoteSecretValidator, "supportedEscapeOfferMask"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UINavigationController pushViewController:animated:](self->_navController, "pushViewController:animated:", v3, 1);
  -[CDPRPDLedger insert:](self->_ledger, "insert:", 32);

}

- (void)remoteSecretEntryDidRequestCustodianRecoveryEscapeAction
{
  id v3;

  -[CDPUIController _custodianAskHelpViewControllerWithSupportedEscapeOfferMask:](self, "_custodianAskHelpViewControllerWithSupportedEscapeOfferMask:", -[CDPRemoteDeviceSecretValidator supportedEscapeOfferMask](self->_remoteSecretValidator, "supportedEscapeOfferMask"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UINavigationController pushViewController:animated:](self->_navController, "pushViewController:animated:", v3, 1);
  -[CDPRPDLedger insert:](self->_ledger, "insert:", 64);

}

- (void)remoteSecretEntryDidRequestRemoteApprovalEscapeAction
{
  -[CDPUIController approveFromAnotherDevice:](self, "approveFromAnotherDevice:", 0);
}

- (void)remoteSecretEntryDidRequestAccountResetEscapeActionForDevice:(id)a3
{
  CDPRemoteDeviceSecretValidator *remoteSecretValidator;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;

  remoteSecretValidator = self->_remoteSecretValidator;
  v5 = a3;
  v6 = -[CDPRemoteDeviceSecretValidator supportedEscapeOfferMask](remoteSecretValidator, "supportedEscapeOfferMask");
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_FORGOT_HATCH"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modelClass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addDeviceClass:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSecretType:", objc_msgSend(v5, "localSecretType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedString");
  v25 = (id)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_DONT_KNOW_ALERT_SUBTITLE_NO_RECOVERY_METHOD"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSecretType:", objc_msgSend(v5, "localSecretType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithValidatedFormat:validFormatSpecifiers:error:", v14, CFSTR("%@"), 0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  CDPLocalizedString();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIController _iCSCSkipOrDeleteiCloudDataEscapeOfferWithTitle:message:skipButtonTitle:supportedEscapeOfferMask:withDevice:](self, "_iCSCSkipOrDeleteiCloudDataEscapeOfferWithTitle:message:skipButtonTitle:supportedEscapeOfferMask:withDevice:", v25, v16, v17, v6, v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_FORGOT_HATCH"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modelClass");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addDeviceClass:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v5, "localSecretType");

  objc_msgSend(v21, "addSecretType:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setEscapeOfferName:", v24);

  objc_msgSend(v18, "setPresentingViewController:", self->_navController);
  objc_msgSend(v18, "handleEscapeAction:", self);

}

- (void)remoteSecretEntryDidRequestDeviceSelectionEscapeAction
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __73__CDPUIController_remoteSecretEntryDidRequestDeviceSelectionEscapeAction__block_invoke;
  v2[3] = &unk_24C8546B0;
  v2[4] = self;
  -[CDPUIController _setupDevicePickerController:](self, "_setupDevicePickerController:", v2);
}

uint64_t __73__CDPUIController_remoteSecretEntryDidRequestDeviceSelectionEscapeAction__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "pushViewController:animated:", a2, 1);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "insert:", 2);
}

- (void)remoteSecretEntryDidRequestSkipEscapeActionForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  CDPRemoteValidationEscapeOffer *v17;
  CDPEscapeOption *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  CDPUIController *v28;
  _QWORD v29[4];
  id v30;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_FORGOT_HATCH"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addDeviceClass:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSecretType:", objc_msgSend(v4, "localSecretType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedString");
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_DONT_KNOW_ALERT_SUBTITLE_NO_RECOVERY_METHOD"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSecretType:", objc_msgSend(v4, "localSecretType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithValidatedFormat:validFormatSpecifiers:error:", v13, CFSTR("%@"), 0, v14);
  v15 = objc_claimAutoreleasedReturnValue();

  CDPLocalizedString();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = -[CDPRemoteValidationEscapeOffer initWithCDPContext:]([CDPRemoteValidationEscapeOffer alloc], "initWithCDPContext:", self->_activeContext);
  -[CDPRemoteValidationEscapeOffer setTitle:](v17, "setTitle:", v9);
  v27 = (void *)v15;
  -[CDPRemoteValidationEscapeOffer setMessage:](v17, "setMessage:", v15);
  v28 = self;
  objc_initWeak(&location, self);
  v18 = objc_alloc_init(CDPEscapeOption);
  -[CDPEscapeOption setStyle:](v18, "setStyle:", 3);
  -[CDPEscapeOption setTitle:](v18, "setTitle:", v16);
  -[CDPEscapeOption setTitleTelemetryKey:](v18, "setTitleTelemetryKey:", *MEMORY[0x24BE1A978]);
  v26 = (void *)v16;
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __72__CDPUIController_remoteSecretEntryDidRequestSkipEscapeActionForDevice___block_invoke;
  v29[3] = &unk_24C8546D8;
  objc_copyWeak(&v30, &location);
  -[CDPEscapeOption setEscapeAction:](v18, "setEscapeAction:", v29);
  v25 = (void *)v9;
  -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v17, "addEscapeOptionsObject:", v18);
  +[CDPEscapeOption cancelOption](CDPEscapeOption, "cancelOption");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setStyle:", 0);
  -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v17, "addEscapeOptionsObject:", v19);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_FORGOT_HATCH"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelClass");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addDeviceClass:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSecretType:", objc_msgSend(v4, "localSecretType"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setEscapeOfferName:](v17, "setEscapeOfferName:", v24);

  -[CDPRemoteValidationEscapeOffer setPresentingViewController:](v17, "setPresentingViewController:", v28->_navController);
  -[CDPRemoteValidationEscapeOffer handleEscapeAction:](v17, "handleEscapeAction:", v28);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

}

void __72__CDPUIController_remoteSecretEntryDidRequestSkipEscapeActionForDevice___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  _QWORD v5[4];
  id v6;

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __73__CDPUIController__showTryAgainLaterConfirmationAlertWithViewController___block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "sendEscapeOfferSelectedEvent:", *MEMORY[0x24BE1A978]);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __72__CDPUIController_remoteSecretEntryDidRequestSkipEscapeActionForDevice___block_invoke_581;
    v5[3] = &unk_24C8541C0;
    v6 = v4;
    objc_msgSend(v6, "_dismissPresentedViewControllerWithReason:completion:", CFSTR("com.apple.CoreCDPUI.CDPEnrollmentCompleted"), v5);

  }
}

void __72__CDPUIController_remoteSecretEntryDidRequestSkipEscapeActionForDevice___block_invoke_581(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  _CDPStateError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cancelValidationWithError:", v2);

}

- (void)remoteSecretEntryDidRequestPiggybackingEscapeAction
{
  id v3;

  -[CDPUIController _piggybackingViewControllerWithSupportedEscapeOfferMask:](self, "_piggybackingViewControllerWithSupportedEscapeOfferMask:", -[CDPRemoteDeviceSecretValidator supportedEscapeOfferMask](self->_remoteSecretValidator, "supportedEscapeOfferMask"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UINavigationController pushViewController:animated:](self->_navController, "pushViewController:animated:", v3, 1);
  -[CDPRPDLedger insert:](self->_ledger, "insert:", 128);

}

- (void)remoteSecretEntryDidRequestDisableUserInteractionAndStartSpinner
{
  void *v3;
  void *v4;
  void *v5;

  if (self->_hostingController)
  {
    objc_msgSend(MEMORY[0x24BE75558], "sharedSpinnerManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController navigationItem](self->_hostingController, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startAnimatingInNavItem:forIdentifier:hideBackButton:", v4, CFSTR("remoteSecretValidator"), 1);

    -[UIViewController view](self->_hostingController, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUserInteractionEnabled:", 0);

    -[UIBarButtonItem setEnabled:](self->_cancelButtonForSwiftUIHostingController, "setEnabled:", 0);
  }
}

- (void)remoteSecretEntryDidRequestEnableUserInteractionAndStopSpinner
{
  UIViewController *hostingController;
  void *v4;
  void *v5;
  UIBarButtonItem *doneButtonForSwiftUIHostingController;
  void *v7;

  hostingController = self->_hostingController;
  if (hostingController)
  {
    -[UIViewController view](hostingController, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUserInteractionEnabled:", 1);

    -[UIBarButtonItem setEnabled:](self->_cancelButtonForSwiftUIHostingController, "setEnabled:", 1);
    objc_msgSend(MEMORY[0x24BE75558], "sharedSpinnerManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopAnimatingForIdentifier:", CFSTR("remoteSecretValidator"));

    doneButtonForSwiftUIHostingController = self->_doneButtonForSwiftUIHostingController;
    if (doneButtonForSwiftUIHostingController)
    {
      -[UIViewController navigationItem](self->_hostingController, "navigationItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRightBarButtonItem:", doneButtonForSwiftUIHostingController);

      -[UIBarButtonItem setEnabled:](self->_doneButtonForSwiftUIHostingController, "setEnabled:", 0);
    }
  }
}

- (void)remoteSecretEntryDidRequestDisableUserInteraction
{
  UIViewController *hostingController;
  void *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *doneButtonForSwiftUIHostingController;

  hostingController = self->_hostingController;
  if (hostingController)
  {
    -[UIViewController navigationItem](hostingController, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rightBarButtonItem");
    v5 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
    doneButtonForSwiftUIHostingController = self->_doneButtonForSwiftUIHostingController;
    self->_doneButtonForSwiftUIHostingController = v5;

    -[UIBarButtonItem setEnabled:](self->_doneButtonForSwiftUIHostingController, "setEnabled:", 0);
  }
}

- (void)remoteSecretEntryDidRequestEnableUserInteraction
{
  UIBarButtonItem *doneButtonForSwiftUIHostingController;

  if (self->_hostingController)
  {
    doneButtonForSwiftUIHostingController = self->_doneButtonForSwiftUIHostingController;
    if (doneButtonForSwiftUIHostingController)
      -[UIBarButtonItem setEnabled:](doneButtonForSwiftUIHostingController, "setEnabled:", 1);
  }
}

- (void)presentQuotaScreenWithCompletion:(id)a3
{
  id v4;
  CDPQuotaStorageAppListRequest *v5;
  void *v6;
  void *v7;
  CDPQuotaStorageAppListRequest *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CDPUIController *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  CDPUIController *v28;
  id v29;
  id v30;
  id location;

  v4 = a3;
  -[CDPUIController _enableUserInteractionAndStopSpinner](self, "_enableUserInteractionAndStopSpinner");
  v5 = [CDPQuotaStorageAppListRequest alloc];
  objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryAppleAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CDPQuotaStorageAppListRequest initWithAccount:isWalrusEnabled:](v5, "initWithAccount:isWalrusEnabled:", v7, self->_isWalrusEnabled);

  if (-[CDPQuotaStorageAppListRequest isUrlAvailable](v8, "isUrlAvailable"))
  {
    -[CDPUIController _showQuotaStorageAppListView:andCompletion:](self, "_showQuotaStorageAppListView:andCompletion:", v8, v4);
  }
  else
  {
    v9 = objc_initWeak(&location, self);
    v10 = (void *)MEMORY[0x24BEBD3B0];
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("WALRUS_STORAGE_LIST_UNAVAILABLE_CONFIRMATION_ALERT_TITLE"), CFSTR("Localizable-Walrus"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "userInterfaceIdiom");

    objc_msgSend(v10, "alertControllerWithTitle:message:preferredStyle:", v12, 0, (v14 & 0xFFFFFFFFFFFFFFFBLL) == 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("WALRUS_STORAGE_LIST_UNAVAILABLE_CONFIRMATION_DELETE_BUTTON_TITLE"), CFSTR("Localizable-Walrus"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x24BDAC760];
    v25 = 3221225472;
    v26 = __52__CDPUIController_presentQuotaScreenWithCompletion___block_invoke;
    v27 = &unk_24C854C20;
    objc_copyWeak(&v30, &location);
    v19 = self;
    v28 = v19;
    v29 = v4;
    objc_msgSend(v16, "actionWithTitle:style:handler:", v18, 2, &v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "addAction:", v20, v24, v25, v26, v27);
    v21 = (void *)MEMORY[0x24BEBD3A8];
    CDPLocalizedString();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "actionWithTitle:style:handler:", v22, 1, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAction:", v23);

    -[UINavigationController presentViewController:animated:completion:](v19->_navController, "presentViewController:animated:completion:", v15, 1, 0);
    objc_destroyWeak(&v30);

    objc_destroyWeak(&location);
  }

}

void __52__CDPUIController_presentQuotaScreenWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_527_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_handleResetActionWithCompletion:", *(_QWORD *)(a1 + 40));

}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"CDPUIController going away...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (CDPUIDelegate)delegate
{
  return (CDPUIDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setForceInlinePresentation:(BOOL)a3
{
  self->_forceInlinePresentation = a3;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ledger, 0);
  objc_storeStrong((id *)&self->_recoveryKeyViewModel, 0);
  objc_storeStrong((id *)&self->_resetCompletedView, 0);
  objc_storeStrong((id *)&self->_hostingController, 0);
  objc_storeStrong((id *)&self->_cancelButtonForSwiftUIHostingController, 0);
  objc_storeStrong((id *)&self->_doneButtonForSwiftUIHostingController, 0);
  objc_storeStrong((id *)&self->_inheritanceUIProvider, 0);
  objc_storeStrong((id *)&self->_storageAppListRemoteUIController, 0);
  objc_storeStrong((id *)&self->_activeContext, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_devicePicker, 0);
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_remoteSecretValidator, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

- (void)_dismissPresentedViewControllerCompletion:(void *)a1 .cold.1(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_12(&dword_20DC8F000, v5, v6, "\"Inline mode detected, skipping dismissal  (presenting=%@ root=%@ presented=%@)\", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_11();
}

- (void)_dismissPresentedViewControllerCompletion:(void *)a1 .cold.2(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_12(&dword_20DC8F000, v5, v6, "\"Dismissing presented view controller (presenting=%@ root=%@ presented=%@)\", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_11();
}

void __53__CDPUIController__presentRootController_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"Need to remove the local secret view controller from the nav stack\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __53__CDPUIController__presentRootController_completion___block_invoke_34_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_20DC8F000, v0, v1, "\"Pushing root controller %@...\", v2);
  OUTLINED_FUNCTION_4();
}

void __53__CDPUIController__presentRootController_completion___block_invoke_35_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_20DC8F000, v0, v1, "\"Finished pushing root controller %@\", v2);
  OUTLINED_FUNCTION_4();
}

void __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(&dword_20DC8F000, v0, v1, "\"Remote view controller (%@) has unexpected type.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_20DC8F000, v0, v1, "\"UI Service interrupted\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_20DC8F000, v0, v1, "\"Suppressing ui service interruption as we are already done\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_2_172_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_20DC8F000, v0, v1, "\"Completion block called after we already finished\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __79__CDPUIController__presentSwiftUIRemoteSecretPromptWithDevice_didSelectDevice___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_20DC8F000, v0, v1, "\"UIHostingController for remote secret entry is nil.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __66__CDPUIController__presentRemoteSecretControllerWithNewestDevice___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_20DC8F000, v0, v1, "\"asked to present remote secret controller with no device\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __66__CDPUIController__presentRemoteSecretControllerWithNewestDevice___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_20DC8F000, a1, a3, "\"Ledger is nil when it shouldn't be. %s\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)cdpContext:(void *)a1 promptForAdoptionOfMultipleICSC:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_20DC8F000, a2, v4, "\"Presenting multiple-ICSC adoption dialog using presenting view controller %@\", v5);

}

void __39__CDPUIController_performAccountReset___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_20DC8F000, a1, a3, "\"Ledger is nil. %s\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_handleDepletedRemainingAttemptsForDevice:(uint64_t)a3 fromViewController:(uint64_t)a4 mask:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_20DC8F000, a1, a3, "\"Ledger is nil: %s\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_escapeOfferForDevice:withMask:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "@\"Do not add Remote approval when multiple options are available\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __86__CDPUIController__beginPiggybackingRecoveryEscapeOptionWithSupportedEscapeOfferMask___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_20DC8F000, a1, a3, "\"Ledger is nil. Probably not in recovery flow. %s\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __50__CDPUIController_piggybackingUserDidNotGetACode___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"User tapped Can't Get to My Device - Offering other recovery options.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_313_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(&dword_20DC8F000, v0, v1, "\"Prox Piggybacking: Received an error %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_314_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_20DC8F000, v0, v1, "\"Received error %@ while recovering data using proximity based piggybacking\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_315_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"Starting spinner while attempting CDP join\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_317_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_20DC8F000, v0, v1, "\"Piggybacking channel information missing in authResults\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_318_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"Piggybacking - NonProx Handling\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__CDPUIController_attemptToJoinCircleWithPiggybacking_mask___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_20DC8F000, v0, v1, "\"Stopping spinner: Attempting circle join completed with error %@\", v2);
  OUTLINED_FUNCTION_4();
}

void __60__CDPUIController_attemptToJoinCircleWithPiggybacking_mask___block_invoke_327_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_20DC8F000, v0, v1, "\"Piggybacking failed to get into circle with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __83__CDPUIController__beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_20DC8F000, a1, a3, "\"Ledger is nil. Probably not in recovery flow. %s\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __92__CDPUIController__custodianCodeEntryViewControllerWithController_supportedEscapeOfferMask___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_20DC8F000, v0, v1, "@\"Custodian Recovery Code Attempt: Code Entered: %@\", v2);
  OUTLINED_FUNCTION_4();
}

void __92__CDPUIController__custodianCodeEntryViewControllerWithController_supportedEscapeOfferMask___block_invoke_434_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(&dword_20DC8F000, v0, v1, "\"Custodian Recovery Code Attempt: Code validation failed: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __92__CDPUIController__custodianCodeEntryViewControllerWithController_supportedEscapeOfferMask___block_invoke_435_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_20DC8F000, v0, v1, "\"Custodian Recovery Code Attempt: Failed with unrecoverable error, bailing...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __50__CDPUIController__validateCustodianRecoveryInfo___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(&dword_20DC8F000, v0, v1, "@\"Custodian recovery info failed validation with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __72__CDPUIController__recoveryKeyEscapeOptionWithSupportedEscapeOfferMask___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_20DC8F000, a1, a3, "\"Ledger is nil. %s\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __94__CDPUIController_recoveryKeyEntryControllerForCircleJoinWithCancel_supportedEscapeOfferMask___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_20DC8F000, a1, a3, "\"Ledger is nil. %s\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __73__CDPUIController__showResetKeychainConfirmationAlertWithViewController___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_20DC8F000, a1, a3, "\"Ledger is nil. %s\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __73__CDPUIController__showTryAgainLaterConfirmationAlertWithViewController___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"User tapped Try Again Later - skipping CDP enrollment for now.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)keychainSyncController:didFinishWithResult:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_20DC8F000, v0, v1, "\"PEER APPROVAL - Popping view controller from %@\", v2);
  OUTLINED_FUNCTION_4();
}

void __68__CDPUIController_keychainSyncController_didFinishWithResult_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_20DC8F000, v0, v1, "\"Dismissing root view controller %@ after successful ICSC entry\", v2);
  OUTLINED_FUNCTION_4();
}

- (void)_skipOrDeleteiCloudDataEscapeOfferWithTitle:(NSObject *)a3 message:skipButtonTitle:supportedEscapeOfferMask:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5(&dword_20DC8F000, a3, (uint64_t)a3, "\"iCSS Quota: Storage App List View url: %@\", (uint8_t *)a2);

}

- (void)_skipOrDeleteiCloudDataEscapeOfferWithTitle:message:skipButtonTitle:supportedEscapeOfferMask:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"iCSS Quota: Storage App List View url unavailable\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_521_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"User tapped More Information (Leads to reset protected data)\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_522_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"User tapped Delete iCloud Data (Leads to reset protected data). Showing backup alert in place of Server UI alert.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_527_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"Resetting Protected Data...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_530_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_20DC8F000, a1, a3, "\"Ledger is nil: %s\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke_537_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_20DC8F000, a1, a3, "\"Ledger is nil: %s\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)cdpContext:showResetCompletedAlertWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"Displaying reset success screen from presentingViewController\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)cdpContext:showResetCompletedAlertWithCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"Displaying reset success screen from navController\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_showQuotaStorageAppListView:(void *)a1 andCompletion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "allHTTPHeaderFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v4;
  v10 = 2112;
  v11 = v6;
  OUTLINED_FUNCTION_14(&dword_20DC8F000, a2, v7, "\"iCSS Quota: StorageAppList Request: %@ Headers: %@\", (uint8_t *)&v8);

}

void __62__CDPUIController__showQuotaStorageAppListView_andCompletion___block_invoke_551_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"iCSS Quota: action = dismiss\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __62__CDPUIController__showQuotaStorageAppListView_andCompletion___block_invoke_551_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"iCSS Quota: action = user_wants:cdp_reset. Resetting Protected Data...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __62__CDPUIController__showQuotaStorageAppListView_andCompletion___block_invoke_551_cold_3()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_14(&dword_20DC8F000, v1, (uint64_t)v1, "\"iCSS Quota: no handler for matched action: %@ from attributes: %@\", v2);
  OUTLINED_FUNCTION_4();
}

void __62__CDPUIController__showQuotaStorageAppListView_andCompletion___block_invoke_551_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_20DC8F000, v0, v1, "\"iCSS Quota: Action handler for attributes: %@\", v2);
  OUTLINED_FUNCTION_4();
}

void __52__CDPUIController__handleResetActionWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(&dword_20DC8F000, v0, v1, "\"Failed to create local secret with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
