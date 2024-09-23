@implementation MRProtocolClientConnection

- (MRProtocolClientConnection)initWithConnection:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  MRProtocolClientConnection *v9;
  MRProtocolClientConnection *v10;
  MSVMessageParser *v11;
  MSVMessageParser *parser;
  NSMutableDictionary *v13;
  NSMutableDictionary *pendingReplyQueue;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MRProtocolClientConnection;
  v9 = -[MRProtocolClientConnection init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v10->_connection, a3);
    -[MRExternalDeviceTransportConnection setDelegate:](v10->_connection, "setDelegate:", v10);
    v11 = (MSVMessageParser *)objc_alloc_init(MEMORY[0x1E0D4D080]);
    parser = v10->_parser;
    v10->_parser = v11;

    -[MSVMessageParser setDelegate:](v10->_parser, "setDelegate:", v10);
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingReplyQueue = v10->_pendingReplyQueue;
    v10->_pendingReplyQueue = v13;

  }
  return v10;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *Error;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  MRProtocolMessage *v12;
  void (**v13)(_QWORD, _QWORD);
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  MRProtocolClientConnection *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(4uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = self;
    _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[ProtocolClientConnection] %{public}@ Dealloc", buf, 0xCu);
  }

  self->_disconnected = 1;
  -[MRExternalDeviceTransportConnection setDelegate:](self->_connection, "setDelegate:", 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:description:", 104, CFSTR("MRProtocolClientConnection.dealloc"));
  -[MRExternalDeviceTransportConnection closeWithError:](self->_connection, "closeWithError:", v4);
  Error = (void *)MRMediaRemoteCreateError(25);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMutableDictionary allValues](self->_pendingReplyQueue, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v12 = -[MRProtocolMessage initWithUnderlyingCodableMessage:error:]([MRProtocolMessage alloc], "initWithUnderlyingCodableMessage:error:", 0, Error);
        objc_msgSend(v11, "reply");
        v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, MRProtocolMessage *))v13)[2](v13, v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v14.receiver = self;
  v14.super_class = (Class)MRProtocolClientConnection;
  -[MRProtocolClientConnection dealloc](&v14, sel_dealloc);
}

- (NSError)error
{
  MRProtocolClientConnection *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSError copy](v2->_error, "copy");
  objc_sync_exit(v2);

  return (NSError *)v3;
}

- (BOOL)isValid
{
  return -[MRExternalDeviceTransportConnection isValid](self->_connection, "isValid");
}

- (void)setDeviceInfo:(id)a3
{
  MRDeviceInfo *v4;
  MRDeviceInfo *deviceInfo;
  MRProtocolClientConnection *obj;

  v4 = (MRDeviceInfo *)a3;
  obj = self;
  objc_sync_enter(obj);
  deviceInfo = obj->_deviceInfo;
  obj->_deviceInfo = v4;

  objc_sync_exit(obj);
}

- (MRDeviceInfo)deviceInfo
{
  MRProtocolClientConnection *v2;
  MRDeviceInfo *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_deviceInfo;
  objc_sync_exit(v2);

  return v3;
}

- (void)setSupportedMessages:(id)a3
{
  MRSupportedProtocolMessages *v4;
  MRSupportedProtocolMessages *supportedMessages;
  MRProtocolClientConnection *obj;

  v4 = (MRSupportedProtocolMessages *)a3;
  obj = self;
  objc_sync_enter(obj);
  supportedMessages = obj->_supportedMessages;
  obj->_supportedMessages = v4;

  objc_sync_exit(obj);
}

- (MRSupportedProtocolMessages)supportedMessages
{
  MRProtocolClientConnection *v2;
  MRSupportedProtocolMessages *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_supportedMessages;
  objc_sync_exit(v2);

  return v3;
}

- (void)sendMessage:(id)a3
{
  -[MRProtocolClientConnection sendMessage:reply:](self, "sendMessage:reply:", a3, 0);
}

- (void)sendMessage:(id)a3 reply:(id)a4
{
  -[MRProtocolClientConnection sendMessage:timeout:reply:](self, "sendMessage:timeout:reply:", a3, a4, 30.0);
}

