@implementation DDUIEndpointPairingSession

- (DDUIEndpointPairingSession)initWithTransportSession:(id)a3 mode:(unint64_t)a4
{
  id v7;
  DDUIEndpointPairingSession *v8;
  DDUIEndpointPairingSession *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSUUID *sessionID;
  uint64_t v15;
  dispatch_group_t v16;
  OS_dispatch_group *activateGroup;
  NSObject *v18;
  void *v19;
  objc_super v21;
  uint8_t buf[4];
  DDUIEndpointPairingSession *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)DDUIEndpointPairingSession;
  v8 = -[DDUIEndpointPairingSession init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_transportSession, a3);
    v9->_mode = a4;
    v9->_state = 0;
    objc_msgSend(v7, "sessionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v7, "sessionID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "initWithUUIDString:", v12);
      sessionID = v9->_sessionID;
      v9->_sessionID = (NSUUID *)v13;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v15 = objc_claimAutoreleasedReturnValue();
      v12 = v9->_sessionID;
      v9->_sessionID = (NSUUID *)v15;
    }

    v16 = dispatch_group_create();
    activateGroup = v9->_activateGroup;
    v9->_activateGroup = (OS_dispatch_group *)v16;

    dispatch_group_enter((dispatch_group_t)v9->_activateGroup);
    _DDUICoreLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "remoteDevice");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v23 = v9;
      v24 = 2112;
      v25 = v7;
      v26 = 2048;
      v27 = a4;
      v28 = 2112;
      v29 = v19;
      _os_log_impl(&dword_1C87B2000, v18, OS_LOG_TYPE_DEFAULT, "-[DDUIEndpointPairingSession init] {self: %p, transportSession: %@, mode: %lu, remoteDevice: %@}", buf, 0x2Au);

    }
  }

  return v9;
}

- (void)dealloc
{
  NSObject *v3;
  unint64_t state;
  unint64_t mode;
  unint64_t v6;
  objc_super v7;
  uint8_t buf[4];
  DDUIEndpointPairingSession *v9;
  __int16 v10;
  unint64_t v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _DDUICoreLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    mode = self->_mode;
    state = self->_state;
    *(_DWORD *)buf = 134218496;
    v9 = self;
    v10 = 2048;
    v11 = state;
    v12 = 2048;
    v13 = mode;
    _os_log_impl(&dword_1C87B2000, v3, OS_LOG_TYPE_DEFAULT, "-[DDUIEndpointPairingSession dealloc] {self: %p, state: %lu, mode: %lu}", buf, 0x20u);
  }

  v6 = self->_state;
  if (v6 == 2 || !v6 && self->_mode == 1)
    -[DDUIEndpointPairingSession _failPairing](self, "_failPairing");
  if (!self->_activated)
    dispatch_group_leave((dispatch_group_t)self->_activateGroup);
  v7.receiver = self;
  v7.super_class = (Class)DDUIEndpointPairingSession;
  -[DDUIEndpointPairingSession dealloc](&v7, sel_dealloc);
}

- (DDUIDevice)remoteDevice
{
  return (DDUIDevice *)-[DDUIEndpointPairingTransportSession remoteDevice](self->_transportSession, "remoteDevice");
}

- (void)cancelWithMessage:(id)a3
{
  void *v4;
  NSObject *v5;
  unint64_t state;
  unint64_t mode;
  unint64_t v8;
  void *v9;
  void *v10;
  DDUIEndpointPairingTransportSession *transportSession;
  _QWORD v12[5];
  const __CFString *v13;
  void *v14;
  uint8_t buf[4];
  DDUIEndpointPairingSession *v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _DDUICoreLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    mode = self->_mode;
    state = self->_state;
    *(_DWORD *)buf = 134218754;
    v16 = self;
    v17 = 2048;
    v18 = state;
    v19 = 2048;
    v20 = mode;
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_1C87B2000, v5, OS_LOG_TYPE_DEFAULT, "-[DDUIEndpointPairingSession cancelWithMessage:] {self: %p, state: %lu, mode: %lu, info: %@}", buf, 0x2Au);
  }

  v8 = self->_state;
  if (v8 == 2 || !v8 && self->_mode == 1)
  {
    self->_state = 5;
    v13 = CFSTR("type");
    v14 = &unk_1E81B9618;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    if (v4)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v4, CFSTR("usi"));
    transportSession = self->_transportSession;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __48__DDUIEndpointPairingSession_cancelWithMessage___block_invoke;
    v12[3] = &unk_1E81B4790;
    v12[4] = self;
    -[DDUIEndpointPairingTransportSession sendMessage:withCompletion:](transportSession, "sendMessage:withCompletion:", v10, v12);

  }
}

