@implementation IDSSignInController

- (IDSSignInController)initWithPasswordManager:(id)a3 CTAdapter:(id)a4 signInTimeout:(double)a5 signInFuzz:(double)a6 queue:(id)a7
{
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  IDSSignInController *v17;
  IDSSignInController *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *signInQueue;
  uint64_t v22;
  NSString *listenerGUID;
  void *v24;
  NSObject *v25;
  objc_super v27;
  uint8_t buf[4];
  IDSSignInController *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a7;
  if (_IDSRunningInDaemon())
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "signInController");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1907E949C();

    v17 = 0;
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)IDSSignInController;
    v18 = -[IDSSignInController init](&v27, sel_init);
    if (v18)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = dispatch_queue_create_with_target_V2("com.apple.identityservices.IDSSignInController", v19, v15);
      signInQueue = v18->_signInQueue;
      v18->_signInQueue = (OS_dispatch_queue *)v20;

      objc_storeStrong(&v18->_passwordManager, a3);
      objc_storeStrong((id *)&v18->_CTAdapter, a4);
      v18->_signInTimeout = a5;
      v18->_signInFuzz = a6;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
      v22 = objc_claimAutoreleasedReturnValue();
      listenerGUID = v18->_listenerGUID;
      v18->_listenerGUID = (NSString *)v22;

      +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addListenerID:services:", v18->_listenerGUID, 0);

      objc_msgSend(MEMORY[0x1E0D36AA8], "signInController");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v29 = v18;
        _os_log_impl(&dword_1906E0000, v25, OS_LOG_TYPE_DEFAULT, "IDSSignInController init {self: %p}", buf, 0xCu);
      }

    }
    self = v18;
    v17 = self;
  }

  return v17;
}

- (IDSSignInController)initWithQueue:(id)a3
{
  id v4;
  NSObject *v5;
  IDSSignInController *v6;
  _IDSPasswordManager *v7;
  void *v8;

  v4 = a3;
  if (_IDSRunningInDaemon())
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "signInController");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907E949C();

    v6 = 0;
  }
  else
  {
    v7 = objc_alloc_init(_IDSPasswordManager);
    objc_msgSend(MEMORY[0x1E0D34CC8], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[IDSSignInController initWithPasswordManager:CTAdapter:signInTimeout:signInFuzz:queue:](self, "initWithPasswordManager:CTAdapter:signInTimeout:signInFuzz:queue:", v7, v8, v4, 180.0, 60.0);

    v6 = self;
  }

  return v6;
}

- (IDSSignInController)init
{
  void *v3;
  IDSSignInController *v4;

  dispatch_get_global_queue(21, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[IDSSignInController initWithQueue:](self, "initWithQueue:", v3);

  return v4;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  IDSSignInController *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D36AA8], "signInController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl(&dword_1906E0000, v3, OS_LOG_TYPE_DEFAULT, "IDSSignInController dealloc {self: %p}", buf, 0xCu);
  }

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeListenerID:", self->_listenerGUID);

  v5.receiver = self;
  v5.super_class = (Class)IDSSignInController;
  -[IDSSignInController dealloc](&v5, sel_dealloc);
}

- (void)setDelegate:(id)a3 forService:(unint64_t)a4
{
  id v6;
  NSObject *signInQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  signInQueue = self->_signInQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_19071A738;
  block[3] = &unk_1E2C60448;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(signInQueue, block);

}

- (void)removeDelegateForService:(unint64_t)a3
{
  NSObject *signInQueue;
  _QWORD v4[6];

  signInQueue = self->_signInQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_19071AAC4;
  v4[3] = &unk_1E2C60358;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(signInQueue, v4);
}

- (void)enableUserType:(unint64_t)a3 onService:(unint64_t)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  __CFString *v11;
  __CFString *v12;
  NSObject *signInQueue;
  _QWORD v14[5];
  id v15;
  unint64_t v16;
  unint64_t v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0D36AA8], "signInController");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      v11 = CFSTR("iMessage");
      if (a4 != 1)
        v11 = 0;
      if (!a4)
        v11 = CFSTR("FaceTime");
      v12 = v11;
      *(_DWORD *)buf = 134218242;
      v19 = (const char *)a3;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "Enable user on service {userType: %llu, service: %@}", buf, 0x16u);

    }
    signInQueue = self->_signInQueue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_19071ADF8;
    v14[3] = &unk_1E2C617E0;
    v14[4] = self;
    v16 = a3;
    v17 = a4;
    v15 = v8;
    dispatch_async(signInQueue, v14);

  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[IDSSignInController enableUserType:onService:completion:]";
      _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "%s called with nil completion - returning", buf, 0xCu);
    }

  }
}

