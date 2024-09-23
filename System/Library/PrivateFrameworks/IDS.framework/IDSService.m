@implementation IDSService

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
  v11 = sub_1906EE2A4;
  v12 = sub_1906EE124;
  v13 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1906E17D0;
  v7[3] = &unk_1E2C60308;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlock:waitUntilDone:", v7, 1);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSSet *)v5;
}

- (NSArray)devices
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
  v11 = sub_1906EE2A4;
  v12 = sub_1906EE124;
  v13 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1906E2664;
  v7[3] = &unk_1E2C60308;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlock:waitUntilDone:", v7, 1);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _IDSService *v7;

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = sub_1906EE2A4;
  v6[4] = sub_1906EE124;
  v7 = (_IDSService *)0xAAAAAAAAAAAAAAAALL;
  v7 = self->_internal;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1906E27EC;
  v5[3] = &unk_1E2C602E0;
  v5[4] = v6;
  objc_msgSend(v3, "performBlock:waitUntilDone:", v5, 0);

  _Block_object_dispose(v6, 8);
  v4.receiver = self;
  v4.super_class = (Class)IDSService;
  -[IDSService dealloc](&v4, sel_dealloc);
}

- (IDSService)initWithService:(id)a3 commands:(id)a4 manuallyAckMessages:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *v10;
  IDSService *v11;
  void *v12;
  int v13;
  NSObject *v14;
  IDSService *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  IDSService *v24;
  id v25;
  id v26;
  BOOL v27;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  if (_IDSRunningInDaemon())
  {
    +[IDSLogging IDSService](IDSLogging, "IDSService");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907E61F0((uint64_t)self, v10);

    v11 = 0;
  }
  else
  {
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "assertQueueIsNotCurrent");

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_1907F4B24();

    }
    v28.receiver = self;
    v28.super_class = (Class)IDSService;
    v15 = -[IDSService init](&v28, sel_init);
    if (v15)
    {
      +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = sub_1906E2868;
      v23 = &unk_1E2C60CF0;
      v24 = v15;
      v17 = v8;
      v25 = v17;
      v26 = v9;
      v27 = a5;
      objc_msgSend(v16, "performBlock:", &v20);

      +[_IDSXPCCheckinManager sharedInstance](_IDSXPCCheckinManager, "sharedInstance", v20, v21, v22, v23);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "noteCreatedService:", v17);

    }
    self = v15;
    v11 = self;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

- (id)linkedDevicesWithRelationship:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blockUntilConnected");

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_1906EE2A4;
  v14 = sub_1906EE124;
  v15 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1906EE520;
  v9[3] = &unk_1E2C613C8;
  v9[4] = self;
  v9[5] = &v10;
  v9[6] = a3;
  objc_msgSend(v6, "performBlock:waitUntilDone:", v9, 1);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (IDSService)initWithService:(id)a3
{
  return (IDSService *)MEMORY[0x1E0DE7D20](self, sel_initWithService_commands_manuallyAckMessages_);
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
  v11[2] = sub_1906EE698;
  v11[3] = &unk_1E2C602B8;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlock:waitUntilDone:", v11, 0);

}

- (id)accountMatchingSim:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "SIMIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSService accountMatchingSimIdentifier:](self, "accountMatchingSimIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accountMatchingSimIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[IDSService accounts](self, "accounts", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "userUniqueIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqual:", v4);

          if ((v11 & 1) != 0)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)internal
{
  return self->_internal;
}

+ (BOOL)checkMessageSize:(unint64_t)a3 priority:(int64_t)a4
{
  unint64_t v4;

  v4 = 1048577;
  if (a4 != 300)
    v4 = 5242881;
  return v4 > a3;
}

+ (IDSService)serviceWithIdentifier:(id)a3 commands:(id)a4 manuallyAckMessages:(BOOL)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  IDSService *result;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  id v25;
  BOOL v26;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "assertQueueIsNotCurrent");

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1907F4A98();

  }
  if (v11)
  {
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = sub_190775308;
    v22 = &unk_1E2C63658;
    v16 = v9;
    v23 = v16;
    v24 = v10;
    v26 = a5;
    v25 = v11;
    objc_msgSend(v15, "performBlock:", &v19);

    +[_IDSXPCCheckinManager sharedInstance](_IDSXPCCheckinManager, "sharedInstance", v19, v20, v21, v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "noteCreatedService:", v16);

  }
  return result;
}

+ (IDSService)serviceWithIdentifier:(id)a3 completion:(id)a4
{
  return (IDSService *)MEMORY[0x1E0DE7D20](a1, sel_serviceWithIdentifier_commands_manuallyAckMessages_completion_);
}

- (IDSService)initWithService:(id)a3 serviceDomain:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;

  v5 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "assertQueueIsCurrent");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1907F4C18();

  }
  +[IDSLogging IDSService](IDSLogging, "IDSService");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    sub_1907F4BB0((uint64_t)v5, v9, v10);

  return 0;
}

- (IDSService)initWithService:(id)a3 commands:(id)a4
{
  return (IDSService *)MEMORY[0x1E0DE7D20](self, sel_initWithService_commands_manuallyAckMessages_);
}