void __48__DDUIEndpointPairingSession_cancelWithMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _DDUICoreLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 134218242;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1C87B2000, v4, OS_LOG_TYPE_DEFAULT, "DDUIEndpointPairingSession cancel finished sending {self: %p, error: %@}", (uint8_t *)&v6, 0x16u);
  }

}

- (void)invalidate
{
  NSObject *v3;
  unint64_t state;
  unint64_t mode;
  id completionHandler;
  id errorHandler;
  unint64_t v8;
  DDUIEndpointPairingTransportSession *transportSession;
  int v10;
  DDUIEndpointPairingSession *v11;
  __int16 v12;
  unint64_t v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _DDUICoreLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    mode = self->_mode;
    state = self->_state;
    v10 = 134218496;
    v11 = self;
    v12 = 2048;
    v13 = state;
    v14 = 2048;
    v15 = mode;
    _os_log_impl(&dword_1C87B2000, v3, OS_LOG_TYPE_DEFAULT, "-[DDUIEndpointPairingSession invalidate] {self: %p, state: %lu, mode: %lu}", (uint8_t *)&v10, 0x20u);
  }

  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  errorHandler = self->_errorHandler;
  self->_errorHandler = 0;

  v8 = self->_state;
  if (v8 == 2 || !v8 && self->_mode == 1)
  {
    self->_state = 5;
    -[DDUIEndpointPairingSession _failPairing](self, "_failPairing");
  }
  else
  {
    -[DDUIEndpointPairingTransportSession invalidate](self->_transportSession, "invalidate");
    transportSession = self->_transportSession;
    self->_transportSession = 0;

  }
}

- (void)pairWithMessage:(id)a3 errorHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;

  v8 = a3;
  -[DDUIEndpointPairingSession _activateWithErrorHandler:completionHandler:](self, "_activateWithErrorHandler:completionHandler:", a4, a5);
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[DDUIEndpointPairingSession _pairWithInfo:](self, "_pairWithInfo:", v9);
}

- (void)pairWithMessage:(id)a3
{
  id v4;

  objc_msgSend(a3, "dictionaryRepresentation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DDUIEndpointPairingSession _pairWithInfo:](self, "_pairWithInfo:", v4);

}

- (void)_sendPairingWithInfo:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[DDUIEndpointPairingSession mode](self, "mode");
  if (v5 == 1)
  {
    v14 = CFSTR("type");
    v15 = &unk_1E81B9648;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v11, "mutableCopy");

    if (v4)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("usi"));
    -[DDUIEndpointPairingSession setState:](self, "setState:", 3);
    -[DDUIEndpointPairingSession transportSession](self, "transportSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __51__DDUIEndpointPairingSession__sendPairingWithInfo___block_invoke_16;
    v12[3] = &unk_1E81B4790;
    v12[4] = self;
    v10 = v12;
    goto LABEL_9;
  }
  if (!v5)
  {
    -[DDUIEndpointPairingSession setState:](self, "setState:", 2);
    v16 = CFSTR("type");
    v17[0] = &unk_1E81B9630;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    if (v4)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("usi"));
    -[DDUIEndpointPairingSession transportSession](self, "transportSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __51__DDUIEndpointPairingSession__sendPairingWithInfo___block_invoke;
    v13[3] = &unk_1E81B4790;
    v13[4] = self;
    v10 = v13;
LABEL_9:
    objc_msgSend(v8, "sendMessage:withCompletion:", v7, v10);

  }
}

void __51__DDUIEndpointPairingSession__sendPairingWithInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _DDUICoreLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 134218242;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1C87B2000, v4, OS_LOG_TYPE_DEFAULT, "DDUIEndpointPairingSession start message finished sending {self: %p, error: %@}", (uint8_t *)&v6, 0x16u);
  }

}

void __51__DDUIEndpointPairingSession__sendPairingWithInfo___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  DDUIPairCompleteMessage *v11;
  DDUIPairCompleteMessage *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _DDUICoreLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51__DDUIEndpointPairingSession__sendPairingWithInfo___block_invoke_16_cold_1(a1, (uint64_t)v3, v5);

    objc_msgSend(*(id *)(a1 + 32), "errorHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "errorHandler");
      v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v7)[2](v7, v3);

    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v8, "startUserInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 134218498;
      v15 = v8;
      v16 = 2112;
      v17 = 0;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_1C87B2000, v5, OS_LOG_TYPE_DEFAULT, "DDUIEndpointPairingSession accept message finished sending {self: %p, error: %@, startUserInfo: %@}", (uint8_t *)&v14, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [DDUIPairCompleteMessage alloc];
      v12 = -[DDUIPairCompleteMessage initWithDictionaryRepresentation:](v11, "initWithDictionaryRepresentation:", MEMORY[0x1E0C9AA70]);
      objc_msgSend(*(id *)(a1 + 32), "completionHandler");
      v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, _QWORD, DDUIPairCompleteMessage *))v13)[2](v13, 0, 0, v12);

    }
    objc_msgSend(*(id *)(a1 + 32), "_clearBlocks");
  }

}

