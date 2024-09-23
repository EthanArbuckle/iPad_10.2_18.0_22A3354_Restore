@implementation LockdownModeManager

+ (id)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global);
  return (id)shared_lockdownModeManager;
}

void __29__LockdownModeManager_shared__block_invoke()
{
  LockdownModeManager *v0;
  void *v1;

  v0 = objc_alloc_init(LockdownModeManager);
  v1 = (void *)shared_lockdownModeManager;
  shared_lockdownModeManager = (uint64_t)v0;

}

- (LockdownModeManager)init
{
  LockdownModeManager *v2;
  uint64_t v3;
  LockdownModeManagerInternal *underlyingObject;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LockdownModeManager;
  v2 = -[LockdownModeManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    underlyingObject = v2->_underlyingObject;
    v2->_underlyingObject = (LockdownModeManagerInternal *)v3;

  }
  return v2;
}

- (BOOL)enabled
{
  void *v2;
  char v3;

  -[LockdownModeManager underlyingObject](self, "underlyingObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enabled");

  return v3;
}

- (LockdownModeManagerInternal)underlyingObject
{
  return (LockdownModeManagerInternal *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)enabledInAccount
{
  void *v2;
  char v3;

  -[LockdownModeManager underlyingObject](self, "underlyingObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enabledInAccount");

  return v3;
}

- (void)setEnabled:(BOOL)a3 options:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;

  v6 = a3;
  v8 = a5;
  v9 = a4;
  -[LockdownModeManager underlyingObject](self, "underlyingObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:options:completion:", v6, v9, v8);

}

- (void)getEnabledInAccount:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[LockdownModeManager underlyingObject](self, "underlyingObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getEnabledInAccount:completion:", v4, v6);

}

- (void)notifyRestrictionChanged:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LockdownModeManager underlyingObject](self, "underlyingObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notifyRestrictionChanged:", v4);

}

- (void)enableIfNeeded:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[LockdownModeManager underlyingObject](self, "underlyingObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enableIfNeeded:completion:", v4, v6);

}

- (void)migrateIfNeededWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LockdownModeManager underlyingObject](self, "underlyingObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "migrateIfNeededWithCompletion:", v4);

}

- (void)rebootIfNeeded
{
  id v2;

  -[LockdownModeManager underlyingObject](self, "underlyingObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rebootIfNeeded");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
