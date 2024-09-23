@implementation MFAccountValidator

- (MFAccountValidator)init
{
  return -[MFAccountValidator initWithPerformsValidationInBackground:](self, "initWithPerformsValidationInBackground:", 1);
}

- (MFAccountValidator)initWithPerformsValidationInBackground:(BOOL)a3
{
  _BOOL4 v3;
  MFAccountValidator *result;
  int v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MFAccountValidator;
  result = -[MFAccountValidator init](&v6, sel_init);
  if (result)
  {
    if (v3)
      v5 = 16;
    else
      v5 = 0;
    result->_flags = ($0E8FE02B67A2F718BF097A78E2A975F7)(*(_DWORD *)&result->_flags & 0xFFFFFFEF | v5);
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[MFAccountValidator stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)MFAccountValidator;
  -[MFAccountValidator dealloc](&v3, sel_dealloc);
}

- (void)validateAccount:(id)a3 useSSL:(BOOL)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__MFAccountValidator_validateAccount_useSSL___block_invoke;
  v4[3] = &unk_1E4E88998;
  v4[4] = self;
  -[MFAccountValidator validateAccount:useSSL:withCompletion:](self, "validateAccount:useSSL:withCompletion:", a3, a4, v4);
}

void __45__MFAccountValidator_validateAccount_useSSL___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *v5;
  id v6;
  id WeakRetained;

  v5 = (id *)(*(_QWORD *)(a1 + 32) + 80);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "accountValidator:finishedValidationOfAccount:usedSSL:", *(_QWORD *)(a1 + 32), v6, a3);

}

- (void)validateAccount:(id)a3 useSSL:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL4 v6;
  id v9;
  void *v10;
  id completionBlock;
  id v12;

  v6 = a4;
  objc_storeStrong((id *)&self->_account, a3);
  v12 = a3;
  v9 = a5;
  self->_flags = ($0E8FE02B67A2F718BF097A78E2A975F7)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | v6);
  v10 = _Block_copy(v9);

  completionBlock = self->_completionBlock;
  self->_completionBlock = v10;

  -[MFAccountValidator _validateAccount:withFallbacks:](self, "_validateAccount:withFallbacks:", self->_account, 1);
}

- (void)validateAccountWithoutFallbacks:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__MFAccountValidator_validateAccountWithoutFallbacks___block_invoke;
  v3[3] = &unk_1E4E88998;
  v3[4] = self;
  -[MFAccountValidator validateAccountWithoutFallbacks:withCompletion:](self, "validateAccountWithoutFallbacks:withCompletion:", a3, v3);
}

void __54__MFAccountValidator_validateAccountWithoutFallbacks___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *v5;
  id v6;
  id WeakRetained;

  v5 = (id *)(*(_QWORD *)(a1 + 32) + 80);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "accountValidator:finishedValidationOfAccount:usedSSL:", *(_QWORD *)(a1 + 32), v6, a3);

}

- (void)validateAccountWithoutFallbacks:(id)a3 withCompletion:(id)a4
{
  id v7;
  void *v8;
  id completionBlock;
  id v10;

  objc_storeStrong((id *)&self->_account, a3);
  v10 = a3;
  v7 = a4;
  v8 = _Block_copy(v7);

  completionBlock = self->_completionBlock;
  self->_completionBlock = v8;

  -[MFAccountValidator _validateAccount:withFallbacks:](self, "_validateAccount:withFallbacks:", self->_account, 0);
}

- (MFAccount)account
{
  return self->_account;
}

- (id)_ispAccountInfo
{
  return 0;
}

- (void)_backgroundValidateAccountFinished:(id)a3 authSchemes:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  MFActivityMonitor *accountValidationActivity;
  id v14;

  v14 = a3;
  v6 = a4;
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  -[MFActivityMonitor error](self->_accountValidationActivity, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "code"))
    v10 = 0;
  else
    v10 = v6;
  v11 = 48;
  if (v7 == v8)
  {
    v11 = 56;
    v12 = 72;
  }
  else
  {
    v12 = 64;
  }
  objc_storeStrong((id *)((char *)&self->super.isa + v11), v9);
  objc_storeStrong((id *)((char *)&self->super.isa + v12), v10);
  accountValidationActivity = self->_accountValidationActivity;
  self->_accountValidationActivity = 0;

  (*((void (**)(void))self->_completionBlock + 2))();
}