- (void)activateWithErrorHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__DDUIEndpointPairingSession_activateWithErrorHandler_completionHandler___block_invoke;
  v8[3] = &unk_1E81B47B8;
  v9 = v6;
  v7 = v6;
  -[DDUIEndpointPairingSession _activateWithErrorHandler:completionHandler:](self, "_activateWithErrorHandler:completionHandler:", a3, v8);

}

uint64_t __73__DDUIEndpointPairingSession_activateWithErrorHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_activateWithErrorHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  DDUIEndpointPairingTransportSession *transportSession;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  if (!self->_state)
  {
    location = 0;
    objc_initWeak(&location, self);
    self->_state = 1;
    transportSession = self->_transportSession;
    v9 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __74__DDUIEndpointPairingSession__activateWithErrorHandler_completionHandler___block_invoke;
    v17[3] = &unk_1E81B47E0;
    objc_copyWeak(&v19, &location);
    v10 = v6;
    v18 = v10;
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __74__DDUIEndpointPairingSession__activateWithErrorHandler_completionHandler___block_invoke_19;
    v15[3] = &unk_1E81B4808;
    objc_copyWeak(&v16, &location);
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __74__DDUIEndpointPairingSession__activateWithErrorHandler_completionHandler___block_invoke_2;
    v11[3] = &unk_1E81B4830;
    objc_copyWeak(&v14, &location);
    v12 = v7;
    v13 = v10;
    -[DDUIEndpointPairingTransportSession activateWithErrorHandler:messageHandler:completion:](transportSession, "activateWithErrorHandler:messageHandler:completion:", v17, v15, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

}

void __74__DDUIEndpointPairingSession__activateWithErrorHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    _DDUICoreLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __74__DDUIEndpointPairingSession__activateWithErrorHandler_completionHandler___block_invoke_cold_1((uint64_t)WeakRetained, (uint64_t)v3, v5);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __74__DDUIEndpointPairingSession__activateWithErrorHandler_completionHandler___block_invoke_19(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_handleIncomingMessage:", v5);

}

void __74__DDUIEndpointPairingSession__activateWithErrorHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    _DDUICoreLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134218498;
      v8 = WeakRetained;
      v9 = 2048;
      v10 = objc_msgSend(WeakRetained, "mode");
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_1C87B2000, v5, OS_LOG_TYPE_DEFAULT, "DDUIEndpointPairingSession activated {self: %p,  mode: %lu, inSession: %@}", (uint8_t *)&v7, 0x20u);
    }

    objc_msgSend(WeakRetained, "setCompletionHandler:", *(_QWORD *)(a1 + 32));
    objc_msgSend(WeakRetained, "setErrorHandler:", *(_QWORD *)(a1 + 40));
    objc_msgSend(WeakRetained, "setState:", 2);
    objc_msgSend(WeakRetained, "activateGroup");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_group_leave(v6);

    objc_msgSend(WeakRetained, "setActivated:", 1);
  }

}

- (void)_pairWithInfo:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  -[DDUIEndpointPairingSession activateGroup](self, "activateGroup");
  v5 = objc_claimAutoreleasedReturnValue();
  DDUICorePrimaryQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__DDUIEndpointPairingSession__pairWithInfo___block_invoke;
  block[3] = &unk_1E81B4858;
  objc_copyWeak(&v10, &location);
  v9 = v4;
  v7 = v4;
  dispatch_group_notify(v5, v6, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __44__DDUIEndpointPairingSession__pairWithInfo___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_sendPairingWithInfo:", *(_QWORD *)(a1 + 32));

}

