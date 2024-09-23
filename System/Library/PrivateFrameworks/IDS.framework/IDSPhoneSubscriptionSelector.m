@implementation IDSPhoneSubscriptionSelector

- (IDSPhoneSubscriptionSelector)init
{
  return (IDSPhoneSubscriptionSelector *)MEMORY[0x1E0DE7D20](self, sel_initWithSyncDaemonControllerBuilder_);
}

- (IDSPhoneSubscriptionSelector)initWithSyncDaemonControllerBuilder:(id)a3
{
  id v4;
  IDSPhoneSubscriptionSelector *v5;
  uint64_t v6;
  id syncDaemonControllerBuilder;
  IDSPhoneSubscriptionSelector *v8;
  objc_super v10;

  v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)IDSPhoneSubscriptionSelector;
    v5 = -[IDSPhoneSubscriptionSelector init](&v10, sel_init);
    if (v5)
    {
      v6 = MEMORY[0x19400FE1C](v4);
      syncDaemonControllerBuilder = v5->_syncDaemonControllerBuilder;
      v5->_syncDaemonControllerBuilder = (id)v6;

    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)requestSelectedSubscriptionsWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  NSObject *v14;
  uint8_t buf[16];

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "Requesting selected subscriptions with completion", buf, 2u);
    }

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1907A16EC;
    v13[3] = &unk_1E2C64290;
    v14 = v3;
    sub_1907A1644(v13, v14);
    v5 = v14;
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_1907F8AFC(v5, v6, v7, v8, v9, v10, v11, v12);
  }

}

- (void)selectSubscription:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  NSObject *v27;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v5;
        _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Selecting subscription with completion {subscription: %@}", buf, 0xCu);
      }

      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = sub_1907A18E0;
      v26[3] = &unk_1E2C642B8;
      v27 = v5;
      v28 = v6;
      sub_1907A1644(v26, v28);

      v9 = v27;
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1907F8BDC(v8, v17, v18, v19, v20, v21, v22, v23);

      v24 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0CB2938];
      v32[0] = CFSTR("Subscription info is nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("IDSPhoneSubscriptionSelectorErrorDomain"), 300, v9);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v25);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1907F8B6C(v9, v10, v11, v12, v13, v14, v15, v16);
  }

}

- (void)unselectSubscription:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  NSObject *v27;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v5;
        _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Unselecting subscription with completion {subscription: %@}", buf, 0xCu);
      }

      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = sub_1907A1AD4;
      v26[3] = &unk_1E2C642B8;
      v27 = v5;
      v28 = v6;
      sub_1907A1644(v26, v28);

      v9 = v27;
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1907F8CBC(v8, v17, v18, v19, v20, v21, v22, v23);

      v24 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0CB2938];
      v32[0] = CFSTR("Subscription info is nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("IDSPhoneSubscriptionSelectorErrorDomain"), 300, v9);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v25);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1907F8C4C(v9, v10, v11, v12, v13, v14, v15, v16);
  }

}

- (void)setSelectedSubscriptions:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  NSObject *v27;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v5;
        _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Setting selected subscriptions with completion {subscriptions: %@}", buf, 0xCu);
      }

      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = sub_1907A1CC8;
      v26[3] = &unk_1E2C642B8;
      v27 = v5;
      v28 = v6;
      sub_1907A1644(v26, v28);

      v9 = v27;
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1907F8D9C(v8, v17, v18, v19, v20, v21, v22, v23);

      v24 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0CB2938];
      v32[0] = CFSTR("Subscription infos is nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("IDSPhoneSubscriptionSelectorErrorDomain"), 300, v9);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v25);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1907F8D2C(v9, v10, v11, v12, v13, v14, v15, v16);
  }

}

