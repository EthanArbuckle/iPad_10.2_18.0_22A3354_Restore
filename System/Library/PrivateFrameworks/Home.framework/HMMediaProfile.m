@implementation HMMediaProfile

uint64_t __67__HMMediaProfile_AbstractionAdditions__hf_containedCharacteristics__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_containedCharacteristics");
}

uint64_t __66__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_isReachable__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  int v4;

  v2 = a2;
  v3 = objc_msgSend(v2, "isReachable");
  v4 = objc_msgSend(v2, "hf_fakeUnreachableError");

  return v3 & ~v4;
}

uint64_t __76__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_isAppleMusicReachable__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "remoteLoginHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isControllable");

  return v3;
}

uint64_t __83__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_isAccessorySettingsReachable__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isControllable");

  return v3;
}

void __87__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_homePodSupportsMultiUserLanguage__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  __int128 v8;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0CFE9B0]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __87__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_homePodSupportsMultiUserLanguage__block_invoke_2;
  v6[3] = &unk_1EA73A080;
  v7 = v3;
  v8 = *(_OWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v4, "fetchSupportedMultiUserLanguageCodes:", v6);

}

void __87__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_homePodSupportsMultiUserLanguage__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  HFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v14;
      v19 = 2112;
      v20 = v6;
      _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "%@ Error fetching voice recognition languages [%@]", (uint8_t *)&v17, 0x16u);

    }
    v9 = *(void **)(a1 + 32);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v15 = *(void **)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412802;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      v21 = 2112;
      v22 = v5;
      _os_log_debug_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEBUG, "%@:%@ Supported voice recognition languages %@", (uint8_t *)&v17, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "hf_backingAccessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hf_supportsMultiUserLanguage:", v5);

    v12 = *(void **)(a1 + 32);
    if ((v11 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 45);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "finishWithError:", v13);

      goto LABEL_10;
    }
    v9 = v12;
  }
  objc_msgSend(v9, "finishWithNoResult");
LABEL_10:

}

void __106__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_homePodMediaAccountIsMismatchedWithHomeMediaAccount__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[HFAppleMusicHomeAccountManager sharedInstance](HFAppleMusicHomeAccountManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaAccountForHomeIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_opt_class();
    v10 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    objc_msgSend(*(id *)(a1 + 32), "hf_appleMusicCurrentLoggedInAccount");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ams_altDSID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ams_altDSID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqualToString:", v15);

    HFLogForCategory(5uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "hf_appleMusicCurrentLoggedInAccount");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v33 = v18;
      v34 = 2112;
      v35 = v19;
      v36 = 1024;
      v37 = v16 ^ 1;
      v38 = 2112;
      v39 = v12;
      v40 = 2112;
      v41 = v20;
      _os_log_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_DEFAULT, "%@:%@ Accounts are split/mismatched = [%d], homeMediaAccount = [%@], HomePod Media Account = [%@] ", buf, 0x30u);

    }
    if ((v16 & 1) != 0)
    {
      objc_msgSend(v3, "finishWithNoResult");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 56);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "finishWithError:", v27);

    }
  }
  else
  {
    +[HFAppleMusicHomeAccountManager sharedInstance](HFAppleMusicHomeAccountManager, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "home");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "executeHomeMediaAccountFetchForHome:", v23);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __106__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_homePodMediaAccountIsMismatchedWithHomeMediaAccount__block_invoke_2;
    v28[3] = &unk_1EA73A1F0;
    v31 = *(_QWORD *)(a1 + 40);
    v24 = v3;
    v25 = *(_QWORD *)(a1 + 32);
    v29 = v24;
    v30 = v25;
    v26 = (id)objc_msgSend(v12, "addCompletionBlock:", v28);

  }
}

