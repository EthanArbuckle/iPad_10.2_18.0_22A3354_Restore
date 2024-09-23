@implementation _HKEntitlements

- (id)valueForEntitlement:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v10;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "_allowedEntitlementsSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKEntitlements.m"), 238, CFSTR("Entitlement key %@ must be in the set of allowlisted entitlement keys"), v5);

  }
  -[NSDictionary objectForKeyedSubscript:](self->_entitlementValues, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_allowedEntitlementsSet
{
  if (_allowedEntitlementsSet_onceToken != -1)
    dispatch_once(&_allowedEntitlementsSet_onceToken, &__block_literal_global_15);
  return (id)_allowedEntitlementsSet_entitlementKeySet;
}

+ (id)entitlementsWithConnection:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  SecTaskRef v9;
  SecTaskRef v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  audit_token_t token;

  v7 = a3;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "auditToken");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKEntitlements.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection != nil"));

    memset(&token, 0, sizeof(token));
  }
  v9 = SecTaskCreateWithAuditToken(0, &token);
  if (v9)
  {
    v10 = v9;
    if (objc_msgSend(v8, "hk_isAppExtension"))
    {
      objc_msgSend(MEMORY[0x1E0CA5890], "hk_appExtensionContainerBundleForConnection:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(a1, "_allowedEntitlementsSet");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "entitlementValuesForKeys:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "rawValues");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(a1, "_entitlementsWithSecTask:valueOverrides:error:", v10, v14, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a4, 100, CFSTR("Unable to retrieve remote task for entitlement lookup."));
    v15 = 0;
  }

  return v15;
}

+ (id)_entitlementsWithSecTask:(__SecTask *)a3 valueOverrides:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  const __CFArray *v10;
  CFDictionaryRef v11;
  void *v12;
  CFErrorRef v13;
  const __CFArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  __CFError *v22;
  __CFError *v23;
  CFErrorRef v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CFErrorRef error;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  error = 0;
  objc_msgSend(a1, "_allowedEntitlementsSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (const __CFArray *)objc_claimAutoreleasedReturnValue();

  v11 = SecTaskCopyValuesForEntitlements(a3, v10, &error);
  v12 = (void *)-[__CFDictionary mutableCopy](v11, "mutableCopy");

  v13 = error;
  if (v12)
  {
    v25 = error;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v14 = v10;
    v15 = -[__CFArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v8, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, v19);

        }
        v16 = -[__CFArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v16);
    }

    v21 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithEntitlementValues:", v12);
    v13 = v25;
  }
  else
  {
    v22 = error;
    v23 = v22;
    if (v22)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v22);
      else
        _HKLogDroppedError(v22);
    }

    v21 = 0;
  }

  return v21;
}

- (id)_initWithEntitlementValues:(id)a3
{
  id v4;
  _HKEntitlements *v5;
  void *v6;
  uint64_t v7;
  NSDictionary *entitlementValues;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *applicationIdentifier;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_HKEntitlements;
  v5 = -[_HKEntitlements init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "_allowedEntitlementsSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hk_filteredDictionaryForKeys:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    entitlementValues = v5->_entitlementValues;
    v5->_entitlementValues = (NSDictionary *)v7;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("application-identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if (objc_msgSend(v9, "hasPrefix:", CFSTR("appshack.")))
      {
        objc_msgSend(v10, "substringFromIndex:", objc_msgSend(CFSTR("appshack."), "length"));
        v11 = objc_claimAutoreleasedReturnValue();
        applicationIdentifier = v5->_applicationIdentifier;
        v5->_applicationIdentifier = (NSString *)v11;

      }
      else
      {
        CPCopyBundleIdentifierAndTeamFromApplicationIdentifier();
      }
    }

  }
  return v5;
}

