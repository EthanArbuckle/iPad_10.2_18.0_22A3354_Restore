@implementation IDSDaemonListener

- (IDSDaemonListener)initWithQueueController:(id)a3 ivarQueue:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  IDSDaemonListener *v10;
  IDSDaemonListener *v11;
  NSObject *ivarQueue;
  uint64_t v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  if (_IDSRunningInDaemon())
  {
    +[IDSLogging DaemonListener](IDSLogging, "DaemonListener");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1907E7E84((uint64_t)self, v9);

    v10 = 0;
LABEL_9:

    goto LABEL_10;
  }
  v15.receiver = self;
  v15.super_class = (Class)IDSDaemonListener;
  v11 = -[IDSDaemonListener init](&v15, sel_init);
  v10 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_internalQueueController, a3);
    objc_storeStrong((id *)&v10->_ivarQueue, a4);
    ivarQueue = v10->_ivarQueue;
    if (ivarQueue)
      dispatch_queue_set_specific(ivarQueue, "IDSDaemonListenerContext", (void *)1, 0);
    v10->_setupComplete = 0;
    *(_WORD *)&v10->_setupInfoComplete = 0;
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38C0]), "initWithProtocol:", &unk_1EE1EC1E8);
    self = (IDSDaemonListener *)v10->_protocol;
    v10->_protocol = (NSProtocolChecker *)v13;
    goto LABEL_9;
  }
LABEL_10:

  return v10;
}

- (IDSDaemonListener)init
{
  NSObject *v3;
  IDSDaemonListener *v4;
  NSObject *v5;
  id v6;
  dispatch_queue_t v7;
  void *v8;

  if (_IDSRunningInDaemon())
  {
    +[IDSLogging DaemonListener](IDSLogging, "DaemonListener");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_1907E7E84((uint64_t)self, v3);

    v4 = 0;
  }
  else
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IDSDaemonListener-ivarQueue: %@"), self);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = dispatch_queue_create((const char *)objc_msgSend(v6, "UTF8String"), v5);

    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[IDSDaemonListener initWithQueueController:ivarQueue:](self, "initWithQueueController:ivarQueue:", v8, v7);

    v4 = self;
  }

  return v4;
}

- (void)setupCompleteWithInfo:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  IDSDaemonListener *v9;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "Setup complete with info", buf, 2u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1906E9F54;
  v7[3] = &unk_1E2C607A8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v7);

}

- (void)_callHandlersWithBlockOnIvarQueue:(id)a3 cleanup:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  IDSInternalQueueController *internalQueueController;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD *v13;
  _QWORD v14[6];
  _QWORD v15[5];
  id v16;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = sub_1906EE1C4;
    v15[4] = sub_1906EE0B4;
    v16 = 0;
    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1906E9774;
    v14[3] = &unk_1E2C60308;
    v14[4] = self;
    v14[5] = v15;
    -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v14);
    internalQueueController = self->_internalQueueController;
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = sub_1906E4E84;
    v10[3] = &unk_1E2C611A8;
    v13 = v15;
    v11 = v6;
    v12 = v7;
    -[IDSInternalQueueController performBlock:](internalQueueController, "performBlock:", v10);

    _Block_object_dispose(v15, 8);
  }

}

- (void)_setHidingDisconnect:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1906EE388;
  v3[3] = &unk_1E2C60620;
  v3[4] = self;
  v4 = a3;
  -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v3);
}

- (BOOL)isSetupComplete
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = -86;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1906EE364;
  v4[3] = &unk_1E2C60308;
  v4[4] = self;
  v4[5] = &v5;
  -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_performSyncBlock:(id)a3
{
  void (**v4)(void);
  void (**block)(void);

  v4 = (void (**)(void))a3;
  if (v4)
  {
    block = v4;
    if (dispatch_get_specific("IDSDaemonListenerContext"))
      block[2]();
    else
      dispatch_sync((dispatch_queue_t)self->_ivarQueue, block);
    v4 = block;
  }

}

- (void)_noteDisconnected
{
  NSObject *ivarQueue;
  _QWORD block[5];

  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1906EE398;
  block[3] = &unk_1E2C60550;
  block[4] = self;
  dispatch_async(ivarQueue, block);
}

- (void)addHandler:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_1906E2BF4;
    v6[3] = &unk_1E2C607A8;
    v6[4] = self;
    v7 = v4;
    -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v6);

  }
}

- (void)removeHandler:(id)a3
{
  id v4;
  _QWORD v5[6];

  if (a3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = sub_1906E2814;
    v5[3] = &unk_1E2C61180;
    v5[4] = self;
    v5[5] = a3;
    v4 = a3;
    -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v5);

  }
}

