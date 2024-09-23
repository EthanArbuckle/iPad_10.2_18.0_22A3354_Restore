@implementation HUHomeFeatureOnboardingUtilities

+ (id)atLeastOneHomePodHasLanguageSettingsForHomeFuture:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  int v36;
  char v37;
  void *v38;
  void *v39;
  void *v41;
  __int128 v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  int v50;
  id obj;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  uint64_t *v59;
  _QWORD *v60;
  id v61;
  SEL v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  _QWORD *v67;
  uint64_t *v68;
  id v69;
  SEL v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD block[4];
  id v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  char v80;
  _QWORD v81[4];
  uint8_t buf[4];
  id v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  void *v91;
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v49 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  v43 = v3;
  objc_msgSend(v3, "hf_homePods");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  objc_msgSend(v4, "setQualityOfService:", 33);
  v46 = v4;
  objc_msgSend(v4, "setMaxConcurrentOperationCount:", -1);
  v81[0] = 0;
  v81[1] = v81;
  v81[2] = 0x2020000000;
  v81[3] = 0;
  v77 = 0;
  v78 = &v77;
  v79 = 0x2020000000;
  v80 = 0;
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v6, "hasOptedToHH2");

  if (!objc_msgSend(v44, "count"))
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v83 = a1;
      v84 = 2112;
      v85 = v41;
      _os_log_debug_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEBUG, "%@:%@ No HomePods found in the home.", buf, 0x16u);

    }
    objc_msgSend(v49, "finishWithResult:", MEMORY[0x1E0C9AAA0]);
    v8 = v49;
    goto LABEL_39;
  }
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    +[HUHomeFeatureOnboardingUtilities _initializeSiriLanguageOptionsManagerIfNecessaryForHomePods:](HUHomeFeatureOnboardingUtilities, "_initializeSiriLanguageOptionsManagerIfNecessaryForHomePods:", v44);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__HUHomeFeatureOnboardingUtilities_atLeastOneHomePodHasLanguageSettingsForHomeFuture___block_invoke;
    block[3] = &unk_1E6F4D988;
    v76 = v44;
    dispatch_sync(MEMORY[0x1E0C80D38], block);

  }
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  obj = v44;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v92, 16);
  if (!v9)
  {
LABEL_32:

    if ((v50 & 1) == 0)
      goto LABEL_36;
    goto LABEL_38;
  }
  v48 = *(_QWORD *)v72;
  v45 = *MEMORY[0x1E0D30140];
  *(_QWORD *)&v10 = 138413314;
  v42 = v10;
LABEL_10:
  v47 = v9;
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v72 != v48)
      objc_enumerationMutation(obj);
    if (*((_BYTE *)v78 + 24))
    {
      v8 = v49;

      goto LABEL_39;
    }
    v12 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v11);
    objc_msgSend(v12, "mediaProfile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v50)
      break;
    v15 = (void *)MEMORY[0x1E0CB34C8];
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __86__HUHomeFeatureOnboardingUtilities_atLeastOneHomePodHasLanguageSettingsForHomeFuture___block_invoke_2;
    v63[3] = &unk_1E6F50C78;
    v16 = v13;
    v64 = v16;
    v67 = v81;
    v68 = &v77;
    v69 = a1;
    v70 = a2;
    v17 = v49;
    v65 = v17;
    v18 = v46;
    v66 = v18;
    objc_msgSend(v15, "blockOperationWithBlock:", v63);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __86__HUHomeFeatureOnboardingUtilities_atLeastOneHomePodHasLanguageSettingsForHomeFuture___block_invoke_72;
    v56[3] = &unk_1E6F50CA0;
    v59 = &v77;
    v60 = v81;
    v57 = obj;
    v61 = a1;
    v62 = a2;
    v58 = v17;
    objc_msgSend(v19, "setCompletionBlock:", v56);
    objc_msgSend(v16, "hf_backingAccessory");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setName:", v21);

    objc_msgSend(v18, "operations");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __86__HUHomeFeatureOnboardingUtilities_atLeastOneHomePodHasLanguageSettingsForHomeFuture___block_invoke_73;
    v54[3] = &unk_1E6F50CC8;
    v23 = v19;
    v55 = v23;
    objc_msgSend(v22, "na_firstObjectPassingTest:", v54);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
      objc_msgSend(v18, "addOperation:", v23);

LABEL_30:
    if (v47 == ++v11)
    {
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v92, 16);
      if (v9)
        goto LABEL_10;
      goto LABEL_32;
    }
  }
  objc_msgSend(v13, "hf_settingsAdapterManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "adapterForIdentifier:", v45);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v27 = v26;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v28 = v27;
  else
    v28 = 0;
  v29 = v28;

  objc_msgSend(v29, "selectedLanguageOption");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "availableLanguageOptions");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v30 && objc_msgSend(v31, "count"))
  {
    HFLogForCategory();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = v42;
      v83 = a1;
      v84 = 2112;
      v85 = v34;
      v86 = 2112;
      v87 = v12;
      v88 = 2112;
      v89 = v30;
      v90 = 2112;
      v91 = v32;
      _os_log_impl(&dword_1B8E1E000, v33, OS_LOG_TYPE_DEFAULT, "%@:%@ Found HomePod [%@] has selected language option [%@] and available language options [%@] from the Adapter.", buf, 0x34u);

    }
    *((_BYTE *)v78 + 24) = 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v35 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "finishWithResult:", v35);
    v36 = 0;
    v37 = 1;
  }
  else
  {
    HFLogForCategory();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v83 = a1;
      v84 = 2112;
      v85 = v38;
      v86 = 2112;
      v87 = v12;
      _os_log_impl(&dword_1B8E1E000, v35, OS_LOG_TYPE_DEFAULT, "%@:%@ Siri Language Setting For HomePod [%@] Not Found.", buf, 0x20u);

    }
    v37 = 0;
    v36 = 1;
  }

  if (v36)
    goto LABEL_30;

  v8 = v49;
  if ((v37 & 1) == 0)
    goto LABEL_39;
LABEL_36:
  if (!*((_BYTE *)v78 + 24))
    objc_msgSend(v49, "finishWithResult:", MEMORY[0x1E0C9AAA0]);
LABEL_38:
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler", v42);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "reschedule:", v39);
  v8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_39:
  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(v81, 8);

  return v8;
}

+ (void)initialize
{
  if (_MergedGlobals_619 != -1)
    dispatch_once(&_MergedGlobals_619, &__block_literal_global_17_1);
  objc_storeStrong((id *)&_supportedVoiceRecognitionLanguages, (id)qword_1ED580AA8);
}

void __46__HUHomeFeatureOnboardingUtilities_initialize__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  +[HUHomeFeatureOnboardingUtilities _fetchSupportedMultiUserLanguagesSynchronously](HUHomeFeatureOnboardingUtilities, "_fetchSupportedMultiUserLanguagesSynchronously");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED580AA8;
  qword_1ED580AA8 = v0;

}

+ (id)_fetchSupportedMultiUserLanguagesSynchronously
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  SEL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__7;
  v16 = __Block_byref_object_dispose__7;
  v17 = 0;
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v4 = objc_alloc_init(MEMORY[0x1E0CFE9B0]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__HUHomeFeatureOnboardingUtilities__fetchSupportedMultiUserLanguagesSynchronously__block_invoke;
  v8[3] = &unk_1E6F50B38;
  v10 = &v12;
  v11 = a2;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "fetchSupportedMultiUserLanguageCodes:", v8);
  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __82__HUHomeFeatureOnboardingUtilities__fetchSupportedMultiUserLanguagesSynchronously__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v7;
      _os_log_error_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_ERROR, "%@ THIS SHOULD NOT HAPPEN. Error fetching multi-user language codes %@", (uint8_t *)&v10, 0x16u);

    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

+ (id)home:(id)a3 onboardPersonalRequestsFromPresentingViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  SEL v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)_staticOnboardingFuture;
  if (!_staticOnboardingFuture)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAB0]);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)_staticOnboardingFuture;
    _staticOnboardingFuture = v9;

    v8 = (void *)_staticOnboardingFuture;
  }
  if ((objc_msgSend(v8, "isFinished") & 1) == 0)
  {
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v12;
      _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ Found a previous Onboarder still running, ours will start after that one completes...", buf, 0xCu);

    }
  }
  v13 = (void *)_staticOnboardingFuture;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __93__HUHomeFeatureOnboardingUtilities_home_onboardPersonalRequestsFromPresentingViewController___block_invoke;
  v18[3] = &unk_1E6F50008;
  v19 = v6;
  v20 = v7;
  v21 = a2;
  v14 = v7;
  v15 = v6;
  objc_msgSend(v13, "flatMap:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __93__HUHomeFeatureOnboardingUtilities_home_onboardPersonalRequestsFromPresentingViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  HUHomeFeatureOnboarder *v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v20 = CFSTR("OnboardingDisplayOption_OnboardingFromUserInput");
  v21[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__7;
  v18 = __Block_byref_object_dispose__7;
  v19 = -[HUHomeFeatureOnboarder initWithFeatures:home:usageOptions:]([HUHomeFeatureOnboarder alloc], "initWithFeatures:home:usageOptions:", &unk_1E7042A50, *(_QWORD *)(a1 + 32), v4);
  objc_msgSend((id)v15[5], "startOnboardingWithPresentingViewController:usageOptions:", *(_QWORD *)(a1 + 40), v4);
  objc_msgSend((id)v15[5], "completionFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __93__HUHomeFeatureOnboardingUtilities_home_onboardPersonalRequestsFromPresentingViewController___block_invoke_24;
  v9[3] = &unk_1E6F50B60;
  v6 = *(_QWORD *)(a1 + 48);
  v12 = &v14;
  v13 = v6;
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  objc_msgSend(v5, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v14, 8);
  return v7;
}

id __93__HUHomeFeatureOnboardingUtilities_home_onboardPersonalRequestsFromPresentingViewController___block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "restart");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v9;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ RESTARTED same onboarding (Identify Voice))", (uint8_t *)&v14, 0xCu);

    }
    +[HUHomeFeatureOnboardingUtilities home:onboardPersonalRequestsFromPresentingViewController:](HUHomeFeatureOnboardingUtilities, "home:onboardPersonalRequestsFromPresentingViewController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v8)
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v11;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ completed with results %@", (uint8_t *)&v14, 0x16u);

    }
    +[HUHomeFeatureOnboardingUtilities home:processHomeFeatureOnboarderResults:](HUHomeFeatureOnboardingUtilities, "home:processHomeFeatureOnboarderResults:", *(_QWORD *)(a1 + 32), v3);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v10;

  return v12;
}