- (void)disableUserType:(unint64_t)a3 onService:(unint64_t)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  __CFString *v11;
  __CFString *v12;
  NSObject *signInQueue;
  _QWORD v14[5];
  id v15;
  unint64_t v16;
  unint64_t v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0D36AA8], "signInController");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      v11 = CFSTR("iMessage");
      if (a4 != 1)
        v11 = 0;
      if (!a4)
        v11 = CFSTR("FaceTime");
      v12 = v11;
      *(_DWORD *)buf = 134218242;
      v19 = (const char *)a3;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "Disable user on service {userType: %llu, service: %@}", buf, 0x16u);

    }
    signInQueue = self->_signInQueue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_19071B2C0;
    v14[3] = &unk_1E2C617E0;
    v14[4] = self;
    v16 = a3;
    v17 = a4;
    v15 = v8;
    dispatch_async(signInQueue, v14);

  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[IDSSignInController disableUserType:onService:completion:]";
      _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "%s called with nil completion - returning", buf, 0xCu);
    }

  }
}

- (id)_statusOfUsersOnService:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  IDSSignInServiceUserStatus *v11;
  _QWORD v13[5];

  -[IDSSignInController _serviceNameForType:](self, "_serviceNameForType:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_serviceNameAccountControllerMap, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[IDSSignInController _accountControllerForName:](self, "_accountControllerForName:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_19071B674;
  v13[3] = &unk_1E2C61808;
  v13[4] = self;
  objc_msgSend(v9, "__imArrayByApplyingBlock:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[IDSSignInServiceUserStatus initWithServiceType:userInfos:]([IDSSignInServiceUserStatus alloc], "initWithServiceType:userInfos:", a3, v10);
  if (!v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_serviceNameAccountControllerMap, "setObject:forKeyedSubscript:", 0, v5);
    -[IDSSignInController _cleanupStateForAccountID:](self, "_cleanupStateForAccountID:", 0);
  }

  return v11;
}

- (void)statusOfUsersOnService:(unint64_t)a3 withCompletion:(id)a4
{
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  __CFString *v9;
  __CFString *v10;
  NSObject *signInQueue;
  _QWORD block[5];
  id v13;
  unint64_t v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D36AA8], "signInController");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v9 = CFSTR("iMessage");
      if (a3 != 1)
        v9 = 0;
      if (!a3)
        v9 = CFSTR("FaceTime");
      v10 = v9;
      *(_DWORD *)buf = 138412290;
      v16 = (const char *)v10;
      _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "Checking user statuses {service: %@}", buf, 0xCu);

    }
    signInQueue = self->_signInQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19071B898;
    block[3] = &unk_1E2C61830;
    block[4] = self;
    v14 = a3;
    v13 = v6;
    dispatch_async(signInQueue, block);

  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[IDSSignInController statusOfUsersOnService:withCompletion:]";
      _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "%s called with nil completion - returning", buf, 0xCu);
    }

  }
}

- (void)provideCredential:(id)a3 forUser:(id)a4 onService:(unint64_t)a5 withCompletion:(id)a6
{
  char *v10;
  id v11;
  void (**v12)(id, NSObject *);
  NSObject *v13;
  _BOOL4 v14;
  __CFString *v15;
  const __CFString *v16;
  __CFString *v17;
  const __CFString *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[4];
  NSObject *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = (char *)a3;
  v11 = a4;
  v12 = (void (**)(id, NSObject *))a6;
  objc_msgSend(MEMORY[0x1E0D36AA8], "signInController");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      v15 = CFSTR("FaceTime");
      v16 = CFSTR("iMessage");
      if (a5 != 1)
        v16 = 0;
      if (a5)
        v15 = (__CFString *)v16;
      v17 = v15;
      *(_DWORD *)buf = 134218498;
      v24 = v10;
      v25 = 2112;
      v26 = v11;
      v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_DEFAULT, "Provided credential {credential: %p, user: %@, service: %@}", buf, 0x20u);

    }
    if (a5)
    {
      if (a5 != 1)
        goto LABEL_17;
      v18 = CFSTR("iMessage");
      if (!v10)
        goto LABEL_17;
    }
    else
    {
      v18 = CFSTR("FaceTime");
      if (!v10)
      {
LABEL_17:
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IDSSignInControllerErrorDomain"), -4000, 0);
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D36AA8], "signInController");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v24 = (const char *)v13;
          _os_log_impl(&dword_1906E0000, v20, OS_LOG_TYPE_DEFAULT, "Invalid params {error: %@}", buf, 0xCu);
        }

        v12[2](v12, v13);
        goto LABEL_20;
      }
    }
    if (v11)
    {
      -[IDSSignInController passwordManager](self, "passwordManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = sub_19071BC48;
      v21[3] = &unk_1E2C61858;
      v22 = v12;
      objc_msgSend(v19, "setPassword:forUsername:onService:completionBlock:", v10, v11, v18, v21);

      v13 = v22;
      goto LABEL_20;
    }
    goto LABEL_17;
  }
  if (v14)
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[IDSSignInController provideCredential:forUser:onService:withCompletion:]";
    _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_DEFAULT, "%s called with nil completion - returning", buf, 0xCu);
  }
