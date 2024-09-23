@implementation _DDUIRapportIncomingTransportSession

- (_DDUIRapportIncomingTransportSession)initWithOptions:(id)a3
{
  id v4;
  _DDUIRapportIncomingTransportSession *v5;
  uint64_t v6;
  NSString *destinationID;
  _DDUIRapportDevice *v8;
  _DDUIRapportDevice *cachedDevice;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_DDUIRapportIncomingTransportSession;
  v5 = -[_DDUIRapportIncomingTransportSession init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D839C8]);
    v6 = objc_claimAutoreleasedReturnValue();
    destinationID = v5->_destinationID;
    v5->_destinationID = (NSString *)v6;

    if (v4)
    {
      v8 = -[_DDUIRapportDevice initWithIncomingMessageOptions:]([_DDUIRapportDevice alloc], "initWithIncomingMessageOptions:", v4);
      cachedDevice = v5->_cachedDevice;
      v5->_cachedDevice = v8;

      _DDUICoreRapportLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        -[_DDUIRapportDevice name](v5->_cachedDevice, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DDUIRapportDevice identifier](v5->_cachedDevice, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DDUIRapportDevice model](v5->_cachedDevice, "model");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DDUIRapportDevice accountIdentifier](v5->_cachedDevice, "accountIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v18 = v11;
        v19 = 2112;
        v20 = v12;
        v21 = 2112;
        v22 = v13;
        v23 = 2112;
        v24 = v14;
        _os_log_impl(&dword_1C87B2000, v10, OS_LOG_TYPE_DEFAULT, "_DDUIRapportIncomingTransportSession init. Created DDUIDevice: name: %@, identifier: %@, model: %@, accountID: %@", buf, 0x2Au);

      }
    }
  }

  return v5;
}

- (DDUIDevice)remoteDevice
{
  return (DDUIDevice *)self->_cachedDevice;
}

- (void)generateNetworkEndpointIdentifierForRemoteDevice:(id)a3 withCompletion:(id)a4
{
  (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
}

- (void)activateWithErrorHandler:(id)a3 messageHandler:(id)a4 completion:(id)a5
{
  void (**v7)(id, _DDUIRapportIncomingTransportSession *);
  id v8;
  NSObject *v9;
  void *v10;
  id messageHandler;
  int v12;
  _DDUIRapportIncomingTransportSession *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, _DDUIRapportIncomingTransportSession *))a5;
  v8 = a4;
  _DDUICoreRapportLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134217984;
    v13 = self;
    _os_log_impl(&dword_1C87B2000, v9, OS_LOG_TYPE_DEFAULT, "_DDUIRapportIncomingTransportSession activating {self: %p}", (uint8_t *)&v12, 0xCu);
  }

  v10 = (void *)MEMORY[0x1CAA33E80](v8);
  messageHandler = self->_messageHandler;
  self->_messageHandler = v10;

  v7[2](v7, self);
}

- (void)sendMessage:(id)a3 withCompletion:(id)a4
{
  -[_DDUIRapportIncomingTransportSession sendMessage:withTimeout:completion:](self, "sendMessage:withTimeout:completion:", a3, a4, 0.0);
}

- (void)sendMessage:(id)a3 withTimeout:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSString *sessionID;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  __CFString **v19;
  __CFString *v20;
  RPCompanionLinkClient *client;
  NSString *destinationID;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint8_t buf[4];
  _DDUIRapportIncomingTransportSession *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;
  void *v39;
  _QWORD v40[2];
  _QWORD v41[3];

  v41[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  sessionID = self->_sessionID;
  v40[0] = CFSTR("sesID");
  v40[1] = CFSTR("msgID");
  v41[0] = sessionID;
  v41[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  if (v8)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v8, CFSTR("info"));
  if (a4 <= 0.0)
  {
    v16 = 0;
  }
  else
  {
    v38 = *MEMORY[0x1E0D839E0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _DDUICoreRapportLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    -[_DDUIRapportIncomingTransportSession sessionID](self, "sessionID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v29 = self;
    v30 = 2112;
    v31 = v18;
    v32 = 2112;
    v33 = v11;
    v34 = 2112;
    v35 = v8;
    v36 = 2112;
    v37 = v16;
    _os_log_impl(&dword_1C87B2000, v17, OS_LOG_TYPE_DEFAULT, "_DDUIRapportIncomingTransportSession sending message {self: %p, sessionID: %@ messageID: %@, message: %@, options: %@}", buf, 0x34u);

  }
  v19 = _DDUIRapportPairingResponderMessageID;
  if (self->_sessionType == 1)
    v19 = _DDUIRapportContinuityCameraResponseMessageID;
  v20 = *v19;
  client = self->_client;
  destinationID = self->_destinationID;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __75___DDUIRapportIncomingTransportSession_sendMessage_withTimeout_completion___block_invoke;
  v25[3] = &unk_1E81B41C0;
  v25[4] = self;
  v26 = v11;
  v27 = v9;
  v23 = v9;
  v24 = v11;
  -[RPCompanionLinkClient sendRequestID:request:destinationID:options:responseHandler:](client, "sendRequestID:request:destinationID:options:responseHandler:", v20, v14, destinationID, v16, v25);

}

- (void)invalidate
{
  NSObject *v3;
  id messageHandler;
  RPCompanionLinkClient *client;
  int v6;
  _DDUIRapportIncomingTransportSession *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _DDUICoreRapportLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = self;
    _os_log_impl(&dword_1C87B2000, v3, OS_LOG_TYPE_DEFAULT, "-[_DDUIRapportIncomingTransportSession invalidate] {self: %p}", (uint8_t *)&v6, 0xCu);
  }

  messageHandler = self->_messageHandler;
  self->_messageHandler = 0;

  client = self->_client;
  self->_client = 0;

}

- (RPCompanionLinkClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (NSString)destinationID
{
  return self->_destinationID;
}

- (void)setDestinationID:(id)a3
{
  objc_storeStrong((id *)&self->_destinationID, a3);
}

- (id)messageHandler
{
  return self->_messageHandler;
}

- (void)setMessageHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (void)setSessionType:(unint64_t)a3
{
  self->_sessionType = a3;
}

- (_DDUIRapportDevice)cachedDevice
{
  return self->_cachedDevice;
}

- (void)setCachedDevice:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDevice, 0);
  objc_storeStrong(&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_destinationID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