- (id)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (BOOL)hasEntitlement:(id)a3
{
  void *v3;
  char v4;

  -[_HKEntitlements valueForEntitlement:](self, "valueForEntitlement:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (id)stringForEntitlement:(id)a3
{
  void *v3;
  id v4;

  -[_HKEntitlements valueForEntitlement:](self, "valueForEntitlement:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

+ (id)entitlementsWithApplicationIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("application-identifier");
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "entitlementsWithDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entitlementsWithDictionary:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithEntitlementValues:", v4);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlementValues, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

+ (id)entitlementsForCurrentTaskWithError:(id *)a3
{
  id v3;
  SecTaskRef v6;
  SecTaskRef v7;
  void *v8;

  if (_currentTaskEntitlementsOverride)
  {
    v3 = (id)_currentTaskEntitlementsOverride;
  }
  else
  {
    v6 = SecTaskCreateFromSelf(0);
    if (v6)
    {
      v7 = v6;
      objc_msgSend(a1, "_containerAppExtensionEntitlementsForCurrentTask");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_entitlementsWithSecTask:valueOverrides:error:", v7, v8, a3);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      CFRelease(v7);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a3, 100, CFSTR("Unable to retrieve current task for entitlement lookup."));
      v3 = 0;
    }
  }
  return v3;
}

+ (id)_containerAppExtensionEntitlementsForCurrentTask
{
  dispatch_semaphore_t v2;
  HKEntitlementStore *v3;
  HKHealthStore *v4;
  HKEntitlementStore *v5;
  NSObject *v6;
  _QWORD v8[4];
  dispatch_semaphore_t v9;

  if (!_HKCurrentTaskIsAppExtension())
    return MEMORY[0x1E0C9AA70];
  os_unfair_lock_lock((os_unfair_lock_t)&_containerAppExtensionEntitlementsForCurrentTask__lock);
  if (!_containerAppExtensionEntitlementsForCurrentTask_currentTaskEntitlements)
  {
    v2 = dispatch_semaphore_create(0);
    v3 = [HKEntitlementStore alloc];
    v4 = objc_alloc_init(HKHealthStore);
    v5 = -[HKEntitlementStore initWithHealthStore:](v3, "initWithHealthStore:", v4);

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67___HKEntitlements__containerAppExtensionEntitlementsForCurrentTask__block_invoke;
    v8[3] = &unk_1E37EA620;
    v9 = v2;
    v6 = v2;
    -[HKEntitlementStore fetchContainerAppExtensionEntitlementsWithCompletion:](v5, "fetchContainerAppExtensionEntitlementsWithCompletion:", v8);
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_containerAppExtensionEntitlementsForCurrentTask__lock);
  return (id)_containerAppExtensionEntitlementsForCurrentTask_currentTaskEntitlements;
}

+ (void)_setEntitlementsForCurrentTask:(id)a3
{
  objc_storeStrong((id *)&_currentTaskEntitlementsOverride, a3);
}

- (_HKEntitlements)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (BOOL)hasPrivateMetadataAccess
{
  return -[_HKEntitlements hasEntitlement:](self, "hasEntitlement:", CFSTR("com.apple.private.healthkit"))
      || -[_HKEntitlements hasEntitlement:](self, "hasEntitlement:", CFSTR("com.apple.private.healthkit.metadata.private"));
}

- (BOOL)hasBackgroundDeliveryAPIAccess
{
  return -[_HKEntitlements hasEntitlement:](self, "hasEntitlement:", CFSTR("com.apple.developer.healthkit.background-delivery"));
}

- (BOOL)arrayEntitlement:(id)a3 containsString:(id)a4
{
  id v6;
  void *v7;
  char v8;

  v6 = a4;
  -[_HKEntitlements valueForEntitlement:](self, "valueForEntitlement:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = objc_msgSend(v7, "containsObject:", v6);
  else
    v8 = 0;

  return v8;
}

- (BOOL)hasAccessEntitlementWithIdentifier:(id)a3
{
  return -[_HKEntitlements arrayEntitlement:containsString:](self, "arrayEntitlement:containsString:", CFSTR("com.apple.developer.healthkit.access"), a3);
}

- (BOOL)hasPrivateAccessEntitlementWithIdentifier:(id)a3
{
  return -[_HKEntitlements arrayEntitlement:containsString:](self, "arrayEntitlement:containsString:", CFSTR("com.apple.private.healthkit.access"), a3);
}

- (id)typesForWriteAuthorizationOverride
{
  void *v3;
  void *v4;

  -[_HKEntitlements valueForEntitlement:](self, "valueForEntitlement:", CFSTR("com.apple.private.healthkit.write_authorization_override"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKEntitlements _typesFromIdentifierArray:](self, "_typesFromIdentifierArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)typesForReadAuthorizationOverride
{
  void *v3;
  void *v4;

  -[_HKEntitlements valueForEntitlement:](self, "valueForEntitlement:", CFSTR("com.apple.private.healthkit.read_authorization_override"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKEntitlements _typesFromIdentifierArray:](self, "_typesFromIdentifierArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)typesForReadAuthorizationBypass
{
  void *v3;
  void *v4;

  -[_HKEntitlements valueForEntitlement:](self, "valueForEntitlement:", CFSTR("com.apple.private.healthkit.read_authorization_bypass"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKEntitlements _typesFromIdentifierArray:](self, "_typesFromIdentifierArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_typesFromIdentifierArray:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            +[HKObjectType _typeWithIdentifier:](HKObjectType, "_typeWithIdentifier:", v11, (_QWORD)v14);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
              objc_msgSend(v5, "addObject:", v12);

          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)description
{
  return -[NSDictionary description](self->_entitlementValues, "description");
}

- (NSDictionary)entitlementValues
{
  return self->_entitlementValues;
}

@end
