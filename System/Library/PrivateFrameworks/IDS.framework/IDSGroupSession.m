@implementation IDSGroupSession

- (IDSGroupSession)initWithAccount:(id)a3 destinations:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  IDSGroupSession *v14;
  void *v15;
  _QWORD v17[4];
  IDSGroupSession *v18;
  id v19;
  id v20;
  id v21;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "assertQueueIsNotCurrent");

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1907E7954();

  }
  v22.receiver = self;
  v22.super_class = (Class)IDSGroupSession;
  v14 = -[IDSGroupSession init](&v22, sel_init);
  if (v14)
  {
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_1906FE498;
    v17[3] = &unk_1E2C60C50;
    v18 = v14;
    v19 = v8;
    v20 = v9;
    v21 = v10;
    objc_msgSend(v15, "performBlock:", v17);

  }
  return v14;
}

- (IDSGroupSession)initWithAccount:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  IDSGroupSession *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  IDSGroupSession *v16;
  id v17;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "assertQueueIsNotCurrent");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907E79E0();

  }
  v18.receiver = self;
  v18.super_class = (Class)IDSGroupSession;
  v11 = -[IDSGroupSession init](&v18, sel_init);
  if (v11)
  {
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1906FE620;
    v14[3] = &unk_1E2C602B8;
    v15 = v7;
    v16 = v11;
    v17 = v6;
    objc_msgSend(v12, "performBlock:", v14);

  }
  return v11;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _IDSGroupSession *v7;

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = sub_1906EE1B4;
  v6[4] = sub_1906EE0AC;
  v7 = (_IDSGroupSession *)0xAAAAAAAAAAAAAAAALL;
  v7 = self->_internal;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1906FE7BC;
  v5[3] = &unk_1E2C602E0;
  v5[4] = v6;
  objc_msgSend(v3, "performBlock:waitUntilDone:", v5, 0);

  _Block_object_dispose(v6, 8);
  v4.receiver = self;
  v4.super_class = (Class)IDSGroupSession;
  -[IDSGroupSession dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{
  void *v3;
  _QWORD v4[5];

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1906FE858;
  v4[3] = &unk_1E2C60550;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

- (id)_internal_sessionWithValidityCheck
{
  void *v3;
  int v4;
  NSObject *v5;
  _IDSGroupSession *internal;
  NSObject *v7;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907E7AF4();

  }
  internal = self->_internal;
  if (!internal)
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907E7A6C((uint64_t)self, (uint64_t *)&self->_internal, v7);

    internal = self->_internal;
  }
  return internal;
}

- (NSString)sessionID
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
  v10 = sub_1906EE1B4;
  v11 = sub_1906EE0AC;
  v12 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1906FEADC;
  v6[3] = &unk_1E2C60308;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performBlock:waitUntilDone:", v6, 1);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (id)sessionIDAliasWithSalt:(id)a3
{
  id v4;
  void *v5;
  id v6;
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
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1906EE1B4;
  v16 = sub_1906EE0AC;
  v17 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1906FEC2C;
  v9[3] = &unk_1E2C60780;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "performBlock:waitUntilDone:", v9, 1);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (unint64_t)createAliasForParticipantID:(unint64_t)a3 salt:(id)a4
{
  id v5;
  unint64_t v6;
  NSObject *v7;
  int v9;
  unint64_t v10;
  __int16 v11;
  unint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = IDSIDAliasHashUInt64();
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218498;
    v10 = v6;
    v11 = 2048;
    v12 = a3;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "createAliasForParticipantID created %llu from %llu and %@", (uint8_t *)&v9, 0x20u);
  }

  return v6;
}