- (void)removeTemporaryPhoneAlias:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  NSObject *v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v5;
        _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Removing temporary phone alias with completion {alias: %@}", buf, 0xCu);
      }

      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = sub_1907A1EC4;
      v26[3] = &unk_1E2C61F88;
      v28 = v6;
      v27 = v5;
      +[IDSXPCDaemonController performDaemonControllerTask:](IDSXPCDaemonController, "performDaemonControllerTask:", v26);

      v9 = v28;
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1907F8E7C(v8, v17, v18, v19, v20, v21, v22, v23);

      v24 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0CB2938];
      v32[0] = CFSTR("Alias is nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("IDSPhoneSubscriptionSelectorErrorDomain"), 300, v9);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v25);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1907F8E0C(v9, v10, v11, v12, v13, v14, v15, v16);
  }

}

- (void)disableTemporaryPhoneAlias:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  NSObject *v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v5;
        _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Disabling temporary phone alias with completion {alias: %@}", buf, 0xCu);
      }

      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = sub_1907A21B4;
      v26[3] = &unk_1E2C61F88;
      v28 = v6;
      v27 = v5;
      +[IDSXPCDaemonController performDaemonControllerTask:](IDSXPCDaemonController, "performDaemonControllerTask:", v26);

      v9 = v28;
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1907F8FBC(v8, v17, v18, v19, v20, v21, v22, v23);

      v24 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0CB2938];
      v32[0] = CFSTR("Alias is nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("IDSPhoneSubscriptionSelectorErrorDomain"), 300, v9);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v25);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1907F8F4C(v9, v10, v11, v12, v13, v14, v15, v16);
  }

}

- (void)enableTemporaryPhoneAlias:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  NSObject *v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v5;
        _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Enabling temporary phone alias with completion {alias: %@}", buf, 0xCu);
      }

      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = sub_1907A24A4;
      v26[3] = &unk_1E2C61F88;
      v28 = v6;
      v27 = v5;
      +[IDSXPCDaemonController performDaemonControllerTask:](IDSXPCDaemonController, "performDaemonControllerTask:", v26);

      v9 = v28;
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1907F909C(v8, v17, v18, v19, v20, v21, v22, v23);

      v24 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0CB2938];
      v32[0] = CFSTR("Alias is nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("IDSPhoneSubscriptionSelectorErrorDomain"), 300, v9);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v25);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1907F902C(v9, v10, v11, v12, v13, v14, v15, v16);
  }

}

- (void)requestUnselectedTemporaryPhoneAliasesWithError:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  NSObject *v14;
  uint8_t buf[16];

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "Requesting unselected temporary phone aliases with completion", buf, 2u);
    }

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1907A2684;
    v13[3] = &unk_1E2C64290;
    v14 = v3;
    sub_1907A1644(v13, v14);
    v5 = v14;
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_1907F910C(v5, v6, v7, v8, v9, v10, v11, v12);
  }

}

- (id)selectedSubscriptionsWithError:(id *)a3
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[7];
  uint8_t buf[16];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_1906EE2D4;
  v27 = sub_1906EE13C;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1906EE2D4;
  v21 = sub_1906EE13C;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "Requesting selected subscriptions synchronously", buf, 2u);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1907A2880;
  v11[3] = &unk_1E2C64308;
  v11[4] = &v17;
  v11[5] = &v23;
  v11[6] = &v13;
  -[IDSPhoneSubscriptionSelector _performSyncAction:](self, "_performSyncAction:", v11);
  if (!*((_BYTE *)v14 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IDSPhoneSubscriptionSelectorErrorDomain"), 100, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v24[5];
    v24[5] = v6;

  }
  if (a3)
  {
    v8 = (void *)v24[5];
    if (v8)
      *a3 = objc_retainAutorelease(v8);
  }
  v9 = (id)v18[5];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v9;
}