LABEL_20:

}

- (void)signInUsername:(id)a3 onService:(unint64_t)a4 waitUntilRegistered:(BOOL)a5 withCompletion:(id)a6
{
  _BOOL4 v7;
  char *v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  const __CFString *v17;
  NSObject *signInQueue;
  _QWORD block[4];
  NSObject *v20;
  IDSSignInController *v21;
  id v22;
  unint64_t v23;
  BOOL v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  __CFString *v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v7 = a5;
  v31 = *MEMORY[0x1E0C80C00];
  v10 = (char *)a3;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0D36AA8], "signInController");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      v14 = CFSTR("iMessage");
      if (a4 != 1)
        v14 = 0;
      if (!a4)
        v14 = CFSTR("FaceTime");
      v15 = v14;
      v16 = v15;
      v17 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v26 = v10;
      v27 = 2112;
      if (v7)
        v17 = CFSTR("YES");
      v28 = v15;
      v29 = 2112;
      v30 = v17;
      _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "Sign in user {user: %@, service: %@, shouldWait: %@}", buf, 0x20u);

    }
    signInQueue = self->_signInQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19071BFB4;
    block[3] = &unk_1E2C61880;
    v23 = a4;
    v20 = v10;
    v21 = self;
    v22 = v11;
    v24 = v7;
    dispatch_async(signInQueue, block);

    v12 = v20;
  }
  else if (v13)
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[IDSSignInController signInUsername:onService:waitUntilRegistered:withCompletion:]";
    _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "%s called with nil completion - returning", buf, 0xCu);
  }

}

- (void)signInUsername:(id)a3 withProvidedCredential:(id)a4 onService:(unint64_t)a5 waitUntilRegistered:(BOOL)a6 completion:(id)a7
{
  char *v12;
  id v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  __CFString *v17;
  __CFString *v18;
  _QWORD v19[5];
  char *v20;
  id v21;
  unint64_t v22;
  BOOL v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v12 = (char *)a3;
  v13 = a4;
  v14 = a7;
  objc_msgSend(MEMORY[0x1E0D36AA8], "signInController");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      v17 = CFSTR("iMessage");
      if (a5 != 1)
        v17 = 0;
      if (!a5)
        v17 = CFSTR("FaceTime");
      v18 = v17;
      *(_DWORD *)buf = 138412802;
      v25 = v12;
      v26 = 2048;
      v27 = v13;
      v28 = 2112;
      v29 = v18;
      _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "Sign in user with provided credential {user: %@, credential: %p, service: %@}", buf, 0x20u);

    }
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_19071C388;
    v19[3] = &unk_1E2C618A8;
    v19[4] = self;
    v20 = v12;
    v22 = a5;
    v23 = a6;
    v21 = v14;
    -[IDSSignInController provideCredential:forUser:onService:withCompletion:](self, "provideCredential:forUser:onService:withCompletion:", v13, v20, a5, v19);

  }
  else
  {
    if (v16)
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[IDSSignInController signInUsername:withProvidedCredential:onService:waitUntilRegistered:completion:]";
      _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "%s called with nil completion - returning", buf, 0xCu);
    }

  }
}

- (void)signOutService:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  __CFString *v9;
  __CFString *v10;
  NSObject *signInQueue;
  _QWORD block[5];
  id v13;
  unint64_t v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D36AA8], "signInController");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v9 = CFSTR("iMessage");
      if (a3 != 1)
        v9 = 0;
      if (!a3)
        v9 = CFSTR("FaceTime");
      v10 = v9;
      *(_DWORD *)buf = 138412290;
      v16 = (const char *)v10;
      _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "Sign out service {service: %@}", buf, 0xCu);

    }
    signInQueue = self->_signInQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19071C540;
    block[3] = &unk_1E2C61830;
    block[4] = self;
    v14 = a3;
    v13 = v6;
    dispatch_async(signInQueue, block);

  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[IDSSignInController signOutService:completion:]";
      _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "%s called with nil completion - returning", buf, 0xCu);
    }

  }
}

