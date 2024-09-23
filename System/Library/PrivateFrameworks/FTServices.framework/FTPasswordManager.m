@implementation FTPasswordManager

+ (id)sharedInstance
{
  if (qword_1ECF9D858 != -1)
    dispatch_once(&qword_1ECF9D858, &unk_1E4DD94F0);
  return (id)qword_1ECF9D8A0;
}

- (FTPasswordManager)init
{
  uint64_t v2;
  void *v4;
  const char *v5;
  FTPasswordManager *v6;

  objc_msgSend_sharedInstance(MEMORY[0x1E0D36B08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (FTPasswordManager *)objc_msgSend_initWithUserNotificationCenter_(self, v5, (uint64_t)v4);

  return v6;
}

- (FTPasswordManager)initWithUserNotificationCenter:(id)a3
{
  id v5;
  FTPasswordManager *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  ACAccountStore *accountStore;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FTPasswordManager;
  v6 = -[FTPasswordManager init](&v17, sel_init);
  if (v6)
  {
    v7 = objc_alloc((Class)MEMORY[0x1A85A5DE0](CFSTR("ACMonitoredAccountStore"), CFSTR("Accounts")));
    v8 = (void *)MEMORY[0x1E0C99E60];
    sub_1A4CAE918();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1A4CAE958();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithObjects_(v8, v11, (uint64_t)v9, v10, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_initWithAccountTypes_delegate_(v7, v13, (uint64_t)v12, v6);
    accountStore = v6->_accountStore;
    v6->_accountStore = (ACAccountStore *)v14;

    objc_storeStrong((id *)&v6->_userNotificationCenter, a3);
  }

  return v6;
}

- (BOOL)supportsAuthTokenRequests
{
  return 1;
}

- (void)_setKeychainPassword:(id)a3 forUsername:(id)a4 service:(id)a5
{
  IMSetKeychainPassword();
}

- (id)_keychainPasswordForUsername:(id)a3 service:(id)a4
{
  id v5;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;

  v5 = a3;
  v6 = a4;
  IMGetKeychainPassword();
  v7 = 0;
  if (!objc_msgSend_length(v7, v8, v9))
  {
    IMGenerateLoginID();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      sub_1A4CBB6B0();

    IMGetKeychainPassword();
    v14 = v7;

    v7 = v14;
  }

  return v7;
}

- (void)_setKeychainAuthToken:(id)a3 forUsername:(id)a4 service:(id)a5
{
  id v6;
  id v7;
  id v8;

  v6 = a5;
  v7 = a3;
  IMCanonicalFormForEmail();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  IMSetKeychainAuthToken();

}

- (id)_keychainAuthTokenForUsername:(id)a3 service:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;

  v5 = a3;
  v6 = a4;
  IMCanonicalFormForEmail();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  IMGetKeychainAuthToken();
  v8 = 0;
  if (!objc_msgSend_length(v8, v9, v10))
  {
    IMGenerateLoginID();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      sub_1A4CBB6B0();

    IMGetKeychainAuthToken();
    v15 = v8;

    v8 = v15;
  }

  return v8;
}

- (id)_findAccountOfType:(id)a3 InStore:(id)a4 withCriteria:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t (**v10)(id, void *);
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  id v41;
  void *v43;
  id v44;
  id v45;
  id obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v10 = (uint64_t (**)(id, void *))a5;
  if (v8)
  {
    if (!v7)
    {
      sub_1A4CAE918();
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_accountTypeWithAccountTypeIdentifier_(v8, v9, (uint64_t)v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountsWithAccountType_(v8, v12, (uint64_t)v11);
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v47, v53, 16);
    if (v14)
    {
      v17 = v14;
      v43 = v11;
      v44 = v8;
      v45 = v7;
      v18 = *(_QWORD *)v48;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v48 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_msgSend_registration(MEMORY[0x1E0D36AA8], v15, v16, v43, v44, v45);
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v52 = v20;
            _os_log_impl(&dword_1A4C7F000, v21, OS_LOG_TYPE_DEFAULT, "Account: %@", buf, 0xCu);
          }

          objc_msgSend_registration(MEMORY[0x1E0D36AA8], v22, v23);
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_username(v20, v25, v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v52 = v27;
            _os_log_impl(&dword_1A4C7F000, v24, OS_LOG_TYPE_DEFAULT, "            username: %@", buf, 0xCu);

          }
          objc_msgSend_registration(MEMORY[0x1E0D36AA8], v28, v29);
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            sub_1A4CAEF9C(v20);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v52 = v31;
            _os_log_impl(&dword_1A4C7F000, v30, OS_LOG_TYPE_DEFAULT, "          profile ID: %@", buf, 0xCu);

          }
          objc_msgSend_registration(MEMORY[0x1E0D36AA8], v32, v33);
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            sub_1A4CAF108(v20);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            sub_1A4CAF050(v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v52 = v36;
            _os_log_impl(&dword_1A4C7F000, v34, OS_LOG_TYPE_DEFAULT, "               token: %@", buf, 0xCu);

          }
          objc_msgSend_registration(MEMORY[0x1E0D36AA8], v37, v38);
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            sub_1A4CAF16C(v20);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v52 = v40;
            _os_log_impl(&dword_1A4C7F000, v39, OS_LOG_TYPE_DEFAULT, "vetted email handles: %@", buf, 0xCu);

          }
          if ((v10[2](v10, v20) & 1) != 0)
          {
            v41 = v20;
            goto LABEL_24;
          }
        }
        v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v47, v53, 16);
        if (v17)
          continue;
        break;
      }
      v41 = 0;
LABEL_24:
      v8 = v44;
      v7 = v45;
      v11 = v43;
    }
    else
    {
      v41 = 0;
    }

  }
  else
  {
    v41 = 0;
  }

  return v41;
}

- (id)_findIDSAccountsInStore:(id)a3 withCriteria:(id)a4
{
  id v5;
  unsigned int (**v6)(id, void *);
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  void *v41;
  void *v42;
  id v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (unsigned int (**)(id, void *))a4;
  if (v5)
  {
    sub_1A4CAE918();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountTypeWithAccountTypeIdentifier_(v5, v7, (uint64_t)v42);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v9, v10);
    v43 = (id)objc_claimAutoreleasedReturnValue();
    v41 = (void *)v8;
    objc_msgSend_accountsWithAccountType_(v5, v11, v8);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v45, v51, 16);
    if (v13)
    {
      v16 = v13;
      v17 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v46 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend_registration(MEMORY[0x1E0D36AA8], v14, v15);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v50 = v19;
            _os_log_impl(&dword_1A4C7F000, v20, OS_LOG_TYPE_DEFAULT, "Account: %@", buf, 0xCu);
          }

          objc_msgSend_registration(MEMORY[0x1E0D36AA8], v21, v22);
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_username(v19, v24, v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v50 = v26;
            _os_log_impl(&dword_1A4C7F000, v23, OS_LOG_TYPE_DEFAULT, "            username: %@", buf, 0xCu);

          }
          objc_msgSend_registration(MEMORY[0x1E0D36AA8], v27, v28);
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            sub_1A4CAEF9C(v19);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v50 = v30;
            _os_log_impl(&dword_1A4C7F000, v29, OS_LOG_TYPE_DEFAULT, "          profile ID: %@", buf, 0xCu);

          }
          objc_msgSend_registration(MEMORY[0x1E0D36AA8], v31, v32);
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            sub_1A4CAF108(v19);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            sub_1A4CAF050(v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v50 = v35;
            _os_log_impl(&dword_1A4C7F000, v33, OS_LOG_TYPE_DEFAULT, "               token: %@", buf, 0xCu);

          }
          objc_msgSend_registration(MEMORY[0x1E0D36AA8], v36, v37);
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            sub_1A4CAF16C(v19);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v50 = v39;
            _os_log_impl(&dword_1A4C7F000, v38, OS_LOG_TYPE_DEFAULT, "vetted email handles: %@", buf, 0xCu);

          }
          if (v6[2](v6, v19))
            objc_msgSend_addObject_(v43, v14, (uint64_t)v19);
        }
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v45, v51, 16);
      }
      while (v16);
    }

  }
  else
  {
    v43 = 0;
  }

  return v43;
}

- (id)_findIDSAccountInStore:(id)a3 withCriteria:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const char *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  sub_1A4CAE918();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__findAccountOfType_InStore_withCriteria_(self, v9, (uint64_t)v8, v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_findGameCenterAccountInStore:(id)a3 withCriteria:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const char *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  sub_1A4CAE958();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__findAccountOfType_InStore_withCriteria_(self, v9, (uint64_t)v8, v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_accountWithUsername:(id)a3 inStore:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1A4CAF89C;
  v11[3] = &unk_1E4DD9FB8;
  v12 = v6;
  v7 = v6;
  objc_msgSend__findIDSAccountInStore_withCriteria_(self, v8, (uint64_t)a4, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_gameCenterAccountWithUsername:(id)a3
{
  id v4;
  ACAccountStore *accountStore;
  id v6;
  const char *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  accountStore = self->_accountStore;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1A4CAFAF4;
  v10[3] = &unk_1E4DD9FB8;
  v11 = v4;
  v6 = v4;
  objc_msgSend__findGameCenterAccountInStore_withCriteria_(self, v7, (uint64_t)accountStore, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)gameCenterPropertiesFromAccountWithUsername:(id)a3
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *UpdatedDate;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  const char *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  int v30;
  NSObject *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v30 = 138412290;
    v31 = v4;
    _os_log_impl(&dword_1A4C7F000, v7, OS_LOG_TYPE_DEFAULT, "Fetching GS account for username %@", (uint8_t *)&v30, 0xCu);
  }

  objc_msgSend__gameCenterAccountWithUsername_(self, v8, (uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  if (v9)
  {
    objc_msgSend_valueForKey_(v9, v10, (uint64_t)CFSTR("_properties"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
      v15 = v13;
    else
      v15 = objc_alloc_init(MEMORY[0x1E0C99D80]);
    v16 = v15;

    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 138412290;
      v31 = v16;
      _os_log_impl(&dword_1A4C7F000, v20, OS_LOG_TYPE_DEFAULT, "Properties on found account: %@", (uint8_t *)&v30, 0xCu);
    }

    v21 = objc_alloc(MEMORY[0x1E0D34D48]);
    objc_msgSend_objectForKey_(v16, v22, *MEMORY[0x1E0D343F8]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v16, v24, *MEMORY[0x1E0D34408]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v16, v26, *MEMORY[0x1E0D34400]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    UpdatedDate = (void *)objc_msgSend_initWithAssociationID_sharingState_lastUpdatedDate_(v21, v28, (uint64_t)v23, v25, v27);

  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v10, v11);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 138412290;
      v31 = v4;
      _os_log_impl(&dword_1A4C7F000, v16, OS_LOG_TYPE_DEFAULT, "Found no GameCenter account for username %@", (uint8_t *)&v30, 0xCu);
    }
    UpdatedDate = 0;
  }

  return UpdatedDate;
}

- (id)_accountWithUsernameAlias:(id)a3 inStore:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  const char *v10;
  void *v11;
  id v12;
  const char *v13;
  const char *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1A4CAFE98;
  v20[3] = &unk_1E4DD9FB8;
  v9 = v6;
  v21 = v9;
  objc_msgSend__findIDSAccountInStore_withCriteria_(self, v10, (uint64_t)v7, v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = sub_1A4CB0070;
    v18[3] = &unk_1E4DD9FB8;
    v12 = v9;
    v19 = v12;
    objc_msgSend__findIDSAccountInStore_withCriteria_(self, v13, (uint64_t)v7, v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v16[0] = v8;
      v16[1] = 3221225472;
      v16[2] = sub_1A4CB00EC;
      v16[3] = &unk_1E4DD9FB8;
      v17 = v12;
      objc_msgSend__findIDSAccountInStore_withCriteria_(self, v14, (uint64_t)v7, v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v11;
}

- (id)_profileIDForUsername:(id)a3 inStore:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend__accountWithUsername_inStore_(self, a2, (uint64_t)a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    sub_1A4CAEF9C(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_accountWithProfileID:(id)a3 username:(id)a4 inStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  _QWORD v37[4];
  NSObject *v38;
  _QWORD v39[4];
  NSObject *v40;
  id v41;
  _QWORD v42[4];
  NSObject *v43;
  _QWORD v44[4];
  NSObject *v45;
  uint8_t buf[4];
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v47 = v8;
    _os_log_impl(&dword_1A4C7F000, v13, OS_LOG_TYPE_DEFAULT, "Searching for profileID %@", buf, 0xCu);
  }

  if (!v8)
    goto LABEL_17;
  v16 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = sub_1A4CB04A8;
  v44[3] = &unk_1E4DD9FB8;
  v17 = v8;
  v45 = v17;
  objc_msgSend__findIDSAccountInStore_withCriteria_(self, v18, (uint64_t)v10, v44);
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v22 = (void *)v19;
    v23 = v45;
LABEL_20:

    goto LABEL_21;
  }
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v20, v21);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4C7F000, v24, OS_LOG_TYPE_DEFAULT, "Didn't find an authenticated account with a DSID; attempting to fall back to an unauthenticated match that has a password",
      buf,
      2u);
  }

  v42[0] = v16;
  v42[1] = 3221225472;
  v42[2] = sub_1A4CB0540;
  v42[3] = &unk_1E4DD9FB8;
  v25 = v17;
  v43 = v25;
  objc_msgSend__findIDSAccountInStore_withCriteria_(self, v26, (uint64_t)v10, v42);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4C7F000, v29, OS_LOG_TYPE_DEFAULT, "Didn't find a DISD match with a password; attempting to fall back to an unauthenticated DISD and username match",
        buf,
        2u);
    }

    v39[0] = v16;
    v39[1] = 3221225472;
    v39[2] = sub_1A4CB05F8;
    v39[3] = &unk_1E4DD9FE0;
    v30 = v25;
    v40 = v30;
    v41 = v9;
    objc_msgSend__findIDSAccountInStore_withCriteria_(self, v31, (uint64_t)v10, v39);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v32, v33);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4C7F000, v34, OS_LOG_TYPE_DEFAULT, "Didn't find an unauthenticated DISD and username match; attempting to fall back to an unauthenticated DSID match",
          buf,
          2u);
      }

      v37[0] = v16;
      v37[1] = 3221225472;
      v37[2] = sub_1A4CB0690;
      v37[3] = &unk_1E4DD9FB8;
      v38 = v30;
      objc_msgSend__findIDSAccountInStore_withCriteria_(self, v35, (uint64_t)v10, v37);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  if (!v22)
  {
LABEL_17:
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v14, v15);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4C7F000, v23, OS_LOG_TYPE_DEFAULT, "Didn't find a DSID match!", buf, 2u);
    }
    v22 = 0;
    goto LABEL_20;
  }
