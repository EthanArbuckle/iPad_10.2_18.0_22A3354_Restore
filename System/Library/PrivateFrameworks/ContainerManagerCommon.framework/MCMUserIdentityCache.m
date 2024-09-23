@implementation MCMUserIdentityCache

- (id)libraryRepairForUserIdentity:(id)a3
{
  id v4;
  MCMLibraryRepairForUser *v5;
  void *v6;
  MCMLibraryRepairForUser *v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    -[MCMUserIdentityCache defaultUserIdentity](self, "defaultUserIdentity");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_lock_libraryRepairForUserIdentity, "objectForKeyedSubscript:", v4);
  v5 = (MCMLibraryRepairForUser *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  if (!v5)
  {
    -[MCMUserIdentityCache managedUserPathRegistryForUserIdentity:](self, "managedUserPathRegistryForUserIdentity:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [MCMLibraryRepairForUser alloc];
    +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMUserIdentityCache classIterator](self, "classIterator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MCMLibraryRepairForUser initWithManagedUserPathRegistry:fileManager:classIterator:](v7, "initWithManagedUserPathRegistry:fileManager:classIterator:", v6, v8, v9);

    os_unfair_lock_lock(&self->_lock);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lock_libraryRepairForUserIdentity, "setObject:forKeyedSubscript:", v5, v4);
    os_unfair_lock_unlock(&self->_lock);
    if (objc_msgSend(v4, "personaType") != 3)
    {
      v14 = 0;
      v10 = -[MCMLibraryRepair createPathsIfNecessaryWithError:](v5, "createPathsIfNecessaryWithError:", &v14);
      v11 = v14;
      if (!v10)
      {
        container_log_handle_for_category();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v16 = v4;
          v17 = 2114;
          v18 = v11;
          _os_log_error_impl(&dword_1CF807000, v12, OS_LOG_TYPE_ERROR, "Failed creating working directories for %@: %{public}@", buf, 0x16u);
        }

      }
    }

  }
  return v5;
}

+ (BOOL)personasAreSupported
{
  id v2;
  BOOL v3;

  if (MCMPersonasAreSupported_onceToken != -1)
    dispatch_once(&MCMPersonasAreSupported_onceToken, &__block_literal_global_8254);
  if (!MCMPersonasAreSupported_staticPersonasSupported)
    return 0;
  v2 = containermanager_copy_global_configuration();
  v3 = objc_msgSend(v2, "dispositionForContainerClass:", 2) == 1;

  return v3;
}

- (id)personaUniqueStringForCurrentContext
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint8_t v8[8];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_opt_class(), "personasAreSupported") && objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0DC5EE0], "sharedManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "currentPersona");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "userPersonaUniqueString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      container_log_handle_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1CF807000, v5, OS_LOG_TYPE_DEFAULT, "Could not fetch persona unique string", v8, 2u);
      }

    }
  }
  else
  {
    v4 = 0;
  }
  if (personaUniqueStringForCurrentContext_onceToken != -1)
  {
    dispatch_once(&personaUniqueStringForCurrentContext_onceToken, &__block_literal_global_11);
    if (v4)
      goto LABEL_11;
LABEL_15:
    v6 = 0;
    return v6;
  }
  if (!v4)
    goto LABEL_15;
LABEL_11:
  objc_msgSend((id)personaUniqueStringForCurrentContext_dedupCache, "objectForKey:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend((id)personaUniqueStringForCurrentContext_dedupCache, "setObject:forKey:", v4, v4);
    v6 = v4;
  }

  return v6;
}

- (void)_refreshFromUserManagementIfNecessary
{
  void *v3;
  unint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  uint8_t buf[4];
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_opt_class(), "personasAreSupported"))
  {
    objc_msgSend(MEMORY[0x1E0DC5EE0], "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v4 = objc_msgSend(v3, "personaGenerationIdentifierWithError:", &v9);

    if (v4 && v4 != self->_savedGeneration)
    {
      self->_savedGeneration = v4;
      container_log_handle_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
LABEL_10:

        -[MCMUserIdentityCache flush](self, "flush");
        return;
      }
      *(_DWORD *)buf = 134217984;
      v11 = v4;
      v6 = "Flushing cache because UM persona list has updated. (generation %llu)";
      v7 = v5;
      v8 = 12;
    }
    else
    {
      if (self->_fetchedFromUM)
        return;
      container_log_handle_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        goto LABEL_10;
      *(_WORD *)buf = 0;
      v6 = "Resync cache because UM persona list has not yet been fetched successfully.";
      v7 = v5;
      v8 = 2;
    }
    _os_log_impl(&dword_1CF807000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    goto LABEL_10;
  }
}

- (id)globalSystemUserIdentity
{
  return (id)objc_msgSend((id)objc_opt_class(), "globalSystemUserIdentity");
}

+ (id)globalSystemUserIdentity
{
  if (globalSystemUserIdentity_onceToken != -1)
    dispatch_once(&globalSystemUserIdentity_onceToken, &__block_literal_global_10);
  return (id)globalSystemUserIdentity_userIdentity;
}

- (id)allAccessibleUserIdentities
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v16;
  MCMUserIdentityCache *v17;
  __int16 v18;
  void *v19;
  _BYTE v20[128];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[MCMUserIdentityCache _refreshFromUserManagementIfNecessary](self, "_refreshFromUserManagementIfNecessary");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "personasAreSupported"))
  {
    os_unfair_lock_lock(&self->_lock);
    -[MCMUserIdentityCache lock_personaUniqueStringToUserIdentityMap](self, "lock_personaUniqueStringToUserIdentityMap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(&self->_lock);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((objc_msgSend(v11, "isNoSpecificPersona") & 1) == 0)
            objc_msgSend(v3, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
      }
      while (v8);
    }

    if (!objc_msgSend(v3, "count"))
    {
      container_log_handle_for_category();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v16 = 138412546;
        v17 = self;
        v18 = 2112;
        v19 = v3;
        _os_log_error_impl(&dword_1CF807000, v12, OS_LOG_TYPE_ERROR, "Expected to find at least one persona; self = %@, personaAttributeList = %@",
          (uint8_t *)&v16,
          0x16u);
      }

      -[MCMUserIdentityCache defaultUserIdentity](self, "defaultUserIdentity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v13);

    }
  }
  else
  {
    -[MCMUserIdentityCache defaultUserIdentity](self, "defaultUserIdentity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v14);

  }
  return v3;
}

- (id)userIdentityForCurrentUserWithPersonaUniqueString:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  os_unfair_lock_s *p_lock;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MCMUserIdentityCache _refreshFromUserManagementIfNecessary](self, "_refreshFromUserManagementIfNecessary");
  if (!objc_msgSend((id)objc_opt_class(), "personasAreSupported"))
  {
    -[MCMUserIdentityCache userIdentityForPersonalPersona](self, "userIdentityForPersonalPersona");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v7 = (void *)v9;
    goto LABEL_10;
  }
  if (!v4)
  {
    -[MCMUserIdentityCache unspecificUserIdentity](self, "unspecificUserIdentity");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0C803F8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    -[MCMUserIdentityCache userIdentityForPersonalPersona](self, "userIdentityForPersonalPersona");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    container_log_handle_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v7, "debugDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v12;
      _os_log_debug_impl(&dword_1CF807000, v8, OS_LOG_TYPE_DEBUG, "Sentinel persona, using: %@", (uint8_t *)&v13, 0xCu);

    }
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    -[MCMUserIdentityCache _lock_userIdentityForCurrentUserWithPersonaUniqueString:](self, "_lock_userIdentityForCurrentUserWithPersonaUniqueString:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
  }
