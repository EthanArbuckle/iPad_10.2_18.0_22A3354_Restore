@implementation AAUrlBagHelper

+ (BOOL)canRepairCustodian
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  char v7;
  int v8;
  NSObject *v9;
  BOOL v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D002A0], "sharedBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationAtKey:", CFSTR("custodianCfgsV2"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v3;
    _os_log_impl(&dword_19EACA000, v4, OS_LOG_TYPE_DEFAULT, "custodianCfgsV2 from urlbag: %@", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("canRepairCustodianV2"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    _AALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v5;
      _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "Returning canRepairCustodianV2 from urlbag: %@", (uint8_t *)&v12, 0xCu);
    }

    v7 = objc_msgSend(v5, "BOOLValue");
  }
  else
  {
    v8 = _os_feature_enabled_impl();
    _AALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 67109120;
      LODWORD(v13) = v8;
      _os_log_impl(&dword_19EACA000, v9, OS_LOG_TYPE_DEFAULT, "Returning canRepairCustodian based on feature flag: %d", (uint8_t *)&v12, 8u);
    }

    v7 = _os_feature_enabled_impl();
  }
  v10 = v7;

  return v10;
}

+ (BOOL)canRepairBeneficiary
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D002A0], "sharedBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationAtKey:", CFSTR("inheritanceCfgs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_impl(&dword_19EACA000, v4, OS_LOG_TYPE_DEFAULT, "inheritanceCfgs from urlbag: %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("canRepairBeneficiaries"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    _AALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "Returning canRepairBeneficiary from urlbag: %@", (uint8_t *)&v9, 0xCu);
    }

    LOBYTE(v6) = objc_msgSend(v5, "BOOLValue");
  }
  else
  {
    LODWORD(v6) = _os_feature_enabled_impl();
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 67109120;
      LODWORD(v10) = (_DWORD)v6;
      _os_log_impl(&dword_19EACA000, v7, OS_LOG_TYPE_DEFAULT, "Returning canRepairCustodian based on feature flag: %d", (uint8_t *)&v9, 8u);
    }

  }
  return (char)v6;
}

+ (int64_t)maxRepairCount
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  int64_t v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D002A0], "sharedBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationAtKey:", CFSTR("custodianCfgsV2"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_19EACA000, v4, OS_LOG_TYPE_DEFAULT, "custodianCfgsV2 from urlbag: %@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("maxRepairCountV2"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "Returning maxRepairCountV2 from urlbag: %@", (uint8_t *)&v10, 0xCu);
    }

    v8 = objc_msgSend(v5, "integerValue");
  }
  else
  {
    if (v7)
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "Returning maxRepairCount default value: 1", (uint8_t *)&v10, 2u);
    }

    v8 = 1;
  }

  return v8;
}

+ (int64_t)maxRepairCountForBeneficiaries
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  int64_t v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D002A0], "sharedBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationAtKey:", CFSTR("inheritanceCfgs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_19EACA000, v4, OS_LOG_TYPE_DEFAULT, "beneficiaryCfgs from urlbag: %@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("maxRepairCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "Returning maxRepairCount from urlbag: %@", (uint8_t *)&v10, 0xCu);
    }

    v8 = objc_msgSend(v5, "integerValue");
  }
  else
  {
    if (v7)
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "Returning maxRepairCount default value: 1", (uint8_t *)&v10, 2u);
    }

    v8 = 1;
  }

  return v8;
}

+ (BOOL)isLCInviteAcceptanceEnabled
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D002A0], "sharedBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationAtKey:", CFSTR("inheritanceCfgs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_impl(&dword_19EACA000, v4, OS_LOG_TYPE_DEFAULT, "LCInvite: inheritanceCfgs from urlbag: %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("inviteAcceptance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    _AALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "LCInvite: Returning LCInviteAcceptance from urlbag: %@", (uint8_t *)&v9, 0xCu);
    }

    LOBYTE(v6) = objc_msgSend(v5, "BOOLValue");
  }
  else
  {
    LODWORD(v6) = _os_feature_enabled_impl();
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 67109120;
      LODWORD(v10) = (_DWORD)v6;
      _os_log_impl(&dword_19EACA000, v7, OS_LOG_TYPE_DEFAULT, "LCInvite: No IdMS feature flag found. is OS FeatureFlag Enabled %d", (uint8_t *)&v9, 8u);
    }

  }
  return (char)v6;
}

@end
