@implementation IMDIDSAccount

- (IMDIDSAccount)initWithAccountID:(id)a3 defaults:(id)a4 service:(id)a5 idsAccount:(id)a6
{
  id v11;
  IMDIDSAccount *v12;
  IMDIDSAccount *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)IMDIDSAccount;
  v12 = -[IMDAccount initWithAccountID:defaults:service:](&v15, sel_initWithAccountID_defaults_service_, a3, a4, a5);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_idsAccount, a6);

  return v13;
}

- (void)writeAccountDefaults:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;

  v4 = a3;
  if (-[IDSAccount accountType](self->_idsAccount, "accountType") != 2)
  {
    -[IMDAccount service](self, "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "canManageRegistration");

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        sub_1D166CF1C();

      if (objc_msgSend(v4, "count"))
      {
        v8 = (void *)objc_msgSend(v4, "mutableCopy");
        v9 = *MEMORY[0x1E0D36F00];
        objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D36F00]);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            sub_1D166CEBC();

          MEMORY[0x1D17EA374](v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v13, "length"))
          {
            objc_msgSend(v8, "setObject:forKey:", v13, v9);
            objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
              sub_1D166CE5C();
          }
          else
          {
            objc_msgSend(v8, "removeObjectForKey:", v9);
            objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
              sub_1D166CDFC();
          }

        }
        else
        {
          v13 = 0;
        }
        -[IDSAccount updateAccountWithAccountInfo:](self->_idsAccount, "updateAccountWithAccountInfo:", v8);

      }
    }
  }

}

- (id)accountDefaults
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[IDSAccount accountInfo](self->_idsAccount, "accountInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = *MEMORY[0x1E0D35190];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D35190]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDAccount service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imdAccountLoginFromIDSAccountWithType:login:", -[IDSAccount accountType](self->_idsAccount, "accountType"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKey:", v8, v5);
  return v4;
}

- (BOOL)canMakeDowngradeRoutingChecks
{
  void *v2;
  BOOL v3;

  -[IMDIDSAccount idsAccount](self, "idsAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accountType") == 0;

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IMDAccount accountID](self, "accountID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDIDSAccount idsAccount](self, "idsAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<IMDIDSAccount:%p, ID:%@, idsAccount:%@ >"), self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)multiplePhoneNumbersTiedToAccount
{
  void *v2;
  void *v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[IMDIDSAccount idsAccount](self, "idsAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "devices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  v5 = v4 != 0;
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    v8 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "linkedUserURIs");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");

        if (((v11 != 0) & v7) != 0)
          goto LABEL_20;
        v7 |= v11 != 0;
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v6)
        continue;
      break;
    }

    if ((v7 & 1) != 0)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "accounts");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (!v13)
      {
LABEL_19:
        v5 = 0;
        goto LABEL_21;
      }
      v14 = v13;
      v15 = *(_QWORD *)v22;
LABEL_12:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v3);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v16);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v17, "idsAccount");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "accountType");

          if (!v19)
            break;
        }
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v14)
            goto LABEL_12;
          goto LABEL_19;
        }
      }
LABEL_20:
      v5 = 1;
      goto LABEL_21;
    }
    return 0;
  }
  else
  {
LABEL_21:

  }
  return v5;
}

- (IDSAccount)idsAccount
{
  return self->_idsAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsAccount, 0);
}

@end
