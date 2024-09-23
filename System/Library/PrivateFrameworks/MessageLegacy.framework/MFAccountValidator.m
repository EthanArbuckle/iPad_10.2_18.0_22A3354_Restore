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
  self->_delegate = 0;

  self->_account = 0;
  self->_validationInvocation = 0;

  self->_accountValidationActivity = 0;
  self->_incomingServerValidationError = 0;

  self->_smtpServerValidationError = 0;
  self->_incomingServerAuthSchemes = 0;

  self->_smtpServerAuthSchemes = 0;
  self->_completionBlock = 0;
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
  v4[3] = &unk_1E81C9EB0;
  v4[4] = self;
  -[MFAccountValidator validateAccount:useSSL:withCompletion:](self, "validateAccount:useSSL:withCompletion:", a3, a4, v4);
}

uint64_t __45__MFAccountValidator_validateAccount_useSSL___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "accountValidator:finishedValidationOfAccount:usedSSL:", *(_QWORD *)(a1 + 32), a2, a3);
}

- (void)validateAccount:(id)a3 useSSL:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL4 v6;

  v6 = a4;
  self->_account = (MFAccount *)a3;
  self->_flags = ($0E8FE02B67A2F718BF097A78E2A975F7)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | v6);
  self->_completionBlock = (id)objc_msgSend(a5, "copy");
  -[MFAccountValidator _validateAccount:withFallbacks:](self, "_validateAccount:withFallbacks:", self->_account, 1);
}

- (void)validateAccountWithoutFallbacks:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__MFAccountValidator_validateAccountWithoutFallbacks___block_invoke;
  v3[3] = &unk_1E81C9EB0;
  v3[4] = self;
  -[MFAccountValidator validateAccountWithoutFallbacks:withCompletion:](self, "validateAccountWithoutFallbacks:withCompletion:", a3, v3);
}

uint64_t __54__MFAccountValidator_validateAccountWithoutFallbacks___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "accountValidator:finishedValidationOfAccount:usedSSL:", *(_QWORD *)(a1 + 32), a2, a3);
}

- (void)validateAccountWithoutFallbacks:(id)a3 withCompletion:(id)a4
{
  MFAccount *account;

  account = self->_account;
  if (account != a3)
  {

    self->_account = (MFAccount *)a3;
  }
  self->_completionBlock = (id)objc_msgSend(a4, "copy");
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
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  NSArray *v10;
  NSArray *v11;

  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = -[MFActivityMonitor error](self->_accountValidationActivity, "error");
  v9 = objc_msgSend(v8, "code");
  if (v6 == v7)
  {

    self->_smtpServerValidationError = (MFError *)v8;
    if (v9)
      v11 = 0;
    else
      v11 = (NSArray *)a4;
    self->_smtpServerAuthSchemes = v11;
  }
  else
  {

    self->_incomingServerValidationError = (MFError *)v8;
    if (v9)
      v10 = 0;
    else
      v10 = (NSArray *)a4;
    self->_incomingServerAuthSchemes = v10;
  }

  self->_accountValidationActivity = 0;
  (*((void (**)(void))self->_completionBlock + 2))();
}