- (id)selectSubscription:(id)a3 withError:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, void *, uint64_t);
  void *v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint8_t buf[8];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v41 = 0;
    v42 = &v41;
    v43 = 0x3032000000;
    v44 = sub_1906EE2D4;
    v45 = sub_1906EE13C;
    v46 = 0;
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = sub_1906EE2D4;
    v39 = sub_1906EE13C;
    v40 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "Selecting subscription synchronously", buf, 2u);
    }

    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = sub_1907A2C64;
    v25 = &unk_1E2C64330;
    v26 = v6;
    v27 = &v35;
    v28 = &v41;
    v29 = &v31;
    -[IDSPhoneSubscriptionSelector _performSyncAction:](self, "_performSyncAction:", &v22);
    if (!*((_BYTE *)v32 + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IDSPhoneSubscriptionSelectorErrorDomain"), 100, 0, v22, v23, v24, v25);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v42[5];
      v42[5] = v8;

    }
    if (a4)
    {
      v10 = (void *)v42[5];
      if (v10)
        *a4 = objc_retainAutorelease(v10);
    }
    a4 = (id *)(id)v36[5];

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v35, 8);

    _Block_object_dispose(&v41, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1907F917C(v11, v12, v13, v14, v15, v16, v17, v18);

    if (a4)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v47 = *MEMORY[0x1E0CB2938];
      v48[0] = CFSTR("Subscription info is nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("IDSPhoneSubscriptionSelectorErrorDomain"), 300, v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }

  return a4;
}

- (id)unselectSubscription:(id)a3 withError:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, void *, uint64_t);
  void *v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint8_t buf[8];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v41 = 0;
    v42 = &v41;
    v43 = 0x3032000000;
    v44 = sub_1906EE2D4;
    v45 = sub_1906EE13C;
    v46 = 0;
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = sub_1906EE2D4;
    v39 = sub_1906EE13C;
    v40 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "Unselecting subscription synchronously", buf, 2u);
    }

    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = sub_1907A304C;
    v25 = &unk_1E2C64330;
    v26 = v6;
    v27 = &v35;
    v28 = &v41;
    v29 = &v31;
    -[IDSPhoneSubscriptionSelector _performSyncAction:](self, "_performSyncAction:", &v22);
    if (!*((_BYTE *)v32 + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IDSPhoneSubscriptionSelectorErrorDomain"), 100, 0, v22, v23, v24, v25);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v42[5];
      v42[5] = v8;

    }
    if (a4)
    {
      v10 = (void *)v42[5];
      if (v10)
        *a4 = objc_retainAutorelease(v10);
    }
    a4 = (id *)(id)v36[5];

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v35, 8);

    _Block_object_dispose(&v41, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1907F91EC(v11, v12, v13, v14, v15, v16, v17, v18);

    if (a4)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v47 = *MEMORY[0x1E0CB2938];
      v48[0] = CFSTR("Subscription info is nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("IDSPhoneSubscriptionSelectorErrorDomain"), 300, v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }

  return a4;
}

- (id)setSelectedSubscriptions:(id)a3 withError:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, void *, uint64_t);
  void *v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint8_t buf[8];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v41 = 0;
    v42 = &v41;
    v43 = 0x3032000000;
    v44 = sub_1906EE2D4;
    v45 = sub_1906EE13C;
    v46 = 0;
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = sub_1906EE2D4;
    v39 = sub_1906EE13C;
    v40 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "Setting selected subscriptions synchronously", buf, 2u);
    }

    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = sub_1907A3434;
    v25 = &unk_1E2C64330;
    v26 = v6;
    v27 = &v35;
    v28 = &v41;
    v29 = &v31;
    -[IDSPhoneSubscriptionSelector _performSyncAction:](self, "_performSyncAction:", &v22);
    if (!*((_BYTE *)v32 + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IDSPhoneSubscriptionSelectorErrorDomain"), 100, 0, v22, v23, v24, v25);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v42[5];
      v42[5] = v8;

    }
    if (a4)
    {
      v10 = (void *)v42[5];
      if (v10)
        *a4 = objc_retainAutorelease(v10);
    }
    a4 = (id *)(id)v36[5];

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v35, 8);

    _Block_object_dispose(&v41, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1907F925C(v11, v12, v13, v14, v15, v16, v17, v18);

    if (a4)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v47 = *MEMORY[0x1E0CB2938];
      v48[0] = CFSTR("Subscription info is nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("IDSPhoneSubscriptionSelectorErrorDomain"), 300, v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }

  return a4;
}

- (BOOL)removeTemporaryPhoneAlias:(id)a3 withError:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, void *, uint64_t);
  void *v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[4];
  id v45;
  uint64_t v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = sub_1906EE2D4;
    v42 = sub_1906EE13C;
    v43 = 0;
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 0;
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 0;
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v6;
      _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "Removing temporary phone alias synchronously {alias: %@}", buf, 0xCu);
    }

    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = sub_1907A381C;
    v25 = &unk_1E2C64330;
    v26 = v6;
    v27 = &v34;
    v28 = &v38;
    v29 = &v30;
    -[IDSPhoneSubscriptionSelector _performSyncAction:](self, "_performSyncAction:", &v22);
    if (!*((_BYTE *)v31 + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IDSPhoneSubscriptionSelectorErrorDomain"), 100, 0, v22, v23, v24, v25);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v39[5];
      v39[5] = v8;

    }
    if (a4)
    {
      v10 = (void *)v39[5];
      if (v10)
        *a4 = objc_retainAutorelease(v10);
    }
    LOBYTE(a4) = *((_BYTE *)v35 + 24) != 0;

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v38, 8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1907F92CC(v11, v12, v13, v14, v15, v16, v17, v18);

    if (a4)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v46 = *MEMORY[0x1E0CB2938];
      v47[0] = CFSTR("Alias is nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("IDSPhoneSubscriptionSelectorErrorDomain"), 300, v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a4) = 0;
    }
  }

  return (char)a4;
}