- (id)enabledAccountsForService:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  _BYTE *v12;
  _BYTE buf[24];
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isNonUIInstall");

  if ((v6 & 1) != 0)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "%@ enabledAccountsForService %@", buf, 0x16u);
  }

  if (!v4)
  {
LABEL_6:
    v8 = 0;
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v14 = sub_1906EE1C4;
    v15 = sub_1906EE0B4;
    v16 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1906E4828;
    v10[3] = &unk_1E2C606E0;
    v10[4] = self;
    v11 = v4;
    v12 = buf;
    -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v10);
    v8 = *(id *)(*(_QWORD *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
  }

  return v8;
}

- (void)connectionComplete:(BOOL)a3 withResponse:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1906E3BD8;
  v7[3] = &unk_1E2C607A8;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v7);

}

- (id)accountDictionariesForService:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  IDSDaemonListener *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isNonUIInstall");

  if ((v6 & 1) != 0)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_1907E7F08();

  if (!v4)
  {
LABEL_6:
    v8 = 0;
  }
  else
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = sub_1906EE1C4;
    v18 = sub_1906EE0B4;
    v19 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1906E4694;
    v10[3] = &unk_1E2C606E0;
    v11 = v4;
    v12 = self;
    v13 = &v14;
    -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v10);
    v8 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
  }

  return v8;
}

- (BOOL)_hidingDisconnect
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = -86;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1906EE3F4;
  v4[3] = &unk_1E2C60308;
  v4[4] = self;
  v4[5] = &v5;
  -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)__postSetupComplete
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  if (!self->_setupInfoComplete)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v4 = "Setup info is not complete, waiting...";
LABEL_8:
    _os_log_impl(&dword_1906E0000, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, v4, buf, 2u);
    goto LABEL_9;
  }
  if (!self->_connectionComplete)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v4 = "Connection is not complete, waiting...";
    goto LABEL_8;
  }
  v2 = MEMORY[0x1E0C809B0];
  self->_setupComplete = 1;
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = sub_1906ECBE4;
  v5[3] = &unk_1E2C60550;
  v5[4] = self;
  v3 = MEMORY[0x19400FE1C](v5, a2);
  (*(void (**)(void))(v3 + 16))();
LABEL_9:

}

- (void)_callHandlersWithBlockOnIvarQueue:(id)a3
{
  -[IDSDaemonListener _callHandlersWithBlockOnIvarQueue:cleanup:](self, "_callHandlersWithBlockOnIvarQueue:cleanup:", a3, 0);
}

- (BOOL)hasPostedSetupComplete
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = -86;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_190706E1C;
  v4[3] = &unk_1E2C60308;
  v4[4] = self;
  v4[5] = &v5;
  -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (NSString)deviceIdentifier
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1906EE1C4;
  v9 = sub_1906EE0B4;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_190706EF4;
  v4[3] = &unk_1E2C60308;
  v4[4] = self;
  v4[5] = &v5;
  -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (void)_callHandlersWithBlock:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_190706FAC;
    v6[3] = &unk_1E2C60820;
    v6[4] = self;
    v7 = v4;
    -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v6);

  }
}

- (void)_callHandlersAsyncWithBlock:(id)a3
{
  id v4;
  void *v5;
  NSObject *ivarQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    ivarQueue = self->_ivarQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = sub_190707044;
    v7[3] = &unk_1E2C60820;
    v7[4] = self;
    v8 = v4;
    dispatch_async(ivarQueue, v7);

  }
}

- (void)_removeAccountOnIvarQueue:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSMutableDictionary *topicToAccountDictionaries;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, uint64_t, _BYTE *);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D35228]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D35218]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    +[IDSLogging DaemonListener](IDSLogging, "DaemonListener");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907E803C();
  }
  else
  {
    -[NSMutableDictionary objectForKey:](self->_topicToAccountDictionaries, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "mutableCopy");

    if (v10)
    {
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v22 = 0x7FFFFFFFFFFFFFFFLL;
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = sub_190707208;
      v16 = &unk_1E2C611D0;
      v17 = v5;
      v18 = &v19;
      -[NSObject enumerateObjectsUsingBlock:](v10, "enumerateObjectsUsingBlock:", &v13);
      if (v20[3] != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[NSObject removeObjectAtIndex:](v10, "removeObjectAtIndex:", v13, v14, v15, v16);
        v11 = -[NSObject count](v10, "count");
        topicToAccountDictionaries = self->_topicToAccountDictionaries;
        if (v11)
          -[NSMutableDictionary setObject:forKey:](topicToAccountDictionaries, "setObject:forKey:", v10, v7);
        else
          -[NSMutableDictionary removeObjectForKey:](topicToAccountDictionaries, "removeObjectForKey:", v7);
      }

      _Block_object_dispose(&v19, 8);
    }
  }

}