- (void)_initializeStateMachineForAccountID:(id)a3 service:(id)a4 state:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  IDSSignInControllerAccountDescription *v13;
  void *v14;
  id v15;
  NSMutableDictionary *accountIDDescriptionMap;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  double signInTimeout;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  IDSSignInController *v27;
  id v28;
  uint8_t buf[4];
  IDSSignInController *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = objc_alloc_init(IDSSignInControllerAccountDescription);
  -[IDSSignInControllerAccountDescription setServiceName:](v13, "setServiceName:", v11);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSSignInControllerAccountDescription setState:](v13, "setState:", v14);

  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = sub_19071C95C;
  v26 = &unk_1E2C60E28;
  v15 = v12;
  v27 = self;
  v28 = v15;
  -[IDSSignInControllerAccountDescription setCompletion:](v13, "setCompletion:", &v23);
  accountIDDescriptionMap = self->_accountIDDescriptionMap;
  if (!accountIDDescriptionMap)
  {
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v18 = self->_accountIDDescriptionMap;
    self->_accountIDDescriptionMap = v17;

    accountIDDescriptionMap = self->_accountIDDescriptionMap;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](accountIDDescriptionMap, "setObject:forKeyedSubscript:", v13, v10, v23, v24, v25, v26);
  objc_msgSend(MEMORY[0x1E0D36AA8], "signInController");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x19400FE1C](v15);
    *(_DWORD *)buf = 134219010;
    v30 = self;
    v31 = 2112;
    v32 = v10;
    v33 = 2112;
    v34 = v11;
    v35 = 2112;
    v36 = v20;
    v37 = 2112;
    v38 = v21;
    _os_log_impl(&dword_1906E0000, v19, OS_LOG_TYPE_DEFAULT, "Initialized state machine {self: %p, accountID: %@, serviceName: %@, state: %@, completion: %@}", buf, 0x34u);

  }
  signInTimeout = 5.0;
  if (a5 != 4)
    signInTimeout = self->_signInTimeout;
  -[IDSSignInController _scheduleValidationAfter:forAccountID:allowFuzz:signOut:](self, "_scheduleValidationAfter:forAccountID:allowFuzz:signOut:", v10, 1, a5 == 4, signInTimeout);

}

- (void)_scheduleValidationAfter:(double)a3 forAccountID:(id)a4 allowFuzz:(BOOL)a5 signOut:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  dispatch_time_t v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21[2];
  BOOL v22;
  BOOL v23;
  _BYTE buf[12];
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  const __CFString *v32;
  uint64_t v33;

  v6 = a6;
  v7 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0D36AA8], "signInController");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = CFSTR("NO");
    *(_DWORD *)buf = 134219010;
    *(_QWORD *)&buf[4] = self;
    if (v7)
      v15 = CFSTR("YES");
    else
      v15 = CFSTR("NO");
    if (v6)
      v14 = CFSTR("YES");
    v25 = 2112;
    v26 = v12;
    v27 = 2112;
    v28 = v10;
    v29 = 2112;
    v30 = v15;
    v31 = 2112;
    v32 = v14;
    _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "Schedule validation after {self: %p, delay: %@, accountID: %@, allowFuzz: %@, signOut: %@}", buf, 0x34u);

  }
  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v16 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  -[IDSSignInController signInQueue](self, "signInQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_19071CC6C;
  v19[3] = &unk_1E2C618F8;
  objc_copyWeak(v21, (id *)buf);
  v21[1] = *(id *)&a3;
  v22 = v7;
  v23 = v6;
  v20 = v10;
  v18 = v10;
  dispatch_after(v16, v17, v19);

  objc_destroyWeak(v21);
  objc_destroyWeak((id *)buf);
}

- (void)_cleanupStateForAccountID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  NSMapTable *delegateByServiceType;
  void *v13;
  void *v14;
  NSMutableDictionary *accountIDDescriptionMap;
  NSMutableDictionary *serviceNameAccountControllerMap;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  if (v4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_accountIDDescriptionMap, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_accountIDDescriptionMap, "setObject:forKeyedSubscript:", 0, v4);
    objc_msgSend(v5, "serviceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary allValues](self->_accountIDDescriptionMap, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_19071CF20;
    v17[3] = &unk_1E2C61920;
    v8 = v6;
    v18 = v8;
    objc_msgSend(v7, "__imArrayByFilteringWithBlock:", v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    v11 = -[IDSSignInController _serviceTypeForName:](self, "_serviceTypeForName:", v8);
    delegateByServiceType = self->_delegateByServiceType;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](delegateByServiceType, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10 && !v14)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_serviceNameAccountControllerMap, "setObject:forKeyedSubscript:", 0, v8);

  }
  if (!-[NSMutableDictionary count](self->_accountIDDescriptionMap, "count"))
  {
    accountIDDescriptionMap = self->_accountIDDescriptionMap;
    self->_accountIDDescriptionMap = 0;

  }
  if (!-[NSMutableDictionary count](self->_serviceNameAccountControllerMap, "count"))
  {
    serviceNameAccountControllerMap = self->_serviceNameAccountControllerMap;
    self->_serviceNameAccountControllerMap = 0;

  }
}