- (BOOL)enableTemporaryPhoneAlias:(id)a3 withError:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, void *, uint64_t);
  void *v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[4];
  id v45;
  uint64_t v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = sub_1906EE2D4;
    v42 = sub_1906EE13C;
    v43 = 0;
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 0;
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 0;
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v6;
      _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "Enabling temporary phone alias synchronously {alias: %@}", buf, 0xCu);
    }

    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = sub_1907A3BF0;
    v25 = &unk_1E2C64330;
    v26 = v6;
    v27 = &v34;
    v28 = &v38;
    v29 = &v30;
    -[IDSPhoneSubscriptionSelector _performSyncAction:](self, "_performSyncAction:", &v22);
    if (!*((_BYTE *)v31 + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IDSPhoneSubscriptionSelectorErrorDomain"), 100, 0, v22, v23, v24, v25);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v39[5];
      v39[5] = v8;

    }
    if (a4)
    {
      v10 = (void *)v39[5];
      if (v10)
        *a4 = objc_retainAutorelease(v10);
    }
    LOBYTE(a4) = *((_BYTE *)v35 + 24) != 0;

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v38, 8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1907F933C(v11, v12, v13, v14, v15, v16, v17, v18);

    if (a4)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v46 = *MEMORY[0x1E0CB2938];
      v47[0] = CFSTR("Alias is nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("IDSPhoneSubscriptionSelectorErrorDomain"), 300, v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a4) = 0;
    }
  }

  return (char)a4;
}