LABEL_21:

  return v22;
}

- (id)_accountWithProfileIDMatchingUser:(id)a3 inStore:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  int v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend__profileIDForUsername_inStore_(self, v8, (uint64_t)v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__accountWithProfileID_username_inStore_(self, v10, (uint64_t)v9, v6, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v11, v12);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138412290;
      v25 = v6;
      _os_log_impl(&dword_1A4C7F000, v14, OS_LOG_TYPE_DEFAULT, "Couldn't match based on any known DSID of %@; attempting to fall back to a username match",
        (uint8_t *)&v24,
        0xCu);
    }

    objc_msgSend__accountWithUsername_inStore_(self, v15, (uint64_t)v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v16, v17);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v24 = 138412290;
        v25 = v6;
        _os_log_impl(&dword_1A4C7F000, v18, OS_LOG_TYPE_DEFAULT, "Couldn't find a username match for %@; attempting to search aliases of known accounts",
          (uint8_t *)&v24,
          0xCu);
      }

      objc_msgSend__accountWithUsernameAlias_inStore_(self, v19, (uint64_t)v6, v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        objc_msgSend_registration(MEMORY[0x1E0D36AA8], v20, v21);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v24) = 0;
          _os_log_impl(&dword_1A4C7F000, v22, OS_LOG_TYPE_DEFAULT, "Didn't find any matching account!", (uint8_t *)&v24, 2u);
        }

        v13 = 0;
      }
    }
  }

  return v13;
}

- (id)_accountBasedOnProfileID:(id)a3 orUsername:(id)a4 inStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  int v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend__accountWithProfileID_username_inStore_(self, v11, (uint64_t)v8, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v12;
  if (v12)
  {
    v16 = v12;
  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v13, v14);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412546;
      v22 = v8;
      v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_1A4C7F000, v17, OS_LOG_TYPE_DEFAULT, "Didn't find profileID %@; attempting to use username %@",
        (uint8_t *)&v21,
        0x16u);
    }

    objc_msgSend__accountWithProfileIDMatchingUser_inStore_(self, v18, (uint64_t)v9, v10);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v16;

  return v19;
}

- (void)updatePreviousUsername:(id)a3 toNewUsername:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  ACAccountStore *accountStore;
  id v13;
  id v14;
  id v15;
  const char *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v6;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_1A4C7F000, v10, OS_LOG_TYPE_DEFAULT, "Updating username on accounts { previousUsername: %@, newUsername: %@ }", buf, 0x16u);
  }

  sub_1A4CAE918();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  accountStore = self->_accountStore;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1A4CB0B88;
  v17[3] = &unk_1E4DDA058;
  v17[4] = self;
  v18 = v6;
  v19 = v7;
  v20 = v11;
  v13 = v11;
  v14 = v7;
  v15 = v6;
  objc_msgSend_accountTypeWithIdentifier_completion_(accountStore, v16, (uint64_t)v13, v17);

}

- (BOOL)_shouldForceSilentOnlyAuthForUsername:(id)a3 serviceIdentifier:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  int isEqualToString;
  int v12;
  NSObject *v13;
  const __CFString *v14;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v10 = v7;
  if (v7)
  {
    isEqualToString = objc_msgSend_isEqualToString_(v7, v8, (uint64_t)CFSTR("com.apple.private.alloy.itunes"));
    v12 = 0;
    if (v6 && isEqualToString)
      v12 = objc_msgSend__usernameHasCorrespondingIdMSAccount_(self, v8, (uint64_t)v6) ^ 1;
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v8, v9);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = CFSTR("NO");
    v16 = 138412802;
    v17 = v6;
    v18 = 2112;
    if (v12)
      v14 = CFSTR("YES");
    v19 = v10;
    v20 = 2112;
    v21 = v14;
    _os_log_impl(&dword_1A4C7F000, v13, OS_LOG_TYPE_DEFAULT, "Determined if we should force silent-only auth { username: %@, serviceIdentifier: %@, shouldForceSilentAuth: %@ }", (uint8_t *)&v16, 0x20u);
  }

  return v12;
}

- (BOOL)_usernameHasCorrespondingIdMSAccount:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  ACAccountStore *accountStore;
  const char *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  const char *v21;
  int isEqualToString;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  _BOOL4 v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  NSObject *v35;
  BOOL v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v4;
    _os_log_impl(&dword_1A4C7F000, v7, OS_LOG_TYPE_DEFAULT, "Checking if username has a corresponding IdMS ACAccount instance { username: %@ }", buf, 0xCu);
  }

  accountStore = self->_accountStore;
  if (qword_1EE788AB0 != -1)
    dispatch_once(&qword_1EE788AB0, &unk_1E4DDA310);
  objc_msgSend_accountTypeWithAccountTypeIdentifier_(accountStore, v8, qword_1EE788A88);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountsWithAccountType_(self->_accountStore, v10, (uint64_t)v42);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v43, v51, 16);
  if (v13)
  {
    v16 = v13;
    v17 = *(_QWORD *)v44;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v44 != v17)
          objc_enumerationMutation(v11);
        v19 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend_username(v19, v14, v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v20, v21, (uint64_t)v4);

        objc_msgSend_registration(MEMORY[0x1E0D36AA8], v23, v24);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
        if (isEqualToString)
        {
          if (v26)
          {
            objc_msgSend_identifier(v19, v27, v28);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_username(v19, v38, v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v48 = v37;
            v49 = 2112;
            v50 = v40;
            _os_log_impl(&dword_1A4C7F000, v25, OS_LOG_TYPE_DEFAULT, "IdMS ACAccount instance matches { accountID: %@, accountUsername: %@ }", buf, 0x16u);

          }
          v36 = 1;
          v35 = v11;
          goto LABEL_21;
        }
        if (v26)
        {
          objc_msgSend_identifier(v19, v27, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_username(v19, v30, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v48 = v29;
          v49 = 2112;
          v50 = v32;
          _os_log_impl(&dword_1A4C7F000, v25, OS_LOG_TYPE_DEFAULT, "IdMS ACAccount instance does not match { accountID: %@, accountUsername: %@ }", buf, 0x16u);

        }
      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v43, v51, 16);
      if (v16)
        continue;
      break;
    }
  }

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v33, v34);
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v4;
    _os_log_impl(&dword_1A4C7F000, v35, OS_LOG_TYPE_DEFAULT, "Unable to find a corresponding IdMS ACAccount instance { username: %@ }", buf, 0xCu);
  }
  v36 = 0;
LABEL_21:

  return v36;
}

- (void)performCleanUpWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  ACAccountStore *accountStore;
  id v10;
  id v11;
  const char *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4C7F000, v7, OS_LOG_TYPE_DEFAULT, "Performing clean-up on accounts", buf, 2u);
  }

  sub_1A4CAE918();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  accountStore = self->_accountStore;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1A4CB15D8;
  v13[3] = &unk_1E4DDA0A8;
  v14 = v8;
  v15 = v4;
  v13[4] = self;
  v10 = v8;
  v11 = v4;
  objc_msgSend_accountTypeWithIdentifier_completion_(accountStore, v12, (uint64_t)v10, v13);

}

- (void)cleanUpAccountsWithUsername:(id)a3 orProfileID:(id)a4 basedOnInUseUsernames:(id)a5 profileIDs:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  ACAccountStore *accountStore;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  const char *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v17, v18);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v37 = v12;
    v38 = 2112;
    v39 = v13;
    v40 = 2112;
    v41 = v14;
    v42 = 2112;
    v43 = v15;
    _os_log_impl(&dword_1A4C7F000, v19, OS_LOG_TYPE_DEFAULT, "Cleaning up accounts {username: %@, profileID: %@, inUseUsernames: %@, inUseProfileIDs: %@ }", buf, 0x2Au);
  }

  sub_1A4CAE918();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  accountStore = self->_accountStore;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = sub_1A4CB1D74;
  v29[3] = &unk_1E4DDA0F8;
  v29[4] = self;
  v30 = v12;
  v31 = v13;
  v32 = v14;
  v34 = v20;
  v35 = v16;
  v33 = v15;
  v22 = v20;
  v23 = v16;
  v24 = v15;
  v25 = v14;
  v26 = v13;
  v27 = v12;
  objc_msgSend_accountTypeWithIdentifier_completion_(accountStore, v28, (uint64_t)v22, v29);

}

- (void)cleanUpAccountsBasedOnInUseUsernamesBlock:(id)a3 profileIDBlock:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  ACAccountStore *accountStore;
  id v18;
  id v19;
  id v20;
  id v21;
  const char *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)MEMORY[0x1A85A6380](v8);
    v15 = (void *)MEMORY[0x1A85A6380](v9);
    *(_DWORD *)buf = 138412546;
    v29 = v14;
    v30 = 2112;
    v31 = v15;
    _os_log_impl(&dword_1A4C7F000, v13, OS_LOG_TYPE_DEFAULT, "Begin cleaning up unused accounts { usernameBlock : %@, profileIDBlock : %@ }", buf, 0x16u);

  }
  sub_1A4CAE918();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  accountStore = self->_accountStore;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_1A4CB26F4;
  v23[3] = &unk_1E4DDA148;
  v25 = v8;
  v26 = v9;
  v27 = v10;
  v23[4] = self;
  v24 = v16;
  v18 = v16;
  v19 = v10;
  v20 = v9;
  v21 = v8;
  objc_msgSend_accountTypeWithIdentifier_completion_(accountStore, v22, (uint64_t)v18, v23);

}

