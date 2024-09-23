@implementation HMHomeManager(HFAdditions)

- (unint64_t)hf_hasDetectediCloudIssue
{
  if (objc_msgSend(a1, "dataSyncState") == 1)
    return ((unint64_t)objc_msgSend(a1, "status") >> 5) & 1;
  else
    return 1;
}

- (uint64_t)hf_lastNewFeaturesViewVersionSeen
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "_cached_lastOnboardingNewFeaturesVersionSeenNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(a1, "applicationData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("lastOnboardingNewFeaturesVersionSeen"));
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = objc_msgSend(v4, "integerValue");
  else
    v6 = 0;

  return v6;
}

- (uint64_t)hf_hasSeenOnboardingWelcomeView
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(9uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1, "_cached_hasSeenOnboardingWelcomeViewNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "applicationData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("hasSeenOnboardingWelcomeView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v3;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "*** Cached_hasSeenOnboardingWelcomeViewNumber =  [%@] - applicationData = [%@] ***", (uint8_t *)&v15, 0x16u);

  }
  HFLogForCategory(9uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1, "applicationData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v8;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "*** applicationData = [%@] ***", (uint8_t *)&v15, 0xCu);

  }
  objc_msgSend(a1, "_cached_hasSeenOnboardingWelcomeViewNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(a1, "applicationData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("hasSeenOnboardingWelcomeView"));
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = objc_msgSend(v11, "BOOLValue");
  else
    v13 = 0;

  return v13;
}

- (id)hf_homeWithIdentifier:()HFAdditions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "homes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__HMHomeManager_HFAdditions__hf_homeWithIdentifier___block_invoke;
  v9[3] = &unk_1EA72B630;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HFMutableReorderableHomeKitItemList)hf_mutableOrderedHomesList
{
  HFMutableReorderableHomeKitItemList *v4;

  objc_getAssociatedObject(a1, a2);
  v4 = (HFMutableReorderableHomeKitItemList *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = -[HFReorderableHomeKitItemList initWithApplicationDataContainer:category:]([HFMutableReorderableHomeKitItemList alloc], "initWithApplicationDataContainer:category:", a1, CFSTR("OrderedHomes"));
    objc_setAssociatedObject(a1, a2, v4, (void *)1);
  }
  return v4;
}

- (id)hf_orderedHomesList
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hf_mutableOrderedHomesList");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "copy");

  return v2;
}

- (id)hf_orderedHomes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "homes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hf_mutableOrderedHomesList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedHomeKitObjectComparator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)hf_setOrderedHomes:()HFAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "hf_mutableOrderedHomesList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortedHomeKitObjects:", v4);

  objc_msgSend(a1, "hf_mutableOrderedHomesList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "saveWithSender:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)hf_homeFutureForName:()HFAdditions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allHomesFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__HMHomeManager_HFAdditions__hf_homeFutureForName___block_invoke;
  v9[3] = &unk_1EA72ADB0;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v5, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hf_homeForURL:()HFAdditions
{
  id v4;
  HFURLComponents *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = -[HFURLComponents initWithURL:]([HFURLComponents alloc], "initWithURL:", v4);

  -[HFURLComponents valueForParameter:](v5, "valueForParameter:", CFSTR("homeid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(a1, "homes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __44__HMHomeManager_HFAdditions__hf_homeForURL___block_invoke;
    v10[3] = &unk_1EA72B630;
    v11 = v6;
    objc_msgSend(v7, "na_firstObjectPassingTest:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)hf_homeForName:()HFAdditions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(a1, "hf_orderedHomes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__HMHomeManager_HFAdditions__hf_homeForName___block_invoke;
  v10[3] = &unk_1EA72B630;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_filter:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") == 1)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)hf_setHasSeenOnboardingWelcomeView:()HFAdditions
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  char v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(9uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "*** Setting HasSeenOnboardingWelcomeView =  [%@]  ***", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "applicationData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("hasSeenOnboardingWelcomeView"));

  objc_msgSend(a1, "set_cached_hasSeenOnboardingWelcomeViewNumber:", v7);
  objc_msgSend(a1, "hf_updateApplicationDataFuture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__HMHomeManager_HFAdditions__hf_setHasSeenOnboardingWelcomeView___block_invoke;
  v13[3] = &unk_1EA72D098;
  v15 = a3;
  v13[4] = a1;
  v14 = v7;
  v10 = v7;
  objc_msgSend(v9, "addCompletionBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)hf_setSeenNewFeaturesViewVersion:()HFAdditions
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;

  if (objc_msgSend(a1, "hf_lastNewFeaturesViewVersionSeen") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "applicationData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("lastOnboardingNewFeaturesVersionSeen"));

    objc_msgSend(a1, "set_cached_lastOnboardingNewFeaturesVersionSeenNumber:", v6);
    objc_msgSend(a1, "hf_updateApplicationDataFuture");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __63__HMHomeManager_HFAdditions__hf_setSeenNewFeaturesViewVersion___block_invoke;
    v11[3] = &unk_1EA72D0C0;
    v12 = v6;
    v13 = a3;
    v11[4] = a1;
    v9 = v6;
    objc_msgSend(v8, "addCompletionBlock:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)hf_updateApplicationDataFuture
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __60__HMHomeManager_HFAdditions__hf_updateApplicationDataFuture__block_invoke;
  v2[3] = &unk_1EA7268C8;
  v2[4] = a1;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)hf_enableEventLogOnboardingFlag
{
  id v1;

  objc_msgSend(a1, "homes");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_each:", &__block_literal_global_52);

}

- (uint64_t)hf_canAccessHomeRemotely:()HFAdditions
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(a1, "residentProvisioningStatus") & 1) != 0)
  {
    HFLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v4;
      v7 = "No remote access to %@. Some resident on the account needs 2FA.";
      goto LABEL_15;
    }
  }
  else
  {
    v5 = objc_msgSend(v4, "hf_remoteAccessState");
    if ((objc_msgSend(a1, "residentProvisioningStatus") & 2) != 0 && v5 == 1)
    {
      HFLogForCategory(0);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v10 = 138412290;
        v11 = v4;
        v7 = "No remote access to %@. A resident that cannot be seen requires a key transfer and there are no enabled res"
             "ident devices on the account.";
LABEL_15:
        _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v10, 0xCu);
      }
    }
    else
    {
      if (v5 != 1 || (objc_msgSend(v4, "hf_isCurrentLocationHome") & 1) != 0)
      {
        v8 = 1;
        goto LABEL_8;
      }
      HFLogForCategory(0);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v10 = 138412290;
        v11 = v4;
        v7 = "No remote access to %@. there are no enabled resident devices on the account and the user is not home.";
        goto LABEL_15;
      }
    }
  }

  v8 = 0;
LABEL_8:

  return v8;
}

@end
