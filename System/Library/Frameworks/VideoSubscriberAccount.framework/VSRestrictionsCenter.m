@implementation VSRestrictionsCenter

+ (id)defaultRestrictionsCenter
{
  if (defaultRestrictionsCenter___vs_lazy_init_predicate != -1)
    dispatch_once(&defaultRestrictionsCenter___vs_lazy_init_predicate, &__block_literal_global_8);
  return (id)defaultRestrictionsCenter___vs_lazy_init_variable;
}

void __49__VSRestrictionsCenter_defaultRestrictionsCenter__block_invoke()
{
  VSRestrictionsCenter *v0;
  void *v1;

  v0 = objc_alloc_init(VSRestrictionsCenter);
  v1 = (void *)defaultRestrictionsCenter___vs_lazy_init_variable;
  defaultRestrictionsCenter___vs_lazy_init_variable = (uint64_t)v0;

}

- (VSRestrictionsCenter)init
{
  VSRestrictionsCenter *v2;
  VSManagedProfileConnection *v3;
  VSManagedProfileConnection *profileConnection;
  VSManagedProfileConnection *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VSRestrictionsCenter;
  v2 = -[VSRestrictionsCenter init](&v7, sel_init);
  if (v2)
  {
    +[VSManagedProfileConnection sharedConnection](VSManagedProfileConnection, "sharedConnection");
    v3 = (VSManagedProfileConnection *)objc_claimAutoreleasedReturnValue();
    profileConnection = v2->_profileConnection;
    v2->_profileConnection = v3;
    v5 = v3;

    -[VSManagedProfileConnection registerObserver:](v5, "registerObserver:", v2);
    -[VSRestrictionsCenter _updateAccountModificationAllowed](v2, "_updateAccountModificationAllowed");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[VSManagedProfileConnection unregisterObserver:](self->_profileConnection, "unregisterObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)VSRestrictionsCenter;
  -[VSRestrictionsCenter dealloc](&v3, sel_dealloc);
}

- (void)_updateAccountModificationAllowed
{
  _BOOL8 v3;
  id v4;

  -[VSRestrictionsCenter profileConnection](self, "profileConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "accountModificationAllowed") != 2 && objc_msgSend(v4, "TVProviderModificationAllowed") != 2;
  -[VSRestrictionsCenter setAccountModificationAllowed:](self, "setAccountModificationAllowed:", v3);

}

- (BOOL)_canInstallAppsAtAll
{
  void *v2;
  BOOL v3;

  -[VSRestrictionsCenter profileConnection](self, "profileConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "appInstallationAllowed") != 2 && objc_msgSend(v2, "UIAppInstallationAllowed") != 2;

  return v3;
}

- (BOOL)canInstallAppWithRating:(int64_t)a3
{
  BOOL v5;
  void *v6;
  int64_t v7;
  BOOL v8;
  BOOL v9;

  v5 = -[VSRestrictionsCenter _canInstallAppsAtAll](self, "_canInstallAppsAtAll");
  -[VSRestrictionsCenter profileConnection](self, "profileConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "maximumAppsRating");
  v8 = v7 >= a3 && v5;
  if (a3 < 0)
    v8 = 0;
  if (v7 == 1000)
    v8 = v5;
  if (v7)
    v9 = v8;
  else
    v9 = 0;

  return v9;
}

- (void)profileConnectionSettingsChanged:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__VSRestrictionsCenter_profileConnectionSettingsChanged___block_invoke;
  v3[3] = &unk_1E939EE88;
  v3[4] = self;
  VSPerformBlockOnMainThread(v3);
}

uint64_t __57__VSRestrictionsCenter_profileConnectionSettingsChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAccountModificationAllowed");
}

- (BOOL)isAcountModificationAllowed
{
  return self->_accountModificationAllowed;
}

- (void)setAccountModificationAllowed:(BOOL)a3
{
  self->_accountModificationAllowed = a3;
}

- (VSManagedProfileConnection)profileConnection
{
  return self->_profileConnection;
}

- (void)setProfileConnection:(id)a3
{
  objc_storeStrong((id *)&self->_profileConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileConnection, 0);
}

@end