- (IDSService)initWithService:(id)a3 manuallyAckMessages:(BOOL)a4
{
  return (IDSService *)MEMORY[0x1E0DE7D20](self, sel_initWithService_commands_manuallyAckMessages_);
}

- (_IDSService)_internal
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
      sub_1907F4CA4();

  }
  return self->_internal;
}

- (void)addDelegate:(id)a3 withDelegateProperties:(id)a4 queue:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_19077566C;
  v12[3] = &unk_1E2C602B8;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v9, "performBlock:waitUntilDone:", v12, 0);

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
  v6[2] = sub_190775710;
  v6[3] = &unk_1E2C61180;
  v6[4] = self;
  v6[5] = v4;
  objc_msgSend(v5, "performBlock:waitUntilDone:", v6, 1);

}

- (void)performGroupTask:(id)a3
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
  v7[2] = sub_1907757BC;
  v7[3] = &unk_1E2C60820;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:waitUntilDone:", v7, 0);

}

- (void)setProtobufAction:(SEL)a3 forIncomingRequestsOfType:(unsigned __int16)a4
{
  void *v7;
  _QWORD v8[6];
  unsigned __int16 v9;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_190775850;
  v8[3] = &unk_1E2C63680;
  v8[4] = self;
  v8[5] = a3;
  v9 = a4;
  objc_msgSend(v7, "performBlock:", v8);

}

- (void)setProtobufAction:(SEL)a3 forIncomingResponsesOfType:(unsigned __int16)a4
{
  void *v7;
  _QWORD v8[6];
  unsigned __int16 v9;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1907758F0;
  v8[3] = &unk_1E2C63680;
  v8[4] = self;
  v8[5] = a3;
  v9 = a4;
  objc_msgSend(v7, "performBlock:", v8);

}

- (SEL)protobufActionForIncomingRequestsOfType:(unsigned __int16)a3
{
  void *v5;
  void *v6;
  const char *v7;
  _QWORD v9[6];
  unsigned __int16 v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blockUntilConnected");

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0xAAAAAAAAAAAAAAAALL;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1907759F8;
  v9[3] = &unk_1E2C636A8;
  v9[4] = self;
  v9[5] = &v11;
  v10 = a3;
  objc_msgSend(v6, "performBlock:waitUntilDone:", v9, 1);

  v7 = (const char *)v12[3];
  _Block_object_dispose(&v11, 8);
  return v7;
}

- (SEL)protobufActionForIncomingResponsesOfType:(unsigned __int16)a3
{
  void *v5;
  void *v6;
  const char *v7;
  _QWORD v9[6];
  unsigned __int16 v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blockUntilConnected");

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0xAAAAAAAAAAAAAAAALL;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_190775B24;
  v9[3] = &unk_1E2C636A8;
  v9[4] = self;
  v9[5] = &v11;
  v10 = a3;
  objc_msgSend(v6, "performBlock:waitUntilDone:", v9, 1);

  v7 = (const char *)v12[3];
  _Block_object_dispose(&v11, 8);
  return v7;
}

- (BOOL)sendProtobuf:(id)a3 fromAccount:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  int64_t v32;
  id *v33;
  id *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "blockUntilConnected");

  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = sub_190775D08;
  v26[3] = &unk_1E2C636D0;
  v31 = &v35;
  v26[4] = self;
  v21 = v15;
  v27 = v21;
  v22 = v16;
  v28 = v22;
  v23 = v17;
  v29 = v23;
  v32 = a6;
  v24 = v18;
  v30 = v24;
  v33 = a8;
  v34 = a9;
  objc_msgSend(v20, "performBlock:waitUntilDone:", v26, 1);

  LOBYTE(a8) = *((_BYTE *)v36 + 24);
  _Block_object_dispose(&v35, 8);

  return (char)a8;
}

- (BOOL)sendProtobuf:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  int64_t v28;
  id *v29;
  id *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  kdebug_trace();
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "blockUntilConnected");

  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_190775EF8;
  v23[3] = &unk_1E2C61E70;
  v27 = &v31;
  v23[4] = self;
  v19 = v14;
  v24 = v19;
  v20 = v15;
  v25 = v20;
  v28 = a5;
  v21 = v16;
  v26 = v21;
  v29 = a7;
  v30 = a8;
  objc_msgSend(v18, "performBlock:waitUntilDone:", v23, 1);

  LOBYTE(a8) = *((_BYTE *)v32 + 24);
  _Block_object_dispose(&v31, 8);

  return (char)a8;
}

- (BOOL)sendOpportunisticData:(id)a3 options:(id)a4 identifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  id *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "blockUntilConnected");

  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1907760B8;
  v19[3] = &unk_1E2C636F8;
  v23 = &v25;
  v19[4] = self;
  v15 = v10;
  v20 = v15;
  v16 = v11;
  v21 = v16;
  v17 = v12;
  v22 = v17;
  v24 = a6;
  objc_msgSend(v14, "performBlock:waitUntilDone:", v19, 1);

  LOBYTE(a6) = *((_BYTE *)v26 + 24);
  _Block_object_dispose(&v25, 8);

  return (char)a6;
}

