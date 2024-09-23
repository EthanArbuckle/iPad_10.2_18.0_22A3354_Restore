@implementation SFActionableSecurityRecommendationData

- (SFActionableSecurityRecommendationData)initWithAccountCellData:(id)a3 warning:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  SFActionableSecurityRecommendationData *v12;
  SFActionableSecurityRecommendationData *v13;
  void *v14;
  SFActionableSecurityRecommendationData *v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SFActionableSecurityRecommendationData;
  v12 = -[SFActionableSecurityRecommendationData init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accountCellData, a3);
    objc_storeStrong((id *)&v13->_warning, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
    -[SFAccountCellData savedAccount](v13->_accountCellData, "savedAccount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFActionableSecurityRecommendationData _fetchEligibleAccountModificationActionsForSavedAccount:](v13, "_fetchEligibleAccountModificationActionsForSavedAccount:", v14);

    v15 = v13;
  }

  return v13;
}

- (id)cellForTableView:(id)a3 forCellType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SFSecurityRecommendationInfoCell *v9;
  void *v10;
  SFSecurityRecommendationInfoCell *v11;
  SFSecurityRecommendationInfoCell *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
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
  void *v34;
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
  void *v45;
  void *v46;
  void *v47;
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[6];
  _QWORD v62[8];

  v62[6] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("highPriorityRecommendation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      v9 = v8;
    else
      v9 = -[SFSecurityRecommendationInfoCell initWithConfiguration:reuseIdentifier:]([SFSecurityRecommendationInfoCell alloc], "initWithConfiguration:reuseIdentifier:", 1, CFSTR("highPriorityRecommendation"));
    v12 = v9;

    v13 = -[WBSPasswordWarning issueTypes](self->_warning, "issueTypes");
    -[SFAccountCellData savedAccount](self->_accountCellData, "savedAccount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "user");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[SFAccountCellData highLevelDomain](self->_accountCellData, "highLevelDomain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = CFSTR("priority");
    v61[1] = CFSTR("domain");
    v62[0] = CFSTR("high");
    v62[1] = v16;
    v61[2] = CFSTR("user");
    v61[3] = CFSTR("reused");
    v17 = CFSTR("true");
    if ((v13 & 1) != 0)
      v18 = CFSTR("true");
    else
      v18 = CFSTR("false");
    v62[2] = v15;
    v62[3] = v18;
    v61[4] = CFSTR("weak");
    v61[5] = CFSTR("compromised");
    if ((v13 & 2) != 0)
      v19 = CFSTR("true");
    else
      v19 = CFSTR("false");
    if ((v13 & 0xC) == 0)
      v17 = CFSTR("false");
    v62[4] = v19;
    v62[5] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    WBSMakeAccessibilityIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSecurityRecommendationInfoCell setAccessibilityIdentifier:](v12, "setAccessibilityIdentifier:", v21);

    v59[0] = CFSTR("domain");
    v59[1] = CFSTR("user");
    v60[0] = v16;
    v60[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    WBSMakeAccessibilityIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSecurityRecommendationInfoCell titleLabel](v12, "titleLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAccessibilityIdentifier:", v23);

    v57[0] = CFSTR("domain");
    v57[1] = CFSTR("user");
    v58[0] = v16;
    v58[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    WBSMakeAccessibilityIdentifier();
    v26 = objc_claimAutoreleasedReturnValue();
    -[SFSecurityRecommendationInfoCell subtitleLabel](v12, "subtitleLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAccessibilityIdentifier:", v26);

    objc_msgSend(MEMORY[0x1E0C99EA0], "_pm_defaults");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v26) = objc_msgSend(v28, "_sf_passwordManagerIsInDemoMode");

    if ((v26 & 1) == 0)
    {
      -[SFSecurityRecommendationInfoCell subtitleLabel](v12, "subtitleLabel");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "layer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setDisableUpdateMask:", 18);

    }
  }
  else
  {
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("accountModificationAction"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v11 = v10;
    else
      v11 = (SFSecurityRecommendationInfoCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("accountModificationAction"));
    v12 = v11;

    -[SFSecurityRecommendationInfoCell textLabel](v12, "textLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "_setTextColorFollowsTintColor:", 1);

    +[_SFAccountManagerAppearanceValues buttonCellTextColor](_SFAccountManagerAppearanceValues, "buttonCellTextColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSecurityRecommendationInfoCell textLabel](v12, "textLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setTintColor:", v32);

    switch(objc_msgSend(v6, "unsignedIntValue"))
    {
      case 1u:
        -[SFAccountCellData warning](self->_accountCellData, "warning");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "issueTypes");

        _WBSLocalizedString();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSecurityRecommendationInfoCell textLabel](v12, "textLabel");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setText:", v41);

        v55[0] = CFSTR("domain");
        -[SFAccountCellData highLevelDomain](self->_accountCellData, "highLevelDomain");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v55[1] = CFSTR("user");
        v56[0] = v43;
        -[SFAccountCellData savedAccount](self->_accountCellData, "savedAccount");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "user");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v56[1] = v45;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        WBSMakeAccessibilityIdentifier();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSecurityRecommendationInfoCell setAccessibilityIdentifier:](v12, "setAccessibilityIdentifier:", v47);

        goto LABEL_25;
      case 2u:
        _WBSLocalizedString();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSecurityRecommendationInfoCell textLabel](v12, "textLabel");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setText:", v35);

        v53[0] = CFSTR("domain");
        -[SFAccountCellData highLevelDomain](self->_accountCellData, "highLevelDomain");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v53[1] = CFSTR("user");
        v54[0] = v41;
        -[SFAccountCellData savedAccount](self->_accountCellData, "savedAccount");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "user");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v54[1] = v44;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      case 4u:
        _WBSLocalizedString();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSecurityRecommendationInfoCell textLabel](v12, "textLabel");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setText:", v37);

        v51[0] = CFSTR("domain");
        -[SFAccountCellData highLevelDomain](self->_accountCellData, "highLevelDomain");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v51[1] = CFSTR("user");
        v52[0] = v41;
        -[SFAccountCellData savedAccount](self->_accountCellData, "savedAccount");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "user");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v52[1] = v44;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      case 8u:
        _WBSLocalizedString();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSecurityRecommendationInfoCell textLabel](v12, "textLabel");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setText:", v39);

        -[SFAccountCellData highLevelDomain](self->_accountCellData, "highLevelDomain", CFSTR("domain"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v49[1] = CFSTR("user");
        v50[0] = v41;
        -[SFAccountCellData savedAccount](self->_accountCellData, "savedAccount");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "user");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v50[1] = v44;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:
        WBSMakeAccessibilityIdentifier();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSecurityRecommendationInfoCell setAccessibilityIdentifier:](v12, "setAccessibilityIdentifier:", v46);
