@implementation IDSAccountController

- (void)dealloc
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  objc_super v18;
  _QWORD v19[5];
  _QWORD v20[5];
  _IDSAccountController *v21;

  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_1907EA6F8((uint64_t)self, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_1907EA694((uint64_t)self, v10, v11, v12, v13, v14, v15, v16);

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = sub_1906EE254;
  v20[4] = sub_1906EE0FC;
  v21 = (_IDSAccountController *)0xAAAAAAAAAAAAAAAALL;
  v21 = self->_internal;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1906E27C4;
  v19[3] = &unk_1E2C602E0;
  v19[4] = v20;
  objc_msgSend(v17, "performBlock:waitUntilDone:", v19, 0);

  _Block_object_dispose(v20, 8);
  v18.receiver = self;
  v18.super_class = (Class)IDSAccountController;
  -[IDSAccountController dealloc](&v18, sel_dealloc);
}

- (id)_internal
{
  void *v3;
  int v4;
  NSObject *v5;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907EA75C();

  }
  return self->_internal;
}

- (id)_initWithService:(id)a3 onIDSQueue:(BOOL)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  int v12;
  IDSAccountController *v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t *);
  void *v21;
  id v22;
  IDSAccountController *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  objc_super v36;

  v4 = a4;
  v6 = a3;
  if (_IDSRunningInDaemon())
  {
    +[IDSLogging IDSAccountController](IDSLogging, "IDSAccountController");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907EA2F8((uint64_t)self, v7);

    v4 = 0;
    goto LABEL_21;
  }
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((_DWORD)v4)
  {
    v10 = objc_msgSend(v8, "assertQueueIsCurrent");

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_1907EA38C();
LABEL_12:

    }
  }
  else
  {
    v12 = objc_msgSend(v8, "assertQueueIsNotCurrent");

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_1907EA41C();
      goto LABEL_12;
    }
  }
  v36.receiver = self;
  v36.super_class = (Class)IDSAccountController;
  v13 = -[IDSAccountController init](&v36, sel_init);
  if (!v13)
    goto LABEL_20;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_1906EE254;
  v34 = sub_1906EE0FC;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = sub_1906ED514;
  v21 = &unk_1E2C62428;
  v24 = &v30;
  v22 = v6;
  v25 = &v26;
  self = v13;
  v23 = self;
  v14 = MEMORY[0x19400FE1C](&v18);
  v15 = (void *)v14;
  if ((v4 & 1) != 0)
  {
    (*(void (**)(uint64_t))(v14 + 16))(v14);
  }
  else
  {
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance", v18, v19, v20, v21, v22);
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v4, "performBlock:waitUntilDone:", v15, 1);

  }
  v16 = *((unsigned __int8 *)v27 + 24);
  if (*((_BYTE *)v27 + 24))
    v4 = (uint64_t)(id)v31[5];

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  if (!v16)
  {
LABEL_20:
    self = v13;
    v4 = (uint64_t)self;
  }
LABEL_21:

  return (id)v4;
}

- (id)_initWithService:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  id v8;

  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907EA57C();

  }
  v8 = -[IDSAccountController _initWithService:onIDSQueue:](self, "_initWithService:onIDSQueue:", v4, 1);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

- (IDSAccountController)initWithService:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  IDSAccountController *v8;

  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsNotCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907EA608();

  }
  v8 = -[IDSAccountController _initWithService:onIDSQueue:](self, "_initWithService:onIDSQueue:", v4, 0);

  return v8;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_190734A00;
  v11[3] = &unk_1E2C602B8;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlock:waitUntilDone:", v11, 1);

}

- (void)removeDelegate:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[6];

  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_190734AA4;
  v6[3] = &unk_1E2C61180;
  v6[4] = self;
  v6[5] = v4;
  objc_msgSend(v5, "performBlock:waitUntilDone:", v6, 1);

}

- (NSSet)accounts
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "blockUntilConnected");

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1906EE254;
  v12 = sub_1906EE0FC;
  v13 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_190734BB8;
  v7[3] = &unk_1E2C60308;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlock:waitUntilDone:", v7, 1);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSSet *)v5;
}

- (id)enabledAccounts
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "blockUntilConnected");

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1906EE254;
  v12 = sub_1906EE0FC;
  v13 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_190734CFC;
  v7[3] = &unk_1E2C60308;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlock:waitUntilDone:", v7, 1);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)serviceName
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "blockUntilConnected");

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1906EE254;
  v12 = sub_1906EE0FC;
  v13 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_190734E40;
  v7[3] = &unk_1E2C60308;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlock:waitUntilDone:", v7, 1);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)accountWithLoginID:(id)a3 service:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "blockUntilConnected");

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1906EE254;
  v22 = sub_1906EE0FC;
  v23 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_190734FD8;
  v14[3] = &unk_1E2C61360;
  v17 = &v18;
  v14[4] = self;
  v10 = v6;
  v15 = v10;
  v11 = v7;
  v16 = v11;
  objc_msgSend(v9, "performBlock:waitUntilDone:", v14, 1);

  v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

- (id)accountWithUniqueID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blockUntilConnected");

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1906EE254;
  v17 = sub_1906EE0FC;
  v18 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_190735148;
  v10[3] = &unk_1E2C60780;
  v12 = &v13;
  v10[4] = self;
  v7 = v4;
  v11 = v7;
  objc_msgSend(v6, "performBlock:waitUntilDone:", v10, 1);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)setupAccountWithLoginID:(id)a3 aliases:(id)a4 password:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_190735290;
  v19[3] = &unk_1E2C62450;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  objc_msgSend(v14, "performBlock:", v19);

}

- (void)setupAccountWithLoginID:(id)a3 password:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_190735390;
  v15[3] = &unk_1E2C61008;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "performBlock:", v15);

}

- (void)setupAccountWithSetupParameters:(id)a3 aliases:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v9;
    _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "* Request to setup account with aliases: %@ and parameters:", buf, 0xCu);
  }

  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &unk_1E2C5F9D0);
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_19073563C;
  v16[3] = &unk_1E2C61008;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v12, "performBlock:", v16);

}

- (void)addAccount:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[IDSAccountController serviceName](self, "serviceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v12 = v4;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "* Request to add account: %@   service: %@", buf, 0x16u);

  }
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_190735790;
  v9[3] = &unk_1E2C607A8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "performBlock:", v9);

}

- (void)removeAccount:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[IDSAccountController serviceName](self, "serviceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v12 = v4;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "* Request to remove account: %@   service: %@", buf, 0x16u);

  }
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1907358DC;
  v9[3] = &unk_1E2C607A8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "performBlock:", v9);

}

- (void)_removeAccount:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_190735984;
  v7[3] = &unk_1E2C607A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)enableAccount:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel__enableAccount_);
}

- (void)disableAccount:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel__disableAccount_);
}

- (void)_enableAccount:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[IDSAccountController serviceName](self, "serviceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v12 = v4;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "* Request to enable account: %@   service: %@", buf, 0x16u);

  }
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_190735AD8;
  v9[3] = &unk_1E2C607A8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "performBlock:", v9);

}

- (void)_disableAccount:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[IDSAccountController serviceName](self, "serviceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v12 = v4;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "* Request to disable account: %@   service: %@", buf, 0x16u);

  }
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_190735C24;
  v9[3] = &unk_1E2C607A8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "performBlock:", v9);

}

@end
