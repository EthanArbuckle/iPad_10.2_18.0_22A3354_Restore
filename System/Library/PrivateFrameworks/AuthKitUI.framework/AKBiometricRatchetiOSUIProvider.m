@implementation AKBiometricRatchetiOSUIProvider

- (AKBiometricRatchetiOSUIProvider)initWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  AKBiometricRatchetiOSUIProvider *v6;
  AKBiometricRatchetiOSUIProvider *v7;
  uint64_t v8;
  FMDFMIPManager *findMyManager;
  objc_super v11;

  v4 = a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AKBiometricRatchetiOSUIProvider initWithContext:].cold.1(v4, v5);

  v11.receiver = self;
  v11.super_class = (Class)AKBiometricRatchetiOSUIProvider;
  v6 = -[AKBiometricRatchetiOSUIProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_context, v4);
    objc_msgSend(MEMORY[0x1E0D21380], "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    findMyManager = v7->_findMyManager;
    v7->_findMyManager = (FMDFMIPManager *)v8;

  }
  return v7;
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
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "AKBiometricRatchetiOSUIProvider deallocated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_presentEmbeddedRatchetUIWithOptions:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  Class (*v25)(uint64_t);
  void *v26;
  uint64_t *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AKBiometricRatchetiOSUIProvider _presentEmbeddedRatchetUIWithOptions:].cold.3(v4, v5);

  dispatch_group_enter((dispatch_group_t)self->_dispatchGroup);
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  if (!LocalAuthenticationEmbeddedUILibraryCore_frameworkLibrary)
  {
    v24 = xmmword_1E7678A30;
    v25 = 0;
    LocalAuthenticationEmbeddedUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (LocalAuthenticationEmbeddedUILibraryCore_frameworkLibrary)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v7 = (void *)getLARatchetViewControllerClass_softClass;
    v23 = getLARatchetViewControllerClass_softClass;
    if (!getLARatchetViewControllerClass_softClass)
    {
      *(_QWORD *)&v24 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v24 + 1) = 3221225472;
      v25 = __getLARatchetViewControllerClass_block_invoke;
      v26 = &unk_1E7678A50;
      v27 = &v20;
      __getLARatchetViewControllerClass_block_invoke((uint64_t)&v24);
      v7 = (void *)v21[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v8, "makeViewControllerWithOptions:", v4, v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBiometricRatchetiOSUIProvider setRatchetViewController:](self, "setRatchetViewController:", v9);

  -[AKBiometricRatchetiOSUIProvider ratchetViewController](self, "ratchetViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0CEA380]);
  objc_msgSend(WeakRetained, "embeddedUIRightNavButtonTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithTitle:style:target:action:", v13, 0, self, sel__rightNavButtonTapped);
  objc_msgSend(v11, "setRightBarButtonItem:", v14);

  -[AKBiometricRatchetiOSUIProvider ratchetViewController](self, "ratchetViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDelegate:", self);

  objc_msgSend(WeakRetained, "embeddedUIPresentationMode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v16, "isEqualToString:", CFSTR("Modal"));

  _AKLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  if ((_DWORD)v11)
  {
    if (v18)
      -[AKBiometricRatchetiOSUIProvider _presentEmbeddedRatchetUIWithOptions:].cold.1();

    -[AKBiometricRatchetiOSUIProvider ratchetViewController](self, "ratchetViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "evaluateAndPresentViewController");
  }
  else
  {
    if (v18)
      -[AKBiometricRatchetiOSUIProvider _presentEmbeddedRatchetUIWithOptions:].cold.2(WeakRetained, v17);

    -[AKBiometricRatchetiOSUIProvider ratchetViewController](self, "ratchetViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "evaluateAndShowViewController");
  }

}

- (void)_presentRatchetUIWithContext:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;
  _BYTE v26[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_group_enter((dispatch_group_t)self->_dispatchGroup);
  +[AKBiometricRatchetUtility ratchetIdentifier](AKBiometricRatchetUtility, "ratchetIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _AKLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[AKBiometricRatchetiOSUIProvider _presentRatchetUIWithContext:options:completion:].cold.2();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC12B8]), "initWithIdentifier:", v11);
  -[AKBiometricRatchetiOSUIProvider setRatchet:](self, "setRatchet:", v13);

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy_;
  v24[4] = __Block_byref_object_dispose_;
  v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  v22[4] = __Block_byref_object_dispose_;
  v23 = 0;
  _AKLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "debugDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKBiometricRatchetiOSUIProvider _presentRatchetUIWithContext:options:completion:].cold.1(v15, (uint64_t)v26, v14);
  }

  -[AKBiometricRatchetiOSUIProvider ratchet](self, "ratchet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __83__AKBiometricRatchetiOSUIProvider__presentRatchetUIWithContext_options_completion___block_invoke;
  v18[3] = &unk_1E76788D8;
  v20 = v24;
  v21 = v22;
  v17 = v10;
  v18[4] = self;
  v19 = v17;
  objc_msgSend(v16, "armWithOptions:completion:", v9, v18);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);

}

void __83__AKBiometricRatchetiOSUIProvider__presentRatchetUIWithContext_options_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;

  v5 = a2;
  v6 = a3;
  if (!(v5 | v6))
    __83__AKBiometricRatchetiOSUIProvider__presentRatchetUIWithContext_options_completion___block_invoke_cold_1();
  v7 = (void *)v6;
  objc_msgSend((id)v5, "objectForKeyedSubscript:", &unk_1E769A830);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = a1 + 6;
  if (v8)
  {
    +[AKBiometricRatchetUtility resultForSuccessfulArmingFromResponse:](AKBiometricRatchetUtility, "resultForSuccessfulArmingFromResponse:", v5);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*v9 + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  else
  {
    +[AKBiometricRatchetUtility resultForNonArmingFromError:](AKBiometricRatchetUtility, "resultForNonArmingFromError:", v7);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*v9 + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    if (!*(_QWORD *)(*(_QWORD *)(*v9 + 8) + 40))
    {
      objc_msgSend(v7, "userInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      _AKLogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __83__AKBiometricRatchetiOSUIProvider__presentRatchetUIWithContext_options_completion___block_invoke_cold_3();

      v19 = *(_QWORD *)(a1[7] + 8);
      if (v17)
        v20 = v17;
      else
        v20 = v7;
      v21 = v20;
      v22 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v21;

    }
  }
  _AKLogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    __83__AKBiometricRatchetiOSUIProvider__presentRatchetUIWithContext_options_completion___block_invoke_cold_2();

  v24 = a1[5];
  if (v24)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v24 + 16))(v24, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1[4] + 24));

}

- (void)presentRatchetUIWithCompletion:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  OS_dispatch_group *v7;
  OS_dispatch_group *dispatchGroup;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD *v14;
  _QWORD v15[6];
  _QWORD v16[5];
  id v17;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  -[AKBiometricRatchetiOSUIProvider _makeRatchetOptions:](self, "_makeRatchetOptions:", WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (OS_dispatch_group *)dispatch_group_create();
  dispatchGroup = self->_dispatchGroup;
  self->_dispatchGroup = v7;

  dispatch_group_enter((dispatch_group_t)self->_dispatchGroup);
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy_;
  v16[4] = __Block_byref_object_dispose_;
  v17 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__AKBiometricRatchetiOSUIProvider_presentRatchetUIWithCompletion___block_invoke;
  v15[3] = &unk_1E7678900;
  v15[4] = self;
  v15[5] = v16;
  -[AKBiometricRatchetiOSUIProvider _disableFindMyIfRequiredWithContext:completion:](self, "_disableFindMyIfRequiredWithContext:completion:", WeakRetained, v15);
  objc_msgSend(WeakRetained, "metaContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[AKBiometricRatchetiOSUIProvider setRatchetArmCompletion:](self, "setRatchetArmCompletion:", v4);
    -[AKBiometricRatchetiOSUIProvider _presentEmbeddedRatchetUIWithOptions:](self, "_presentEmbeddedRatchetUIWithOptions:", v6);
  }
  else
  {
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __66__AKBiometricRatchetiOSUIProvider_presentRatchetUIWithCompletion___block_invoke_31;
    v11[3] = &unk_1E7678950;
    v11[4] = self;
    v14 = v16;
    v12 = WeakRetained;
    v13 = v4;
    -[AKBiometricRatchetiOSUIProvider _presentRatchetUIWithContext:options:completion:](self, "_presentRatchetUIWithContext:options:completion:", v12, v6, v11);

  }
  _Block_object_dispose(v16, 8);

}

void __66__AKBiometricRatchetiOSUIProvider_presentRatchetUIWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  if (v4)
  {
    _AKLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __66__AKBiometricRatchetiOSUIProvider_presentRatchetUIWithCompletion___block_invoke_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 24));

}

