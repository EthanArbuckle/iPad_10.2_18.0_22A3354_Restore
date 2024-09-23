@implementation FLUIHelperController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_6);
  return (id)sharedInstance_instance;
}

void __38__FLUIHelperController_sharedInstance__block_invoke()
{
  FLUIHelperController *v0;
  void *v1;

  v0 = objc_alloc_init(FLUIHelperController);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

- (FLUIHelperController)init
{
  FLUIHelperController *v2;
  NSLock *v3;
  NSLock *connLock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FLUIHelperController;
  v2 = -[FLUIHelperController init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    connLock = v2->_connLock;
    v2->_connLock = v3;

  }
  return v2;
}

- (void)showUIForHSA2LoginNotification:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[8];
  _QWORD v16[5];

  v6 = a4;
  v7 = a3;
  -[FLUIHelperController connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __66__FLUIHelperController_showUIForHSA2LoginNotification_completion___block_invoke;
  v16[3] = &unk_1E6F1E5B0;
  v16[4] = self;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _FLLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8D53000, v11, OS_LOG_TYPE_DEFAULT, "Showing password change", buf, 2u);
  }

  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __66__FLUIHelperController_showUIForHSA2LoginNotification_completion___block_invoke_3;
  v13[3] = &unk_1E6F1E470;
  v14 = v6;
  v12 = v6;
  objc_msgSend(v10, "showHSA2LoginNotification:completion:", v7, v13);

}

void __66__FLUIHelperController_showUIForHSA2LoginNotification_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _FLLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __66__FLUIHelperController_showUIForHSA2LoginNotification_completion___block_invoke_cold_1();

}

void __66__FLUIHelperController_showUIForHSA2LoginNotification_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint8_t v8[16];

  v5 = a3;
  _FLLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B8D53000, v6, OS_LOG_TYPE_DEFAULT, "Notification completed", v8, 2u);
  }

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

- (void)showHSA2PasswordChangeForAppleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[8];
  _QWORD v16[5];

  v6 = a4;
  v7 = a3;
  -[FLUIHelperController connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __68__FLUIHelperController_showHSA2PasswordChangeForAppleID_completion___block_invoke;
  v16[3] = &unk_1E6F1E5B0;
  v16[4] = self;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _FLLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8D53000, v11, OS_LOG_TYPE_DEFAULT, "Showing password change", buf, 2u);
  }

  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __68__FLUIHelperController_showHSA2PasswordChangeForAppleID_completion___block_invoke_5;
  v13[3] = &unk_1E6F1E470;
  v14 = v6;
  v12 = v6;
  objc_msgSend(v10, "showHSA2ChangePasswordForAppleID:completion:", v7, v13);

}

void __68__FLUIHelperController_showHSA2PasswordChangeForAppleID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _FLLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __68__FLUIHelperController_showHSA2PasswordChangeForAppleID_completion___block_invoke_cold_1();

}

void __68__FLUIHelperController_showHSA2PasswordChangeForAppleID_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint8_t v8[16];

  v5 = a3;
  _FLLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B8D53000, v6, OS_LOG_TYPE_DEFAULT, "Notification completed", v8, 2u);
  }

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

- (void)showUIForHSA2LoginCode:(id)a3 notification:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[8];
  _QWORD v19[5];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[FLUIHelperController connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __71__FLUIHelperController_showUIForHSA2LoginCode_notification_completion___block_invoke;
  v19[3] = &unk_1E6F1E5B0;
  v19[4] = self;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  _FLLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8D53000, v14, OS_LOG_TYPE_DEFAULT, "Showing login code", buf, 2u);
  }

  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __71__FLUIHelperController_showUIForHSA2LoginCode_notification_completion___block_invoke_6;
  v16[3] = &unk_1E6F1E470;
  v17 = v8;
  v15 = v8;
  objc_msgSend(v13, "showHSA2LoginCode:withNotification:completion:", v10, v9, v16);

}

void __71__FLUIHelperController_showUIForHSA2LoginCode_notification_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _FLLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __71__FLUIHelperController_showUIForHSA2LoginCode_notification_completion___block_invoke_cold_1();

}

void __71__FLUIHelperController_showUIForHSA2LoginCode_notification_completion___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint8_t v8[16];

  v5 = a3;
  _FLLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B8D53000, v6, OS_LOG_TYPE_DEFAULT, "Notification completed", v8, 2u);
  }

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

