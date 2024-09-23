@implementation INCLocalExtensionRegistry

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_15);
  return (id)sharedInstance_sLocalExtensionRegistry;
}

- (id)localExtensionForIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_localExtensionsByIdentifier, "objectForKey:", a3);
}

- (INCLocalExtensionRegistry)init
{
  INCLocalExtensionRegistry *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *localExtensionsByIdentifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)INCLocalExtensionRegistry;
  v2 = -[INCLocalExtensionRegistry init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    localExtensionsByIdentifier = v2->_localExtensionsByIdentifier;
    v2->_localExtensionsByIdentifier = v3;

  }
  return v2;
}

- (void)registerLocalExtension:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  objc_class *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "localExtensionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v6;

  -[NSMutableDictionary setObject:forKey:](self->_localExtensionsByIdentifier, "setObject:forKey:", v9, v8);
}

- (void)deregisterLocalExtension:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *localExtensionsByIdentifier;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v15 = a3;
  objc_msgSend(v15, "localExtensionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v6;

  -[NSMutableDictionary objectForKey:](self->_localExtensionsByIdentifier, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && objc_msgSend(v9, "isEqual:", v15))
  {
    -[NSMutableDictionary removeObjectForKey:](self->_localExtensionsByIdentifier, "removeObjectForKey:", v8);
  }
  else
  {
    localExtensionsByIdentifier = self->_localExtensionsByIdentifier;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __54__INCLocalExtensionRegistry_deregisterLocalExtension___block_invoke;
    v16[3] = &unk_1E6BC3F90;
    v17 = v15;
    -[NSMutableDictionary keysOfEntriesPassingTest:](localExtensionsByIdentifier, "keysOfEntriesPassingTest:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self->_localExtensionsByIdentifier;
    objc_msgSend(v12, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectsForKeys:](v13, "removeObjectsForKeys:", v14);

  }
}

- (id)localExtensions
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[NSMutableDictionary allValues](self->_localExtensionsByIdentifier, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localExtensionsByIdentifier, 0);
}

uint64_t __54__INCLocalExtensionRegistry_deregisterLocalExtension___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "isEqual:", *(_QWORD *)(a1 + 32));
}

void __43__INCLocalExtensionRegistry_sharedInstance__block_invoke()
{
  INCLocalExtensionRegistry *v0;
  void *v1;

  v0 = objc_alloc_init(INCLocalExtensionRegistry);
  v1 = (void *)sharedInstance_sLocalExtensionRegistry;
  sharedInstance_sLocalExtensionRegistry = (uint64_t)v0;

}

@end
