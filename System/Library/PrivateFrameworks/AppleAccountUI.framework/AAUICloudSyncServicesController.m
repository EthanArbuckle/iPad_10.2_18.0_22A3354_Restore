@implementation AAUICloudSyncServicesController

- (AAUICloudSyncServicesController)init
{
  AAUICloudSyncServicesController *v2;
  ACAccountStore *v3;
  ACAccountStore *accountStore;
  NSMutableDictionary *v5;
  NSMutableDictionary *queuedDataclassStates;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AAUICloudSyncServicesController;
  v2 = -[AAUICloudSyncServicesController init](&v8, sel_init);
  if (v2)
  {
    v3 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    queuedDataclassStates = v2->_queuedDataclassStates;
    v2->_queuedDataclassStates = v5;

  }
  return v2;
}

- (id)_account
{
  ACAccount *account;
  ACAccount *v4;
  ACAccount *v5;

  account = self->_account;
  if (!account)
  {
    -[ACAccountStore aa_primaryAppleAccount](self->_accountStore, "aa_primaryAppleAccount");
    v4 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    v5 = self->_account;
    self->_account = v4;

    account = self->_account;
  }
  return account;
}

- (void)setCloudServicesEnabled:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, uint64_t, _QWORD);
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  int v19;
  NSMutableDictionary *v20;
  NSMutableDictionary *queuedDataclassActions;
  NSMutableArray *v22;
  NSMutableArray *dataclassesRequiringMergeDecision;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSMutableDictionary *v34;
  void *v35;
  NSMutableDictionary *v36;
  void *v37;
  id handler;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  uint64_t v46;
  NSMutableDictionary *v47;
  void (**v48)(id, uint64_t, _QWORD);
  void (**v49)(id, uint64_t, _QWORD);
  void *v50;
  id obj;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[16];
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v4 = a3;
  v69 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  -[ACAccountStore aa_primaryAppleAccount](self->_accountStore, "aa_primaryAppleAccount");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  _AAUILogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    v48 = v6;
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v7, OS_LOG_TYPE_DEFAULT, "User chose to use iCloud", buf, 2u);
    }

    objc_msgSend(v52, "provisionedDataclasses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v52, "enabledDataclasses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "minusSet:", v11);

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    obj = v10;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v62;
      v15 = MEMORY[0x1E0C9AAB0];
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v62 != v14)
            objc_enumerationMutation(obj);
          v17 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CFAC30], "sharedManager", v48);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "canAutoEnableDataclass:forAccount:", v17, v52);

          if (v19)
          {
            objc_msgSend(v52, "setEnabled:forDataclass:", 1, v17);
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_queuedDataclassStates, "setObject:forKeyedSubscript:", v15, v17);
          }
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
      }
      while (v13);
    }

    if (!self->_queuedDataclassActions)
    {
      v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      queuedDataclassActions = self->_queuedDataclassActions;
      self->_queuedDataclassActions = v20;

    }
    if (!self->_dataclassesRequiringMergeDecision)
    {
      v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      dataclassesRequiringMergeDecision = self->_dataclassesRequiringMergeDecision;
      self->_dataclassesRequiringMergeDecision = v22;

    }
    -[ACAccountStore dataclassActionsForAccountSave:](self->_accountStore, "dataclassActionsForAccountSave:", v52, v48);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    objc_msgSend(v24, "allKeys");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v58;
      v50 = v25;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v58 != v28)
            objc_enumerationMutation(v25);
          v30 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j);
          objc_msgSend(v24, "objectForKeyedSubscript:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if ((unint64_t)objc_msgSend(v31, "count") < 2)
            {
              if (objc_msgSend(v31, "count") == 1)
              {
                v32 = v28;
                v33 = v24;
                v34 = self->_queuedDataclassActions;
                objc_msgSend(v31, "lastObject");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = v34;
                v24 = v33;
                v28 = v32;
                -[NSMutableDictionary setObject:forKey:](v36, "setObject:forKey:", v35, v30);

                v25 = v50;
              }
            }
            else
            {
              -[NSMutableArray addObject:](self->_dataclassesRequiringMergeDecision, "addObject:", v30);
            }
          }

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
      }
      while (v27);
    }

    if (-[NSMutableArray count](self->_dataclassesRequiringMergeDecision, "count"))
    {
      v6 = v49;
      if (self->_handler != v49)
      {
        v37 = (void *)objc_msgSend(v49, "copy");
        handler = self->_handler;
        self->_handler = v37;

      }
      -[AAUICloudSyncServicesController _presentMergeConfirmationForDataclasses:account:](self, "_presentMergeConfirmationForDataclasses:account:", self->_dataclassesRequiringMergeDecision, v52);
    }
    else
    {
      v6 = v49;
      v49[2](v49, 1, 0);
    }

  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v7, OS_LOG_TYPE_DEFAULT, "User chose not to use iCloud", buf, 2u);
    }

    objc_msgSend(v52, "enabledDataclasses");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v39, "copy");

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    obj = v40;
    v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v54;
      v44 = MEMORY[0x1E0C9AAA0];
      do
      {
        for (k = 0; k != v42; ++k)
        {
          if (*(_QWORD *)v54 != v43)
            objc_enumerationMutation(obj);
          v46 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * k);
          objc_msgSend(v52, "setEnabled:forDataclass:", 0, v46);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_queuedDataclassStates, "setObject:forKeyedSubscript:", v44, v46);
        }
        v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
      }
      while (v42);
    }

    v47 = self->_queuedDataclassActions;
    if (v47)
    {
      self->_queuedDataclassActions = 0;

    }
    v6[2](v6, 1, 0);
  }

}

