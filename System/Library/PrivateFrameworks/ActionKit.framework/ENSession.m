@implementation ENSession

- (void)authenticateWithAuthorizationBlock:(id)a3 preferRegistration:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  void (**v8)(id, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  ENOAuthAuthenticator *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v6 = a4;
  v21 = a3;
  v8 = (void (**)(id, _QWORD))a5;
  if (v8)
  {
    if (-[ENSession isAuthenticated](self, "isAuthenticated"))
    {
      v8[2](v8, 0);
    }
    else
    {
      -[ENSession authenticator](self, "authenticator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        +[ENSession sharedSession](ENSession, "sharedSession");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "logger");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot restart authentication while it is still in progress."));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "evernoteLogInfoString:", v12);

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ENErrorDomain"), 0, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, void *))v8)[2](v8, v13);

      }
      else
      {
        -[ENSession setUser:](self, "setUser:", 0);
        -[ENSession setAuthorizationBlock:](self, "setAuthorizationBlock:", v21);
        -[ENSession setAuthenticationCompletion:](self, "setAuthenticationCompletion:", v8);
        +[ENSession developerToken](ENSession, "developerToken");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          -[ENSession setIsAuthenticated:](self, "setIsAuthenticated:", 1);
          +[ENSession developerToken](ENSession, "developerToken");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[ENSession setPrimaryAuthenticationToken:](self, "setPrimaryAuthenticationToken:", v15);

          -[ENSession performPostAuthentication](self, "performPostAuthentication");
        }
        else
        {
          v16 = objc_alloc_init(ENOAuthAuthenticator);
          -[ENOAuthAuthenticator setDelegate:](v16, "setDelegate:", self);
          +[ENSession consumerKey](ENSession, "consumerKey");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[ENOAuthAuthenticator setConsumerKey:](v16, "setConsumerKey:", v17);

          +[ENSession consumerSecret](ENSession, "consumerSecret");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[ENOAuthAuthenticator setConsumerSecret:](v16, "setConsumerSecret:", v18);

          -[ENSession sessionHost](self, "sessionHost");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[ENOAuthAuthenticator setHost:](v16, "setHost:", v19);

          -[ENOAuthAuthenticator setSupportsLinkedAppNotebook:](v16, "setSupportsLinkedAppNotebook:", -[ENSession supportsLinkedAppNotebook](self, "supportsLinkedAppNotebook"));
          -[ENOAuthAuthenticator setPreferRegistration:](v16, "setPreferRegistration:", v6);
          +[ENSession sessionHostOverride](ENSession, "sessionHostOverride");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[ENOAuthAuthenticator setUseWebAuthenticationOnly:](v16, "setUseWebAuthenticationOnly:", v20 != 0);

          -[ENOAuthAuthenticator authenticate](v16, "authenticate");
          -[ENSession setAuthenticator:](self, "setAuthenticator:", v16);

        }
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("handler required"));
  }

}

- (ENSession)init
{
  ENSession *v2;
  ENSession *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ENSession;
  v2 = -[ENSession init](&v5, sel_init);
  if (v2)
  {
    if (!objc_msgSend((id)objc_opt_class(), "checkSharedSessionSettings"))
    {
      v3 = 0;
      goto LABEL_6;
    }
    -[ENSession setSupportsLinkedAppNotebook:](v2, "setSupportsLinkedAppNotebook:", 1);
    -[ENSession startup](v2, "startup");
  }
  v3 = v2;
LABEL_6:

  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ENSession;
  -[ENSession dealloc](&v4, sel_dealloc);
}

- (void)startup
{
  ENSessionDefaultLogger *v3;
  void *v4;
  void *v5;
  dispatch_queue_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = objc_alloc_init(ENSessionDefaultLogger);
  -[ENSession setLogger:](self, "setLogger:", v3);

  if (SecurityApplicationGroupIdentifier)
    +[ENPreferencesStore preferenceStoreWithSecurityApplicationGroupIdentifier:](ENPreferencesStore, "preferenceStoreWithSecurityApplicationGroupIdentifier:");
  else
    +[ENPreferencesStore defaultPreferenceStore](ENPreferencesStore, "defaultPreferenceStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENSession setPreferences:](self, "setPreferences:", v4);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_storeClientFailedAuthentication_, ENStoreClientDidFailWithAuthenticationErrorNotification, 0);

  v6 = dispatch_queue_create("evernote-sdk-ios-thumbnail", MEMORY[0x24BDAC9C0]);
  -[ENSession setThumbnailQueue:](self, "setThumbnailQueue:", v6);

  -[ENSession selectInitialSessionHost](self, "selectInitialSessionHost");
  if (DeveloperToken)
  {
    -[ENSession setIsAuthenticated:](self, "setIsAuthenticated:", 1);
    -[ENSession setPrimaryAuthenticationToken:](self, "setPrimaryAuthenticationToken:", DeveloperToken);
    -[ENSession performPostAuthentication](self, "performPostAuthentication");
  }
  else
  {
    -[ENSession sessionHost](self, "sessionHost");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENSession credentialsForHost:](self, "credentialsForHost:", v7);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (v14 && (objc_msgSend(v14, "areValid") & 1) != 0)
    {
      -[ENSession setIsAuthenticated:](self, "setIsAuthenticated:", 1);
      objc_msgSend(v14, "authenticationToken");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ENSession setPrimaryAuthenticationToken:](self, "setPrimaryAuthenticationToken:", v8);

      -[ENSession preferences](self, "preferences");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "decodedObjectForKey:", CFSTR("User"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ENSession setUser:](self, "setUser:", v10);

      -[ENSession preferences](self, "preferences");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "decodedObjectForKey:", CFSTR("BusinessUser"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ENSession setBusinessUser:](self, "setBusinessUser:", v12);

      -[ENSession performPostAuthentication](self, "performPostAuthentication");
    }
    else
    {
      -[ENSession setIsAuthenticated:](self, "setIsAuthenticated:", 0);
      -[ENSession preferences](self, "preferences");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeAllItems");

    }
  }
}

- (void)selectInitialSessionHost
{
  const __CFString *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  id v12;

  if (objc_msgSend((id)SessionHostOverride, "length"))
  {
    v3 = (const __CFString *)SessionHostOverride;
LABEL_3:
    -[ENSession setSessionHost:](self, "setSessionHost:", v3);
    return;
  }
  if (NoteStoreUrl)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "host");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENSession setSessionHost:](self, "setSessionHost:", v4);

  }
  else
  {
    -[ENSession currentProfileName](self, "currentProfileName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Evernote"));

    if (v6)
    {
      v3 = CFSTR("www.evernote.com");
      goto LABEL_3;
    }
    -[ENSession currentProfileName](self, "currentProfileName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Evernote-China"));

    if (v8)
    {
      v3 = CFSTR("app.yinxiang.com");
      goto LABEL_3;
    }
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lowercaseString");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v12, "hasPrefix:", CFSTR("zh-hans")) & 1) != 0)
    {
      v11 = CFSTR("app.yinxiang.com");
    }
    else
    {
      v11 = CFSTR("app.yinxiang.com");
      if ((objc_msgSend(v12, "isEqualToString:", CFSTR("zh-cn")) & 1) == 0
        && !objc_msgSend(v12, "isEqualToString:", CFSTR("zh")))
      {
        v11 = CFSTR("www.evernote.com");
      }
    }
    -[ENSession setSessionHost:](self, "setSessionHost:", v11);
  }

}

- (void)performPostAuthentication
{
  void *v3;
  BOOL v4;
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  -[ENSession notifyAuthenticationChanged](self, "notifyAuthenticationChanged");
  -[ENSession authenticationCompletion](self, "authenticationCompletion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  -[ENSession userStore](self, "userStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__ENSession_performPostAuthentication__block_invoke;
  v6[3] = &unk_24F8B6038;
  v6[4] = self;
  v7 = v4;
  objc_msgSend(v5, "fetchUserWithCompletion:", v6);

}

- (void)refreshUploadUsage
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  -[ENSession primaryNoteStore](self, "primaryNoteStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __31__ENSession_refreshUploadUsage__block_invoke;
  v7[3] = &unk_24F8B6060;
  v7[4] = self;
  objc_msgSend(v3, "fetchSyncStateWithCompletion:", v7);

  if (-[ENSession isBusinessUser](self, "isBusinessUser"))
  {
    -[ENSession businessNoteStore](self, "businessNoteStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __31__ENSession_refreshUploadUsage__block_invoke_2;
    v6[3] = &unk_24F8B6060;
    v6[4] = self;
    objc_msgSend(v5, "fetchSyncStateWithCompletion:", v6);

  }
}

- (void)completeAuthenticationWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  if (v6)
    -[ENSession unauthenticate](self, "unauthenticate");
  -[ENSession authenticationCompletion](self, "authenticationCompletion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ENSession authenticationCompletion](self, "authenticationCompletion");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

    -[ENSession setAuthenticationCompletion:](self, "setAuthenticationCompletion:", 0);
  }
  -[ENSession setAuthenticator:](self, "setAuthenticator:", 0);

}

- (BOOL)isAuthenticationInProgress
{
  void *v2;
  BOOL v3;

  -[ENSession authenticator](self, "authenticator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isPremiumUser
{
  void *v2;
  void *v3;
  BOOL v4;

  -[ENSession user](self, "user");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privilege");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (int)objc_msgSend(v3, "intValue") > 2;

  return v4;
}

- (BOOL)isBusinessUser
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[ENSession user](self, "user");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accounting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "businessId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (NSString)userDisplayName
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  NSString *v9;

  -[ENSession user](self, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[ENSession user](self, "user");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "username");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  if (v6)
    v8 = v6;
  else
    v8 = &stru_24F8BBA48;
  v9 = v8;

  return v9;
}

- (NSString)businessDisplayName
{
  void *v3;
  void *v4;
  void *v5;

  if (-[ENSession isBusinessUser](self, "isBusinessUser"))
  {
    -[ENSession user](self, "user");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accounting");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "businessName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)sourceApplication
{
  NSString *sourceApplication;
  NSString *v3;
  void *v4;

  sourceApplication = self->_sourceApplication;
  if (sourceApplication)
  {
    v3 = sourceApplication;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (int)userID
{
  void *v2;
  void *v3;
  int v4;

  -[ENSession user](self, "user");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "id");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)appNotebookIsLinked
{
  void *v2;
  void *v3;
  char v4;

  -[ENSession preferences](self, "preferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("AppNotebookIsLinked"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)unauthenticate
{
  -[ENSession unauthenticateAndRevokeAccessToken:](self, "unauthenticateAndRevokeAccessToken:", 1);
}

- (void)unauthenticateWithoutRevokingAccessToken
{
  -[ENSession unauthenticateAndRevokeAccessToken:](self, "unauthenticateAndRevokeAccessToken:", 0);
}

- (void)unauthenticateAndRevokeAccessToken:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ENAuthCache *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v3 = a3;
  +[ENSession sharedSession](ENSession, "sharedSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ENSession is unauthenticating."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "evernoteLogInfoString:", v7);

  if (-[ENSession isAuthenticated](self, "isAuthenticated") && v3)
  {
    -[ENSession userStore](self, "userStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENSession setUserStorePendingRevocation:](self, "setUserStorePendingRevocation:", v8);

    -[ENSession userStorePendingRevocation](self, "userStorePendingRevocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENSession primaryAuthenticationToken](self, "primaryAuthenticationToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __48__ENSession_unauthenticateAndRevokeAccessToken___block_invoke;
    v14[3] = &unk_24F8BB370;
    v14[4] = self;
    objc_msgSend(v9, "revokeLongSessionWithAuthenticationToken:completion:", v10, v14);

  }
  -[ENSession setIsAuthenticated:](self, "setIsAuthenticated:", 0);
  -[ENSession setUser:](self, "setUser:", 0);
  -[ENSession setPrimaryAuthenticationToken:](self, "setPrimaryAuthenticationToken:", 0);
  -[ENSession setUserStore:](self, "setUserStore:", 0);
  -[ENSession setPrimaryNoteStore:](self, "setPrimaryNoteStore:", 0);
  -[ENSession setBusinessNoteStore:](self, "setBusinessNoteStore:", 0);
  v11 = objc_alloc_init(ENAuthCache);
  -[ENSession setAuthCache:](self, "setAuthCache:", v11);

  -[ENSession setNotebooksCache:](self, "setNotebooksCache:", 0);
  -[ENSession setNotebooksCacheDate:](self, "setNotebooksCacheDate:", 0);
  -[ENSession credentialStore](self, "credentialStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "clearAllCredentials");
  -[ENSession saveCredentialStore:](self, "saveCredentialStore:", v12);
  -[ENSession preferences](self, "preferences");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllItems");

  -[ENSession selectInitialSessionHost](self, "selectInitialSessionHost");
  -[ENSession notifyAuthenticationChanged](self, "notifyAuthenticationChanged");

}

- (BOOL)handleOpenURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[ENSession authenticator](self, "authenticator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ENSession authenticator](self, "authenticator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "handleOpenURL:", v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)listNotebooksWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void (*v9)(void);
  ENSessionListNotebooksContext *v10;
  id v11;
  _QWORD *v12;

  v12 = a3;
  if (v12)
  {
    if (-[ENSession isAuthenticated](self, "isAuthenticated"))
    {
      -[ENSession notebooksCache](self, "notebooksCache");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "count"))
      {
        -[ENSession notebooksCacheDate](self, "notebooksCacheDate");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "timeIntervalSinceNow");
        v7 = v6;

        if (v7 > -300.0)
        {
          -[ENSession notebooksCache](self, "notebooksCache");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = (void (*)(void))v12[2];
LABEL_8:
          v9();

          goto LABEL_11;
        }
      }
      else
      {

      }
      -[ENSession listNotebooks_cleanCache](self, "listNotebooks_cleanCache");
      v10 = objc_alloc_init(ENSessionListNotebooksContext);
      -[ENSessionListNotebooksContext setCompletion:](v10, "setCompletion:", v12);
      v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      -[ENSessionListNotebooksContext setResultNotebooks:](v10, "setResultNotebooks:", v11);

      -[ENSession listNotebooks_listNotebooksWithContext:](self, "listNotebooks_listNotebooksWithContext:", v10);
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ENErrorDomain"), 2, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void (*)(void))v12[2];
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("handler required"));
LABEL_11:

}

- (void)listWritableNotebooksWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__ENSession_listWritableNotebooksWithCompletion___block_invoke;
  v6[3] = &unk_24F8B9110;
  v7 = v4;
  v5 = v4;
  -[ENSession listNotebooksWithCompletion:](self, "listNotebooksWithCompletion:", v6);

}

- (void)listNotebooks_listNotebooksWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ENSession primaryNoteStore](self, "primaryNoteStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__ENSession_listNotebooks_listNotebooksWithContext___block_invoke;
  v7[3] = &unk_24F8BA068;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "listNotebooksWithCompletion:", v7);

}

- (void)listNotebooks_listSharedNotebooksWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ENSession primaryNoteStore](self, "primaryNoteStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__ENSession_listNotebooks_listSharedNotebooksWithContext___block_invoke;
  v7[3] = &unk_24F8BA068;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "listSharedNotebooksWithCompletion:", v7);

}