- (void)_validateStateForAccountID:(id)a3 timeoutMode:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  char v27;
  NSObject *v28;
  _BOOL4 v29;
  _BOOL4 v30;
  uint64_t v31;
  id v32;
  void *v33;
  _QWORD v35[4];
  id v36;
  IDSSignInController *v37;
  id v38;
  id v39;
  _BYTE *v40;
  unint64_t v41;
  uint8_t v42[4];
  id v43;
  __int16 v44;
  void *v45;
  _BYTE buf[24];
  char v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[IDSSignInController _accountWithUniqueID:](self, "_accountWithUniqueID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_accountIDDescriptionMap, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "completion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v9 = objc_msgSend(v6, "registrationStatus");
    objc_msgSend(v7, "state");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = -[NSObject unsignedIntegerValue](v10, "unsignedIntegerValue");
    objc_msgSend(v7, "serviceName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSSignInController _accountControllerForName:](self, "_accountControllerForName:", v12);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D36AA8], "signInController");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_DEFAULT, "Validating state {stateNumber: %@, account: %@}", buf, 0x16u);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v47 = 0;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = sub_19071D5C4;
    v35[3] = &unk_1E2C61948;
    v14 = v6;
    v36 = v14;
    v41 = a4;
    v39 = v8;
    v37 = self;
    v32 = v5;
    v38 = v32;
    v40 = buf;
    v15 = MEMORY[0x19400FE1C](v35);
    v16 = (void (**)(_QWORD, _QWORD, _QWORD))v15;
    if (!v14 && v11 != 4)
    {
      objc_msgSend(MEMORY[0x1E0D36AA8], "signInController");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v42 = 138412546;
        v43 = v32;
        v44 = 2112;
        v45 = v7;
        _os_log_impl(&dword_1906E0000, v17, OS_LOG_TYPE_DEFAULT, "No account to validate {accountID: %@, description: %@}", v42, 0x16u);
      }

      v18 = -1000;
      goto LABEL_9;
    }
    if (v9 == -1)
    {
      v24 = 0;
    }
    else
    {
      if (v9 == 3 && !v11)
      {
        objc_msgSend(v14, "aliasesToRegister");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "count");
        HIDWORD(v31) = v20 == 0;
        if (v20)
        {
          objc_msgSend(v7, "setState:", &unk_1E2CAE210);
          if (objc_msgSend(v14, "accountType") == 1)
          {
            -[IDSSignInController CTAdapter](self, "CTAdapter");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v31) = objc_msgSend(v21, "supportsIdentification");

            if ((_DWORD)v31)
            {
              objc_msgSend(v19, "arrayByAddingObject:", *MEMORY[0x1E0D35208]);
              v22 = objc_claimAutoreleasedReturnValue();

              v19 = (void *)v22;
            }
          }
          objc_msgSend(v14, "addAliases:", v19, v31);
          objc_msgSend(v14, "registerAccount");
          objc_msgSend(MEMORY[0x1E0D36AA8], "signInController");
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v42 = 0;
            _os_log_impl(&dword_1906E0000, v23, OS_LOG_TYPE_DEFAULT, "Transitioning to registering", v42, 2u);
          }

        }
        else
        {
          v16[2](v16, -2000, 0);
        }

        goto LABEL_38;
      }
      if (!v9 && !v11)
      {
        objc_msgSend(MEMORY[0x1E0D36AA8], "signInController");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v42 = 0;
          _os_log_impl(&dword_1906E0000, v26, OS_LOG_TYPE_DEFAULT, "Re-enable, looks like things didn't progress", v42, 2u);
        }

        objc_msgSend(v33, "enableAccount:", v14);
        objc_msgSend(v14, "authenticateAccount");
        goto LABEL_32;
      }
      if (v9 == 5 && v11 == 2)
        goto LABEL_35;
      if (v11 == 2 && v9 == 4)
      {
        BYTE4(v31) = 0;
LABEL_38:
        if (!a4 || *(_BYTE *)(*(_QWORD *)&buf[8] + 24))
          goto LABEL_10;
        if (a4 == 2)
          v27 = BYTE4(v31);
        else
          v27 = 1;
        if ((v27 & 1) == 0)
        {
          -[IDSSignInController _scheduleValidationAfter:forAccountID:allowFuzz:signOut:](self, "_scheduleValidationAfter:forAccountID:allowFuzz:signOut:", v32, 0, 0, self->_signInFuzz);
          goto LABEL_10;
        }
        v18 = 0;
LABEL_9:
        v16[2](v16, v18, 0);
LABEL_10:

        _Block_object_dispose(buf, 8);
        goto LABEL_13;
      }
      if (v11 != 2)
      {
        if (v11 != 1)
        {
          if (!v11)
          {
            v24 = -402;
            v25 = -1000;
            if (v9 <= 4)
            {
              BYTE4(v31) = 1;
              if (((1 << v9) & 0x16) != 0)
                goto LABEL_38;
            }
            goto LABEL_26;
          }
          v29 = v9 == 1;
          v30 = v11 == 3;
          if (v30 && v29)
            v25 = 0;
          else
            v25 = -1000;
          if (v30 && v29)
            v24 = 0;
          else
            v24 = -402;
          if (v11 != 3)
          {
            BYTE4(v31) = 1;
            if (v11 != 4 || v9 > 1)
              goto LABEL_38;
LABEL_35:
            v25 = 0;
            v24 = 0;
          }
LABEL_26:
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v15, v25, v24);
LABEL_32:
          BYTE4(v31) = 1;
          goto LABEL_38;
        }
        if ((v9 | 2) == 3)
        {
          objc_msgSend(MEMORY[0x1E0D36AA8], "signInController");
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v42 = 0;
            _os_log_impl(&dword_1906E0000, v28, OS_LOG_TYPE_DEFAULT, "Transitioning to registering", v42, 2u);
          }

          objc_msgSend(v7, "setState:", &unk_1E2CAE210);
          goto LABEL_32;
        }
      }
      v24 = -402;
    }
    v25 = -1000;
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x1E0D36AA8], "signInController");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v5;
    _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "No description to validate {accountID: %@}", buf, 0xCu);
  }