- (void)sendMessage:(id)a3 timeout:(double)a4 reply:(id)a5
{
  MRCompositeMessage *v8;
  id v9;
  uint64_t v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  id v13;
  const __CFString *v14;
  void *v15;
  MRCompositeMessage *v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  MRProtocolMessage *v30;
  void *v31;
  MRBlockGuard *v32;
  void *v33;
  MRBlockGuard *v34;
  MRBlockGuard *v35;
  uint64_t v36;
  MRCompositeMessage *v37;
  _QWORD v38[4];
  MRBlockGuard *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = (MRCompositeMessage *)a3;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __56__MRProtocolClientConnection_sendMessage_timeout_reply___block_invoke;
  v45[3] = &unk_1E30C6798;
  v11 = v9;
  v46 = v11;
  v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x194036C44](v45);
  if (!self->_disconnected)
  {
    if (!-[MRExternalDeviceTransportConnection isValid](self->_connection, "isValid"))
    {
      v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v14 = CFSTR("connection is not valid");
      goto LABEL_11;
    }
    if (!v8)
    {
      v8 = (MRCompositeMessage *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:description:", 2, CFSTR("attempting to send nil message"));
      ((void (**)(_QWORD, MRCompositeMessage *))v12)[2](v12, v8);
      goto LABEL_13;
    }
    -[MRProtocolClientConnection supportedMessages](self, "supportedMessages");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[MRProtocolClientConnection _client:supportsMessage:]((_BOOL8)self, v15, v8))
    {
      v16 = (MRCompositeMessage *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:format:", 108, CFSTR("client does not support message M%lu> > <%lu>"), -[MRProtocolMessage type](v8, "type"), objc_msgSend(v15, "lastSupportedMessageType"));
      ((void (**)(_QWORD, MRCompositeMessage *))v12)[2](v12, v16);
LABEL_36:

      goto LABEL_12;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = v8;
      -[MRCompositeMessage messages](v16, "messages");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (!v18)
      {
        v19 = CFSTR("attempting to send composite message with no children");
        goto LABEL_17;
      }
      if (v11)
      {
        v19 = CFSTR("attempting to send composite message that expects a reply");
LABEL_17:
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:description:", 2, v19);
        ((void (**)(_QWORD, void *))v12)[2](v12, v20);

        v8 = v16;
        goto LABEL_36;
      }
      v8 = objc_alloc_init(MRCompositeMessage);
      -[MRCompositeMessage transportOptions](v16, "transportOptions");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[MRCompositeMessage transportOptions](v16, "transportOptions");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRCompositeMessage setTransportOptions:](v8, "setTransportOptions:", v22);

      }
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v37 = v16;
      -[MRCompositeMessage messages](v16, "messages");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v42 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            if (-[MRProtocolClientConnection _client:supportsMessage:]((_BOOL8)self, v15, v28))
              -[MRCompositeMessage addMessage:](v8, "addMessage:", v28);
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
        }
        while (v25);
      }

      -[MRProtocolMessage replyIdentifier](v37, "replyIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        v30 = -[MRProtocolMessage initWithUnderlyingCodableMessage:error:]([MRProtocolMessage alloc], "initWithUnderlyingCodableMessage:error:", 0, 0);
        -[MRProtocolMessage replyIdentifier](v37, "replyIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRProtocolMessage setReplyIdentifier:](v30, "setReplyIdentifier:", v31);

        -[MRCompositeMessage addMessage:](v8, "addMessage:", v30);
      }

      v10 = MEMORY[0x1E0C809B0];
    }
    kdebug_trace();
    v16 = (MRCompositeMessage *)MEMORY[0x194036C44](v11);
    if (a4 > 0.0 && v11)
    {
      v32 = [MRBlockGuard alloc];
      -[MRProtocolMessage uniqueIdentifier](v8, "uniqueIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[MRBlockGuard initWithTimeout:reason:handler:](v32, "initWithTimeout:reason:handler:", v33, v12, a4);

      v38[0] = v10;
      v38[1] = 3221225472;
      v38[2] = __56__MRProtocolClientConnection_sendMessage_timeout_reply___block_invoke_2;
      v38[3] = &unk_1E30CF2B8;
      v39 = v34;
      v40 = v11;
      v35 = v34;
      v36 = MEMORY[0x194036C44](v38);

      v16 = (MRCompositeMessage *)v36;
    }
    -[MRProtocolClientConnection _sendMessage:reply:](self, v8, v16);
    goto LABEL_36;
  }
  v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v14 = CFSTR("connection disconnection when message was attempted to be sent");
LABEL_11:
  v15 = (void *)objc_msgSend(v13, "initWithMRError:description:", 100, v14);
  ((void (**)(_QWORD, void *))v12)[2](v12, v15);
LABEL_12:

LABEL_13:
}

void __56__MRProtocolClientConnection_sendMessage_timeout_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  MRProtocolMessage *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    v4 = -[MRProtocolMessage initWithUnderlyingCodableMessage:error:]([MRProtocolMessage alloc], "initWithUnderlyingCodableMessage:error:", 0, v3);

    (*(void (**)(uint64_t, MRProtocolMessage *))(v2 + 16))(v2, v4);
  }
}

