@implementation IDSRealTimeEncryptionProxy

- (IDSRealTimeEncryptionProxy)initWithAccount:(id)a3
{
  id v4;
  NSObject *v5;
  IDSRealTimeEncryptionProxy *v6;
  void *v7;
  int v8;
  NSObject *v9;
  IDSRealTimeEncryptionProxy *v10;
  _IDSRealTimeEncryptionProxy *v11;
  _IDSRealTimeEncryptionProxy *internal;
  objc_super v14;

  v4 = a3;
  if (_IDSRunningInDaemon())
  {
    +[IDSLogging IDSRealTimeEncryptionProxy](IDSLogging, "IDSRealTimeEncryptionProxy");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907E8578((uint64_t)self, v5);

    v6 = 0;
  }
  else
  {
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "assertQueueIsCurrent");

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1907FECBC(v9);

    }
    v14.receiver = self;
    v14.super_class = (Class)IDSRealTimeEncryptionProxy;
    v10 = -[IDSRealTimeEncryptionProxy init](&v14, sel_init);
    if (v10)
    {
      v11 = -[_IDSRealTimeEncryptionProxy initWithAccount:]([_IDSRealTimeEncryptionProxy alloc], "initWithAccount:", v4);
      internal = v10->_internal;
      v10->_internal = v11;

    }
    self = v10;
    v6 = self;
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _IDSRealTimeEncryptionProxy *v7;

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = sub_1906EE344;
  v6[4] = sub_1906EE174;
  v7 = (_IDSRealTimeEncryptionProxy *)0xAAAAAAAAAAAAAAAALL;
  v7 = self->_internal;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1907E2F8C;
  v5[3] = &unk_1E2C602E0;
  v5[4] = v6;
  objc_msgSend(v3, "performBlock:waitUntilDone:", v5, 0);

  _Block_object_dispose(v6, 8);
  v4.receiver = self;
  v4.super_class = (Class)IDSRealTimeEncryptionProxy;
  -[IDSRealTimeEncryptionProxy dealloc](&v4, sel_dealloc);
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
  v11[2] = sub_1907E3074;
  v11[3] = &unk_1E2C602B8;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlock:", v11);

}

- (void)sendPrekeyToGroup:(id)a3
{
  MEMORY[0x1E0DE7D20](self->_internal, sel_sendPrekeyToGroup_);
}

- (void)requestPublicKeys
{
  MEMORY[0x1E0DE7D20](self->_internal, sel_requestPublicKeys);
}

- (void)sendMasterKeyMaterialToGroup:(id)a3
{
  MEMORY[0x1E0DE7D20](self->_internal, sel_sendMasterKeyMaterialToGroup_);
}

- (void)sendMKMRecoveryRequestToGroup:(id)a3
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
  v7[2] = sub_1907E313C;
  v7[3] = &unk_1E2C607A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)requestMasterKeyMaterialForGroup:(id)a3
{
  MEMORY[0x1E0DE7D20](self->_internal, sel_requestMasterKeyMaterialForGroup_);
}

- (void)resetKeysForGroup:(id)a3
{
  MEMORY[0x1E0DE7D20](self->_internal, sel_resetKeysForGroup_);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
