@implementation IDSOffGridMessenger

- (IDSOffGridMessenger)initWithService:(id)a3 queue:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  IDSOffGridMessenger *v11;

  v8 = a4;
  v9 = a3;
  +[IDSXPCDaemonController weakSharedInstance](IDSXPCDaemonController, "weakSharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[IDSOffGridMessenger initWithService:queue:daemonController:error:](self, "initWithService:queue:daemonController:error:", v9, v8, v10, a5);

  return v11;
}

- (IDSOffGridMessenger)initWithService:(id)a3 queue:(id)a4 daemonController:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  IDSOffGridMessenger *v13;
  void *v14;
  IDSOffGridMessenger *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  IDSOffGridMessenger *v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  objc_super v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v11)
  {
    v16 = objc_alloc(MEMORY[0x1E0C99D80]);
    v17 = (void *)objc_msgSend(v16, "initWithObjectsAndKeys:", CFSTR("The queue specified is nil."), *MEMORY[0x1E0CB2D50], 0);
    *a6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("IDSOffGridDeliveryErrorDomain"), 3, v17);

    goto LABEL_9;
  }
  v31.receiver = self;
  v31.super_class = (Class)IDSOffGridMessenger;
  v13 = -[IDSOffGridMessenger init](&v31, sel_init);
  if (v13)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = -86;
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = sub_190701F1C;
    v21[3] = &unk_1E2C60D90;
    self = v13;
    v22 = self;
    v23 = v10;
    v24 = v11;
    v25 = v12;
    v26 = &v27;
    objc_msgSend(v14, "performBlock:waitUntilDone:", v21, 1);

    if (self->_service && *((_BYTE *)v28 + 24))
    {
      -[IDSOffGridMessenger _setupInterruptionHandler](self, "_setupInterruptionHandler");
      -[IDSOffGridMessenger _setupXPC](self, "_setupXPC");

      _Block_object_dispose(&v27, 8);
      goto LABEL_6;
    }
    v18 = objc_alloc(MEMORY[0x1E0C99D80]);
    v19 = (void *)objc_msgSend(v18, "initWithObjectsAndKeys:", CFSTR("Invalid service name provided"), *MEMORY[0x1E0CB2D50], 0);
    *a6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("IDSOffGridDeliveryErrorDomain"), 1, v19);

    _Block_object_dispose(&v27, 8);
LABEL_9:
    v15 = 0;
    goto LABEL_10;
  }
LABEL_6:
  self = v13;
  v15 = self;
LABEL_10:

  return v15;
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
  v4[2] = sub_190702114;
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
  objc_msgSend(MEMORY[0x1E0D34D40], "IDSOffGridMessenger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[IDSOffGridMessenger uuid](self, "uuid");
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
  v6[2] = sub_190702348;
  v6[3] = &unk_1E2C60DD8;
  objc_copyWeak(&v7, (id *)buf);
  -[IDSXPCDaemonController performTask:](daemonController, "performTask:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (NSSet)handles
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  IDSOffGridMessenger *v13;
  id v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blockUntilConnected");

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = sub_190702514;
  v12 = &unk_1E2C607A8;
  v13 = self;
  v14 = v3;
  v6 = v3;
  objc_msgSend(v5, "performBlock:waitUntilDone:", &v9, 1);

  v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);
  return (NSSet *)v7;
}

- (void)donateHandlesForMessagingKeys:(id)a3 fromURI:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  IDSXPCDaemonController *daemonController;
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
  daemonController = self->_daemonController;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1907027C8;
  v19[3] = &unk_1E2C60EA0;
  v22 = v12;
  v23 = v13;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = v13;
  -[IDSXPCDaemonController performTask:](daemonController, "performTask:", v19);

}

- (void)resultsForDestinationURIs:(id)a3 senderURI:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  IDSXPCDaemonController *daemonController;
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
  daemonController = self->_daemonController;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_190702B50;
  v19[3] = &unk_1E2C60EA0;
  v22 = v12;
  v23 = v13;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = v13;
  -[IDSXPCDaemonController performTask:](daemonController, "performTask:", v19);

}

- (void)encryptOffGridMessage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  IDSXPCDaemonController *daemonController;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "setService:", self->_serviceName);
  objc_msgSend(v6, "senderURI");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[IDSOffGridMessenger handles](self, "handles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "anyObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSenderURI:", v10);

  }
  daemonController = self->_daemonController;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_190702F54;
  v14[3] = &unk_1E2C60F68;
  v15 = v6;
  v16 = v7;
  v14[4] = self;
  v12 = v6;
  v13 = v7;
  -[IDSXPCDaemonController performTask:](daemonController, "performTask:", v14);

}

