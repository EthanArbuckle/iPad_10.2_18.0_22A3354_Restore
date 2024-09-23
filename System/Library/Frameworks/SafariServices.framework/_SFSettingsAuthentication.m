@implementation _SFSettingsAuthentication

+ (BOOL)authenticationRequiresPasscode
{
  id v2;
  char v3;
  id v4;
  void *v5;
  BOOL v6;
  id v8;

  v2 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
  v8 = 0;
  v3 = objc_msgSend(v2, "canEvaluatePolicy:error:", 2, &v8);
  v4 = v8;
  v5 = v4;
  v6 = (v3 & 1) != 0 || objc_msgSend(v4, "code") != -5;

  return v6;
}

+ (int64_t)biometryTypeCurrentlyAvailableForDevice
{
  id v2;
  id v3;
  void *v4;
  int64_t v5;
  id v7;

  v2 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
  v7 = 0;
  objc_msgSend(v2, "canEvaluatePolicy:error:", 1, &v7);
  v3 = v7;
  v4 = v3;
  if (v3 && (unint64_t)(objc_msgSend(v3, "code") + 7) < 3)
    v5 = 0;
  else
    v5 = objc_msgSend(v2, "biometryType");

  return v5;
}

+ (void)authenticateForSettings:(id)a3 allowAuthenticationReuse:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;
  id v27;
  id v28;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
  v11 = v10;
  if (v6)
    objc_msgSend(v10, "setTouchIDAuthenticationAllowableReuseDuration:", 10.0);
  v12 = objc_msgSend(v8, "authenticationPolicy");
  v28 = 0;
  v13 = objc_msgSend(v11, "canEvaluatePolicy:error:", v12, &v28);
  v14 = v28;
  v15 = v14;
  if ((v13 & 1) != 0)
  {
    objc_msgSend(a1, "_localAuthenticationOptionsWithAuthenticationContext:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __96___SFSettingsAuthentication_authenticateForSettings_allowAuthenticationReuse_completionHandler___block_invoke_2;
    v21[3] = &unk_1E4AC1D48;
    v22 = v8;
    v23 = v9;
    v17 = v9;
    v18 = v8;
    objc_msgSend(v11, "evaluatePolicy:options:reply:", v12, v16, v21);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __96___SFSettingsAuthentication_authenticateForSettings_allowAuthenticationReuse_completionHandler___block_invoke;
    block[3] = &unk_1E4AC5CB0;
    v25 = v8;
    v26 = v14;
    v27 = v9;
    v19 = v9;
    v20 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v16 = v25;
  }

}

+ (void)pushSettingsAfterAuthentication:(id)a3 onBehalfOfViewController:(id)a4 resourceDictionary:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v12, "safari_stringForKey:", *MEMORY[0x1E0D8B238]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D8B270]);

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __123___SFSettingsAuthentication_pushSettingsAfterAuthentication_onBehalfOfViewController_resourceDictionary_completionHandler___block_invoke;
  v20[3] = &unk_1E4AC5CD8;
  v21 = v11;
  v22 = v10;
  v23 = v12;
  v24 = v13;
  v16 = v13;
  v17 = v12;
  v18 = v10;
  v19 = v11;
  objc_msgSend(a1, "authenticateForSettings:allowAuthenticationReuse:completionHandler:", v18, v15, v20);

}

+ (id)_localAuthenticationOptionsWithAuthenticationContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "customLocalAuthenticationOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v3, "showsAuthenticationPromptAsTitle"))
    {
      v10[0] = &unk_1E4B25F78;
      +[SFAutoFillAuthenticationUtilities passcodePromptForViewingSavedAccounts](SFAutoFillAuthenticationUtilities, "passcodePromptForViewingSavedAccounts");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10[1] = &unk_1E4B25F90;
      v11[0] = v5;
      objc_msgSend(v3, "authenticationPrompt");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = &unk_1E4B25FA8;
      objc_msgSend(v3, "authenticationPrompt");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v4;
}

@end
