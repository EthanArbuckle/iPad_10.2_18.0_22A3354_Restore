@implementation AAUIAuthKitPasswordChangeHook

- (AAUIAuthKitPasswordChangeHook)initWithAltDSID:(id)a3
{
  id v4;
  AAUIAuthKitPasswordChangeHook *v5;
  void *v6;
  uint64_t v7;
  ACAccount *appleAccount;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AAUIAuthKitPasswordChangeHook;
  v5 = -[AAUIAuthKitPasswordChangeHook init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "aa_appleAccountWithAltDSID:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    appleAccount = v5->_appleAccount;
    v5->_appleAccount = (ACAccount *)v7;

  }
  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v8;
  NSObject *v9;

  v8 = a6;
  _AALogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    -[AAUIAuthKitPasswordChangeHook processElement:attributes:objectModel:completion:].cold.1((uint64_t)self, a2, v9);

  (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
}

- (BOOL)shouldMatchElement:(id)a3
{
  return 0;
}

- (BOOL)shouldMatchModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v3 = a3;
  objc_msgSend(v3, "clientInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("newPasswordRowId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "clientInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("currentPasswordRowId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v6 = 1;
    }
    else
    {
      objc_opt_class();
      objc_msgSend(v3, "clientInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("passwordUpdated"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;

      v6 = objc_msgSend(v11, "BOOLValue");
    }

  }
  return v6;
}

- (void)harvestDataFromResponse:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "statusCode") != 401)
    -[AAUIAuthKitPasswordChangeHook _harvestDataFromServerHTTPResponse:](self, "_harvestDataFromServerHTTPResponse:", v4);

}

- (void)textFieldEditingDidEnd:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *oldPassword;
  _BOOL4 v8;
  NSObject *v9;
  NSString *v10;
  NSString *v11;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t buf[16];

  v4 = a3;
  -[RUITableViewRow control](self->_oldPasswordRow, "control");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    _AAUILogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v9, OS_LOG_TYPE_DEFAULT, "User has entered their old password.", buf, 2u);
    }

    objc_msgSend(v4, "text");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    oldPassword = self->_oldPassword;
    self->_oldPassword = v10;
  }
  else
  {
    -[RUITableViewRow control](self->_newPasswordRow, "control");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    _AAUILogSystem();
    oldPassword = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(oldPassword, OS_LOG_TYPE_DEFAULT);
    if (v6 == v4)
    {
      if (v8)
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1DB4ED000, oldPassword, OS_LOG_TYPE_DEFAULT, "User has entered a new password. Will not commit just yet.", v13, 2u);
      }

      objc_msgSend(v4, "text");
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      oldPassword = self->_newPassword;
      self->_newPassword = v11;
    }
    else if (v8)
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1DB4ED000, oldPassword, OS_LOG_TYPE_DEFAULT, "Received delegate callback from unknown textField, ignoring...", v12, 2u);
    }
  }

}