- (unint64_t)createAliasForLocalParticipantIDWithSalt:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  unint64_t v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1906FEED8;
  v11[3] = &unk_1E2C60C78;
  v11[4] = self;
  v13 = &v14;
  v6 = v4;
  v12 = v6;
  objc_msgSend(v5, "performBlock:waitUntilDone:", v11, 1);

  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v15[3];
    *(_DWORD *)buf = 134217984;
    v19 = v8;
    _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "createAliasForLocalParticipantIDWithSalt created and returning %llu", buf, 0xCu);
  }

  v9 = v15[3];
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (unint64_t)participantIDForAlias:(unint64_t)a3 salt:(id)a4
{
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  unint64_t v13;
  uint8_t v15[8];
  _QWORD v16[5];
  id v17;
  NSObject *v18;
  uint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a4;
  v7 = dispatch_semaphore_create(0);
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1906FF164;
  v16[3] = &unk_1E2C60CC8;
  v16[4] = self;
  v20 = a3;
  v9 = v6;
  v17 = v9;
  v19 = &v21;
  v10 = v7;
  v18 = v10;
  objc_msgSend(v8, "performBlock:", v16);

  v11 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v10, v11))
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "IDS daemon took too long to respond to participantIDForAlias:salt:", v15, 2u);
    }

  }
  v13 = v22[3];

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (void)createSessionIDAliasWithSalt:(id)a3 completionHandler:(id)a4
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
  v11[2] = sub_1906FF2CC;
  v11[3] = &unk_1E2C60730;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlock:", v11);

}

- (void)createAliasForParticipantID:(unint64_t)a3 salt:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a4;
  v9 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1906FF3AC;
  v13[3] = &unk_1E2C604C0;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "performBlock:", v13);

}

- (void)createAliasForLocalParticipantIDWithSalt:(id)a3 completionHandler:(id)a4
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
  v11[2] = sub_1906FF480;
  v11[3] = &unk_1E2C60730;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlock:", v11);

}

- (void)getParticipantIDForAlias:(unint64_t)a3 salt:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a4;
  v9 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1906FF560;
  v13[3] = &unk_1E2C604C0;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "performBlock:", v13);

}

- (NSString)destination
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
  v10 = sub_1906EE1B4;
  v11 = sub_1906EE0AC;
  v12 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1906FF660;
  v6[3] = &unk_1E2C60308;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performBlock:waitUntilDone:", v6, 1);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (unsigned)state
{
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = -1431655766;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1906FF790;
  v5[3] = &unk_1E2C60308;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlock:waitUntilDone:", v5, 1);

  LODWORD(self) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return self;
}

- (unsigned)sessionEndedReason
{
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = -1431655766;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1906FF890;
  v5[3] = &unk_1E2C60308;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlock:waitUntilDone:", v5, 1);

  LODWORD(self) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return self;
}

- (NSSet)requiredCapabilities
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
  v10 = sub_1906EE1B4;
  v11 = sub_1906EE0AC;
  v12 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1906FF9B0;
  v6[3] = &unk_1E2C60308;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performBlock:waitUntilDone:", v6, 1);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

- (NSSet)requiredLackOfCapabilities
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
  v10 = sub_1906EE1B4;
  v11 = sub_1906EE0AC;
  v12 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1906FFAD8;
  v6[3] = &unk_1E2C60308;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performBlock:waitUntilDone:", v6, 1);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

- (void)setDelegate:(id)a3 queue:(id)a4
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
  v11[2] = sub_1906FFBD4;
  v11[3] = &unk_1E2C602B8;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlock:", v11);

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
      sub_1907E7B80();

  }
  return self->_internal;
}

- (void)updateMembers:(id)a3 withContext:(id)a4 triggeredLocally:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1906FFD60;
  v13[3] = &unk_1E2C60CF0;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "performBlock:", v13);

}

- (void)updateMembers:(id)a3 withContext:(id)a4 messagingCapabilities:(id)a5 triggeredLocally:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1906FFE94;
  v17[3] = &unk_1E2C60D18;
  v17[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21 = a6;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  objc_msgSend(v13, "performBlock:", v17);

}

