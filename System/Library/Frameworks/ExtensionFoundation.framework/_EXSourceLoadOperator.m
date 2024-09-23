@implementation _EXSourceLoadOperator

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EXSourceLoadOperator)initWithItemProvider:(id)a3
{
  id v4;
  id *v5;
  _EXSourceLoadOperator *v6;
  uint64_t v7;
  NSXPCListener *listener;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_EXSourceLoadOperator;
  v5 = -[_EXLoadOperator _init](&v10, sel__init);
  v6 = (_EXSourceLoadOperator *)v5;
  if (v5)
  {
    objc_storeWeak(v5 + 1, v4);
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v7 = objc_claimAutoreleasedReturnValue();
    listener = v6->_listener;
    v6->_listener = (NSXPCListener *)v7;

    -[NSXPCListener setDelegate:](v6->_listener, "setDelegate:", v6);
    -[NSXPCListener resume](v6->_listener, "resume");
  }

  return v6;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (_EXSourceLoadOperator)initWithCoder:(id)a3
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  _EXSourceLoadOperator *result;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;

  v3 = a3;
  _EXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315650;
    v9 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/NSExtension/NSExtensionSup"
         "port/ItemProvider/EXLoadOperator.m";
    v10 = 1024;
    v11 = 122;
    v12 = 2112;
    v13 = v6;
    _os_log_fault_impl(&dword_190C25000, v4, OS_LOG_TYPE_FAULT, "%s - %d: %@ cannot be decoded", (uint8_t *)&v8, 0x1Cu);

  }
  __break(1u);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  NSXPCListener *listener;
  id v4;
  id v5;

  listener = self->_listener;
  v4 = a3;
  -[NSXPCListener endpoint](listener, "endpoint");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("endpoint"));

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB3B50];
  v6 = a4;
  objc_msgSend(v5, "interfaceWithProtocol:", &unk_1EE216820);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "plistAndValueTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_resolveWithIdentifier_className_options_reply_, 2, 0);

  objc_msgSend(v6, "setExportedInterface:", v7);
  objc_msgSend(v6, "setExportedObject:", self);
  objc_msgSend(v6, "resume");

  return 1;
}

- (void)resolveWithIdentifier:(id)a3 className:(id)a4 options:(id)a5 reply:(id)a6
{
  id v10;
  NSString *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  Class v16;
  Class v17;
  NSObject *v18;
  id WeakRetained;
  id v20;
  NSString *v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  NSString *v29;
  id v30;
  Class v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  NSString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (NSString *)a4;
  v12 = a5;
  v13 = a6;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "auditToken");
  }
  else
  {
    v34 = 0u;
    v35 = 0u;
  }

  v16 = NSClassFromString(v11);
  v17 = v16;
  if (v11 && !v16)
  {
    _EXDefaultLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v11;
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_itemProvider);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __71___EXSourceLoadOperator_resolveWithIdentifier_className_options_reply___block_invoke;
  v25[3] = &unk_1E2CFD538;
  v26 = WeakRetained;
  v27 = v10;
  v32 = v34;
  v33 = v35;
  v28 = v12;
  v29 = v11;
  v30 = v13;
  v31 = v17;
  v20 = v13;
  v21 = v11;
  v22 = v12;
  v23 = v10;
  v24 = WeakRetained;
  dispatch_async(MEMORY[0x1E0C80D38], v25);

}

- (void)previewImageWithClassName:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  NSString *v10;
  id WeakRetained;
  Class v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  Class v20;

  v8 = a4;
  v9 = a5;
  v10 = (NSString *)a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_itemProvider);
  v12 = NSClassFromString(v10);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65___EXSourceLoadOperator_previewImageWithClassName_options_reply___block_invoke;
  v16[3] = &unk_1E2CFD560;
  v17 = WeakRetained;
  v18 = v8;
  v19 = v9;
  v20 = v12;
  v13 = v9;
  v14 = v8;
  v15 = WeakRetained;
  dispatch_async(MEMORY[0x1E0C80D38], v16);

}

- (NSItemProvider)itemProvider
{
  return (NSItemProvider *)objc_loadWeakRetained((id *)&self->_itemProvider);
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 16, 1);
}

- (void)setListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_itemProvider);
}

@end