- (void)listNotebooks_listLinkedNotebooksWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ENSession primaryNoteStore](self, "primaryNoteStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__ENSession_listNotebooks_listLinkedNotebooksWithContext___block_invoke;
  v7[3] = &unk_24F8BA068;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "listLinkedNotebooksWithCompletion:", v7);

}

- (void)listNotebooks_fetchSharedBusinessNotebooksWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ENSession businessNoteStore](self, "businessNoteStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__ENSession_listNotebooks_fetchSharedBusinessNotebooksWithContext___block_invoke;
  v7[3] = &unk_24F8BA068;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "listSharedNotebooksWithCompletion:", v7);

}

- (void)listNotebooks_fetchBusinessNotebooksWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ENSession businessNoteStore](self, "businessNoteStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__ENSession_listNotebooks_fetchBusinessNotebooksWithContext___block_invoke;
  v7[3] = &unk_24F8BA068;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "listNotebooksWithCompletion:", v7);

}

- (void)listNotebooks_processBusinessNotebooksWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  ENNotebook *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v3, "linkedPersonalNotebooks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
        objc_msgSend(v3, "sharedBusinessNotebooks");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sharedNotebookGlobalId");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v3, "businessNotebooks");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "notebookGuid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = -[ENNotebook initWithSharedNotebook:forLinkedNotebook:withBusinessNotebook:]([ENNotebook alloc], "initWithSharedNotebook:forLinkedNotebook:withBusinessNotebook:", v13, v10, v16);
          objc_msgSend(v3, "resultNotebooks");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v17);

          objc_msgSend(v3, "linkedPersonalNotebooks");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "removeObjectIdenticalTo:", v10);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "linkedPersonalNotebooks");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21)
    -[ENSession listNotebooks_fetchSharedNotebooksWithContext:](self, "listNotebooks_fetchSharedNotebooksWithContext:", v3);
  else
    -[ENSession listNotebooks_prepareResultsWithContext:](self, "listNotebooks_prepareResultsWithContext:", v3);

}

- (void)listNotebooks_fetchSharedNotebooksWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  _QWORD v18[5];
  id v19;
  ENSession *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  ENSession *v24;
  id v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "linkedPersonalNotebooks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPendingSharedNotebooks:", objc_msgSend(v5, "count"));

  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v4, "setSharedNotebooks:", v6);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v4, "linkedPersonalNotebooks");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        -[ENSession noteStoreForLinkedNotebook:](self, "noteStoreForLinkedNotebook:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sharedNotebookGlobalId");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v18[0] = MEMORY[0x24BDAC760];
          v18[1] = 3221225472;
          v18[2] = __59__ENSession_listNotebooks_fetchSharedNotebooksWithContext___block_invoke_3;
          v18[3] = &unk_24F8B60D8;
          v18[4] = v11;
          v19 = v4;
          v20 = self;
          v21 = v6;
          objc_msgSend(v12, "fetchSharedNotebookByAuthWithCompletion:", v18);

          v14 = v19;
        }
        else
        {
          -[ENSession userStore](self, "userStore");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "username");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v22[0] = MEMORY[0x24BDAC760];
          v22[1] = 3221225472;
          v22[2] = __59__ENSession_listNotebooks_fetchSharedNotebooksWithContext___block_invoke;
          v22[3] = &unk_24F8B60B0;
          v23 = v4;
          v24 = self;
          v25 = v12;
          v26 = v11;
          v27 = v6;
          objc_msgSend(v15, "fetchPublicUserInfoWithUsername:completion:", v16, v22);

          v14 = v23;
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v8);
  }

}

- (void)listNotebooks_completePendingSharedNotebookWithContext:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  v4 = objc_msgSend(v5, "pendingSharedNotebooks") - 1;
  objc_msgSend(v5, "setPendingSharedNotebooks:", v4);
  if (!v4)
    -[ENSession listNotebooks_processSharedNotebooksWithContext:](self, "listNotebooks_processSharedNotebooksWithContext:", v5);

}

- (void)listNotebooks_processSharedNotebooksWithContext:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ENNotebook *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  ENSession *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v16 = self;
  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v3, "linkedPersonalNotebooks");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v3, "sharedNotebooks", v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "guid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v9) = objc_msgSend(v11, "isMemberOfClass:", objc_opt_class());
        v12 = [ENNotebook alloc];
        if ((_DWORD)v9)
          v13 = -[ENNotebook initWithSharedNotebook:forLinkedNotebook:](v12, "initWithSharedNotebook:forLinkedNotebook:", v11, v8);
        else
          v13 = -[ENNotebook initWithPublicNotebook:forLinkedNotebook:](v12, "initWithPublicNotebook:forLinkedNotebook:", v11, v8);
        v14 = (void *)v13;
        objc_msgSend(v3, "resultNotebooks");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v14);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

  -[ENSession listNotebooks_prepareResultsWithContext:](v16, "listNotebooks_prepareResultsWithContext:", v3);
}

- (void)listNotebooks_prepareResultsWithContext:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "resultNotebooks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 == 1)
  {
    objc_msgSend(v9, "resultNotebooks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v7, "isDefaultNotebook") & 1) == 0)
      objc_msgSend(v7, "setIsDefaultNotebookOverride:", 1);

  }
  objc_msgSend(v9, "resultNotebooks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortUsingComparator:", &__block_literal_global_104);

  -[ENSession listNotebooks_completeWithContext:error:](self, "listNotebooks_completeWithContext:error:", v9, 0);
}

- (void)listNotebooks_completeWithContext:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(id, void *, id);

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "resultNotebooks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENSession setNotebooksCache:](self, "setNotebooksCache:", v8);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENSession setNotebooksCacheDate:](self, "setNotebooksCacheDate:", v9);

  objc_msgSend(v7, "completion");
  v11 = (void (**)(id, void *, id))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resultNotebooks");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11[2](v11, v10, v6);
}

- (void)listNotebooks_cleanCache
{
  -[ENSession setNotebooksCache:](self, "setNotebooksCache:", 0);
  -[ENSession setNotebooksCacheDate:](self, "setNotebooksCacheDate:", 0);
}

- (void)uploadNote:(id)a3 notebook:(id)a4 completion:(id)a5
{
  -[ENSession uploadNote:policy:toNotebook:orReplaceNote:progress:completion:](self, "uploadNote:policy:toNotebook:orReplaceNote:progress:completion:", a3, 0, a4, 0, 0, a5);
}

- (void)uploadNote:(id)a3 policy:(int64_t)a4 toNotebook:(id)a5 orReplaceNote:(id)a6 progress:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  void (**v17)(id, _QWORD, void *);
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  ENSessionUploadNoteContext *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;

  v40 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void (**)(id, _QWORD, void *))a8;
  if (!v17)
  {
    v21 = (void *)MEMORY[0x24BDBCE88];
    v22 = *MEMORY[0x24BDBCAB8];
    v23 = CFSTR("handler required");
LABEL_7:
    objc_msgSend(v21, "raise:format:", v22, v23);
    goto LABEL_21;
  }
  if (!v40)
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "logger");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("must specify note"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "evernoteLogErrorString:", v26);

    v27 = (void *)MEMORY[0x24BDD1540];
    v28 = 3;