LABEL_10:

  return v7;
}

- (id)userIdentityForPersonalPersona
{
  id v3;
  void *v4;
  void *v5;

  v3 = containermanager_copy_global_configuration();
  objc_msgSend(v3, "defaultUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMUserIdentityCache userIdentityForPersonalPersonaWithPOSIXUser:](self, "userIdentityForPersonalPersonaWithPOSIXUser:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)userIdentityForClient:(container_client *)a3 error:(id *)a4
{
  void *persona_unique_string;
  uint64_t euid;
  id v8;
  void *v9;
  id v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  -[MCMUserIdentityCache _refreshFromUserManagementIfNecessary](self, "_refreshFromUserManagementIfNecessary");
  persona_unique_string = (void *)container_client_get_persona_unique_string();
  euid = container_client_get_euid();
  v8 = containermanager_copy_global_configuration();
  objc_msgSend(v8, "defaultUser");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = containermanager_copy_global_configuration();
  v11 = objc_msgSend(v10, "userContainerMode");

  if (v11 == 2)
  {
    +[MCMPOSIXUser posixUserWithUID:](MCMPOSIXUser, "posixUserWithUID:", euid);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }
  if (persona_unique_string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", persona_unique_string);
    persona_unique_string = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[MCMUserIdentityCache userIdentityForPersonaUniqueString:POSIXUser:](self, "userIdentityForPersonaUniqueString:POSIXUser:", persona_unique_string, v9);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (a4 && !v13)
    *a4 = 0;

  return v14;
}

- (id)userIdentityForPersonaUniqueString:(id)a3 POSIXUser:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  os_unfair_lock_s *p_lock;
  void *v15;
  char v16;
  uint64_t v17;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MCMUserIdentityCache _refreshFromUserManagementIfNecessary](self, "_refreshFromUserManagementIfNecessary");
  if (objc_msgSend(v7, "isRoleUser"))
  {
    v8 = containermanager_copy_global_configuration();
    objc_msgSend(v8, "defaultUser");
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v9;
  }
  if (!objc_msgSend((id)objc_opt_class(), "personasAreSupported"))
  {
    -[MCMUserIdentityCache userIdentityForPersonalPersonaWithPOSIXUser:](self, "userIdentityForPersonalPersonaWithPOSIXUser:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (!v6)
  {
    -[MCMUserIdentityCache unspecificUserIdentity](self, "unspecificUserIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_16;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0C803F8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "isEqualToString:", v10);

  if (!v11)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    -[MCMUserIdentityCache _lock_userIdentityForCurrentUserWithPersonaUniqueString:](self, "_lock_userIdentityForCurrentUserWithPersonaUniqueString:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
    if (!v12)
      goto LABEL_16;
    goto LABEL_14;
  }
  -[MCMUserIdentityCache userIdentityForPersonalPersona](self, "userIdentityForPersonalPersona");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  container_log_handle_for_category();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v12, "debugDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412290;
    v21 = v19;
    _os_log_debug_impl(&dword_1CF807000, v13, OS_LOG_TYPE_DEBUG, "Sentinel persona, using: %@", (uint8_t *)&v20, 0xCu);

  }
  if (v12)
  {
LABEL_14:
    objc_msgSend(v12, "posixUser");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqual:", v7);

    if ((v16 & 1) == 0)
    {
      objc_msgSend(v12, "userIdentityWithPOSIXUser:", v7);
      v17 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v17;
    }
  }
LABEL_16:

  return v12;
}

- (id)userIdentityForPersonalPersonaWithPOSIXUser:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;

  v4 = a3;
  -[MCMUserIdentityCache _refreshFromUserManagementIfNecessary](self, "_refreshFromUserManagementIfNecessary");
  if (objc_msgSend(v4, "isRoleUser"))
  {
    v5 = containermanager_copy_global_configuration();
    objc_msgSend(v5, "defaultUser");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v6;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[MCMUserIdentityCache lock_userIdentityForPersonalPersona](self, "lock_userIdentityForPersonalPersona");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v8, "posixUser");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", v4);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v8, "userIdentityWithPOSIXUser:", v4);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11;
  }

  return v8;
}

- (MCMUserIdentity)lock_userIdentityForPersonalPersona
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_cacheInvalid)
    -[MCMUserIdentityCache _lock_resync](self, "_lock_resync");
  return self->_lock_userIdentityForPersonalPersona;
}

- (id)_lock_userIdentityForCurrentUserWithPersonaUniqueString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (v4)
  {
    -[MCMUserIdentityCache lock_personaUniqueStringToUserIdentityMap](self, "lock_personaUniqueStringToUserIdentityMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    container_log_handle_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v11;
      v15 = 2112;
      v16 = v4;
      _os_log_debug_impl(&dword_1CF807000, v7, OS_LOG_TYPE_DEBUG, "Found %@ for %@", (uint8_t *)&v13, 0x16u);

    }
    if (!v6)
    {
      -[MCMUserIdentityCache _lock_flush](self, "_lock_flush");
      -[MCMUserIdentityCache lock_personaUniqueStringToUserIdentityMap](self, "lock_personaUniqueStringToUserIdentityMap");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      container_log_handle_for_category();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v6, "shortDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412546;
        v14 = v12;
        v15 = 2112;
        v16 = v4;
        _os_log_debug_impl(&dword_1CF807000, v9, OS_LOG_TYPE_DEBUG, "After refresh, found %@ for %@", (uint8_t *)&v13, 0x16u);

      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSDictionary)lock_personaUniqueStringToUserIdentityMap
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_cacheInvalid)
    -[MCMUserIdentityCache _lock_resync](self, "_lock_resync");
  return self->_lock_personaUniqueStringToUserIdentityMap;
}

- (id)userIdentitiesForBundleIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[MCMUserIdentityCache _refreshFromUserManagementIfNecessary](self, "_refreshFromUserManagementIfNecessary");
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[MCMUserIdentityCache _lock_userIdentitiesForBundleIdentifier:](self, "_lock_userIdentitiesForBundleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  if (v6)
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)_lock_userIdentitiesForBundleIdentifier:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  -[MCMUserIdentityCache lock_bundleToDataSeparatedIdentitiesMap](self, "lock_bundleToDataSeparatedIdentitiesMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[MCMUserIdentityCache lock_userIdentityForPersonalPersona](self, "lock_userIdentityForPersonalPersona");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0C99E60];
    if (v8)
    {
      -[MCMUserIdentityCache lock_userIdentityForPersonalPersona](self, "lock_userIdentityForPersonalPersona");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setWithObject:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v7;
}

- (NSDictionary)lock_bundleToDataSeparatedIdentitiesMap
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_cacheInvalid)
    -[MCMUserIdentityCache _lock_resync](self, "_lock_resync");
  return self->_lock_bundleToDataSeparatedIdentitiesMap;
}

