@implementation CastleIMAPAccount

+ (void)initialize
{
  objc_opt_class();
}

+ (id)accountTypeIdentifier
{
  return (id)*MEMORY[0x1E0C8F0D8];
}

+ (id)displayedAccountTypeString
{
  return CFSTR("iCloud");
}

+ (BOOL)isPredefinedAccountType
{
  return 1;
}

+ (BOOL)usernameIsEmailAddress
{
  return 1;
}

+ (BOOL)primaryDeliveryAccountIsDynamic
{
  return 1;
}

- (BOOL)shouldDisplayHostnameInErrorMessages
{
  return 0;
}

- (BOOL)shouldFetchRemoteLinksWithDateReceived:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  if (+[MFMailMessageLibrary canUsePersistence](MFMailMessageLibrary, "canUsePersistence")
    && -[IMAPAccount supportsAppleRemoteLinks](self, "supportsAppleRemoteLinks"))
  {
    +[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "persistence");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteContentManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "shouldAddRemoteContentLinksForMessageWithDateReceived:", v4);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CastleIMAPAccount)initWithLibrary:(id)a3 persistentAccount:(id)a4
{
  id v6;
  id v7;
  CastleIMAPAccount *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  MFLock *appleAccountLock;
  id v15;
  void *v16;
  uint64_t v17;
  EDiCloudAliasSupport *aliasSupport;
  MFCastleEmailAliasUpdater *v19;
  void *v20;
  uint64_t v21;
  MFCastleEmailAliasUpdater *aliasUpdater;
  CastleIMAPAccount *v23;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)CastleIMAPAccount;
  v8 = -[IMAPAccount initWithLibrary:persistentAccount:](&v25, sel_initWithLibrary_persistentAccount_, v6, v7);
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@-%p"), v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D460A8]), "initWithName:andDelegate:", v12, 0);
    appleAccountLock = v8->_appleAccountLock;
    v8->_appleAccountLock = (MFLock *)v13;

    v15 = objc_alloc(MEMORY[0x1E0D1EC98]);
    objc_msgSend(v7, "parentAccount");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithAppleAccount:", v16);
    aliasSupport = v8->_aliasSupport;
    v8->_aliasSupport = (EDiCloudAliasSupport *)v17;

    v19 = [MFCastleEmailAliasUpdater alloc];
    -[MFAccount identifier](v8, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[MFCastleEmailAliasUpdater initWithAccountID:aliasSupport:](v19, "initWithAccountID:aliasSupport:", v20, v8->_aliasSupport);
    aliasUpdater = v8->_aliasUpdater;
    v8->_aliasUpdater = (MFCastleEmailAliasUpdater *)v21;

    v23 = v8;
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[CastleIMAPAccount _resetAppleAccount]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)CastleIMAPAccount;
  -[IMAPAccount dealloc](&v3, sel_dealloc);
}

- (uint64_t)_resetAppleAccount
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 408), "lock");
    if (*(_QWORD *)(v1 + 416))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      -[CastleIMAPAccount accountStore](v1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "removeObserver:name:object:", v1, *MEMORY[0x1E0C8F010], v3);

      v4 = *(void **)(v1 + 416);
      *(_QWORD *)(v1 + 416) = 0;

    }
    return objc_msgSend(*(id *)(v1 + 408), "unlock");
  }
  return result;
}

- (BOOL)isEquivalentTo:(id)a3 hostname:(id)a4 username:(id)a5
{
  id v7;
  id v8;
  BOOL v9;

  v7 = a3;
  v8 = a5;
  if (-[MailAccount isAccountClassEquivalentTo:](self, "isAccountClassEquivalentTo:", v7))
    v9 = -[MailAccount isUsernameEquivalentTo:](self, "isUsernameEquivalentTo:", v8);
  else
    v9 = 0;

  return v9;
}

- (id)statisticsKind
{
  return (id)*MEMORY[0x1E0D46C30];
}

