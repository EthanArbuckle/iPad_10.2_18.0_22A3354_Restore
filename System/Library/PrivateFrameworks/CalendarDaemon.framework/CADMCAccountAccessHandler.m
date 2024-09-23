@implementation CADMCAccountAccessHandler

- (BOOL)isActionAllowed:(unint64_t)a3 forStore:(void *)a4 inDatabase:(CalDatabase *)a5
{
  BOOL v9;
  void *v10;
  BOOL v11;
  void *v12;

  if (-[CADMCAccountAccessHandler _isDisabledForAction:](self, "_isDisabledForAction:"))
    return 1;
  -[CADAccountAccessHandler dataProvider](self, "dataProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isLocalStore:inDatabase:", a4, a5))
  {
    v11 = -[CADMCAccountAccessHandler _areLocalStoresRestrictedForAction:](self, "_areLocalStoresRestrictedForAction:", a3);
  }
  else
  {
    objc_msgSend(v10, "accountIDForStore:inDatabase:", a4, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CADMCAccountAccessHandler _isAccount:restrictedForAction:](self, "_isAccount:restrictedForAction:", v12, a3);

  }
  v9 = !v11;

  return v9;
}

- (BOOL)_isDisabledForAction:(unint64_t)a3
{
  void *v3;
  char v4;

  -[CADMCAccountAccessHandler managedConfigHandler](self, "managedConfigHandler", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isOpenInRestrictionInEffect");

  return v4 ^ 1;
}

- (CADManagedConfigurationHandler)managedConfigHandler
{
  return self->_managedConfigHandler;
}

- (void)gatherRestrictedCalendarRowIDs:(id)a3 forAction:(unint64_t)a4 inDatabase:(CalDatabase *)a5
{
  id v8;
  objc_super v9;

  v8 = a3;
  if (!-[CADMCAccountAccessHandler _isDisabledForAction:](self, "_isDisabledForAction:", a4))
  {
    v9.receiver = self;
    v9.super_class = (Class)CADMCAccountAccessHandler;
    -[CADAccountAccessHandler gatherRestrictedCalendarRowIDs:forAction:inDatabase:](&v9, sel_gatherRestrictedCalendarRowIDs_forAction_inDatabase_, v8, a4, a5);
  }

}

- (CADMCAccountAccessHandler)initWithDatabaseDataProvider:(id)a3 accountsProvider:(id)a4 managedConfigHandler:(id)a5 accountManagement:(unint64_t)a6 bundleIdentifier:(id)a7
{
  id v13;
  id v14;
  id v15;
  CADMCAccountAccessHandler *v16;
  CADMCAccountAccessHandler *v17;
  uint64_t v18;
  NSString *bundleIdentifier;
  objc_super v21;

  v13 = a4;
  v14 = a5;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CADMCAccountAccessHandler;
  v16 = -[CADAccountAccessHandler initWithDatabaseDataProvider:](&v21, sel_initWithDatabaseDataProvider_, a3);
  v17 = v16;
  if (v16)
  {
    v16->_accountManagement = a6;
    v18 = objc_msgSend(v15, "copy");
    bundleIdentifier = v17->_bundleIdentifier;
    v17->_bundleIdentifier = (NSString *)v18;

    objc_storeStrong((id *)&v17->_accountsProvider, a4);
    objc_storeStrong((id *)&v17->_managedConfigHandler, a5);
    v17->_lock._os_unfair_lock_opaque = 0;
  }

  return v17;
}

- (void)reset
{
  os_unfair_lock_s *p_lock;
  NSArray *localAccountRestrictionsByAction;
  NSMutableDictionary *allowedAccountIdentifiersByAction;
  NSArray *cachedAccounts;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  localAccountRestrictionsByAction = self->_localAccountRestrictionsByAction;
  self->_localAccountRestrictionsByAction = 0;

  allowedAccountIdentifiersByAction = self->_allowedAccountIdentifiersByAction;
  self->_allowedAccountIdentifiersByAction = 0;

  cachedAccounts = self->_cachedAccounts;
  self->_cachedAccounts = 0;

  os_unfair_lock_unlock(p_lock);
}

- (id)_cachedAccounts
{
  NSArray *cachedAccounts;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  cachedAccounts = self->_cachedAccounts;
  if (!cachedAccounts)
  {
    -[CADMCAccountAccessHandler accountsProvider](self, "accountsProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accounts");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_cachedAccounts;
    self->_cachedAccounts = v5;

    cachedAccounts = self->_cachedAccounts;
  }
  return cachedAccounts;
}

- (BOOL)_areLocalStoresRestrictedForAction:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  NSArray *localAccountRestrictionsByAction;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *v12;
  void *v13;
  char v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  localAccountRestrictionsByAction = self->_localAccountRestrictionsByAction;
  if (!localAccountRestrictionsByAction)
  {
    v7 = -[CADMCAccountAccessHandler _mayShowLocalAccountsForAction:](self, "_mayShowLocalAccountsForAction:", 0) ^ 1;
    v8 = -[CADMCAccountAccessHandler _mayShowLocalAccountsForAction:](self, "_mayShowLocalAccountsForAction:", 1) ^ 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v12 = self->_localAccountRestrictionsByAction;
    self->_localAccountRestrictionsByAction = v11;

    localAccountRestrictionsByAction = self->_localAccountRestrictionsByAction;
  }
  -[NSArray objectAtIndexedSubscript:](localAccountRestrictionsByAction, "objectAtIndexedSubscript:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  v14 = objc_msgSend(v13, "BOOLValue");

  return v14;
}

- (BOOL)_isAccount:(id)a3 restrictedForAction:(unint64_t)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  void *v8;
  void *v9;
  NSMutableDictionary *allowedAccountIdentifiersByAction;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  char v13;

  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_allowedAccountIdentifiersByAction, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    -[CADMCAccountAccessHandler _loadAllowedAccountIdentifiersForAction:](self, "_loadAllowedAccountIdentifiersForAction:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    allowedAccountIdentifiersByAction = self->_allowedAccountIdentifiersByAction;
    if (!allowedAccountIdentifiersByAction)
    {
      v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v12 = self->_allowedAccountIdentifiersByAction;
      self->_allowedAccountIdentifiersByAction = v11;

      allowedAccountIdentifiersByAction = self->_allowedAccountIdentifiersByAction;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](allowedAccountIdentifiersByAction, "setObject:forKeyedSubscript:", v9, v8);
  }
  os_unfair_lock_unlock(p_lock);
  v13 = objc_msgSend(v9, "containsObject:", v7);

  return v13 ^ 1;
}