void __106__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_homePodMediaAccountIsMismatchedWithHomeMediaAccount__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  _BYTE v35[14];
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  HFLogForCategory(5uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412546;
      v31 = v29;
      v32 = 2112;
      v33 = v6;
      _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "%@ Error fetching mediaAccount for HomePod [%@]", (uint8_t *)&v30, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412802;
      v31 = v9;
      v32 = 2112;
      v33 = v10;
      v34 = 2112;
      *(_QWORD *)v35 = v5;
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ Fetched Media Account [%@]", (uint8_t *)&v30, 0x20u);

    }
    objc_opt_class();
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    objc_msgSend(*(id *)(a1 + 40), "hf_appleMusicCurrentLoggedInAccount");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = 0;
    if (v18 && v17)
    {
      objc_msgSend(v18, "ams_altDSID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "ams_altDSID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v21, "isEqualToString:", v22) ^ 1;

    }
    HFLogForCategory(5uLL);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = *(void **)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "hf_appleMusicCurrentLoggedInAccount");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138413314;
      v31 = v24;
      v32 = 2112;
      v33 = v25;
      v34 = 1024;
      *(_DWORD *)v35 = v20;
      *(_WORD *)&v35[4] = 2112;
      *(_QWORD *)&v35[6] = v17;
      v36 = 2112;
      v37 = v26;
      _os_log_impl(&dword_1DD34E000, v23, OS_LOG_TYPE_DEFAULT, "%@:%@ Accounts are split/mismatched = [%d], homeMediaAccount = [%@], HomePod Media Account = [%@] ", (uint8_t *)&v30, 0x30u);

    }
    v27 = *(void **)(a1 + 32);
    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 56);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "finishWithError:", v28);

    }
    else
    {
      objc_msgSend(v27, "finishWithNoResult");
    }

  }
}

void __107__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_isEitherHomePodMediaAccountOrHomeMediaAccountPresent__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[HFAppleMusicHomeAccountManager sharedInstance](HFAppleMusicHomeAccountManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "hf_home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaAccountForHomeIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_opt_class();
    v9 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    objc_msgSend(*(id *)(a1 + 32), "hf_appleMusicCurrentLoggedInAccount");
    v12 = objc_claimAutoreleasedReturnValue();
    HFLogForCategory(5uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v27 = v14;
      v28 = 2112;
      v29 = v15;
      v30 = 1024;
      v31 = (v11 | v12) == 0;
      v32 = 2112;
      v33 = v11;
      v34 = 2112;
      v35 = v12;
      _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "%@:%@ Accounts are not present = [%d], homeMediaAccount = [%@], HomePod Media Account = [%@] ", buf, 0x30u);

    }
    if (v11 | v12)
    {
      objc_msgSend(v3, "finishWithNoResult");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 56);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "finishWithError:", v16);

      v12 = 0;
      v11 = 0;
    }
  }
  else
  {
    +[HFAppleMusicHomeAccountManager sharedInstance](HFAppleMusicHomeAccountManager, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "hf_home");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "executeHomeMediaAccountFetchForHome:", v18);
    v11 = objc_claimAutoreleasedReturnValue();

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __107__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_isEitherHomePodMediaAccountOrHomeMediaAccountPresent__block_invoke_2;
    v22[3] = &unk_1EA73A1F0;
    v25 = *(_QWORD *)(a1 + 40);
    v19 = v3;
    v20 = *(_QWORD *)(a1 + 32);
    v23 = (uint64_t)v19;
    v24 = v20;
    v21 = (id)objc_msgSend((id)v11, "addCompletionBlock:", v22);
    v12 = v23;
  }

}

