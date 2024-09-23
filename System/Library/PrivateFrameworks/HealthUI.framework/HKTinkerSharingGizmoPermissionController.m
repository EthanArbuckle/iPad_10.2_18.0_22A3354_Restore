@implementation HKTinkerSharingGizmoPermissionController

- (HKTinkerSharingGizmoPermissionController)initWithStyle:(int64_t)a3 delegate:(id)a4
{
  id v6;
  HKTinkerSharingGizmoPermissionController *v7;
  HKTinkerSharingGizmoPermissionController *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HKTinkerSharingGizmoPermissionController;
  v7 = -[BPSWelcomeOptinViewController init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_layoutStyle = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
    -[BPSWelcomeOptinViewController setStyle:](v8, "setStyle:", 2);
  }

  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKTinkerSharingGizmoPermissionController;
  -[BPSWelcomeOptinViewController viewDidLoad](&v7, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v3, "setHidesWhenStopped:", 1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v3);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItem:", v4);

  objc_msgSend(v3, "startAnimating");
  if (self->_layoutStyle == 2)
  {
    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidesBackButton:", 1);

    -[HKTinkerSharingGizmoPermissionController setModalInPresentation:](self, "setModalInPresentation:", 1);
    -[HKTinkerSharingGizmoPermissionController sendOptInRequest](self, "sendOptInRequest");
  }

}

- (void)sendOptInRequest
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D7813000, log, OS_LOG_TYPE_ERROR, "[sharing-setup] Family member not found for this pairing, bailing. (#t0)", v1, 2u);
}

void __60__HKTinkerSharingGizmoPermissionController_sendOptInRequest__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  char v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_impl(&dword_1D7813000, v6, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Done with Tinker Opt In request, got Error: %@", buf, 0xCu);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__HKTinkerSharingGizmoPermissionController_sendOptInRequest__block_invoke_203;
  block[3] = &unk_1E9C3FE60;
  v10 = a2;
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __60__HKTinkerSharingGizmoPermissionController_sendOptInRequest__block_invoke_203(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "optInDidSucceed");
  else
    return objc_msgSend(v3, "optInDidFailWithError:", *(_QWORD *)(a1 + 40));
}

- (void)optInDidSucceed
{
  NSObject *v3;
  HKTinkerSharingSyncSetupController *v4;
  int64_t layoutStyle;
  id WeakRetained;
  HKTinkerSharingSyncSetupController *v7;
  void *v8;
  uint8_t v9[16];

  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1D7813000, v3, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Tinker user opt-in request accepted, will begin sharing setup", v9, 2u);
  }
  v4 = [HKTinkerSharingSyncSetupController alloc];
  layoutStyle = self->_layoutStyle;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = -[HKTinkerSharingSyncSetupController initWithStyle:delegate:](v4, "initWithStyle:delegate:", layoutStyle, WeakRetained);

  -[HKTinkerSharingGizmoPermissionController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pushViewController:animated:", v7, 1);

}

- (void)optInDidFailWithError:(id)a3
{
  HKTinkerSharingSetupDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "sharingSetupDidFailWithError:", v4);

}

- (BOOL)controllerAllowsNavigatingBackFrom
{
  return 0;
}

- (BOOL)controllerAllowsNavigatingBackTo
{
  return 0;
}

- (BOOL)wantsLightenBlendedScreen
{
  return 1;
}

- (id)titleString
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("HEALTH_TINKER_TITLE_%@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-tinker"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tinkerMember");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)detailString
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tinkerMember");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("HEALTH_TINKER_WAIT_FOR_RESPONSE_%@_%@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-tinker"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v7, v4, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)imageResource
{
  return CFSTR("health-80");
}

- (id)suggestedButtonTitle
{
  return 0;
}

- (id)tapToRadarMetadata
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D035F0]), "initWithComponent:", 2);
}

- (id)_localizedFullNameForFirstName:(id)a3 lastName:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x1E0CB3850];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setGivenName:", v7);

  objc_msgSend(v8, "setFamilyName:", v6);
  objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v8, 2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