- (id)userIdentityWithPersonaID:(unsigned int)a3
{
  uint64_t v3;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v3 = *(_QWORD *)&a3;
  v20 = *MEMORY[0x1E0C80C00];
  -[MCMUserIdentityCache _refreshFromUserManagementIfNecessary](self, "_refreshFromUserManagementIfNecessary");
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[MCMUserIdentityCache lock_personaIDToUserIdentityMap](self, "lock_personaIDToUserIdentityMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v14;
    v18 = 1024;
    v19 = v3;
    _os_log_debug_impl(&dword_1CF807000, v9, OS_LOG_TYPE_DEBUG, "Found %@ for ID: %d", (uint8_t *)&v16, 0x12u);

  }
  if (!v8)
  {
    -[MCMUserIdentityCache _lock_flush](self, "_lock_flush");
    -[MCMUserIdentityCache lock_personaIDToUserIdentityMap](self, "lock_personaIDToUserIdentityMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    container_log_handle_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v8, "shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v15;
      v18 = 1024;
      v19 = v3;
      _os_log_debug_impl(&dword_1CF807000, v12, OS_LOG_TYPE_DEBUG, "After refresh, found %@ for ID: %d", (uint8_t *)&v16, 0x12u);

    }
  }
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (NSDictionary)lock_personaIDToUserIdentityMap
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_cacheInvalid)
    -[MCMUserIdentityCache _lock_resync](self, "_lock_resync");
  return self->_lock_personaIDToUserIdentityMap;
}

- (MCMUserIdentityCache)init
{
  MCMUserIdentityCache *v2;
  MCMUserIdentityCache *v3;
  uint64_t v4;
  NSHashTable *observers;
  OS_xpc_object *listener;
  uint64_t v7;
  NSSet *previousUserIdentities;
  dispatch_queue_t v9;
  OS_dispatch_queue *flushQueue;
  id v11;
  uint64_t v12;
  MCMContainerClassIterator *classIterator;
  uint64_t v14;
  MCMUserIdentity *defaultUserIdentity;
  objc_super v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)MCMUserIdentityCache;
  v2 = -[MCMUserIdentityCache init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v4;

    listener = v3->_listener;
    v3->_listener = 0;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    previousUserIdentities = v3->_previousUserIdentities;
    v3->_previousUserIdentities = (NSSet *)v7;

    v9 = dispatch_queue_create("com.apple.containermanagerd.MCMUserIdentityCache.flushQueue", 0);
    flushQueue = v3->_flushQueue;
    v3->_flushQueue = (OS_dispatch_queue *)v9;

    v11 = containermanager_copy_global_configuration();
    objc_msgSend(v11, "classIterator");
    v12 = objc_claimAutoreleasedReturnValue();
    classIterator = v3->_classIterator;
    v3->_classIterator = (MCMContainerClassIterator *)v12;

    *(_WORD *)&v3->_fetchedFromUM = 256;
    v14 = objc_opt_new();
    defaultUserIdentity = v3->_defaultUserIdentity;
    v3->_defaultUserIdentity = (MCMUserIdentity *)v14;

    os_unfair_lock_lock(&v3->_lock);
    -[MCMUserIdentityCache _lock_flush](v3, "_lock_flush");
    os_unfair_lock_unlock(&v3->_lock);
  }
  return v3;
}

- (id)unspecificUserIdentity
{
  os_unfair_lock_s *p_lock;
  void *v4;

  -[MCMUserIdentityCache _refreshFromUserManagementIfNecessary](self, "_refreshFromUserManagementIfNecessary");
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[MCMUserIdentityCache lock_userIdentityForUnspecificPersona](self, "lock_userIdentityForUnspecificPersona");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)flush
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[MCMUserIdentityCache _lock_flush](self, "_lock_flush");
  -[MCMUserIdentityCache _lock_resync](self, "_lock_resync");
  os_unfair_lock_unlock(p_lock);
}

- (void)forEachAccessibleUserIdentitySynchronouslyExecuteBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  -[MCMUserIdentityCache allAccessibleUserIdentities](self, "allAccessibleUserIdentities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v7);
  }

}

- (id)userIdentityForContainerConfig:(id)a3 originatorUserIdentity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if ((objc_msgSend(v6, "personaAndUserSpecific") & 1) == 0)
  {
    if (objc_msgSend(v6, "usesGlobalBundleUserIdentity"))
    {
      -[MCMUserIdentityCache globalBundleUserIdentity](self, "globalBundleUserIdentity");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v6, "usesGlobalSystemUserIdentity"))
        -[MCMUserIdentityCache globalSystemUserIdentity](self, "globalSystemUserIdentity");
      else
        -[MCMUserIdentityCache defaultUserIdentity](self, "defaultUserIdentity");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v9;

  }
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[MCMUserIdentityCache defaultUserIdentity](self, "defaultUserIdentity");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (id)userIdentitiesForContainerConfig:(id)a3 originatorUserIdentities:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if ((objc_msgSend(v6, "personaAndUserSpecific") & 1) == 0)
  {
    -[MCMUserIdentityCache userIdentityForContainerConfig:originatorUserIdentity:](self, "userIdentityForContainerConfig:originatorUserIdentity:", v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C99E60];
    -[MCMUserIdentityCache defaultUserIdentity](self, "defaultUserIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithObject:", v12);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)globalBundleUserIdentity
{
  return (id)objc_msgSend((id)objc_opt_class(), "globalBundleUserIdentity");
}

- (id)userIdentityForCurrentContext
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  -[MCMUserIdentityCache personaUniqueStringForCurrentContext](self, "personaUniqueStringForCurrentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = containermanager_copy_global_configuration();
  objc_msgSend(v4, "defaultUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMUserIdentityCache userIdentityForPersonaUniqueString:POSIXUser:](self, "userIdentityForPersonaUniqueString:POSIXUser:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)userIdentityForLegacyMobileUser
{
  return -[MCMUserIdentityCache defaultUserIdentity](self, "defaultUserIdentity");
}

- (void)flushAndRepopulateWithUserIdentities:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[MCMUserIdentityCache _lock_flushAndRepopulateWithUserIdentities:](self, "_lock_flushAndRepopulateWithUserIdentities:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)addObserver:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MCMUserIdentityCache observers](self, "observers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  -[MCMUserIdentityCache observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  objc_sync_exit(v4);
}

- (void)removeObserver:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MCMUserIdentityCache observers](self, "observers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  -[MCMUserIdentityCache observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v6);

  objc_sync_exit(v4);
}

- (id)managedUserPathRegistryForUserIdentity:(id)a3
{
  id v4;
  MCMManagedUserPathRegistry *v5;
  MCMManagedUserPathRegistry *v6;
  id v7;
  void *v8;

  v4 = a3;
  if (!v4)
  {
    -[MCMUserIdentityCache defaultUserIdentity](self, "defaultUserIdentity");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_lock_managedPathRegistryForUserIdentity, "objectForKeyedSubscript:", v4);
  v5 = (MCMManagedUserPathRegistry *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  if (!v5)
  {
    v6 = [MCMManagedUserPathRegistry alloc];
    v7 = containermanager_copy_global_configuration();
    objc_msgSend(v7, "currentUser");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MCMManagedUserPathRegistry initWithUserIdentity:daemonUser:](v6, "initWithUserIdentity:daemonUser:", v4, v8);

    os_unfair_lock_lock(&self->_lock);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lock_managedPathRegistryForUserIdentity, "setObject:forKeyedSubscript:", v5, v4);
    os_unfair_lock_unlock(&self->_lock);
  }

  return v5;
}

- (MCMUserIdentity)lock_userIdentityForUnspecificPersona
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_cacheInvalid)
    -[MCMUserIdentityCache _lock_resync](self, "_lock_resync");
  return self->_lock_userIdentityForUnspecificPersona;
}