- (void)tearDownUIForHSA2LoginNotificationWithPushMessageID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  -[FLUIHelperController connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__FLUIHelperController_tearDownUIForHSA2LoginNotificationWithPushMessageID___block_invoke;
  v7[3] = &unk_1E6F1E5B0;
  v7[4] = self;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "tearDownUIForHSA2LoginNotificationWithPushMessageID:", v4);
}

void __76__FLUIHelperController_tearDownUIForHSA2LoginNotificationWithPushMessageID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _FLLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __76__FLUIHelperController_tearDownUIForHSA2LoginNotificationWithPushMessageID___block_invoke_cold_1();

}

- (id)connection
{
  NSXPCConnection *conn;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  uint64_t v8;
  NSXPCConnection *v9;
  NSXPCConnection *v10;
  NSXPCConnection *v11;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  FLUIHelperController *v16;

  -[NSLock lock](self->_connLock, "lock");
  conn = self->_conn;
  if (!conn)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.corefollowup.uihelper"), 0);
    v5 = self->_conn;
    self->_conn = v4;

    v6 = self->_conn;
    -[FLUIHelperController remoteObjectInterface](self, "remoteObjectInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v7);

    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = __Block_byref_object_copy__0;
    v15[4] = __Block_byref_object_dispose__0;
    v16 = self;
    v8 = MEMORY[0x1E0C809B0];
    v9 = self->_conn;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __34__FLUIHelperController_connection__block_invoke;
    v14[3] = &unk_1E6F1E5D8;
    v14[4] = v15;
    -[NSXPCConnection setInterruptionHandler:](v9, "setInterruptionHandler:", v14);
    v10 = self->_conn;
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __34__FLUIHelperController_connection__block_invoke_9;
    v13[3] = &unk_1E6F1E5D8;
    v13[4] = v15;
    -[NSXPCConnection setInvalidationHandler:](v10, "setInvalidationHandler:", v13);
    -[NSXPCConnection resume](self->_conn, "resume");
    _Block_object_dispose(v15, 8);

    conn = self->_conn;
  }
  v11 = conn;
  -[NSLock unlock](self->_connLock, "unlock");
  return v11;
}

uint64_t __34__FLUIHelperController_connection__block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;

  v1 = result + 32;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40))
  {
    _FLLogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __34__FLUIHelperController_connection__block_invoke_cold_1();

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 8) + 40) + 8), "lock");
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 8) + 40);
    v4 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = 0;

    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 8) + 40) + 8), "unlock");
  }
  return result;
}

uint64_t __34__FLUIHelperController_connection__block_invoke_9(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;

  v1 = result + 32;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40))
  {
    _FLLogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __34__FLUIHelperController_connection__block_invoke_9_cold_1();

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 8) + 40) + 8), "lock");
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 8) + 40);
    v4 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = 0;

    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 8) + 40) + 8), "unlock");
  }
  return result;
}

- (id)remoteObjectInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1E5F20);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conn, 0);
  objc_storeStrong((id *)&self->_connLock, 0);
}

void __66__FLUIHelperController_showUIForHSA2LoginNotification_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B8D53000, v0, v1, "%@: Error from UI Helper process while displaying HSA2 login notification - %@");
  OUTLINED_FUNCTION_1_0();
}

void __68__FLUIHelperController_showHSA2PasswordChangeForAppleID_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B8D53000, v0, v1, "%@: Error from UI Helper process while displaying HSA2 login password change - %@");
  OUTLINED_FUNCTION_1_0();
}

void __71__FLUIHelperController_showUIForHSA2LoginCode_notification_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B8D53000, v0, v1, "%@: Error from UI Helper process while displaying HSA2 login code - %@");
  OUTLINED_FUNCTION_1_0();
}

void __76__FLUIHelperController_tearDownUIForHSA2LoginNotificationWithPushMessageID___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B8D53000, v0, v1, "%@: Error from UI Helper process while tearing down HSA2 login notification - %@");
  OUTLINED_FUNCTION_1_0();
}

void __34__FLUIHelperController_connection__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1(&dword_1B8D53000, v0, v1, "%@: Daemon connection interrupted", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __34__FLUIHelperController_connection__block_invoke_9_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1(&dword_1B8D53000, v0, v1, "%@: Daemon connection invalidated", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
