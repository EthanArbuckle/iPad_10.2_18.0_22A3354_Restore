@implementation MFOSXServerIMAPAccount

+ (id)accountTypeIdentifier
{
  return (id)*MEMORY[0x1E0C8F0D8];
}

+ (id)displayedAccountTypeString
{
  return CFSTR("OS X Server");
}

+ (BOOL)primaryDeliveryAccountIsDynamic
{
  return 1;
}

- (id)displayName
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  -[MFAccount parentAccount](self, "parentAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MFAccount parentAccount](self, "parentAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MFOSXServerIMAPAccount;
    -[MailAccount displayName](&v7, sel_displayName);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)_credentialCreateIfNecessary:(BOOL)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  -[MFAccount parentAccount](self, "parentAccount", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "credentialWithError:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)newChildAccountWithParentAccount:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v42 = a1;
    v8 = *MEMORY[0x1E0C8F3D0];
    objc_msgSend(v6, "propertiesForDataclass:", *MEMORY[0x1E0C8F3D0]);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isProvisionedForDataclass:", v8) & 1) != 0
      || (+[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("OSXServerIMAPErrorDomain"), 2, 0), (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      objc_msgSend(v7, "childAccounts");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      if (v9)
      {
        v11 = *(_QWORD *)v46;
        v12 = *MEMORY[0x1E0C8F0D8];
        while (2)
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(_QWORD *)v46 != v11)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i), "accountType");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", v12);

            if (v16)
            {
              +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("OSXServerIMAPErrorDomain"), 1, 0);
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_15;
            }
          }
          v9 = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
          if (v9)
            continue;
          break;
        }
      }
LABEL_15:

    }
    objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("EmailAccountName"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = v18;
    }
    else
    {
      objc_msgSend(v7, "username");
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v20;

    objc_msgSend(v44, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EF98]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v17 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v9);
    }
    else
    {
      objc_msgSend(v43, "setObject:forKeyedSubscript:", v21, CFSTR("Username"));
      objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("EmailAddresses"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        objc_msgSend(v43, "setObject:forKeyedSubscript:", v23, CFSTR("EmailAddresses"));
      }
      else
      {
        objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("EmailAddress"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v24)
        {
          objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("EmailDomain"));
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = (void *)v25;
          if (v25)
            v27 = (void *)v25;
          else
            v27 = v22;
          v28 = v27;

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@@%@"), v21, v28);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v49 = v24;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setObject:forKeyedSubscript:", v29, CFSTR("EmailAddresses"));

      }
      objc_msgSend(v7, "accountDescription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setObject:forKeyedSubscript:", v30, CFSTR("DisplayName"));

      objc_msgSend(v43, "setObject:forKeyedSubscript:", v22, CFSTR("Hostname"));
      objc_msgSend(v44, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EFA0]);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setObject:forKeyedSubscript:", v31, CFSTR("PortNumber"));

      v32 = *MEMORY[0x1E0C8EFA8];
      objc_msgSend(v44, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EFA8]);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setObject:forKeyedSubscript:", v33, CFSTR("SSLEnabled"));

      objc_msgSend(v7, "userFullName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        objc_msgSend(v7, "userFullName");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setObject:forKeyedSubscript:", v35, CFSTR("FullUserName"));

      }
      objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("IncomingMailServerAuthentication"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "_authSchemeForAuthenticationMethod:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setObject:forKeyedSubscript:", v37, CFSTR("AuthenticationScheme"));

      objc_msgSend((id)objc_opt_class(), "accountWithProperties:", v43);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "defaultPath");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setPath:", v38);

      objc_msgSend(v44, "objectForKeyedSubscript:", v32);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setUsesSSL:", objc_msgSend(v39, "BOOLValue"));

      objc_msgSend(v17, "persistentAccount");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setParentAccount:", v7);
      objc_msgSend(v40, "setAuthenticationType:", *MEMORY[0x1E0C8F350]);

    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)_authSchemeForAuthenticationMethod:(id)a3
{
  id v3;
  id *v4;
  __CFString *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EmailAuthCRAMMD5")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x1E0D1E4A0];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EmailAuthNTLM")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x1E0D1E4B0];
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("EmailAuthHTTPMD5")))
    {
      v5 = &stru_1E4F1C8F8;
      goto LABEL_8;
    }
    v4 = (id *)MEMORY[0x1E0D1E4A8];
  }
  v5 = (__CFString *)*v4;
LABEL_8:

  return v5;
}

- (BOOL)derivesDeliveryAccountInfoFromMailAccount
{
  return 1;
}

- (id)_deliveryAccountCreateIfNeeded:(BOOL)a3
{
  DeliveryAccount *deliveryAccount;
  BOOL v5;
  MFOSXServerSMTPAccount *v6;
  DeliveryAccount *v7;

  deliveryAccount = self->_deliveryAccount;
  if (deliveryAccount)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    v6 = objc_alloc_init(MFOSXServerSMTPAccount);
    -[MFOSXServerSMTPAccount setMailAccount:](v6, "setMailAccount:", self);
    v7 = self->_deliveryAccount;
    self->_deliveryAccount = &v6->super.super;

    deliveryAccount = self->_deliveryAccount;
  }
  return deliveryAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveryAccount, 0);
}

@end