- (void)_validateAccount:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char v7;
  $0E8FE02B67A2F718BF097A78E2A975F7 flags;
  char v9;
  uint64_t v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  unsigned int v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  char v35;
  void *v36;
  uint64_t v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  char v41;
  char v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  id v66[18];

  v66[16] = *(id *)MEMORY[0x1E0C80C00];
  v3 = a3;
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultConnectionSettings");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  if ((objc_msgSend((id)objc_opt_class(), "isSSLEditable") & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "predefinedValueForKey:", CFSTR("SSLEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_flags = ($0E8FE02B67A2F718BF097A78E2A975F7)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | objc_msgSend(v6, "BOOLValue"));

  }
  v7 = objc_msgSend(v58, "shouldCancel");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) != 0)
    v9 = v7;
  else
    v9 = 1;
  if ((v9 & 1) != 0)
  {
    v56 = 0;
    goto LABEL_24;
  }
  v60 = 0;
  _openConnectionForAccount(v3, 1, (uint64_t)&v60);
  v10 = objc_claimAutoreleasedReturnValue();
  v56 = v60;
  if (v10)
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(v58, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "code") == 1034)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(v58, "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v13, "code") != 1045;

    }
  }
  if (v4 == v5)
    v14 = 4;
  else
    v14 = 2;
  if (v4 == v5)
    v15 = -5;
  else
    v15 = -3;
  if (!v11)
    v14 = 0;
  flags = ($0E8FE02B67A2F718BF097A78E2A975F7)(*(_DWORD *)&self->_flags & v15 | v14);
  self->_flags = flags;
  if (!v10)
  {
LABEL_24:
    if ((*(_BYTE *)&flags & 1) != 0)
      goto LABEL_30;
    if ((objc_msgSend(v58, "shouldCancel") & 1) != 0)
      goto LABEL_30;
    objc_msgSend(v3, "applySettingsAsDefault:", v53);
    v59 = v56;
    _openConnectionForAccount(v3, 0, (uint64_t)&v59);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v59;

    v56 = v18;
    v16 = (void *)v17;
    if (!v17)
    {
LABEL_30:
      objc_msgSend(v58, "error");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "userInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKey:", CFSTR("MFSSLErrorCertificateKey"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22 == 0;

      if (!v23)
      {
        v19 = 0;
        goto LABEL_100;
      }
      if (v4 == v5)
        MFLookupLocalizedString(CFSTR("SMTP_CONNECTION_FAILED_MESSAGE_FORMAT"), CFSTR("The %@ server “%@” is not responding. Check your network connection and that you entered the correct information in the “Outgoing Mail Server” field."), CFSTR("Assistant"));
      else
        MFLookupLocalizedString(CFSTR("CONNECTION_FAILED_MESSAGE_FORMAT"), CFSTR("The %@ server “%@” is not responding. Check your network connection and that you entered the correct information in the “Incoming Mail Server” field."), CFSTR("Assistant"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)MEMORY[0x1E0CB3940];
      _accountTypeString(v3);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "hostname");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "stringWithFormat:", v16, v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1030, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setError:", v51);

      v19 = 0;
LABEL_99:

      goto LABEL_100;
    }
    goto LABEL_27;
  }
  v16 = (void *)v10;
LABEL_27:
  objc_msgSend(v3, "applySettingsAsDefault:", v56);
  objc_msgSend(MEMORY[0x1E0D1E688], "authenticationSchemesForAccount:connection:", v3, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "requiresAuthentication") & 1) == 0
    && (v4 != v5 || !objc_msgSend(v3, "shouldUseAuthentication")))
  {
LABEL_96:
    _closeConnection(v16);
    goto LABEL_99;
  }
  objc_msgSend(MEMORY[0x1E0D1E688], "schemeWithName:", *MEMORY[0x1E0D1E668]);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count"))
    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v19);
  else
    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v54, 0);
  v24 = 0;
  LOBYTE(v25) = 0;
  while (1)
  {
    v26 = v19;
    if (v24)
      break;
    if (objc_msgSend(v3, "usesSSL"))
    {
      if (objc_msgSend(v57, "indexOfObject:", v54) != 0x7FFFFFFFFFFFFFFFLL)
      {
        v27 = v54;
        if (v54)
          goto LABEL_61;
      }
    }
LABEL_47:
    v28 = v57;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v29 = v28;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v62;
LABEL_49:
      v32 = 0;
      while (1)
      {
        if (*(_QWORD *)v62 != v31)
          objc_enumerationMutation(v29);
        v33 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v32);
        if ((objc_msgSend(v33, "hasEncryption") & 1) != 0)
          break;
        if (v30 == ++v32)
        {
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
          v19 = v26;
          if (v30)
            goto LABEL_49;
          goto LABEL_55;
        }
      }
      v34 = v33;

      v19 = v26;
      if (v34)
        goto LABEL_58;
    }
    else
    {
LABEL_55:

    }
    objc_msgSend(v29, "firstObject");
    v34 = (id)objc_claimAutoreleasedReturnValue();