LABEL_13:

}

- (id)_createAccountWithDictionary:(id)a3 accountID:(id)a4 serviceName:(id)a5
{
  id v7;
  id v8;
  id v9;
  IDSAccount *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[IDSAccount initWithDictionary:uniqueID:serviceName:]([IDSAccount alloc], "initWithDictionary:uniqueID:serviceName:", v9, v8, v7);

  return v10;
}

- (unint64_t)_statusOfAccount:(id)a3
{
  id v3;
  int v4;
  uint64_t v5;
  unint64_t v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "isEnabled");
  if (objc_msgSend(v3, "registrationStatus") == 5
    || objc_msgSend(v3, "registrationStatus") == 4)
  {
    v5 = 3;
  }
  else
  {
    v5 = 2;
  }
  if (v4)
    v6 = v5;
  else
    v6 = 1;

  return v6;
}

- (BOOL)_actionOnAccountOfType:(unint64_t)a3 onService:(unint64_t)a4 actionBlock:(id)a5
{
  int v6;
  void (**v8)(id, void *, void *);
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v6 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, void *, void *))a5;
  -[IDSSignInController _serviceNameForType:](self, "_serviceNameForType:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSSignInController _accountControllerForName:](self, "_accountControllerForName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v10, "accounts", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v17, "accountType") == v6)
        {
          v8[2](v8, v17, v10);
          v14 = 1;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  return v14 & 1;
}

- (id)_createAccountControllerForService:(id)a3
{
  id v3;
  IDSAccountController *v4;

  v3 = a3;
  v4 = -[IDSAccountController initWithService:]([IDSAccountController alloc], "initWithService:", v3);

  return v4;
}

- (id)_accountControllerForName:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *serviceNameAccountControllerMap;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_serviceNameAccountControllerMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[IDSSignInController _createAccountControllerForService:](self, "_createAccountControllerForService:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    serviceNameAccountControllerMap = self->_serviceNameAccountControllerMap;
    if (!serviceNameAccountControllerMap)
    {
      v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v8 = self->_serviceNameAccountControllerMap;
      self->_serviceNameAccountControllerMap = v7;

      serviceNameAccountControllerMap = self->_serviceNameAccountControllerMap;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](serviceNameAccountControllerMap, "setObject:forKeyedSubscript:", v5, v4);
  }

  return v5;
}

