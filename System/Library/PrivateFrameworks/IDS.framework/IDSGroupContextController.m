@implementation IDSGroupContextController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_seal, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  self->_delegate = 0;
  +[IDSDaemonProtocolController sharedInstance](IDSDaemonProtocolController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "observer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeDelegate:", self);

  v5.receiver = self;
  v5.super_class = (Class)IDSGroupContextController;
  -[IDSGroupContextController dealloc](&v5, sel_dealloc);
}

- (IDSGroupContextController)initWithServiceName:(id)a3 queue:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  IDSGroupContextControllerDelegate *v11;
  NSObject *v12;
  IDSGroupContextController *v13;
  IDSGroupContextController *v14;
  IDSGroupContextController *v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = (IDSGroupContextControllerDelegate *)a5;
  if (_IDSRunningInDaemon())
  {
    objc_msgSend(MEMORY[0x1E0D1F458], "groupContext");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907E8578((uint64_t)self, v12);

    v13 = 0;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)IDSGroupContextController;
    v14 = -[IDSGroupContextController init](&v17, sel_init);
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_queue, a4);
      v15->_delegate = v11;
      objc_storeStrong((id *)&v15->_serviceName, a3);
    }
    self = v15;
    v13 = self;
  }

  return v13;
}

- (void)groupContextWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_19073FC3C;
  v6[3] = &unk_1E2C62740;
  v7 = v4;
  v5 = v4;
  -[IDSGroupContextController _contentWithCompletion:](self, "_contentWithCompletion:", v6);

}

- (void)scheduleTransactionLogTask:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[IDSGroupContextController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[IDSGroupContextController queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[IDSTransactionLogTaskHandler handlerWithTask:delegate:queue:](IDSTransactionLogTaskHandler, "handlerWithTask:delegate:queue:", v4, self, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "perform");
}

- (void)taskHandler:(id)a3 groupsWithGroupIDs:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  IDSGroupContextController *v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  -[IDSGroupContextController queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  objc_msgSend(MEMORY[0x1E0D1F458], "groupContext");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v18 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_INFO, "Fetching groups from groupIDs {groupIDs.count: %ld}", buf, 0xCu);
  }

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_19073FE80;
  v13[3] = &unk_1E2C627E0;
  v14 = v7;
  v15 = self;
  v16 = v8;
  v11 = v8;
  v12 = v7;
  -[IDSGroupContextController groupContextWithCompletion:](self, "groupContextWithCompletion:", v13);

}

- (void)taskHandler:(id)a3 participantsWithDestinations:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v7 = a5;
  v8 = a4;
  -[IDSGroupContextController queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  +[IDSIDQueryController sharedInstance](IDSIDQueryController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSGroupContextController queue](self, "queue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_190740404;
  v13[3] = &unk_1E2C62808;
  v13[4] = self;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v10, "participantsForDestinations:service:listenerID:queue:completionBlock:", v8, CFSTR("com.apple.madrid"), CFSTR("kIDSGroupContextControllerListenerID"), v11, v13);

}

- (void)taskHandler:(id)a3 messagesFromToken:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[16];

  v7 = a4;
  v8 = a5;
  -[IDSGroupContextController queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  objc_msgSend(MEMORY[0x1E0D1F458], "groupContext");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_INFO, "Fetching transport log messages", buf, 2u);
  }

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_19074056C;
  v13[3] = &unk_1E2C62858;
  v14 = v7;
  v15 = v8;
  v11 = v8;
  v12 = v7;
  -[IDSGroupContextController _contentWithCompletion:](self, "_contentWithCompletion:", v13);

}

- (void)taskHandler:(id)a3 persistToken:(id)a4 completion:(id)a5
{
  void *v6;
  void (**v7)(id, _QWORD);
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0CB36F8];
  v7 = (void (**)(id, _QWORD))a5;
  objc_msgSend(v6, "archivedDataWithRootObject:requiringSecureCoding:error:", a4, 0, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("kIDSGroupContextControllerPersistedToken"));

  v7[2](v7, 0);
}

