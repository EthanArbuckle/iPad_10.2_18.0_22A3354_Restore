@implementation CXXPCCallSource

- (CXXPCCallSource)init
{

  return 0;
}

- (CXXPCCallSource)initWithConnection:(id)a3
{
  id v5;
  void *v6;
  CXXPCCallSource *v7;
  uint64_t v8;
  NSSet *capabilities;
  void *v10;
  uint64_t v11;
  NSString *bundleIdentifier;
  uint64_t v13;
  NSURL *bundleURL;
  void *v15;
  uint64_t v16;
  NSString *localizedName;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  void *v23;
  NSString *v24;
  NSURL *v25;
  _BOOL4 hasVoIPBackgroundMode;
  NSSet *v27;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  NSString *v33;
  NSURL *v34;
  _BOOL4 v35;
  NSSet *v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  id location;
  objc_super v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  NSString *v48;
  __int16 v49;
  NSURL *v50;
  __int16 v51;
  _BOOL4 v52;
  __int16 v53;
  NSSet *v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "cx_applicationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v42.receiver = self;
  v42.super_class = (Class)CXXPCCallSource;
  v7 = -[CXCallSource initWithIdentifier:](&v42, sel_initWithIdentifier_, v6);

  if (v7)
  {
    v7->_accessorLock._os_unfair_lock_opaque = 0;
    objc_msgSend(v5, "cx_capabilities");
    v8 = objc_claimAutoreleasedReturnValue();
    capabilities = v7->_capabilities;
    v7->_capabilities = (NSSet *)v8;

    objc_msgSend(MEMORY[0x1E0CA5870], "cx_applicationRecordForConnection:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v11;

    objc_msgSend(v10, "URL");
    v13 = objc_claimAutoreleasedReturnValue();
    bundleURL = v7->_bundleURL;
    v7->_bundleURL = (NSURL *)v13;

    v7->_hasVoIPBackgroundMode = objc_msgSend(v10, "containsBackgroundModeOptions:", 1);
    objc_msgSend(v10, "localizedName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    localizedName = v7->_localizedName;
    v7->_localizedName = (NSString *)v16;

    if (v7->_hasVoIPBackgroundMode || -[CXXPCCallSource isPermittedToUsePrivateAPI](v7, "isPermittedToUsePrivateAPI"))
    {
      objc_storeStrong((id *)&v7->_connection, a3);
      -[NSXPCConnection setExportedObject:](v7->_connection, "setExportedObject:", v7);
      objc_msgSend(MEMORY[0x1E0CB3B50], "cx_providerHostInterface");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setExportedInterface:](v7->_connection, "setExportedInterface:", v18);

      objc_msgSend(MEMORY[0x1E0CB3B50], "cx_providerVendorInterface");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setRemoteObjectInterface:](v7->_connection, "setRemoteObjectInterface:", v19);

      objc_initWeak(&location, v7);
      v20 = MEMORY[0x1E0C809B0];
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __38__CXXPCCallSource_initWithConnection___block_invoke;
      v39[3] = &unk_1E4B88CA8;
      objc_copyWeak(&v40, &location);
      -[NSXPCConnection setInterruptionHandler:](v7->_connection, "setInterruptionHandler:", v39);
      v37[0] = v20;
      v37[1] = 3221225472;
      v37[2] = __38__CXXPCCallSource_initWithConnection___block_invoke_3;
      v37[3] = &unk_1E4B88CA8;
      objc_copyWeak(&v38, &location);
      -[NSXPCConnection setInvalidationHandler:](v7->_connection, "setInvalidationHandler:", v37);
      -[NSXPCConnection resume](v7->_connection, "resume");
      CXDefaultLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (id)objc_opt_class();
        -[CXCallSource identifier](v7, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v7->_bundleIdentifier;
        v25 = v7->_bundleURL;
        hasVoIPBackgroundMode = v7->_hasVoIPBackgroundMode;
        v27 = v7->_capabilities;
        *(_DWORD *)buf = 138413826;
        v44 = v22;
        v45 = 2112;
        v46 = v23;
        v47 = 2112;
        v48 = v24;
        v49 = 2112;
        v50 = v25;
        v51 = 1024;
        v52 = hasVoIPBackgroundMode;
        v53 = 2112;
        v54 = v27;
        v55 = 2112;
        v56 = v5;
        _os_log_impl(&dword_1A402D000, v21, OS_LOG_TYPE_DEFAULT, "Created %@ with identifier: %@ bundleIdentifier: %@ bundleURL: %@ hasVoIPBackgroundMode: %d capabilities: %@ connection: %@", buf, 0x44u);

      }
      objc_destroyWeak(&v38);
      objc_destroyWeak(&v40);
      objc_destroyWeak(&location);
    }
    else
    {
      CXDefaultLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = (void *)objc_opt_class();
        v31 = v30;
        -[CXCallSource identifier](v7, "identifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v7->_bundleIdentifier;
        v34 = v7->_bundleURL;
        v35 = v7->_hasVoIPBackgroundMode;
        v36 = v7->_capabilities;
        *(_DWORD *)buf = 138413826;
        v44 = v30;
        v45 = 2112;
        v46 = v32;
        v47 = 2112;
        v48 = v33;
        v49 = 2112;
        v50 = v34;
        v51 = 1024;
        v52 = v35;
        v53 = 2112;
        v54 = v36;
        v55 = 2112;
        v56 = v5;
        _os_log_error_impl(&dword_1A402D000, v29, OS_LOG_TYPE_ERROR, "Denying creation of %@ with identifier: %@ bundleIdentifier: %@ bundleURL: %@ hasVoIPBackgroundMode: %d capabilities: %@ connection: %@", buf, 0x44u);

      }
      v7 = 0;
    }

  }
  return v7;
}

