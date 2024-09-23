@implementation _MUExtensionGroup

- (_MXExtension)bestExtensionToUse
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__6;
  v8 = __Block_byref_object_dispose__6;
  v9 = 0;
  geo_isolate_sync();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (_MXExtension *)v2;
}

- (void)addExtensionIfMatchedAppIdentifier:(id)a3
{
  void *v4;
  int v5;
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(v6, "_containingAppIdentifer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", self->_appIdentifier);

  if (v5)
  {
    v7 = v6;
    geo_isolate_sync();

  }
}

- (_MUExtensionGroup)initWithAppIdentifier:(id)a3
{
  id v5;
  _MUExtensionGroup *v6;
  _MUExtensionGroup *v7;
  NSMutableArray *v8;
  NSMutableArray *extensions;
  uint64_t v10;
  geo_isolater *extensionsLock;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_MUExtensionGroup;
  v6 = -[_MUExtensionGroup init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_appIdentifier, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    extensions = v7->_extensions;
    v7->_extensions = v8;

    v10 = geo_isolater_create();
    extensionsLock = v7->_extensionsLock;
    v7->_extensionsLock = (geo_isolater *)v10;

  }
  return v7;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (GEOAppleMediaServicesResult)appStoreApp
{
  return self->_appStoreApp;
}

- (void)setAppStoreApp:(id)a3
{
  objc_storeStrong((id *)&self->_appStoreApp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appStoreApp, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionsLock, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
}

@end