void __107__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_isEitherHomePodMediaAccountOrHomeMediaAccountPresent__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  _BYTE v30[14];
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  HFLogForCategory(5uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412546;
      v26 = v24;
      v27 = 2112;
      v28 = v6;
      _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "%@ Error fetching mediaAccount for HomePod [%@]", (uint8_t *)&v25, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412802;
      v26 = v9;
      v27 = 2112;
      v28 = v10;
      v29 = 2112;
      *(_QWORD *)v30 = v5;
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ Fetched Media Account [%@]", (uint8_t *)&v25, 0x20u);

    }
    objc_opt_class();
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    objc_msgSend(*(id *)(a1 + 40), "hf_appleMusicCurrentLoggedInAccount");
    v18 = objc_claimAutoreleasedReturnValue();
    HFLogForCategory(5uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(void **)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138413314;
      v26 = v20;
      v27 = 2112;
      v28 = v21;
      v29 = 1024;
      *(_DWORD *)v30 = (v17 | v18) == 0;
      *(_WORD *)&v30[4] = 2112;
      *(_QWORD *)&v30[6] = v17;
      v31 = 2112;
      v32 = v18;
      _os_log_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_DEFAULT, "%@:%@ Accounts are not present = [%d], homeMediaAccount = [%@], HomePod Media Account = [%@] ", (uint8_t *)&v25, 0x30u);

    }
    v22 = *(void **)(a1 + 32);
    if (v17 | v18)
    {
      objc_msgSend(v22, "finishWithNoResult");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 56);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "finishWithError:", v23);

    }
  }

}

void __70__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_analyticsClient__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "localizedDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_error_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_ERROR, "OSASyncProxyClient error: %@", (uint8_t *)&v5, 0xCu);

  }
}

void __79__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLogListWithTimeout___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLogListWithTimeout___block_invoke_2;
  block[3] = &unk_1EA7270A0;
  v4 = *(NSObject **)(a1 + 32);
  block[4] = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __79__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLogListWithTimeout___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "hf_analyticsClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLogListWithTimeout___block_invoke_3;
  v4[3] = &unk_1EA72CBB8;
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "request:logListWithOptions:onComplete:", v3, MEMORY[0x1E0C9AA70], v4);

}

uint64_t __79__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLogListWithTimeout___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

void __79__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLogListWithTimeout___block_invoke_4(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLogListWithTimeout___block_invoke_5;
  block[3] = &unk_1EA728AE8;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __79__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLogListWithTimeout___block_invoke_5(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  char v4;
  void *v5;
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(v1);
    v4 = objc_msgSend(v3, "isFinished");

    if ((v4 & 1) == 0)
    {
      v6 = objc_loadWeakRetained(v1);
      objc_msgSend(MEMORY[0x1E0CB35C8], "na_errorWithCode:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "finishWithError:", v5);

    }
  }
}

uint64_t __79__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLogListWithTimeout___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

void __72__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLog_timeout___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLog_timeout___block_invoke_2;
  v6[3] = &unk_1EA7271B0;
  v4 = *(NSObject **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v9 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

void __72__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLog_timeout___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "hf_analyticsClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLog_timeout___block_invoke_3;
  v5[3] = &unk_1EA72CBB8;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "request:transferLog:withOptions:onComplete:", v3, v4, MEMORY[0x1E0C9AA70], v5);

}

uint64_t __72__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLog_timeout___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

void __72__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLog_timeout___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(NSObject **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __72__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLog_timeout___block_invoke_5;
  v3[3] = &unk_1EA72A968;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  objc_copyWeak(&v5, (id *)(a1 + 48));
  dispatch_async(v2, v3);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v4);
}

void __72__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLog_timeout___block_invoke_5(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  id v5;
  char v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    HFLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v9, "accessory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Timed out fetching logs for accessory: %@", (uint8_t *)&v11, 0xCu);

    }
    v5 = objc_loadWeakRetained(v2);
    v6 = objc_msgSend(v5, "isFinished");

    if ((v6 & 1) == 0)
    {
      v7 = objc_loadWeakRetained(v2);
      objc_msgSend(MEMORY[0x1E0CB35C8], "na_errorWithCode:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "finishWithError:", v8);

    }
  }
}

uint64_t __72__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLog_timeout___block_invoke_398(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

@end