- (void)_lock_resync
{
  void *v3;
  double Current;
  void *v5;
  id v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void *v8;
  double v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL firstFetch;
  NSObject *flushQueue;
  id v16;
  _QWORD block[5];
  id v18;
  _BYTE *v19;
  BOOL v20;
  id v21;
  _BYTE buf[24];
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = (void *)MEMORY[0x1D17D7010]();
  if (objc_msgSend((id)objc_opt_class(), "personasAreSupported") && objc_opt_class())
  {
    Current = CFAbsoluteTimeGetCurrent();
    +[MCMTestLocks sharedInstance](MCMTestLocks, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "countOfLock:", 13) < 1)
    {
      objc_msgSend(MEMORY[0x1E0DC5EE0], "sharedManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      objc_msgSend(v8, "listAllPersonaAttributesWithError:", &v21);
      v7 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      v6 = v21;

    }
    else
    {
      objc_msgSend(v5, "releaseLock:", 13);
      v6 = 0;
      v7 = 0;
    }
    v9 = CFAbsoluteTimeGetCurrent();
    container_log_handle_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      *(double *)&buf[4] = v9 - Current;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2114;
      v23 = v7;
      _os_log_impl(&dword_1CF807000, v10, OS_LOG_TYPE_DEFAULT, "listAllPersonaAttributes (%f s): error = %{public}@, attributes = %{public}@", buf, 0x20u);
    }

    if (v7 && objc_msgSend(v7, "count"))
    {
      self->_fetchedFromUM = -[MCMUserIdentityCache _lock_resync_fromUserPersonaAttributes:](self, "_lock_resync_fromUserPersonaAttributes:", v7);
      v11 = (void *)MEMORY[0x1E0C99E60];
      -[NSDictionary allValues](self->_lock_personaUniqueStringToUserIdentityMap, "allValues");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWithArray:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v23 = __Block_byref_object_copy__10310;
      v24 = __Block_byref_object_dispose__10311;
      v25 = (id)os_transaction_create();
      firstFetch = self->_firstFetch;
      flushQueue = self->_flushQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __36__MCMUserIdentityCache__lock_resync__block_invoke;
      block[3] = &unk_1E8CB5FB0;
      v18 = v13;
      v19 = buf;
      block[4] = self;
      v20 = firstFetch;
      v16 = v13;
      dispatch_async(flushQueue, block);

      _Block_object_dispose(buf, 8);
    }
    self->_firstFetch = 0;

  }
  objc_autoreleasePoolPop(v3);
  self->_cacheInvalid = 0;
}

- (void)_lock_flush
{
  NSDictionary *v3;
  NSDictionary *lock_bundleToDataSeparatedIdentitiesMap;
  NSDictionary *v5;
  NSDictionary *lock_personaUniqueStringToUserIdentityMap;
  NSDictionary *v7;
  NSDictionary *lock_personaIDToUserIdentityMap;
  MCMUserIdentity *v9;
  MCMUserIdentity *lock_userIdentityForPersonalPersona;
  MCMUserIdentity *v11;
  MCMUserIdentity *lock_userIdentityForUnspecificPersona;
  NSMutableDictionary *v13;
  NSMutableDictionary *lock_managedPathRegistryForUserIdentity;
  NSMutableDictionary *v15;
  NSMutableDictionary *lock_libraryRepairForUserIdentity;

  os_unfair_lock_assert_owner(&self->_lock);
  self->_cacheInvalid = 1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  lock_bundleToDataSeparatedIdentitiesMap = self->_lock_bundleToDataSeparatedIdentitiesMap;
  self->_lock_bundleToDataSeparatedIdentitiesMap = v3;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  lock_personaUniqueStringToUserIdentityMap = self->_lock_personaUniqueStringToUserIdentityMap;
  self->_lock_personaUniqueStringToUserIdentityMap = v5;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  lock_personaIDToUserIdentityMap = self->_lock_personaIDToUserIdentityMap;
  self->_lock_personaIDToUserIdentityMap = v7;

  -[MCMUserIdentityCache defaultUserIdentity](self, "defaultUserIdentity");
  v9 = (MCMUserIdentity *)objc_claimAutoreleasedReturnValue();
  lock_userIdentityForPersonalPersona = self->_lock_userIdentityForPersonalPersona;
  self->_lock_userIdentityForPersonalPersona = v9;

  -[MCMUserIdentityCache defaultUserIdentity](self, "defaultUserIdentity");
  v11 = (MCMUserIdentity *)objc_claimAutoreleasedReturnValue();
  lock_userIdentityForUnspecificPersona = self->_lock_userIdentityForUnspecificPersona;
  self->_lock_userIdentityForUnspecificPersona = v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  lock_managedPathRegistryForUserIdentity = self->_lock_managedPathRegistryForUserIdentity;
  self->_lock_managedPathRegistryForUserIdentity = v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  lock_libraryRepairForUserIdentity = self->_lock_libraryRepairForUserIdentity;
  self->_lock_libraryRepairForUserIdentity = v15;

}

- (void)_lock_flushAndRepopulateWithUserIdentities:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  MCMUserIdentity *v9;
  MCMUserIdentity *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  MCMUserIdentity *v14;
  MCMUserIdentity *v15;
  void *v16;
  void *v17;
  void *v18;
  MCMUserIdentityCache *v19;
  MCMUserIdentity *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSDictionary *lock_bundleToDataSeparatedIdentitiesMap;
  uint64_t v26;
  NSDictionary *lock_personaUniqueStringToUserIdentityMap;
  uint64_t v28;
  NSDictionary *lock_personaIDToUserIdentityMap;
  MCMUserIdentity *lock_userIdentityForPersonalPersona;
  MCMUserIdentity *v31;
  MCMUserIdentity *lock_userIdentityForUnspecificPersona;
  MCMUserIdentity *v33;
  MCMUserIdentityCache *v34;
  id obj;
  _BYTE v36[128];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v34 = self;
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v38 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isDataSeparated", v34) & 1) == 0 && (objc_msgSend(v13, "isNoSpecificPersona") & 1) == 0)
        {
          v14 = v13;

          v10 = v14;
        }
        if (objc_msgSend(v13, "isNoSpecificPersona"))
        {
          v15 = v13;

          v9 = v15;
        }
        objc_msgSend(v13, "personaUniqueString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v13, "personaUniqueString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v17);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v13, "kernelPersonaID"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, v18);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }

  v19 = v34;
  objc_msgSend((id)objc_opt_class(), "personasAreSupported");
  if (v10)
  {
    if (!v9)
      goto LABEL_22;
  }
  else
  {
    v10 = v9;
    v9 = v10;
    if (!v10)
    {
      -[MCMUserIdentityCache defaultUserIdentity](v34, "defaultUserIdentity");
      v10 = (MCMUserIdentity *)objc_claimAutoreleasedReturnValue();
LABEL_22:
      v20 = [MCMUserIdentity alloc];
      -[MCMUserIdentity posixUser](v10, "posixUser");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMUserIdentity homeDirectoryURL](v10, "homeDirectoryURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMUserIdentity personaUniqueString](v10, "personaUniqueString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[MCMUserIdentity initWithPOSIXUser:homeDirectoryURL:personaUniqueString:personaType:kernelPersonaID:](v20, "initWithPOSIXUser:homeDirectoryURL:personaUniqueString:personaType:kernelPersonaID:", v21, v22, v23, 2, -[MCMUserIdentity kernelPersonaID](v10, "kernelPersonaID"));

    }
  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary", v34);
  v24 = objc_claimAutoreleasedReturnValue();
  lock_bundleToDataSeparatedIdentitiesMap = v19->_lock_bundleToDataSeparatedIdentitiesMap;
  v19->_lock_bundleToDataSeparatedIdentitiesMap = (NSDictionary *)v24;

  v26 = objc_msgSend(v5, "copy");
  lock_personaUniqueStringToUserIdentityMap = v19->_lock_personaUniqueStringToUserIdentityMap;
  v19->_lock_personaUniqueStringToUserIdentityMap = (NSDictionary *)v26;

  v28 = objc_msgSend(v6, "copy");
  lock_personaIDToUserIdentityMap = v19->_lock_personaIDToUserIdentityMap;
  v19->_lock_personaIDToUserIdentityMap = (NSDictionary *)v28;

  lock_userIdentityForPersonalPersona = v19->_lock_userIdentityForPersonalPersona;
  v19->_lock_userIdentityForPersonalPersona = v10;
  v31 = v10;

  lock_userIdentityForUnspecificPersona = v19->_lock_userIdentityForUnspecificPersona;
  v19->_lock_userIdentityForUnspecificPersona = v9;
  v33 = v9;

  v19->_cacheInvalid = 0;
}