- (void)decryptOffGridMessage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  IDSXPCDaemonController *daemonController;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  daemonController = self->_daemonController;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1907032B8;
  v11[3] = &unk_1E2C60F68;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  -[IDSXPCDaemonController performTask:](daemonController, "performTask:", v11);

}

- (void)sendEncryptedOffGridMessage:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  IDSXPCDaemonController *daemonController;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *queue;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  _QWORD block[4];
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "setService:", self->_serviceName);
  if (objc_msgSend(v9, "transportType"))
  {
    objc_msgSend(v9, "setDefaultOptionsForTransportType:", objc_msgSend(v9, "transportType"));
    objc_msgSend(v9, "setEncryptPayload:", 0);
    objc_msgSend(v8, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIdentifier:", v11);

    objc_msgSend(MEMORY[0x1E0D34D40], "IDSOffGridMessenger");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v39 = v13;
      v40 = 2112;
      v41 = v14;
      v42 = 2048;
      v43 = objc_msgSend(v9, "transportType");
      _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "IDSOffGridMessenger - Sending outgoing encrypted OffGrid message - %@, Message %@, transportType %ld", buf, 0x20u);

    }
    v15 = objc_msgSend(v9, "transportType");
    if (v15 == 1)
    {
      +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "blockUntilConnected");

      +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = sub_190703C20;
      v26[3] = &unk_1E2C61008;
      v26[4] = self;
      v27 = v8;
      v28 = v9;
      v29 = v10;
      objc_msgSend(v25, "performBlock:waitUntilDone:", v26, 0);

      v17 = v27;
      goto LABEL_11;
    }
    if (v15 == 2)
    {
      daemonController = self->_daemonController;
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = sub_190703964;
      v30[3] = &unk_1E2C60FE0;
      v33 = v10;
      v30[4] = self;
      v31 = v8;
      v32 = v9;
      -[IDSXPCDaemonController performTask:](daemonController, "performTask:", v30);

      v17 = v33;
LABEL_11:

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "IDSOffGridMessenger");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "IDSOffGridMessenger - Fatal Error - Transport not set", buf, 2u);
    }

    v19 = objc_alloc(MEMORY[0x1E0C99D80]);
    v20 = (void *)objc_msgSend(v19, "initWithObjectsAndKeys:", CFSTR("Invalid OffGrid delivery options. transport type not set"), *MEMORY[0x1E0CB2D50], 0);
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("IDSOffGridDeliveryErrorDomain"), 2, v20);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19070394C;
    block[3] = &unk_1E2C60EC8;
    v37 = v10;
    v35 = v8;
    v36 = v21;
    v23 = v21;
    dispatch_async(queue, block);

  }
}

- (void)encryptAndSendOffGridMessage:(id)a3 options:(id)a4 completion:(id)a5
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
  v15[2] = sub_190703E88;
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

- (void)sendFetchRequestForHandles:(id)a3 completions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  IDSXPCDaemonController *daemonController;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  NSObject *queue;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  _QWORD block[4];
  id v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;

  v6 = a3;
  v7 = a4;
  -[IDSOffGridMessenger handles](self, "handles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "IDSOffGridMessenger");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_1907E7C6C(v25, v26, v27, v28, v29, v30, v31, v32);

    v33 = objc_alloc(MEMORY[0x1E0C99D80]);
    v11 = (void *)objc_msgSend(v33, "initWithObjectsAndKeys:", CFSTR("No active sender handle found."), *MEMORY[0x1E0CB2D50], 0);
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("IDSOffGridDeliveryErrorDomain"), 7, v11);
    queue = self->_queue;
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = sub_19070433C;
    v44[3] = &unk_1E2C60EC8;
    v47 = v7;
    v45 = v6;
    v46 = v34;
    v23 = v34;
    dispatch_async(queue, v44);

    v24 = v47;
    goto LABEL_11;
  }
  if (!v6 || !objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "IDSOffGridMessenger");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907E7C9C(v12, v13, v14, v15, v16, v17, v18, v19);

    v20 = objc_alloc(MEMORY[0x1E0C99D80]);
    v11 = (void *)objc_msgSend(v20, "initWithObjectsAndKeys:", CFSTR("No handles specified."), *MEMORY[0x1E0CB2D50], 0);
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("IDSOffGridDeliveryErrorDomain"), 11, v11);
    v22 = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_190704350;
    block[3] = &unk_1E2C60EC8;
    v43 = v7;
    v41 = v6;
    v42 = v21;
    v23 = v21;
    dispatch_async(v22, block);

    v24 = v43;
LABEL_11:

    goto LABEL_12;
  }
  daemonController = self->_daemonController;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = sub_190704364;
  v36[3] = &unk_1E2C60FE0;
  v39 = v7;
  v36[4] = self;
  v37 = v6;
  v38 = v9;
  -[IDSXPCDaemonController performTask:](daemonController, "performTask:", v36);

  v11 = v39;