- (void)_presentMergeConfirmationForDataclasses:(id)a3 account:(id)a4
{
  void *v5;
  void *v6;
  id v7;
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
  _QWORD v21[5];

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (void *)MEMORY[0x1E0CB34D0];
  v7 = a3;
  objc_msgSend(v6, "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("BATCH_MERGE_TITLE"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v9, CFSTR("iCloud"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "modelSpecificLocalizedStringKeyForKey:", CFSTR("BATCH_MERGE_FORMAT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", v11, &stru_1EA2E2A18, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CF4F10], "localizedTextForDataclasses:usedAtBeginningOfSentence:", v7, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v12, v13, CFSTR("iCloud"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CFAD70];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("BATCH_MERGE_CANCEL_BUTTON"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("BATCH_MERGE_OK_BUTTON"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __83__AAUICloudSyncServicesController__presentMergeConfirmationForDataclasses_account___block_invoke;
  v21[3] = &unk_1EA2DCE70;
  v21[4] = self;
  objc_msgSend(v15, "showUserNotificationWithTitle:message:cancelButtonTitle:otherButtonTitle:withCompletionBlock:", v20, v14, v17, v19, v21);

}

uint64_t __83__AAUICloudSyncServicesController__presentMergeConfirmationForDataclasses_account___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v19 = 0uLL;
    v20 = 0uLL;
    v17 = 0uLL;
    v18 = 0uLL;
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      v8 = MEMORY[0x1E0C9AAA0];
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKeyedSubscript:", v8, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v6);
    }
  }
  else
  {
    v23 = 0uLL;
    v24 = 0uLL;
    v21 = 0uLL;
    v22 = 0uLL;
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
    v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v4);
          v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0C8F2D0], "actionWithType:", 5);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v15, v14);

        }
        v11 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v11);
    }
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 16))();
}

- (void)setDeviceLocatorEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  _DWORD v6[2];
  uint64_t v7;

  v3 = a3;
  v7 = *MEMORY[0x1E0C80C00];
  _AAUILogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "AASetupAssistantServiceDelegate setDeviceLocatorEnabled:%d.", (uint8_t *)v6, 8u);
  }

  if (v3)
  {
    +[AAUIDeviceLocatorService sharedInstance](AAUIDeviceLocatorService, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "enableInContext:", 5);

  }
}

- (void)setBackupEnabled:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD block[5];
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v4 = a3;
  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[ACAccountStore aa_primaryAppleAccount](self->_accountStore, "aa_primaryAppleAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    if (objc_msgSend(v7, "aa_isPrimaryEmailVerified"))
    {
      dispatch_get_global_queue(0, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63__AAUICloudSyncServicesController_setBackupEnabled_completion___block_invoke;
      block[3] = &unk_1EA2DB138;
      block[4] = self;
      v14 = v6;
      dispatch_async(v9, block);

    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0CB2D50];
      v16[0] = CFSTR("Primary email not verified.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "aa_errorWithCode:userInfo:", 0, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v12);

    }
  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_queuedDataclassStates, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0C8F360]);
    (*((void (**)(id, uint64_t, _QWORD))v6 + 2))(v6, 1, 0);
  }

}