- (void)_handleChangeForObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  RUITableViewRow *v11;
  RUITableViewRow *oldPasswordRow;
  NSObject *v13;
  RUITableViewRow *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  RUITableViewRow *newPasswordRow;
  RUITableViewRow *v22;
  RUITableViewRow *v23;
  RUITableViewRow *v24;
  void *v25;
  id v26;
  id v27;
  int v28;
  int v29;
  RUITableViewRow *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  objc_msgSend(v6, "clientInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("currentPasswordRowId"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  if (v10)
  {
    -[AAUIAuthKitPasswordChangeHook _tableViewRowWithID:inObjectModel:](self, "_tableViewRowWithID:inObjectModel:", v10, v6);
    v11 = (RUITableViewRow *)objc_claimAutoreleasedReturnValue();
    oldPasswordRow = self->_oldPasswordRow;
    self->_oldPasswordRow = v11;

    -[RUITableViewRow setTextFieldChangeObserver:](self->_oldPasswordRow, "setTextFieldChangeObserver:", self);
    _AAUILogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = self->_oldPasswordRow;
      v29 = 138412546;
      v30 = v14;
      v31 = 2112;
      v32 = v10;
      _os_log_impl(&dword_1DB4ED000, v13, OS_LOG_TYPE_DEFAULT, "Found old password row %@ for identifier %@.", (uint8_t *)&v29, 0x16u);
    }
  }
  else
  {
    _AAUILogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_1DB4ED000, v15, OS_LOG_TYPE_DEFAULT, "Server did not provide an old password row identifier.", (uint8_t *)&v29, 2u);
    }

    v13 = self->_oldPasswordRow;
    self->_oldPasswordRow = 0;
  }

  objc_opt_class();
  objc_msgSend(v6, "clientInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("newPasswordRowId"));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;

  _AAUILogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (v20)
    {
      newPasswordRow = self->_newPasswordRow;
      v29 = 138412546;
      v30 = newPasswordRow;
      v31 = 2112;
      v32 = v18;
      _os_log_impl(&dword_1DB4ED000, v19, OS_LOG_TYPE_DEFAULT, "Found new password row %@ for identifier %@.", (uint8_t *)&v29, 0x16u);
    }

    -[AAUIAuthKitPasswordChangeHook _tableViewRowWithID:inObjectModel:](self, "_tableViewRowWithID:inObjectModel:", v18, v6);
    v22 = (RUITableViewRow *)objc_claimAutoreleasedReturnValue();
    v23 = self->_newPasswordRow;
    self->_newPasswordRow = v22;

    -[RUITableViewRow setTextFieldChangeObserver:](self->_newPasswordRow, "setTextFieldChangeObserver:", self);
  }
  else
  {
    if (v20)
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_1DB4ED000, v19, OS_LOG_TYPE_DEFAULT, "Server did not provide a new password row identifier.", (uint8_t *)&v29, 2u);
    }

    v24 = self->_newPasswordRow;
    self->_newPasswordRow = 0;

  }
  objc_opt_class();
  objc_msgSend(v6, "clientInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("passwordUpdated"));
  v26 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v27 = v26;
  else
    v27 = 0;

  v28 = objc_msgSend(v27, "BOOLValue");
  if (v28)
    -[AAUIAuthKitPasswordChangeHook _updateiCloudAccountWithCompletion:](self, "_updateiCloudAccountWithCompletion:", v7);
  else
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);

}

- (void)_harvestDataFromServerHTTPResponse:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138477827;
    v11 = v4;
    _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "Harvesting data from response: %{private}@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(v4, "allHeaderFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("X-Apple-I-Password-Updated"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8)
  {
    _AAUILogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1DB4ED000, v9, OS_LOG_TYPE_DEFAULT, "Found password update singal in the HTTP response.", (uint8_t *)&v10, 2u);
    }

    -[AAUIAuthKitPasswordChangeHook _updateiCloudAccountWithCompletion:](self, "_updateiCloudAccountWithCompletion:", 0);
  }

}

- (void)_updateiCloudAccountWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSUInteger v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSUInteger v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  uint8_t buf[16];

  v4 = a3;
  -[AAUIAuthKitPasswordChangeHook appleAccount](self, "appleAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = -[NSString length](self->_newPassword, "length");
    _AAUILogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "Committing new password locally.", buf, 2u);
      }

      -[AAUIAuthKitPasswordChangeHook appleAccount](self, "appleAccount");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_aa_setRawPassword:", self->_newPassword);

      v10 = -[NSString length](self->_oldPassword, "length");
      _AAUILogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v10)
      {
        if (v12)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DB4ED000, v11, OS_LOG_TYPE_DEFAULT, "Setting old password on account credentials.", buf, 2u);
        }

        -[AAUIAuthKitPasswordChangeHook appleAccount](self, "appleAccount");
        v11 = objc_claimAutoreleasedReturnValue();
        -[NSObject credential](v11, "credential");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setCredentialItem:forKey:", self->_oldPassword, *MEMORY[0x1E0C8F218]);

      }
      else if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB4ED000, v11, OS_LOG_TYPE_DEFAULT, "Server UI flow did not provide an old password.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAUIAuthKitPasswordChangeHook appleAccount](self, "appleAccount");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __68__AAUIAuthKitPasswordChangeHook__updateiCloudAccountWithCompletion___block_invoke;
      v31[3] = &unk_1EA2DDBE8;
      v32 = v4;
      objc_msgSend(v29, "renewCredentialsForAccount:completion:", v30, v31);

      goto LABEL_20;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AAUIAuthKitPasswordChangeHook _updateiCloudAccountWithCompletion:].cold.2(v8, v22, v23, v24, v25, v26, v27, v28);

    if (v4)