- (BOOL)_lock_resync_fromUserPersonaAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  void *v17;
  NSObject *v18;
  void *v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  int v41;
  int v42;
  int v43;
  int v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  NSObject *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  int v62;
  NSObject *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t k;
  uint64_t v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t m;
  uint64_t v79;
  void *v80;
  int v81;
  int v82;
  int v83;
  int v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t n;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  NSDictionary *lock_bundleToDataSeparatedIdentitiesMap;
  uint64_t v94;
  NSDictionary *lock_personaUniqueStringToUserIdentityMap;
  uint64_t v96;
  NSDictionary *lock_personaIDToUserIdentityMap;
  MCMUserIdentity *lock_userIdentityForUnspecificPersona;
  NSObject *v99;
  NSDictionary *v101;
  __int128 v102;
  uint64_t v103;
  id obj;
  MCMUserIdentityCache *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  os_log_t log;
  id v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  id v116;
  id v117;
  _BYTE v118[128];
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _BYTE v123[128];
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  _BYTE v128[128];
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _BYTE v133[128];
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  _BYTE v138[128];
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  uint8_t buf[4];
  _BYTE v144[32];
  _BYTE v145[128];
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  uint64_t v150;

  v150 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v105 = self;
  os_unfair_lock_assert_owner(&self->_lock);
  v103 = MEMORY[0x1D17D7010]();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = 0u;
  v147 = 0u;
  v148 = 0u;
  v149 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v146, v145, 16);
  if (!v7)
    goto LABEL_11;
  v8 = v7;
  v9 = *(_QWORD *)v147;
  v108 = v6;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v147 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * i);
      container_log_handle_for_category();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v13 = objc_msgSend(v11, "isUniversalPersona");
        v14 = objc_msgSend(v11, "isSystemPersona");
        v15 = objc_msgSend(v11, "isPersonalPersona");
        v16 = objc_msgSend(v11, "isDataSeparatedPersona");
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)v144 = v13;
        *(_WORD *)&v144[4] = 1024;
        *(_DWORD *)&v144[6] = v14;
        *(_WORD *)&v144[10] = 1024;
        *(_DWORD *)&v144[12] = v15;
        v6 = v108;
        *(_WORD *)&v144[16] = 1024;
        *(_DWORD *)&v144[18] = v16;
        *(_WORD *)&v144[22] = 2112;
        *(_QWORD *)&v144[24] = v11;
        _os_log_debug_impl(&dword_1CF807000, v12, OS_LOG_TYPE_DEBUG, "[Personal] Looking at universal=%d system=%d personal=%d ds=%d attributes: %@", buf, 0x24u);
      }

      if (objc_msgSend(v11, "isPersonalPersona"))
      {
        objc_msgSend(v11, "userPersonaUniqueString");
        v21 = objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v22 = (void *)v21;
          objc_msgSend((id)objc_opt_class(), "userIdentityWithPersonaAttributes:", v11);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "userIdentityWithPersonaAttributes:forceUnspecific:", v11, 1);
          log = (os_log_t)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            container_log_handle_for_category();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v144 = v22;
              *(_WORD *)&v144[8] = 2112;
              *(_QWORD *)&v144[10] = v11;
              _os_log_fault_impl(&dword_1CF807000, v24, OS_LOG_TYPE_FAULT, "Persona with duplicate unique string [%@]: %@", buf, 0x16u);
            }

          }
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, v22);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v11, "userPersona_id"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "setObject:forKeyedSubscript:", v17, v25);

          container_log_handle_for_category();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)v144 = v11;
            *(_WORD *)&v144[8] = 2112;
            *(_QWORD *)&v144[10] = v17;
            *(_WORD *)&v144[18] = 2112;
            *(_QWORD *)&v144[20] = log;
            _os_log_impl(&dword_1CF807000, v26, OS_LOG_TYPE_DEFAULT, "Found personal persona %@: created personal %@, unspecific %@", buf, 0x20u);
          }

          if (!v17 || !log)
            goto LABEL_12;
          v142 = 0u;
          v141 = 0u;
          v140 = 0u;
          v139 = 0u;
          v116 = obj;
          v27 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v139, v138, 16);
          v113 = v17;
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v140;
            do
            {
              for (j = 0; j != v28; ++j)
              {
                if (*(_QWORD *)v140 != v29)
                  objc_enumerationMutation(v116);
                v31 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * j);
                container_log_handle_for_category();
                v32 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                {
                  v41 = objc_msgSend(v31, "isUniversalPersona");
                  v42 = objc_msgSend(v31, "isSystemPersona");
                  v43 = objc_msgSend(v31, "isPersonalPersona");
                  v44 = objc_msgSend(v31, "isDataSeparatedPersona");
                  *(_DWORD *)buf = 67110146;
                  *(_DWORD *)v144 = v41;
                  *(_WORD *)&v144[4] = 1024;
                  *(_DWORD *)&v144[6] = v42;
                  v6 = v108;
                  *(_WORD *)&v144[10] = 1024;
                  *(_DWORD *)&v144[12] = v43;
                  v17 = v113;
                  *(_WORD *)&v144[16] = 1024;
                  *(_DWORD *)&v144[18] = v44;
                  *(_WORD *)&v144[22] = 2112;
                  *(_QWORD *)&v144[24] = v31;
                  _os_log_debug_impl(&dword_1CF807000, v32, OS_LOG_TYPE_DEBUG, "[Multi] Looking at universal=%d system=%d personal=%d ds=%d attributes: %@", buf, 0x24u);
                }

                if ((objc_msgSend(v31, "isPersonalPersona") & 1) == 0
                  && (objc_msgSend(v31, "isDataSeparatedPersona") & 1) == 0)
                {
                  objc_msgSend(v31, "userPersonaBundleIDList");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  container_log_handle_for_category();
                  v34 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                  {
                    v35 = objc_msgSend(v31, "userPersona_id");
                    *(_DWORD *)buf = 67109634;
                    *(_DWORD *)v144 = v35;
                    *(_WORD *)&v144[4] = 2112;
                    *(_QWORD *)&v144[6] = v31;
                    *(_WORD *)&v144[14] = 2112;
                    *(_QWORD *)&v144[16] = v33;
                    _os_log_impl(&dword_1CF807000, v34, OS_LOG_TYPE_DEFAULT, "Fetched bundle ID list for (%d) %@: %@", buf, 0x1Cu);
                  }

                  if (v33 && objc_msgSend(v33, "count"))
                  {
                    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v33);
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v109, "unionSet:", v36);

                  }
                  objc_msgSend(v31, "userPersonaUniqueString");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v37)
                  {
                    objc_msgSend(v6, "objectForKeyedSubscript:", v37);
                    v38 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v38)
                    {
                      container_log_handle_for_category();
                      v39 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = 138412546;
                        *(_QWORD *)v144 = v37;
                        *(_WORD *)&v144[8] = 2112;
                        *(_QWORD *)&v144[10] = v31;
                        _os_log_fault_impl(&dword_1CF807000, v39, OS_LOG_TYPE_FAULT, "Persona with duplicate unique string [%@]: %@", buf, 0x16u);
                      }

                    }
                    objc_msgSend(v6, "setObject:forKeyedSubscript:", log, v37);
                  }
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v31, "userPersona_id"));
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v112, "setObject:forKeyedSubscript:", log, v40);

                  v17 = v113;
                }
              }
              v28 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v139, v138, 16);
            }
            while (v28);
          }

          v136 = 0u;
          v137 = 0u;
          v134 = 0u;
          v135 = 0u;
          v111 = v116;
          v45 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v134, v133, 16);
          if (v45)
          {
            v47 = v45;
            v48 = *(_QWORD *)v135;
            *(_QWORD *)&v46 = 138412290;
            v102 = v46;
            v106 = *(_QWORD *)v135;
            do
            {
              v49 = 0;
              v107 = v47;
              do
              {
                if (*(_QWORD *)v135 != v48)
                  objc_enumerationMutation(v111);
                v50 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * v49);
                if (objc_msgSend(v50, "isDataSeparatedPersona", v102))
                {
                  container_log_handle_for_category();
                  v51 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
                  {
                    v81 = objc_msgSend(v50, "isUniversalPersona");
                    v82 = objc_msgSend(v50, "isSystemPersona");
                    v83 = objc_msgSend(v50, "isPersonalPersona");
                    v84 = objc_msgSend(v50, "isDataSeparatedPersona");
                    *(_DWORD *)buf = 67110146;
                    *(_DWORD *)v144 = v81;
                    *(_WORD *)&v144[4] = 1024;
                    *(_DWORD *)&v144[6] = v82;
                    v48 = v106;
                    v47 = v107;
                    *(_WORD *)&v144[10] = 1024;
                    *(_DWORD *)&v144[12] = v83;
                    *(_WORD *)&v144[16] = 1024;
                    *(_DWORD *)&v144[18] = v84;
                    *(_WORD *)&v144[22] = 2112;
                    *(_QWORD *)&v144[24] = v50;
                    _os_log_debug_impl(&dword_1CF807000, v51, OS_LOG_TYPE_DEBUG, "[DS] Looking at universal=%d system=%d personal=%d ds=%d attributes: %@", buf, 0x24u);
                  }

                  objc_msgSend(v50, "userPersonaUniqueString");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v52)
                  {
                    objc_msgSend((id)objc_opt_class(), "userIdentityWithPersonaAttributes:", v50);
                    v53 = objc_claimAutoreleasedReturnValue();
                    container_log_handle_for_category();
                    v54 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      *(_QWORD *)v144 = v52;
                      *(_WORD *)&v144[8] = 2112;
                      *(_QWORD *)&v144[10] = v53;
                      _os_log_impl(&dword_1CF807000, v54, OS_LOG_TYPE_DEFAULT, "Creating user identity for %@: %@", buf, 0x16u);
                    }

                    objc_msgSend(v6, "objectForKeyedSubscript:", v52);
                    v55 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v55)
                    {
                      container_log_handle_for_category();
                      v56 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = 138412546;
                        *(_QWORD *)v144 = v52;
                        *(_WORD *)&v144[8] = 2112;
                        *(_QWORD *)&v144[10] = v50;
                        _os_log_fault_impl(&dword_1CF807000, v56, OS_LOG_TYPE_FAULT, "Persona with duplicate unique string [%@]: %@", buf, 0x16u);
                      }

                    }
                    objc_msgSend(v6, "setObject:forKeyedSubscript:", v53, v52);
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v50, "userPersona_id"));
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v112, "setObject:forKeyedSubscript:", v53, v57);

                    objc_msgSend(v50, "sandboxExtensionForPersonaLayoutPath");
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    v115 = v58;
                    if (v58)
                    {
                      objc_msgSend(objc_retainAutorelease(v58), "UTF8String");
                      v59 = sandbox_extension_consume();
                      if (v59 < 0)
                      {
                        v60 = *__error();
                        container_log_handle_for_category();
                        v61 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                        {
                          v62 = *__error();
                          *(_DWORD *)buf = 67109120;
                          *(_DWORD *)v144 = v62;
                          _os_log_impl(&dword_1CF807000, v61, OS_LOG_TYPE_DEFAULT, "Error %d consuming sandbox extension", buf, 8u);
                        }
                        v59 = -v60;

                      }
                      -[NSObject setExtensionHandle:](v53, "setExtensionHandle:", v59);
                    }
                    else
                    {
                      container_log_handle_for_category();
                      v63 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
                      {
                        objc_msgSend(v50, "personaLayoutPathURL");
                        v64 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543618;
                        *(_QWORD *)v144 = v52;
                        *(_WORD *)&v144[8] = 2114;
                        *(_QWORD *)&v144[10] = v64;
                        _os_log_impl(&dword_1CF807000, v63, OS_LOG_TYPE_DEFAULT, "Error fetching sandbox extension for persona %{public}@, path %{public}@", buf, 0x16u);

                      }
                    }
                    v117 = v52;
                    objc_msgSend(v50, "userPersonaBundleIDList");
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    container_log_handle_for_category();
                    v66 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      *(_QWORD *)v144 = v50;
                      *(_WORD *)&v144[8] = 2112;
                      *(_QWORD *)&v144[10] = v65;
                      _os_log_impl(&dword_1CF807000, v66, OS_LOG_TYPE_DEFAULT, "Fetched bundle ID list for data separated persona %@: %@", buf, 0x16u);
                    }

                    v114 = v65;
                    if (v65 && objc_msgSend(v65, "count"))
                    {
                      v131 = 0u;
                      v132 = 0u;
                      v129 = 0u;
                      v130 = 0u;
                      v67 = v65;
                      v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v129, v128, 16);
                      if (v68)
                      {
                        v69 = v68;
                        v70 = *(_QWORD *)v130;
                        do
                        {
                          for (k = 0; k != v69; ++k)
                          {
                            if (*(_QWORD *)v130 != v70)
                              objc_enumerationMutation(v67);
                            v72 = *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * k);
                            objc_msgSend(v5, "objectForKeyedSubscript:", v72);
                            v73 = (void *)objc_claimAutoreleasedReturnValue();
                            if (!v73)
                            {
                              objc_msgSend(MEMORY[0x1E0C99E20], "set");
                              v73 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v5, "setObject:forKeyedSubscript:", v73, v72);
                            }
                            objc_msgSend(v73, "addObject:", v53);

                          }
                          v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v129, v128, 16);
                        }
                        while (v69);
                      }

                    }
                    v126 = 0u;
                    v127 = 0u;
                    v124 = 0u;
                    v125 = 0u;
                    v74 = v109;
                    v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v124, v123, 16);
                    if (v75)
                    {
                      v76 = v75;
                      v77 = *(_QWORD *)v125;
                      do
                      {
                        for (m = 0; m != v76; ++m)
                        {
                          if (*(_QWORD *)v125 != v77)
                            objc_enumerationMutation(v74);
                          v79 = *(_QWORD *)(*((_QWORD *)&v124 + 1) + 8 * m);
                          objc_msgSend(v5, "objectForKeyedSubscript:", v79);
                          v80 = (void *)objc_claimAutoreleasedReturnValue();
                          if (!v80)
                          {
                            objc_msgSend(MEMORY[0x1E0C99E20], "set");
                            v80 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v5, "setObject:forKeyedSubscript:", v80, v79);
                          }
                          objc_msgSend(v80, "addObject:", v53);

                        }
                        v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v124, v123, 16);
                      }
                      while (v76);
                    }

                    v47 = v107;
                    v6 = v108;
                    v17 = v113;
                    v48 = v106;
                    v52 = v117;
                  }
                  else
                  {
                    container_log_handle_for_category();
                    v53 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = v102;
                      *(_QWORD *)v144 = v50;
                      _os_log_fault_impl(&dword_1CF807000, v53, OS_LOG_TYPE_FAULT, "Invalid persona unique string for %@", buf, 0xCu);
                    }
                  }

                }
                ++v49;
              }
              while (v49 != v47);
              v47 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v134, v133, 16);
            }
            while (v47);
          }

          v121 = 0u;
          v122 = 0u;
          v119 = 0u;
          v120 = 0u;
          v85 = v109;
          v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v119, v118, 16);
          if (v86)
          {
            v87 = v86;
            v88 = *(_QWORD *)v120;
            do
            {
              for (n = 0; n != v87; ++n)
              {
                if (*(_QWORD *)v120 != v88)
                  objc_enumerationMutation(v85);
                v90 = *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * n);
                objc_msgSend(v5, "objectForKeyedSubscript:", v90);
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v91)
                {
                  objc_msgSend(MEMORY[0x1E0C99E20], "set");
                  v91 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "setObject:forKeyedSubscript:", v91, v90);
                }
                objc_msgSend(v91, "addObject:", v17);

              }
              v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v119, v118, 16);
            }
            while (v87);
          }

          v92 = objc_msgSend(v5, "copy");
          lock_bundleToDataSeparatedIdentitiesMap = v105->_lock_bundleToDataSeparatedIdentitiesMap;
          v105->_lock_bundleToDataSeparatedIdentitiesMap = (NSDictionary *)v92;

          v94 = objc_msgSend(v6, "copy");
          lock_personaUniqueStringToUserIdentityMap = v105->_lock_personaUniqueStringToUserIdentityMap;
          v105->_lock_personaUniqueStringToUserIdentityMap = (NSDictionary *)v94;

          v96 = objc_msgSend(v112, "copy");
          lock_personaIDToUserIdentityMap = v105->_lock_personaIDToUserIdentityMap;
          v105->_lock_personaIDToUserIdentityMap = (NSDictionary *)v96;

          objc_storeStrong((id *)&v105->_lock_userIdentityForPersonalPersona, v17);
          lock_userIdentityForUnspecificPersona = v105->_lock_userIdentityForUnspecificPersona;
          v105->_lock_userIdentityForUnspecificPersona = (MCMUserIdentity *)log;
          log = log;

          container_log_handle_for_category();
          v99 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
          {
            v101 = v105->_lock_personaUniqueStringToUserIdentityMap;
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v144 = v101;
            _os_log_debug_impl(&dword_1CF807000, v99, OS_LOG_TYPE_DEBUG, "User identities locked in: %@", buf, 0xCu);
          }

          v20 = 1;
        }
        else
        {
          container_log_handle_for_category();
          log = (os_log_t)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(log, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v144 = v11;
            _os_log_fault_impl(&dword_1CF807000, log, OS_LOG_TYPE_FAULT, "Invalid persona unique string for personal %@", buf, 0xCu);
          }
          v20 = 0;
          v17 = obj;
        }
        v19 = (void *)v103;
        goto LABEL_116;
      }
    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v146, v145, 16);
    if (v8)
      continue;
    break;
  }