- (void)accountAdded:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D35228]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D35218]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    +[IDSLogging DaemonListener](IDSLogging, "DaemonListener");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1907E809C();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[IDSDaemonListener accountAdded:]";
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
    }

    v12 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_19070747C;
    v16[3] = &unk_1E2C602B8;
    v16[4] = self;
    v13 = v4;
    v17 = v13;
    v18 = v7;
    -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v16);
    v14[0] = v12;
    v14[1] = 3221225472;
    v14[2] = sub_1907074FC;
    v14[3] = &unk_1E2C611F8;
    v15 = v13;
    -[IDSDaemonListener _callHandlersWithBlock:](self, "_callHandlersWithBlock:", v14);

  }
}

- (void)accountRemoved:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D35228]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D35218]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    +[IDSLogging DaemonListener](IDSLogging, "DaemonListener");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1907E80FC();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[IDSDaemonListener accountRemoved:]";
      v20 = 2112;
      v21 = v5;
      _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
    }

    v12 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_190707734;
    v16[3] = &unk_1E2C607A8;
    v16[4] = self;
    v13 = v4;
    v17 = v13;
    -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v16);
    v14[0] = v12;
    v14[1] = 3221225472;
    v14[2] = sub_190707740;
    v14[3] = &unk_1E2C611F8;
    v15 = v13;
    -[IDSDaemonListener _callHandlersWithBlock:](self, "_callHandlersWithBlock:", v14);

  }
}

- (void)accountEnabled:(id)a3 onService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v6;
      _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "Incoming account enabled: %@", buf, 0xCu);
    }

    v10 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_190707958;
    v17[3] = &unk_1E2C602B8;
    v17[4] = self;
    v11 = v8;
    v18 = v11;
    v12 = v6;
    v19 = v12;
    -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v17);
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = sub_1907079E4;
    v14[3] = &unk_1E2C61220;
    v15 = v12;
    v16 = v11;
    -[IDSDaemonListener _callHandlersWithBlock:](self, "_callHandlersWithBlock:", v14);

  }
  else
  {
    +[IDSLogging DaemonListener](IDSLogging, "DaemonListener");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1907E815C();

  }
}

- (void)accountDisabled:(id)a3 onService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v6;
      _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "Incoming account disabled: %@", buf, 0xCu);
    }

    v10 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_190707BFC;
    v17[3] = &unk_1E2C602B8;
    v17[4] = self;
    v11 = v8;
    v18 = v11;
    v12 = v6;
    v19 = v12;
    -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v17);
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = sub_190707C88;
    v14[3] = &unk_1E2C61220;
    v15 = v12;
    v16 = v11;
    -[IDSDaemonListener _callHandlersWithBlock:](self, "_callHandlersWithBlock:", v14);

  }
  else
  {
    +[IDSLogging DaemonListener](IDSLogging, "DaemonListener");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1907E81BC();

  }
}

- (unint64_t)restrictionReasonForService:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_serviceToRestrictionReason, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "Restriction reason %@ for service %@", (uint8_t *)&v11, 0x16u);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_serviceToRestrictionReason, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_serviceToRestrictionReason, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntValue");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)service:(id)a3 restrictionReasonChanged:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *serviceToRestrictionReason;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  unint64_t v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v6;
    v17 = 2048;
    v18 = a4;
    _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "Service %@ received restriction reason %lu", buf, 0x16u);
  }

  if (!self->_serviceToRestrictionReason)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    serviceToRestrictionReason = self->_serviceToRestrictionReason;
    self->_serviceToRestrictionReason = v8;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_serviceToRestrictionReason, "setObject:forKeyedSubscript:", v10, v6);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_190707F60;
  v12[3] = &unk_1E2C61248;
  v13 = v6;
  v14 = a4;
  v11 = v6;
  -[IDSDaemonListener _callHandlersWithBlock:](self, "_callHandlersWithBlock:", v12);

}

- (void)updateAccount:(id)a3 withAccountInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D35228]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D35218]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToIgnoringCase:", CFSTR("com.apple.private.alloy.voicemailsync")))
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "voicemailSync");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v7;
      _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "Account info changed %@", buf, 0xCu);
    }

  }
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (v11)
  {
    +[IDSLogging DaemonListener](IDSLogging, "DaemonListener");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907E821C();

  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_190708170;
    v13[3] = &unk_1E2C602B8;
    v13[4] = self;
    v14 = v7;
    v15 = v9;
    -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v13);

  }
}

- (void)account:(id)a3 accountInfoChanged:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  -[IDSDaemonListener updateAccount:withAccountInfo:](self, "updateAccount:withAccountInfo:", a3, v6);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_190708288;
  v8[3] = &unk_1E2C611F8;
  v9 = v6;
  v7 = v6;
  -[IDSDaemonListener _callHandlersWithBlock:](self, "_callHandlersWithBlock:", v8);

}

- (void)account:(id)a3 registrationStatusInfoChanged:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_190708374;
  v10[3] = &unk_1E2C61220;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[IDSDaemonListener _callHandlersWithBlock:](self, "_callHandlersWithBlock:", v10);

}

