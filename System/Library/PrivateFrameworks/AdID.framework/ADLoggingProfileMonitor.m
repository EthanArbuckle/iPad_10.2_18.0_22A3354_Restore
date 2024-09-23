@implementation ADLoggingProfileMonitor

- (ADLoggingProfileMonitor)init
{
  ADLoggingProfileMonitor *v2;
  ADLoggingProfileMonitor *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ADLoggingProfileMonitor;
  v2 = -[ADLoggingProfileMonitor init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ADLoggingProfileMonitor _fetchInstalledProfilesAndListen](v2, "_fetchInstalledProfilesAndListen");
  return v3;
}

- (void)_fetchInstalledProfilesAndListen
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *initQueue;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.ap.adprivacyd.ADLoggingProfileMonitor.init", 0);
  initQueue = self->_initQueue;
  self->_initQueue = v3;

  objc_initWeak(&location, self);
  v5 = self->_initQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__ADLoggingProfileMonitor__fetchInstalledProfilesAndListen__block_invoke;
  v6[3] = &unk_24D710E30;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __59__ADLoggingProfileMonitor__fetchInstalledProfilesAndListen__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = -1;
    ADCopyDataFromKeychain();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error %d reading installed profile data"), 0xFFFFFFFFLL);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    if (!WeakRetained[1])
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Reading installed profile list from MDM"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      objc_msgSend(WeakRetained, "fetchInstalledProfileIdentifiers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setProfileIdentifiers:", v5);

    }
    objc_msgSend(WeakRetained, "_profilesChanged:", 0);
    objc_msgSend(WeakRetained, "_beginMonitoring");
    objc_msgSend(WeakRetained, "setInitQueue:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("self == nil in [ADLoggingProfileMonitor _fetchInstalledProfilesAndListen]. Profile changes will not be monitored."));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();
  }

}

- (void)_profilesChanged:(id)a3
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  NSSet *profileIdentifiers;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Received profile list changed notification"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  -[ADLoggingProfileMonitor fetchInstalledProfileIdentifiers](self, "fetchInstalledProfileIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ADLoggingProfileMonitor _hasRelevantProfileChanged:](self, "_hasRelevantProfileChanged:", v5);
  objc_storeStrong((id *)&self->_profileIdentifiers, v5);
  profileIdentifiers = self->_profileIdentifiers;
  v13 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", profileIdentifiers, 1, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  ADWriteDataToKeychain();

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error writing installed profiles to keychain: %@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Ad Platforms logging profile has been removed or Personalized Ads profiles was installed/removed."));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "performOperationWhenNotReconciling:", &__block_literal_global_6);

  }
}

void __44__ADLoggingProfileMonitor__profilesChanged___block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Rolling all identifiers in response to profile removal/install."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "deleteRecords:", &__block_literal_global_29);

}

void __44__ADLoggingProfileMonitor__profilesChanged___block_invoke_2()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "iTunesAccountDSID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDSID:completionHandler:", v1, &__block_literal_global_31);

}

void __44__ADLoggingProfileMonitor__profilesChanged___block_invoke_3()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "reconcile:", &__block_literal_global_33);

}

void __44__ADLoggingProfileMonitor__profilesChanged___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v2;

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("There was an error reconciling after profile change. Error: %@. Please file a radar."), a2);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
}

- (BOOL)_hasRelevantProfileChanged:(id)a3
{
  void *v4;
  NSSet *profileIdentifiers;
  id v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (void *)MEMORY[0x24BDD17C8];
  profileIdentifiers = self->_profileIdentifiers;
  v6 = a3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Existing profile list\n%@"), profileIdentifiers);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 1;
  _ADLog();

  v9 = (id)-[NSSet mutableCopy](self->_profileIdentifiers, "mutableCopy");
  objc_msgSend(v9, "minusSet:", v6);
  v10 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v10, "minusSet:", v9);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Installed profiles:\n%@"), v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _ADLog();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Removed profiles:\n%@"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  if ((objc_msgSend(v9, "containsObject:", CFSTR("com.apple.adplatforms.logging")) & 1) == 0
    && (objc_msgSend(v9, "containsObject:", CFSTR("com.apple.dms.restrictions.allowApplePersonalizedAdvertising")) & 1) == 0)
  {
    v8 = objc_msgSend(v10, "containsObject:", CFSTR("com.apple.dms.restrictions.allowApplePersonalizedAdvertising"));
  }

  return v8;
}

- (id)fetchInstalledProfileIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "installedProfileIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_beginMonitoring
{
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BE63B78];
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__profilesChanged_, v3, v4);

}

- (NSSet)profileIdentifiers
{
  return self->_profileIdentifiers;
}

- (void)setProfileIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_profileIdentifiers, a3);
}

- (OS_dispatch_queue)initQueue
{
  OS_dispatch_queue *initQueue;

  initQueue = self->_initQueue;

  return initQueue;
}

- (void)setInitQueue:(id)a3
{
  objc_storeStrong((id *)&self->_initQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initQueue, 0);
  objc_storeStrong((id *)&self->_profileIdentifiers, 0);
}

@end