LABEL_20:
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("ENErrorDomain"), v28, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2](v17, 0, v39);

    goto LABEL_21;
  }
  if ((unint64_t)(a4 - 3) >= 0xFFFFFFFFFFFFFFFELL && !v15)
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "logger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("must specify existing ID when requesting a replacement policy"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "evernoteLogErrorString:", v20);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ENErrorDomain"), 3, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v17[2](v17, 0, v15);
    goto LABEL_21;
  }
  if (!a4 && v15)
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "logger");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Can't use create policy when specifying an existing note ref. Ignoring."));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "evernoteLogErrorString:", v31);

    v15 = 0;
  }
  if (v14 && (objc_msgSend(v14, "allowsWriting") & 1) == 0)
  {
    v21 = (void *)MEMORY[0x24BDBCE88];
    v22 = *MEMORY[0x24BDBCAB8];
    v23 = CFSTR("a specified notebook must not be readonly");
    goto LABEL_7;
  }
  if (!-[ENSession isAuthenticated](self, "isAuthenticated"))
  {
    v27 = (void *)MEMORY[0x24BDD1540];
    v28 = 2;
    goto LABEL_20;
  }
  if ((objc_msgSend(v40, "validateForLimits") & 1) == 0)
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "logger");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Note failed limits validation. Cannot upload. %@"), self);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "evernoteLogErrorString:", v34);

    +[ENError noteSizeLimitReachedError](ENError, "noteSizeLimitReachedError");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2](v17, 0, v35);

  }
  v36 = objc_alloc_init(ENSessionUploadNoteContext);
  if (v15)
  {
    objc_msgSend(v15, "guid");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "EDAMNoteToReplaceServiceNoteGUID:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENSessionUploadNoteContext setNote:](v36, "setNote:", v38);

  }
  else
  {
    objc_msgSend(v40, "EDAMNote");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENSessionUploadNoteContext setNote:](v36, "setNote:", v37);
  }

  -[ENSessionUploadNoteContext setRefToReplace:](v36, "setRefToReplace:", v15);
  -[ENSessionUploadNoteContext setNotebook:](v36, "setNotebook:", v14);
  -[ENSessionUploadNoteContext setPolicy:](v36, "setPolicy:", a4);
  -[ENSessionUploadNoteContext setCompletion:](v36, "setCompletion:", v17);
  -[ENSessionUploadNoteContext setProgress:](v36, "setProgress:", v16);
  -[ENSession uploadNote_determineDestinationWithContext:](self, "uploadNote_determineDestinationWithContext:", v36);

LABEL_21:
}

- (void)uploadNote_determineDestinationWithContext:(id)a3
{
  ENNoteRef *v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;

  v41 = a3;
  v4 = objc_alloc_init(ENNoteRef);
  objc_msgSend(v41, "setNoteRef:", v4);

  if (-[ENSession appNotebookIsLinked](self, "appNotebookIsLinked"))
  {
    -[ENSession preferences](self, "preferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodedObjectForKey:", CFSTR("LinkedAppNotebook"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[ENSession uploadNote_findLinkedAppNotebookWithContext:](self, "uploadNote_findLinkedAppNotebookWithContext:", v41);
      goto LABEL_18;
    }
    -[ENSession noteStoreForLinkedNotebook:](self, "noteStoreForLinkedNotebook:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setNoteStore:", v7);

    objc_msgSend(v41, "noteRef");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setType:", 2);

    +[ENLinkedNotebookRef linkedNotebookRefFromLinkedNotebook:](ENLinkedNotebookRef, "linkedNotebookRefFromLinkedNotebook:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "noteRef");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLinkedNotebook:", v9);

    -[ENSession preferences](self, "preferences");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "decodedObjectForKey:", CFSTR("SharedAppNotebook"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "notebookGuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "note");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNotebookGuid:", v13);

  }
  objc_msgSend(v41, "noteStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(v41, "refToReplace");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v41, "refToReplace");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ENSession noteStoreForNoteRef:](self, "noteStoreForNoteRef:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setNoteStore:", v18);

      objc_msgSend(v41, "refToReplace");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "type");
      objc_msgSend(v41, "noteRef");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setType:", v20);

      objc_msgSend(v41, "refToReplace");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "linkedNotebook");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "noteRef");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setLinkedNotebook:", v23);

LABEL_14:
      goto LABEL_15;
    }
    objc_msgSend(v41, "notebook");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isBusinessNotebook");

    if (v26)
    {
      -[ENSession businessNoteStore](self, "businessNoteStore");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setNoteStore:", v27);

      objc_msgSend(v41, "noteRef");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v28;
      v29 = 1;
    }
    else
    {
      objc_msgSend(v41, "notebook");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isLinked");

      if (v31)
      {
        objc_msgSend(v41, "notebook");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "linkedNotebook");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[ENSession noteStoreForLinkedNotebook:](self, "noteStoreForLinkedNotebook:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setNoteStore:", v34);

        objc_msgSend(v41, "noteRef");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setType:", 2);

        objc_msgSend(v41, "notebook");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "linkedNotebook");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        +[ENLinkedNotebookRef linkedNotebookRefFromLinkedNotebook:](ENLinkedNotebookRef, "linkedNotebookRefFromLinkedNotebook:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "noteRef");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setLinkedNotebook:", v37);

        goto LABEL_14;
      }
      -[ENSession primaryNoteStore](self, "primaryNoteStore");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setNoteStore:", v39);

      objc_msgSend(v41, "noteRef");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v28;
      v29 = 0;
    }
    objc_msgSend(v28, "setType:", v29);
    goto LABEL_14;
  }
LABEL_15:
  objc_msgSend(v41, "refToReplace");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
    -[ENSession uploadNote_updateWithContext:](self, "uploadNote_updateWithContext:", v41);
  else
    -[ENSession uploadNote_createWithContext:](self, "uploadNote_createWithContext:", v41);
LABEL_18:

}

- (void)uploadNote_updateWithContext:(id)a3
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
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  ENSession *v20;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(v6, "edamTimestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "note");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUpdated:", v7);

  objc_msgSend(v4, "refToReplace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "guid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "note");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setGuid:", v10);

  objc_msgSend(v4, "progress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v4, "progress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "noteStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setUploadProgressHandler:", v13);

  }
  objc_msgSend(v4, "noteStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "note");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __42__ENSession_uploadNote_updateWithContext___block_invoke;
  v18[3] = &unk_24F8B6140;
  v19 = v4;
  v20 = self;
  v17 = v4;
  objc_msgSend(v15, "updateNote:completion:", v16, v18);

}

- (void)uploadNote_findLinkedAppNotebookWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ENSession primaryNoteStore](self, "primaryNoteStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__ENSession_uploadNote_findLinkedAppNotebookWithContext___block_invoke;
  v7[3] = &unk_24F8BA068;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "listLinkedNotebooksWithCompletion:", v7);

}

- (void)uploadNote_findSharedAppNotebookWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[ENSession preferences](self, "preferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodedObjectForKey:", CFSTR("LinkedAppNotebook"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ENSession noteStoreForLinkedNotebook:](self, "noteStoreForLinkedNotebook:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__ENSession_uploadNote_findSharedAppNotebookWithContext___block_invoke;
  v9[3] = &unk_24F8B6168;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "fetchSharedNotebookByAuthWithCompletion:", v9);

}

- (void)uploadNote_createWithContext:(id)a3
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
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  ENSession *v20;

  v4 = a3;
  objc_msgSend(v4, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUpdated:", 0);
  objc_msgSend(v4, "note");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCreated:", 0);

  objc_msgSend(v4, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notebookGuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v4, "notebook");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "guid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "note");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNotebookGuid:", v10);

  }
  objc_msgSend(v4, "progress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v4, "progress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "noteStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setUploadProgressHandler:", v13);

  }
  objc_msgSend(v4, "noteStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "note");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __42__ENSession_uploadNote_createWithContext___block_invoke;
  v18[3] = &unk_24F8B6140;
  v19 = v4;
  v20 = self;
  v17 = v4;
  objc_msgSend(v15, "createNote:completion:", v16, v18);

}

- (void)uploadNote_completeWithContext:(id)a3 error:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  id v11;

  v11 = a3;
  v5 = a4;
  objc_msgSend(v11, "noteStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUploadProgressHandler:", 0);

  objc_msgSend(v11, "completion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v11, "completion");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
    if (v5)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v5);
    }
    else
    {
      objc_msgSend(v11, "noteRef");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v9)[2](v9, v10, 0);

    }
  }

}

- (void)shareNote:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (-[ENSession isAuthenticated](self, "isAuthenticated"))
  {
    -[ENSession noteStoreForNoteRef:](self, "noteStoreForNoteRef:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "guid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __34__ENSession_shareNote_completion___block_invoke;
    v11[3] = &unk_24F8B6190;
    v13 = v7;
    v11[4] = self;
    v12 = v6;
    objc_msgSend(v8, "shareNoteWithGuid:completion:", v9, v11);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ENErrorDomain"), 2, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v10);

  }
}

- (void)deleteNote:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  if (-[ENSession isAuthenticated](self, "isAuthenticated"))
  {
    -[ENSession noteStoreForNoteRef:](self, "noteStoreForNoteRef:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "guid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __35__ENSession_deleteNote_completion___block_invoke;
    v10[3] = &unk_24F8B61B8;
    v11 = v7;
    objc_msgSend(v8, "deleteNoteWithGuid:completion:", v9, v10);

LABEL_5:
    goto LABEL_6;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ENErrorDomain"), 2, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v8);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)findNotesWithSearch:(id)a3 inNotebook:(id)a4 orScope:(unint64_t)a5 sortOrder:(unint64_t)a6 maxResults:(unint64_t)a7 completion:(id)a8
{
  id v14;
  void (**v15)(id, _QWORD, void *);
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
  EDAMNotesMetadataResultSpec *v26;
  uint64_t v27;
  EDAMNoteFilter *v28;
  void *v29;
  void *v30;
  char v31;
  uint64_t v32;
  void *v33;
  void *v34;
  ENSessionFindNotesContext *v35;
  id v36;
  void *v37;
  unsigned int v38;
  id v39;

  v39 = a3;
  v14 = a4;
  v15 = (void (**)(id, _QWORD, void *))a8;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("handler required"));
    goto LABEL_37;
  }
  if (!-[ENSession isAuthenticated](self, "isAuthenticated"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ENErrorDomain"), 2, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, 0, v19);

    goto LABEL_37;
  }
  if ((a5 & 8) != 0)
    a5 = 7;
  if (v14 && a5)
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "logger");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No search scope necessary if notebook provided."));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "evernoteLogInfoString:", v18);

    a5 = 0;
LABEL_16:
    v38 = 0;
    goto LABEL_20;
  }
  if (v14 || a5)
  {
    if (!a5)
      goto LABEL_16;
  }
  else
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "logger");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Search scope or notebook must be specified. Defaulting to personal scope."));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "evernoteLogInfoString:", v22);

    a5 = 1;
  }
  if ((~(_BYTE)a5 & 5) != 0 && (a5 & 2) == 0)
    goto LABEL_16;
  if ((a6 & 8) != 0)
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "logger");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot sort by relevance across multiple search scopes. Using update date."));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "evernoteLogErrorString:", v25);

    a6 = a6 & 0xFFFFFFFFFFFFFFF3 | 4;
  }
  v38 = 1;
