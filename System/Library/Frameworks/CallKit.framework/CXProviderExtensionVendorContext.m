@implementation CXProviderExtensionVendorContext

- (id)remoteObjectProxy
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CXProviderExtensionVendorContext;
  -[CXProviderExtensionContext remoteObjectProxy](&v3, sel_remoteObjectProxy);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CXProviderExtensionVendorContext;
  -[CXProviderExtensionContext remoteObjectProxyWithErrorHandler:](&v4, sel_remoteObjectProxyWithErrorHandler_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)registerWithConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[CXProviderExtensionVendorContext registerWithConfiguration:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "Sending %s with configuration: %@", (uint8_t *)&v7, 0x16u);
  }

  -[CXProviderExtensionVendorContext remoteObjectProxy](self, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerWithConfiguration:", v4);

}

- (void)reportNewIncomingCallWithUUID:(id)a3 update:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  CXDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315650;
    v15 = "-[CXProviderExtensionVendorContext reportNewIncomingCallWithUUID:update:reply:]";
    v16 = 2112;
    v17 = v12;
    v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_1A402D000, v11, OS_LOG_TYPE_DEFAULT, "Sending %s with UUID: %@ update: %@", (uint8_t *)&v14, 0x20u);

  }
  -[CXProviderExtensionVendorContext remoteObjectProxy](self, "remoteObjectProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reportNewIncomingCallWithUUID:update:completion:", v8, v9, v10);

}

- (void)reportCallWithUUID:(id)a3 updated:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315650;
    v12 = "-[CXProviderExtensionVendorContext reportCallWithUUID:updated:]";
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "Sending %s with UUID: %@ update: %@", (uint8_t *)&v11, 0x20u);

  }
  -[CXProviderExtensionVendorContext remoteObjectProxy](self, "remoteObjectProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reportCallWithUUID:updated:", v6, v7);

}

- (void)reportCallWithUUID:(id)a3 receivedDTMFUpdate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315650;
    v12 = "-[CXProviderExtensionVendorContext reportCallWithUUID:receivedDTMFUpdate:]";
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "Sending %s with UUID: %@ dtmfUpdate: %@", (uint8_t *)&v11, 0x20u);

  }
  -[CXProviderExtensionVendorContext remoteObjectProxy](self, "remoteObjectProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reportCallWithUUID:receivedDTMFUpdate:", v6, v7);

}

- (void)reportOutgoingCallWithUUID:(id)a3 sentInvitationAtDate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315650;
    v12 = "-[CXProviderExtensionVendorContext reportOutgoingCallWithUUID:sentInvitationAtDate:]";
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "Sending %s with UUID: %@ dateSentInvitation: %@", (uint8_t *)&v11, 0x20u);

  }
  -[CXProviderExtensionVendorContext remoteObjectProxy](self, "remoteObjectProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reportOutgoingCallWithUUID:sentInvitationAtDate:", v6, v7);

}

- (void)reportOutgoingCallWithUUID:(id)a3 startedConnectingAtDate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315650;
    v12 = "-[CXProviderExtensionVendorContext reportOutgoingCallWithUUID:startedConnectingAtDate:]";
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "Sending %s with UUID: %@ dateStartedConnecting: %@", (uint8_t *)&v11, 0x20u);

  }
  -[CXProviderExtensionVendorContext remoteObjectProxy](self, "remoteObjectProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reportOutgoingCallWithUUID:startedConnectingAtDate:", v6, v7);

}

- (void)reportOutgoingCallWithUUID:(id)a3 connectedAtDate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315650;
    v12 = "-[CXProviderExtensionVendorContext reportOutgoingCallWithUUID:connectedAtDate:]";
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "Sending %s with UUID: %@ dateConnected: %@", (uint8_t *)&v11, 0x20u);

  }
  -[CXProviderExtensionVendorContext remoteObjectProxy](self, "remoteObjectProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reportOutgoingCallWithUUID:connectedAtDate:", v6, v7);

}

- (void)reportCallWithUUID:(id)a3 endedAtDate:(id)a4 privateReason:(int64_t)a5 failureContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  int64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  CXDefaultLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 136316162;
    v17 = "-[CXProviderExtensionVendorContext reportCallWithUUID:endedAtDate:privateReason:failureContext:]";
    v18 = 2112;
    v19 = v14;
    v20 = 2112;
    v21 = v11;
    v22 = 2048;
    v23 = a5;
    v24 = 2112;
    v25 = v12;
    _os_log_impl(&dword_1A402D000, v13, OS_LOG_TYPE_DEFAULT, "Sending %s with UUID: %@ dateEnded: %@ privateEndedReason: %ld failureContext: %@", (uint8_t *)&v16, 0x34u);

  }
  -[CXProviderExtensionVendorContext remoteObjectProxy](self, "remoteObjectProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "reportCallWithUUID:endedAtDate:privateReason:failureContext:", v10, v11, a5, v12);

}

- (void)reportAudioFinishedForCallWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[CXProviderExtensionVendorContext reportAudioFinishedForCallWithUUID:]";
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "Sending %s with UUID: %@", (uint8_t *)&v8, 0x16u);

  }
  -[CXProviderExtensionVendorContext remoteObjectProxy](self, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reportAudioFinishedForCallWithUUID:", v4);

}

- (void)reportCallWithUUID:(id)a3 changedFrequencyData:(id)a4 forDirection:(int64_t)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  -[CXProviderExtensionVendorContext remoteObjectProxy](self, "remoteObjectProxy");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reportCallWithUUID:changedFrequencyData:forDirection:", v9, v8, a5);

}

- (void)reportCallWithUUID:(id)a3 changedMeterLevel:(float)a4 forDirection:(int64_t)a5
{
  id v8;
  double v9;
  id v10;

  v8 = a3;
  -[CXProviderExtensionVendorContext remoteObjectProxy](self, "remoteObjectProxy");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v9 = a4;
  objc_msgSend(v10, "reportCallWithUUID:changedMeterLevel:forDirection:", v8, a5, v9);

}

- (void)reportCallWithUUID:(id)a3 crossDeviceIdentifier:(id)a4 changedBytesOfDataUsed:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  int64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  CXDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315906;
    v14 = "-[CXProviderExtensionVendorContext reportCallWithUUID:crossDeviceIdentifier:changedBytesOfDataUsed:]";
    v15 = 2112;
    v16 = v11;
    v17 = 2112;
    v18 = v9;
    v19 = 2048;
    v20 = a5;
    _os_log_impl(&dword_1A402D000, v10, OS_LOG_TYPE_DEFAULT, "Sending %s with UUID: %@ crossDeviceIdentifier: %@ bytesOfDataUsed: %ld", (uint8_t *)&v13, 0x2Au);

  }
  -[CXProviderExtensionVendorContext remoteObjectProxy](self, "remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reportCallWithUUID:crossDeviceIdentifier:changedBytesOfDataUsed:", v8, v9, a5);

}

- (void)reportNewOutgoingCallWithUUID:(id)a3 update:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CXProviderExtensionVendorContext remoteObjectProxy](self, "remoteObjectProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reportNewOutgoingCallWithUUID:update:", v7, v6);

}

- (void)requestTransaction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[CXProviderExtensionVendorContext requestTransaction:completionHandler:]";
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "Sending %s with transaction: %@", (uint8_t *)&v10, 0x16u);
  }

  -[CXProviderExtensionVendorContext remoteObjectProxy](self, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestTransaction:reply:", v6, v7);

}

- (void)actionCompleted:(id)a3 completionHandler:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  CXDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[CXProviderExtensionVendorContext actionCompleted:completionHandler:]";
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1A402D000, v6, OS_LOG_TYPE_DEFAULT, "Sending %s with action: %@", (uint8_t *)&v8, 0x16u);
  }

  -[CXProviderExtensionVendorContext remoteObjectProxy](self, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionCompleted:", v5);

}

- (void)commitTransaction:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[CXProviderExtensionVendorContext commitTransaction:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "Received %s with transaction: %@", (uint8_t *)&v7, 0x16u);
  }

  -[CXProviderExtensionVendorContext delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "providerExtensionVendorContext:receivedCommittedTransaction:", self, v4);

}

- (void)handleActionTimeout:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[CXProviderExtensionVendorContext handleActionTimeout:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "Received %s with action: %@", (uint8_t *)&v7, 0x16u);
  }

  -[CXProviderExtensionVendorContext delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "providerExtensionVendorContext:handledActionTimeout:", self, v4);

}

- (void)handleAudioSessionActivationStateChangedTo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[CXProviderExtensionVendorContext handleAudioSessionActivationStateChangedTo:]";
    v9 = 1024;
    v10 = objc_msgSend(v4, "BOOLValue");
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "Received %s with active: %d", (uint8_t *)&v7, 0x12u);
  }

  -[CXProviderExtensionVendorContext delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "providerExtensionVendorContext:handledAudioSessionActivationStateChangedTo:", self, objc_msgSend(v4, "BOOLValue"));

}

- (CXProviderExtensionVendorContextDelegate)delegate
{
  return (CXProviderExtensionVendorContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