void __66__AKBiometricRatchetiOSUIProvider_presentRatchetUIWithCompletion___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id location;

  v5 = a2;
  v6 = a3;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__AKBiometricRatchetiOSUIProvider_presentRatchetUIWithCompletion___block_invoke_2;
  block[3] = &unk_1E7678928;
  objc_copyWeak(&v16, &location);
  v15 = *(_QWORD *)(a1 + 56);
  v11 = v6;
  v12 = *(id *)(a1 + 40);
  v13 = v5;
  v14 = *(id *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  dispatch_group_notify(v7, MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __66__AKBiometricRatchetiOSUIProvider_presentRatchetUIWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v3 = WeakRetained;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) && !*(_QWORD *)(a1 + 32))
    objc_msgSend(WeakRetained, "_displayFindMyDisablementFailedErrorWithContext:", *(_QWORD *)(a1 + 40));
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __66__AKBiometricRatchetiOSUIProvider_presentRatchetUIWithCompletion___block_invoke_2_cold_1();

  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v5 + 16))(v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

- (id)_makeRatchetOptions:(id)a3
{
  id v4;
  UIViewController *v5;
  UIViewController *contextViewController;
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
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = a3;
  objc_msgSend(v4, "presentingViewController");
  v5 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  contextViewController = self->_contextViewController;
  self->_contextViewController = v5;

  objc_msgSend(v4, "beginRatchetTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v4, "beginRatchetTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("BIOMETRIC_RATCHET_BEGIN_RATCHET_TITLE"), &stru_1E7679C68, CFSTR("Localizable-DTO"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "beginRatchetBody");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v4, "beginRatchetBody");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("BIOMETRIC_RATCHET_BEGIN_RATCHET_BODY"), &stru_1E7679C68, CFSTR("Localizable-DTO"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "countdownText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v4, "countdownText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("BIOMETRIC_RATCHET_COUNTDOWN_TEXT"), &stru_1E7679C68, CFSTR("Localizable-DTO"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "reason");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v4, "reason");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("BIOMETRIC_RATCHET_FALLBACK_ALERT_SUBTITLE"), &stru_1E7679C68, CFSTR("Localizable-DTO"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "calloutReason");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v4, "calloutReason");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("BIOMETRIC_RATCHET_CALLOUT_REASON_TEXT"), &stru_1E7679C68, CFSTR("Localizable-DTO"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v17, &unk_1E769A848);
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v20, &unk_1E769A830);
  objc_msgSend(v22, "setObject:forKeyedSubscript:", self->_contextViewController, &unk_1E769A860);
  objc_msgSend(v4, "deeplinkURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, &unk_1E769A878);

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", objc_msgSend(v4, "fallbackToNoAuth"));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, &unk_1E769A890);

  objc_msgSend(v22, "setObject:forKeyedSubscript:", v8, &unk_1E769A8A8);
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v11, &unk_1E769A8C0);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", objc_msgSend(v4, "showsLocationWarning"));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v25, &unk_1E769A8D8);

  objc_msgSend(v22, "setObject:forKeyedSubscript:", v14, &unk_1E769A8F0);
  v26 = (void *)objc_msgSend(v22, "copy");

  return v26;
}