- (id)_accountWithUniqueID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_accountIDDescriptionMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IDSSignInController _accountControllerForName:](self, "_accountControllerForName:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accountWithUniqueID:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_serviceNameForType:(unint64_t)a3
{
  __CFString **v3;

  if (a3)
  {
    if (a3 != 1)
      return 0;
    v3 = IDSServiceNameiMessage;
  }
  else
  {
    v3 = IDSServiceNameFaceTime;
  }
  return *v3;
}

- (unint64_t)_serviceTypeForName:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.ess")) ^ 1;
}

- (void)_validateDelegateState
{
  __int128 v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  const __CFString *v15;
  __int128 v16;
  NSMapTable *obj;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  const __CFString *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = self->_delegateByServiceType;
  v19 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v21;
    *(_QWORD *)&v3 = 138412802;
    v16 = v3;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_delegateByServiceType, "objectForKey:", v5, v16);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          -[IDSSignInController _statusOfUsersOnService:](self, "_statusOfUsersOnService:", objc_msgSend(v5, "unsignedIntegerValue"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](self->_initialStateByService, "objectForKeyedSubscript:", v5);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "serviceUserInfos");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          sub_19071DE50((uint64_t)v9, v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "serviceUserInfos");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          sub_19071DE50((uint64_t)v11, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = objc_msgSend(v10, "isEqualToSet:", v12);
          objc_msgSend(MEMORY[0x1E0D36AA8], "signInController");
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v16;
            v15 = CFSTR("YES");
            if (v13)
              v15 = CFSTR("NO");
            v25 = v15;
            v26 = 2112;
            v27 = v7;
            v28 = 2112;
            v29 = v8;
            _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "Validating delegate state {changes: %@, current: %@, cached: %@}", buf, 0x20u);
          }

          if ((v13 & 1) == 0)
          {
            objc_msgSend(v6, "signInController:service:didChangeStatus:", self, objc_msgSend(v5, "unsignedIntegerValue"), v7);
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_initialStateByService, "setObject:forKeyedSubscript:", v7, v5);
          }

        }
      }
      v19 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    }
    while (v19);
  }

}

- (void)refreshRegistrationForAccount:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_accountIDDescriptionMap, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[IDSSignInController _validateStateForAccountID:timeoutMode:](self, "_validateStateForAccountID:timeoutMode:", v5, 0);
  -[IDSSignInController _validateDelegateState](self, "_validateDelegateState");

}

- (void)accountController:(id)a3 accountAdded:(id)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  NSMutableDictionary *accountIDDescriptionMap;
  void *v9;
  void *v10;
  NSMapTable *delegateByServiceType;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "serviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IDSSignInController _serviceTypeForName:](self, "_serviceTypeForName:", v6);

  accountIDDescriptionMap = self->_accountIDDescriptionMap;
  objc_msgSend(v5, "uniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](accountIDDescriptionMap, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

  }
  else
  {
    delegateByServiceType = self->_delegateByServiceType;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](delegateByServiceType, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0D36AA8], "signInController");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v5;
    _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "Added interesting account {account: %@}", (uint8_t *)&v15, 0xCu);
  }

  objc_msgSend(v5, "addRegistrationDelegate:queue:", self, self->_signInQueue);
LABEL_7:
  -[IDSSignInController _validateDelegateState](self, "_validateDelegateState");

}

- (void)accountController:(id)a3 accountDisabled:(id)a4
{
  id v5;
  NSObject *v6;
  NSMutableDictionary *accountIDDescriptionMap;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0D36AA8], "signInController");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v5;
    _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, "Account disabled {account: %@}", (uint8_t *)&v13, 0xCu);
  }

  accountIDDescriptionMap = self->_accountIDDescriptionMap;
  objc_msgSend(v5, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](accountIDDescriptionMap, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "state");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue");

    if (v11 == 3)
    {
      objc_msgSend(v5, "uniqueID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[IDSSignInController _validateStateForAccountID:timeoutMode:](self, "_validateStateForAccountID:timeoutMode:", v12, 0);

    }
  }
  -[IDSSignInController _validateDelegateState](self, "_validateDelegateState");

}

- (void)accountController:(id)a3 accountRemoved:(id)a4
{
  id v5;
  NSObject *v6;
  NSMutableDictionary *accountIDDescriptionMap;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0D36AA8], "signInController");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, "Account removed {account: %@}", (uint8_t *)&v11, 0xCu);
  }

  accountIDDescriptionMap = self->_accountIDDescriptionMap;
  objc_msgSend(v5, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](accountIDDescriptionMap, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v5, "uniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSSignInController _validateStateForAccountID:timeoutMode:](self, "_validateStateForAccountID:timeoutMode:", v10, 0);

  }
  -[IDSSignInController _validateDelegateState](self, "_validateDelegateState");

}

