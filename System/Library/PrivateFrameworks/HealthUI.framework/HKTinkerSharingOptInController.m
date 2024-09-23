@implementation HKTinkerSharingOptInController

- (HKTinkerSharingOptInController)initWithStyle:(int64_t)a3 delegate:(id)a4
{
  id v6;
  HKTinkerSharingOptInController *v7;
  HKTinkerSharingOptInController *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HKTinkerSharingOptInController;
  v7 = -[BPSWelcomeOptinViewController init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_layoutStyle = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
    -[HKTinkerSharingOptInController _configureLayoutStyle](v8, "_configureLayoutStyle");
  }

  return v8;
}

- (void)_configureLayoutStyle
{
  int64_t layoutStyle;
  uint64_t v3;

  layoutStyle = self->_layoutStyle;
  if (layoutStyle == 1)
    v3 = 10;
  else
    v3 = 2 * (layoutStyle == 2);
  -[BPSWelcomeOptinViewController setStyle:](self, "setStyle:", v3);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKTinkerSharingOptInController;
  -[BPSWelcomeOptinViewController viewDidLoad](&v5, sel_viewDidLoad);
  if (self->_layoutStyle == 2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_userDidRequestCancel);
    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLeftBarButtonItem:", v3);

  }
}

- (void)userDidRequestCancel
{
  -[HKTinkerSharingOptInController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
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
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("HEALTH_TINKER_DETAIL_%@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-tinker"));
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

- (id)imageResource
{
  return CFSTR("health-80");
}

- (id)imageResourceBundleIdentifier
{
  return CFSTR("com.apple.Bridge");
}

- (id)termsOfAddress
{
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v10[0] = *MEMORY[0x1E0C96668];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tinkerMember");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C97298]);
  objc_msgSend(v5, "contactWithKeys:contactStore:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "termsOfAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (void)suggestedButtonPressed:(id)a3
{
  HKTinkerSharingHelper *v4;

  v4 = objc_alloc_init(HKTinkerSharingHelper);
  if (-[HKTinkerSharingHelper isChinaSKUDevice](v4, "isChinaSKUDevice")
    && !-[HKTinkerSharingHelper networkAccessEnabledForHealth](v4, "networkAccessEnabledForHealth"))
  {
    -[HKTinkerSharingOptInController _presentNetworkAccessConfirmationWithHelper:](self, "_presentNetworkAccessConfirmationWithHelper:", v4);
  }
  else
  {
    -[HKTinkerSharingOptInController applyConfirmedOptin:](self, "applyConfirmedOptin:", 1);
  }

}

- (void)alternateButtonPressed:(id)a3
{
  -[HKTinkerSharingOptInController applyConfirmedOptin:](self, "applyConfirmedOptin:", 0);
}

- (void)applyConfirmedOptin:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  HKTinkerSharingGizmoPermissionController *v7;
  int64_t layoutStyle;
  id WeakRetained;
  HKTinkerSharingGizmoPermissionController *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v12 = 138543362;
    v13 = (id)objc_opt_class();
    v6 = v13;
    _os_log_impl(&dword_1D7813000, v5, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ User opted-in", (uint8_t *)&v12, 0xCu);

  }
  if (self->_layoutStyle == 2)
  {
    v7 = [HKTinkerSharingGizmoPermissionController alloc];
    layoutStyle = self->_layoutStyle;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = -[HKTinkerSharingGizmoPermissionController initWithStyle:delegate:](v7, "initWithStyle:delegate:", layoutStyle, WeakRetained);

    -[HKTinkerSharingOptInController navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pushViewController:animated:", v10, 1);

  }
}

- (id)suggestedButtonTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HEALTH_TINKER_REQUEST_SHARING"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-tinker"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)alternateButtonTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HEALTH_TINKER_SKIP_SHARING"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-tinker"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)privacyBundles
{
  return &unk_1E9CE9C38;
}

- (id)tapToRadarMetadata
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D035F0]), "initWithComponent:", 2);
}

- (void)_presentNetworkAccessConfirmationWithHelper:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  HKTinkerSharingOptInController *v32;
  _QWORD v33[5];
  void *v34;
  uint64_t v35;
  _QWORD v36[3];

  v36[1] = *MEMORY[0x1E0C80C00];
  v29 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ENABLE_NETWORK_ACCESS_FOR_HEALTH_APP"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-tinker"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedAttributedStringForKey:value:table:", CFSTR("ENABLE_NETWORK_ACCESS_FOR_USER_%@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-tinker"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x1E0CB3498]);
  v35 = *MEMORY[0x1E0CB2C20];
  -[HKTinkerSharingOptInController termsOfAddress](self, "termsOfAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tinkerMember");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v6, "initWithFormat:options:locale:context:", v28, 0, 0, v9, v12);

  objc_msgSend(v26, "string");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v27, v25, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("DONT_ENABLE_NETWORK_ACCESS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-tinker"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __78__HKTinkerSharingOptInController__presentNetworkAccessConfirmationWithHelper___block_invoke;
  v33[3] = &unk_1E9C40288;
  v33[4] = self;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 1, v33);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v18);

  v19 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("ENABLE_NETWORK_ACCESS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-tinker"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v17;
  v30[1] = 3221225472;
  v30[2] = __78__HKTinkerSharingOptInController__presentNetworkAccessConfirmationWithHelper___block_invoke_2;
  v30[3] = &unk_1E9C412C8;
  v31 = v29;
  v32 = self;
  v22 = v29;
  objc_msgSend(v19, "actionWithTitle:style:handler:", v21, 0, v30);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v23);

  -[HKTinkerSharingOptInController navigationController](self, "navigationController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "presentViewController:animated:completion:", v13, 1, 0);

}

uint64_t __78__HKTinkerSharingOptInController__presentNetworkAccessConfirmationWithHelper___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "userDidRequestCancel");
}

uint64_t __78__HKTinkerSharingOptInController__presentNetworkAccessConfirmationWithHelper___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNetworkAccessEnabledForHealth:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "applyConfirmedOptin:", 1);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
