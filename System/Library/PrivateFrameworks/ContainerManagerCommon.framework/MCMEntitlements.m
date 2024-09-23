@implementation MCMEntitlements

- (BOOL)isAllowedToLookupContainerIdentity:(id)a3
{
  id v4;
  char v5;
  NSObject *v6;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (self->_isSimulatorTestClient
      || -[MCMEntitlements privileged](self, "privileged")
      || -[MCMEntitlements allowed](self, "allowed"))
    {
      v5 = 1;
      goto LABEL_9;
    }
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "containerClass");
    -[MCMEntitlements identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[MCMEntitlements otherIDLookup](self, "otherIDLookup"))
      goto LABEL_11;
    if (v9 == 13)
    {
      +[MCMEntitlementBypassList sharedBypassList](MCMEntitlementBypassList, "sharedBypassList");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "systemGroupContainerIdIsWellknown:", v8);

      if ((v15 & 1) == 0 && (objc_msgSend(v8, "isEqualToString:", v10) & 1) == 0)
        goto LABEL_25;
    }
    else if (v9 == 12)
    {
      +[MCMEntitlementBypassList sharedBypassList](MCMEntitlementBypassList, "sharedBypassList");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "systemContainerIdIsWellknown:", v8);

      if ((v12 & 1) == 0)
      {
        if ((objc_msgSend(v8, "isEqualToString:", v10) & 1) != 0)
        {
          v13 = -[MCMEntitlements hasSystemContainer](self, "hasSystemContainer");
LABEL_24:
          v5 = v13;
          goto LABEL_12;
        }
LABEL_25:
        if (!-[MCMEntitlements isEntitledForLookupWithClass:identifier:](self, "isEntitledForLookupWithClass:identifier:", v9, v8))
        {
          +[MCMEntitlementBypassList sharedBypassList](MCMEntitlementBypassList, "sharedBypassList");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = objc_msgSend(v16, "isLookupAllowedToBypassEntitlementFromCodeSignIdentifier:forContainerClass:containerIdentifier:", v10, v9, v8);

          goto LABEL_12;
        }
      }
    }
    else
    {
      if ((objc_msgSend(v8, "isEqualToString:", v10) & 1) == 0)
        goto LABEL_25;
      if (v9 == 10)
      {
        v13 = -[MCMEntitlements hasDaemonContainer](self, "hasDaemonContainer");
        goto LABEL_24;
      }
    }
LABEL_11:
    v5 = 1;
LABEL_12:

    goto LABEL_9;
  }
  container_log_handle_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    v17 = 136446466;
    v18 = "-[MCMEntitlements isAllowedToLookupContainerIdentity:]";
    v19 = 1024;
    v20 = 227;
    _os_log_fault_impl(&dword_1CF807000, v6, OS_LOG_TYPE_FAULT, "Invalid nil parameter passed to %{public}s; %d",
      (uint8_t *)&v17,
      0x12u);
  }

  v5 = 0;
LABEL_9:

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)otherIDLookup
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  char v6;

  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.private.MobileContainerManager.otherIdLookup"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (BOOL)allowed
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  char v6;

  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.private.MobileContainerManager.allowed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (NSDictionary)rawEntitlements
{
  return self->_rawEntitlements;
}

- (BOOL)privileged
{
  return self->_privileged;
}