- (BOOL)cancelOpportunisticDataWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  id *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "blockUntilConnected");

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_190776214;
  v11[3] = &unk_1E2C619E8;
  v13 = &v15;
  v11[4] = self;
  v9 = v6;
  v12 = v9;
  v14 = a4;
  objc_msgSend(v8, "performBlock:waitUntilDone:", v11, 1);

  LOBYTE(a4) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)a4;
}

- (BOOL)sendMessage:(id)a3 fromAccount:(id)a4 toDestinations:(id)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  return -[IDSService sendMessage:fromAccount:toDestinations:priority:options:identifier:error:](self, "sendMessage:fromAccount:toDestinations:priority:options:identifier:error:", a3, a4, a5, 200, a6, a7, a8);
}

- (BOOL)sendMessage:(id)a3 fromAccount:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  int64_t v32;
  id *v33;
  id *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "blockUntilConnected");

  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = sub_190776424;
  v26[3] = &unk_1E2C636D0;
  v31 = &v35;
  v26[4] = self;
  v21 = v15;
  v27 = v21;
  v22 = v16;
  v28 = v22;
  v23 = v17;
  v29 = v23;
  v32 = a6;
  v24 = v18;
  v30 = v24;
  v33 = a8;
  v34 = a9;
  objc_msgSend(v20, "performBlock:waitUntilDone:", v26, 1);

  LOBYTE(a8) = *((_BYTE *)v36 + 24);
  _Block_object_dispose(&v35, 8);

  return (char)a8;
}

- (BOOL)sendMessage:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  int64_t v28;
  id *v29;
  id *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "blockUntilConnected");

  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_1907765F8;
  v23[3] = &unk_1E2C61E70;
  v27 = &v31;
  v23[4] = self;
  v19 = v14;
  v24 = v19;
  v20 = v15;
  v25 = v20;
  v28 = a5;
  v21 = v16;
  v26 = v21;
  v29 = a7;
  v30 = a8;
  objc_msgSend(v18, "performBlock:waitUntilDone:", v23, 1);

  LOBYTE(a8) = *((_BYTE *)v32 + 24);
  _Block_object_dispose(&v31, 8);

  return (char)a8;
}

- (BOOL)cancelMessageWithOptions:(id)a3 identifier:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  id *v16;
  id *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v8 = a3;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "blockUntilConnected");

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_19077676C;
  v13[3] = &unk_1E2C63720;
  v15 = &v18;
  v13[4] = self;
  v11 = v8;
  v14 = v11;
  v16 = a4;
  v17 = a5;
  objc_msgSend(v10, "performBlock:waitUntilDone:", v13, 1);

  LOBYTE(a5) = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return (char)a5;
}

- (BOOL)cancelMessageWithOptions:(id)a3 destination:(id)a4 identifier:(id *)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  id *v21;
  id *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v10 = a3;
  v11 = a4;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "blockUntilConnected");

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1907768F4;
  v17[3] = &unk_1E2C63748;
  v20 = &v23;
  v17[4] = self;
  v14 = v10;
  v18 = v14;
  v15 = v11;
  v19 = v15;
  v21 = a5;
  v22 = a6;
  objc_msgSend(v13, "performBlock:waitUntilDone:", v17, 1);

  LOBYTE(a6) = *((_BYTE *)v24 + 24);
  _Block_object_dispose(&v23, 8);

  return (char)a6;
}

- (BOOL)cancelMessageWithOptions:(id)a3 destinations:(id)a4 identifier:(id *)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  id *v21;
  id *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v10 = a3;
  v11 = a4;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "blockUntilConnected");

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_190776A80;
  v17[3] = &unk_1E2C63748;
  v20 = &v23;
  v17[4] = self;
  v14 = v10;
  v18 = v14;
  v15 = v11;
  v19 = v15;
  v21 = a5;
  v22 = a6;
  objc_msgSend(v13, "performBlock:waitUntilDone:", v17, 1);

  LOBYTE(a6) = *((_BYTE *)v24 + 24);
  _Block_object_dispose(&v23, 8);

  return (char)a6;
}

- (BOOL)sendData:(id)a3 fromAccount:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  int64_t v32;
  id *v33;
  id *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "blockUntilConnected");

  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = sub_190776C64;
  v26[3] = &unk_1E2C636D0;
  v31 = &v35;
  v26[4] = self;
  v21 = v15;
  v27 = v21;
  v22 = v16;
  v28 = v22;
  v23 = v17;
  v29 = v23;
  v32 = a6;
  v24 = v18;
  v30 = v24;
  v33 = a8;
  v34 = a9;
  objc_msgSend(v20, "performBlock:waitUntilDone:", v26, 1);

  LOBYTE(a8) = *((_BYTE *)v36 + 24);
  _Block_object_dispose(&v35, 8);

  return (char)a8;
}

- (BOOL)sendData:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  int64_t v28;
  id *v29;
  id *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "blockUntilConnected");

  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_190776E38;
  v23[3] = &unk_1E2C61E70;
  v27 = &v31;
  v23[4] = self;
  v19 = v14;
  v24 = v19;
  v20 = v15;
  v25 = v20;
  v28 = a5;
  v21 = v16;
  v26 = v21;
  v29 = a7;
  v30 = a8;
  objc_msgSend(v18, "performBlock:waitUntilDone:", v23, 1);

  LOBYTE(a8) = *((_BYTE *)v32 + 24);
  _Block_object_dispose(&v31, 8);

  return (char)a8;
}