+ (id)home:(id)a3 onboardIdentifyVoiceFromPresentingViewController:(id)a4 usageOptions:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  SEL v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)_staticOnboardingFuture;
  if (!_staticOnboardingFuture)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAB0]);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)_staticOnboardingFuture;
    _staticOnboardingFuture = v12;

    v11 = (void *)_staticOnboardingFuture;
  }
  if ((objc_msgSend(v11, "isFinished") & 1) == 0)
  {
    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v29 = v15;
      _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ Found a previous Onboarder still running, ours will start after that one completes...", buf, 0xCu);

    }
  }
  v16 = (void *)_staticOnboardingFuture;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __103__HUHomeFeatureOnboardingUtilities_home_onboardIdentifyVoiceFromPresentingViewController_usageOptions___block_invoke;
  v23[3] = &unk_1E6F50BB0;
  v24 = v8;
  v25 = v10;
  v26 = v9;
  v27 = a2;
  v17 = v9;
  v18 = v10;
  v19 = v8;
  v20 = (id)objc_msgSend(v16, "flatMap:", v23);
  v21 = (id)_staticOnboardingFuture;

  return v21;
}

id __103__HUHomeFeatureOnboardingUtilities_home_onboardIdentifyVoiceFromPresentingViewController_usageOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  _BYTE *v14;
  uint64_t v15;
  _BYTE buf[24];
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  HUHomeFeatureOnboarder *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = &unk_1E7042A68;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ started with feature flows %@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v17 = __Block_byref_object_copy__7;
  v18 = __Block_byref_object_dispose__7;
  v19 = -[HUHomeFeatureOnboarder initWithFeatures:home:usageOptions:]([HUHomeFeatureOnboarder alloc], "initWithFeatures:home:usageOptions:", &unk_1E7042A68, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "startOnboardingWithPresentingViewController:usageOptions:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "completionFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __103__HUHomeFeatureOnboardingUtilities_home_onboardIdentifyVoiceFromPresentingViewController_usageOptions___block_invoke_31;
  v10[3] = &unk_1E6F50B88;
  v7 = *(_QWORD *)(a1 + 56);
  v14 = buf;
  v15 = v7;
  v11 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 40);
  objc_msgSend(v6, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(buf, 8);
  return v8;
}

id __103__HUHomeFeatureOnboardingUtilities_home_onboardIdentifyVoiceFromPresentingViewController_usageOptions___block_invoke_31(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "restart");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v9;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ RESTARTED same onboarding (Identify Voice))", (uint8_t *)&v14, 0xCu);

    }
    +[HUHomeFeatureOnboardingUtilities home:onboardIdentifyVoiceFromPresentingViewController:usageOptions:](HUHomeFeatureOnboardingUtilities, "home:onboardIdentifyVoiceFromPresentingViewController:usageOptions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v8)
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v11;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ completed with results %@", (uint8_t *)&v14, 0x16u);

    }
    +[HUHomeFeatureOnboardingUtilities home:processHomeFeatureOnboarderResults:](HUHomeFeatureOnboardingUtilities, "home:processHomeFeatureOnboarderResults:", *(_QWORD *)(a1 + 32), v3);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v10;

  return v12;
}

+ (id)home:(id)a3 onboardAllFeaturesFromPresentingViewController:(id)a4 usageOptions:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  SEL v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)_staticOnboardingFuture;
  if (!_staticOnboardingFuture)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAB0]);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)_staticOnboardingFuture;
    _staticOnboardingFuture = v13;

    v12 = (void *)_staticOnboardingFuture;
  }
  if ((objc_msgSend(v12, "isFinished") & 1) == 0)
  {
    HFLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v31 = v16;
      _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ Found a previous Onboarder still running, ours will start after that one completes...", buf, 0xCu);

    }
  }
  v17 = (void *)_staticOnboardingFuture;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __101__HUHomeFeatureOnboardingUtilities_home_onboardAllFeaturesFromPresentingViewController_usageOptions___block_invoke;
  v24[3] = &unk_1E6F50BD8;
  v28 = a1;
  v29 = a2;
  v25 = v9;
  v26 = v11;
  v27 = v10;
  v18 = v10;
  v19 = v11;
  v20 = v9;
  v21 = (id)objc_msgSend(v17, "flatMap:", v24);
  v22 = (id)_staticOnboardingFuture;

  return v22;
}

id __101__HUHomeFeatureOnboardingUtilities_home_onboardAllFeaturesFromPresentingViewController_usageOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _BYTE *v28;
  uint64_t v29;
  _BYTE buf[24];
  __int128 v31;
  HUHomeFeatureOnboarder *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasOptedToHH2");

  if (v6)
    v7 = objc_msgSend(*(id *)(a1 + 32), "hf_hasReachableResidents");
  else
    v7 = 1;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 56);
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v31) = v6;
    WORD2(v31) = 1024;
    *(_DWORD *)((char *)&v31 + 6) = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@: hasOptedToHH2 %{BOOL}d, shouldShowResidentDependantFlows = %{BOOL}d", buf, 0x22u);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "hf_shouldBlockCurrentUserFromHome"))
  {
    HFLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v21 = *(_QWORD *)(a1 + 56);
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v22;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&v31 = v23;
      _os_log_debug_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEBUG, "%@:%@: User is blocked from home %@, skipping all onboarding flows", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("OnboardingDisplayOption_ShowSwitchHomeScreen"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    if ((v15 & 1) != 0 || HFForceSwitchHomeWelcomeOnboarding())
      objc_msgSend(v11, "addObject:", &unk_1E7042A80);
    if (v7)
    {
      objc_msgSend(v11, "addObject:", &unk_1E7042A98);
      objc_msgSend(v11, "addObject:", &unk_1E7042AB0);
      if (_os_feature_enabled_impl())
        objc_msgSend(v11, "addObject:", &unk_1E7042AC8);
      objc_msgSend(v11, "addObject:", &unk_1E7042AE0);
      objc_msgSend(v11, "addObject:", &unk_1E7042AF8);
      objc_msgSend(v11, "addObject:", &unk_1E7042B10);
      objc_msgSend(v11, "addObject:", &unk_1E7042B28);
    }
    objc_msgSend(v11, "addObject:", &unk_1E7042B40);
    HFLogForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v11;
      _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ started with grouped feature flows %@", buf, 0x16u);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&v31 = __Block_byref_object_copy__7;
    *((_QWORD *)&v31 + 1) = __Block_byref_object_dispose__7;
    v32 = -[HUHomeFeatureOnboarder initWithGroupedFeatures:home:usageOptions:]([HUHomeFeatureOnboarder alloc], "initWithGroupedFeatures:home:usageOptions:", v11, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "startOnboardingWithPresentingViewController:usageOptions:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "completionFuture");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __101__HUHomeFeatureOnboardingUtilities_home_onboardAllFeaturesFromPresentingViewController_usageOptions___block_invoke_62;
    v24[3] = &unk_1E6F50B88;
    v19 = *(_QWORD *)(a1 + 64);
    v28 = buf;
    v29 = v19;
    v25 = *(id *)(a1 + 32);
    v26 = *(id *)(a1 + 48);
    v27 = *(id *)(a1 + 40);
    objc_msgSend(v18, "flatMap:", v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(buf, 8);
  }

  return v13;
}

id __101__HUHomeFeatureOnboardingUtilities_home_onboardAllFeaturesFromPresentingViewController_usageOptions___block_invoke_62(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "restart");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v9;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ RESTARTED same onboarding (All Features))", (uint8_t *)&v14, 0xCu);

    }
    +[HUHomeFeatureOnboardingUtilities home:onboardAllFeaturesFromPresentingViewController:usageOptions:](HUHomeFeatureOnboardingUtilities, "home:onboardAllFeaturesFromPresentingViewController:usageOptions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v8)
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v11;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ completed with results %@", (uint8_t *)&v14, 0x16u);

    }
    +[HUHomeFeatureOnboardingUtilities home:processHomeFeatureOnboarderResults:](HUHomeFeatureOnboardingUtilities, "home:processHomeFeatureOnboarderResults:", *(_QWORD *)(a1 + 32), v3);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v10;

  return v12;
}

+ (id)home:(id)a3 onboardFeaturesForKeyPaths:(id)a4 presentingViewController:(id)a5 usageOptions:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  SEL v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)_staticOnboardingFuture;
  if (!_staticOnboardingFuture)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAB0]);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)_staticOnboardingFuture;
    _staticOnboardingFuture = v15;

    v14 = (void *)_staticOnboardingFuture;
  }
  if ((objc_msgSend(v14, "isFinished") & 1) == 0)
  {
    HFLogForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v18;
      _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ Found a previous Onboarder still running, ours will start after that one completes...", buf, 0xCu);

    }
  }
  v19 = (void *)_staticOnboardingFuture;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __106__HUHomeFeatureOnboardingUtilities_home_onboardFeaturesForKeyPaths_presentingViewController_usageOptions___block_invoke;
  v27[3] = &unk_1E6F50C28;
  v31 = v12;
  v32 = a2;
  v28 = v11;
  v29 = v10;
  v30 = v13;
  v20 = v12;
  v21 = v13;
  v22 = v10;
  v23 = v11;
  v24 = (id)objc_msgSend(v19, "flatMap:", v27);
  v25 = (id)_staticOnboardingFuture;

  return v25;
}