- (void)account:(id)a3 aliasesChanged:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_190708460;
  v10[3] = &unk_1E2C61220;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[IDSDaemonListener _callHandlersWithBlock:](self, "_callHandlersWithBlock:", v10);

}

- (void)account:(id)a3 vettedAliasesChanged:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_19070854C;
  v10[3] = &unk_1E2C61220;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[IDSDaemonListener _callHandlersWithBlock:](self, "_callHandlersWithBlock:", v10);

}

- (void)account:(id)a3 profileChanged:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_190708638;
  v10[3] = &unk_1E2C61220;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[IDSDaemonListener _callHandlersWithBlock:](self, "_callHandlersWithBlock:", v10);

}

- (void)account:(id)a3 loginChanged:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_190708724;
  v10[3] = &unk_1E2C61220;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[IDSDaemonListener _callHandlersWithBlock:](self, "_callHandlersWithBlock:", v10);

}

- (void)account:(id)a3 displayNameChanged:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_190708810;
  v10[3] = &unk_1E2C61220;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[IDSDaemonListener _callHandlersWithBlock:](self, "_callHandlersWithBlock:", v10);

}

- (id)_uniqueIDForDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D34660]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D346C0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_stringForKey:", *MEMORY[0x1E0D34AD0]);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }

  return v4;
}

- (void)account:(id)a3 dependentDevicesUpdated:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_190708A18;
  v18[3] = &unk_1E2C60C50;
  v18[4] = self;
  v10 = v6;
  v19 = v10;
  v20 = v7;
  v11 = v8;
  v21 = v11;
  v12 = v7;
  -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v18);
  v13 = v11;
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = sub_190708D9C;
  v15[3] = &unk_1E2C61220;
  v16 = v10;
  v17 = v13;
  v14 = v10;
  -[IDSDaemonListener _callHandlersWithBlock:](self, "_callHandlersWithBlock:", v15);

}

- (void)account:(id)a3 localDeviceAdded:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  IDSDaemonListener *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
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

  v6 = a3;
  v7 = a4;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = sub_1906EE1C4;
  v45 = sub_1906EE0B4;
  v46 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_1906EE1C4;
  v39 = sub_1906EE0B4;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_1906EE1C4;
  v33 = sub_1906EE0B4;
  v34 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_19070905C;
  v22[3] = &unk_1E2C61270;
  v9 = v7;
  v23 = v9;
  v10 = v6;
  v24 = v10;
  v25 = self;
  v26 = &v41;
  v27 = &v29;
  v28 = &v35;
  -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v22);
  v11 = (id)v42[5];
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = sub_1907097A8;
  v19[3] = &unk_1E2C61220;
  v12 = v10;
  v20 = v12;
  v13 = v11;
  v21 = v13;
  -[IDSDaemonListener _callHandlersWithBlock:](self, "_callHandlersWithBlock:", v19);
  v14 = (id)v36[5];
  v15 = (id)v30[5];
  if (objc_msgSend((id)v36[5], "length"))
  {
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = sub_1907097F4;
    v16[3] = &unk_1E2C602B8;
    v16[4] = self;
    v17 = v14;
    v18 = v15;
    -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v16);

  }
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

}

- (void)account:(id)a3 localDeviceRemoved:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  IDSDaemonListener *v19;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_190709900;
  v16[3] = &unk_1E2C602B8;
  v9 = v6;
  v17 = v9;
  v10 = v7;
  v18 = v10;
  v19 = self;
  -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v16);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = sub_190709B70;
  v13[3] = &unk_1E2C61220;
  v14 = v9;
  v15 = v10;
  v11 = v10;
  v12 = v9;
  -[IDSDaemonListener _callHandlersWithBlock:](self, "_callHandlersWithBlock:", v13);

}

- (id)_updateService:(id)a3 withTinkerDevice:(id)a4 shouldAdd:(BOOL)a5 shouldSwitch:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  IDSDaemonListener *v19;
  _QWORD *v20;
  uint64_t *v21;
  BOOL v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[5];
  id v31;

  v10 = a3;
  v11 = a4;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_1906EE1C4;
  v30[4] = sub_1906EE0B4;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_1906EE1C4;
  v28 = sub_1906EE0B4;
  v29 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_190709D24;
  v16[3] = &unk_1E2C612C0;
  v12 = v11;
  v17 = v12;
  v13 = v10;
  v18 = v13;
  v19 = self;
  v22 = a5;
  v23 = a6;
  v20 = v30;
  v21 = &v24;
  -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v16);
  v14 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(v30, 8);

  return v14;
}

