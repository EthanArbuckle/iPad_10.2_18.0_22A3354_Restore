@implementation BKSSystemShellControlService

- (BKSSystemShellControlService)initWithCalloutQueue:(id)a3
{
  id v5;
  BKSSystemShellControlService *v6;
  BKSSystemShellControlService *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKSSystemShellControlService;
  v6 = -[BKSSystemShellControlService init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_calloutQueue, a3);
    -[BKSSystemShellControlService _activateServerConnection](v7, "_activateServerConnection");
  }

  return v7;
}

- (void)terminateSystemShellWithJobLabel:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BKLogSystemShell();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543618;
    v8 = v4;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_18A0F0000, v6, OS_LOG_TYPE_DEFAULT, "BKSSystemShellControlService: terminate %{public}@ with server:%{public}@", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(v5, "terminateShellWithJobLabel:", v4);
}

- (void)_activateServerConnection
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[5];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  BKSSystemShellControlService *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D03458], "endpointForMachName:service:instance:", CFSTR("com.apple.backboard.system-app-server"), CFSTR("Control"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      objc_storeStrong((id *)&self->_connection, v5);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __57__BKSSystemShellControlService__activateServerConnection__block_invoke;
      v16[3] = &unk_1E1EA1868;
      v16[4] = self;
      -[NSObject configureConnection:](v6, "configureConnection:", v16);
      BKLogSystemShell();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_18A0F0000, v7, OS_LOG_TYPE_DEBUG, "activating connection to server", buf, 2u);
      }

      -[NSObject activate](v6, "activate");
      BKLogSystemShell();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        -[NSObject remoteTarget](v6, "remoteTarget");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v18 = v15;
        _os_log_debug_impl(&dword_18A0F0000, v8, OS_LOG_TYPE_DEBUG, "server remote target %{public}@", buf, 0xCu);

      }
      -[NSObject remoteTarget](v6, "remoteTarget");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("we must have a remote target"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (objc_class *)objc_opt_class();
          NSStringFromClass(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v18 = v11;
          v19 = 2114;
          v20 = v13;
          v21 = 2048;
          v22 = self;
          v23 = 2114;
          v24 = CFSTR("BKSSystemShellControlService.m");
          v25 = 1024;
          v26 = 111;
          v27 = 2114;
          v28 = v10;
          _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x18A10B1A0);
      }
    }
    else
    {
      BKLogSystemShell();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18A0F0000, v14, OS_LOG_TYPE_ERROR, "BKSSystemShellControlService: cannot get connection for service", buf, 2u);
      }

      v6 = 0;
    }
  }
  else
  {
    BKLogSystemShell();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18A0F0000, v6, OS_LOG_TYPE_ERROR, "BKSSystemShellControlService: cannot get endpoint for mach service", buf, 2u);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __57__BKSSystemShellControlService__activateServerConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v3 = a2;
  BKLogSystemShell();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v9 = 0;
    _os_log_debug_impl(&dword_18A0F0000, v4, OS_LOG_TYPE_DEBUG, "configured client service", v9, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EDF5CD68);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EDF66140);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D03430], "interfaceWithIdentifier:", CFSTR("Control"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setServer:", v6);
  objc_msgSend(v7, "setClient:", v5);
  objc_msgSend(v3, "setInterface:", v7);
  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v8);

  objc_msgSend(v3, "setInterruptionHandler:", &__block_literal_global_53);
  objc_msgSend(v3, "setInvalidationHandler:", &__block_literal_global_55);

}

void __57__BKSSystemShellControlService__activateServerConnection__block_invoke_54()
{
  NSObject *v0;
  uint8_t v1[16];

  BKLogSystemShell();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_18A0F0000, v0, OS_LOG_TYPE_ERROR, "service invalidation", v1, 2u);
  }

}

void __57__BKSSystemShellControlService__activateServerConnection__block_invoke_51()
{
  NSObject *v0;
  uint8_t v1[16];

  BKLogSystemShell();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_18A0F0000, v0, OS_LOG_TYPE_ERROR, "service interruption", v1, 2u);
  }

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_856 != -1)
    dispatch_once(&sharedInstance_onceToken_856, &__block_literal_global_857);
  return (id)sharedInstance_service_858;
}

void __46__BKSSystemShellControlService_sharedInstance__block_invoke()
{
  BKSSystemShellControlService *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [BKSSystemShellControlService alloc];
  dispatch_get_global_queue(21, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[BKSSystemShellControlService initWithCalloutQueue:](v0, "initWithCalloutQueue:", v3);
  v2 = (void *)sharedInstance_service_858;
  sharedInstance_service_858 = v1;

}

@end