id __106__HUHomeFeatureOnboardingUtilities_home_onboardFeaturesForKeyPaths_presentingViewController_usageOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  _BYTE *v16;
  uint64_t v17;
  _BYTE buf[24];
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  HUHomeFeatureOnboarder *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    +[HUHomeFeatureOnboardingUtilities groupedFeaturesForOnboardingFlowKeyPaths:](HUHomeFeatureOnboardingUtilities, "groupedFeaturesForOnboardingFlowKeyPaths:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = objc_msgSend(v4, "count");
      *(_WORD *)&buf[22] = 2112;
      v19 = (uint64_t (*)(uint64_t, uint64_t))v4;
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ started with grouped feature flows (%lu groups) %@", buf, 0x20u);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v19 = __Block_byref_object_copy__7;
    v20 = __Block_byref_object_dispose__7;
    v21 = -[HUHomeFeatureOnboarder initWithGroupedFeatures:home:usageOptions:]([HUHomeFeatureOnboarder alloc], "initWithGroupedFeatures:home:usageOptions:", v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "startOnboardingWithPresentingViewController:usageOptions:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "completionFuture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __106__HUHomeFeatureOnboardingUtilities_home_onboardFeaturesForKeyPaths_presentingViewController_usageOptions___block_invoke_63;
    v11[3] = &unk_1E6F50C00;
    v8 = *(_QWORD *)(a1 + 64);
    v16 = buf;
    v17 = v8;
    v12 = *(id *)(a1 + 40);
    v13 = *(id *)(a1 + 32);
    v14 = *(id *)(a1 + 56);
    v15 = *(id *)(a1 + 48);
    objc_msgSend(v7, "flatMap:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(buf, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAA0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

id __106__HUHomeFeatureOnboardingUtilities_home_onboardFeaturesForKeyPaths_presentingViewController_usageOptions___block_invoke_63(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "restart");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v9;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ RESTARTED same onboarding (Keypaths))", (uint8_t *)&v14, 0xCu);

    }
    +[HUHomeFeatureOnboardingUtilities home:onboardFeaturesForKeyPaths:presentingViewController:usageOptions:](HUHomeFeatureOnboardingUtilities, "home:onboardFeaturesForKeyPaths:presentingViewController:usageOptions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v8)
    {
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v11;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ completed with results %@", (uint8_t *)&v14, 0x16u);

    }
    +[HUHomeFeatureOnboardingUtilities home:processHomeFeatureOnboarderResults:](HUHomeFeatureOnboardingUtilities, "home:processHomeFeatureOnboarderResults:", *(_QWORD *)(a1 + 32), v3);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v10;

  return v12;
}

+ (id)home:(id)a3 onboardHomeHub2FromPresentingViewController:(id)a4 devices:(id)a5 usageOptions:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  SEL v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)_staticOnboardingFuture;
  if (!_staticOnboardingFuture)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAB0]);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)_staticOnboardingFuture;
    _staticOnboardingFuture = v15;

    v14 = (void *)_staticOnboardingFuture;
  }
  if ((objc_msgSend(v14, "isFinished") & 1) == 0)
  {
    HFLogForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v18;
      _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ Found a previous Onboarder still running, ours will start after that one completes...", buf, 0xCu);

    }
  }
  v19 = (void *)_staticOnboardingFuture;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __106__HUHomeFeatureOnboardingUtilities_home_onboardHomeHub2FromPresentingViewController_devices_usageOptions___block_invoke;
  v27[3] = &unk_1E6F50C28;
  v31 = v11;
  v32 = a2;
  v28 = v10;
  v29 = v12;
  v30 = v13;
  v20 = v11;
  v21 = v13;
  v22 = v12;
  v23 = v10;
  v24 = (id)objc_msgSend(v19, "flatMap:", v27);
  v25 = (id)_staticOnboardingFuture;

  return v25;
}

id __106__HUHomeFeatureOnboardingUtilities_home_onboardHomeHub2FromPresentingViewController_devices_usageOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  _BYTE *v15;
  uint64_t v16;
  _BYTE buf[24];
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  HUHomeFeatureOnboarder *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = &unk_1E7042B58;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ started with feature flows %@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v18 = __Block_byref_object_copy__7;
  v19 = __Block_byref_object_dispose__7;
  v20 = -[HUHomeFeatureOnboarder initWithFeatures:home:devices:usageOptions:]([HUHomeFeatureOnboarder alloc], "initWithFeatures:home:devices:usageOptions:", &unk_1E7042B58, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "startOnboardingWithPresentingViewController:usageOptions:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "completionFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __106__HUHomeFeatureOnboardingUtilities_home_onboardHomeHub2FromPresentingViewController_devices_usageOptions___block_invoke_67;
  v10[3] = &unk_1E6F50C00;
  v7 = *(_QWORD *)(a1 + 64);
  v15 = buf;
  v16 = v7;
  v11 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 40);
  v14 = *(id *)(a1 + 48);
  objc_msgSend(v6, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(buf, 8);
  return v8;
}

id __106__HUHomeFeatureOnboardingUtilities_home_onboardHomeHub2FromPresentingViewController_devices_usageOptions___block_invoke_67(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "restart");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v9;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ RESTARTED same onboarding (Identify Voice))", (uint8_t *)&v14, 0xCu);

    }
    +[HUHomeFeatureOnboardingUtilities home:onboardHomeHub2FromPresentingViewController:devices:usageOptions:](HUHomeFeatureOnboardingUtilities, "home:onboardHomeHub2FromPresentingViewController:devices:usageOptions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v8)
    {
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v11;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "HUHomeFeatureOnboardingUtilities:%@ completed with results %@", (uint8_t *)&v14, 0x16u);

    }
    +[HUHomeFeatureOnboardingUtilities home:processHomeFeatureOnboarderResults:](HUHomeFeatureOnboardingUtilities, "home:processHomeFeatureOnboarderResults:", *(_QWORD *)(a1 + 32), v3);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v10;

  return v12;
}

uint64_t __86__HUHomeFeatureOnboardingUtilities_atLeastOneHomePodHasLanguageSettingsForHomeFuture___block_invoke(uint64_t a1)
{
  return +[HUHomeFeatureOnboardingUtilities _initializeSiriLanguageOptionsManagerIfNecessaryForHomePods:](HUHomeFeatureOnboardingUtilities, "_initializeSiriLanguageOptionsManagerIfNecessaryForHomePods:", *(_QWORD *)(a1 + 32));
}

void __86__HUHomeFeatureOnboardingUtilities_atLeastOneHomePodHasLanguageSettingsForHomeFuture___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;

  objc_msgSend(*(id *)(a1 + 32), "hf_siriLanguageOptionsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedLanguageOption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "availableSiriLanguageOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__HUHomeFeatureOnboardingUtilities_atLeastOneHomePodHasLanguageSettingsForHomeFuture___block_invoke_3;
  v9[3] = &unk_1E6F50C50;
  v5 = *(_OWORD *)(a1 + 56);
  v10 = v3;
  v6 = *(_OWORD *)(a1 + 72);
  v14 = v5;
  v15 = v6;
  v11 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 48);
  v7 = v3;
  v8 = (id)objc_msgSend(v4, "addCompletionBlock:", v9);

}

void __86__HUHomeFeatureOnboardingUtilities_atLeastOneHomePodHasLanguageSettingsForHomeFuture___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  v7 = v5;
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    LOBYTE(v9) = objc_msgSend(v7, "count") != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v9;
  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 80);
    NSStringFromSelector(*(SEL *)(a1 + 88));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "hf_backingAccessory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 32);
    v16 = objc_msgSend(v8, "count");
    v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v18 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    v19 = 138413826;
    v20 = v11;
    v21 = 2112;
    v22 = v12;
    v23 = 2112;
    v24 = v14;
    v25 = 2112;
    v26 = v15;
    v27 = 2048;
    v28 = v16;
    v29 = 2048;
    v30 = v17;
    v31 = 1024;
    v32 = v18;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ OptionsManager - HomePodProfile [%@], selectedLanguageOption: [%@], languageOptions: [%ld], futuresCompleted: %lu, hasLanguageSettings: %{BOOL}d", (uint8_t *)&v19, 0x44u);

  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", MEMORY[0x1E0C9AAB0]);
    objc_msgSend(*(id *)(a1 + 56), "cancelAllOperations");
  }

}

uint64_t __86__HUHomeFeatureOnboardingUtilities_atLeastOneHomePodHasLanguageSettingsForHomeFuture___block_invoke_72(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24);
    result = objc_msgSend(*(id *)(result + 32), "count");
    if (v2 == result)
    {
      HFLogForCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(v1 + 64);
        NSStringFromSelector(*(SEL *)(v1 + 72));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 24);
        v7 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24);
        v8 = 138413058;
        v9 = v4;
        v10 = 2112;
        v11 = v5;
        v12 = 2048;
        v13 = v6;
        v14 = 1024;
        v15 = v7;
        _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "%@:%@: No homepod language options found. futuresCompleted: %lu, hasLanguageSettings: %{BOOL}d", (uint8_t *)&v8, 0x26u);

      }
      return objc_msgSend(*(id *)(v1 + 40), "finishWithResult:", MEMORY[0x1E0C9AAA0]);
    }
  }
  return result;
}

BOOL __86__HUHomeFeatureOnboardingUtilities_atLeastOneHomePodHasLanguageSettingsForHomeFuture___block_invoke_73(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 == v4;

  return v5;
}

+ (void)_initializeSiriLanguageOptionsManagerIfNecessaryForHomePods:(id)a3
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v15;
    *(_QWORD *)&v5 = 138412290;
    v13 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "mediaProfile", v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "mediaProfile");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "hf_siriLanguageOptionsManager");
          v12 = objc_claimAutoreleasedReturnValue();

        }
        else
        {
          HFLogForCategory();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            v19 = v9;
            _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "mediaProfile is NULL for %@:", buf, 0xCu);
          }
        }

      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v6);
  }

}

+ (BOOL)home:(id)a3 hasSomeHomePodsOnSupportedVoiceRecognitionLanguages:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  void *v13;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  NSObject *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v7, "hf_hasHomePods") & 1) != 0)
  {
    +[HUHomeFeatureOnboardingUtilities home:createMultiUserLanguageToHomePodsMapping:](HUHomeFeatureOnboardingUtilities, "home:createMultiUserLanguageToHomePodsMapping:", v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138413058;
      v16 = a1;
      v17 = 2112;
      v18 = v11;
      v19 = 2048;
      v20 = -[NSObject count](v9, "count");
      v21 = 2112;
      v22 = v9;
      _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ %lu HomePods on Supported Languages (languageToHomePodsMapping %@)", (uint8_t *)&v15, 0x2Au);

    }
    v12 = -[NSObject count](v9, "count") != 0;
  }
  else
  {
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v13;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@: There are no HomePods so we will return NO in this case", (uint8_t *)&v15, 0xCu);

    }
    v12 = 0;
  }

  return v12;
}