- (void)manageDesignatedMembers:(id)a3 withType:(unsigned __int16)a4
{
  unsigned int v4;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  __int16 v11;
  uint8_t buf[4];
  unsigned int v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v4 < 0xE)
  {
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_190700010;
    v9[3] = &unk_1E2C60D40;
    v9[4] = self;
    v10 = v6;
    v11 = v4;
    objc_msgSend(v8, "performBlock:", v9);

  }
  else
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v13 = v4;
      _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "manageDesignatedMembers: invalid type: %u", buf, 8u);
    }

  }
}

- (void)removeParticipants:(id)a3
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
  v7[2] = sub_1907000F0;
  v7[3] = &unk_1E2C607A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)updateParticipantData:(id)a3 withContext:(id)a4
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
  v11[2] = sub_1907001F0;
  v11[3] = &unk_1E2C602B8;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlock:", v11);

}

- (void)updateParticipantInfo:(id)a3
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
  v7[2] = sub_1907002CC;
  v7[3] = &unk_1E2C607A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)setParticipantInfo:(id)a3
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
  v7[2] = sub_1907003A8;
  v7[3] = &unk_1E2C607A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)updateParticipantType:(unsigned __int16)a3 members:(id)a4 withContext:(id)a5 triggeredLocally:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  unsigned __int16 v18;
  BOOL v19;

  v10 = a4;
  v11 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1907004C0;
  v15[3] = &unk_1E2C60D68;
  v18 = a3;
  v15[4] = self;
  v16 = v10;
  v17 = v11;
  v19 = a6;
  v13 = v11;
  v14 = v10;
  objc_msgSend(v12, "performBlock:", v15);

}

- (void)joinWithOptions:(id)a3
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
  v7[2] = sub_1907005A4;
  v7[3] = &unk_1E2C607A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)leaveGroupSession
{
  void *v3;
  _QWORD v4[5];

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_190700658;
  v4[3] = &unk_1E2C60550;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

- (void)leaveGroupSessionWithOptions:(id)a3
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
  v7[2] = sub_190700728;
  v7[3] = &unk_1E2C607A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)reconnectUPlusOneSession
{
  void *v3;
  _QWORD v4[5];

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1907007DC;
  v4[3] = &unk_1E2C60550;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

- (void)setPreferences:(id)a3
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
  v7[2] = sub_1907008A8;
  v7[3] = &unk_1E2C607A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)setRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "copy");
  v8 = (void *)objc_msgSend(v6, "copy");

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1907009BC;
  v12[3] = &unk_1E2C602B8;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v9, "performBlock:", v12);

}

- (void)requestActiveParticipants
{
  void *v3;
  _QWORD v4[5];

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_190700A70;
  v4[3] = &unk_1E2C60550;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

- (void)registerPluginWithOptions:(id)a3
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
  v7[2] = sub_190700B40;
  v7[3] = &unk_1E2C607A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)unregisterPluginWithOptions:(id)a3
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
  v7[2] = sub_190700C1C;
  v7[3] = &unk_1E2C607A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)setCallScreeningMode:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_190700CE0;
  v6[3] = &unk_1E2C60620;
  v6[4] = self;
  v7 = a3;
  objc_msgSend(v5, "performBlock:", v6);

}

- (void)setForceTCPFallbackOnWiFiUsingReinitiate:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_190700DA4;
  v6[3] = &unk_1E2C60620;
  v6[4] = self;
  v7 = a3;
  objc_msgSend(v5, "performBlock:", v6);

}

- (void)setForceTCPFallbackOnCellUsingReinitiate:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_190700E68;
  v6[3] = &unk_1E2C60620;
  v6[4] = self;
  v7 = a3;
  objc_msgSend(v5, "performBlock:", v6);

}

- (void)requestURIsForParticipantIDs:(id)a3 completionHandler:(id)a4
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
  v11[2] = sub_190700F68;
  v11[3] = &unk_1E2C60730;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlock:", v11);

}