LABEL_12:

}

- (void)sendServiceUpdateMessage:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  NSObject *queue;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  _QWORD block[4];
  id v33;
  id v34;
  id v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "preferredServiceType") == 1)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "IDSOffGridMessenger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1907E7CCC(v11, v12, v13, v14, v15, v16, v17, v18);

    v19 = objc_alloc(MEMORY[0x1E0C99D80]);
    v20 = (id)objc_msgSend(v19, "initWithObjectsAndKeys:", CFSTR("Service Update to SMS is not supported onGrid."), *MEMORY[0x1E0CB2D50], 0);
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("IDSOffGridDeliveryErrorDomain"), 11, v20);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19070481C;
    block[3] = &unk_1E2C60EC8;
    v34 = v21;
    v35 = v10;
    v33 = v8;
    v23 = v10;
    v24 = v8;
    v25 = v21;
    dispatch_async(queue, block);

  }
  else
  {
    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "blockUntilConnected");

    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = sub_190704834;
    v28[3] = &unk_1E2C61008;
    v28[4] = self;
    v29 = v8;
    v30 = v9;
    v31 = v10;
    v25 = v10;
    v20 = v8;
    objc_msgSend(v27, "performBlock:waitUntilDone:", v28, 0);

  }
}

- (void)_handleIncomingTextMessage:(id)a3 fromID:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  IDSOffGridEncryptedMessage *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  IDSOffGridMessageContext *v20;
  NSObject *queue;
  id v22;
  id v23;
  id v24;
  IDSOffGridMessageContext *v25;
  IDSOffGridEncryptedMessage *v26;
  _QWORD v27[5];
  IDSOffGridEncryptedMessage *v28;
  IDSOffGridMessageContext *v29;
  id v30;
  id v31;
  id v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[IDSOffGridEncryptedMessage initWithDictionaryMessage:]([IDSOffGridEncryptedMessage alloc], "initWithDictionaryMessage:", v8);
  v12 = (void *)MEMORY[0x1E0D34EA8];
  objc_msgSend(v10, "fromID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URIWithPrefixedURI:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "tokenFreeURI");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSOffGridEncryptedMessage setSenderURI:](v11, "setSenderURI:", v15);

  v16 = (void *)MEMORY[0x1E0D34EA8];
  objc_msgSend(v10, "toID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URIWithPrefixedURI:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "tokenFreeURI");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSOffGridEncryptedMessage setRecipientURI:](v11, "setRecipientURI:", v19);

  v20 = -[IDSOffGridMessageContext initWithIDSMessageContext:]([IDSOffGridMessageContext alloc], "initWithIDSMessageContext:", v10);
  -[IDSOffGridMessageContext setTransportType:](v20, "setTransportType:", 1);
  queue = self->_queue;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_190704B98;
  v27[3] = &unk_1E2C610D0;
  v27[4] = self;
  v28 = v11;
  v29 = v20;
  v30 = v10;
  v31 = v8;
  v32 = v9;
  v22 = v9;
  v23 = v8;
  v24 = v10;
  v25 = v20;
  v26 = v11;
  dispatch_async(queue, v27);

}

- (void)_handleIncomingDeliveryReceiptMessage:(id)a3 fromID:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  IDSOffGridMessageContext *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *queue;
  IDSOffGridMessageContext *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  IDSOffGridMessageContext *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0D34D40], "IDSOffGridMessenger");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "originalGUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v26 = v12;
    v27 = 2112;
    v28 = v8;
    v29 = 2112;
    v30 = v9;
    _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "IDSOffGridMessenger - Incoming delivery receipt - %@, Message %@, fromID %@", buf, 0x20u);

  }
  v13 = -[IDSOffGridMessageContext initWithIDSMessageContext:]([IDSOffGridMessageContext alloc], "initWithIDSMessageContext:", v10);
  v14 = (void *)MEMORY[0x1E0D34EA8];
  objc_msgSend(v10, "serviceIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URIWithPrefixedURI:withServiceLoggingHint:", v9, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  queue = self->_queue;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_1907050F8;
  v21[3] = &unk_1E2C60C50;
  v21[4] = self;
  v22 = v10;
  v23 = v16;
  v24 = v13;
  v18 = v13;
  v19 = v16;
  v20 = v10;
  dispatch_async(queue, v21);

}