+ (id)fetchSupportedVoiceRecognitionLanguages
{
  void *v2;
  void *v3;

  v2 = (void *)_supportedVoiceRecognitionLanguages;
  if (!_supportedVoiceRecognitionLanguages)
  {
    NSStringFromSelector(a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@: fetchSupportedVoiceRecognitionLanguages called before _fetchSupportedMultiUserLanguagesSynchronously - this should not happen!"), v3);

    v2 = (void *)_supportedVoiceRecognitionLanguages;
  }
  return (id)objc_msgSend(v2, "copy");
}

+ (void)fetchSupportedVoiceRecognitionLanguagesWithCompletion:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0CFE9B0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "fetchSupportedMultiUserLanguageCodes:", v4);

}

+ (void)presentAlertConfirmingTurningOfVoiceRecognitionFrom:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v28 = v4;
    v29 = 2112;
    v30 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@: Now presenting alert to turn OFF Voice Recognition", buf, 0x16u);

  }
  v7 = (void *)MEMORY[0x1E0CEA2E8];
  _HULocalizedStringWithDefaultValue(CFSTR("HUTurnOffVoiceRecognition_Alert_Title"), CFSTR("HUTurnOffVoiceRecognition_Alert_Title"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUTurnOffVoiceRecognition_Alert_Detail"), CFSTR("HUTurnOffVoiceRecognition_Alert_Detail"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUTurnOffVoiceRecognition_Confirmation_TurnOff"), CFSTR("HUTurnOffVoiceRecognition_Confirmation_TurnOff"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __88__HUHomeFeatureOnboardingUtilities_presentAlertConfirmingTurningOfVoiceRecognitionFrom___block_invoke;
  v25[3] = &unk_1E6F4C6E0;
  v14 = v4;
  v26 = v14;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 1, v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v15);

  v16 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUTurnOffVoiceRecognition_Confirmation_DontTurnOff"), CFSTR("HUTurnOffVoiceRecognition_Confirmation_DontTurnOff"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v13;
  v21 = 3221225472;
  v22 = __88__HUHomeFeatureOnboardingUtilities_presentAlertConfirmingTurningOfVoiceRecognitionFrom___block_invoke_91;
  v23 = &unk_1E6F4C6E0;
  v24 = v14;
  v18 = v14;
  objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 0, &v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v19, v20, v21, v22, v23);

  objc_msgSend(v18, "presentViewController:animated:completion:", v10, 1, 0);
}

void __88__HUHomeFeatureOnboardingUtilities_presentAlertConfirmingTurningOfVoiceRecognitionFrom___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "+[HUHomeFeatureOnboardingUtilities presentAlertConfirmingTurningOfVoiceRecognitionFrom:]_block_invoke";
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%@' from the alert popup", (uint8_t *)&v6, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "userTappedContinueFromWarning");

}

void __88__HUHomeFeatureOnboardingUtilities_presentAlertConfirmingTurningOfVoiceRecognitionFrom___block_invoke_91(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "+[HUHomeFeatureOnboardingUtilities presentAlertConfirmingTurningOfVoiceRecognitionFrom:]_block_invoke";
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%@' from the alert popup", (uint8_t *)&v6, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "userTappedCancelFromWarning");

}

+ (void)presentAlertConfirmingTurningOffPersonalRequestsFrom:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v22 = v4;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@: Now presenting alert to turn OFF Personal Requests", buf, 0x16u);

  }
  _HULocalizedStringWithDefaultValue(CFSTR("HUTurnOffPersonalRequests_Alert_Detail"), CFSTR("HUTurnOffPersonalRequests_Alert_Detail"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUTurnOffPersonalRequests_Alert_Detail"), CFSTR("HUTurnOffPersonalRequests_Alert_Detail"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CEA2E8];
  _HULocalizedStringWithDefaultValue(CFSTR("HUTurnOffPersonalRequests_Alert_Title"), CFSTR("HUTurnOffPersonalRequests_Alert_Title"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v10, v8, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUTurnOffPersonalRequests_Confirmation_TurnOff"), CFSTR("HUTurnOffPersonalRequests_Confirmation_TurnOff"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __89__HUHomeFeatureOnboardingUtilities_presentAlertConfirmingTurningOffPersonalRequestsFrom___block_invoke;
  v19[3] = &unk_1E6F4C6E0;
  v20 = v4;
  v14 = v4;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v15);

  v16 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUTurnOffPersonalRequests_Confirmation_DontTurnOff"), CFSTR("HUTurnOffPersonalRequests_Confirmation_DontTurnOff"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 0, &__block_literal_global_101);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v18);

  objc_msgSend(v14, "presentViewController:animated:completion:", v11, 1, 0);
}

void __89__HUHomeFeatureOnboardingUtilities_presentAlertConfirmingTurningOffPersonalRequestsFrom___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "+[HUHomeFeatureOnboardingUtilities presentAlertConfirmingTurningOffPersonalRequestsFrom:]_block_invoke";
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped turn off button '%@' from the alert popup", (uint8_t *)&v6, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "userTappedContinueFromWarning");

}

void __89__HUHomeFeatureOnboardingUtilities_presentAlertConfirmingTurningOffPersonalRequestsFrom___block_invoke_100(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 136315394;
    v6 = "+[HUHomeFeatureOnboardingUtilities presentAlertConfirmingTurningOffPersonalRequestsFrom:]_block_invoke";
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "(%s) User tapped don't turn off button '%@' from the alert popup", (uint8_t *)&v5, 0x16u);

  }
}

+ (BOOL)home:(id)a3 voiceRecognitionIsSupportedForCurrentUserOnMediaAccessory:(id)a4 languageOption:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  char v22;
  NSObject *v23;
  void *v25;
  int v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v9, "isMultiUserEnabled") && objc_msgSend(v10, "hf_supportsMultiUser"))
  {
    v12 = objc_alloc(MEMORY[0x1E0D31988]);
    objc_msgSend(v9, "currentUser");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithHome:user:nameStyle:", v9, v13, 0);

    if (!objc_msgSend(v14, "isIdentifyVoiceEnabled"))
    {
      v22 = 0;
LABEL_16:

      goto LABEL_17;
    }
    +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages](HUHomeFeatureOnboardingUtilities, "fetchSupportedVoiceRecognitionLanguages");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138413058;
      v27 = a1;
      v28 = 2112;
      v29 = v17;
      v30 = 2048;
      v31 = objc_msgSend(v15, "count");
      v32 = 2112;
      v33 = v15;
      _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@ (%lu) supported voice recognition languages %@", (uint8_t *)&v26, 0x2Au);

    }
    if (v15)
    {
      if (v11)
      {
        objc_msgSend(v11, "recognitionLanguage");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v15, "containsObject:", v18);
        objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
        v20 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v20, "languageCode");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v20) = objc_msgSend(v18, "isEqualToString:", v21);
        v22 = v19 & v20;
LABEL_15:

        goto LABEL_16;
      }
    }
    else
    {
      HFLogForCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138412290;
        v27 = v25;
        _os_log_error_impl(&dword_1B8E1E000, v23, OS_LOG_TYPE_ERROR, "%@ Error fetching voice recognition languages", (uint8_t *)&v26, 0xCu);

      }
    }
    v22 = 0;
    goto LABEL_15;
  }
  v22 = 0;
LABEL_17:

  return v22;
}

+ (id)checkSiriForiCloudEnabledPromptingUser:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[5];
  _QWORD v22[7];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__7;
  v27 = __Block_byref_object_dispose__7;
  v28 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isSiriForiCloudEnabled") & 1) != 0)
  {
    objc_msgSend((id)v24[5], "finishWithResult:", MEMORY[0x1E0C9AAB0]);
  }
  else
  {
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v30 = a1;
      v31 = 2112;
      v32 = v7;
      _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Siri for iCloud is not enabled, prompting user to enable before enabling Voice Recognition", buf, 0x16u);

    }
    v8 = (void *)MEMORY[0x1E0CEA2E8];
    _HULocalizedStringWithDefaultValue(CFSTR("HUTurnOnSiriIniCloud_Alert_Title"), CFSTR("HUTurnOnSiriIniCloud_Alert_Title"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUTurnOnSiriIniCloud_Alert_Message"), CFSTR("HUTurnOnSiriIniCloud_Alert_Message"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", v9, v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUTurnOnSiriIniCloud_Confirmation_TurnOn"), CFSTR("HUTurnOnSiriIniCloud_Confirmation_TurnOn"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __75__HUHomeFeatureOnboardingUtilities_checkSiriForiCloudEnabledPromptingUser___block_invoke;
    v22[3] = &unk_1E6F50D38;
    v22[4] = &v23;
    v22[5] = a1;
    v22[6] = a2;
    objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUCancelTitle"), CFSTR("HUCancelTitle"), 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v14;
    v21[1] = 3221225472;
    v21[2] = __75__HUHomeFeatureOnboardingUtilities_checkSiriForiCloudEnabledPromptingUser___block_invoke_115;
    v21[3] = &unk_1E6F50D60;
    v21[4] = &v23;
    objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 0, v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "addAction:", v15);
    objc_msgSend(v11, "addAction:", v18);
    objc_msgSend(v5, "presentViewController:animated:completion:", v11, 1, 0);

  }
  v19 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v19;
}

void __75__HUHomeFeatureOnboardingUtilities_checkSiriForiCloudEnabledPromptingUser___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v10 = "+[HUHomeFeatureOnboardingUtilities checkSiriForiCloudEnabledPromptingUser:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped 'Turn On Siri In iCloud - TurnOn' button '%@' from the alert popup", buf, 0x16u);

  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__HUHomeFeatureOnboardingUtilities_checkSiriForiCloudEnabledPromptingUser___block_invoke_111;
  v6[3] = &unk_1E6F50D10;
  v7 = *(_OWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0D319D0], "updateSiriForiCloudEnabled:completionHandler:", 1, v6);

}

void __75__HUHomeFeatureOnboardingUtilities_checkSiriForiCloudEnabledPromptingUser___block_invoke_111(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412802;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@: There was an error enabling iCloud for Siri: %@", (uint8_t *)&v7, 0x20u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "finishWithError:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "finishWithResult:", MEMORY[0x1E0C9AAB0]);
  }

}

uint64_t __75__HUHomeFeatureOnboardingUtilities_checkSiriForiCloudEnabledPromptingUser___block_invoke_115(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "+[HUHomeFeatureOnboardingUtilities checkSiriForiCloudEnabledPromptingUser:]_block_invoke";
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "(%s) User tapped cancel button from the alert popup", (uint8_t *)&v4, 0xCu);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "finishWithResult:", MEMORY[0x1E0C9AAA0]);
}