- (BOOL)isOwnerOfContainerWithClass:(unint64_t)a3 identifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  void *v11;

  v6 = a4;
  if (a3 == 13)
  {
    -[MCMEntitlements systemGroupIdentifiers](self, "systemGroupIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 != 7)
    {
      if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
      {
        if (!-[MCMEntitlements hasSystemContainer](self, "hasSystemContainer"))
          goto LABEL_13;
      }
      else if (a3 == 10 && !-[MCMEntitlements hasDaemonContainer](self, "hasDaemonContainer"))
      {
        goto LABEL_13;
      }
      -[MCMEntitlements identifier](self, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v6, "isEqualToString:", v11);

      goto LABEL_14;
    }
    -[MCMEntitlements appGroupIdentifiers](self, "appGroupIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  v9 = objc_msgSend(v7, "containsObject:", v6);

  if ((v9 & 1) == 0)
  {
LABEL_13:
    v10 = 0;
    goto LABEL_14;
  }
  v10 = 1;
LABEL_14:

  return v10;
}

- (id)systemGroupIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class();
  -[MCMEntitlements identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemGroupIdentifiersForIdentifier:entitlements:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)hasSystemContainer
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  char v6;

  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.security.system-container"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (void)prune
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByExcludingToObjectsInArray:", &unk_1E8CD6A68);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithValuesForKeys:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMEntitlements setRawEntitlements:](self, "setRawEntitlements:", v6);

}

- (void)setRawEntitlements:(id)a3
{
  objc_storeStrong((id *)&self->_rawEntitlements, a3);
}

- (BOOL)isEntitledForLookupWithClass:(unint64_t)a3 identifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;

  v6 = a4;
  -[MCMEntitlements identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 13)
  {
    v11 = (void *)objc_opt_class();
    -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "systemGroupIdentifiersForIdentifier:entitlements:", v7, v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 != 7)
      goto LABEL_7;
    v8 = (void *)objc_opt_class();
    -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appGroupIdentifiersForIdentifier:entitlements:", v7, v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v10;

  v13 = objc_msgSend(v12, "containsObject:", v6);
  if ((v13 & 1) != 0)
  {
    v14 = 0;
LABEL_10:
    v16 = 1;
    goto LABEL_12;
  }
LABEL_7:
  -[MCMEntitlements lookupForContainerClass:](self, "lookupForContainerClass:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v15;
  if (!v15)
  {
    v16 = 0;
    goto LABEL_12;
  }
  if (!objc_msgSend(v15, "count"))
    goto LABEL_10;
  v16 = objc_msgSend(v14, "containsObject:", v6);
LABEL_12:

  return v16;
}

- (id)appGroupIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class();
  -[MCMEntitlements identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appGroupIdentifiersForIdentifier:entitlements:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)systemGroupIdentifiersForIdentifier:(id)a3 entitlements:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(a1, "copyGroupEntitlementForIdentifier:entitlements:groupKey:", v6, v7, CFSTR("com.apple.security.system-groups"));
  v9 = v8;
  if (v8 && objc_msgSend(v8, "count")
    || (v10 = (void *)objc_msgSend(a1, "copyGroupEntitlementForIdentifier:entitlements:groupKey:", v6, v7, CFSTR("com.apple.security.system-group-containers")), v9, (v9 = v10) != 0))
  {
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_9431);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "filteredSetUsingPredicate:", v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

+ (id)appGroupIdentifiersForIdentifier:(id)a3 entitlements:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (void *)MEMORY[0x1E0C99E20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "publicAppGroupIdentifiersForIdentifier:entitlements:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "protectedAppGroupIdentifiersForIdentifier:entitlements:", v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "unionSet:", v10);
  objc_msgSend(v9, "unionSet:", v11);
  if (objc_msgSend(v9, "count"))
    v12 = (void *)objc_msgSend(v9, "copy");
  else
    v12 = 0;

  return v12;
}

+ (id)publicAppGroupIdentifiersForIdentifier:(id)a3 entitlements:(id)a4
{
  return (id)objc_msgSend(a1, "copyGroupEntitlementForIdentifier:entitlements:groupKey:", a3, a4, CFSTR("com.apple.security.application-groups"));
}

+ (id)protectedAppGroupIdentifiersForIdentifier:(id)a3 entitlements:(id)a4
{
  return (id)objc_msgSend(a1, "copyGroupEntitlementForIdentifier:entitlements:groupKey:", a3, a4, CFSTR("com.apple.private.security.restricted-application-groups"));
}

+ (id)copyGroupEntitlementForIdentifier:(id)a3 entitlements:(id)a4 groupKey:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char isKindOfClass;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  int v21;
  id v22;
  __int16 v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(a4, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_19;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  if ((isKindOfClass & 1) != 0)
  {
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, &v21, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v26;
LABEL_5:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        if (v13 == ++v15)
        {
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, &v21, 16);
          if (v13)
            goto LABEL_5;
          goto LABEL_11;
        }
      }

      container_log_handle_for_category();
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      v21 = 138412546;
      v22 = v8;
      v23 = 2112;
      v24 = v7;
      v19 = "Entitlement %@ for %@ contains non-string values; ignoring.";
      goto LABEL_22;
    }
LABEL_11:

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      container_log_handle_for_category();
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
LABEL_18:

LABEL_19:
        v17 = 0;
        goto LABEL_20;
      }
      v21 = 138412546;
      v22 = v8;
      v23 = 2112;
      v24 = v7;
      v19 = "Entitlement %@ for %@ does not contain supported types; ignoring.";