- (BOOL)disableTemporaryPhoneAlias:(id)a3 withError:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, void *, uint64_t);
  void *v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[4];
  id v45;
  uint64_t v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = sub_1906EE2D4;
    v42 = sub_1906EE13C;
    v43 = 0;
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 0;
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 0;
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v6;
      _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "Disabling temporary phone alias synchronously {alias: %@}", buf, 0xCu);
    }

    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = sub_1907A3FC4;
    v25 = &unk_1E2C64330;
    v26 = v6;
    v27 = &v34;
    v28 = &v38;
    v29 = &v30;
    -[IDSPhoneSubscriptionSelector _performSyncAction:](self, "_performSyncAction:", &v22);
    if (!*((_BYTE *)v31 + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IDSPhoneSubscriptionSelectorErrorDomain"), 100, 0, v22, v23, v24, v25);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v39[5];
      v39[5] = v8;

    }
    if (a4)
    {
      v10 = (void *)v39[5];
      if (v10)
        *a4 = objc_retainAutorelease(v10);
    }
    LOBYTE(a4) = *((_BYTE *)v35 + 24) != 0;

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v38, 8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1907F93AC(v11, v12, v13, v14, v15, v16, v17, v18);

    if (a4)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v46 = *MEMORY[0x1E0CB2938];
      v47[0] = CFSTR("Alias is nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("IDSPhoneSubscriptionSelectorErrorDomain"), 300, v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a4) = 0;
    }
  }

  return (char)a4;
}

- (id)unselectedTemporaryPhoneAliasesWithError:(id *)a3
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[7];
  uint8_t buf[16];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_1906EE2D4;
  v27 = sub_1906EE13C;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1906EE2D4;
  v21 = sub_1906EE13C;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "Requesting unselected temporary aliases synchronously", buf, 2u);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1907A42A0;
  v11[3] = &unk_1E2C64308;
  v11[4] = &v17;
  v11[5] = &v23;
  v11[6] = &v13;
  -[IDSPhoneSubscriptionSelector _performSyncAction:](self, "_performSyncAction:", v11);
  if (!*((_BYTE *)v14 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IDSPhoneSubscriptionSelectorErrorDomain"), 100, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v24[5];
    v24[5] = v6;

  }
  if (a3)
  {
    v8 = (void *)v24[5];
    if (v8)
      *a3 = objc_retainAutorelease(v8);
  }
  v9 = (id)v18[5];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v9;
}

- (void)_performSyncAction:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  id syncDaemonController;
  void (**syncDaemonControllerBuilder)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  uint64_t v22;
  _QWORD v23[4];
  id v24;

  v4 = (void (**)(id, void *, _QWORD))a3;
  syncDaemonController = self->_syncDaemonController;
  if (!syncDaemonController)
  {
    syncDaemonControllerBuilder = (void (**)(id, void *))self->_syncDaemonControllerBuilder;
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "queue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    syncDaemonControllerBuilder[2](syncDaemonControllerBuilder, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self->_syncDaemonController;
    self->_syncDaemonController = v9;

    syncDaemonController = self->_syncDaemonController;
  }
  v22 = 0;
  v23[0] = &v22;
  v23[1] = 0x3032000000;
  v23[2] = sub_1906EE2D4;
  v23[3] = sub_1906EE13C;
  v24 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_1907A4548;
  v21[3] = &unk_1E2C61FD0;
  v21[4] = &v22;
  objc_msgSend(syncDaemonController, "registrationCollaboratorWithErrorHandler:", v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(v23[0] + 40))
  {
    v12 = self->_syncDaemonController;
    self->_syncDaemonController = 0;

    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1907F941C((uint64_t)v23, v13, v14, v15, v16, v17, v18, v19);

    v11 = 0;
    v20 = *(_QWORD *)(v23[0] + 40);
  }
  else
  {
    v20 = 0;
  }
  v4[2](v4, v11, v20);

  _Block_object_dispose(&v22, 8);
}

- (IDSXPCDaemonController)syncDaemonController
{
  return (IDSXPCDaemonController *)self->_syncDaemonController;
}

- (void)setSyncDaemonController:(id)a3
{
  objc_storeStrong(&self->_syncDaemonController, a3);
}

- (id)syncDaemonControllerBuilder
{
  return self->_syncDaemonControllerBuilder;
}

- (void)setSyncDaemonControllerBuilder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_syncDaemonControllerBuilder, 0);
  objc_storeStrong(&self->_syncDaemonController, 0);
}

@end
