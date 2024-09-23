@implementation CXXPCVoicemailSource

- (CXXPCVoicemailSource)init
{

  return 0;
}

- (CXXPCVoicemailSource)initWithConnection:(id)a3
{
  id v5;
  CXXPCVoicemailSource *v6;
  uint64_t v7;
  NSString *applicationIdentifier;
  uint64_t v9;
  NSSet *capabilities;
  void *v11;
  uint64_t v12;
  NSString *bundleIdentifier;
  uint64_t v14;
  NSURL *bundleURL;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  NSString *v21;
  NSString *v22;
  NSURL *v23;
  NSSet *v24;
  id v25;
  NSObject *v26;
  void *v28;
  NSString *v29;
  NSString *v30;
  NSURL *v31;
  NSSet *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id location;
  objc_super v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  NSString *v43;
  __int16 v44;
  NSString *v45;
  __int16 v46;
  NSURL *v47;
  __int16 v48;
  NSSet *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v39.receiver = self;
  v39.super_class = (Class)CXXPCVoicemailSource;
  v6 = -[CXVoicemailSource init](&v39, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "cx_applicationIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    applicationIdentifier = v6->_applicationIdentifier;
    v6->_applicationIdentifier = (NSString *)v7;

    objc_msgSend(v5, "cx_capabilities");
    v9 = objc_claimAutoreleasedReturnValue();
    capabilities = v6->_capabilities;
    v6->_capabilities = (NSSet *)v9;

    objc_msgSend(MEMORY[0x1E0CA5870], "cx_applicationRecordForConnection:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v12;

    objc_msgSend(v11, "URL");
    v14 = objc_claimAutoreleasedReturnValue();
    bundleURL = v6->_bundleURL;
    v6->_bundleURL = (NSURL *)v14;

    if (v6->_applicationIdentifier
      && -[CXXPCVoicemailSource isPermittedToUsePrivateAPI](v6, "isPermittedToUsePrivateAPI"))
    {
      objc_storeStrong((id *)&v6->_connection, a3);
      -[NSXPCConnection setExportedObject:](v6->_connection, "setExportedObject:", v6);
      objc_msgSend(MEMORY[0x1E0CB3B50], "cx_voicemailProviderHostInterface");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setExportedInterface:](v6->_connection, "setExportedInterface:", v16);

      objc_msgSend(MEMORY[0x1E0CB3B50], "cx_voicemailProviderVendorInterface");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setRemoteObjectInterface:](v6->_connection, "setRemoteObjectInterface:", v17);

      objc_initWeak(&location, v6);
      v18 = MEMORY[0x1E0C809B0];
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __43__CXXPCVoicemailSource_initWithConnection___block_invoke;
      v36[3] = &unk_1E4B88CA8;
      objc_copyWeak(&v37, &location);
      -[NSXPCConnection setInterruptionHandler:](v6->_connection, "setInterruptionHandler:", v36);
      v34[0] = v18;
      v34[1] = 3221225472;
      v34[2] = __43__CXXPCVoicemailSource_initWithConnection___block_invoke_3;
      v34[3] = &unk_1E4B88CA8;
      objc_copyWeak(&v35, &location);
      -[NSXPCConnection setInvalidationHandler:](v6->_connection, "setInvalidationHandler:", v34);
      -[NSXPCConnection resume](v6->_connection, "resume");
      CXDefaultLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (void *)objc_opt_class();
        v21 = v6->_applicationIdentifier;
        v22 = v6->_bundleIdentifier;
        v23 = v6->_bundleURL;
        v24 = v6->_capabilities;
        *(_DWORD *)buf = 138413570;
        v41 = v20;
        v42 = 2112;
        v43 = v21;
        v44 = 2112;
        v45 = v22;
        v46 = 2112;
        v47 = v23;
        v48 = 2112;
        v49 = v24;
        v50 = 2112;
        v51 = v5;
        v25 = v20;
        _os_log_impl(&dword_1A402D000, v19, OS_LOG_TYPE_DEFAULT, "Created %@ with applicationIdentifier: %@ bundleIdentifier: %@ bundleURL: %@ capabilities: %@ connection: %@", buf, 0x3Eu);

      }
      objc_destroyWeak(&v35);
      objc_destroyWeak(&v37);
      objc_destroyWeak(&location);
    }
    else
    {
      CXDefaultLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v28 = (void *)objc_opt_class();
        v29 = v6->_applicationIdentifier;
        v30 = v6->_bundleIdentifier;
        v31 = v6->_bundleURL;
        v32 = v6->_capabilities;
        *(_DWORD *)buf = 138413570;
        v41 = v28;
        v42 = 2112;
        v43 = v29;
        v44 = 2112;
        v45 = v30;
        v46 = 2112;
        v47 = v31;
        v48 = 2112;
        v49 = v32;
        v50 = 2112;
        v51 = v5;
        v33 = v28;
        _os_log_error_impl(&dword_1A402D000, v26, OS_LOG_TYPE_ERROR, "Denying creation of %@ with applicationIdentifier: %@ bundleIdentifier: %@ bundleURL: %@ capabilities: %@ connection: %@", buf, 0x3Eu);

      }
      v6 = 0;
    }

  }
  return v6;
}

void __43__CXXPCVoicemailSource_initWithConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  id v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CXXPCVoicemailSource_initWithConnection___block_invoke_2;
  block[3] = &unk_1E4B88AE8;
  v5 = WeakRetained;
  v3 = WeakRetained;
  dispatch_async(v2, block);

}

void __43__CXXPCVoicemailSource_initWithConnection___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted for XPC voicemail source %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

}

void __43__CXXPCVoicemailSource_initWithConnection___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  id v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CXXPCVoicemailSource_initWithConnection___block_invoke_2_4;
  block[3] = &unk_1E4B88AE8;
  v5 = WeakRetained;
  v3 = WeakRetained;
  dispatch_async(v2, block);

}

void __43__CXXPCVoicemailSource_initWithConnection___block_invoke_2_4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated for XPC voicemail source %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "setConnection:", 0);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voicemailSourceInvalidated:", *(_QWORD *)(a1 + 32));

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CXXPCVoicemailSource;
  -[CXXPCVoicemailSource dealloc](&v3, sel_dealloc);
}

- (BOOL)isConnected
{
  void *v2;
  BOOL v3;

  -[CXXPCVoicemailSource connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (int)processIdentifier
{
  void *v2;
  int v3;

  -[CXXPCVoicemailSource connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "processIdentifier");

  return v3;
}

- (BOOL)isPermittedToUsePrivateAPI
{
  void *v2;
  char v3;

  -[CXXPCVoicemailSource capabilities](self, "capabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("private-voicemail-provider-api"));

  return v3;
}

- (id)vendorProtocolDelegate
{
  void *v2;
  void *v3;

  -[CXXPCVoicemailSource connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (void)setBundleURL:(id)a3
{
  objc_storeStrong((id *)&self->_bundleURL, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSSet)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