- (void)fetchPasswordForProfileID:(id)a3 username:(id)a4 service:(id)a5 outRequestID:(id *)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  NSMutableSet *runningQueries;
  NSMutableSet *v26;
  NSMutableSet *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  __CFString *v32;
  __CFString *v33;
  const char *v34;
  uint64_t v35;
  __CFString *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  NSObject *v44;
  const char *v45;
  uint64_t v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  __CFString *v53;
  const char *v54;
  uint64_t v55;
  NSObject *v56;
  const char *v57;
  uint64_t v58;
  __CFString *v59;
  const char *v60;
  uint64_t v61;
  NSObject *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const __CFString *v66;
  const char *v67;
  uint64_t v68;
  NSObject *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  __CFString *v73;
  const char *v74;
  uint64_t v75;
  NSObject *v76;
  const char *v77;
  uint64_t v78;
  NSObject *v79;
  const char *v80;
  NSObject *v81;
  const char *v82;
  __CFString *v83;
  void *v84;
  void (**v85)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  __CFString *v86;
  os_activity_scope_state_s state;
  NSObject *v88;
  uint8_t buf[4];
  const __CFString *v90;
  __int16 v91;
  id v92;
  __int16 v93;
  id v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v86 = (__CFString *)a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v88 = _os_activity_create(&dword_1A4C7F000, "Password manager fetch password", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v88, &state);
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v15, v16);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v90 = v86;
    v91 = 2112;
    v92 = v12;
    v93 = 2112;
    v94 = v13;
    _os_log_impl(&dword_1A4C7F000, v17, OS_LOG_TYPE_DEFAULT, "Fetching password for profileID: %@ username: %@ service: %@", buf, 0x20u);
  }

  v85 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_msgSend_copy(v14, v18, v19);
  sub_1A4CB3730(v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringGUID(MEMORY[0x1E0CB3940], v21, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  runningQueries = self->_runningQueries;
  if (!runningQueries)
  {
    v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v27 = self->_runningQueries;
    self->_runningQueries = v26;

    runningQueries = self->_runningQueries;
  }
  objc_msgSend_addObject_(runningQueries, v23, (uint64_t)v24);
  if (a6)
    *a6 = objc_retainAutorelease(v24);
  if (objc_msgSend_isEqualToString_(v20, v28, *MEMORY[0x1E0D34BA0]))
  {
    objc_msgSend__accountBasedOnProfileID_orUsername_inStore_(self, v29, (uint64_t)v86, v12, self->_accountStore);
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend__credentialForAccount_(self, v30, (uint64_t)v32);
      v83 = (__CFString *)objc_claimAutoreleasedReturnValue();
      sub_1A4CAEF9C(v32);
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
      sub_1A4CB37F4(v32, v34, v35);
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_password(v83, v37, v38);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1A4CB38A4(v32);
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v39, v40);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v90 = v32;
        _os_log_impl(&dword_1A4C7F000, v41, OS_LOG_TYPE_DEFAULT, "  Found account: %@", buf, 0xCu);
      }

      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v42, v43);
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v90 = v83;
        _os_log_impl(&dword_1A4C7F000, v44, OS_LOG_TYPE_DEFAULT, "  Credential: %@", buf, 0xCu);
      }

      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v45, v46);
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_accountType(v32, v48, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(v50, v51, v52);
        v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v90 = v53;
        _os_log_impl(&dword_1A4C7F000, v47, OS_LOG_TYPE_DEFAULT, "         => Type: %@", buf, 0xCu);

      }
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v54, v55);
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_username(v32, v57, v58);
        v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v90 = v59;
        _os_log_impl(&dword_1A4C7F000, v56, OS_LOG_TYPE_DEFAULT, "     => Username: %@", buf, 0xCu);

      }
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v60, v61);
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_password(v83, v63, v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = CFSTR("YES");
        if (!v65)
          v66 = CFSTR("NO");
        *(_DWORD *)buf = 138412290;
        v90 = v66;
        _os_log_impl(&dword_1A4C7F000, v62, OS_LOG_TYPE_DEFAULT, "     => Password: %@", buf, 0xCu);

      }
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v67, v68);
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_token(v83, v70, v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1A4CAF050(v72);
        v73 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v90 = v73;
        _os_log_impl(&dword_1A4C7F000, v69, OS_LOG_TYPE_DEFAULT, "   => Auth Token: %@", buf, 0xCu);

      }
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v74, v75);
      v76 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v90 = v33;
        _os_log_impl(&dword_1A4C7F000, v76, OS_LOG_TYPE_DEFAULT, "   => Profile ID: %@", buf, 0xCu);
      }

      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v77, v78);
      v79 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v90 = v36;
        _os_log_impl(&dword_1A4C7F000, v79, OS_LOG_TYPE_DEFAULT, "      => Self ID: %@", buf, 0xCu);
      }

    }
    else
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v30, v31);
      v81 = objc_claimAutoreleasedReturnValue();
      v83 = (__CFString *)v81;
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4C7F000, v81, OS_LOG_TYPE_DEFAULT, "Did not find an account to use! No password fetched.", buf, 2u);
      }
      v33 = 0;
      v36 = 0;
      v84 = 0;
    }

  }
  else
  {
    objc_msgSend__keychainPasswordForUsername_service_(self, v29, (uint64_t)v12, v20);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v36 = 0;
  }
  if (objc_msgSend_containsObject_(self->_runningQueries, v80, (uint64_t)v24))
  {
    if (v85)
      ((void (**)(_QWORD, void *, id, void *, __CFString *, __CFString *, void *, _QWORD, _QWORD))v85)[2](v85, v24, v12, v20, v33, v36, v84, 0, 0);
    objc_msgSend_removeObject_(self->_runningQueries, v82, (uint64_t)v24);
  }

  os_activity_scope_leave(&state);
  cut_arc_os_release();

}

- (void)fetchAuthTokenForProfileID:(id)a3 username:(id)a4 service:(id)a5 outRequestID:(id *)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  NSMutableSet *runningQueries;
  NSMutableSet *v24;
  NSMutableSet *v25;
  const char *v26;
  uint64_t v27;
  _FTPasswordManagerCachedAuthTokenInfo *cachedAuthTokenInfo;
  void **p_cachedAuthTokenInfo;
  void *v30;
  const char *v31;
  int isEqualToIgnoringCase;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  id v41;
  const char *v42;
  uint64_t v43;
  id v44;
  const char *v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  NSObject *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  NSObject *v55;
  const char *v56;
  uint64_t v57;
  NSObject *v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  void *v78;
  const char *v79;
  NSObject *v80;
  _FTPasswordManagerCachedAuthTokenInfo *v81;
  const char *v82;
  const char *v83;
  const char *v84;
  const char *v85;
  const char *v86;
  ACAccountStore *accountStore;
  const char *v88;
  const char *v89;
  uint64_t v90;
  NSObject *v91;
  const char *v92;
  uint64_t v93;
  NSObject *v94;
  const char *v95;
  uint64_t v96;
  NSObject *v97;
  const char *v98;
  uint64_t v99;
  NSObject *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  NSObject *v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  NSObject *v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  const __CFString *v119;
  const char *v120;
  uint64_t v121;
  NSObject *v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  NSObject *v129;
  const char *v130;
  uint64_t v131;
  NSObject *v132;
  const char *v133;
  id v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void (**v139)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v140;
  id v141;
  id v142;
  id v143;
  os_activity_scope_state_s state;
  NSObject *v145;
  uint8_t buf[4];
  id v147;
  __int16 v148;
  id v149;
  __int16 v150;
  id v151;
  uint64_t v152;

  v152 = *MEMORY[0x1E0C80C00];
  v141 = a3;
  v142 = a4;
  v12 = a5;
  v13 = a7;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v145 = _os_activity_create(&dword_1A4C7F000, "Password manager fetch auth token", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v145, &state);
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v14, v15);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v147 = v141;
    v148 = 2112;
    v149 = v142;
    v150 = 2112;
    v151 = v12;
    _os_log_impl(&dword_1A4C7F000, v16, OS_LOG_TYPE_DEFAULT, "Fetching auth token for profileID: %@ username: %@ service: %@", buf, 0x20u);
  }

  v139 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_msgSend_copy(v13, v17, v18);
  sub_1A4CB3730(v12);
  v140 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringGUID(MEMORY[0x1E0CB3940], v19, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  runningQueries = self->_runningQueries;
  if (!runningQueries)
  {
    v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v25 = self->_runningQueries;
    self->_runningQueries = v24;

    runningQueries = self->_runningQueries;
  }
  objc_msgSend_addObject_(runningQueries, v21, (uint64_t)v22);
  if (a6)
    *a6 = objc_retainAutorelease(v22);
  p_cachedAuthTokenInfo = (void **)&self->_cachedAuthTokenInfo;
  cachedAuthTokenInfo = self->_cachedAuthTokenInfo;
  if (cachedAuthTokenInfo
    && (objc_msgSend_profileID(cachedAuthTokenInfo, v26, v27),
        v30 = (void *)objc_claimAutoreleasedReturnValue(),
        isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v30, v31, (uint64_t)v141),
        v30,
        isEqualToIgnoringCase))
  {
    objc_msgSend_profileID(*p_cachedAuthTokenInfo, v26, v33);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_selfID(*p_cachedAuthTokenInfo, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_token(*p_cachedAuthTokenInfo, v37, v38);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_alertInfo(*p_cachedAuthTokenInfo, v39, v40);
    v41 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_status(*p_cachedAuthTokenInfo, v42, v43);
    v44 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v45, v46);
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = *p_cachedAuthTokenInfo;
      *(_DWORD *)buf = 138412290;
      v147 = v48;
      _os_log_impl(&dword_1A4C7F000, v47, OS_LOG_TYPE_DEFAULT, "  Found cached account info: %@", buf, 0xCu);
    }

    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v49, v50);
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      sub_1A4CAF050(v137);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v147 = v52;
      _os_log_impl(&dword_1A4C7F000, v51, OS_LOG_TYPE_DEFAULT, "   => Auth Token: %@", buf, 0xCu);

    }
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v53, v54);
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v147 = v138;
      _os_log_impl(&dword_1A4C7F000, v55, OS_LOG_TYPE_DEFAULT, "   => Profile ID: %@", buf, 0xCu);
    }

    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v56, v57);
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v147 = v36;
      _os_log_impl(&dword_1A4C7F000, v58, OS_LOG_TYPE_DEFAULT, "      => Self ID: %@", buf, 0xCu);
    }
  }
  else
  {
    if (!objc_msgSend_isEqualToString_(v140, v26, *MEMORY[0x1E0D34BA0]))
    {
      objc_msgSend__keychainAuthTokenForUsername_service_(self, v59, (uint64_t)v142, v140);
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      v138 = 0;
      v36 = 0;
      v41 = 0;
      v44 = 0;
      goto LABEL_53;
    }
    objc_msgSend__accountBasedOnProfileID_orUsername_inStore_(self, v59, (uint64_t)v141, v142, self->_accountStore);
    v58 = objc_claimAutoreleasedReturnValue();
    if (v58)
    {
      objc_msgSend__credentialForAccount_(self, v60, (uint64_t)v58);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1A4CAEF9C(v58);
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1A4CB37F4(v58, v62, v63);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_token(v136, v64, v65);
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_accountProperties(v58, v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v68, v69, *MEMORY[0x1E0D34420]);
      v135 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend_integerValue(v135, v70, v71) == 5100 || objc_msgSend_integerValue(v135, v72, v73) == 5103)
      {
        v44 = v135;
        objc_msgSend_accountProperties(v58, v74, v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v76, v77, (uint64_t)CFSTR("alert"));
        v78 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v41 = v78;
        else
          v41 = 0;

      }
      else
      {
        v41 = 0;
        v44 = 0;
      }
      v81 = objc_alloc_init(_FTPasswordManagerCachedAuthTokenInfo);
      objc_msgSend_setProfileID_(v81, v82, (uint64_t)v138);
      objc_msgSend_setSelfID_(v81, v83, (uint64_t)v36);
      objc_msgSend_setToken_(v81, v84, (uint64_t)v137);
      objc_msgSend_setAlertInfo_(v81, v85, (uint64_t)v41);
      objc_msgSend_setStatus_(v81, v86, (uint64_t)v44);
      objc_storeStrong((id *)&self->_cachedAuthTokenInfo, v81);
      sub_1A4CB38A4(v58);
      accountStore = self->_accountStore;
      v143 = 0;
      objc_msgSend_registerSynchronouslyWithError_(accountStore, v88, (uint64_t)&v143);
      v134 = v143;
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v89, v90);
      v91 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v147 = v134;
        _os_log_impl(&dword_1A4C7F000, v91, OS_LOG_TYPE_DEFAULT, "  Monitor error: %@", buf, 0xCu);
      }

      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v92, v93);
      v94 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v147 = v58;
        _os_log_impl(&dword_1A4C7F000, v94, OS_LOG_TYPE_DEFAULT, "  Found account: %@", buf, 0xCu);
      }

      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v95, v96);
      v97 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v147 = v136;
        _os_log_impl(&dword_1A4C7F000, v97, OS_LOG_TYPE_DEFAULT, "  Credential: %@", buf, 0xCu);
      }

      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v98, v99);
      v100 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_accountType(v58, v101, v102);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(v103, v104, v105);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v147 = v106;
        _os_log_impl(&dword_1A4C7F000, v100, OS_LOG_TYPE_DEFAULT, "         => Type: %@", buf, 0xCu);

      }
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v107, v108);
      v109 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_username(v58, v110, v111);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v147 = v112;
        _os_log_impl(&dword_1A4C7F000, v109, OS_LOG_TYPE_DEFAULT, "     => Username: %@", buf, 0xCu);

      }
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v113, v114);
      v115 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_password(v136, v116, v117);
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        v119 = CFSTR("YES");
        if (!v118)
          v119 = CFSTR("NO");
        *(_DWORD *)buf = 138412290;
        v147 = (id)v119;
        _os_log_impl(&dword_1A4C7F000, v115, OS_LOG_TYPE_DEFAULT, "     => Password: %@", buf, 0xCu);

      }
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v120, v121);
      v122 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_token(v136, v123, v124);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1A4CAF050(v125);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v147 = v126;
        _os_log_impl(&dword_1A4C7F000, v122, OS_LOG_TYPE_DEFAULT, "   => Auth Token: %@", buf, 0xCu);

      }
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v127, v128);
      v129 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v147 = v138;
        _os_log_impl(&dword_1A4C7F000, v129, OS_LOG_TYPE_DEFAULT, "   => Profile ID: %@", buf, 0xCu);
      }

      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v130, v131);
      v132 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v147 = v36;
        _os_log_impl(&dword_1A4C7F000, v132, OS_LOG_TYPE_DEFAULT, "      => Self ID: %@", buf, 0xCu);
      }

    }
    else
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v60, v61);
      v80 = objc_claimAutoreleasedReturnValue();
      v136 = v80;
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4C7F000, v80, OS_LOG_TYPE_DEFAULT, "Did not find an account to use! No auth token fetched.", buf, 2u);
      }
      v137 = 0;
      v138 = 0;
      v36 = 0;
      v41 = 0;
      v44 = 0;
    }

  }
