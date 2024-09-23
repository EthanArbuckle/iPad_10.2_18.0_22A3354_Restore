@implementation FPDAttachKnownFolderOperation

- (FPDAttachKnownFolderOperation)initWithKnownFolderURLs:(id)a3 onlyForDomain:(id)a4 server:(id)a5 options:(unint64_t)a6 request:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  FPDAttachKnownFolderOperation *v17;
  FPDAttachKnownFolderOperation *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)FPDAttachKnownFolderOperation;
  v17 = -[FPOperation init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_knownFolders = 0;
    objc_storeStrong((id *)&v17->_knownFolderPhysicalURLs, a3);
    objc_storeStrong((id *)&v18->_onlyForDomain, a4);
    objc_storeStrong((id *)&v18->_server, a5);
    v18->_options = a6;
    objc_storeStrong((id *)&v18->_request, a7);
  }

  return v18;
}

- (FPDAttachKnownFolderOperation)initWithKnownFolders:(unint64_t)a3 onlyForDomain:(id)a4 server:(id)a5 options:(unint64_t)a6 request:(id)a7
{
  id v13;
  id v14;
  id v15;
  FPDAttachKnownFolderOperation *v16;
  FPDAttachKnownFolderOperation *v17;
  NSArray *knownFolderPhysicalURLs;
  objc_super v20;

  v13 = a4;
  v14 = a5;
  v15 = a7;
  v20.receiver = self;
  v20.super_class = (Class)FPDAttachKnownFolderOperation;
  v16 = -[FPOperation init](&v20, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_knownFolders = a3;
    knownFolderPhysicalURLs = v16->_knownFolderPhysicalURLs;
    v16->_knownFolderPhysicalURLs = 0;

    objc_storeStrong((id *)&v17->_onlyForDomain, a4);
    objc_storeStrong((id *)&v17->_server, a5);
    v17->_options = a6;
    objc_storeStrong((id *)&v17->_request, a7);
  }

  return v17;
}

- (void)notifyUserForDomain:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  unint64_t options;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  options = self->_options;
  fp_current_or_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if ((options & 2) != 0)
  {
    if (v10)
      -[FPDAttachKnownFolderOperation notifyUserForDomain:withCompletionHandler:].cold.4();

    if (os_variant_has_internal_content())
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.fileproviderd"));
      objc_msgSend(v11, "stringForKey:", CFSTR("forceAttachPromptResult"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isEqualToString:", CFSTR("approve")))
      {
        fp_current_or_default_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[FPDAttachKnownFolderOperation notifyUserForDomain:withCompletionHandler:].cold.2();

        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSince1970");
        objc_msgSend(v11, "setDouble:forKey:", CFSTR("forceAttachPromptLastInterception"));

        goto LABEL_18;
      }
      if (objc_msgSend(v12, "isEqualToString:", CFSTR("decline")))
      {
        fp_current_or_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          -[FPDAttachKnownFolderOperation notifyUserForDomain:withCompletionHandler:].cold.3();

        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "timeIntervalSince1970");
        objc_msgSend(v11, "setDouble:forKey:", CFSTR("forceAttachPromptLastInterception"));

        goto LABEL_19;
      }

    }
    objc_msgSend(v6, "provider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "providerDomainForDomain:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "provider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShouldHideDomainDisplayName:", objc_msgSend(v18, "shouldHideDomainDisplayName"));

    v12 = (void *)objc_msgSend((id)objc_opt_new(), "initWithProviderDomain:", v11);
    if ((objc_msgSend(v12, "presentAlertWithUserAprovalToContinue") & 1) != 0)
    {
LABEL_18:
      v7[2](v7, 0);
LABEL_20:

      goto LABEL_21;
    }
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v7)[2](v7, v19);

    goto LABEL_20;
  }
  if (v10)
    -[FPDAttachKnownFolderOperation notifyUserForDomain:withCompletionHandler:].cold.1();

  v7[2](v7, 0);
LABEL_21:

}

- (id)resolveKnownFolderURLsWithError:(id *)a3
{
  NSArray *knownFolderPhysicalURLs;
  NSArray *v4;
  void *v7;
  unint64_t knownFolders;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  knownFolderPhysicalURLs = self->_knownFolderPhysicalURLs;
  if (!knownFolderPhysicalURLs)
  {
    v7 = (void *)objc_opt_new();
    knownFolders = self->_knownFolders;
    if ((knownFolders & 1) != 0)
    {
      +[FPDKnownFolderArbiter desktopURL](FPDKnownFolderArbiter, "desktopURL");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_10;
      v10 = (void *)v9;
      objc_msgSend(v7, "addObject:", v9);

      knownFolders = self->_knownFolders;
    }
    if ((knownFolders & 2) == 0)
    {
LABEL_9:
      v4 = v7;
LABEL_13:

      return v4;
    }
    +[FPDKnownFolderArbiter documentsURL](FPDKnownFolderArbiter, "documentsURL");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v7, "addObject:", v11);

      goto LABEL_9;
    }
LABEL_10:
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4, 0);
      v4 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
    goto LABEL_13;
  }
  v4 = knownFolderPhysicalURLs;
  return v4;
}