- (id)processInitialMessage:(id)a3
{
  id v4;
  DDUIPairInitiateMessage *v5;
  void *v6;
  DDUIPairInitiateMessage *v7;

  v4 = a3;
  if (-[DDUIEndpointPairingSession _handleIncomingMessage:](self, "_handleIncomingMessage:", v4))
  {
    v5 = [DDUIPairInitiateMessage alloc];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usi"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[DDUIPairInitiateMessage initWithDictionaryRepresentation:](v5, "initWithDictionaryRepresentation:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_handleIncomingMessage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  unint64_t state;
  const __CFString *v11;
  unint64_t mode;
  __CFString *v13;
  id v14;
  DDUIPairCompleteMessage *v15;
  void *v16;
  DDUIPairCompleteMessage *v17;
  void (**completionHandler)(id, uint64_t, _QWORD, void *);
  DDUIPairCompleteMessage *v19;
  DDUIPairCompleteMessage *v21;
  void *v22;
  void *v23;
  DDUIEndpointPairingTransportSession *transportSession;
  void *v25;
  NSObject *v26;
  void (**v27)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v28[5];
  NSObject *v29;
  uint8_t buf[4];
  DDUIEndpointPairingSession *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  unint64_t v35;
  __int16 v36;
  __CFString *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  v7 = v6 - 1;
  _DDUICoreLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((unint64_t)(v6 - 1) >= 4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[DDUIEndpointPairingSession _handleIncomingMessage:].cold.1((uint64_t)self, (uint64_t)v4, v9);
    goto LABEL_19;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    state = self->_state;
    if (state > 5)
      v11 = CFSTR("invalid");
    else
      v11 = off_1E81B48A0[state];
    mode = self->_mode;
    v13 = off_1E81B48D0[v7];
    *(_DWORD *)buf = 134219010;
    v31 = self;
    v32 = 2112;
    v33 = v11;
    v34 = 2048;
    v35 = mode;
    v36 = 2112;
    v37 = v13;
    v38 = 2112;
    v39 = v4;
    _os_log_impl(&dword_1C87B2000, v9, OS_LOG_TYPE_DEFAULT, "-[DDUIEndpointPairingSession _handleIncomingMessage] {self: %p, state: %@, mode: %lu, messageType: %@, message: %@}", buf, 0x34u);
  }

  if (self->_state == 2)
  {
    switch(v6)
    {
      case 4:
        self->_state = 5;
        (*((void (**)(void))self->_errorHandler + 2))();
        break;
      case 3:
        self->_state = 5;
        completionHandler = (void (**)(id, uint64_t, _QWORD, void *))self->_completionHandler;
        v19 = [DDUIPairCompleteMessage alloc];
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usi"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[DDUIPairCompleteMessage initWithDictionaryRepresentation:](v19, "initWithDictionaryRepresentation:", v16);
        completionHandler[2](completionHandler, 1, 0, v17);
LABEL_17:

        -[DDUIEndpointPairingSession _clearBlocks](self, "_clearBlocks");
        break;
      case 2:
        self->_state = 4;
        if (self->_mode != 1)
        {
          v21 = [DDUIPairCompleteMessage alloc];
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usi"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = -[DDUIPairCompleteMessage initWithDictionaryRepresentation:](v21, "initWithDictionaryRepresentation:", v22);

          -[NSObject listenerUUID](v9, "listenerUUID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            transportSession = self->_transportSession;
            -[NSObject listenerUUID](v9, "listenerUUID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v28[0] = MEMORY[0x1E0C809B0];
            v28[1] = 3221225472;
            v28[2] = __53__DDUIEndpointPairingSession__handleIncomingMessage___block_invoke;
            v28[3] = &unk_1E81B4880;
            v28[4] = self;
            v9 = v9;
            v29 = v9;
            -[DDUIEndpointPairingTransportSession generateNetworkEndpointIdentifierForRemoteDevice:withCompletion:](transportSession, "generateNetworkEndpointIdentifierForRemoteDevice:withCompletion:", v25, v28);

          }
          else
          {
            _DDUICoreLog();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              v31 = self;
              _os_log_impl(&dword_1C87B2000, v26, OS_LOG_TYPE_DEFAULT, "No listener returned from remote device, skipping generating mapping {self: %p}", buf, 0xCu);
            }

            -[DDUIEndpointPairingSession completionHandler](self, "completionHandler");
            v27 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, _QWORD, _QWORD, NSObject *))v27)[2](v27, 0, 0, v9);

            -[DDUIEndpointPairingSession _clearBlocks](self, "_clearBlocks");
          }
          goto LABEL_19;
        }
        v14 = self->_completionHandler;
        v15 = [DDUIPairCompleteMessage alloc];
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usi"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[DDUIPairCompleteMessage initWithDictionaryRepresentation:](v15, "initWithDictionaryRepresentation:", v16);
        (*((void (**)(id, _QWORD, _QWORD, DDUIPairCompleteMessage *))v14 + 2))(v14, 0, 0, v17);
        goto LABEL_17;
    }
    v9 = self->_completionHandler;
    self->_completionHandler = 0;