LABEL_53:
  if (objc_msgSend_containsObject_(self->_runningQueries, v79, (uint64_t)v22))
  {
    if (v139)
      ((void (**)(_QWORD, void *, id, void *, void *, void *, void *, id, id))v139)[2](v139, v22, v142, v140, v138, v36, v137, v41, v44);
    objc_msgSend_removeObject_(self->_runningQueries, v133, (uint64_t)v22);
  }

  os_activity_scope_leave(&state);
  cut_arc_os_release();

}

- (id)_credentialForAccount:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  int v8;
  char v9;
  void *v10;
  ACAccountStore *accountStore;
  const char *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = 0;
  v6 = 0;
  v7 = 1;
  v8 = 1;
  do
  {
    v9 = v7;
    v10 = v6;

    accountStore = self->_accountStore;
    v17 = 0;
    objc_msgSend_credentialForAccount_error_(accountStore, v12, (uint64_t)v4, &v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v17;

    if (!v5)
      break;
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      v19 = v4;
      v20 = 2112;
      v21 = v5;
      v22 = 1024;
      v23 = v8;
      v24 = 1024;
      v25 = 2;
      _os_log_error_impl(&dword_1A4C7F000, v15, OS_LOG_TYPE_ERROR, "Credential for account: %@  failed with error: %@ {attemptCount: %d, kAttemptLimit: %d}", buf, 0x22u);
    }

    v7 = 0;
    v8 = 2;
  }
  while ((v9 & 1) != 0);

  return v6;
}

- (void)requestPasswordForUsername:(id)a3 service:(id)a4 badPassword:(BOOL)a5 showForgotPassword:(BOOL)a6 shouldRememberPassword:(BOOL)a7 outRequestID:(id *)a8 completionBlock:(id)a9
{
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  id v15;
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  NSMutableSet *runningQueries;
  NSMutableSet *v29;
  NSMutableSet *v30;
  const char *v31;
  void *v32;
  IMUserNotificationCenter *userNotificationCenter;
  id v34;
  id v35;
  id v36;
  id v37;
  const char *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  os_activity_scope_state_s state;
  NSObject *v46;
  _BYTE buf[12];
  __int16 v48;
  id v49;
  uint64_t v50;

  v10 = a7;
  v11 = a6;
  v12 = a5;
  v50 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a9;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v46 = _os_activity_create(&dword_1A4C7F000, "Password manager request password", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v46, &state);
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v18, v19);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v15;
    v48 = 2112;
    v49 = v16;
    _os_log_impl(&dword_1A4C7F000, v20, OS_LOG_TYPE_DEFAULT, "Requesting password for username: %@  service: %@", buf, 0x16u);
  }

  v23 = (void *)objc_msgSend_copy(v17, v21, v22);
  objc_msgSend_stringGUID(MEMORY[0x1E0CB3940], v24, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  runningQueries = self->_runningQueries;
  if (!runningQueries)
  {
    v29 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v30 = self->_runningQueries;
    self->_runningQueries = v29;

    runningQueries = self->_runningQueries;
  }
  objc_msgSend_addObject_(runningQueries, v26, (uint64_t)v27);
  if (a8)
    *a8 = objc_retainAutorelease(v27);
  objc_msgSend__loginUserNotificationForService_user_isForBadPassword_showForgetPassword_shouldRememberPassword_(FTPasswordManager, v31, (uint64_t)v16, v15, v12, v11, v10);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  userNotificationCenter = self->_userNotificationCenter;
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = sub_1A4CB488C;
  v39[3] = &unk_1E4DDA170;
  objc_copyWeak(&v44, (id *)buf);
  v34 = v27;
  v40 = v34;
  v35 = v15;
  v41 = v35;
  v36 = v16;
  v42 = v36;
  v37 = v23;
  v43 = v37;
  objc_msgSend_addUserNotification_listener_completionHandler_(userNotificationCenter, v38, (uint64_t)v32, 0, v39);

  objc_destroyWeak(&v44);
  objc_destroyWeak((id *)buf);

  os_activity_scope_leave(&state);
  cut_arc_os_release();

}

- (void)requestAuthTokenForProfileID:(id)a3 username:(id)a4 service:(id)a5 badPassword:(BOOL)a6 showForgotPassword:(BOOL)a7 outRequestID:(id *)a8 completionBlock:(id)a9
{
  objc_msgSend_requestAuthTokenForProfileID_username_service_badPassword_showForgotPassword_failIfNotSilent_outRequestID_completionBlock_(self, a2, (uint64_t)a3, a4, a5, a6, a7, 0, a8, a9);
}

- (void)requestAuthTokenForProfileID:(id)a3 username:(id)a4 service:(id)a5 badPassword:(BOOL)a6 showForgotPassword:(BOOL)a7 failIfNotSilent:(BOOL)a8 outRequestID:(id *)a9 completionBlock:(id)a10
{
  objc_msgSend_requestAuthTokenForProfileID_username_service_badPassword_showForgotPassword_forceRenewal_failIfNotSilent_outRequestID_completionBlock_(self, a2, (uint64_t)a3, a4, a5, a6, a7, 0, a8, a9, a10);
}