- (BOOL)sendAccessoryData:(id)a3 toAccessoryID:(id)a4 accessToken:(id)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  id *v31;
  id *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "blockUntilConnected");

  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = sub_190777028;
  v25[3] = &unk_1E2C63770;
  v30 = &v33;
  v25[4] = self;
  v20 = v14;
  v26 = v20;
  v21 = v15;
  v27 = v21;
  v22 = v16;
  v28 = v22;
  v23 = v17;
  v29 = v23;
  v31 = a7;
  v32 = a8;
  objc_msgSend(v19, "performBlock:waitUntilDone:", v25, 1);

  LOBYTE(a8) = *((_BYTE *)v34 + 24);
  _Block_object_dispose(&v33, 8);

  return (char)a8;
}

- (BOOL)sendInvitation:(id)a3 toDestination:(id)a4 options:(id)a5 identifier:(id *)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  id *v26;
  id *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "blockUntilConnected");

  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_1907771DC;
  v21[3] = &unk_1E2C63798;
  v25 = &v28;
  v21[4] = self;
  v17 = v12;
  v22 = v17;
  v18 = v13;
  v23 = v18;
  v19 = v14;
  v24 = v19;
  v26 = a6;
  v27 = a7;
  objc_msgSend(v16, "performBlock:waitUntilDone:", v21, 1);

  LOBYTE(a7) = *((_BYTE *)v29 + 24);
  _Block_object_dispose(&v28, 8);

  return (char)a7;
}

- (BOOL)sendInvitationUpdate:(id)a3 toDestination:(id)a4 options:(id)a5 identifier:(id *)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  id *v26;
  id *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "blockUntilConnected");

  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_190777390;
  v21[3] = &unk_1E2C63798;
  v25 = &v28;
  v21[4] = self;
  v17 = v12;
  v22 = v17;
  v18 = v13;
  v23 = v18;
  v19 = v14;
  v24 = v19;
  v26 = a6;
  v27 = a7;
  objc_msgSend(v16, "performBlock:waitUntilDone:", v21, 1);

  LOBYTE(a7) = *((_BYTE *)v29 + 24);
  _Block_object_dispose(&v28, 8);

  return (char)a7;
}

- (BOOL)setWakingPushPriority:(int64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "blockUntilConnected");

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1907774CC;
  v10[3] = &unk_1E2C637C0;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = a3;
  v10[7] = a4;
  objc_msgSend(v8, "performBlock:waitUntilDone:", v10, 1);

  LOBYTE(a4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)a4;
}

- (BOOL)sendData:(id)a3 priority:(int64_t)a4 options:(id)a5 identifier:(id *)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v19[5];
  id v20;
  id v21;
  uint64_t *v22;
  int64_t v23;
  id *v24;
  id *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v12 = a3;
  v13 = a5;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "blockUntilConnected");

  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_19077765C;
  v19[3] = &unk_1E2C637E8;
  v22 = &v26;
  v19[4] = self;
  v16 = v12;
  v20 = v16;
  v23 = a4;
  v17 = v13;
  v21 = v17;
  v24 = a6;
  v25 = a7;
  objc_msgSend(v15, "performBlock:waitUntilDone:", v19, 1);

  LOBYTE(a7) = *((_BYTE *)v27 + 24);
  _Block_object_dispose(&v26, 8);

  return (char)a7;
}

- (BOOL)sendResourceAtURL:(id)a3 metadata:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  int64_t v32;
  id *v33;
  id *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "blockUntilConnected");

  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = sub_190777844;
  v26[3] = &unk_1E2C636D0;
  v31 = &v35;
  v26[4] = self;
  v21 = v15;
  v27 = v21;
  v22 = v16;
  v28 = v22;
  v23 = v17;
  v29 = v23;
  v32 = a6;
  v24 = v18;
  v30 = v24;
  v33 = a8;
  v34 = a9;
  objc_msgSend(v20, "performBlock:waitUntilDone:", v26, 1);

  LOBYTE(a8) = *((_BYTE *)v36 + 24);
  _Block_object_dispose(&v35, 8);

  return (char)a8;
}

- (BOOL)getProgressUpdateForIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  id *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "blockUntilConnected");

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1907779B8;
  v11[3] = &unk_1E2C619E8;
  v13 = &v15;
  v11[4] = self;
  v9 = v6;
  v12 = v9;
  v14 = a4;
  objc_msgSend(v8, "performBlock:waitUntilDone:", v11, 1);

  LOBYTE(a4) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)a4;
}