- (void)service:(id)a3 tinkerDeviceAdded:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v6;
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "tinkerDeviceAdded %@", buf, 0xCu);
  }

  -[IDSDaemonListener _updateService:withTinkerDevice:shouldAdd:shouldSwitch:](self, "_updateService:withTinkerDevice:shouldAdd:shouldSwitch:", v6, v7, 1, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_19070A8C4;
  v16[3] = &unk_1E2C61220;
  v11 = v6;
  v17 = v11;
  v12 = v7;
  v18 = v12;
  -[IDSDaemonListener _callHandlersWithBlock:](self, "_callHandlersWithBlock:", v16);
  if (objc_msgSend(v9, "length"))
  {
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = sub_19070A910;
    v13[3] = &unk_1E2C602B8;
    v13[4] = self;
    v14 = v9;
    v15 = v11;
    -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v13);

  }
}

- (void)service:(id)a3 tinkerDeviceRemoved:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "tinkerDeviceRemoved %@", buf, 0xCu);
  }

  v9 = -[IDSDaemonListener _updateService:withTinkerDevice:shouldAdd:shouldSwitch:](self, "_updateService:withTinkerDevice:shouldAdd:shouldSwitch:", v6, v7, 0, 0);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_19070AA68;
  v12[3] = &unk_1E2C61220;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[IDSDaemonListener _callHandlersWithBlock:](self, "_callHandlersWithBlock:", v12);

}

- (void)service:(id)a3 tinkerDeviceUpdated:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "tinkerDeviceUpdated %@", buf, 0xCu);
  }

  v9 = -[IDSDaemonListener _updateService:withTinkerDevice:shouldAdd:shouldSwitch:](self, "_updateService:withTinkerDevice:shouldAdd:shouldSwitch:", v6, v7, 1, 0);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_19070ABFC;
  v12[3] = &unk_1E2C61220;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[IDSDaemonListener _callHandlersWithBlock:](self, "_callHandlersWithBlock:", v12);

}

- (void)service:(id)a3 familyInfoUpdated:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v6;
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "familyInfoUpdated %@", buf, 0xCu);
  }

  if (v7)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = *MEMORY[0x1E0D34728];
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D34728]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, v11);

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = *MEMORY[0x1E0D34708];
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D34708]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, v15);

    -[NSMutableDictionary setObject:forKey:](self->_serviceToFamilyInfo, "setObject:forKey:", v9, v6);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_19070AE9C;
    v19[3] = &unk_1E2C61220;
    v20 = v6;
    v21 = v9;
    v18 = v9;
    -[IDSDaemonListener _callHandlersWithBlock:](self, "_callHandlersWithBlock:", v19);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v6;
      _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "Family Info was nil %@", buf, 0xCu);
    }
  }

}

- (id)familyInfoForService:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1906EE1C4;
  v15 = sub_1906EE0B4;
  v16 = (id)0xAAAAAAAAAAAAAAAALL;
  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_19070AFF4;
  v8[3] = &unk_1E2C60780;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)familyDevicesForService:(id)a3 listenerID:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && v9)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_19070B0FC;
    v11[3] = &unk_1E2C61008;
    v11[4] = self;
    v12 = v8;
    v13 = v9;
    v14 = v10;
    -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v11);

  }
}

- (id)pendingInvitationsForService:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1906EE1C4;
  v15 = sub_1906EE0B4;
  v16 = (id)0xAAAAAAAAAAAAAAAALL;
  v16 = objc_alloc_init(MEMORY[0x1E0C99D80]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_19070BB9C;
  v8[3] = &unk_1E2C60780;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)receivedInvitationsForService:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1906EE1C4;
  v15 = sub_1906EE0B4;
  v16 = (id)0xAAAAAAAAAAAAAAAALL;
  v16 = objc_alloc_init(MEMORY[0x1E0C99D80]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_19070BCE4;
  v8[3] = &unk_1E2C60780;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (int64_t)maxEffectivePayloadSizeForService:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_19070BDE8;
  v8[3] = &unk_1E2C60780;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (int64_t)maxIMLPayloadSize
{
  int64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_19070BED4;
  v4[3] = &unk_1E2C60308;
  v4[4] = self;
  v4[5] = &v5;
  -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)latestPrivateLoggingSalt
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1906EE1C4;
  v9 = sub_1906EE0B4;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_19070BFAC;
  v4[3] = &unk_1E2C60308;
  v4[4] = self;
  v4[5] = &v5;
  -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)registrationFailedForAccount:(id)a3 needsDeletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_19070C060;
  v10[3] = &unk_1E2C61220;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[IDSDaemonListener _callHandlersWithBlock:](self, "_callHandlersWithBlock:", v10);

}

- (void)refreshRegistrationForAccount:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_1907E82E0();

  objc_msgSend(MEMORY[0x1E0D34E48], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "flushCache");

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_19070C180;
  v8[3] = &unk_1E2C611F8;
  v9 = v4;
  v7 = v4;
  -[IDSDaemonListener _callHandlersWithBlock:](self, "_callHandlersWithBlock:", v8);

}

