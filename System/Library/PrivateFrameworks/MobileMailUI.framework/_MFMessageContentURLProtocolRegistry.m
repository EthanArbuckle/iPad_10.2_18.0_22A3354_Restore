@implementation _MFMessageContentURLProtocolRegistry

+ (id)sharedRegistry
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54___MFMessageContentURLProtocolRegistry_sharedRegistry__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRegistry_onceToken != -1)
    dispatch_once(&sharedRegistry_onceToken, block);
  return (id)sharedRegistry__sharedInstance;
}

- (_MFMessageContentURLProtocolRegistry)init
{
  _MFMessageContentURLProtocolRegistry *v2;
  NSLock *v3;
  NSLock *lock;
  uint64_t v5;
  NSMapTable *storage;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MFMessageContentURLProtocolRegistry;
  v2 = -[_MFMessageContentURLProtocolRegistry init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v2->_lock;
    v2->_lock = v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    storage = v2->_storage;
    v2->_storage = (NSMapTable *)v5;

  }
  return v2;
}

- (id)URLForLoadingContext:(id)a3 scheme:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  -[NSLock lock](self->_lock, "lock");
  objc_getAssociatedObject(v6, (const void *)MFMessageContentURLRegistrationKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v9, "setScheme:", v7);
    v10 = URLForLoadingContext_scheme__counter++;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/%lu"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPath:", v11);

    objc_msgSend(v9, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v6, (const void *)MFMessageContentURLRegistrationKey, v8, (void *)0x301);
    -[_MFMessageContentURLProtocolRegistry storage](self, "storage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v6, v8);

  }
  -[NSLock unlock](self->_lock, "unlock");

  return v8;
}

- (id)loadingContextForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[NSLock lock](self->_lock, "lock");
  -[_MFMessageContentURLProtocolRegistry storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "query");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v7, "setQuery:", 0);
      -[_MFMessageContentURLProtocolRegistry storage](self, "storage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "URL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  -[NSLock unlock](self->_lock, "unlock");

  return v6;
}

- (NSMapTable)storage
{
  return self->_storage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