- (BOOL)sendAheadGroup:(id)a3 priority:(int64_t)a4 options:(id)a5 identifier:(id *)a6 error:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  uint64_t *v21;
  int64_t v22;
  id *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v11 = a3;
  v12 = a5;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "blockUntilConnected");

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_190777B44;
  v18[3] = &unk_1E2C63748;
  v21 = &v24;
  v18[4] = self;
  v15 = v11;
  v19 = v15;
  v22 = a4;
  v16 = v12;
  v20 = v16;
  v23 = a6;
  objc_msgSend(v14, "performBlock:waitUntilDone:", v18, 1);

  LOBYTE(a6) = *((_BYTE *)v25 + 24);
  _Block_object_dispose(&v24, 8);

  return (char)a6;
}

- (BOOL)reportSpamMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blockUntilConnected");

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_190777C9C;
  v9[3] = &unk_1E2C60780;
  v11 = &v12;
  v9[4] = self;
  v7 = v4;
  v10 = v7;
  objc_msgSend(v6, "performBlock:waitUntilDone:", v9, 1);

  LOBYTE(v4) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v4;
}

- (void)sendAckForMessageWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blockUntilConnected");

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_190777D88;
  v8[3] = &unk_1E2C607A8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "performBlock:", v8);

}

- (BOOL)sendCertifiedDeliveryReceipt:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blockUntilConnected");

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_190777EA4;
  v9[3] = &unk_1E2C60780;
  v11 = &v12;
  v9[4] = self;
  v7 = v4;
  v10 = v7;
  objc_msgSend(v6, "performBlock:waitUntilDone:", v9, 1);

  LOBYTE(v4) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v4;
}

- (BOOL)cancelIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  id *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "blockUntilConnected");

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_190777FF8;
  v11[3] = &unk_1E2C619E8;
  v13 = &v15;
  v11[4] = self;
  v9 = v6;
  v12 = v9;
  v14 = a4;
  objc_msgSend(v8, "performBlock:waitUntilDone:", v11, 1);

  LOBYTE(a4) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)a4;
}

- (BOOL)sendServerMessage:(id)a3 command:(id)a4 fromAccount:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "blockUntilConnected");

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_190778190;
  v17[3] = &unk_1E2C63810;
  v21 = &v22;
  v17[4] = self;
  v13 = v8;
  v18 = v13;
  v14 = v9;
  v19 = v14;
  v15 = v10;
  v20 = v15;
  objc_msgSend(v12, "performBlock:waitUntilDone:", v17, 1);

  LOBYTE(v8) = *((_BYTE *)v23 + 24);
  _Block_object_dispose(&v22, 8);

  return (char)v8;
}

- (unint64_t)registrationRestrictionReason
{
  void *v3;
  void *v4;
  unint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "blockUntilConnected");

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0xAAAAAAAAAAAAAAAALL;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1907782B0;
  v7[3] = &unk_1E2C60308;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlock:waitUntilDone:", v7, 1);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)serviceDomain
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
  v11 = sub_1906EE2A4;
  v12 = sub_1906EE124;
  v13 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1907783EC;
  v7[3] = &unk_1E2C60308;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlock:waitUntilDone:", v7, 1);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)iCloudAccount
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
  v11 = sub_1906EE2A4;
  v12 = sub_1906EE124;
  v13 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_190778530;
  v7[3] = &unk_1E2C60308;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlock:waitUntilDone:", v7, 1);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (NSSet)internalAccounts
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
  v11 = sub_1906EE2A4;
  v12 = sub_1906EE124;
  v13 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_190778674;
  v7[3] = &unk_1E2C60308;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlock:waitUntilDone:", v7, 1);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSSet *)v5;
}

- (NSString)serviceIdentifier
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
  v11 = sub_1906EE2A4;
  v12 = sub_1906EE124;
  v13 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1907787B8;
  v7[3] = &unk_1E2C60308;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlock:waitUntilDone:", v7, 1);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSString *)v5;
}

- (BOOL)canSend
{
  void *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "blockUntilConnected");

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1907788F8;
  v6[3] = &unk_1E2C60308;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v4, "performBlock:waitUntilDone:", v6, 1);

  LOBYTE(self) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)self;
}

- (id)deviceForFromID:(id)a3
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
  v16 = sub_1906EE2A4;
  v17 = sub_1906EE124;
  v18 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_190778A5C;
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

- (id)linkedDeviceForFromID:(id)a3 withRelationship:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  int64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "blockUntilConnected");

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1906EE2A4;
  v20 = sub_1906EE124;
  v21 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_190778BD8;
  v12[3] = &unk_1E2C619E8;
  v14 = &v16;
  v12[4] = self;
  v9 = v6;
  v13 = v9;
  v15 = a4;
  objc_msgSend(v8, "performBlock:waitUntilDone:", v12, 1);

  v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

- (id)firstRoutableInternetDestinationForSelf
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
  v11 = sub_1906EE2A4;
  v12 = sub_1906EE124;
  v13 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_190778D20;
  v7[3] = &unk_1E2C60308;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlock:waitUntilDone:", v7, 1);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)deviceForUniqueID:(id)a3
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
  v16 = sub_1906EE2A4;
  v17 = sub_1906EE124;
  v18 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_190778E8C;
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

- (id)devicesForBTUUID:(id)a3
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
  v16 = sub_1906EE2A4;
  v17 = sub_1906EE124;
  v18 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_190778FF8;
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