- (id)unicastParameterForParticipantID:(unint64_t)a3 dataMode:(int64_t)a4 connectionIndex:(unint64_t)a5
{
  void *v9;
  void *v10;

  IDSIDAliasFixedSalt();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSGroupSession unicastParameterForParticipantIDAlias:salt:dataMode:connectionIndex:](self, "unicastParameterForParticipantIDAlias:salt:dataMode:connectionIndex:", -[IDSGroupSession createAliasForParticipantID:salt:](self, "createAliasForParticipantID:salt:", a3, v9), v9, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)unicastParameterForParticipantIDAlias:(unint64_t)a3 salt:(id)a4 dataMode:(int64_t)a5 connectionIndex:(unint64_t)a6
{
  id v10;
  void *v11;
  IDSGroupSessionUnicastParameter *v12;

  v10 = a4;
  -[IDSGroupSession sessionIDAliasWithSalt:](self, "sessionIDAliasWithSalt:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[IDSGroupSessionUnicastParameter initWithGroupSessionID:localParticipantID:remoteParticipantID:salt:dataMode:connectionIndex:]([IDSGroupSessionUnicastParameter alloc], "initWithGroupSessionID:localParticipantID:remoteParticipantID:salt:dataMode:connectionIndex:", v11, -[IDSGroupSession createAliasForLocalParticipantIDWithSalt:](self, "createAliasForLocalParticipantIDWithSalt:", v10), a3, v10, a5, a6);

  return v12;
}

+ (void)requestNWConnectionforIDSGroupSessionUnicastParameter:(id)a3 withCompletionHandler:(id)a4
{
  MEMORY[0x1E0DE7D20](a3, sel__requestNWConnectionforIDSGroupSessionUnicastParameter_);
}

- (id)unicastConnectorWithDataMode:(int64_t)a3
{
  void *v5;
  void *v6;
  IDSGroupSessionUnicastConnector *v7;

  IDSIDAliasFixedSalt();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSGroupSession sessionIDAliasWithSalt:](self, "sessionIDAliasWithSalt:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IDSGroupSessionUnicastConnector initWithGroupSessionIDAlias:participantIDAlias:salt:dataMode:]([IDSGroupSessionUnicastConnector alloc], "initWithGroupSessionIDAlias:participantIDAlias:salt:dataMode:", v6, -[IDSGroupSession createAliasForLocalParticipantIDWithSalt:](self, "createAliasForLocalParticipantIDWithSalt:", v5), v5, a3);

  return v7;
}

+ (void)requestNWConnectionWithDataBlob:(id)a3 completionHandler:(id)a4
{
  MEMORY[0x1E0DE7D20](IDSGroupSessionUnicastConnector, sel_requestNWConnectionWithDataBlob_completionHandler_);
}

+ (id)augmentNetworkParametersForSession:(id)a3 participantID:(unint64_t)a4 parameters:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = (void *)MEMORY[0x1E0C99D50];
  v8 = a5;
  v9 = a3;
  objc_msgSend(v7, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[IDSGroupSession augmentNetworkParametersForSessionAlias:participantIDAlias:salt:parameters:](IDSGroupSession, "augmentNetworkParametersForSessionAlias:participantIDAlias:salt:parameters:", v9, a4, v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)augmentNetworkParametersForSessionAlias:(id)a3 participantIDAlias:(unint64_t)a4 salt:(id)a5 parameters:(id)a6
{
  id v9;
  id v10;
  id v11;
  xpc_object_t v12;
  xpc_object_t v13;
  id v14;
  id v15;
  id v16;
  nw_endpoint_t host;
  nw_endpoint_t v18;

  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = xpc_array_create(0, 0);
  v13 = xpc_array_create(0, 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%u"), *MEMORY[0x1E0D34990], getuid());
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_array_set_string(v12, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend(v14, "UTF8String"));

  xpc_array_set_string(v13, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend((id)*MEMORY[0x1E0D34998], "UTF8String"));
  nw_parameters_set_required_netagent_classes();
  v15 = objc_alloc_init(MEMORY[0x1E0D34D68]);
  objc_msgSend(v15, "setMultiplexer:", CFSTR("groupsession"));
  objc_msgSend(v15, "setSessionID:", v11);

  objc_msgSend(v15, "setParticipantID:", a4);
  objc_msgSend(v15, "setSalt:", v10);

  objc_msgSend(v15, "stringRepresentation");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v16, "UTF8String");
  nw_parameters_set_account_id();

  host = nw_endpoint_create_host("0.0.0.0", "0");
  MEMORY[0x19400FB34](v9, host);

  v18 = nw_endpoint_create_host("0.0.0.0", "3030");
  return v18;
}

+ (id)createEndpointForSessionIDAlias:(id)a3 topic:(id)a4 participantIDAlias:(unint64_t)a5 salt:(id)a6
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *apple_service;

  v9 = (objc_class *)MEMORY[0x1E0D34D68];
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(v9);
  objc_msgSend(v13, "setMultiplexer:", CFSTR("groupsession"));
  objc_msgSend(v13, "setSessionID:", v12);

  objc_msgSend(v13, "setParticipantID:", a5);
  objc_msgSend(v13, "setSalt:", v10);

  objc_msgSend(v13, "stringRepresentation");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "UTF8String");
  v15 = objc_retainAutorelease(v11);
  objc_msgSend(v15, "UTF8String");

  apple_service = (void *)nw_endpoint_create_apple_service();
  return apple_service;
}