- (BOOL)_client:(void *)a3 supportsMessage:
{
  id v5;
  id v6;
  void *v7;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
    a1 = (objc_msgSend(v5, "isSupported:", objc_msgSend(v6, "type")) & 1) != 0 || objc_msgSend(v7, "type") == 15;

  return a1;
}

void __56__MRProtocolClientConnection_sendMessage_timeout_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "disarm"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_sendMessage:(void *)a3 reply:
{
  id v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  MRMessageReplyIdentifier *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v5 = a3;
  if (a1)
  {
    v6 = a1;
    objc_sync_enter(v6);
    if (v5)
    {
      objc_msgSend(v17, "replyIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "UUIDString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setReplyIdentifier:", v9);

      }
      v10 = objc_alloc_init(MRMessageReplyIdentifier);
      -[MRMessageReplyIdentifier setReply:](v10, "setReply:", v5);
      v11 = v6[7];
      objc_msgSend(v17, "replyIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v10, v12);

    }
    v13 = v6[1];
    objc_sync_exit(v6);

    +[MRProtocolMessageLogger sharedLogger](MRProtocolMessageLogger, "sharedLogger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logMessage:client:protocolMessage:", CFSTR("Message Sent To"), v6, v17);

    objc_msgSend(v6, "dataForMessage:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "transportOptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sendTransportData:options:", v15, v16);

  }
}

- (void)disconnectWithError:(id)a3
{
  MRProtocolClientConnection *v5;
  id v6;

  v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!v5->_disconnected)
  {
    objc_storeStrong((id *)&v5->_error, a3);
    v5->_disconnected = 1;
    -[MRExternalDeviceTransportConnection closeWithError:](v5->_connection, "closeWithError:", v6);
    -[MRProtocolClientConnection _notifyDelegateClientDidDisconnectWithError:]((id *)&v5->super.isa, v6);
  }
  objc_sync_exit(v5);

}

- (void)_notifyDelegateClientDidDisconnectWithError:(id *)a1
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id *v9;
  id v10;

  v3 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 12);
    objc_msgSend(a1, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__MRProtocolClientConnection__notifyDelegateClientDidDisconnectWithError___block_invoke;
    block[3] = &unk_1E30C7328;
    v8 = WeakRetained;
    v9 = a1;
    v10 = v3;
    v6 = WeakRetained;
    dispatch_async(v5, block);

  }
}

- (id)encryptDataForMessage:(id)a3
{
  return (id)objc_msgSend(a3, "protobufData");
}

- (id)decryptData:(id)a3 error:(id *)a4
{
  return a3;
}

- (id)dataForMessage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[3];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "messages");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  v7 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        -[MRProtocolClientConnection encryptDataForMessage:](self, "encryptDataForMessage:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
          objc_msgSend(MEMORY[0x1E0D4D080], "createHeader:", objc_msgSend(v13, "length"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "appendData:", v15);
          objc_msgSend(v14, "appendData:", v13);
          objc_msgSend(v7, "appendData:", v14);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v7;
}

- (void)transportDidClose:(id)a3 error:(id)a4
{
  -[MRProtocolClientConnection disconnectWithError:](self, "disconnectWithError:", a4);
}

- (void)transport:(id)a3 didReceiveData:(id)a4
{
  -[MRProtocolClientConnection _parseMessageData:]((uint64_t)self, a4);
}

- (void)_parseMessageData:(uint64_t)a1
{
  id v3;

  v3 = a2;
  if (a1 && !*(_BYTE *)(a1 + 64))
  {
    kdebug_trace();
    objc_msgSend(*(id *)(a1 + 16), "processData:", v3);
    kdebug_trace();
  }

}

- (void)parser:(id)a3 didParseMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  id v29;
  uint8_t v30[128];
  uint8_t buf[4];
  MRProtocolClientConnection *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7 && !self->_disconnected)
  {
    v29 = 0;
    -[MRProtocolClientConnection decryptData:error:](self, "decryptData:error:", v7, &v29);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v29;
    if (v9)
    {
      v10 = v9;
      _MRLogForCategory(4uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v32 = self;
        _os_log_impl(&dword_193827000, v11, OS_LOG_TYPE_DEFAULT, "[ProtocolClientConnection] %{public}@ Crypto Error. Disconnecting...", buf, 0xCu);
      }

      -[MRProtocolClientConnection disconnectWithError:](self, "disconnectWithError:", v10);
    }
    else
    {
      v12 = (void *)MEMORY[0x194036A64]();
      v28 = 0;
      -[MRProtocolClientConnection _protocolMessageFromData:error:]((uint64_t)self, (uint64_t)v8, (uint64_t)&v28);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v28;
      if (v10)
      {
        _MRLogForCategory(4uLL);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v32 = self;
          _os_log_impl(&dword_193827000, v14, OS_LOG_TYPE_DEFAULT, "[ProtocolClientConnection] %{public}@ Parse Error. Disconnecting...", buf, 0xCu);
        }

        -[MRProtocolClientConnection disconnectWithError:](self, "disconnectWithError:", v10);
      }
      else
      {
        v22 = v12;
        v23 = v8;
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v15 = v13;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v25 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
              +[MRProtocolMessageLogger sharedLogger](MRProtocolMessageLogger, "sharedLogger");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "logMessage:client:protocolMessage:", CFSTR("Message Received From"), self, v20);

              objc_msgSend(v20, "setClientConnection:", self);
              -[MRProtocolClientConnection _adjustTimestamp:]((uint64_t)self, v20);
              -[MRProtocolClientConnection _processMessage:](self, v20);
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
          }
          while (v17);
        }

        v8 = v23;
        v12 = v22;
        v10 = 0;
      }

      objc_autoreleasePoolPop(v12);
    }

  }
}