- (id)dependentDevicesForAccount:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isNonUIInstall");

  v7 = 0;
  if (v4 && (v6 & 1) == 0)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = sub_1906EE1C4;
    v16 = sub_1906EE0B4;
    v17 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_19070C2EC;
    v9[3] = &unk_1E2C60780;
    v11 = &v12;
    v9[4] = self;
    v10 = v4;
    -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v9);
    v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }

  return v7;
}

- (id)linkedDevicesForService:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isNonUIInstall");

  v7 = 0;
  if (v4 && (v6 & 1) == 0)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = sub_1906EE1C4;
    v16 = sub_1906EE0B4;
    v17 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_19070C448;
    v9[3] = &unk_1E2C60780;
    v11 = &v12;
    v9[4] = self;
    v10 = v4;
    -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v9);
    v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }

  return v7;
}

- (void)device:(id)a3 nsuuidChanged:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;
  id v11;
  IDSDaemonListener *v12;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_19070C57C;
    v9[3] = &unk_1E2C602B8;
    v10 = v7;
    v11 = v6;
    v12 = self;
    -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v9);

    v8 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "NSUUID");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "No device ID: can't update nsuuid. Bailing...", buf, 2u);
    }
  }

}

- (void)didGetIdentities:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "Did get identities {identities: %@, error: %@}", (uint8_t *)&v8, 0x16u);
  }

}

- (void)didSwitchActivePairedDevice:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_19070CB90;
  v6[3] = &unk_1E2C607A8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v6);

}

- (void)_internalDidSwitchActivePairedDevice:(id)a3 forService:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD v19[3];
  char v20;

  v6 = a3;
  v7 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 1;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_19070CE48;
  v15[3] = &unk_1E2C61338;
  v16 = v6;
  v17 = v7;
  v18 = v19;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = sub_19070CF74;
  v11[3] = &unk_1E2C61360;
  v14 = v19;
  v11[4] = self;
  v9 = v17;
  v12 = v9;
  v10 = v16;
  v13 = v10;
  -[IDSDaemonListener _callHandlersWithBlockOnIvarQueue:cleanup:](self, "_callHandlersWithBlockOnIvarQueue:cleanup:", v15, v11);

  _Block_object_dispose(v19, 8);
}

- (void)switchActivePairedDevice:(id)a3 forService:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "isActive");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "New active unique ID is nil";
LABEL_8:
      _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
    }
LABEL_9:

    goto LABEL_10;
  }
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "isActive");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "Account unique ID is nil, can't switch active device ID";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_19070D33C;
  v10[3] = &unk_1E2C602B8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v10);

LABEL_10:
}

- (void)_internalSwitchActivePairedDevice:(id)a3 forService:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  IDSDaemonListener *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id obj;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D36AA8], "isActive");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v34 = v27;
    v35 = 2112;
    v36 = v6;
    _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "Switching active device to %@ for service %@", buf, 0x16u);
  }

  -[NSMutableDictionary objectForKey:](self->_serviceToLinkedDevices, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0D36AA8], "isActive");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v34 = v6;
    v35 = 2112;
    v36 = v9;
    _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "Current linked devices for service %@: %@", buf, 0x16u);
  }
  v25 = v6;

  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = (id)objc_msgSend(v9, "mutableCopy");
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    v14 = *MEMORY[0x1E0D34678];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v16);
        -[IDSDaemonListener _uniqueIDForDevice:](self, "_uniqueIDForDevice:", v17);
        v18 = self;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToIgnoringCase:", v27);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v21, v14);

        objc_msgSend(v9, "removeObject:", v16);
        objc_msgSend(v9, "addObject:", v17);

        self = v18;
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v12);
  }

  if (v25 && v9)
  {
    -[NSMutableDictionary setObject:forKey:](self->_serviceToLinkedDevices, "setObject:forKey:", v9, v25);
    objc_msgSend(MEMORY[0x1E0D36AA8], "isActive");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v34 = v25;
      v35 = 2112;
      v36 = v9;
      _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "New linked devices for service %@: %@", buf, 0x16u);
    }

  }
  if (v27 && v25)
  {
    -[NSMutableDictionary setObject:forKey:](self->_serviceToActiveDeviceUniqueID, "setObject:forKey:", v27, v25);
    objc_msgSend(MEMORY[0x1E0D36AA8], "activeID");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      -[NSMutableDictionary objectForKey:](self->_serviceToActiveDeviceUniqueID, "objectForKey:", v25);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v24;
      _os_log_impl(&dword_1906E0000, v23, OS_LOG_TYPE_DEFAULT, "Active paired device switched, updating activeDevice ID to %@", buf, 0xCu);

    }
  }

}

- (void)switchActivePairedDevice:(id)a3 forAccount:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "isActive");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "New active unique ID is nil";
LABEL_8:
      _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
    }
LABEL_9:

    goto LABEL_10;
  }
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "isActive");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "Account unique ID is nil, can't switch active device ID";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_19070D850;
  v10[3] = &unk_1E2C602B8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v10);

