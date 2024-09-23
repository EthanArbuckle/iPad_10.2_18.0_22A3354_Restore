@implementation FLExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global);
  return (id)_extensionAuxiliaryHostProtocol___interface;
}

void __53__FLExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E5A728);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol___interface;
  _extensionAuxiliaryHostProtocol___interface = v0;

}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_46);
  return (id)_extensionAuxiliaryVendorProtocol___interface;
}

void __55__FLExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E3ECA8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  _extensionAuxiliaryVendorProtocol___interface = v0;

  v2 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_processFollowUpItem_selectedAction_completion_, 0, 0);

  v4 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_processFollowUpItem_selectedAction_completion_, 1, 0);

}

- (id)extensionLogicProvider
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[FLExtensionContext _principalObject](self, "_principalObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[FLExtensionContext _shadowPrincipalObject](self, "_shadowPrincipalObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  _FLLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_21641D000, v7, OS_LOG_TYPE_DEFAULT, "Loaded extension principal object: %@", (uint8_t *)&v9, 0xCu);
  }

  return v6;
}

- (id)_shadowPrincipalObject
{
  id shadowPrincipalObject;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_class *Class;
  id v10;
  id v11;

  shadowPrincipalObject = self->_shadowPrincipalObject;
  if (!shadowPrincipalObject)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "infoDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NSExtension"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NSExtensionPrincipalClass"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_retainAutorelease(v7);
    Class = objc_getClass((const char *)objc_msgSend(v8, "UTF8String"));
    if (-[objc_class conformsToProtocol:](Class, "conformsToProtocol:", &unk_254E42638)
      && -[objc_class conformsToProtocol:](Class, "conformsToProtocol:", &unk_254E4EA78))
    {
      v10 = objc_alloc_init(Class);
      v11 = self->_shadowPrincipalObject;
      self->_shadowPrincipalObject = v10;

    }
    shadowPrincipalObject = self->_shadowPrincipalObject;
  }
  return shadowPrincipalObject;
}

- (id)hostContextWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FLExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)syncHostContextWithErrorHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _FLLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[FLExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315394;
    v13 = "-[FLExtensionContext syncHostContextWithErrorHandler:]";
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_21641D000, v5, OS_LOG_TYPE_DEFAULT, "%s self._auxiliaryConnection: %@", (uint8_t *)&v12, 0x16u);

  }
  -[FLExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _FLLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[FLExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315650;
    v13 = "-[FLExtensionContext syncHostContextWithErrorHandler:]";
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_21641D000, v9, OS_LOG_TYPE_DEFAULT, "%s return hostContext: %@ self._auxiliaryConnection: %@", (uint8_t *)&v12, 0x20u);

  }
  return v8;
}

- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  _FLLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_21641D000, v11, OS_LOG_TYPE_DEFAULT, "FLExtensionContext: process action", v14, 2u);
  }

  -[FLExtensionContext extensionLogicProvider](self, "extensionLogicProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    objc_msgSend(v12, "processFollowUpItem:selectedAction:completion:", v8, v9, v10);
  else
    v10[2](v10, 1);

}

- (void)followUpPerformUpdateWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  _FLLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21641D000, v5, OS_LOG_TYPE_DEFAULT, "FLExtensionContext: refresh", buf, 2u);
  }

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__FLExtensionContext_followUpPerformUpdateWithCompletionHandler___block_invoke;
  v10[3] = &unk_24D55C9D0;
  v6 = v4;
  v11 = v6;
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199F81EC](v10);
  -[FLExtensionContext extensionLogicProvider](self, "extensionLogicProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "followUpPerformUpdateWithCompletionHandler:", v7);
  }
  else
  {
    _FLLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21641D000, v9, OS_LOG_TYPE_DEFAULT, "Skipping refresh, extension does not support it", buf, 2u);
    }

    v7[2](v7, 0);
  }

}

uint64_t __65__FLExtensionContext_followUpPerformUpdateWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _FLLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21641D000, v2, OS_LOG_TYPE_DEFAULT, "FLExtensionContext: completing request...", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shadowPrincipalObject, 0);
}

@end