- (void)requestAuthTokenForProfileID:(id)a3 username:(id)a4 service:(id)a5 badPassword:(BOOL)a6 showForgotPassword:(BOOL)a7 forceRenewal:(BOOL)a8 failIfNotSilent:(BOOL)a9 outRequestID:(id *)a10 completionBlock:(id)a11
{
  _BOOL4 v11;
  __CFString *v15;
  __CFString *v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  const __CFString *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  NSMutableSet *runningQueries;
  NSMutableSet *v32;
  NSMutableSet *v33;
  ACAccountStore *accountStore;
  void *v35;
  const char *v36;
  const char *v37;
  __CFString *v38;
  id v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  NSObject *v50;
  ACAccountStore *v51;
  const char *v52;
  int v53;
  __CFString *v54;
  const char *v55;
  uint64_t v56;
  NSObject *v57;
  const __CFString *v58;
  const char *v59;
  uint64_t v60;
  NSObject *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  int isEqualToIgnoringCase;
  NSObject *v70;
  const __CFString *v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  _BOOL4 v78;
  uint64_t v79;
  void *v80;
  __CFString *v81;
  __CFString *v82;
  __CFString *v83;
  id v84;
  id v85;
  id v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  id v90;
  const char *v91;
  uint64_t v92;
  NSObject *v93;
  __CFString *v94;
  ACAccountStore *v95;
  ACAccountStore *v96;
  const char *v97;
  id v98;
  void *v99;
  void *v100;
  _BOOL4 v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  _QWORD v106[4];
  __CFString *v107;
  id v108;
  __CFString *v109;
  FTPasswordManager *v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  BOOL v116;
  _QWORD v117[4];
  __CFString *v118;
  __CFString *v119;
  __CFString *v120;
  id v121;
  FTPasswordManager *v122;
  id v123;
  id v124;
  _QWORD v125[5];
  id v126;
  char v127;
  id v128;
  os_activity_scope_state_s state;
  NSObject *v130;
  uint8_t buf[4];
  const __CFString *v132;
  __int16 v133;
  __CFString *v134;
  __int16 v135;
  id v136;
  __int16 v137;
  const __CFString *v138;
  uint64_t v139;

  v11 = a8;
  v139 = *MEMORY[0x1E0C80C00];
  v15 = (__CFString *)a3;
  v16 = (__CFString *)a4;
  v17 = a5;
  v18 = a11;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v130 = _os_activity_create(&dword_1A4C7F000, "Password manager request auth token", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v130, &state);
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v19, v20);
  v21 = objc_claimAutoreleasedReturnValue();
  v101 = v11;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = CFSTR("NO");
    *(_DWORD *)buf = 138413058;
    v132 = v15;
    if (a9)
      v22 = CFSTR("YES");
    v133 = 2112;
    v134 = v16;
    v135 = 2112;
    v136 = v17;
    v137 = 2112;
    v138 = v22;
    _os_log_impl(&dword_1A4C7F000, v21, OS_LOG_TYPE_DEFAULT, "Requesting auth token for profileID: %@ username: %@ service: %@ failIfNotSilent: %@", buf, 0x2Au);
  }

  _UIStringForIDSRegistrationServiceType();
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend_copy(v18, v23, v24);

  v26 = v17;
  sub_1A4CB3730(v26);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = v26;

  objc_msgSend_stringGUID(MEMORY[0x1E0CB3940], v27, v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  runningQueries = self->_runningQueries;
  if (!runningQueries)
  {
    v32 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v33 = self->_runningQueries;
    self->_runningQueries = v32;

    runningQueries = self->_runningQueries;
  }
  objc_msgSend_addObject_(runningQueries, v29, (uint64_t)v30);
  if (a10)
    *a10 = objc_retainAutorelease(v30);
  accountStore = self->_accountStore;
  sub_1A4CAE918();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountTypeWithAccountTypeIdentifier_(accountStore, v36, (uint64_t)v35);
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__accountBasedOnProfileID_orUsername_inStore_(self, v37, (uint64_t)v15, v16, self->_accountStore);
  v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v38)
  {
    v39 = objc_alloc((Class)MEMORY[0x1A85A5DE0](CFSTR("ACAccount"), CFSTR("Accounts")));
    v38 = (__CFString *)objc_msgSend_initWithAccountType_(v39, v40, (uint64_t)v103);
    objc_msgSend__stripFZIDPrefix(v16, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUsername_(v38, v44, (uint64_t)v43);

    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v45, v46);
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v132 = v38;
      _os_log_impl(&dword_1A4C7F000, v47, OS_LOG_TYPE_DEFAULT, "No account found, created new account: %@", buf, 0xCu);
    }

    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v48, v49);
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4C7F000, v50, OS_LOG_TYPE_DEFAULT, "Adding and saving account", buf, 2u);
    }

    v51 = self->_accountStore;
    v128 = 0;
    v53 = objc_msgSend_saveVerifiedAccount_error_(v51, v52, (uint64_t)v38, &v128);
    v54 = (__CFString *)v128;
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v55, v56);
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      v58 = CFSTR("NO");
      if (v53)
        v58 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v132 = v58;
      v133 = 2112;
      v134 = v54;
      _os_log_impl(&dword_1A4C7F000, v57, OS_LOG_TYPE_DEFAULT, "Save completed (%@) with error: %@", buf, 0x16u);
    }

    if (v54)
    {
      objc_msgSend_warning(MEMORY[0x1E0D36AA8], v59, v60);
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        sub_1A4CBB92C();

    }
  }
  sub_1A4CB38A4(v38);
  if (self->_cachedAuthTokenInfo)
  {
    sub_1A4CAEF9C(v38);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_profileID(self->_cachedAuthTokenInfo, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v64, v68, (uint64_t)v67);

  }
  else
  {
    isEqualToIgnoringCase = 0;
  }
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v62, v63);
  v70 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    v71 = CFSTR("NO");
    if (isEqualToIgnoringCase)
      v71 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v132 = v71;
    v133 = 2112;
    v134 = v38;
    _os_log_impl(&dword_1A4C7F000, v70, OS_LOG_TYPE_DEFAULT, "Getting new auth token {shouldClearAccountCache: %@, account: %@}", buf, 0x16u);
  }

  objc_msgSend__credentialForAccount_(self, v72, (uint64_t)v38);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_password(v99, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend_length(v75, v76, v77) == 0;

  v79 = MEMORY[0x1E0C809B0];
  v125[0] = MEMORY[0x1E0C809B0];
  v125[1] = 3221225472;
  v125[2] = sub_1A4CB53DC;
  v125[3] = &unk_1E4DDA198;
  v127 = isEqualToIgnoringCase;
  v125[4] = self;
  v98 = v25;
  v126 = v98;
  v80 = (void *)MEMORY[0x1A85A6380](v125);
  v117[0] = v79;
  v117[1] = 3221225472;
  v117[2] = sub_1A4CB5504;
  v117[3] = &unk_1E4DDA210;
  v81 = v15;
  v118 = v81;
  v82 = v38;
  v119 = v82;
  v83 = v16;
  v120 = v83;
  v84 = v100;
  v121 = v84;
  v122 = self;
  v85 = v30;
  v123 = v85;
  v86 = v80;
  v124 = v86;
  v87 = (void *)MEMORY[0x1A85A6380](v117);
  v90 = v87;
  if (v78 || v101)
  {
    objc_msgSend__renewCredentialsIfPossibleForAccount_username_inServiceIdentifier_originalInServiceIdentifier_serviceName_failIfNotSilent_renewHandler_shortCircuitCompletionBlock_(self, v88, (uint64_t)v82, v83, v84, v104, v105, a9, v87, v86);
  }
  else
  {
    v102 = (void *)objc_msgSend_copy(v87, v88, v89);

    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v91, v92);
    v93 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v132 = v82;
      _os_log_impl(&dword_1A4C7F000, v93, OS_LOG_TYPE_DEFAULT, "Requesting verification for account: %@", buf, 0xCu);
    }

    v94 = v81;
    v95 = self->_accountStore;
    v106[0] = v79;
    v106[1] = 3221225472;
    v106[2] = sub_1A4CB5B24;
    v106[3] = &unk_1E4DDA2B0;
    v107 = v83;
    v108 = v84;
    v109 = v82;
    v110 = self;
    v111 = v85;
    v114 = v86;
    v112 = v105;
    v113 = v104;
    v116 = a9;
    v90 = v102;
    v115 = v90;
    v96 = v95;
    v81 = v94;
    objc_msgSend_verifyCredentialsForAccount_withHandler_(v96, v97, (uint64_t)v109, v106);

  }
  os_activity_scope_leave(&state);
  cut_arc_os_release();

}

- (void)_renewCredentialsIfPossibleForAccount:(id)a3 username:(id)a4 inServiceIdentifier:(id)a5 originalInServiceIdentifier:(id)a6 serviceName:(id)a7 failIfNotSilent:(BOOL)a8 renewHandler:(id)a9 shortCircuitCompletionBlock:(id)a10
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  uint64_t shouldForceSilentOnlyAuthForUsername_serviceIdentifier;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  int v42;
  id v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v45 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a9;
  v19 = a10;
  objc_msgSend_accountPropertyForKey_(v14, v20, *MEMORY[0x1E0D34420]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v22, v23);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_accountProperties(v14, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v47 = v14;
    v48 = 2112;
    v49 = v21;
    v50 = 2112;
    v51 = v27;
    _os_log_impl(&dword_1A4C7F000, v24, OS_LOG_TYPE_DEFAULT, "Checking the current status of the account {foundAccount: %@, status: %@, properties: %@}", buf, 0x20u);

  }
  if (v21 && (objc_msgSend_integerValue(v21, v28, v29) == 5100 || objc_msgSend_integerValue(v21, v28, v29) == 5103))
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v28, v29);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4C7F000, v30, OS_LOG_TYPE_DEFAULT, "Not requesting renewal for a Managed AppleID account", buf, 2u);
    }

    v31 = v45;
    if (v19)
    {
      BYTE2(v42) = 0;
      LOWORD(v42) = 256;
      (*((void (**)(id, _QWORD, id, id, _QWORD, _QWORD, _QWORD, _QWORD, void *, int))v19 + 2))(v19, 0, v45, v15, 0, 0, 0, 0, v21, v42);
    }
  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v28, v29);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v47 = v14;
      v48 = 2112;
      v49 = v17;
      _os_log_impl(&dword_1A4C7F000, v32, OS_LOG_TYPE_DEFAULT, "Requesting renewal for account: %@  service: %@", buf, 0x16u);
    }

    if (a8)
    {
      shouldForceSilentOnlyAuthForUsername_serviceIdentifier = 1;
    }
    else
    {
      objc_msgSend_username(v14, v33, v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      shouldForceSilentOnlyAuthForUsername_serviceIdentifier = objc_msgSend__shouldForceSilentOnlyAuthForUsername_serviceIdentifier_(self, v37, (uint64_t)v36, v16);

    }
    objc_msgSend_username(v14, v33, v34);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__accountOptionsDictForRenewCredentialsForService_username_shouldFailIfNotSilent_(self, v39, (uint64_t)v17, v38, shouldForceSilentOnlyAuthForUsername_serviceIdentifier);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    IDSAuthenticationDelegateUpdateTimeOfLastRequestPost();
    objc_msgSend_renewCredentialsForAccount_options_completion_(self->_accountStore, v41, (uint64_t)v14, v40, v18);

    v31 = v45;
  }

}

- (void)setPasswordForProfileID:(id)a3 username:(id)a4 service:(id)a5 password:(id)a6 outRequestID:(id *)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void (**v23)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const char *v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  NSMutableSet *runningQueries;
  NSMutableSet *v29;
  NSMutableSet *v30;
  const char *v31;
  const char *v32;
  ACAccountStore *accountStore;
  void *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  __CFString *v39;
  NSObject *v40;
  const char *v41;
  id v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  __CFString *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  NSObject *v55;
  const char *v56;
  void *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  NSObject *v63;
  const char *v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  NSObject *v68;
  ACAccountStore *v69;
  const char *v70;
  uint64_t v71;
  id v72;
  const char *v73;
  uint64_t v74;
  NSObject *v75;
  const __CFString *v76;
  const char *v77;
  uint64_t v78;
  NSObject *v79;
  void *v80;
  __CFString *v81;
  id v82;
  id v83;
  os_activity_scope_state_s state;
  NSObject *v85;
  uint8_t buf[4];
  const __CFString *v87;
  __int16 v88;
  id v89;
  __int16 v90;
  id v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v81 = (__CFString *)a3;
  v14 = a4;
  v15 = a5;
  v82 = a6;
  v16 = a8;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v85 = _os_activity_create(&dword_1A4C7F000, "Password manager set password", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v85, &state);
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v17, v18);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v87 = v81;
    v88 = 2112;
    v89 = v14;
    v90 = 2112;
    v91 = v15;
    _os_log_impl(&dword_1A4C7F000, v19, OS_LOG_TYPE_DEFAULT, "Setting password for profileID: %@ username: %@ service: %@", buf, 0x20u);
  }

  sub_1A4CB3730(v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_msgSend_copy(v16, v21, v22);
  objc_msgSend_stringGUID(MEMORY[0x1E0CB3940], v24, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  runningQueries = self->_runningQueries;
  if (!runningQueries)
  {
    v29 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v30 = self->_runningQueries;
    self->_runningQueries = v29;

    runningQueries = self->_runningQueries;
  }
  objc_msgSend_addObject_(runningQueries, v26, (uint64_t)v27);
  if (a7)
    *a7 = objc_retainAutorelease(v27);
  if (objc_msgSend_isEqualToString_(v20, v31, *MEMORY[0x1E0D34BA0]))
  {
    accountStore = self->_accountStore;
    sub_1A4CAE918();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountTypeWithAccountTypeIdentifier_(accountStore, v35, (uint64_t)v34);
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend__accountWithUsername_inStore_(self, v36, (uint64_t)v14, self->_accountStore);
    v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v37, v38);
      v40 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      *(_DWORD *)buf = 138412290;
      v87 = v39;
      v41 = "Using account: %@";
    }
    else
    {
      v42 = objc_alloc((Class)MEMORY[0x1A85A5DE0](CFSTR("ACAccount"), CFSTR("Accounts")));
      v39 = (__CFString *)objc_msgSend_initWithAccountType_(v42, v43, (uint64_t)v80);
      objc_msgSend__stripFZIDPrefix(v14, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setUsername_(v39, v47, (uint64_t)v46);

      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v48, v49);
      v40 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      *(_DWORD *)buf = 138412290;
      v87 = v39;
      v41 = "No account found, created new account: %@";
    }
    _os_log_impl(&dword_1A4C7F000, v40, OS_LOG_TYPE_DEFAULT, v41, buf, 0xCu);
LABEL_16:

    objc_msgSend__credentialForAccount_(self, v50, (uint64_t)v39);
    v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
    sub_1A4CB38A4(v39);
    if (v51)
    {
      objc_msgSend_setPassword_(v51, v52, (uint64_t)v82);
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v53, v54);
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v87 = v51;
        v56 = "Updated credential: %@";
LABEL_21:
        _os_log_impl(&dword_1A4C7F000, v55, OS_LOG_TYPE_DEFAULT, v56, buf, 0xCu);
      }
    }
    else
    {
      v57 = (void *)MEMORY[0x1A85A5DE0](CFSTR("ACAccountCredential"), CFSTR("Accounts"));
      objc_msgSend_credentialWithPassword_(v57, v58, (uint64_t)v82);
      v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v59, v60);
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v87 = v51;
        v56 = "Creating credential: %@";
        goto LABEL_21;
      }
    }

    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v61, v62);
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
      sub_1A4CBBCB4();

    objc_msgSend_setCredential_(v39, v64, (uint64_t)v51);
    objc_msgSend_setAccountProperty_forKey_(v39, v65, 0, *MEMORY[0x1E0D34420]);
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v66, v67);
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4C7F000, v68, OS_LOG_TYPE_DEFAULT, "Saving account", buf, 2u);
    }

    v69 = self->_accountStore;
    v83 = 0;
    v71 = objc_msgSend_saveVerifiedAccount_error_(v69, v70, (uint64_t)v39, &v83);
    v72 = v83;
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v73, v74);
    v75 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      v76 = CFSTR("NO");
      if ((_DWORD)v71)
        v76 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v87 = v76;
      v88 = 2112;
      v89 = v72;
      _os_log_impl(&dword_1A4C7F000, v75, OS_LOG_TYPE_DEFAULT, "Save completed (%@) with error: %@", buf, 0x16u);
    }

    if (v72)
    {
      objc_msgSend_warning(MEMORY[0x1E0D36AA8], v77, v78);
      v79 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
        sub_1A4CBB92C();

    }
    if (v23)
      ((void (**)(_QWORD, void *, id, void *, uint64_t))v23)[2](v23, v27, v14, v20, v71);
    objc_msgSend_removeObject_(self->_runningQueries, v77, (uint64_t)v27);

    goto LABEL_37;
  }
  objc_msgSend__setKeychainPassword_forUsername_service_(self, v32, (uint64_t)v82, v14, v20);
  if (v23)
    ((void (**)(_QWORD, void *, id, void *, uint64_t))v23)[2](v23, v27, v14, v20, 1);