LABEL_10:
}

- (void)_internalSwitchActivePairedDevice:(id)a3 forAccount:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  IDSDaemonListener *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id obj;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D36AA8], "isActive");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v34 = v27;
    v35 = 2112;
    v36 = v6;
    _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "Switching active device to %@ for account %@", buf, 0x16u);
  }

  -[NSMutableDictionary objectForKey:](self->_accountToDevices, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0D36AA8], "isActive");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v34 = v6;
    v35 = 2112;
    v36 = v9;
    _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "Current devices for account %@: %@", buf, 0x16u);
  }
  v25 = v6;

  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = (id)objc_msgSend(v9, "mutableCopy");
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    v14 = *MEMORY[0x1E0D34678];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v16);
        -[IDSDaemonListener _uniqueIDForDevice:](self, "_uniqueIDForDevice:", v17);
        v18 = self;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToIgnoringCase:", v27);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v21, v14);

        objc_msgSend(v9, "removeObject:", v16);
        objc_msgSend(v9, "addObject:", v17);

        self = v18;
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v12);
  }

  if (v25 && v9)
  {
    -[NSMutableDictionary setObject:forKey:](self->_accountToDevices, "setObject:forKey:", v9, v25);
    objc_msgSend(MEMORY[0x1E0D36AA8], "isActive");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v34 = v25;
      v35 = 2112;
      v36 = v9;
      _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "New devices for account %@: %@", buf, 0x16u);
    }

  }
  if (v27 && v25)
  {
    -[NSMutableDictionary setObject:forKey:](self->_accountToActiveDeviceUniqueID, "setObject:forKey:", v27, v25);
    objc_msgSend(MEMORY[0x1E0D36AA8], "activeID");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      -[NSMutableDictionary objectForKey:](self->_accountToActiveDeviceUniqueID, "objectForKey:", v25);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v24;
      _os_log_impl(&dword_1906E0000, v23, OS_LOG_TYPE_DEFAULT, "Active paired device switched, updating activeDevice ID to %@", buf, 0xCu);

    }
  }

}

- (void)deactivatePairedDevices
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_19070DC70;
  v2[3] = &unk_1E2C60550;
  v2[4] = self;
  -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v2);
}

- (id)getDirectMessagingMetadataDictionary
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1906EE1C4;
  v9 = sub_1906EE0B4;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_19070E74C;
  v4[3] = &unk_1E2C60308;
  v4[4] = self;
  v4[5] = &v5;
  -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)xpcObject:(id)a3 objectContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[IDSLogging DaemonListener](IDSLogging, "DaemonListener");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "XPC object received %@:%@", buf, 0x16u);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_19070E8D8;
  v11[3] = &unk_1E2C61220;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[IDSDaemonListener _callHandlersWithBlockOnIvarQueue:cleanup:](self, "_callHandlersWithBlockOnIvarQueue:cleanup:", v11, &unk_1E2C613A0);

}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1906EE1C4;
  v10 = sub_1906EE0B4;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_19070E9F0;
  v5[3] = &unk_1E2C613C8;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  IDSInternalQueueController *internalQueueController;
  _QWORD v13[4];
  void (**v14)(_QWORD, _QWORD);
  _QWORD v15[5];
  id v16;
  id v17;

  v4 = a3;
  objc_msgSend(v4, "retainArguments");
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_currentMessageContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_19070EB90;
  v15[3] = &unk_1E2C613F0;
  v15[4] = self;
  v9 = v4;
  v16 = v9;
  v10 = v7;
  v17 = v10;
  v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x19400FE1C](v15);
  if (objc_msgSend(v10, "isReply") && _os_feature_enabled_impl())
  {
    v11[2](v11, 1);
  }
  else
  {
    internalQueueController = self->_internalQueueController;
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = sub_19070F00C;
    v13[3] = &unk_1E2C604E8;
    v14 = v11;
    -[IDSInternalQueueController performBlock:](internalQueueController, "performBlock:", v13);

  }
}

- (void)continuityDidUpdateStateToState:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_19070F06C;
  v3[3] = &unk_1E2C61410;
  v3[4] = a3;
  -[IDSDaemonListener _callHandlersAsyncWithBlock:](self, "_callHandlersAsyncWithBlock:", v3);
}

- (void)continuityDidLosePeer:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_19070F130;
  v6[3] = &unk_1E2C611F8;
  v7 = v4;
  v5 = v4;
  -[IDSDaemonListener _callHandlersAsyncWithBlock:](self, "_callHandlersAsyncWithBlock:", v6);

}

- (void)continuityDidStartAdvertisingOfType:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_19070F1CC;
  v3[3] = &unk_1E2C61410;
  v3[4] = a3;
  -[IDSDaemonListener _callHandlersAsyncWithBlock:](self, "_callHandlersAsyncWithBlock:", v3);
}