- (BOOL)shouldRegisterForPush
{
  objc_super v3;

  if ((*((_BYTE *)self + 432) & 1) == 0)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)CastleIMAPAccount;
  return -[IMAPAccount shouldRegisterForPush](&v3, sel_shouldRegisterForPush);
}

- (BOOL)canAttemptPushRegistration
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CastleIMAPAccount;
  return -[IMAPAccount canAttemptPushRegistration](&v3, sel_canAttemptPushRegistration);
}

- (BOOL)canReceiveNewMailNotifications
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CastleIMAPAccount;
  return -[IMAPAccount canReceiveNewMailNotifications](&v3, sel_canReceiveNewMailNotifications);
}

- (void)startListeningForNotifications
{
  id v3;
  objc_super v4;

  *((_BYTE *)self + 432) &= ~1u;
  v3 = -[IMAPAccount separatorChar](self, "separatorChar");
  *((_BYTE *)self + 432) |= 1u;
  v4.receiver = self;
  v4.super_class = (Class)CastleIMAPAccount;
  -[IMAPAccount startListeningForNotifications](&v4, sel_startListeningForNotifications);
}

- (id)appleAccount
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v11;

  if (a1)
  {
    v2 = *(void **)(a1 + 408);
    if (!v2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel_appleAccount, a1, CFSTR("CastleIMAPAccount.m"), 229, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nil != _appleAccountLock"));

      v2 = *(void **)(a1 + 408);
    }
    objc_msgSend(v2, "lock");
    v3 = *(void **)(a1 + 416);
    if (!v3)
    {
      objc_msgSend((id)a1, "persistentAccount");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "parentAccount");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 416);
      *(_QWORD *)(a1 + 416) = v5;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CastleIMAPAccount accountStore](a1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:selector:name:object:", a1, sel__accountsChanged_, *MEMORY[0x1E0C8F010], v8);

      v3 = *(void **)(a1 + 416);
    }
    v9 = v3;
    objc_msgSend(*(id *)(a1 + 408), "unlock");
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)accountStore
{
  void *v1;
  void *v2;

  if (a1)
  {
    +[MFAccountStore sharedAccountStore](MFAccountStore, "sharedAccountStore");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "persistentStore");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_mailPropertyFromAppleAccountForKey:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (a1)
  {
    -[CastleIMAPAccount appleAccount](a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "propertiesForDataclass:", *MEMORY[0x1E0C8F3D0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)newChildAccountWithParentAccount:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = *MEMORY[0x1E0C8F3D0];
    objc_msgSend(v5, "propertiesForDataclass:", *MEMORY[0x1E0C8F3D0]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isProvisionedForDataclass:", v7) & 1) == 0)
    {
      +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("CastleIMAPErrorDomain"), 2, 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (v8)
        goto LABEL_30;
    }
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v6, "childAccounts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v37;
      v12 = *MEMORY[0x1E0C8F0D8];
LABEL_6:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v37 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v13), "accountType");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v12);

        if (v16)
          break;
        if (v10 == ++v13)
        {
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
          if (v10)
            goto LABEL_6;
          goto LABEL_12;
        }
      }
      +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("CastleIMAPErrorDomain"), 1032, 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (v8)
        goto LABEL_30;
    }
    else
    {
LABEL_12:

    }
    objc_msgSend(v35, "objectForKey:", CFSTR("Username"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v34, "setObject:forKey:", v18, CFSTR("Username"));

    }
    else
    {
      +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("CastleIMAPErrorDomain"), 3, 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (v8)
        goto LABEL_30;
    }
    objc_msgSend(v6, "username");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "emailAddressValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "domain");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "objectForKey:", CFSTR("dotMacMailSupported"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "BOOLValue");

    if (v19)
      v24 = v23;
    else
      v24 = 0;
    if (v24 == 1 && v21 && objc_msgSend(&unk_1E4F68EA8, "containsObject:", v21))
    {
      v25 = v19;
    }
    else
    {
      objc_msgSend(v35, "objectForKey:", CFSTR("EmailAddress"));
      v25 = (id)objc_claimAutoreleasedReturnValue();
      if (!v25)
      {
        +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("CastleIMAPErrorDomain"), 4, 0);
        v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

        if (!v8)
        {
          objc_msgSend(v35, "objectForKey:", CFSTR("FullUserName"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
            goto LABEL_35;
          v28 = objc_alloc_init(MEMORY[0x1E0CB3850]);
          objc_msgSend(v6, "aa_firstName");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setGivenName:", v29);

          objc_msgSend(v6, "aa_lastName");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setFamilyName:", v30);

          objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v28, 3, 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
LABEL_35:
            objc_msgSend(v34, "setObject:forKey:", v27, CFSTR("FullUserName"));

          objc_msgSend((id)objc_opt_class(), "accountWithProperties:", v34);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "defaultPath");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setPath:", v31);

          objc_msgSend(v17, "setUsesSSL:", 1);
          objc_msgSend(v17, "persistentAccount");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setParentAccount:", v6);
          objc_msgSend(v32, "setAuthenticationType:", *MEMORY[0x1E0C8F350]);

          v8 = 0;
          goto LABEL_37;
        }
LABEL_30:
        if (a4)
        {
          v8 = objc_retainAutorelease(v8);
          v17 = 0;
          *a4 = v8;
        }
        else
        {
          v17 = 0;
        }
LABEL_37:

        goto LABEL_38;
      }
    }
    v40 = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setValue:forKey:", v26, CFSTR("EmailAddresses"));

    v8 = 0;
    goto LABEL_29;
  }
  v17 = 0;