- (void)_rightNavButtonTapped
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CC1280], -2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBiometricRatchetiOSUIProvider ratchetArmCompletion](self, "ratchetArmCompletion");
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v4)[2](v4, 0, v3);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIViewController rightNavButtonTapped](self->_contextViewController, "rightNavButtonTapped");
  -[AKBiometricRatchetiOSUIProvider ratchetViewController](self, "ratchetViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBiometricRatchetiOSUIProvider _dismissRatchetUIForContext:viewController:](self, "_dismissRatchetUIForContext:viewController:", WeakRetained, v5);

}

- (void)ratchetViewController:(id)a3 didFinishWithResult:(id)a4 error:(id)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  NSObject *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *dispatchGroup;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  AKBiometricRatchetiOSUIProvider *v28;
  id v29;
  id v30;
  _QWORD *v31;
  id v32;
  id location;
  _QWORD v34[5];
  id v35;

  v8 = a3;
  v9 = (unint64_t)a4;
  v10 = (unint64_t)a5;
  _AKLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[AKBiometricRatchetiOSUIProvider ratchetViewController:didFinishWithResult:error:].cold.3();

  if (!(v9 | v10))
    -[AKBiometricRatchetiOSUIProvider ratchetViewController:didFinishWithResult:error:].cold.1();
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy_;
  v34[4] = __Block_byref_object_dispose_;
  v35 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend((id)v9, "objectForKeyedSubscript:", &unk_1E769A830);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    +[AKBiometricRatchetUtility resultForSuccessfulArmingFromResponse:](AKBiometricRatchetUtility, "resultForSuccessfulArmingFromResponse:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v15 = 0;
    goto LABEL_14;
  }
  +[AKBiometricRatchetUtility resultForNonArmingFromError:](AKBiometricRatchetUtility, "resultForNonArmingFromError:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_6;
  objc_msgSend((id)v10, "userInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    __83__AKBiometricRatchetiOSUIProvider__presentRatchetUIWithContext_options_completion___block_invoke_cold_3();

  if (v17)
    v19 = v17;
  else
    v19 = (void *)v10;
  v15 = v19;

LABEL_14:
  dispatch_group_leave((dispatch_group_t)self->_dispatchGroup);
  objc_initWeak(&location, self);
  dispatchGroup = self->_dispatchGroup;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __83__AKBiometricRatchetiOSUIProvider_ratchetViewController_didFinishWithResult_error___block_invoke;
  v25[3] = &unk_1E7678978;
  objc_copyWeak(&v32, &location);
  v26 = v15;
  v27 = WeakRetained;
  v28 = self;
  v29 = v14;
  v30 = v8;
  v31 = v34;
  v21 = v8;
  v22 = v14;
  v23 = WeakRetained;
  v24 = v15;
  dispatch_group_notify(dispatchGroup, MEMORY[0x1E0C80D38], v25);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
  _Block_object_dispose(v34, 8);

}

void __83__AKBiometricRatchetiOSUIProvider_ratchetViewController_didFinishWithResult_error___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);
  uint64_t v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) && !*(_QWORD *)(a1 + 32))
    objc_msgSend(WeakRetained, "_displayFindMyDisablementFailedErrorWithContext:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "ratchetArmCompletion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 48), "ratchetArmCompletion");
    v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));

  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  objc_msgSend(*(id *)(a1 + 48), "_dismissRatchetUIForContext:viewController:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
}

