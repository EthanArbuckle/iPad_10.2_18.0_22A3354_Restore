@implementation AFLocationService

- (void)dealloc
{
  NSXPCConnection *connection;
  objc_super v4;

  connection = self->_connection;
  if (connection)
    -[NSXPCConnection invalidate](connection, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)AFLocationService;
  -[AFLocationService dealloc](&v4, sel_dealloc);
}

- (NSXPCConnection)connection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  void *v6;

  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.siri.location"), 0);
    v5 = self->_connection;
    self->_connection = v4;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE432138);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v6);

    -[NSXPCConnection resume](self->_connection, "resume");
    connection = self->_connection;
  }
  return connection;
}

- (id)service
{
  void *v2;
  void *v3;

  -[AFLocationService connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (AFLocationService)serviceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AFLocationService connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (AFLocationService *)v6;
}

- (void)currentAuthorizationStyle:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__AFLocationService_currentAuthorizationStyle___block_invoke;
  v11[3] = &unk_1E3A35B08;
  v6 = v4;
  v12 = v6;
  -[AFLocationService serviceWithErrorHandler:](self, "serviceWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __47__AFLocationService_currentAuthorizationStyle___block_invoke_2;
  v9[3] = &unk_1E3A2DEF0;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "currentAuthorizationStyle:", v9);

}

- (void)requestAuthorizationWithStyle:(unint64_t)a3 timeout:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__AFLocationService_requestAuthorizationWithStyle_timeout_completion___block_invoke;
  v11[3] = &unk_1E3A35B08;
  v12 = v8;
  v9 = v8;
  -[AFLocationService serviceWithErrorHandler:](self, "serviceWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestAuthorizationWithStyle:timeout:completion:", a3, v9, a4);

}

- (void)requestTemporaryAccuracyAuthorizationWithStyle:(unint64_t)a3 timeout:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87__AFLocationService_requestTemporaryAccuracyAuthorizationWithStyle_timeout_completion___block_invoke;
  v11[3] = &unk_1E3A35B08;
  v12 = v8;
  v9 = v8;
  -[AFLocationService serviceWithErrorHandler:](self, "serviceWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestTemporaryAccuracyAuthorizationWithStyle:timeout:completion:", a3, v9, a4);

}

- (void)updateAuthorizationStyleWithUserSelection:(unint64_t)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__AFLocationService_updateAuthorizationStyleWithUserSelection_completion___block_invoke;
  v13[3] = &unk_1E3A35B08;
  v8 = v6;
  v14 = v8;
  -[AFLocationService serviceWithErrorHandler:](self, "serviceWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __74__AFLocationService_updateAuthorizationStyleWithUserSelection_completion___block_invoke_2;
  v11[3] = &unk_1E3A36BB8;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "updateAuthorizationStyleWithUserSelection:completion:", a3, v11);

}

- (void)updateAuthorizationStyleWithUserSelection:(unint64_t)a3 timeout:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__AFLocationService_updateAuthorizationStyleWithUserSelection_timeout_completion___block_invoke;
  v11[3] = &unk_1E3A35B08;
  v12 = v8;
  v9 = v8;
  -[AFLocationService serviceWithErrorHandler:](self, "serviceWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateAuthorizationStyleWithUserSelection:timeout:completion:", a3, v9, a4);

}

- (void)updateTemporaryAuthorizationForAccurateLocation:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__AFLocationService_updateTemporaryAuthorizationForAccurateLocation_completion___block_invoke;
  v13[3] = &unk_1E3A35B08;
  v8 = v6;
  v14 = v8;
  -[AFLocationService serviceWithErrorHandler:](self, "serviceWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __80__AFLocationService_updateTemporaryAuthorizationForAccurateLocation_completion___block_invoke_2;
  v11[3] = &unk_1E3A36BB8;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "updateTemporaryAuthorizationForAccurateLocation:completion:", v4, v11);

}

- (void)updateTemporaryAuthorizationForAccurateLocation:(BOOL)a3 timeout:(double)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__AFLocationService_updateTemporaryAuthorizationForAccurateLocation_timeout_completion___block_invoke;
  v11[3] = &unk_1E3A35B08;
  v12 = v8;
  v9 = v8;
  -[AFLocationService serviceWithErrorHandler:](self, "serviceWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateTemporaryAuthorizationForAccurateLocation:timeout:completion:", v6, v9, a4);

}

- (void)currentLocationWithAccuracy:(double)a3 timeout:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__AFLocationService_currentLocationWithAccuracy_timeout_completion___block_invoke;
  v11[3] = &unk_1E3A35B08;
  v12 = v8;
  v9 = v8;
  -[AFLocationService serviceWithErrorHandler:](self, "serviceWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentLocationWithAccuracy:timeout:completion:", v9, a3, a4);

}

- (void)dismissTCCDialogIfNeeded:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__AFLocationService_dismissTCCDialogIfNeeded___block_invoke;
  v11[3] = &unk_1E3A35B08;
  v6 = v4;
  v12 = v6;
  -[AFLocationService serviceWithErrorHandler:](self, "serviceWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __46__AFLocationService_dismissTCCDialogIfNeeded___block_invoke_2;
  v9[3] = &unk_1E3A36BB8;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "dismissTCCDialogIfNeeded:", v9);

}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

void __46__AFLocationService_dismissTCCDialogIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = *MEMORY[0x1E0CB3388];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.location"), 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);
}

uint64_t __46__AFLocationService_dismissTCCDialogIfNeeded___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__AFLocationService_currentLocationWithAccuracy_timeout_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = *MEMORY[0x1E0CB3388];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.location"), 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v6);
}

void __88__AFLocationService_updateTemporaryAuthorizationForAccurateLocation_timeout_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = *MEMORY[0x1E0CB3388];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.location"), 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v4 + 16))(v4, 0, 0, v6);
}

void __80__AFLocationService_updateTemporaryAuthorizationForAccurateLocation_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = *MEMORY[0x1E0CB3388];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.location"), 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);
}

uint64_t __80__AFLocationService_updateTemporaryAuthorizationForAccurateLocation_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __82__AFLocationService_updateAuthorizationStyleWithUserSelection_timeout_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = *MEMORY[0x1E0CB3388];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.location"), 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v4 + 16))(v4, 0, 0, v6);
}

void __74__AFLocationService_updateAuthorizationStyleWithUserSelection_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = *MEMORY[0x1E0CB3388];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.location"), 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);
}

uint64_t __74__AFLocationService_updateAuthorizationStyleWithUserSelection_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__AFLocationService_requestTemporaryAccuracyAuthorizationWithStyle_timeout_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = *MEMORY[0x1E0CB3388];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.location"), 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v4 + 16))(v4, 0, 0, v6);
}

void __70__AFLocationService_requestAuthorizationWithStyle_timeout_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = *MEMORY[0x1E0CB3388];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.location"), 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v4 + 16))(v4, 0, 0, v6);
}

void __47__AFLocationService_currentAuthorizationStyle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = *MEMORY[0x1E0CB3388];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.location"), 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v4 + 16))(v4, 0, 0, v6);
}

uint64_t __47__AFLocationService_currentAuthorizationStyle___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