LABEL_11:

  log = 0;
  v17 = 0;
LABEL_12:
  container_log_handle_for_category();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v103;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v144 = obj;
    _os_log_fault_impl(&dword_1CF807000, v18, OS_LOG_TYPE_FAULT, "Expected to find a personal persona in %@", buf, 0xCu);
  }

  v20 = 0;
LABEL_116:

  objc_autoreleasePoolPop(v19);
  return v20;
}

- (void)_notifyObserversOfChangesWithUserIdentities:(id)a3 firstFetch:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  NSObject *v32;
  objc_class *v33;
  void *v34;
  void *context;
  id v36;
  id obj;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE v43[128];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  uint64_t v53;
  _BYTE v54[128];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  context = (void *)MEMORY[0x1D17D7010]();
  -[MCMUserIdentityCache observers](self, "observers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v6);
  -[MCMUserIdentityCache observers](self, "observers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v6);
  v40 = (void *)objc_msgSend(v36, "mutableCopy");
  -[MCMUserIdentityCache previousUserIdentities](self, "previousUserIdentities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "minusSet:", v9);

  -[MCMUserIdentityCache previousUserIdentities](self, "previousUserIdentities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "mutableCopy");

  v39 = (void *)v11;
  v12 = (void *)v11;
  v13 = v36;
  objc_msgSend(v12, "minusSet:", v36);
  if (!a4)
  {
    -[MCMUserIdentityCache previousUserIdentities](self, "previousUserIdentities");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "count"))
    {
      v13 = v36;
      v15 = objc_msgSend(v36, "count");

      if (!v15)
        goto LABEL_6;
      -[MCMUserIdentityCache defaultUserIdentity](self, "defaultUserIdentity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addObject:", v14);
    }

    v13 = v36;
  }
LABEL_6:
  -[MCMUserIdentityCache setPreviousUserIdentities:](self, "setPreviousUserIdentities:", v13);
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v8;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v59, 16);
  if (v41)
  {
    v38 = *(_QWORD *)v61;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v61 != v38)
        {
          v17 = v16;
          objc_enumerationMutation(obj);
          v16 = v17;
        }
        v42 = v16;
        v18 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v16);
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v19 = v39;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v55, v54, 16);
        if (v20)
        {
          v21 = *(_QWORD *)v56;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v56 != v21)
                objc_enumerationMutation(v19);
              v23 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
              container_log_handle_for_category();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                v25 = (objc_class *)objc_opt_class();
                NSStringFromClass(v25);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218498;
                v49 = v18;
                v50 = 2112;
                v51 = v26;
                v52 = 2112;
                v53 = v23;
                _os_log_impl(&dword_1CF807000, v24, OS_LOG_TYPE_DEFAULT, "Notifying observer <0x%p; %@> about an invalid user identity: %@",
                  buf,
                  0x20u);

              }
              objc_msgSend(v18, "userIdentityCache:didInvalidateUserIdentity:", self, v23);
            }
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v55, v54, 16);
          }
          while (v20);
        }

        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v27 = v40;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v43, 16);
        if (v28)
        {
          v29 = *(_QWORD *)v45;
          do
          {
            for (j = 0; j != v28; ++j)
            {
              if (*(_QWORD *)v45 != v29)
                objc_enumerationMutation(v27);
              v31 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j);
              container_log_handle_for_category();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                v33 = (objc_class *)objc_opt_class();
                NSStringFromClass(v33);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218498;
                v49 = v18;
                v50 = 2112;
                v51 = v34;
                v52 = 2112;
                v53 = v31;
                _os_log_impl(&dword_1CF807000, v32, OS_LOG_TYPE_DEFAULT, "Notifying observer <0x%p; %@> about a new user identity: %@",
                  buf,
                  0x20u);

              }
              objc_msgSend(v18, "userIdentityCache:didAddUserIdentity:", self, v31);
            }
            v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v43, 16);
          }
          while (v28);
        }

        v16 = v42 + 1;
      }
      while (v42 + 1 != v41);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v59, 16);
    }
    while (v41);
  }

  objc_autoreleasePoolPop(context);
}