LABEL_20:
  v26 = objc_alloc_init(EDAMNotesMetadataResultSpec);
  v27 = MEMORY[0x24BDBD1C8];
  -[EDAMNotesMetadataResultSpec setIncludeNotebookGuid:](v26, "setIncludeNotebookGuid:", MEMORY[0x24BDBD1C8]);
  -[EDAMNotesMetadataResultSpec setIncludeTitle:](v26, "setIncludeTitle:", v27);
  -[EDAMNotesMetadataResultSpec setIncludeCreated:](v26, "setIncludeCreated:", v27);
  -[EDAMNotesMetadataResultSpec setIncludeUpdated:](v26, "setIncludeUpdated:", v27);
  -[EDAMNotesMetadataResultSpec setIncludeUpdateSequenceNum:](v26, "setIncludeUpdateSequenceNum:", v27);
  -[EDAMNotesMetadataResultSpec setIncludeLargestResourceSize:](v26, "setIncludeLargestResourceSize:", v27);
  v28 = objc_alloc_init(EDAMNoteFilter);
  objc_msgSend(v39, "searchString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDAMNoteFilter setWords:](v28, "setWords:", v29);

  if ((a6 & 1) != 0)
  {
    v30 = &unk_24F93B0A8;
    goto LABEL_28;
  }
  if ((a6 & 2) != 0)
  {
    v30 = &unk_24F93B0C0;
    goto LABEL_28;
  }
  if ((a6 & 4) != 0)
  {
    v30 = &unk_24F93B0D8;
    goto LABEL_28;
  }
  if ((a6 & 8) != 0)
  {
    v30 = &unk_24F93B0F0;
LABEL_28:
    -[EDAMNoteFilter setOrder:](v28, "setOrder:", v30);
  }
  v31 = (a6 & 1) == 0;
  if ((a6 & 0x10000) == 0)
    v31 = a6;
  v32 = v31 & 1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDAMNoteFilter setAscending:](v28, "setAscending:", v33);

  if (v14)
  {
    objc_msgSend(v14, "guid");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDAMNoteFilter setNotebookGuid:](v28, "setNotebookGuid:", v34);

  }
  v35 = objc_alloc_init(ENSessionFindNotesContext);
  -[ENSessionFindNotesContext setCompletion:](v35, "setCompletion:", v15);
  -[ENSessionFindNotesContext setScopeNotebook:](v35, "setScopeNotebook:", v14);
  -[ENSessionFindNotesContext setScope:](v35, "setScope:", a5);
  -[ENSessionFindNotesContext setSortOrder:](v35, "setSortOrder:", a6);
  -[ENSessionFindNotesContext setNoteFilter:](v35, "setNoteFilter:", v28);
  -[ENSessionFindNotesContext setResultSpec:](v35, "setResultSpec:", v26);
  -[ENSessionFindNotesContext setMaxResults:](v35, "setMaxResults:", a7);
  v36 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[ENSessionFindNotesContext setFindMetadataResults:](v35, "setFindMetadataResults:", v36);

  -[ENSessionFindNotesContext setRequiresLocalMerge:](v35, "setRequiresLocalMerge:", v38);
  -[ENSessionFindNotesContext setSortAscending:](v35, "setSortAscending:", v32);
  -[ENSessionFindNotesContext scopeNotebook](v35, "scopeNotebook");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
    -[ENSession findNotes_findInPersonalScopeWithContext:](self, "findNotes_findInPersonalScopeWithContext:", v35);
  else
    -[ENSession findNotes_listNotebooksWithContext:](self, "findNotes_listNotebooksWithContext:", v35);

LABEL_37:
}

- (void)findNotes_listNotebooksWithContext:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  ENSession *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__ENSession_findNotes_listNotebooksWithContext___block_invoke;
  v6[3] = &unk_24F8BA068;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[ENSession listNotebooksWithCompletion:](self, "listNotebooksWithCompletion:", v6);

}

- (void)findNotes_findInPersonalScopeWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;
  ENSession *v17;

  v4 = a3;
  objc_msgSend(v4, "scopeNotebook");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "scopeNotebook");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isLinked");

    if ((v7 & 1) == 0)
    {
LABEL_7:
      -[ENSession primaryNoteStore](self, "primaryNoteStore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "noteFilter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v4, "maxResults");
      objc_msgSend(v4, "resultSpec");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = MEMORY[0x24BDAC760];
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __54__ENSession_findNotes_findInPersonalScopeWithContext___block_invoke;
      v15[3] = &unk_24F8BA8A0;
      v16 = v4;
      v17 = self;
      v13[0] = v12;
      v13[1] = 3221225472;
      v13[2] = __54__ENSession_findNotes_findInPersonalScopeWithContext___block_invoke_2;
      v13[3] = &unk_24F8BB540;
      v13[4] = self;
      v14 = v16;
      objc_msgSend(v8, "findNotesMetadataWithFilter:maxResults:resultSpec:success:failure:", v9, v10, v11, v15, v13);

      goto LABEL_8;
    }
  }
  else if ((objc_msgSend(v4, "scope") & 1) != 0 && !-[ENSession appNotebookIsLinked](self, "appNotebookIsLinked"))
  {
    goto LABEL_7;
  }
  -[ENSession findNotes_findInBusinessScopeWithContext:](self, "findNotes_findInBusinessScopeWithContext:", v4);
LABEL_8:

}

- (void)findNotes_findInBusinessScopeWithContext:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;
  ENSession *v18;

  v5 = a3;
  if (-[ENSession isBusinessUser](self, "isBusinessUser"))
  {
    objc_msgSend(v5, "scopeNotebook");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6
      || (objc_msgSend(v5, "scopeNotebook"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          (objc_msgSend(v3, "isBusinessNotebook") & 1) != 0))
    {
      objc_msgSend(v5, "scopeNotebook");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {

        if (v6)
        {

        }
      }
      else
      {
        v8 = objc_msgSend(v5, "scope");
        if (v6)
        {

        }
        if ((v8 & 4) == 0)
          goto LABEL_11;
      }
      -[ENSession businessNoteStore](self, "businessNoteStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "noteFilter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v5, "maxResults");
      objc_msgSend(v5, "resultSpec");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x24BDAC760];
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __54__ENSession_findNotes_findInBusinessScopeWithContext___block_invoke;
      v16[3] = &unk_24F8BA8A0;
      v17 = v5;
      v18 = self;
      v14[0] = v13;
      v14[1] = 3221225472;
      v14[2] = __54__ENSession_findNotes_findInBusinessScopeWithContext___block_invoke_2;
      v14[3] = &unk_24F8BB540;
      v14[4] = self;
      v15 = v17;
      objc_msgSend(v9, "findNotesMetadataWithFilter:maxResults:resultSpec:success:failure:", v10, v11, v12, v16, v14);

      goto LABEL_13;
    }

  }
LABEL_11:
  -[ENSession findNotes_findInLinkedScopeWithContext:](self, "findNotes_findInLinkedScopeWithContext:", v5);
LABEL_13:

}

- (void)findNotes_findInLinkedScopeWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "scopeNotebook");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if ((objc_msgSend(v4, "scope") & 2) != 0)
      goto LABEL_6;
LABEL_9:
    -[ENSession findNotes_processResultsWithContext:](self, "findNotes_processResultsWithContext:", v4);
    goto LABEL_21;
  }
  objc_msgSend(v4, "scopeNotebook");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isLinked") & 1) == 0)
  {

    goto LABEL_9;
  }
  objc_msgSend(v4, "scopeNotebook");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isBusinessNotebook");

  if (v8)
    goto LABEL_9;
LABEL_6:
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v4, "setLinkedNotebooksToSearch:", v9);

  objc_msgSend(v4, "scopeNotebook");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v4, "linkedNotebooksToSearch");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scopeNotebook");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v4, "allNotebooks", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v17, "isLinked") && (objc_msgSend(v17, "isBusinessNotebook") & 1) == 0)
          {
            objc_msgSend(v4, "linkedNotebooksToSearch");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v17);

          }
        }
        v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v14);
    }
  }

  -[ENSession findNotes_nextFindInLinkedScopeWithContext:](self, "findNotes_nextFindInLinkedScopeWithContext:", v4);
LABEL_21:

}

- (void)findNotes_nextFindInLinkedScopeWithContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  id v20;
  ENSession *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  ENSession *v25;

  v4 = a3;
  objc_msgSend(v4, "linkedNotebooksToSearch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(v4, "linkedNotebooksToSearch");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "linkedNotebooksToSearch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectAtIndex:", 0);

    objc_msgSend(v8, "linkedNotebook");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENSession noteStoreForLinkedNotebook:](self, "noteStoreForLinkedNotebook:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "noteFilter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");

    if (objc_msgSend(v8, "isJoinedPublic"))
    {
      objc_msgSend(v8, "guid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setNotebookGuid:", v14);

    }
    v15 = objc_msgSend(v4, "maxResults");
    objc_msgSend(v4, "resultSpec");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __56__ENSession_findNotes_nextFindInLinkedScopeWithContext___block_invoke;
    v23[3] = &unk_24F8BA8A0;
    v24 = v4;
    v25 = self;
    v19[0] = v17;
    v19[1] = 3221225472;
    v19[2] = __56__ENSession_findNotes_nextFindInLinkedScopeWithContext___block_invoke_2;
    v19[3] = &unk_24F8B61E0;
    v20 = v8;
    v21 = self;
    v22 = v24;
    v18 = v8;
    objc_msgSend(v11, "findNotesMetadataWithFilter:maxResults:resultSpec:success:failure:", v13, v15, v16, v23, v19);

  }
  else
  {
    -[ENSession findNotes_processResultsWithContext:](self, "findNotes_processResultsWithContext:", v4);
  }

}

- (void)findNotes_processResultsWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  ENNoteRef *v17;
  void *v18;
  void *v19;
  void *v20;
  ENNoteRef *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  ENSessionFindNotesResult *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  uint64_t v40;
  id obj;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "requiresLocalMerge"))
  {
    objc_msgSend(v3, "findMetadataResults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = MEMORY[0x24BDAC760];
    v54[1] = 3221225472;
    v54[2] = __49__ENSession_findNotes_processResultsWithContext___block_invoke;
    v54[3] = &unk_24F8B6208;
    v55 = v3;
    objc_msgSend(v4, "sortUsingComparator:", v54);

  }
  objc_msgSend(v3, "scopeNotebook");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(v3, "allNotebooks");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v51 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          objc_msgSend(v12, "guid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v13);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
      }
      while (v9);
    }

  }
  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend(v3, "findMetadataResults");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  if (v45)
  {
    v43 = v14;
    v44 = *(_QWORD *)v47;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v47 != v44)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v15);
        v17 = objc_alloc_init(ENNoteRef);
        objc_msgSend(v16, "guid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[ENNoteRef setGuid:](v17, "setGuid:", v18);

        objc_msgSend(v3, "scopeNotebook");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19
          || (objc_msgSend(v16, "notebookGuid"),
              v20 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v6, "objectForKeyedSubscript:", v20),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              v20,
              v19))
        {
          if (objc_msgSend(v19, "isBusinessNotebook"))
          {
            v21 = v17;
            v22 = 1;
            goto LABEL_24;
          }
          if (objc_msgSend(v19, "isLinked"))
          {
            v21 = v17;
            v22 = 2;
LABEL_24:
            -[ENNoteRef setType:](v21, "setType:", v22);
            objc_msgSend(v19, "linkedNotebook");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            +[ENLinkedNotebookRef linkedNotebookRefFromLinkedNotebook:](ENLinkedNotebookRef, "linkedNotebookRefFromLinkedNotebook:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[ENNoteRef setLinkedNotebook:](v17, "setLinkedNotebook:", v24);

          }
          else
          {
            -[ENNoteRef setType:](v17, "setType:", 0);
          }
          v25 = objc_alloc_init(ENSessionFindNotesResult);
          -[ENSessionFindNotesResult setNoteRef:](v25, "setNoteRef:", v17);
          -[ENSessionFindNotesResult setNotebook:](v25, "setNotebook:", v19);
          objc_msgSend(v16, "title");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[ENSessionFindNotesResult setTitle:](v25, "setTitle:", v26);

          v27 = (void *)MEMORY[0x24BDBCE60];
          objc_msgSend(v16, "created");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "dateWithEDAMTimestamp:", objc_msgSend(v28, "longLongValue"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[ENSessionFindNotesResult setCreated:](v25, "setCreated:", v29);

          v30 = (void *)MEMORY[0x24BDBCE60];
          objc_msgSend(v16, "updated");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "dateWithEDAMTimestamp:", objc_msgSend(v31, "longLongValue"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[ENSessionFindNotesResult setUpdated:](v25, "setUpdated:", v32);

          objc_msgSend(v16, "updateSequenceNum");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[ENSessionFindNotesResult setUpdateSequenceNum:](v25, "setUpdateSequenceNum:", objc_msgSend(v33, "intValue"));

          objc_msgSend(v16, "largestResourceSize");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[ENSessionFindNotesResult setHasResources:](v25, "setHasResources:", (int)objc_msgSend(v34, "intValue") > 0);

          v14 = v43;
          objc_msgSend(v43, "addObject:", v25);
          if (objc_msgSend(v3, "maxResults"))
          {
            v35 = objc_msgSend(v43, "count");
            if (v35 >= objc_msgSend(v3, "maxResults"))
            {

              goto LABEL_36;
            }
          }
          goto LABEL_28;
        }
        objc_msgSend(v3, "resultGuidsFromBusiness");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "guid");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v36, "containsObject:", v37);

        if ((v38 & 1) == 0)
        {
          +[ENSession sharedSession](ENSession, "sharedSession");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "logger");
          v25 = (ENSessionFindNotesResult *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Found note metadata but can't determine owning notebook by guid. Metadata = %@"), v16);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[ENSessionFindNotesResult evernoteLogErrorString:](v25, "evernoteLogErrorString:", v39);

LABEL_28:
        }

        ++v15;
      }
      while (v45 != v15);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
      v45 = v40;
    }
    while (v40);
  }