void __38__CXXPCCallSource_initWithConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CXDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = WeakRetained;
      _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted for XPC call source %@", (uint8_t *)&v4, 0xCu);
    }

    objc_msgSend(WeakRetained, "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidate");

  }
}

void __38__CXXPCCallSource_initWithConnection___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CXDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v7 = WeakRetained;
      _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated for XPC call source %@", buf, 0xCu);
    }

    objc_msgSend(WeakRetained, "setConnection:", 0);
    objc_msgSend(WeakRetained, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__CXXPCCallSource_initWithConnection___block_invoke_4;
    block[3] = &unk_1E4B88AE8;
    v5 = WeakRetained;
    dispatch_async(v3, block);

  }
}

void __38__CXXPCCallSource_initWithConnection___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callSourceInvalidated:", *(_QWORD *)(a1 + 32));

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CXXPCCallSource;
  -[CXXPCCallSource dealloc](&v3, sel_dealloc);
}

- (NSXPCConnection)connection
{
  os_unfair_lock_s *p_accessorLock;
  NSXPCConnection *v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock_with_options();
  v4 = self->_connection;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (void)setConnection:(id)a3
{
  NSXPCConnection *v5;

  v5 = (NSXPCConnection *)a3;
  os_unfair_lock_lock_with_options();
  if (self->_connection != v5)
    objc_storeStrong((id *)&self->_connection, a3);
  os_unfair_lock_unlock(&self->_accessorLock);

}

- (BOOL)isConnected
{
  void *v2;
  BOOL v3;

  -[CXXPCCallSource connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (int)processIdentifier
{
  void *v2;
  int v3;

  -[CXXPCCallSource connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "processIdentifier");

  return v3;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  void *v4;
  $115C4C562B26FF47E01F9F4EA65B5887 *result;
  void *v6;

  -[CXXPCCallSource connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "auditToken");
    v4 = v6;
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

- (BOOL)isPermittedToUsePublicAPI
{
  return -[CXXPCCallSource isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI")
      || -[CXXPCCallSource hasVoIPBackgroundMode](self, "hasVoIPBackgroundMode");
}

- (BOOL)isPermittedToUsePrivateAPI
{
  void *v2;
  char v3;

  -[CXXPCCallSource capabilities](self, "capabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("private-provider-api"));

  return v3;
}

- (BOOL)isPermittedToUseBluetoothAccessories
{
  __CFDictionary *Mutable;
  void *v4;
  void *v5;
  BOOL v6;

  Mutable = CFDictionaryCreateMutable(0, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0DB1088], (const void *)*MEMORY[0x1E0C9AE40]);
  -[CXXPCCallSource connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "auditToken");
  v6 = TCCAccessCheckAuditToken() != 0;

  CFRelease(Mutable);
  return v6;
}

- (id)vendorProtocolDelegate
{
  void *v2;
  void *v3;

  -[CXXPCCallSource connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (id)bundleURL
{
  return self->_bundleURL;
}

- (id)localizedName
{
  return self->_localizedName;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (NSSet)capabilities
{
  return self->_capabilities;
}

- (BOOL)hasVoIPBackgroundMode
{
  return self->_hasVoIPBackgroundMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