- (id)uriForFromID:(id)a3
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
  v16 = sub_1906EE2A4;
  v17 = sub_1906EE124;
  v18 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_190779164;
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

- (void)setPreferInfraWiFi:(BOOL)a3
{
  void *v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blockUntilConnected");

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_190779240;
  v7[3] = &unk_1E2C60620;
  v7[4] = self;
  v8 = a3;
  objc_msgSend(v6, "performBlock:", v7);

}

- (void)setNeedsLaunchOnNearbyDevicesChanged:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1907792D8;
  v6[3] = &unk_1E2C60620;
  v6[4] = self;
  v7 = a3;
  objc_msgSend(v5, "performBlock:", v6);

}

- (BOOL)needsLaunchOnNearbyDevicesChanged
{
  void *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "blockUntilConnected");

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_190779400;
  v6[3] = &unk_1E2C60308;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v4, "performBlock:waitUntilDone:", v6, 1);

  LOBYTE(self) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)self;
}

- (void)setLinkPreferences:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blockUntilConnected");

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_190779500;
  v8[3] = &unk_1E2C607A8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "performBlock:", v8);

}

- (void)startOTRTest:(int64_t)a3
{
  void *v5;
  void *v6;
  _QWORD v7[6];

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blockUntilConnected");

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1907795A8;
  v7[3] = &unk_1E2C60358;
  v7[4] = self;
  v7[5] = a3;
  objc_msgSend(v6, "performBlock:", v7);

}

- (void)setPretendingToBeFull:(BOOL)a3
{
  void *v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blockUntilConnected");

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_190779654;
  v7[3] = &unk_1E2C60620;
  v7[4] = self;
  v8 = a3;
  objc_msgSend(v6, "performBlock:", v7);

}

- (BOOL)isPretendingToBeFull
{
  void *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "blockUntilConnected");

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_190779750;
  v6[3] = &unk_1E2C60308;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v4, "performBlock:waitUntilDone:", v6, 1);

  LOBYTE(self) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)self;
}

- (void)testCloudQRConnection
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "blockUntilConnected");

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_190779814;
  v5[3] = &unk_1E2C60550;
  v5[4] = self;
  objc_msgSend(v4, "performBlock:", v5);

}

- (int64_t)maxHomeKitPayloadSize
{
  return 3072;
}

- (void)updateSubServices:(id)a3
{
  -[IDSService updateSubServices:forDevice:](self, "updateSubServices:forDevice:", a3, 0);
}

- (BOOL)updateSubServices:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v7 = a4;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "blockUntilConnected");

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_19077996C;
  v13[3] = &unk_1E2C61360;
  v16 = &v17;
  v13[4] = self;
  v10 = v6;
  v14 = v10;
  v11 = v7;
  v15 = v11;
  objc_msgSend(v9, "performBlock:waitUntilDone:", v13, 1);

  LOBYTE(v6) = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v17, 8);

  return (char)v6;
}

- (id)datagramConnectionForSessionDestination:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  id *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "blockUntilConnected");

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1906EE2A4;
  v20 = sub_1906EE124;
  v21 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_190779AE4;
  v12[3] = &unk_1E2C619E8;
  v14 = &v16;
  v12[4] = self;
  v9 = v6;
  v13 = v9;
  v15 = a4;
  objc_msgSend(v8, "performBlock:waitUntilDone:", v12, 1);

  v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

- (id)datagramConnectionForSessionDestination:(id)a3 uid:(unsigned int)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  id *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "blockUntilConnected");

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1906EE2A4;
  v23 = sub_1906EE124;
  v24 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_190779C6C;
  v14[3] = &unk_1E2C63838;
  v16 = &v19;
  v14[4] = self;
  v11 = v8;
  v18 = a4;
  v15 = v11;
  v17 = a5;
  objc_msgSend(v10, "performBlock:waitUntilDone:", v14, 1);

  v12 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v12;
}

- (id)datagramConnectionForSocketDescriptor:(int)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[7];
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "blockUntilConnected");

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1906EE2A4;
  v17 = sub_1906EE124;
  v18 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_190779DD0;
  v11[3] = &unk_1E2C63860;
  v11[4] = self;
  v11[5] = &v13;
  v12 = a3;
  v11[6] = a4;
  objc_msgSend(v8, "performBlock:waitUntilDone:", v11, 1);

  v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

- (id)streamConnectionForSessionDestination:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  id *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "blockUntilConnected");

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1906EE2A4;
  v20 = sub_1906EE124;
  v21 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_190779F54;
  v12[3] = &unk_1E2C619E8;
  v14 = &v16;
  v12[4] = self;
  v9 = v6;
  v13 = v9;
  v15 = a4;
  objc_msgSend(v8, "performBlock:waitUntilDone:", v12, 1);

  v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

- (id)streamConnectionForSocketDescriptor:(int)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[7];
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "blockUntilConnected");

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1906EE2A4;
  v17 = sub_1906EE124;
  v18 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_19077A0B4;
  v11[3] = &unk_1E2C63860;
  v11[4] = self;
  v11[5] = &v13;
  v12 = a3;
  v11[6] = a4;
  objc_msgSend(v8, "performBlock:waitUntilDone:", v11, 1);

  v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

