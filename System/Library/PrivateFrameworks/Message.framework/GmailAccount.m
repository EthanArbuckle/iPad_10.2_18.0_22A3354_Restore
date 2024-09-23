@implementation GmailAccount

- (GmailAccount)initWithLibrary:(id)a3 persistentAccount:(id)a4
{
  GmailAccount *v4;
  GmailAccount *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GmailAccount;
  v4 = -[IMAPAccount initWithLibrary:persistentAccount:](&v7, sel_initWithLibrary_persistentAccount_, a3, a4);
  if (v4)
  {
    if (RegisterGmailAuthSchemes_onceToken != -1)
      dispatch_once(&RegisterGmailAuthSchemes_onceToken, &__block_literal_global_5);
    v5 = v4;
  }

  return v4;
}

+ (id)authSchemesForAccountClass
{
  objc_super v4;

  if (RegisterGmailAuthSchemes_onceToken != -1)
    dispatch_once(&RegisterGmailAuthSchemes_onceToken, &__block_literal_global_5);
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___GmailAccount;
  objc_msgSendSuper2(&v4, sel_authSchemesForAccountClass);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)accountTypeIdentifier
{
  return (id)*MEMORY[0x1E0C8F0A8];
}

+ (id)emailAddressHostPart
{
  return CFSTR("gmail.com");
}

+ (id)displayedAccountTypeString
{
  return CFSTR("Gmail");
}

+ (id)hostname
{
  return (id)objc_msgSend(a1, "standardAccountClass:valueForKey:", a1, CFSTR("Hostname"));
}

- (id)hostname
{
  return (id)objc_msgSend((id)objc_opt_class(), "hostname");
}

+ (BOOL)isPredefinedAccountType
{
  return 1;
}

+ (id)imapNotEnabledPrefix
{
  return CFSTR("Your account is not enabled for IMAP use.");
}

- (id)statisticsKind
{
  return (id)*MEMORY[0x1E0D46C20];
}

- (id)preferredAuthScheme
{
  return (id)objc_msgSend(MEMORY[0x1E0D1E688], "schemeWithName:", CFSTR("XOAUTH2"));
}

- (void)persistentAccountDidChange:(id)a3 previousAccount:(id)a4
{
  id v6;
  id v7;
  NSString *clientToken;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)GmailAccount;
  -[MailAccount persistentAccountDidChange:previousAccount:](&v9, sel_persistentAccountDidChange_previousAccount_, v6, v7);
  -[GmailAccount mf_lock](self, "mf_lock");
  clientToken = self->_clientToken;
  self->_clientToken = 0;

  -[GmailAccount mf_unlock](self, "mf_unlock");
}

- (void)_deleteHook
{
  id v2;

  -[MFAccount username](self, "username");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[MFMessageKeychainManager removePasswordForServiceName:accountName:](MFMessageKeychainManager, "removePasswordForServiceName:accountName:", CFSTR("IDToken"));

}

- (id)_consumeExistingPreAuthToken
{
  void *v2;
  void *v3;
  id v4;
  id v6;

  -[MFAccount username](self, "username");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  +[MFMessageKeychainManager passwordForServiceName:accountName:synchronizable:error:](MFMessageKeychainManager, "passwordForServiceName:accountName:synchronizable:error:", CFSTR("IDToken"), v2, 0, &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  +[MFMessageKeychainManager removePasswordForServiceName:accountName:](MFMessageKeychainManager, "removePasswordForServiceName:accountName:", CFSTR("IDToken"), v2);

  return v3;
}

- (id)accountStore
{
  void *v2;
  void *v3;

  +[MFAccountStore sharedAccountStore](MFAccountStore, "sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)clientToken
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSString *clientToken;
  uint8_t v12[16];

  -[GmailAccount mf_lock](self, "mf_lock");
  if (!self->_clientToken)
  {
    -[GmailAccount _consumeExistingPreAuthToken](self, "_consumeExistingPreAuthToken");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "UUIDString");
      v5 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v5;
    }
    -[MFAccount persistentAccount](self, "persistentAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GmailAccount accountStore](self, "accountStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "addClientToken:forAccount:", v3, v6) & 1) == 0)
    {
      objc_msgSend(v7, "clientTokenForAccount:", v6);
      v8 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v8;
    }
    if (!v3)
    {
      MFLogGeneral();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1A4F90000, v9, OS_LOG_TYPE_DEFAULT, "#Warning failed to get client token", v12, 2u);
      }

    }
    clientToken = self->_clientToken;
    self->_clientToken = (NSString *)v3;

  }
  -[GmailAccount mf_unlock](self, "mf_unlock");
  return self->_clientToken;
}