LABEL_58:

    if (!v34)
    {
      if (objc_msgSend(v3, "requiresAuthentication"))
      {
        v27 = v54;
LABEL_61:
        v34 = v27;
        goto LABEL_63;
      }
      v34 = 0;
    }
LABEL_63:
    objc_msgSend(v58, "setError:", 0);
    objc_msgSend(v3, "setPreferredAuthScheme:", v34);
    if (v16)
      goto LABEL_64;
    v16 = (void *)objc_msgSend(objc_allocWithZone((Class)objc_msgSend(v3, "connectionClass")), "init");
    if ((objc_msgSend(v16, "connectUsingAccount:", v3) & 1) != 0)
    {
      if (v16)
      {
LABEL_64:
        v35 = 0;
        if ((objc_msgSend(v16, "authenticateUsingAccount:", v3) & 1) == 0)
          goto LABEL_74;
        goto LABEL_65;
      }
    }
    else
    {

      v16 = 0;
    }
    v35 = 1;
    if ((v25 & 1) == 0)
    {
LABEL_74:
      LOBYTE(v25) = 0;
      goto LABEL_78;
    }
    if (objc_msgSend(v19, "indexOfObject:", v34) != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_77;
LABEL_65:
    if (v19 && objc_msgSend(v19, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v19, "count") + 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v36, "addObjectsFromArray:", v36);
      objc_msgSend(v36, "addObject:", v34);
      LOBYTE(v25) = 1;
      v19 = v36;
      goto LABEL_78;
    }
    if (v34)
    {
      v65 = v34;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
      v37 = objc_claimAutoreleasedReturnValue();

      LOBYTE(v25) = 1;
      v19 = (void *)v37;
    }
    else
    {
LABEL_77:
      LOBYTE(v25) = 1;
    }
LABEL_78:
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
      +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1028, 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setError:", v43);
LABEL_89:

      goto LABEL_90;
    }
    if ((v25 & 1) == 0)
    {
      objc_msgSend(v58, "error");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38 == 0;

      if (!v39)
      {
        objc_msgSend(v58, "error");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v25) = objc_msgSend(v3, "shouldEnableAfterError:", v40);

        if ((_DWORD)v25)
        {
          v41 = objc_msgSend(v3, "enableAccount");
          LOBYTE(v25) = 0;
          v42 = v24 < 3 ? v41 : 0;
          if ((v42 & 1) != 0)
            goto LABEL_91;
        }
        goto LABEL_90;
      }
      v44 = (void *)MEMORY[0x1E0CB3940];
      MFLookupLocalizedString(CFSTR("FAILED_LOGIN"), CFSTR("The user name or password for “%@” is incorrect."), CFSTR("Delayed"));
      v25 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "username");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "stringWithFormat:", v25, v45);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1032, v43);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setError:", v46);

      LOBYTE(v25) = 0;
      goto LABEL_89;
    }
    LOBYTE(v25) = 1;