LABEL_38:

  return v17;
}

- (void)persistentAccountDidChange:(id)a3 previousAccount:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  v8.receiver = self;
  v8.super_class = (Class)CastleIMAPAccount;
  -[MailAccount persistentAccountDidChange:previousAccount:](&v8, sel_persistentAccountDidChange_previousAccount_, v6, v7);
  -[CastleIMAPAccount _resetAppleAccount]((uint64_t)self);

}

- (id)hostname
{
  return -[CastleIMAPAccount _mailPropertyFromAppleAccountForKey:]((uint64_t)self, CFSTR("imapHostname"));
}

- (unsigned)portNumber
{
  void *v2;
  unsigned int v3;

  -[CastleIMAPAccount _mailPropertyFromAppleAccountForKey:]((uint64_t)self, CFSTR("imapPort"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (BOOL)usesSSL
{
  void *v2;
  char v3;

  -[CastleIMAPAccount _mailPropertyFromAppleAccountForKey:]((uint64_t)self, CFSTR("imapRequiresSSL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)allowsTrustPrompt
{
  return 0;
}

- (void)setUsername:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "accountPropertiesValueForKey:value:", CFSTR("Username"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)CastleIMAPAccount;
  -[MailAccount setUsername:](&v6, sel_setUsername_, v5);

}

- (id)username
{
  void *v3;
  void *v4;
  objc_super v6;

  -[CastleIMAPAccount _mailPropertyFromAppleAccountForKey:]((uint64_t)self, CFSTR("Username"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[CastleIMAPAccount appleAccount]((uint64_t)self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      return 0;
    v6.receiver = self;
    v6.super_class = (Class)CastleIMAPAccount;
    -[MFAccount username](&v6, sel_username);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (NSString)personID
{
  void *v2;
  void *v3;

  -[CastleIMAPAccount appleAccount]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_personID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)makeAppleIDSession
{
  id v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v2 = objc_alloc(MEMORY[0x1E0D00140]);
    objc_msgSend(a1, "sourceApplicationBundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v2, "initWithIdentifier:", v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)appleID2AuthDataWithHeaders:(void *)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v21;
  id v22;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    v6 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(a1, "authToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("token"));
      v5 = v6;
      if (!v5)
      {
LABEL_14:

        goto LABEL_15;
      }
      v22 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 10, &v22);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v22;
      v10 = v9;
      if (v8)
      {

        objc_msgSend(a1, "personID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dataUsingEncoding:", 4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v5 = (id)objc_msgSend(v12, "mutableCopy");
          v21 = 0;
          objc_msgSend(v5, "appendBytes:length:", &v21, 1);
          objc_msgSend(v5, "appendData:", v8);
        }
        else
        {
          v5 = 0;
        }

        goto LABEL_14;
      }
      MFLogGeneral();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CastleIMAPAccount appleID2AuthDataWithHeaders:].cold.1((uint64_t)v10, v13, v14, v15, v16, v17, v18, v19);

    }
    v5 = 0;
    goto LABEL_14;
  }
LABEL_15:

  return v5;
}

- (void)appleID2AuthWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CastleIMAPAccount makeAppleIDSession](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__CastleIMAPAccount_appleID2AuthWithCompletion___block_invoke;
  v7[3] = &unk_1E4E88A80;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "appleIDHeadersWithCompletion:", v7);

}

void __48__CastleIMAPAccount_appleID2AuthWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
  {
    -[CastleIMAPAccount appleID2AuthDataWithHeaders:](*(void **)(a1 + 32), v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (NSString)authToken
{
  return (NSString *)-[CastleIMAPAccount authTokenWithError:](self, 0);
}

- (id)authTokenWithError:(void *)a1
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[CastleIMAPAccount appleAccount]((uint64_t)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v4, "aa_authTokenWithError:", &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;

  if (!v5 && v6)
  {
    MFLogGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ef_publicDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      v18 = 2114;
      v19 = v12;
      _os_log_error_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_ERROR, "%@ (%@) failed to get auth token: %{public}@", buf, 0x20u);

    }
    if (a2)
      *a2 = objc_retainAutorelease(v6);
  }

  return v5;
}

- (id)anisetteDataWithError:(id *)a3
{
  if (self)
    self = (CastleIMAPAccount *)self->_aliasSupport;
  -[CastleIMAPAccount anisetteDataWithError:](self, "anisetteDataWithError:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)clientInfo
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0CFAC38]);
  objc_msgSend(v2, "clientInfoHeader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (unint64_t)credentialAccessibility
{
  void *v2;
  id v3;
  unint64_t v4;
  id v6;

  v6 = 0;
  -[CastleIMAPAccount authTokenWithError:](self, &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  if (objc_msgSend(v2, "length"))
  {
    v4 = 0;
  }
  else if (objc_msgSend(v3, "mf_isInaccessibleAccountCredentialError"))
  {
    v4 = 2;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (id)preferredAuthScheme
{
  return (id)objc_msgSend(MEMORY[0x1E0D1E688], "schemeWithName:", CFSTR("ATOKEN"));
}

- (id)firstEmailAddress
{
  void *v3;
  objc_super v5;

  -[MailAccount defaultEmailAddress](self, "defaultEmailAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CastleIMAPAccount;
    -[MailAccount firstEmailAddress](&v5, sel_firstEmailAddress);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)emailAddressStrings
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)CastleIMAPAccount;
  -[MailAccount emailAddressStrings](&v8, sel_emailAddressStrings);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
    -[CastleIMAPAccount _mailPropertyFromAppleAccountForKey:]((uint64_t)self, CFSTR("EmailAddress"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
    {
      v9[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v6 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v6;
    }

  }
  return v3;
}

- (id)emailAddressesAndAliasesList
{
  void *v2;
  void *v3;

  -[MailAccount emailAddressesAndAliases](self, "emailAddressesAndAliases");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)fromEmailAddresses
{
  return -[CastleIMAPAccount _fromEmailAddressesIncludingDisabled:](self, 0);
}

- (id)_fromEmailAddressesIncludingDisabled:(id)a1
{
  id v2;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v19;
  void *v20;
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

  v2 = a1;
  v31 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "emailAddressesDictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "receiveEmailAliasAddresses");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v4 = v20;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v26;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v26 != v6)
            objc_enumerationMutation(v4);
          v8 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v7);
          if ((a2 & 1) != 0
            || (objc_msgSend(v4, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v7)),
                v9 = (void *)objc_claimAutoreleasedReturnValue(),
                v10 = objc_msgSend(v9, "BOOLValue"),
                v9,
                v10))
          {
            objc_msgSend(v2, "addObject:", v8);
          }
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v5);
    }

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = v19;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v22;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v11);
          v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14);
          if ((a2 & 1) != 0
            || (objc_msgSend(v11, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14)),
                v16 = (void *)objc_claimAutoreleasedReturnValue(),
                v17 = objc_msgSend(v16, "BOOLValue"),
                v16,
                v17))
          {
            objc_msgSend(v2, "addObject:", v15);
          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v12);
    }

  }
  return v2;
}

- (id)fromEmailAddressesIncludingDisabled
{
  return -[CastleIMAPAccount _fromEmailAddressesIncludingDisabled:](self, 1);
}

- (void)handleAlertResponse:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (objc_msgSend(CFSTR("Mailbox is over quota"), "isEqualToString:", v4))
  {
    -[CastleIMAPAccount handleOverQuotaResponse:](self, "handleOverQuotaResponse:", v4);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CastleIMAPAccount;
    -[IMAPAccount handleAlertResponse:](&v5, sel_handleAlertResponse_, v4);
  }

}

