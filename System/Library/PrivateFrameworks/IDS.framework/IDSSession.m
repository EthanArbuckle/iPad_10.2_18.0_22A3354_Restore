@implementation IDSSession

- (IDSSession)initWithAccount:(id)a3 destinations:(id)a4 transportType:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  IDSSession *v11;
  void *v12;
  int v13;
  NSObject *v14;
  IDSSession *v15;
  IDSSession *v16;
  void *v17;
  _QWORD v19[4];
  IDSSession *v20;
  id v21;
  id v22;
  int64_t v23;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  if (_IDSRunningInDaemon())
  {
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907E9514();

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
        sub_1907E9590();

    }
    v24.receiver = self;
    v24.super_class = (Class)IDSSession;
    v15 = -[IDSSession init](&v24, sel_init);
    v16 = v15;
    if (v15)
    {
      v15->_uniqueIDLock._os_unfair_lock_opaque = 0;
      +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = sub_19071EA38;
      v19[3] = &unk_1E2C60330;
      v20 = v16;
      v21 = v8;
      v22 = v9;
      v23 = a5;
      objc_msgSend(v17, "performBlock:waitUntilDone:", v19, 1);

    }
    self = v16;
    v11 = self;
  }

  return v11;
}

- (IDSSession)initWithAccount:(id)a3 destinations:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  IDSSession *v12;
  void *v13;
  int v14;
  NSObject *v15;
  IDSSession *v16;
  IDSSession *v17;
  void *v18;
  _QWORD v20[4];
  IDSSession *v21;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_IDSRunningInDaemon())
  {
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1907E9514();

    v12 = 0;
  }
  else
  {
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "assertQueueIsNotCurrent");

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_1907E961C();

    }
    v25.receiver = self;
    v25.super_class = (Class)IDSSession;
    v16 = -[IDSSession init](&v25, sel_init);
    v17 = v16;
    if (v16)
    {
      v16->_uniqueIDLock._os_unfair_lock_opaque = 0;
      +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = sub_19071EC88;
      v20[3] = &unk_1E2C60C50;
      v21 = v17;
      v22 = v8;
      v23 = v9;
      v24 = v10;
      objc_msgSend(v18, "performBlock:waitUntilDone:", v20, 1);

    }
    self = v17;
    v12 = self;
  }

  return v12;
}

- (id)_initWithAccount:(id)a3 destinations:(id)a4 transportType:(int64_t)a5 uniqueID:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  IDSSession *v14;
  void *v15;
  int v16;
  NSObject *v17;
  IDSSession *v18;
  _IDSSession *v19;
  _IDSSession *internal;
  void *v21;
  uint64_t v22;
  NSString *uniqueID;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (_IDSRunningInDaemon())
  {
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1907E9514();

    v14 = 0;
  }
  else
  {
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "assertQueueIsCurrent");

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_1907E96A8();

    }
    v25.receiver = self;
    v25.super_class = (Class)IDSSession;
    v18 = -[IDSSession init](&v25, sel_init);
    if (v18)
    {
      v19 = -[_IDSSession initWithAccount:destinations:transportType:uniqueID:delegateContext:]([_IDSSession alloc], "initWithAccount:destinations:transportType:uniqueID:delegateContext:", v10, v11, a5, v12, v18);
      internal = v18->_internal;
      v18->_internal = v19;

      v18->_uniqueIDLock._os_unfair_lock_opaque = 0;
      os_unfair_lock_lock(&v18->_uniqueIDLock);
      -[_IDSSession uniqueID](v18->_internal, "uniqueID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "copy");
      uniqueID = v18->_uniqueID;
      v18->_uniqueID = (NSString *)v22;

      os_unfair_lock_unlock(&v18->_uniqueIDLock);
    }
    self = v18;
    v14 = self;
  }

  return v14;
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[8];
  _QWORD v7[5];
  _QWORD v8[5];
  _IDSSession *v9;

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = sub_1906EE204;
  v8[4] = sub_1906EE0D4;
  v9 = (_IDSSession *)0xAAAAAAAAAAAAAAAALL;
  v9 = self->_internal;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_19071F008;
  v7[3] = &unk_1E2C602E0;
  v7[4] = v8;
  objc_msgSend(v3, "performBlock:waitUntilDone:", v7, 0);

  +[IDSLogging IDSSession](IDSLogging, "IDSSession");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906E0000, v4, OS_LOG_TYPE_INFO, "IDSSession dealloced", buf, 2u);
  }

  _Block_object_dispose(v8, 8);
  v5.receiver = self;
  v5.super_class = (Class)IDSSession;
  -[IDSSession dealloc](&v5, sel_dealloc);
}