LABEL_22:
      _os_log_error_impl(&dword_1CF807000, v18, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v21, 0x16u);
      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v16;
LABEL_20:

  return v17;
}

- (id)lookupForContainerClass:(unint64_t)a3
{
  MCMEntitlements *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSDictionary *sanitizedLookup;
  NSDictionary *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = self;
  objc_sync_enter(v3);
  if (!v3->_sanitizedLookup)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMEntitlements lookup](v3, "lookup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x1D17D7010]();
      -[MCMEntitlements classIterator](v3, "classIterator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __43__MCMEntitlements_lookupForContainerClass___block_invoke;
      v14[3] = &unk_1E8CB64A8;
      v14[4] = v3;
      v15 = v4;
      objc_msgSend(v7, "selectWithFlags:iterator:", 393216, v14);

      objc_autoreleasePoolPop(v6);
    }
    v8 = objc_msgSend(v4, "copy");
    sanitizedLookup = v3->_sanitizedLookup;
    v3->_sanitizedLookup = (NSDictionary *)v8;

  }
  objc_sync_exit(v3);

  v10 = v3->_sanitizedLookup;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", container_class_normalized());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __68__MCMEntitlements_systemGroupIdentifiersForIdentifier_entitlements___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("systemgroup."));
  if ((v3 & 1) == 0)
  {
    container_log_handle_for_category();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v2;
      _os_log_error_impl(&dword_1CF807000, v4, OS_LOG_TYPE_ERROR, "System group ID %@ does not have proper prefix, ignoring.", (uint8_t *)&v6, 0xCu);
    }

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_classIterator, 0);
  objc_storeStrong((id *)&self->_lookup, 0);
  objc_storeStrong((id *)&self->_rawEntitlements, 0);
  objc_storeStrong((id *)&self->_sanitizedWipe, 0);
  objc_storeStrong((id *)&self->_sanitizedLookup, 0);
}

- (BOOL)isAllowedToLookupGroupContainersOfClass:(unint64_t)a3 ownedByIdentifiers:(id)a4
{
  id v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    if (-[MCMEntitlements allowed](self, "allowed")
      || -[MCMEntitlements otherIDLookup](self, "otherIDLookup")
      || objc_msgSend(v6, "count") == 1
      && (objc_msgSend(v6, "anyObject"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          -[MCMEntitlements identifier](self, "identifier"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v9, "isEqualToString:", v10),
          v10,
          v9,
          (v11 & 1) != 0))
    {
      v7 = 1;
    }
    else
    {
      -[MCMEntitlements lookupForContainerClass:](self, "lookupForContainerClass:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v7 = v12 && !objc_msgSend(v12, "count");

    }
  }
  else
  {
    container_log_handle_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v15 = 136446466;
      v16 = "-[MCMEntitlements isAllowedToLookupGroupContainersOfClass:ownedByIdentifiers:]";
      v17 = 1024;
      v18 = 301;
      _os_log_fault_impl(&dword_1CF807000, v8, OS_LOG_TYPE_FAULT, "Invalid nil parameter passed to %{public}s; %d",
        (uint8_t *)&v15,
        0x12u);
    }

    v7 = 0;
  }

  return v7;
}

- (BOOL)isAllowedToAccessUserAssets
{
  return -[MCMEntitlements allowed](self, "allowed")
      || -[MCMEntitlements canManageUserManagedAssets](self, "canManageUserManagedAssets");
}

- (BOOL)canManageUserManagedAssets
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  char v6;

  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.private.MobileContainerManager.userManagedAssets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (MCMEntitlements)initWithEntitlements:(id)a3 clientIdentifier:(id)a4 classIterator:(id)a5
{
  id v8;
  id v9;
  id v10;
  MCMEntitlements *v11;
  MCMEntitlements *v12;
  void *v13;
  NSDictionary *lookup;
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MCMEntitlements;
  v11 = -[MCMEntitlements init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_isSimulatorTestClient = 0;
    if (v8)
      v13 = v8;
    else
      v13 = (void *)MEMORY[0x1E0C9AA70];
    objc_storeStrong((id *)&v11->_rawEntitlements, v13);
    objc_storeStrong((id *)&v12->_identifier, a4);
    v12->_privileged = 0;
    lookup = v12->_lookup;
    v12->_lookup = 0;

    objc_storeStrong((id *)&v12->_classIterator, a5);
  }

  return v12;
}