LABEL_25:

        break;
      default:
        break;
    }
    -[SFSecurityRecommendationInfoCell textLabel](v12, "textLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNumberOfLines:", 0);
  }

  return v12;
}

- (NSArray)items
{
  void *v3;
  SFActionableSecurityRecommendationCellID *v4;
  void *v5;
  SFActionableSecurityRecommendationCellID *v6;
  void *v7;
  SFActionableSecurityRecommendationCellID *v8;
  void *v9;
  unint64_t eligibleAccountModificationActions;
  SFActionableSecurityRecommendationCellID *v12;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = -[SFActionableSecurityRecommendationCellID initWithCellType:]([SFActionableSecurityRecommendationCellID alloc], "initWithCellType:", self->_accountCellData);
  objc_msgSend(v3, "arrayWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_WORD *)&self->_didUpgradeToSignInWithApple)
  {
    v6 = [SFActionableSecurityRecommendationCellID alloc];
    v7 = &unk_1E4B260B0;
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&dataLock);
    eligibleAccountModificationActions = self->_eligibleAccountModificationActions;
    os_unfair_lock_unlock((os_unfair_lock_t)&dataLock);
    if ((eligibleAccountModificationActions & 4) != 0)
    {
      v12 = -[SFActionableSecurityRecommendationCellID initWithCellType:]([SFActionableSecurityRecommendationCellID alloc], "initWithCellType:", &unk_1E4B260C8);
      objc_msgSend(v5, "addObject:", v12);

      self->_isUpgradeToSignInWithAppleAvailable = 1;
    }
    v6 = [SFActionableSecurityRecommendationCellID alloc];
    if ((eligibleAccountModificationActions & 2) != 0)
      v7 = &unk_1E4B260E0;
    else
      v7 = &unk_1E4B260F8;
  }
  v8 = -[SFActionableSecurityRecommendationCellID initWithCellType:](v6, "initWithCellType:", v7);
  objc_msgSend(v5, "addObject:", v8);

  v9 = (void *)objc_msgSend(v5, "copy");
  return (NSArray *)v9;
}