- (void)continuityDidStopAdvertisingOfType:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_19070F268;
  v3[3] = &unk_1E2C61410;
  v3[4] = a3;
  -[IDSDaemonListener _callHandlersAsyncWithBlock:](self, "_callHandlersAsyncWithBlock:", v3);
}

- (void)continuityDidStopAdvertisingOfType:(int64_t)a3 withError:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  int64_t v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_19070F330;
  v8[3] = &unk_1E2C61248;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  -[IDSDaemonListener _callHandlersAsyncWithBlock:](self, "_callHandlersAsyncWithBlock:", v8);

}

- (void)continuityDidFailToStartAdvertisingOfType:(int64_t)a3 withError:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  int64_t v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_19070F3F8;
  v8[3] = &unk_1E2C61248;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  -[IDSDaemonListener _callHandlersAsyncWithBlock:](self, "_callHandlersAsyncWithBlock:", v8);

}

- (void)continuityDidStartScanningForType:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_19070F494;
  v3[3] = &unk_1E2C61410;
  v3[4] = a3;
  -[IDSDaemonListener _callHandlersAsyncWithBlock:](self, "_callHandlersAsyncWithBlock:", v3);
}

- (void)continuityDidStopScanningForType:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_19070F530;
  v3[3] = &unk_1E2C61410;
  v3[4] = a3;
  -[IDSDaemonListener _callHandlersAsyncWithBlock:](self, "_callHandlersAsyncWithBlock:", v3);
}

- (void)continuityDidFailToStartScanningForType:(int64_t)a3 withError:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  int64_t v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_19070F5F8;
  v8[3] = &unk_1E2C61248;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  -[IDSDaemonListener _callHandlersAsyncWithBlock:](self, "_callHandlersAsyncWithBlock:", v8);

}

- (void)continuityDidDiscoverType:(int64_t)a3 withData:(id)a4 fromPeer:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  int64_t v15;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_19070F6EC;
  v12[3] = &unk_1E2C61438;
  v14 = v9;
  v15 = a3;
  v13 = v8;
  v10 = v9;
  v11 = v8;
  -[IDSDaemonListener _callHandlersAsyncWithBlock:](self, "_callHandlersAsyncWithBlock:", v12);

}

- (void)continuityDidDiscoverPeerWithData:(id)a3 fromPeer:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_19070F7DC;
  v10[3] = &unk_1E2C61220;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[IDSDaemonListener _callHandlersAsyncWithBlock:](self, "_callHandlersAsyncWithBlock:", v10);

}

- (void)continuityDidConnectToPeer:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_19070F8C8;
  v10[3] = &unk_1E2C61220;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[IDSDaemonListener _callHandlersAsyncWithBlock:](self, "_callHandlersAsyncWithBlock:", v10);

}

- (void)continuityDidDisconnectFromPeer:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_19070F9B4;
  v10[3] = &unk_1E2C61220;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[IDSDaemonListener _callHandlersAsyncWithBlock:](self, "_callHandlersAsyncWithBlock:", v10);

}

- (void)deviceIdentifierDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_1907E8508();

  if (objc_msgSend(v4, "isEqualToIgnoringCase:", self->_deviceIdentifier))
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "warning");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1907E84C8(v6);

  }
  else
  {
    v7 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_19070FB40;
    v11[3] = &unk_1E2C607A8;
    v11[4] = self;
    v8 = v4;
    v12 = v8;
    -[IDSDaemonListener _performSyncBlock:](self, "_performSyncBlock:", v11);
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = sub_19070FB4C;
    v9[3] = &unk_1E2C611F8;
    v10 = v8;
    -[IDSDaemonListener _callHandlersAsyncWithBlock:](self, "_callHandlersAsyncWithBlock:", v9);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestPrivateLoggingSalt, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_directMessagingMetadata, 0);
  objc_storeStrong((id *)&self->_serviceToActiveDeviceUniqueID, 0);
  objc_storeStrong((id *)&self->_accountToActiveDeviceUniqueID, 0);
  objc_storeStrong((id *)&self->_serviceToRestrictionReason, 0);
  objc_storeStrong((id *)&self->_serviceToMaxMessageSize, 0);
  objc_storeStrong((id *)&self->_serviceToReceivedInvitations, 0);
  objc_storeStrong((id *)&self->_serviceToPendingInvitations, 0);
  objc_storeStrong((id *)&self->_serviceToFamilyDevices, 0);
  objc_storeStrong((id *)&self->_serviceToFamilyInfo, 0);
  objc_storeStrong((id *)&self->_serviceToLinkedDevices, 0);
  objc_storeStrong((id *)&self->_accountToDevices, 0);
  objc_storeStrong((id *)&self->_topicToEnabledAccounts, 0);
  objc_storeStrong((id *)&self->_topicToAccountDictionaries, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_ivarQueue, 0);
  objc_storeStrong((id *)&self->_internalQueueController, 0);
}

@end
