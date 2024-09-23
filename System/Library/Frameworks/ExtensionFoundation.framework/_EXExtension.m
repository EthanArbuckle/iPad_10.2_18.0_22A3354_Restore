@implementation _EXExtension

- (void)setHasSwiftEntryPoint:(BOOL)a3
{
  self->_hasSwiftEntryPoint = a3;
}

- (NSString)bundleIdentifier
{
  return (NSString *)-[_EXExtensionIdentity bundleIdentifier](self->_internalRep, "bundleIdentifier");
}

- (_EXExtensionConfigurationProviding)configuration
{
  return (_EXExtensionConfigurationProviding *)self->_internalRep;
}

- (Class)delegateClass
{
  void *v2;
  void *v3;
  void *v4;

  -[_EXExtension internalRep](self, "internalRep");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "principalClass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v4;
}

- (BOOL)loadDelegate
{
  objc_class *v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;

  v3 = -[_EXExtension delegateClass](self, "delegateClass");
  _EXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[_EXExtension loadDelegate].cold.2(v3, v4);

  v5 = objc_alloc_init(v3);
  if (v5)
  {
    _EXDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[_EXExtension loadDelegate].cold.1((uint64_t)v5, v6, v7);

    -[_EXExtension setDelegate:](self, "setDelegate:", v5);
    -[_EXExtension setStrongDelegate:](self, "setStrongDelegate:", v5);
  }

  return v5 != 0;
}

- (void)setStrongDelegate:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (self->_strongDelegate != v5)
  {
    v6 = v5;
    objc_storeWeak(&self->_delegate, v5);
    objc_storeStrong(&self->_strongDelegate, a3);
    v5 = v6;
  }

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id strongDelegate;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained(&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    strongDelegate = self->_strongDelegate;
    if (strongDelegate)
    {
      self->_strongDelegate = 0;

    }
    objc_storeWeak(&self->_delegate, obj);
    v5 = obj;
  }

}

- (void)willFinishLaunching
{
  void *v3;
  char v4;
  id v5;

  -[_EXExtension delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[_EXExtension delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extensionWillFinishLaunching:", self);

  }
}

- (void)didFinishLaunching
{
  void *v3;
  char v4;
  id v5;

  -[_EXExtension delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[_EXExtension delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extensionDidFinishLaunching:", self);

  }
}

- (BOOL)shouldAcceptConnection:(id)a3
{
  return 0;
}

- (void)prepareForSceneConnectionWithConfiguration:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_EXExtension delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[_EXExtension delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "extension:prepareForSceneConnectionWithConfiguration:", self, v7);

  }
}

- ($115C4C562B26FF47E01F9F4EA65B5887)hostAuditToken
{
  void *v4;
  $115C4C562B26FF47E01F9F4EA65B5887 *result;
  void *v6;

  +[_EXRunningExtension sharedInstance](_EXRunningExtension, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "hostAuditToken");
    v4 = v6;
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

- (id)strongDelegate
{
  return self->_strongDelegate;
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (BOOL)hasSwiftEntryPoint
{
  return self->_hasSwiftEntryPoint;
}

- (_EXExtensionIdentity)internalRep
{
  return self->_internalRep;
}

- (void)setInternalRep:(id)a3
{
  objc_storeStrong((id *)&self->_internalRep, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalRep, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong(&self->_strongDelegate, 0);
}

- (void)loadDelegate
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  NSStringFromClass(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;

}

@end
