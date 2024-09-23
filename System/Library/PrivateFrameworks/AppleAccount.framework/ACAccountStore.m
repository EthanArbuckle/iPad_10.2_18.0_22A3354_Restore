@implementation ACAccountStore

uint64_t __54__ACAccountStore_AppleAccount__aa_primaryAppleAccount__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "aa_isAccountClass:", CFSTR("primary"));
}

uint64_t __56__ACAccountStore_AppleAccount__aa_dataSeparatedAccounts__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isDataSeparatedAccount");
}

uint64_t __59__ACAccountStore_AppleAccount__aa_accountsForAccountClass___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "aa_isAccountClass:", *(_QWORD *)(a1 + 32));
}

uint64_t __78__ACAccountStore_AppleAccount__aa_primaryAppleAccountWithPreloadedDataclasses__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "aa_isAccountClass:", CFSTR("primary"));
}

void __69__ACAccountStore_AppleAccount__aa_primaryAppleAccountWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(a2, "aaf_firstObjectPassingTest:", &__block_literal_global_18_0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __69__ACAccountStore_AppleAccount__aa_primaryAppleAccountWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "aa_isAccountClass:", CFSTR("primary"));
}

uint64_t __60__ACAccountStore_AppleAccount__aa_appleAccountWithUsername___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "aa_appleIDAliases");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 32));

  }
  return v5;
}

BOOL __60__ACAccountStore_AppleAccount__aa_appleAccountWithPersonID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;
  uint64_t v5;

  objc_msgSend(a2, "aa_personID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 1;
  if ((objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || objc_msgSend(v3, "longLongValue") < 1
      || (v5 = objc_msgSend(v3, "longLongValue"), v5 != objc_msgSend(*(id *)(a1 + 32), "longLongValue")))
    {
      v4 = 0;
    }
  }

  return v4;
}

uint64_t __59__ACAccountStore_AppleAccount__aa_appleAccountWithAltDSID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "aa_altDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __97__ACAccountStore_AppleAccount__aa_updatePropertiesForAppleAccount_options_serverInfo_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  if (a2 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.appleaccount"), -1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_performUpdateRequestWithAccount:serverInfo:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }

}

void __87__ACAccountStore_AppleAccount___performUpdateRequestWithAccount_serverInfo_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  unint64_t Nanoseconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  void *v12;
  NSObject *v13;
  double v14;
  uint64_t v15;
  void *v16;
  int v17;
  NSObject *v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  double v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  Nanoseconds = _AASignpostGetNanoseconds(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  _AASignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 48);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    _AAErrorUnderlyingError(v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67240192;
    LODWORD(v25) = objc_msgSend(v12, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v10, OS_SIGNPOST_INTERVAL_END, v11, "GetAccountSettings", " error=%{public,signpost.telemetry:number2,name=error}d ", buf, 8u);

  }
  _AASignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (double)Nanoseconds / 1000000000.0;
    v15 = *(_QWORD *)(a1 + 48);
    _AAErrorUnderlyingError(v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "code");
    *(_DWORD *)buf = 134218496;
    v25 = v15;
    v26 = 2048;
    v27 = v14;
    v28 = 1026;
    v29 = v17;
    _os_log_impl(&dword_19EACA000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: GetAccountSettings  error=%{public,signpost.telemetry:number2,name=error}d ", buf, 0x1Cu);

  }
  dispatch_get_global_queue(25, 0);
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__ACAccountStore_AppleAccount___performUpdateRequestWithAccount_serverInfo_completion___block_invoke_26;
  block[3] = &unk_1E416E518;
  v21 = v6;
  v22 = *(id *)(a1 + 32);
  v23 = *(id *)(a1 + 40);
  v19 = v6;
  dispatch_async(v18, block);

}

void __87__ACAccountStore_AppleAccount___performUpdateRequestWithAccount_serverInfo_completion___block_invoke_26(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("localizedError"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("MOBILEME_TERMS_OF_SERVICE_UPDATE"));

    if (v7)
    {
      _AALogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 40);
        v17 = 138412290;
        v18 = v9;
        _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "Looks like we need to verify terms for account: %@", (uint8_t *)&v17, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 40), "aa_setNeedsToVerifyTerms:", 1);
    }
    else
    {
      objc_msgSend(v4, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("localizedError"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("ACCOUNT_IN_SUSPENDED_MODE"));

      if (v12)
      {
        _AALogSystem();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = *(_QWORD *)(a1 + 40);
          v17 = 138412290;
          v18 = v14;
          _os_log_impl(&dword_19EACA000, v13, OS_LOG_TYPE_DEFAULT, "Looks like account: %@ is suspended.", (uint8_t *)&v17, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 32), "responseDictionary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("userInfo"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
          objc_msgSend(*(id *)(a1 + 40), "setAccountProperty:forKey:", v16, CFSTR("suspendedInfo"));

      }
      else if (!v4)
      {
        objc_msgSend(*(id *)(a1 + 40), "aa_updateWithProvisioningResponse:", v3);
      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, 0);
  }
}

void __93__ACAccountStore_AppleAccount__aa_loginAndUpdateiCloudAccount_delegateParams_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  BOOL v10;
  int v11;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  int v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    objc_msgSend(v8, "error");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v8)
    v10 = v9 == 0;
  else
    v10 = 0;
  v11 = !v10;
  _AALogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = CFSTR("YES");
    if (v11)
      v13 = CFSTR("NO");
    v19 = 138412290;
    v20 = v13;
    _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "AppleAccount Authenticated: %@", (uint8_t *)&v19, 0xCu);
  }

  if (v11)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(v8, "convertToProvisioningResponse");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "responseDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 32), "aa_updateWithProvisioningResponse:", v14);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      _AALogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        __93__ACAccountStore_AppleAccount__aa_loginAndUpdateiCloudAccount_delegateParams_withCompletion___block_invoke_cold_1(v8, v16);

      v17 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id, void *))(v17 + 16))(v17, 0, v8, v18);

    }
  }

}

uint64_t __71__ACAccountStore_AppleAccount__aa_registerAppleAccount_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__ACAccountStore_AppleAccount__aa_authKitAccountForAltDSID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "aa_altDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __93__ACAccountStore_AppleAccount__aa_loginAndUpdateiCloudAccount_delegateParams_withCompletion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "responseDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_fault_impl(&dword_19EACA000, a2, OS_LOG_TYPE_FAULT, "Cannot convert AALoginAccountResponse to AAProvisioningResponse: %@", (uint8_t *)&v4, 0xCu);

}

@end
