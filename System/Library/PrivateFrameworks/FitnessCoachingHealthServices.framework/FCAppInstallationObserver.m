@implementation FCAppInstallationObserver

- (FCAppInstallationObserver)init
{
  FCAppInstallationObserver *v2;
  FCCAppInstallationUtility *v3;
  FCCAppInstallationUtility *appInstallationUtility;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FCAppInstallationObserver;
  v2 = -[FCAppInstallationObserver init](&v8, sel_init);
  if (v2)
  {
    v3 = (FCCAppInstallationUtility *)objc_alloc_init(MEMORY[0x1E0D220E0]);
    appInstallationUtility = v2->_appInstallationUtility;
    v2->_appInstallationUtility = v3;

    v2->_unfairLock._os_unfair_lock_opaque = 0;
    -[FCAppInstallationObserver _setAppInstalled:](v2, "_setAppInstalled:", -[FCCAppInstallationUtility fitnessAppInstalled](v2->_appInstallationUtility, "fitnessAppInstalled"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__applicationsInstalled_, *MEMORY[0x1E0D29290], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__applicationsUninstalled_, *MEMORY[0x1E0D292A0], 0);

  }
  return v2;
}

- (BOOL)fitnessAppInstalled
{
  FCAppInstallationObserver *v2;
  os_unfair_lock_s *p_unfairLock;

  v2 = self;
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  LOBYTE(v2) = v2->_isAppInstalled;
  os_unfair_lock_unlock(p_unfairLock);
  return (char)v2;
}

- (void)_setAppInstalled:(BOOL)a3
{
  os_unfair_lock_s *p_unfairLock;

  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  self->_isAppInstalled = a3;
  os_unfair_lock_unlock(p_unfairLock);
}

- (void)_applicationsInstalled:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D29288]);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "containsObject:", *MEMORY[0x1E0D22050]))
    -[FCAppInstallationObserver _updateApplicationInstalled](self, "_updateApplicationInstalled");

}

- (void)_applicationsUninstalled:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D29298]);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "containsObject:", *MEMORY[0x1E0D22050]))
    -[FCAppInstallationObserver _updateApplicationInstalled](self, "_updateApplicationInstalled");

}

- (void)_updateApplicationInstalled
{
  int v3;
  uint64_t v4;
  int v5;
  NSObject *v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = -[FCAppInstallationObserver fitnessAppInstalled](self, "fitnessAppInstalled");
  v4 = -[FCCAppInstallationUtility fitnessAppInstalled](self->_appInstallationUtility, "fitnessAppInstalled");
  if (v3 != (_DWORD)v4)
  {
    v5 = v4;
    -[FCAppInstallationObserver _setAppInstalled:](self, "_setAppInstalled:", v4);
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67240448;
      v8[1] = v3;
      v9 = 1026;
      v10 = v5;
      _os_log_impl(&dword_1CC30F000, v6, OS_LOG_TYPE_DEFAULT, "Fitness app installed state changed: %{public}d -> %{public}d", (uint8_t *)v8, 0xEu);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("FCFitnessInstallStateChangedNotification"), 0);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appInstallationUtility, 0);
}

@end
