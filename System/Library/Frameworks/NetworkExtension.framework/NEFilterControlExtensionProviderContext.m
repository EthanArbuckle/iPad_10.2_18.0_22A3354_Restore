@implementation NEFilterControlExtensionProviderContext

- (void)startFilterWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id from;
  objc_super v15;
  id location;
  uint8_t buf[4];
  NEFilterControlExtensionProviderContext *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v8);

  v15.receiver = self;
  v15.super_class = (Class)NEFilterControlExtensionProviderContext;
  -[NEFilterExtensionProviderContext startFilterWithOptions:completionHandler:](&v15, sel_startFilterWithOptions_completionHandler_, v6, v7);
  objc_initWeak(&from, self);
  ne_log_obj();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = self;
    _os_log_impl(&dword_19BD16000, v9, OS_LOG_TYPE_DEFAULT, "%@: Calling startFilterWithCompletionHandler", buf, 0xCu);
  }

  v10 = objc_loadWeakRetained(&location);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__NEFilterControlExtensionProviderContext_startFilterWithOptions_completionHandler___block_invoke;
  v11[3] = &unk_1E3CC00E0;
  objc_copyWeak(&v12, &location);
  objc_copyWeak(&v13, &from);
  objc_msgSend(v10, "startFilterWithCompletionHandler:", v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (void)dispose
{
  objc_super v3;

  if (!self || !self->super.super._isDisposed)
  {
    -[NEFilterControlExtensionProviderContext stopObserving](self);
    v3.receiver = self;
    v3.super_class = (Class)NEFilterControlExtensionProviderContext;
    -[NEExtensionProviderContext dispose](&v3, sel_dispose);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[NEFilterControlExtensionProviderContext stopObserving](self);
  v3.receiver = self;
  v3.super_class = (Class)NEFilterControlExtensionProviderContext;
  -[NEExtensionProviderContext dealloc](&v3, sel_dealloc);
}

- (id)extensionPoint
{
  return CFSTR("com.apple.networkextension.filter-control");
}

- (Class)requiredProviderSuperClass
{
  return (Class)objc_opt_class();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("remediationMap")))
  {
    objc_msgSend(v7, "remediationMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      objc_msgSend(v7, "remediationMap");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEFilterControlExtensionProviderContext provideRemediationMap:](self, "provideRemediationMap:", v10);

    }
  }
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("URLAppendStringMap")))
  {
    objc_msgSend(v7, "URLAppendStringMap");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      objc_msgSend(v7, "URLAppendStringMap");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEFilterControlExtensionProviderContext provideURLAppendStringMap:](self, "provideURLAppendStringMap:", v13);

    }
  }

}

- (void)handleNewFlow:(id)a3 completionHandler:(id)a4
{
  id v6;
  _BYTE *v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 && (v7[10] & 1) != 0)
    objc_msgSend(v8, "handleRemediationForFlow:completionHandler:", v7, v6);
  else
    objc_msgSend(v8, "handleNewFlow:completionHandler:", v7, v6);

}

- (void)handleReport:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleReport:", v4);

}

- (void)notifyRulesChanged
{
  id v2;

  -[NEExtensionProviderContext hostContext](self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyRulesChanged");

}

- (void)provideRemediationMap:(id)a3
{
  id v4;
  const char *v5;
  id v6;

  v4 = a3;
  -[NEExtensionProviderContext hostContext](self, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "provideRemediationMap:", v4);

}

- (void)provideURLAppendStringMap:(id)a3
{
  id v4;
  const char *v5;
  id v6;

  v4 = a3;
  -[NEExtensionProviderContext hostContext](self, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "provideURLAppendStringMap:", v4);

}

- (void)stopObserving
{
  id v2;

  if (a1)
  {
    if ((a1[104] & 1) != 0)
    {
      objc_msgSend(a1, "_principalObject");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "removeObserver:forKeyPath:", a1, CFSTR("remediationMap"));
      objc_msgSend(v2, "removeObserver:forKeyPath:", a1, CFSTR("URLAppendStringMap"));
      a1[104] = 0;

    }
  }
}

void __84__NEFilterControlExtensionProviderContext_startFilterWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  _BYTE *v5;
  _BYTE *v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = v5;
  if (WeakRetained && v5)
  {
    if (v5[41])
    {
      ne_log_obj();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_error_impl(&dword_19BD16000, v7, OS_LOG_TYPE_ERROR, "The completion handler for startFilterWithOptions: was executed twice", v8, 2u);
      }

    }
    else
    {
      v5[41] = 1;
      if (!v3)
      {
        objc_msgSend(WeakRetained, "addObserver:forKeyPath:options:context:", v5, CFSTR("remediationMap"), 5, 0);
        objc_msgSend(WeakRetained, "addObserver:forKeyPath:options:context:", v6, CFSTR("URLAppendStringMap"), 5, 0);
        v6[104] = 1;
      }
      objc_msgSend(v6, "startedWithError:", v3);
    }
  }

}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_3502 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_3502, &__block_literal_global_3503);
  return (id)_extensionAuxiliaryVendorProtocol_protocol_3504;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_3498 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_3498, &__block_literal_global_68_3499);
  return (id)_extensionAuxiliaryHostProtocol_protocol_3500;
}

void __74__NEFilterControlExtensionProviderContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE41A330);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol_3500;
  _extensionAuxiliaryHostProtocol_protocol_3500 = v0;

}

void __76__NEFilterControlExtensionProviderContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE41A280);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_3504;
  _extensionAuxiliaryVendorProtocol_protocol_3504 = v0;

}

@end