LABEL_36:

  objc_msgSend(v3, "setResults:", v14);
  -[ENSession findNotes_completeWithContext:error:](self, "findNotes_completeWithContext:error:", v3, 0);

}

- (void)findNotes_completeWithContext:(id)a3 error:(id)a4
{
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  id v8;

  v8 = a4;
  v5 = a3;
  objc_msgSend(v5, "completion");
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v8)
  {

    ((void (**)(_QWORD, _QWORD, id))v6)[2](v6, 0, v8);
  }
  else
  {
    objc_msgSend(v5, "results");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, void *, _QWORD))v6)[2](v6, v7, 0);
  }

}

- (void)downloadNote:(id)a3 progress:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (v8)
    {
      if (-[ENSession isAuthenticated](self, "isAuthenticated"))
      {
        -[ENSession noteStoreForNoteRef:](self, "noteStoreForNoteRef:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v9)
          objc_msgSend(v11, "setDownloadProgressHandler:", v9);
        objc_msgSend(v8, "guid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __46__ENSession_downloadNote_progress_completion___block_invoke;
        v20[3] = &unk_24F8B6230;
        v21 = v12;
        v22 = v10;
        v14 = v12;
        objc_msgSend(v14, "fetchNoteWithGuid:includingContent:resourceOptions:completion:", v13, 1, 1, v20);

        goto LABEL_11;
      }
      v18 = (void *)MEMORY[0x24BDD1540];
      v19 = 2;
    }
    else
    {
      +[ENSession sharedSession](ENSession, "sharedSession");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logger");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("noteRef parameter is required to get download note"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "evernoteLogErrorString:", v17);

      v18 = (void *)MEMORY[0x24BDD1540];
      v19 = 3;
    }
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("ENErrorDomain"), v19, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v14);
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("handler required"));
LABEL_12:

}

- (void)downloadThumbnailForNote:(id)a3 maxDimension:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  unint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  void (**v20)(id, _QWORD, void *);
  unint64_t v21;

  v8 = a3;
  v9 = (void (**)(id, _QWORD, void *))a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("handler required"));
    goto LABEL_12;
  }
  if (!v8)
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("noteRef parameter is required to get download thumbnail"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "evernoteLogErrorString:", v14);

    v15 = (void *)MEMORY[0x24BDD1540];
    v16 = 3;
LABEL_11:
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("ENErrorDomain"), v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v17);

    goto LABEL_12;
  }
  if (!-[ENSession isAuthenticated](self, "isAuthenticated"))
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v16 = 2;
    goto LABEL_11;
  }
  if (a4 <= 0x12B)
    v10 = a4;
  else
    v10 = 0;
  -[ENSession thumbnailQueue](self, "thumbnailQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __62__ENSession_downloadThumbnailForNote_maxDimension_completion___block_invoke;
  v18[3] = &unk_24F8B6258;
  v18[4] = self;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  dispatch_async(v11, v18);

LABEL_12:
}

- (BOOL)isErrorDueToRestrictedAuth:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  BOOL v9;

  v3 = a3;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EDAMErrorCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  objc_msgSend(v3, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("parameter"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v6 == 3 && (objc_msgSend(v8, "isEqualToString:", CFSTR("authenticationToken")) & 1) != 0;
  return v9;
}

- (id)credentialStore
{
  void *v3;
  ENCredentialStore *v4;
  uint64_t v5;
  void *v6;

  -[ENSession preferences](self, "preferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodedObjectForKey:", CFSTR("CredentialStore"));
  v4 = (ENCredentialStore *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[ENCredentialStore loadCredentialsFromAppDefaults](ENCredentialStore, "loadCredentialsFromAppDefaults");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = (ENCredentialStore *)v5;
      -[ENSession preferences](self, "preferences");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("CredentialStore"));

    }
    else
    {
      v4 = objc_alloc_init(ENCredentialStore);
    }
  }
  return v4;
}

- (id)credentialsForHost:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ENSession credentialStore](self, "credentialStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "credentialsForHost:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)addCredentials:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ENSession credentialStore](self, "credentialStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addCredentials:", v4);

  -[ENSession saveCredentialStore:](self, "saveCredentialStore:", v5);
}

- (void)saveCredentialStore:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ENSession preferences](self, "preferences");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("CredentialStore"));

}

- (id)primaryCredentials
{
  void *v3;
  void *v4;

  -[ENSession sessionHost](self, "sessionHost");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENSession credentialsForHost:](self, "credentialsForHost:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)validBusinessAuthenticationResult
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENSession.m"), 1656, CFSTR("Cannot authenticate to business on main thread"));

  }
  -[ENSession authCache](self, "authCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "authenticationResultForBusiness");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[ENSession userStore](self, "userStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "authenticateToBusiness");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[ENSession authCache](self, "authCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAuthenticationResultForBusiness:", v5);

    objc_msgSend(v5, "user");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENSession setBusinessUser:](self, "setBusinessUser:", v8);

    -[ENSession preferences](self, "preferences");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENSession businessUser](self, "businessUser");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encodeObject:forKey:", v10, CFSTR("BusinessUser"));

  }
  return v5;
}

- (ENAuthCache)authCache
{
  ENAuthCache *authCache;
  ENAuthCache *v4;
  ENAuthCache *v5;

  authCache = self->_authCache;
  if (!authCache)
  {
    v4 = objc_alloc_init(ENAuthCache);
    v5 = self->_authCache;
    self->_authCache = v4;

    authCache = self->_authCache;
  }
  return authCache;
}

- (void)notifyAuthenticationChanged
{
  _BOOL4 v3;
  void *v4;
  const __CFString *v5;
  id v6;

  v3 = -[ENSession isAuthenticated](self, "isAuthenticated");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v3)
    v5 = CFSTR("ENSessionDidAuthenticateNotification");
  else
    v5 = CFSTR("ENSessionDidUnauthenticateNotification");
  objc_msgSend(v4, "postNotificationName:object:", v5, self);

}

- (ENUserStoreClient)userStore
{
  void *v3;
  void *v4;
  void *v5;
  ENUserStoreClient *v6;
  ENUserStoreClient *userStore;

  if (!self->_userStore)
  {
    -[ENSession primaryAuthenticationToken](self, "primaryAuthenticationToken");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[ENSession userStoreUrl](self, "userStoreUrl");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[ENSession primaryAuthenticationToken](self, "primaryAuthenticationToken");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[ENUserStoreClient userStoreClientWithUrl:authenticationToken:](ENUserStoreClient, "userStoreClientWithUrl:authenticationToken:", v4, v5);
      v6 = (ENUserStoreClient *)objc_claimAutoreleasedReturnValue();
      userStore = self->_userStore;
      self->_userStore = v6;

    }
  }
  return self->_userStore;
}

- (ENNoteStoreClient)primaryNoteStore
{
  ENNoteStoreClient *primaryNoteStore;
  ENNoteStoreClient *v4;
  ENNoteStoreClient *v5;
  ENNoteStoreClient *v6;
  void *v7;
  void *v8;
  ENNoteStoreClient *v9;
  ENNoteStoreClient *v10;

  primaryNoteStore = self->_primaryNoteStore;
  if (!primaryNoteStore)
  {
    if (DeveloperToken)
    {
      +[ENNoteStoreClient noteStoreClientWithUrl:authenticationToken:](ENNoteStoreClient, "noteStoreClientWithUrl:authenticationToken:", NoteStoreUrl);
      v4 = (ENNoteStoreClient *)objc_claimAutoreleasedReturnValue();
      v5 = self->_primaryNoteStore;
      self->_primaryNoteStore = v4;
    }
    else
    {
      -[ENSession primaryCredentials](self, "primaryCredentials");
      v6 = (ENNoteStoreClient *)objc_claimAutoreleasedReturnValue();
      v5 = v6;
      if (v6)
      {
        -[ENNoteStoreClient noteStoreUrl](v6, "noteStoreUrl");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[ENNoteStoreClient authenticationToken](v5, "authenticationToken");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[ENNoteStoreClient noteStoreClientWithUrl:authenticationToken:](ENNoteStoreClient, "noteStoreClientWithUrl:authenticationToken:", v7, v8);
        v9 = (ENNoteStoreClient *)objc_claimAutoreleasedReturnValue();
        v10 = self->_primaryNoteStore;
        self->_primaryNoteStore = v9;

      }
    }

    primaryNoteStore = self->_primaryNoteStore;
  }
  return primaryNoteStore;
}

- (ENBusinessNoteStoreClient)businessNoteStore
{
  ENBusinessNoteStoreClient *v3;
  ENBusinessNoteStoreClient *businessNoteStore;

  if (!self->_businessNoteStore && -[ENSession isBusinessUser](self, "isBusinessUser"))
  {
    +[ENBusinessNoteStoreClient noteStoreClientForBusiness](ENBusinessNoteStoreClient, "noteStoreClientForBusiness");
    v3 = (ENBusinessNoteStoreClient *)objc_claimAutoreleasedReturnValue();
    -[ENBusinessNoteStoreClient setDelegate:](v3, "setDelegate:", self);
    businessNoteStore = self->_businessNoteStore;
    self->_businessNoteStore = v3;

  }
  return self->_businessNoteStore;
}

- (id)noteStoreForLinkedNotebook:(id)a3
{
  void *v4;
  void *v5;

  +[ENLinkedNotebookRef linkedNotebookRefFromLinkedNotebook:](ENLinkedNotebookRef, "linkedNotebookRefFromLinkedNotebook:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENLinkedNoteStoreClient noteStoreClientForLinkedNotebookRef:](ENLinkedNoteStoreClient, "noteStoreClientForLinkedNotebookRef:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  return v5;
}

- (id)noteStoreForNoteRef:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v8;

  v4 = a3;
  if (!objc_msgSend(v4, "type"))
  {
    -[ENSession primaryNoteStore](self, "primaryNoteStore");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "type") == 1)
  {
    -[ENSession businessNoteStore](self, "businessNoteStore");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_6;
  }
  if (objc_msgSend(v4, "type") == 2)
  {
    objc_msgSend(v4, "linkedNotebook");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[ENLinkedNoteStoreClient noteStoreClientForLinkedNotebookRef:](ENLinkedNoteStoreClient, "noteStoreClientForLinkedNotebookRef:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setDelegate:", self);
  }
  else
  {
    v6 = 0;
  }