- (NSMutableDictionary)lock_managedPathRegistryForUserIdentity
{
  return self->_lock_managedPathRegistryForUserIdentity;
}

- (NSMutableDictionary)lock_libraryRepairForUserIdentity
{
  return self->_lock_libraryRepairForUserIdentity;
}

- (NSSet)previousUserIdentities
{
  return self->_previousUserIdentities;
}

- (void)setPreviousUserIdentities:(id)a3
{
  objc_storeStrong((id *)&self->_previousUserIdentities, a3);
}

- (MCMContainerClassIterator)classIterator
{
  return self->_classIterator;
}

- (MCMUserIdentity)defaultUserIdentity
{
  return self->_defaultUserIdentity;
}

- (BOOL)cacheInvalid
{
  return self->_cacheInvalid;
}

- (void)setCacheInvalid:(BOOL)a3
{
  self->_cacheInvalid = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (unint64_t)savedGeneration
{
  return self->_savedGeneration;
}

- (void)setSavedGeneration:(unint64_t)a3
{
  self->_savedGeneration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_defaultUserIdentity, 0);
  objc_storeStrong((id *)&self->_classIterator, 0);
  objc_storeStrong((id *)&self->_previousUserIdentities, 0);
  objc_storeStrong((id *)&self->_lock_libraryRepairForUserIdentity, 0);
  objc_storeStrong((id *)&self->_lock_managedPathRegistryForUserIdentity, 0);
  objc_storeStrong((id *)&self->_lock_userIdentityForUnspecificPersona, 0);
  objc_storeStrong((id *)&self->_lock_userIdentityForPersonalPersona, 0);
  objc_storeStrong((id *)&self->_lock_personaIDToUserIdentityMap, 0);
  objc_storeStrong((id *)&self->_lock_personaUniqueStringToUserIdentityMap, 0);
  objc_storeStrong((id *)&self->_lock_bundleToDataSeparatedIdentitiesMap, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_flushQueue, 0);
}