+ (id)home:(id)a3 processHomeFeatureOnboarderResults:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  _BOOL4 v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  char v37;
  char v38;
  char v39;
  char v40;
  id v41;
  _QWORD v44[4];
  id v45;
  _BYTE *v46;
  uint64_t *v47;
  id v48;
  SEL v49;
  char v50;
  char v51;
  char v52;
  char v53;
  char v54;
  char v55;
  char v56;
  char v57;
  char v58;
  _QWORD v59[6];
  _QWORD v60[4];
  id v61;
  id v62;
  SEL v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  char v67;
  _BYTE buf[24];
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v5 = a4;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = a1;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2112;
    v69 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@: Postprocessing Feature Onboarding results %@", buf, 0x20u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v69) = 0;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUHomeFeatureOnboardingKey_IdentifyVoice_FinishedOnboarding"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = *(_QWORD *)&buf[8];
  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    v11 = 1;
  }
  else
  {
    v11 = objc_msgSend(v8, "BOOLValue");
    v10 = *(_QWORD *)&buf[8];
  }
  *(_BYTE *)(v10 + 24) = v11;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUHomeFeatureOnboardingKey_Announce_FinishedOnboarding"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = objc_msgSend(v12, "BOOLValue");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUHomeFeatureOnboardingKey_HomeTheater_FinishedOnboarding"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = objc_msgSend(v13, "BOOLValue");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUHomeFeatureOnboardingKey_TVViewingProfiles_FinishedOnboarding"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = objc_msgSend(v14, "BOOLValue");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUHomeFeatureOnboardingKey_TVViewingProfiles_DismissReminderBanner"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = objc_msgSend(v15, "BOOLValue");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUHomeFeatureOnboardingKey_NaturalLighting_FinishedOnboarding"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "BOOLValue");
  v64 = 0;
  v65 = &v64;
  v66 = 0x2020000000;
  v67 = 0;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUHomeFeatureOnboardingKey_IdentifyVoice_DismissReminderBanner"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v65;
  if (*((_BYTE *)v65 + 24))
  {
    v20 = 1;
  }
  else
  {
    v20 = objc_msgSend(v18, "BOOLValue");
    v19 = v65;
  }
  *((_BYTE *)v19 + 24) = v20;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUHomeFeatureOnboardingKey_CameraRecording_FinishedOnboarding"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v21, "BOOLValue");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUHomeFeatureOnboardingKey_CameraRecording_DismissReminderBanner"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_msgSend(v23, "BOOLValue");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUHomeFeatureOnboardingKey_AccessoryFirmwareUpdate_FinishedOnboarding"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_msgSend(v25, "BOOLValue");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUHomeFeatureOnboardingKey_UtilityDiscovery_FinishedOnboarding"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = objc_msgSend(v27, "BOOLValue");
  v29 = +[HUHomeFeatureOnboardingUtilities hasUserSaidYesToVoiceIdentificationInResults:](HUHomeFeatureOnboardingUtilities, "hasUserSaidYesToVoiceIdentificationInResults:", v5);
  v30 = MEMORY[0x1E0C809B0];
  if (v29)
  {
    +[HUHomeFeatureOnboardingUtilities _checkIdentifyVoicePrerequisitesForHome:](HUHomeFeatureOnboardingUtilities, "_checkIdentifyVoicePrerequisitesForHome:", v41);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v30;
    v60[1] = 3221225472;
    v60[2] = __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke;
    v60[3] = &unk_1E6F50DB0;
    v62 = a1;
    v63 = a2;
    v61 = v41;
    v32 = (id)objc_msgSend(v31, "flatMap:", v60);
    v59[0] = v30;
    v59[1] = 3221225472;
    v59[2] = __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_129;
    v59[3] = &unk_1E6F50DD8;
    v59[4] = buf;
    v59[5] = &v64;
    v33 = (id)objc_msgSend(v31, "flatMap:", v59);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAB0]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v44[0] = v30;
  v44[1] = 3221225472;
  v44[2] = __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_2_130;
  v44[3] = &unk_1E6F50E00;
  v34 = v41;
  v48 = a1;
  v49 = a2;
  v45 = v34;
  v46 = buf;
  v47 = &v64;
  v50 = v38;
  v51 = v37;
  v52 = v22;
  v53 = v24;
  v54 = v40;
  v55 = v39;
  v56 = v17;
  v57 = v26;
  v58 = v28;
  objc_msgSend(v31, "flatMap:", v44);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(buf, 8);

  return v35;
}

id __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v49[4];
  id v50;
  __int128 v51;
  _QWORD v52[4];
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[3];
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v61 = v5;
    v62 = 2112;
    v63 = v6;
    v64 = 1024;
    LODWORD(v65) = objc_msgSend(v3, "BOOLValue");
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@: Voice Identification pre-requisites are satisfied? %{BOOL}d ...", buf, 0x1Cu);

  }
  if (objc_msgSend(v3, "BOOLValue"))
  {
    v7 = objc_alloc(MEMORY[0x1E0D31988]);
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "currentUser");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithHome:user:nameStyle:", v8, v9, 0);

    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(void **)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "user");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v61 = v12;
      v62 = 2112;
      v63 = v13;
      v64 = 2112;
      v65 = v15;
      _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@: ...starting to enable Identify Voice for user %@", buf, 0x20u);

    }
    v16 = objc_msgSend(*(id *)(a1 + 32), "isMultiUserEnabled");
    v17 = MEMORY[0x1E0C809B0];
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      HFLogForCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = *(void **)(a1 + 40);
        NSStringFromSelector(*(SEL *)(a1 + 48));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v61 = v24;
        v62 = 2112;
        v63 = v25;
        _os_log_impl(&dword_1B8E1E000, v23, OS_LOG_TYPE_DEFAULT, "%@:%@: FAIL-SAFE: THIS SHOULD NOT HAPPEN. Enabling Multi User in HomeKit, because we are turning on Identify Voice", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 51);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleError:operationType:options:retryBlock:cancelBlock:", v27, *MEMORY[0x1E0D309F0], 0, 0, 0);

      v28 = (void *)MEMORY[0x1E0D519C0];
      v57[0] = v17;
      v57[1] = 3221225472;
      v57[2] = __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_118;
      v57[3] = &unk_1E6F4C5E8;
      v58 = *(id *)(a1 + 32);
      objc_msgSend(v28, "futureWithErrorOnlyHandlerAdapterBlock:", v57);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v10, "setPlaybackInfluencesForYou:", 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (_os_feature_enabled_impl())
    {
      objc_msgSend(v10, "user");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "home");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "userListeningHistoryUpdateControlForHome:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v32, "mutableCopy");

      objc_msgSend(v10, "home");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "accessories");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = v17;
      v55[1] = 3221225472;
      v55[2] = __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_2;
      v55[3] = &unk_1E6F4D7D8;
      v36 = v33;
      v56 = v36;
      objc_msgSend(v35, "na_each:", v55);

      HFLogForCategory();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v36, "accessories");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "user");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "home");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v61 = v38;
        v62 = 2112;
        v63 = v39;
        v64 = 2112;
        v65 = v40;
        _os_log_impl(&dword_1B8E1E000, v37, OS_LOG_TYPE_DEFAULT, "Updating user listening history setting for accessories: %@ | user: %@ | home: %@", buf, 0x20u);

        v17 = MEMORY[0x1E0C809B0];
      }

      v41 = (void *)MEMORY[0x1E0D519C0];
      v52[0] = v17;
      v52[1] = 3221225472;
      v52[2] = __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_122;
      v52[3] = &unk_1E6F4D600;
      v53 = v10;
      v54 = v36;
      v42 = v36;
      objc_msgSend(v41, "futureWithBlock:", v52);
      v43 = objc_claimAutoreleasedReturnValue();

      v29 = (void *)v43;
    }
    v44 = (void *)MEMORY[0x1E0D519C0];
    v59[0] = v18;
    objc_msgSend(v10, "setEnableIdentifyVoice:", 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v59[1] = v45;
    v59[2] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 3);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "chainFutures:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v17;
    v49[1] = 3221225472;
    v49[2] = __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_126;
    v49[3] = &unk_1E6F50D88;
    v51 = *(_OWORD *)(a1 + 40);
    v50 = v3;
    objc_msgSend(v47, "flatMap:", v49);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    HFLogForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(void **)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v61 = v20;
      v62 = 2112;
      v63 = v21;
      _os_log_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_DEFAULT, "%@:%@: ...NOT enabling Identify Voice.", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

uint64_t __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_118(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "enableMultiUserWithCompletionHandler:", a2);
}

void __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "hf_supportsUserLevelUpdateListeningHistorySetting"))
    objc_msgSend(*(id *)(a1 + 32), "addAccessory:", v3);

}

void __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_122(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_2_123;
  v8[3] = &unk_1E6F4E2D8;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "updateUserListeningHistoryUpdateControl:forHome:completionHandler:", v5, v6, v8);

}

void __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_2_123(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Failed to update user listening history with error: %@", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);
  }
  else
  {
    if (v5)
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Successfully updated user listening history", (uint8_t *)&v6, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }

}