LABEL_37:

  os_activity_scope_leave(&state);
  cut_arc_os_release();

}

- (void)setAuthTokenForProfileID:(id)a3 username:(id)a4 service:(id)a5 authToken:(id)a6 selfHandle:(id)a7 outRequestID:(id *)a8 completionBlock:(id)a9
{
  objc_msgSend_setAuthTokenForProfileID_username_service_authToken_selfHandle_accountStatus_outRequestID_completionBlock_(self, a2, (uint64_t)a3, a4, a5, a6, a7, &unk_1E4DE65B0, a8, a9);
}

- (BOOL)isAuthTokenReceiptTime:(double)a3 withinGracePeriod:(double)a4
{
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  NSObject *v13;
  const __CFString *v14;
  int v16;
  const __CFString *v17;
  __int16 v18;
  double v19;
  __int16 v20;
  double v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], a2, v4);
  v10 = v9;
  v11 = v9 - a3;
  v12 = v9 - a3 < a4 && v9 > a3;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v7, v8);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = CFSTR("NO");
    v16 = 138413314;
    if (v12)
      v14 = CFSTR("YES");
    v17 = v14;
    v18 = 2048;
    v19 = a3;
    v20 = 2048;
    v21 = a4;
    v22 = 2048;
    v23 = v10;
    v24 = 2048;
    v25 = v11;
    _os_log_impl(&dword_1A4C7F000, v13, OS_LOG_TYPE_DEFAULT, "Checked auth token receipt date against grace period {isAuthTokenWithinGracePeriod: %@, authTokenReceiptTime: %f, gracePeriod: %f, now: %f, delta: %f}", (uint8_t *)&v16, 0x34u);
  }

  return v12;
}

- (double)authTokenGracePeriod
{
  void *v2;
  const char *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  double v8;

  objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E0D34E78], a2, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v2, v3, (uint64_t)CFSTR("ds-session-token-grace-period"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend_doubleValue(v4, v5, v6);
    v8 = v7;
  }
  else
  {
    v8 = 6.0;
  }

  return v8;
}

- (void)removeAuthTokenAllowingGracePeriodForProfileID:(id)a3 username:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  const char *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  double v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  double v27;
  NSObject *v28;
  NSObject *v29;
  const char *v30;
  NSObject *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  int isEqualToIgnoringCase;
  _FTPasswordManagerCachedAuthTokenInfo *cachedAuthTokenInfo;
  NSObject *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  NSObject *v50;
  const char *v51;
  uint64_t v52;
  const __CFString *v53;
  ACAccountStore *accountStore;
  const char *v55;
  int v56;
  id v57;
  const char *v58;
  uint64_t v59;
  NSObject *v60;
  const __CFString *v61;
  const char *v62;
  uint64_t v63;
  NSObject *v64;
  id v65;
  uint8_t buf[4];
  id v67;
  __int16 v68;
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v67 = v6;
    v68 = 2112;
    v69 = v7;
    _os_log_impl(&dword_1A4C7F000, v10, OS_LOG_TYPE_DEFAULT, "Removing auth token using grace period for profileID: %@ username: %@", buf, 0x16u);
  }

  objc_msgSend__accountBasedOnProfileID_orUsername_inStore_(self, v11, (uint64_t)v6, v7, self->_accountStore);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v16)
    {
      *(_DWORD *)buf = 138412290;
      v67 = v12;
      _os_log_impl(&dword_1A4C7F000, v15, OS_LOG_TYPE_DEFAULT, "Using account: %@", buf, 0xCu);
    }

    objc_msgSend_accountPropertyForKey_(v12, v17, *MEMORY[0x1E0D34448]);
    v18 = objc_claimAutoreleasedReturnValue();
    v15 = v18;
    if (v18
      && (objc_msgSend_doubleValue(v18, v19, v20),
          v22 = v21,
          objc_msgSend_authTokenGracePeriod(self, v23, v24),
          (objc_msgSend_isAuthTokenReceiptTime_withinGracePeriod_(self, v25, v26, v22, v27) & 1) != 0))
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v19, v20);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v15;
        _os_log_impl(&dword_1A4C7F000, v28, OS_LOG_TYPE_DEFAULT, "Auth token receipt date falls within grace period -- skipping removal {authTokenReceiptTime: %@}", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v19, v20);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v15;
        _os_log_impl(&dword_1A4C7F000, v29, OS_LOG_TYPE_DEFAULT, "Auth token receipt date falls outside of grace period -- removing auth token {authTokenReceiptTime: %@}", buf, 0xCu);
      }

      objc_msgSend__credentialForAccount_(self, v30, (uint64_t)v12);
      v31 = objc_claimAutoreleasedReturnValue();
      if (!v31)
        v31 = objc_alloc_init((Class)MEMORY[0x1A85A5DE0](CFSTR("ACAccountCredential"), CFSTR("Accounts")));
      v28 = v31;
      objc_msgSend_setToken_(v31, v32, 0);
      if (self->_cachedAuthTokenInfo)
      {
        sub_1A4CAEF9C(v12);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_profileID(self->_cachedAuthTokenInfo, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v35, v39, (uint64_t)v38);

        if (isEqualToIgnoringCase)
        {
          cachedAuthTokenInfo = self->_cachedAuthTokenInfo;
          self->_cachedAuthTokenInfo = 0;

        }
      }
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v33, v34);
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v28;
        _os_log_impl(&dword_1A4C7F000, v42, OS_LOG_TYPE_DEFAULT, "Updating credential %@", buf, 0xCu);
      }

      objc_msgSend_setCredential_(v12, v43, (uint64_t)v28);
      objc_msgSend_setAuthenticated_(v12, v44, 0);
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v45, v46);
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v12;
        _os_log_impl(&dword_1A4C7F000, v47, OS_LOG_TYPE_DEFAULT, "Saving account: %@", buf, 0xCu);
      }

      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v48, v49);
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        if (objc_msgSend_isAuthenticated(v12, v51, v52))
          v53 = CFSTR("YES");
        else
          v53 = CFSTR("NO");
        *(_DWORD *)buf = 138412290;
        v67 = (id)v53;
        _os_log_impl(&dword_1A4C7F000, v50, OS_LOG_TYPE_DEFAULT, "      Authenticated: %@", buf, 0xCu);
      }

      accountStore = self->_accountStore;
      v65 = 0;
      v56 = objc_msgSend_saveVerifiedAccount_error_(accountStore, v55, (uint64_t)v12, &v65);
      v57 = v65;
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v58, v59);
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = CFSTR("YES");
        if (!v56)
          v61 = CFSTR("NO");
        *(_DWORD *)buf = 138412546;
        v67 = (id)v61;
        v68 = 2112;
        v69 = v57;
        _os_log_impl(&dword_1A4C7F000, v60, OS_LOG_TYPE_DEFAULT, "Save completed (%@) with error: %@", buf, 0x16u);
      }

      if (v57)
      {
        objc_msgSend_warning(MEMORY[0x1E0D36AA8], v62, v63);
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          sub_1A4CBB92C();

      }
    }

  }
  else if (v16)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4C7F000, v15, OS_LOG_TYPE_DEFAULT, "No account found for auth token removal -- ignoring request", buf, 2u);
  }

}