- (void)persistedTokenForTaskHandler:(id)a3 completion:(id)a4
{
  (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
}

- (void)taskHandler:(id)a3 accountInfoForAliases:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_19074082C;
  v11[3] = &unk_1E2C62880;
  v11[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  -[IDSGroupContextController _contentWithCompletion:](self, "_contentWithCompletion:", v11);

}

- (void)didCreateGroup:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[IDSGroupContextController queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_190740A70;
  block[3] = &unk_1E2C60730;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)didCacheGroup:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[IDSGroupContextController queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_190740BBC;
  block[3] = &unk_1E2C60730;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)didUpdateGroup:(id)a3 withNewGroup:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
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
  -[IDSGroupContextController queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_190740D30;
  v15[3] = &unk_1E2C61008;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)didReceiveDecryptionFailureForGroup:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[IDSGroupContextController queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_190740E94;
  block[3] = &unk_1E2C60730;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)didReceiveRegistrationIdentityUpdateWithCompletion:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[IDSGroupContextController queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_190740F90;
  block[3] = &unk_1E2C60550;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)qSetupSeal
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc(MEMORY[0x1E0D13210]);
  -[IDSGroupContextController queue](self, "queue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "initWithQueue:", v5);
  -[IDSGroupContextController setSeal:](self, "setSeal:", v4);

}

- (void)qGroupContextWithDeviceIdentity:(id)a3 completion:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  IDSGroupContextDataSource *v10;
  void *v11;
  IDSGroupContextDataSource *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  IDSGroupContextControllerContent *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  IDSGroupContextController *v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0D1F430];
  v6 = a3;
  v7 = [v5 alloc];
  objc_msgSend(v6, "accountIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithAccountKey:deviceKey:", v8, v6);

  v10 = [IDSGroupContextDataSource alloc];
  -[IDSGroupContextController queue](self, "queue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[IDSGroupContextDataSource initWithQueue:](v10, "initWithQueue:", v11);

  v13 = objc_alloc(MEMORY[0x1E0D1F440]);
  -[IDSGroupContextController queue](self, "queue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithAccountIdentity:dataSource:queue:", v9, v12, v14);

  objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", self);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x1E0D1F448]);
  -[IDSGroupContextController queue](self, "queue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithQueue:", v18);

  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = sub_19074132C;
  v29 = &unk_1E2C628D0;
  v20 = v16;
  v30 = v20;
  v31 = self;
  objc_msgSend(v19, "setOnGroupCreate:", &v26);
  objc_msgSend(v15, "appendMiddleware:", v19, v26, v27, v28, v29);
  objc_msgSend(v15, "appendMiddleware:", v12);
  v21 = objc_alloc_init(IDSGroupContextControllerContent);
  -[IDSGroupContextControllerContent setGroupContext:](v21, "setGroupContext:", v15);
  -[IDSGroupContextControllerContent setAccountIdentity:](v21, "setAccountIdentity:", v9);
  -[IDSGroupContextController seal](self, "seal");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "fulfillWithValue:", v21);

  +[IDSDaemonProtocolController sharedInstance](IDSDaemonProtocolController, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "observer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addDelegate:", self);

  objc_msgSend(MEMORY[0x1E0D1F458], "groupContext");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v15;
    _os_log_impl(&dword_1906E0000, v25, OS_LOG_TYPE_INFO, "Group Context Created %@", buf, 0xCu);
  }

}

- (void)_contentWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[IDSGroupContextController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[IDSGroupContextController seal](self, "seal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    -[IDSGroupContextController qSetupSeal](self, "qSetupSeal");
  -[IDSGroupContextController seal](self, "seal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "promise");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_19074147C;
  v10[3] = &unk_1E2C628F8;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "registerResultBlock:", v10);

}

- (IDSGroupContextControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (IDSGroupContextControllerDelegate *)a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CUTPromiseSeal)seal
{
  return self->_seal;
}

- (void)setSeal:(id)a3
{
  objc_storeStrong((id *)&self->_seal, a3);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

@end