LABEL_6:

  return v6;
}

- (id)noteStoreForNotebook:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "isBusinessNotebook"))
  {
    -[ENSession businessNoteStore](self, "businessNoteStore");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v7 = (void *)v5;
    goto LABEL_7;
  }
  if (!objc_msgSend(v4, "isLinked"))
  {
    -[ENSession primaryNoteStore](self, "primaryNoteStore");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(v4, "linkedNotebook");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENSession noteStoreForLinkedNotebook:](self, "noteStoreForLinkedNotebook:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v7;
}

- (id)shardIdForNoteRef:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "type"))
  {
    if (objc_msgSend(v4, "type") == 1)
    {
      -[ENSession businessUser](self, "businessUser");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v4, "type") != 2)
      {
        v7 = 0;
        goto LABEL_8;
      }
      objc_msgSend(v4, "linkedNotebook");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[ENSession user](self, "user");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  objc_msgSend(v5, "shardId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v7;
}

- (id)authenticationTokenForNoteRef:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = a3;
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENSession.m"), 1769, CFSTR("Cannot get auth token on main thread"));

  }
  if (objc_msgSend(v5, "type"))
  {
    if (objc_msgSend(v5, "type") == 1)
    {
      -[ENSession validBusinessAuthenticationResult](self, "validBusinessAuthenticationResult");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "authenticationToken");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v5, "type") != 2)
      {
        v8 = 0;
        goto LABEL_11;
      }
      objc_msgSend(v5, "linkedNotebook");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ENSession authenticationTokenForLinkedNotebookRef:](self, "authenticationTokenForLinkedNotebookRef:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v7;

  }
  else
  {
    -[ENSession primaryAuthenticationToken](self, "primaryAuthenticationToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_11:

  return v8;
}

- (id)currentProfileName
{
  void *v2;
  void *v3;

  -[ENSession preferences](self, "preferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("CurrentProfileName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setCurrentProfileNameFromHost:(id)a3
{
  const __CFString *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("www.evernote.com")) & 1) != 0)
  {
    v4 = CFSTR("Evernote");
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("app.yinxiang.com")))
  {
    v4 = CFSTR("Evernote-China");
  }
  else
  {
    v4 = 0;
  }
  -[ENSession preferences](self, "preferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("CurrentProfileName"));

}

- (id)userStoreUrl
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR(".*:[0-9]+"), 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENSession sessionHost](self, "sessionHost");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENSession sessionHost](self, "sessionHost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "numberOfMatchesInString:options:range:", v4, 0, 0, objc_msgSend(v5, "length"));

  v7 = CFSTR("http");
  if (!v6)
    v7 = CFSTR("https");
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = v7;
  -[ENSession sessionHost](self, "sessionHost");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@://%@/edam/user"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)authenticationTokenForBusinessStoreClient:(id)a3
{
  void *v3;
  void *v4;

  -[ENSession validBusinessAuthenticationResult](self, "validBusinessAuthenticationResult", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authenticationToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)noteStoreUrlForBusinessStoreClient:(id)a3
{
  void *v3;
  void *v4;

  -[ENSession validBusinessAuthenticationResult](self, "validBusinessAuthenticationResult", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "noteStoreUrl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)authenticationTokenForLinkedNotebookRef:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  v5 = a3;
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENSession.m"), 1842, CFSTR("Cannot authenticate to linked notebook on main thread"));

  }
  objc_msgSend(v5, "sharedNotebookGlobalId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ENSession authCache](self, "authCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "guid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "authenticationResultForLinkedNotebookGuid:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(v5, "noteStoreUrl");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ENSession primaryAuthenticationToken](self, "primaryAuthenticationToken");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[ENNoteStoreClient noteStoreClientWithUrl:authenticationToken:](ENNoteStoreClient, "noteStoreClientWithUrl:authenticationToken:", v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "sharedNotebookGlobalId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "authenticateToSharedNotebookWithGlobalId:", v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[ENSession authCache](self, "authCache");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "guid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAuthenticationResult:forLinkedNotebookGuid:", v9, v15);

    }
    objc_msgSend(v9, "authenticationToken");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)userStoreClientForBootstrapping
{
  void *v2;
  void *v3;

  -[ENSession userStoreUrl](self, "userStoreUrl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENUserStoreClient userStoreClientWithUrl:authenticationToken:](ENUserStoreClient, "userStoreClientWithUrl:authenticationToken:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)authenticatorShouldShowAuthorizationUIWithURL:(id)a3 callbackPrefix:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  -[ENSession authorizationBlock](self, "authorizationBlock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ENSession authorizationBlock](self, "authorizationBlock");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, id))v11)[2](v11, v12, v8, v9);

  }
}

- (void)authenticatorDidAuthenticateWithCredentials:(id)a3 authInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  -[ENSession setIsAuthenticated:](self, "setIsAuthenticated:", 1);
  -[ENSession addCredentials:](self, "addCredentials:", v7);
  objc_msgSend(v7, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENSession setCurrentProfileNameFromHost:](self, "setCurrentProfileNameFromHost:", v8);

  objc_msgSend(v7, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENSession setSessionHost:](self, "setSessionHost:", v9);

  objc_msgSend(v7, "authenticationToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ENSession setPrimaryAuthenticationToken:](self, "setPrimaryAuthenticationToken:", v10);
  objc_msgSend(v6, "objectForKey:", CFSTR("ENOAuthAuthenticatorAuthInfoAppNotebookIsLinked"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = objc_msgSend(v11, "BOOLValue");
  if ((_DWORD)v6)
  {
    -[ENSession preferences](self, "preferences");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("AppNotebookIsLinked"));

  }
  -[ENSession performPostAuthentication](self, "performPostAuthentication");
}

- (void)storeClientFailedAuthentication:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENSession primaryNoteStore](self, "primaryNoteStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Primary note store operation failed authentication. Unauthenticating."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "evernoteLogErrorString:", v8);

    -[ENSession unauthenticate](self, "unauthenticate");
  }
}

- (ENSDKLogging)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (void)setSourceApplication:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isAuthenticated
{
  return self->_isAuthenticated;
}

- (void)setIsAuthenticated:(BOOL)a3
{
  self->_isAuthenticated = a3;
}

- (int64_t)personalUploadUsage
{
  return self->_personalUploadUsage;
}

- (void)setPersonalUploadUsage:(int64_t)a3
{
  self->_personalUploadUsage = a3;
}

- (int64_t)personalUploadLimit
{
  return self->_personalUploadLimit;
}

- (void)setPersonalUploadLimit:(int64_t)a3
{
  self->_personalUploadLimit = a3;
}

- (int64_t)businessUploadUsage
{
  return self->_businessUploadUsage;
}

- (void)setBusinessUploadUsage:(int64_t)a3
{
  self->_businessUploadUsage = a3;
}

- (int64_t)businessUploadLimit
{
  return self->_businessUploadLimit;
}

- (void)setBusinessUploadLimit:(int64_t)a3
{
  self->_businessUploadLimit = a3;
}

- (ENAuthenticator)authenticator
{
  return self->_authenticator;
}

- (void)setAuthenticator:(id)a3
{
  objc_storeStrong((id *)&self->_authenticator, a3);
}

- (id)authorizationBlock
{
  return self->_authorizationBlock;
}

- (void)setAuthorizationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)authenticationCompletion
{
  return self->_authenticationCompletion;
}

- (void)setAuthenticationCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)sessionHost
{
  return self->_sessionHost;
}

- (void)setSessionHost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (EDAMUser)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
  objc_storeStrong((id *)&self->_user, a3);
}

- (NSString)primaryAuthenticationToken
{
  return self->_primaryAuthenticationToken;
}

- (void)setPrimaryAuthenticationToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)supportsLinkedAppNotebook
{
  return self->_supportsLinkedAppNotebook;
}

- (void)setSupportsLinkedAppNotebook:(BOOL)a3
{
  self->_supportsLinkedAppNotebook = a3;
}

- (EDAMUser)businessUser
{
  return self->_businessUser;
}

- (void)setBusinessUser:(id)a3
{
  objc_storeStrong((id *)&self->_businessUser, a3);
}

- (ENPreferencesStore)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (void)setUserStore:(id)a3
{
  objc_storeStrong((id *)&self->_userStore, a3);
}

- (void)setPrimaryNoteStore:(id)a3
{
  objc_storeStrong((id *)&self->_primaryNoteStore, a3);
}

- (void)setBusinessNoteStore:(id)a3
{
  objc_storeStrong((id *)&self->_businessNoteStore, a3);
}

- (void)setAuthCache:(id)a3
{
  objc_storeStrong((id *)&self->_authCache, a3);
}

- (NSArray)notebooksCache
{
  return self->_notebooksCache;
}

- (void)setNotebooksCache:(id)a3
{
  objc_storeStrong((id *)&self->_notebooksCache, a3);
}

- (NSDate)notebooksCacheDate
{
  return self->_notebooksCacheDate;
}

- (void)setNotebooksCacheDate:(id)a3
{
  objc_storeStrong((id *)&self->_notebooksCacheDate, a3);
}

- (OS_dispatch_queue)thumbnailQueue
{
  return self->_thumbnailQueue;
}

- (void)setThumbnailQueue:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailQueue, a3);
}

- (ENUserStoreClient)userStorePendingRevocation
{
  return self->_userStorePendingRevocation;
}