- (id)initForPrivilegedAnonymous
{
  MCMEntitlements *v2;
  MCMEntitlements *v3;
  NSDictionary *lookup;

  v2 = -[MCMEntitlements initWithEntitlements:clientIdentifier:classIterator:](self, "initWithEntitlements:clientIdentifier:classIterator:", 0, CFSTR("com.apple.containermanagerd"), 0);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_isSimulatorTestClient = 256;
    lookup = v2->_lookup;
    v2->_lookup = 0;

  }
  return v3;
}

- (BOOL)proxyAllowed
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  char v6;

  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.private.MobileContainerManager.proxy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (BOOL)testabilityAllowed
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  char v6;

  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.private.MobileContainerManager.testability"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (BOOL)canDelete
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  char v6;

  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.private.MobileContainerManager.delete"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (BOOL)canControlCaches
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  char v6;

  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.private.MobileContainerManager.cacheControl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (BOOL)canRepair
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  char v6;

  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.private.MobileContainerManager.repair"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (BOOL)canStageSharedContent
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  char v6;

  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.private.MobileContainerManager.stageSharedContent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (BOOL)canPerformDataMigration
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  char v6;

  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.private.MobileContainerManager.dataMigration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (BOOL)canDeleteContainerContent
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  char v6;

  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.private.MobileContainerManager.deleteContainerContent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (BOOL)requestsNoContainer
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  char v6;

  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.private.security.no-container"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (BOOL)canReadReferences
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  char v6;

  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.private.MobileContainerManager.references.read-only"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (BOOL)canReadWriteReferences
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  char v6;

  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.private.MobileContainerManager.references.read-write"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (BOOL)hasDaemonContainer
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  char v6;

  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.private.security.daemon-container"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (NSDictionary)lookup
{
  NSDictionary *lookup;
  void *v4;
  void *v5;
  id v6;
  NSDictionary *v7;
  NSDictionary *v8;

  lookup = self->_lookup;
  if (!lookup)
  {
    -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("com.apple.private.MobileContainerManager.lookup"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v6 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = (NSDictionary *)v6;
    else
      v7 = 0;

    v8 = self->_lookup;
    self->_lookup = v7;

    lookup = self->_lookup;
  }
  return lookup;
}

- (BOOL)isAllowedToLookupAllContainersOfClass:(unint64_t)a3
{
  BOOL v5;
  void *v7;
  void *v8;

  if (self->_isSimulatorTestClient
    || -[MCMEntitlements allowed](self, "allowed")
    || -[MCMEntitlements otherIDLookup](self, "otherIDLookup"))
  {
    return 1;
  }
  -[MCMEntitlements lookupForContainerClass:](self, "lookupForContainerClass:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v5 = v7 && !objc_msgSend(v7, "count");

  return v5;
}

- (BOOL)isAllowedToLookupViaPrivateEntitlementWithClass:(unint64_t)a3 identifier:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v10;

  v6 = a4;
  if (-[MCMEntitlements allowed](self, "allowed") || -[MCMEntitlements otherIDLookup](self, "otherIDLookup"))
  {
    v7 = 0;
  }
  else
  {
    -[MCMEntitlements lookupForContainerClass:](self, "lookupForContainerClass:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    if (!v10)
    {
      v8 = 0;
      goto LABEL_5;
    }
    if (objc_msgSend(v10, "count"))
    {
      v8 = objc_msgSend(v7, "containsObject:", v6);
      goto LABEL_5;
    }
  }
  v8 = 1;
LABEL_5:

  return v8;
}

- (BOOL)isOwnerOfProtectedAppGroupContainerWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MCMEntitlements protectedAppGroupIdentifiers](self, "protectedAppGroupIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "containsObject:", v4);

  return (char)self;
}

- (int)intendedDataProtectionClass
{
  int result;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  int v14;

  result = -[MCMEntitlements dataProtectionClassIfAvailable](self, "dataProtectionClassIfAvailable");
  if (!result)
  {
    -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("com.apple.developer.default-data-protection"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v6 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    if (v7)
      goto LABEL_14;
    -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("data-protection-class"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v10 = v9;
    v7 = (objc_opt_isKindOfClass() & 1) != 0 ? v10 : 0;

    if (v7)
      goto LABEL_14;
    -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DataProtectionClass"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v13 = v12;
    v7 = (objc_opt_isKindOfClass() & 1) != 0 ? v13 : 0;

    if (v7)
    {
LABEL_14:
      v14 = -[MCMEntitlements _dataProtectionClassFromString:](self, "_dataProtectionClassFromString:", v7);

      return v14;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (int)dataProtectionClassIfAvailable
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  int v13;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.developer.default-data-protection-if-available"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_opt_class();
    v5 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;

      v7 = -[MCMEntitlements _dataProtectionClassFromString:](self, "_dataProtectionClassFromString:", v6);
LABEL_18:

      goto LABEL_19;
    }

    objc_opt_class();
    v6 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MCMEntitlements _arrayOfStringsFromArray:](self, "_arrayOfStringsFromArray:", v6);
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            v13 = -[MCMEntitlements _dataProtectionClassFromString:](self, "_dataProtectionClassFromString:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
            if (v13)
            {
              v7 = v13;
              goto LABEL_17;
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
          if (v10)
            continue;
          break;
        }
      }
      v7 = 0;
LABEL_17:

      goto LABEL_18;
    }

  }
  v7 = 0;
LABEL_19:

  return v7;
}

- (id)publicAppGroupIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class();
  -[MCMEntitlements identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "publicAppGroupIdentifiersForIdentifier:entitlements:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)protectedAppGroupIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class();
  -[MCMEntitlements identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "protectedAppGroupIdentifiersForIdentifier:entitlements:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)noReferenceAppGroupIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class();
  -[MCMEntitlements identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "noReferenceAppGroupIdentifiersForIdentifier:entitlements:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)containerRequiredIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  id v7;
  void *v8;
  char v9;
  void *v10;

  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.private.security.container-required"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_isKindOfClass();

    if ((v9 & 1) != 0)
    {
      if (!objc_msgSend(v4, "BOOLValue"))
        goto LABEL_6;
    }
    else if (!v4)
    {
      goto LABEL_6;
    }
    -[MCMEntitlements identifier](self, "identifier");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if ((objc_msgSend(v4, "isEqual:", &stru_1E8CB6A50) & 1) == 0)
  {
    v7 = v4;
LABEL_9:
    v10 = v7;
    goto LABEL_10;
  }
LABEL_6:
  v10 = 0;
LABEL_10:

  return v10;
}

- (BOOL)negatesReferenceToAppGroupIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[MCMEntitlements noReferenceAppGroupIdentifiers](self, "noReferenceAppGroupIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = v5 && (objc_msgSend(v5, "containsObject:", v4) & 1) != 0;

  return v7;
}

- (BOOL)isAllowedToControlCaches
{
  return -[MCMEntitlements allowed](self, "allowed") || -[MCMEntitlements canControlCaches](self, "canControlCaches");
}

- (BOOL)isAllowedToWipeAnyDataContainer
{
  return -[MCMEntitlements allowed](self, "allowed")
      || -[MCMEntitlements canDeleteContainerContent](self, "canDeleteContainerContent");
}

- (BOOL)isAllowedToWipePlugInDataContainerWithIdentifier:(id)a3
{
  id v4;
  char v5;
  NSObject *v6;
  MCMEntitlements *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  unint64_t i;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  NSSet *sanitizedWipe;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (self->_isSimulatorTestClient
      || -[MCMEntitlements isAllowedToWipeAnyDataContainer](self, "isAllowedToWipeAnyDataContainer"))
    {
      v5 = 1;
    }
    else
    {
      v7 = self;
      objc_sync_enter(v7);
      if (!v7->_sanitizedWipe)
      {
        -[MCMEntitlements rawEntitlements](v7, "rawEntitlements");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("com.apple.private.MobileContainerManager.wipeContainer"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v10 = v9;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = v10;
        else
          v11 = 0;

        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v11, "count"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          for (i = 0; i < objc_msgSend(v11, "count"); ++i)
          {
            objc_msgSend(v11, "objectAtIndexedSubscript:", i);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v15 = v14;
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v16 = v15;
            else
              v16 = 0;

            if (v16)
              objc_msgSend(v12, "addObject:", v16);

          }
          v17 = objc_msgSend(v12, "copy");
          sanitizedWipe = v7->_sanitizedWipe;
          v7->_sanitizedWipe = (NSSet *)v17;

        }
      }
      objc_sync_exit(v7);

      v5 = -[NSSet containsObject:](v7->_sanitizedWipe, "containsObject:", v4);
    }
  }
  else
  {
    container_log_handle_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v20 = 136446466;
      v21 = "-[MCMEntitlements isAllowedToWipePlugInDataContainerWithIdentifier:]";
      v22 = 1024;
      v23 = 619;
      _os_log_fault_impl(&dword_1CF807000, v6, OS_LOG_TYPE_FAULT, "Invalid nil parameter passed to %{public}s; %d",
        (uint8_t *)&v20,
        0x12u);
    }

    v5 = 0;
  }

  return v5;
}

- (BOOL)isAllowedToReplaceContainers
{
  return -[MCMEntitlements allowed](self, "allowed");
}

- (BOOL)isAllowedToAccessInfoMetadata
{
  return -[MCMEntitlements allowed](self, "allowed");
}

- (BOOL)isAllowedToRecreateContainerStructure
{
  return -[MCMEntitlements allowed](self, "allowed");
}

- (BOOL)isAllowedToRegenerateDirectoryUUIDs
{
  return -[MCMEntitlements allowed](self, "allowed");
}

- (BOOL)isAllowedToDelete
{
  return -[MCMEntitlements allowed](self, "allowed");
}

- (BOOL)isAllowedToTest
{
  return -[MCMEntitlements testabilityAllowed](self, "testabilityAllowed");
}

- (BOOL)isAllowedToAccessCodesignMapping
{
  return -[MCMEntitlements allowed](self, "allowed");
}

- (BOOL)isAllowedToSetDataProtection
{
  return -[MCMEntitlements allowed](self, "allowed");
}

- (BOOL)isAllowedToRestoreContainer
{
  return -[MCMEntitlements allowed](self, "allowed");
}

- (BOOL)isAllowedToStartDataMigration
{
  return -[MCMEntitlements allowed](self, "allowed")
      || -[MCMEntitlements canPerformDataMigration](self, "canPerformDataMigration");
}

- (BOOL)isAllowedToStartUserDataMigration
{
  return -[MCMEntitlements allowed](self, "allowed");
}

- (BOOL)isAllowedToStageSharedContent
{
  return -[MCMEntitlements allowed](self, "allowed")
      || -[MCMEntitlements canStageSharedContent](self, "canStageSharedContent");
}

- (BOOL)isAllowedToReadReferences
{
  return -[MCMEntitlements canReadReferences](self, "canReadReferences")
      || -[MCMEntitlements canReadWriteReferences](self, "canReadWriteReferences");
}

- (BOOL)isAllowedToChangeReferences
{
  return -[MCMEntitlements canReadWriteReferences](self, "canReadWriteReferences");
}

- (id)copyEntitlementsDictionaryByRemovingGroupContainerOfClass:(unint64_t)a3 groupIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  if (a3 == 13)
  {
    v7 = -[MCMEntitlements copyEntitlementsDictionaryByRemovingSystemGroupContainerWithIdentifier:](self, "copyEntitlementsDictionaryByRemovingSystemGroupContainerWithIdentifier:", v6);
  }
  else
  {
    if (a3 != 7)
    {
      -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v9, "copy");

      goto LABEL_7;
    }
    v7 = -[MCMEntitlements copyEntitlementsDictionaryByRemovingAppGroupContainerWithIdentifier:](self, "copyEntitlementsDictionaryByRemovingAppGroupContainerWithIdentifier:", v6);
  }
  v8 = v7;
