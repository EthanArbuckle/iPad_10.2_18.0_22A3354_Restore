@implementation LSInstallProgressObserver

- (NSString)description
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)LSInstallProgressObserver;
  -[LSInstallProgressObserver description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ for pid: %d"), v4, objc_msgSend(WeakRetained, "processIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (LSInstallProgressObserver)initWithConnection:(id)a3
{
  id v4;
  LSInstallProgressObserver *v5;
  LSInstallProgressObserver *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LSInstallProgressObserver;
  v5 = -[LSInstallProgressObserver init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[LSInstallProgressObserver setConnection:](v5, "setConnection:", v4);

  return v6;
}

- (void)setConnection:(id)a3
{
  objc_storeWeak((id *)&self->_connection, a3);
}

- (void)addObserver
{
  NSObject *v3;
  void *v4;
  int v5;
  LSInstallProgressObserver *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _LSProgressLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_182882000, v3, OS_LOG_TYPE_DEFAULT, "LSInstallProgress: adding observer %{public}@", (uint8_t *)&v5, 0xCu);
  }

  +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", self);

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[LSInstallProgressObserver connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)_lsPing:(id)a3 reply:(id)a4
{
  void (**v6)(id, id);
  id v7;
  NSObject *v8;

  v6 = (void (**)(id, id))a4;
  v7 = a3;
  _LSProgressLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[LSInstallProgressObserver _lsPing:reply:].cold.1(self, v8);

  v6[2](v6, v7);
}

- (void)removeObserver
{
  NSObject *v3;
  void *v4;
  int v5;
  LSInstallProgressObserver *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _LSProgressLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_182882000, v3, OS_LOG_TYPE_DEFAULT, "LSInstallProgress: Removing observer %{public}@", (uint8_t *)&v5, 0xCu);
  }

  +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

}

- (void)createInstallProgressForApplication:(id)a3 withPhase:(unint64_t)a4 andPublishingString:(id)a5 reply:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a6;
  v10 = a5;
  v11 = a3;
  +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createInstallProgressForApplication:withPhase:andPublishingString:reply:", v11, a4, v10, v9);

}

- (void)sendNotification:(int)a3 forApplications:(id)a4 withPlugins:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  int v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v5 = a5;
  v6 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  _LSProgressLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[LSInstallProgressObserver connection](self, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = 67109890;
    v12[1] = objc_msgSend(v10, "processIdentifier");
    v13 = 1024;
    v14 = v6;
    v15 = 1024;
    v16 = v5;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_182882000, v9, OS_LOG_TYPE_DEFAULT, "connection from %d sending notification %d for proxies (plugins %d) %@", (uint8_t *)v12, 0x1Eu);

  }
  +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendNotification:forAppProxies:Plugins:completion:", v6, v8, v5, 0);

}

- (void)sendNotification:(int)a3 forApplicationWithBundleIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v6 = *(_QWORD *)&a3;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[LSInstallProgressObserver connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_xpcConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (_LSCheckEntitlementForXPCConnection(v11, CFSTR("com.apple.private.coreservices.can-send-install-notifications")))
  {
    _LSProgressLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[LSInstallProgressObserver connection](self, "connection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      v21 = objc_msgSend(v13, "processIdentifier");
      v22 = 1024;
      v23 = v6;
      v24 = 2112;
      v25 = v8;
      _os_log_impl(&dword_182882000, v12, OS_LOG_TYPE_DEFAULT, "connection from %d sending notification %d for %@", buf, 0x18u);

    }
    +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __92__LSInstallProgressObserver_sendNotification_forApplicationWithBundleIdentifier_completion___block_invoke;
    v17[3] = &unk_1E1041300;
    v18 = v9;
    objc_msgSend(v14, "sendNotification:forApps:withPlugins:completion:", v6, v15, (v6 & 0xFFFFFFFE) == 4, v17);

  }
  else
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[LSInstallProgressObserver sendNotification:forApplicationWithBundleIdentifier:completion:]", 338, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v16);

  }
}

uint64_t __92__LSInstallProgressObserver_sendNotification_forApplicationWithBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setProgressProportionsByPhase:(id)a3 forInstallOfApplicationWithIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  -[LSInstallProgressObserver connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_xpcConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = _LSCheckEntitlementForXPCConnection(v12, CFSTR("com.apple.private.coreservices.can-send-install-notifications"));

  if (!v13)
  {
    _LSProgressLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[LSInstallProgressObserver setProgressProportionsByPhase:forInstallOfApplicationWithIdentifier:completion:].cold.1(self, v17);

    v18 = (void *)*MEMORY[0x1E0CB2F90];
    v19 = -54;
    v20 = 353;
    goto LABEL_10;
  }
  v14 = (void *)objc_opt_class();
  v15 = (void *)objc_opt_class();
  if (!_LSIsDictionaryWithKeysAndValuesOfClass(v8, v14, v15))
  {
    _LSProgressLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[LSInstallProgressObserver setProgressProportionsByPhase:forInstallOfApplicationWithIdentifier:completion:].cold.2();

    v18 = (void *)*MEMORY[0x1E0CB2F90];
    v19 = -50;
    v20 = 349;
LABEL_10:
    _LSMakeNSErrorImpl(v18, v19, (uint64_t)"-[LSInstallProgressObserver setProgressProportionsByPhase:forInstallOfApplicationWithIdentifier:completion:]", v20, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v16);
    goto LABEL_11;
  }
  +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setProgressProportionsByPhase:forInstallOfApplicationWithIdentifier:completion:", v8, v9, v10);
LABEL_11:

}

- (void)installationEndedForApplication:(id)a3 withState:(unint64_t)a4
{
  id v5;
  id v6;

  v5 = a3;
  +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "installationEndedForApplication:withState:", v5, a4);

}

- (void)installationFailedForApplication:(id)a3 reply:(id)a4
{
  id v5;
  void *v6;
  void (**v7)(id, uint64_t);

  v7 = (void (**)(id, uint64_t))a4;
  v5 = a3;
  +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "installationFailedForApplication:", v5);

  v7[2](v7, 1);
}

- (int)pid
{
  void *v2;
  int v3;

  -[LSInstallProgressObserver connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "processIdentifier");

  return v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
}

- (void)_lsPing:(void *)a1 reply:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_3(&dword_182882000, a2, v4, "Received connection ping from %@", v5);

  OUTLINED_FUNCTION_5_1();
}

- (void)setProgressProportionsByPhase:(void *)a1 forInstallOfApplicationWithIdentifier:(NSObject *)a2 completion:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 67109120;
  v4[1] = objc_msgSend(v3, "processIdentifier");
  _os_log_error_impl(&dword_182882000, a2, OS_LOG_TYPE_ERROR, "Refusing to set progress proportions for unentitled client %d", (uint8_t *)v4, 8u);

  OUTLINED_FUNCTION_1();
}

- (void)setProgressProportionsByPhase:forInstallOfApplicationWithIdentifier:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "Refusing to set progress proportions: Bad input %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