- (void)_dismissRatchetUIForContext:(id)a3 viewController:(id)a4
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  id v12;
  _QWORD v13[5];

  v6 = a4;
  objc_msgSend(a3, "embeddedUIPresentationMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Modal"));

  _AKLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10)
      -[AKBiometricRatchetiOSUIProvider _dismissRatchetUIForContext:viewController:].cold.1();

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __78__AKBiometricRatchetiOSUIProvider__dismissRatchetUIForContext_viewController___block_invoke;
    v13[3] = &unk_1E76789A0;
    v13[4] = self;
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v13);

  }
  else
  {
    if (v10)
      -[AKBiometricRatchetiOSUIProvider _dismissRatchetUIForContext:viewController:].cold.2();

    objc_msgSend(v6, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (id)objc_msgSend(v11, "popViewControllerAnimated:", 1);
    -[AKBiometricRatchetiOSUIProvider setRatchetViewController:](self, "setRatchetViewController:", 0);
  }
}

uint64_t __78__AKBiometricRatchetiOSUIProvider__dismissRatchetUIForContext_viewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRatchetViewController:", 0);
}

- (void)_disableFindMyIfRequiredWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  FMDFMIPManager *findMyManager;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "showsLocationWarning"))
  {
    objc_initWeak(&location, self);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      findMyManager = self->_findMyManager;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke;
      v11[3] = &unk_1E76789F0;
      objc_copyWeak(&v13, &location);
      v12 = v7;
      -[FMDFMIPManager requireDisableLocationWithCompletion:](findMyManager, "requireDisableLocationWithCompletion:", v11);

      objc_destroyWeak(&v13);
    }
    else
    {
      _AKLogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[AKBiometricRatchetiOSUIProvider _disableFindMyIfRequiredWithContext:completion:].cold.1();

      if (v7)
        (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    }
    objc_destroyWeak(&location);
  }
  else
  {
    _AKLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AKBiometricRatchetiOSUIProvider _disableFindMyIfRequiredWithContext:completion:].cold.2();

    if (v7)
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  _QWORD *WeakRetained;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5)
  {
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke_cold_4();
  }
  else if (a2)
  {
    if (a2 == 1)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v9 = (void *)WeakRetained[2];
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke_64;
        v10[3] = &unk_1E76789C8;
        v11 = *(id *)(a1 + 32);
        objc_msgSend(v9, "disableLocationDisplayWithCompletion:", v10);

        goto LABEL_6;
      }
      _AKLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke_cold_2();
    }
    else
    {
      _AKLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke_cold_1();
    }
  }
  else
  {
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke_cold_3();
  }

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
LABEL_6:

}