- (void)handleOverQuotaResponse:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;

  v3 = a3;
  MFLogGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[CastleIMAPAccount handleOverQuotaResponse:].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = objc_alloc(MEMORY[0x1E0CFACF8]);
  v12 = (void *)objc_msgSend(v11, "initForDataclass:", *MEMORY[0x1E0C8F3D0]);
  objc_msgSend(v12, "showWithHandler:", 0);

}

- (id)deliveryHostname
{
  if (a1)
  {
    -[CastleIMAPAccount _mailPropertyFromAppleAccountForKey:]((uint64_t)a1, CFSTR("smtpHostname"));
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)deliveryPortNumber
{
  void *v1;
  uint64_t v2;

  if (!a1)
    return 0;
  -[CastleIMAPAccount _mailPropertyFromAppleAccountForKey:](a1, CFSTR("smtpPort"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntValue");

  return v2;
}

- (uint64_t)deliveryUsesSSL
{
  void *v1;
  uint64_t v2;

  if (!a1)
    return 0;
  -[CastleIMAPAccount _mailPropertyFromAppleAccountForKey:](a1, CFSTR("smtpRequiresSSL"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (BOOL)derivesDeliveryAccountInfoFromMailAccount
{
  return 1;
}

- (id)_deliveryAccountCreateIfNeeded:(BOOL)a3
{
  DeliveryAccount *deliveryAccount;
  BOOL v5;
  MFNewcastleSMTPAccount *v6;
  void *v7;
  void *v8;
  void *v9;
  DeliveryAccount *v10;

  deliveryAccount = self->_deliveryAccount;
  if (deliveryAccount)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    v6 = objc_alloc_init(MFNewcastleSMTPAccount);
    -[CastleIMAPAccount displayName](self, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAccount setDisplayName:](v6, "setDisplayName:", v7);

    -[CastleIMAPAccount deliveryHostname](self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAccount setHostname:](v6, "setHostname:", v8);

    -[MFAccount setPortNumber:](v6, "setPortNumber:", -[CastleIMAPAccount deliveryPortNumber]((uint64_t)self));
    -[MFAccount setUsesSSL:](v6, "setUsesSSL:", -[CastleIMAPAccount deliveryUsesSSL]((uint64_t)self));
    objc_msgSend(MEMORY[0x1E0D1E688], "schemeWithName:", CFSTR("ATOKEN"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMTPAccount setPreferredAuthScheme:](v6, "setPreferredAuthScheme:", v9);

    -[MFNewcastleSMTPAccount setCastleAccount:](v6, "setCastleAccount:", self);
    v10 = self->_deliveryAccount;
    self->_deliveryAccount = &v6->super.super;

    deliveryAccount = self->_deliveryAccount;
  }
  return deliveryAccount;
}

- (id)checkAndSetLocalDefaultEmailAddress:(id)a1
{
  id v3;
  objc_super v5;

  v3 = a2;
  if (a1)
  {
    v5.receiver = a1;
    v5.super_class = (Class)CastleIMAPAccount;
    a1 = objc_msgSendSuper2(&v5, sel_checkAndSetDefaultEmailAddress_, v3);
  }

  return a1;
}

- (BOOL)checkAndSetDefaultEmailAddress:(id)a3
{
  id v4;
  unsigned __int8 v5;
  NSString *v6;
  NSString *updatedDefaultEmail;

  v4 = a3;
  v5 = -[CastleIMAPAccount checkAndSetLocalDefaultEmailAddress:](self, v4);
  v6 = (NSString *)objc_msgSend(v4, "copy");
  updatedDefaultEmail = self->_updatedDefaultEmail;
  self->_updatedDefaultEmail = v6;

  return v5;
}

- (void)setLocallyEnabled:(void *)a3 forEmailAddress:
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (a1)
  {
    objc_msgSend(a1, "emailAddressesDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(a1, "receiveEmailAliasAddresses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForKey:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v6, "setValue:forKey:", v9, v11);
      objc_msgSend(a1, "setEmailAddresses:", v6);
    }
    else
    {
      objc_msgSend(v8, "setValue:forKey:", v9, v11);
      objc_msgSend(a1, "setReceiveEmailAliasAddresses:", v8);
    }

  }
}

- (void)setEnabled:(BOOL)a3 forEmailAddress:(id)a4
{
  _BOOL8 v4;
  NSMutableDictionary *aliasChanges;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = a4;
  -[CastleIMAPAccount setLocallyEnabled:forEmailAddress:](self, v4, v10);
  aliasChanges = self->_aliasChanges;
  if (!aliasChanges)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = self->_aliasChanges;
    self->_aliasChanges = v7;

    aliasChanges = self->_aliasChanges;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](aliasChanges, "setValue:forKey:", v9, v10);

}

- (void)invalidateEmailAliases
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D1EC98], "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[MFAccount identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_1A4F90000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Clearing last update date for email aliases.", (uint8_t *)&v5, 0xCu);

  }
  -[MailAccount setLastEmailAliasesSyncDate:](self, "setLastEmailAliasesSyncDate:", 0);
}