- (id)datagramChannelForSessionDestination:(id)a3 error:(id *)a4
{
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0D345C8];
  v12[0] = *MEMORY[0x1E0D345C0];
  v12[1] = v6;
  v13[0] = &unk_1E2CAE2B8;
  v13[1] = &unk_1E2CAE2B8;
  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = a3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSService datagramChannelForSessionDestination:options:error:](self, "datagramChannelForSessionDestination:options:error:", v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)datagramChannelForSessionDestination:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t *v19;
  id *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "blockUntilConnected");

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1906EE2A4;
  v25 = sub_1906EE124;
  v26 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_19077A334;
  v16[3] = &unk_1E2C63888;
  v19 = &v21;
  v16[4] = self;
  v12 = v8;
  v17 = v12;
  v13 = v9;
  v18 = v13;
  v20 = a5;
  objc_msgSend(v11, "performBlock:waitUntilDone:", v16, 1);

  v14 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v14;
}

- (id)datagramChannelForSocketDescriptor:(int)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[7];
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "blockUntilConnected");

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1906EE2A4;
  v17 = sub_1906EE124;
  v18 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_19077A498;
  v11[3] = &unk_1E2C63860;
  v11[4] = self;
  v11[5] = &v13;
  v12 = a3;
  v11[6] = a4;
  objc_msgSend(v8, "performBlock:waitUntilDone:", v11, 1);

  v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

- (id)aliases
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[IDSService accounts](self, "accounts", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "aliasStrings");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend((id)objc_opt_class(), "removeSentinelFromAliases:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)activateAlias:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0D36AA8], "registration", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    sub_1907F4D30(v3, v4, v5, v6, v7, v8, v9, v10);

}

- (void)activateAliases:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0D36AA8], "registration", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    sub_1907F4DA0(v3, v4, v5, v6, v7, v8, v9, v10);

}

- (void)deactivateAlias:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0D36AA8], "registration", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    sub_1907F4E10(v3, v4, v5, v6, v7, v8, v9, v10);

}

- (void)deactivateAliases:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0D36AA8], "registration", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    sub_1907F4E80(v3, v4, v5, v6, v7, v8, v9, v10);

}

- (id)_accountWithAlias:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[IDSService accounts](self, "accounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_19077A7F4;
  v10[3] = &unk_1E2C638B0;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "objectsPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)removeSentinelFromAliases:(id)a3
{
  return (id)objc_msgSend(a3, "__imSetByApplyingBlock:", &unk_1E2C5F0B0);
}

- (int64_t)maxEffectivePayloadSize
{
  void *v3;
  void *v4;
  int64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "blockUntilConnected");

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0xAAAAAAAAAAAAAAAALL;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_19077A978;
  v7[3] = &unk_1E2C60308;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlock:waitUntilDone:", v7, 1);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (NSArray)URIs
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
  v11 = sub_1906EE2A4;
  v12 = sub_1906EE124;
  v13 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_19077AAB4;
  v7[3] = &unk_1E2C60308;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlock:waitUntilDone:", v7, 1);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (NSDictionary)pseudonymURIMap
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
  v11 = sub_1906EE2A4;
  v12 = sub_1906EE124;
  v13 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_19077ABF8;
  v7[3] = &unk_1E2C60308;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlock:waitUntilDone:", v7, 1);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSDictionary *)v5;
}

- (id)pseudonymForPseudonymURI:(id)a3
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
  v16 = sub_1906EE2A4;
  v17 = sub_1906EE124;
  v18 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_19077AD64;
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

- (id)pseudonymsForMaskedURI:(id)a3
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
  v16 = sub_1906EE2A4;
  v17 = sub_1906EE124;
  v18 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_19077AED0;
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

- (id)pseudonymsForMaskedURI:(id)a3 matchingProperties:(id)a4
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
  v21 = sub_1906EE2A4;
  v22 = sub_1906EE124;
  v23 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_19077B068;
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

- (void)provisionPseudonymWithProperties:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0D34E20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "defaultProperties");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[IDSService provisionPseudonymWithProperties:requestProperties:completion:](self, "provisionPseudonymWithProperties:requestProperties:completion:", v8, v9, v7);

}

- (void)provisionPseudonymWithProperties:(id)a3 requestProperties:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("IDSService.m"), 631, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requestProperties"));

  }
  v12 = (void *)objc_msgSend(v10, "copy");

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "blockUntilConnected");

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_19077B284;
  v19[3] = &unk_1E2C61008;
  v19[4] = self;
  v20 = v9;
  v21 = v12;
  v22 = v11;
  v15 = v11;
  v16 = v12;
  v17 = v9;
  objc_msgSend(v14, "performBlock:", v19);

}

- (void)provisionPseudonymForURI:(id)a3 withProperties:(id)a4 requestProperties:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("IDSService.m"), 640, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requestProperties"));

  }
  v15 = (void *)objc_msgSend(v13, "copy");

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "blockUntilConnected");

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_19077B49C;
  v23[3] = &unk_1E2C62450;
  v23[4] = self;
  v24 = v11;
  v25 = v12;
  v26 = v15;
  v27 = v14;
  v18 = v14;
  v19 = v15;
  v20 = v12;
  v21 = v11;
  objc_msgSend(v17, "performBlock:", v23);

}

