@implementation AKBaseFollowupManager

- (AKBaseFollowupManager)initWithFollowUpFactory:(id)a3 provider:(id)a4
{
  id v7;
  id v8;
  AKBaseFollowupManager *v9;
  AKBaseFollowupManager *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AKBaseFollowupManager;
  v9 = -[AKBaseFollowupManager init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_factory, a3);
    objc_storeStrong((id *)&v10->_provider, a4);
  }

  return v10;
}

- (BOOL)synchronizeFollowUpsWithServerPayload:(id)a3 altDSID:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  AKFollowUpProvider *provider;
  char v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  id v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  char v36;
  id *v38;
  id v39;
  id v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  uint8_t v53[128];
  uint8_t buf[4];
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("items"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _AKLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19202F000, v10, OS_LOG_TYPE_DEFAULT, "Synchronizing local follow up state.", buf, 2u);
    }

    -[AKFollowUpProvider pendingFollowUpItems:](self->_provider, "pendingFollowUpItems:", 0);
    v10 = objc_claimAutoreleasedReturnValue();
    -[AKFollowUpItemFactory itemsForAltDSID:pushMessageInfo:fromIDMSPayload:](self->_factory, "itemsForAltDSID:pushMessageInfo:fromIDMSPayload:", v8, 0, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v13 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v9, "aaf_map:", &__block_literal_global_44);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setWithArray:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __77__AKBaseFollowupManager_synchronizeFollowUpsWithServerPayload_altDSID_error___block_invoke_2;
      v51[3] = &unk_1E2E613C8;
      v40 = v15;
      v52 = v40;
      -[NSObject aaf_filter:](v10, "aaf_filter:", v51);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v41, "count"))
      {
        _AKLogSystem();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v55 = v41;
          _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "Deleting: %@", buf, 0xCu);
        }

        provider = self->_provider;
        v50 = 0;
        v18 = -[AKFollowUpProvider removeFollowUpItems:error:](provider, "removeFollowUpItems:error:", v41, &v50);
        v19 = v50;
        if ((v18 & 1) == 0)
        {
          _AKLogSystem();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            -[AKBaseFollowupManager synchronizeFollowUpsWithServerPayload:altDSID:error:].cold.1((uint64_t)v19, v20);

        }
      }
      v21 = (void *)MEMORY[0x1E0C99E60];
      -[AKFollowUpItemFactory itemIdentifiersRequiringNotificationClearFromPayload:](self->_factory, "itemIdentifiersRequiringNotificationClearFromPayload:", v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setWithArray:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __77__AKBaseFollowupManager_synchronizeFollowUpsWithServerPayload_altDSID_error___block_invoke_13;
      v48[3] = &unk_1E2E613C8;
      v24 = v23;
      v49 = v24;
      -[NSObject aaf_filter:](v10, "aaf_filter:", v48);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "count"))
      {
        v38 = a5;
        v39 = v8;
        _AKLogSystem();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v55 = v25;
          _os_log_impl(&dword_19202F000, v26, OS_LOG_TYPE_DEFAULT, "Clearing Notifications: %@", buf, 0xCu);
        }

        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v27 = v25;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v45;
          do
          {
            for (i = 0; i != v29; ++i)
            {
              if (*(_QWORD *)v45 != v30)
                objc_enumerationMutation(v27);
              -[AKFollowUpProvider clearNotificationsForItem:error:](self->_provider, "clearNotificationsForItem:error:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i), 0);
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
          }
          while (v29);
        }

        a5 = v38;
        v8 = v39;
      }
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __77__AKBaseFollowupManager_synchronizeFollowUpsWithServerPayload_altDSID_error___block_invoke_14;
      v42[3] = &unk_1E2E613C8;
      v43 = v24;
      v32 = v24;
      objc_msgSend(v12, "aaf_filter:", v42);
      v33 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v33;
    }
    -[AKBaseFollowupManager _alignedInsertionCandidates:withExistingItems:](self, "_alignedInsertionCandidates:withExistingItems:", v12, v10);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    _AKLogSystem();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v55 = v34;
      _os_log_impl(&dword_19202F000, v35, OS_LOG_TYPE_DEFAULT, "Inserting: %@", buf, 0xCu);
    }

    v36 = -[AKFollowUpProvider addFollowUpItems:error:](self->_provider, "addFollowUpItems:error:", v34, a5);
  }
  else
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19202F000, v10, OS_LOG_TYPE_DEFAULT, "No followup items found in payload.", buf, 2u);
    }
    v36 = 0;
  }

  return v36;
}

uint64_t __77__AKBaseFollowupManager_synchronizeFollowUpsWithServerPayload_altDSID_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("id"));
}

uint64_t __77__AKBaseFollowupManager_synchronizeFollowUpsWithServerPayload_altDSID_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