- (void)_handleIncomingServiceUpdateMessage:(id)a3 fromID:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  IDSOffGridServiceUpdateMessage *v13;
  IDSOffGridMessageContext *v14;
  NSObject *queue;
  id v16;
  id v17;
  IDSOffGridMessageContext *v18;
  IDSOffGridServiceUpdateMessage *v19;
  _QWORD block[5];
  IDSOffGridServiceUpdateMessage *v21;
  IDSOffGridMessageContext *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0D34D40], "IDSOffGridMessenger");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "originalGUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v26 = v12;
    v27 = 2112;
    v28 = v8;
    v29 = 2112;
    v30 = v9;
    _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "IDSOffGridMessenger - Incoming service update message - %@, Message %@, fromID %@", buf, 0x20u);

  }
  v13 = -[IDSOffGridServiceUpdateMessage initWithDictionaryMessage:]([IDSOffGridServiceUpdateMessage alloc], "initWithDictionaryMessage:", v8);
  v14 = -[IDSOffGridMessageContext initWithIDSMessageContext:]([IDSOffGridMessageContext alloc], "initWithIDSMessageContext:", v10);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_190705370;
  block[3] = &unk_1E2C610F8;
  block[4] = self;
  v21 = v13;
  v22 = v14;
  v23 = v10;
  v24 = v9;
  v16 = v9;
  v17 = v10;
  v18 = v14;
  v19 = v13;
  dispatch_async(queue, block);

}

- (void)setDelegate:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  objc_storeWeak((id *)&self->_delegate, a3);
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blockUntilConnected");

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1907056AC;
  v6[3] = &unk_1E2C60550;
  v6[4] = self;
  objc_msgSend(v5, "performBlock:waitUntilDone:", v6, 1);

}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = a7;
  objc_msgSend(MEMORY[0x1E0D34D40], "IDSOffGridMessenger");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v12, "originalGUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138412802;
    v23 = v14;
    v24 = 2112;
    v25 = v10;
    v26 = 2112;
    v27 = v11;
    _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_DEFAULT, "IDSOffGridMessenger - Incoming message - %@, Message %@, fromID %@", (uint8_t *)&v22, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    objc_msgSend(v12, "originalCommand");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "integerValue");

    if (v17 == 100)
    {
      -[IDSOffGridMessenger _handleIncomingTextMessage:fromID:context:](self, "_handleIncomingTextMessage:fromID:context:", v10, v11, v12);
    }
    else
    {
      objc_msgSend(v12, "originalCommand");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "integerValue");

      if (v19 == 101)
      {
        -[IDSOffGridMessenger _handleIncomingDeliveryReceiptMessage:fromID:context:](self, "_handleIncomingDeliveryReceiptMessage:fromID:context:", v10, v11, v12);
      }
      else
      {
        objc_msgSend(v12, "originalCommand");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "integerValue");

        if (v21 == 128)
          -[IDSOffGridMessenger _handleIncomingServiceUpdateMessage:fromID:context:](self, "_handleIncomingServiceUpdateMessage:fromID:context:", v10, v11, v12);
      }
    }
  }

}

- (void)incomingOffGridMessage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  IDSOffGridMessageContext *v9;
  NSObject *queue;
  IDSOffGridMessageContext *v11;
  _QWORD v12[5];
  id v13;
  IDSOffGridMessageContext *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v9 = objc_alloc_init(IDSOffGridMessageContext);
    -[IDSOffGridMessageContext setTransportType:](v9, "setTransportType:", 2);
    queue = self->_queue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_190705978;
    v12[3] = &unk_1E2C61008;
    v12[4] = self;
    v13 = v6;
    v14 = v9;
    v15 = v7;
    v11 = v9;
    dispatch_async(queue, v12);

  }
}

- (void)incomingOffGridSummaryMessage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  char v11;
  IDSOffGridMessageContext *v12;
  NSObject *queue;
  IDSOffGridMessageContext *v14;
  _QWORD v15[5];
  id v16;
  IDSOffGridMessageContext *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v12 = objc_alloc_init(IDSOffGridMessageContext);
      -[IDSOffGridMessageContext setTransportType:](v12, "setTransportType:", 2);
      queue = self->_queue;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = sub_190705C90;
      v15[3] = &unk_1E2C61008;
      v15[4] = self;
      v16 = v6;
      v17 = v12;
      v18 = v7;
      v14 = v12;
      dispatch_async(queue, v15);

    }
  }

}

- (IDSXPCDaemonController)daemonController
{
  return self->_daemonController;
}

- (void)setDaemonController:(id)a3
{
  objc_storeStrong((id *)&self->_daemonController, a3);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (IDSServiceProperties)serviceProperties
{
  return self->_serviceProperties;
}

- (_IDSService)service
{
  return self->_service;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (IDSOffGridMessengerDelegate)delegate
{
  return (IDSOffGridMessengerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_serviceProperties, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_daemonController, 0);
}

@end
