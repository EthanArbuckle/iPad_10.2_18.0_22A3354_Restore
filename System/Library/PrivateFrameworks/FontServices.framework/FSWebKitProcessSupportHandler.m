@implementation FSWebKitProcessSupportHandler

- (FSWebKitProcessSupportHandler)initWithConnection:(id)a3
{
  id v5;
  FSWebKitProcessSupportHandler *v6;
  FSWebKitProcessSupportHandler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FSWebKitProcessSupportHandler;
  v6 = -[FSWebKitProcessSupportHandler init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connection, a3);

  return v7;
}

- (void)checkin:(id)a3 reply:(id)a4
{
  void (**v5)(id, void *);
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *))a4;
  v6 = a3;
  NSLog(CFSTR("[FSWebKit checkin] was called."));
  +[FontServicesDaemonManager sharedManager](FontServicesDaemonManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "checkinForWebKitProcess:reply:", v6, &__block_literal_global_76);

  v8 = (void *)GSFontCopyLocallyActivatedFontFilePaths();
  if (v8)
  {
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "auditToken");
    }
    else
    {
      v13 = 0u;
      v14 = 0u;
    }

    SandboxExtensionsForPathsAndAuditToken(v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = kFSWebKitSupportParamLocallyActivatedFontsKey;
    v16[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1, v13, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v12);

  }
}

- (void)ping:(id)a3
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("FSWebKit Hello!"));
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
