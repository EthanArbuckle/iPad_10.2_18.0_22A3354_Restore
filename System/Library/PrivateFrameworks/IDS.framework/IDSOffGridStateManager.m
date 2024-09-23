@implementation IDSOffGridStateManager

- (IDSOffGridStateManager)initWithQueue:(id)a3 error:(id *)a4
{
  id v7;
  IDSOffGridStateManager *v8;
  IDSOffGridStateManager *v9;
  uint64_t v10;
  NSString *uuid;
  NSMutableSet *v12;
  NSMutableSet *invitedHandles;
  IDSOffGridStateManager *v14;
  id v15;
  void *v16;
  objc_super v18;

  v7 = a3;
  if (v7)
  {
    v18.receiver = self;
    v18.super_class = (Class)IDSOffGridStateManager;
    v8 = -[IDSOffGridStateManager init](&v18, sel_init);
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_queue, a3);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
      v10 = objc_claimAutoreleasedReturnValue();
      uuid = v9->_uuid;
      v9->_uuid = (NSString *)v10;

      v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      invitedHandles = v9->_invitedHandles;
      v9->_invitedHandles = v12;

      -[IDSOffGridStateManager _daemonControllerSetup](v9, "_daemonControllerSetup");
    }
    self = v9;
    v14 = self;
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0C99D80]);
    v16 = (void *)objc_msgSend(v15, "initWithObjectsAndKeys:", CFSTR("The queue specified is nil."), *MEMORY[0x1E0CB2D50], 0);
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("IDSOffGridStatusErrorDomain"), 3, v16);

    v14 = 0;
  }

  return v14;
}