void __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke_64(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke_64_cold_2();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke_64_cold_1();
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

- (void)_displayFindMyDisablementFailedErrorWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;

  v3 = a3;
  objc_msgSend(v3, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CEA2E8];
  objc_msgSend(v3, "findMyErrorTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "findMyErrorMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ALERT_DEFAULT_BUTTON"), &stru_1E7679C68, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 0, &__block_literal_global);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v12);

  _AKLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v14)
      -[AKBiometricRatchetiOSUIProvider _displayFindMyDisablementFailedErrorWithContext:].cold.2();
  }
  else if (v14)
  {
    -[AKBiometricRatchetiOSUIProvider _displayFindMyDisablementFailedErrorWithContext:].cold.1();
  }

  objc_msgSend(v4, "presentViewController:animated:completion:", v8, 1, 0);
}

void __83__AKBiometricRatchetiOSUIProvider__displayFindMyDisablementFailedErrorWithContext___block_invoke()
{
  NSObject *v0;

  _AKLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __83__AKBiometricRatchetiOSUIProvider__displayFindMyDisablementFailedErrorWithContext___block_invoke_cold_1();

}

- (id)ratchetArmCompletion
{
  return self->_ratchetArmCompletion;
}

- (void)setRatchetArmCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (LARatchet)ratchet
{
  return self->_ratchet;
}

- (void)setRatchet:(id)a3
{
  objc_storeStrong((id *)&self->_ratchet, a3);
}

- (LARatchetViewController)ratchetViewController
{
  return self->_ratchetViewController;
}

- (void)setRatchetViewController:(id)a3
{
  objc_storeStrong((id *)&self->_ratchetViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratchetViewController, 0);
  objc_storeStrong((id *)&self->_ratchet, 0);
  objc_storeStrong(&self->_ratchetArmCompletion, 0);
  objc_storeStrong((id *)&self->_contextViewController, 0);
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
  objc_storeStrong((id *)&self->_findMyManager, 0);
  objc_destroyWeak((id *)&self->_context);
}

- (void)initWithContext:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1BD795000, a2, v4, "initing iOS bio ratchet UI provider with context: %@", v5);

  OUTLINED_FUNCTION_11();
}

- (void)_presentEmbeddedRatchetUIWithOptions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "Ratchet presenting modally", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_presentEmbeddedRatchetUIWithOptions:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "embeddedUIPresentationMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1BD795000, a2, v4, "Ratchet presenting push, %@", v5);

  OUTLINED_FUNCTION_11();
}