void __63__AAUICloudSyncServicesController_setBackupEnabled_completion___block_invoke(uint64_t a1)
{
  id v2;
  int v3;
  id v4;
  id v5;

  v2 = objc_alloc_init(MEMORY[0x1E0D4E0A8]);
  v5 = 0;
  v3 = objc_msgSend(v2, "setupBackupWithPasscode:error:", 0, &v5);
  v4 = v5;
  if (v3)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C8F360]);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)completeEnablingCloudServicesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  ACAccountStore *accountStore;
  NSMutableDictionary *queuedDataclassActions;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  ACAccountStore *v25;
  NSObject *v26;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[8];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "complete enabling cloud services", buf, 2u);
  }

  -[AAUICloudSyncServicesController _account](self, "_account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "refresh");
  if (objc_msgSend(v6, "aa_isPrimaryEmailVerified"))
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v7 = self->_queuedDataclassStates;
    v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v36 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_queuedDataclassStates, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setEnabled:forDataclass:", objc_msgSend(v13, "BOOLValue"), v12);

        }
        v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      }
      while (v9);
    }

    accountStore = self->_accountStore;
    queuedDataclassActions = self->_queuedDataclassActions;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __79__AAUICloudSyncServicesController_completeEnablingCloudServicesWithCompletion___block_invoke;
    v33[3] = &unk_1EA2DBC90;
    v34 = v4;
    -[ACAccountStore saveAccount:withDataclassActions:completion:](accountStore, "saveAccount:withDataclassActions:completion:", v6, queuedDataclassActions, v33);
    v16 = v34;
  }
  else if (v6)
  {
    objc_msgSend(v6, "enabledDataclasses");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v16 = v18;
    v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v30;
      v22 = *MEMORY[0x1E0C8F360];
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v30 != v21)
            objc_enumerationMutation(v16);
          v24 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
          if ((objc_msgSend(v24, "isEqualToString:", v22) & 1) == 0)
            objc_msgSend(v6, "setEnabled:forDataclass:", 0, v24);
        }
        v20 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
      }
      while (v20);
    }

    v25 = self->_accountStore;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __79__AAUICloudSyncServicesController_completeEnablingCloudServicesWithCompletion___block_invoke_70;
    v27[3] = &unk_1EA2DBC90;
    v28 = v4;
    -[ACAccountStore saveAccount:withCompletionHandler:](v25, "saveAccount:withCompletionHandler:", v6, v27);

  }
  else
  {
    _AALogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      -[AAUICloudSyncServicesController completeEnablingCloudServicesWithCompletion:].cold.1(v26);

    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -4404);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v16);
  }

}

void __79__AAUICloudSyncServicesController_completeEnablingCloudServicesWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _AAUILogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Failed to save iCloud account:%@", (uint8_t *)&v7, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __79__AAUICloudSyncServicesController_completeEnablingCloudServicesWithCompletion___block_invoke_70(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _AAUILogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Failed to save iCloud account:%@", (uint8_t *)&v7, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)verifyAccountWithAppleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  AAAutoAccountVerifier *v11;
  AAAutoAccountVerifier *verifier;
  NSObject *v13;
  AAAutoAccountVerifier *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  AAUICloudSyncServicesController *v19;
  id v20;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  -[AAUICloudSyncServicesController _account](self, "_account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "username");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", v7);

  if (v10)
  {
    v11 = (AAAutoAccountVerifier *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFABC0]), "initWithAccount:", v8);
    verifier = self->_verifier;
    self->_verifier = v11;

    -[AAAutoAccountVerifier sendVerificationEmail](self->_verifier, "sendVerificationEmail");
    _AAUILogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v13, OS_LOG_TYPE_DEFAULT, "Verifying iCloud primary email", buf, 2u);
    }

    v14 = self->_verifier;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __71__AAUICloudSyncServicesController_verifyAccountWithAppleID_completion___block_invoke;
    v17[3] = &unk_1EA2DC430;
    v18 = v8;
    v19 = self;
    v20 = v6;
    -[AAAutoAccountVerifier verifyWithHandler:](v14, "verifyWithHandler:", v17);

    v15 = v18;
  }
  else
  {
    _AAUILogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v16, OS_LOG_TYPE_DEFAULT, "ERROR: Trying to verify the email for an iCloud we're not familiar with. That's bad.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:userInfo:", 111, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v15);
  }

}

