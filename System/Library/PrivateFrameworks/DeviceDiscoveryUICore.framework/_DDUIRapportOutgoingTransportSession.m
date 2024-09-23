@implementation _DDUIRapportOutgoingTransportSession

- (_DDUIRapportOutgoingTransportSession)initWithServiceIdentifier:(id)a3
{
  id v5;
  _DDUIRapportOutgoingTransportSession *v6;
  _DDUIRapportOutgoingTransportSession *v7;
  void *v8;
  uint64_t v9;
  NSString *sessionID;
  NSObject *v11;
  NSString *v12;
  objc_super v14;
  uint8_t buf[4];
  _DDUIRapportOutgoingTransportSession *v16;
  __int16 v17;
  NSString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_DDUIRapportOutgoingTransportSession;
  v6 = -[_DDUIRapportOutgoingTransportSession init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serviceIdentifier, a3);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = objc_claimAutoreleasedReturnValue();
    sessionID = v7->_sessionID;
    v7->_sessionID = (NSString *)v9;

    _DDUICoreRapportLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v7->_sessionID;
      *(_DWORD *)buf = 134218242;
      v16 = v7;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_1C87B2000, v11, OS_LOG_TYPE_DEFAULT, "-[_DDUIRapportOutgoingTransportSession init] {self: %p, sessionID: %@}", buf, 0x16u);
    }

  }
  return v7;
}

- (DDUIDevice)remoteDevice
{
  _DDUIRapportDevice *v3;
  void *v4;
  _DDUIRapportDevice *v5;

  v3 = [_DDUIRapportDevice alloc];
  -[RPCompanionLinkClient destinationDevice](self->_client, "destinationDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_DDUIRapportDevice initWithRPCompanionLinkDevice:](v3, "initWithRPCompanionLinkDevice:", v4);

  return (DDUIDevice *)v5;
}

- (void)generateNetworkEndpointIdentifierForRemoteDevice:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  _DDUIRapportOutgoingTransportSession *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  _DDUICoreRapportLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v18 = self;
    _os_log_impl(&dword_1C87B2000, v8, OS_LOG_TYPE_DEFAULT, "_DDUIRapportOutgoingTransportSession generating mapping {self: %p}", buf, 0xCu);
  }

  v9 = objc_alloc_init(MEMORY[0x1E0D838E8]);
  -[_DDUIRapportOutgoingTransportSession serviceIdentifier](self, "serviceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DDUIRapportOutgoingTransportSession client](self, "client");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "destinationDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __104___DDUIRapportOutgoingTransportSession_generateNetworkEndpointIdentifierForRemoteDevice_withCompletion___block_invoke;
  v15[3] = &unk_1E81B4740;
  v15[4] = self;
  v16 = v6;
  v14 = v6;
  objc_msgSend(v9, "createEndpointToDeviceMapping:deviceID:endpointID:completion:", v10, v13, v7, v15);

}

- (void)handleIncomingMessage:(id)a3 withMessageID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void (**v9)(_QWORD, _QWORD);
  int v10;
  _DDUIRapportOutgoingTransportSession *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _DDUICoreRapportLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218498;
    v11 = self;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1C87B2000, v8, OS_LOG_TYPE_DEFAULT, "_DDUIRapportOutgoingTransportSession - incoming ResponderMessage {self: %p, messageID: %@, message: %@}", (uint8_t *)&v10, 0x20u);
  }

  -[_DDUIRapportOutgoingTransportSession messageHandler](self, "messageHandler");
  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v9)[2](v9, v6);

}