LABEL_7:

  return v8;
}

- (id)copyEntitlementsDictionaryByRemovingAppGroupContainerWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[MCMEntitlements publicAppGroupIdentifiers](self, "publicAppGroupIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  -[MCMEntitlements protectedAppGroupIdentifiers](self, "protectedAppGroupIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (!v8)
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("com.apple.security.application-groups"));
    if (v10)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("com.apple.private.security.restricted-application-groups"));
    goto LABEL_6;
  }
  objc_msgSend(v8, "removeObject:", v4);
  objc_msgSend(v8, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("com.apple.security.application-groups"));

  if (!v10)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v10, "removeObject:", v4);
  objc_msgSend(v10, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("com.apple.private.security.restricted-application-groups"));

LABEL_6:
  v13 = (void *)objc_msgSend(v6, "copy");

  return v13;
}

- (id)copyEntitlementsDictionaryByRemovingSystemGroupContainerWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[MCMEntitlements systemGroupIdentifiers](self, "systemGroupIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v6, "removeObjectForKey:", CFSTR("com.apple.security.system-group-containers"));
  if (v8)
  {
    objc_msgSend(v8, "removeObject:", v4);
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("com.apple.security.system-groups"));

  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("com.apple.security.system-groups"));
  }
  v10 = (void *)objc_msgSend(v6, "copy");

  return v10;
}

