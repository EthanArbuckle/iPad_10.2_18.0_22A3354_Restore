@implementation EXExtensionRequest

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(self->_assertion, "setInvalidationHandler:", 0);
  objc_msgSend(self->_assertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)EXExtensionRequest;
  -[EXExtensionRequest dealloc](&v3, sel_dealloc);
}

- (unint64_t)options
{
  return self->_options;
}

- (NSUUID)pkUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)sandboxProfileName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (_EXPersona)persona
{
  return (_EXPersona *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void)setInputItems:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (EXExtensionRequest)init
{
  EXExtensionRequest *v2;
  NSUUID *v3;
  NSUUID *pkUUID;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EXExtensionRequest;
  v2 = -[EXExtensionRequest init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    pkUUID = v2->_pkUUID;
    v2->_pkUUID = v3;

  }
  return v2;
}

- (void)setAssertion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (id)assertion
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)applyActiveWebPageAlternativeIfNeededForExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[EXExtensionRequest inputItems](self, "inputItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "_inputItemsMatchActiveWebPageAlternative:", v6);

  if ((_DWORD)v5)
  {
    _EXLegacyLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[EXExtensionRequest(NSExtensionActiveWebPageAlternative) applyActiveWebPageAlternativeIfNeededForExtension:].cold.2(v7);

    objc_msgSend(v4, "infoDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_EX_dictionaryForKey:", CFSTR("NSExtensionAttributes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "_EX_dictionaryForKey:", CFSTR("NSExtensionAttributes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("NSExtensionActivationRule"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      _EXLegacyLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[EXExtensionRequest(NSExtensionActiveWebPageAlternative) applyActiveWebPageAlternativeIfNeededForExtension:].cold.1(self, (uint64_t)v11, v12);

      v13 = (void *)objc_opt_class();
      -[EXExtensionRequest inputItems](self, "inputItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_inputItemsByApplyingActiveWebPageAlternative:ifNeededByActivationRule:", v14, v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[EXExtensionRequest setInputItems:](self, "setInputItems:", v15);

    }
  }

}

- (NSArray)inputItems
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setXpcConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void)setContext:(id)a3
{
  objc_storeWeak((id *)&self->_context, a3);
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 88, 1);
}

- (NSXPCListenerEndpoint)endpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 24, 1);
}

- (NSExtensionContext)context
{
  return (NSExtensionContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_plugIn, 0);
  objc_storeStrong((id *)&self->_processIdentifier, 0);
  objc_storeStrong(&self->_assertion, 0);
  objc_storeStrong((id *)&self->_pkUUID, 0);
  objc_storeStrong((id *)&self->_persona, 0);
  objc_storeStrong((id *)&self->_sandboxProfileName, 0);
  objc_storeStrong((id *)&self->_instanceIdentifier, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_inputItems, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)EXExtensionRequest;
  -[EXExtensionRequest description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ Request PK UUID: %@ with item count %lu"), v4, self->_pkUUID, -[NSArray count](self->_inputItems, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setEndpoint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (_EXExtensionInstanceIdentifier)instanceIdentifier
{
  return (_EXExtensionInstanceIdentifier *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInstanceIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setSandboxProfileName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void)setPersona:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setPkUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (RBSProcessIdentifier)processIdentifier
{
  return (RBSProcessIdentifier *)objc_getProperty(self, a2, 72, 1);
}

- (void)setProcessIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PKPlugInPrivate)plugIn
{
  return (PKPlugInPrivate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPlugIn:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

@end