id __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_126(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  __int128 v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = a2;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__7;
  v13 = __Block_byref_object_dispose__7;
  v14 = objc_alloc_init(MEMORY[0x1E0CFE9B0]);
  v4 = (void *)v10[5];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_2_127;
  v7[3] = &unk_1E6F50D10;
  v8 = *(_OWORD *)(a1 + 40);
  v7[4] = &v9;
  objc_msgSend(v4, "homeOnboardingFlowInvoked:completion:", 1, v7);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_2_127(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v6;
      v13 = 2112;
      v14 = v7;
      v15 = 2112;
      v16 = v3;
      _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "%@:%@: ...Error with homeOnboardingFlowInvoked [%@]", (uint8_t *)&v11, 0x20u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@: Successfully invoked AFSettingsConnection homeOnboardingFlowInvoked.", (uint8_t *)&v11, 0x16u);
    goto LABEL_6;
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = 0;

}

id __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_129(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  void *v9;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v5 + 24))
  {
    v6 = 1;
  }
  else
  {
    v6 = objc_msgSend(v3, "BOOLValue");
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  *(_BYTE *)(v5 + 24) = v6;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v7 + 24))
  {
    v8 = 1;
  }
  else
  {
    v8 = objc_msgSend(v4, "BOOLValue");
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v7 + 24) = v8;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __76__HUHomeFeatureOnboardingUtilities_home_processHomeFeatureOnboarderResults___block_invoke_2_130(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  int v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  int v21;
  int v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  int v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D31988]);
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "currentUser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithHome:user:nameStyle:", v5, v6, 0);

  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 56);
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v12 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v36 = 138413058;
    v37 = v9;
    v38 = 2112;
    v39 = v10;
    v40 = 1024;
    v41 = v11;
    v42 = 1024;
    v43 = v12;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ VOICE ID: Onboarding dismissed? %{BOOL}d / Banner dismissed? %{BOOL}d", (uint8_t *)&v36, 0x22u);

  }
  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 56);
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(unsigned __int8 *)(a1 + 72);
    v17 = *(unsigned __int8 *)(a1 + 73);
    v36 = 138413058;
    v37 = v14;
    v38 = 2112;
    v39 = v15;
    v40 = 1024;
    v41 = v16;
    v42 = 1024;
    v43 = v17;
    _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%@:%@ TV VIEWING PROFILE: Onboarding dismissed? %{BOOL}d / Banner dismissed? %{BOOL}d", (uint8_t *)&v36, 0x22u);

  }
  HFLogForCategory();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(a1 + 56);
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(unsigned __int8 *)(a1 + 74);
    v22 = *(unsigned __int8 *)(a1 + 75);
    v36 = 138413058;
    v37 = v19;
    v38 = 2112;
    v39 = v20;
    v40 = 1024;
    v41 = v21;
    v42 = 1024;
    v43 = v22;
    _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "%@:%@ CAMERA RECORDING: Onboarding dismissed? %{BOOL}d / Banner dismissed? %{BOOL}d", (uint8_t *)&v36, 0x22u);

  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    v23 = (id)objc_msgSend(v7, "setDismissIdentifyVoiceReminderBanner:", 1);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v24 = (id)objc_msgSend(v7, "setDismissIdentifyVoiceOnboarding:", 1);
  if (*(_BYTE *)(a1 + 76))
    v25 = (id)objc_msgSend(v7, "setDismissAnnounceOnboarding:", 1);
  if (*(_BYTE *)(a1 + 77))
    v26 = (id)objc_msgSend(v7, "setDismissHomeTheaterOnboarding:", 1);
  if (*(_BYTE *)(a1 + 78))
    v27 = (id)objc_msgSend(v7, "setDismissNaturalLightingOnboarding:", 1);
  if (*(_BYTE *)(a1 + 73))
    v28 = (id)objc_msgSend(v7, "setDismissTVViewingProfilesReminderBanner:", 1);
  if (*(_BYTE *)(a1 + 72))
    v29 = (id)objc_msgSend(v7, "setDismissTVViewingProfilesOnboarding:", 1);
  if (*(_BYTE *)(a1 + 75))
    v30 = (id)objc_msgSend(v7, "setDismissCameraRecordingReminderBanner:", 1);
  if (*(_BYTE *)(a1 + 74))
    v31 = (id)objc_msgSend(v7, "setDismissCameraRecordingOnboarding:", 1);
  if (*(_BYTE *)(a1 + 79))
    v32 = (id)objc_msgSend(v7, "setDismissAccessoryFirmwareUpdateOnboarding:", 1);
  if (*(_BYTE *)(a1 + 80))
    v33 = (id)objc_msgSend(v7, "setDismissUtilityOnboarding:", 1);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

+ (BOOL)_checkIdentifyVoicePrerequisitesSimpleForHome:(id)a3
{
  id v5;
  int v6;
  int v7;
  int v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  void *v31;
  int v32;
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  NSObject *v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "hf_hasHomePods");
  v7 = objc_msgSend(v5, "hf_hasRMVCapableAppleTV");
  v8 = v7;
  if ((v6 & 1) != 0 || v7)
  {
    +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages](HUHomeFeatureOnboardingUtilities, "fetchSupportedVoiceRecognitionLanguages");
    v10 = objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138413058;
      v33 = a1;
      v34 = 2112;
      v35 = v12;
      v36 = 2048;
      v37 = -[NSObject count](v10, "count");
      v38 = 2112;
      v39 = v10;
      _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@ (%lu) supported voice recognition languages %@", (uint8_t *)&v32, 0x2Au);

    }
    if (!v10)
    {
      HFLogForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138412290;
        v33 = v31;
        _os_log_error_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_ERROR, "%@ Error fetching voice recognition languages", (uint8_t *)&v32, 0xCu);

      }
      v9 = 0;
      goto LABEL_30;
    }
    if (((v8 | v6 ^ 1) & 1) != 0)
    {
      if (+[HUHomeFeatureOnboardingUtilities isDeviceUsingASupportedVoiceRecognitionSiriLanguage:shouldFallbackToBestSupportedLanguage:](HUHomeFeatureOnboardingUtilities, "isDeviceUsingASupportedVoiceRecognitionSiriLanguage:shouldFallbackToBestSupportedLanguage:", v10, 0))
      {
        v9 = 1;
LABEL_31:

        goto LABEL_32;
      }
      v13 = 0;
    }
    else
    {
      +[HUHomeFeatureOnboardingUtilities home:createMultiUserLanguageToHomePodsMapping:](HUHomeFeatureOnboardingUtilities, "home:createMultiUserLanguageToHomePodsMapping:", v5, v10);
      v13 = objc_claimAutoreleasedReturnValue();
      HFLogForCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[NSObject count](v13, "count");
        v32 = 138413058;
        v33 = a1;
        v34 = 2112;
        v35 = v15;
        v36 = 2048;
        v37 = v16;
        v38 = 2112;
        v39 = v13;
        _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ languageToHomePodsMapping (%lu) %@", (uint8_t *)&v32, 0x2Au);

      }
      objc_msgSend(v5, "hf_homePods");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "na_any:", &__block_literal_global_132_1);

      if (v18 && !-[NSObject count](v13, "count"))
      {
        HFLogForCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          goto LABEL_28;
        NSStringFromSelector(a2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138412802;
        v33 = a1;
        v34 = 2112;
        v35 = v26;
        v36 = 2112;
        v37 = (uint64_t)v10;
        v27 = "%@:%@: No HomePods on supported voice recognition languages (%@)";
        v28 = v19;
        v29 = 32;
        goto LABEL_27;
      }
      if (+[HUHomeFeatureOnboardingUtilities isDeviceUsingASupportedVoiceRecognitionSiriLanguage:shouldFallbackToBestSupportedLanguage:](HUHomeFeatureOnboardingUtilities, "isDeviceUsingASupportedVoiceRecognitionSiriLanguage:shouldFallbackToBestSupportedLanguage:", v10, 0))
      {
        +[HUHomeFeatureOnboardingUtilities createPersonalIdentityDeviceLanguageMismatchList:](HUHomeFeatureOnboardingUtilities, "createPersonalIdentityDeviceLanguageMismatchList:", v13);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v5, "hf_numberOfHomePods");
        HFLogForCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector(a2);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = -[NSObject count](v19, "count");
          v32 = 138413314;
          v33 = a1;
          v34 = 2112;
          v35 = v22;
          v36 = 2048;
          v37 = v23;
          v38 = 2112;
          v39 = v19;
          v40 = 2048;
          v41 = v20;
          _os_log_impl(&dword_1B8E1E000, v21, OS_LOG_TYPE_DEFAULT, "%@:%@ This is the list of %lu mismatching HomePods %@ out of %lu HomePods", (uint8_t *)&v32, 0x34u);

        }
        if (-[NSObject count](v19, "count") != v20)
        {
          v9 = 1;
          goto LABEL_29;
        }
        HFLogForCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector(a2);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 138412802;
          v33 = a1;
          v34 = 2112;
          v35 = v25;
          v36 = 2048;
          v37 = v20;
          _os_log_impl(&dword_1B8E1E000, v24, OS_LOG_TYPE_DEFAULT, "%@:%@: None of the %lu HomePod(s) in the home match the phone's language", (uint8_t *)&v32, 0x20u);

        }
        goto LABEL_28;
      }
    }
    HFLogForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138412546;
      v33 = a1;
      v34 = 2112;
      v35 = v26;
      v27 = "%@:%@: This iOS device is NOT on a supported voice recognition language";
      v28 = v19;
      v29 = 22;
LABEL_27:
      _os_log_impl(&dword_1B8E1E000, v28, OS_LOG_TYPE_DEFAULT, v27, (uint8_t *)&v32, v29);

    }
LABEL_28:
    v9 = 0;
LABEL_29:

LABEL_30:
    goto LABEL_31;
  }
  v9 = 0;
LABEL_32:

  return v9;
}

uint64_t __82__HUHomeFeatureOnboardingUtilities__checkIdentifyVoicePrerequisitesSimpleForHome___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsMultiUser");
}

+ (id)_checkIdentifyVoicePrerequisitesForHome:(id)a3
{
  if (+[HUHomeFeatureOnboardingUtilities _checkIdentifyVoicePrerequisitesSimpleForHome:](HUHomeFeatureOnboardingUtilities, "_checkIdentifyVoicePrerequisitesSimpleForHome:", a3))
  {
    +[HUHomeFeatureOnboardingUtilities checkVoiceProfileAvailabiltyForLanguage:](HUHomeFeatureOnboardingUtilities, "checkVoiceProfileAvailabiltyForLanguage:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAA0]);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)_userHasSaidYesToShowTVViewingProfilesIn:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("HUTVViewingProfilesOnboardingKey_UserInput"), (_QWORD)v13))
        {
          objc_msgSend(v3, "objectForKey:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v9, "unsignedIntegerValue") || objc_msgSend(v9, "unsignedIntegerValue") == 1)
          {

LABEL_14:
            v11 = 1;
            goto LABEL_15;
          }
          v10 = objc_msgSend(v9, "unsignedIntegerValue");

          if (v10 == 2)
            goto LABEL_14;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_15:

  return v11;
}

+ (BOOL)isDeviceUsingASupportedVoiceRecognitionSiriLanguage:(id)a3 shouldFallbackToBestSupportedLanguage:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  int v15;
  NSObject *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  int v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v4 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "languageCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v10 = 1;
    else
      v10 = !v4;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bestSupportedLanguageCodeForLanguageCode:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      HFLogForCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v22 = a1;
        v23 = 2112;
        v24 = v13;
        v25 = 2112;
        v26 = v9;
        _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "%@:%@: This iOS device has no Siri language, fallback to best supported language: %@. ", buf, 0x20u);

      }
    }
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __126__HUHomeFeatureOnboardingUtilities_isDeviceUsingASupportedVoiceRecognitionSiriLanguage_shouldFallbackToBestSupportedLanguage___block_invoke;
    v19[3] = &unk_1E6F508C8;
    v14 = v9;
    v20 = v14;
    v15 = objc_msgSend(v7, "na_any:", v19);
    HFLogForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v22 = a1;
      v23 = 2112;
      v24 = v17;
      v25 = 2112;
      v26 = v14;
      v27 = 2112;
      v28 = v14;
      v29 = 1024;
      v30 = v15;
      v31 = 2112;
      v32 = v7;
      _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@: This iOS device is on %@. %@ is a supported voice recognition language?: %{BOOL}d, (%@)", buf, 0x3Au);

    }
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