- (id)copyEntitlementsDictionaryByAddingGroupContainerOfClass:(unint64_t)a3 groupIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;

  v6 = a4;
  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend((id)objc_opt_class(), "publicEntitlementForGroupContainerClass:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (a3 == 13)
    {
      -[MCMEntitlements systemGroupIdentifiers](self, "systemGroupIdentifiers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "mutableCopy");
      v17 = v16;
      if (v16)
      {
        v18 = v16;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      v19 = v18;

      objc_msgSend(v8, "removeObjectForKey:", CFSTR("com.apple.security.system-group-containers"));
    }
    else if (a3 == 7)
    {
      -[MCMEntitlements publicAppGroupIdentifiers](self, "publicAppGroupIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");
      v12 = v11;
      if (v11)
      {
        v13 = v11;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      v19 = v13;

    }
    else
    {
      v19 = 0;
    }
    objc_msgSend(v19, "addObject:", v6);
    objc_msgSend(v19, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, v9);

    v14 = (void *)objc_msgSend(v8, "copy");
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_setOfStringsFromArray:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E20];
  v4 = a3;
  objc_msgSend(v3, "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __42__MCMEntitlements__setOfStringsFromArray___block_invoke;
  v12 = &unk_1E8CB5F00;
  v13 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v9);

  v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12);
  return v7;
}

- (id)_arrayOfStringsFromArray:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __44__MCMEntitlements__arrayOfStringsFromArray___block_invoke;
  v12 = &unk_1E8CB5F00;
  v13 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v9);

  v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12);
  return v7;
}

