@implementation AURemoteExtensionContext

- (id)forwardingTargetForSelector:(SEL)a3
{
  AURemoteHost *host;

  host = self->_host;
  if (host)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      host = self->_host;
    else
      host = 0;
  }
  return host;
}

- (AURemoteExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  AURemoteExtensionContext *v15;
  void *v16;
  char v17;
  AURemoteExtensionContext *v18;
  id v20;
  objc_super v21;
  _QWORD block[5];
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForInfoDictionaryKey:", CFSTR("NSExtension"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("NSExtensionAttributes"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[AURemoteHost _staticInit](AURemoteHost, "_staticInit");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__AURemoteExtensionContext_initWithInputItems_listenerEndpoint_contextUUID___block_invoke;
  block[3] = &unk_1E2919C60;
  block[4] = v11;
  v14 = v13;
  v23 = v14;
  if (-[AURemoteExtensionContext initWithInputItems:listenerEndpoint:contextUUID:]::once != -1)
    dispatch_once(&-[AURemoteExtensionContext initWithInputItems:listenerEndpoint:contextUUID:]::once, block);
  v21.receiver = self;
  v21.super_class = (Class)AURemoteExtensionContext;
  v15 = -[AURemoteExtensionContext initWithInputItems:listenerEndpoint:contextUUID:](&v21, sel_initWithInputItems_listenerEndpoint_contextUUID_, v8, v9, v10);
  if (!v15)
  {
    v18 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("NSExtensionPointIdentifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.AudioUnit")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.AudioUnit-Speech")) & 1) != 0)
  {
    v17 = 0;
  }
  else
  {
    if ((objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.AudioUnit-UI")) & 1) == 0)
    {
      if (kAUExtensionScope)
      {
        v18 = (AURemoteExtensionContext *)*(id *)kAUExtensionScope;
        if (!v18)
          goto LABEL_8;
      }
      else
      {
        v18 = (AURemoteExtensionContext *)MEMORY[0x1E0C81028];
        v20 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(&v18->super.super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v25 = "AURemoteExtensionContext.mm";
        v26 = 1024;
        v27 = 1499;
        v28 = 2112;
        v29 = v16;
        _os_log_impl(&dword_18EE07000, &v18->super.super, OS_LOG_TYPE_ERROR, "%25s:%-5d Unknown extension point: %@", buf, 0x1Cu);
      }

      v18 = 0;
      goto LABEL_8;
    }
    v17 = 1;
  }
  v15->_isUIExtension = v17;
  v18 = v15;
LABEL_8:

LABEL_10:
  return v18;
}

- (id)iOSViewController
{
  void *v2;
  void *v3;
  void *v4;

  -[AURemoteExtensionContext viewService](self, "viewService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "childViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)requestViewControllerWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void (**v6)(id, void *);

  v4 = (void (**)(id, void *))a3;
  v6 = v4;
  if (self->_isUIExtension)
  {
    -[AURemoteExtensionContext iOSViewController](self, "iOSViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v5);

  }
  else
  {
    v4[2](v4, 0);
  }

}

- (void)open:(AudioComponentDescription *)a3 instanceUUID:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  AURemoteHost *v11;
  void *v12;
  AURemoteHost *v13;
  AURemoteHost *host;
  uint64_t (***v15)();
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  OSType componentType;
  id v23;
  AURemoteHost *v24;
  void *v25;
  _OWORD v26[2];
  __int128 v27;
  __int128 v28;
  id v29;
  __int128 v30;
  UInt32 componentFlagsMask;
  id to;
  id location;
  void *v34;
  _QWORD v35[5];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t (**v40)();
  id v41;
  uint64_t (***v42)();
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = _Block_copy(v9);
  v34 = v10;
  objc_initWeak(&location, self);
  v11 = [AURemoteHost alloc];
  -[AURemoteExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_copyWeak(&to, &location);
  v42 = 0;
  v40 = &off_1E28FFD50;
  objc_moveWeak(&v41, &to);
  v42 = &v40;
  objc_destroyWeak(&to);
  v13 = -[AURemoteHost initWithConnection:config:timeOutHandler:](v11, "initWithConnection:config:timeOutHandler:", v12, MEMORY[0x1E0C9AA70], &v40);
  host = self->_host;
  self->_host = v13;

  v15 = v42;
  if (v42 == &v40)
  {
    v16 = 4;
    v15 = &v40;
  }
  else
  {
    if (!v42)
      goto LABEL_6;
    v16 = 5;
  }
  (*v15)[v16]();
LABEL_6:

  if (self->_host)
  {
    if (self->_isUIExtension)
      -[AURemoteExtensionContext iOSViewController](self, "iOSViewController");
    else
      -[AURemoteExtensionContext _principalObject](self, "_principalObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_isUIExtension)
      goto LABEL_15;
    v36 = 0;
    v37 = &v36;
    v38 = 0x2050000000;
    v18 = (void *)getAUViewControllerClass(void)::softClass;
    v39 = getAUViewControllerClass(void)::softClass;
    if (!getAUViewControllerClass(void)::softClass)
    {
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = ___ZL24getAUViewControllerClassv_block_invoke;
      v35[3] = &unk_1E29222D8;
      v35[4] = &v36;
      ___ZL24getAUViewControllerClassv_block_invoke((uint64_t)v35);
      v18 = (void *)v37[3];
    }
    v19 = objc_retainAutorelease(v18);
    _Block_object_dispose(&v36, 8);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Principal object %@ must derive from AUViewController but doesn't."), v17);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      -[AURemoteExtensionContext open:instanceUUID:reply:]::$_5::operator()((uint64_t *)&v34, v21, 0);
    }
    else
    {
LABEL_15:
      if ((objc_msgSend(v17, "conformsToProtocol:", &unk_1EE171450) & 1) != 0)
      {
        v30 = *(_OWORD *)&a3->componentType;
        componentFlagsMask = a3->componentFlagsMask;
        v29 = 0;
        objc_msgSend(v17, "createAudioUnitWithComponentDescription:error:", &v30, &v29);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v29;
        if (v20)
        {
          componentType = a3->componentType;
          if ((((componentType != 1635087216) ^ objc_msgSend(v20, "isSpeechSynthesisProvider")) & 1) != 0)
          {
            if (a3->componentType == 1635087216
              && objc_msgSend(v20, "conformsToProtocol:", &unk_1EE1714B0))
            {
              v23 = v20;
              v24 = self->_host;
              if (v24)
              {
                -[AURemoteHost hostAuditToken](v24, "hostAuditToken");
              }
              else
              {
                v27 = 0u;
                v28 = 0u;
              }
              v26[0] = v27;
              v26[1] = v28;
              objc_msgSend(v23, "set_hostAuditToken:", v26);

            }
            -[AURemoteHost openImpl:reply:](self->_host, "openImpl:reply:", v20, v9);
            goto LABEL_30;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Audio Unit %@ is not a subclass of AVSpeechSynthesisProviderAudioUnit."), v20);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[AURemoteExtensionContext open:instanceUUID:reply:]::$_5::operator()((uint64_t *)&v34, v25, v21);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to instantiate Audio Unit: %@"), v21);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[AURemoteExtensionContext open:instanceUUID:reply:]::$_5::operator()((uint64_t *)&v34, v25, 0);
        }

LABEL_30:
        goto LABEL_31;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Principal object %@ does not conform to protocol AUAudioUnitFactory."), v17);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      -[AURemoteExtensionContext open:instanceUUID:reply:]::$_5::operator()((uint64_t *)&v34, v21, 0);
    }
LABEL_31:

    goto LABEL_32;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Remote Host Initialisation Failed"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AURemoteExtensionContext open:instanceUUID:reply:]::$_5::operator()((uint64_t *)&v34, v17, 0);
LABEL_32:

  objc_destroyWeak(&location);
}

- (AUAudioUnitViewService)viewService
{
  return self->_viewService;
}

- (void)setViewService:(id)a3
{
  self->_viewService = (AUAudioUnitViewService *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_host, 0);
}

- (void)open:instanceUUID:reply:
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -66754, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelRequestWithError:", v2);

    WeakRetained = v3;
  }

}

- (uint64_t)open:instanceUUID:reply:
{
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

- (id)open:instanceUUID:reply:
{
  id *v1;
  id *v2;

  v1 = (id *)(a1 + 8);
  v2 = (id *)operator new(0x10uLL);
  *v2 = &off_1E28FFD50;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

void __76__AURemoteExtensionContext_initWithInputItems_listenerEndpoint_contextUUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  std::recursive_mutex *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = CADeprecated::TSingleton<AURegistrationServerConnection>::instance();
  AURegistrationServerConnection::RegisterExtensionProcess(v2);
  v3 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("AudioComponentBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;

      objc_msgSend(v7, "load");
      v3 = v7;
LABEL_11:

      goto LABEL_12;
    }
    if (kAUExtensionScope)
    {
      v8 = *(id *)kAUExtensionScope;
      if (!v8)
        goto LABEL_11;
    }
    else
    {
      v8 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v17 = "AURemoteExtensionContext.mm";
      v18 = 1024;
      v19 = 1481;
      v20 = 2112;
      v21 = v4;
      _os_log_impl(&dword_18EE07000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: AudioComponentBundle %@ not found", buf, 0x1Cu);
    }

    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v3;
  v12 = (void *)AudioComponentMgr_NSExtension::sExtensionServiceIdentifier;
  AudioComponentMgr_NSExtension::sExtensionServiceIdentifier = (uint64_t)v10;
  v13 = v10;

  v14 = (void *)AudioComponentMgr_NSExtension::sExtensionServiceBundle;
  AudioComponentMgr_NSExtension::sExtensionServiceBundle = (uint64_t)v11;

  GlobalComponentPluginMgr((uint64_t *)&v15);
  if (v15)
    std::recursive_mutex::unlock(v15);

}

+ (BOOL)conformsToProtocol:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((+[AURemoteHost conformsToProtocol:](AURemoteHost, "conformsToProtocol:", v4) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend((id)objc_msgSend(a1, "superclass"), "conformsToProtocol:", v4);

  return v5;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  if ((+[AURemoteHost instancesRespondToSelector:](AURemoteHost, "instancesRespondToSelector:") & 1) != 0)
    return 1;
  else
    return objc_msgSend((id)objc_msgSend(a1, "superclass"), "instancesRespondToSelector:", a3);
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (+[AURemoteExtensionContext _extensionAuxiliaryHostProtocol]::once != -1)
    dispatch_once(&+[AURemoteExtensionContext _extensionAuxiliaryHostProtocol]::once, &__block_literal_global_282);
  return (id)+[AURemoteExtensionContext _extensionAuxiliaryHostProtocol]::sHostProtocol;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (+[AURemoteExtensionContext _extensionAuxiliaryVendorProtocol]::once != -1)
    dispatch_once(&+[AURemoteExtensionContext _extensionAuxiliaryVendorProtocol]::once, &__block_literal_global_293);
  return (id)+[AURemoteExtensionContext _extensionAuxiliaryVendorProtocol]::sVendorProtocol;
}

void __61__AURemoteExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  id v0;

  CreateAUAudioUnitXPCInterface();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&+[AURemoteExtensionContext _extensionAuxiliaryVendorProtocol]::sVendorProtocol, v0);

}

void __59__AURemoteExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE16CDE0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&+[AURemoteExtensionContext _extensionAuxiliaryHostProtocol]::sHostProtocol, v0);

  SetAllowedClassesForAUAudioUnitHostXPCInterface((void *)+[AURemoteExtensionContext _extensionAuxiliaryHostProtocol]::sHostProtocol);
}

@end