void __36__MCMUserIdentityCache__lock_resync__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfChangesWithUserIdentities:firstFetch:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __60__MCMUserIdentityCache_personaUniqueStringForCurrentContext__block_invoke()
{
  MCMLRUCache *v0;
  void *v1;

  v0 = -[MCMLRUCache initWithName:maxCount:]([MCMLRUCache alloc], "initWithName:maxCount:", CFSTR("personaUniqueStrings"), 10);
  v1 = (void *)personaUniqueStringForCurrentContext_dedupCache;
  personaUniqueStringForCurrentContext_dedupCache = (uint64_t)v0;

}

+ (id)defaultUserIdentity
{
  void *v2;
  void *v3;

  +[MCMUserIdentitySharedCache sharedInstance](MCMUserIdentitySharedCache, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultUserIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)globalBundleUserIdentity
{
  if (globalBundleUserIdentity_onceToken != -1)
    dispatch_once(&globalBundleUserIdentity_onceToken, &__block_literal_global_10344);
  return (id)globalBundleUserIdentity_userIdentity;
}

+ (id)userIdentityWithPersonaAttributes:(id)a3
{
  return (id)objc_msgSend(a1, "userIdentityWithPersonaAttributes:forceUnspecific:", a3, 0);
}

+ (id)userIdentityWithPersonaAttributes:(id)a3 forceUnspecific:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  v7 = containermanager_copy_global_configuration();
  objc_msgSend(v7, "defaultUser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "userIdentityWithPersonaAttributes:POSIXUser:forceUnspecific:", v6, v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)userIdentityWithPersonaAttributes:(id)a3 POSIXUser:(id)a4 forceUnspecific:(BOOL)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  MCMUserIdentity *v13;
  NSObject *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v8, "UID");
  objc_msgSend(v7, "userPersonaUniqueString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7
    || (v9 = objc_msgSend(v7, "userPersona_id"), !objc_msgSend(v7, "isDataSeparatedPersona"))
    || (objc_msgSend(v7, "personaLayoutPathURL"), (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v8, "homeDirectoryURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (MCMRequirePersona_onceToken != -1)
    dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_13);
  if (!MCMRequirePersona_result)
  {
    if (a5
      || (objc_msgSend(v7, "isPersonalPersona") & 1) == 0 && !objc_msgSend(v7, "isDataSeparatedPersona"))
    {
      goto LABEL_19;
    }
    if ((objc_msgSend(v7, "isPersonalPersona") & 1) == 0)
    {
      v12 = objc_msgSend(v7, "isDataSeparatedPersona");
      goto LABEL_20;
    }
    goto LABEL_16;
  }
  if (a5)
    goto LABEL_19;
  if ((objc_msgSend(v7, "isPersonalPersona") & 1) != 0)
  {
LABEL_16:
    v12 = 0;
    goto LABEL_20;
  }
  if ((objc_msgSend(v7, "isDataSeparatedPersona") & 1) != 0)
  {
    v12 = 1;
    goto LABEL_20;
  }
  if ((objc_msgSend(v7, "isSystemPersona") & 1) != 0 || (objc_msgSend(v7, "isDefaultPersona") & 1) != 0)
  {
LABEL_19:
    v12 = 2;
    goto LABEL_20;
  }
  container_log_handle_for_category();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 134218242;
    v17 = objc_msgSend(v7, "userPersonaType");
    v18 = 2114;
    v19 = v7;
    _os_log_impl(&dword_1CF807000, v15, OS_LOG_TYPE_DEFAULT, "Persona of unknown type %ld being treated as Unspecific: %{public}@", (uint8_t *)&v16, 0x16u);
  }

  v12 = 3;
LABEL_20:
  v13 = -[MCMUserIdentity initWithPOSIXUser:homeDirectoryURL:personaUniqueString:personaType:kernelPersonaID:]([MCMUserIdentity alloc], "initWithPOSIXUser:homeDirectoryURL:personaUniqueString:personaType:kernelPersonaID:", v8, v11, v10, v12, v9);

  return v13;
}

void __48__MCMUserIdentityCache_globalSystemUserIdentity__block_invoke()
{
  id v0;
  MCMUserIdentity *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = containermanager_copy_global_configuration();
  objc_msgSend(v0, "systemContainerOwner");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v1 = [MCMUserIdentity alloc];
  objc_msgSend(v5, "homeDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[MCMUserIdentity initWithPOSIXUser:homeDirectoryURL:personaUniqueString:personaType:kernelPersonaID:](v1, "initWithPOSIXUser:homeDirectoryURL:personaUniqueString:personaType:kernelPersonaID:", v5, v2, 0, 3, objc_msgSend(v5, "UID"));
  v4 = (void *)globalSystemUserIdentity_userIdentity;
  globalSystemUserIdentity_userIdentity = v3;

}

void __48__MCMUserIdentityCache_globalBundleUserIdentity__block_invoke()
{
  id v0;
  MCMUserIdentity *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = containermanager_copy_global_configuration();
  objc_msgSend(v0, "bundleContainerOwner");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v1 = [MCMUserIdentity alloc];
  objc_msgSend(v5, "homeDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[MCMUserIdentity initWithPOSIXUser:homeDirectoryURL:personaUniqueString:personaType:kernelPersonaID:](v1, "initWithPOSIXUser:homeDirectoryURL:personaUniqueString:personaType:kernelPersonaID:", v5, v2, 0, 3, objc_msgSend(v5, "UID"));
  v4 = (void *)globalBundleUserIdentity_userIdentity;
  globalBundleUserIdentity_userIdentity = v3;

}

@end