- (void)activateWithErrorHandler:(id)a3 messageHandler:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id messageHandler;
  RPCompanionLinkClient *client;
  uint64_t v18;
  id v19;
  RPCompanionLinkClient *v20;
  id v21;
  RPCompanionLinkClient *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _BYTE buf[12];
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _DDUICoreRapportLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)MEMORY[0x1CAA33E80](v8);
    v13 = (void *)MEMORY[0x1CAA33E80](v9);
    v14 = (void *)MEMORY[0x1CAA33E80](v10);
    *(_DWORD *)buf = 134218754;
    *(_QWORD *)&buf[4] = self;
    v33 = 2112;
    v34 = v12;
    v35 = 2112;
    v36 = v13;
    v37 = 2112;
    v38 = v14;
    _os_log_impl(&dword_1C87B2000, v11, OS_LOG_TYPE_DEFAULT, "_DDUIRapportOutgoingTransportSession activating {self: %p, errorHandler: %@, messageHandler: %@, completion: %@}", buf, 0x2Au);

  }
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  v15 = (void *)MEMORY[0x1CAA33E80](v9);
  messageHandler = self->_messageHandler;
  self->_messageHandler = v15;

  client = self->_client;
  v18 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __91___DDUIRapportOutgoingTransportSession_activateWithErrorHandler_messageHandler_completion___block_invoke;
  v29[3] = &unk_1E81B4768;
  objc_copyWeak(&v31, (id *)buf);
  v19 = v8;
  v30 = v19;
  -[RPCompanionLinkClient setDisconnectHandler:](client, "setDisconnectHandler:", v29);
  v20 = self->_client;
  v26[0] = v18;
  v26[1] = 3221225472;
  v26[2] = __91___DDUIRapportOutgoingTransportSession_activateWithErrorHandler_messageHandler_completion___block_invoke_4;
  v26[3] = &unk_1E81B4768;
  objc_copyWeak(&v28, (id *)buf);
  v21 = v19;
  v27 = v21;
  -[RPCompanionLinkClient setInterruptionHandler:](v20, "setInterruptionHandler:", v26);
  v22 = self->_client;
  v24[0] = v18;
  v24[1] = 3221225472;
  v24[2] = __91___DDUIRapportOutgoingTransportSession_activateWithErrorHandler_messageHandler_completion___block_invoke_5;
  v24[3] = &unk_1E81B42E0;
  v24[4] = self;
  v23 = v10;
  v25 = v23;
  -[RPCompanionLinkClient activateWithCompletion:](v22, "activateWithCompletion:", v24);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)buf);

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
  NSString *v18;
  RPCompanionLinkClient *client;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[4];
  _DDUIRapportOutgoingTransportSession *v26;
  __int16 v27;
  NSString *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;
  void *v36;
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  sessionID = self->_sessionID;
  v37[0] = CFSTR("sesID");
  v37[1] = CFSTR("msgID");
  v38[0] = sessionID;
  v38[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
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
    v35 = *MEMORY[0x1E0D839E0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _DDUICoreRapportLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = self->_sessionID;
    *(_DWORD *)buf = 134219010;
    v26 = self;
    v27 = 2112;
    v28 = v18;
    v29 = 2112;
    v30 = v11;
    v31 = 2112;
    v32 = v8;
    v33 = 2112;
    v34 = v16;
    _os_log_impl(&dword_1C87B2000, v17, OS_LOG_TYPE_DEFAULT, "_DDUIRapportOutgoingTransportSession sending message {self: %p, sessionID: %@, messageID: %@, message: %@, options: %@}", buf, 0x34u);
  }

  client = self->_client;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __75___DDUIRapportOutgoingTransportSession_sendMessage_withTimeout_completion___block_invoke;
  v22[3] = &unk_1E81B41C0;
  v22[4] = self;
  v23 = v11;
  v24 = v9;
  v20 = v9;
  v21 = v11;
  -[RPCompanionLinkClient sendRequestID:request:options:responseHandler:](client, "sendRequestID:request:options:responseHandler:", CFSTR("DDUI-pair-init"), v14, v16, v22);

}

- (void)sendMessage:(id)a3 withCompletion:(id)a4
{
  -[_DDUIRapportOutgoingTransportSession sendMessage:withTimeout:completion:](self, "sendMessage:withTimeout:completion:", a3, a4, 0.0);
}

- (void)invalidate
{
  NSObject *v3;
  RPCompanionLinkClient *client;
  int v5;
  _DDUIRapportOutgoingTransportSession *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _DDUICoreRapportLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = self;
    _os_log_impl(&dword_1C87B2000, v3, OS_LOG_TYPE_DEFAULT, "-[_DDUIRapportOutgoingTransportSession invalidate] {self: %p}", (uint8_t *)&v5, 0xCu);
  }

  -[RPCompanionLinkClient invalidate](self->_client, "invalidate");
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

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_serviceIdentifier, a3);
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (id)messageHandler
{
  return self->_messageHandler;
}

- (void)setMessageHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