LABEL_19:

  }
  return v7 < 4;
}

void __53__DDUIEndpointPairingSession__handleIncomingMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD);
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _DDUICoreLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 134218242;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1C87B2000, v4, OS_LOG_TYPE_DEFAULT, "-[DDUIEndpointPairingSession _handleIncomingMessage].block generated mapping {self: %p, identifier: %@}", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v6 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, id, _QWORD))v6)[2](v6, 0, v3, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "_clearBlocks");
}

- (void)_failPairing
{
  NSObject *v3;
  unint64_t state;
  unint64_t mode;
  void *v6;
  DDUIEndpointPairingTransportSession *v7;
  DDUIEndpointPairingTransportSession *v8;
  _QWORD v9[5];
  DDUIEndpointPairingTransportSession *v10;
  const __CFString *v11;
  void *v12;
  uint8_t buf[4];
  DDUIEndpointPairingSession *v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  _DDUICoreLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    mode = self->_mode;
    state = self->_state;
    *(_DWORD *)buf = 134218496;
    v14 = self;
    v15 = 2048;
    v16 = state;
    v17 = 2048;
    v18 = mode;
    _os_log_impl(&dword_1C87B2000, v3, OS_LOG_TYPE_DEFAULT, "-[DDUIEndpointPairingSession _failPairing] {self: %p, state: %lu, mode: %lu}", buf, 0x20u);
  }

  v11 = CFSTR("type");
  v12 = &unk_1E81B9660;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self->_transportSession;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__DDUIEndpointPairingSession__failPairing__block_invoke;
  v9[3] = &unk_1E81B44F8;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  -[DDUIEndpointPairingTransportSession sendMessage:withTimeout:completion:](v8, "sendMessage:withTimeout:completion:", v6, v9, 1.0);

}

void __42__DDUIEndpointPairingSession__failPairing__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _DDUICoreLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 134218242;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1C87B2000, v4, OS_LOG_TYPE_DEFAULT, "DDUIEndpointPairingSession pairing failure finished sending {self: %p, error: %@}", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

- (void)_clearBlocks
{
  id completionHandler;
  id errorHandler;

  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  errorHandler = self->_errorHandler;
  self->_errorHandler = 0;

}

- (unint64_t)sessionType
{
  return self->sessionType;
}

- (void)setSessionType:(unint64_t)a3
{
  self->sessionType = a3;
}

- (NSDictionary)incomingMessage
{
  return self->incomingMessage;
}

- (void)setIncomingMessage:(id)a3
{
  objc_storeStrong((id *)&self->incomingMessage, a3);
}

- (DDUIEndpointPairingTransportSession)transportSession
{
  return self->_transportSession;
}

- (void)setTransportSession:(id)a3
{
  objc_storeStrong((id *)&self->_transportSession, a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDictionary)startUserInfo
{
  return self->_startUserInfo;
}

- (void)setStartUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_startUserInfo, a3);
}

- (OS_dispatch_group)activateGroup
{
  return self->_activateGroup;
}

- (void)setActivateGroup:(id)a3
{
  objc_storeStrong((id *)&self->_activateGroup, a3);
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (BOOL)activated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_activateGroup, 0);
  objc_storeStrong((id *)&self->_startUserInfo, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_transportSession, 0);
  objc_storeStrong((id *)&self->incomingMessage, 0);
}

void __51__DDUIEndpointPairingSession__sendPairingWithInfo___block_invoke_16_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_0(&dword_1C87B2000, a2, a3, "DDUIEndpointPairingSession accept message failed to send {self: %p, error: %@}", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

void __74__DDUIEndpointPairingSession__activateWithErrorHandler_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_0(&dword_1C87B2000, a2, a3, "DDUIEndpointPairingSession failed to activate {self: %p, error: %@}", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

- (void)_handleIncomingMessage:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  unint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const __CFString *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 48);
  v4 = CFSTR("invalid");
  if (v3 <= 5)
    v4 = off_1E81B48A0[v3];
  v5 = *(_QWORD *)(a1 + 40);
  v6 = 134219010;
  v7 = a1;
  v8 = 2112;
  v9 = v4;
  v10 = 2048;
  v11 = v5;
  v12 = 2112;
  v13 = CFSTR("invalid");
  v14 = 2112;
  v15 = a2;
  _os_log_error_impl(&dword_1C87B2000, log, OS_LOG_TYPE_ERROR, "-[DDUIEndpointPairingSession _handleIncomingMessage] -- invalid message type! {self: %p, state: %@, mode: %lu, messageType: %@, message: %@}", (uint8_t *)&v6, 0x34u);
}

@end