- (void)setUserStorePendingRevocation:(id)a3
{
  objc_storeStrong((id *)&self->_userStorePendingRevocation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userStorePendingRevocation, 0);
  objc_storeStrong((id *)&self->_thumbnailQueue, 0);
  objc_storeStrong((id *)&self->_notebooksCacheDate, 0);
  objc_storeStrong((id *)&self->_notebooksCache, 0);
  objc_storeStrong((id *)&self->_authCache, 0);
  objc_storeStrong((id *)&self->_businessNoteStore, 0);
  objc_storeStrong((id *)&self->_primaryNoteStore, 0);
  objc_storeStrong((id *)&self->_userStore, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_businessUser, 0);
  objc_storeStrong((id *)&self->_primaryAuthenticationToken, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_sessionHost, 0);
  objc_storeStrong(&self->_authenticationCompletion, 0);
  objc_storeStrong(&self->_authorizationBlock, 0);
  objc_storeStrong((id *)&self->_authenticator, 0);
  objc_storeStrong((id *)&self->_sourceApplication, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

void __62__ENSession_downloadThumbnailForNote_maxDimension_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
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
  id v29;
  id v30;
  id v31;
  _QWORD block[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;

  objc_msgSend(*(id *)(a1 + 32), "authenticationTokenForNoteRef:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "shardIdForNoteRef:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ENErrorDomain"), 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

  }
  else
  {
    if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("?size=%lu"), *(_QWORD *)(a1 + 56));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 32), "sessionHost");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "guid");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = &stru_24F8BBA48;
    if (v8)
      v13 = v8;
    objc_msgSend(v9, "stringWithFormat:", CFSTR("https://%@/shard/%@/thm/note/%@%@"), v10, v4, v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v2, "en_stringByUrlEncoding");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("auth=%@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_alloc(MEMORY[0x24BDB7458]);
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithURL:", v19);

    objc_msgSend(v20, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v17, "dataUsingEncoding:", 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setHTTPBody:", v21);

    objc_msgSend(v20, "addValue:forHTTPHeaderField:", CFSTR("application/x-www-form-urlencoded;charset=UTF-8"),
      CFSTR("Content-Type"));
    v22 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v20, "HTTPBody");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v23, "length"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addValue:forHTTPHeaderField:", v24, CFSTR("Content-Length"));

    objc_msgSend(*(id *)(a1 + 32), "sessionHost");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addValue:forHTTPHeaderField:", v25, CFSTR("Host"));

    v37 = 0;
    v36 = 0;
    objc_msgSend(MEMORY[0x24BDB7478], "sendSynchronousRequest:returningResponse:error:", v20, &v37, &v36);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v37;
    v28 = v36;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__ENSession_downloadThumbnailForNote_maxDimension_completion___block_invoke_2;
    block[3] = &unk_24F8BA298;
    v33 = v26;
    v29 = *(id *)(a1 + 48);
    v34 = v28;
    v35 = v29;
    v30 = v28;
    v31 = v26;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __62__ENSession_downloadThumbnailForNote_maxDimension_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  id v6;

  v1 = a1[4];
  if (v1)
  {
    v2 = a1[6];
    v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
    v4 = 0;
LABEL_5:
    v3(v2, v1, v4);
    return;
  }
  v4 = a1[5];
  v5 = a1[6];
  if (v4)
  {
    v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    v2 = a1[6];
    v1 = 0;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ENErrorDomain"), 0, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v6);

}

void __46__ENSession_downloadNote_progress_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  ENNote *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setDownloadProgressHandler:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v6 = -[ENNote initWithServiceNote:]([ENNote alloc], "initWithServiceNote:", v7);
    objc_msgSend(*(id *)(a1 + 32), "setDownloadProgressHandler:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

uint64_t __49__ENSession_findNotes_processResultsWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "sortAscending");
  if (v7)
    v8 = v5;
  else
    v8 = v6;
  if (v7)
    v9 = v6;
  else
    v9 = v5;
  v10 = v8;
  v11 = v9;
  if ((objc_msgSend(*(id *)(a1 + 32), "sortOrder") & 2) != 0)
  {
    objc_msgSend(v10, "created");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "created");
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v13 = (void *)v15;
    v14 = objc_msgSend(v12, "compare:", v15);
    goto LABEL_13;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "sortOrder") & 4) != 0)
  {
    objc_msgSend(v10, "updated");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updated");
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  objc_msgSend(v10, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "compare:options:", v13, 1);
LABEL_13:
  v16 = v14;

  return v16;
}

uint64_t __56__ENSession_findNotes_nextFindInLinkedScopeWithContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "findMetadataResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v4);

  return objc_msgSend(*(id *)(a1 + 40), "findNotes_nextFindInLinkedScopeWithContext:", *(_QWORD *)(a1 + 32));
}

void __56__ENSession_findNotes_nextFindInLinkedScopeWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  +[ENSession sharedSession](ENSession, "sharedSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("findNotes: Failed to find notes (linked). notebook = %@; %@"),
    *(_QWORD *)(a1 + 32),
    v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "evernoteLogErrorString:", v5);

  objc_msgSend(*(id *)(a1 + 40), "findNotes_completeWithContext:error:", *(_QWORD *)(a1 + 48), v6);
}

uint64_t __54__ENSession_findNotes_findInBusinessScopeWithContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "findMetadataResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v4);

  v6 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v4, "valueForKeyPath:", CFSTR("guid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setResultGuidsFromBusiness:", v8);

  return objc_msgSend(*(id *)(a1 + 40), "findNotes_findInLinkedScopeWithContext:", *(_QWORD *)(a1 + 32));
}

void __54__ENSession_findNotes_findInBusinessScopeWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isErrorDueToRestrictedAuth:"))
  {
    objc_msgSend(*(id *)(a1 + 32), "findNotes_findInLinkedScopeWithContext:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("findNotes: Failed to find notes (business). %@"), v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "evernoteLogErrorString:", v5);

    objc_msgSend(*(id *)(a1 + 32), "findNotes_completeWithContext:error:", *(_QWORD *)(a1 + 40), v6);
  }

}

uint64_t __54__ENSession_findNotes_findInPersonalScopeWithContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "findMetadataResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v4);

  return objc_msgSend(*(id *)(a1 + 40), "findNotes_findInBusinessScopeWithContext:", *(_QWORD *)(a1 + 32));
}

void __54__ENSession_findNotes_findInPersonalScopeWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  +[ENSession sharedSession](ENSession, "sharedSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("findNotes: Failed to find notes (personal). %@"), v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "evernoteLogErrorString:", v5);

  objc_msgSend(*(id *)(a1 + 32), "findNotes_completeWithContext:error:", *(_QWORD *)(a1 + 40), v6);
}

void __48__ENSession_findNotes_listNotebooksWithContext___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setAllNotebooks:", a2);
    objc_msgSend(*(id *)(a1 + 40), "findNotes_findInPersonalScopeWithContext:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("findNotes: Failed to list notebooks. %@"), v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "evernoteLogErrorString:", v7);

    objc_msgSend(*(id *)(a1 + 40), "findNotes_completeWithContext:error:", *(_QWORD *)(a1 + 32), v8);
  }

}

void __35__ENSession_deleteNote_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (*v9)(void);
  uint64_t v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    v11 = v4;
    +[ENSession sharedSession](ENSession, "sharedSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to deleteNote: %@"), v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "evernoteLogErrorString:", v7);

    v4 = v11;
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
    {
      v9 = *(void (**)(void))(v8 + 16);
LABEL_6:
      v9();
      v4 = v11;
    }
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
    {
      v9 = *(void (**)(void))(v10 + 16);
      v11 = 0;
      goto LABEL_6;
    }
  }

}

void __34__ENSession_shareNote_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a2;
  v5 = a3;
  if (v5)
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to shareNote: %@"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "evernoteLogErrorString:", v8);

    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "shardIdForNoteRef:", *(_QWORD *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "guid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sessionHost");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[ENShareURLHelper shareURLStringForNoteGUID:shardId:shareKey:serviceHost:encodedAdditionalString:](ENShareURLHelper, "shareURLStringForNoteGUID:shardId:shareKey:serviceHost:encodedAdditionalString:", v11, v10, v15, v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *(_QWORD *)(a1 + 48);
    if (v14)
      (*(void (**)(uint64_t, void *, _QWORD))(v14 + 16))(v14, v13, 0);

  }
}

void __42__ENSession_uploadNote_createWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "setNoteRef:", 0);
    +[ENSession sharedSession](ENSession, "sharedSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to createNote for uploadNote: %@"), v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "evernoteLogErrorString:", v7);

    v9 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v10 = v13;
  }
  else
  {
    objc_msgSend(a2, "guid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "noteRef");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setGuid:", v11);

    v9 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v10 = 0;
  }
  objc_msgSend(v8, "uploadNote_completeWithContext:error:", v9, v10);

}

void __57__ENSession_uploadNote_findSharedAppNotebookWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a2;
  v5 = a3;
  if (v5)
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD17C8];
    v13 = v5;
    v9 = CFSTR("Failed to getSharedNotebookByAuth for uploadNote; turning into NotFound: %@");
  }
  else
  {
    if (v14)
    {
      objc_msgSend(*(id *)(a1 + 32), "preferences");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "encodeObject:forKey:", v14, CFSTR("SharedAppNotebook"));

      objc_msgSend(*(id *)(a1 + 32), "uploadNote_determineDestinationWithContext:", *(_QWORD *)(a1 + 40));
      goto LABEL_6;
    }
    +[ENSession sharedSession](ENSession, "sharedSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD17C8];
    v9 = CFSTR("getSharedNotebookByAuth for uploadNote returned empty sharedNotebook; turning into NotFound.");
  }
  objc_msgSend(v8, "stringWithFormat:", v9, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "evernoteLogInfoString:", v10);

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ENErrorDomain"), 4, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uploadNote_completeWithContext:error:", *(_QWORD *)(a1 + 40), v11);

LABEL_6:
}

void __57__ENSession_uploadNote_findLinkedAppNotebookWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v19 = a2;
  v5 = a3;
  if (v5)
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD17C8];
    v18 = v5;
    v9 = CFSTR("Failed to listLinkedNotebooks for uploadNote; turning into NotFound: %@");
LABEL_3:
    objc_msgSend(v8, "stringWithFormat:", v9, v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "evernoteLogInfoString:", v10);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ENErrorDomain"), 4, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uploadNote_completeWithContext:error:", *(_QWORD *)(a1 + 40), v11);
    goto LABEL_4;
  }
  if (!objc_msgSend(v19, "count"))
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD17C8];
    v9 = CFSTR("Cannot find linked app notebook. Perhaps user deleted it?");
    goto LABEL_3;
  }
  if ((unint64_t)objc_msgSend(v19, "count") >= 2)
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Expected to find single linked notebook, found %lu"), objc_msgSend(v19, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "evernoteLogInfoString:", v14);

  }
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sharedNotebookGlobalId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(*(id *)(a1 + 32), "preferences");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v11, CFSTR("LinkedAppNotebook"));

    objc_msgSend(*(id *)(a1 + 32), "uploadNote_findSharedAppNotebookWithContext:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ENErrorDomain"), 5, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uploadNote_completeWithContext:error:", *(_QWORD *)(a1 + 40), v17);

  }
LABEL_4:

}

void __42__ENSession_uploadNote_updateWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "refToReplace");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setNoteRef:", v17);

    v15 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(a1 + 40);
    v16 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v5, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("parameter"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Note.guid"));

  if (!v9 || objc_msgSend(*(id *)(a1 + 32), "policy") != 2)
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to updateNote for uploadNote: %@"), v6, v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "evernoteLogErrorString:", v13);

    v15 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(a1 + 40);
    v16 = v6;
LABEL_7:
    objc_msgSend(v14, "uploadNote_completeWithContext:error:", v15, v16);
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "note");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setGuid:", 0);

  objc_msgSend(*(id *)(a1 + 32), "setPolicy:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setRefToReplace:", 0);
  objc_msgSend(*(id *)(a1 + 40), "uploadNote_determineDestinationWithContext:", *(_QWORD *)(a1 + 32));
LABEL_8:

}

uint64_t __53__ENSession_listNotebooks_prepareResultsWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:options:", v6, 1);
  return v7;
}

void __59__ENSession_listNotebooks_fetchSharedNotebooksWithContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;

  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setError:");
    objc_msgSend(*(id *)(a1 + 40), "listNotebooks_completePendingSharedNotebookWithContext:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    v4 = *(void **)(a1 + 48);
    objc_msgSend(a2, "userId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intValue");
    objc_msgSend(*(id *)(a1 + 56), "uri");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __59__ENSession_listNotebooks_fetchSharedNotebooksWithContext___block_invoke_2;
    v12[3] = &unk_24F8B6088;
    v8 = *(id *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v13 = v8;
    v14 = v9;
    v10 = *(id *)(a1 + 64);
    v11 = *(_QWORD *)(a1 + 56);
    v15 = v10;
    v16 = v11;
    objc_msgSend(v4, "fetchPublicNotebookWithUserID:publicURI:completion:", v6, v7, v12);

  }
}

