@implementation MSPMapsDefaultsAccessor

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__MSPMapsDefaultsAccessor_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED328430 != -1)
    dispatch_once(&qword_1ED328430, block);
  return (id)_MergedGlobals_42;
}

void __41__MSPMapsDefaultsAccessor_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_42;
  _MergedGlobals_42 = (uint64_t)v1;

}

- (MSPMapsDefaultsAccessor)init
{
  MSPMapsDefaultsAccessor *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSPMapsDefaultsAccessor;
  v2 = -[MSPMapsDefaultsAccessor init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D27108], "sharedObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_protectedDataAvailable = objc_msgSend(v3, "addDataDidBecomeAvailableAfterFirstUnlockObserver:", v2) ^ 1;

  }
  return v2;
}

- (void)protectedDataDidBecomeAvailable:(id)a3
{
  self->_protectedDataAvailable = 1;
}

- (id)_get:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  if (self->_protectedDataAvailable)
  {
    v3 = a3;
    +[MSPMapsPaths mapsApplicationContainerPaths](MSPMapsPaths, "mapsApplicationContainerPaths");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupDirectory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)_CFPreferencesCopyAppValueWithContainer();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_set:(id)a3 value:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  if (self->_protectedDataAvailable)
  {
    v5 = a4;
    v6 = a3;
    +[MSPMapsPaths mapsApplicationContainerPaths](MSPMapsPaths, "mapsApplicationContainerPaths");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "groupDirectory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _CFPreferencesSetAppValueWithContainer();

  }
}

- (void)_synchronize
{
  void *v2;
  id v3;

  if (self->_protectedDataAvailable)
  {
    +[MSPMapsPaths mapsApplicationContainerPaths](MSPMapsPaths, "mapsApplicationContainerPaths");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "groupDirectory");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    _CFPreferencesSynchronizeWithContainer();

  }
}

+ (id)get:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_get:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)set:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_set:value:", v7, v6);

}

+ (void)synchronize
{
  id v2;

  objc_msgSend(a1, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_synchronize");

}

@end