- (unint64_t)credentialAccessibility
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  -[MFAccount oauth2Token](self, "oauth2Token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)GmailAccount;
  return -[MFAccount credentialAccessibility](&v6, sel_credentialAccessibility);
}

- (BOOL)shouldArchiveByDefault
{
  return -[MFAccount _BOOLForAccountInfoKey:defaultValue:](self, "_BOOLForAccountInfoKey:defaultValue:", CFSTR("ArchiveMessages"), 1);
}

- (BOOL)supportsArchiving
{
  return 1;
}

- (int64_t)archiveDestinationForMailbox:(id)a3
{
  int64_t result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GmailAccount;
  result = -[MailAccount archiveDestinationForMailbox:](&v4, sel_archiveDestinationForMailbox_, a3);
  if (result == 2)
    return -500;
  return result;
}

- (id)emailAddressStrings
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[MFAccount username](self, "username");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setPassword:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[GmailAccount _deliveryAccountCreateIfNeeded:](self, "_deliveryAccountCreateIfNeeded:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "setPassword:", v4);
  v7.receiver = self;
  v7.super_class = (Class)GmailAccount;
  -[MFAccount setPassword:](&v7, sel_setPassword_, v4);

}

- (id)iconString
{
  return CFSTR("gmailAccountIcon");
}

- (BOOL)shouldFetchACEDBInfoForError:(id)a3
{
  return 0;
}

- (BOOL)derivesDeliveryAccountInfoFromMailAccount
{
  return 1;
}

- (BOOL)supportsFastRemoteBodySearch
{
  return 1;
}

+ (id)deliveryAccountHostname
{
  return (id)objc_msgSend(a1, "standardAccountClass:valueForKey:", a1, CFSTR("DeliveryHostname"));
}

+ (BOOL)deliveryAccountUsesSSL
{
  void *v2;
  char v3;

  objc_msgSend(a1, "standardAccountClass:valueForKey:", a1, CFSTR("DeliverySSLEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

+ (unsigned)deliveryAccountPortNumber
{
  void *v2;
  unsigned int v3;

  objc_msgSend(a1, "standardAccountClass:valueForKey:", a1, CFSTR("DeliveryPortNumber"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (id)_deliveryAccountCreateIfNeeded:(BOOL)a3
{
  MFGmailSMTPAccount *v4;

  if (a3)
  {
    v4 = objc_alloc_init(MFGmailSMTPAccount);
    -[MFGmailSMTPAccount setMailAccount:](v4, "setMailAccount:", self);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (BOOL)usernameIsEmailAddress
{
  return 1;
}

- (BOOL)mustArchiveSentMessages
{
  return 0;
}

- (int)emptyFrequencyForMailboxType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 == 3)
    return -1;
  v7 = v3;
  v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)GmailAccount;
  return -[MailAccount emptyFrequencyForMailboxType:](&v6, sel_emptyFrequencyForMailboxType_);
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  void (**v7)(id, uint64_t, _QWORD);
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v7 = (void (**)(id, uint64_t, _QWORD))a5;
  if (objc_msgSend(v13, "previousFailureCount") > 2)
  {
    v7[2](v7, 2, 0);
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x1E0C92C60]);
    -[MFAccount username](self, "username");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAccount password](self, "password");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithUser:password:persistence:", v9, v10, 1);

    -[GmailAccount mf_lock](self, "mf_lock");
    objc_storeStrong((id *)&self->_credential, v11);
    -[GmailAccount mf_unlock](self, "mf_unlock");
    objc_msgSend(v13, "sender");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "useCredential:forAuthenticationChallenge:", v11, v13);

    ((void (**)(id, uint64_t, NSURLCredential *))v7)[2](v7, 0, self->_credential);
  }

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  void (**v8)(id, uint64_t);
  id v9;

  v9 = a5;
  v8 = (void (**)(id, uint64_t))a6;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v9, "statusCode") == 200)
  {
    -[GmailAccount mf_lock](self, "mf_lock");
    -[EFPromise finishWithResult:](self->_enablingPromise, "finishWithResult:", MEMORY[0x1E0C9AAB0]);
    -[GmailAccount mf_unlock](self, "mf_unlock");
  }
  v8[2](v8, 1);

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  EFPromise *v6;
  EFPromise *enablingPromise;
  id v8;

  v8 = a5;
  -[GmailAccount mf_lock](self, "mf_lock");
  v6 = self->_enablingPromise;
  enablingPromise = self->_enablingPromise;
  self->_enablingPromise = 0;

  -[GmailAccount mf_unlock](self, "mf_unlock");
  if (v8)
    -[EFPromise finishWithError:](v6, "finishWithError:");
  else
    -[EFPromise finishWithResult:](v6, "finishWithResult:", MEMORY[0x1E0C9AAA0]);

}