- (void)_daemonControllerSetup
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_19072D110;
  v3[3] = &unk_1E2C60B88;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "performBlock:", v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_setupInterruptionHandler
{
  IDSXPCDaemonController *daemonController;
  _QWORD v4[4];
  id v5;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  daemonController = self->_daemonController;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_19072D234;
  v4[3] = &unk_1E2C60B88;
  objc_copyWeak(&v5, &location);
  -[IDSXPCDaemonController addInterruptionHandler:forTarget:](daemonController, "addInterruptionHandler:forTarget:", v4, self);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_setupXPC
{
  NSObject *v3;
  void *v4;
  IDSXPCDaemonController *daemonController;
  _QWORD v6[4];
  id v7;
  _BYTE buf[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D34D40], "IDSOffGridStateManager");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[IDSOffGridStateManager uuid](self, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl(&dword_1906E0000, v3, OS_LOG_TYPE_DEFAULT, "Setting up xpc for client %@", buf, 0xCu);

  }
  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  daemonController = self->_daemonController;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_19072D468;
  v6[3] = &unk_1E2C60DD8;
  objc_copyWeak(&v7, (id *)buf);
  -[IDSXPCDaemonController performTask:](daemonController, "performTask:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)offGridStatus
{
  return MEMORY[0x1E0DE7D20](self, sel_offGridMode);
}

- (int64_t)offGridState
{
  return MEMORY[0x1E0DE7D20](self, sel_publishStatus);
}

- (int64_t)offGridMode
{
  IDSXPCDaemonController *daemonController_sync;
  IDSXPCDaemonController *v4;
  void *v5;
  void *v6;
  IDSXPCDaemonController *v7;
  IDSXPCDaemonController *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int64_t v12;
  _QWORD v14[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  daemonController_sync = self->_daemonController_sync;
  if (!daemonController_sync)
  {
    v4 = [IDSXPCDaemonController alloc];
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[IDSXPCDaemonController initSyncControllerWithQueue:](v4, "initSyncControllerWithQueue:", v6);
    v8 = self->_daemonController_sync;
    self->_daemonController_sync = v7;

    daemonController_sync = self->_daemonController_sync;
  }
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1906EE244;
  v20 = sub_1906EE0F4;
  v9 = MEMORY[0x1E0C809B0];
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_19072D710;
  v15[3] = &unk_1E2C61FD0;
  v15[4] = &v16;
  -[IDSXPCDaemonController offGridStateManagerCollaboratorWithErrorHandler:](daemonController_sync, "offGridStateManagerCollaboratorWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v17[5])
  {
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = sub_19072D784;
    v14[3] = &unk_1E2C61FF8;
    v14[4] = &v22;
    objc_msgSend(v10, "fetchCurrentOffGridMode:", v14);
  }
  v12 = v23[3];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  return v12;
}

- (int64_t)publishStatus
{
  IDSXPCDaemonController *daemonController_sync;
  IDSXPCDaemonController *v4;
  void *v5;
  void *v6;
  IDSXPCDaemonController *v7;
  IDSXPCDaemonController *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int64_t v12;
  _QWORD v14[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  daemonController_sync = self->_daemonController_sync;
  if (!daemonController_sync)
  {
    v4 = [IDSXPCDaemonController alloc];
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[IDSXPCDaemonController initSyncControllerWithQueue:](v4, "initSyncControllerWithQueue:", v6);
    v8 = self->_daemonController_sync;
    self->_daemonController_sync = v7;

    daemonController_sync = self->_daemonController_sync;
  }
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 2;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1906EE244;
  v20 = sub_1906EE0F4;
  v9 = MEMORY[0x1E0C809B0];
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_19072D9A8;
  v15[3] = &unk_1E2C61FD0;
  v15[4] = &v16;
  -[IDSXPCDaemonController offGridStateManagerCollaboratorWithErrorHandler:](daemonController_sync, "offGridStateManagerCollaboratorWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v17[5])
  {
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = sub_19072DA1C;
    v14[3] = &unk_1E2C61FF8;
    v14[4] = &v22;
    objc_msgSend(v10, "fetchCurrentPublishStatus:", v14);
  }
  v12 = v23[3];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  return v12;
}

- (void)setOffGridStatus:(int64_t)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_19072DB28;
  v10[3] = &unk_1E2C62020;
  v11 = v8;
  v9 = v8;
  -[IDSOffGridStateManager setOffGridMode:options:completion:](self, "setOffGridMode:options:completion:", a3, a4, v10);

}

- (void)setOffGridMode:(int64_t)a3 options:(id)a4 completion:(id)a5
{
  IDSOffGridModeOptions *v8;
  id v9;
  void *v10;
  id v11;
  IDSOffGridModeOptions *v12;
  _QWORD v13[5];
  IDSOffGridModeOptions *v14;
  id v15;
  id v16[2];
  id location;

  v8 = (IDSOffGridModeOptions *)a4;
  v9 = a5;
  if (!v8)
    v8 = objc_alloc_init(IDSOffGridModeOptions);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_19072DC78;
  v13[3] = &unk_1E2C620C0;
  objc_copyWeak(v16, &location);
  v11 = v9;
  v15 = v11;
  v13[4] = self;
  v16[1] = (id)a3;
  v12 = v8;
  v14 = v12;
  objc_msgSend(v10, "performBlock:", v13);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

}

- (NSMutableSet)invitedHandles
{
  IDSXPCDaemonController *v3;
  void *v4;
  void *v5;
  IDSXPCDaemonController *v6;
  IDSXPCDaemonController *daemonController_sync;
  uint64_t v8;
  IDSXPCDaemonController *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  if (!self->_daemonController_sync)
  {
    v3 = [IDSXPCDaemonController alloc];
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[IDSXPCDaemonController initSyncControllerWithQueue:](v3, "initSyncControllerWithQueue:", v5);
    daemonController_sync = self->_daemonController_sync;
    self->_daemonController_sync = v6;

  }
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_1906EE244;
  v26 = sub_1906EE0F4;
  v27 = (id)0xAAAAAAAAAAAAAAAALL;
  v27 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1906EE244;
  v20 = sub_1906EE0F4;
  v21 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v9 = self->_daemonController_sync;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_19072E220;
  v15[3] = &unk_1E2C61FD0;
  v15[4] = &v16;
  -[IDSXPCDaemonController offGridStateManagerCollaboratorWithErrorHandler:](v9, "offGridStateManagerCollaboratorWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v17[5])
  {
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = sub_19072E294;
    v14[3] = &unk_1E2C620E8;
    v14[4] = &v22;
    objc_msgSend(v10, "invitedHandlesWithCompletion:", v14);
  }
  v12 = (id)v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return (NSMutableSet *)v12;
}

- (void)invitedHandlesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = sub_1906EE244;
  v11[4] = sub_1906EE0F4;
  v12 = (id)0xAAAAAAAAAAAAAAAALL;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_19072E444;
  v7[3] = &unk_1E2C621B0;
  objc_copyWeak(&v10, &location);
  v6 = v4;
  v7[4] = self;
  v8 = v6;
  v9 = v11;
  objc_msgSend(v5, "performBlock:", v7);

  objc_destroyWeak(&v10);
  _Block_object_dispose(v11, 8);

  objc_destroyWeak(&location);
}

- (void)inviteHandles:(id)a3 fromSenderHandle:(id)a4 withDictionaryPayload:(id)a5 completion:(id)a6
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
  id v24;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_19072E9D8;
  v19[3] = &unk_1E2C62250;
  objc_copyWeak(&v24, &location);
  v15 = v13;
  v23 = v15;
  v19[4] = self;
  v16 = v11;
  v20 = v16;
  v17 = v12;
  v21 = v17;
  v18 = v10;
  v22 = v18;
  objc_msgSend(v14, "performBlock:", v19);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

- (void)removeInvitedHandles:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_19072F028;
  v11[3] = &unk_1E2C62278;
  objc_copyWeak(&v14, &location);
  v9 = v7;
  v13 = v9;
  v11[4] = self;
  v10 = v6;
  v12 = v10;
  objc_msgSend(v8, "performBlock:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)removeAllInvitedHandlesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_19072F550;
  v7[3] = &unk_1E2C622A0;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v7[4] = self;
  v8 = v6;
  objc_msgSend(v5, "performBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)fetchContactsOfType:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11[2];
  id location;

  v6 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_19072FA64;
  v9[3] = &unk_1E2C622F0;
  objc_copyWeak(v11, &location);
  v8 = v6;
  v9[4] = self;
  v10 = v8;
  v11[1] = (id)a3;
  objc_msgSend(v7, "performBlock:", v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);

}

- (void)fetchStewieAvailabilityWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_19072FF20;
  v7[3] = &unk_1E2C622A0;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v7[4] = self;
  v8 = v6;
  objc_msgSend(v5, "performBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)connectStewieWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_190730338;
  v7[3] = &unk_1E2C622A0;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v7[4] = self;
  v8 = v6;
  objc_msgSend(v5, "performBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)disconnectStewieWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_190730724;
  v7[3] = &unk_1E2C622A0;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v7[4] = self;
  v8 = v6;
  objc_msgSend(v5, "performBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)offGridModeUpdated:(int64_t)a3 publishStatus:(int64_t)a4 error:(id)a5
{
  id v8;
  IDSOffGridModeContext *v9;
  NSObject *v10;
  id WeakRetained;
  void *v12;
  id v13;
  char v14;
  NSObject *queue;
  id v16;
  void *v17;
  id v18;
  char v19;
  NSObject *v20;
  _QWORD v21[5];
  IDSOffGridModeContext *v22;
  int64_t v23;
  int64_t v24;
  _QWORD block[5];
  IDSOffGridModeContext *v26;
  int64_t v27;
  int64_t v28;
  uint8_t buf[4];
  int64_t v30;
  __int16 v31;
  int64_t v32;
  __int16 v33;
  IDSOffGridModeContext *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = objc_alloc_init(IDSOffGridModeContext);
  -[IDSOffGridModeContext setError:](v9, "setError:", v8);

  objc_msgSend(MEMORY[0x1E0D34D40], "IDSOffGridStateManager");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v30 = a3;
    v31 = 2048;
    v32 = a4;
    v33 = 2112;
    v34 = v9;
    _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "offGridModeStatusUpdated to: %ld PublishStatus: %ld context: %@", buf, 0x20u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v12 = WeakRetained;
    v13 = objc_loadWeakRetained((id *)&self->_delegate);
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_190730C4C;
      block[3] = &unk_1E2C62368;
      block[4] = self;
      v27 = a3;
      v28 = a4;
      v26 = v9;
      dispatch_async(queue, block);

    }
  }
  v16 = objc_loadWeakRetained((id *)&self->_delegate);
  if (v16)
  {
    v17 = v16;
    v18 = objc_loadWeakRetained((id *)&self->_delegate);
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      v20 = self->_queue;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = sub_190730C90;
      v21[3] = &unk_1E2C62368;
      v21[4] = self;
      v23 = a3;
      v24 = a4;
      v22 = v9;
      dispatch_async(v20, v21);

    }
  }

}

- (void)contactInfoUpdated:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  NSObject *queue;
  _QWORD v10[4];
  id v11;
  IDSOffGridStateManager *v12;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      queue = self->_queue;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = sub_190730D9C;
      v10[3] = &unk_1E2C607A8;
      v11 = v4;
      v12 = self;
      dispatch_async(queue, v10);

    }
  }

}

- (void)setInvitedHandles:(id)a3
{
  objc_storeStrong((id *)&self->_invitedHandles, a3);
}

- (IDSXPCDaemonController)daemonController
{
  return self->_daemonController;
}

- (void)setDaemonController:(id)a3
{
  objc_storeStrong((id *)&self->_daemonController, a3);
}

- (IDSXPCDaemonController)daemonController_sync
{
  return self->_daemonController_sync;
}

- (void)setDaemonController_sync:(id)a3
{
  objc_storeStrong((id *)&self->_daemonController_sync, a3);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (IDSOffGridStateManagerDelegate)delegate
{
  return (IDSOffGridStateManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_daemonController_sync, 0);
  objc_storeStrong((id *)&self->_daemonController, 0);
  objc_storeStrong((id *)&self->_invitedHandles, 0);
}

@end
