@implementation IDSConnection

+ (id)_connectionWithAccount:(id)a3 commands:(id)a4 indirectDelegateCallouts:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithAccount:commands:indirectDelegateCallouts:", v9, v8, v5);

  return v10;
}

- (id)_initWithAccount:(id)a3 commands:(id)a4 indirectDelegateCallouts:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  IDSConnection *v11;
  void *v12;
  int v13;
  NSObject *v14;
  IDSConnection *v15;
  _IDSConnection *v16;
  _IDSConnection *internal;
  objc_super v19;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (_IDSRunningInDaemon())
  {
    +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907E8578((uint64_t)self, v10);

    v11 = 0;
  }
  else
  {
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "assertQueueIsCurrent");

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_1907E9A94();

    }
    v19.receiver = self;
    v19.super_class = (Class)IDSConnection;
    v15 = -[IDSConnection init](&v19, sel_init);
    if (v15)
    {
      v16 = -[_IDSConnection initWithAccount:commands:indirectDelegateCallouts:delegateContext:]([_IDSConnection alloc], "initWithAccount:commands:indirectDelegateCallouts:delegateContext:", v8, v9, v5, v15);
      internal = v15->_internal;
      v15->_internal = v16;

    }
    self = v15;
    v11 = self;
  }

  return v11;
}

- (IDSConnection)initWithAccount:(id)a3 commands:(id)a4
{
  return (IDSConnection *)-[IDSConnection _initWithAccount:commands:indirectDelegateCallouts:](self, "_initWithAccount:commands:indirectDelegateCallouts:", a3, a4, 0);
}

- (IDSConnection)initWithAccount:(id)a3
{
  return (IDSConnection *)-[IDSConnection _initWithAccount:commands:indirectDelegateCallouts:](self, "_initWithAccount:commands:indirectDelegateCallouts:", a3, 0, 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _IDSConnection *v7;

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = sub_1906EE224;
  v6[4] = sub_1906EE0E4;
  v7 = (_IDSConnection *)0xAAAAAAAAAAAAAAAALL;
  v7 = self->_internal;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1907278EC;
  v5[3] = &unk_1E2C602E0;
  v5[4] = v6;
  objc_msgSend(v3, "performBlock:waitUntilDone:", v5, 0);

  _Block_object_dispose(v6, 8);
  v4.receiver = self;
  v4.super_class = (Class)IDSConnection;
  -[IDSConnection dealloc](&v4, sel_dealloc);
}

- (_IDSConnection)_internal
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
      sub_1907E9B20();

  }
  return self->_internal;
}

- (IDSAccount)account
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1906EE224;
  v11 = sub_1906EE0E4;
  v12 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_190727A7C;
  v6[3] = &unk_1E2C60308;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performBlock:waitUntilDone:", v6, 1);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (IDSAccount *)v4;
}

- (BOOL)isActive
{
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_190727B84;
  v5[3] = &unk_1E2C60308;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlock:waitUntilDone:", v5, 1);

  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
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
  v11[2] = sub_190727C7C;
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
  v6[2] = sub_190727D20;
  v6[3] = &unk_1E2C61180;
  v6[4] = self;
  v6[5] = v4;
  objc_msgSend(v5, "performBlock:waitUntilDone:", v6, 1);

}

- (BOOL)sendProtobuf:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  int64_t v27;
  id *v28;
  id *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_190727E94;
  v22[3] = &unk_1E2C61E70;
  v26 = &v30;
  v22[4] = self;
  v18 = v14;
  v23 = v18;
  v19 = v15;
  v24 = v19;
  v27 = a5;
  v20 = v16;
  v25 = v20;
  v28 = a7;
  v29 = a8;
  objc_msgSend(v17, "performBlock:waitUntilDone:", v22, 1);

  LOBYTE(a8) = *((_BYTE *)v31 + 24);
  _Block_object_dispose(&v30, 8);

  return (char)a8;
}

- (BOOL)sendMessage:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  int64_t v27;
  id *v28;
  id *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_19072803C;
  v22[3] = &unk_1E2C61E70;
  v26 = &v30;
  v22[4] = self;
  v18 = v14;
  v23 = v18;
  v19 = v15;
  v24 = v19;
  v27 = a5;
  v20 = v16;
  v25 = v20;
  v28 = a7;
  v29 = a8;
  objc_msgSend(v17, "performBlock:waitUntilDone:", v22, 1);

  LOBYTE(a8) = *((_BYTE *)v31 + 24);
  _Block_object_dispose(&v30, 8);

  return (char)a8;
}

- (BOOL)sendData:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  int64_t v27;
  id *v28;
  id *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_1907281E4;
  v22[3] = &unk_1E2C61E70;
  v26 = &v30;
  v22[4] = self;
  v18 = v14;
  v23 = v18;
  v19 = v15;
  v24 = v19;
  v27 = a5;
  v20 = v16;
  v25 = v20;
  v28 = a7;
  v29 = a8;
  objc_msgSend(v17, "performBlock:waitUntilDone:", v22, 1);

  LOBYTE(a8) = *((_BYTE *)v31 + 24);
  _Block_object_dispose(&v30, 8);

  return (char)a8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

- (BOOL)sendMessage:(id)a3 toDestinations:(id)a4 options:(id)a5 identifier:(id *)a6 error:(id *)a7
{
  return -[IDSConnection sendMessage:toDestinations:priority:options:identifier:error:](self, "sendMessage:toDestinations:priority:options:identifier:error:", a3, a4, 200, a5, a6, a7);
}

@end
