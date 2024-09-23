@implementation HULockAccessUpdateViewController

- (HULockAccessUpdateViewController)initWithHome:(id)a3
{
  id v5;
  HULockAccessUpdateViewController *v6;
  HULockAccessUpdateViewController *v7;
  void *v8;
  uint64_t v9;
  NAFuture *preloadFuture;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HULockAccessUpdateViewController;
  v6 = -[HULockAccessUpdateViewController initWithTitle:detailText:icon:contentLayout:](&v16, sel_initWithTitle_detailText_icon_contentLayout_, &stru_1E6F60E80, 0, 0, 2);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    objc_initWeak(&location, v7);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __49__HULockAccessUpdateViewController_initWithHome___block_invoke;
    v12[3] = &unk_1E6F5C690;
    objc_copyWeak(&v14, &location);
    v13 = v5;
    objc_msgSend(v8, "flatMap:", v12);
    v9 = objc_claimAutoreleasedReturnValue();
    preloadFuture = v7->_preloadFuture;
    v7->_preloadFuture = (NAFuture *)v9;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v7;
}

id __49__HULockAccessUpdateViewController_initWithHome___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  void *v34;
  int v36;
  int v37;
  void *v38;
  int v39;
  void *v40;
  id WeakRetained;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  int v55;
  __int16 v56;
  int v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  int v63;
  __int16 v64;
  int v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "hf_walletKeyAccessories");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(*(id *)(a1 + 32), "hf_currentUserIsAdministrator");
  if ((objc_msgSend(*(id *)(a1 + 32), "hasOnboardedForWalletKey") & 1) != 0 || !objc_msgSend(v40, "count"))
  {
    v39 = 0;
  }
  else if (v2 && (objc_msgSend(*(id *)(a1 + 32), "hf_hasHomeHubSupportingWalletKey") & 1) != 0)
  {
    v39 = 1;
  }
  else
  {
    v39 = objc_msgSend(*(id *)(a1 + 32), "hf_currentUserIsOwner");
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "hasOnboardedForAccessCode") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "hf_accessoriesSupportingAccessCodes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      if (v2 && (objc_msgSend(*(id *)(a1 + 32), "hf_hasHomeHubSupportingAccessCodes") & 1) != 0)
        v3 = 1;
      else
        v3 = objc_msgSend(*(id *)(a1 + 32), "hf_currentUserIsOwner");
    }
    else
    {
      v3 = 0;
    }

  }
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 36.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v39 & v3) == 1)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HULockAccessUpdate_Feature_All_Title"), CFSTR("HULockAccessUpdate_Feature_All_Title"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HULockAccessUpdate_Feature_All_Description"), CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
    objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:withConfiguration:", CFSTR("apple.homekey.fill"), v5);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v39)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HULockAccessUpdate_Feature_WalletKey_TapToUnlock_Title"), CFSTR("HULockAccessUpdate_Feature_WalletKey_TapToUnlock_Title"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HULockAccessUpdate_Feature_WalletKey_Description"), CFSTR("HULockAccessUpdate_Feature_WalletKey_Description"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (!v3)
  {
    v6 = 0;
    v14 = 0;
    v16 = 0;
    v18 = 0;
    goto LABEL_36;
  }
  _HULocalizedStringWithDefaultValue(CFSTR("HULockAccessUpdate_Feature_AccessCode_Title"), CFSTR("HULockAccessUpdate_Feature_AccessCode_Title"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HULockAccessUpdate_Feature_AccessCode_Description"), CFSTR("HULockAccessUpdate_Feature_AccessCode_Description"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("circle.grid.3x3.circle.fill"), v5);
  v15 = objc_claimAutoreleasedReturnValue();
LABEL_22:
  v16 = (void *)v15;
  if (v6)
    v17 = v14 == 0;
  else
    v17 = 1;
  v18 = !v17;
  if (!v17 && v15)
    objc_msgSend(WeakRetained, "addBulletedListItemWithTitle:description:image:", v6, v14, v15);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("person.2.fill"), v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HULockAccessUpdate_Feature_GuestAccess_Title"), CFSTR("HULockAccessUpdate_Feature_GuestAccess_Title"), 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HULockAccessUpdate_Feature_GuestAccess_Description"), CFSTR("HULockAccessUpdate_Feature_GuestAccess_Description"), 1);
    v21 = v16;
    v22 = v14;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "addBulletedListItemWithTitle:description:image:", v20, v23, v19);

    v14 = v22;
    v16 = v21;

  }
LABEL_36:
  HFLogForCategory();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    if (v18)
      v25 = &stru_1E6F60E80;
    else
      v25 = CFSTR("Conditions not met for showing WalletKey OR PIN Code screen.");
    v37 = objc_msgSend(*(id *)(a1 + 32), "hasOnboardedForWalletKey");
    v36 = objc_msgSend(*(id *)(a1 + 32), "hf_hasHomeHubSupportingWalletKey");
    v26 = v14;
    v27 = v5;
    v28 = objc_msgSend(*(id *)(a1 + 32), "hf_currentUserIsOwner");
    v38 = v6;
    v29 = v3;
    v30 = v16;
    v31 = objc_msgSend(*(id *)(a1 + 32), "hasOnboardedForAccessCode");
    objc_msgSend(*(id *)(a1 + 32), "hf_accessoriesSupportingAccessCodes");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(*(id *)(a1 + 32), "hf_hasHomeHubSupportingAccessCodes");
    *(_DWORD *)buf = 138415106;
    v44 = 2080;
    v43 = WeakRetained;
    v45 = "-[HULockAccessUpdateViewController initWithHome:]_block_invoke";
    v46 = 2112;
    v47 = v25;
    v48 = 1024;
    v49 = v37;
    v50 = 2112;
    v51 = v40;
    v52 = 1024;
    v53 = v36;
    v54 = 1024;
    v55 = v28;
    v5 = v27;
    v14 = v26;
    v56 = 1024;
    v57 = v31;
    v16 = v30;
    v58 = 2112;
    v59 = v32;
    v60 = 1024;
    v61 = v33;
    v62 = 1024;
    v63 = v39;
    v64 = 1024;
    v65 = v29;
    v6 = v38;
    _os_log_impl(&dword_1B8E1E000, v24, OS_LOG_TYPE_DEFAULT, "(%@:%s) %@ hasOnboardedForWalletKey: %{BOOL}d. walletKeyAccessories: %@, hasHomeHubSupportingWalletKey: %{BOOL}d, currentUserIsOwner: %{BOOL}d, hasOnboardedForAccessCode: %{BOOL}d, accessoriesSupportingAccessCodes: %@, hasHomeHubSupportingAccessCodes: %{BOOL}d, showWalletKeyTapToUnlockFeature: %{BOOL}d, showAccessCodeFeature: %{BOOL}d", buf, 0x5Eu);

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (HMHome)home
{
  return self->_home;
}

- (NAFuture)preloadFuture
{
  return self->_preloadFuture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preloadFuture, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