LABEL_16:
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }
  else
  {
    _AAUILogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[AAUIAuthKitPasswordChangeHook _updateiCloudAccountWithCompletion:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

    if (v4)
      goto LABEL_16;
  }
LABEL_20:

}

void __68__AAUIAuthKitPasswordChangeHook__updateiCloudAccountWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void (*v8)(void);
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218242;
    v10 = a2;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Result of renewing credentials to continue password change request: %ld. Error: %@", (uint8_t *)&v9, 0x16u);
  }

  v7 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    if (v7)
    {
      v8 = *(void (**)(void))(v7 + 16);
LABEL_8:
      v8();
    }
  }
  else if (v7)
  {
    v8 = *(void (**)(void))(v7 + 16);
    goto LABEL_8;
  }

}

- (id)_tableViewRowWithID:(id)a3 inObjectModel:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(a4, "allPages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v45 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        if (objc_msgSend(v11, "hasTableView"))
        {
          objc_msgSend(v11, "tableViewOM");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v35 = v12;
          objc_msgSend(v12, "sections");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
          if (v31)
          {
            v14 = *(_QWORD *)v41;
            v33 = v13;
            v34 = v6;
            v29 = v8;
            v30 = v9;
            v28 = *(_QWORD *)v41;
            do
            {
              v15 = 0;
              do
              {
                if (*(_QWORD *)v41 != v14)
                  objc_enumerationMutation(v13);
                v32 = v15;
                v16 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v15);
                v36 = 0u;
                v37 = 0u;
                v38 = 0u;
                v39 = 0u;
                objc_msgSend(v16, "rows", v28, v29, v30);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
                if (v18)
                {
                  v19 = v18;
                  v20 = *(_QWORD *)v37;
                  while (2)
                  {
                    for (j = 0; j != v19; ++j)
                    {
                      if (*(_QWORD *)v37 != v20)
                        objc_enumerationMutation(v17);
                      v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
                      objc_msgSend(v22, "attributes");
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("id"));
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      v25 = objc_msgSend(v24, "isEqual:", v5);

                      if ((v25 & 1) != 0)
                      {
                        v26 = v22;

                        v6 = v34;
                        goto LABEL_28;
                      }
                    }
                    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
                    if (v19)
                      continue;
                    break;
                  }
                }

                v15 = v32 + 1;
                v13 = v33;
                v6 = v34;
                v8 = v29;
                v9 = v30;
                v14 = v28;
              }
              while (v32 + 1 != v31);
              v31 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
            }
            while (v31);
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
      v26 = 0;
    }
    while (v8);
  }
  else
  {
    v26 = 0;
  }
LABEL_28:

  return v26;
}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (ACAccount)appleAccount
{
  return self->_appleAccount;
}

- (void)setAppleAccount:(id)a3
{
  objc_storeStrong((id *)&self->_appleAccount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleAccount, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_oldPassword, 0);
  objc_storeStrong((id *)&self->_oldPasswordRow, 0);
  objc_storeStrong((id *)&self->_newPassword, 0);
  objc_storeStrong((id *)&self->_newPasswordRow, 0);
}

- (void)processElement:(NSObject *)a3 attributes:objectModel:completion:.cold.1(uint64_t a1, const char *a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  _os_log_fault_impl(&dword_1DB4ED000, a3, OS_LOG_TYPE_FAULT, "%@: %@ is not supported.", (uint8_t *)&v8, 0x16u);

}

- (void)_updateiCloudAccountWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, a1, a3, "User not signed in to an AppleAccount, not updating account", a5, a6, a7, a8, 0);
}

- (void)_updateiCloudAccountWithCompletion:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, a1, a3, "Error: asked to update iCloud password but we failed to get one from BML.", a5, a6, a7, a8, 0);
}

@end