LABEL_90:
    objc_msgSend(v57, "removeObject:", v34);
LABEL_91:
    if ((v35 & 1) == 0)
    {
      _closeConnection(v16);

    }
    v16 = 0;
    ++v24;
  }
  if ((v25 & 1) == 0 && objc_msgSend(v57, "count") && (objc_msgSend(v58, "shouldCancel") & 1) == 0)
    goto LABEL_47;

  if (v16)
    goto LABEL_96;
LABEL_100:
  v66[0] = 0;
  -[MFAccountValidator pep_getInvocation:](self, "pep_getInvocation:", v66);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "_backgroundValidateAccountFinished:authSchemes:", v3, v19);

  objc_msgSend(v66[0], "retainArguments");
  objc_msgSend(v66[0], "performSelectorOnMainThread:withObject:waitUntilDone:", sel_invoke, 0, 1);

}

- (void)_validateAccountWithoutFallbacks:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
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
  void *v26;
  id v27;
  id v28;

  v4 = a3;
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  if ((objc_msgSend(v5, "shouldCancel") & 1) != 0)
  {
    v8 = 0;
    v9 = 0;
    goto LABEL_5;
  }
  v28 = 0;
  _openConnectionForAccount(v4, objc_msgSend(v4, "usesSSL"), (uint64_t)&v28);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v28;
  if (v9 && (objc_msgSend(v5, "shouldCancel") & 1) == 0)
  {
    if ((objc_msgSend(v4, "requiresAuthentication") & 1) == 0
      && (v6 != v7 || !objc_msgSend(v4, "shouldUseAuthentication")))
    {
      goto LABEL_22;
    }
    v13 = objc_msgSend(v9, "authenticateUsingAccount:", v4);
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
      +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1028, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setError:", v18);
    }
    else
    {
      if ((v13 & 1) != 0)
        goto LABEL_20;
      objc_msgSend(v5, "error");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        goto LABEL_20;
      v15 = (void *)MEMORY[0x1E0CB3940];
      MFLookupLocalizedString(CFSTR("FAILED_LOGIN"), CFSTR("The user name or password for “%@” is incorrect."), CFSTR("Delayed"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "username");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1032, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setError:", v19);

    }
LABEL_20:
    _closeConnection(v9);
    v20 = v9;
    v9 = 0;
LABEL_21:

    goto LABEL_22;
  }