- (void)_presentEmbeddedRatchetUIWithOptions:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1BD795000, a2, v4, "Present embedded ratchet with options: %@", v5);

  OUTLINED_FUNCTION_11();
}

- (void)_presentRatchetUIWithContext:(void *)a1 options:(uint64_t)a2 completion:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4(&dword_1BD795000, a3, (uint64_t)a3, "presentBiometricRatchetArmingUIWithCompletion with context: %@", (uint8_t *)a2);

}

- (void)_presentRatchetUIWithContext:options:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1BD795000, v0, v1, "ratchet identifier is: %@", v2);
  OUTLINED_FUNCTION_5();
}

void __83__AKBiometricRatchetiOSUIProvider__presentRatchetUIWithContext_options_completion___block_invoke_cold_1()
{
  __assert_rtn("-[AKBiometricRatchetiOSUIProvider _presentRatchetUIWithContext:options:completion:]_block_invoke", "AKBiometricRatchetiOSUIProvider.m", 112, "result != nil || error != nil");
}

void __83__AKBiometricRatchetiOSUIProvider__presentRatchetUIWithContext_options_completion___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10(&dword_1BD795000, v0, v1, "returning result: %@, error: %@");
  OUTLINED_FUNCTION_5();
}

void __83__AKBiometricRatchetiOSUIProvider__presentRatchetUIWithContext_options_completion___block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9(&dword_1BD795000, v0, v1, "Ratchet is in unexpected error - %@, underlying error - %@");
  OUTLINED_FUNCTION_5();
}

void __66__AKBiometricRatchetiOSUIProvider_presentRatchetUIWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1BD795000, v0, v1, "disableFindMy failed with error - %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __66__AKBiometricRatchetiOSUIProvider_presentRatchetUIWithCompletion___block_invoke_2_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_12();
  _os_log_debug_impl(&dword_1BD795000, v0, OS_LOG_TYPE_DEBUG, "Ratchet returning result: %@, error: %@", v1, 0x16u);
  OUTLINED_FUNCTION_5();
}

- (void)ratchetViewController:didFinishWithResult:error:.cold.1()
{
  __assert_rtn("-[AKBiometricRatchetiOSUIProvider ratchetViewController:didFinishWithResult:error:]", "AKBiometricRatchetiOSUIProvider.m", 216, "result != nil || error != nil");
}

- (void)ratchetViewController:didFinishWithResult:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_1BD795000, v0, v1, "ratchetViewController didFinishWithResult: result: %@, error: %@");
  OUTLINED_FUNCTION_5();
}

- (void)_dismissRatchetUIForContext:viewController:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "Dismissing modally presented ratchet", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_dismissRatchetUIForContext:viewController:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "Popping pushed ratchet", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_disableFindMyIfRequiredWithContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1BD795000, v0, v1, "Disabling FM not required via idms - idms is handling the logic to determine with operations need this", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_disableFindMyIfRequiredWithContext:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1BD795000, v0, v1, "does not respondToSelector requireDisableLocationWithCompletion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1BD795000, v0, v1, "Require disable returned unknown, no-op", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1BD795000, v0, v1, "does not respondToSelector disableLocationDisplayWithCompletion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1BD795000, v0, v1, "Disabling FindyMy not required via FindMy as it might already be in the blackout period", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1BD795000, v0, v1, "Cannot determine if disable is required due to error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke_64_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "disableLocationDisplay suceeded", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __82__AKBiometricRatchetiOSUIProvider__disableFindMyIfRequiredWithContext_completion___block_invoke_64_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1BD795000, v0, v1, "disableLocationDisplay failed with error - %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_displayFindMyDisablementFailedErrorWithContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "nil presentingViewController", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_displayFindMyDisablementFailedErrorWithContext:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1BD795000, v0, v1, "presentingViewController - %@", v2);
  OUTLINED_FUNCTION_5();
}

void __83__AKBiometricRatchetiOSUIProvider__displayFindMyDisablementFailedErrorWithContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "User picked OK", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