uint64_t __126__HUHomeFeatureOnboardingUtilities_isDeviceUsingASupportedVoiceRecognitionSiriLanguage_shouldFallbackToBestSupportedLanguage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));
  return v7;
}

+ (BOOL)hasUserSaidYesToVoiceIdentificationInResults:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  void *v18;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  NSObject *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = a3;
  v4 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v4)
  {
    v5 = v4;
    v22 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("HUVoiceProfileOnboardingKey_UserInput")))
        {
          -[NSObject objectForKey:](v3, "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "unsignedIntegerValue"))
          {
            HFLogForCategory();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              NSStringFromSelector(a2);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v28 = a1;
              v29 = 2112;
              v30 = v16;
              v17 = "%@:%@: NO: 'no' from Voice Profile Setup";
              goto LABEL_35;
            }
            goto LABEL_36;
          }

          v6 = 1;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("HULanguageOnboardingKey_SetupLanguage_AssistantDevice_UserInput")))
        {
          -[NSObject objectForKey:](v3, "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "unsignedIntegerValue"))
          {
            HFLogForCategory();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              NSStringFromSelector(a2);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v28 = a1;
              v29 = 2112;
              v30 = v16;
              v17 = "%@:%@: NO: 'no' from Assistant Device Setup";
              goto LABEL_35;
            }
LABEL_36:

            v14 = 0;
            v11 = v3;
            goto LABEL_37;
          }

          BYTE4(v22) = 1;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("HULanguageOnboardingKey_SetupLanguage_PersonalDevice_UserInput")))
        {
          -[NSObject objectForKey:](v3, "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "unsignedIntegerValue") != 3 && objc_msgSend(v10, "unsignedIntegerValue") != 4)
          {
            HFLogForCategory();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              NSStringFromSelector(a2);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v28 = a1;
              v29 = 2112;
              v30 = v16;
              v17 = "%@:%@: NO: 'no' from Personal Device Setup";
LABEL_35:
              _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, v17, buf, 0x16u);

            }
            goto LABEL_36;
          }

          LOBYTE(v22) = 1;
        }
      }
      v5 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v22 = 0;
    v6 = 0;
  }

  HFLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if ((v6 & 1) != 0 || (v22 & 0x100000000) != 0 || (v22 & 1) != 0)
  {
    if (v12)
    {
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v28 = a1;
      v29 = 2112;
      v30 = v18;
      v31 = 2112;
      v32 = v3;
      _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@: YES: 'yes' returned for at least one of the voice identification flows (& 0 'no's) in user input results [%@]", buf, 0x20u);

    }
    v14 = 1;
  }
  else
  {
    if (v12)
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v28 = a1;
      v29 = 2112;
      v30 = v13;
      v31 = 2112;
      v32 = v3;
      _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@: NO: 'yes' returned for none of the voice identification flows in user input results [%@]", buf, 0x20u);

    }
    v14 = 0;
  }
LABEL_37:

  return v14;
}

+ (unint64_t)home:(id)a3 checkForOwnerUpgradeRequirementsFromResults:(id)a4
{
  id v7;
  id v8;
  int v9;
  int v10;
  int v11;
  unint64_t v12;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  const char *v17;
  _BOOL4 v18;
  uint64_t v19;
  _BYTE v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v7, "isMultiUserEnabled") & 1) != 0
    || (objc_msgSend(v7, "hf_currentUserIsOwner") & 1) != 0
    || (v9 = objc_msgSend(v7, "hf_hasHomePods"), v10 = objc_msgSend(v7, "hf_hasAppleTVs"), v11 = v10, (v9 & 1) == 0)
    && !v10)
  {
    v12 = 0;
    goto LABEL_6;
  }
  if (v9)
  {
    if (+[HUHomeFeatureOnboardingUtilities _checkIdentifyVoicePrerequisitesSimpleForHome:](HUHomeFeatureOnboardingUtilities, "_checkIdentifyVoicePrerequisitesSimpleForHome:", v7))
    {
      v9 = +[HUHomeFeatureOnboardingUtilities hasUserSaidYesToVoiceIdentificationInResults:](HUHomeFeatureOnboardingUtilities, "hasUserSaidYesToVoiceIdentificationInResults:", v8);
      HFLogForCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (!v15)
          goto LABEL_22;
        NSStringFromSelector(a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v20 = 138412546;
        *(_QWORD *)&v20[4] = a1;
        *(_WORD *)&v20[12] = 2112;
        *(_QWORD *)&v20[14] = v16;
        v17 = "%@:%@ Found at least 1 HomePod which will work for Multi User if the owner upgrades";
      }
      else
      {
        if (!v15)
          goto LABEL_22;
        NSStringFromSelector(a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v20 = 138412546;
        *(_QWORD *)&v20[4] = a1;
        *(_WORD *)&v20[12] = 2112;
        *(_QWORD *)&v20[14] = v16;
        v17 = "%@:%@ Found at least 1 HomePod which could work for Multi User if the owner upgrades, but user did not tur"
              "n on Identify Voice, so ignoring";
      }
      _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, v17, v20, 0x16u);

LABEL_22:
      if (!v11)
        goto LABEL_23;
LABEL_14:
      v18 = +[HUHomeFeatureOnboardingUtilities _userHasSaidYesToShowTVViewingProfilesIn:](HUHomeFeatureOnboardingUtilities, "_userHasSaidYesToShowTVViewingProfilesIn:", v8, *(_OWORD *)v20, *(_QWORD *)&v20[16], v21);
      if ((v9 & v18 & 1) != 0)
      {
        v12 = 3;
        goto LABEL_6;
      }
      v19 = 2;
      if (!v18)
        v19 = 0;
      goto LABEL_24;
    }
    v9 = 0;
  }
  if (v11)
    goto LABEL_14;
LABEL_23:
  v19 = 0;
LABEL_24:
  if (v9)
    v12 = 1;
  else
    v12 = v19;
LABEL_6:

  return v12;
}

+ (unint64_t)home:(id)a3 checkForMultiUserDeviceUpgradeRequirements:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _BOOL4 v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  unint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  _BOOL4 v22;
  uint64_t v23;
  _QWORD v25[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  _BOOL4 v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v33 = objc_msgSend(v7, "hf_hasHomePods");
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v29 = objc_msgSend(v7, "hf_hasAppleTVs");
  if (!*((_BYTE *)v31 + 24) && !*((_BYTE *)v27 + 24))
    goto LABEL_15;
  objc_msgSend(v7, "accessories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __84__HUHomeFeatureOnboardingUtilities_home_checkForMultiUserDeviceUpgradeRequirements___block_invoke;
  v25[3] = &unk_1E6F50E48;
  v25[4] = &v30;
  v25[5] = &v26;
  objc_msgSend(v9, "na_each:", v25);

  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *((_BYTE *)v31 + 24) == 0;
    v13 = *((_BYTE *)v27 + 24) == 0;
    *(_DWORD *)buf = 138413058;
    v35 = a1;
    v36 = 2112;
    v37 = v11;
    v38 = 1024;
    v39 = v12;
    v40 = 1024;
    v41 = v13;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ Some HomePods already support Multi User features?: %{BOOL}d, Some Apple TVs already support Multi User features?: %{BOOL}d", buf, 0x22u);

  }
  if (!*((_BYTE *)v31 + 24))
  {
    if (*((_BYTE *)v27 + 24))
    {
      v16 = 0;
LABEL_20:
      HFLogForCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v35 = a1;
        v36 = 2112;
        v37 = v21;
        _os_log_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_DEFAULT, "%@:%@ Found at least 1 AppleTV which needs upgrade for Multi User", buf, 0x16u);

      }
      v22 = +[HUHomeFeatureOnboardingUtilities _userHasSaidYesToShowTVViewingProfilesIn:](HUHomeFeatureOnboardingUtilities, "_userHasSaidYesToShowTVViewingProfilesIn:", v8);
      if ((v16 & v22 & 1) != 0)
      {
        v18 = 3;
        goto LABEL_31;
      }
      v23 = 2;
      if (!v22)
        v23 = 0;
      goto LABEL_28;
    }
LABEL_15:
    v18 = 0;
    goto LABEL_31;
  }
  if (!+[HUHomeFeatureOnboardingUtilities _checkIdentifyVoicePrerequisitesSimpleForHome:](HUHomeFeatureOnboardingUtilities, "_checkIdentifyVoicePrerequisitesSimpleForHome:", v7))
  {
    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v35 = a1;
      v36 = 2112;
      v37 = v17;
      _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ Found at least 1 HomePod which could need upgrade for Multi User, but prequisistes aren't satisfied, so ignoring", buf, 0x16u);

    }
    goto LABEL_18;
  }
  if (!+[HUHomeFeatureOnboardingUtilities hasUserSaidYesToVoiceIdentificationInResults:](HUHomeFeatureOnboardingUtilities, "hasUserSaidYesToVoiceIdentificationInResults:", v8))
  {
    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v35 = a1;
      v36 = 2112;
      v37 = v19;
      _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ Found at least 1 HomePod which could need upgrade for Multi User, but user did not turn on Identify Voice, so ignoring", buf, 0x16u);

    }
LABEL_18:
    v16 = 0;
    goto LABEL_19;
  }
  HFLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v35 = a1;
    v36 = 2112;
    v37 = v15;
    _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ Found at least 1 HomePod which needs upgrade for Multi User", buf, 0x16u);

  }
  v16 = 1;
LABEL_19:

  if (*((_BYTE *)v27 + 24))
    goto LABEL_20;
  v23 = 0;
