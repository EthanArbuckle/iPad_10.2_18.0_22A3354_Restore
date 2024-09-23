@implementation ACAccountStore

void __43__ACAccountStore_accessKeysForAccountType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    _ACLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

uint64_t __69__ACAccountStore_requestAccessToAccountsWithType_options_completion___block_invoke_2(uint64_t a1)
{
  unint64_t Nanoseconds;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  const __CFString *v6;
  const __CFString *v7;
  NSObject *v8;
  uint64_t result;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  Nanoseconds = _ACSignpostGetNanoseconds(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  _ACSignpostLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (*(_BYTE *)(a1 + 64))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    v7 = *(const __CFString **)(a1 + 32);
    if (!v7)
      v7 = &stru_1E4894AE8;
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v4, OS_SIGNPOST_INTERVAL_END, v5, "RequestAccessToAccountType", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  _ACSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(const __CFString **)(a1 + 48);
    v11 = CFSTR("YES");
    v12 = *(const __CFString **)(a1 + 32);
    if (!*(_BYTE *)(a1 + 64))
      v11 = CFSTR("NO");
    v14 = 134218754;
    v15 = v10;
    v13 = &stru_1E4894AE8;
    v16 = 2048;
    v17 = (double)Nanoseconds / 1000000000.0;
    v18 = 2112;
    v19 = v11;
    if (v12)
      v13 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_debug_impl(&dword_1A2BCD000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: RequestAccessToAccountType %@%@", (uint8_t *)&v14, 0x2Au);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32));
  return result;
}

void __69__ACAccountStore_requestAccessToAccountsWithType_options_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  __int128 v12;
  char v13;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __69__ACAccountStore_requestAccessToAccountsWithType_options_completion___block_invoke_2;
  block[3] = &unk_1E48930B0;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  block[1] = 3221225472;
  v12 = *(_OWORD *)(a1 + 48);
  v13 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveBundleID, 0);
  objc_storeStrong((id *)&self->__testCache, 0);
  objc_storeStrong((id *)&self->__primaryAppleAccountCache, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_longLivedRemoteAccountStoreSessionExpirer, 0);
  objc_storeStrong((id *)&self->_longLivedRemoteAccountStoreSession, 0);
  objc_storeStrong((id *)&self->_remoteAccountStoreSessionExpirer, 0);
  objc_storeStrong((id *)&self->_remoteAccountStoreSession, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_accountCache, 0);
  objc_storeStrong(&self->_daemonAccountStoreDidChangeObserver, 0);
}

uint64_t __61__ACAccountStore_accountsWithAccountType_options_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __55__ACAccountStore_accountTypeWithIdentifier_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)requestAccessToAccountsWithType:(ACAccountType *)accountType options:(NSDictionary *)options completion:(ACAccountStoreRequestAccessCompletionHandler)completion
{
  ACAccountType *v8;
  NSDictionary *v9;
  ACAccountStoreRequestAccessCompletionHandler v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  const __CFString *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  ACAccountType *v27;
  NSDictionary *v28;
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[4];
  ACAccountType *v33;
  NSDictionary *v34;
  id v35;
  _QWORD v36[5];
  id v37;
  os_signpost_id_t v38;
  uint64_t v39;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  NSDictionary *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = accountType;
  v9 = options;
  v10 = completion;
  v11 = _os_activity_create(&dword_1A2BCD000, "accounts/request-access", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  -[ACAccountType accessKeys](v8, "accessKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v9)
    v14 = v13 == 0;
  else
    v14 = 0;
  if (v14)
  {
    v15 = CFSTR("Access options are not permitted for this account type. The options argument must be nil.");
LABEL_9:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], v15);
    goto LABEL_10;
  }
  if (!v9 && v13)
  {
    v15 = CFSTR("Access options are required for this account type.");
    goto LABEL_9;
  }
LABEL_10:
  _ACSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = _ACSignpostCreate(v16);
  v19 = v18;

  _ACSignpostLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_DWORD *)buf = 138412546;
    v42 = (os_signpost_id_t)v8;
    v43 = 2112;
    v44 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v17, "RequestAccessToAccountType", "%@ : %@", buf, 0x16u);
  }

  _ACSignpostLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v42 = v17;
    v43 = 2112;
    v44 = v8;
    v45 = 2112;
    v46 = v9;
    _os_log_debug_impl(&dword_1A2BCD000, v22, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: RequestAccessToAccountType %@ : %@", buf, 0x20u);
  }

  v23 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __69__ACAccountStore_requestAccessToAccountsWithType_options_completion___block_invoke;
  v36[3] = &unk_1E48930D8;
  v36[4] = self;
  v38 = v17;
  v39 = v19;
  v24 = v10;
  v37 = v24;
  v25 = (void *)MEMORY[0x1A858A038](v36);
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v23;
  v32[1] = 3221225472;
  v32[2] = __69__ACAccountStore_requestAccessToAccountsWithType_options_completion___block_invoke_123;
  v32[3] = &unk_1E4892C40;
  v27 = v8;
  v33 = v27;
  v28 = v9;
  v34 = v28;
  v35 = v25;
  v30[0] = v23;
  v30[1] = 3221225472;
  v30[2] = __69__ACAccountStore_requestAccessToAccountsWithType_options_completion___block_invoke_3;
  v30[3] = &unk_1E48924C8;
  v29 = v35;
  v30[4] = self;
  v31 = v29;
  ac_dispatch_remote(v26, v32, v30);

  os_activity_scope_leave(&state);
}

- (id)accessKeysForAccountType:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  unint64_t Nanoseconds;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  id v20;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  __int128 *p_buf;
  os_activity_scope_state_s state;
  uint8_t v27[4];
  os_signpost_id_t v28;
  __int16 v29;
  double v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  const __CFString *v34;
  __int128 buf;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1A2BCD000, "accounts/request-access", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _ACSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _ACSignpostCreate(v6);
  v9 = v8;

  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "AccessKeysForAccountType", "%@", (uint8_t *)&buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore accessKeysForAccountType:].cold.1();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__0;
  v38 = __Block_byref_object_dispose__0;
  v39 = 0;
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __43__ACAccountStore_accessKeysForAccountType___block_invoke;
  v23[3] = &unk_1E4893088;
  v14 = v4;
  v24 = v14;
  p_buf = &buf;
  ac_dispatch_remote_sync(v13, v23, 0);

  Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  _ACSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    v18 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v27 = 138412546;
    v28 = v18;
    v29 = 2112;
    v30 = COERCE_DOUBLE(&stru_1E4894AE8);
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v17, OS_SIGNPOST_INTERVAL_END, v7, "AccessKeysForAccountType", "%@%@", v27, 0x16u);
  }

  _ACSignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v27 = 134218754;
    v22 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    v28 = v7;
    v29 = 2048;
    v30 = (double)Nanoseconds / 1000000000.0;
    v31 = 2112;
    v32 = v22;
    v33 = 2112;
    v34 = &stru_1E4894AE8;
    _os_log_debug_impl(&dword_1A2BCD000, v19, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccessKeysForAccountType %@%@", v27, 0x2Au);
  }

  v20 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);
  return v20;
}

void __42__ACAccountStore_accountsWithAccountType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    _ACLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __42__ACAccountStore_accountsWithAccountType___block_invoke_2_cold_1();

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    objc_msgSend(*(id *)(a1 + 32), "_cache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cacheAccounts:forSuffix:", v6, *(_QWORD *)(a1 + 40));

  }
}

void __56__ACAccountStore_accountsWithAccountType_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    _ACLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __42__ACAccountStore_accountsWithAccountType___block_invoke_2_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
    objc_msgSend(*(id *)(a1 + 32), "_cache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cacheAccounts:forSuffix:", v6, *(_QWORD *)(a1 + 40));

  }
}

void __79__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _ACLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  if (v5 | v6)
    v8 = (void *)v5;
  else
    v8 = (void *)MEMORY[0x1E0C9AA60];
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v8);
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "_cache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cacheAccounts:forSuffix:", v5, *(_QWORD *)(a1 + 32));

  }
}

void __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1A2BCD000, v0, v1, "\"Error returned from daemon: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (NSArray)accountsWithAccountType:(ACAccountType *)accountType
{
  ACAccountType *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *p_super;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  unint64_t Nanoseconds;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  id v27;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  ACAccountType *v35;
  ACAccountStore *v36;
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  os_activity_scope_state_s state;
  uint8_t v46[128];
  uint8_t buf[4];
  os_signpost_id_t v48;
  __int16 v49;
  double v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  const __CFString *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = accountType;
  v5 = _os_activity_create(&dword_1A2BCD000, "accounts/accounts-with-type-sync", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  -[ACAccountType identifier](v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ACNotifyAccountCache suffixForAccountsForAccountType:fetchOptions:](ACNotifyAccountCache, "suffixForAccountsForAccountType:fetchOptions:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__0;
  v43 = __Block_byref_object_dispose__0;
  -[ACAccountStore _cache](self, "_cache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cachedAccountsForSuffix:", v7);
  v44 = (id)objc_claimAutoreleasedReturnValue();

  if (v40[5])
  {
    _ACLogSystem();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
    {
      -[ACAccountType identifier](v4, "identifier");
      objc_claimAutoreleasedReturnValue();
      -[ACAccountStore accountsWithAccountType:].cold.2();
    }
  }
  else
  {
    _ACSignpostLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = _ACSignpostCreate(v10);
    v13 = v12;

    _ACSignpostLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_DWORD *)buf = 138412290;
      v48 = (os_signpost_id_t)v4;
      _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "AccountsWithTypeSync", "%@", buf, 0xCu);
    }

    _ACSignpostLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[ACAccountStore accountsWithAccountType:].cold.1();

    -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __42__ACAccountStore_accountsWithAccountType___block_invoke;
    v34[3] = &unk_1E4892E10;
    v38 = &v39;
    v35 = v4;
    v36 = self;
    v37 = v7;
    ac_dispatch_remote_sync(v17, v34, &__block_literal_global_65);

    Nanoseconds = _ACSignpostGetNanoseconds(v11, v13);
    _ACSignpostLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      v21 = v40[5];
      *(_DWORD *)buf = 138412546;
      v48 = v21;
      v49 = 2112;
      v50 = COERCE_DOUBLE(&stru_1E4894AE8);
      _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v20, OS_SIGNPOST_INTERVAL_END, v11, "AccountsWithTypeSync", "%@%@", buf, 0x16u);
    }

    _ACSignpostLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218754;
      v29 = v40[5];
      v48 = v11;
      v49 = 2048;
      v50 = (double)Nanoseconds / 1000000000.0;
      v51 = 2112;
      v52 = v29;
      v53 = 2112;
      v54 = &stru_1E4894AE8;
      _os_log_debug_impl(&dword_1A2BCD000, v22, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsWithTypeSync %@%@", buf, 0x2Au);
    }

    p_super = &v35->super;
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v23 = (id)v40[5];
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(v23);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "_setAccountStore:", self, (_QWORD)v30);
      }
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
    }
    while (v24);
  }

  v27 = (id)v40[5];
  _Block_object_dispose(&v39, 8);

  os_activity_scope_leave(&state);
  return (NSArray *)v27;
}

- (OS_dispatch_queue)replyQueue
{
  return self->_replyQueue;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_daemonAccountStoreDidChangeObserver);

  v4.receiver = self;
  v4.super_class = (Class)ACAccountStore;
  -[ACAccountStore dealloc](&v4, sel_dealloc);
}

- (ACAccountStore)initWithRemoteEndpoint:(id)a3 effectiveBundleID:(id)a4
{
  id v7;
  id v8;
  ACAccountStore *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *replyQueue;
  uint64_t v13;
  ACTimedExpirer *remoteAccountStoreSessionExpirer;
  uint64_t v15;
  ACTimedExpirer *longLivedRemoteAccountStoreSessionExpirer;
  uint64_t v17;
  NSMutableDictionary *accountCache;
  void *v19;
  void *v20;
  uint64_t v21;
  id daemonAccountStoreDidChangeObserver;
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;

  v7 = a3;
  v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)ACAccountStore;
  v9 = -[ACAccountStore init](&v27, sel_init);
  if (v9)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("ACAccountStoreReply", v10);
    replyQueue = v9->_replyQueue;
    v9->_replyQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_effectiveBundleID, a4);
    objc_storeStrong((id *)&v9->_endpoint, a3);
    v9->_remoteAccountStoreSessionLock._os_unfair_lock_opaque = 0;
    +[ACTimedExpirer expirerWithTimeout:](ACTimedExpirer, "expirerWithTimeout:", ACRemoteConnectionTimeout);
    v13 = objc_claimAutoreleasedReturnValue();
    remoteAccountStoreSessionExpirer = v9->_remoteAccountStoreSessionExpirer;
    v9->_remoteAccountStoreSessionExpirer = (ACTimedExpirer *)v13;

    v9->_longLivedRemoteAccountStoreSessionLock._os_unfair_lock_opaque = 0;
    +[ACTimedExpirer expirerWithTimeout:](ACTimedExpirer, "expirerWithTimeout:", ACRemoteConnectionTimeout);
    v15 = objc_claimAutoreleasedReturnValue();
    longLivedRemoteAccountStoreSessionExpirer = v9->_longLivedRemoteAccountStoreSessionExpirer;
    v9->_longLivedRemoteAccountStoreSessionExpirer = (ACTimedExpirer *)v15;

    v17 = objc_opt_new();
    accountCache = v9->_accountCache;
    v9->_accountCache = (NSMutableDictionary *)v17;

    objc_initWeak(&location, v9);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[ACNotificationRebroadcaster sharedRebroadcaster](ACNotificationRebroadcaster, "sharedRebroadcaster");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __59__ACAccountStore_initWithRemoteEndpoint_effectiveBundleID___block_invoke;
    v24[3] = &unk_1E4892568;
    objc_copyWeak(&v25, &location);
    objc_msgSend(v19, "addObserverForName:object:queue:usingBlock:", CFSTR("ACDAccountStoreDidChangeNotification"), v20, 0, v24);
    v21 = objc_claimAutoreleasedReturnValue();
    daemonAccountStoreDidChangeObserver = v9->_daemonAccountStoreDidChangeObserver;
    v9->_daemonAccountStoreDidChangeObserver = (id)v21;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __61__ACAccountStore_accountTypeWithAccountTypeIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    _ACLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_cache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cacheAccountType:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;

}

- (void)accountTypeWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  void (**v15)(_QWORD, _QWORD, _QWORD);
  _QWORD v16[4];
  id v17;
  ACAccountStore *v18;
  id v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  _QWORD v21[5];
  id v22;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1A2BCD000, "accounts/account-type-with-identifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __55__ACAccountStore_accountTypeWithIdentifier_completion___block_invoke;
    v21[3] = &unk_1E4892CE0;
    v21[4] = self;
    v22 = v7;
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A858A038](v21);
    -[ACAccountStore _cache](self, "_cache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cachedAccountTypeWithIdentifier:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "setAccountStore:", self);
      ((void (**)(_QWORD, void *, _QWORD))v10)[2](v10, v12, 0);
    }
    else
    {
      -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v9;
      v16[1] = 3221225472;
      v16[2] = __55__ACAccountStore_accountTypeWithIdentifier_completion___block_invoke_3;
      v16[3] = &unk_1E4892D30;
      v17 = v6;
      v18 = self;
      v19 = 0;
      v20 = v10;
      v14[0] = v9;
      v14[1] = 3221225472;
      v14[2] = __55__ACAccountStore_accountTypeWithIdentifier_completion___block_invoke_59;
      v14[3] = &unk_1E48924C8;
      v14[4] = self;
      v15 = v20;
      ac_dispatch_remote(v13, v16, v14);

    }
  }
  os_activity_scope_leave(&state);

}

void __55__ACAccountStore_accountTypeWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__ACAccountStore_accountTypeWithIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E4892450;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __61__ACAccountStore_childAccountsForAccount_withTypeIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "parentAccountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (void)accountsWithAccountType:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  uint64_t v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  _QWORD v28[5];
  void (**v29)(_QWORD, _QWORD, _QWORD);
  os_signpost_id_t v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  ACAccountStore *v34;
  id v35;
  void (**v36)(_QWORD, _QWORD, _QWORD);
  unint64_t v37;
  os_signpost_id_t v38;
  uint64_t v39;
  _QWORD v40[5];
  id v41;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v44;
  __int16 v45;
  unint64_t v46;
  __int16 v47;
  unint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = _os_activity_create(&dword_1A2BCD000, "accounts/accounts-with-type-with-options", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  if (v9)
  {
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __61__ACAccountStore_accountsWithAccountType_options_completion___block_invoke;
    v40[3] = &unk_1E4892478;
    v40[4] = self;
    v41 = v9;
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A858A038](v40);
    objc_msgSend(v8, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[ACNotifyAccountCache suffixForAccountsForAccountType:fetchOptions:](ACNotifyAccountCache, "suffixForAccountsForAccountType:fetchOptions:", v12, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[ACAccountStore _cache](self, "_cache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cachedAccountsForSuffix:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      _ACLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "identifier");
        objc_claimAutoreleasedReturnValue();
        -[ACAccountStore accountsWithAccountType:completion:].cold.2();
      }

      ((void (**)(_QWORD, void *, _QWORD))v11)[2](v11, v15, 0);
    }
    else
    {
      _ACSignpostLogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = _ACSignpostCreate(v17);
      v27 = v19;
      v20 = v18;

      _ACSignpostLogSystem();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        *(_DWORD *)buf = 138412546;
        v44 = (os_signpost_id_t)v8;
        v45 = 2048;
        v46 = a4;
        _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "AccountsWithType", "%@: %lu", buf, 0x16u);
      }

      _ACSignpostLogSystem();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        v44 = v20;
        v45 = 2112;
        v46 = (unint64_t)v8;
        v47 = 2048;
        v48 = a4;
        _os_log_debug_impl(&dword_1A2BCD000, v23, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: AccountsWithType %@: %lu", buf, 0x20u);
      }

      v26 = v10;
      -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = MEMORY[0x1E0C809B0];
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __61__ACAccountStore_accountsWithAccountType_options_completion___block_invoke_70;
      v32[3] = &unk_1E4892F20;
      v37 = a4;
      v33 = v8;
      v34 = self;
      v35 = v13;
      v38 = v20;
      v39 = v27;
      v36 = v11;
      v28[0] = v25;
      v28[1] = 3221225472;
      v28[2] = __61__ACAccountStore_accountsWithAccountType_options_completion___block_invoke_72;
      v28[3] = &unk_1E4892EF8;
      v30 = v20;
      v31 = v27;
      v28[4] = self;
      v29 = v36;
      ac_dispatch_remote(v24, v32, v28);

      v10 = v26;
    }

  }
  os_activity_scope_leave(&state);

}

void __61__ACAccountStore_accountsWithAccountType_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v10++), "_setAccountStore:", *(_QWORD *)(a1 + 32));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }
  v11 = *(void **)(a1 + 40);
  v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__ACAccountStore_accountsWithAccountType_options_completion___block_invoke_2;
  block[3] = &unk_1E4892450;
  v17 = v6;
  v18 = v11;
  v16 = v5;
  v13 = v6;
  v14 = v5;
  dispatch_async(v12, block);

}

- (id)accountsWithAccountTypeIdentifiers:(id)a3 preloadedProperties:(id)a4 error:(id *)a5
{
  __CFString *v8;
  __CFString *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  unint64_t Nanoseconds;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  const __CFString *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  id v30;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  os_signpost_id_t spid;
  void *v40;
  __CFString *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[7];
  _QWORD v47[4];
  NSObject *v48;
  __CFString *v49;
  id v50;
  ACAccountStore *v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  os_activity_scope_state_s state;
  uint8_t v67[128];
  uint8_t buf[4];
  os_signpost_id_t v69;
  __int16 v70;
  const __CFString *v71;
  __int16 v72;
  __CFString *v73;
  __int16 v74;
  const __CFString *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  v9 = (__CFString *)a4;
  v10 = _os_activity_create(&dword_1A2BCD000, "accounts/accounts-with-types-sync", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__0;
  v64 = __Block_byref_object_dispose__0;
  v65 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__0;
  v58 = __Block_byref_object_dispose__0;
  v59 = 0;
  v41 = v8;
  if (-[__CFString count](v8, "count") == 1 && !-[__CFString count](v9, "count"))
  {
    -[__CFString firstObject](v8, "firstObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[ACNotifyAccountCache suffixForAccountsForAccountType:fetchOptions:](ACNotifyAccountCache, "suffixForAccountsForAccountType:fetchOptions:", v32, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    -[ACAccountStore _cache](self, "_cache");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "cachedAccountsForSuffix:", v40);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)v61[5];
    v61[5] = v34;

  }
  else
  {
    v40 = 0;
  }
  if (v61[5])
  {
    _ACLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[__CFString firstObject](v8, "firstObject");
      objc_claimAutoreleasedReturnValue();
      -[ACAccountStore accountsWithAccountType:].cold.2();
    }
  }
  else
  {
    _ACSignpostLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    spid = _ACSignpostCreate(v12);
    v14 = v13;

    _ACSignpostLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_DWORD *)buf = 138412546;
      v69 = (os_signpost_id_t)v41;
      v70 = 2112;
      v71 = v9;
      _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v16, OS_SIGNPOST_INTERVAL_BEGIN, spid, "AccountsWithTypesWithPropertiesSync", "%@: %@", buf, 0x16u);
    }

    _ACSignpostLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v69 = spid;
      v70 = 2112;
      v71 = v41;
      v72 = 2112;
      v73 = v9;
      _os_log_debug_impl(&dword_1A2BCD000, v17, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: AccountsWithTypesWithPropertiesSync %@: %@", buf, 0x20u);
    }

    -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __79__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_error___block_invoke;
    v47[3] = &unk_1E4892F70;
    v48 = v41;
    v49 = v9;
    v52 = &v54;
    v53 = &v60;
    v50 = v40;
    v51 = self;
    v46[0] = v19;
    v46[1] = 3221225472;
    v46[2] = __79__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_error___block_invoke_76;
    v46[3] = &unk_1E4892F98;
    v46[5] = &v60;
    v46[6] = &v54;
    v46[4] = self;
    ac_dispatch_remote_sync(v18, v47, v46);

    Nanoseconds = _ACSignpostGetNanoseconds(spid, v14);
    _ACSignpostLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      v23 = v61[5];
      v24 = (const __CFString *)v55[5];
      if (!v24)
        v24 = &stru_1E4894AE8;
      *(_DWORD *)buf = 138412546;
      v69 = v23;
      v70 = 2112;
      v71 = v24;
      _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v22, OS_SIGNPOST_INTERVAL_END, spid, "AccountsWithTypesWithProperties", "%@%@", buf, 0x16u);
    }

    _ACSignpostLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v36 = (__CFString *)v61[5];
      v37 = (const __CFString *)v55[5];
      *(_DWORD *)buf = 134218754;
      v69 = spid;
      v70 = 2048;
      *(double *)&v71 = (double)Nanoseconds / 1000000000.0;
      v72 = 2112;
      v73 = v36;
      if (v37)
        v38 = v37;
      else
        v38 = &stru_1E4894AE8;
      v74 = 2112;
      v75 = v38;
      _os_log_debug_impl(&dword_1A2BCD000, v25, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsWithTypesWithProperties %@%@", buf, 0x2Au);
    }

    v11 = v48;
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v26 = (id)v61[5];
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v67, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v43 != v28)
          objc_enumerationMutation(v26);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "_setAccountStore:", self);
      }
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v67, 16);
    }
    while (v27);
  }

  if (a5)
    *a5 = objc_retainAutorelease((id)v55[5]);
  v30 = (id)v61[5];

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);

  os_activity_scope_leave(&state);
  return v30;
}

- (id)accountTypeWithAccountTypeIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[4];
  id v16;
  ACAccountStore *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = _os_activity_create(&dword_1A2BCD000, "accounts/account-type-with-identifier-sync", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__0;
  v30 = __Block_byref_object_dispose__0;
  -[ACAccountStore _cache](self, "_cache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cachedAccountTypeWithIdentifier:", v6);
  v31 = (id)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  v9 = (void *)v27[5];
  if (!v9)
  {
    -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __61__ACAccountStore_accountTypeWithAccountTypeIdentifier_error___block_invoke;
    v15[3] = &unk_1E4892CB8;
    v16 = v6;
    v17 = self;
    v18 = &v26;
    v19 = &v20;
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __61__ACAccountStore_accountTypeWithAccountTypeIdentifier_error___block_invoke_58;
    v14[3] = &unk_1E4892BA0;
    v14[4] = self;
    v14[5] = &v20;
    ac_dispatch_remote_sync(v10, v15, v14);

    v9 = (void *)v27[5];
  }
  objc_msgSend(v9, "setAccountStore:", self);
  if (a4)
    *a4 = objc_retainAutorelease((id)v21[5]);
  v12 = (id)v27[5];
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  os_activity_scope_leave(&state);

  return v12;
}

- (id)accountsWithAccountType:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  unint64_t Nanoseconds;
  NSObject *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  const __CFString *v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  id v32;
  unint64_t v34;
  const __CFString *v35;
  const __CFString *v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[6];
  _QWORD v43[4];
  NSObject *v44;
  ACAccountStore *v45;
  id v46;
  uint64_t *v47;
  uint64_t *v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  os_activity_scope_state_s state;
  uint8_t v63[128];
  uint8_t buf[4];
  os_signpost_id_t v65;
  __int16 v66;
  unint64_t v67;
  __int16 v68;
  unint64_t v69;
  __int16 v70;
  const __CFString *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = _os_activity_create(&dword_1A2BCD000, "accounts/accounts-with-type-with-options-sync", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[ACNotifyAccountCache suffixForAccountsForAccountType:fetchOptions:](ACNotifyAccountCache, "suffixForAccountsForAccountType:fetchOptions:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__0;
  v60 = __Block_byref_object_dispose__0;
  -[ACAccountStore _cache](self, "_cache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cachedAccountsForSuffix:", v10);
  v61 = (id)objc_claimAutoreleasedReturnValue();

  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__0;
  v54 = __Block_byref_object_dispose__0;
  v55 = 0;
  if (v57[5])
  {
    _ACLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v7, "identifier");
      objc_claimAutoreleasedReturnValue();
      -[ACAccountStore accountsWithAccountType:].cold.2();
    }
  }
  else
  {
    _ACSignpostLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = _ACSignpostCreate(v13);
    v16 = v15;

    _ACSignpostLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_DWORD *)buf = 138412546;
      v65 = (os_signpost_id_t)v7;
      v66 = 2048;
      v67 = a4;
      _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v14, "AccountsWithTypeSync", "%@: %lu", buf, 0x16u);
    }

    _ACSignpostLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v65 = v14;
      v66 = 2112;
      v67 = (unint64_t)v7;
      v68 = 2048;
      v69 = a4;
      _os_log_debug_impl(&dword_1A2BCD000, v19, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: AccountsWithTypeSync %@: %lu", buf, 0x20u);
    }

    -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __56__ACAccountStore_accountsWithAccountType_options_error___block_invoke;
    v43[3] = &unk_1E4892E80;
    v49 = a4;
    v47 = &v50;
    v48 = &v56;
    v44 = v7;
    v45 = self;
    v46 = v10;
    v42[0] = v21;
    v42[1] = 3221225472;
    v42[2] = __56__ACAccountStore_accountsWithAccountType_options_error___block_invoke_66;
    v42[3] = &unk_1E4892BA0;
    v42[4] = self;
    v42[5] = &v50;
    ac_dispatch_remote_sync(v20, v43, v42);

    Nanoseconds = _ACSignpostGetNanoseconds(v14, v16);
    _ACSignpostLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      v25 = v57[5];
      v26 = (const __CFString *)v51[5];
      if (!v26)
        v26 = &stru_1E4894AE8;
      *(_DWORD *)buf = 138412546;
      v65 = v25;
      v66 = 2112;
      v67 = (unint64_t)v26;
      _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v24, OS_SIGNPOST_INTERVAL_END, v14, "AccountsWithTypeSync", "%@%@", buf, 0x16u);
    }

    _ACSignpostLogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v34 = v57[5];
      v35 = (const __CFString *)v51[5];
      *(_DWORD *)buf = 134218754;
      v65 = v14;
      v66 = 2048;
      *(double *)&v67 = (double)Nanoseconds / 1000000000.0;
      v68 = 2112;
      v69 = v34;
      if (v35)
        v36 = v35;
      else
        v36 = &stru_1E4894AE8;
      v70 = 2112;
      v71 = v36;
      _os_log_debug_impl(&dword_1A2BCD000, v27, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsWithTypeSync %@%@", buf, 0x2Au);
    }

    v12 = v44;
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v28 = (id)v57[5];
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v38, v63, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v39 != v30)
          objc_enumerationMutation(v28);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "_setAccountStore:", self);
      }
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v38, v63, 16);
    }
    while (v29);
  }

  if (a5)
    *a5 = objc_retainAutorelease((id)v51[5]);
  v32 = (id)v57[5];
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v56, 8);
  os_activity_scope_leave(&state);

  return v32;
}

- (id)_cache
{
  void *v3;

  -[ACAccountStore _testCache](self, "_testCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[ACAccountStore _testCache](self, "_testCache");
  else
    +[ACAccountStoreCache sharedCache](ACAccountStoreCache, "sharedCache");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (ACAccountStoreCache)_testCache
{
  return (ACAccountStoreCache *)objc_getProperty(self, a2, 96, 1);
}

id __43__ACAccountStore_remoteAccountStoreSession__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  ACRemoteAccountStoreSession *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id location;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[4])
  {
    v3 = -[ACRemoteAccountStoreSession initWithListenerEndpoint:]([ACRemoteAccountStoreSession alloc], "initWithListenerEndpoint:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v3;

    v6 = *(_QWORD **)(a1 + 32);
    v7 = (void *)v6[4];
    objc_msgSend(v6, "effectiveBundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEffectiveBundleID:", v8);

    v2 = *(_QWORD **)(a1 + 32);
  }
  objc_initWeak(&location, v2);
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__ACAccountStore_remoteAccountStoreSession__block_invoke_2;
  v12[3] = &unk_1E4892B00;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v9, "scheduleExpiration:", v12);
  v10 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  return v10;
}

- (ACRemoteAccountStoreSession)remoteAccountStoreSession
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__ACAccountStore_remoteAccountStoreSession__block_invoke;
  v3[3] = &unk_1E4892B28;
  v3[4] = self;
  ac_unfair_lock_perform_with_result(&self->_remoteAccountStoreSessionLock, v3);
  return (ACRemoteAccountStoreSession *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)effectiveBundleID
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

void __79__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  __int128 v11;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_error___block_invoke_2;
  v8[3] = &unk_1E4892E58;
  v11 = *(_OWORD *)(a1 + 64);
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v9 = v6;
  v10 = v7;
  objc_msgSend(a2, "accountsWithAccountTypeIdentifiers:preloadedProperties:completion:", v4, v5, v8);

}

+ (ACAccountStore)defaultStore
{
  if (defaultStore_onceToken != -1)
    dispatch_once(&defaultStore_onceToken, &__block_literal_global_1);
  return (ACAccountStore *)(id)sharedAccountStore;
}

- (id)enabledDataclassesForAccount:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  unint64_t Nanoseconds;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  const __CFString *v21;
  NSObject *v22;
  id v23;
  uint64_t v25;
  const __CFString *v26;
  const __CFString *v27;
  NSObject *v28;
  _QWORD v29[6];
  _QWORD v30[4];
  id v31;
  __int128 *p_buf;
  uint64_t *v33;
  uint64_t v34;
  const __CFString **v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  os_activity_scope_state_s state;
  uint8_t v41[4];
  os_signpost_id_t v42;
  __int16 v43;
  double v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  const __CFString *v48;
  __int128 buf;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v28 = _os_activity_create(&dword_1A2BCD000, "accounts/enabled-dataclasses-for-account", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v28, &state);
  _ACSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = _ACSignpostCreate(v7);
  v10 = v9;

  _ACSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "EnabledDataclassesForAccount", "%@", (uint8_t *)&buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore enabledDataclassesForAccount:error:].cold.1();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__0;
  v52 = __Block_byref_object_dispose__0;
  v53 = 0;
  v34 = 0;
  v35 = (const __CFString **)&v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__0;
  v38 = __Block_byref_object_dispose__0;
  v39 = 0;
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __53__ACAccountStore_enabledDataclassesForAccount_error___block_invoke;
  v30[3] = &unk_1E4892B78;
  v16 = v6;
  v31 = v16;
  p_buf = &buf;
  v33 = &v34;
  v29[0] = v15;
  v29[1] = 3221225472;
  v29[2] = __53__ACAccountStore_enabledDataclassesForAccount_error___block_invoke_157;
  v29[3] = &unk_1E4892BA0;
  v29[4] = self;
  v29[5] = &v34;
  ac_dispatch_remote_sync(v14, v30, v29);

  if (a4)
    *a4 = (id)objc_retainAutorelease((id)v35[5]);
  Nanoseconds = _ACSignpostGetNanoseconds(v8, v10);
  _ACSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    v20 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    v21 = v35[5];
    if (*(double *)&v21 == 0.0)
      *(double *)&v21 = COERCE_DOUBLE(&stru_1E4894AE8);
    *(_DWORD *)v41 = 138412546;
    v42 = v20;
    v43 = 2112;
    v44 = *(double *)&v21;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v19, OS_SIGNPOST_INTERVAL_END, v8, "EnabledDataclassesForAccount", "%@%@", v41, 0x16u);
  }

  _ACSignpostLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v25 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    v26 = v35[5];
    *(_DWORD *)v41 = 134218754;
    v42 = v8;
    v43 = 2048;
    v44 = (double)Nanoseconds / 1000000000.0;
    v45 = 2112;
    v46 = v25;
    if (v26)
      v27 = v26;
    else
      v27 = &stru_1E4894AE8;
    v47 = 2112;
    v48 = v27;
    _os_log_debug_impl(&dword_1A2BCD000, v22, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: EnabledDataclassesForAccount %@%@", v41, 0x2Au);
  }

  v23 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

  return v23;
}

void __30__ACAccountStore_defaultStore__block_invoke()
{
  ACAccountStore *v0;
  void *v1;

  if (!sharedAccountStore)
  {
    v0 = objc_alloc_init(ACAccountStore);
    v1 = (void *)sharedAccountStore;
    sharedAccountStore = (uint64_t)v0;

  }
}

- (ACAccountStore)init
{
  return -[ACAccountStore initWithRemoteEndpoint:effectiveBundleID:](self, "initWithRemoteEndpoint:effectiveBundleID:", 0, 0);
}

- (ACAccountType)accountTypeWithAccountTypeIdentifier:(NSString *)typeIdentifier
{
  return (ACAccountType *)-[ACAccountStore accountTypeWithAccountTypeIdentifier:error:](self, "accountTypeWithAccountTypeIdentifier:error:", typeIdentifier, 0);
}

uint64_t __43__ACAccountStore_accessKeysForAccountType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__ACAccountStore_accessKeysForAccountType___block_invoke_2;
  v4[3] = &unk_1E4893238;
  v2 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "accessKeysForAccountType:handler:", v2, v4);
}

- (id)credentialForAccount:(id)a3
{
  return -[ACAccountStore credentialForAccount:error:](self, "credentialForAccount:error:", a3, 0);
}

uint64_t __61__ACAccountStore_accountTypeWithAccountTypeIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__ACAccountStore_accountTypeWithAccountTypeIdentifier_error___block_invoke_2;
  v4[3] = &unk_1E4892C90;
  v5 = *(_OWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 56);
  return objc_msgSend(a2, "accountTypeWithIdentifier:handler:", v2, v4);
}

+ (id)_obsoleteAccountTypeIDsToRemove
{
  if (_obsoleteAccountTypeIDsToRemove_onceToken != -1)
    dispatch_once(&_obsoleteAccountTypeIDsToRemove_onceToken, &__block_literal_global_195);
  return (id)_obsoleteAccountTypeIDsToRemove__obsolteAccountTypeIDs;
}

void __56__ACAccountStore_accountsWithAccountType_options_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  __int128 v7;
  _QWORD v8[5];
  __int128 v9;
  uint64_t v10;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__ACAccountStore_accountsWithAccountType_options_error___block_invoke_2;
  v8[3] = &unk_1E4892E58;
  v3 = *(_QWORD *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7 = *(_OWORD *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 64);
  v8[4] = v4;
  v6 = (id)v7;
  v9 = v7;
  objc_msgSend(a2, "accountsWithAccountType:options:completion:", v5, v3, v8);

}

- (id)credentialForAccount:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  unint64_t Nanoseconds;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  const __CFString *v21;
  NSObject *v22;
  id v23;
  uint64_t v25;
  const __CFString *v26;
  const __CFString *v27;
  NSObject *v28;
  _QWORD v29[6];
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  __int128 *p_buf;
  uint64_t v34;
  const __CFString **v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  os_activity_scope_state_s state;
  uint8_t v41[4];
  os_signpost_id_t v42;
  __int16 v43;
  double v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  const __CFString *v48;
  __int128 buf;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v28 = _os_activity_create(&dword_1A2BCD000, "accounts/credential-for-account", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v28, &state);
  _ACSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = _ACSignpostCreate(v7);
  v10 = v9;

  _ACSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CredentialForAccount", "%@", (uint8_t *)&buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore credentialForAccount:error:].cold.1();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__0;
  v52 = __Block_byref_object_dispose__0;
  v53 = 0;
  v34 = 0;
  v35 = (const __CFString **)&v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__0;
  v38 = __Block_byref_object_dispose__0;
  v39 = 0;
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __45__ACAccountStore_credentialForAccount_error___block_invoke;
  v30[3] = &unk_1E4892B78;
  v16 = v6;
  v31 = v16;
  v32 = &v34;
  p_buf = &buf;
  v29[0] = v15;
  v29[1] = 3221225472;
  v29[2] = __45__ACAccountStore_credentialForAccount_error___block_invoke_140;
  v29[3] = &unk_1E4892BA0;
  v29[4] = self;
  v29[5] = &v34;
  ac_dispatch_remote_sync(v14, v30, v29);

  objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "_setOwningAccount:", v16);
  if (a4)
    *a4 = (id)objc_retainAutorelease((id)v35[5]);
  Nanoseconds = _ACSignpostGetNanoseconds(v8, v10);
  _ACSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    v20 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    v21 = v35[5];
    if (*(double *)&v21 == 0.0)
      *(double *)&v21 = COERCE_DOUBLE(&stru_1E4894AE8);
    *(_DWORD *)v41 = 138412546;
    v42 = v20;
    v43 = 2112;
    v44 = *(double *)&v21;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v19, OS_SIGNPOST_INTERVAL_END, v8, "CredentialForAccount", "%@%@", v41, 0x16u);
  }

  _ACSignpostLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v25 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    v26 = v35[5];
    *(_DWORD *)v41 = 134218754;
    v42 = v8;
    v43 = 2048;
    v44 = (double)Nanoseconds / 1000000000.0;
    v45 = 2112;
    v46 = v25;
    if (v26)
      v27 = v26;
    else
      v27 = &stru_1E4894AE8;
    v47 = 2112;
    v48 = v27;
    _os_log_debug_impl(&dword_1A2BCD000, v22, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: CredentialForAccount %@%@", v41, 0x2Au);
  }

  v23 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

  return v23;
}

- (id)childAccountsForAccount:(id)a3 withTypeIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  _BYTE v26[128];
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v27[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccountStore accountsWithAccountTypeIdentifiers:error:](self, "accountsWithAccountTypeIdentifiers:error:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3880];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __61__ACAccountStore_childAccountsForAccount_withTypeIdentifier___block_invoke;
  v24[3] = &unk_1E4893648;
  v11 = v6;
  v25 = v11;
  objc_msgSend(v10, "predicateWithBlock:", v24);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filteredArrayUsingPredicate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v18++), "_setAccountStore:", self, (_QWORD)v20);
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v16);
  }

  return v14;
}

- (id)accountsWithAccountTypeIdentifiers:(id)a3 error:(id *)a4
{
  return -[ACAccountStore accountsWithAccountTypeIdentifiers:preloadedProperties:error:](self, "accountsWithAccountTypeIdentifiers:preloadedProperties:error:", a3, 0, a4);
}

- (id)accountWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  unint64_t Nanoseconds;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  const __CFString *v21;
  NSObject *v22;
  id v23;
  uint64_t v25;
  const __CFString *v26;
  const __CFString *v27;
  NSObject *v28;
  _QWORD v29[6];
  _QWORD v30[4];
  id v31;
  __int128 *p_buf;
  uint64_t *v33;
  uint64_t v34;
  const __CFString **v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  os_activity_scope_state_s state;
  uint8_t v41[4];
  os_signpost_id_t v42;
  __int16 v43;
  double v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  const __CFString *v48;
  __int128 buf;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v28 = _os_activity_create(&dword_1A2BCD000, "accounts/account-with-identifier-sync", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v28, &state);
  _ACSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = _ACSignpostCreate(v7);
  v10 = v9;

  _ACSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "AccountWithIdentifierSync", "%@", (uint8_t *)&buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore accountWithIdentifier:error:].cold.1();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__0;
  v52 = __Block_byref_object_dispose__0;
  v53 = 0;
  v34 = 0;
  v35 = (const __CFString **)&v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__0;
  v38 = __Block_byref_object_dispose__0;
  v39 = 0;
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __46__ACAccountStore_accountWithIdentifier_error___block_invoke;
  v30[3] = &unk_1E4892B78;
  v16 = v6;
  v31 = v16;
  p_buf = &buf;
  v33 = &v34;
  v29[0] = v15;
  v29[1] = 3221225472;
  v29[2] = __46__ACAccountStore_accountWithIdentifier_error___block_invoke_49;
  v29[3] = &unk_1E4892BA0;
  v29[4] = self;
  v29[5] = &v34;
  ac_dispatch_remote_sync(v14, v30, v29);

  objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "_setAccountStore:", self);
  if (a4)
    *a4 = (id)objc_retainAutorelease((id)v35[5]);
  Nanoseconds = _ACSignpostGetNanoseconds(v8, v10);
  _ACSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    v20 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    v21 = v35[5];
    if (*(double *)&v21 == 0.0)
      *(double *)&v21 = COERCE_DOUBLE(&stru_1E4894AE8);
    *(_DWORD *)v41 = 138412546;
    v42 = v20;
    v43 = 2112;
    v44 = *(double *)&v21;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v19, OS_SIGNPOST_INTERVAL_END, v8, "AccountWithIdentifierSync", "%@%@", v41, 0x16u);
  }

  _ACSignpostLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v25 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    v26 = v35[5];
    *(_DWORD *)v41 = 134218754;
    v42 = v8;
    v43 = 2048;
    v44 = (double)Nanoseconds / 1000000000.0;
    v45 = 2112;
    v46 = v25;
    if (v26)
      v27 = v26;
    else
      v27 = &stru_1E4894AE8;
    v47 = 2112;
    v48 = v27;
    _os_log_debug_impl(&dword_1A2BCD000, v22, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountWithIdentifierSync %@%@", v41, 0x2Au);
  }

  v23 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

  return v23;
}

- (ACAccount)accountWithIdentifier:(NSString *)identifier
{
  return (ACAccount *)-[ACAccountStore accountWithIdentifier:error:](self, "accountWithIdentifier:error:", identifier, 0);
}

void __45__ACAccountStore_credentialForAccount_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  __int128 v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__ACAccountStore_credentialForAccount_error___block_invoke_2;
  v6[3] = &unk_1E4893508;
  v7 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v4, "credentialForAccountWithIdentifier:handler:", v5, v6);

}

void __42__ACAccountStore_accountsWithAccountType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[5];
  __int128 v7;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__ACAccountStore_accountsWithAccountType___block_invoke_2;
  v6[3] = &unk_1E4892DE8;
  v3 = *(_QWORD *)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v5 = *(_OWORD *)(a1 + 48);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(a2, "accountsWithAccountType:handler:", v3, v6);

}

void __45__ACAccountStore_credentialForAccount_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  id *v9;
  void *v10;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    _ACLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

    v9 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v10 = a3;
  }
  else
  {
    v9 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v10 = a2;
  }
  objc_storeStrong(v9, v10);

}

void __53__ACAccountStore_tetheredSyncSourceTypeForDataclass___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __46__ACAccountStore_accountWithIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2;
  v4[3] = &unk_1E4892B50;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "accountWithIdentifier:handler:", v2, v4);
}

void __53__ACAccountStore_enabledDataclassesForAccount_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  __int128 v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__ACAccountStore_enabledDataclassesForAccount_error___block_invoke_2;
  v6[3] = &unk_1E4893670;
  v7 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v4, "enabledDataclassesForAccountWithIdentifier:handler:", v5, v6);

}

void __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _ACLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v6;

}

uint64_t __56__ACAccountStore_accountIdentifiersEnabledForDataclass___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__ACAccountStore_accountIdentifiersEnabledForDataclass___block_invoke_2;
  v4[3] = &unk_1E4892D58;
  v2 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "accountIdentifiersEnabledForDataclass:handler:", v2, v4);
}

uint64_t __53__ACAccountStore_tetheredSyncSourceTypeForDataclass___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__ACAccountStore_tetheredSyncSourceTypeForDataclass___block_invoke_2;
  v4[3] = &unk_1E48937B0;
  v2 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "tetheredSyncSourceTypeForDataclass:completion:", v2, v4);
}

void __53__ACAccountStore_enabledDataclassesForAccount_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _ACLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v6;

}

void __56__ACAccountStore_accountIdentifiersEnabledForDataclass___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    _ACLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

- (id)accountIdentifiersEnabledForDataclass:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  unint64_t Nanoseconds;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  id v20;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  __int128 *p_buf;
  os_activity_scope_state_s state;
  uint8_t v27[4];
  os_signpost_id_t v28;
  __int16 v29;
  double v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  const __CFString *v34;
  __int128 buf;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1A2BCD000, "accounts/account-identifiers-enabled-for-dataclass", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _ACSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _ACSignpostCreate(v6);
  v9 = v8;

  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "AccountsEnabledForDataclass", "%@", (uint8_t *)&buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore accountIdentifiersEnabledForDataclass:].cold.1();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__0;
  v38 = __Block_byref_object_dispose__0;
  v39 = 0;
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __56__ACAccountStore_accountIdentifiersEnabledForDataclass___block_invoke;
  v23[3] = &unk_1E4893088;
  v14 = v4;
  v24 = v14;
  p_buf = &buf;
  ac_dispatch_remote_sync(v13, v23, 0);

  Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  _ACSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    v18 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v27 = 138412546;
    v28 = v18;
    v29 = 2112;
    v30 = COERCE_DOUBLE(&stru_1E4894AE8);
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v17, OS_SIGNPOST_INTERVAL_END, v7, "AccountsEnabledForDataclass", "%@%@", v27, 0x16u);
  }

  _ACSignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v27 = 134218754;
    v22 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    v28 = v7;
    v29 = 2048;
    v30 = (double)Nanoseconds / 1000000000.0;
    v31 = 2112;
    v32 = v22;
    v33 = 2112;
    v34 = &stru_1E4894AE8;
    _os_log_debug_impl(&dword_1A2BCD000, v19, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsEnabledForDataclass %@%@", v27, 0x2Au);
  }

  v20 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);
  return v20;
}

- (id)tetheredSyncSourceTypeForDataclass:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  unint64_t Nanoseconds;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  id v20;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  __int128 *p_buf;
  os_activity_scope_state_s state;
  uint8_t v27[4];
  os_signpost_id_t v28;
  __int16 v29;
  double v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  const __CFString *v34;
  __int128 buf;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1A2BCD000, "accounts/is-tethered-syncing-enabled-for-dataclass", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _ACSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _ACSignpostCreate(v6);
  v9 = v8;

  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "ThetheredSyncSourceTypeForDataclass", "%@", (uint8_t *)&buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore tetheredSyncSourceTypeForDataclass:].cold.1();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__0;
  v38 = __Block_byref_object_dispose__0;
  v39 = 0;
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __53__ACAccountStore_tetheredSyncSourceTypeForDataclass___block_invoke;
  v23[3] = &unk_1E4893088;
  v14 = v4;
  v24 = v14;
  p_buf = &buf;
  ac_dispatch_remote_sync(v13, v23, 0);

  Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  _ACSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    v18 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v27 = 138412546;
    v28 = v18;
    v29 = 2112;
    v30 = COERCE_DOUBLE(&stru_1E4894AE8);
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v17, OS_SIGNPOST_INTERVAL_END, v7, "ThetheredSyncSourceTypeForDataclass", "%@%@", v27, 0x16u);
  }

  _ACSignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v27 = 134218754;
    v22 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    v28 = v7;
    v29 = 2048;
    v30 = (double)Nanoseconds / 1000000000.0;
    v31 = 2112;
    v32 = v22;
    v33 = 2112;
    v34 = &stru_1E4894AE8;
    _os_log_debug_impl(&dword_1A2BCD000, v19, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: ThetheredSyncSourceTypeForDataclass %@%@", v27, 0x2Au);
  }

  v20 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);
  return v20;
}

void __59__ACAccountStore_accountIdentifiersEnabledToSyncDataclass___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    _ACLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

uint64_t __59__ACAccountStore_accountIdentifiersEnabledToSyncDataclass___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__ACAccountStore_accountIdentifiersEnabledToSyncDataclass___block_invoke_2;
  v4[3] = &unk_1E4892D58;
  v2 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "accountIdentifiersEnabledToSyncDataclass:handler:", v2, v4);
}

void __43__ACAccountStore_remoteAccountStoreSession__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  *(_QWORD *)(v1 + 32) = 0;

}

void __43__ACAccountStore_remoteAccountStoreSession__block_invoke_2(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v2;
  _QWORD *v3;
  _QWORD v4[2];
  void (*v5)(uint64_t);
  void *v6;
  os_unfair_lock_s *v7;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v5 = __43__ACAccountStore_remoteAccountStoreSession__block_invoke_3;
    v6 = &unk_1E4892AD8;
    v7 = WeakRetained;
    v3 = v4;
    os_unfair_lock_lock(v2 + 10);
    v5((uint64_t)v3);
    os_unfair_lock_unlock(v2 + 10);

  }
}

- (id)accountIdentifiersEnabledToSyncDataclass:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  unint64_t Nanoseconds;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  id v20;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  __int128 *p_buf;
  os_activity_scope_state_s state;
  uint8_t v27[4];
  os_signpost_id_t v28;
  __int16 v29;
  double v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  const __CFString *v34;
  __int128 buf;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1A2BCD000, "accounts/account-identifiers-enabled-sync-dataclass", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _ACSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _ACSignpostCreate(v6);
  v9 = v8;

  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "AccountsEnabledToSyncDataclass", "%@", (uint8_t *)&buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore accountIdentifiersEnabledToSyncDataclass:].cold.1();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__0;
  v38 = __Block_byref_object_dispose__0;
  v39 = 0;
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __59__ACAccountStore_accountIdentifiersEnabledToSyncDataclass___block_invoke;
  v23[3] = &unk_1E4893088;
  v14 = v4;
  v24 = v14;
  p_buf = &buf;
  ac_dispatch_remote_sync(v13, v23, 0);

  Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  _ACSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    v18 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v27 = 138412546;
    v28 = v18;
    v29 = 2112;
    v30 = COERCE_DOUBLE(&stru_1E4894AE8);
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v17, OS_SIGNPOST_INTERVAL_END, v7, "AccountsEnabledToSyncDataclass", "%@%@", v27, 0x16u);
  }

  _ACSignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v27 = 134218754;
    v22 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    v28 = v7;
    v29 = 2048;
    v30 = (double)Nanoseconds / 1000000000.0;
    v31 = 2112;
    v32 = v22;
    v33 = 2112;
    v34 = &stru_1E4894AE8;
    _os_log_debug_impl(&dword_1A2BCD000, v19, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsEnabledToSyncDataclass %@%@", v27, 0x2Au);
  }

  v20 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);
  return v20;
}

+ (void)_setDefaultStore:(id)a3
{
  objc_storeStrong((id *)&sharedAccountStore, a3);
}

+ (void)_setConnectionTimeout:(unint64_t)a3
{
  ACRemoteConnectionTimeout = a3;
}

- (ACAccountStore)initWithRemoteEndpoint:(id)a3
{
  return -[ACAccountStore initWithRemoteEndpoint:effectiveBundleID:](self, "initWithRemoteEndpoint:effectiveBundleID:", a3, 0);
}

- (ACAccountStore)initWithEffectiveBundleID:(id)a3
{
  return -[ACAccountStore initWithRemoteEndpoint:effectiveBundleID:](self, "initWithRemoteEndpoint:effectiveBundleID:", 0, a3);
}

void __59__ACAccountStore_initWithRemoteEndpoint_effectiveBundleID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_clearAccountCaches");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __59__ACAccountStore_initWithRemoteEndpoint_effectiveBundleID___block_invoke_2;
    v6[3] = &unk_1E48925B8;
    v7 = v5;
    v8 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

void __59__ACAccountStore_initWithRemoteEndpoint_effectiveBundleID___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)MEMORY[0x1A8589E88]();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("ACAccountStoreDidChangeNotification"), v4, v5);

  objc_autoreleasePoolPop(v2);
}

- (void)_clearAccountCaches
{
  NSMutableDictionary *obj;

  obj = self->_accountCache;
  objc_sync_enter(obj);
  -[NSMutableDictionary removeAllObjects](self->_accountCache, "removeAllObjects");
  objc_sync_exit(obj);

}

- (ACRemoteAccountStoreSession)longLivedRemoteAccountStoreSession
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__ACAccountStore_longLivedRemoteAccountStoreSession__block_invoke;
  v3[3] = &unk_1E4892B28;
  v3[4] = self;
  ac_unfair_lock_perform_with_result(&self->_longLivedRemoteAccountStoreSessionLock, v3);
  return (ACRemoteAccountStoreSession *)(id)objc_claimAutoreleasedReturnValue();
}

id __52__ACAccountStore_longLivedRemoteAccountStoreSession__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  ACRemoteAccountStoreSession *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id location;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[7])
  {
    v3 = -[ACRemoteAccountStoreSession initWithListenerEndpoint:]([ACRemoteAccountStoreSession alloc], "initWithListenerEndpoint:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 56);
    *(_QWORD *)(v4 + 56) = v3;

    v6 = *(_QWORD **)(a1 + 32);
    v7 = (void *)v6[7];
    objc_msgSend(v6, "effectiveBundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEffectiveBundleID:", v8);

    v2 = *(_QWORD **)(a1 + 32);
  }
  objc_initWeak(&location, v2);
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__ACAccountStore_longLivedRemoteAccountStoreSession__block_invoke_2;
  v12[3] = &unk_1E4892B00;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v9, "scheduleExpiration:", v12);
  v10 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  return v10;
}

void __52__ACAccountStore_longLivedRemoteAccountStoreSession__block_invoke_2(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v2;
  _QWORD *v3;
  _QWORD v4[2];
  void (*v5)(uint64_t);
  void *v6;
  os_unfair_lock_s *v7;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v5 = __52__ACAccountStore_longLivedRemoteAccountStoreSession__block_invoke_3;
    v6 = &unk_1E4892AD8;
    v7 = WeakRetained;
    v3 = v4;
    os_unfair_lock_lock(v2 + 16);
    v5((uint64_t)v3);
    os_unfair_lock_unlock(v2 + 16);

  }
}

void __52__ACAccountStore_longLivedRemoteAccountStoreSession__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 56);
  *(_QWORD *)(v1 + 56) = 0;

}

- (id)_connectionFailureError
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.accounts"), 10002, 0);
}

- (void)setNotificationsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNotificationsEnabled:", v3);

  -[ACAccountStore longLivedRemoteAccountStoreSession](self, "longLivedRemoteAccountStoreSession");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNotificationsEnabled:", v3);

}

void __46__ACAccountStore_accountWithIdentifier_error___block_invoke_49(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)accountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;
  ACAccountStore *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  os_signpost_id_t v28;
  uint64_t v29;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1A2BCD000, "accounts/account-with-identifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  if (v7)
  {
    _ACSignpostLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = _ACSignpostCreate(v9);
    v12 = v11;

    _ACSignpostLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v6;
      _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "AccountWithIdentifier", "%@", buf, 0xCu);
    }

    _ACSignpostLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[ACAccountStore accountWithIdentifier:completion:].cold.1();

    v16 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __51__ACAccountStore_accountWithIdentifier_completion___block_invoke;
    v26[3] = &unk_1E4892BF0;
    v26[4] = self;
    v28 = v10;
    v29 = v12;
    v27 = v7;
    v17 = (void *)MEMORY[0x1A858A038](v26);
    -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v16;
    v22[1] = 3221225472;
    v22[2] = __51__ACAccountStore_accountWithIdentifier_completion___block_invoke_53;
    v22[3] = &unk_1E4892C40;
    v23 = v6;
    v24 = self;
    v25 = v17;
    v20[0] = v16;
    v20[1] = 3221225472;
    v20[2] = __51__ACAccountStore_accountWithIdentifier_completion___block_invoke_55;
    v20[3] = &unk_1E48924C8;
    v19 = v25;
    v20[4] = self;
    v21 = v19;
    ac_dispatch_remote(v18, v22, v20);

  }
  os_activity_scope_leave(&state);

}

void __51__ACAccountStore_accountWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  __int128 v15;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __51__ACAccountStore_accountWithIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E4892BC8;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  block[1] = 3221225472;
  v15 = *(_OWORD *)(a1 + 48);
  v12 = v5;
  v13 = v6;
  v14 = v7;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __51__ACAccountStore_accountWithIdentifier_completion___block_invoke_2(_QWORD *a1)
{
  unint64_t Nanoseconds;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  const __CFString *v7;
  NSObject *v8;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  double v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  Nanoseconds = _ACSignpostGetNanoseconds(a1[7], a1[8]);
  _ACSignpostLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = a1[7];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v6 = a1[4];
    v7 = (const __CFString *)a1[5];
    if (!v7)
      v7 = &stru_1E4894AE8;
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v4, OS_SIGNPOST_INTERVAL_END, v5, "AccountWithIdentifier", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  _ACSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = a1[7];
    v11 = a1[4];
    v12 = (const __CFString *)a1[5];
    v14 = 134218754;
    v15 = v10;
    v13 = &stru_1E4894AE8;
    v16 = 2048;
    v17 = (double)Nanoseconds / 1000000000.0;
    v18 = 2112;
    v19 = v11;
    if (v12)
      v13 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_debug_impl(&dword_1A2BCD000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountWithIdentifier %@%@", (uint8_t *)&v14, 0x2Au);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __51__ACAccountStore_accountWithIdentifier_completion___block_invoke_53(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__ACAccountStore_accountWithIdentifier_completion___block_invoke_2_54;
  v4[3] = &unk_1E4892C18;
  v3 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(a2, "accountWithIdentifier:handler:", v3, v4);

}

void __51__ACAccountStore_accountWithIdentifier_completion___block_invoke_2_54(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a3;
  if (v5)
  {
    v6 = a2;
    _ACLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  else
  {
    objc_msgSend(a2, "_setAccountStore:", *(_QWORD *)(a1 + 32));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __51__ACAccountStore_accountWithIdentifier_completion___block_invoke_55(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)cachedAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  NSMutableDictionary *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  _QWORD v24[5];
  id v25;
  os_signpost_id_t v26;
  uint64_t v27;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1A2BCD000, "accounts/cached-account-with-identifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _ACSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _ACSignpostCreate(v9);
  v12 = v11;

  _ACSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CachedAccountWithIdentifier", "%@", buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore cachedAccountWithIdentifier:completion:].cold.1();

  v16 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __57__ACAccountStore_cachedAccountWithIdentifier_completion___block_invoke;
  v24[3] = &unk_1E4892BF0;
  v24[4] = self;
  v26 = v10;
  v27 = v12;
  v17 = v7;
  v25 = v17;
  v18 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A858A038](v24);
  v19 = self->_accountCache;
  objc_sync_enter(v19);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_accountCache, "objectForKeyedSubscript:", v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v19);

  if (v20)
  {
    ((void (**)(_QWORD, void *, _QWORD))v18)[2](v18, v20, 0);
  }
  else
  {
    v21[0] = v16;
    v21[1] = 3221225472;
    v21[2] = __57__ACAccountStore_cachedAccountWithIdentifier_completion___block_invoke_56;
    v21[3] = &unk_1E4892C68;
    v21[4] = self;
    v22 = v6;
    v23 = v18;
    -[ACAccountStore accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v22, v21);

  }
  os_activity_scope_leave(&state);

}

void __57__ACAccountStore_cachedAccountWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  __int128 v15;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __57__ACAccountStore_cachedAccountWithIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E4892BC8;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  block[1] = 3221225472;
  v15 = *(_OWORD *)(a1 + 48);
  v12 = v5;
  v13 = v6;
  v14 = v7;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __57__ACAccountStore_cachedAccountWithIdentifier_completion___block_invoke_2(_QWORD *a1)
{
  unint64_t Nanoseconds;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  const __CFString *v7;
  NSObject *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  double v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  Nanoseconds = _ACSignpostGetNanoseconds(a1[7], a1[8]);
  _ACSignpostLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = a1[7];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v6 = a1[4];
    v7 = (const __CFString *)a1[5];
    if (!v7)
      v7 = &stru_1E4894AE8;
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v4, OS_SIGNPOST_INTERVAL_END, v5, "CachedAccountWithIdentifier", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  _ACSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = a1[7];
    v11 = a1[4];
    v12 = (const __CFString *)a1[5];
    v14 = 134218754;
    v15 = v10;
    v13 = &stru_1E4894AE8;
    v16 = 2048;
    v17 = (double)Nanoseconds / 1000000000.0;
    v18 = 2112;
    v19 = v11;
    if (v12)
      v13 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_debug_impl(&dword_1A2BCD000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: CachedAccountWithIdentifier %@%@", (uint8_t *)&v14, 0x2Au);
  }

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

void __57__ACAccountStore_cachedAccountWithIdentifier_completion___block_invoke_56(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7 && !v5)
  {
    v6 = *(id *)(a1[4] + 16);
    objc_sync_enter(v6);
    objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKeyedSubscript:", v7, a1[5]);
    objc_sync_exit(v6);

  }
  (*(void (**)(void))(a1[6] + 16))();

}

void __61__ACAccountStore_accountTypeWithAccountTypeIdentifier_error___block_invoke_58(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __55__ACAccountStore_accountTypeWithIdentifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__ACAccountStore_accountTypeWithIdentifier_completion___block_invoke_4;
  v5[3] = &unk_1E4892D08;
  v4 = *(_QWORD *)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(a2, "accountTypeWithIdentifier:handler:", v4, v5);

}

void __55__ACAccountStore_accountTypeWithIdentifier_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a3;
  if (v5)
  {
    v6 = a2;
    _ACLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
  }
  else
  {
    objc_msgSend(a2, "setAccountStore:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "_cache");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject cacheAccountType:](v7, "cacheAccountType:", *(_QWORD *)(a1 + 40));
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __55__ACAccountStore_accountTypeWithIdentifier_completion___block_invoke_59(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (NSArray)accounts
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  unint64_t Nanoseconds;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  id v21;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[5];
  uint8_t buf[8];
  uint8_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  os_activity_scope_state_s state;
  uint8_t v36[4];
  os_signpost_id_t v37;
  __int16 v38;
  double v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  const __CFString *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = _os_activity_create(&dword_1A2BCD000, "accounts/all-accounts-sync", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  _ACSignpostLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = _ACSignpostCreate(v4);
  v7 = v6;

  _ACSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "AllAccountsSync", (const char *)&unk_1A2C2C35B, buf, 2u);
  }

  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore accounts].cold.1();

  *(_QWORD *)buf = 0;
  v30 = buf;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__0;
  v33 = __Block_byref_object_dispose__0;
  v34 = 0;
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __26__ACAccountStore_accounts__block_invoke;
  v28[3] = &unk_1E4892D80;
  v28[4] = buf;
  ac_dispatch_remote_sync(v11, v28, &__block_literal_global_62);

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = *((id *)v30 + 5);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v44, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "_setAccountStore:", self, (_QWORD)v24);
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v44, 16);
    }
    while (v13);
  }

  Nanoseconds = _ACSignpostGetNanoseconds(v5, v7);
  _ACSignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    v19 = *((_QWORD *)v30 + 5);
    *(_DWORD *)v36 = 138412546;
    v37 = v19;
    v38 = 2112;
    v39 = COERCE_DOUBLE(&stru_1E4894AE8);
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v18, OS_SIGNPOST_INTERVAL_END, v5, "AllAccountsSync", "%@%@", v36, 0x16u);
  }

  _ACSignpostLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v36 = 134218754;
    v23 = *((_QWORD *)v30 + 5);
    v37 = v5;
    v38 = 2048;
    v39 = (double)Nanoseconds / 1000000000.0;
    v40 = 2112;
    v41 = v23;
    v42 = 2112;
    v43 = &stru_1E4894AE8;
    _os_log_debug_impl(&dword_1A2BCD000, v20, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AllAccountsSync %@%@", v36, 0x2Au);
  }

  v21 = *((id *)v30 + 5);
  _Block_object_dispose(buf, 8);

  os_activity_scope_leave(&state);
  return (NSArray *)v21;
}

uint64_t __26__ACAccountStore_accounts__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __26__ACAccountStore_accounts__block_invoke_2;
  v3[3] = &unk_1E4892D58;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "accountsWithHandler:", v3);
}

void __26__ACAccountStore_accounts__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    _ACLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

void __26__ACAccountStore_accounts__block_invoke_61()
{
  NSObject *v0;

  _ACLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __26__ACAccountStore_accounts__block_invoke_61_cold_1();

}

void __42__ACAccountStore_accountsWithAccountType___block_invoke_64()
{
  NSObject *v0;

  _ACLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __26__ACAccountStore_accounts__block_invoke_61_cold_1();

}

void __56__ACAccountStore_accountsWithAccountType_options_error___block_invoke_66(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)accountsWithAccountType:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  _QWORD v25[5];
  void (**v26)(_QWORD, _QWORD, _QWORD);
  os_signpost_id_t v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  ACAccountStore *v31;
  id v32;
  void (**v33)(_QWORD, _QWORD, _QWORD);
  os_signpost_id_t v34;
  uint64_t v35;
  _QWORD v36[5];
  id v37;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1A2BCD000, "accounts/accounts-with-type", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  if (v7)
  {
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __53__ACAccountStore_accountsWithAccountType_completion___block_invoke;
    v36[3] = &unk_1E4892478;
    v36[4] = self;
    v37 = v7;
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A858A038](v36);
    objc_msgSend(v6, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[ACNotifyAccountCache suffixForAccountsForAccountType:fetchOptions:](ACNotifyAccountCache, "suffixForAccountsForAccountType:fetchOptions:", v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[ACAccountStore _cache](self, "_cache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cachedAccountsForSuffix:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      _ACLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v6, "identifier");
        objc_claimAutoreleasedReturnValue();
        -[ACAccountStore accountsWithAccountType:completion:].cold.2();
      }

      ((void (**)(_QWORD, void *, _QWORD))v9)[2](v9, v13, 0);
    }
    else
    {
      _ACSignpostLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = _ACSignpostCreate(v15);
      v18 = v17;

      _ACSignpostLogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v6;
        _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v16, "AccountsWithType", "%@", buf, 0xCu);
      }

      _ACSignpostLogSystem();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[ACAccountStore accountsWithAccountType:completion:].cold.1();

      v24 = v8;
      -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = MEMORY[0x1E0C809B0];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __53__ACAccountStore_accountsWithAccountType_completion___block_invoke_67;
      v29[3] = &unk_1E4892ED0;
      v30 = v6;
      v31 = self;
      v32 = v11;
      v34 = v16;
      v35 = v18;
      v33 = v9;
      v25[0] = v23;
      v25[1] = 3221225472;
      v25[2] = __53__ACAccountStore_accountsWithAccountType_completion___block_invoke_69;
      v25[3] = &unk_1E4892EF8;
      v27 = v16;
      v28 = v18;
      v25[4] = self;
      v26 = v33;
      ac_dispatch_remote(v22, v29, v25);

      v8 = v24;
    }

  }
  os_activity_scope_leave(&state);

}

void __53__ACAccountStore_accountsWithAccountType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v10++), "_setAccountStore:", *(_QWORD *)(a1 + 32));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }
  v11 = *(void **)(a1 + 40);
  v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__ACAccountStore_accountsWithAccountType_completion___block_invoke_2;
  block[3] = &unk_1E4892450;
  v17 = v6;
  v18 = v11;
  v16 = v5;
  v13 = v6;
  v14 = v5;
  dispatch_async(v12, block);

}

uint64_t __53__ACAccountStore_accountsWithAccountType_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __53__ACAccountStore_accountsWithAccountType_completion___block_invoke_67(uint64_t a1, void *a2)
{
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;
  __int128 v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__ACAccountStore_accountsWithAccountType_completion___block_invoke_2_68;
  v5[3] = &unk_1E4892EA8;
  v4 = *(_QWORD *)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v8 = *(_OWORD *)(a1 + 64);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(a2, "accountsWithAccountType:handler:", v4, v5);

}

void __53__ACAccountStore_accountsWithAccountType_completion___block_invoke_2_68(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  unint64_t Nanoseconds;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  const __CFString *v13;
  NSObject *v14;
  void *v15;
  const __CFString *v16;
  int v17;
  id v18;
  __int16 v19;
  double v20;
  __int16 v21;
  id v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _ACLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 32), "_cache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cacheAccounts:forSuffix:", v5, *(_QWORD *)(a1 + 40));

  Nanoseconds = _ACSignpostGetNanoseconds(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 56);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v13 = &stru_1E4894AE8;
    if (v6)
      v13 = v6;
    v17 = 138412546;
    v18 = v5;
    v19 = 2112;
    v20 = *(double *)&v13;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v11, OS_SIGNPOST_INTERVAL_END, v12, "AccountsWithType", "%@%@", (uint8_t *)&v17, 0x16u);
  }

  _ACSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = *(void **)(a1 + 56);
    v17 = 134218754;
    v18 = v15;
    v16 = &stru_1E4894AE8;
    v19 = 2048;
    v20 = (double)Nanoseconds / 1000000000.0;
    v21 = 2112;
    v22 = v5;
    if (v6)
      v16 = v6;
    v23 = 2112;
    v24 = v16;
    _os_log_debug_impl(&dword_1A2BCD000, v14, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsWithType %@%@", (uint8_t *)&v17, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __53__ACAccountStore_accountsWithAccountType_completion___block_invoke_69(uint64_t a1, void *a2)
{
  __CFString *v3;
  unint64_t Nanoseconds;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  const __CFString *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  double v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  Nanoseconds = _ACSignpostGetNanoseconds(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  _ACSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v8 = &stru_1E4894AE8;
    if (v3)
      v8 = v3;
    v14 = 138412546;
    v15 = 0;
    v16 = 2112;
    v17 = *(double *)&v8;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v6, OS_SIGNPOST_INTERVAL_END, v7, "AccountsWithType", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  _ACSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v12 = *(_QWORD *)(a1 + 48);
    v14 = 134218754;
    v15 = v12;
    v13 = &stru_1E4894AE8;
    v16 = 2048;
    v17 = (double)Nanoseconds / 1000000000.0;
    v18 = 2112;
    v19 = 0;
    if (v3)
      v13 = v3;
    v20 = 2112;
    v21 = v13;
    _os_log_debug_impl(&dword_1A2BCD000, v9, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsWithType %@%@", (uint8_t *)&v14, 0x2Au);
  }

  v10 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v11);

}

void __61__ACAccountStore_accountsWithAccountType_options_completion___block_invoke_70(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;
  __int128 v9;

  v4 = *(_QWORD *)(a1 + 64);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__ACAccountStore_accountsWithAccountType_options_completion___block_invoke_2_71;
  v6[3] = &unk_1E4892EA8;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v9 = *(_OWORD *)(a1 + 72);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(a2, "accountsWithAccountType:options:completion:", v5, v4, v6);

}

void __61__ACAccountStore_accountsWithAccountType_options_completion___block_invoke_2_71(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  unint64_t Nanoseconds;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  const __CFString *v13;
  NSObject *v14;
  void *v15;
  const __CFString *v16;
  int v17;
  id v18;
  __int16 v19;
  double v20;
  __int16 v21;
  id v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _ACLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 32), "_cache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cacheAccounts:forSuffix:", v5, *(_QWORD *)(a1 + 40));

  Nanoseconds = _ACSignpostGetNanoseconds(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 56);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v13 = &stru_1E4894AE8;
    if (v6)
      v13 = v6;
    v17 = 138412546;
    v18 = v5;
    v19 = 2112;
    v20 = *(double *)&v13;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v11, OS_SIGNPOST_INTERVAL_END, v12, "AccountsWithType", "%@%@", (uint8_t *)&v17, 0x16u);
  }

  _ACSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = *(void **)(a1 + 56);
    v17 = 134218754;
    v18 = v15;
    v16 = &stru_1E4894AE8;
    v19 = 2048;
    v20 = (double)Nanoseconds / 1000000000.0;
    v21 = 2112;
    v22 = v5;
    if (v6)
      v16 = v6;
    v23 = 2112;
    v24 = v16;
    _os_log_debug_impl(&dword_1A2BCD000, v14, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsWithType %@%@", (uint8_t *)&v17, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __61__ACAccountStore_accountsWithAccountType_options_completion___block_invoke_72(uint64_t a1, void *a2)
{
  __CFString *v3;
  unint64_t Nanoseconds;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  const __CFString *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  double v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  Nanoseconds = _ACSignpostGetNanoseconds(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  _ACSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v8 = &stru_1E4894AE8;
    if (v3)
      v8 = v3;
    v14 = 138412546;
    v15 = 0;
    v16 = 2112;
    v17 = *(double *)&v8;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v6, OS_SIGNPOST_INTERVAL_END, v7, "AccountsWithType", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  _ACSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v12 = *(_QWORD *)(a1 + 48);
    v14 = 134218754;
    v15 = v12;
    v13 = &stru_1E4894AE8;
    v16 = 2048;
    v17 = (double)Nanoseconds / 1000000000.0;
    v18 = 2112;
    v19 = 0;
    if (v3)
      v13 = v3;
    v20 = 2112;
    v21 = v13;
    _os_log_debug_impl(&dword_1A2BCD000, v9, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsWithType %@%@", (uint8_t *)&v14, 0x2Au);
  }

  v10 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v11);

}

- (void)accountsWithAccountTypeIdentifiers:(id)a3 completion:(id)a4
{
  -[ACAccountStore accountsWithAccountTypeIdentifiers:preloadedProperties:completion:](self, "accountsWithAccountTypeIdentifiers:preloadedProperties:completion:", a3, 0, a4);
}

- (void)accountsWithAccountTypeIdentifiers:(id)a3 preloadedProperties:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  os_signpost_id_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  _QWORD v27[5];
  void (**v28)(_QWORD, _QWORD, _QWORD);
  os_signpost_id_t v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  ACAccountStore *v35;
  void (**v36)(_QWORD, _QWORD, _QWORD);
  os_signpost_id_t v37;
  uint64_t v38;
  _QWORD v39[5];
  id v40;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_1A2BCD000, "accounts/accounts-with-types", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  if (v10)
  {
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __84__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke;
    v39[3] = &unk_1E4892478;
    v39[4] = self;
    v40 = v10;
    v26 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A858A038](v39);
    if (objc_msgSend(v8, "count") == 1 && !objc_msgSend(v9, "count"))
    {
      objc_msgSend(v8, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[ACNotifyAccountCache suffixForAccountsForAccountType:fetchOptions:](ACNotifyAccountCache, "suffixForAccountsForAccountType:fetchOptions:", v23, 1);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      -[ACAccountStore _cache](self, "_cache");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "cachedAccountsForSuffix:", v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        _ACLogSystem();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v8, "firstObject");
          objc_claimAutoreleasedReturnValue();
          -[ACAccountStore accountsWithAccountType:completion:].cold.2();
        }

        ((void (**)(_QWORD, void *, _QWORD))v26)[2](v26, v22, 0);
        goto LABEL_11;
      }
    }
    else
    {
      v12 = 0;
    }
    _ACSignpostLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = _ACSignpostCreate(v13);
    v16 = v15;

    _ACSignpostLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_DWORD *)buf = 138412546;
      v43 = (os_signpost_id_t)v8;
      v44 = 2112;
      v45 = v9;
      _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v14, "AccountsWithTypesWithProperties", "%@: %@", buf, 0x16u);
    }

    _ACSignpostLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v43 = v14;
      v44 = 2112;
      v45 = v8;
      v46 = 2112;
      v47 = v9;
      _os_log_debug_impl(&dword_1A2BCD000, v19, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: AccountsWithTypesWithProperties %@: %@", buf, 0x20u);
    }

    -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __84__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke_73;
    v31[3] = &unk_1E4892F48;
    v32 = v8;
    v33 = v9;
    v12 = v12;
    v34 = v12;
    v35 = self;
    v37 = v14;
    v38 = v16;
    v36 = v26;
    v27[0] = v21;
    v27[1] = 3221225472;
    v27[2] = __84__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke_75;
    v27[3] = &unk_1E4892EF8;
    v29 = v14;
    v30 = v16;
    v27[4] = self;
    v28 = v36;
    ac_dispatch_remote(v20, v31, v27);

    v22 = 0;
LABEL_11:

  }
  os_activity_scope_leave(&state);

}

void __84__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v10++), "_setAccountStore:", *(_QWORD *)(a1 + 32));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }
  v11 = *(void **)(a1 + 40);
  v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke_2;
  block[3] = &unk_1E4892450;
  v17 = v6;
  v18 = v11;
  v16 = v5;
  v13 = v6;
  v14 = v5;
  dispatch_async(v12, block);

}

uint64_t __84__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __84__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke_73(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  __int128 v13;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke_2_74;
  v9[3] = &unk_1E4892EA8;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(void **)(a1 + 64);
  v10 = v6;
  v11 = v7;
  v13 = *(_OWORD *)(a1 + 72);
  v12 = v8;
  objc_msgSend(a2, "accountsWithAccountTypeIdentifiers:preloadedProperties:completion:", v4, v5, v9);

}

void __84__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke_2_74(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  id v6;
  NSObject *v7;
  void *v8;
  unint64_t Nanoseconds;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  const __CFString *v13;
  NSObject *v14;
  unint64_t v15;
  unint64_t v16;
  const __CFString *v17;
  int v18;
  unint64_t v19;
  __int16 v20;
  double v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _ACLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "_cache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cacheAccounts:forSuffix:", v5, *(_QWORD *)(a1 + 32));

  }
  Nanoseconds = _ACSignpostGetNanoseconds(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 56);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v13 = &stru_1E4894AE8;
    if (v6)
      v13 = (const __CFString *)v6;
    v18 = 138412546;
    v19 = v5;
    v20 = 2112;
    v21 = *(double *)&v13;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v11, OS_SIGNPOST_INTERVAL_END, v12, "AccountsWithTypesWithProperties", "%@%@", (uint8_t *)&v18, 0x16u);
  }

  _ACSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v16 = *(_QWORD *)(a1 + 56);
    v18 = 134218754;
    v19 = v16;
    v17 = &stru_1E4894AE8;
    v20 = 2048;
    v21 = (double)Nanoseconds / 1000000000.0;
    v22 = 2112;
    v23 = v5;
    if (v6)
      v17 = (const __CFString *)v6;
    v24 = 2112;
    v25 = v17;
    _os_log_debug_impl(&dword_1A2BCD000, v14, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsWithTypesWithProperties %@%@", (uint8_t *)&v18, 0x2Au);
  }

  if (v5 | (unint64_t)v6)
    v15 = v5;
  else
    v15 = MEMORY[0x1E0C9AA60];
  (*(void (**)(_QWORD, unint64_t, id))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v15, v6);

}

void __84__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke_75(uint64_t a1, void *a2)
{
  __CFString *v3;
  unint64_t Nanoseconds;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  const __CFString *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  double v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  Nanoseconds = _ACSignpostGetNanoseconds(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  _ACSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v8 = &stru_1E4894AE8;
    if (v3)
      v8 = v3;
    v14 = 138412546;
    v15 = 0;
    v16 = 2112;
    v17 = *(double *)&v8;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v6, OS_SIGNPOST_INTERVAL_END, v7, "AccountsWithTypesWithProperties", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  _ACSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v12 = *(_QWORD *)(a1 + 48);
    v14 = 134218754;
    v15 = v12;
    v13 = &stru_1E4894AE8;
    v16 = 2048;
    v17 = (double)Nanoseconds / 1000000000.0;
    v18 = 2112;
    v19 = 0;
    if (v3)
      v13 = v3;
    v20 = 2112;
    v21 = v13;
    _os_log_debug_impl(&dword_1A2BCD000, v9, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsWithTypesWithProperties %@%@", (uint8_t *)&v14, 0x2Au);
  }

  v10 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v11);

}

void __79__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_error___block_invoke_76(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)accountsOnPairedDeviceWithAccountType:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a4;
  objc_msgSend(a3, "identifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithObject:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccountStore accountsOnPairedDeviceWithAccountTypes:withOptions:completion:](self, "accountsOnPairedDeviceWithAccountTypes:withOptions:completion:", v8, 0, v7);

}

- (void)accountsOnPairedDeviceWithAccountTypes:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  ACAccountStore *v28;
  id v29;
  _QWORD v30[5];
  id v31;
  os_signpost_id_t v32;
  uint64_t v33;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_1A2BCD000, "accounts/accounts-on-paired-device-with-types", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  if (v10)
  {
    _ACSignpostLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = _ACSignpostCreate(v12);
    v15 = v14;

    _ACSignpostLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_DWORD *)buf = 138412546;
      v36 = (os_signpost_id_t)v8;
      v37 = 2112;
      v38 = v9;
      _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "AccountsOnPairedDeviceWithTypes", "%@ (options: %@)", buf, 0x16u);
    }

    _ACSignpostLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v36 = v13;
      v37 = 2112;
      v38 = v8;
      v39 = 2112;
      v40 = v9;
      _os_log_debug_impl(&dword_1A2BCD000, v18, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: AccountsOnPairedDeviceWithTypes %@ (options: %@)", buf, 0x20u);
    }

    v19 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __80__ACAccountStore_accountsOnPairedDeviceWithAccountTypes_withOptions_completion___block_invoke;
    v30[3] = &unk_1E4892FC0;
    v30[4] = self;
    v32 = v13;
    v33 = v15;
    v31 = v10;
    v20 = (void *)MEMORY[0x1A858A038](v30);
    -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v19;
    v25[1] = 3221225472;
    v25[2] = __80__ACAccountStore_accountsOnPairedDeviceWithAccountTypes_withOptions_completion___block_invoke_78;
    v25[3] = &unk_1E4892D30;
    v26 = v8;
    v27 = v9;
    v28 = self;
    v29 = v20;
    v23[0] = v19;
    v23[1] = 3221225472;
    v23[2] = __80__ACAccountStore_accountsOnPairedDeviceWithAccountTypes_withOptions_completion___block_invoke_80;
    v23[3] = &unk_1E48924C8;
    v22 = v29;
    v23[4] = self;
    v24 = v22;
    ac_dispatch_remote(v21, v25, v23);

  }
  os_activity_scope_leave(&state);

}

void __80__ACAccountStore_accountsOnPairedDeviceWithAccountTypes_withOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  __int128 v15;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __80__ACAccountStore_accountsOnPairedDeviceWithAccountTypes_withOptions_completion___block_invoke_2;
  block[3] = &unk_1E4892BC8;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  block[1] = 3221225472;
  v15 = *(_OWORD *)(a1 + 48);
  v12 = v5;
  v13 = v6;
  v14 = v7;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __80__ACAccountStore_accountsOnPairedDeviceWithAccountTypes_withOptions_completion___block_invoke_2(_QWORD *a1)
{
  unint64_t Nanoseconds;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  const __CFString *v7;
  NSObject *v8;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  double v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  Nanoseconds = _ACSignpostGetNanoseconds(a1[7], a1[8]);
  _ACSignpostLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = a1[7];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v6 = a1[4];
    v7 = (const __CFString *)a1[5];
    if (!v7)
      v7 = &stru_1E4894AE8;
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v4, OS_SIGNPOST_INTERVAL_END, v5, "AccountsOnPairedDeviceWithTypes", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  _ACSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = a1[7];
    v11 = a1[4];
    v12 = (const __CFString *)a1[5];
    v14 = 134218754;
    v15 = v10;
    v13 = &stru_1E4894AE8;
    v16 = 2048;
    v17 = (double)Nanoseconds / 1000000000.0;
    v18 = 2112;
    v19 = v11;
    if (v12)
      v13 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_debug_impl(&dword_1A2BCD000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsOnPairedDeviceWithTypes %@%@", (uint8_t *)&v14, 0x2Au);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __80__ACAccountStore_accountsOnPairedDeviceWithAccountTypes_withOptions_completion___block_invoke_78(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v3 = a1[4];
  v4 = a1[5];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__ACAccountStore_accountsOnPairedDeviceWithAccountTypes_withOptions_completion___block_invoke_2_79;
  v6[3] = &unk_1E4892478;
  v5 = (void *)a1[7];
  v6[4] = a1[6];
  v7 = v5;
  objc_msgSend(a2, "accountsOnPairedDeviceWithAccountTypes:withOptions:handler:", v3, v4, v6);

}

void __80__ACAccountStore_accountsOnPairedDeviceWithAccountTypes_withOptions_completion___block_invoke_2_79(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _ACLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "_setAccountStore:", *(_QWORD *)(a1 + 32));
        }
        v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __80__ACAccountStore_accountsOnPairedDeviceWithAccountTypes_withOptions_completion___block_invoke_80(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (id)allDataclasses
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  unint64_t Nanoseconds;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  id v17;
  uint64_t v19;
  _QWORD v20[5];
  uint8_t buf[8];
  uint8_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  os_activity_scope_state_s state;
  uint8_t v28[4];
  os_signpost_id_t v29;
  __int16 v30;
  double v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  const __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = _os_activity_create(&dword_1A2BCD000, "accounts/all-dataclasses", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  _ACSignpostLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = _ACSignpostCreate(v4);
  v7 = v6;

  _ACSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "AllDataclasses", (const char *)&unk_1A2C2C35B, buf, 2u);
  }

  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore allDataclasses].cold.1();

  *(_QWORD *)buf = 0;
  v22 = buf;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __32__ACAccountStore_allDataclasses__block_invoke;
  v20[3] = &unk_1E4892D80;
  v20[4] = buf;
  ac_dispatch_remote_sync(v11, v20, 0);

  Nanoseconds = _ACSignpostGetNanoseconds(v5, v7);
  _ACSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    v15 = *((_QWORD *)v22 + 5);
    *(_DWORD *)v28 = 138412546;
    v29 = v15;
    v30 = 2112;
    v31 = COERCE_DOUBLE(&stru_1E4894AE8);
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v14, OS_SIGNPOST_INTERVAL_END, v5, "AllDataclasses", "%@%@", v28, 0x16u);
  }

  _ACSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v28 = 134218754;
    v19 = *((_QWORD *)v22 + 5);
    v29 = v5;
    v30 = 2048;
    v31 = (double)Nanoseconds / 1000000000.0;
    v32 = 2112;
    v33 = v19;
    v34 = 2112;
    v35 = &stru_1E4894AE8;
    _os_log_debug_impl(&dword_1A2BCD000, v16, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AllDataclasses %@%@", v28, 0x2Au);
  }

  v17 = *((id *)v22 + 5);
  _Block_object_dispose(buf, 8);

  os_activity_scope_leave(&state);
  return v17;
}

uint64_t __32__ACAccountStore_allDataclasses__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__ACAccountStore_allDataclasses__block_invoke_2;
  v3[3] = &unk_1E4892D58;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "dataclassesWithHandler:", v3);
}

void __32__ACAccountStore_allDataclasses__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    _ACLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

- (id)allAccountTypes
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  unint64_t Nanoseconds;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  id v23;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  os_activity_scope_state_s state;
  uint8_t v38[128];
  uint8_t buf[4];
  os_signpost_id_t v40;
  __int16 v41;
  double v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  const __CFString *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = _os_activity_create(&dword_1A2BCD000, "accounts/all-account-types", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__0;
  v35 = __Block_byref_object_dispose__0;
  -[ACAccountStore _cache](self, "_cache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachedAllAccountTypes");
  v36 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)v32[5];
  if (!v5)
  {
    _ACSignpostLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = _ACSignpostCreate(v6);
    v9 = v8;

    _ACSignpostLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "AllAccountTypes", (const char *)&unk_1A2C2C35B, buf, 2u);
    }

    _ACSignpostLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[ACAccountStore allAccountTypes].cold.1();

    -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __33__ACAccountStore_allAccountTypes__block_invoke;
    v30[3] = &unk_1E4893010;
    v30[4] = self;
    v30[5] = &v31;
    ac_dispatch_remote_sync(v13, v30, 0);

    Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
    _ACSignpostLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      v17 = v32[5];
      *(_DWORD *)buf = 138412546;
      v40 = v17;
      v41 = 2112;
      v42 = COERCE_DOUBLE(&stru_1E4894AE8);
      _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v16, OS_SIGNPOST_INTERVAL_END, v7, "AllAccountTypes", "%@%@", buf, 0x16u);
    }

    _ACSignpostLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218754;
      v25 = v32[5];
      v40 = v7;
      v41 = 2048;
      v42 = (double)Nanoseconds / 1000000000.0;
      v43 = 2112;
      v44 = v25;
      v45 = 2112;
      v46 = &stru_1E4894AE8;
      _os_log_debug_impl(&dword_1A2BCD000, v18, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AllAccountTypes %@%@", buf, 0x2Au);
    }

    v5 = (void *)v32[5];
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v19 = v5;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "setAccountStore:", self, (_QWORD)v26);
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v20);
  }

  v23 = (id)v32[5];
  _Block_object_dispose(&v31, 8);

  os_activity_scope_leave(&state);
  return v23;
}

uint64_t __33__ACAccountStore_allAccountTypes__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__ACAccountStore_allAccountTypes__block_invoke_2;
  v3[3] = &unk_1E4892FE8;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "accountTypesWithHandler:", v3);
}

void __33__ACAccountStore_allAccountTypes__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = a3;
  if (v5)
  {
    _ACLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  else
  {
    v7 = objc_msgSend(a2, "copy");
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_msgSend(*(id *)(a1 + 32), "_cache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cacheAllAccountTypes:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  }
}

- (void)visibleTopLevelAccountsWithAccountTypeIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  const __CFString *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;
  ACAccountStore *v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  os_signpost_id_t v32;
  uint64_t v33;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1A2BCD000, "accounts/all-account-types", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  if (!v6)
  {
    v21 = CFSTR("accountTypeIDs must be non-nil");
    goto LABEL_13;
  }
  if (!objc_msgSend(v6, "count"))
  {
    v21 = CFSTR("accountTypeIDs must not be empty");
LABEL_13:
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v21, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }
  if (v7)
  {
    _ACSignpostLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = _ACSignpostCreate(v9);
    v12 = v11;

    _ACSignpostLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v6;
      _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "VisibleAccountsWithTypes", "%@", buf, 0xCu);
    }

    _ACSignpostLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[ACAccountStore visibleTopLevelAccountsWithAccountTypeIdentifiers:completion:].cold.1();

    v16 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __79__ACAccountStore_visibleTopLevelAccountsWithAccountTypeIdentifiers_completion___block_invoke;
    v29[3] = &unk_1E4892EA8;
    v29[4] = self;
    v32 = v10;
    v33 = v12;
    v17 = v6;
    v30 = v17;
    v31 = v7;
    v18 = (void *)MEMORY[0x1A858A038](v29);
    -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v16;
    v25[1] = 3221225472;
    v25[2] = __79__ACAccountStore_visibleTopLevelAccountsWithAccountTypeIdentifiers_completion___block_invoke_86;
    v25[3] = &unk_1E4892C40;
    v26 = v17;
    v27 = self;
    v28 = v18;
    v23[0] = v16;
    v23[1] = 3221225472;
    v23[2] = __79__ACAccountStore_visibleTopLevelAccountsWithAccountTypeIdentifiers_completion___block_invoke_88;
    v23[3] = &unk_1E48924C8;
    v20 = v28;
    v23[4] = self;
    v24 = v20;
    ac_dispatch_remote(v19, v25, v23);

  }
  os_activity_scope_leave(&state);

}

void __79__ACAccountStore_visibleTopLevelAccountsWithAccountTypeIdentifiers_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  __int128 v17;

  v5 = a2;
  v6 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[2] = __79__ACAccountStore_visibleTopLevelAccountsWithAccountTypeIdentifiers_completion___block_invoke_2;
  v12[3] = &unk_1E4893038;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  v12[1] = 3221225472;
  v17 = *(_OWORD *)(a1 + 56);
  v13 = v7;
  v14 = v6;
  v9 = *(id *)(a1 + 48);
  v15 = v5;
  v16 = v9;
  v10 = v5;
  v11 = v6;
  dispatch_async(v8, v12);

}

uint64_t __79__ACAccountStore_visibleTopLevelAccountsWithAccountTypeIdentifiers_completion___block_invoke_2(_QWORD *a1)
{
  unint64_t Nanoseconds;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  const __CFString *v7;
  NSObject *v8;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  double v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  Nanoseconds = _ACSignpostGetNanoseconds(a1[8], a1[9]);
  _ACSignpostLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = a1[8];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v6 = a1[4];
    v7 = (const __CFString *)a1[5];
    if (!v7)
      v7 = &stru_1E4894AE8;
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v4, OS_SIGNPOST_INTERVAL_END, v5, "VisibleAccountsWithTypes", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  _ACSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = a1[8];
    v11 = a1[4];
    v12 = (const __CFString *)a1[5];
    v14 = 134218754;
    v15 = v10;
    v13 = &stru_1E4894AE8;
    v16 = 2048;
    v17 = (double)Nanoseconds / 1000000000.0;
    v18 = 2112;
    v19 = v11;
    if (v12)
      v13 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_debug_impl(&dword_1A2BCD000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: VisibleAccountsWithTypes %@%@", (uint8_t *)&v14, 0x2Au);
  }

  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

void __79__ACAccountStore_visibleTopLevelAccountsWithAccountTypeIdentifiers_completion___block_invoke_86(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__ACAccountStore_visibleTopLevelAccountsWithAccountTypeIdentifiers_completion___block_invoke_2_87;
  v4[3] = &unk_1E4892478;
  v3 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(a2, "visibleTopLevelAccountsWithAccountTypeIdentifiers:completion:", v3, v4);

}

void __79__ACAccountStore_visibleTopLevelAccountsWithAccountTypeIdentifiers_completion___block_invoke_2_87(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _ACLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "_setAccountStore:", *(_QWORD *)(a1 + 32));
        }
        v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __79__ACAccountStore_visibleTopLevelAccountsWithAccountTypeIdentifiers_completion___block_invoke_88(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (BOOL)hasAccountWithDescription:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  unint64_t Nanoseconds;
  NSObject *v16;
  NSObject *v17;
  const __CFString *v18;
  NSObject *v19;
  BOOL v20;
  int v22;
  const __CFString *v23;
  _QWORD v24[4];
  id v25;
  __int128 *p_buf;
  os_activity_scope_state_s state;
  uint8_t v28[4];
  os_signpost_id_t v29;
  __int16 v30;
  double v31;
  __int16 v32;
  const __CFString *v33;
  __int128 buf;
  uint64_t v35;
  char v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1A2BCD000, "accounts/has-account-with-description", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _ACSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _ACSignpostCreate(v6);
  v9 = v8;

  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "HasAccountWithDescription", "%@", (uint8_t *)&buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore hasAccountWithDescription:].cold.1();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v35 = 0x2020000000;
  v36 = 0;
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __44__ACAccountStore_hasAccountWithDescription___block_invoke;
  v24[3] = &unk_1E4893088;
  v14 = v4;
  v25 = v14;
  p_buf = &buf;
  ac_dispatch_remote_sync(v13, v24, 0);

  Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  _ACSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
      v18 = CFSTR("YES");
    else
      v18 = CFSTR("NO");
    *(_DWORD *)v28 = 138543362;
    v29 = (os_signpost_id_t)v18;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v17, OS_SIGNPOST_INTERVAL_END, v7, "HasAccountWithDescription", "%{public}@", v28, 0xCu);
  }

  _ACSignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v22 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
    *(_DWORD *)v28 = 134218498;
    v29 = v7;
    if (v22)
      v23 = CFSTR("YES");
    else
      v23 = CFSTR("NO");
    v30 = 2048;
    v31 = (double)Nanoseconds / 1000000000.0;
    v32 = 2114;
    v33 = v23;
    _os_log_debug_impl(&dword_1A2BCD000, v19, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: HasAccountWithDescription %{public}@", v28, 0x20u);
  }

  v20 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;
  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

  return v20;
}

uint64_t __44__ACAccountStore_hasAccountWithDescription___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__ACAccountStore_hasAccountWithDescription___block_invoke_2;
  v4[3] = &unk_1E4893060;
  v2 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "accountExistsWithDescription:completion:", v2, v4);
}

uint64_t __44__ACAccountStore_hasAccountWithDescription___block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)kerberosAccountsForDomainFromURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  os_signpost_id_t v27;
  uint64_t v28;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1A2BCD000, "accounts/kerberos-accounts", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  if (v7)
  {
    _ACSignpostLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = _ACSignpostCreate(v9);
    v12 = v11;

    _ACSignpostLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v6;
      _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "KerberosAccounts", "%@", buf, 0xCu);
    }

    _ACSignpostLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[ACAccountStore kerberosAccountsForDomainFromURL:completion:].cold.1();

    v16 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __62__ACAccountStore_kerberosAccountsForDomainFromURL_completion___block_invoke;
    v25[3] = &unk_1E4892FC0;
    v25[4] = self;
    v27 = v10;
    v28 = v12;
    v26 = v7;
    v17 = (void *)MEMORY[0x1A858A038](v25);
    -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v16;
    v22[1] = 3221225472;
    v22[2] = __62__ACAccountStore_kerberosAccountsForDomainFromURL_completion___block_invoke_95;
    v22[3] = &unk_1E48924A0;
    v23 = v6;
    v24 = v17;
    v20[0] = v16;
    v20[1] = 3221225472;
    v20[2] = __62__ACAccountStore_kerberosAccountsForDomainFromURL_completion___block_invoke_2;
    v20[3] = &unk_1E48924C8;
    v19 = v24;
    v20[4] = self;
    v21 = v19;
    ac_dispatch_remote(v18, v22, v20);

  }
  os_activity_scope_leave(&state);

}

void __62__ACAccountStore_kerberosAccountsForDomainFromURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _ACLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "_setAccountStore:", *(_QWORD *)(a1 + 32));
        }
        v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __62__ACAccountStore_kerberosAccountsForDomainFromURL_completion___block_invoke_94;
  block[3] = &unk_1E4892BC8;
  v12 = *(void **)(a1 + 40);
  v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  block[1] = 3221225472;
  v20 = *(_OWORD *)(a1 + 48);
  v17 = v5;
  v18 = v6;
  v19 = v12;
  v14 = v6;
  v15 = v5;
  dispatch_async(v13, block);

}

uint64_t __62__ACAccountStore_kerberosAccountsForDomainFromURL_completion___block_invoke_94(_QWORD *a1)
{
  unint64_t Nanoseconds;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  const __CFString *v7;
  NSObject *v8;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  double v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  Nanoseconds = _ACSignpostGetNanoseconds(a1[7], a1[8]);
  _ACSignpostLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = a1[7];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v6 = a1[4];
    v7 = (const __CFString *)a1[5];
    if (!v7)
      v7 = &stru_1E4894AE8;
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v4, OS_SIGNPOST_INTERVAL_END, v5, "KerberosAccounts", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  _ACSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = a1[7];
    v11 = a1[4];
    v12 = (const __CFString *)a1[5];
    v14 = 134218754;
    v15 = v10;
    v13 = &stru_1E4894AE8;
    v16 = 2048;
    v17 = (double)Nanoseconds / 1000000000.0;
    v18 = 2112;
    v19 = v11;
    if (v12)
      v13 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_debug_impl(&dword_1A2BCD000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: KerberosAccounts %@%@", (uint8_t *)&v14, 0x2Au);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __62__ACAccountStore_kerberosAccountsForDomainFromURL_completion___block_invoke_95(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "kerberosAccountsForDomainFromURL:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __62__ACAccountStore_kerberosAccountsForDomainFromURL_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (BOOL)isPushSupportedForAccount:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  unint64_t Nanoseconds;
  NSObject *v16;
  NSObject *v17;
  const __CFString *v18;
  NSObject *v19;
  BOOL v20;
  int v22;
  const __CFString *v23;
  _QWORD v24[4];
  id v25;
  __int128 *p_buf;
  os_activity_scope_state_s state;
  uint8_t v28[4];
  os_signpost_id_t v29;
  __int16 v30;
  double v31;
  __int16 v32;
  const __CFString *v33;
  __int128 buf;
  uint64_t v35;
  char v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1A2BCD000, "accounts/push-supported", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _ACSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _ACSignpostCreate(v6);
  v9 = v8;

  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PushSupported", "%@", (uint8_t *)&buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore isPushSupportedForAccount:].cold.1();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v35 = 0x2020000000;
  v36 = 0;
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __44__ACAccountStore_isPushSupportedForAccount___block_invoke;
  v24[3] = &unk_1E4893088;
  v14 = v4;
  v25 = v14;
  p_buf = &buf;
  ac_dispatch_remote_sync(v13, v24, 0);

  Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  _ACSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
      v18 = CFSTR("YES");
    else
      v18 = CFSTR("NO");
    *(_DWORD *)v28 = 138543362;
    v29 = (os_signpost_id_t)v18;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v17, OS_SIGNPOST_INTERVAL_END, v7, "PushSupported", "%{public}@", v28, 0xCu);
  }

  _ACSignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v22 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
    *(_DWORD *)v28 = 134218498;
    v29 = v7;
    if (v22)
      v23 = CFSTR("YES");
    else
      v23 = CFSTR("NO");
    v30 = 2048;
    v31 = (double)Nanoseconds / 1000000000.0;
    v32 = 2114;
    v33 = v23;
    _os_log_debug_impl(&dword_1A2BCD000, v19, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: PushSupported %{public}@", v28, 0x20u);
  }

  v20 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;
  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

  return v20;
}

uint64_t __44__ACAccountStore_isPushSupportedForAccount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__ACAccountStore_isPushSupportedForAccount___block_invoke_2;
  v4[3] = &unk_1E4893060;
  v2 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "isPushSupportedForAccount:completion:", v2, v4);
}

uint64_t __44__ACAccountStore_isPushSupportedForAccount___block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

+ (int)accountsWithAccountTypeIdentifierExist:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  unint64_t Nanoseconds;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v20;
  os_activity_scope_state_s v21;
  uint8_t buf[4];
  os_signpost_id_t v23;
  __int16 v24;
  double v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1A2BCD000, "accounts/accounts-with-type-exist", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v21.opaque[0] = 0;
  v21.opaque[1] = 0;
  os_activity_scope_enter(v5, &v21);
  _ACSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _ACSignpostCreate(v6);
  v9 = v8;

  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 138412290;
    v23 = (os_signpost_id_t)v4;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "AccountsWithTypeExist", "%@", buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    +[ACAccountStore accountsWithAccountTypeIdentifierExist:].cold.1();

  if (objc_msgSend(a1, "countOfAccountsWithAccountTypeIdentifier:", v4) > 0)
    v13 = 1;
  else
    v13 = 2;
  Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  _ACSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = (os_signpost_id_t)v17;
    v24 = 2112;
    v25 = COERCE_DOUBLE(&stru_1E4894AE8);
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v16, OS_SIGNPOST_INTERVAL_END, v7, "AccountsWithTypeExist", "%@%@", buf, 0x16u);

  }
  _ACSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v23 = v7;
    v24 = 2048;
    v25 = (double)Nanoseconds / 1000000000.0;
    v26 = 2112;
    v27 = v20;
    v28 = 2112;
    v29 = &stru_1E4894AE8;
    _os_log_debug_impl(&dword_1A2BCD000, v18, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsWithTypeExist %@%@", buf, 0x2Au);

  }
  os_activity_scope_leave(&v21);

  return v13;
}

+ (int64_t)countOfAccountsWithAccountTypeIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  ACAccountStore *v12;
  void *v13;
  void *v14;
  int64_t v15;
  unint64_t Nanoseconds;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v22;
  os_activity_scope_state_s v23;
  uint8_t buf[4];
  os_signpost_id_t v25;
  __int16 v26;
  double v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = _os_activity_create(&dword_1A2BCD000, "accounts/accounts-with-type-count", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v23.opaque[0] = 0;
  v23.opaque[1] = 0;
  os_activity_scope_enter(v4, &v23);
  _ACSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = _ACSignpostCreate(v5);
  v8 = v7;

  _ACSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 138412290;
    v25 = (os_signpost_id_t)v3;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v6, "AccountsWithTypeCount", "%@", buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    +[ACAccountStore countOfAccountsWithAccountTypeIdentifier:].cold.1();

  v12 = objc_alloc_init(ACAccountStore);
  -[ACAccountStore accountTypeWithAccountTypeIdentifier:](v12, "accountTypeWithAccountTypeIdentifier:", v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccountStore accountsWithAccountType:](v12, "accountsWithAccountType:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  Nanoseconds = _ACSignpostGetNanoseconds(v6, v8);
  _ACSignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = (os_signpost_id_t)v19;
    v26 = 2112;
    v27 = COERCE_DOUBLE(&stru_1E4894AE8);
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v18, OS_SIGNPOST_INTERVAL_END, v6, "AccountsWithTypeCount", "%@%@", buf, 0x16u);

  }
  _ACSignpostLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v25 = v6;
    v26 = 2048;
    v27 = (double)Nanoseconds / 1000000000.0;
    v28 = 2112;
    v29 = v22;
    v30 = 2112;
    v31 = &stru_1E4894AE8;
    _os_log_debug_impl(&dword_1A2BCD000, v20, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsWithTypeCount %@%@", buf, 0x2Au);

  }
  os_activity_scope_leave(&v23);

  return v15;
}

- (void)insertAccountType:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  os_signpost_id_t v30;
  uint64_t v31;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1A2BCD000, "accounts/insert-account-type", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Account type must be non-nil"), 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }
  _ACSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _ACSignpostCreate(v9);
  v12 = v11;

  _ACSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "InsertAccountType", "%@", buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore insertAccountType:withCompletionHandler:].cold.1();

  v16 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __58__ACAccountStore_insertAccountType_withCompletionHandler___block_invoke;
  v28[3] = &unk_1E48930D8;
  v28[4] = self;
  v30 = v10;
  v31 = v12;
  v17 = v7;
  v29 = v17;
  v18 = (void *)MEMORY[0x1A858A038](v28);
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v16;
  v25[1] = 3221225472;
  v25[2] = __58__ACAccountStore_insertAccountType_withCompletionHandler___block_invoke_99;
  v25[3] = &unk_1E48924A0;
  v20 = v6;
  v26 = v20;
  v27 = v18;
  v23[0] = v16;
  v23[1] = 3221225472;
  v23[2] = __58__ACAccountStore_insertAccountType_withCompletionHandler___block_invoke_3;
  v23[3] = &unk_1E48924C8;
  v21 = v27;
  v23[4] = self;
  v24 = v21;
  ac_dispatch_remote(v19, v25, v23);

  os_activity_scope_leave(&state);
}

void __58__ACAccountStore_insertAccountType_withCompletionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  __int128 v12;
  char v13;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __58__ACAccountStore_insertAccountType_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E48930B0;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  block[1] = 3221225472;
  v12 = *(_OWORD *)(a1 + 48);
  v13 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __58__ACAccountStore_insertAccountType_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  unint64_t Nanoseconds;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  const __CFString *v6;
  const __CFString *v7;
  NSObject *v8;
  uint64_t result;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  Nanoseconds = _ACSignpostGetNanoseconds(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  _ACSignpostLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (*(_BYTE *)(a1 + 64))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    v7 = *(const __CFString **)(a1 + 32);
    if (!v7)
      v7 = &stru_1E4894AE8;
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v4, OS_SIGNPOST_INTERVAL_END, v5, "InsertAccountType", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  _ACSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(const __CFString **)(a1 + 48);
    v11 = CFSTR("YES");
    v12 = *(const __CFString **)(a1 + 32);
    if (!*(_BYTE *)(a1 + 64))
      v11 = CFSTR("NO");
    v14 = 134218754;
    v15 = v10;
    v13 = &stru_1E4894AE8;
    v16 = 2048;
    v17 = (double)Nanoseconds / 1000000000.0;
    v18 = 2112;
    v19 = v11;
    if (v12)
      v13 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_debug_impl(&dword_1A2BCD000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: InsertAccountType %@%@", (uint8_t *)&v14, 0x2Au);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32));
  return result;
}

void __58__ACAccountStore_insertAccountType_withCompletionHandler___block_invoke_99(uint64_t a1, void *a2)
{
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__ACAccountStore_insertAccountType_withCompletionHandler___block_invoke_2_100;
  v5[3] = &unk_1E4893100;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  objc_msgSend(a2, "insertAccountType:withHandler:", v4, v5);

}

uint64_t __58__ACAccountStore_insertAccountType_withCompletionHandler___block_invoke_2_100(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t (*v4)(void);
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(a2, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObjectID:", v6);

    v4 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  return v4();
}

void __58__ACAccountStore_insertAccountType_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)removeAccountType:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  os_signpost_id_t v30;
  uint64_t v31;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1A2BCD000, "accounts/remove-account-type", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Account type must be non-nil"), 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }
  _ACSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _ACSignpostCreate(v9);
  v12 = v11;

  _ACSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "RemoveAccountType", "%@", buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore removeAccountType:withCompletionHandler:].cold.1();

  v16 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __58__ACAccountStore_removeAccountType_withCompletionHandler___block_invoke;
  v28[3] = &unk_1E48930D8;
  v28[4] = self;
  v30 = v10;
  v31 = v12;
  v17 = v7;
  v29 = v17;
  v18 = (void *)MEMORY[0x1A858A038](v28);
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v16;
  v25[1] = 3221225472;
  v25[2] = __58__ACAccountStore_removeAccountType_withCompletionHandler___block_invoke_101;
  v25[3] = &unk_1E48924A0;
  v20 = v6;
  v26 = v20;
  v27 = v18;
  v23[0] = v16;
  v23[1] = 3221225472;
  v23[2] = __58__ACAccountStore_removeAccountType_withCompletionHandler___block_invoke_3;
  v23[3] = &unk_1E48924C8;
  v21 = v27;
  v23[4] = self;
  v24 = v21;
  ac_dispatch_remote(v19, v25, v23);

  os_activity_scope_leave(&state);
}

void __58__ACAccountStore_removeAccountType_withCompletionHandler___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  __CFString *v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  const __CFString *v10;
  const __CFString *v11;
  NSObject *v12;
  uint64_t v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  int v17;
  const __CFString *v18;
  __int16 v19;
  double v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  Nanoseconds = _ACSignpostGetNanoseconds(a1[6], a1[7]);
  _ACSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = CFSTR("NO");
    if ((_DWORD)a2)
      v10 = CFSTR("YES");
    v11 = &stru_1E4894AE8;
    if (v5)
      v11 = v5;
    v17 = 138412546;
    v18 = v10;
    v19 = 2112;
    v20 = *(double *)&v11;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RemoveAccountType", "%@%@", (uint8_t *)&v17, 0x16u);
  }

  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v14 = (const __CFString *)a1[6];
    v15 = CFSTR("NO");
    if ((_DWORD)a2)
      v15 = CFSTR("YES");
    v17 = 134218754;
    v18 = v14;
    v16 = &stru_1E4894AE8;
    v19 = 2048;
    v20 = (double)Nanoseconds / 1000000000.0;
    v21 = 2112;
    v22 = v15;
    if (v5)
      v16 = v5;
    v23 = 2112;
    v24 = v16;
    _os_log_debug_impl(&dword_1A2BCD000, v12, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: RemoveAccountType %@%@", (uint8_t *)&v17, 0x2Au);
  }

  v13 = a1[5];
  if (v13)
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v13 + 16))(v13, a2, v5);

}

void __58__ACAccountStore_removeAccountType_withCompletionHandler___block_invoke_101(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__ACAccountStore_removeAccountType_withCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E4893128;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "removeAccountType:withHandler:", v3, v4);

}

uint64_t __58__ACAccountStore_removeAccountType_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__ACAccountStore_removeAccountType_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)removeAccount:(id)a3 withDeleteSync:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v5 = a4;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a5;
  v11 = a3;
  objc_msgSend(v8, "numberWithBool:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccountProperty:forKey:", v10, CFSTR("AccountSyncDelete"));

  -[ACAccountStore removeAccount:withDataclassActions:completion:](self, "removeAccount:withDataclassActions:completion:", v11, 0, v9);
}

- (void)removeAccount:(ACAccount *)account withCompletionHandler:(ACAccountStoreRemoveCompletionHandler)completionHandler
{
  -[ACAccountStore removeAccount:withDataclassActions:completion:](self, "removeAccount:withDataclassActions:completion:", account, 0, completionHandler);
}

- (void)removeAccount:(id)a3 withDataclassActions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  _QWORD v38[5];
  id v39;
  os_signpost_id_t v40;
  uint64_t v41;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_1A2BCD000, "accounts/remove-account", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Account must be non-nil"), 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v31);
  }
  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = _ACSignpostCreate(v12);
  v15 = v14;

  _ACSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    objc_msgSend(v8, "accountType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v44 = (os_signpost_id_t)v19;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "RemoveAccount", " AccountType=%{public,signpost.telemetry:string1,name=AccountType}@ ", buf, 0xCu);

  }
  _ACSignpostLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "accountType");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v44 = v13;
    v45 = 2114;
    v46 = v30;
    _os_log_debug_impl(&dword_1A2BCD000, v20, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: RemoveAccount  AccountType=%{public,signpost.telemetry:string1,name=AccountType}@ ", buf, 0x16u);

  }
  _ACLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v44 = (os_signpost_id_t)v8;
    _os_log_impl(&dword_1A2BCD000, v21, OS_LOG_TYPE_DEFAULT, "\"Starting removal of account %@.\", buf, 0xCu);
  }

  v22 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __64__ACAccountStore_removeAccount_withDataclassActions_completion___block_invoke;
  v38[3] = &unk_1E48930D8;
  v38[4] = self;
  v40 = v13;
  v41 = v15;
  v23 = v10;
  v39 = v23;
  v24 = (void *)MEMORY[0x1A858A038](v38);
  -[ACAccountStore longLivedRemoteAccountStoreSession](self, "longLivedRemoteAccountStoreSession");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v22;
  v34[1] = 3221225472;
  v34[2] = __64__ACAccountStore_removeAccount_withDataclassActions_completion___block_invoke_108;
  v34[3] = &unk_1E4892C40;
  v26 = v8;
  v35 = v26;
  v27 = v9;
  v36 = v27;
  v37 = v24;
  v32[0] = v22;
  v32[1] = 3221225472;
  v32[2] = __64__ACAccountStore_removeAccount_withDataclassActions_completion___block_invoke_2;
  v32[3] = &unk_1E48924C8;
  v28 = v37;
  v32[4] = self;
  v33 = v28;
  ac_dispatch_remote(v25, v34, v32);

  os_activity_scope_leave(&state);
}

void __64__ACAccountStore_removeAccount_withDataclassActions_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  __int128 v14;
  char v15;
  uint8_t buf[4];
  const __CFString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _ACLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v17 = v7;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1A2BCD000, v6, OS_LOG_TYPE_DEFAULT, "\"Completed account removal: %@ - %@.\", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __64__ACAccountStore_removeAccount_withDataclassActions_completion___block_invoke_107;
  block[3] = &unk_1E4893150;
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  block[1] = 3221225472;
  v14 = *(_OWORD *)(a1 + 48);
  v15 = a2;
  v12 = v5;
  v13 = v8;
  v10 = v5;
  dispatch_async(v9, block);

}

uint64_t __64__ACAccountStore_removeAccount_withDataclassActions_completion___block_invoke_107(uint64_t a1)
{
  unint64_t Nanoseconds;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  const __CFString *v6;
  NSObject *v7;
  uint64_t result;
  const __CFString *v9;
  int v10;
  const __CFString *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  double v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  Nanoseconds = _ACSignpostGetNanoseconds(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  _ACSignpostLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (*(_BYTE *)(a1 + 64))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    v12 = 138543362;
    v13 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v4, OS_SIGNPOST_INTERVAL_END, v5, "RemoveAccount", "%{public}@", (uint8_t *)&v12, 0xCu);
  }

  _ACSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = *(const __CFString **)(a1 + 48);
    v10 = *(unsigned __int8 *)(a1 + 64);
    v12 = 134218498;
    v13 = v9;
    if (v10)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    v14 = 2048;
    v15 = (double)Nanoseconds / 1000000000.0;
    v16 = 2114;
    v17 = v11;
    _os_log_debug_impl(&dword_1A2BCD000, v7, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: RemoveAccount %{public}@", (uint8_t *)&v12, 0x20u);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __64__ACAccountStore_removeAccount_withDataclassActions_completion___block_invoke_108(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "removeAccount:withDataclassActions:completion:", a1[4], a1[5], a1[6]);
}

void __64__ACAccountStore_removeAccount_withDataclassActions_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)canSaveAccount:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  void *v20;
  id v21;
  _QWORD v22[5];
  void (**v23)(_QWORD, _QWORD, _QWORD);
  _QWORD v24[4];
  id v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  _QWORD v27[5];
  id v28;
  os_signpost_id_t v29;
  uint64_t v30;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1A2BCD000, "accounts/can-save-account", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Account must be non-nil"), 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  _ACSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _ACSignpostCreate(v9);
  v12 = v11;

  _ACSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CanSaveAccount", (const char *)&unk_1A2C2C35B, buf, 2u);
  }

  _ACSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore canSaveAccount:withCompletionHandler:].cold.1();

  _ACLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v6;
    _os_log_impl(&dword_1A2BCD000, v16, OS_LOG_TYPE_DEFAULT, "\"Checking save eligibility of account %@.\", buf, 0xCu);
  }

  v17 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __55__ACAccountStore_canSaveAccount_withCompletionHandler___block_invoke;
  v27[3] = &unk_1E48930D8;
  v27[4] = self;
  v29 = v10;
  v30 = v12;
  v18 = v7;
  v28 = v18;
  v19 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A858A038](v27);
  if ((objc_msgSend(v6, "isDirty") & 1) != 0)
  {
    -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v17;
    v24[1] = 3221225472;
    v24[2] = __55__ACAccountStore_canSaveAccount_withCompletionHandler___block_invoke_110;
    v24[3] = &unk_1E48924A0;
    v25 = v6;
    v26 = v19;
    v22[0] = v17;
    v22[1] = 3221225472;
    v22[2] = __55__ACAccountStore_canSaveAccount_withCompletionHandler___block_invoke_2;
    v22[3] = &unk_1E48924C8;
    v22[4] = self;
    v23 = v26;
    ac_dispatch_remote(v20, v24, v22);

  }
  else
  {
    v19[2](v19, 1, 0);
  }

  os_activity_scope_leave(&state);
}

void __55__ACAccountStore_canSaveAccount_withCompletionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  __int128 v14;
  char v15;
  uint8_t buf[4];
  const __CFString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _ACLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v17 = v7;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1A2BCD000, v6, OS_LOG_TYPE_DEFAULT, "\"Completed checking save eligibility: %@ - %@.\", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __55__ACAccountStore_canSaveAccount_withCompletionHandler___block_invoke_109;
  block[3] = &unk_1E4893150;
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  block[1] = 3221225472;
  v14 = *(_OWORD *)(a1 + 48);
  v15 = a2;
  v12 = v5;
  v13 = v8;
  v10 = v5;
  dispatch_async(v9, block);

}

uint64_t __55__ACAccountStore_canSaveAccount_withCompletionHandler___block_invoke_109(uint64_t a1)
{
  unint64_t Nanoseconds;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  const __CFString *v6;
  NSObject *v7;
  uint64_t result;
  const __CFString *v9;
  int v10;
  const __CFString *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  double v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  Nanoseconds = _ACSignpostGetNanoseconds(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  _ACSignpostLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (*(_BYTE *)(a1 + 64))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    v12 = 138543362;
    v13 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v4, OS_SIGNPOST_INTERVAL_END, v5, "CanSaveAccount", "%{public}@", (uint8_t *)&v12, 0xCu);
  }

  _ACSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = *(const __CFString **)(a1 + 48);
    v10 = *(unsigned __int8 *)(a1 + 64);
    v12 = 134218498;
    v13 = v9;
    if (v10)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    v14 = 2048;
    v15 = (double)Nanoseconds / 1000000000.0;
    v16 = 2114;
    v17 = v11;
    _os_log_debug_impl(&dword_1A2BCD000, v7, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: CanSaveAccount %{public}@", (uint8_t *)&v12, 0x20u);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __55__ACAccountStore_canSaveAccount_withCompletionHandler___block_invoke_110(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "canSaveAccount:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __55__ACAccountStore_canSaveAccount_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

+ (BOOL)canSaveAccountsOfAccountTypeIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  ACAccountStore *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  unint64_t Nanoseconds;
  NSObject *v17;
  NSObject *v18;
  const __CFString *v19;
  NSObject *v20;
  const __CFString *v22;
  os_activity_scope_state_s v23;
  uint8_t buf[4];
  os_signpost_id_t v25;
  __int16 v26;
  double v27;
  __int16 v28;
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = _os_activity_create(&dword_1A2BCD000, "accounts/can-save-accounts-with-type", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v23.opaque[0] = 0;
  v23.opaque[1] = 0;
  os_activity_scope_enter(v4, &v23);
  _ACSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = _ACSignpostCreate(v5);
  v8 = v7;

  _ACSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 138412290;
    v25 = (os_signpost_id_t)v3;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v6, "CanSaveAccountsWithType", "%@", buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    +[ACAccountStore canSaveAccountsOfAccountTypeIdentifier:].cold.1();

  v12 = objc_alloc_init(ACAccountStore);
  -[ACAccountStore accountTypeWithAccountTypeIdentifier:](v12, "accountTypeWithAccountTypeIdentifier:", v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "supportsMultipleAccounts") & 1) != 0)
  {
    v14 = 1;
  }
  else
  {
    objc_msgSend(v13, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = +[ACAccountStore countOfAccountsWithAccountTypeIdentifier:](ACAccountStore, "countOfAccountsWithAccountTypeIdentifier:", v15) < 1;

  }
  Nanoseconds = _ACSignpostGetNanoseconds(v6, v8);
  _ACSignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    v19 = CFSTR("NO");
    if (v14)
      v19 = CFSTR("YES");
    *(_DWORD *)buf = 138543362;
    v25 = (os_signpost_id_t)v19;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v18, OS_SIGNPOST_INTERVAL_END, v6, "CanSaveAccountsWithType", "%{public}@", buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v22 = CFSTR("NO");
    *(_DWORD *)buf = 134218498;
    v25 = v6;
    if (v14)
      v22 = CFSTR("YES");
    v26 = 2048;
    v27 = (double)Nanoseconds / 1000000000.0;
    v28 = 2114;
    v29 = v22;
    _os_log_debug_impl(&dword_1A2BCD000, v20, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: CanSaveAccountsWithType %{public}@", buf, 0x20u);
  }

  os_activity_scope_leave(&v23);
  return v14;
}

- (void)saveAccount:(ACAccount *)account withCompletionHandler:(ACAccountStoreSaveCompletionHandler)completionHandler
{
  -[ACAccountStore _saveAccount:verify:dataclassActions:completion:](self, "_saveAccount:verify:dataclassActions:completion:", account, 1, 0, completionHandler);
}

- (void)_saveAccount:(id)a3 verify:(BOOL)a4 dataclassActions:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  id v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  BOOL v43;
  _QWORD v44[5];
  id v45;
  id v46;
  _QWORD v47[5];
  id v48;
  os_signpost_id_t v49;
  uint64_t v50;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v36 = a5;
  v10 = a6;
  v11 = _os_activity_create(&dword_1A2BCD000, "accounts/save-account", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Account must be non-nil"), 0);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v34);
  }
  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = _ACSignpostCreate(v12);
  v15 = v14;

  _ACSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    objc_msgSend(v9, "accountType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v53 = (os_signpost_id_t)v19;
    v54 = 2112;
    v55 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SaveAccount", " AccountType=%{public,signpost.telemetry:string1,name=AccountType}@ (account: %@)", buf, 0x16u);

  }
  _ACSignpostLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v9, "accountType");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "identifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v53 = v13;
    v54 = 2114;
    v55 = v33;
    v56 = 2112;
    v57 = v9;
    _os_log_debug_impl(&dword_1A2BCD000, v20, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: SaveAccount  AccountType=%{public,signpost.telemetry:string1,name=AccountType}@ (account: %@)", buf, 0x20u);

  }
  _ACLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v53 = (os_signpost_id_t)v9;
    _os_log_impl(&dword_1A2BCD000, v21, OS_LOG_TYPE_DEFAULT, "\"Starting save for account %@.\", buf, 0xCu);
  }

  v22 = MEMORY[0x1E0C809B0];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __66__ACAccountStore__saveAccount_verify_dataclassActions_completion___block_invoke;
  v47[3] = &unk_1E48930D8;
  v47[4] = self;
  v49 = v13;
  v50 = v15;
  v23 = v10;
  v48 = v23;
  v44[0] = v22;
  v44[1] = 3221225472;
  v44[2] = __66__ACAccountStore__saveAccount_verify_dataclassActions_completion___block_invoke_112;
  v44[3] = &unk_1E4893178;
  v24 = (id)MEMORY[0x1A858A038](v47);
  v46 = v24;
  v44[4] = self;
  v25 = v9;
  v45 = v25;
  v26 = (void *)MEMORY[0x1A858A038](v44);
  if ((objc_msgSend(v25, "isDirty") & 1) != 0)
  {
    _ACLogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[ACAccountStore _saveAccount:verify:dataclassActions:completion:].cold.1();

    objc_msgSend(v25, "accountType");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACAccountStore _checkSaveRateLimitForAccountType:](self, "_checkSaveRateLimitForAccountType:", v29);

    -[ACAccountStore longLivedRemoteAccountStoreSession](self, "longLivedRemoteAccountStoreSession");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v22;
    v39[1] = 3221225472;
    v39[2] = __66__ACAccountStore__saveAccount_verify_dataclassActions_completion___block_invoke_114;
    v39[3] = &unk_1E48931A0;
    v40 = v25;
    v43 = a4;
    v41 = v36;
    v42 = v26;
    v37[0] = v22;
    v37[1] = 3221225472;
    v37[2] = __66__ACAccountStore__saveAccount_verify_dataclassActions_completion___block_invoke_2;
    v37[3] = &unk_1E48924C8;
    v37[4] = self;
    v38 = v24;
    ac_dispatch_remote(v30, v39, v37);

  }
  else
  {
    _ACLogSystem();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      -[ACAccountStore _saveAccount:verify:dataclassActions:completion:].cold.2();

    (*((void (**)(id, uint64_t, _QWORD))v24 + 2))(v24, 1, 0);
  }

  os_activity_scope_leave(&state);
}

void __66__ACAccountStore__saveAccount_verify_dataclassActions_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  __int128 v14;
  char v15;
  uint8_t buf[4];
  const __CFString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _ACLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v17 = v7;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1A2BCD000, v6, OS_LOG_TYPE_DEFAULT, "\"Completed account save: %@ - %@.\", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __66__ACAccountStore__saveAccount_verify_dataclassActions_completion___block_invoke_111;
  block[3] = &unk_1E4893150;
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  block[1] = 3221225472;
  v14 = *(_OWORD *)(a1 + 48);
  v15 = a2;
  v12 = v5;
  v13 = v8;
  v10 = v5;
  dispatch_async(v9, block);

}

uint64_t __66__ACAccountStore__saveAccount_verify_dataclassActions_completion___block_invoke_111(uint64_t a1)
{
  unint64_t Nanoseconds;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  const __CFString *v6;
  NSObject *v7;
  uint64_t result;
  const __CFString *v9;
  int v10;
  const __CFString *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  double v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  Nanoseconds = _ACSignpostGetNanoseconds(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  _ACSignpostLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (*(_BYTE *)(a1 + 64))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    v12 = 138543362;
    v13 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v4, OS_SIGNPOST_INTERVAL_END, v5, "SaveAccount", "%{public}@", (uint8_t *)&v12, 0xCu);
  }

  _ACSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = *(const __CFString **)(a1 + 48);
    v10 = *(unsigned __int8 *)(a1 + 64);
    v12 = 134218498;
    v13 = v9;
    if (v10)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    v14 = 2048;
    v15 = (double)Nanoseconds / 1000000000.0;
    v16 = 2114;
    v17 = v11;
    _os_log_debug_impl(&dword_1A2BCD000, v7, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: SaveAccount %{public}@", (uint8_t *)&v12, 0x20u);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32));
  return result;
}

void __66__ACAccountStore__saveAccount_verify_dataclassActions_completion___block_invoke_112(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v12 = a2;
  if (v12)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a3;
    objc_msgSend(v5, "_clearAccountCaches");
    objc_msgSend(*(id *)(a1 + 40), "_setObjectID:", v12);
    objc_msgSend(*(id *)(a1 + 40), "_clearCachedChildAccounts");
    objc_msgSend(*(id *)(a1 + 40), "_setAccountStore:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "_clearDirtyProperties");
    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "_unsanitizeError:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, uint64_t, void *))(v7 + 16))(v7, 1, v8);
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(void **)(a1 + 32);
    v11 = a3;
    objc_msgSend(v10, "_unsanitizeError:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v8);
  }

}

uint64_t __66__ACAccountStore__saveAccount_verify_dataclassActions_completion___block_invoke_114(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "saveAccount:verify:dataclassActions:completion:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __66__ACAccountStore__saveAccount_verify_dataclassActions_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)saveAccount:(id)a3 withDataclassActions:(id)a4 completion:(id)a5
{
  -[ACAccountStore _saveAccount:verify:dataclassActions:completion:](self, "_saveAccount:verify:dataclassActions:completion:", a3, 1, a4, a5);
}

- (void)saveAccount:(id)a3 withDataclassActions:(id)a4 doVerify:(BOOL)a5 completion:(id)a6
{
  -[ACAccountStore _saveAccount:verify:dataclassActions:completion:](self, "_saveAccount:verify:dataclassActions:completion:", a3, a5, a4, a6);
}

- (void)saveVerifiedAccount:(id)a3 withCompletionHandler:(id)a4
{
  -[ACAccountStore _saveAccount:verify:dataclassActions:completion:](self, "_saveAccount:verify:dataclassActions:completion:", a3, 0, 0, a4);
}

- (BOOL)saveVerifiedAccount:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  unint64_t Nanoseconds;
  NSObject *v23;
  NSObject *v24;
  const __CFString *v25;
  const __CFString *v26;
  NSObject *v27;
  BOOL v28;
  void *v30;
  void *v31;
  const __CFString *v32;
  const __CFString *v33;
  id v34;
  _QWORD v35[7];
  _QWORD v36[4];
  NSObject *v37;
  ACAccountStore *v38;
  uint64_t *v39;
  _BYTE *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  os_activity_scope_state_s state;
  uint8_t v46[4];
  os_signpost_id_t v47;
  __int16 v48;
  double v49;
  __int16 v50;
  const __CFString *v51;
  __int16 v52;
  const __CFString *v53;
  _BYTE buf[24];
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_1A2BCD000, "accounts/save-verified-account", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Account must be non-nil"), 0);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v34);
  }
  _ACSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = _ACSignpostCreate(v8);
  v11 = v10;

  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    objc_msgSend(v6, "accountType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SaveAccount", " AccountType=%{public,signpost.telemetry:string1,name=AccountType}@ (account: %@)", buf, 0x16u);

  }
  _ACSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "accountType");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "identifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v31;
    *(_WORD *)&buf[22] = 2112;
    v55 = (uint64_t (*)(uint64_t, uint64_t))v6;
    _os_log_debug_impl(&dword_1A2BCD000, v16, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: SaveAccount  AccountType=%{public,signpost.telemetry:string1,name=AccountType}@ (account: %@)", buf, 0x20u);

  }
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 1;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v55 = __Block_byref_object_copy__0;
  v56 = __Block_byref_object_dispose__0;
  v57 = 0;
  if (objc_msgSend(v6, "isDirty"))
  {
    objc_msgSend(v6, "accountType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACAccountStore _checkSaveRateLimitForAccountType:](self, "_checkSaveRateLimitForAccountType:", v18);

    -[ACAccountStore longLivedRemoteAccountStoreSession](self, "longLivedRemoteAccountStoreSession");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __44__ACAccountStore_saveVerifiedAccount_error___block_invoke;
    v36[3] = &unk_1E48931F0;
    v39 = &v41;
    v40 = buf;
    v37 = v6;
    v38 = self;
    v35[0] = v20;
    v35[1] = 3221225472;
    v35[2] = __44__ACAccountStore_saveVerifiedAccount_error___block_invoke_3;
    v35[3] = &unk_1E4892F98;
    v35[5] = &v41;
    v35[6] = buf;
    v35[4] = self;
    ac_dispatch_remote_sync(v19, v36, v35);

    v21 = v37;
  }
  else
  {
    _ACLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[ACAccountStore saveVerifiedAccount:error:].cold.1();
  }

  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  Nanoseconds = _ACSignpostGetNanoseconds(v9, v11);
  _ACSignpostLogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    if (*((_BYTE *)v42 + 24))
      v25 = CFSTR("YES");
    else
      v25 = CFSTR("NO");
    v26 = *(const __CFString **)(*(_QWORD *)&buf[8] + 40);
    if (*(double *)&v26 == 0.0)
      *(double *)&v26 = COERCE_DOUBLE(&stru_1E4894AE8);
    *(_DWORD *)v46 = 138412546;
    v47 = (os_signpost_id_t)v25;
    v48 = 2112;
    v49 = *(double *)&v26;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v24, OS_SIGNPOST_INTERVAL_END, v9, "SaveAccount", "%@%@", v46, 0x16u);
  }

  _ACSignpostLogSystem();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    v32 = CFSTR("YES");
    v33 = *(const __CFString **)(*(_QWORD *)&buf[8] + 40);
    if (!*((_BYTE *)v42 + 24))
      v32 = CFSTR("NO");
    *(_DWORD *)v46 = 134218754;
    v47 = v9;
    v48 = 2048;
    v49 = (double)Nanoseconds / 1000000000.0;
    v50 = 2112;
    v51 = v32;
    if (!v33)
      v33 = &stru_1E4894AE8;
    v52 = 2112;
    v53 = v33;
    _os_log_debug_impl(&dword_1A2BCD000, v27, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: SaveAccount %@%@", v46, 0x2Au);
  }

  v28 = *((_BYTE *)v42 + 24) != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v41, 8);
  os_activity_scope_leave(&state);

  return v28;
}

void __44__ACAccountStore_saveVerifiedAccount_error___block_invoke(uint64_t a1, void *a2)
{
  int8x16_t v2;
  _QWORD v3[4];
  int8x16_t v4;
  __int128 v5;

  v3[1] = 3221225472;
  v2 = *(int8x16_t *)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 48);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[2] = __44__ACAccountStore_saveVerifiedAccount_error___block_invoke_2;
  v3[3] = &unk_1E48931C8;
  v4 = vextq_s8(v2, v2, 8uLL);
  objc_msgSend(a2, "saveAccount:verify:dataclassActions:completion:", (id)v2.i64[0], 0, 0, v3);

}

void __44__ACAccountStore_saveVerifiedAccount_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  if (v12)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a3;
    objc_msgSend(v5, "_clearAccountCaches");
    objc_msgSend(*(id *)(a1 + 40), "_setObjectID:", v12);
    objc_msgSend(*(id *)(a1 + 40), "_clearCachedChildAccounts");
    objc_msgSend(*(id *)(a1 + 40), "_setAccountStore:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "_clearDirtyProperties");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v7 = *(void **)(a1 + 32);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v8 = *(void **)(a1 + 32);
    v6 = a3;
    v7 = v8;
  }
  objc_msgSend(v7, "_unsanitizeError:", v6);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

void __44__ACAccountStore_saveVerifiedAccount_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (int)updateExistenceCacheOfAccountWithTypeIdentifier:(id)a3
{
  return +[ACAccountStore accountsWithAccountTypeIdentifierExist:](ACAccountStore, "accountsWithAccountTypeIdentifierExist:", a3);
}

- (void)_checkSaveRateLimitForAccountType:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (_checkSaveRateLimitForAccountType__onceToken != -1)
    dispatch_once(&_checkSaveRateLimitForAccountType__onceToken, &__block_literal_global_115);
  if (_checkSaveRateLimitForAccountType__saveRateLimiter
    && (objc_msgSend((id)_checkSaveRateLimitForAccountType__saveRateLimiter, "reservePerformActionForKey:", v3) & 1) == 0)
  {
    _ACLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[ACAccountStore _checkSaveRateLimitForAccountType:].cold.1((uint64_t)v3, v4);

  }
}

void __52__ACAccountStore__checkSaveRateLimitForAccountType___block_invoke()
{
  ACRateLimiter *v0;
  void *v1;

  if (_os_feature_enabled_impl())
  {
    v0 = -[ACRateLimiter initWithMaximum:inTimeInterval:]([ACRateLimiter alloc], "initWithMaximum:inTimeInterval:", 60, 60.0);
    v1 = (void *)_checkSaveRateLimitForAccountType__saveRateLimiter;
    _checkSaveRateLimitForAccountType__saveRateLimiter = (uint64_t)v0;

  }
}

- (void)requestAccessToAccountsWithType:(ACAccountType *)accountType withCompletionHandler:(ACAccountStoreRequestAccessCompletionHandler)handler
{
  -[ACAccountStore requestAccessToAccountsWithType:options:completion:](self, "requestAccessToAccountsWithType:options:completion:", accountType, 0, handler);
}

void __69__ACAccountStore_requestAccessToAccountsWithType_options_completion___block_invoke_123(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__ACAccountStore_requestAccessToAccountsWithType_options_completion___block_invoke_2_124;
  v7[3] = &unk_1E4893128;
  v6 = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v4, "requestAccessForAccountTypeWithIdentifier:options:withHandler:", v5, v6, v7);

}

uint64_t __69__ACAccountStore_requestAccessToAccountsWithType_options_completion___block_invoke_2_124(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 0;
  }
  else
  {
    v6 = objc_msgSend(a2, "BOOLValue");
    v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    v5 = v3;
    a3 = 0;
  }
  return v4(v5, v6, a3);
}

void __69__ACAccountStore_requestAccessToAccountsWithType_options_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (id)appPermissionsForAccountType:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  unint64_t Nanoseconds;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  id v20;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  __int128 *p_buf;
  os_activity_scope_state_s state;
  uint8_t v27[4];
  os_signpost_id_t v28;
  __int16 v29;
  double v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  const __CFString *v34;
  __int128 buf;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1A2BCD000, "accounts/app-permissions", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _ACSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _ACSignpostCreate(v6);
  v9 = v8;

  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "AppPermissionsForAccountType", "%@", (uint8_t *)&buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore appPermissionsForAccountType:].cold.1();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__0;
  v38 = __Block_byref_object_dispose__0;
  v39 = 0;
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __47__ACAccountStore_appPermissionsForAccountType___block_invoke;
  v23[3] = &unk_1E4893088;
  v14 = v4;
  v24 = v14;
  p_buf = &buf;
  ac_dispatch_remote_sync(v13, v23, 0);

  Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  _ACSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    v18 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v27 = 138412546;
    v28 = v18;
    v29 = 2112;
    v30 = COERCE_DOUBLE(&stru_1E4894AE8);
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v17, OS_SIGNPOST_INTERVAL_END, v7, "AppPermissionsForAccountType", "%@%@", v27, 0x16u);
  }

  _ACSignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v27 = 134218754;
    v22 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    v28 = v7;
    v29 = 2048;
    v30 = (double)Nanoseconds / 1000000000.0;
    v31 = 2112;
    v32 = v22;
    v33 = 2112;
    v34 = &stru_1E4894AE8;
    _os_log_debug_impl(&dword_1A2BCD000, v19, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AppPermissionsForAccountType %@%@", v27, 0x2Au);
  }

  v20 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);
  return v20;
}

uint64_t __47__ACAccountStore_appPermissionsForAccountType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__ACAccountStore_appPermissionsForAccountType___block_invoke_2;
  v4[3] = &unk_1E4893260;
  v2 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "appPermissionsForAccountType:withHandler:", v2, v4);
}

void __47__ACAccountStore_appPermissionsForAccountType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    _ACLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

- (void)setPermissionGranted:(BOOL)a3 forBundleID:(id)a4 onAccountType:(id)a5
{
  _BOOL4 v6;
  __CFString *v8;
  __CFString *v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  const __CFString *v17;
  NSObject *v18;
  dispatch_semaphore_t v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  __CFString *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  const __CFString *v28;
  _QWORD v29[4];
  NSObject *v30;
  _QWORD v31[4];
  __CFString *v32;
  __CFString *v33;
  NSObject *v34;
  BOOL v35;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  __CFString *v42;
  __int16 v43;
  __CFString *v44;
  uint64_t v45;

  v6 = a3;
  v45 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a4;
  v9 = (__CFString *)a5;
  v10 = _os_activity_create(&dword_1A2BCD000, "accounts/set-permission-granted", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  _ACSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = _ACSignpostCreate(v11);
  v14 = v13;

  _ACSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    v17 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    if (v6)
      v17 = CFSTR("YES");
    v38 = (os_signpost_id_t)v17;
    v39 = 2112;
    v40 = v8;
    v41 = 2112;
    v42 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PermitBundleWithAccountType", "%@: %@ -> %@", buf, 0x20u);
  }

  _ACSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v28 = CFSTR("NO");
    *(_DWORD *)buf = 134218754;
    v38 = v12;
    if (v6)
      v28 = CFSTR("YES");
    v39 = 2112;
    v40 = v28;
    v41 = 2112;
    v42 = v8;
    v43 = 2112;
    v44 = v9;
    _os_log_debug_impl(&dword_1A2BCD000, v18, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: PermitBundleWithAccountType %@: %@ -> %@", buf, 0x2Au);
  }

  v19 = dispatch_semaphore_create(0);
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __65__ACAccountStore_setPermissionGranted_forBundleID_onAccountType___block_invoke;
  v31[3] = &unk_1E48932B0;
  v35 = v6;
  v22 = v8;
  v32 = v22;
  v23 = v9;
  v33 = v23;
  v34 = v19;
  v29[0] = v21;
  v29[1] = 3221225472;
  v29[2] = __65__ACAccountStore_setPermissionGranted_forBundleID_onAccountType___block_invoke_128;
  v29[3] = &unk_1E48932D8;
  v24 = v34;
  v30 = v24;
  ac_dispatch_remote(v20, v31, v29);

  dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
  _ACSignpostGetNanoseconds(v12, v14);
  _ACSignpostLogSystem();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v26, OS_SIGNPOST_INTERVAL_END, v12, "PermitBundleWithAccountType", (const char *)&unk_1A2C2C35B, buf, 2u);
  }

  _ACSignpostLogSystem();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore setPermissionGranted:forBundleID:onAccountType:].cold.1(v12);

  os_activity_scope_leave(&state);
}

void __65__ACAccountStore_setPermissionGranted_forBundleID_onAccountType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(unsigned __int8 *)(a1 + 56);
  v5 = a2;
  objc_msgSend(v3, "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__ACAccountStore_setPermissionGranted_forBundleID_onAccountType___block_invoke_2;
  v9[3] = &unk_1E4893288;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v5, "setPermissionGranted:forBundleID:onAccountType:withHandler:", v6, v7, v8, v9);

}

void __65__ACAccountStore_setPermissionGranted_forBundleID_onAccountType___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    _ACLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

intptr_t __65__ACAccountStore_setPermissionGranted_forBundleID_onAccountType___block_invoke_128(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)clearAllPermissionsGrantedForAccountType:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_semaphore_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD v21[4];
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  NSObject *v25;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1A2BCD000, "accounts/clear-permission-granted", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _ACSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _ACSignpostCreate(v6);
  v9 = v8;

  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v4;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "ClearPermissionsForAccountType", "%@", buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore clearAllPermissionsGrantedForAccountType:].cold.2();

  v13 = dispatch_semaphore_create(0);
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __59__ACAccountStore_clearAllPermissionsGrantedForAccountType___block_invoke;
  v23[3] = &unk_1E4893300;
  v16 = v4;
  v24 = v16;
  v25 = v13;
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __59__ACAccountStore_clearAllPermissionsGrantedForAccountType___block_invoke_129;
  v21[3] = &unk_1E48932D8;
  v17 = v25;
  v22 = v17;
  ac_dispatch_remote(v14, v23, v21);

  dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  _ACSignpostGetNanoseconds(v7, v9);
  _ACSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v19, OS_SIGNPOST_INTERVAL_END, v7, "ClearPermissionsForAccountType", (const char *)&unk_1A2C2C35B, buf, 2u);
  }

  _ACSignpostLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore clearAllPermissionsGrantedForAccountType:].cold.1(v7);

  os_activity_scope_leave(&state);
}

void __59__ACAccountStore_clearAllPermissionsGrantedForAccountType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__ACAccountStore_clearAllPermissionsGrantedForAccountType___block_invoke_2;
  v4[3] = &unk_1E4893288;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "clearAllPermissionsGrantedForAccountType:withHandler:", v3, v4);

}

void __59__ACAccountStore_clearAllPermissionsGrantedForAccountType___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    _ACLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

intptr_t __59__ACAccountStore_clearAllPermissionsGrantedForAccountType___block_invoke_129(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)permissionForAccountType:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  unint64_t Nanoseconds;
  NSObject *v16;
  NSObject *v17;
  const __CFString *v18;
  NSObject *v19;
  BOOL v20;
  int v22;
  const __CFString *v23;
  _QWORD v24[4];
  id v25;
  __int128 *p_buf;
  os_activity_scope_state_s state;
  uint8_t v28[4];
  os_signpost_id_t v29;
  __int16 v30;
  double v31;
  __int16 v32;
  const __CFString *v33;
  __int128 buf;
  uint64_t v35;
  char v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1A2BCD000, "accounts/permission-for-type", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _ACSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _ACSignpostCreate(v6);
  v9 = v8;

  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PermissionForAccountType", "%@", (uint8_t *)&buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore permissionForAccountType:].cold.1();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v35 = 0x2020000000;
  v36 = 0;
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __43__ACAccountStore_permissionForAccountType___block_invoke;
  v24[3] = &unk_1E4893088;
  v14 = v4;
  v25 = v14;
  p_buf = &buf;
  ac_dispatch_remote_sync(v13, v24, 0);

  Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  _ACSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
      v18 = CFSTR("YES");
    else
      v18 = CFSTR("NO");
    *(_DWORD *)v28 = 138543362;
    v29 = (os_signpost_id_t)v18;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v17, OS_SIGNPOST_INTERVAL_END, v7, "ClearPermissionsForAccountType", "%{public}@", v28, 0xCu);
  }

  _ACSignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v22 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
    *(_DWORD *)v28 = 134218498;
    v29 = v7;
    if (v22)
      v23 = CFSTR("YES");
    else
      v23 = CFSTR("NO");
    v30 = 2048;
    v31 = (double)Nanoseconds / 1000000000.0;
    v32 = 2114;
    v33 = v23;
    _os_log_debug_impl(&dword_1A2BCD000, v19, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: ClearPermissionsForAccountType %{public}@", v28, 0x20u);
  }

  v20 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;
  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

  return v20;
}

uint64_t __43__ACAccountStore_permissionForAccountType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__ACAccountStore_permissionForAccountType___block_invoke_2;
  v4[3] = &unk_1E4893328;
  v2 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "permissionForAccountType:withHandler:", v2, v4);
}

void __43__ACAccountStore_permissionForAccountType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    _ACLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "BOOLValue");
  }

}

- (id)grantedPermissionsForAccountType:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  unint64_t Nanoseconds;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  id v20;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  __int128 *p_buf;
  os_activity_scope_state_s state;
  uint8_t v27[4];
  os_signpost_id_t v28;
  __int16 v29;
  double v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  const __CFString *v34;
  __int128 buf;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1A2BCD000, "accounts/granted-permissions-for-type", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _ACSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _ACSignpostCreate(v6);
  v9 = v8;

  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "GrantedPermissionsForAccountType", "%@", (uint8_t *)&buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore grantedPermissionsForAccountType:].cold.1();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__0;
  v38 = __Block_byref_object_dispose__0;
  v39 = 0;
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __51__ACAccountStore_grantedPermissionsForAccountType___block_invoke;
  v23[3] = &unk_1E4893088;
  v14 = v4;
  v24 = v14;
  p_buf = &buf;
  ac_dispatch_remote_sync(v13, v23, 0);

  Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  _ACSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    v18 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v27 = 138412546;
    v28 = v18;
    v29 = 2112;
    v30 = COERCE_DOUBLE(&stru_1E4894AE8);
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v17, OS_SIGNPOST_INTERVAL_END, v7, "GrantedPermissionsForAccountType", "%@%@", v27, 0x16u);
  }

  _ACSignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v27 = 134218754;
    v22 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    v28 = v7;
    v29 = 2048;
    v30 = (double)Nanoseconds / 1000000000.0;
    v31 = 2112;
    v32 = v22;
    v33 = 2112;
    v34 = &stru_1E4894AE8;
    _os_log_debug_impl(&dword_1A2BCD000, v19, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: GrantedPermissionsForAccountType %@%@", v27, 0x2Au);
  }

  v20 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);
  return v20;
}

uint64_t __51__ACAccountStore_grantedPermissionsForAccountType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__ACAccountStore_grantedPermissionsForAccountType___block_invoke_2;
  v4[3] = &unk_1E4893238;
  v2 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "grantedPermissionsForAccountType:withHandler:", v2, v4);
}

void __51__ACAccountStore_grantedPermissionsForAccountType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    _ACLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

- (void)clearGrantedPermissionsForAccountType:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_semaphore_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD v21[4];
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  NSObject *v25;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1A2BCD000, "accounts/clear-granted-permissions-for-type", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _ACSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _ACSignpostCreate(v6);
  v9 = v8;

  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v4;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "ClearGrantedPermissionsForAccountType", "%@", buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore clearGrantedPermissionsForAccountType:].cold.2();

  v13 = dispatch_semaphore_create(0);
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __56__ACAccountStore_clearGrantedPermissionsForAccountType___block_invoke;
  v23[3] = &unk_1E4893300;
  v16 = v4;
  v24 = v16;
  v25 = v13;
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __56__ACAccountStore_clearGrantedPermissionsForAccountType___block_invoke_130;
  v21[3] = &unk_1E48932D8;
  v17 = v25;
  v22 = v17;
  ac_dispatch_remote(v14, v23, v21);

  dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  _ACSignpostGetNanoseconds(v7, v9);
  _ACSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v19, OS_SIGNPOST_INTERVAL_END, v7, "ClearGrantedPermissionsForAccountType", (const char *)&unk_1A2C2C35B, buf, 2u);
  }

  _ACSignpostLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore clearGrantedPermissionsForAccountType:].cold.1(v7);

  os_activity_scope_leave(&state);
}

void __56__ACAccountStore_clearGrantedPermissionsForAccountType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__ACAccountStore_clearGrantedPermissionsForAccountType___block_invoke_2;
  v4[3] = &unk_1E48932D8;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "clearGrantedPermissionsForAccountType:withHandler:", v3, v4);

}

void __56__ACAccountStore_clearGrantedPermissionsForAccountType___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _ACLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

intptr_t __56__ACAccountStore_clearGrantedPermissionsForAccountType___block_invoke_130(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)verifyCredentialsForAccount:(id)a3 withHandler:(id)a4
{
  -[ACAccountStore verifyCredentialsForAccount:saveWhenAuthorized:withHandler:](self, "verifyCredentialsForAccount:saveWhenAuthorized:withHandler:", a3, 1, a4);
}

- (void)verifyCredentialsForAccount:(id)a3 saveWhenAuthorized:(BOOL)a4 withHandler:(id)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v5 = a4;
  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = CFSTR("ACShouldSave");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "numberWithBool:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccountStore verifyCredentialsForAccount:options:completion:](self, "verifyCredentialsForAccount:options:completion:", v10, v12, v9);

}

- (void)verifyCredentialsForAccount:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  id v35;
  NSObject *v36;
  void *v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  ACAccountStore *v43;
  id v44;
  _QWORD v45[5];
  id v46;
  os_signpost_id_t v47;
  uint64_t v48;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v51;
  __int16 v52;
  _BYTE v53[14];
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v36 = _os_activity_create(&dword_1A2BCD000, "accounts/verify-credentials", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v36, &state);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Account must be non-nil"), 0, v36);
    v35 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v35);
  }
  objc_msgSend(v8, "_setAccountStore:", self);
  -[ACAccountStore _sanitizeOptionsDictionary:](self, "_sanitizeOptionsDictionary:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v10;

  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = _ACSignpostCreate(v12);
  v15 = v14;

  _ACSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    objc_msgSend(v8, "accountType", v36, v37);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ACShouldSave"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "BOOLValue");
    *(_DWORD *)buf = 138543874;
    v51 = (os_signpost_id_t)v19;
    v52 = 1026;
    *(_DWORD *)v53 = v21;
    *(_WORD *)&v53[4] = 2112;
    *(_QWORD *)&v53[6] = v8;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "VerifyCredentials", " AccountType=%{public,signpost.telemetry:string1,name=AccountType}@  ShouldSave=%{public,signpost.telemetry:number1,name=ShouldSave}d  enableTelemetry=YES (account: %@)", buf, 0x1Cu);

  }
  _ACSignpostLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "accountType");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "identifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ACShouldSave"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "BOOLValue");
    *(_DWORD *)buf = 134218754;
    v51 = v13;
    v52 = 2114;
    *(_QWORD *)v53 = v32;
    *(_WORD *)&v53[8] = 1026;
    *(_DWORD *)&v53[10] = v34;
    v54 = 2112;
    v55 = v8;
    _os_log_debug_impl(&dword_1A2BCD000, v22, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: VerifyCredentials  AccountType=%{public,signpost.telemetry:string1,name=AccountType}@  ShouldSave=%{public,signpost.telemetry:number1,name=ShouldSave}d  enableTelemetry=YES (account: %@)", buf, 0x26u);

  }
  _ACLogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v51 = (os_signpost_id_t)v8;
    _os_log_impl(&dword_1A2BCD000, v23, OS_LOG_TYPE_DEFAULT, "\"Starting credential verification for account %@.\", buf, 0xCu);
  }

  v24 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __65__ACAccountStore_verifyCredentialsForAccount_options_completion___block_invoke;
  v45[3] = &unk_1E4892BF0;
  v45[4] = self;
  v47 = v13;
  v48 = v15;
  v25 = v37;
  v46 = v25;
  v26 = (void *)MEMORY[0x1A858A038](v45);
  -[ACAccountStore longLivedRemoteAccountStoreSession](self, "longLivedRemoteAccountStoreSession");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v24;
  v40[1] = 3221225472;
  v40[2] = __65__ACAccountStore_verifyCredentialsForAccount_options_completion___block_invoke_133;
  v40[3] = &unk_1E4892D30;
  v28 = v8;
  v41 = v28;
  v29 = v11;
  v42 = v29;
  v43 = self;
  v44 = v26;
  v38[0] = v24;
  v38[1] = 3221225472;
  v38[2] = __65__ACAccountStore_verifyCredentialsForAccount_options_completion___block_invoke_3;
  v38[3] = &unk_1E48924C8;
  v30 = v44;
  v38[4] = self;
  v39 = v30;
  ac_dispatch_remote(v27, v40, v38);

  os_activity_scope_leave(&state);
}

void __65__ACAccountStore_verifyCredentialsForAccount_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  __int128 v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _ACLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1A2BCD000, v7, OS_LOG_TYPE_DEFAULT, "\"Completed account credential verification: %@ - %@.\", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __65__ACAccountStore_verifyCredentialsForAccount_options_completion___block_invoke_132;
  block[3] = &unk_1E4893350;
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  block[1] = 3221225472;
  v16 = *(_OWORD *)(a1 + 48);
  v13 = v6;
  v14 = v5;
  v15 = v8;
  v10 = v5;
  v11 = v6;
  dispatch_async(v9, block);

}

uint64_t __65__ACAccountStore_verifyCredentialsForAccount_options_completion___block_invoke_132(_QWORD *a1)
{
  unint64_t Nanoseconds;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  const __CFString *v6;
  NSObject *v7;
  uint64_t result;
  const __CFString *v9;
  uint64_t v10;
  const __CFString *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  double v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  Nanoseconds = _ACSignpostGetNanoseconds(a1[7], a1[8]);
  _ACSignpostLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = a1[7];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (a1[4])
      v6 = CFSTR("NO");
    else
      v6 = CFSTR("YES");
    v12 = 138543362;
    v13 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v4, OS_SIGNPOST_INTERVAL_END, v5, "VerifyCredentials", "%{public}@", (uint8_t *)&v12, 0xCu);
  }

  _ACSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = (const __CFString *)a1[7];
    v10 = a1[4];
    v12 = 134218498;
    v13 = v9;
    if (v10)
      v11 = CFSTR("NO");
    else
      v11 = CFSTR("YES");
    v14 = 2048;
    v15 = (double)Nanoseconds / 1000000000.0;
    v16 = 2114;
    v17 = v11;
    _os_log_debug_impl(&dword_1A2BCD000, v7, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: VerifyCredentials %{public}@", (uint8_t *)&v12, 0x20u);
  }

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[5], a1[4]);
  return result;
}

void __65__ACAccountStore_verifyCredentialsForAccount_options_completion___block_invoke_133(_QWORD *a1, void *a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  v5 = a1[4];
  v4 = (void *)a1[5];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__ACAccountStore_verifyCredentialsForAccount_options_completion___block_invoke_2;
  v9[3] = &unk_1E4892C68;
  v6 = v4;
  v7 = a1[6];
  v8 = (void *)a1[7];
  v10 = v6;
  v11 = v7;
  v12 = v8;
  objc_msgSend(a2, "verifyCredentialsForAccount:options:completion:", v5, v6, v9);

}

void __65__ACAccountStore_verifyCredentialsForAccount_options_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ACShouldSave"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (!v6 && v8)
    objc_msgSend(v11, "_clearCachedCredentials");
  objc_msgSend(v11, "_setAccountStore:", *(_QWORD *)(a1 + 40));
  v9 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "_unsanitizeError:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v11, v10);
}

void __65__ACAccountStore_verifyCredentialsForAccount_options_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)renewCredentialsForAccount:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  int v40;
  void *v41;
  id v42;
  uint64_t v43;
  NSObject *v44;
  id v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  ACAccountStore *v51;
  id v52;
  _QWORD v53[5];
  id v54;
  os_signpost_id_t v55;
  uint64_t v56;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v59;
  __int16 v60;
  _BYTE v61[10];
  _BYTE v62[10];
  __int16 v63;
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v45 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v44 = _os_activity_create(&dword_1A2BCD000, "accounts/renew-credentials", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v44, &state);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Account must be non-nil"), 0);
    v42 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v42);
  }
  objc_msgSend(v8, "accountStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v8, "accountStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqual:", self);

    if ((v12 & 1) == 0)
    {
      _ACLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "accountStore");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v59 = (os_signpost_id_t)v8;
        v60 = 2112;
        *(_QWORD *)v61 = v41;
        *(_WORD *)&v61[8] = 2112;
        *(_QWORD *)v62 = self;
        _os_log_error_impl(&dword_1A2BCD000, v13, OS_LOG_TYPE_ERROR, "\"Account %@ associated with store %@, renewing credentials on store %@\", buf, 0x20u);

      }
    }
  }
  objc_msgSend(v8, "_setAccountStore:", self);
  -[ACAccountStore _sanitizeOptionsDictionary:](self, "_sanitizeOptionsDictionary:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  _ACSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = _ACSignpostCreate(v15);
  v43 = v17;

  _ACSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    objc_msgSend(v8, "accountType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ShouldForce"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "BOOLValue");
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ShouldAvoidUI"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "BOOLValue");
    *(_DWORD *)buf = 138544130;
    v59 = (os_signpost_id_t)v21;
    v60 = 1026;
    *(_DWORD *)v61 = v23;
    *(_WORD *)&v61[4] = 1026;
    *(_DWORD *)&v61[6] = v25;
    *(_WORD *)v62 = 2112;
    *(_QWORD *)&v62[2] = v8;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v16, "RenewCredentials", " AccountType=%{public,signpost.telemetry:string1,name=AccountType}@  ShouldForce=%{public,signpost.telemetry:number1,name=ShouldForce}d  ShouldAvoidUI=%{public,signpost.telemetry:number2,name=ShouldAvoidUI}d  enableTelemetry=YES (account: %@)", buf, 0x22u);

  }
  _ACSignpostLogSystem();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "accountType");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "identifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ShouldForce"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "BOOLValue");
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ShouldAvoidUI"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "BOOLValue");
    *(_DWORD *)buf = 134219010;
    v59 = v16;
    v60 = 2114;
    *(_QWORD *)v61 = v36;
    *(_WORD *)&v61[8] = 1026;
    *(_DWORD *)v62 = v38;
    *(_WORD *)&v62[4] = 1026;
    *(_DWORD *)&v62[6] = v40;
    v63 = 2112;
    v64 = v8;
    _os_log_debug_impl(&dword_1A2BCD000, v26, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: RenewCredentials  AccountType=%{public,signpost.telemetry:string1,name=AccountType}@  ShouldForce=%{public,signpost.telemetry:number1,name=ShouldForce}d  ShouldAvoidUI=%{public,signpost.telemetry:number2,name=ShouldAvoidUI}d  enableTelemetry=YES (account: %@)", buf, 0x2Cu);

  }
  _ACLogSystem();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v59 = (os_signpost_id_t)v8;
    _os_log_impl(&dword_1A2BCD000, v27, OS_LOG_TYPE_DEFAULT, "\"Starting credential renewal for account %@.\", buf, 0xCu);
  }

  v28 = MEMORY[0x1E0C809B0];
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __64__ACAccountStore_renewCredentialsForAccount_options_completion___block_invoke;
  v53[3] = &unk_1E48933A0;
  v53[4] = self;
  v55 = v16;
  v56 = v43;
  v29 = v45;
  v54 = v29;
  v30 = (void *)MEMORY[0x1A858A038](v53);
  -[ACAccountStore longLivedRemoteAccountStoreSession](self, "longLivedRemoteAccountStoreSession");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v28;
  v48[1] = 3221225472;
  v48[2] = __64__ACAccountStore_renewCredentialsForAccount_options_completion___block_invoke_136;
  v48[3] = &unk_1E48933F0;
  v32 = v8;
  v49 = v32;
  v33 = v14;
  v50 = v33;
  v51 = self;
  v52 = v30;
  v46[0] = v28;
  v46[1] = 3221225472;
  v46[2] = __64__ACAccountStore_renewCredentialsForAccount_options_completion___block_invoke_3;
  v46[3] = &unk_1E48924C8;
  v34 = v52;
  v46[4] = self;
  v47 = v34;
  ac_dispatch_remote(v31, v48, v46);

  os_activity_scope_leave(&state);
}

void __64__ACAccountStore_renewCredentialsForAccount_options_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  __int128 v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _ACLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v16 = a2;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_1A2BCD000, v6, OS_LOG_TYPE_DEFAULT, "\"Completed account credential renewal: %ld - %@.\", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __64__ACAccountStore_renewCredentialsForAccount_options_completion___block_invoke_134;
  block[3] = &unk_1E4893378;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  block[1] = 3221225472;
  v13 = *(_OWORD *)(a1 + 48);
  v14 = a2;
  v11 = v5;
  v12 = v7;
  v9 = v5;
  dispatch_async(v8, block);

}

uint64_t __64__ACAccountStore_renewCredentialsForAccount_options_completion___block_invoke_134(_QWORD *a1)
{
  unint64_t Nanoseconds;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  const __CFString *v6;
  NSObject *v7;
  uint64_t result;
  const __CFString *v9;
  uint64_t v10;
  const __CFString *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  double v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  Nanoseconds = _ACSignpostGetNanoseconds(a1[6], a1[7]);
  _ACSignpostLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = a1[6];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (a1[8])
      v6 = CFSTR("NO");
    else
      v6 = CFSTR("YES");
    v12 = 138543362;
    v13 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v4, OS_SIGNPOST_INTERVAL_END, v5, "RenewCredentials", "%{public}@", (uint8_t *)&v12, 0xCu);
  }

  _ACSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = (const __CFString *)a1[6];
    v10 = a1[8];
    v12 = 134218498;
    v13 = v9;
    if (v10)
      v11 = CFSTR("NO");
    else
      v11 = CFSTR("YES");
    v14 = 2048;
    v15 = (double)Nanoseconds / 1000000000.0;
    v16 = 2114;
    v17 = v11;
    _os_log_debug_impl(&dword_1A2BCD000, v7, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: RenewCredentials %{public}@", (uint8_t *)&v12, 0x20u);
  }

  result = a1[5];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[8], a1[4]);
  return result;
}

void __64__ACAccountStore_renewCredentialsForAccount_options_completion___block_invoke_136(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__ACAccountStore_renewCredentialsForAccount_options_completion___block_invoke_2;
  v7[3] = &unk_1E48933C8;
  v8 = v4;
  v6 = *(id *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = v6;
  objc_msgSend(a2, "renewCredentialsForAccount:options:completion:", v8, v5, v7);

}

void __64__ACAccountStore_renewCredentialsForAccount_options_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  int v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "_clearCachedCredentials");
  v8 = *(_QWORD *)(a1 + 48);
  v9 = objc_msgSend(v7, "intValue");

  objc_msgSend(*(id *)(a1 + 40), "_unsanitizeError:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, v9, v10);
}

void __64__ACAccountStore_renewCredentialsForAccount_options_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, 2, v2);

}

- (void)renewCredentialsForAccount:(id)a3 force:(BOOL)a4 reason:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a4;
  v14 = a3;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("ShouldForce"));

  if (v10)
    objc_msgSend(v12, "setObject:forKey:", v10, CFSTR("ReasonString"));
  -[ACAccountStore renewCredentialsForAccount:options:completion:](self, "renewCredentialsForAccount:options:completion:", v14, v12, v11);

}

- (void)renewCredentialsForAccount:(id)a3 reason:(id)a4 completion:(id)a5
{
  -[ACAccountStore renewCredentialsForAccount:force:reason:completion:](self, "renewCredentialsForAccount:force:reason:completion:", a3, 1, a4, a5);
}

- (void)renewCredentialsForAccount:(ACAccount *)account completion:(ACAccountStoreCredentialRenewalHandler)completionHandler
{
  -[ACAccountStore renewCredentialsForAccount:force:reason:completion:](self, "renewCredentialsForAccount:force:reason:completion:", account, 1, 0, completionHandler);
}

- (void)renewCredentialsForAccount:(id)a3 services:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_opt_new();
  objc_msgSend(v11, "setObject:forKey:", v9, CFSTR("Services"));

  -[ACAccountStore renewCredentialsForAccount:options:completion:](self, "renewCredentialsForAccount:options:completion:", v10, v11, v8);
}

- (void)migrateCredentialForAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  id v25;
  ACAccountStore *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  ACAccountStore *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1A2BCD000, "accounts/migrate-credentials", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Account must be non-nil"), 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  objc_msgSend(v6, "accountStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v6, "accountStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", self);

    if ((v11 & 1) == 0)
    {
      _ACLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "accountStore");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v32 = v6;
        v33 = 2112;
        v34 = v20;
        v35 = 2112;
        v36 = self;
        _os_log_error_impl(&dword_1A2BCD000, v12, OS_LOG_TYPE_ERROR, "\"Account %@ associated with store %@, renewing credentials on store %@\", buf, 0x20u);

      }
    }
  }
  objc_msgSend(v6, "_setAccountStore:", self);
  _ACLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v6;
    _os_log_impl(&dword_1A2BCD000, v13, OS_LOG_TYPE_DEFAULT, "\"Starting credential migration for account %@.\", buf, 0xCu);
  }

  v14 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __57__ACAccountStore_migrateCredentialForAccount_completion___block_invoke;
  v28[3] = &unk_1E4893440;
  v28[4] = self;
  v15 = v7;
  v29 = v15;
  v16 = (void *)MEMORY[0x1A858A038](v28);
  -[ACAccountStore longLivedRemoteAccountStoreSession](self, "longLivedRemoteAccountStoreSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v14;
  v24[1] = 3221225472;
  v24[2] = __57__ACAccountStore_migrateCredentialForAccount_completion___block_invoke_2;
  v24[3] = &unk_1E4893490;
  v18 = v6;
  v25 = v18;
  v26 = self;
  v27 = v16;
  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __57__ACAccountStore_migrateCredentialForAccount_completion___block_invoke_4;
  v22[3] = &unk_1E48924C8;
  v19 = v27;
  v22[4] = self;
  v23 = v19;
  ac_dispatch_remote(v17, v24, v22);

  os_activity_scope_leave(&state);
}

void __57__ACAccountStore_migrateCredentialForAccount_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  char v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _ACLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v15 = v7;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1A2BCD000, v6, OS_LOG_TYPE_DEFAULT, "\"Completed account credential migration: %@ - %@.\", buf, 0x16u);
  }

  v8 = *(void **)(a1 + 40);
  if (v8)
  {
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__ACAccountStore_migrateCredentialForAccount_completion___block_invoke_137;
    block[3] = &unk_1E4893418;
    v12 = v8;
    v13 = a2;
    v11 = v5;
    dispatch_async(v9, block);

  }
}

uint64_t __57__ACAccountStore_migrateCredentialForAccount_completion___block_invoke_137(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __57__ACAccountStore_migrateCredentialForAccount_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__ACAccountStore_migrateCredentialForAccount_completion___block_invoke_3;
  v6[3] = &unk_1E4893468;
  v7 = v4;
  v5 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = v5;
  objc_msgSend(a2, "migrateCredentialForAccount:completion:", v7, v6);

}

void __57__ACAccountStore_migrateCredentialForAccount_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "_clearCachedCredentials");
  v7 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "_unsanitizeError:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
}

void __57__ACAccountStore_migrateCredentialForAccount_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)runAccountMigrationPlugins:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[16];
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_1A2BCD000, "accounts/migrate-accounts", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _ACLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2BCD000, v6, OS_LOG_TYPE_DEFAULT, "\"Starting account migration plugins\", buf, 2u);
  }

  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __45__ACAccountStore_runAccountMigrationPlugins___block_invoke;
  v16[3] = &unk_1E4893440;
  v16[4] = self;
  v8 = v4;
  v17 = v8;
  v9 = (void *)MEMORY[0x1A858A038](v16);
  -[ACAccountStore longLivedRemoteAccountStoreSession](self, "longLivedRemoteAccountStoreSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __45__ACAccountStore_runAccountMigrationPlugins___block_invoke_2;
  v14[3] = &unk_1E48934E0;
  v15 = v9;
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __45__ACAccountStore_runAccountMigrationPlugins___block_invoke_4;
  v12[3] = &unk_1E48924C8;
  v11 = v15;
  v12[4] = self;
  v13 = v11;
  ac_dispatch_remote(v10, v14, v12);

  os_activity_scope_leave(&state);
}

void __45__ACAccountStore_runAccountMigrationPlugins___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  char v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _ACLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v15 = v7;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1A2BCD000, v6, OS_LOG_TYPE_DEFAULT, "\"Completed account migration: %@ - %@.\", buf, 0x16u);
  }

  v8 = *(void **)(a1 + 40);
  if (v8)
  {
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__ACAccountStore_runAccountMigrationPlugins___block_invoke_138;
    block[3] = &unk_1E4893418;
    v12 = v8;
    v13 = a2;
    v11 = v5;
    dispatch_async(v9, block);

  }
}

uint64_t __45__ACAccountStore_runAccountMigrationPlugins___block_invoke_138(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __45__ACAccountStore_runAccountMigrationPlugins___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__ACAccountStore_runAccountMigrationPlugins___block_invoke_3;
  v3[3] = &unk_1E48934B8;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "runAccountMigrationPlugins:", v3);

}

uint64_t __45__ACAccountStore_runAccountMigrationPlugins___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __45__ACAccountStore_runAccountMigrationPlugins___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __45__ACAccountStore_credentialForAccount_error___block_invoke_140(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)credentialForAccount:(id)a3 serviceID:(id)a4
{
  return -[ACAccountStore credentialForAccount:serviceID:error:](self, "credentialForAccount:serviceID:error:", a3, a4, 0);
}

- (id)credentialForAccount:(id)a3 serviceID:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  unint64_t Nanoseconds;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  const __CFString *v24;
  NSObject *v25;
  id v26;
  uint64_t v28;
  const __CFString *v29;
  const __CFString *v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  NSObject *v32;
  _QWORD v33[6];
  _QWORD v34[4];
  id v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  uint64_t *v37;
  _BYTE *v38;
  uint64_t v39;
  const __CFString **v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  os_activity_scope_state_s state;
  uint8_t v46[4];
  os_signpost_id_t v47;
  __int16 v48;
  double v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  const __CFString *v53;
  _BYTE buf[24];
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (uint64_t (*)(uint64_t, uint64_t))a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v32 = _os_activity_create(&dword_1A2BCD000, "accounts/credential-for-account", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v32, &state);
  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = _ACSignpostCreate(v10);
  v13 = v12;

  _ACSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "CredentialForAccountWithServiceID", "%@ : %@", buf, 0x16u);
  }

  _ACSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    v55 = v9;
    _os_log_debug_impl(&dword_1A2BCD000, v16, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: CredentialForAccountWithServiceID %@ : %@", buf, 0x20u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v55 = __Block_byref_object_copy__0;
  v56 = __Block_byref_object_dispose__0;
  v57 = 0;
  v39 = 0;
  v40 = (const __CFString **)&v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__0;
  v43 = __Block_byref_object_dispose__0;
  v44 = 0;
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __55__ACAccountStore_credentialForAccount_serviceID_error___block_invoke;
  v34[3] = &unk_1E4893530;
  v19 = v8;
  v35 = v19;
  v31 = v9;
  v36 = v31;
  v37 = &v39;
  v38 = buf;
  v33[0] = v18;
  v33[1] = 3221225472;
  v33[2] = __55__ACAccountStore_credentialForAccount_serviceID_error___block_invoke_141;
  v33[3] = &unk_1E4892BA0;
  v33[4] = self;
  v33[5] = &v39;
  ac_dispatch_remote_sync(v17, v34, v33);

  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "_setOwningAccount:", v19);
  if (a5)
    *a5 = (id)objc_retainAutorelease((id)v40[5]);
  Nanoseconds = _ACSignpostGetNanoseconds(v11, v13);
  _ACSignpostLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    v23 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    v24 = v40[5];
    if (*(double *)&v24 == 0.0)
      *(double *)&v24 = COERCE_DOUBLE(&stru_1E4894AE8);
    *(_DWORD *)v46 = 138412546;
    v47 = v23;
    v48 = 2112;
    v49 = *(double *)&v24;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v22, OS_SIGNPOST_INTERVAL_END, v11, "CredentialForAccountWithServiceID", "%@%@", v46, 0x16u);
  }

  _ACSignpostLogSystem();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    v28 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    v29 = v40[5];
    *(_DWORD *)v46 = 134218754;
    v47 = v11;
    v48 = 2048;
    v49 = (double)Nanoseconds / 1000000000.0;
    v50 = 2112;
    v51 = v28;
    if (v29)
      v30 = v29;
    else
      v30 = &stru_1E4894AE8;
    v52 = 2112;
    v53 = v30;
    _os_log_debug_impl(&dword_1A2BCD000, v25, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: CredentialForAccountWithServiceID %@%@", v46, 0x2Au);
  }

  v26 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(buf, 8);
  os_activity_scope_leave(&state);

  return v26;
}

uint64_t __55__ACAccountStore_credentialForAccount_serviceID_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[4];
  __int128 v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__ACAccountStore_credentialForAccount_serviceID_error___block_invoke_2;
  v5[3] = &unk_1E4893508;
  v6 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(a2, "credentialForAccount:serviceID:handler:", v2, v3, v5);
}

void __55__ACAccountStore_credentialForAccount_serviceID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  id *v9;
  void *v10;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    _ACLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

    v9 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v10 = a3;
  }
  else
  {
    v9 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v10 = a2;
  }
  objc_storeStrong(v9, v10);

}

void __55__ACAccountStore_credentialForAccount_serviceID_error___block_invoke_141(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setCredential:(id)a3 forAccount:(id)a4 serviceID:(id)a5 error:(id *)a6
{
  id v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  uint64_t (*v12)(uint64_t, uint64_t);
  NSObject *v13;
  os_signpost_id_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  os_signpost_id_t v23;
  unint64_t Nanoseconds;
  NSObject *v25;
  NSObject *v26;
  const __CFString *v27;
  NSObject *v28;
  const __CFString *v29;
  id v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  NSObject *v32;
  unint64_t v33;
  _QWORD v34[6];
  _QWORD v35[4];
  id v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  uint64_t (*v38)(uint64_t, uint64_t);
  _BYTE *v39;
  os_activity_scope_state_s state;
  uint8_t v41[4];
  const __CFString *v42;
  __int16 v43;
  double v44;
  __int16 v45;
  const __CFString *v46;
  __int16 v47;
  const __CFString *v48;
  _BYTE buf[24];
  uint64_t (*v50)(uint64_t, uint64_t);
  __int128 v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (uint64_t (*)(uint64_t, uint64_t))a4;
  v12 = (uint64_t (*)(uint64_t, uint64_t))a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v32 = _os_activity_create(&dword_1A2BCD000, "accounts/set-credential-for-account", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v32, &state);
  _ACSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = _ACSignpostCreate(v13);
  v16 = v15;

  _ACSignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  v33 = v14 - 1;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    v50 = v12;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v14, "SetCredentialForAccountWithServiceID", "%@ -> %@ : %@", buf, 0x20u);
  }

  _ACSignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2112;
    v50 = v11;
    LOWORD(v51) = 2112;
    *(_QWORD *)((char *)&v51 + 2) = v12;
    _os_log_debug_impl(&dword_1A2BCD000, v19, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: SetCredentialForAccountWithServiceID %@ -> %@ : %@", buf, 0x2Au);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v50 = __Block_byref_object_copy__0;
  *(_QWORD *)&v51 = __Block_byref_object_dispose__0;
  *((_QWORD *)&v51 + 1) = 0;
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __59__ACAccountStore_setCredential_forAccount_serviceID_error___block_invoke;
  v35[3] = &unk_1E4893558;
  v30 = v10;
  v36 = v30;
  v31 = v11;
  v37 = v31;
  v22 = v12;
  v38 = v22;
  v39 = buf;
  v34[0] = v21;
  v34[1] = 3221225472;
  v34[2] = __59__ACAccountStore_setCredential_forAccount_serviceID_error___block_invoke_142;
  v34[3] = &unk_1E4892BA0;
  v34[4] = self;
  v34[5] = buf;
  ac_dispatch_remote_sync(v20, v35, v34);

  v23 = v14;
  if (a6)
    *a6 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  Nanoseconds = _ACSignpostGetNanoseconds(v14, v16);
  _ACSignpostLogSystem();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v33 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    v27 = *(const __CFString **)(*(_QWORD *)&buf[8] + 40);
    if (*(double *)&v27 == 0.0)
      *(double *)&v27 = COERCE_DOUBLE(&stru_1E4894AE8);
    *(_DWORD *)v41 = 138412546;
    v42 = CFSTR("COMPLETE");
    v43 = 2112;
    v44 = *(double *)&v27;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v26, OS_SIGNPOST_INTERVAL_END, v23, "SetCredentialForAccountWithServiceID", "%@%@", v41, 0x16u);
  }

  _ACSignpostLogSystem();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    v29 = *(const __CFString **)(*(_QWORD *)&buf[8] + 40);
    *(_DWORD *)v41 = 134218754;
    v42 = (const __CFString *)v23;
    v43 = 2048;
    v44 = (double)Nanoseconds / 1000000000.0;
    v46 = CFSTR("COMPLETE");
    v45 = 2112;
    if (!v29)
      v29 = &stru_1E4894AE8;
    v47 = 2112;
    v48 = v29;
    _os_log_debug_impl(&dword_1A2BCD000, v28, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: SetCredentialForAccountWithServiceID %@%@", v41, 0x2Au);
  }

  _Block_object_dispose(buf, 8);
  os_activity_scope_leave(&state);

}

uint64_t __59__ACAccountStore_setCredential_forAccount_serviceID_error___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[5];

  v2 = a1[4];
  v3 = a1[5];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__ACAccountStore_setCredential_forAccount_serviceID_error___block_invoke_2;
  v6[3] = &unk_1E4893060;
  v4 = a1[6];
  v6[4] = a1[7];
  return objc_msgSend(a2, "setCredential:forAccount:serviceID:completion:", v2, v3, v4, v6);
}

void __59__ACAccountStore_setCredential_forAccount_serviceID_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    _ACLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }

}

void __59__ACAccountStore_setCredential_forAccount_serviceID_error___block_invoke_142(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)allCredentialItems
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  unint64_t Nanoseconds;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  id v17;
  uint64_t v19;
  _QWORD v20[5];
  uint8_t buf[8];
  uint8_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  os_activity_scope_state_s state;
  uint8_t v28[4];
  os_signpost_id_t v29;
  __int16 v30;
  double v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  const __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = _os_activity_create(&dword_1A2BCD000, "accounts/all-credential-items", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  _ACSignpostLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = _ACSignpostCreate(v4);
  v7 = v6;

  _ACSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "AllCredentialItems", (const char *)&unk_1A2C2C35B, buf, 2u);
  }

  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore allCredentialItems].cold.1();

  *(_QWORD *)buf = 0;
  v22 = buf;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __36__ACAccountStore_allCredentialItems__block_invoke;
  v20[3] = &unk_1E4892D80;
  v20[4] = buf;
  ac_dispatch_remote_sync(v11, v20, 0);

  Nanoseconds = _ACSignpostGetNanoseconds(v5, v7);
  _ACSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    v15 = *((_QWORD *)v22 + 5);
    *(_DWORD *)v28 = 138412546;
    v29 = v15;
    v30 = 2112;
    v31 = COERCE_DOUBLE(&stru_1E4894AE8);
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v14, OS_SIGNPOST_INTERVAL_END, v5, "AllCredentialItems", "%@%@", v28, 0x16u);
  }

  _ACSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v28 = 134218754;
    v19 = *((_QWORD *)v22 + 5);
    v29 = v5;
    v30 = 2048;
    v31 = (double)Nanoseconds / 1000000000.0;
    v32 = 2112;
    v33 = v19;
    v34 = 2112;
    v35 = &stru_1E4894AE8;
    _os_log_debug_impl(&dword_1A2BCD000, v16, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AllCredentialItems %@%@", v28, 0x2Au);
  }

  v17 = *((id *)v22 + 5);
  _Block_object_dispose(buf, 8);

  os_activity_scope_leave(&state);
  return v17;
}

uint64_t __36__ACAccountStore_allCredentialItems__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__ACAccountStore_allCredentialItems__block_invoke_2;
  v3[3] = &unk_1E4892D58;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "credentialItemsWithCompletion:", v3);
}

void __36__ACAccountStore_allCredentialItems__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    _ACLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

- (id)credentialItemForAccount:(id)a3 serviceName:(id)a4
{
  id v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  unint64_t Nanoseconds;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  NSObject *v23;
  id v24;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  ACAccountStore *v30;
  _BYTE *v31;
  os_activity_scope_state_s state;
  uint8_t v33[4];
  os_signpost_id_t v34;
  __int16 v35;
  double v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  const __CFString *v40;
  _BYTE buf[24];
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (uint64_t (*)(uint64_t, uint64_t))a4;
  v8 = _os_activity_create(&dword_1A2BCD000, "accounts/credential-item-for-account", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _ACSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _ACSignpostCreate(v9);
  v12 = v11;

  _ACSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CredentialItemsForAccountWithServiceName", "%@ : %@", buf, 0x16u);
  }

  _ACSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    v42 = v7;
    _os_log_debug_impl(&dword_1A2BCD000, v15, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: CredentialItemsForAccountWithServiceName %@ : %@", buf, 0x20u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v42 = __Block_byref_object_copy__0;
  v43 = __Block_byref_object_dispose__0;
  v44 = 0;
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __55__ACAccountStore_credentialItemForAccount_serviceName___block_invoke;
  v27[3] = &unk_1E48935A8;
  v17 = v6;
  v28 = v17;
  v18 = v7;
  v30 = self;
  v31 = buf;
  v29 = v18;
  ac_dispatch_remote_sync(v16, v27, 0);

  Nanoseconds = _ACSignpostGetNanoseconds(v10, v12);
  _ACSignpostLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    v22 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    *(_DWORD *)v33 = 138412546;
    v34 = v22;
    v35 = 2112;
    v36 = COERCE_DOUBLE(&stru_1E4894AE8);
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v21, OS_SIGNPOST_INTERVAL_END, v10, "CredentialItemsForAccountWithServiceName", "%@%@", v33, 0x16u);
  }

  _ACSignpostLogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v33 = 134218754;
    v26 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    v34 = v10;
    v35 = 2048;
    v36 = (double)Nanoseconds / 1000000000.0;
    v37 = 2112;
    v38 = v26;
    v39 = 2112;
    v40 = &stru_1E4894AE8;
    _os_log_debug_impl(&dword_1A2BCD000, v23, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: CredentialItemsForAccountWithServiceName %@%@", v33, 0x2Au);
  }

  v24 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  os_activity_scope_leave(&state);
  return v24;
}

uint64_t __55__ACAccountStore_credentialItemForAccount_serviceName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[4];
  __int128 v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__ACAccountStore_credentialItemForAccount_serviceName___block_invoke_2;
  v5[3] = &unk_1E4893580;
  v6 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(a2, "credentialItemForAccount:serviceName:completion:", v2, v3, v5);
}

void __55__ACAccountStore_credentialItemForAccount_serviceName___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    _ACLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setAccountStore:", *(_QWORD *)(a1 + 32));
  }

}

- (void)insertCredentialItem:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[5];
  id v34;
  os_signpost_id_t v35;
  uint64_t v36;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  ACAccountStore *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1A2BCD000, "accounts/insert-credential-item", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _ACSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _ACSignpostCreate(v9);
  v12 = v11;

  _ACSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "InsertCredentialItem", "%@", buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore insertCredentialItem:withCompletionHandler:].cold.1();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Credential item must be non-nil"), 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v27);
  }
  objc_msgSend(v6, "accountStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v6, "accountStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqual:", self);

    if ((v18 & 1) == 0)
    {
      _ACLogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "accountStore");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v39 = v6;
        v40 = 2112;
        v41 = v26;
        v42 = 2112;
        v43 = self;
        _os_log_error_impl(&dword_1A2BCD000, v19, OS_LOG_TYPE_ERROR, "\"Credential item %@ associated with store %@, inserting credential item on store %@\", buf, 0x20u);

      }
    }
  }
  v20 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __61__ACAccountStore_insertCredentialItem_withCompletionHandler___block_invoke;
  v33[3] = &unk_1E48930D8;
  v33[4] = self;
  v35 = v10;
  v36 = v12;
  v21 = v7;
  v34 = v21;
  v22 = (void *)MEMORY[0x1A858A038](v33);
  objc_msgSend(v6, "setAccountStore:", self);
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v20;
  v30[1] = 3221225472;
  v30[2] = __61__ACAccountStore_insertCredentialItem_withCompletionHandler___block_invoke_148;
  v30[3] = &unk_1E48924A0;
  v24 = v6;
  v31 = v24;
  v32 = v22;
  v28[0] = v20;
  v28[1] = 3221225472;
  v28[2] = __61__ACAccountStore_insertCredentialItem_withCompletionHandler___block_invoke_3;
  v28[3] = &unk_1E48924C8;
  v25 = v32;
  v28[4] = self;
  v29 = v25;
  ac_dispatch_remote(v23, v30, v28);

  os_activity_scope_leave(&state);
}

void __61__ACAccountStore_insertCredentialItem_withCompletionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  __int128 v12;
  char v13;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __61__ACAccountStore_insertCredentialItem_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E48930B0;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  block[1] = 3221225472;
  v12 = *(_OWORD *)(a1 + 48);
  v13 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __61__ACAccountStore_insertCredentialItem_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  unint64_t Nanoseconds;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  const __CFString *v6;
  const __CFString *v7;
  NSObject *v8;
  uint64_t result;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  Nanoseconds = _ACSignpostGetNanoseconds(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  _ACSignpostLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (*(_BYTE *)(a1 + 64))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    v7 = *(const __CFString **)(a1 + 32);
    if (!v7)
      v7 = &stru_1E4894AE8;
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v4, OS_SIGNPOST_INTERVAL_END, v5, "InsertCredentialItem", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  _ACSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(const __CFString **)(a1 + 48);
    v11 = CFSTR("YES");
    v12 = *(const __CFString **)(a1 + 32);
    if (!*(_BYTE *)(a1 + 64))
      v11 = CFSTR("NO");
    v14 = 134218754;
    v15 = v10;
    v13 = &stru_1E4894AE8;
    v16 = 2048;
    v17 = (double)Nanoseconds / 1000000000.0;
    v18 = 2112;
    v19 = v11;
    if (v12)
      v13 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_debug_impl(&dword_1A2BCD000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: InsertCredentialItem %@%@", (uint8_t *)&v14, 0x2Au);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32));
  return result;
}

void __61__ACAccountStore_insertCredentialItem_withCompletionHandler___block_invoke_148(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__ACAccountStore_insertCredentialItem_withCompletionHandler___block_invoke_2_149;
  v4[3] = &unk_1E48935D0;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "insertCredentialItem:completion:", v3, v4);

}

uint64_t __61__ACAccountStore_insertCredentialItem_withCompletionHandler___block_invoke_2_149(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__ACAccountStore_insertCredentialItem_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)saveCredentialItem:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  os_signpost_id_t v31;
  uint64_t v32;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1A2BCD000, "accounts/save-credential-item", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Credential item must be non-nil"), 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }
  _ACSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _ACSignpostCreate(v9);
  v12 = v11;

  _ACSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SaveCredentialItem", "%@", buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore saveCredentialItem:withCompletionHandler:].cold.2();

  v16 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __59__ACAccountStore_saveCredentialItem_withCompletionHandler___block_invoke;
  v28[3] = &unk_1E48935F8;
  v28[4] = self;
  v31 = v10;
  v32 = v12;
  v17 = v7;
  v30 = v17;
  v18 = v6;
  v29 = v18;
  v19 = (void *)MEMORY[0x1A858A038](v28);
  if ((objc_msgSend(v18, "isDirty") & 1) != 0)
  {
    _ACLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[ACAccountStore saveCredentialItem:withCompletionHandler:].cold.1();

    -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v16;
    v25[1] = 3221225472;
    v25[2] = __59__ACAccountStore_saveCredentialItem_withCompletionHandler___block_invoke_150;
    v25[3] = &unk_1E48924A0;
    v26 = v18;
    v27 = v19;
    v23[0] = v16;
    v23[1] = 3221225472;
    v23[2] = __59__ACAccountStore_saveCredentialItem_withCompletionHandler___block_invoke_2;
    v23[3] = &unk_1E48924C8;
    v23[4] = self;
    v24 = v17;
    ac_dispatch_remote(v21, v25, v23);

  }
  else if (v17)
  {
    (*((void (**)(id, uint64_t, _QWORD))v17 + 2))(v17, 1, 0);
  }

  os_activity_scope_leave(&state);
}

void __59__ACAccountStore_saveCredentialItem_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  uint64_t v12;
  unint64_t Nanoseconds;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  const __CFString *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  const __CFString *v22;
  int v23;
  const __CFString *v24;
  __int16 v25;
  double v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    Nanoseconds = _ACSignpostGetNanoseconds(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    _ACSignpostLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = *(_QWORD *)(a1 + 56);
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      v17 = &stru_1E4894AE8;
      if (v7)
        v17 = v7;
      v23 = 138412546;
      v24 = CFSTR("NO");
      v25 = 2112;
      v26 = *(double *)&v17;
      _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v15, OS_SIGNPOST_INTERVAL_END, v16, "SaveCredentialItem", "%@%@", (uint8_t *)&v23, 0x16u);
    }

    _ACSignpostLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v21 = *(const __CFString **)(a1 + 56);
      v23 = 134218754;
      v24 = v21;
      v22 = &stru_1E4894AE8;
      v25 = 2048;
      v26 = (double)Nanoseconds / 1000000000.0;
      v27 = 2112;
      v28 = CFSTR("NO");
      if (v7)
        v22 = v7;
      v29 = 2112;
      v30 = v22;
      _os_log_debug_impl(&dword_1A2BCD000, v18, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: SaveCredentialItem %@%@", (uint8_t *)&v23, 0x2Au);
    }

    v19 = *(_QWORD *)(a1 + 48);
    if (v19)
    {
      objc_msgSend(*(id *)(a1 + 32), "_unsanitizeError:", v7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v19 + 16))(v19, 0, v20);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setAccountStore:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "setObjectID:", v5);
    objc_msgSend(*(id *)(a1 + 40), "clearDirtyProperties");
    _ACSignpostGetNanoseconds(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    _ACSignpostLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = *(_QWORD *)(a1 + 56);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      v23 = 138543362;
      v24 = CFSTR("YES");
      _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v9, OS_SIGNPOST_INTERVAL_END, v10, "SaveCredentialItem", "%{public}@", (uint8_t *)&v23, 0xCu);
    }

    _ACSignpostLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __59__ACAccountStore_saveCredentialItem_withCompletionHandler___block_invoke_cold_1();

    v12 = *(_QWORD *)(a1 + 48);
    if (v12)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v12 + 16))(v12, 1, 0);
  }

}

uint64_t __59__ACAccountStore_saveCredentialItem_withCompletionHandler___block_invoke_150(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "saveCredentialItem:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __59__ACAccountStore_saveCredentialItem_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

- (void)removeCredentialItem:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  os_signpost_id_t v31;
  uint64_t v32;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1A2BCD000, "accounts/remove-credential-item", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Credential item must be non-nil"), 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  _ACSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _ACSignpostCreate(v9);
  v12 = v11;

  _ACSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "RemoveCredentialItem", "%@", buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore removeCredentialItem:withCompletionHandler:].cold.1();

  v16 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __61__ACAccountStore_removeCredentialItem_withCompletionHandler___block_invoke;
  v29[3] = &unk_1E48930D8;
  v29[4] = self;
  v17 = v7;
  v30 = v17;
  v31 = v10;
  v32 = v12;
  v18 = (void *)MEMORY[0x1A858A038](v29);
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v16;
  v26[1] = 3221225472;
  v26[2] = __61__ACAccountStore_removeCredentialItem_withCompletionHandler___block_invoke_151;
  v26[3] = &unk_1E48924A0;
  v20 = v6;
  v27 = v20;
  v21 = v18;
  v28 = v21;
  v24[0] = v16;
  v24[1] = 3221225472;
  v24[2] = __61__ACAccountStore_removeCredentialItem_withCompletionHandler___block_invoke_2;
  v24[3] = &unk_1E48924C8;
  v22 = v17;
  v24[4] = self;
  v25 = v22;
  ac_dispatch_remote(v19, v26, v24);

  os_activity_scope_leave(&state);
}

void __61__ACAccountStore_removeCredentialItem_withCompletionHandler___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  const __CFString **v5;
  double v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  unint64_t v10;
  NSObject *v11;
  void (*v12)(void);
  NSObject *v13;
  const __CFString *v14;
  int v15;
  const __CFString *v16;
  __int16 v17;
  double v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (a1[5])
  {
    v5 = (const __CFString **)(a1 + 6);
    v6 = (double)_ACSignpostGetNanoseconds(a1[6], a1[7]) / 1000000000.0;
    _ACSignpostLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = a1[6];
    v10 = v9 - 1;
    if (v4)
    {
      if (((void **)((char *)&(*v5)->isa + 2) == 0 || v10 < 0xFFFFFFFFFFFFFFFDLL) && os_signpost_enabled(v7))
      {
        v15 = 138412546;
        v16 = CFSTR("NO");
        v17 = 2112;
        v18 = *(double *)&v4;
        _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RemoveCredentialItem", "%@%@", (uint8_t *)&v15, 0x16u);
      }

      _ACSignpostLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v14 = *v5;
        v15 = 134218754;
        v16 = v14;
        v17 = 2048;
        v18 = v6;
        v19 = 2112;
        v20 = CFSTR("NO");
        v21 = 2112;
        v22 = v4;
        _os_log_debug_impl(&dword_1A2BCD000, v11, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: RemoveCredentialItem %@%@", (uint8_t *)&v15, 0x2Au);
      }

      v12 = *(void (**)(void))(a1[5] + 16);
    }
    else
    {
      if (((void **)((char *)&(*v5)->isa + 2) == 0 || v10 < 0xFFFFFFFFFFFFFFFDLL) && os_signpost_enabled(v7))
      {
        v15 = 138543362;
        v16 = CFSTR("YES");
        _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RemoveCredentialItem", "%{public}@", (uint8_t *)&v15, 0xCu);
      }

      _ACSignpostLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __61__ACAccountStore_removeCredentialItem_withCompletionHandler___block_invoke_cold_1();

      v12 = *(void (**)(void))(a1[5] + 16);
    }
    v12();
  }

}

uint64_t __61__ACAccountStore_removeCredentialItem_withCompletionHandler___block_invoke_151(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeCredentialItem:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __61__ACAccountStore_removeCredentialItem_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

- (id)parentAccountForAccount:(id)a3
{
  return -[ACAccountStore parentAccountForAccount:error:](self, "parentAccountForAccount:error:", a3, 0);
}

- (id)parentAccountForAccount:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  unint64_t Nanoseconds;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  const __CFString *v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  uint64_t v27;
  const __CFString *v28;
  const __CFString *v29;
  _QWORD v30[6];
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  const __CFString **v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v49;
  __int16 v50;
  double v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  const __CFString *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_1A2BCD000, "accounts/parent-account-for-account", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__0;
  v45 = __Block_byref_object_dispose__0;
  v46 = 0;
  v35 = 0;
  v36 = (const __CFString **)&v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  v40 = 0;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    _ACSignpostLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = _ACSignpostCreate(v9);
    v12 = v11;

    _ACSignpostLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_DWORD *)buf = 138412290;
      v49 = (os_signpost_id_t)v6;
      _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ParentAccountForAccount", "%@", buf, 0xCu);
    }

    _ACSignpostLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[ACAccountStore parentAccountForAccount:error:].cold.2();

    -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __48__ACAccountStore_parentAccountForAccount_error___block_invoke;
    v31[3] = &unk_1E4892B78;
    v32 = v8;
    v33 = &v41;
    v34 = &v35;
    v30[0] = v17;
    v30[1] = 3221225472;
    v30[2] = __48__ACAccountStore_parentAccountForAccount_error___block_invoke_152;
    v30[3] = &unk_1E4892BA0;
    v30[4] = self;
    v30[5] = &v35;
    ac_dispatch_remote_sync(v16, v31, v30);

    objc_msgSend((id)v42[5], "_setAccountStore:", self);
    if (a4)
      *a4 = (id)objc_retainAutorelease((id)v36[5]);
    Nanoseconds = _ACSignpostGetNanoseconds(v10, v12);
    _ACSignpostLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      v21 = v42[5];
      v22 = v36[5];
      if (*(double *)&v22 == 0.0)
        *(double *)&v22 = COERCE_DOUBLE(&stru_1E4894AE8);
      *(_DWORD *)buf = 138412546;
      v49 = v21;
      v50 = 2112;
      v51 = *(double *)&v22;
      _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v20, OS_SIGNPOST_INTERVAL_END, v10, "ParentAccountForAccount", "%@%@", buf, 0x16u);
    }

    _ACSignpostLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v27 = v42[5];
      v28 = v36[5];
      *(_DWORD *)buf = 134218754;
      v49 = v10;
      v50 = 2048;
      v51 = (double)Nanoseconds / 1000000000.0;
      v52 = 2112;
      v53 = v27;
      if (v28)
        v29 = v28;
      else
        v29 = &stru_1E4894AE8;
      v54 = 2112;
      v55 = v29;
      _os_log_debug_impl(&dword_1A2BCD000, v23, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: ParentAccountForAccount %@%@", buf, 0x2Au);
    }

    v24 = (id)v42[5];
  }
  else
  {
    _ACLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[ACAccountStore parentAccountForAccount:error:].cold.1();

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.accounts"), 6, 0);
      v24 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
    }
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  os_activity_scope_leave(&state);
  return v24;
}

uint64_t __48__ACAccountStore_parentAccountForAccount_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__ACAccountStore_parentAccountForAccount_error___block_invoke_2;
  v4[3] = &unk_1E4892B50;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "parentAccountForAccountWithIdentifier:handler:", v2, v4);
}

void __48__ACAccountStore_parentAccountForAccount_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _ACLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v6;

}

void __48__ACAccountStore_parentAccountForAccount_error___block_invoke_152(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)childAccountsForAccount:(id)a3
{
  return -[ACAccountStore childAccountsForAccount:error:](self, "childAccountsForAccount:error:", a3, 0);
}

- (id)childAccountsForAccount:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id *v17;
  id v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  unint64_t Nanoseconds;
  NSObject *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  const __CFString *v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  uint64_t v33;
  const __CFString *v34;
  const __CFString *v35;
  unint64_t v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[6];
  _QWORD v43[4];
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  const __CFString **v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v61;
  __int16 v62;
  double v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  const __CFString *v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_1A2BCD000, "accounts/child-accounts-for-account", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__0;
  v57 = __Block_byref_object_dispose__0;
  v58 = 0;
  v47 = 0;
  v48 = (const __CFString **)&v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__0;
  v51 = __Block_byref_object_dispose__0;
  v52 = 0;
  objc_msgSend(v6, "identifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    _ACSignpostLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = _ACSignpostCreate(v8);
    v11 = v10;

    _ACSignpostLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v36 = v9 - 1;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_DWORD *)buf = 138412290;
      v61 = (os_signpost_id_t)v6;
      _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ChildAccountForAccounts", "%@", buf, 0xCu);
    }

    _ACSignpostLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[ACAccountStore childAccountsForAccount:error:].cold.2();

    -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __48__ACAccountStore_childAccountsForAccount_error___block_invoke;
    v43[3] = &unk_1E4892B78;
    v44 = v37;
    v45 = &v53;
    v46 = &v47;
    v42[0] = v16;
    v42[1] = 3221225472;
    v42[2] = __48__ACAccountStore_childAccountsForAccount_error___block_invoke_153;
    v42[3] = &unk_1E4892BA0;
    v42[4] = self;
    v42[5] = &v47;
    ac_dispatch_remote_sync(v15, v43, v42);

    v17 = a4;
    v18 = v6;
    v19 = v7;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v20 = (id)v54[5];
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v68, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v39 != v22)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "_setAccountStore:", self, v36);
        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v68, 16);
      }
      while (v21);
    }

    v7 = v19;
    v6 = v18;
    if (v17)
      *v17 = (id)objc_retainAutorelease((id)v48[5]);
    Nanoseconds = _ACSignpostGetNanoseconds(v9, v11);
    _ACSignpostLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v36 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      v27 = v54[5];
      v28 = v48[5];
      if (*(double *)&v28 == 0.0)
        *(double *)&v28 = COERCE_DOUBLE(&stru_1E4894AE8);
      *(_DWORD *)buf = 138412546;
      v61 = v27;
      v62 = 2112;
      v63 = *(double *)&v28;
      _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v26, OS_SIGNPOST_INTERVAL_END, v9, "ChildAccountForAccounts", "%@%@", buf, 0x16u);
    }

    _ACSignpostLogSystem();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      v33 = v54[5];
      v34 = v48[5];
      *(_DWORD *)buf = 134218754;
      v61 = v9;
      v62 = 2048;
      v63 = (double)Nanoseconds / 1000000000.0;
      v64 = 2112;
      v65 = v33;
      if (v34)
        v35 = v34;
      else
        v35 = &stru_1E4894AE8;
      v66 = 2112;
      v67 = v35;
      _os_log_debug_impl(&dword_1A2BCD000, v29, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: ChildAccountForAccounts %@%@", buf, 0x2Au);
    }

    v30 = (id)v54[5];
  }
  else
  {
    _ACLogSystem();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[ACAccountStore parentAccountForAccount:error:].cold.1();

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.accounts"), 6, 0);
      v30 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = 0;
    }
  }

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

  os_activity_scope_leave(&state);
  return v30;
}

uint64_t __48__ACAccountStore_childAccountsForAccount_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__ACAccountStore_childAccountsForAccount_error___block_invoke_2;
  v4[3] = &unk_1E4893620;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "childAccountsForAccountWithIdentifier:handler:", v2, v4);
}

void __48__ACAccountStore_childAccountsForAccount_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _ACLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v6;

}

void __48__ACAccountStore_childAccountsForAccount_error___block_invoke_153(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)enabledDataclassesForAccount:(id)a3
{
  return -[ACAccountStore enabledDataclassesForAccount:error:](self, "enabledDataclassesForAccount:error:", a3, 0);
}

void __53__ACAccountStore_enabledDataclassesForAccount_error___block_invoke_157(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)provisionedDataclassesForAccount:(id)a3
{
  return -[ACAccountStore provisionedDataclassesForAccount:error:](self, "provisionedDataclassesForAccount:error:", a3, 0);
}

- (id)provisionedDataclassesForAccount:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  unint64_t Nanoseconds;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  const __CFString *v21;
  NSObject *v22;
  id v23;
  uint64_t v25;
  const __CFString *v26;
  const __CFString *v27;
  NSObject *v28;
  _QWORD v29[6];
  _QWORD v30[4];
  id v31;
  __int128 *p_buf;
  uint64_t *v33;
  uint64_t v34;
  const __CFString **v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  os_activity_scope_state_s state;
  uint8_t v41[4];
  os_signpost_id_t v42;
  __int16 v43;
  double v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  const __CFString *v48;
  __int128 buf;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v28 = _os_activity_create(&dword_1A2BCD000, "accounts/provisioned-dataclasses-for-account", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v28, &state);
  _ACSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = _ACSignpostCreate(v7);
  v10 = v9;

  _ACSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "ProvisionedDataclassesForAccount", "%@", (uint8_t *)&buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore provisionedDataclassesForAccount:error:].cold.1();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__0;
  v52 = __Block_byref_object_dispose__0;
  v53 = 0;
  v34 = 0;
  v35 = (const __CFString **)&v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__0;
  v38 = __Block_byref_object_dispose__0;
  v39 = 0;
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __57__ACAccountStore_provisionedDataclassesForAccount_error___block_invoke;
  v30[3] = &unk_1E4892B78;
  v16 = v6;
  v31 = v16;
  p_buf = &buf;
  v33 = &v34;
  v29[0] = v15;
  v29[1] = 3221225472;
  v29[2] = __57__ACAccountStore_provisionedDataclassesForAccount_error___block_invoke_158;
  v29[3] = &unk_1E4892BA0;
  v29[4] = self;
  v29[5] = &v34;
  ac_dispatch_remote_sync(v14, v30, v29);

  if (a4)
    *a4 = (id)objc_retainAutorelease((id)v35[5]);
  Nanoseconds = _ACSignpostGetNanoseconds(v8, v10);
  _ACSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    v20 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    v21 = v35[5];
    if (*(double *)&v21 == 0.0)
      *(double *)&v21 = COERCE_DOUBLE(&stru_1E4894AE8);
    *(_DWORD *)v41 = 138412546;
    v42 = v20;
    v43 = 2112;
    v44 = *(double *)&v21;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v19, OS_SIGNPOST_INTERVAL_END, v8, "ProvisionedDataclassesForAccount", "%@%@", v41, 0x16u);
  }

  _ACSignpostLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v25 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    v26 = v35[5];
    *(_DWORD *)v41 = 134218754;
    v42 = v8;
    v43 = 2048;
    v44 = (double)Nanoseconds / 1000000000.0;
    v45 = 2112;
    v46 = v25;
    if (v26)
      v27 = v26;
    else
      v27 = &stru_1E4894AE8;
    v47 = 2112;
    v48 = v27;
    _os_log_debug_impl(&dword_1A2BCD000, v22, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: ProvisionedDataclassesForAccount %@%@", v41, 0x2Au);
  }

  v23 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

  return v23;
}

void __57__ACAccountStore_provisionedDataclassesForAccount_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  __int128 v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__ACAccountStore_provisionedDataclassesForAccount_error___block_invoke_2;
  v6[3] = &unk_1E4893670;
  v7 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v4, "provisionedDataclassesForAccountWithIdentifier:handler:", v5, v6);

}

void __57__ACAccountStore_provisionedDataclassesForAccount_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _ACLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v6;

}

void __57__ACAccountStore_provisionedDataclassesForAccount_error___block_invoke_158(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)supportedDataclassesForAccountType:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  unint64_t Nanoseconds;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  id v20;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  __int128 *p_buf;
  os_activity_scope_state_s state;
  uint8_t v27[4];
  os_signpost_id_t v28;
  __int16 v29;
  double v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  const __CFString *v34;
  __int128 buf;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1A2BCD000, "accounts/supported-dataclasses-for-account", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _ACSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _ACSignpostCreate(v6);
  v9 = v8;

  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SupportedDataclassesForAccountType", "%@", (uint8_t *)&buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore supportedDataclassesForAccountType:].cold.1();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__0;
  v38 = __Block_byref_object_dispose__0;
  v39 = 0;
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __53__ACAccountStore_supportedDataclassesForAccountType___block_invoke;
  v23[3] = &unk_1E4893088;
  v14 = v4;
  v24 = v14;
  p_buf = &buf;
  ac_dispatch_remote_sync(v13, v23, 0);

  Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  _ACSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    v18 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v27 = 138412546;
    v28 = v18;
    v29 = 2112;
    v30 = COERCE_DOUBLE(&stru_1E4894AE8);
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v17, OS_SIGNPOST_INTERVAL_END, v7, "SupportedDataclassesForAccountType", "%@%@", v27, 0x16u);
  }

  _ACSignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v27 = 134218754;
    v22 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    v28 = v7;
    v29 = 2048;
    v30 = (double)Nanoseconds / 1000000000.0;
    v31 = 2112;
    v32 = v22;
    v33 = 2112;
    v34 = &stru_1E4894AE8;
    _os_log_debug_impl(&dword_1A2BCD000, v19, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: SupportedDataclassesForAccountType %@%@", v27, 0x2Au);
  }

  v20 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);
  return v20;
}

uint64_t __53__ACAccountStore_supportedDataclassesForAccountType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__ACAccountStore_supportedDataclassesForAccountType___block_invoke_2;
  v4[3] = &unk_1E4893238;
  v2 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "supportedDataclassesForAccountType:handler:", v2, v4);
}

void __53__ACAccountStore_supportedDataclassesForAccountType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    _ACLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

- (id)syncableDataclassesForAccountType:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  unint64_t Nanoseconds;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  id v20;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  __int128 *p_buf;
  os_activity_scope_state_s state;
  uint8_t v27[4];
  os_signpost_id_t v28;
  __int16 v29;
  double v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  const __CFString *v34;
  __int128 buf;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1A2BCD000, "accounts/syncable-dataclasses-for-account", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _ACSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _ACSignpostCreate(v6);
  v9 = v8;

  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SyncableDataclassesForAccountType", "%@", (uint8_t *)&buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore syncableDataclassesForAccountType:].cold.1();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__0;
  v38 = __Block_byref_object_dispose__0;
  v39 = 0;
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __52__ACAccountStore_syncableDataclassesForAccountType___block_invoke;
  v23[3] = &unk_1E4893088;
  v14 = v4;
  v24 = v14;
  p_buf = &buf;
  ac_dispatch_remote_sync(v13, v23, 0);

  Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  _ACSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    v18 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v27 = 138412546;
    v28 = v18;
    v29 = 2112;
    v30 = COERCE_DOUBLE(&stru_1E4894AE8);
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v17, OS_SIGNPOST_INTERVAL_END, v7, "SyncableDataclassesForAccountType", "%@%@", v27, 0x16u);
  }

  _ACSignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v27 = 134218754;
    v22 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    v28 = v7;
    v29 = 2048;
    v30 = (double)Nanoseconds / 1000000000.0;
    v31 = 2112;
    v32 = v22;
    v33 = 2112;
    v34 = &stru_1E4894AE8;
    _os_log_debug_impl(&dword_1A2BCD000, v19, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: SyncableDataclassesForAccountType %@%@", v27, 0x2Au);
  }

  v20 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);
  return v20;
}

uint64_t __52__ACAccountStore_syncableDataclassesForAccountType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__ACAccountStore_syncableDataclassesForAccountType___block_invoke_2;
  v4[3] = &unk_1E4893238;
  v2 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "syncableDataclassesForAccountType:handler:", v2, v4);
}

void __52__ACAccountStore_syncableDataclassesForAccountType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    _ACLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

- (id)displayTypeForAccountWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  unint64_t Nanoseconds;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  id v20;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  ACAccountStore *v25;
  __int128 *p_buf;
  os_activity_scope_state_s state;
  uint8_t v28[4];
  os_signpost_id_t v29;
  __int16 v30;
  double v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  const __CFString *v35;
  __int128 buf;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1A2BCD000, "accounts/display-type-for-account", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _ACSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _ACSignpostCreate(v6);
  v9 = v8;

  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "DisplayTypeForAccount", "%@", (uint8_t *)&buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore displayTypeForAccountWithIdentifier:].cold.1();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  v40 = 0;
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __54__ACAccountStore_displayTypeForAccountWithIdentifier___block_invoke;
  v23[3] = &unk_1E48936C0;
  v14 = v4;
  v25 = self;
  p_buf = &buf;
  v24 = v14;
  ac_dispatch_remote_sync(v13, v23, 0);

  Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  _ACSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    v18 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v28 = 138412546;
    v29 = v18;
    v30 = 2112;
    v31 = COERCE_DOUBLE(&stru_1E4894AE8);
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v17, OS_SIGNPOST_INTERVAL_END, v7, "DisplayTypeForAccount", "%@%@", v28, 0x16u);
  }

  _ACSignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v28 = 134218754;
    v22 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    v29 = v7;
    v30 = 2048;
    v31 = (double)Nanoseconds / 1000000000.0;
    v32 = 2112;
    v33 = v22;
    v34 = 2112;
    v35 = &stru_1E4894AE8;
    _os_log_debug_impl(&dword_1A2BCD000, v19, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: DisplayTypeForAccount %@%@", v28, 0x2Au);
  }

  v20 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);
  return v20;
}

uint64_t __54__ACAccountStore_displayTypeForAccountWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__ACAccountStore_displayTypeForAccountWithIdentifier___block_invoke_2;
  v4[3] = &unk_1E4893698;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "displayAccountTypeForAccountWithIdentifier:handler:", v2, v4);
}

void __54__ACAccountStore_displayTypeForAccountWithIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    _ACLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setAccountStore:", *(_QWORD *)(a1 + 32));
  }

}

- (void)preloadDataclassOwnersWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[5];
  id v17;
  os_signpost_id_t v18;
  uint64_t v19;
  _QWORD v20[5];
  id v21;
  os_signpost_id_t v22;
  uint64_t v23;
  uint8_t buf[16];
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_1A2BCD000, "accounts/preload-dataclass-owners", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _ACSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _ACSignpostCreate(v6);
  v9 = v8;

  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PreloadDataclassOwners", (const char *)&unk_1A2C2C35B, buf, 2u);
  }

  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore preloadDataclassOwnersWithCompletion:].cold.1();

  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __55__ACAccountStore_preloadDataclassOwnersWithCompletion___block_invoke;
  v20[3] = &unk_1E4893738;
  v20[4] = self;
  v22 = v7;
  v23 = v9;
  v21 = v4;
  v16[0] = v14;
  v16[1] = 3221225472;
  v16[2] = __55__ACAccountStore_preloadDataclassOwnersWithCompletion___block_invoke_159;
  v16[3] = &unk_1E4893710;
  v16[4] = self;
  v18 = v7;
  v19 = v9;
  v15 = v21;
  v17 = v15;
  ac_dispatch_remote(v13, v20, v16);

  os_activity_scope_leave(&state);
}

void __55__ACAccountStore_preloadDataclassOwnersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;
  __int128 v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[2] = __55__ACAccountStore_preloadDataclassOwnersWithCompletion___block_invoke_2;
  v4[3] = &unk_1E4893710;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[1] = 3221225472;
  v6 = *(_OWORD *)(a1 + 48);
  v5 = v3;
  objc_msgSend(a2, "preloadDataclassOwnersWithCompletion:", v4);

}

void __55__ACAccountStore_preloadDataclassOwnersWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  __int128 v10;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = __55__ACAccountStore_preloadDataclassOwnersWithCompletion___block_invoke_3;
  v7[3] = &unk_1E48936E8;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  v7[1] = 3221225472;
  v10 = *(_OWORD *)(a1 + 48);
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __55__ACAccountStore_preloadDataclassOwnersWithCompletion___block_invoke_3(_QWORD *a1)
{
  unint64_t Nanoseconds;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  const __CFString *v6;
  NSObject *v7;
  uint64_t result;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  double v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  Nanoseconds = _ACSignpostGetNanoseconds(a1[6], a1[7]);
  _ACSignpostLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = a1[6];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v6 = (const __CFString *)a1[4];
    if (!v6)
      v6 = &stru_1E4894AE8;
    v12 = 138412546;
    v13 = 0;
    v14 = 2112;
    v15 = *(double *)&v6;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v4, OS_SIGNPOST_INTERVAL_END, v5, "PreloadDataclassOwners", "%@%@", (uint8_t *)&v12, 0x16u);
  }

  _ACSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = a1[6];
    v10 = (const __CFString *)a1[4];
    v12 = 134218754;
    v13 = v9;
    v11 = &stru_1E4894AE8;
    v14 = 2048;
    v15 = (double)Nanoseconds / 1000000000.0;
    v16 = 2112;
    v17 = 0;
    if (v10)
      v11 = v10;
    v18 = 2112;
    v19 = v11;
    _os_log_debug_impl(&dword_1A2BCD000, v7, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: PreloadDataclassOwners %@%@", (uint8_t *)&v12, 0x2Au);
  }

  result = a1[5];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, a1[4]);
  return result;
}

void __55__ACAccountStore_preloadDataclassOwnersWithCompletion___block_invoke_159(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;
  __int128 v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[2] = __55__ACAccountStore_preloadDataclassOwnersWithCompletion___block_invoke_2_160;
  v4[3] = &unk_1E48936E8;
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 80);
  v4[1] = 3221225472;
  v4[4] = v1;
  v6 = *(_OWORD *)(a1 + 48);
  v5 = v2;
  dispatch_sync(v3, v4);

}

void __55__ACAccountStore_preloadDataclassOwnersWithCompletion___block_invoke_2_160(uint64_t a1)
{
  __CFString *v2;
  unint64_t Nanoseconds;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  const __CFString *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  double v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  Nanoseconds = _ACSignpostGetNanoseconds(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  _ACSignpostLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 48);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = &stru_1E4894AE8;
    if (v2)
      v7 = v2;
    v12 = 138412546;
    v13 = 0;
    v14 = 2112;
    v15 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PreloadDataclassOwners", "%@%@", (uint8_t *)&v12, 0x16u);
  }

  _ACSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(_QWORD *)(a1 + 48);
    v12 = 134218754;
    v13 = v10;
    v11 = &stru_1E4894AE8;
    v14 = 2048;
    v15 = (double)Nanoseconds / 1000000000.0;
    v16 = 2112;
    v17 = 0;
    if (v2)
      v11 = v2;
    v18 = 2112;
    v19 = v11;
    _os_log_debug_impl(&dword_1A2BCD000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: PreloadDataclassOwners %@%@", (uint8_t *)&v12, 0x2Au);
  }

  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, __CFString *))(v9 + 16))(v9, v2);

}

- (id)dataclassActionsForAccountSave:(id)a3
{
  return -[ACAccountStore dataclassActionsForAccountSave:error:](self, "dataclassActionsForAccountSave:error:", a3, 0);
}

- (id)dataclassActionsForAccountSave:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  unint64_t Nanoseconds;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  const __CFString *v21;
  NSObject *v22;
  id v23;
  uint64_t v25;
  const __CFString *v26;
  const __CFString *v27;
  NSObject *v28;
  _QWORD v29[6];
  _QWORD v30[4];
  id v31;
  __int128 *p_buf;
  uint64_t *v33;
  uint64_t v34;
  const __CFString **v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  os_activity_scope_state_s state;
  uint8_t v41[4];
  os_signpost_id_t v42;
  __int16 v43;
  double v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  const __CFString *v48;
  __int128 buf;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v28 = _os_activity_create(&dword_1A2BCD000, "accounts/dataclass-actions-for-account-save", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v28, &state);
  _ACSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = _ACSignpostCreate(v7);
  v10 = v9;

  _ACSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "DataclassActionsForAccountSave", "%@", (uint8_t *)&buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore dataclassActionsForAccountSave:error:].cold.1();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__0;
  v52 = __Block_byref_object_dispose__0;
  v53 = 0;
  v34 = 0;
  v35 = (const __CFString **)&v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__0;
  v38 = __Block_byref_object_dispose__0;
  v39 = 0;
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __55__ACAccountStore_dataclassActionsForAccountSave_error___block_invoke;
  v30[3] = &unk_1E4892B78;
  v16 = v6;
  v31 = v16;
  p_buf = &buf;
  v33 = &v34;
  v29[0] = v15;
  v29[1] = 3221225472;
  v29[2] = __55__ACAccountStore_dataclassActionsForAccountSave_error___block_invoke_161;
  v29[3] = &unk_1E4892BA0;
  v29[4] = self;
  v29[5] = &v34;
  ac_dispatch_remote_sync(v14, v30, v29);

  if (a4)
    *a4 = (id)objc_retainAutorelease((id)v35[5]);
  Nanoseconds = _ACSignpostGetNanoseconds(v8, v10);
  _ACSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    v20 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    v21 = v35[5];
    if (*(double *)&v21 == 0.0)
      *(double *)&v21 = COERCE_DOUBLE(&stru_1E4894AE8);
    *(_DWORD *)v41 = 138412546;
    v42 = v20;
    v43 = 2112;
    v44 = *(double *)&v21;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v19, OS_SIGNPOST_INTERVAL_END, v8, "DataclassActionsForAccountSave", "%@%@", v41, 0x16u);
  }

  _ACSignpostLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v25 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    v26 = v35[5];
    *(_DWORD *)v41 = 134218754;
    v42 = v8;
    v43 = 2048;
    v44 = (double)Nanoseconds / 1000000000.0;
    v45 = 2112;
    v46 = v25;
    if (v26)
      v27 = v26;
    else
      v27 = &stru_1E4894AE8;
    v47 = 2112;
    v48 = v27;
    _os_log_debug_impl(&dword_1A2BCD000, v22, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: DataclassActionsForAccountSave %@%@", v41, 0x2Au);
  }

  v23 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

  return v23;
}

uint64_t __55__ACAccountStore_dataclassActionsForAccountSave_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__ACAccountStore_dataclassActionsForAccountSave_error___block_invoke_2;
  v4[3] = &unk_1E4893760;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "dataclassActionsForAccountSave:completion:", v2, v4);
}

void __55__ACAccountStore_dataclassActionsForAccountSave_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _ACLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __55__ACAccountStore_dataclassActionsForAccountSave_error___block_invoke_2_cold_1();

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v6;

}

void __55__ACAccountStore_dataclassActionsForAccountSave_error___block_invoke_161(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)dataclassActionsForAccountDeletion:(id)a3
{
  return -[ACAccountStore dataclassActionsForAccountDeletion:error:](self, "dataclassActionsForAccountDeletion:error:", a3, 0);
}

- (id)dataclassActionsForAccountDeletion:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  unint64_t Nanoseconds;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  const __CFString *v21;
  NSObject *v22;
  id v23;
  uint64_t v25;
  const __CFString *v26;
  const __CFString *v27;
  NSObject *v28;
  _QWORD v29[6];
  _QWORD v30[4];
  id v31;
  __int128 *p_buf;
  uint64_t *v33;
  uint64_t v34;
  const __CFString **v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  os_activity_scope_state_s state;
  uint8_t v41[4];
  os_signpost_id_t v42;
  __int16 v43;
  double v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  const __CFString *v48;
  __int128 buf;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v28 = _os_activity_create(&dword_1A2BCD000, "accounts/dataclass-actions-for-account-deletion", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v28, &state);
  _ACSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = _ACSignpostCreate(v7);
  v10 = v9;

  _ACSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "DataclassActionsForAccountDeletion", "%@", (uint8_t *)&buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore dataclassActionsForAccountDeletion:error:].cold.1();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__0;
  v52 = __Block_byref_object_dispose__0;
  v53 = 0;
  v34 = 0;
  v35 = (const __CFString **)&v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__0;
  v38 = __Block_byref_object_dispose__0;
  v39 = 0;
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __59__ACAccountStore_dataclassActionsForAccountDeletion_error___block_invoke;
  v30[3] = &unk_1E4892B78;
  v16 = v6;
  v31 = v16;
  p_buf = &buf;
  v33 = &v34;
  v29[0] = v15;
  v29[1] = 3221225472;
  v29[2] = __59__ACAccountStore_dataclassActionsForAccountDeletion_error___block_invoke_162;
  v29[3] = &unk_1E4892BA0;
  v29[4] = self;
  v29[5] = &v34;
  ac_dispatch_remote_sync(v14, v30, v29);

  if (a4)
    *a4 = (id)objc_retainAutorelease((id)v35[5]);
  Nanoseconds = _ACSignpostGetNanoseconds(v8, v10);
  _ACSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    v20 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    v21 = v35[5];
    if (*(double *)&v21 == 0.0)
      *(double *)&v21 = COERCE_DOUBLE(&stru_1E4894AE8);
    *(_DWORD *)v41 = 138412546;
    v42 = v20;
    v43 = 2112;
    v44 = *(double *)&v21;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v19, OS_SIGNPOST_INTERVAL_END, v8, "DataclassActionsForAccountDeletion", "%@%@", v41, 0x16u);
  }

  _ACSignpostLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v25 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    v26 = v35[5];
    *(_DWORD *)v41 = 134218754;
    v42 = v8;
    v43 = 2048;
    v44 = (double)Nanoseconds / 1000000000.0;
    v45 = 2112;
    v46 = v25;
    if (v26)
      v27 = v26;
    else
      v27 = &stru_1E4894AE8;
    v47 = 2112;
    v48 = v27;
    _os_log_debug_impl(&dword_1A2BCD000, v22, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: DataclassActionsForAccountDeletion %@%@", v41, 0x2Au);
  }

  v23 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

  return v23;
}

uint64_t __59__ACAccountStore_dataclassActionsForAccountDeletion_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__ACAccountStore_dataclassActionsForAccountDeletion_error___block_invoke_2;
  v4[3] = &unk_1E4893760;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "dataclassActionsForAccountDeletion:completion:", v2, v4);
}

void __59__ACAccountStore_dataclassActionsForAccountDeletion_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _ACLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __55__ACAccountStore_dataclassActionsForAccountSave_error___block_invoke_2_cold_1();

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v6;

}

void __59__ACAccountStore_dataclassActionsForAccountDeletion_error___block_invoke_162(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)isPerformingDataclassActionsForAccount:(id)a3
{
  return -[ACAccountStore isPerformingDataclassActionsForAccount:error:](self, "isPerformingDataclassActionsForAccount:error:", a3, 0);
}

- (BOOL)isPerformingDataclassActionsForAccount:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  unint64_t Nanoseconds;
  NSObject *v18;
  NSObject *v19;
  const __CFString *v20;
  const __CFString *v21;
  NSObject *v22;
  BOOL v23;
  const __CFString *v25;
  const __CFString *v26;
  NSObject *v27;
  _QWORD v28[6];
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  __int128 *p_buf;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  os_activity_scope_state_s state;
  uint8_t v38[4];
  os_signpost_id_t v39;
  __int16 v40;
  double v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  const __CFString *v45;
  __int128 buf;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v27 = _os_activity_create(&dword_1A2BCD000, "accounts/is-performingdataclass-actions", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v27, &state);
  _ACSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = _ACSignpostCreate(v7);
  v10 = v9;

  _ACSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "IsPerformingDataclassActions", "%@", (uint8_t *)&buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore isPerformingDataclassActionsForAccount:error:].cold.1();

  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__0;
  v49 = __Block_byref_object_dispose__0;
  v50 = 0;
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __63__ACAccountStore_isPerformingDataclassActionsForAccount_error___block_invoke;
  v29[3] = &unk_1E4892B78;
  v16 = v6;
  v30 = v16;
  v31 = &v33;
  p_buf = &buf;
  v28[0] = v15;
  v28[1] = 3221225472;
  v28[2] = __63__ACAccountStore_isPerformingDataclassActionsForAccount_error___block_invoke_163;
  v28[3] = &unk_1E4892BA0;
  v28[4] = self;
  v28[5] = &buf;
  ac_dispatch_remote_sync(v14, v29, v28);

  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  Nanoseconds = _ACSignpostGetNanoseconds(v8, v10);
  _ACSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    if (*((_BYTE *)v34 + 24))
      v20 = CFSTR("YES");
    else
      v20 = CFSTR("NO");
    v21 = *(const __CFString **)(*((_QWORD *)&buf + 1) + 40);
    if (*(double *)&v21 == 0.0)
      *(double *)&v21 = COERCE_DOUBLE(&stru_1E4894AE8);
    *(_DWORD *)v38 = 138412546;
    v39 = (os_signpost_id_t)v20;
    v40 = 2112;
    v41 = *(double *)&v21;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v19, OS_SIGNPOST_INTERVAL_END, v8, "IsPerformingDataclassActions", "%@%@", v38, 0x16u);
  }

  _ACSignpostLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v25 = CFSTR("YES");
    v26 = *(const __CFString **)(*((_QWORD *)&buf + 1) + 40);
    if (!*((_BYTE *)v34 + 24))
      v25 = CFSTR("NO");
    *(_DWORD *)v38 = 134218754;
    v39 = v8;
    v40 = 2048;
    v41 = (double)Nanoseconds / 1000000000.0;
    v42 = 2112;
    v43 = v25;
    if (!v26)
      v26 = &stru_1E4894AE8;
    v44 = 2112;
    v45 = v26;
    _os_log_debug_impl(&dword_1A2BCD000, v22, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: IsPerformingDataclassActions %@%@", v38, 0x2Au);
  }

  v23 = *((_BYTE *)v34 + 24) != 0;
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v33, 8);
  os_activity_scope_leave(&state);

  return v23;
}

uint64_t __63__ACAccountStore_isPerformingDataclassActionsForAccount_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__ACAccountStore_isPerformingDataclassActionsForAccount_error___block_invoke_2;
  v4[3] = &unk_1E4893788;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "isPerformingDataclassActionsForAccount:completion:", v2, v4);
}

void __63__ACAccountStore_isPerformingDataclassActionsForAccount_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  if (v5)
  {
    _ACLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __63__ACAccountStore_isPerformingDataclassActionsForAccount_error___block_invoke_2_cold_1();

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

}

void __63__ACAccountStore_isPerformingDataclassActionsForAccount_error___block_invoke_163(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)isTetheredSyncingEnabledForDataclass:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  unint64_t Nanoseconds;
  NSObject *v16;
  NSObject *v17;
  const __CFString *v18;
  NSObject *v19;
  BOOL v20;
  int v22;
  const __CFString *v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v33;
  __int16 v34;
  double v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  const __CFString *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1A2BCD000, "accounts/is-tethered-syncing-enabled-for-dataclasse", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _ACSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _ACSignpostCreate(v6);
  v9 = v8;

  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 138412290;
    v33 = (os_signpost_id_t)v4;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "IsThetheredSyncingEnabledForDataclass", "%@", buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore isTetheredSyncingEnabledForDataclass:].cold.1();

  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __55__ACAccountStore_isTetheredSyncingEnabledForDataclass___block_invoke;
  v24[3] = &unk_1E4893088;
  v14 = v4;
  v25 = v14;
  v26 = &v27;
  ac_dispatch_remote_sync(v13, v24, 0);

  Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  _ACSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    if (*((_BYTE *)v28 + 24))
      v18 = CFSTR("YES");
    else
      v18 = CFSTR("NO");
    *(_DWORD *)buf = 138412546;
    v33 = (os_signpost_id_t)v18;
    v34 = 2112;
    v35 = COERCE_DOUBLE(&stru_1E4894AE8);
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v17, OS_SIGNPOST_INTERVAL_END, v7, "IsThetheredSyncingEnabledForDataclass", "%@%@", buf, 0x16u);
  }

  _ACSignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v22 = *((unsigned __int8 *)v28 + 24);
    *(_DWORD *)buf = 134218754;
    v33 = v7;
    if (v22)
      v23 = CFSTR("YES");
    else
      v23 = CFSTR("NO");
    v34 = 2048;
    v35 = (double)Nanoseconds / 1000000000.0;
    v36 = 2112;
    v37 = v23;
    v38 = 2112;
    v39 = &stru_1E4894AE8;
    _os_log_debug_impl(&dword_1A2BCD000, v19, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: IsThetheredSyncingEnabledForDataclass %@%@", buf, 0x2Au);
  }

  v20 = *((_BYTE *)v28 + 24) != 0;
  _Block_object_dispose(&v27, 8);
  os_activity_scope_leave(&state);

  return v20;
}

uint64_t __55__ACAccountStore_isTetheredSyncingEnabledForDataclass___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__ACAccountStore_isTetheredSyncingEnabledForDataclass___block_invoke_2;
  v4[3] = &unk_1E4893060;
  v2 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "isTetheredSyncingEnabledForDataclass:completion:", v2, v4);
}

uint64_t __55__ACAccountStore_isTetheredSyncingEnabledForDataclass___block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)accountIdentifiersEnabledForDataclasses:(id)a3 withAccountTypeIdentifiers:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  os_signpost_id_t v31;
  uint64_t v32;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_1A2BCD000, "accounts/accounts-enabled-for-dataclasses-of-type", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  if (!v8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The dataclasses argument cannot be nil"));
  if (!v9)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The accountTypes argument cannot be nil"));
  if (v10)
  {
    _ACSignpostLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = _ACSignpostCreate(v12);
    v15 = v14;

    _ACSignpostLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_DWORD *)buf = 138412546;
      v35 = (os_signpost_id_t)v8;
      v36 = 2112;
      v37 = v9;
      _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "AccountsEnabledForDataclasses", "%@ : %@", buf, 0x16u);
    }

    _ACSignpostLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v35 = v13;
      v36 = 2112;
      v37 = v8;
      v38 = 2112;
      v39 = v9;
      _os_log_debug_impl(&dword_1A2BCD000, v18, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: AccountsEnabledForDataclasses %@ : %@", buf, 0x20u);
    }

    v19 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __96__ACAccountStore_accountIdentifiersEnabledForDataclasses_withAccountTypeIdentifiers_completion___block_invoke;
    v29[3] = &unk_1E4892FC0;
    v29[4] = self;
    v31 = v13;
    v32 = v15;
    v30 = v10;
    v20 = (void *)MEMORY[0x1A858A038](v29);
    -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v19;
    v25[1] = 3221225472;
    v25[2] = __96__ACAccountStore_accountIdentifiersEnabledForDataclasses_withAccountTypeIdentifiers_completion___block_invoke_169;
    v25[3] = &unk_1E4892C40;
    v26 = v8;
    v27 = v9;
    v28 = v20;
    v23[0] = v19;
    v23[1] = 3221225472;
    v23[2] = __96__ACAccountStore_accountIdentifiersEnabledForDataclasses_withAccountTypeIdentifiers_completion___block_invoke_2_170;
    v23[3] = &unk_1E48924C8;
    v22 = v28;
    v23[4] = self;
    v24 = v22;
    ac_dispatch_remote(v21, v25, v23);

  }
  os_activity_scope_leave(&state);

}

void __96__ACAccountStore_accountIdentifiersEnabledForDataclasses_withAccountTypeIdentifiers_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  __int128 v15;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __96__ACAccountStore_accountIdentifiersEnabledForDataclasses_withAccountTypeIdentifiers_completion___block_invoke_2;
  block[3] = &unk_1E4892BC8;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  block[1] = 3221225472;
  v15 = *(_OWORD *)(a1 + 48);
  v12 = v5;
  v13 = v6;
  v14 = v7;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __96__ACAccountStore_accountIdentifiersEnabledForDataclasses_withAccountTypeIdentifiers_completion___block_invoke_2(_QWORD *a1)
{
  unint64_t Nanoseconds;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  const __CFString *v7;
  NSObject *v8;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  double v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  Nanoseconds = _ACSignpostGetNanoseconds(a1[7], a1[8]);
  _ACSignpostLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = a1[7];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v6 = a1[4];
    v7 = (const __CFString *)a1[5];
    if (!v7)
      v7 = &stru_1E4894AE8;
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v4, OS_SIGNPOST_INTERVAL_END, v5, "AccountsEnabledForDataclasses", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  _ACSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = a1[7];
    v11 = a1[4];
    v12 = (const __CFString *)a1[5];
    v14 = 134218754;
    v15 = v10;
    v13 = &stru_1E4894AE8;
    v16 = 2048;
    v17 = (double)Nanoseconds / 1000000000.0;
    v18 = 2112;
    v19 = v11;
    if (v12)
      v13 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_debug_impl(&dword_1A2BCD000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsEnabledForDataclasses %@%@", (uint8_t *)&v14, 0x2Au);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __96__ACAccountStore_accountIdentifiersEnabledForDataclasses_withAccountTypeIdentifiers_completion___block_invoke_169(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "accountIdentifiersEnabledForDataclasses:withAccountTypeIdentifiers:completion:", a1[4], a1[5], a1[6]);
}

void __96__ACAccountStore_accountIdentifiersEnabledForDataclasses_withAccountTypeIdentifiers_completion___block_invoke_2_170(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (id)clientTokenForAccount:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_semaphore_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  unint64_t Nanoseconds;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  id v23;
  uint64_t v25;
  _QWORD v26[4];
  NSObject *v27;
  _QWORD v28[4];
  id v29;
  NSObject *v30;
  __int128 *p_buf;
  os_activity_scope_state_s state;
  uint8_t v33[4];
  os_signpost_id_t v34;
  __int16 v35;
  double v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  const __CFString *v40;
  __int128 buf;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1A2BCD000, "accounts/client-token-for-account", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _ACSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _ACSignpostCreate(v6);
  v9 = v8;

  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "ClientTokenForAccount", "%@", (uint8_t *)&buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore clientTokenForAccount:].cold.1();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__0;
  v44 = __Block_byref_object_dispose__0;
  v45 = 0;
  v13 = dispatch_semaphore_create(0);
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __40__ACAccountStore_clientTokenForAccount___block_invoke;
  v28[3] = &unk_1E48936C0;
  v16 = v4;
  v29 = v16;
  p_buf = &buf;
  v30 = v13;
  v26[0] = v15;
  v26[1] = 3221225472;
  v26[2] = __40__ACAccountStore_clientTokenForAccount___block_invoke_3;
  v26[3] = &unk_1E48932D8;
  v17 = v30;
  v27 = v17;
  ac_dispatch_remote(v14, v28, v26);

  dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  _ACSignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    v21 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v33 = 138412546;
    v34 = v21;
    v35 = 2112;
    v36 = COERCE_DOUBLE(&stru_1E4894AE8);
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v20, OS_SIGNPOST_INTERVAL_END, v7, "ClientTokenForAccount", "%@%@", v33, 0x16u);
  }

  _ACSignpostLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v33 = 134218754;
    v25 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    v34 = v7;
    v35 = 2048;
    v36 = (double)Nanoseconds / 1000000000.0;
    v37 = 2112;
    v38 = v25;
    v39 = 2112;
    v40 = &stru_1E4894AE8;
    _os_log_debug_impl(&dword_1A2BCD000, v22, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: ClientTokenForAccount %@%@", v33, 0x2Au);
  }

  v23 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);
  return v23;
}

void __40__ACAccountStore_clientTokenForAccount___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  __int128 v7;
  _QWORD v8[4];
  __int128 v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__ACAccountStore_clientTokenForAccount___block_invoke_2;
  v8[3] = &unk_1E48937D8;
  v7 = *(_OWORD *)(a1 + 40);
  v6 = (id)v7;
  v9 = v7;
  objc_msgSend(v4, "clientTokenForAccountIdentifier:completion:", v5, v8);

}

void __40__ACAccountStore_clientTokenForAccount___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

intptr_t __40__ACAccountStore_clientTokenForAccount___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)addClientToken:(id)a3 forAccount:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  dispatch_semaphore_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  NSObject *v21;
  unint64_t Nanoseconds;
  NSObject *v23;
  NSObject *v24;
  const __CFString *v25;
  NSObject *v26;
  BOOL v27;
  int v29;
  const __CFString *v30;
  _QWORD v31[4];
  NSObject *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  NSObject *v36;
  _BYTE *v37;
  os_activity_scope_state_s state;
  uint8_t v39[4];
  os_signpost_id_t v40;
  __int16 v41;
  double v42;
  __int16 v43;
  const __CFString *v44;
  _BYTE buf[24];
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1A2BCD000, "accounts/add-client-token", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _ACSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _ACSignpostCreate(v9);
  v12 = v11;

  _ACSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "AddClientTokenForAccount", "%@ -> %@", buf, 0x16u);
  }

  _ACSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    v46 = v7;
    _os_log_debug_impl(&dword_1A2BCD000, v15, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: AddClientTokenForAccount %@ -> %@", buf, 0x20u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v46) = 0;
  v16 = dispatch_semaphore_create(0);
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __44__ACAccountStore_addClientToken_forAccount___block_invoke;
  v33[3] = &unk_1E48935A8;
  v19 = v6;
  v34 = v19;
  v20 = v7;
  v35 = v20;
  v37 = buf;
  v36 = v16;
  v31[0] = v18;
  v31[1] = 3221225472;
  v31[2] = __44__ACAccountStore_addClientToken_forAccount___block_invoke_3;
  v31[3] = &unk_1E48932D8;
  v21 = v36;
  v32 = v21;
  ac_dispatch_remote(v17, v33, v31);

  dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
  Nanoseconds = _ACSignpostGetNanoseconds(v10, v12);
  _ACSignpostLogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      v25 = CFSTR("YES");
    else
      v25 = CFSTR("NO");
    *(_DWORD *)v39 = 138543362;
    v40 = (os_signpost_id_t)v25;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v24, OS_SIGNPOST_INTERVAL_END, v10, "AddClientTokenForAccount", "%{public}@", v39, 0xCu);
  }

  _ACSignpostLogSystem();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v29 = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
    *(_DWORD *)v39 = 134218498;
    v40 = v10;
    if (v29)
      v30 = CFSTR("YES");
    else
      v30 = CFSTR("NO");
    v41 = 2048;
    v42 = (double)Nanoseconds / 1000000000.0;
    v43 = 2114;
    v44 = v30;
    _os_log_debug_impl(&dword_1A2BCD000, v26, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AddClientTokenForAccount %{public}@", v39, 0x20u);
  }

  v27 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);
  os_activity_scope_leave(&state);

  return v27;
}

void __44__ACAccountStore_addClientToken_forAccount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  __int128 v8;
  _QWORD v9[4];
  __int128 v10;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__ACAccountStore_addClientToken_forAccount___block_invoke_2;
  v9[3] = &unk_1E4893800;
  v8 = *(_OWORD *)(a1 + 48);
  v7 = (id)v8;
  v10 = v8;
  objc_msgSend(v5, "addClientToken:forAccountIdentifier:completion:", v3, v6, v9);

}

intptr_t __44__ACAccountStore_addClientToken_forAccount___block_invoke_2(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __44__ACAccountStore_addClientToken_forAccount___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)discoverPropertiesForAccount:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  ACAccountStore *v37;
  id v38;
  _QWORD v39[5];
  id v40;
  os_signpost_id_t v41;
  uint64_t v42;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_1A2BCD000, "accounts/discover-properties-for-account", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Account must be non-nil"), 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v31);
  }
  -[ACAccountStore _sanitizeOptionsDictionary:](self, "_sanitizeOptionsDictionary:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _ACSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = _ACSignpostCreate(v13);
  v16 = v15;

  _ACSignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    objc_msgSend(v8, "accountType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v45 = (os_signpost_id_t)v20;
    v46 = 2112;
    v47 = v8;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v14, "DiscoverProperties", " AccountType=%{public,signpost.telemetry:string1,name=AccountType}@  enableTelemetry=YES (account: %@)", buf, 0x16u);

  }
  _ACSignpostLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "accountType");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v45 = v14;
    v46 = 2114;
    v47 = v30;
    v48 = 2112;
    v49 = v8;
    _os_log_debug_impl(&dword_1A2BCD000, v21, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: DiscoverProperties  AccountType=%{public,signpost.telemetry:string1,name=AccountType}@  enableTelemetry=YES (account: %@)", buf, 0x20u);

  }
  v22 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __66__ACAccountStore_discoverPropertiesForAccount_options_completion___block_invoke;
  v39[3] = &unk_1E4893828;
  v41 = v14;
  v42 = v16;
  v23 = v10;
  v39[4] = self;
  v40 = v23;
  v24 = (void *)MEMORY[0x1A858A038](v39);
  -[ACAccountStore longLivedRemoteAccountStoreSession](self, "longLivedRemoteAccountStoreSession");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v22;
  v34[1] = 3221225472;
  v34[2] = __66__ACAccountStore_discoverPropertiesForAccount_options_completion___block_invoke_2;
  v34[3] = &unk_1E48933F0;
  v26 = v8;
  v35 = v26;
  v27 = v12;
  v36 = v27;
  v37 = self;
  v38 = v24;
  v32[0] = v22;
  v32[1] = 3221225472;
  v32[2] = __66__ACAccountStore_discoverPropertiesForAccount_options_completion___block_invoke_4;
  v32[3] = &unk_1E48924C8;
  v28 = v38;
  v32[4] = self;
  v33 = v28;
  ac_dispatch_remote(v25, v34, v32);

  os_activity_scope_leave(&state);
}

void __66__ACAccountStore_discoverPropertiesForAccount_options_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t Nanoseconds;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  const __CFString *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  const __CFString *v15;
  const __CFString *v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  double v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  Nanoseconds = _ACSignpostGetNanoseconds(a1[6], a1[7]);
  _ACSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = a1[6];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v11 = CFSTR("NO");
    if (!v6)
      v11 = CFSTR("YES");
    *(_DWORD *)buf = 138543362;
    v22 = v11;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v9, OS_SIGNPOST_INTERVAL_END, v10, "DiscoverProperties", "%{public}@", buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v15 = (const __CFString *)a1[6];
    *(_DWORD *)buf = 134218498;
    v22 = v15;
    if (v6)
      v16 = CFSTR("NO");
    else
      v16 = CFSTR("YES");
    v23 = 2048;
    v24 = (double)Nanoseconds / 1000000000.0;
    v25 = 2114;
    v26 = v16;
    _os_log_debug_impl(&dword_1A2BCD000, v12, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: DiscoverProperties %{public}@", buf, 0x20u);
  }

  v13 = (void *)a1[5];
  if (v13)
  {
    v14 = *(NSObject **)(a1[4] + 80);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__ACAccountStore_discoverPropertiesForAccount_options_completion___block_invoke_171;
    block[3] = &unk_1E4892450;
    v20 = v13;
    v18 = v5;
    v19 = v6;
    dispatch_async(v14, block);

  }
}

uint64_t __66__ACAccountStore_discoverPropertiesForAccount_options_completion___block_invoke_171(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __66__ACAccountStore_discoverPropertiesForAccount_options_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__ACAccountStore_discoverPropertiesForAccount_options_completion___block_invoke_3;
  v7[3] = &unk_1E4893850;
  v6 = *(id *)(a1 + 56);
  v7[4] = *(_QWORD *)(a1 + 48);
  v8 = v6;
  objc_msgSend(a2, "discoverPropertiesForAccount:options:completion:", v4, v5, v7);

}

void __66__ACAccountStore_discoverPropertiesForAccount_options_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "_unsanitizeError:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v7);

}

void __66__ACAccountStore_discoverPropertiesForAccount_options_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)openAuthenticationURL:(id)a3 forAccount:(id)a4 shouldConfirm:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  const __CFString *v28;
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  BOOL v36;
  _QWORD v37[5];
  id v38;
  os_signpost_id_t v39;
  uint64_t v40;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = _os_activity_create(&dword_1A2BCD000, "accounts/open-authentication-url", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  if (!v11)
  {
    v28 = CFSTR("Account must be non-nil");
    goto LABEL_11;
  }
  if (!v10)
  {
    v28 = CFSTR("URL must be non-nil");
LABEL_11:
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v28, 0);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v29);
  }
  _ACSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = _ACSignpostCreate(v14);
  v17 = v16;

  _ACSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_DWORD *)buf = 138412546;
    v43 = (os_signpost_id_t)v10;
    v44 = 2112;
    v45 = v11;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v15, "OpenAuthURLForAccount", "%@ -> %@", buf, 0x16u);
  }

  _ACSignpostLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v43 = v15;
    v44 = 2112;
    v45 = v10;
    v46 = 2112;
    v47 = v11;
    _os_log_debug_impl(&dword_1A2BCD000, v20, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: OpenAuthURLForAccount %@ -> %@", buf, 0x20u);
  }

  v21 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __76__ACAccountStore_openAuthenticationURL_forAccount_shouldConfirm_completion___block_invoke;
  v37[3] = &unk_1E48930D8;
  v37[4] = self;
  v39 = v15;
  v40 = v17;
  v22 = v12;
  v38 = v22;
  v23 = (void *)MEMORY[0x1A858A038](v37);
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v21;
  v32[1] = 3221225472;
  v32[2] = __76__ACAccountStore_openAuthenticationURL_forAccount_shouldConfirm_completion___block_invoke_174;
  v32[3] = &unk_1E48931A0;
  v25 = v10;
  v33 = v25;
  v26 = v11;
  v34 = v26;
  v36 = a5;
  v35 = v23;
  v30[0] = v21;
  v30[1] = 3221225472;
  v30[2] = __76__ACAccountStore_openAuthenticationURL_forAccount_shouldConfirm_completion___block_invoke_2_175;
  v30[3] = &unk_1E48924C8;
  v27 = v35;
  v30[4] = self;
  v31 = v27;
  ac_dispatch_remote(v24, v32, v30);

  os_activity_scope_leave(&state);
}

void __76__ACAccountStore_openAuthenticationURL_forAccount_shouldConfirm_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  __int128 v12;
  char v13;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __76__ACAccountStore_openAuthenticationURL_forAccount_shouldConfirm_completion___block_invoke_2;
  block[3] = &unk_1E48930B0;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  block[1] = 3221225472;
  v12 = *(_OWORD *)(a1 + 48);
  v13 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __76__ACAccountStore_openAuthenticationURL_forAccount_shouldConfirm_completion___block_invoke_2(uint64_t a1)
{
  unint64_t Nanoseconds;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  const __CFString *v6;
  const __CFString *v7;
  NSObject *v8;
  uint64_t result;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  Nanoseconds = _ACSignpostGetNanoseconds(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  _ACSignpostLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (*(_BYTE *)(a1 + 64))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    v7 = *(const __CFString **)(a1 + 32);
    if (!v7)
      v7 = &stru_1E4894AE8;
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v4, OS_SIGNPOST_INTERVAL_END, v5, "OpenAuthURLForAccount", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  _ACSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(const __CFString **)(a1 + 48);
    v11 = CFSTR("YES");
    v12 = *(const __CFString **)(a1 + 32);
    if (!*(_BYTE *)(a1 + 64))
      v11 = CFSTR("NO");
    v14 = 134218754;
    v15 = v10;
    v13 = &stru_1E4894AE8;
    v16 = 2048;
    v17 = (double)Nanoseconds / 1000000000.0;
    v18 = 2112;
    v19 = v11;
    if (v12)
      v13 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_debug_impl(&dword_1A2BCD000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: OpenAuthURLForAccount %@%@", (uint8_t *)&v14, 0x2Au);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __76__ACAccountStore_openAuthenticationURL_forAccount_shouldConfirm_completion___block_invoke_174(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "openAuthenticationURL:forAccount:shouldConfirm:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void __76__ACAccountStore_openAuthenticationURL_forAccount_shouldConfirm_completion___block_invoke_2_175(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)openAuthenticationURLForAccount:(id)a3 withDelegateClassName:(id)a4 fromBundleAtPath:(id)a5 shouldConfirm:(BOOL)a6 completion:(id)a7
{
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  const __CFString *v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  __CFString *v28;
  __CFString *v29;
  __CFString *v30;
  id v31;
  const __CFString *v32;
  const __CFString *v33;
  id v34;
  _BOOL4 v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[4];
  __CFString *v39;
  __CFString *v40;
  __CFString *v41;
  id v42;
  BOOL v43;
  _QWORD v44[5];
  id v45;
  os_signpost_id_t v46;
  uint64_t v47;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v50;
  __int16 v51;
  __CFString *v52;
  __int16 v53;
  const __CFString *v54;
  __int16 v55;
  const __CFString *v56;
  __int16 v57;
  __CFString *v58;
  uint64_t v59;

  v35 = a6;
  v59 = *MEMORY[0x1E0C80C00];
  v11 = (__CFString *)a3;
  v12 = (__CFString *)a4;
  v13 = (__CFString *)a5;
  v14 = a7;
  v15 = _os_activity_create(&dword_1A2BCD000, "accounts/open-authentication-url-with-info", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v15, &state);
  if (!v11)
  {
    v33 = CFSTR("Account must be non-nil");
    goto LABEL_17;
  }
  if (!v12)
  {
    v33 = CFSTR("Auth delegate class name must be non-nil");
    goto LABEL_17;
  }
  if (!v13)
  {
    v33 = CFSTR("Bundle path must be non-nil");
LABEL_17:
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v33, 0);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v34);
  }
  _ACSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = _ACSignpostCreate(v16);
  v19 = v18;

  _ACSignpostLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    v22 = CFSTR("NO");
    *(_DWORD *)buf = 138413058;
    v50 = (os_signpost_id_t)v12;
    if (v35)
      v22 = CFSTR("YES");
    v51 = 2112;
    v52 = v13;
    v53 = 2112;
    v54 = v22;
    v55 = 2112;
    v56 = v11;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v17, "OpenAuthURLForAccount", "%@,%@,%@ -> %@", buf, 0x2Au);
  }

  _ACSignpostLogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v32 = CFSTR("NO");
    *(_DWORD *)buf = 134219010;
    v50 = v17;
    if (v35)
      v32 = CFSTR("YES");
    v51 = 2112;
    v52 = v12;
    v53 = 2112;
    v54 = v13;
    v55 = 2112;
    v56 = v32;
    v57 = 2112;
    v58 = v11;
    _os_log_debug_impl(&dword_1A2BCD000, v23, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: OpenAuthURLForAccount %@,%@,%@ -> %@", buf, 0x34u);
  }

  v24 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __114__ACAccountStore_openAuthenticationURLForAccount_withDelegateClassName_fromBundleAtPath_shouldConfirm_completion___block_invoke;
  v44[3] = &unk_1E48938A0;
  v44[4] = self;
  v46 = v17;
  v47 = v19;
  v25 = v14;
  v45 = v25;
  v26 = (void *)MEMORY[0x1A858A038](v44);
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v24;
  v38[1] = 3221225472;
  v38[2] = __114__ACAccountStore_openAuthenticationURLForAccount_withDelegateClassName_fromBundleAtPath_shouldConfirm_completion___block_invoke_181;
  v38[3] = &unk_1E48938C8;
  v28 = v11;
  v39 = v28;
  v29 = v12;
  v40 = v29;
  v30 = v13;
  v41 = v30;
  v43 = v35;
  v42 = v26;
  v36[0] = v24;
  v36[1] = 3221225472;
  v36[2] = __114__ACAccountStore_openAuthenticationURLForAccount_withDelegateClassName_fromBundleAtPath_shouldConfirm_completion___block_invoke_2_182;
  v36[3] = &unk_1E48924C8;
  v31 = v42;
  v36[4] = self;
  v37 = v31;
  ac_dispatch_remote(v27, v38, v36);

  os_activity_scope_leave(&state);
}

void __114__ACAccountStore_openAuthenticationURLForAccount_withDelegateClassName_fromBundleAtPath_shouldConfirm_completion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  __int128 v17;
  char v18;

  v7 = a3;
  v8 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[2] = __114__ACAccountStore_openAuthenticationURLForAccount_withDelegateClassName_fromBundleAtPath_shouldConfirm_completion___block_invoke_2;
  v13[3] = &unk_1E4893878;
  v9 = *(void **)(a1 + 40);
  v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  v13[1] = 3221225472;
  v17 = *(_OWORD *)(a1 + 48);
  v18 = a2;
  v14 = v8;
  v15 = v7;
  v16 = v9;
  v11 = v7;
  v12 = v8;
  dispatch_async(v10, v13);

}

uint64_t __114__ACAccountStore_openAuthenticationURLForAccount_withDelegateClassName_fromBundleAtPath_shouldConfirm_completion___block_invoke_2(uint64_t a1)
{
  unint64_t Nanoseconds;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  const __CFString *v6;
  const __CFString *v7;
  NSObject *v8;
  uint64_t result;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  Nanoseconds = _ACSignpostGetNanoseconds(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  _ACSignpostLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 56);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (*(_BYTE *)(a1 + 72))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    v7 = *(const __CFString **)(a1 + 32);
    if (!v7)
      v7 = &stru_1E4894AE8;
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v4, OS_SIGNPOST_INTERVAL_END, v5, "OpenAuthURLForAccount", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  _ACSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(const __CFString **)(a1 + 56);
    v11 = CFSTR("YES");
    v12 = *(const __CFString **)(a1 + 32);
    if (!*(_BYTE *)(a1 + 72))
      v11 = CFSTR("NO");
    v14 = 134218754;
    v15 = v10;
    v13 = &stru_1E4894AE8;
    v16 = 2048;
    v17 = (double)Nanoseconds / 1000000000.0;
    v18 = 2112;
    v19 = v11;
    if (v12)
      v13 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_debug_impl(&dword_1A2BCD000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: OpenAuthURLForAccount %@%@", (uint8_t *)&v14, 0x2Au);
  }

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __114__ACAccountStore_openAuthenticationURLForAccount_withDelegateClassName_fromBundleAtPath_shouldConfirm_completion___block_invoke_181(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "openAuthenticationURLForAccount:withDelegateClassName:fromBundleAtPath:shouldConfirm:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

void __114__ACAccountStore_openAuthenticationURLForAccount_withDelegateClassName_fromBundleAtPath_shouldConfirm_completion___block_invoke_2_182(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, v2);

}

- (void)notifyRemoteDevicesOfModifiedAccount:(id)a3
{
  -[ACAccountStore notifyRemoteDevicesOfModifiedAccount:withOptions:completion:](self, "notifyRemoteDevicesOfModifiedAccount:withOptions:completion:", a3, 0, 0);
}

- (void)notifyRemoteDevicesOfModifiedAccount:(id)a3 withOptions:(id)a4
{
  -[ACAccountStore notifyRemoteDevicesOfModifiedAccount:withOptions:completion:](self, "notifyRemoteDevicesOfModifiedAccount:withOptions:completion:", a3, a4, 0);
}

- (void)notifyRemoteDevicesOfModifiedAccount:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[6];
  _QWORD v25[4];
  id v26;
  id v27;
  ACAccountStore *v28;
  id v29;
  os_signpost_id_t v30;
  uint64_t v31;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_1A2BCD000, "accounts/paired-update-account", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = _ACSignpostCreate(v12);
  v15 = v14;

  _ACSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_DWORD *)buf = 138412546;
    v34 = (os_signpost_id_t)v8;
    v35 = 2112;
    v36 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "NotifyRemoteOfModifiedAccount", "%@ (%@)", buf, 0x16u);
  }

  _ACSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v34 = v13;
    v35 = 2112;
    v36 = v8;
    v37 = 2112;
    v38 = v9;
    _os_log_debug_impl(&dword_1A2BCD000, v18, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: NotifyRemoteOfModifiedAccount %@ (%@)", buf, 0x20u);
  }

  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __78__ACAccountStore_notifyRemoteDevicesOfModifiedAccount_withOptions_completion___block_invoke;
  v25[3] = &unk_1E4892ED0;
  v21 = v8;
  v26 = v21;
  v22 = v9;
  v27 = v22;
  v28 = self;
  v30 = v13;
  v31 = v15;
  v23 = v10;
  v29 = v23;
  v24[0] = v20;
  v24[1] = 3221225472;
  v24[2] = __78__ACAccountStore_notifyRemoteDevicesOfModifiedAccount_withOptions_completion___block_invoke_183;
  v24[3] = &__block_descriptor_48_e17_v16__0__NSError_8l;
  v24[4] = v13;
  v24[5] = v15;
  ac_dispatch_remote(v19, v25, v24);

  os_activity_scope_leave(&state);
}

void __78__ACAccountStore_notifyRemoteDevicesOfModifiedAccount_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  __int128 v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[2] = __78__ACAccountStore_notifyRemoteDevicesOfModifiedAccount_withOptions_completion___block_invoke_2;
  v6[3] = &unk_1E48930D8;
  v3 = *(void **)(a1 + 56);
  v6[4] = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6[1] = 3221225472;
  v8 = *(_OWORD *)(a1 + 64);
  v7 = v3;
  objc_msgSend(a2, "notifyRemoteDevicesOfModifiedAccount:withChangeType:options:completion:", v4, CFSTR("changed"), v5, v6);

}

void __78__ACAccountStore_notifyRemoteDevicesOfModifiedAccount_withOptions_completion___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3)
{
  __CFString *v5;
  NSObject *v6;
  NSObject *v7;
  unint64_t Nanoseconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  const __CFString *v12;
  const __CFString *v13;
  NSObject *v14;
  uint64_t v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  int v19;
  const __CFString *v20;
  __int16 v21;
  double v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _ACLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_1A2BCD000, v7, OS_LOG_TYPE_DEFAULT, "\"Notified successfully!\", (uint8_t *)&v19, 2u);
  }

  Nanoseconds = _ACSignpostGetNanoseconds(a1[6], a1[7]);
  _ACSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = a1[6];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v12 = CFSTR("NO");
    if ((_DWORD)a2)
      v12 = CFSTR("YES");
    v13 = &stru_1E4894AE8;
    if (v5)
      v13 = v5;
    v19 = 138412546;
    v20 = v12;
    v21 = 2112;
    v22 = *(double *)&v13;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v10, OS_SIGNPOST_INTERVAL_END, v11, "NotifyRemoteOfModifiedAccount", "%@%@", (uint8_t *)&v19, 0x16u);
  }

  _ACSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v16 = (const __CFString *)a1[6];
    v17 = CFSTR("NO");
    if ((_DWORD)a2)
      v17 = CFSTR("YES");
    v19 = 134218754;
    v20 = v16;
    v18 = &stru_1E4894AE8;
    v21 = 2048;
    v22 = (double)Nanoseconds / 1000000000.0;
    v23 = 2112;
    v24 = v17;
    if (v5)
      v18 = v5;
    v25 = 2112;
    v26 = v18;
    _os_log_debug_impl(&dword_1A2BCD000, v14, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: NotifyRemoteOfModifiedAccount %@%@", (uint8_t *)&v19, 0x2Au);
  }

  v15 = a1[5];
  if (v15)
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v15 + 16))(v15, a2, v5);

}

void __78__ACAccountStore_notifyRemoteDevicesOfModifiedAccount_withOptions_completion___block_invoke_183(uint64_t a1, void *a2)
{
  __CFString *v3;
  NSObject *v4;
  unint64_t Nanoseconds;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  const __CFString *v9;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  double v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _ACLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __78__ACAccountStore_notifyRemoteDevicesOfModifiedAccount_withOptions_completion___block_invoke_183_cold_1();

  Nanoseconds = _ACSignpostGetNanoseconds(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  _ACSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 32);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    v9 = &stru_1E4894AE8;
    if (v3)
      v9 = v3;
    v13 = 138412546;
    v14 = CFSTR("NO");
    v15 = 2112;
    v16 = *(double *)&v9;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v7, OS_SIGNPOST_INTERVAL_END, v8, "NotifyRemoteOfModifiedAccount", "%@%@", (uint8_t *)&v13, 0x16u);
  }

  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = *(const __CFString **)(a1 + 32);
    v13 = 134218754;
    v14 = v11;
    v12 = &stru_1E4894AE8;
    v15 = 2048;
    v16 = (double)Nanoseconds / 1000000000.0;
    v17 = 2112;
    v18 = CFSTR("NO");
    if (v3)
      v12 = v3;
    v19 = 2112;
    v20 = v12;
    _os_log_debug_impl(&dword_1A2BCD000, v10, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: NotifyRemoteOfModifiedAccount %@%@", (uint8_t *)&v13, 0x2Au);
  }

}

- (void)notifyRemoteDevicesOfUpdatedCredentials:(id)a3
{
  -[ACAccountStore notifyRemoteDevicesOfUpdatedCredentials:withOptions:](self, "notifyRemoteDevicesOfUpdatedCredentials:withOptions:", a3, 0);
}

- (void)notifyRemoteDevicesOfUpdatedCredentials:(id)a3 withOptions:(id)a4
{
  -[ACAccountStore notifyRemoteDevicesOfUpdatedCredentials:withOptions:completion:](self, "notifyRemoteDevicesOfUpdatedCredentials:withOptions:completion:", a3, a4, 0);
}

- (void)notifyRemoteDevicesOfUpdatedCredentials:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[6];
  _QWORD v25[4];
  id v26;
  id v27;
  ACAccountStore *v28;
  id v29;
  os_signpost_id_t v30;
  uint64_t v31;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_1A2BCD000, "accounts/notify-remote-updated-credentials", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = _ACSignpostCreate(v12);
  v15 = v14;

  _ACSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_DWORD *)buf = 138412546;
    v34 = (os_signpost_id_t)v8;
    v35 = 2112;
    v36 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "NotifyRemoteOfUpdatedCredentials", "%@ (%@)", buf, 0x16u);
  }

  _ACSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v34 = v13;
    v35 = 2112;
    v36 = v8;
    v37 = 2112;
    v38 = v9;
    _os_log_debug_impl(&dword_1A2BCD000, v18, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: NotifyRemoteOfUpdatedCredentials %@ (%@)", buf, 0x20u);
  }

  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __81__ACAccountStore_notifyRemoteDevicesOfUpdatedCredentials_withOptions_completion___block_invoke;
  v25[3] = &unk_1E4892ED0;
  v21 = v8;
  v26 = v21;
  v22 = v9;
  v27 = v22;
  v28 = self;
  v30 = v13;
  v31 = v15;
  v23 = v10;
  v29 = v23;
  v24[0] = v20;
  v24[1] = 3221225472;
  v24[2] = __81__ACAccountStore_notifyRemoteDevicesOfUpdatedCredentials_withOptions_completion___block_invoke_184;
  v24[3] = &__block_descriptor_48_e17_v16__0__NSError_8l;
  v24[4] = v13;
  v24[5] = v15;
  ac_dispatch_remote(v19, v25, v24);

  os_activity_scope_leave(&state);
}

void __81__ACAccountStore_notifyRemoteDevicesOfUpdatedCredentials_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  __int128 v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[2] = __81__ACAccountStore_notifyRemoteDevicesOfUpdatedCredentials_withOptions_completion___block_invoke_2;
  v6[3] = &unk_1E48930D8;
  v3 = *(void **)(a1 + 56);
  v6[4] = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6[1] = 3221225472;
  v8 = *(_OWORD *)(a1 + 64);
  v7 = v3;
  objc_msgSend(a2, "notifyRemoteDevicesOfModifiedAccount:withChangeType:options:completion:", v4, CFSTR("auth"), v5, v6);

}

void __81__ACAccountStore_notifyRemoteDevicesOfUpdatedCredentials_withOptions_completion___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3)
{
  __CFString *v5;
  NSObject *v6;
  NSObject *v7;
  unint64_t Nanoseconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  const __CFString *v12;
  const __CFString *v13;
  NSObject *v14;
  uint64_t v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  int v19;
  const __CFString *v20;
  __int16 v21;
  double v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _ACLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_1A2BCD000, v7, OS_LOG_TYPE_DEFAULT, "\"Notified of credential update successfully!\", (uint8_t *)&v19, 2u);
  }

  Nanoseconds = _ACSignpostGetNanoseconds(a1[6], a1[7]);
  _ACSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = a1[6];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v12 = CFSTR("NO");
    if ((_DWORD)a2)
      v12 = CFSTR("YES");
    v13 = &stru_1E4894AE8;
    if (v5)
      v13 = v5;
    v19 = 138412546;
    v20 = v12;
    v21 = 2112;
    v22 = *(double *)&v13;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v10, OS_SIGNPOST_INTERVAL_END, v11, "NotifyRemoteOfUpdatedCredentials", "%@%@", (uint8_t *)&v19, 0x16u);
  }

  _ACSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v16 = (const __CFString *)a1[6];
    v17 = CFSTR("NO");
    if ((_DWORD)a2)
      v17 = CFSTR("YES");
    v19 = 134218754;
    v20 = v16;
    v18 = &stru_1E4894AE8;
    v21 = 2048;
    v22 = (double)Nanoseconds / 1000000000.0;
    v23 = 2112;
    v24 = v17;
    if (v5)
      v18 = v5;
    v25 = 2112;
    v26 = v18;
    _os_log_debug_impl(&dword_1A2BCD000, v14, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: NotifyRemoteOfUpdatedCredentials %@%@", (uint8_t *)&v19, 0x2Au);
  }

  v15 = a1[5];
  if (v15)
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v15 + 16))(v15, a2, v5);

}

void __81__ACAccountStore_notifyRemoteDevicesOfUpdatedCredentials_withOptions_completion___block_invoke_184(uint64_t a1, void *a2)
{
  __CFString *v3;
  NSObject *v4;
  unint64_t Nanoseconds;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  const __CFString *v9;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  double v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _ACLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __81__ACAccountStore_notifyRemoteDevicesOfUpdatedCredentials_withOptions_completion___block_invoke_184_cold_1();

  Nanoseconds = _ACSignpostGetNanoseconds(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  _ACSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 32);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    v9 = &stru_1E4894AE8;
    if (v3)
      v9 = v3;
    v13 = 138412546;
    v14 = CFSTR("NO");
    v15 = 2112;
    v16 = *(double *)&v9;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v7, OS_SIGNPOST_INTERVAL_END, v8, "NotifyRemoteOfUpdatedCredentials", "%@%@", (uint8_t *)&v13, 0x16u);
  }

  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = *(const __CFString **)(a1 + 32);
    v13 = 134218754;
    v14 = v11;
    v12 = &stru_1E4894AE8;
    v15 = 2048;
    v16 = (double)Nanoseconds / 1000000000.0;
    v17 = 2112;
    v18 = CFSTR("NO");
    if (v3)
      v12 = v3;
    v19 = 2112;
    v20 = v12;
    _os_log_debug_impl(&dword_1A2BCD000, v10, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: NotifyRemoteOfUpdatedCredentials %@%@", (uint8_t *)&v13, 0x2Au);
  }

}

- (void)saveAccount:(id)a3 toPairedDeviceWithOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  _QWORD v33[5];
  id v34;
  os_signpost_id_t v35;
  uint64_t v36;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_1A2BCD000, "accounts/paired-save-account", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Account must be non-nil"), 0);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v26);
  }
  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = _ACSignpostCreate(v12);
  v15 = v14;

  _ACSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_DWORD *)buf = 138412546;
    v39 = (os_signpost_id_t)v8;
    v40 = 2112;
    v41 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SaveAccountToPairedDevice", "%@ (%@)", buf, 0x16u);
  }

  _ACSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v39 = v13;
    v40 = 2112;
    v41 = v8;
    v42 = 2112;
    v43 = v9;
    _os_log_debug_impl(&dword_1A2BCD000, v18, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: SaveAccountToPairedDevice %@ (%@)", buf, 0x20u);
  }

  v19 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __67__ACAccountStore_saveAccount_toPairedDeviceWithOptions_completion___block_invoke;
  v33[3] = &unk_1E48930D8;
  v33[4] = self;
  v35 = v13;
  v36 = v15;
  v20 = v10;
  v34 = v20;
  v21 = (void *)MEMORY[0x1A858A038](v33);
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v19;
  v29[1] = 3221225472;
  v29[2] = __67__ACAccountStore_saveAccount_toPairedDeviceWithOptions_completion___block_invoke_185;
  v29[3] = &unk_1E4892C40;
  v23 = v8;
  v30 = v23;
  v24 = v9;
  v31 = v24;
  v32 = v21;
  v27[0] = v19;
  v27[1] = 3221225472;
  v27[2] = __67__ACAccountStore_saveAccount_toPairedDeviceWithOptions_completion___block_invoke_187;
  v27[3] = &unk_1E48924C8;
  v25 = v32;
  v27[4] = self;
  v28 = v25;
  ac_dispatch_remote(v22, v29, v27);

  os_activity_scope_leave(&state);
}

void __67__ACAccountStore_saveAccount_toPairedDeviceWithOptions_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  __int128 v12;
  char v13;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __67__ACAccountStore_saveAccount_toPairedDeviceWithOptions_completion___block_invoke_2;
  block[3] = &unk_1E48930B0;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  block[1] = 3221225472;
  v12 = *(_OWORD *)(a1 + 48);
  v13 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __67__ACAccountStore_saveAccount_toPairedDeviceWithOptions_completion___block_invoke_2(uint64_t a1)
{
  unint64_t Nanoseconds;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  const __CFString *v6;
  const __CFString *v7;
  NSObject *v8;
  uint64_t result;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  Nanoseconds = _ACSignpostGetNanoseconds(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  _ACSignpostLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (*(_BYTE *)(a1 + 64))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    v7 = *(const __CFString **)(a1 + 32);
    if (!v7)
      v7 = &stru_1E4894AE8;
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v4, OS_SIGNPOST_INTERVAL_END, v5, "SaveAccountToPairedDevice", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  _ACSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(const __CFString **)(a1 + 48);
    v11 = CFSTR("YES");
    v12 = *(const __CFString **)(a1 + 32);
    if (!*(_BYTE *)(a1 + 64))
      v11 = CFSTR("NO");
    v14 = 134218754;
    v15 = v10;
    v13 = &stru_1E4894AE8;
    v16 = 2048;
    v17 = (double)Nanoseconds / 1000000000.0;
    v18 = 2112;
    v19 = v11;
    if (v12)
      v13 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_debug_impl(&dword_1A2BCD000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: SaveAccountToPairedDevice %@%@", (uint8_t *)&v14, 0x2Au);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32));
  return result;
}

void __67__ACAccountStore_saveAccount_toPairedDeviceWithOptions_completion___block_invoke_185(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__ACAccountStore_saveAccount_toPairedDeviceWithOptions_completion___block_invoke_2_186;
  v5[3] = &unk_1E48934B8;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "saveAccount:toPairedDeviceWithOptions:completion:", v3, v4, v5);

}

void __67__ACAccountStore_saveAccount_toPairedDeviceWithOptions_completion___block_invoke_2_186(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  _ACLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A2BCD000, v6, OS_LOG_TYPE_DEFAULT, "\"Notified successfully!\", v7, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__ACAccountStore_saveAccount_toPairedDeviceWithOptions_completion___block_invoke_187(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)removeAccountsFromPairedDeviceWithCompletion:(id)a3
{
  -[ACAccountStore removeAccountsFromPairedDeviceWithOptions:completion:](self, "removeAccountsFromPairedDeviceWithOptions:completion:", 0, a3);
}

- (void)removeAccountsFromPairedDeviceWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  os_signpost_id_t v29;
  uint64_t v30;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1A2BCD000, "accounts/paired-remove-accounts", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _ACSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _ACSignpostCreate(v9);
  v12 = v11;

  _ACSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "RemoveAccountsFromPairedDevice", "(%@)", buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore removeAccountsFromPairedDeviceWithOptions:completion:].cold.1();

  v16 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __71__ACAccountStore_removeAccountsFromPairedDeviceWithOptions_completion___block_invoke;
  v27[3] = &unk_1E48930D8;
  v27[4] = self;
  v29 = v10;
  v30 = v12;
  v17 = v7;
  v28 = v17;
  v18 = (void *)MEMORY[0x1A858A038](v27);
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v16;
  v24[1] = 3221225472;
  v24[2] = __71__ACAccountStore_removeAccountsFromPairedDeviceWithOptions_completion___block_invoke_188;
  v24[3] = &unk_1E48924A0;
  v20 = v6;
  v25 = v20;
  v26 = v18;
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __71__ACAccountStore_removeAccountsFromPairedDeviceWithOptions_completion___block_invoke_190;
  v22[3] = &unk_1E48924C8;
  v21 = v26;
  v22[4] = self;
  v23 = v21;
  ac_dispatch_remote(v19, v24, v22);

  os_activity_scope_leave(&state);
}

void __71__ACAccountStore_removeAccountsFromPairedDeviceWithOptions_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  __int128 v12;
  char v13;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __71__ACAccountStore_removeAccountsFromPairedDeviceWithOptions_completion___block_invoke_2;
  block[3] = &unk_1E48930B0;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  block[1] = 3221225472;
  v12 = *(_OWORD *)(a1 + 48);
  v13 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __71__ACAccountStore_removeAccountsFromPairedDeviceWithOptions_completion___block_invoke_2(uint64_t a1)
{
  unint64_t Nanoseconds;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  const __CFString *v6;
  const __CFString *v7;
  NSObject *v8;
  uint64_t result;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  Nanoseconds = _ACSignpostGetNanoseconds(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  _ACSignpostLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (*(_BYTE *)(a1 + 64))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    v7 = *(const __CFString **)(a1 + 32);
    if (!v7)
      v7 = &stru_1E4894AE8;
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v4, OS_SIGNPOST_INTERVAL_END, v5, "RemoveAccountsFromPairedDevice", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  _ACSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(const __CFString **)(a1 + 48);
    v11 = CFSTR("YES");
    v12 = *(const __CFString **)(a1 + 32);
    if (!*(_BYTE *)(a1 + 64))
      v11 = CFSTR("NO");
    v14 = 134218754;
    v15 = v10;
    v13 = &stru_1E4894AE8;
    v16 = 2048;
    v17 = (double)Nanoseconds / 1000000000.0;
    v18 = 2112;
    v19 = v11;
    if (v12)
      v13 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_debug_impl(&dword_1A2BCD000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: RemoveAccountsFromPairedDevice %@%@", (uint8_t *)&v14, 0x2Au);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32));
  return result;
}

void __71__ACAccountStore_removeAccountsFromPairedDeviceWithOptions_completion___block_invoke_188(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__ACAccountStore_removeAccountsFromPairedDeviceWithOptions_completion___block_invoke_2_189;
  v4[3] = &unk_1E48934B8;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "removeAccountsFromPairedDeviceWithOptions:completion:", v3, v4);

}

void __71__ACAccountStore_removeAccountsFromPairedDeviceWithOptions_completion___block_invoke_2_189(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  _ACLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A2BCD000, v6, OS_LOG_TYPE_DEFAULT, "\"Removed successfully!\", v7, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__ACAccountStore_removeAccountsFromPairedDeviceWithOptions_completion___block_invoke_190(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)removeAccountFromPairedDevice:(id)a3 withCompletion:(id)a4
{
  -[ACAccountStore removeAccountFromPairedDevice:withOptions:completion:](self, "removeAccountFromPairedDevice:withOptions:completion:", a3, 0, a4);
}

- (void)removeAccountFromPairedDevice:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  os_signpost_id_t v34;
  uint64_t v35;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_1A2BCD000, "accounts/paired-remove-account", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = _ACSignpostCreate(v12);
  v15 = v14;

  _ACSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_DWORD *)buf = 138412546;
    v38 = (os_signpost_id_t)v8;
    v39 = 2112;
    v40 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "RemoveAccountFromPairedDevice", "%@ (%@)", buf, 0x16u);
  }

  _ACSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v38 = v13;
    v39 = 2112;
    v40 = v8;
    v41 = 2112;
    v42 = v9;
    _os_log_debug_impl(&dword_1A2BCD000, v18, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: RemoveAccountFromPairedDevice %@ (%@)", buf, 0x20u);
  }

  v19 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __71__ACAccountStore_removeAccountFromPairedDevice_withOptions_completion___block_invoke;
  v32[3] = &unk_1E48930D8;
  v32[4] = self;
  v34 = v13;
  v35 = v15;
  v20 = v10;
  v33 = v20;
  v21 = (void *)MEMORY[0x1A858A038](v32);
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v19;
  v28[1] = 3221225472;
  v28[2] = __71__ACAccountStore_removeAccountFromPairedDevice_withOptions_completion___block_invoke_191;
  v28[3] = &unk_1E4892C40;
  v23 = v8;
  v29 = v23;
  v24 = v9;
  v30 = v24;
  v31 = v21;
  v26[0] = v19;
  v26[1] = 3221225472;
  v26[2] = __71__ACAccountStore_removeAccountFromPairedDevice_withOptions_completion___block_invoke_193;
  v26[3] = &unk_1E48924C8;
  v25 = v31;
  v26[4] = self;
  v27 = v25;
  ac_dispatch_remote(v22, v28, v26);

  os_activity_scope_leave(&state);
}

void __71__ACAccountStore_removeAccountFromPairedDevice_withOptions_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  __int128 v12;
  char v13;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __71__ACAccountStore_removeAccountFromPairedDevice_withOptions_completion___block_invoke_2;
  block[3] = &unk_1E48930B0;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  block[1] = 3221225472;
  v12 = *(_OWORD *)(a1 + 48);
  v13 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __71__ACAccountStore_removeAccountFromPairedDevice_withOptions_completion___block_invoke_2(uint64_t a1)
{
  unint64_t Nanoseconds;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  const __CFString *v6;
  const __CFString *v7;
  NSObject *v8;
  uint64_t result;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  Nanoseconds = _ACSignpostGetNanoseconds(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  _ACSignpostLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (*(_BYTE *)(a1 + 64))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    v7 = *(const __CFString **)(a1 + 32);
    if (!v7)
      v7 = &stru_1E4894AE8;
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v4, OS_SIGNPOST_INTERVAL_END, v5, "RemoveAccountFromPairedDevice", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  _ACSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(const __CFString **)(a1 + 48);
    v11 = CFSTR("YES");
    v12 = *(const __CFString **)(a1 + 32);
    if (!*(_BYTE *)(a1 + 64))
      v11 = CFSTR("NO");
    v14 = 134218754;
    v15 = v10;
    v13 = &stru_1E4894AE8;
    v16 = 2048;
    v17 = (double)Nanoseconds / 1000000000.0;
    v18 = 2112;
    v19 = v11;
    if (v12)
      v13 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_debug_impl(&dword_1A2BCD000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: RemoveAccountFromPairedDevice %@%@", (uint8_t *)&v14, 0x2Au);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32));
  return result;
}

void __71__ACAccountStore_removeAccountFromPairedDevice_withOptions_completion___block_invoke_191(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__ACAccountStore_removeAccountFromPairedDevice_withOptions_completion___block_invoke_2_192;
  v5[3] = &unk_1E48934B8;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "removeAccountFromPairedDevice:withOptions:completion:", v3, v4, v5);

}

void __71__ACAccountStore_removeAccountFromPairedDevice_withOptions_completion___block_invoke_2_192(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  _ACLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A2BCD000, v6, OS_LOG_TYPE_DEFAULT, "\"Removed successfully!\", v7, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__ACAccountStore_removeAccountFromPairedDevice_withOptions_completion___block_invoke_193(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (BOOL)triggerKeychainMigrationIfNecessary:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  unint64_t Nanoseconds;
  NSObject *v15;
  NSObject *v16;
  const __CFString *v17;
  const __CFString *v18;
  NSObject *v19;
  BOOL v20;
  const __CFString *v22;
  const __CFString *v23;
  _QWORD v24[7];
  _QWORD v25[6];
  uint8_t buf[8];
  uint8_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  os_activity_scope_state_s state;
  uint8_t v37[4];
  os_signpost_id_t v38;
  __int16 v39;
  double v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  const __CFString *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = _os_activity_create(&dword_1A2BCD000, "accounts/trigger-keychain-migration", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _ACSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _ACSignpostCreate(v6);
  v9 = v8;

  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "TriggerMigration", (const char *)&unk_1A2C2C35B, buf, 2u);
  }

  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore triggerKeychainMigrationIfNecessary:].cold.1();

  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  *(_QWORD *)buf = 0;
  v27 = buf;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__0;
  v30 = __Block_byref_object_dispose__0;
  v31 = 0;
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = buf;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __54__ACAccountStore_triggerKeychainMigrationIfNecessary___block_invoke;
  v25[3] = &unk_1E4893910;
  v25[4] = &v32;
  v25[5] = buf;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __54__ACAccountStore_triggerKeychainMigrationIfNecessary___block_invoke_194;
  v24[3] = &unk_1E4892F98;
  v24[4] = self;
  v24[5] = &v32;
  ac_dispatch_remote_sync(v13, v25, v24);

  if (a3)
    *a3 = objc_retainAutorelease(*((id *)v27 + 5));
  Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  _ACSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    if (*((_BYTE *)v33 + 24))
      v17 = CFSTR("YES");
    else
      v17 = CFSTR("NO");
    v18 = *((const __CFString **)v27 + 5);
    if (*(double *)&v18 == 0.0)
      *(double *)&v18 = COERCE_DOUBLE(&stru_1E4894AE8);
    *(_DWORD *)v37 = 138412546;
    v38 = (os_signpost_id_t)v17;
    v39 = 2112;
    v40 = *(double *)&v18;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v16, OS_SIGNPOST_INTERVAL_END, v7, "TriggerMigration", "%@%@", v37, 0x16u);
  }

  _ACSignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v22 = CFSTR("YES");
    v23 = (const __CFString *)*((_QWORD *)v27 + 5);
    if (!*((_BYTE *)v33 + 24))
      v22 = CFSTR("NO");
    *(_DWORD *)v37 = 134218754;
    v38 = v7;
    v39 = 2048;
    v40 = (double)Nanoseconds / 1000000000.0;
    v41 = 2112;
    v42 = v22;
    if (!v23)
      v23 = &stru_1E4894AE8;
    v43 = 2112;
    v44 = v23;
    _os_log_debug_impl(&dword_1A2BCD000, v19, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: TriggerMigration %@%@", v37, 0x2Au);
  }

  v20 = *((_BYTE *)v33 + 24) != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v32, 8);
  os_activity_scope_leave(&state);

  return v20;
}

uint64_t __54__ACAccountStore_triggerKeychainMigrationIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__ACAccountStore_triggerKeychainMigrationIfNecessary___block_invoke_2;
  v3[3] = &unk_1E4893788;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "triggerKeychainMigrationIfNecessary:", v3);
}

void __54__ACAccountStore_triggerKeychainMigrationIfNecessary___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint8_t v10[16];

  v5 = a3;
  _ACLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1A2BCD000, v7, OS_LOG_TYPE_DEFAULT, "\"Keychain migrated successfully!\", v10, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;

}

void __54__ACAccountStore_triggerKeychainMigrationIfNecessary___block_invoke_194(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __49__ACAccountStore__obsoleteAccountTypeIDsToRemove__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[9];

  v2[8] = *MEMORY[0x1E0C80C00];
  if (!_obsoleteAccountTypeIDsToRemove__obsolteAccountTypeIDs)
  {
    v2[0] = CFSTR("com.apple.twitter");
    v2[1] = CFSTR("com.apple.facebook");
    v2[2] = CFSTR("com.apple.sinaweibo");
    v2[3] = CFSTR("com.apple.account.tencentweibo");
    v2[4] = CFSTR("com.apple.flickr");
    v2[5] = CFSTR("com.apple.vimeo");
    v2[6] = CFSTR("com.apple.linkedin");
    v2[7] = CFSTR("com.apple.account.osxserver");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 8);
    v0 = objc_claimAutoreleasedReturnValue();
    v1 = (void *)_obsoleteAccountTypeIDsToRemove__obsolteAccountTypeIDs;
    _obsoleteAccountTypeIDsToRemove__obsolteAccountTypeIDs = v0;

  }
}

- (void)removeObsoleteAccounts:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  os_signpost_id_t v18;
  uint64_t v19;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1A2BCD000, "accounts/remove-obsolete-accounts", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _ACSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _ACSignpostCreate(v6);
  v9 = v8;

  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "RemoveObsoleteAccounts", (const char *)&unk_1A2C2C35B, buf, 2u);
  }

  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore removeObsoleteAccounts:].cold.1();

  +[ACAccountStore _obsoleteAccountTypeIDsToRemove](ACAccountStore, "_obsoleteAccountTypeIDsToRemove");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _ACLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v13;
    _os_log_impl(&dword_1A2BCD000, v14, OS_LOG_TYPE_DEFAULT, "\"Will remove obsolete accounts with type identifiers %@\", buf, 0xCu);
  }

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __41__ACAccountStore_removeObsoleteAccounts___block_invoke;
  v16[3] = &unk_1E4892FC0;
  v16[4] = self;
  v18 = v7;
  v19 = v9;
  v15 = v4;
  v17 = v15;
  -[ACAccountStore accountsWithAccountTypeIdentifiers:completion:](self, "accountsWithAccountTypeIdentifiers:completion:", v13, v16);

  os_activity_scope_leave(&state);
}

void __41__ACAccountStore_removeObsoleteAccounts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  __int128 v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(a2, "mutableCopy");
  _ACLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v6;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1A2BCD000, v7, OS_LOG_TYPE_DEFAULT, "\"Fetched obsolete accounts %@ error %@\", buf, 0x16u);
  }

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__ACAccountStore_removeObsoleteAccounts___block_invoke_196;
  v9[3] = &unk_1E48930D8;
  v8 = *(void **)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  v12 = *(_OWORD *)(a1 + 48);
  v11 = v8;
  objc_msgSend(v10, "_removeObsoleteAccountsInternal:completion:", v6, v9);

}

void __41__ACAccountStore_removeObsoleteAccounts___block_invoke_196(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  __int128 v12;
  char v13;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __41__ACAccountStore_removeObsoleteAccounts___block_invoke_2;
  block[3] = &unk_1E48930B0;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  block[1] = 3221225472;
  v12 = *(_OWORD *)(a1 + 48);
  v13 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __41__ACAccountStore_removeObsoleteAccounts___block_invoke_2(uint64_t a1)
{
  unint64_t Nanoseconds;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  const __CFString *v6;
  const __CFString *v7;
  NSObject *v8;
  uint64_t result;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  Nanoseconds = _ACSignpostGetNanoseconds(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  _ACSignpostLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (*(_BYTE *)(a1 + 64))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    v7 = *(const __CFString **)(a1 + 32);
    if (!v7)
      v7 = &stru_1E4894AE8;
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v4, OS_SIGNPOST_INTERVAL_END, v5, "RemoveObsoleteAccounts", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  _ACSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(const __CFString **)(a1 + 48);
    v11 = CFSTR("YES");
    v12 = *(const __CFString **)(a1 + 32);
    if (!*(_BYTE *)(a1 + 64))
      v11 = CFSTR("NO");
    v14 = 134218754;
    v15 = v10;
    v13 = &stru_1E4894AE8;
    v16 = 2048;
    v17 = (double)Nanoseconds / 1000000000.0;
    v18 = 2112;
    v19 = v11;
    if (v12)
      v13 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_debug_impl(&dword_1A2BCD000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: RemoveObsoleteAccounts %@%@", (uint8_t *)&v14, 0x2Au);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)_removeObsoleteAccountsInternal:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  ACAccountStore *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v29 = 0;
    -[ACAccountStore dataclassActionsForAccountDeletion:error:](self, "dataclassActionsForAccountDeletion:error:", v8, &v29);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v29;
    _ACLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v31 = v8;
      v32 = 2112;
      v33 = v9;
      v34 = 2112;
      v35 = v10;
      _os_log_impl(&dword_1A2BCD000, v11, OS_LOG_TYPE_DEFAULT, "\"Gathered account %@ potential dataclass actions for deletion %@ error %@\", buf, 0x20u);
    }
    v19 = v10;

    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __61__ACAccountStore__removeObsoleteAccountsInternal_completion___block_invoke;
    v26[3] = &unk_1E4893958;
    v13 = v12;
    v27 = v13;
    v14 = v8;
    v28 = v14;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v26);
    objc_msgSend(v14, "accountType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.account.osxserver"));

    if (v17)
      -[ACAccountStore _removeObsoleteOSXServerAccountForiOS:](self, "_removeObsoleteOSXServerAccountForiOS:", v14);
    _ACLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v31 = v14;
      v32 = 2112;
      v33 = v13;
      _os_log_impl(&dword_1A2BCD000, v18, OS_LOG_TYPE_DEFAULT, "\"Will remove obsolete account %@ with dataclass actions %@\", buf, 0x16u);
    }

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __61__ACAccountStore__removeObsoleteAccountsInternal_completion___block_invoke_198;
    v20[3] = &unk_1E4893980;
    v21 = v14;
    v22 = 0;
    v23 = self;
    v24 = v6;
    v25 = v7;
    -[ACAccountStore removeAccount:withDataclassActions:completion:](self, "removeAccount:withDataclassActions:completion:", v21, v13, v20);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 1, 0);
  }

}

void __61__ACAccountStore__removeObsoleteAccountsInternal_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
      if (objc_msgSend(v11, "type", (_QWORD)v13) == 3)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v12 = v11;

    if (!v12)
      goto LABEL_12;
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, v5);
  }
  else
  {
LABEL_9:

LABEL_12:
    _ACLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __61__ACAccountStore__removeObsoleteAccountsInternal_completion___block_invoke_cold_1();
  }

}

void __61__ACAccountStore__removeObsoleteAccountsInternal_completion___block_invoke_198(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _ACLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v30 = v7;
    v31 = 2112;
    v32 = v8;
    v33 = 2112;
    v34 = v5;
    _os_log_impl(&dword_1A2BCD000, v6, OS_LOG_TYPE_DEFAULT, "\"Did remove obsolete account %@ with success %@ error %@\", buf, 0x20u);

  }
  if ((_DWORD)a2)
  {
    v22 = v5;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = *(id *)(a1 + 40);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v13);
          v15 = *(void **)(a1 + 48);
          v23 = 0;
          v16 = objc_msgSend(v15, "saveVerifiedAccount:error:", v14, &v23);
          v17 = v23;
          _ACLogSystem();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v16)
          {
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v14, "accountType");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "identifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v30 = v21;
              _os_log_impl(&dword_1A2BCD000, v19, OS_LOG_TYPE_DEFAULT, "\"Successfully saved macOSServer child account: %@\", buf, 0xCu);

            }
          }
          else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v30 = v17;
            _os_log_error_impl(&dword_1A2BCD000, v19, OS_LOG_TYPE_ERROR, "\"Failed to save macOSServer child account. Error: %@\", buf, 0xCu);
          }

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v11);
    }

    v5 = v22;
  }
  objc_msgSend(*(id *)(a1 + 56), "removeObjectAtIndex:", 0);
  objc_msgSend(*(id *)(a1 + 48), "_removeObsoleteAccountsInternal:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

- (id)_removeObsoleteOSXServerAccountForMacOS:(id)a3
{
  id v3;
  uint64_t i;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
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
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t m;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t n;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  id v84;
  id obj;
  uint64_t v86;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _BYTE v118[128];
  _QWORD v119[3];
  _QWORD v120[3];
  _BYTE v121[128];
  _QWORD v122[4];
  _QWORD v123[4];
  _BYTE v124[5];
  uint8_t v125[128];
  uint8_t buf[4];
  void *v127;
  _BYTE v128[128];
  _BYTE v129[128];
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v84 = (id)objc_opt_new();
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  objc_msgSend(v3, "childAccounts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v129, 16);
  if (v88)
  {
    v86 = *(_QWORD *)v115;
    v90 = v3;
    do
    {
      for (i = 0; i != v88; i = v60 + 1)
      {
        if (*(_QWORD *)v115 != v86)
          objc_enumerationMutation(obj);
        v93 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * i);
        objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("Hostname"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v89 = i;
        if (v5)
        {
          v7 = v5;
        }
        else
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Hostname"));
          v7 = (id)objc_claimAutoreleasedReturnValue();
        }
        v8 = v7;

        objc_msgSend(v93, "accountType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACAccountStore accountsWithAccountType:](self, "accountsWithAccountType:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v112 = 0u;
        v113 = 0u;
        v110 = 0u;
        v111 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v110, v128, 16);
        v91 = v8;
        v92 = v11;
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v111;
          while (2)
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v111 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * v15);
              objc_msgSend(v16, "parentAccount");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17
                || (objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Hostname")),
                    v17 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v17, "compare:options:", v8, 1)))
              {

              }
              else
              {
                objc_msgSend(v16, "username");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v93, "username");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                if (!objc_msgSend(v18, "compare:options:", v19, 1))
                {

                  v8 = v91;
                  v11 = v92;
LABEL_41:
                  _ACLogSystem();
                  v52 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v16, "identifier");
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v127 = v59;
                    _os_log_impl(&dword_1A2BCD000, v52, OS_LOG_TYPE_DEFAULT, "\"Found a matching existing account %@\", buf, 0xCu);

                  }
                  v24 = v11;
                  v3 = v90;
                  v60 = v89;
                  goto LABEL_71;
                }
                objc_msgSend(v16, "username");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v90, "qualifiedUsername");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v20, "compare:options:", v21, 1);

                v8 = v91;
                v11 = v92;
                if (!v22)
                  goto LABEL_41;
              }
              ++v15;
            }
            while (v13 != v15);
            v23 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v110, v128, 16);
            v13 = v23;
            if (v23)
              continue;
            break;
          }
        }

        objc_msgSend(v93, "portableCopy");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setAuthenticationType:", 0);
        objc_msgSend(v24, "setParentAccount:", 0);
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "UUIDString");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setIdentifier:", v26);

        v3 = v90;
        objc_msgSend(v90, "internalCredential");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(v27, "copy");
        objc_msgSend(v24, "setCredential:", v28);

        objc_msgSend(v90, "internalCredential");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "credentialType");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v30, "copy");
        objc_msgSend(v24, "setCredentialType:", v31);

        objc_msgSend(v90, "authenticationType");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend(v32, "copy");
        objc_msgSend(v24, "setAuthenticationType:", v33);

        objc_msgSend(v24, "setSupportsAuthentication:", objc_msgSend(v90, "supportsAuthentication"));
        objc_msgSend(v24, "setAuthenticated:", objc_msgSend(v90, "isAuthenticated"));
        objc_msgSend(v90, "username");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)objc_msgSend(v34, "copy");
        objc_msgSend(v24, "setUsername:", v35);

        objc_msgSend(v90, "accountDescription");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)objc_msgSend(v36, "copy");
        objc_msgSend(v24, "setAccountDescription:", v37);

        v38 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v90, "owningBundleID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "stringWithFormat:", CFSTR("%@.migrator"), v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setOwningBundleID:", v40);

        v108 = 0u;
        v109 = 0u;
        v106 = 0u;
        v107 = 0u;
        objc_msgSend(v93, "enabledDataclasses");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v106, v125, 16);
        if (v42)
        {
          v43 = v42;
          v44 = *(_QWORD *)v107;
          do
          {
            for (j = 0; j != v43; ++j)
            {
              if (*(_QWORD *)v107 != v44)
                objc_enumerationMutation(v41);
              objc_msgSend(v24, "setEnabled:forDataclass:", 1, *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * j));
            }
            v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v106, v125, 16);
          }
          while (v43);
        }

        v104 = 0u;
        v105 = 0u;
        v102 = 0u;
        v103 = 0u;
        objc_msgSend(v93, "provisionedDataclasses");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v102, v124, 16);
        if (v47)
        {
          v48 = v47;
          v49 = *(_QWORD *)v103;
          do
          {
            for (k = 0; k != v48; ++k)
            {
              if (*(_QWORD *)v103 != v49)
                objc_enumerationMutation(v46);
              objc_msgSend(v24, "setProvisioned:forDataclass:", 1, *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * k));
            }
            v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v102, v124, 16);
          }
          while (v48);
        }

        objc_msgSend(v93, "accountType");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "identifier");
        v52 = objc_claimAutoreleasedReturnValue();

        if (-[NSObject isEqualToString:](v52, "isEqualToString:", CFSTR("com.apple.account.IMAP")))
        {
          v122[0] = CFSTR("ACPropertyFullName");
          v122[1] = CFSTR("EmailAliases");
          v123[0] = CFSTR("ACPropertyFullName");
          v123[1] = CFSTR("EmailAliases");
          v122[2] = CFSTR("imapHostname");
          v122[3] = CFSTR("EmailAddress");
          v123[2] = CFSTR("Hostname");
          v123[3] = CFSTR("IdentityEmailAddress");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v123, v122, 4);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "dataclassProperties");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("com.apple.Dataclass.Mail"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          if (v55)
          {
            objc_msgSend(v90, "dataclassProperties");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("com.apple.Dataclass.Mail"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = (void *)objc_msgSend(v57, "mutableCopy");

          }
          else
          {
            v58 = (void *)objc_opt_new();
          }

          v100 = 0u;
          v101 = 0u;
          v98 = 0u;
          v99 = 0u;
          v66 = v53;
          v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v98, v121, 16);
          if (v67)
          {
            v68 = v67;
            v69 = *(_QWORD *)v99;
            do
            {
              for (m = 0; m != v68; ++m)
              {
                if (*(_QWORD *)v99 != v69)
                  objc_enumerationMutation(v66);
                v71 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * m);
                objc_msgSend(v58, "objectForKeyedSubscript:", v71);
                v72 = (void *)objc_claimAutoreleasedReturnValue();

                if (v72)
                {
                  objc_msgSend(v58, "objectForKeyedSubscript:", v71);
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v66, "objectForKeyedSubscript:", v71);
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "setAccountProperty:forKey:", v73, v74);

                }
              }
              v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v98, v121, 16);
            }
            while (v68);
            goto LABEL_68;
          }
          goto LABEL_69;
        }
        v60 = v89;
        v11 = v92;
        if (-[NSObject isEqualToString:](v52, "isEqualToString:", CFSTR("com.apple.account.SMTP")))
        {
          v119[0] = CFSTR("EmailAddress");
          v119[1] = CFSTR("smtpHostname");
          v120[0] = CFSTR("IdentityEmailAddress");
          v120[1] = CFSTR("Hostname");
          v119[2] = CFSTR("smtpRequiresSSL");
          v120[2] = CFSTR("SSLEnabled");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v120, v119, 3);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "dataclassProperties");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("com.apple.Dataclass.Mail"));
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          if (v63)
          {
            objc_msgSend(v90, "dataclassProperties");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("com.apple.Dataclass.Mail"));
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = (void *)objc_msgSend(v65, "mutableCopy");

          }
          else
          {
            v58 = (void *)objc_opt_new();
          }

          v96 = 0u;
          v97 = 0u;
          v94 = 0u;
          v95 = 0u;
          v66 = v61;
          v75 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v94, v118, 16);
          if (v75)
          {
            v76 = v75;
            v77 = *(_QWORD *)v95;
            do
            {
              for (n = 0; n != v76; ++n)
              {
                if (*(_QWORD *)v95 != v77)
                  objc_enumerationMutation(v66);
                v79 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * n);
                objc_msgSend(v58, "objectForKeyedSubscript:", v79);
                v80 = (void *)objc_claimAutoreleasedReturnValue();

                if (v80)
                {
                  objc_msgSend(v58, "objectForKeyedSubscript:", v79);
                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v66, "objectForKeyedSubscript:", v79);
                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "setAccountProperty:forKey:", v81, v82);

                }
              }
              v76 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v94, v118, 16);
            }
            while (v76);
LABEL_68:
            v3 = v90;
          }
LABEL_69:

          v60 = v89;
          v8 = v91;
          v11 = v92;
        }
        objc_msgSend(v84, "addObject:", v24);
LABEL_71:

      }
      v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v129, 16);
    }
    while (v88);
  }

  return v84;
}

- (void)_removeObsoleteOSXServerAccountForiOS:(id)a3
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t k;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t m;
  void *v59;
  _BOOL4 v60;
  id v61;
  NSObject *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  id obj;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  id v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint8_t buf[4];
  id v99;
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("MCAccountIsManaged"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) == 0)
  {
    v71 = (void *)objc_opt_new();
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    objc_msgSend(v3, "childAccounts");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v66 = v3;
    v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v104, 16);
    if (v70)
    {
      v69 = *(_QWORD *)v95;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v95 != v69)
            objc_enumerationMutation(obj);
          v72 = v6;
          v7 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * v6);
          objc_msgSend(v7, "enabledDataclasses");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = (void *)objc_msgSend(v8, "copy");

          objc_msgSend(v7, "provisionedDataclasses");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)objc_msgSend(v10, "copy");

          objc_msgSend(v7, "setAuthenticationType:", 0);
          objc_msgSend(v7, "setParentAccount:", 0);
          objc_msgSend(v3, "internalCredential");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v12, "copy");
          objc_msgSend(v7, "setCredential:", v13);

          objc_msgSend(v3, "internalCredential");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "credentialType");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v15, "copy");
          objc_msgSend(v7, "setCredentialType:", v16);

          objc_msgSend(v3, "authenticationType");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v17, "copy");
          objc_msgSend(v7, "setAuthenticationType:", v18);

          objc_msgSend(v7, "setSupportsAuthentication:", objc_msgSend(v3, "supportsAuthentication"));
          objc_msgSend(v7, "setAuthenticated:", objc_msgSend(v3, "isAuthenticated"));
          objc_msgSend(v3, "username");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(v19, "copy");
          objc_msgSend(v7, "setUsername:", v20);

          objc_msgSend(v3, "accountDescription");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_msgSend(v21, "copy");
          objc_msgSend(v7, "setAccountDescription:", v22);

          v23 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v3, "owningBundleID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringWithFormat:", CFSTR("%@.migrator"), v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setOwningBundleID:", v25);

          v92 = 0u;
          v93 = 0u;
          v90 = 0u;
          v91 = 0u;
          v26 = v9;
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v90, v103, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v91;
            do
            {
              for (i = 0; i != v28; ++i)
              {
                if (*(_QWORD *)v91 != v29)
                  objc_enumerationMutation(v26);
                objc_msgSend(v7, "setEnabled:forDataclass:", 1, *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * i));
              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v90, v103, 16);
            }
            while (v28);
          }

          v88 = 0u;
          v89 = 0u;
          v86 = 0u;
          v87 = 0u;
          v31 = v11;
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v86, v102, 16);
          if (v32)
          {
            v33 = v32;
            v34 = *(_QWORD *)v87;
            do
            {
              for (j = 0; j != v33; ++j)
              {
                if (*(_QWORD *)v87 != v34)
                  objc_enumerationMutation(v31);
                objc_msgSend(v7, "setProvisioned:forDataclass:", 1, *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * j));
              }
              v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v86, v102, 16);
            }
            while (v33);
          }

          objc_msgSend(v7, "accountType");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "identifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v37, "isEqualToString:", CFSTR("com.apple.account.IMAPMail")))
          {
            -[ACAccountStore accountTypeWithAccountTypeIdentifier:](self, "accountTypeWithAccountTypeIdentifier:", CFSTR("com.apple.account.IMAP"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setAccountType:", v38);

            objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Hostname"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = v39;
            if (v39)
            {
              v41 = v39;
            }
            else
            {
              objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Hostname"));
              v41 = (id)objc_claimAutoreleasedReturnValue();
            }
            v42 = v41;

            v43 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v3, "username");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "stringWithFormat:", CFSTR("%@:%@"), v42, v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v7, "setAccountProperty:forKey:", v45, CFSTR("SMTPIdentifier"));
            objc_msgSend(v7, "setAccountProperty:forKey:", CFSTR("IMAPAccount"), CFSTR("Class"));
            objc_msgSend(v7, "setAccountProperty:forKey:", CFSTR("IMAP"), CFSTR("Protocol"));
            objc_msgSend(v7, "setAccountProperty:forKey:", &unk_1E48A1980, CFSTR("SSLEnabled"));
            if (objc_msgSend(v3, "isEnabledForDataclass:", CFSTR("com.apple.Dataclass.Notes")))
              objc_msgSend(v7, "setEnabled:forDataclass:", 1, CFSTR("com.apple.Dataclass.Notes"));
            if (objc_msgSend(v3, "isProvisionedForDataclass:", CFSTR("com.apple.Dataclass.Notes")))
              objc_msgSend(v7, "setProvisioned:forDataclass:", 1, CFSTR("com.apple.Dataclass.Notes"));
            -[ACAccountStore _createSMTPAccountForServerAccount:](self, "_createSMTPAccountForServerAccount:", v3);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "addObject:", v46);

          }
          if (objc_msgSend(v37, "isEqualToString:", CFSTR("com.apple.account.IMAPNotes")))
          {
            v84 = 0u;
            v85 = 0u;
            v82 = 0u;
            v83 = 0u;
            objc_msgSend(v3, "childAccounts");
            v74 = (id)objc_claimAutoreleasedReturnValue();
            v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v82, v101, 16);
            if (v76)
            {
              v75 = *(_QWORD *)v83;
              v68 = v37;
              while (2)
              {
                for (k = 0; k != v76; ++k)
                {
                  if (*(_QWORD *)v83 != v75)
                    objc_enumerationMutation(v74);
                  v48 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * k);
                  objc_msgSend(v48, "accountType");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "identifier");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v50, "isEqualToString:", CFSTR("com.apple.account.IMAPMail")))
                  {

LABEL_42:
                    objc_msgSend(v7, "setParentAccount:", v48);
                    objc_msgSend(v7, "setAuthenticationType:", CFSTR("parent"));
                    v3 = v66;
                    v37 = v68;
                    if (objc_msgSend(v66, "isProvisionedForDataclass:", CFSTR("com.apple.Dataclass.Notes")))objc_msgSend(v7, "setProvisioned:forDataclass:", 1, CFSTR("com.apple.Dataclass.Notes"));
                    goto LABEL_44;
                  }
                  objc_msgSend(v48, "accountType");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "identifier");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  v53 = objc_msgSend(v52, "isEqualToString:", CFSTR("com.apple.account.IMAP"));

                  if (v53)
                    goto LABEL_42;
                }
                v3 = v66;
                v37 = v68;
                v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v82, v101, 16);
                if (v76)
                  continue;
                break;
              }
            }
LABEL_44:

          }
          objc_msgSend(v71, "addObject:", v7);

          v6 = v72 + 1;
        }
        while (v72 + 1 != v70);
        v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v104, 16);
      }
      while (v70);
    }

    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v54 = v71;
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v78, v100, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v79;
      do
      {
        for (m = 0; m != v56; ++m)
        {
          if (*(_QWORD *)v79 != v57)
            objc_enumerationMutation(v54);
          v59 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * m);
          v77 = 0;
          v60 = -[ACAccountStore saveVerifiedAccount:error:](self, "saveVerifiedAccount:error:", v59, &v77);
          v61 = v77;
          _ACLogSystem();
          v62 = objc_claimAutoreleasedReturnValue();
          v63 = v62;
          if (v60)
          {
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v59, "accountType");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "identifier");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v99 = v65;
              _os_log_impl(&dword_1A2BCD000, v63, OS_LOG_TYPE_DEFAULT, "\"Successfully saved macOSServer child account: %@\", buf, 0xCu);

            }
          }
          else if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v99 = v61;
            _os_log_error_impl(&dword_1A2BCD000, v63, OS_LOG_TYPE_ERROR, "\"Failed to save macOSServer child account. Error: %@\", buf, 0xCu);
          }

        }
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v78, v100, 16);
      }
      while (v56);
    }

    v3 = v66;
  }

}

- (id)_createSMTPAccountForServerAccount:(id)a3
{
  id v4;
  ACAccount *v5;
  void *v6;
  ACAccount *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  v5 = [ACAccount alloc];
  -[ACAccountStore accountTypeWithAccountTypeIdentifier:](self, "accountTypeWithAccountTypeIdentifier:", CFSTR("com.apple.account.SMTP"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ACAccount initWithAccountType:](v5, "initWithAccountType:", v6);

  objc_msgSend(v4, "internalCredential");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  -[ACAccount setCredential:](v7, "setCredential:", v9);

  objc_msgSend(v4, "credentialType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount setCredentialType:](v7, "setCredentialType:", v10);

  objc_msgSend(v4, "username");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount setUsername:](v7, "setUsername:", v11);

  -[ACAccount setAuthenticated:](v7, "setAuthenticated:", 1);
  -[ACAccount setSupportsAuthentication:](v7, "setSupportsAuthentication:", 1);
  objc_msgSend(v4, "accountDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount setAccountDescription:](v7, "setAccountDescription:", v12);

  -[ACAccount setActive:](v7, "setActive:", 1);
  -[ACAccount setEnabled:forDataclass:](v7, "setEnabled:forDataclass:", 1, CFSTR("com.apple.Dataclass.Mail"));
  -[ACAccount setProvisioned:forDataclass:](v7, "setProvisioned:forDataclass:", 1, CFSTR("com.apple.Dataclass.Mail"));
  objc_msgSend(v4, "dataclassProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("com.apple.Dataclass.Mail"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v4, "dataclassProperties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("com.apple.Dataclass.Mail"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

  }
  else
  {
    v17 = (void *)objc_opt_new();
  }

  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("OutgoingMailServerAuthentication"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount setAccountProperty:forKey:](v7, "setAccountProperty:forKey:", v18, CFSTR("AuthenticationScheme"));

  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("smtpHostname"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount setAccountProperty:forKey:](v7, "setAccountProperty:forKey:", v19, CFSTR("Hostname"));

  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("smtpPort"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount setAccountProperty:forKey:](v7, "setAccountProperty:forKey:", v20, CFSTR("PortNumber"));

  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("smtpRequiresSSL"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount setAccountProperty:forKey:](v7, "setAccountProperty:forKey:", v21, CFSTR("SSLEnabled"));

  -[ACAccount setAccountProperty:forKey:](v7, "setAccountProperty:forKey:", CFSTR("SMTPAccount"), CFSTR("Class"));
  -[ACAccount setAccountProperty:forKey:](v7, "setAccountProperty:forKey:", CFSTR("SMTP"), CFSTR("Protocol"));
  -[ACAccount setAccountProperty:forKey:](v7, "setAccountProperty:forKey:", &unk_1E48A1980, CFSTR("ShouldUseAuthentication"));

  return v7;
}

- (void)handleURL:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  os_signpost_id_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  os_signpost_id_t v22;
  uint64_t v23;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1A2BCD000, "accounts/handle-url", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _ACSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _ACSignpostCreate(v6);
  v9 = v8;

  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v4;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "HandleURL", "%@", buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore handleURL:].cold.1();

  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __28__ACAccountStore_handleURL___block_invoke;
  v20[3] = &unk_1E48939A8;
  v21 = v4;
  v22 = v7;
  v23 = v9;
  v16[0] = v14;
  v16[1] = 3221225472;
  v16[2] = __28__ACAccountStore_handleURL___block_invoke_210;
  v16[3] = &unk_1E48939D0;
  v15 = v21;
  v17 = v15;
  v18 = v7;
  v19 = v9;
  ac_dispatch_remote(v13, v20, v16);

  os_activity_scope_leave(&state);
}

void __28__ACAccountStore_handleURL___block_invoke(_QWORD *a1, void *a2)
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(a2, "handleURL:", a1[4]);
  _ACSignpostGetNanoseconds(a1[5], a1[6]);
  _ACSignpostLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = a1[5];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v4, OS_SIGNPOST_INTERVAL_END, v5, "HandleURL", (const char *)&unk_1A2C2C35B, v7, 2u);
  }

  _ACSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __28__ACAccountStore_handleURL___block_invoke_cold_1();

}

void __28__ACAccountStore_handleURL___block_invoke_210(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  uint8_t v13[16];

  _ACLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __28__ACAccountStore_handleURL___block_invoke_210_cold_2(a1, v2, v3, v4, v5, v6, v7, v8);

  _ACSignpostGetNanoseconds(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  _ACSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 40);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v10, OS_SIGNPOST_INTERVAL_END, v11, "HandleURL", (const char *)&unk_1A2C2C35B, v13, 2u);
  }

  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    __28__ACAccountStore_handleURL___block_invoke_cold_1();

}

- (void)reportTelemetryForLandmarkEvent:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  void *v6;

  v4 = (void (**)(id, _QWORD, void *))a3;
  _ACLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[ACAccountStore reportTelemetryForLandmarkEvent:].cold.1();

  -[ACAccountStore _connectionFailureError](self, "_connectionFailureError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, 0, v6);

}

- (void)scheduleBackupIfNonexistent:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;
  os_signpost_id_t v24;
  uint64_t v25;
  uint8_t buf[16];
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_1A2BCD000, "accounts/schedule-backup", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _ACSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _ACSignpostCreate(v6);
  v9 = v8;

  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "ScheduleBackup", (const char *)&unk_1A2C2C35B, buf, 2u);
  }

  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore scheduleBackupIfNonexistent:].cold.1();

  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __46__ACAccountStore_scheduleBackupIfNonexistent___block_invoke;
  v22[3] = &unk_1E48930D8;
  v22[4] = self;
  v24 = v7;
  v25 = v9;
  v14 = v4;
  v23 = v14;
  v15 = (void *)MEMORY[0x1A858A038](v22);
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __46__ACAccountStore_scheduleBackupIfNonexistent___block_invoke_211;
  v20[3] = &unk_1E48934E0;
  v21 = v15;
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __46__ACAccountStore_scheduleBackupIfNonexistent___block_invoke_213;
  v18[3] = &unk_1E48924C8;
  v17 = v21;
  v18[4] = self;
  v19 = v17;
  ac_dispatch_remote(v16, v20, v18);

  os_activity_scope_leave(&state);
}

void __46__ACAccountStore_scheduleBackupIfNonexistent___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  __int128 v12;
  char v13;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __46__ACAccountStore_scheduleBackupIfNonexistent___block_invoke_2;
  block[3] = &unk_1E48930B0;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  block[1] = 3221225472;
  v12 = *(_OWORD *)(a1 + 48);
  v13 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __46__ACAccountStore_scheduleBackupIfNonexistent___block_invoke_2(uint64_t a1)
{
  unint64_t Nanoseconds;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  const __CFString *v6;
  const __CFString *v7;
  NSObject *v8;
  uint64_t result;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  Nanoseconds = _ACSignpostGetNanoseconds(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  _ACSignpostLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (*(_BYTE *)(a1 + 64))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    v7 = *(const __CFString **)(a1 + 32);
    if (!v7)
      v7 = &stru_1E4894AE8;
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v4, OS_SIGNPOST_INTERVAL_END, v5, "ScheduleBackup", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  _ACSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(const __CFString **)(a1 + 48);
    v11 = CFSTR("YES");
    v12 = *(const __CFString **)(a1 + 32);
    if (!*(_BYTE *)(a1 + 64))
      v11 = CFSTR("NO");
    v14 = 134218754;
    v15 = v10;
    v13 = &stru_1E4894AE8;
    v16 = 2048;
    v17 = (double)Nanoseconds / 1000000000.0;
    v18 = 2112;
    v19 = v11;
    if (v12)
      v13 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_debug_impl(&dword_1A2BCD000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: ScheduleBackup %@%@", (uint8_t *)&v14, 0x2Au);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32));
  return result;
}

void __46__ACAccountStore_scheduleBackupIfNonexistent___block_invoke_211(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__ACAccountStore_scheduleBackupIfNonexistent___block_invoke_2_212;
  v3[3] = &unk_1E48934B8;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "scheduleBackupIfNonexistent:", v3);

}

void __46__ACAccountStore_scheduleBackupIfNonexistent___block_invoke_2_212(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  _ACLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A2BCD000, v6, OS_LOG_TYPE_DEFAULT, "\"Backup scheduled (if nonexistent) successfully!\", v7, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __46__ACAccountStore_scheduleBackupIfNonexistent___block_invoke_213(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)resetDatabaseToVersion:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  os_signpost_id_t v29;
  uint64_t v30;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1A2BCD000, "accounts/reset-database-to-version", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _ACSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _ACSignpostCreate(v9);
  v12 = v11;

  _ACSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ResetDatabaseToVersion", "%@", buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore resetDatabaseToVersion:withCompletion:].cold.1();

  v16 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __56__ACAccountStore_resetDatabaseToVersion_withCompletion___block_invoke;
  v27[3] = &unk_1E48930D8;
  v27[4] = self;
  v29 = v10;
  v30 = v12;
  v17 = v7;
  v28 = v17;
  v18 = (void *)MEMORY[0x1A858A038](v27);
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v16;
  v24[1] = 3221225472;
  v24[2] = __56__ACAccountStore_resetDatabaseToVersion_withCompletion___block_invoke_214;
  v24[3] = &unk_1E48924A0;
  v20 = v6;
  v25 = v20;
  v26 = v18;
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __56__ACAccountStore_resetDatabaseToVersion_withCompletion___block_invoke_2_215;
  v22[3] = &unk_1E48924C8;
  v21 = v26;
  v22[4] = self;
  v23 = v21;
  ac_dispatch_remote_sync(v19, v24, v22);

  os_activity_scope_leave(&state);
}

void __56__ACAccountStore_resetDatabaseToVersion_withCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  __int128 v12;
  char v13;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __56__ACAccountStore_resetDatabaseToVersion_withCompletion___block_invoke_2;
  block[3] = &unk_1E48930B0;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  block[1] = 3221225472;
  v12 = *(_OWORD *)(a1 + 48);
  v13 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __56__ACAccountStore_resetDatabaseToVersion_withCompletion___block_invoke_2(uint64_t a1)
{
  unint64_t Nanoseconds;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  const __CFString *v6;
  const __CFString *v7;
  NSObject *v8;
  uint64_t result;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  Nanoseconds = _ACSignpostGetNanoseconds(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  _ACSignpostLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (*(_BYTE *)(a1 + 64))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    v7 = *(const __CFString **)(a1 + 32);
    if (!v7)
      v7 = &stru_1E4894AE8;
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v4, OS_SIGNPOST_INTERVAL_END, v5, "ResetDatabaseToVersion", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  _ACSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(const __CFString **)(a1 + 48);
    v11 = CFSTR("YES");
    v12 = *(const __CFString **)(a1 + 32);
    if (!*(_BYTE *)(a1 + 64))
      v11 = CFSTR("NO");
    v14 = 134218754;
    v15 = v10;
    v13 = &stru_1E4894AE8;
    v16 = 2048;
    v17 = (double)Nanoseconds / 1000000000.0;
    v18 = 2112;
    v19 = v11;
    if (v12)
      v13 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_debug_impl(&dword_1A2BCD000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: ResetDatabaseToVersion %@%@", (uint8_t *)&v14, 0x2Au);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __56__ACAccountStore_resetDatabaseToVersion_withCompletion___block_invoke_214(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resetDatabaseToVersion:withCompletion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __56__ACAccountStore_resetDatabaseToVersion_withCompletion___block_invoke_2_215(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)shutdownAccountsD:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;
  os_signpost_id_t v24;
  uint64_t v25;
  uint8_t buf[16];
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_1A2BCD000, "accounts/shutdown-accountsd", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _ACSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _ACSignpostCreate(v6);
  v9 = v8;

  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "ShutdownAccountsd", (const char *)&unk_1A2C2C35B, buf, 2u);
  }

  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ACAccountStore shutdownAccountsD:].cold.1();

  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __36__ACAccountStore_shutdownAccountsD___block_invoke;
  v22[3] = &unk_1E48930D8;
  v22[4] = self;
  v24 = v7;
  v25 = v9;
  v14 = v4;
  v23 = v14;
  v15 = (void *)MEMORY[0x1A858A038](v22);
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __36__ACAccountStore_shutdownAccountsD___block_invoke_216;
  v20[3] = &unk_1E48934E0;
  v21 = v15;
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __36__ACAccountStore_shutdownAccountsD___block_invoke_2_217;
  v18[3] = &unk_1E48924C8;
  v17 = v21;
  v18[4] = self;
  v19 = v17;
  ac_dispatch_remote_sync(v16, v20, v18);

  os_activity_scope_leave(&state);
}

void __36__ACAccountStore_shutdownAccountsD___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  __int128 v12;
  char v13;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __36__ACAccountStore_shutdownAccountsD___block_invoke_2;
  block[3] = &unk_1E48930B0;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  block[1] = 3221225472;
  v12 = *(_OWORD *)(a1 + 48);
  v13 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __36__ACAccountStore_shutdownAccountsD___block_invoke_2(uint64_t a1)
{
  unint64_t Nanoseconds;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  const __CFString *v6;
  const __CFString *v7;
  NSObject *v8;
  uint64_t result;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  Nanoseconds = _ACSignpostGetNanoseconds(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  _ACSignpostLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (*(_BYTE *)(a1 + 64))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    v7 = *(const __CFString **)(a1 + 32);
    if (!v7)
      v7 = &stru_1E4894AE8;
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v4, OS_SIGNPOST_INTERVAL_END, v5, "ShutdownAccountsd", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  _ACSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(const __CFString **)(a1 + 48);
    v11 = CFSTR("YES");
    v12 = *(const __CFString **)(a1 + 32);
    if (!*(_BYTE *)(a1 + 64))
      v11 = CFSTR("NO");
    v14 = 134218754;
    v15 = v10;
    v13 = &stru_1E4894AE8;
    v16 = 2048;
    v17 = (double)Nanoseconds / 1000000000.0;
    v18 = 2112;
    v19 = v11;
    if (v12)
      v13 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_debug_impl(&dword_1A2BCD000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: ShutdownAccountsd %@%@", (uint8_t *)&v14, 0x2Au);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __36__ACAccountStore_shutdownAccountsD___block_invoke_216(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shutdownAccountsD:", *(_QWORD *)(a1 + 32));
}

void __36__ACAccountStore_shutdownAccountsD___block_invoke_2_217(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (unint64_t)generationForCacheSuffix:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[ACAccountStore _cache](self, "_cache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "generationForCacheSuffix:", v4);

  return v6;
}

- (id)accountsOfTypeID:(id)a3 customProperty:(id)a4 value:(id)a5 cacheSuffix:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  unint64_t Nanoseconds;
  NSObject *v29;
  NSObject *v30;
  os_signpost_id_t v31;
  const __CFString *v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  id v38;
  uint64_t v40;
  const __CFString *v41;
  const __CFString *v42;
  unint64_t v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[6];
  _QWORD v50[4];
  NSObject *v51;
  id v52;
  id v53;
  id v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t v57;
  const __CFString **v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  os_activity_scope_state_s state;
  uint8_t v70[128];
  uint8_t buf[4];
  os_signpost_id_t v72;
  __int16 v73;
  double v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  const __CFString *v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v44 = a4;
  v12 = a5;
  v13 = a6;
  v14 = _os_activity_create(&dword_1A2BCD000, "accounts/accounts-with-property-value-sync", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  v63 = 0;
  v64 = &v63;
  v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__0;
  v67 = __Block_byref_object_dispose__0;
  -[ACAccountStore _cache](self, "_cache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cachedAccountsForSuffix:", v13);
  v68 = (id)objc_claimAutoreleasedReturnValue();

  v57 = 0;
  v58 = (const __CFString **)&v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__0;
  v61 = __Block_byref_object_dispose__0;
  v62 = 0;
  if (v64[5])
  {
    _ACLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[ACAccountStore accountsOfTypeID:customProperty:value:cacheSuffix:error:].cold.2();
  }
  else
  {
    _ACSignpostLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = _ACSignpostCreate(v17);
    v20 = v19;

    _ACSignpostLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v43 = v18 - 1;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v18, "AccountsForPropertyValue", (const char *)&unk_1A2C2C35B, buf, 2u);
    }

    _ACSignpostLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[ACAccountStore accountsOfTypeID:customProperty:value:cacheSuffix:error:].cold.1();

    -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = MEMORY[0x1E0C809B0];
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __74__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_error___block_invoke;
    v50[3] = &unk_1E48939F8;
    v51 = v11;
    v52 = v44;
    v53 = v12;
    v26 = v13;
    v54 = v26;
    v55 = &v63;
    v56 = &v57;
    v49[0] = v25;
    v49[1] = 3221225472;
    v49[2] = __74__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_error___block_invoke_218;
    v49[3] = &unk_1E4892BA0;
    v49[4] = self;
    v49[5] = &v57;
    ac_dispatch_remote_sync(v24, v50, v49);

    if (v64[5])
    {
      -[ACAccountStore _cache](self, "_cache");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "cacheAccounts:forSuffix:", v64[5], v26);

    }
    Nanoseconds = _ACSignpostGetNanoseconds(v18, v20);
    _ACSignpostLogSystem();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v43 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      v31 = v64[5];
      v32 = v58[5];
      if (*(double *)&v32 == 0.0)
        *(double *)&v32 = COERCE_DOUBLE(&stru_1E4894AE8);
      *(_DWORD *)buf = 138412546;
      v72 = v31;
      v73 = 2112;
      v74 = *(double *)&v32;
      _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v30, OS_SIGNPOST_INTERVAL_END, v18, "AccountsForPropertyValue", "%@%@", buf, 0x16u);
    }

    _ACSignpostLogSystem();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      v40 = v64[5];
      v41 = v58[5];
      *(_DWORD *)buf = 134218754;
      v72 = v18;
      v73 = 2048;
      v74 = (double)Nanoseconds / 1000000000.0;
      v75 = 2112;
      v76 = v40;
      if (v41)
        v42 = v41;
      else
        v42 = &stru_1E4894AE8;
      v77 = 2112;
      v78 = v42;
      _os_log_debug_impl(&dword_1A2BCD000, v33, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsForPropertyValue %@%@", buf, 0x2Au);
    }

    v16 = v51;
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v34 = (id)v64[5];
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v45, v70, 16);
  if (v35)
  {
    v36 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v46 != v36)
          objc_enumerationMutation(v34);
        objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "_setAccountStore:", self, v43);
      }
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v45, v70, 16);
    }
    while (v35);
  }

  v38 = (id)v64[5];
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(&v63, 8);
  os_activity_scope_leave(&state);

  return v38;
}

uint64_t __74__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[4];
  __int128 v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_error___block_invoke_2;
  v7[3] = &unk_1E4893620;
  v8 = *(_OWORD *)(a1 + 64);
  return objc_msgSend(a2, "accountsWithTypeIdentifier:propertyKey:value:cacheSuffix:completion:", v2, v3, v4, v5, v7);
}

void __74__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _ACLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v6;

}

void __74__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_error___block_invoke_218(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)accountsOfTypeID:(id)a3 customProperty:(id)a4 value:(id)a5 cacheSuffix:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  uint64_t v24;
  os_signpost_id_t v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[5];
  void (**v33)(_QWORD, _QWORD, _QWORD);
  os_signpost_id_t v34;
  uint64_t v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  ACAccountStore *v41;
  void (**v42)(_QWORD, _QWORD, _QWORD);
  os_signpost_id_t v43;
  uint64_t v44;
  uint8_t buf[8];
  _QWORD v46[5];
  id v47;
  os_activity_scope_state_s state;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = _os_activity_create(&dword_1A2BCD000, "accounts/accounts-with-property-value", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v17, &state);
  if (v16)
  {
    v31 = v12;
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __79__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_completion___block_invoke;
    v46[3] = &unk_1E4892478;
    v46[4] = self;
    v47 = v16;
    v18 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A858A038](v46);
    -[ACAccountStore _cache](self, "_cache");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "cachedAccountsForSuffix:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      _ACLogSystem();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[ACAccountStore accountsOfTypeID:customProperty:value:cacheSuffix:completion:].cold.2();

      ((void (**)(_QWORD, void *, _QWORD))v18)[2](v18, v20, 0);
    }
    else
    {
      _ACSignpostLogSystem();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = _ACSignpostCreate(v22);
      v30 = v24;
      v25 = v23;

      _ACSignpostLogSystem();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "AccountsForPropertyValueSync", (const char *)&unk_1A2C2C35B, buf, 2u);
      }

      _ACSignpostLogSystem();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        -[ACAccountStore accountsOfTypeID:customProperty:value:cacheSuffix:completion:].cold.1();

      -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __79__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_completion___block_invoke_219;
      v36[3] = &unk_1E4893A20;
      v37 = v31;
      v38 = v13;
      v39 = v14;
      v40 = v15;
      v41 = self;
      v43 = v25;
      v44 = v30;
      v42 = v18;
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __79__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_completion___block_invoke_221;
      v32[3] = &unk_1E4892EF8;
      v32[4] = self;
      v33 = v42;
      v34 = v25;
      v35 = v30;
      ac_dispatch_remote(v29, v36, v32);

    }
    v12 = v31;
  }
  os_activity_scope_leave(&state);

}

void __79__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v10++), "_setAccountStore:", *(_QWORD *)(a1 + 32));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }
  v11 = *(void **)(a1 + 40);
  v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_completion___block_invoke_2;
  block[3] = &unk_1E4892450;
  v17 = v6;
  v18 = v11;
  v16 = v5;
  v13 = v6;
  v14 = v5;
  dispatch_async(v12, block);

}

uint64_t __79__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __79__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_completion___block_invoke_219(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  int8x16_t v8;
  _QWORD v9[4];
  int8x16_t v10;
  id v11;
  __int128 v12;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_completion___block_invoke_2_220;
  v9[3] = &unk_1E4892EA8;
  v8 = *(int8x16_t *)(a1 + 56);
  v7 = (id)v8.i64[0];
  v10 = vextq_s8(v8, v8, 8uLL);
  v12 = *(_OWORD *)(a1 + 80);
  v11 = *(id *)(a1 + 72);
  objc_msgSend(a2, "accountsWithTypeIdentifier:propertyKey:value:cacheSuffix:completion:", v4, v5, v6, v7, v9);

}

void __79__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_completion___block_invoke_2_220(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  NSObject *v7;
  unint64_t Nanoseconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  const __CFString *v12;
  NSObject *v13;
  void *v14;
  const __CFString *v15;
  int v16;
  id v17;
  __int16 v18;
  double v19;
  __int16 v20;
  id v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _ACLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_cache");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject cacheAccounts:forSuffix:](v7, "cacheAccounts:forSuffix:", v5, *(_QWORD *)(a1 + 40));
  }

  Nanoseconds = _ACSignpostGetNanoseconds(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  _ACSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 56);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v12 = &stru_1E4894AE8;
    if (v6)
      v12 = v6;
    v16 = 138412546;
    v17 = v5;
    v18 = 2112;
    v19 = *(double *)&v12;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v10, OS_SIGNPOST_INTERVAL_END, v11, "AccountsForPropertyValueSync", "%@%@", (uint8_t *)&v16, 0x16u);
  }

  _ACSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = *(void **)(a1 + 56);
    v16 = 134218754;
    v17 = v14;
    v15 = &stru_1E4894AE8;
    v18 = 2048;
    v19 = (double)Nanoseconds / 1000000000.0;
    v20 = 2112;
    v21 = v5;
    if (v6)
      v15 = v6;
    v22 = 2112;
    v23 = v15;
    _os_log_debug_impl(&dword_1A2BCD000, v13, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsForPropertyValueSync %@%@", (uint8_t *)&v16, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __79__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_completion___block_invoke_221(uint64_t a1, void *a2)
{
  __CFString *v3;
  uint64_t v4;
  void *v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  const __CFString *v10;
  NSObject *v11;
  uint64_t v12;
  const __CFString *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  double v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

  Nanoseconds = _ACSignpostGetNanoseconds(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  _ACSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 48);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = &stru_1E4894AE8;
    if (v3)
      v10 = v3;
    v14 = 138412546;
    v15 = 0;
    v16 = 2112;
    v17 = *(double *)&v10;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v8, OS_SIGNPOST_INTERVAL_END, v9, "AccountsForPropertyValueSync", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  _ACSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = *(_QWORD *)(a1 + 48);
    v14 = 134218754;
    v15 = v12;
    v13 = &stru_1E4894AE8;
    v16 = 2048;
    v17 = (double)Nanoseconds / 1000000000.0;
    v18 = 2112;
    v19 = 0;
    if (v3)
      v13 = v3;
    v20 = 2112;
    v21 = v13;
    _os_log_debug_impl(&dword_1A2BCD000, v11, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsForPropertyValueSync %@%@", (uint8_t *)&v14, 0x2Au);
  }

}

- (unsigned)_uidOfAccountsd
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__ACAccountStore__uidOfAccountsd__block_invoke;
  v4[3] = &unk_1E4892D80;
  v4[4] = &v5;
  ac_dispatch_remote_sync(v2, v4, &__block_literal_global_223);

  LODWORD(v2) = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __33__ACAccountStore__uidOfAccountsd__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__ACAccountStore__uidOfAccountsd__block_invoke_2;
  v3[3] = &unk_1E4893A48;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "uidOfAccountsd:", v3);
}

uint64_t __33__ACAccountStore__uidOfAccountsd__block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)_sanitizeOptionsDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AllowedSSLCertificates"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (id)objc_msgSend(v3, "mutableCopy");
    serializeSecCertificates(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("AllowedSSLCertificates"));

  }
  else
  {
    v5 = v3;
  }

  return v5;
}

- (id)_unsanitizeError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  BOOL v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a3;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NSURLErrorFailingURLPeerTrustErrorKey_AC_SANITIZED"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CB32E8];
  v8 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

  if (v8)
    v9 = v5 == 0;
  else
    v9 = 1;
  if (v9)
  {
    v10 = v3;
  }
  else
  {
    objc_msgSend(v3, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, CFSTR("NSURLErrorFailingURLPeerTrustErrorKey_AC_SANITIZED"));
    v13 = (void *)SecTrustDeserialize();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CB32F8]);

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("NSErrorPeerCertificateChainKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      unserializeSecCertificates(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("c"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("NSErrorPeerCertificateChainKey"));

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v7, objc_msgSend(v3, "code"), v12);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (ACNotifyAccountCache)_primaryAppleAccountCache
{
  return (ACNotifyAccountCache *)objc_getProperty(self, a2, 88, 1);
}

- (void)set_primaryAppleAccountCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void)set_testCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void)accountWithIdentifier:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: AccountWithIdentifierSync %@");
  OUTLINED_FUNCTION_0();
}

- (void)accountWithIdentifier:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: AccountWithIdentifier %@");
  OUTLINED_FUNCTION_0();
}

- (void)cachedAccountWithIdentifier:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: CachedAccountWithIdentifier %@");
  OUTLINED_FUNCTION_0();
}

- (void)accounts
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: AllAccountsSync ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __26__ACAccountStore_accounts__block_invoke_61_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(&dword_1A2BCD000, v0, v1, "\"Error connecting to remote account store!\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)accountsWithAccountType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: AccountsWithTypeSync %@");
  OUTLINED_FUNCTION_0();
}

- (void)accountsWithAccountType:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_4(&dword_1A2BCD000, v6, v4, "@\"Returning cached accounts of type %@: %@\", v5);

  OUTLINED_FUNCTION_15();
}

void __42__ACAccountStore_accountsWithAccountType___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1A2BCD000, v0, v1, "\"Error returned from daemon: %{public}@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)accountsWithAccountType:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: AccountsWithType %@");
  OUTLINED_FUNCTION_0();
}

- (void)accountsWithAccountType:completion:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_12(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_4(&dword_1A2BCD000, v6, v4, "@\"Returning cached accounts of type %@: %@\", v5);

  OUTLINED_FUNCTION_15();
}

- (void)allDataclasses
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: AllDataclasses ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)allAccountTypes
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: AllAccountTypes ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)visibleTopLevelAccountsWithAccountTypeIdentifiers:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: VisibleAccountsWithTypes %@");
  OUTLINED_FUNCTION_0();
}

- (void)hasAccountWithDescription:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: HasAccountWithDescription %@");
  OUTLINED_FUNCTION_0();
}

- (void)kerberosAccountsForDomainFromURL:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: KerberosAccounts %@");
  OUTLINED_FUNCTION_0();
}

- (void)isPushSupportedForAccount:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: PushSupported %@");
  OUTLINED_FUNCTION_0();
}

+ (void)accountsWithAccountTypeIdentifierExist:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: AccountsWithTypeExist %@");
  OUTLINED_FUNCTION_0();
}

+ (void)countOfAccountsWithAccountTypeIdentifier:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: AccountsWithTypeCount %@");
  OUTLINED_FUNCTION_0();
}

- (void)insertAccountType:withCompletionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: InsertAccountType %@");
  OUTLINED_FUNCTION_0();
}

- (void)removeAccountType:withCompletionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: RemoveAccountType %@");
  OUTLINED_FUNCTION_0();
}

- (void)canSaveAccount:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: CanSaveAccount ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)canSaveAccountsOfAccountTypeIdentifier:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: CanSaveAccountsWithType %@");
  OUTLINED_FUNCTION_0();
}

- (void)_saveAccount:verify:dataclassActions:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_1A2BCD000, v0, v1, "\"Calling daemon to save\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)_saveAccount:verify:dataclassActions:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_1A2BCD000, v0, v1, "\"Account not dirty. Continue\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)saveVerifiedAccount:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_1A2BCD000, v0, v1, "\"Account not dirty, nothin' a do...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)_checkSaveRateLimitForAccountType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)_checkSaveRateLimitForAccountType__saveRateLimiter, "maximum"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend((id)_checkSaveRateLimitForAccountType__saveRateLimiter, "timeInterval");
  objc_msgSend(v5, "numberWithDouble:", v6 / 60.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543874;
  v9 = a1;
  v10 = 2114;
  v11 = v4;
  v12 = 2114;
  v13 = v7;
  _os_log_fault_impl(&dword_1A2BCD000, a2, OS_LOG_TYPE_FAULT, " %{public}@: Exceeded %{public}@ saves per %{public}@ minute(s)", (uint8_t *)&v8, 0x20u);

}

- (void)accessKeysForAccountType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: AccessKeysForAccountType %@");
  OUTLINED_FUNCTION_0();
}

- (void)appPermissionsForAccountType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: AppPermissionsForAccountType %@");
  OUTLINED_FUNCTION_0();
}

- (void)setPermissionGranted:(uint64_t)a1 forBundleID:onAccountType:.cold.1(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a1;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_4(&dword_1A2BCD000, v1, v2, "END [%lld] %fs: PermitBundleWithAccountType ", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

- (void)clearAllPermissionsGrantedForAccountType:(uint64_t)a1 .cold.1(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a1;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_4(&dword_1A2BCD000, v1, v2, "END [%lld] %fs: ClearPermissionsForAccountType ", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

- (void)clearAllPermissionsGrantedForAccountType:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: ClearPermissionsForAccountType %@");
  OUTLINED_FUNCTION_0();
}

- (void)permissionForAccountType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: PermissionForAccountType %@");
  OUTLINED_FUNCTION_0();
}

- (void)grantedPermissionsForAccountType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: GrantedPermissionsForAccountType %@");
  OUTLINED_FUNCTION_0();
}

- (void)clearGrantedPermissionsForAccountType:(uint64_t)a1 .cold.1(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a1;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_4(&dword_1A2BCD000, v1, v2, "END [%lld] %fs: ClearGrantedPermissionsForAccountType ", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

- (void)clearGrantedPermissionsForAccountType:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: ClearGrantedPermissionsForAccountType %@");
  OUTLINED_FUNCTION_0();
}

- (void)credentialForAccount:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: CredentialForAccount %@");
  OUTLINED_FUNCTION_0();
}

- (void)allCredentialItems
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: AllCredentialItems ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)insertCredentialItem:withCompletionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: InsertCredentialItem %@");
  OUTLINED_FUNCTION_0();
}

- (void)saveCredentialItem:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_1A2BCD000, v0, v1, "\"Calling daemon to save a credential item\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)saveCredentialItem:withCompletionHandler:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: SaveCredentialItem %@");
  OUTLINED_FUNCTION_0();
}

void __59__ACAccountStore_saveCredentialItem_withCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_20(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_18(&dword_1A2BCD000, v0, v1, "END [%lld] %fs: SaveCredentialItem %{public}@", v2, v3, v4, v5, v6);
}

- (void)removeCredentialItem:withCompletionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: RemoveCredentialItem %@");
  OUTLINED_FUNCTION_0();
}

void __61__ACAccountStore_removeCredentialItem_withCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_20(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_18(&dword_1A2BCD000, v0, v1, "END [%lld] %fs: RemoveCredentialItem %{public}@", v2, v3, v4, v5, v6);
}

- (void)parentAccountForAccount:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(&dword_1A2BCD000, v0, v1, "\"Account without identifier provided, bailing!\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)parentAccountForAccount:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: ParentAccountForAccount %@");
  OUTLINED_FUNCTION_0();
}

- (void)childAccountsForAccount:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: ChildAccountForAccounts %@");
  OUTLINED_FUNCTION_0();
}

- (void)enabledDataclassesForAccount:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: EnabledDataclassesForAccount %@");
  OUTLINED_FUNCTION_0();
}

- (void)provisionedDataclassesForAccount:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: ProvisionedDataclassesForAccount %@");
  OUTLINED_FUNCTION_0();
}

- (void)supportedDataclassesForAccountType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: SupportedDataclassesForAccountType %@");
  OUTLINED_FUNCTION_0();
}

- (void)syncableDataclassesForAccountType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: SyncableDataclassesForAccountType %@");
  OUTLINED_FUNCTION_0();
}

- (void)displayTypeForAccountWithIdentifier:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: DisplayTypeForAccount %@");
  OUTLINED_FUNCTION_0();
}

- (void)accountIdentifiersEnabledForDataclass:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: AccountsEnabledForDataclass %@");
  OUTLINED_FUNCTION_0();
}

- (void)accountIdentifiersEnabledToSyncDataclass:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: AccountsEnabledToSyncDataclass %@");
  OUTLINED_FUNCTION_0();
}

- (void)preloadDataclassOwnersWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: PreloadDataclassOwners ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)dataclassActionsForAccountSave:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: DataclassActionsForAccountSave %@");
  OUTLINED_FUNCTION_0();
}

void __55__ACAccountStore_dataclassActionsForAccountSave_error___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1A2BCD000, v0, v1, "\"Could not get dataclass actions: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)dataclassActionsForAccountDeletion:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: DataclassActionsForAccountDeletion %@");
  OUTLINED_FUNCTION_0();
}

- (void)isPerformingDataclassActionsForAccount:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: IsPerformingDataclassActions %@");
  OUTLINED_FUNCTION_0();
}

void __63__ACAccountStore_isPerformingDataclassActionsForAccount_error___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1A2BCD000, v0, v1, "\"Could not get dataclass performing status: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)isTetheredSyncingEnabledForDataclass:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: IsThetheredSyncingEnabledForDataclass %@");
  OUTLINED_FUNCTION_0();
}

- (void)tetheredSyncSourceTypeForDataclass:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: ThetheredSyncSourceTypeForDataclass %@");
  OUTLINED_FUNCTION_0();
}

- (void)clientTokenForAccount:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: ClientTokenForAccount %@");
  OUTLINED_FUNCTION_0();
}

void __78__ACAccountStore_notifyRemoteDevicesOfModifiedAccount_withOptions_completion___block_invoke_183_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(&dword_1A2BCD000, v0, v1, "\"Failed to notify remote of modified account!\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __81__ACAccountStore_notifyRemoteDevicesOfUpdatedCredentials_withOptions_completion___block_invoke_184_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(&dword_1A2BCD000, v0, v1, "\"Failed to notify remote of updated credentials!\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)removeAccountsFromPairedDeviceWithOptions:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: RemoveAccountsFromPairedDevice (%@)");
  OUTLINED_FUNCTION_0();
}

- (void)triggerKeychainMigrationIfNecessary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: TriggerMigration ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)removeObsoleteAccounts:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: RemoveObsoleteAccounts ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __61__ACAccountStore__removeObsoleteAccountsInternal_completion___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_19();
  _os_log_error_impl(&dword_1A2BCD000, v0, OS_LOG_TYPE_ERROR, "\"Could not find acceptable action for dataclass %@ for removal of account %@. Probably orphaning data.\", v1, 0x16u);
  OUTLINED_FUNCTION_0();
}

- (void)handleURL:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: HandleURL %@");
  OUTLINED_FUNCTION_0();
}

void __28__ACAccountStore_handleURL___block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x1E0C80C00]);
  v3 = 134218240;
  v4 = v0;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_4(&dword_1A2BCD000, v1, v2, "END [%lld] %fs: HandleURL ", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

void __28__ACAccountStore_handleURL___block_invoke_210_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A2BCD000, a2, a3, "\"Failed to handle URL: %@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)reportTelemetryForLandmarkEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(&dword_1A2BCD000, v0, v1, "\"reportTelemetryForLandmarkEvent no longer suppored\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)scheduleBackupIfNonexistent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: ScheduleBackup ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)resetDatabaseToVersion:withCompletion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: ResetDatabaseToVersion %@");
  OUTLINED_FUNCTION_0();
}

- (void)shutdownAccountsD:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: ShutdownAccountsd ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)accountsOfTypeID:customProperty:value:cacheSuffix:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: AccountsForPropertyValue ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)accountsOfTypeID:customProperty:value:cacheSuffix:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "@\"Returning cached accounts of type %@: %@\");
  OUTLINED_FUNCTION_0();
}

- (void)accountsOfTypeID:customProperty:value:cacheSuffix:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: AccountsForPropertyValueSync ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)accountsOfTypeID:customProperty:value:cacheSuffix:completion:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "@\"Returning cached accounts of type %@: %@\");
  OUTLINED_FUNCTION_0();
}

@end