- (id)_protocolMessageFromData:(uint64_t)a3 error:
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  +[MRProtocolMessage protocolMessageWithProtobufData:error:](MRProtocolMessage, "protocolMessageWithProtobufData:error:", a2, a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_processMessage:(void *)a1
{
  id v3;
  id *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id WeakRetained;
  NSObject *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v3 = a2;
  if (a1)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__44;
    v26 = __Block_byref_object_dispose__44;
    v27 = 0;
    v4 = a1;
    objc_sync_enter(v4);
    objc_msgSend(v3, "replyIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = v4[7];
      objc_msgSend(v3, "replyIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!_os_feature_enabled_impl()
        || (v9 = objc_msgSend(v8, "messageNumber"), v9 == objc_msgSend(v3, "type"))
        || !objc_msgSend(v8, "messageNumber"))
      {
        objc_msgSend(v8, "reply");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v23[5];
        v23[5] = v10;

      }
      if (v23[5])
      {
        v12 = v4[7];
        objc_msgSend(v3, "replyIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeObjectForKey:", v13);

        objc_msgSend(v3, "setIsIncomingReply:", 1);
      }

    }
    objc_sync_exit(v4);

    WeakRetained = objc_loadWeakRetained(v4 + 12);
    objc_msgSend(v4, "queue");
    v15 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __46__MRProtocolClientConnection__processMessage___block_invoke;
    v17[3] = &unk_1E30CF2E0;
    v21 = &v22;
    v18 = v3;
    v19 = WeakRetained;
    v20 = v4;
    v16 = WeakRetained;
    dispatch_async(v15, v17);

    _Block_object_dispose(&v22, 8);
  }

}

uint64_t __46__MRProtocolClientConnection__processMessage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v2)
    return (*(uint64_t (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32));
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 40), "clientConnection:didReceiveMessage:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)_adjustTimestamp:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v8 = v3;
    v5 = objc_msgSend(v3, "timestamp");
    v4 = v8;
    if (v5)
    {
      if (!*(_QWORD *)(a1 + 32))
      {
        v6 = mach_absolute_time();
        v4 = v8;
        *(_QWORD *)(a1 + 32) = v6;
      }
      if (!*(_QWORD *)(a1 + 24))
      {
        v7 = objc_msgSend(v4, "timestamp");
        v4 = v8;
        *(_QWORD *)(a1 + 24) = v7;
      }
      objc_msgSend(v8, "setTimestamp:", *(_QWORD *)(a1 + 32)+ (unint64_t)((double)(unint64_t)(objc_msgSend(v4, "timestamp") - *(_QWORD *)(a1 + 24))/ MRTimeUtilitiesGetProcessorTimeScale()));
      v4 = v8;
    }
  }

}

uint64_t __74__MRProtocolClientConnection__notifyDelegateClientDidDisconnectWithError___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "clientDidDisconnect:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)disconnected
{
  return self->_disconnected;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (MRExternalDeviceTransportConnection)connection
{
  return self->_connection;
}

- (MRProtocolClientConnectionDelegate)delegate
{
  return (MRProtocolClientConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_pendingReplyQueue, 0);
  objc_storeStrong((id *)&self->_supportedMessages, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