- (void)_validateAccount:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  $0E8FE02B67A2F718BF097A78E2A975F7 flags;
  void *v10;
  _BOOL4 v11;
  int v12;
  int v13;
  int v14;
  id v15;
  BOOL v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unsigned int v21;
  char v22;
  _BOOL4 v23;
  MFAuthScheme *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  char v29;
  void *v30;
  char v31;
  char v32;
  MFAuthScheme *v33;
  MFAccountValidator *v34;
  id v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  MFAuthScheme *v41;
  id v42[18];

  v42[16] = *(id *)MEMORY[0x1E0C80C00];
  v35 = +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v36 = 0;
  v5 = objc_msgSend(a3, "defaultConnectionSettings");
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  if ((objc_msgSend((id)objc_opt_class(), "isSSLEditable") & 1) == 0)
    self->_flags = ($0E8FE02B67A2F718BF097A78E2A975F7)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "predefinedValueForKey:", CFSTR("SSLEnabled")), "BOOLValue"));
  v8 = objc_msgSend(v35, "shouldCancel");
  v34 = self;
  flags = self->_flags;
  if ((v8 & 1) != 0
    || (*(_BYTE *)&flags & 1) == 0
    || ((v10 = _openConnectionForAccount(a3, 1, (uint64_t)&v36)) == 0
      ? (objc_msgSend((id)objc_msgSend(v35, "error"), "code") != 1034
       ? (v11 = objc_msgSend((id)objc_msgSend(v35, "error"), "code") != 1045)
       : (v11 = 0))
      : (v11 = 1),
        v6 != v7 ? (v12 = 2) : (v12 = 4),
        v6 != v7 ? (v13 = -3) : (v13 = -5),
        !v11 ? (v14 = 0) : (v14 = v12),
        flags = ($0E8FE02B67A2F718BF097A78E2A975F7)(*(_DWORD *)&self->_flags & v13 | v14),
        self->_flags = flags,
        !v10))
  {
    if ((*(_BYTE *)&flags & 1) != 0
      || (objc_msgSend(v35, "shouldCancel") & 1) != 0
      || (objc_msgSend(a3, "applySettingsAsDefault:", v5), (v10 = _openConnectionForAccount(a3, 0, (uint64_t)&v36)) == 0))
    {
      if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(v35, "error"), "userInfo"), "objectForKey:", CFSTR("MFSSLErrorCertificateKey")))
      {
        if (v6 == v7)
          v19 = MFLookupLocalizedString((uint64_t)CFSTR("SMTP_CONNECTION_FAILED_MESSAGE_FORMAT"), (uint64_t)CFSTR("The %@ server “%@” is not responding. Check your network connection and that you entered the correct information in the “Outgoing Mail Server” field."), CFSTR("Assistant"));
        else
          v19 = MFLookupLocalizedString((uint64_t)CFSTR("CONNECTION_FAILED_MESSAGE_FORMAT"), (uint64_t)CFSTR("The %@ server “%@” is not responding. Check your network connection and that you entered the correct information in the “Incoming Mail Server” field."), CFSTR("Assistant"));
        objc_msgSend(v35, "setError:", +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1030, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v19, objc_msgSend((id)objc_opt_class(), "accountTypeString"), objc_msgSend(a3, "hostname"))));
      }
      v15 = 0;
      goto LABEL_97;
    }
  }
  objc_msgSend(a3, "applySettingsAsDefault:", v36);
  v15 = +[MFAuthScheme authSchemesForAccount:connection:](MFAuthScheme, "authSchemesForAccount:connection:", a3, v10);
  if ((objc_msgSend(a3, "requiresAuthentication") & 1) == 0
    && (v6 != v7 || !objc_msgSend(a3, "shouldUseAuthentication")))
  {
LABEL_93:
    _closeConnection(v10);

    goto LABEL_97;
  }
  v33 = +[MFAuthScheme schemeWithName:](MFAuthScheme, "schemeWithName:", &stru_1E81CBE50);
  v16 = objc_msgSend(v15, "count") == 0;
  v17 = objc_alloc(MEMORY[0x1E0C99DE8]);
  if (v16)
    v18 = objc_msgSend(v17, "initWithObjects:", v33, 0);
  else
    v18 = objc_msgSend(v17, "initWithArray:", v15);
  v20 = (void *)v18;
  v21 = 0;
  v22 = 0;
  while (1)
  {
    if (!v21)
    {
      if (objc_msgSend(a3, "usesSSL"))
      {
        v23 = objc_msgSend(v20, "indexOfObject:") == 0x7FFFFFFFFFFFFFFFLL || v33 == 0;
        v24 = v33;
        if (!v23)
          goto LABEL_61;
      }
      goto LABEL_44;
    }
    if ((v22 & 1) != 0 || !objc_msgSend(v20, "count") || (objc_msgSend(v35, "shouldCancel") & 1) != 0)
      break;
LABEL_44:
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v25 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v38;
LABEL_46:
      v27 = 0;
      while (1)
      {
        if (*(_QWORD *)v38 != v26)
          objc_enumerationMutation(v20);
        v28 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v27);
        if ((objc_msgSend(v28, "hasEncryption") & 1) != 0)
          break;
        if (v25 == ++v27)
        {
          v25 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
          if (v25)
            goto LABEL_46;
          goto LABEL_54;
        }
      }
      if (v28)
        goto LABEL_57;
    }
