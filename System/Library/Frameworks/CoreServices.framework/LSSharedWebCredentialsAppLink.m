@implementation LSSharedWebCredentialsAppLink

void __88___LSSharedWebCredentialsAppLink_afterAppLinksBecomeAvailableForURL_limit_performBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  dispatch_block_t block;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  NSObject *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  NSObject *v33;
  id v34;
  uint64_t v35;
  _QWORD v36[4];
  id v37;
  id v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  const __CFString *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", *(_QWORD *)(a1 + 32), 1);
  objc_msgSend(v25, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc((Class)_LSSWCServiceSpecifierClass());
    _LSSWCServiceTypeAppLinks();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithServiceType:applicationIdentifier:domain:", v4, 0, v2);

    v24 = (void *)v5;
    v40 = 0;
    objc_msgSend((id)_LSSWCServiceDetailsClass(), "serviceDetailsWithServiceSpecifier:error:", v5, &v40);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v40;
    if (v6)
    {
      v22 = v6;
      v7 = MEMORY[0x1E0C809B0];
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __88___LSSharedWebCredentialsAppLink_afterAppLinksBecomeAvailableForURL_limit_performBlock___block_invoke_2;
      v36[3] = &unk_1E10415B8;
      v8 = *(id *)(a1 + 32);
      v10 = *(void **)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      v37 = v8;
      v39 = v9;
      v38 = v10;
      block = (dispatch_block_t)MEMORY[0x186DAE9BC](v36);
      if (objc_msgSend(v22, "count") == 1)
      {
        objc_msgSend(v22, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = v7;
        v32[1] = 3221225472;
        v32[2] = __88___LSSharedWebCredentialsAppLink_afterAppLinksBecomeAvailableForURL_limit_performBlock___block_invoke_3;
        v32[3] = &unk_1E1041650;
        v35 = *(_QWORD *)(a1 + 56);
        v33 = block;
        v34 = *(id *)(a1 + 40);
        objc_msgSend(v11, "waitForSiteApprovalWithCompletionHandler:", v32);

        v12 = v33;
      }
      else
      {
        v12 = dispatch_group_create();
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v15 = v22;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v43, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v29 != v17)
                objc_enumerationMutation(v15);
              v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
              dispatch_group_enter(v12);
              v26[0] = v7;
              v26[1] = 3221225472;
              v26[2] = __88___LSSharedWebCredentialsAppLink_afterAppLinksBecomeAvailableForURL_limit_performBlock___block_invoke_4;
              v26[3] = &unk_1E1041678;
              v26[4] = v19;
              v27 = v12;
              objc_msgSend(v19, "waitForSiteApprovalWithCompletionHandler:", v26);

            }
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v43, 16);
          }
          while (v16);
        }

        objc_msgSend(*(id *)(a1 + 56), "_dispatchQueue");
        v20 = objc_claimAutoreleasedReturnValue();
        dispatch_group_notify(v12, v20, block);

      }
      v6 = v22;
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

    v14 = v23;
  }
  else
  {
    v13 = *(_QWORD *)(a1 + 40);
    v41 = *MEMORY[0x1E0CB2938];
    v42 = CFSTR("aURL");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"+[_LSSharedWebCredentialsAppLink afterAppLinksBecomeAvailableForURL:limit:performBlock:]_block_invoke", 315, v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v14);
  }

}

void __88___LSSharedWebCredentialsAppLink_afterAppLinksBecomeAvailableForURL_limit_performBlock___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = a1[4];
  v3 = a1[6];
  v6 = 0;
  +[LSAppLink appLinksWithURL:limit:error:](LSAppLink, "appLinksWithURL:limit:error:", v2, v3, &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  (*(void (**)(void))(a1[5] + 16))();

}

void __88___LSSharedWebCredentialsAppLink_afterAppLinksBecomeAvailableForURL_limit_performBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v5;
  id v6;

  v6 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 48), "_dispatchQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v5, *(dispatch_block_t *)(a1 + 32));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __88___LSSharedWebCredentialsAppLink_afterAppLinksBecomeAvailableForURL_limit_performBlock___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    _LSDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "serviceSpecifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      __88___LSSharedWebCredentialsAppLink_afterAppLinksBecomeAvailableForURL_limit_performBlock___block_invoke_4_cold_1(v8, (uint64_t)v6, v9, v7);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __88___LSSharedWebCredentialsAppLink_afterAppLinksBecomeAvailableForURL_limit_performBlock___block_invoke_4_cold_1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "Error getting updated SWC service details for %@ (ignoring due to batch operation): %@", buf, 0x16u);

}

@end