- (void)_fetchEligibleAccountModificationActionsForSavedAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0C925F8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountCellData highLevelDomain](self->_accountCellData, "highLevelDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __98__SFActionableSecurityRecommendationData__fetchEligibleAccountModificationActionsForSavedAccount___block_invoke;
  v8[3] = &unk_1E4AC7E48;
  objc_copyWeak(&v10, &location);
  v7 = v4;
  v9 = v7;
  objc_msgSend(v5, "extensionForDomain:completionHandler:", v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __98__SFActionableSecurityRecommendationData__fetchEligibleAccountModificationActionsForSavedAccount___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id *v5;
  id *WeakRetained;
  id *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;

  v4 = a2;
  v5 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (v4 && WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&dataLock);
    objc_storeStrong(v7 + 5, a2);
    objc_msgSend(v4, "attributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "safari_BOOLForKey:", *MEMORY[0x1E0D8A078]) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D8A9E0], "sharedMonitor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isKeychainSyncEnabled");

      if (v10)
        v7[4] = (id)((unint64_t)v7[4] | 2);
    }
    else
    {

    }
    v11 = objc_loadWeakRetained(v7 + 6);
    if ((objc_msgSend(*(id *)(a1 + 32), "credentialTypes") & 2) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "_pm_defaults");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "_sf_passwordManagerIsInDemoMode");

      if (!v13)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)&dataLock);
        objc_msgSend(v4, "attributes");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "safari_BOOLForKey:", *MEMORY[0x1E0D8A080]);

        if (v17)
        {
          v18 = objc_alloc_init(MEMORY[0x1E0D00158]);
          v19 = (void *)MEMORY[0x1E0CB34D0];
          objc_msgSend(v4, "_plugIn");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "containingUrl");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "bundleWithURL:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "bundleIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __98__SFActionableSecurityRecommendationData__fetchEligibleAccountModificationActionsForSavedAccount___block_invoke_2;
          v24[3] = &unk_1E4AC0A40;
          objc_copyWeak(&v25, v5);
          objc_msgSend(v18, "getCredentialStateForClientID:completion:", v23, v24);
          objc_destroyWeak(&v25);

        }
        goto LABEL_12;
      }
      objc_msgSend(v4, "attributes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "safari_BOOLForKey:", *MEMORY[0x1E0D8A080]);

      if (v15)
        v7[4] = (id)((unint64_t)v7[4] | 4);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&dataLock);
    objc_msgSend(v11, "actionableSecurityRecommendationDataDidUpdate:", v7);
LABEL_12:

  }
}

void __98__SFActionableSecurityRecommendationData__fetchEligibleAccountModificationActionsForSavedAccount___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  NSObject *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&dataLock);
    if (a3)
    {
      v6 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __98__SFActionableSecurityRecommendationData__fetchEligibleAccountModificationActionsForSavedAccount___block_invoke_2_cold_1((uint64_t)WeakRetained, v6);
    }
    if (a2 == 2)
      *((_QWORD *)WeakRetained + 4) |= 4uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)&dataLock);
    v7 = objc_loadWeakRetained((id *)WeakRetained + 6);
    objc_msgSend(v7, "actionableSecurityRecommendationDataDidUpdate:", WeakRetained);

  }
}

- (SFAccountCellData)accountCellData
{
  return self->_accountCellData;
}

- (WBSPasswordWarning)warning
{
  return self->_warning;
}

- (unint64_t)eligibleAccountModificationActions
{
  return self->_eligibleAccountModificationActions;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (BOOL)isUpgradeToSignInWithAppleAvailable
{
  return self->_isUpgradeToSignInWithAppleAvailable;
}

- (SFActionableSecurityRecommendationDataDelegate)delegate
{
  return (SFActionableSecurityRecommendationDataDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)didUpgradeToSignInWithApple
{
  return self->_didUpgradeToSignInWithApple;
}

- (void)setDidUpgradeToSignInWithApple:(BOOL)a3
{
  self->_didUpgradeToSignInWithApple = a3;
}

- (BOOL)didUpgradeToStrongPassword
{
  return self->_didUpgradeToStrongPassword;
}

- (void)setDidUpgradeToStrongPassword:(BOOL)a3
{
  self->_didUpgradeToStrongPassword = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_warning, 0);
  objc_storeStrong((id *)&self->_accountCellData, 0);
}

void __98__SFActionableSecurityRecommendationData__fetchEligibleAccountModificationActionsForSavedAccount___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 40);
  v3 = a2;
  objc_msgSend(v2, "_plugIn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedContainingName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v5;
  _os_log_error_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_ERROR, "Failed to get Sign in with Apple authorization credential state for %@", (uint8_t *)&v6, 0xCu);

}

@end
