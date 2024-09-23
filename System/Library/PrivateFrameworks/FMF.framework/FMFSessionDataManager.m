@implementation FMFSessionDataManager

- (void)setFollowing:(id)a3
{
  NSSet *v4;
  NSSet *following;
  FMFSessionDataManager *obj;

  v4 = (NSSet *)a3;
  obj = self;
  objc_sync_enter(obj);
  following = obj->_following;
  obj->_following = v4;

  objc_sync_exit(obj);
}

- (void)setFollowers:(id)a3
{
  NSSet *v4;
  NSSet *followers;
  FMFSessionDataManager *obj;

  v4 = (NSSet *)a3;
  obj = self;
  objc_sync_enter(obj);
  followers = obj->_followers;
  obj->_followers = v4;

  objc_sync_exit(obj);
}

- (void)setFences:(id)a3
{
  NSSet *v4;
  NSSet *fences;
  FMFSessionDataManager *obj;

  v4 = (NSSet *)a3;
  obj = self;
  objc_sync_enter(obj);
  fences = obj->_fences;
  obj->_fences = v4;

  objc_sync_exit(obj);
}

+ (id)sharedInstance
{
  if (sharedInstance_dispatch_predicate_0 != -1)
    dispatch_once(&sharedInstance_dispatch_predicate_0, &__block_literal_global_1);
  return (id)sharedInstance__instance_0;
}

- (void)setLocations:(id)a3
{
  id v4;
  FMFSessionDataManager *v5;
  NSSet *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSSet *locations;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[16];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
  v21 = v4;
  v7 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFSessionDataManager setLocationsCache:](v5, "setLocationsCache:", v8);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[NSSet member:](v5->_locations, "member:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handle");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "serverId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          LogCategory_Daemon();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v14, "handle");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[FMFSessionDataManager setLocations:].cold.1(v19, (uint64_t)v26, v18);
          }

          goto LABEL_16;
        }
        if (v14)
        {
          objc_msgSend(v14, "updateLocationForCache:", v13);
          -[NSSet addObject:](v6, "addObject:", v14);
          -[FMFSessionDataManager locationsCache](v5, "locationsCache");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKey:", v14, v16);
        }
        else
        {
          -[NSSet addObject:](v6, "addObject:", v13);
          -[FMFSessionDataManager locationsCache](v5, "locationsCache");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKey:", v13, v16);
        }

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_16:

  locations = v5->_locations;
  v5->_locations = v6;

  objc_sync_exit(v5);
}

- (NSMutableDictionary)locationsCache
{
  return self->_locationsCache;
}

- (void)setLocationsCache:(id)a3
{
  objc_storeStrong((id *)&self->_locationsCache, a3);
}

void __39__FMFSessionDataManager_sharedInstance__block_invoke()
{
  NSObject *v0;
  FMFSessionDataManager *v1;
  void *v2;
  uint8_t v3[16];

  LogCategory_Daemon();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DC81B000, v0, OS_LOG_TYPE_INFO, "Creating shared instance of FMFSessionDataManager", v3, 2u);
  }

  v1 = objc_alloc_init(FMFSessionDataManager);
  v2 = (void *)sharedInstance__instance_0;
  sharedInstance__instance_0 = (uint64_t)v1;

}

- (id)followerForHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FMFSessionDataManager followers](self, "followers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "member:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)followingForHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FMFSessionDataManager following](self, "following");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "member:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)locationForHandle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  FMFSessionDataManager *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;

  v4 = a3;
  objc_msgSend(v4, "serverId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v4;
  }
  else
  {
    -[FMFSessionDataManager followingForHandle:](self, "followingForHandle:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  objc_msgSend(v7, "serverId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = self;
    objc_sync_enter(v9);
    -[FMFSessionDataManager locationsCache](v9, "locationsCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && (objc_msgSend(v11, "isValid") & 1) == 0)
    {
      -[FMFSessionDataManager locations](v9, "locations");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "mutableCopy");

      objc_msgSend(v13, "removeObject:", v11);
      objc_storeStrong((id *)&v9->_locations, v13);
      -[FMFSessionDataManager locationsCache](v9, "locationsCache");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObjectForKey:", v8);

      v11 = 0;
    }
    objc_sync_exit(v9);

  }
  else
  {
    LogCategory_Daemon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[FMFSessionDataManager locationForHandle:].cold.1((uint64_t)v4, v15, v16);

    v11 = 0;
  }

  return v11;
}

- (id)offerExpirationForHandle:(id)a3 groupId:(id)a4
{
  __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;

  v6 = (__CFString *)a4;
  v7 = a3;
  -[FMFSessionDataManager followers](self, "followers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "member:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v6;
  if (!v6)
    v10 = CFSTR("kFMFGroupIdOneToOne");
  v11 = v6;
  objc_msgSend(v9, "expiresByGroupId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v13, "doubleValue");
  objc_msgSend(v14, "dateWithTimeIntervalSince1970:", v15 / 1000.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)abDidChange
{
  void *v2;
  void *v3;
  FMFSessionDataManager *obj;

  obj = self;
  objc_sync_enter(obj);
  -[FMFSessionDataManager followers](obj, "followers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "makeObjectsPerformSelector:", sel_addressBookDidChange);

  -[FMFSessionDataManager following](obj, "following");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeObjectsPerformSelector:", sel_addressBookDidChange);

  objc_sync_exit(obj);
}

- (void)abPreferencesDidChange
{
  void *v2;
  void *v3;
  FMFSessionDataManager *obj;

  obj = self;
  objc_sync_enter(obj);
  -[FMFSessionDataManager followers](obj, "followers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "makeObjectsPerformSelector:", sel_abPreferencesDidChange);

  -[FMFSessionDataManager following](obj, "following");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeObjectsPerformSelector:", sel_abPreferencesDidChange);

  objc_sync_exit(obj);
}

- (id)favoritesOrdered
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[FMFSessionDataManager following](self, "following");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("favoriteOrder != nil"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredSetUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!favoritesOrdered_sortDesc)
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("favoriteOrder"), 1);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)favoritesOrdered_sortDesc;
    favoritesOrdered_sortDesc = v5;

  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSSet)followers
{
  return self->_followers;
}

- (NSSet)following
{
  return self->_following;
}

- (NSSet)locations
{
  return self->_locations;
}

- (NSSet)fences
{
  return self->_fences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationsCache, 0);
  objc_storeStrong((id *)&self->_fences, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_following, 0);
  objc_storeStrong((id *)&self->_followers, 0);
}

- (void)setLocations:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_3(&dword_1DC81B000, a3, (uint64_t)a3, "Failed to cache location. Missing serverId. %@", (uint8_t *)a2);

}

- (void)locationForHandle:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_3(&dword_1DC81B000, a2, a3, "Faild cached location lookup. Missing serverId. %@", (uint8_t *)&v3);
}

@end
