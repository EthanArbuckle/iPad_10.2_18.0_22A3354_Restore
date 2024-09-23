@implementation HMHomeManager

uint64_t __52__HMHomeManager_HFAdditions__hf_homeWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

id __51__HMHomeManager_HFAdditions__hf_homeFutureForName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "name", (_QWORD)v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32));

        if ((v10 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v3;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v5)
        continue;
      break;
    }
  }

  v11 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "futureWithError:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v13;
}

uint64_t __44__HMHomeManager_HFAdditions__hf_homeForURL___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

uint64_t __45__HMHomeManager_HFAdditions__hf_homeForName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __65__HMHomeManager_HFAdditions__hf_setHasSeenOnboardingWelcomeView___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  __CFString *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(9uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v9 = *(unsigned __int8 *)(a1 + 48);
    v10 = 138412546;
    v11 = CFSTR("hasSeenOnboardingWelcomeView");
    v12 = 1024;
    v13 = v9;
  }

  objc_msgSend(*(id *)(a1 + 32), "_cached_hasSeenOnboardingWelcomeViewNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);

  if (v6 == v7)
    objc_msgSend(*(id *)(a1 + 32), "set_cached_hasSeenOnboardingWelcomeViewNumber:", 0);
  if (v4)
  {
    HFLogForCategory(9uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "*** Setting HasSeenOnboardingWelcomeView using hf_updateApplicationDataFuture has FAILED =  [%@]  ***", (uint8_t *)&v10, 0xCu);
    }

  }
}

void __63__HMHomeManager_HFAdditions__hf_setSeenNewFeaturesViewVersion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(9uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 48);
    v6 = 138412546;
    v7 = CFSTR("lastOnboardingNewFeaturesVersionSeen");
    v8 = 2048;
    v9 = v5;
  }

  objc_msgSend(*(id *)(a1 + 32), "_cached_lastOnboardingNewFeaturesVersionSeenNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);

  if (v3 == v4)
    objc_msgSend(*(id *)(a1 + 32), "set_cached_lastOnboardingNewFeaturesVersionSeenNumber:", 0);
}

void __60__HMHomeManager_HFAdditions__hf_updateApplicationDataFuture__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "applicationData");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_updateApplicationData:handleError:completionHandler:", v4, 0, v3);

}

uint64_t __61__HMHomeManager_HFAdditions__hf_enableEventLogOnboardingFlag__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateDidOnboardEventLogWithCompletionHandler:", &__block_literal_global_20_2);
}

void __61__HMHomeManager_HFAdditions__hf_enableEventLogOnboardingFlag__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    HFLogForCategory(0x44uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Error onboarding Activity History: %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

void __91__HMHomeManager_HFApplicationData__hf_updateApplicationData_handleError_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(unsigned __int8 *)(a1 + 40);
  v6 = a2;
  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "handleError:operationType:options:retryBlock:cancelBlock:", v6, CFSTR("HFOperationUpdateApplicationDataCloudSync"), 0, 0, 0);
  else
    objc_msgSend(v4, "logError:operationDescription:", v6, CFSTR("HFOperationUpdateApplicationDataCloudSync"));

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
