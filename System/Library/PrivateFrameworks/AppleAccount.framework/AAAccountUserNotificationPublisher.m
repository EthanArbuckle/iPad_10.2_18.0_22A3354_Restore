@implementation AAAccountUserNotificationPublisher

- (AAAccountUserNotificationPublisher)init
{
  return -[AAAccountUserNotificationPublisher initWithDaemonXPCEndpoint:](self, "initWithDaemonXPCEndpoint:", 0);
}

- (AAAccountUserNotificationPublisher)initWithDaemonXPCEndpoint:(id)a3
{
  id v4;
  AAAccountUserNotificationPublisher *v5;
  AAAccountUserNotificationDaemonConnection *v6;
  AAAccountUserNotificationDaemonConnection *daemonConnection;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAAccountUserNotificationPublisher;
  v5 = -[AAAccountUserNotificationPublisher init](&v9, sel_init);
  if (v5)
  {
    v6 = -[AAAccountUserNotificationDaemonConnection initWithListenerEndpoint:]([AAAccountUserNotificationDaemonConnection alloc], "initWithListenerEndpoint:", v4);
    daemonConnection = v5->_daemonConnection;
    v5->_daemonConnection = v6;

  }
  return v5;
}

- (void)postAccountUserNotificationWith:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AAAccountUserNotificationPublisher *v8;
  uint64_t v9;
  void *v10;
  AAAccountUserNotificationDaemonConnection *daemonConnection;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v16[8];
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t *v21;
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  AAAccountUserNotificationPublisher *v27;

  v6 = a3;
  v7 = a4;
  if (+[AAPreferences shouldEnableAccountUserNotifications](AAPreferences, "shouldEnableAccountUserNotifications"))
  {
    *(_QWORD *)buf = 0;
    v23 = buf;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__2;
    v26 = __Block_byref_object_dispose__2;
    v8 = self;
    v9 = MEMORY[0x1E0C809B0];
    v27 = v8;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __81__AAAccountUserNotificationPublisher_postAccountUserNotificationWith_completion___block_invoke;
    v19[3] = &unk_1E416ECD8;
    v21 = buf;
    v20 = v7;
    v10 = (void *)MEMORY[0x1A1AED7A0](v19);
    daemonConnection = v8->_daemonConnection;
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __81__AAAccountUserNotificationPublisher_postAccountUserNotificationWith_completion___block_invoke_2;
    v17[3] = &unk_1E416E660;
    v12 = v10;
    v18 = v12;
    -[AAAccountUserNotificationDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _AALogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "Calling daemon service to publish account user notification.", v16, 2u);
    }

    objc_msgSend(v13, "postAccountUserNotificationWith:completion:", v6, v12);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    _AALogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v15, OS_LOG_TYPE_DEFAULT, "Account user notification feature not enabled.", buf, 2u);
    }

  }
}

void __81__AAAccountUserNotificationPublisher_postAccountUserNotificationWith_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

}

void __81__AAAccountUserNotificationPublisher_postAccountUserNotificationWith_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __81__AAAccountUserNotificationPublisher_postAccountUserNotificationWith_completion___block_invoke_2_cold_1((uint64_t)v3, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonConnection, 0);
}

void __81__AAAccountUserNotificationPublisher_postAccountUserNotificationWith_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19EACA000, a2, OS_LOG_TYPE_ERROR, "AppleAccount daemon connection for publishing account user notification encountered error: %@", (uint8_t *)&v2, 0xCu);
}

@end