- (void)updateEmailAliasesIfNeeded
{
  if (-[CastleIMAPAccount _emailAliasesAreStale](self))
    -[CastleIMAPAccount _updateEmailAddressAndAliases]((id *)&self->super.super.super.super.isa);
}

- (uint64_t)_emailAliasesAreStale
{
  uint64_t v1;
  void *v2;
  void *v3;
  int v4;
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v1 = (uint64_t)a1;
  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "lastEmailAliasesSyncDate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      +[MFAppStateMonitor sharedInstance](MFAppStateMonitor, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "isVisible");

      objc_msgSend(v2, "timeIntervalSinceNow");
      v6 = v5;
      v7 = 3600.0;
      if (v4)
        v7 = 600.0;
      if (v7 >= -v6)
      {
        objc_msgSend(MEMORY[0x1E0D1EC98], "log");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          objc_msgSend((id)v1, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 138543618;
          v15 = v12;
          v16 = 2048;
          v17 = v6 / -60.0;
          _os_log_impl(&dword_1A4F90000, v11, OS_LOG_TYPE_INFO, "[%{public}@] Last update was %g minutes ago. Not requesting update.", (uint8_t *)&v14, 0x16u);

        }
        v1 = 0;
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0D1EC98], "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend((id)v1, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v9;
        v16 = 2048;
        v17 = v6 / -60.0;
        _os_log_impl(&dword_1A4F90000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Last update was %g minutes ago. Requesting update.", (uint8_t *)&v14, 0x16u);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D1EC98], "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend((id)v1, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543362;
        v15 = v10;
        _os_log_impl(&dword_1A4F90000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] No last update date for email aliases. Requesting update.", (uint8_t *)&v14, 0xCu);

      }
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v1, "setLastEmailAliasesSyncDate:", v11);
    v1 = 1;
LABEL_14:

  }
  return v1;
}

