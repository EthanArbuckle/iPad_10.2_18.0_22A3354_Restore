@implementation FBSComponentScene

- (FBSComponentScene)initWithScene:(id)a3 extension:(Class)a4
{
  objc_storeWeak(&self->_scene, a3);
  self->_extension = a4;
  return self;
}

- (id)scene
{
  return objc_loadWeakRetained(&self->_scene);
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return objc_loadWeakRetained(&self->_scene);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained(&self->_scene);
  v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

- (BOOL)isEqual:(id)a3
{
  id *p_scene;
  id v4;
  id WeakRetained;
  char v6;

  p_scene = &self->_scene;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(p_scene);
  v6 = objc_msgSend(WeakRetained, "isEqual:", v4);

  return v6;
}

- (unint64_t)hash
{
  id WeakRetained;
  unint64_t v3;

  WeakRetained = objc_loadWeakRetained(&self->_scene);
  v3 = objc_msgSend(WeakRetained, "hash");

  return v3;
}

- (Class)superclass
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained(&self->_scene);
  objc_msgSend(WeakRetained, "superclass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (Class)class
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained(&self->_scene);
  objc_opt_class();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (BOOL)isKindOfClass:(Class)a3
{
  id WeakRetained;
  char isKindOfClass;

  WeakRetained = objc_loadWeakRetained(&self->_scene);
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isMemberOfClass:(Class)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&self->_scene);
  LOBYTE(a3) = objc_msgSend(WeakRetained, "isMemberOfClass:", a3);

  return (char)a3;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id *p_scene;
  id v4;
  id WeakRetained;
  char v6;

  p_scene = &self->_scene;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(p_scene);
  v6 = objc_msgSend(WeakRetained, "conformsToProtocol:", v4);

  return v6;
}

- (BOOL)isProxy
{
  return 1;
}

- (NSString)description
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained(&self->_scene);
  objc_msgSend(WeakRetained, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(self->_extension);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained(&self->_scene);
  objc_msgSend(WeakRetained, "succinctDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; ex: %@> --> %@"), v5, self, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)settings
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained(&self->_scene);
  objc_msgSend(WeakRetained, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)clientSettings
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained(&self->_scene);
  objc_msgSend(WeakRetained, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)sendActions:(id)a3
{
  id *p_scene;
  id v4;
  id WeakRetained;

  p_scene = &self->_scene;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(p_scene);
  objc_msgSend(WeakRetained, "sendActions:", v4);

}

- (void)sendPrivateActions:(id)a3
{
  id *p_scene;
  id v5;
  id WeakRetained;

  p_scene = &self->_scene;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(p_scene);
  objc_msgSend(WeakRetained, "sendActions:toExtension:", v5, self->_extension);

}

- (id)loggingIdentifier
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained(&self->_scene);
  objc_msgSend(WeakRetained, "loggingIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)siblingComponentOfClass:(Class)a3
{
  id WeakRetained;
  void *v6;

  WeakRetained = objc_loadWeakRetained(&self->_scene);
  objc_msgSend(WeakRetained, "componentForExtension:ofClass:", self->_extension, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (Class)extension
{
  return self->_extension;
}

- (BOOL)conformsToExtension:(Class)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&self->_scene);
  LOBYTE(a3) = objc_msgSend(WeakRetained, "conformsToExtension:", a3);

  return (char)a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_scene);
}

@end
