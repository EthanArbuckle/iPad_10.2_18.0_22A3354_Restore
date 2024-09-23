@implementation _IDSRealTimeEncryptionProxy

- (_IDSRealTimeEncryptionProxy)initWithAccount:(id)a3
{
  id v4;
  NSObject *v5;
  _IDSRealTimeEncryptionProxy *v6;
  void *v7;
  int v8;
  NSObject *v9;
  _IDSRealTimeEncryptionProxy *v10;
  uint64_t v11;
  NSString *uniqueID;
  void *v13;
  uint64_t v14;
  NSString *accountID;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

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
        sub_1907E8608();

    }
    v20.receiver = self;
    v20.super_class = (Class)_IDSRealTimeEncryptionProxy;
    v10 = -[_IDSRealTimeEncryptionProxy init](&v20, sel_init);
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
      v11 = objc_claimAutoreleasedReturnValue();
      uniqueID = v10->_uniqueID;
      v10->_uniqueID = (NSString *)v11;

      objc_msgSend(v4, "_internal");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "uniqueID");
      v14 = objc_claimAutoreleasedReturnValue();
      accountID = v10->_accountID;
      v10->_accountID = (NSString *)v14;

      +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "listener");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addHandler:", v10);

      +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setupRealtimeEncryptionController:forAccountWithID:", v10->_uniqueID, v10->_accountID);

    }
    self = v10;
    v6 = self;
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "listener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeHandler:", self);

  v5.receiver = self;
  v5.super_class = (Class)_IDSRealTimeEncryptionProxy;
  -[_IDSRealTimeEncryptionProxy dealloc](&v5, sel_dealloc);
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  CUTWeakReference *v6;
  OS_dispatch_queue *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  CUTWeakReference *v12;
  CUTWeakReference *delegate;
  OS_dispatch_queue *queue;
  int v15;
  CUTWeakReference *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = (CUTWeakReference *)a3;
  v7 = (OS_dispatch_queue *)a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "assertQueueIsCurrent");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907E8694();

  }
  +[IDSLogging IDSRealTimeEncryptionProxy](IDSLogging, "IDSRealTimeEncryptionProxy");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 134217984;
    v16 = v6;
    _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "Setting up delegate %p", (uint8_t *)&v15, 0xCu);
  }

  if (self->_delegate != v6)
  {
    objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", v6);
    v12 = (CUTWeakReference *)objc_claimAutoreleasedReturnValue();
    delegate = self->_delegate;
    self->_delegate = v12;

  }
  queue = self->_queue;
  self->_queue = v7;

}

- (void)sendPrekeyToGroup:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907E8720();

  }
  +[IDSLogging IDSRealTimeEncryptionProxy](IDSLogging, "IDSRealTimeEncryptionProxy");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Sending the real-time media prekey of this device to the group %@", (uint8_t *)&v10, 0xCu);
  }

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendRealTimeMediaPrekey:toGroup:", self->_uniqueID, v4);

}

- (void)requestPublicKeys
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907E87AC();

  }
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestPublicKeysForRealTimeEncryption:forAccountWithID:", self->_uniqueID, self->_accountID);

}

- (void)sendMasterKeyMaterialToGroup:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;

  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907E8838();

  }
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendRealTimeEncryptionMasterKeyMaterial:toGroup:", self->_uniqueID, v4);

}

- (void)requestMasterKeyMaterialForGroup:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;

  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907E88C4();

  }
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestRealTimeEncryptionMasterKeyMaterial:forGroup:", self->_uniqueID, v4);

}

- (void)sendMKMRecoveryRequestToGroup:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;

  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907E8950();

  }
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendRealTimeEncryptionMKMRecoveryRequest:toGroup:", self->_uniqueID, v4);

}

- (void)resetKeysForGroup:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;

  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907E89DC();

  }
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resetRealTimeEncryptionKeys:forGroup:", self->_uniqueID, v4);

}

- (void)xpcObject:(id)a3 objectContext:(id)a4
{
  const __CFDictionary *v5;
  void *v6;
  void *v7;
  void *Value;
  char v9;
  NSObject *v10;
  NSObject *v11;
  CUTWeakReference *delegate;
  const char *v13;
  void *v14;
  char v15;
  CUTWeakReference *v16;
  int v17;
  CUTWeakReference *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (const __CFDictionary *)a4;
  -[CUTWeakReference object](self->_delegate, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = (id)CFDictionaryGetValue(v5, CFSTR("object-type"));
    if (objc_msgSend(v7, "isEqualToIgnoringCase:", CFSTR("public-keys")))
    {
      Value = (void *)CFDictionaryGetValue(v5, CFSTR("public-keys"));
LABEL_5:
      v10 = Value;
      if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "didReceivePublickeys:", v10);
        goto LABEL_22;
      }
      +[IDSLogging IDSRealTimeEncryptionProxy](IDSLogging, "IDSRealTimeEncryptionProxy");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        delegate = self->_delegate;
        v17 = 138412290;
        v18 = delegate;
        v13 = "the delegate object %@ doesn't respond to the selector didReceivePublickeys:";
LABEL_20:
        _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v17, 0xCu);
        goto LABEL_21;
      }
      goto LABEL_21;
    }
    if (objc_msgSend(v7, "isEqualToIgnoringCase:", CFSTR("master-key-materials")))
    {
      v14 = (void *)CFDictionaryGetValue(v5, CFSTR("master-key-materials"));
      goto LABEL_13;
    }
  }
  else
  {
    v9 = objc_msgSend(0, "isEqualToIgnoringCase:", CFSTR("public-keys"));
    v7 = 0;
    Value = 0;
    if ((v9 & 1) != 0)
      goto LABEL_5;
    v15 = objc_msgSend(0, "isEqualToIgnoringCase:", CFSTR("master-key-materials"));
    v7 = 0;
    v14 = 0;
    if ((v15 & 1) != 0)
    {
LABEL_13:
      v10 = v14;
      if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "didReceiveMasterKeyMaterials:", v10);
        goto LABEL_22;
      }
      +[IDSLogging IDSRealTimeEncryptionProxy](IDSLogging, "IDSRealTimeEncryptionProxy");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v16 = self->_delegate;
        v17 = 138412290;
        v18 = v16;
        v13 = "the delegate object %@ doesn't respond to the selector didReceiveMasterKeyMaterials:";
        goto LABEL_20;
      }
LABEL_21:

      goto LABEL_22;
    }
  }
  +[IDSLogging IDSRealTimeEncryptionProxy](IDSLogging, "IDSRealTimeEncryptionProxy");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = (CUTWeakReference *)v7;
    _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "unknown object type %@", (uint8_t *)&v17, 0xCu);
  }
LABEL_22:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end