uint64_t __77__AKBaseFollowupManager_synchronizeFollowUpsWithServerPayload_altDSID_error___block_invoke_13(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __77__AKBaseFollowupManager_synchronizeFollowUpsWithServerPayload_altDSID_error___block_invoke_14(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

- (void)teardownFollowUpWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  AKFollowUpProvider *provider;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  objc_msgSend(v6, "itemIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8
    && (v9 = (void *)v8,
        objc_msgSend(v6, "altDSID"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10))
  {
    objc_msgSend(v6, "akAction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("delete"));

    objc_msgSend(v6, "akAction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("teardown"));

    if ((v12 & 1) != 0 || v14)
    {
      provider = self->_provider;
      objc_msgSend(v6, "itemIdentifier");
      v15 = objc_claimAutoreleasedReturnValue();
      v19[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKFollowUpProvider removeFollowUpItemsWithIdentifiers:error:](provider, "removeFollowUpItemsWithIdentifiers:error:", v18, 0);

    }
    else
    {
      _AKLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[AKBaseFollowupManager teardownFollowUpWithContext:completion:].cold.1();
    }

    v7[2](v7, 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7044);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v16);

  }
}

- (id)_alignedInsertionCandidates:(id)a3 withExistingItems:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  AKBaseFollowupManager *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __71__AKBaseFollowupManager__alignedInsertionCandidates_withExistingItems___block_invoke;
  v26[3] = &unk_1E2E613F0;
  v12 = v10;
  v27 = v12;
  v13 = v9;
  v28 = v13;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v26);

  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = __71__AKBaseFollowupManager__alignedInsertionCandidates_withExistingItems___block_invoke_19;
  v22[3] = &unk_1E2E61418;
  v14 = v12;
  v23 = v14;
  v15 = v13;
  v24 = v15;
  v25 = self;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v22);

  _AKLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v14;
    _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "Found incoming sparse followups: %@", buf, 0xCu);
  }

  _AKLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v15;
    _os_log_impl(&dword_19202F000, v17, OS_LOG_TYPE_DEFAULT, "Found incoming full followups: %@", buf, 0xCu);
  }

  objc_msgSend(v14, "allValues");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "arrayByAddingObjectsFromArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

void __71__AKBaseFollowupManager__alignedInsertionCandidates_withExistingItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "actions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v3, "informativeText");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = *(void **)(a1 + 40);
LABEL_10:
        objc_msgSend(v3, "uniqueIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v3, v9);

        goto LABEL_11;
      }
    }
    else
    {

    }
    v7 = *(void **)(a1 + 32);
    goto LABEL_10;
  }
  _AKLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __71__AKBaseFollowupManager__alignedInsertionCandidates_withExistingItems___block_invoke_cold_1();

LABEL_11:
}

void __71__AKBaseFollowupManager__alignedInsertionCandidates_withExistingItems___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;

  v3 = a2;
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5
      && (objc_msgSend(v3, "notification"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
    {
      objc_msgSend(v5, "notification");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v5, "notification");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "informativeText");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "notification");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setInformativeText:", v9);

        objc_msgSend(v5, "notification");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "title");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "notification");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setTitle:", v12);

        objc_msgSend(v5, "notification");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "frequency");
        v16 = v15;
        objc_msgSend(v3, "notification");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setFrequency:", v16);

        objc_msgSend(v5, "notification");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "options");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "notification");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setOptions:", v19);

      }
      else
      {
        objc_msgSend(v3, "setNotification:", 0);
      }
      _AKLogSystem();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        __71__AKBaseFollowupManager__alignedInsertionCandidates_withExistingItems___block_invoke_19_cold_3((uint64_t)v4, v24);

      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v4);
    }
    else
    {
      objc_msgSend(v3, "notification");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v4);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "IsFollowUpItemNotificationForced:", v22) & 1) != 0)
          {
            _AKLogSystem();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              __71__AKBaseFollowupManager__alignedInsertionCandidates_withExistingItems___block_invoke_19_cold_1();
          }
          else
          {
            objc_msgSend(v22, "setNotification:", 0);
            _AKLogSystem();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              __71__AKBaseFollowupManager__alignedInsertionCandidates_withExistingItems___block_invoke_19_cold_2();
          }

        }
      }
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_factory, 0);
}

- (void)synchronizeFollowUpsWithServerPayload:(uint64_t)a1 altDSID:(NSObject *)a2 error:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19202F000, a2, OS_LOG_TYPE_ERROR, "Failed to clear existing follow ups: %@", (uint8_t *)&v2, 0xCu);
}

- (void)teardownFollowUpWithContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Unknown action, ignoring...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __71__AKBaseFollowupManager__alignedInsertionCandidates_withExistingItems___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Detected an item without an identifier, invalid payload", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __71__AKBaseFollowupManager__alignedInsertionCandidates_withExistingItems___block_invoke_19_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Incoming notification was forced, keeping it!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __71__AKBaseFollowupManager__alignedInsertionCandidates_withExistingItems___block_invoke_19_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Existing item notification was previously dismissed, ignoring incoming notification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __71__AKBaseFollowupManager__alignedInsertionCandidates_withExistingItems___block_invoke_19_cold_3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_19202F000, a2, OS_LOG_TYPE_DEBUG, "Updating existing item with identifier: %@", (uint8_t *)&v2, 0xCu);
}

@end