- (void)setAuthTokenForProfileID:(id)a3 username:(id)a4 service:(id)a5 authToken:(id)a6 selfHandle:(id)a7 accountStatus:(id)a8 outRequestID:(id *)a9 completionBlock:(id)a10
{
  id v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void (**v25)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const char *v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  NSMutableSet *runningQueries;
  NSMutableSet *v31;
  NSMutableSet *v32;
  const char *v33;
  const char *v34;
  ACAccountStore *accountStore;
  void *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  __CFString *v41;
  NSObject *v42;
  const char *v43;
  id v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  __CFString *v53;
  const char *v54;
  __CFString *v55;
  const char *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  int isEqualToIgnoringCase;
  _FTPasswordManagerCachedAuthTokenInfo *cachedAuthTokenInfo;
  NSObject *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  const __CFString *v75;
  const __CFString *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  const char *v81;
  uint64_t v82;
  NSObject *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  const char *v88;
  uint64_t v89;
  NSObject *v90;
  const char *v91;
  const char *v92;
  uint64_t v93;
  NSObject *v94;
  const char *v95;
  NSObject *v96;
  const char *v97;
  uint64_t v98;
  NSObject *v99;
  const char *v100;
  uint64_t v101;
  int isAuthenticated;
  const __CFString *v103;
  ACAccountStore *v104;
  const char *v105;
  uint64_t v106;
  id v107;
  const char *v108;
  uint64_t v109;
  NSObject *v110;
  const __CFString *v111;
  const char *v112;
  uint64_t v113;
  NSObject *v114;
  void *v115;
  id v116;
  __CFString *v117;
  id v118;
  __CFString *v119;
  id v120;
  os_activity_scope_state_s state;
  NSObject *v122;
  uint8_t buf[4];
  const __CFString *v124;
  __int16 v125;
  id v126;
  __int16 v127;
  id v128;
  __int16 v129;
  id v130;
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  v119 = (__CFString *)a3;
  v16 = a4;
  v17 = a5;
  v118 = a6;
  v117 = (__CFString *)a7;
  v116 = a8;
  v18 = a10;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v122 = _os_activity_create(&dword_1A4C7F000, "Password manager set auth token", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v122, &state);
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v19, v20);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v124 = v119;
    v125 = 2112;
    v126 = v16;
    v127 = 2112;
    v128 = v17;
    v129 = 2112;
    v130 = v118;
    _os_log_impl(&dword_1A4C7F000, v21, OS_LOG_TYPE_DEFAULT, "Setting auth token for profileID: %@ username: %@ service: %@  (%@)", buf, 0x2Au);
  }

  sub_1A4CB3730(v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_msgSend_copy(v18, v23, v24);
  objc_msgSend_stringGUID(MEMORY[0x1E0CB3940], v26, v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  runningQueries = self->_runningQueries;
  if (!runningQueries)
  {
    v31 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v32 = self->_runningQueries;
    self->_runningQueries = v31;

    runningQueries = self->_runningQueries;
  }
  objc_msgSend_addObject_(runningQueries, v28, (uint64_t)v29);
  if (a9)
    *a9 = objc_retainAutorelease(v29);
  if (objc_msgSend_isEqualToString_(v22, v33, *MEMORY[0x1E0D34BA0]))
  {
    accountStore = self->_accountStore;
    sub_1A4CAE918();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountTypeWithAccountTypeIdentifier_(accountStore, v37, (uint64_t)v36);
    v115 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend__accountBasedOnProfileID_orUsername_inStore_(self, v38, (uint64_t)v119, v16, self->_accountStore);
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v39, v40);
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v124 = v41;
        v43 = "Using account: %@";
LABEL_15:
        _os_log_impl(&dword_1A4C7F000, v42, OS_LOG_TYPE_DEFAULT, v43, buf, 0xCu);
      }
    }
    else
    {
      v44 = objc_alloc((Class)MEMORY[0x1A85A5DE0](CFSTR("ACAccount"), CFSTR("Accounts")));
      v41 = (__CFString *)objc_msgSend_initWithAccountType_(v44, v45, (uint64_t)v115);
      objc_msgSend__stripFZIDPrefix(v16, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setUsername_(v41, v49, (uint64_t)v48);

      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v50, v51);
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v124 = v41;
        v43 = "No account found, created new account: %@";
        goto LABEL_15;
      }
    }

    sub_1A4CB38A4(v41);
    objc_msgSend__credentialForAccount_(self, v52, (uint64_t)v41);
    v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v55 = v53;
    if (v53)
    {
      objc_msgSend_setToken_(v53, v54, (uint64_t)v118);
    }
    else
    {
      v55 = (__CFString *)objc_alloc_init((Class)MEMORY[0x1A85A5DE0](CFSTR("ACAccountCredential"), CFSTR("Accounts")));
      objc_msgSend_setToken_(v55, v57, (uint64_t)v118);
    }
    objc_msgSend__updateStatus_onAccount_(self, v56, (uint64_t)v116, v41);
    if (self->_cachedAuthTokenInfo)
    {
      sub_1A4CAEF9C(v41);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_profileID(self->_cachedAuthTokenInfo, v61, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v60, v64, (uint64_t)v63);

      if (isEqualToIgnoringCase)
      {
        cachedAuthTokenInfo = self->_cachedAuthTokenInfo;
        self->_cachedAuthTokenInfo = 0;

      }
    }
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v58, v59);
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v124 = v55;
      _os_log_impl(&dword_1A4C7F000, v67, OS_LOG_TYPE_DEFAULT, "Updating credential %@", buf, 0xCu);
    }

    v70 = objc_msgSend_length(v118, v68, v69);
    objc_msgSend_setCredential_(v41, v71, (uint64_t)v55);
    objc_msgSend_setAuthenticated_(v41, v72, v70 != 0);
    if (v70)
    {
      objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v73, v74);
      v76 = v75;
      objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v77, v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAccountProperty_forKey_(v41, v80, (uint64_t)v79, *MEMORY[0x1E0D34448]);

      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v81, v82);
      v83 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v124 = v76;
        _os_log_impl(&dword_1A4C7F000, v83, OS_LOG_TYPE_DEFAULT, "Updated auth token receipt time {receiptTime: %f}", buf, 0xCu);
      }

    }
    if (objc_msgSend_length(v119, v73, v74))
    {
      sub_1A4CAEF9C(v41);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isEqualToIgnoringCase_(v86, v87, (uint64_t)v119) & 1) == 0)
      {
        objc_msgSend_registration(MEMORY[0x1E0D36AA8], v88, v89);
        v90 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v124 = v119;
          _os_log_impl(&dword_1A4C7F000, v90, OS_LOG_TYPE_DEFAULT, "Setting profile ID on account: %@", buf, 0xCu);
        }

        objc_msgSend_setAccountProperty_forKey_(v41, v91, (uint64_t)v119, CFSTR("profile-id"));
      }

    }
    if (objc_msgSend_length(v117, v84, v85))
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v92, v93);
      v94 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v124 = v117;
        _os_log_impl(&dword_1A4C7F000, v94, OS_LOG_TYPE_DEFAULT, "Setting self handle on account: %@", buf, 0xCu);
      }

      objc_msgSend_setAccountProperty_forKey_(v41, v95, (uint64_t)v117, CFSTR("self-handle"));
    }
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v92, v93);
    v96 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v124 = v41;
      _os_log_impl(&dword_1A4C7F000, v96, OS_LOG_TYPE_DEFAULT, "Saving account: %@", buf, 0xCu);
    }

    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v97, v98);
    v99 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
    {
      isAuthenticated = objc_msgSend_isAuthenticated(v41, v100, v101);
      v103 = CFSTR("NO");
      if (isAuthenticated)
        v103 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v124 = v103;
      _os_log_impl(&dword_1A4C7F000, v99, OS_LOG_TYPE_DEFAULT, "      Authenticated: %@", buf, 0xCu);
    }

    v104 = self->_accountStore;
    v120 = 0;
    v106 = objc_msgSend_saveVerifiedAccount_error_(v104, v105, (uint64_t)v41, &v120);
    v107 = v120;
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v108, v109);
    v110 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
    {
      v111 = CFSTR("NO");
      if ((_DWORD)v106)
        v111 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v124 = v111;
      v125 = 2112;
      v126 = v107;
      _os_log_impl(&dword_1A4C7F000, v110, OS_LOG_TYPE_DEFAULT, "Save completed (%@) with error: %@", buf, 0x16u);
    }

    if (v107)
    {
      objc_msgSend_warning(MEMORY[0x1E0D36AA8], v112, v113);
      v114 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
        sub_1A4CBB92C();

    }
    if (v25)
      ((void (**)(_QWORD, void *, id, void *, uint64_t))v25)[2](v25, v29, v16, v22, v106);
    objc_msgSend_removeObject_(self->_runningQueries, v112, (uint64_t)v29);

    goto LABEL_55;
  }
  objc_msgSend__setKeychainAuthToken_forUsername_service_(self, v34, (uint64_t)v118, v16, v22);
  if (v25)
    ((void (**)(_QWORD, void *, id, void *, uint64_t))v25)[2](v25, v29, v16, v22, 1);
LABEL_55:

  os_activity_scope_leave(&state);
  cut_arc_os_release();

}

- (void)_updateStatus:(id)a3 onAccount:(id)a4
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v10)
  {
    v7 = objc_msgSend_integerValue(v10, (const char *)v10, v5);
    if (v7 == 5103 || v7 == 5100)
    {
      objc_msgSend_setAccountProperty_forKey_(v6, v8, (uint64_t)v10, *MEMORY[0x1E0D34420]);
    }
    else if (!v7)
    {
      objc_msgSend_setAccountProperty_forKey_(v6, v8, 0, *MEMORY[0x1E0D34420]);
      objc_msgSend_setAccountProperty_forKey_(v6, v9, 0, *MEMORY[0x1E0D34410]);
    }
  }

}

- (void)setAccountStatus:(id)a3 forProfileID:(id)a4 username:(id)a5 service:(id)a6
{
  id v10;
  __CFString *v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  ACAccountStore *accountStore;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  __CFString *v27;
  NSObject *v28;
  const char *v29;
  id v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  ACAccountStore *v39;
  const char *v40;
  int v41;
  id v42;
  const char *v43;
  uint64_t v44;
  NSObject *v45;
  const __CFString *v46;
  const char *v47;
  uint64_t v48;
  NSObject *v49;
  id v50;
  uint8_t buf[4];
  const __CFString *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (__CFString *)a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v14, v15);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v52 = v11;
    v53 = 2112;
    v54 = v12;
    v55 = 2112;
    v56 = v13;
    v57 = 2112;
    v58 = v10;
    _os_log_impl(&dword_1A4C7F000, v16, OS_LOG_TYPE_DEFAULT, "Setting account status {profileID: %@, username: %@, service: %@, accountStatus: %@}", buf, 0x2Au);
  }

  sub_1A4CB3730(v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_isEqualToString_(v17, v18, *MEMORY[0x1E0D34BA0]))
  {
    accountStore = self->_accountStore;
    sub_1A4CAE918();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountTypeWithAccountTypeIdentifier_(accountStore, v21, (uint64_t)v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend__accountBasedOnProfileID_orUsername_inStore_(self, v23, (uint64_t)v11, v12, self->_accountStore);
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v27 = (__CFString *)v24;
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v25, v26);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v27;
        v29 = "Using account: %@";
LABEL_9:
        _os_log_impl(&dword_1A4C7F000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 0xCu);
      }
    }
    else
    {
      v30 = objc_alloc((Class)MEMORY[0x1A85A5DE0](CFSTR("ACAccount"), CFSTR("Accounts")));
      v27 = (__CFString *)objc_msgSend_initWithAccountType_(v30, v31, (uint64_t)v22);
      objc_msgSend__stripFZIDPrefix(v12, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setUsername_(v27, v35, (uint64_t)v34);

      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v36, v37);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v27;
        v29 = "No account found, created new account: %@";
        goto LABEL_9;
      }
    }

    sub_1A4CB38A4(v27);
    objc_msgSend__updateStatus_onAccount_(self, v38, (uint64_t)v10, v27);
    v39 = self->_accountStore;
    v50 = 0;
    v41 = objc_msgSend_saveVerifiedAccount_error_(v39, v40, (uint64_t)v27, &v50);
    v42 = v50;
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v43, v44);
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = CFSTR("NO");
      if (v41)
        v46 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v52 = v46;
      v53 = 2112;
      v54 = v42;
      _os_log_impl(&dword_1A4C7F000, v45, OS_LOG_TYPE_DEFAULT, "Save completed (%@) with error: %@", buf, 0x16u);
    }

    if (v42)
    {
      objc_msgSend_warning(MEMORY[0x1E0D36AA8], v47, v48);
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
        sub_1A4CBBD14();

    }
  }

}