- (void)main
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id obj;
  void *v25;
  _QWORD v26[5];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v32 = 0;
  -[FPDAttachKnownFolderOperation resolveKnownFolderURLsWithError:](self, "resolveKnownFolderURLsWithError:", &v32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v32;
  v5 = v4;
  if (v3)
  {
    v22 = v4;
    v25 = (void *)objc_opt_new();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v23 = v3;
    obj = v3;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          -[FPDServer extensionManager](self->_server, "extensionManager", v22);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "domainForURL:reason:", v11, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            if (!v8)
            {
              -[FPDServer extensionManager](self->_server, "extensionManager");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "providerDomainID");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "domainWithID:reason:", v15, 0);
              v8 = (void *)objc_claimAutoreleasedReturnValue();

            }
            if (!self->_onlyForDomain
              || (objc_msgSend(v13, "providerDomainID"),
                  v16 = (void *)objc_claimAutoreleasedReturnValue(),
                  -[FPDDomain providerDomainID](self->_onlyForDomain, "providerDomainID"),
                  v17 = (void *)objc_claimAutoreleasedReturnValue(),
                  v18 = objc_msgSend(v16, "isEqualToString:", v17),
                  v17,
                  v16,
                  v18))
            {
              objc_msgSend(v13, "providerDomainID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKeyedSubscript:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v20)
              {
                v20 = (void *)objc_opt_new();
                objc_msgSend(v13, "providerDomainID");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "setObject:forKeyedSubscript:", v20, v21);

              }
              objc_msgSend(v20, "addObject:", v11);

            }
          }

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v7);
    }
    else
    {
      v8 = 0;
    }

    if (objc_msgSend(v25, "count"))
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __37__FPDAttachKnownFolderOperation_main__block_invoke;
      v26[3] = &unk_1E8C75AC0;
      v26[4] = self;
      v27 = v25;
      -[FPDAttachKnownFolderOperation notifyUserForDomain:withCompletionHandler:](self, "notifyUserForDomain:withCompletionHandler:", v8, v26);

    }
    else
    {
      -[FPOperation finishWithResult:error:](self, "finishWithResult:error:", 0, 0);
    }
    v5 = v22;
    v3 = v23;

  }
  else
  {
    -[FPOperation finishWithResult:error:](self, "finishWithResult:error:", 0, v4);
  }

}

void __37__FPDAttachKnownFolderOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id obj;
  _QWORD block[6];
  _QWORD v29[4];
  NSObject *v30;
  uint64_t *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    v26 = 0;
    v4 = dispatch_group_create();
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__17;
    v41 = __Block_byref_object_dispose__17;
    v42 = 0;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = *(id *)(a1 + 40);
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    v3 = 0;
    if (!v5)
      goto LABEL_16;
    v6 = *(_QWORD *)v34;
    while (1)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v34 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v7);
        v32 = 0;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "extensionManager", v26);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "domainWithID:reason:", v8, &v32);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v10, "defaultBackend");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_opt_respondsToSelector();

          if ((v12 & 1) != 0)
          {
            dispatch_group_enter(v4);
            objc_msgSend(v10, "defaultBackend");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v8);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = *(_QWORD *)(a1 + 32);
            v16 = *(_QWORD *)(v15 + 336);
            v17 = *(_QWORD *)(v15 + 344);
            v29[0] = MEMORY[0x1E0C809B0];
            v29[1] = 3221225472;
            v29[2] = __37__FPDAttachKnownFolderOperation_main__block_invoke_33;
            v29[3] = &unk_1E8C783D8;
            v30 = v4;
            v31 = &v37;
            v18 = v17;
            v3 = v26;
            objc_msgSend(v13, "attachKnownFolders:options:request:completionHandler:", v14, v16, v18, v29);

            v19 = v30;
            goto LABEL_14;
          }
          v19 = v4;
          objc_sync_enter(v19);
          FPNotSupportedError();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = (void *)v38[5];
          v38[5] = v23;

        }
        else
        {
          v19 = v4;
          objc_sync_enter(v19);
          objc_msgSend(v8, "fp_toProviderID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          FPProviderNotFoundError();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = (void *)v38[5];
          v38[5] = v21;

        }
        objc_sync_exit(v19);
LABEL_14:

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
      if (!v5)
      {
LABEL_16:

        objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
        v25 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __37__FPDAttachKnownFolderOperation_main__block_invoke_2;
        block[3] = &unk_1E8C768B0;
        block[4] = *(_QWORD *)(a1 + 32);
        block[5] = &v37;
        dispatch_group_notify(v4, v25, block);

        _Block_object_dispose(&v37, 8);
        goto LABEL_17;
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v3);
LABEL_17:

}

void __37__FPDAttachKnownFolderOperation_main__block_invoke_33(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v5 = a2;
  if (v5)
  {
    v4 = *(id *)(a1 + 32);
    objc_sync_enter(v4);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    objc_sync_exit(v4);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __37__FPDAttachKnownFolderOperation_main__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_onlyForDomain, 0);
  objc_storeStrong((id *)&self->_knownFolderPhysicalURLs, 0);
}

- (void)notifyUserForDomain:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] 🖥️  not presenting UI for attaching folders", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)notifyUserForDomain:withCompletionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] 🖥️  forcing approval of attach", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)notifyUserForDomain:withCompletionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] 🖥️  forcing decline of attach", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)notifyUserForDomain:withCompletionHandler:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] 🖥️  asking the user whether we should reattach", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
