@implementation MSPMapsInstallState

+ (void)setRunningInsideMapsApp
{
  _sRunningInsideMapsApp = 1;
}

void __34__MSPMapsInstallState_sharedState__block_invoke()
{
  MSPMapsInstallState *v0;
  void *v1;

  v0 = objc_alloc_init(MSPMapsInstallState);
  v1 = (void *)_MergedGlobals_41;
  _MergedGlobals_41 = (uint64_t)v0;

}

- (MSPMapsInstallState)init
{
  MSPMapsInstallState *v2;
  uint64_t v3;
  GEOObserverHashTable *installStateObservers;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MSPMapsInstallState;
  v2 = -[MSPMapsInstallState init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D272B8]), "initWithProtocol:queue:", &unk_1EF094F48, 0);
    installStateObservers = v2->_installStateObservers;
    v2->_installStateObservers = (GEOObserverHashTable *)v3;

    if (_sRunningInsideMapsApp == 1)
    {
      *(_WORD *)&v2->_mapsInstalled = 257;
    }
    else
    {
      *(_WORD *)&v2->_mapsInstalled = 0;
      objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_receivedChangeNotification_, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0);

      objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_receivedChangeNotification_, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0);

    }
  }
  return v2;
}

+ (BOOL)isMapsAppInstalled
{
  void *v2;
  char v3;

  objc_msgSend(a1, "sharedState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isMapsAppInstalled");

  return v3;
}

- (BOOL)_isMapsAppInstalled
{
  MSPMapsInstallState *v2;
  BOOL mapsInstalled;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_hasState)
  {
    mapsInstalled = v2->_mapsInstalled;
  }
  else
  {
    mapsInstalled = -[MSPMapsInstallState _fetchMapsAppInstallState](v2, "_fetchMapsAppInstallState");
    v2->_mapsInstalled = mapsInstalled;
    v2->_hasState = 1;
  }
  objc_sync_exit(v2);

  return mapsInstalled;
}

+ (id)sharedState
{
  if (qword_1ED328420 != -1)
    dispatch_once(&qword_1ED328420, &__block_literal_global_10);
  return (id)_MergedGlobals_41;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0);

  v5.receiver = self;
  v5.super_class = (Class)MSPMapsInstallState;
  -[MSPMapsInstallState dealloc](&v5, sel_dealloc);
}

- (BOOL)_fetchMapsAppInstallState
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = objc_alloc(MEMORY[0x1E0CA5870]);
  v3 = (void *)objc_msgSend(v2, "initWithBundleIdentifier:allowPlaceholder:error:", *MEMORY[0x1E0D26D08], 0, 0);
  objc_msgSend(v3, "applicationState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = 0;
  if (objc_msgSend(v4, "isInstalled"))
  {
    objc_msgSend(v3, "applicationState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isValid"))
    {
      objc_msgSend(v3, "applicationState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isRestricted") & 1) != 0)
      {
        LOBYTE(v5) = 0;
      }
      else
      {
        objc_msgSend(v3, "applicationState");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v8, "isPlaceholder") ^ 1;

      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }

  }
  return v5;
}

- (void)receivedChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  MSPMapsInstallState *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleIDs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPlaceholder"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0D26D08]) ^ 1 | v8) & 1) == 0)
  {
    v9 = self;
    objc_sync_enter(v9);
    v10 = -[MSPMapsInstallState _fetchMapsAppInstallState](v9, "_fetchMapsAppInstallState");
    v9->_mapsInstalled = v10;
    -[GEOObserverHashTable mapsInstallStateDidChange:](v9->_installStateObservers, "mapsInstallStateDidChange:", v10);
    objc_sync_exit(v9);

  }
}

- (void)registerMapsInstallStateObserver:(id)a3
{
  -[GEOObserverHashTable registerObserver:](self->_installStateObservers, "registerObserver:", a3);
}

- (void)unregisterMapsInstallStateObserver:(id)a3
{
  -[GEOObserverHashTable unregisterObserver:](self->_installStateObservers, "unregisterObserver:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installStateObservers, 0);
}

@end