- (id)_webLoginErrorWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  MFLookupLocalizedString(CFSTR("VERIFICATION_REQUIRED_TITLE"), CFSTR("Verification Required"), CFSTR("Delayed"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  MFLookupLocalizedString(CFSTR("WEBLOGIN_PROMPT_FORMAT"), CFSTR("Log in to your %@ account"), CFSTR("Delayed"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "displayedAccountTypeString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MailAccount displayName](self, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v10, CFSTR("UserFriendlyErrorDescription"), MEMORY[0x1E0C9AAB0], CFSTR("MailErrorHandlerDoNotSanitize"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v4)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v4, CFSTR("RequestedWebLoginURLKey"));
  +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1058, v10, v5, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_URLFromUncleanString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "stringByRemovingPercentEncoding");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "ef_gmailAuthAllowedCharacterSet");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAddingPercentEncodingWithAllowedCharacters:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)errorForResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  if (objc_msgSend(v4, "responseCode") != 34)
    goto LABEL_9;
  objc_msgSend(v4, "responseInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") <= 1)
  {

LABEL_9:
    v11.receiver = self;
    v11.super_class = (Class)GmailAccount;
    -[IMAPAccount errorForResponse:](&v11, sel_errorForResponse_, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(v5, "objectAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(CFSTR("xwebalert"), "caseInsensitiveCompare:", v6)
    && (objc_msgSend(CFSTR("webalert"), "isEqualToString:", v6) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[GmailAccount _URLFromUncleanString:](self, "_URLFromUncleanString:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GmailAccount _webLoginErrorWithURL:](self, "_webLoginErrorWithURL:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!v8)
    goto LABEL_9;
LABEL_10:

  return v8;
}

- (void)_removeCredential:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allCredentials");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKey:", v10, (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "allValues");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "containsObject:", v3))
          objc_msgSend(v4, "removeCredential:forProtectionSpace:", v3, v10);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (BOOL)enableAccount
{
  char v3;
  EFPromise *v4;
  EFPromise *enablingPromise;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSURLCredential *v22;
  NSURLCredential *credential;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  -[GmailAccount mf_lock](self, "mf_lock");
  if (self->_enablingPromise)
    return 0;
  v4 = (EFPromise *)objc_alloc_init(MEMORY[0x1E0D1EF60]);
  enablingPromise = self->_enablingPromise;
  self->_enablingPromise = v4;

  -[EFPromise future](self->_enablingPromise, "future");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GmailAccount mf_unlock](self, "mf_unlock");
  v7 = (void *)objc_opt_class();
  objc_msgSend(v7, "standardAccountClass:valueForKey:", objc_opt_class(), CFSTR("EnableSchema"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_class();
  objc_msgSend(v9, "standardAccountClass:valueForKey:", objc_opt_class(), CFSTR("EnableHost"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_class();
  objc_msgSend(v10, "standardAccountClass:valueForKey:", objc_opt_class(), CFSTR("EnablePath"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", v26, CFSTR("apple"));
  v11 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v11, "setScheme:", v8);
  objc_msgSend(v11, "setHost:", v27);
  objc_msgSend(v11, "setPath:", v29);
  objc_msgSend(v11, "URL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v28);
  objc_msgSend(v12, "setHTTPMethod:", CFSTR("POST"));
  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  EFProductName();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  EFSystemBuildVersion();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%@ (%@)"), v14, v15);

  objc_msgSend(v12, "setValue:forHTTPHeaderField:", v16, *MEMORY[0x1E0D1E608]);
  -[GmailAccount mf_lock](self, "mf_lock");
  objc_msgSend(MEMORY[0x1E0C92CA0], "ephemeralSessionConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAccount sourceApplicationBundleIdentifier](self, "sourceApplicationBundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "set_sourceApplicationBundleIdentifier:", v18);

  objc_msgSend(MEMORY[0x1E0C92C98], "sessionWithConfiguration:delegate:delegateQueue:", v17, self, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dataTaskWithRequest:", v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[GmailAccount mf_unlock](self, "mf_unlock");
  if (v20)
  {
    v25 = v8;
    objc_msgSend(v20, "resume");
    objc_msgSend(v6, "resultWithTimeout:error:", 0, 60.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v21, "BOOLValue");

    -[GmailAccount mf_lock](self, "mf_lock");
    objc_msgSend(v19, "invalidateAndCancel");

    v22 = self->_credential;
    credential = self->_credential;
    self->_credential = 0;

    -[GmailAccount mf_unlock](self, "mf_unlock");
    -[GmailAccount _removeCredential:](self, "_removeCredential:", v22);

    v8 = v25;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)shouldEnableAfterError:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("Your account is not enabled for IMAP use."));

  return v4;
}

- (BOOL)xListSupportedOnConnection:(id)a3
{
  return objc_msgSend(a3, "supportsCapability:", 11);
}

- (id)allMailMailboxUid
{
  return -[MailAccount mailboxUidOfType:createIfNeeded:](self, "mailboxUidOfType:createIfNeeded:", 2, 0);
}

- (id)specialUseAttributeForType:(int64_t)a3
{
  objc_super v4;

  if (a3 == 2)
    return CFSTR("\\All");
  v4.receiver = self;
  v4.super_class = (Class)GmailAccount;
  -[IMAPAccount specialUseAttributeForType:](&v4, sel_specialUseAttributeForType_);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)specialUseAttributesForMailbox:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GmailAccount;
  -[IMAPAccount specialUseAttributesForMailbox:](&v11, sel_specialUseAttributesForMailbox_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extraAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", CFSTR("\\Important"));

  if (!v7)
  {
    v9 = v5;
LABEL_6:
    v8 = v9;
    goto LABEL_7;
  }
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("\\Important"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v8 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v8, "addObject:", CFSTR("\\Important"));
LABEL_7:

  return v8;
}

- (id)displayNameUsingSpecialNamesForMailboxUid:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "mailboxType") == 2)
  {
    MFLookupLocalizedString(CFSTR("GMAIL_ALL_MAIL_SPECIAL_MAILBOX_NAME"), CFSTR("All Mail"), CFSTR("Message"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)GmailAccount;
    -[MailAccount displayNameUsingSpecialNamesForMailboxUid:](&v8, sel_displayNameUsingSpecialNamesForMailboxUid_, v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (BOOL)canMailboxBeRenamed:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  -[GmailAccount persistentNameForMailbox:](self, "persistentNameForMailbox:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)GmailAccount;
    v6 = -[MailAccount canMailboxBeRenamed:](&v8, sel_canMailboxBeRenamed_, v4);
  }

  return v6;
}

- (id)persistentNameForMailbox:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  __CFString *v11;

  -[GmailAccount specialUseAttributesForMailbox:](self, "specialUseAttributesForMailbox:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    if (v4 == 1)
    {
      objc_msgSend(v3, "anyObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("self"), 1);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v7, 0);
      objc_msgSend(v3, "sortedArrayUsingDescriptors:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v10 = v5;
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("\\All")) & 1) != 0)
    {
      v6 = CFSTR("\\AllMail");
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("\\Junk")) & 1) != 0)
    {
      v6 = CFSTR("\\Spam");
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("\\Flagged")) & 1) != 0)
    {
      v6 = CFSTR("\\Starred");
    }
    else
    {
      v11 = CFSTR("\\Drafts");
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("\\Drafts")) & 1) != 0
        || (v11 = CFSTR("\\Sent"), (objc_msgSend(v10, "isEqualToString:", CFSTR("\\Sent")) & 1) != 0)
        || (v11 = CFSTR("\\Trash"), (objc_msgSend(v10, "isEqualToString:", CFSTR("\\Trash")) & 1) != 0))
      {
        v6 = v11;
      }
      else
      {
        v6 = CFSTR("\\Important");
        if (!objc_msgSend(v10, "isEqualToString:", CFSTR("\\Important")))
          v6 = 0;
      }
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_childOfMailbox:(id)a3 withComponentName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  __CFString **v10;
  __CFString *v11;
  __CFString *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GmailAccount;
  -[MailAccount _childOfMailbox:withComponentName:](&v14, sel__childOfMailbox_withComponentName_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    goto LABEL_14;
  v9 = v7;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("\\AllMail")))
  {
    v10 = &IMAPMailboxSpecialUseAttributeAll;
LABEL_8:
    v11 = *v10;
    goto LABEL_9;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("\\Spam")))
  {
    v10 = &IMAPMailboxSpecialUseAttributeJunk;
    goto LABEL_8;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("\\Starred")))
  {
    v10 = &IMAPMailboxSpecialUseAttributeFlagged;
    goto LABEL_8;
  }
  v11 = CFSTR("\\Drafts");
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("\\Drafts")) & 1) == 0)
  {
    v11 = CFSTR("\\Sent");
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("\\Sent")) & 1) == 0)
    {
      v11 = CFSTR("\\Trash");
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("\\Trash")) & 1) == 0)
      {
        v12 = CFSTR("\\Important");
        if (!objc_msgSend(v9, "isEqualToString:", CFSTR("\\Important")))
          v12 = 0;
        goto LABEL_10;
      }
    }
  }
LABEL_9:
  v12 = v11;
LABEL_10:

  if ((objc_msgSend(v9, "isEqualToString:", v12) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "childWithExtraAttribute:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_14:
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientToken, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_enablingPromise, 0);
}

@end