- (int)_dataProtectionClassFromString:(id)a3
{
  id v3;
  int v4;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB2AB0]) & 1) != 0)
  {
    v4 = 1;
    goto LABEL_9;
  }
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB2AB8]) & 1) != 0)
  {
LABEL_4:
    v4 = 2;
    goto LABEL_9;
  }
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB2AC0]) & 1) != 0)
    goto LABEL_6;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB2AE0]) & 1) != 0)
  {
    v4 = 4;
    goto LABEL_9;
  }
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB2AE8]) & 1) != 0)
    goto LABEL_4;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB2AC8]) & 1) != 0)
  {
LABEL_6:
    v4 = 3;
    goto LABEL_9;
  }
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB2AD0]) & 1) != 0)
  {
    v4 = 7;
  }
  else
  {
    container_log_handle_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1CF807000, v6, OS_LOG_TYPE_DEFAULT, "Unrecognized value for data protection entitlement: [%@]", (uint8_t *)&v7, 0xCu);
    }

    v4 = 0;
  }
LABEL_9:

  return v4;
}

- (MCMContainerClassIterator)classIterator
{
  return self->_classIterator;
}

void __44__MCMEntitlements__arrayOfStringsFromArray___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __42__MCMEntitlements__setOfStringsFromArray___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __43__MCMEntitlements_lookupForContainerClass___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v15, "containerClass");
    objc_msgSend(v4, "numberWithUnsignedLongLong:", container_class_normalized());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "lookup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v7;
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "_setOfStringsFromArray:", v8);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_5;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "BOOLValue"))
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "set");
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_5:
        v10 = (void *)v9;
        if (v9)
        {
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            v12 = (void *)objc_msgSend(v10, "mutableCopy");
            objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "unionSet:", v13);

            v14 = objc_msgSend(v12, "copy");
            v10 = (void *)v14;
          }
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v5);

        }
      }
    }

  }
}

+ (id)noReferenceAppGroupIdentifiersForIdentifier:(id)a3 entitlements:(id)a4
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_msgSend(a1, "copyGroupEntitlementForIdentifier:entitlements:groupKey:", a3, a4, CFSTR("com.apple.private.MobileContainerManager.appGroup.noReference"));
  v5 = v4;
  if (v4 && !objc_msgSend(v4, "count"))
    v6 = 0;
  else
    v6 = v5;

  return v6;
}

+ (id)publicEntitlementForGroupContainerClass:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("com.apple.security.system-groups");
  if (a3 != 13)
    v3 = 0;
  if (a3 == 7)
    return CFSTR("com.apple.security.application-groups");
  else
    return (id)v3;
}

@end