- (id)_loadAllowedAccountIdentifiersForAction:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CADMCAccountAccessHandler _cachedAccounts](self, "_cachedAccounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CADMCAccountAccessHandler _filteredAccountsForAction:withUnfilteredAccounts:](self, "_filteredAccountsForAction:withUnfilteredAccounts:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_filteredAccountsForAction:(unint64_t)a3 withUnfilteredAccounts:(id)a4
{
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;

  v7 = a4;
  if (a3)
  {
    if (a3 != 1)
    {
      CADAccountActionDescription(a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CADMCAccountAccessHandler.m"), 172, CFSTR("Unsupported CADAccountAction: [%@]"), v9);
      v13 = 0;
      goto LABEL_7;
    }
    v8 = CADSourceFromAccountManagement(-[CADMCAccountAccessHandler accountManagement](self, "accountManagement"));
    -[CADMCAccountAccessHandler managedConfigHandler](self, "managedConfigHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADMCAccountAccessHandler bundleIdentifier](self, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filteredOpenInAccounts:originatingAppBundleID:sourceAccountManagement:", v7, v10, v8);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = CADTargetFromAccountManagement(-[CADMCAccountAccessHandler accountManagement](self, "accountManagement"));
    -[CADMCAccountAccessHandler managedConfigHandler](self, "managedConfigHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADMCAccountAccessHandler bundleIdentifier](self, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filteredOpenInOriginatingAccounts:targetAppBundleID:targetAccountManagement:", v7, v10, v12);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v11;
LABEL_7:

  return v13;
}

- (BOOL)_mayShowLocalAccountsForAction:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  char v7;
  unint64_t v8;
  BOOL v9;

  if (a3)
  {
    if (a3 != 1)
    {
      CADAccountActionDescription(a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CADMCAccountAccessHandler.m"), 190, CFSTR("Unsupported CADAccountAction: [%@]"), v5);
      v9 = 0;
      goto LABEL_7;
    }
    v4 = CADSourceFromAccountManagement(-[CADMCAccountAccessHandler accountManagement](self, "accountManagement"));
    -[CADMCAccountAccessHandler managedConfigHandler](self, "managedConfigHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADMCAccountAccessHandler bundleIdentifier](self, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "mayShowLocalAccountsForBundleID:sourceAccountManagement:", v6, v4);
  }
  else
  {
    v8 = CADTargetFromAccountManagement(-[CADMCAccountAccessHandler accountManagement](self, "accountManagement"));
    -[CADMCAccountAccessHandler managedConfigHandler](self, "managedConfigHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADMCAccountAccessHandler bundleIdentifier](self, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "mayShowLocalAccountsForTargetBundleID:targetAccountManagement:", v6, v8);
  }
  v9 = v7;
LABEL_7:

  return v9;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (CADACAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (unint64_t)accountManagement
{
  return self->_accountManagement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedConfigHandler, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_localAccountRestrictionsByAction, 0);
  objc_storeStrong((id *)&self->_allowedAccountIdentifiersByAction, 0);
  objc_storeStrong((id *)&self->_cachedAccounts, 0);
}

@end