LABEL_54:
    if (objc_msgSend(v20, "count"))
      v28 = (void *)objc_msgSend(v20, "objectAtIndex:", 0);
    else
      v28 = 0;
LABEL_57:
    v24 = v28;
    if (!v24)
    {
      if (objc_msgSend(a3, "requiresAuthentication"))
        v24 = v33;
      else
        v24 = 0;
    }
LABEL_61:
    objc_msgSend(v35, "setError:", 0);
    objc_msgSend(a3, "setPreferredAuthScheme:", v24);
    if (v10)
      goto LABEL_62;
    v10 = (void *)objc_msgSend(objc_allocWithZone((Class)objc_msgSend(a3, "connectionClass")), "init");
    if ((objc_msgSend(v10, "connectUsingAccount:", a3) & 1) != 0)
    {
      if (v10)
      {
LABEL_62:
        v29 = 0;
        if ((objc_msgSend(v10, "authenticateUsingAccount:", a3) & 1) == 0)
          goto LABEL_72;
        goto LABEL_63;
      }
    }
    else
    {

      v10 = 0;
    }
    v29 = 1;
    if ((v22 & 1) == 0)
    {
LABEL_72:
      v22 = 0;
      goto LABEL_75;
    }
LABEL_63:
    if (objc_msgSend(v15, "indexOfObject:", v24) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v15 && objc_msgSend(v15, "count"))
      {
        v15 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v15, "count") + 1);
        objc_msgSend(v15, "addObjectsFromArray:", v15);
        objc_msgSend(v15, "addObject:", v24);
      }
      else
      {
        v41 = v24;
        v15 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
      }
    }
    v22 = 1;
LABEL_75:
    if ((*(_BYTE *)&v34->_flags & 8) != 0)
    {
      v30 = v10;
      objc_msgSend(v35, "setError:", +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1028, 0));
      objc_msgSend(v20, "removeObject:", v24);
    }
    else
    {
      if ((v22 & 1) != 0)
      {
        v22 = 1;
        v30 = v10;
      }
      else
      {
        v30 = v10;
        if (!objc_msgSend(v35, "error"))
        {
          objc_msgSend(v35, "setError:", +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1032, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("FAILED_LOGIN"), (uint64_t)CFSTR("The user name or password for “%@” is incorrect."), CFSTR("Delayed")), objc_msgSend(a3, "username"))));
          objc_msgSend(v20, "removeObject:", v24);
LABEL_91:
          v10 = 0;
          v22 = 0;
          goto LABEL_88;
        }
        if (objc_msgSend(a3, "shouldEnableAfterError:", objc_msgSend(v35, "error")))
        {
          v31 = objc_msgSend(a3, "enableAccount");
          v32 = v21 < 3 ? v31 : 0;
          if ((v32 & 1) != 0)
            goto LABEL_91;
        }
        v22 = 0;
      }
      objc_msgSend(v20, "removeObject:", v24);
    }
    v10 = 0;
LABEL_88:
    ++v21;
    if ((v29 & 1) == 0)
    {
      _closeConnection(v30);

      v10 = 0;
    }
  }

  if (v10)
    goto LABEL_93;
LABEL_97:
  v42[0] = 0;
  objc_msgSend((id)-[MFAccountValidator pep_getInvocation:](v34, "pep_getInvocation:", v42), "_backgroundValidateAccountFinished:authSchemes:", a3, v15);
  objc_msgSend(v42[0], "performSelectorOnMainThread:withObject:waitUntilDone:", sel_invoke, 0, 1);
}