void __59__ENSession_listNotebooks_fetchSharedNotebooksWithContext___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  if (v5)
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to get shared notebook for linked notebook record %@"), *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "evernoteLogErrorString:", v8);

    objc_msgSend(*(id *)(a1 + 40), "linkedPersonalNotebooks");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 40), "setError:", v5);
  }
  else
  {
    v10 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "guid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v12, v11);

  }
  objc_msgSend(*(id *)(a1 + 48), "listNotebooks_completePendingSharedNotebookWithContext:", *(_QWORD *)(a1 + 40));

}

void __59__ENSession_listNotebooks_fetchSharedNotebooksWithContext___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setError:", a3);
  }
  else
  {
    v5 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "guid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v7, v6);

  }
  objc_msgSend(*(id *)(a1 + 40), "listNotebooks_completePendingSharedNotebookWithContext:", *(_QWORD *)(a1 + 32));

}

void __61__ENSession_listNotebooks_fetchBusinessNotebooksWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error from listNotebooks in business store: %@"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "evernoteLogErrorString:", v9);

    objc_msgSend(*(id *)(a1 + 32), "listNotebooks_completeWithContext:error:", *(_QWORD *)(a1 + 40), v6);
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(*(id *)(a1 + 40), "setBusinessNotebooks:", v10);

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = v5;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 40), "businessNotebooks");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "guid");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKey:", v16, v18);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

    objc_msgSend(*(id *)(a1 + 32), "listNotebooks_processBusinessNotebooksWithContext:", *(_QWORD *)(a1 + 40));
  }

}

void __67__ENSession_listNotebooks_fetchSharedBusinessNotebooksWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error from listSharedNotebooks in business store: %@"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "evernoteLogErrorString:", v9);

    objc_msgSend(*(id *)(a1 + 32), "listNotebooks_completeWithContext:error:", *(_QWORD *)(a1 + 40), v6);
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(*(id *)(a1 + 40), "setSharedBusinessNotebooks:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDD14E0]);
    objc_msgSend(*(id *)(a1 + 40), "setSharedBusinessNotebookGuids:", v11);

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = v5;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 40), "sharedBusinessNotebooks");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "globalId");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKey:", v17, v19);

          objc_msgSend(*(id *)(a1 + 40), "sharedBusinessNotebookGuids");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "notebookGuid");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v21);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v14);
    }

    objc_msgSend(*(id *)(a1 + 32), "listNotebooks_fetchBusinessNotebooksWithContext:", *(_QWORD *)(a1 + 40));
  }

}

void __58__ENSession_listNotebooks_listLinkedNotebooksWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  v5 = a3;
  if (v5)
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "isErrorDueToRestrictedAuth:", v5))
    {
      +[ENSession sharedSession](ENSession, "sharedSession");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logger");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error from listLinkedNotebooks in user's store: %@"), v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "evernoteLogErrorString:", v8);

      objc_msgSend(*(id *)(a1 + 32), "listNotebooks_completeWithContext:error:", *(_QWORD *)(a1 + 40), v5);
      goto LABEL_8;
    }
LABEL_7:
    objc_msgSend(*(id *)(a1 + 32), "listNotebooks_prepareResultsWithContext:", *(_QWORD *)(a1 + 40));
    goto LABEL_8;
  }
  if (!objc_msgSend(v13, "count"))
    goto LABEL_7;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setLinkedPersonalNotebooks:", v9);

  objc_msgSend(*(id *)(a1 + 32), "businessNoteStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(void **)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  if (v10)
    objc_msgSend(v11, "listNotebooks_fetchSharedBusinessNotebooksWithContext:", v12);
  else
    objc_msgSend(v11, "listNotebooks_fetchSharedNotebooksWithContext:", v12);
LABEL_8:

}

void __58__ENSession_listNotebooks_listSharedNotebooksWithContext___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error from listSharedNotebooks in user's store: %@"), v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "evernoteLogErrorString:", v6);

    objc_msgSend(*(id *)(a1 + 32), "listNotebooks_completeWithContext:error:", *(_QWORD *)(a1 + 40), v7);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "listNotebooks_listLinkedNotebooksWithContext:", *(_QWORD *)(a1 + 40));
  }

}

void __52__ENSession_listNotebooks_listNotebooksWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  ENNotebook *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isErrorDueToRestrictedAuth:", v6))
    {
      objc_msgSend(*(id *)(a1 + 32), "listNotebooks_listLinkedNotebooksWithContext:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      +[ENSession sharedSession](ENSession, "sharedSession");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logger");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error from listNotebooks in user's store: %@"), v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "evernoteLogErrorString:", v15);

      objc_msgSend(*(id *)(a1 + 32), "listNotebooks_completeWithContext:error:", *(_QWORD *)(a1 + 40), v6);
    }
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v5);
          v11 = -[ENNotebook initWithNotebook:]([ENNotebook alloc], "initWithNotebook:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
          objc_msgSend(*(id *)(a1 + 40), "resultNotebooks");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v11);

        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }
    objc_msgSend(*(id *)(a1 + 32), "listNotebooks_listSharedNotebooksWithContext:", *(_QWORD *)(a1 + 40));
  }

}

void __49__ENSession_listWritableNotebooksWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v13, "allowsWriting", (_QWORD)v14))
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __48__ENSession_unauthenticateAndRevokeAccessToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setUserStorePendingRevocation:", 0);
}

void __31__ENSession_refreshUploadUsage__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  void *v4;
  void *v6;
  id v7;

  if (a3)
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to get personal sync state"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "evernoteLogErrorString:", v4);
  }
  else
  {
    objc_msgSend(a2, "uploaded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPersonalUploadUsage:", objc_msgSend(v6, "longLongValue"));

    objc_msgSend(*(id *)(a1 + 32), "user");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accounting");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uploadLimit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPersonalUploadLimit:", objc_msgSend(v4, "longLongValue"));
  }

}

void __31__ENSession_refreshUploadUsage__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  void *v4;
  void *v6;
  id v7;

  if (a3)
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to get business sync state"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "evernoteLogErrorString:", v4);
  }
  else
  {
    objc_msgSend(a2, "uploaded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setBusinessUploadUsage:", objc_msgSend(v6, "longLongValue"));

    objc_msgSend(*(id *)(a1 + 32), "businessUser");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accounting");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uploadLimit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setBusinessUploadLimit:", objc_msgSend(v4, "longLongValue"));
  }

}

void __38__ENSession_performPostAuthentication__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (v5)
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to get user info for user: %@"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "evernoteLogErrorString:", v8);

    if (*(_BYTE *)(a1 + 40))
      v9 = v5;
    else
      v9 = 0;
    objc_msgSend(*(id *)(a1 + 32), "completeAuthenticationWithError:", v9);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setUser:", v11);
    objc_msgSend(*(id *)(a1 + 32), "preferences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v11, CFSTR("User"));

    objc_msgSend(*(id *)(a1 + 32), "completeAuthenticationWithError:", 0);
    if (!disableRefreshingNotebooksCacheOnLaunch)
      objc_msgSend(*(id *)(a1 + 32), "listNotebooksWithCompletion:", &__block_literal_global_61);
    objc_msgSend(*(id *)(a1 + 32), "refreshUploadUsage");
  }

}

void __38__ENSession_performPostAuthentication__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  if (a3)
  {
    v4 = a3;
    +[ENSession sharedSession](ENSession, "sharedSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error when listing notebooks: %@"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "evernoteLogErrorString:", v7);
  }
  +[ENSession sharedSession](ENSession, "sharedSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Notebooks: %@"), v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "evernoteLogInfoString:", v10);

}

+ (void)setSharedSessionConsumerKey:(id)a3 consumerSecret:(id)a4 optionalHost:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)ConsumerKey;
  ConsumerKey = (uint64_t)v7;
  v17 = v7;

  v11 = (void *)ConsumerSecret;
  ConsumerSecret = (uint64_t)v8;
  v12 = v8;

  v13 = (void *)SessionHostOverride;
  SessionHostOverride = (uint64_t)v9;
  v14 = v9;

  v15 = (void *)DeveloperToken;
  DeveloperToken = 0;

  v16 = (void *)NoteStoreUrl;
  NoteStoreUrl = 0;

}

+ (void)setSharedSessionDeveloperToken:(id)a3 noteStoreUrl:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)DeveloperToken;
  DeveloperToken = (uint64_t)v5;
  v12 = v5;

  v8 = (void *)NoteStoreUrl;
  NoteStoreUrl = (uint64_t)v6;
  v9 = v6;

  v10 = (void *)ConsumerKey;
  ConsumerKey = 0;

  v11 = (void *)ConsumerSecret;
  ConsumerSecret = 0;

}

+ (ENSession)sharedSession
{
  if (sharedSession_onceToken != -1)
    dispatch_once(&sharedSession_onceToken, &__block_literal_global_30652);
  return (ENSession *)(id)sharedSession_session;
}

+ (void)setDisableRefreshingNotebooksCacheOnLaunch:(BOOL)a3
{
  disableRefreshingNotebooksCacheOnLaunch = a3;
}

+ (void)setSecurityApplicationGroupIdentifier:(id)a3
{
  objc_storeStrong((id *)&SecurityApplicationGroupIdentifier, a3);
}

+ (void)setKeychainGroup:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_storeStrong((id *)&_keychainGroup, a3);
  v5 = a3;
  objc_msgSend(a1, "bundleSeedID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", _keychainGroup);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)_keychainAccessGroup;
  _keychainAccessGroup = v7;

}

+ (id)keychainAccessGroup
{
  return (id)_keychainAccessGroup;
}

+ (id)sessionHostOverride
{
  return (id)SessionHostOverride;
}

+ (id)consumerKey
{
  return (id)ConsumerKey;
}

+ (id)consumerSecret
{
  return (id)ConsumerSecret;
}

+ (id)developerToken
{
  return (id)DeveloperToken;
}

+ (BOOL)checkSharedSessionSettings
{
  BOOL v2;

  if (DeveloperToken)
    v2 = NoteStoreUrl == 0;
  else
    v2 = 1;
  if (!v2
    || ConsumerKey
    && (objc_msgSend((id)ConsumerKey, "isEqualToString:", CFSTR("your key")) & 1) == 0
    && ConsumerSecret
    && !objc_msgSend((id)ConsumerSecret, "isEqualToString:", CFSTR("your secret")))
  {
    return 1;
  }
  NSLog(CFSTR("%@"), a2, CFSTR("Cannot create shared Evernote session without either a valid consumer key/secret pair, or a developer token set"));
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@"), CFSTR("Cannot create shared Evernote session without either a valid consumer key/secret pair, or a developer token set"));
  return 0;
}

+ (id)bundleSeedID
{
  const __CFDictionary *v2;
  OSStatus v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CFTypeRef result;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", *MEMORY[0x24BDE9230], *MEMORY[0x24BDE9220], CFSTR("bundleSeedID"), *MEMORY[0x24BDE8FA8], &stru_24F8BBA48, *MEMORY[0x24BDE9128], *MEMORY[0x24BDBD270], *MEMORY[0x24BDE94C0], 0);
  v2 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  result = 0;
  v3 = SecItemCopyMatching(v2, &result);
  if (v3 == -25300)
    v3 = SecItemAdd(v2, &result);
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend((id)result, "objectForKey:", *MEMORY[0x24BDE8F50]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nextObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    CFRelease(result);
  }

  return v4;
}

void __26__ENSession_sharedSession__block_invoke()
{
  ENSession *v0;
  void *v1;

  v0 = objc_alloc_init(ENSession);
  v1 = (void *)sharedSession_session;
  sharedSession_session = (uint64_t)v0;

}

@end