LABEL_5:
  objc_msgSend(v5, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("MFSSLErrorCertificateKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    if (v6 == v7)
      MFLookupLocalizedString(CFSTR("SMTP_CONNECTION_FAILED_MESSAGE_FORMAT"), CFSTR("The %@ server “%@” is not responding. Check your network connection and that you entered the correct information in the “Outgoing Mail Server” field."), CFSTR("Assistant"));
    else
      MFLookupLocalizedString(CFSTR("CONNECTION_FAILED_MESSAGE_FORMAT"), CFSTR("The %@ server “%@” is not responding. Check your network connection and that you entered the correct information in the “Incoming Mail Server” field."), CFSTR("Assistant"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CB3940];
    _accountTypeString(v4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hostname");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", v20, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1030, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setError:", v25);

    goto LABEL_21;
  }
LABEL_22:
  v27 = 0;
  -[MFAccountValidator pep_getInvocation:](self, "pep_getInvocation:", &v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_backgroundValidateAccountFinished:authSchemes:", v4, 0);

  objc_msgSend(v27, "retainArguments");
  objc_msgSend(v27, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_invoke, 0, 1);

}

- (BOOL)_incomingServerValid
{
  MFError *incomingServerValidationError;

  incomingServerValidationError = self->_incomingServerValidationError;
  return !incomingServerValidationError || -[MFError code](incomingServerValidationError, "code") == 0;
}

- (BOOL)_outgoingServerValid
{
  MFError *smtpServerValidationError;

  smtpServerValidationError = self->_smtpServerValidationError;
  return !smtpServerValidationError || -[MFError code](smtpServerValidationError, "code") == 0;
}

- (void)stop
{
  *(_DWORD *)&self->_flags |= 8u;
  -[MFActivityMonitor cancel](self->_accountValidationActivity, "cancel");
}

- (BOOL)accountValidationCanceled
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (void)_validateAccount:(id)a3 withFallbacks:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  char *v8;
  MFMonitoredInvocation *v9;
  MFActivityMonitor *v10;
  MFActivityMonitor *accountValidationActivity;
  void *validationInvocation;
  MFMonitoredInvocation *v13;
  id v14;

  v4 = a4;
  v6 = a3;
  if (!self->_accountValidationActivity)
  {
    v14 = v6;
    MFLookupLocalizedString(CFSTR("CHECKING_CONNECTION"), CFSTR("Checking connection"), CFSTR("Assistant"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v8 = sel__validateAccount_;
    else
      v8 = sel__validateAccountWithoutFallbacks_;
    +[MFMonitoredInvocation invocationWithSelector:target:object:taskName:priority:canBeCancelled:](MFMonitoredInvocation, "invocationWithSelector:target:object:taskName:priority:canBeCancelled:", v8, self, v14, v7, -1, 1);
    v9 = (MFMonitoredInvocation *)objc_claimAutoreleasedReturnValue();

    -[MFMonitoredInvocation monitor](v9, "monitor");
    v10 = (MFActivityMonitor *)objc_claimAutoreleasedReturnValue();
    accountValidationActivity = self->_accountValidationActivity;
    self->_accountValidationActivity = v10;

    -[MFActivityMonitor setCanBeCancelled:](self->_accountValidationActivity, "setCanBeCancelled:", 1);
    if (-[MFAccountValidator performsValidationInBackground](self, "performsValidationInBackground"))
    {
      +[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue");
      validationInvocation = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(validationInvocation, "addInvocation:", v9);
    }
    else
    {
      if (v9 == self->_validationInvocation)
      {
LABEL_10:

        v6 = v14;
        goto LABEL_11;
      }
      v13 = v9;
      validationInvocation = self->_validationInvocation;
      self->_validationInvocation = v13;
    }

    goto LABEL_10;
  }
LABEL_11:

}

- (BOOL)performsValidationInBackground
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (MFMonitoredInvocation)validationInvocation
{
  MFMonitoredInvocation *v3;

  if (-[MFAccountValidator performsValidationInBackground](self, "performsValidationInBackground"))
    v3 = 0;
  else
    v3 = self->_validationInvocation;
  return v3;
}

- (BOOL)accountIsValid
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  BOOL v6;

  -[MFAccountValidator account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  if (v4 == objc_opt_class())
    v5 = -[MFAccountValidator _outgoingServerValid](self, "_outgoingServerValid");
  else
    v5 = -[MFAccountValidator _incomingServerValid](self, "_incomingServerValid");
  v6 = v5;

  return v6;
}

- (BOOL)accountSupportsSSL
{
  void *v3;
  uint64_t v4;
  int v5;
  BOOL v6;

  -[MFAccountValidator account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  if (v4 == objc_opt_class())
    v5 = 4;
  else
    v5 = 2;
  v6 = (*(_DWORD *)&self->_flags & v5) != 0;

  return v6;
}

- (MFError)error
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  MFError *v7;

  -[MFAccountValidator account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = 48;
  if (v4 == v5)
    v6 = 56;
  v7 = (MFError *)*(id *)((char *)&self->super.isa + v6);

  return v7;
}

- (MFAccountValidatorDelegate)delegate
{
  return (MFAccountValidatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_smtpServerAuthSchemes, 0);
  objc_storeStrong((id *)&self->_incomingServerAuthSchemes, 0);
  objc_storeStrong((id *)&self->_smtpServerValidationError, 0);
  objc_storeStrong((id *)&self->_incomingServerValidationError, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_validationInvocation, 0);
  objc_storeStrong((id *)&self->_accountValidationActivity, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