LABEL_28:
  if (v16)
    v18 = 1;
  else
    v18 = v23;
LABEL_31:
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return v18;
}

void __84__HUHomeFeatureOnboardingUtilities_home_checkForMultiUserDeviceUpgradeRequirements___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "hf_isHomePod") && objc_msgSend(v3, "supportsMultiUser"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  if (objc_msgSend(v3, "hf_isAppleTV") && objc_msgSend(v3, "supportsMultiUser"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

+ (id)groupedFeaturesForOnboardingFlowKeyPaths:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char v13;
  void *v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;
  int v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    v9 = *MEMORY[0x1E0D30688];
    v10 = *MEMORY[0x1E0D30660];
    v29 = *MEMORY[0x1E0D30680];
    v28 = *MEMORY[0x1E0D306A8];
    v26 = *MEMORY[0x1E0D30668];
    v27 = *MEMORY[0x1E0D306A0];
    v24 = *MEMORY[0x1E0D306B8];
    v25 = *MEMORY[0x1E0D30698];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "isEqualToString:", v9, v24);
        v14 = &unk_1E7042B70;
        if ((v13 & 1) != 0)
          goto LABEL_15;
        v15 = objc_msgSend(v12, "isEqualToString:", v10);
        v14 = &unk_1E7042B88;
        if ((v15 & 1) != 0)
          goto LABEL_15;
        v16 = objc_msgSend(v12, "isEqualToString:", v29);
        v14 = &unk_1E7042BA0;
        if ((v16 & 1) != 0)
          goto LABEL_15;
        v17 = objc_msgSend(v12, "isEqualToString:", v28);
        v14 = &unk_1E7042BB8;
        if ((v17 & 1) != 0)
          goto LABEL_15;
        v18 = objc_msgSend(v12, "isEqualToString:", v27);
        v14 = &unk_1E7042BD0;
        if ((v18 & 1) == 0)
        {
          v19 = objc_msgSend(v12, "isEqualToString:", v26);
          v14 = &unk_1E7042BE8;
          if ((v19 & 1) == 0)
          {
            v20 = objc_msgSend(v12, "isEqualToString:", v25);
            v14 = &unk_1E7042C00;
            if ((v20 & 1) == 0)
            {
              if (!objc_msgSend(v12, "isEqualToString:", v24))
                continue;
              v21 = _os_feature_enabled_impl();
              v14 = &unk_1E7042C18;
              if (!v21)
                continue;
            }
          }
        }
LABEL_15:
        objc_msgSend(v4, "addObject:", v14);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v7);
  }

  v22 = (void *)objc_msgSend(v4, "copy");
  return v22;
}

+ (id)analyzeHomeAssistantDevicesForSupportedVoiceRecognitionLanguages:(id)a3 home:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  uint64_t v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v5 = a4;
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  objc_msgSend(v5, "hf_allHomePodProfileContainers");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_safeAddObjectsFromArray:");
  objc_msgSend(v5, "hf_allSiriEndPointProfileContainers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_safeAddObjectsFromArray:", v8);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
  if (v10)
  {
    v11 = v10;
    v35 = v8;
    v36 = v5;
    v37 = v6;
    v39 = 0;
    v40 = 0;
    v12 = *(_QWORD *)v45;
    v13 = 0x1E0CBA000uLL;
    v14 = 0x1E0D31000uLL;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v45 != v12)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_opt_class();
        v17 = v16;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v18 = v17;
        else
          v18 = 0;
        v19 = v18;

        objc_msgSend(*(id *)(v14 + 1328), "siriLanguageOptionFor:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        HFLogForCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector(a2);
          v43 = v19;
          v22 = v11;
          v23 = v12;
          v24 = v14;
          v25 = v13;
          v26 = v9;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v49 = v27;
          v50 = 2112;
          v51 = v17;
          v52 = 2112;
          v53 = (uint64_t)v20;
          _os_log_impl(&dword_1B8E1E000, v21, OS_LOG_TYPE_DEFAULT, "%@ Fetched selectedLanguageOption language option for mediaProfile [%@] = %@", buf, 0x20u);

          v9 = v26;
          v13 = v25;
          v14 = v24;
          v12 = v23;
          v11 = v22;
          v19 = v43;
        }

        if (v20)
        {
          objc_msgSend(v20, "recognitionLanguage");
          v28 = objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v42, "containsObject:", v28) & 1) != 0)
          {
            v29 = v39;
            if (!v39)
            {
              v29 = (void *)objc_opt_new();
              v39 = v29;
            }
          }
          else
          {
            v29 = v40;
            if (!v40)
            {
              v29 = (void *)objc_opt_new();
              v40 = v29;
            }
          }
          objc_msgSend(v29, "addObject:", v19, v35, v36);
        }
        else
        {
          HFLogForCategory();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v38, "count");
            *(_DWORD *)buf = 138412802;
            v49 = v30;
            v50 = 2112;
            v51 = v19;
            v52 = 2048;
            v53 = v31;
            _os_log_error_impl(&dword_1B8E1E000, v28, OS_LOG_TYPE_ERROR, "%@ Recognition Language unavailable for device with MediaProfile [%@] (1 of %lu HomePods)", buf, 0x20u);

          }
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    }
    while (v11);

    v6 = v37;
    if (v40)
      objc_msgSend(v37, "setObject:forKey:", v40, CFSTR("languageMismatch"));
    v8 = v35;
    v5 = v36;
    v32 = v39;
    if (v39)
      objc_msgSend(v37, "setObject:forKey:", v39, CFSTR("supportingLanguages"));
    v33 = v40;
  }
  else
  {

    v32 = 0;
    v33 = 0;
  }

  return v6;
}

+ (id)home:(id)a3 createMultiUserLanguageToHomePodsMapping:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v29;
  id obj;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v32 = a4;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "hf_allHomePodProfileContainers");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_safeAddObjectsFromArray:");
  objc_msgSend(v5, "hf_allSiriEndPointProfileContainers");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_safeAddObjectsFromArray:");
  v7 = (void *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
    v29 = v7;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_opt_class();
        v13 = v12;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
        v15 = v14;

        objc_msgSend(MEMORY[0x1E0D31530], "siriLanguageOptionFor:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          objc_msgSend(v16, "recognitionLanguage");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          HFLogForCategory();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            NSStringFromSelector(a2);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v38 = a1;
            v39 = 2112;
            v40 = v20;
            v41 = 2112;
            v42 = v15;
            v43 = 2112;
            v44 = v18;
            _os_log_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_DEFAULT, "%@:%@ Found HomePod %@ with language %@", buf, 0x2Au);

            v7 = v29;
          }

          if (objc_msgSend(v32, "containsObject:", v18))
          {
            objc_msgSend(v7, "objectForKey:", v18);
            v21 = objc_claimAutoreleasedReturnValue();
            if (!v21)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v21 = objc_claimAutoreleasedReturnValue();
            }
            -[NSObject addObject:](v21, "addObject:", v15);
            objc_msgSend(v7, "setObject:forKey:", v21, v18);
          }
          else
          {
            HFLogForCategory();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              NSStringFromSelector(a2);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "recognitionLanguage");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v38 = v22;
              v39 = 2112;
              v40 = v15;
              v41 = 2112;
              v42 = v23;
              _os_log_impl(&dword_1B8E1E000, v21, OS_LOG_TYPE_DEFAULT, "%@ MultiUser Language Check: HomePod [%@] in unsupported language: %@", buf, 0x20u);

              v7 = v29;
            }
          }

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v9);
  }

  v24 = (void *)objc_msgSend(v7, "copy");
  return v24;
}

+ (id)createPersonalIdentityDeviceLanguageMismatchList:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "languageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isEqualToString:", v6, (_QWORD)v15) & 1) == 0)
          objc_msgSend(v4, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

+ (id)processLanguageAndMediaProfileInfo:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[3];
  _QWORD v22[3];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v10, (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CFE900], "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localizedNameForSiriLanguage:inDisplayLanguage:", v10, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v21[0] = CFSTR("languageCodeKey");
        v21[1] = CFSTR("localizedLanguageNameKey");
        v22[0] = v10;
        v22[1] = v13;
        v21[2] = CFSTR("mediaProfilesKey");
        v22[2] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v14);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v7);
  }

  v15 = (void *)objc_msgSend(v4, "copy");
  return v15;
}

+ (id)checkVoiceProfileAvailabiltyForLanguage:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  SEL v18;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "languageCode");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  v9 = (void *)MEMORY[0x1E0D519C0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__HUHomeFeatureOnboardingUtilities_checkVoiceProfileAvailabiltyForLanguage___block_invoke;
  v15[3] = &unk_1E6F50E98;
  v17 = a1;
  v18 = a2;
  v16 = v7;
  v10 = v7;
  objc_msgSend(v9, "futureWithBlock:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reschedule:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __76__HUHomeFeatureOnboardingUtilities_checkVoiceProfileAvailabiltyForLanguage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ Starting to check for Hey Siri Voice Profile in iCloud for %@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0DA8C20], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__HUHomeFeatureOnboardingUtilities_checkVoiceProfileAvailabiltyForLanguage___block_invoke_159;
  v11[3] = &unk_1E6F50E70;
  v14 = *(_OWORD *)(a1 + 40);
  v12 = v9;
  v13 = v3;
  v10 = v3;
  objc_msgSend(v8, "isVoiceProfileUploadedToiCloudForLanguageCode:withCompletionBlock:", v12, v11);

}

void __76__HUHomeFeatureOnboardingUtilities_checkVoiceProfileAvailabiltyForLanguage___block_invoke_159(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 48);
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v12 = 138413314;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 1024;
    v19 = a3;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Hey Siri Voice Profile for %@ available in iCloud?: %{BOOL}d | error = %@", (uint8_t *)&v12, 0x30u);

  }
  v10 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "finishWithResult:error:", v11, v5);

}

+ (BOOL)isVoiceProfileAvailableOnThisDeviceForLanguage:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "languageCode");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0DA8C20], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isSATEnrolledForSiriProfileId:forLanguageCode:", 0, v7);

  HFLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138413058;
    v15 = a1;
    v16 = 2112;
    v17 = v12;
    v18 = 2112;
    v19 = v7;
    v20 = 1024;
    v21 = v10;
    _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@ Hey Siri Voice Profile exists on this device for language: %@ ? Answer: %{BOOL}d", (uint8_t *)&v14, 0x26u);

  }
  return v10;
}

@end