- (void)_updateEmailAddressAndAliases
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  if (a1)
  {
    v2 = a1[60];
    objc_msgSend(a1, "lastEmailAliasesSyncDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "lastEmailAliasesSyncEntityTag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __50__CastleIMAPAccount__updateEmailAddressAndAliases__block_invoke;
    v5[3] = &unk_1E4E88AA8;
    v5[4] = a1;
    objc_msgSend(v2, "getEmailAddressAndAliasesWithLastSyncDate:entityTag:handler:", v3, v4, v5);

  }
}

void __50__CastleIMAPAccount__updateEmailAddressAndAliases__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  -[CastleIMAPAccount _updateEmailAddressAndAliasesWithResult:](*(void **)(a1 + 32), v3);
  if (objc_msgSend(v3, "isSuccess"))
  {
    objc_msgSend(MEMORY[0x1E0D1EC98], "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v5;
      _os_log_impl(&dword_1A4F90000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completed update.", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLastEmailAliasesSyncDate:", v6);

    if ((objc_msgSend(v3, "notModified") & 1) == 0)
    {
      objc_msgSend(v3, "entityTag");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setLastEmailAliasesSyncEntityTag:", v7);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1EC98], "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1A4F90000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Update failed.", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "setLastEmailAliasesSyncDate:", 0);
  }

}

- (void)_updateEmailAddressAndAliasesWithResult:(void *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_33;
  if (objc_msgSend(v3, "isSuccess") && (objc_msgSend(v4, "notModified") & 1) == 0)
  {
    objc_msgSend(v4, "receiveEmailAliasAddresses");
    v5 = objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "receiveEmailAliasAddresses");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v5) = objc_msgSend(a1, "checkAndSetReceiveEmailAliasAddresses:", v6);

    }
    objc_msgSend(v4, "emailAddresses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v8 = v5;
    else
      v8 = 1;
    if (v7)
      LODWORD(v5) = 1;
    if ((v8 & 1) == 0)
    {
      objc_msgSend(v4, "emailAddresses");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v5) = objc_msgSend(a1, "checkAndSetEmailAddresses:", v9);

    }
    objc_msgSend(v4, "defaultEmailAddress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if ((v5 & 1) == 0)
      {
        objc_msgSend(v4, "defaultEmailAddress");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(a1, "checkAndSetDefaultEmailAddress:", v11);

        if ((v12 & 1) == 0)
          goto LABEL_28;
      }
    }
    else
    {
      objc_msgSend(a1, "defaultEmailAddress");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        objc_msgSend(a1, "fromEmailAddresses");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");

        if (v15)
        {
          objc_msgSend(a1, "fromEmailAddresses");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectAtIndex:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(a1, "emailAddressStrings");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          -[CastleIMAPAccount setLocallyEnabled:forEmailAddress:](a1, 1, v13);
        }
        if ((_DWORD)v5)
        {

          goto LABEL_25;
        }
        LODWORD(v5) = -[CastleIMAPAccount checkAndSetLocalDefaultEmailAddress:](a1, v13);
      }

      if (!(_DWORD)v5)
      {
LABEL_28:
        objc_msgSend(MEMORY[0x1E0D1EC98], "log");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(a1, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138543362;
          v26 = v21;
          _os_log_impl(&dword_1A4F90000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Account is not changed. Not saving.", (uint8_t *)&v25, 0xCu);

        }
        goto LABEL_31;
      }
    }