- (int)socket
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
  v5[2] = sub_19071F0FC;
  v5[3] = &unk_1E2C60308;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlock:waitUntilDone:", v5, 1);

  LODWORD(self) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)self;
}

- (NSString)sessionID
{
  os_unfair_lock_s *p_uniqueIDLock;
  void *v4;

  p_uniqueIDLock = &self->_uniqueIDLock;
  os_unfair_lock_lock(&self->_uniqueIDLock);
  -[IDSSession uniqueID](self, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_uniqueIDLock);
  return (NSString *)v4;
}

- (NSString)destination
{
  os_unfair_lock_s *p_uniqueIDLock;
  void *v4;
  void *v5;

  p_uniqueIDLock = &self->_uniqueIDLock;
  os_unfair_lock_lock(&self->_uniqueIDLock);
  -[IDSSession uniqueID](self, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_uniqueIDLock);
  objc_msgSend(CFSTR("session:"), "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)description
{
  os_unfair_lock_s *p_uniqueIDLock;
  void *v4;

  p_uniqueIDLock = &self->_uniqueIDLock;
  os_unfair_lock_lock(&self->_uniqueIDLock);
  -[IDSSession uniqueID](self, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_uniqueIDLock);
  return v4;
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
  v5[2] = sub_19071F2E4;
  v5[3] = &unk_1E2C60308;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlock:waitUntilDone:", v5, 1);

  LODWORD(self) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return self;
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
  v11[2] = sub_19071F3D8;
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
      sub_1907E9734();

  }
  return self->_internal;
}

- (unint64_t)initialLinkType
{
  void *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0xAAAAAAAAAAAAAAAALL;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_19071F534;
  v6[3] = &unk_1E2C60308;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performBlock:waitUntilDone:", v6, 1);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)sendInvitation
{
  MEMORY[0x1E0DE7D20](self, sel_sendInvitationWithOptions_);
}

- (void)sendInvitationWithOptions:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("direction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    +[IDSLogging IDSSession](IDSLogging, "IDSSession");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v4;
      _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_INFO, "Received invalid options %@, bailing", buf, 0xCu);
    }
  }
  else
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", objc_msgSend(v5, "BOOLValue"));
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v6, CFSTR("direction"), 0);
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_19071F71C;
    v10[3] = &unk_1E2C607A8;
    v10[4] = self;
    v11 = v7;
    v9 = v7;
    objc_msgSend(v8, "performBlock:", v10);

  }
}

- (void)sendInvitationWithData:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_sendInvitationWithData_declineOnError_);
}

- (void)sendInvitationWithData:(id)a3 declineOnError:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;

  v6 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_19071F7D4;
  v9[3] = &unk_1E2C61998;
  v9[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  objc_msgSend(v7, "performBlock:", v9);

}

- (void)setStreamPreferences:(id)a3
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
  v7[2] = sub_19071F884;
  v7[3] = &unk_1E2C607A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (id)_streamPreferences
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
  v10 = sub_1906EE204;
  v11 = sub_1906EE0D4;
  v12 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_19071F97C;
  v6[3] = &unk_1E2C60308;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performBlock:waitUntilDone:", v6, 1);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)cancelInvitationWithRemoteEndedReasonOverride:(unsigned int)a3
{
  void *v5;
  _QWORD v6[5];
  unsigned int v7;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_19071FA3C;
  v6[3] = &unk_1E2C619C0;
  v6[4] = self;
  v7 = a3;
  objc_msgSend(v5, "performBlock:", v6);

}