void __71__AAUICloudSyncServicesController_verifyAccountWithAppleID_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Primary email verified!", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "provisionedDataclasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __71__AAUICloudSyncServicesController_verifyAccountWithAppleID_completion___block_invoke_72;
    v15[3] = &unk_1EA2DCE98;
    v16 = v5;
    v17 = *(id *)(a1 + 32);
    v18 = v9;
    v12 = *(void **)(a1 + 48);
    v19 = *(_QWORD *)(a1 + 40);
    v20 = v12;
    v13 = v9;
    objc_msgSend(v11, "aa_updatePropertiesForAppleAccount:completion:", v10, v15);

  }
  else
  {
    if (v7)
    {
      objc_msgSend(v5, "localizedDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v14;
      _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Verification failed: %@", buf, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __71__AAUICloudSyncServicesController_verifyAccountWithAppleID_completion___block_invoke_72(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (*(_QWORD *)(a1 + 32))
  {
    _AAUILogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v5;
      _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Account update failed: %@", buf, 0xCu);
    }
  }
  else
  {
    v18 = v4;
    objc_msgSend(*(id *)(a1 + 40), "provisionedDataclasses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "minusSet:", *(_QWORD *)(a1 + 48));
    _AAUILogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v8;
      _os_log_impl(&dword_1DB4ED000, v9, OS_LOG_TYPE_DEFAULT, "Now that we're verified we've got some new provisioned dataclasses: %@", buf, 0xCu);
    }

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v8;
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      v13 = *MEMORY[0x1E0C8F360];
      v14 = MEMORY[0x1E0C9AAB0];
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v6);
          v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15);
          objc_msgSend(MEMORY[0x1E0CFAC30], "sharedManager");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v16) = objc_msgSend(v17, "canAutoEnableDataclass:forAccount:", v16, *(_QWORD *)(a1 + 40));

          if ((_DWORD)v16)
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 40), "setObject:forKeyedSubscript:", v14, v13);
          ++v15;
        }
        while (v11 != v15);
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }

    v5 = v18;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)_validateMailAccount:(id)a3
{
  id v4;
  NSObject *v5;
  MFAccountValidator *v6;
  MFAccountValidator *validator;
  uint8_t v8[16];

  v4 = a3;
  _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "Verifying Email account.", v8, 2u);
  }

  v6 = (MFAccountValidator *)objc_alloc_init(MEMORY[0x1E0D4D4F0]);
  validator = self->_validator;
  self->_validator = v6;

  -[MFAccountValidator setDelegate:](self->_validator, "setDelegate:", self);
  -[MFAccountValidator validateAccount:useSSL:](self->_validator, "validateAccount:useSSL:", v4, 1);

}

- (void)accountValidator:(id)a3 finishedValidationOfAccount:(id)a4 usedSSL:(BOOL)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void (**handler)(id, uint64_t, _QWORD);
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void (**v17)(id, _QWORD, void *);
  NSObject *v18;
  void *v19;
  MFAccountValidator *validator;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v7, "accountIsValid") & 1) != 0)
  {
    _AAUILogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1DB4ED000, v9, OS_LOG_TYPE_DEFAULT, "Email account has been verified.", (uint8_t *)&v21, 2u);
    }

    if (self->_isVerifyingExistingEmailAccount)
    {
      handler = (void (**)(id, uint64_t, _QWORD))self->_handler;
      if (handler)
        handler[2](handler, 1, 0);
    }
    else
    {
      -[AAUICloudSyncServicesController _addMailAccount:](self, "_addMailAccount:", v8);
    }
  }
  else
  {
    objc_msgSend(v7, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "code");
    v13 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v11, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 == 1032)
      v15 = 111;
    else
      v15 = 112;
    objc_msgSend(v13, "aa_errorWithCode:userInfo:", v15, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void (**)(id, _QWORD, void *))self->_handler;
    if (v17)
      v17[2](v17, 0, v16);

    _AAUILogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "localizedDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412290;
      v22 = v19;
      _os_log_impl(&dword_1DB4ED000, v18, OS_LOG_TYPE_DEFAULT, "Email account verification failed: %@", (uint8_t *)&v21, 0xCu);

    }
  }
  validator = self->_validator;
  self->_validator = 0;

}

- (void)_addMailAccount:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = (void *)MEMORY[0x1E0D4D620];
  v5 = a3;
  objc_msgSend(v4, "mailAccounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D4D620], "setMailAccounts:", v7);
  if (self->_handler)
  {
    _AAUILogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "IMAP: Email account added", v9, 2u);
    }

    (*((void (**)(void))self->_handler + 2))();
  }

}

+ (id)_domainFromAddress:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("@"));
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "substringFromIndex:", v4 + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)_usernameFromAddress:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("+"));
  if (!v5)
    v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("@"));
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "substringToIndex:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_verifier, 0);
  objc_storeStrong((id *)&self->_validator, 0);
  objc_storeStrong((id *)&self->_queuedDataclassStates, 0);
  objc_storeStrong((id *)&self->_dataclassesRequiringMergeDecision, 0);
  objc_storeStrong((id *)&self->_queuedDataclassActions, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

- (void)completeEnablingCloudServicesWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[AAUICloudSyncServicesController completeEnablingCloudServicesWithCompletion:]";
  _os_log_fault_impl(&dword_1DB4ED000, log, OS_LOG_TYPE_FAULT, "%s: attempted to completeEnablingCloudServicesWithCompletion with a nil account", (uint8_t *)&v1, 0xCu);
}

@end
