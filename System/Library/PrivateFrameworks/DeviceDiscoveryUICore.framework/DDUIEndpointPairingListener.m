@implementation DDUIEndpointPairingListener

- (DDUIEndpointPairingListener)initWithTransport:(id)a3
{
  id v5;
  DDUIEndpointPairingListener *v6;
  DDUIEndpointPairingListener *v7;
  NSObject *v8;
  objc_super v10;
  uint8_t buf[4];
  DDUIEndpointPairingListener *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DDUIEndpointPairingListener;
  v6 = -[DDUIEndpointPairingListener init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transport, a3);
    _DDUICoreLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v12 = v7;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_1C87B2000, v8, OS_LOG_TYPE_DEFAULT, "-[DDUIEndpointPairingListener init] {self: %p, transport: %@}", buf, 0x16u);
    }

  }
  return v7;
}

- (void)beginListeningWithErrorHandler:(id)a3 pairingHandler:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  DDUIEndpointPairingListeningTransport *transport;
  id v17;
  DDUIEndpointPairingListeningTransport *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  DDUIEndpointPairingListener *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _DDUICoreLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)MEMORY[0x1CAA33E80](v10);
    v13 = (void *)MEMORY[0x1CAA33E80](v9);
    v14 = (void *)MEMORY[0x1CAA33E80](v10);
    *(_DWORD *)buf = 134218754;
    v27 = self;
    v28 = 2112;
    v29 = v12;
    v30 = 2112;
    v31 = v13;
    v32 = 2112;
    v33 = v14;
    _os_log_impl(&dword_1C87B2000, v11, OS_LOG_TYPE_DEFAULT, "DDUIEndpointPairingListener beginning {self: %p, errorHandler: %@, pairingHandler: %@, completion: %@}", buf, 0x2Au);

  }
  v15 = MEMORY[0x1E0C809B0];
  transport = self->_transport;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __88__DDUIEndpointPairingListener_beginListeningWithErrorHandler_pairingHandler_completion___block_invoke;
  v24[3] = &unk_1E81B46A0;
  v25 = v9;
  v17 = v9;
  -[DDUIEndpointPairingListeningTransport setupListeningForSessionsWithHandler:](transport, "setupListeningForSessionsWithHandler:", v24);
  v18 = self->_transport;
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __88__DDUIEndpointPairingListener_beginListeningWithErrorHandler_pairingHandler_completion___block_invoke_2;
  v21[3] = &unk_1E81B46C8;
  v21[4] = self;
  v22 = v8;
  v23 = v10;
  v19 = v10;
  v20 = v8;
  -[DDUIEndpointPairingListeningTransport activateForDeviceTypes:withCompletion:](v18, "activateForDeviceTypes:withCompletion:", 0xFFFFFFFFLL, v21);

}

void __88__DDUIEndpointPairingListener_beginListeningWithErrorHandler_pairingHandler_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  DDUIEndpointPairingSession *v10;

  v7 = a3;
  v8 = a2;
  v10 = -[DDUIEndpointPairingSession initWithTransportSession:mode:]([DDUIEndpointPairingSession alloc], "initWithTransportSession:mode:", v8, 1);

  -[DDUIEndpointPairingSession setSessionType:](v10, "setSessionType:", a4);
  -[DDUIEndpointPairingSession setIncomingMessage:](v10, "setIncomingMessage:", v7);
  -[DDUIEndpointPairingSession processInitialMessage:](v10, "processInitialMessage:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __88__DDUIEndpointPairingListener_beginListeningWithErrorHandler_pairingHandler_completion___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _DDUICoreLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = a1[4];
      v8 = 134218242;
      v9 = v6;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_1C87B2000, v4, OS_LOG_TYPE_DEFAULT, "DDUIEndpointPairingListener failed to activate {self: %p, inError: %@}", (uint8_t *)&v8, 0x16u);
    }

    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    if (v5)
    {
      v7 = a1[4];
      v8 = 134217984;
      v9 = v7;
      _os_log_impl(&dword_1C87B2000, v4, OS_LOG_TYPE_DEFAULT, "DDUIEndpointPairingListener activated {self: %p}", (uint8_t *)&v8, 0xCu);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }

}

- (void)checkIfUserNeedsReconfirmationForSession:(id)a3 withServiceIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  DDUIEndpointPairingListeningTransport *transport;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  transport = self->_transport;
  v10 = a4;
  objc_msgSend(a3, "remoteDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __105__DDUIEndpointPairingListener_checkIfUserNeedsReconfirmationForSession_withServiceIdentifier_completion___block_invoke;
  v13[3] = &unk_1E81B46F0;
  v14 = v8;
  v12 = v8;
  -[DDUIEndpointPairingListeningTransport shouldReauthenticateDevice:forServiceIdentifier:completion:](transport, "shouldReauthenticateDevice:forServiceIdentifier:completion:", v11, v10, v13);

}

void __105__DDUIEndpointPairingListener_checkIfUserNeedsReconfirmationForSession_withServiceIdentifier_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _DDUICoreLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("No");
    if (a2)
      v7 = CFSTR("Yes");
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1C87B2000, v6, OS_LOG_TYPE_DEFAULT, "Should reauthenticate user session? %@ Found listenerID %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)createListenerMappingForSession:(id)a3 withServiceIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  DDUIEndpointPairingListeningTransport *transport;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  transport = self->_transport;
  v10 = a4;
  objc_msgSend(a3, "remoteDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __96__DDUIEndpointPairingListener_createListenerMappingForSession_withServiceIdentifier_completion___block_invoke;
  v13[3] = &unk_1E81B4718;
  v14 = v8;
  v12 = v8;
  -[DDUIEndpointPairingListeningTransport createListenerMappingForDevice:forServiceIdentifier:completion:](transport, "createListenerMappingForDevice:forServiceIdentifier:completion:", v11, v10, v13);

}

uint64_t __96__DDUIEndpointPairingListener_createListenerMappingForSession_withServiceIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  NSObject *v3;
  int v4;
  DDUIEndpointPairingListener *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _DDUICoreLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = self;
    _os_log_impl(&dword_1C87B2000, v3, OS_LOG_TYPE_DEFAULT, "DDUIEndpointPairingListener invalidating {self: %p}", (uint8_t *)&v4, 0xCu);
  }

  -[DDUIEndpointPairingListeningTransport invalidate](self->_transport, "invalidate");
}

- (DDUIEndpointPairingListeningTransport)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
  objc_storeStrong((id *)&self->_transport, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transport, 0);
}

@end