LABEL_25:
    objc_msgSend(MEMORY[0x1E0D1EC98], "log");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v19;
      _os_log_impl(&dword_1A4F90000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Saving account changes.", (uint8_t *)&v25, 0xCu);

    }
    objc_msgSend(a1, "savePersistentAccount");
  }
LABEL_31:
  if (objc_msgSend(v4, "accountNeedsToUpdateProperties"))
  {
    -[CastleIMAPAccount appleAccount]((uint64_t)a1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "accountStore");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CastleIMAPAccount appleAccount]((uint64_t)a1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "aa_updatePropertiesForAppleAccount:completion:", v24, &__block_literal_global_0);

  }
LABEL_33:

}

- (void)pushUpdateForAliasData
{
  NSObject *v3;
  int v4;
  NSString *updatedDefaultEmail;
  EDiCloudAliasSupport *aliasSupport;
  NSMutableDictionary **p_aliasChanges;
  NSMutableDictionary *aliasChanges;
  NSString **p_updatedDefaultEmail;
  NSMutableDictionary *v10;
  NSString *v11;
  _DWORD v12[2];
  __int16 v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D1EC98], "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[NSMutableDictionary count](self->_aliasChanges, "count");
    updatedDefaultEmail = self->_updatedDefaultEmail;
    v12[0] = 67109376;
    v12[1] = v4;
    v13 = 2048;
    v14 = updatedDefaultEmail;
    _os_log_impl(&dword_1A4F90000, v3, OS_LOG_TYPE_DEFAULT, "-[CastleIMAPAccount pushUpdateForAliasData] %d %p", (uint8_t *)v12, 0x12u);
  }

  if (self->_aliasChanges || self->_updatedDefaultEmail)
  {
    aliasSupport = self->_aliasSupport;
    p_aliasChanges = &self->_aliasChanges;
    aliasChanges = self->_aliasChanges;
    p_updatedDefaultEmail = &self->_updatedDefaultEmail;
    -[EDiCloudAliasSupport pushUpdateForAliasDataWithEmailAddresses:defaultEmailAddress:](aliasSupport, "pushUpdateForAliasDataWithEmailAddresses:defaultEmailAddress:", aliasChanges, *p_updatedDefaultEmail);
    v10 = *p_aliasChanges;
    *p_aliasChanges = 0;

    v11 = *p_updatedDefaultEmail;
    *p_updatedDefaultEmail = 0;

  }
}