- (void)provisionPseudonymForURI:(id)a3 withProperties:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v8 = (void *)MEMORY[0x1E0D34E20];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "defaultProperties");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[IDSService provisionPseudonymForURI:withProperties:requestProperties:completion:](self, "provisionPseudonymForURI:withProperties:requestProperties:completion:", v11, v10, v12, v9);

}

- (void)renewPseudonym:(id)a3 forUpdatedDuration:(double)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  double v11;
  id v12;

  v8 = (void *)MEMORY[0x1E0C99D68];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "date");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSince1970");
  -[IDSService renewPseudonym:forUpdatedExpiryEpoch:completion:](self, "renewPseudonym:forUpdatedExpiryEpoch:completion:", v10, v9, v11 + a4);

}

- (void)renewPseudonym:(id)a3 forUpdatedExpiryEpoch:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  double v17;

  v8 = a3;
  v9 = a5;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "blockUntilConnected");

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_19077B734;
  v14[3] = &unk_1E2C604C0;
  v14[4] = self;
  v15 = v8;
  v17 = a4;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v11, "performBlock:", v14);

}

- (void)revokePseudonym:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "blockUntilConnected");

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_19077B880;
  v12[3] = &unk_1E2C60730;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "performBlock:", v12);

}

- (id)pseudonymPropertiesWithFeatureID:(id)a3 scopeID:(id)a4 expiryDurationInSeconds:(double)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t *v19;
  double v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "blockUntilConnected");

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1906EE2A4;
  v25 = sub_1906EE124;
  v26 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_19077BA4C;
  v16[3] = &unk_1E2C63888;
  v19 = &v21;
  v16[4] = self;
  v12 = v8;
  v17 = v12;
  v13 = v9;
  v18 = v13;
  v20 = a5;
  objc_msgSend(v11, "performBlock:waitUntilDone:", v16, 1);

  v14 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v14;
}

- (id)pseudonymPropertiesWithFeatureID:(id)a3 expiryDurationInSeconds:(double)a4
{
  return -[IDSService pseudonymPropertiesWithFeatureID:scopeID:expiryDurationInSeconds:](self, "pseudonymPropertiesWithFeatureID:scopeID:expiryDurationInSeconds:", a3, 0, a4);
}

- (void)retrieveFirewallWithQueue:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  IDSFirewall *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("IDSService.m"), 686, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("IDSService.m"), 687, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  -[IDSService serviceIdentifier](self, "serviceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = -[IDSFirewall initWithService:queue:]([IDSFirewall alloc], "initWithService:queue:", v10, v7);
    -[IDSFirewall populateImpactedServices:](v11, "populateImpactedServices:", v9);
  }
  else
  {
    +[IDSLogging IDSService](IDSLogging, "IDSService");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907F4EF0((uint64_t)self, v12, v13);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 19, 0);
    v11 = (IDSFirewall *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, IDSFirewall *))v9)[2](v9, 0, v11);
  }

}

- (void)signData:(id)a3 withAlgorithm:(int64_t)a4 completion:(id)a5
{
  MEMORY[0x1E0DE7D20](self, sel_signData_withAlgorithm_options_completion_);
}

- (void)signData:(id)a3 withAlgorithm:(int64_t)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  int64_t v22;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "blockUntilConnected");

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_19077BD50;
  v18[3] = &unk_1E2C638D8;
  v18[4] = self;
  v19 = v10;
  v21 = v12;
  v22 = a4;
  v20 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  objc_msgSend(v14, "performBlock:", v18);

}

- (void)verifySignedData:(id)a3 matchesExpectedData:(id)a4 withTokenURI:(id)a5 forAlgorithm:(int64_t)a6 completion:(id)a7
{
  MEMORY[0x1E0DE7D20](self, sel_verifySignedData_matchesExpectedData_withTokenURI_forAlgorithm_options_completion_);
}

- (void)verifySignedData:(id)a3 matchesExpectedData:(id)a4 withTokenURI:(id)a5 forAlgorithm:(int64_t)a6 options:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  int64_t v32;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "blockUntilConnected");

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = sub_19077BECC;
  v26[3] = &unk_1E2C63900;
  v26[4] = self;
  v27 = v14;
  v28 = v15;
  v29 = v16;
  v31 = v18;
  v32 = a6;
  v30 = v17;
  v21 = v18;
  v22 = v17;
  v23 = v16;
  v24 = v15;
  v25 = v14;
  objc_msgSend(v20, "performBlock:", v26);

}

- (void)reportAction:(int64_t)a3 ofTempURI:(id)a4 fromURI:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  int64_t v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "blockUntilConnected");

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_19077BFF4;
  v18[3] = &unk_1E2C638D8;
  v21 = v12;
  v22 = a3;
  v18[4] = self;
  v19 = v10;
  v20 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  objc_msgSend(v14, "performBlock:", v18);

}

- (void)scheduleTransactionLogTask:(id)a3
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
  v7[2] = sub_19077C0A8;
  v7[3] = &unk_1E2C607A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

@end
