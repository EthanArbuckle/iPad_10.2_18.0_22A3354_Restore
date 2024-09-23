@implementation CXProviderExtensionHostContext

- (id)remoteObjectProxy
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CXProviderExtensionHostContext;
  -[CXProviderExtensionContext remoteObjectProxy](&v3, sel_remoteObjectProxy);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CXProviderExtensionHostContext;
  -[CXProviderExtensionContext remoteObjectProxyWithErrorHandler:](&v4, sel_remoteObjectProxyWithErrorHandler_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)commitTransaction:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "Committing transaction to extension vendor: %@", (uint8_t *)&v7, 0xCu);
  }

  -[CXProviderExtensionHostContext remoteObjectProxy](self, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commitTransaction:", v4);

}

- (void)handleActionTimeout:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "Asking extension vendor to handle action timeout: %@", (uint8_t *)&v7, 0xCu);
  }

  -[CXProviderExtensionHostContext remoteObjectProxy](self, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleActionTimeout:", v4);

}

- (void)handleAudioSessionActivationStateChangedTo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = objc_msgSend(v4, "BOOLValue");
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "Asking extension vendor to handle audio session activation state change to: %d", (uint8_t *)v7, 8u);
  }

  -[CXProviderExtensionHostContext remoteObjectProxy](self, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleAudioSessionActivationStateChangedTo:", v4);

}

- (void)registerWithConfiguration:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CXProviderExtensionHostContext delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerWithConfiguration:", v4);

}

- (void)reportNewIncomingCallWithUUID:(id)a3 update:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CXProviderExtensionHostContext delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reportNewIncomingCallWithUUID:update:reply:", v10, v9, v8);

}

- (void)reportCallWithUUID:(id)a3 updated:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CXProviderExtensionHostContext delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reportCallWithUUID:updated:", v7, v6);

}

- (void)reportCallWithUUID:(id)a3 receivedDTMFUpdate:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CXProviderExtensionHostContext delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reportCallWithUUID:receivedDTMFUpdate:", v7, v6);

}

- (void)reportOutgoingCallWithUUID:(id)a3 sentInvitationAtDate:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CXProviderExtensionHostContext delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reportOutgoingCallWithUUID:sentInvitationAtDate:", v7, v6);

}

- (void)reportOutgoingCallWithUUID:(id)a3 startedConnectingAtDate:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CXProviderExtensionHostContext delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reportOutgoingCallWithUUID:startedConnectingAtDate:", v7, v6);

}

- (void)reportOutgoingCallWithUUID:(id)a3 connectedAtDate:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CXProviderExtensionHostContext delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reportOutgoingCallWithUUID:connectedAtDate:", v7, v6);

}

- (void)reportCallWithUUID:(id)a3 endedAtDate:(id)a4 privateReason:(int64_t)a5 failureContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[CXProviderExtensionHostContext delegate](self, "delegate");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reportCallWithUUID:endedAtDate:privateReason:failureContext:", v12, v11, a5, v10);

}

- (void)reportAudioFinishedForCallWithUUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CXProviderExtensionHostContext delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportAudioFinishedForCallWithUUID:", v4);

}

- (void)reportCallWithUUID:(id)a3 changedFrequencyData:(id)a4 forDirection:(int64_t)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  -[CXProviderExtensionHostContext delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reportCallWithUUID:changedFrequencyData:forDirection:", v9, v8, a5);

}

- (void)reportCallWithUUID:(id)a3 changedMeterLevel:(float)a4 forDirection:(int64_t)a5
{
  id v8;
  double v9;
  id v10;

  v8 = a3;
  -[CXProviderExtensionHostContext delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v9 = a4;
  objc_msgSend(v10, "reportCallWithUUID:changedMeterLevel:forDirection:", v8, a5, v9);

}

- (void)reportCallWithUUID:(id)a3 crossDeviceIdentifier:(id)a4 changedBytesOfDataUsed:(int64_t)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  -[CXProviderExtensionHostContext delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reportCallWithUUID:crossDeviceIdentifier:changedBytesOfDataUsed:", v9, v8, a5);

}

- (void)reportNewOutgoingCallWithUUID:(id)a3 update:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CXProviderExtensionHostContext delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reportNewOutgoingCallWithUUID:update:", v7, v6);

}

- (void)requestTransaction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CXProviderExtensionHostContext delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestTransaction:completionHandler:", v7, v6);

}

- (void)actionCompleted:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CXProviderExtensionHostContext delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionCompleted:completionHandler:", v7, v6);

}

- (CXProviderHostProtocol)delegate
{
  return (CXProviderHostProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
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