- (void)cancelInvitationWithData:(id)a3
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
  v7[2] = sub_19071FAEC;
  v7[3] = &unk_1E2C607A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)acceptInvitationWithData:(id)a3
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
  v7[2] = sub_19071FB94;
  v7[3] = &unk_1E2C607A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)declineInvitationWithData:(id)a3
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
  v7[2] = sub_19071FC3C;
  v7[3] = &unk_1E2C607A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)cancelInvitation
{
  void *v3;
  _QWORD v4[5];

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_19071FCBC;
  v4[3] = &unk_1E2C60550;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

- (void)acceptInvitation
{
  void *v3;
  _QWORD v4[5];

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_19071FD3C;
  v4[3] = &unk_1E2C60550;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

- (void)declineInvitation
{
  void *v3;
  _QWORD v4[5];

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_19071FDBC;
  v4[3] = &unk_1E2C60550;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

- (void)endSession
{
  void *v3;
  _QWORD v4[5];

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_19071FE3C;
  v4[3] = &unk_1E2C60550;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

- (void)endSessionWithData:(id)a3
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
  v7[2] = sub_19071FEE4;
  v7[3] = &unk_1E2C607A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)sendSessionMessage:(id)a3
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
  v7[2] = sub_19071FF8C;
  v7[3] = &unk_1E2C607A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)sendSessionMessage:(id)a3 toDestinations:(id)a4
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
  v11[2] = sub_190720058;
  v11[3] = &unk_1E2C602B8;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlock:", v11);

}

- (void)sendAllocationRequest:(id)a3
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
  v7[2] = sub_190720108;
  v7[3] = &unk_1E2C607A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)setIsAudioEnabled:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_190720198;
  v6[3] = &unk_1E2C60620;
  v6[4] = self;
  v7 = a3;
  objc_msgSend(v5, "performBlock:", v6);

}

- (BOOL)isAudioEnabled
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
  v5[2] = sub_190720278;
  v5[3] = &unk_1E2C60308;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlock:waitUntilDone:", v5, 1);

  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

- (void)setIsMuted:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_190720330;
  v6[3] = &unk_1E2C60620;
  v6[4] = self;
  v7 = a3;
  objc_msgSend(v5, "performBlock:", v6);

}

- (BOOL)isMuted
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
  v5[2] = sub_190720410;
  v5[3] = &unk_1E2C60308;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlock:waitUntilDone:", v5, 1);

  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

- (BOOL)sendData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  id *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_190720548;
  v10[3] = &unk_1E2C619E8;
  v12 = &v14;
  v10[4] = self;
  v8 = v6;
  v11 = v8;
  v13 = a4;
  objc_msgSend(v7, "performBlock:waitUntilDone:", v10, 1);

  LOBYTE(a4) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return (char)a4;
}

- (void)setInvitationTimeOut:(int64_t)a3
{
  void *v5;
  _QWORD v6[6];

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_190720600;
  v6[3] = &unk_1E2C60358;
  v6[4] = self;
  v6[5] = a3;
  objc_msgSend(v5, "performBlock:", v6);

}

- (int64_t)invitationTimeOut
{
  void *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0xAAAAAAAAAAAAAAAALL;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1907206D8;
  v6[3] = &unk_1E2C60308;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performBlock:waitUntilDone:", v6, 1);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)reconnectSession
{
  void *v3;
  _QWORD v4[5];

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_190720780;
  v4[3] = &unk_1E2C60550;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

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
  v5[2] = sub_190720858;
  v5[3] = &unk_1E2C60308;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlock:waitUntilDone:", v5, 1);

  LODWORD(self) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return self;
}

- (void)setPreferences:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_19072092C;
  v7[3] = &unk_1E2C607A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (BOOL)shouldUseSocketForTransport
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
  v5[2] = sub_190720A04;
  v5[3] = &unk_1E2C60308;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlock:waitUntilDone:", v5, 1);

  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

- (unint64_t)MTUForAddressFamily:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0xAAAAAAAAAAAAAAAALL;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_190720B0C;
  v8[3] = &unk_1E2C613C8;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = a3;
  objc_msgSend(v5, "performBlock:waitUntilDone:", v8, 1);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (NSSet)requiredCapabilities
{
  return self->_requiredCapabilities;
}

- (NSSet)requiredLackOfCapabilities
{
  return self->_requiredLackOfCapabilities;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredLackOfCapabilities, 0);
  objc_storeStrong((id *)&self->_requiredCapabilities, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