- (BOOL)isEnabledForDataclass:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CastleIMAPAccount appleAccount]((uint64_t)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEnabledForDataclass:", v4);

  return v6;
}

- (id)iconString
{
  return CFSTR("castleAccountIcon");
}

- (BOOL)supportsArchiving
{
  return 1;
}

- (id)displayName
{
  void *v2;
  void *v3;

  -[CastleIMAPAccount appleAccount]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)shouldFetchACEDBInfoForError:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aliasUpdater, 0);
  objc_storeStrong((id *)&self->_aliasSupport, 0);
  objc_storeStrong((id *)&self->_aliasLookupURL, 0);
  objc_storeStrong((id *)&self->_aliasUpdateQueue, 0);
  objc_storeStrong((id *)&self->_updatedDefaultEmail, 0);
  objc_storeStrong((id *)&self->_aliasChanges, 0);
  objc_storeStrong((id *)&self->_deliveryAccount, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
  objc_storeStrong((id *)&self->_appleAccountLock, 0);
}

- (void)appleID2AuthDataWithHeaders:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A4F90000, a2, a3, "CastleIMAPAccount: Failed to serialize AppleID data: %@", a5, a6, a7, a8, 2u);
}

- (void)handleOverQuotaResponse:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A4F90000, a2, a3, "Over quota error message: %@", a5, a6, a7, a8, 2u);
}

@end