- (void)_validateAccountWithoutFallbacks:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;

  v5 = +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v17 = 0;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  if ((objc_msgSend(v5, "shouldCancel") & 1) == 0)
  {
    v8 = _openConnectionForAccount(a3, objc_msgSend(a3, "usesSSL"), (uint64_t)&v17);
    if (v8)
    {
      v9 = v8;
      if ((objc_msgSend(v5, "shouldCancel") & 1) == 0)
      {
        if ((objc_msgSend(a3, "requiresAuthentication") & 1) == 0
          && (v6 != v7 || !objc_msgSend(a3, "shouldUseAuthentication")))
        {
          goto LABEL_20;
        }
        v12 = objc_msgSend(v9, "authenticateUsingAccount:", a3);
        if ((*(_BYTE *)&self->_flags & 8) != 0)
        {
          v14 = 1028;
          v13 = 0;
        }
        else
        {
          if ((v12 & 1) != 0 || objc_msgSend(v5, "error"))
            goto LABEL_19;
          v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("FAILED_LOGIN"), (uint64_t)CFSTR("The user name or password for “%@” is incorrect."), CFSTR("Delayed")), objc_msgSend(a3, "username"));
          v14 = 1032;
        }
        objc_msgSend(v5, "setError:", +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), v14, v13));
LABEL_19:
        _closeConnection(v9);

        goto LABEL_20;
      }
    }
  }
  if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "error"), "userInfo"), "objectForKey:", CFSTR("MFSSLErrorCertificateKey")))
  {
    if (v6 == v7)
    {
      v10 = CFSTR("SMTP_CONNECTION_FAILED_MESSAGE_FORMAT");
      v11 = CFSTR("The %@ server “%@” is not responding. Check your network connection and that you entered the correct information in the “Outgoing Mail Server” field.");
    }
    else
    {
      v10 = CFSTR("CONNECTION_FAILED_MESSAGE_FORMAT");
      v11 = CFSTR("The %@ server “%@” is not responding. Check your network connection and that you entered the correct information in the “Incoming Mail Server” field.");
    }
    v15 = MFLookupLocalizedString((uint64_t)v10, (uint64_t)v11, CFSTR("Assistant"));
    objc_msgSend(v5, "setError:", +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1030, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v15, objc_msgSend((id)objc_opt_class(), "accountTypeString"), objc_msgSend(a3, "hostname"))));
  }
LABEL_20:
  v16 = 0;
  objc_msgSend((id)-[MFAccountValidator pep_getInvocation:](self, "pep_getInvocation:", &v16), "_backgroundValidateAccountFinished:authSchemes:", a3, 0);
  objc_msgSend(v16, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_invoke, 0, 1);
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
  char **v5;
  MFMonitoredInvocation *v6;
  MFActivityMonitor *v7;
  MFMonitoredInvocation *validationInvocation;

  if (!self->_accountValidationActivity)
  {
    v5 = &selRef__validateAccount_;
    if (!a4)
      v5 = &selRef__validateAccountWithoutFallbacks_;
    v6 = +[MFMonitoredInvocation invocationWithSelector:target:object:taskName:priority:canBeCancelled:](MFMonitoredInvocation, "invocationWithSelector:target:object:taskName:priority:canBeCancelled:", *v5, self, a3, MFLookupLocalizedString((uint64_t)CFSTR("CHECKING_CONNECTION"), (uint64_t)CFSTR("Checking connection"), CFSTR("Assistant")), -1, 1);

    v7 = -[MFMonitoredInvocation monitor](v6, "monitor");
    self->_accountValidationActivity = v7;
    -[MFActivityMonitor setCanBeCancelled:](v7, "setCanBeCancelled:", 1);
    if (-[MFAccountValidator performsValidationInBackground](self, "performsValidationInBackground"))
    {
      objc_msgSend(+[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue"), "addInvocation:", v6);
    }
    else
    {
      validationInvocation = self->_validationInvocation;
      if (v6 != validationInvocation)
      {

        self->_validationInvocation = v6;
      }
    }
  }
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
  uint64_t v3;

  -[MFAccountValidator account](self, "account");
  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
    return -[MFAccountValidator _outgoingServerValid](self, "_outgoingServerValid");
  else
    return -[MFAccountValidator _incomingServerValid](self, "_incomingServerValid");
}

- (BOOL)accountSupportsSSL
{
  uint64_t v3;
  int v4;

  -[MFAccountValidator account](self, "account");
  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
    v4 = 4;
  else
    v4 = 2;
  return (*(_DWORD *)&self->_flags & v4) != 0;
}

- (MFError)error
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[MFAccountValidator account](self, "account");
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = 48;
  if (v3 == v4)
    v5 = 56;
  return *(MFError **)((char *)&self->super.isa + v5);
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

@end
