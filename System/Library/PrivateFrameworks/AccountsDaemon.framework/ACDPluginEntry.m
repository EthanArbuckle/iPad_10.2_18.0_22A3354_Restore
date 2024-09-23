@implementation ACDPluginEntry

- (ACDPluginEntry)init
{
  -[ACDPluginEntry doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ACDPluginEntry)initWithBundle:(id)a3
{
  id v5;
  ACDPluginEntry *v6;
  ACDPluginEntry *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACDPluginEntry;
  v6 = -[ACDPluginEntry init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bundle, a3);

  return v7;
}

- (NSSet)supportedAccountTypes
{
  ACDPluginEntry *v2;
  NSBundle *bundle;
  uint64_t v4;
  NSSet *supportedAccountTypes;

  v2 = self;
  objc_sync_enter(v2);
  if ((*(_BYTE *)&v2->_fetchedFlags & 2) == 0)
  {
    bundle = v2->_bundle;
    objc_opt_class();
    _ACDSetForKeyInBundle(bundle, (uint64_t)CFSTR("ACSupportedAccountTypes"));
    v4 = objc_claimAutoreleasedReturnValue();
    supportedAccountTypes = v2->_supportedAccountTypes;
    v2->_supportedAccountTypes = (NSSet *)v4;

    *(_BYTE *)&v2->_fetchedFlags |= 2u;
  }
  objc_sync_exit(v2);

  return v2->_supportedAccountTypes;
}

- (NSSet)supportedDataclasses
{
  ACDPluginEntry *v2;
  NSBundle *bundle;
  uint64_t v4;
  NSSet *supportedDataclasses;

  v2 = self;
  objc_sync_enter(v2);
  if ((*(_BYTE *)&v2->_fetchedFlags & 4) == 0)
  {
    bundle = v2->_bundle;
    objc_opt_class();
    _ACDSetForKeyInBundle(bundle, (uint64_t)CFSTR("ACSupportedDataclasses"));
    v4 = objc_claimAutoreleasedReturnValue();
    supportedDataclasses = v2->_supportedDataclasses;
    v2->_supportedDataclasses = (NSSet *)v4;

    *(_BYTE *)&v2->_fetchedFlags |= 4u;
  }
  objc_sync_exit(v2);

  return v2->_supportedDataclasses;
}

- (id)principalObject
{
  ACDPluginEntry *v2;
  id v3;
  id principalObject;

  v2 = self;
  objc_sync_enter(v2);
  if ((*(_BYTE *)&v2->_fetchedFlags & 1) == 0)
  {
    v3 = objc_alloc_init(-[NSBundle principalClass](v2->_bundle, "principalClass"));
    principalObject = v2->_principalObject;
    v2->_principalObject = v3;

    *(_BYTE *)&v2->_fetchedFlags |= 1u;
  }
  objc_sync_exit(v2);

  return v2->_principalObject;
}

- (NSString)identifier
{
  ACDPluginEntry *v2;
  uint64_t v3;
  NSString *identifier;

  v2 = self;
  objc_sync_enter(v2);
  if ((*(_BYTE *)&v2->_fetchedFlags & 8) == 0)
  {
    -[NSBundle bundleIdentifier](v2->_bundle, "bundleIdentifier");
    v3 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v3;

    *(_BYTE *)&v2->_fetchedFlags |= 8u;
  }
  objc_sync_exit(v2);

  return v2->_identifier;
}

- (BOOL)principalObjectRespondsToSelector:(SEL)a3
{
  return -[objc_class instancesRespondToSelector:](-[NSBundle principalClass](self->_bundle, "principalClass"), "instancesRespondToSelector:", a3);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSBundle bundlePath](self->_bundle, "bundlePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { bundle: %@ }>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSBundle *bundle;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  bundle = self->_bundle;
  __34__ACDPluginEntry_debugDescription__block_invoke((uint64_t)v5, self->_supportedAccountTypes, (*(_BYTE *)&self->_fetchedFlags >> 1) & 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __34__ACDPluginEntry_debugDescription__block_invoke((uint64_t)v7, self->_supportedDataclasses, (*(_BYTE *)&self->_fetchedFlags >> 2) & 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { bundle: %@, supportedAccountTypes: %@, supportedDataclasses: %@ }>"), v5, self, bundle, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

__CFString *__34__ACDPluginEntry_debugDescription__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v4;
  void *v5;
  __CFString *v6;

  v4 = a2;
  v5 = v4;
  if (a3)
    v6 = (__CFString *)v4;
  else
    v6 = CFSTR("(not loaded)");

  return v6;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_supportedDataclasses, 0);
  objc_storeStrong((id *)&self->_supportedAccountTypes, 0);
  objc_storeStrong(&self->_principalObject, 0);
}

@end