- (void)setHandlesForProfileID:(id)a3 username:(id)a4 service:(id)a5 handles:(id)a6
{
  __CFString *v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  ACAccountStore *accountStore;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  __CFString *v27;
  NSObject *v28;
  const char *v29;
  id v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  ACAccountStore *v39;
  const char *v40;
  int v41;
  id v42;
  const char *v43;
  uint64_t v44;
  NSObject *v45;
  const __CFString *v46;
  const char *v47;
  uint64_t v48;
  NSObject *v49;
  id v50;
  uint8_t buf[4];
  const __CFString *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v10 = (__CFString *)a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v14, v15);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v52 = v10;
    v53 = 2112;
    v54 = v11;
    v55 = 2112;
    v56 = v12;
    v57 = 2112;
    v58 = v13;
    _os_log_impl(&dword_1A4C7F000, v16, OS_LOG_TYPE_DEFAULT, "Setting handles dictionary for profileID: %@ username: %@ service: %@  (%@)", buf, 0x2Au);
  }

  sub_1A4CB3730(v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_isEqualToString_(v17, v18, *MEMORY[0x1E0D34BA0]))
  {
    accountStore = self->_accountStore;
    sub_1A4CAE918();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountTypeWithAccountTypeIdentifier_(accountStore, v21, (uint64_t)v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend__accountBasedOnProfileID_orUsername_inStore_(self, v23, (uint64_t)v10, v11, self->_accountStore);
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v27 = (__CFString *)v24;
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v25, v26);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v27;
        v29 = "Using account: %@";
LABEL_9:
        _os_log_impl(&dword_1A4C7F000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 0xCu);
      }
    }
    else
    {
      v30 = objc_alloc((Class)MEMORY[0x1A85A5DE0](CFSTR("ACAccount"), CFSTR("Accounts")));
      v27 = (__CFString *)objc_msgSend_initWithAccountType_(v30, v31, (uint64_t)v22);
      objc_msgSend__stripFZIDPrefix(v11, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setUsername_(v27, v35, (uint64_t)v34);

      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v36, v37);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v27;
        v29 = "No account found, created new account: %@";
        goto LABEL_9;
      }
    }

    sub_1A4CB38A4(v27);
    objc_msgSend_setAccountProperty_forKey_(v27, v38, (uint64_t)v13, CFSTR("handles"));
    v39 = self->_accountStore;
    v50 = 0;
    v41 = objc_msgSend_saveVerifiedAccount_error_(v39, v40, (uint64_t)v27, &v50);
    v42 = v50;
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v43, v44);
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = CFSTR("NO");
      if (v41)
        v46 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v52 = v46;
      v53 = 2112;
      v54 = v42;
      _os_log_impl(&dword_1A4C7F000, v45, OS_LOG_TYPE_DEFAULT, "Save completed (%@) with error: %@", buf, 0x16u);
    }

    if (v42)
    {
      objc_msgSend_warning(MEMORY[0x1E0D36AA8], v47, v48);
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        sub_1A4CBB92C();

    }
  }

}

- (id)_accountOptionsDictForRenewCredentialsForService:(id)a3 username:(id)a4 shouldFailIfNotSilent:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  id v17;
  const __CFString *v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  void *v31;
  const char *v32;
  void *v33;
  __CFDictionary *v34;
  id v35;
  const char *v36;
  void *v37;
  id v38;
  const __CFString *v39;
  const char *v40;
  uint64_t v41;
  NSObject *v42;
  uint8_t buf[4];
  __CFDictionary *v45;
  uint64_t v46;

  v5 = a5;
  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)MEMORY[0x1E0CB34D0];
  v9 = a4;
  v10 = objc_opt_class();
  objc_msgSend_bundleForClass_(v8, v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v7, v13, (uint64_t)CFSTR("iMessage")))
  {
    v17 = (id)*MEMORY[0x1E0D36FF8];
    v18 = CFSTR("iMessage");
    v19 = 4;
    goto LABEL_11;
  }
  if ((objc_msgSend_isEqualToIgnoringCase_(v7, v14, (uint64_t)CFSTR("FaceTime")) & 1) != 0
    || objc_msgSend_isEqualToIgnoringCase_(v7, v20, (uint64_t)CFSTR("Calling")))
  {
    v17 = (id)*MEMORY[0x1E0D36C08];
    v18 = CFSTR("FaceTime");
    v19 = 5;
    goto LABEL_11;
  }
  if ((objc_msgSend_isEqualToString_(v7, v21, (uint64_t)CFSTR("iTunes")) & 1) != 0)
  {
    v19 = 2;
  }
  else
  {
    v18 = CFSTR("iCloud");
    v19 = 1;
    if ((objc_msgSend_isEqualToString_(v7, v15, (uint64_t)CFSTR("iCloud")) & 1) != 0)
    {
      v17 = 0;
      goto LABEL_11;
    }
  }
  v17 = 0;
  v18 = CFSTR("account services");
LABEL_11:
  v22 = (void *)MEMORY[0x1E0D36A10];
  objc_msgSend_sharedInstance(MEMORY[0x1E0D36A10], v15, v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_model(v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_marketingNameForModel_(v22, v27, (uint64_t)v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v29, (uint64_t)CFSTR("Enter the password for your Apple Account to continue using %@ on this %@:\n%%@"), v18, v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  IMLocalizedStringFromTableInBundle();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v32, (uint64_t)v31, v9);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (qword_1EE788A80 != -1)
    dispatch_once(&qword_1EE788A80, &unk_1E4DD9310);
  CFDictionarySetValue(v34, (const void *)qword_1EE788AA8, MEMORY[0x1E0C9AAB0]);
  v35 = v33;
  if (v35)
  {
    if (qword_1EE788AC8 != -1)
      dispatch_once(&qword_1EE788AC8, &unk_1E4DDA330);
    CFDictionarySetValue(v34, (const void *)qword_1EE788AA0, v35);
  }

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v36, v19);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    if (qword_1EE788AB8 != -1)
      dispatch_once(&qword_1EE788AB8, &unk_1E4DDA350);
    CFDictionarySetValue(v34, (const void *)qword_1EE788A90, v37);
  }

  v38 = v17;
  if (v38)
  {
    if (qword_1EE788AC0 != -1)
      dispatch_once(&qword_1EE788AC0, &unk_1E4DDA370);
    CFDictionarySetValue(v34, (const void *)qword_1EE788A98, v38);
  }

  if (v5)
  {
    if (qword_1EE788B50 != -1)
      dispatch_once(&qword_1EE788B50, &unk_1E4DDA390);
    v39 = (const __CFString *)qword_1EE788B58;
  }
  else
  {
    v39 = CFSTR("AARenewShouldPostFollowUp");
  }
  CFDictionarySetValue(v34, v39, MEMORY[0x1E0C9AAB0]);
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v40, v41);
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v34;
    _os_log_impl(&dword_1A4C7F000, v42, OS_LOG_TYPE_DEFAULT, "Verification Options Dictionary Contains: %@", buf, 0xCu);
  }

  return v34;
}

- (void)cancelRequestID:(id)a3 serviceIdentifier:(id)a4
{
  const char *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  NSMutableSet *runningQueries;
  id v14;

  v14 = a3;
  v8 = a4;
  if (v14)
  {
    objc_msgSend_removeObject_(self->_runningQueries, v6, (uint64_t)v14);
    if (!objc_msgSend_count(self->_runningQueries, v9, v10))
    {
      runningQueries = self->_runningQueries;
      self->_runningQueries = 0;

      if (!v8)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  if (v8)
  {
LABEL_4:
    objc_msgSend_sharedInstance(MEMORY[0x1E0D36B08], v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeNotificationsForServiceIdentifier_(v11, v12, (uint64_t)v8);

  }
LABEL_5:

}

+ (id)_loginUserNotificationForService:(id)a3 user:(id)a4 isForBadPassword:(BOOL)a5 showForgetPassword:(BOOL)a6 shouldRememberPassword:(BOOL)a7
{
  _BOOL4 v7;
  id v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  void *v34;
  const char *v35;
  void *v36;
  void *v37;
  void *v38;
  const char *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  const char *v54;
  void *v55;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  id v67;

  v7 = a5;
  v9 = a3;
  v67 = a4;
  if (objc_msgSend_isEqualToString_(v9, v10, *MEMORY[0x1E0D34BA0]))
  {
    v13 = (void *)MEMORY[0x1E0CB34D0];
    v14 = objc_opt_class();
    objc_msgSend_bundleForClass_(v13, v15, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    IMLocalizedStringFromTableInBundle();
    v17 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v17;
  }
  objc_msgSend_stringByRemovingWhitespace(v67, v11, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_length(v18, v19, v20);

  if (qword_1EE788B60 != -1)
    dispatch_once(&qword_1EE788B60, &unk_1E4DD92F0);
  v22 = (id)qword_1EE788B68;
  if (v21)
  {
    IMLocalizedStringFromTableInBundle();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    IMLocalizedStringFromTableInBundle();
    v24 = objc_claimAutoreleasedReturnValue();
    IMLocalizedStringFromTableInBundle();
    v25 = objc_claimAutoreleasedReturnValue();
    IMLocalizedStringFromTableInBundle();
    v26 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v27, (uint64_t)v23, v9);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v67;
    if (!v67)
      v30 = v9;
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v28, (uint64_t)CFSTR("%@"), v30);
    v31 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayWithObjects_(MEMORY[0x1E0C99D20], v32, (uint64_t)&stru_1E4DDA770, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)v24;
    objc_msgSend_arrayWithObjects_(MEMORY[0x1E0C99D20], v35, v24, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v26;
    v66 = (void *)v25;
    v57 = v25;
    v37 = (void *)v26;
    v38 = (void *)v31;
    v65 = (void *)v29;
    objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x1E0C99E08], v39, v29, *MEMORY[0x1E0D36958], v31, *MEMORY[0x1E0D36938], v33, *MEMORY[0x1E0D36950], v36, *MEMORY[0x1E0D36948], v57, *MEMORY[0x1E0D36928], v58, *MEMORY[0x1E0D36918], 0, *MEMORY[0x1E0D36930], 0, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0x10000;
  }
  else
  {
    IMLocalizedStringFromTableInBundle();
    v61 = objc_claimAutoreleasedReturnValue();
    IMLocalizedStringFromTableInBundle();
    v42 = objc_claimAutoreleasedReturnValue();
    v59 = (void *)v42;
    IMLocalizedStringFromTableInBundle();
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    IMLocalizedStringFromTableInBundle();
    v64 = objc_claimAutoreleasedReturnValue();
    IMLocalizedStringFromTableInBundle();
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    IMLocalizedStringFromTableInBundle();
    v63 = objc_claimAutoreleasedReturnValue();
    IMLocalizedStringFromTableInBundle();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    IMLocalizedStringFromTableInBundle();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    IMLocalizedStringFromTableInBundle();
    v43 = objc_claimAutoreleasedReturnValue();
    v62 = (void *)v43;

    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v44, v61, v9);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v45, (uint64_t)v36, v9);
    else
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v45, v43, v9);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayWithObjects_(MEMORY[0x1E0C99D20], v47, (uint64_t)v67, &stru_1E4DDA770, 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayWithObjects_(MEMORY[0x1E0C99D20], v49, v42, v66, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayWithObjects_(MEMORY[0x1E0C99D20], v51, (uint64_t)v33, 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)v63;
    v37 = (void *)v64;
    objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x1E0C99E08], v53, (uint64_t)v60, *MEMORY[0x1E0D36958], v46, *MEMORY[0x1E0D36938], v48, *MEMORY[0x1E0D36950], v50, *MEMORY[0x1E0D36948], v52, *MEMORY[0x1E0D36920], v64, *MEMORY[0x1E0D36928], v63, *MEMORY[0x1E0D36918], 0, *MEMORY[0x1E0D36940], 0,
      *MEMORY[0x1E0D36930],
      0,
      0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = v59;
    v23 = (void *)v61;

    v41 = 0x20000;
  }

  objc_msgSend_userNotificationWithIdentifier_timeout_alertLevel_displayFlags_displayInformation_(MEMORY[0x1E0D36B00], v54, (uint64_t)CFSTR("__ksPasswordPromptUserNotificationIdentifier"), 3, v41, v40, 0.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  return v55;
}

- (id)acAccountWithProfileID:(id)a3 username:(id)a4 accountStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v13 = objc_msgSend_length(v8, v11, v12);
  if (v10 && v13)
  {
    objc_msgSend__accountBasedOnProfileID_orUsername_inStore_(self, v14, (uint64_t)v8, v9, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_warning(MEMORY[0x1E0D36AA8], v14, v15);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1A4CBBD84(v17);

    v16 = 0;
  }

  return v16;
}

- (id)profileIDForACAccount:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  if (a3)
  {
    sub_1A4CAEF9C(a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__stripFZIDPrefix(v3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)accountWasRemoved:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  FTPasswordManager *v9;

  v4 = a3;
  im_primary_queue();
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1A4CB917C;
  v7[3] = &unk_1E4DD9828;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)accountCredentialChanged:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  FTPasswordManager *v9;

  v4 = a3;
  im_primary_queue();
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1A4CB9290;
  v7[3] = &unk_1E4DD9828;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAuthTokenInfo, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_runningQueries, 0);
}

@end
