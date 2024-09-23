@implementation HKTinkerSharingSyncSetupController

- (HKTinkerSharingSyncSetupController)initWithStyle:(int64_t)a3 delegate:(id)a4
{
  id v6;
  HKTinkerSharingSyncSetupController *v7;
  HKTinkerSharingSyncSetupController *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HKTinkerSharingSyncSetupController;
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
  v7.super_class = (Class)HKTinkerSharingSyncSetupController;
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

    -[HKTinkerSharingSyncSetupController setupSharing](self, "setupSharing");
    -[HKTinkerSharingSyncSetupController setModalInPresentation:](self, "setModalInPresentation:", 1);
  }

}

- (void)setupSharing
{
  NSObject *v4;
  void *v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  v5 = (void *)objc_opt_class();
  v6 = v5;
  WeakRetained = objc_loadWeakRetained(a3);
  objc_msgSend(WeakRetained, "tinkerMember");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_loadWeakRetained(a3);
  objc_msgSend(v9, "guardianMember");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 138543874;
  v12 = v5;
  v13 = 2112;
  v14 = v8;
  v15 = 2112;
  v16 = v10;
  _os_log_error_impl(&dword_1D7813000, v4, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@ Family member not found for this pairing, bailing. tinkerMember: %@, guardianMember: %@ (#t0)", (uint8_t *)&v11, 0x20u);

}

void __50__HKTinkerSharingSyncSetupController_setupSharing__block_invoke(_QWORD *a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  char v18;
  _QWORD v19[5];
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    *(_DWORD *)buf = 138543618;
    v21 = (id)objc_opt_class();
    v22 = 2112;
    v23 = v5;
    v8 = v21;
    _os_log_impl(&dword_1D7813000, v7, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Done with Tinker Health Sync Setup, got Error: %@", buf, 0x16u);

  }
  v9 = a1[6] != 2 || a2 == 0;
  v10 = MEMORY[0x1E0C809B0];
  if (!v9)
  {
    v11 = (void *)a1[5];
    WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 1272));
    objc_msgSend(WeakRetained, "tinkerDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pairingID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __50__HKTinkerSharingSyncSetupController_setupSharing__block_invoke_204;
    v19[3] = &unk_1E9C3FB40;
    v19[4] = a1[4];
    objc_msgSend(v11, "performEndToEndCloudSyncWithNRDeviceUUID:syncParticipantFirst:completion:", v14, 0, v19);

  }
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __50__HKTinkerSharingSyncSetupController_setupSharing__block_invoke_210;
  v16[3] = &unk_1E9C3FE60;
  v18 = a2;
  v16[4] = a1[4];
  v17 = v5;
  v15 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v16);

}

void __50__HKTinkerSharingSyncSetupController_setupSharing__block_invoke_204(uint64_t a1, int a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  id v9;
  int v10;
  void *v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = CFSTR("NO");
    v10 = 138543874;
    v11 = v7;
    v12 = 2114;
    if (a2)
      v8 = CFSTR("YES");
    v13 = v8;
    v14 = 2114;
    v15 = v4;
    v9 = v7;
    _os_log_impl(&dword_1D7813000, v6, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Done with Tinker end to end Cloud Sync, success: %{public}@, error: %{public}@", (uint8_t *)&v10, 0x20u);

  }
}

uint64_t __50__HKTinkerSharingSyncSetupController_setupSharing__block_invoke_210(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "setupDidSucceed");
  else
    return objc_msgSend(v3, "setupDidFailWithError:", *(_QWORD *)(a1 + 40));
}

- (void)setupDidSucceed
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sharingSetupDidSucceed");

}

- (void)setupDidFailWithError:(id)a3
{
  HKTinkerSharingSetupDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "sharingSetupDidFailWithError:", v4);

}

+ (BOOL)controllerNeedsToRun
{
  return 1;
}

- (BOOL)controllerAllowsNavigatingBackFrom
{
  return 0;
}

- (BOOL)controllerAllowsNavigatingBackTo
{
  return 0;
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
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("TINKER_HEALTH_SYNC_SETUP_HOLD_DESCRIPTION"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-tinker"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)suggestedButtonTitle
{
  return 0;
}

- (id)imageResource
{
  return CFSTR("health-80");
}

- (id)_tinkerUserDateOfBirthComponents
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tinkerMember");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("member-date-of-birth"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v6 / 1000.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithUTCTimeZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hk_dateOfBirthDateComponentsWithDate:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCalendar:", v10);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)tapToRadarMetadata
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D035F0]), "initWithComponent:", 2);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