- (void)accountController:(id)a3 accountUpdated:(id)a4
{
  id v5;
  NSObject *v6;
  NSMutableDictionary *accountIDDescriptionMap;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0D36AA8], "signInController");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, "Account updated {account: %@}", (uint8_t *)&v11, 0xCu);
  }

  accountIDDescriptionMap = self->_accountIDDescriptionMap;
  objc_msgSend(v5, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](accountIDDescriptionMap, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v5, "addRegistrationDelegate:queue:", self, self->_signInQueue);
    objc_msgSend(v5, "uniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSSignInController _validateStateForAccountID:timeoutMode:](self, "_validateStateForAccountID:timeoutMode:", v10, 0);

  }
}

- (void)accountController:(id)a3 accountEnabled:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0D36AA8], "signInController");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, "Account enabled {account: %@}", (uint8_t *)&v7, 0xCu);
  }

  -[IDSSignInController _validateDelegateState](self, "_validateDelegateState");
}

- (NSMutableDictionary)serviceNameAccountControllerMap
{
  return self->_serviceNameAccountControllerMap;
}

- (void)setServiceNameAccountControllerMap:(id)a3
{
  objc_storeStrong((id *)&self->_serviceNameAccountControllerMap, a3);
}

- (NSMutableDictionary)accountIDDescriptionMap
{
  return self->_accountIDDescriptionMap;
}

- (void)setAccountIDDescriptionMap:(id)a3
{
  objc_storeStrong((id *)&self->_accountIDDescriptionMap, a3);
}

- (OS_dispatch_queue)signInQueue
{
  return self->_signInQueue;
}

- (void)setSignInQueue:(id)a3
{
  objc_storeStrong((id *)&self->_signInQueue, a3);
}

- (_IDSPasswordManager)passwordManager
{
  return (_IDSPasswordManager *)self->_passwordManager;
}

- (void)setPasswordManager:(id)a3
{
  objc_storeStrong(&self->_passwordManager, a3);
}

- (double)signInTimeout
{
  return self->_signInTimeout;
}

- (void)setSignInTimeout:(double)a3
{
  self->_signInTimeout = a3;
}

- (double)signInFuzz
{
  return self->_signInFuzz;
}

- (void)setSignInFuzz:(double)a3
{
  self->_signInFuzz = a3;
}

- (NSMapTable)delegateByServiceType
{
  return self->_delegateByServiceType;
}

- (void)setDelegateByServiceType:(id)a3
{
  objc_storeStrong((id *)&self->_delegateByServiceType, a3);
}

- (NSMutableDictionary)initialStateByService
{
  return self->_initialStateByService;
}

- (void)setInitialStateByService:(id)a3
{
  objc_storeStrong((id *)&self->_initialStateByService, a3);
}

- (IDSCTAdapter)CTAdapter
{
  return self->_CTAdapter;
}

- (void)setCTAdapter:(id)a3
{
  objc_storeStrong((id *)&self->_CTAdapter, a3);
}

- (NSString)listenerGUID
{
  return self->_listenerGUID;
}

- (void)setListenerGUID:(id)a3
{
  objc_storeStrong((id *)&self->_listenerGUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerGUID, 0);
  objc_storeStrong((id *)&self->_CTAdapter, 0);
  objc_storeStrong(&self->_passwordManager, 0);
  objc_storeStrong((id *)&self->_signInQueue, 0);
  objc_storeStrong((id *)&self->_initialStateByService, 0);
  objc_storeStrong((id *)&self->_delegateByServiceType, 0);
  objc_storeStrong((id *)&self->_accountIDDescriptionMap, 0);
  objc_storeStrong((id *)&self->_serviceNameAccountControllerMap, 0);
}

- (BOOL)isFaceTimeEnabled
{
  return -[IDSSignInController _isServiceCurrentlyEnabled:](self, "_isServiceCurrentlyEnabled:", CFSTR("com.apple.private.ac"))|| -[IDSSignInController _isServiceCurrentlyEnabled:](self, "_isServiceCurrentlyEnabled:", CFSTR("com.apple.ess"));
}

- (BOOL)isiMessageEnabled
{
  return -[IDSSignInController _isServiceCurrentlyEnabled:](self, "_isServiceCurrentlyEnabled:", CFSTR("com.apple.madrid"));
}

- (BOOL)_isServiceCurrentlyEnabled:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[IDSSignInController _createAccountControllerForService:](self, "_createAccountControllerForService:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v3, "accounts", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isEnabled") & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

@end