+ (id)createGroupDescriptorForSessionIDAlias:(id)a3 topic:(id)a4 salt:(id)a5
{
  void *v5;
  void *apple_id;

  +[IDSGroupSession createEndpointForSessionIDAlias:topic:participantIDAlias:salt:](IDSGroupSession, "createEndpointForSessionIDAlias:topic:participantIDAlias:salt:", a3, a4, 0, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  apple_id = (void *)nw_group_descriptor_create_apple_id();

  return apple_id;
}

+ (void)augmentConnectionGroupNetworkParameters:(id)a3
{
  id v3;
  xpc_object_t v4;
  id v5;

  v3 = a3;
  v5 = xpc_array_create(0, 0);
  xpc_array_set_string(v5, 0xFFFFFFFFFFFFFFFFLL, "com.apple.ids");
  v4 = xpc_array_create(0, 0);
  xpc_array_set_string(v4, 0xFFFFFFFFFFFFFFFFLL, "IDSGroupAgent");
  nw_parameters_set_required_netagent_classes();

}

- (void)requestDataCryptorForTopic:(id)a3 completionHandler:(id)a4
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
  v11[2] = sub_190701624;
  v11[3] = &unk_1E2C60730;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlock:", v11);

}

- (void)requestEncryptionKeyForParticipants:(id)a3
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
  v7[2] = sub_190701700;
  v7[3] = &unk_1E2C607A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (id)keyValueDelivery
{
  void *v2;
  void *v3;

  -[IDSGroupSession _internal_sessionWithValidityCheck](self, "_internal_sessionWithValidityCheck");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyValueDelivery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)keyValueDeliveryForSessionID:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](_IDSGroupSession, sel_keyValueDeliveryForSessionID_);
}

- (id)broadcastParameterForService:(id)a3
{
  id v4;
  IDSGroupSessionBroadcastParameter *v5;
  void *v6;
  void *v7;
  IDSGroupSessionBroadcastParameter *v8;

  v4 = a3;
  v5 = [IDSGroupSessionBroadcastParameter alloc];
  -[IDSGroupSession sessionID](self, "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  IDSIDAliasFixedSalt();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IDSGroupSessionBroadcastParameter initWithGroupSessionID:salt:serviceName:](v5, "initWithGroupSessionID:salt:serviceName:", v6, v7, v4);

  return v8;
}

+ (void)requestNWConnectionforIDSGroupSessionBroadcastParameter:(id)a3 withCompletionHandler:(id)a4
{
  MEMORY[0x1E0DE7D20](a3, sel__requestNWConnectionforIDSGroupSessionBroadcastParameter_);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
