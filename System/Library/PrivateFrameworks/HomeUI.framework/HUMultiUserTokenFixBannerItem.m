@implementation HUMultiUserTokenFixBannerItem

- (void)setHomeMediaAccount:(id)a3
{
  objc_storeStrong((id *)&self->_homeMediaAccount, a3);
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  char v11;
  BOOL v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v31[2];
  _QWORD v32[2];
  uint64_t v33;
  uint64_t v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30910]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) != 0)
    goto LABEL_10;
  -[HUMultiUserTokenFixBannerItem homeMediaAccount](self, "homeMediaAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUBannerItem home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentUser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "needsiTunesMultiUserRepair");

  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v36 = v6;
    v37 = 1024;
    v38 = v9;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "mediaAccount = [%@]. needsiTunesMultiUserRepair = [%d]", buf, 0x12u);
  }

  v11 = 0;
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) == 0 && v6 && ((v9 ^ 1) & 1) == 0)
    v11 = !-[HUMultiUserTokenFixBannerItem forceHidden](self, "forceHidden");
  v12 = -[HUBannerItem forceShowBanner](self, "forceShowBanner");

  if (v12 || (v11 & 1) != 0)
  {
    v15 = (void *)objc_opt_new();
    _HULocalizedStringWithDefaultValue(CFSTR("HUSetupCellMultiUserTokenFix_Title"), CFSTR("HUSetupCellMultiUserTokenFix_Title"), 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D30D18]);

    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("Home.Banners.MultiUserTokenFix.SignIntoAppleMusic"), *MEMORY[0x1E0D30BA0]);
    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("HUSetupCellMultiUserTokenFix_Title"), *MEMORY[0x1E0D30D20]);
    _HULocalizedStringWithDefaultValue(CFSTR("HUSetupCellMultiUserTokenFix_Details"), CFSTR("HUSetupCellMultiUserTokenFix_Details"), 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D30BF8]);

    _HULocalizedStringWithDefaultValue(CFSTR("HUSetupCellSignIn"), CFSTR("HUSetupCellSignIn"), 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D30BC0]);

    v21 = objc_alloc(MEMORY[0x1E0D31558]);
    v22 = *MEMORY[0x1E0D30850];
    v31[0] = *MEMORY[0x1E0D30858];
    v31[1] = v22;
    v23 = *MEMORY[0x1E0D307B8];
    v32[0] = *MEMORY[0x1E0D307C0];
    v32[1] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v21, "initWithImageIdentifiersKeyedBySize:", v24);
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0D30C60]);

    v26 = (void *)MEMORY[0x1E0C99E60];
    -[HUBannerItem home](self, "home");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "currentUser");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "na_setWithSafeObject:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0D30B80]);

    objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_1E7041248, CFSTR("bannerItemCategory"));
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_10:
    v13 = (void *)MEMORY[0x1E0D519C0];
    v14 = objc_alloc(MEMORY[0x1E0D314B8]);
    v33 = *MEMORY[0x1E0D30D70];
    v34 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithResults:", v15);
    objc_msgSend(v13, "futureWithResult:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

- (ACAccount)homeMediaAccount
{
  return self->_homeMediaAccount;
}

- (BOOL)forceHidden
{
  return self->_forceHidden;
}

- (void)setForceHidden:(BOOL)a3
{
  self->_forceHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeMediaAccount, 0);
}

@end
