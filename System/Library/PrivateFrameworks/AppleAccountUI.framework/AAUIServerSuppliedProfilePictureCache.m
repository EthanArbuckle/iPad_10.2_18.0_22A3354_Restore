@implementation AAUIServerSuppliedProfilePictureCache

+ (id)sharedCache
{
  if (sharedCache_onceToken != -1)
    dispatch_once(&sharedCache_onceToken, &__block_literal_global);
  return (id)sharedCache___sharedCache;
}

void __52__AAUIServerSuppliedProfilePictureCache_sharedCache__block_invoke()
{
  AAUIServerSuppliedProfilePictureCache *v0;
  void *v1;

  v0 = objc_alloc_init(AAUIServerSuppliedProfilePictureCache);
  v1 = (void *)sharedCache___sharedCache;
  sharedCache___sharedCache = (uint64_t)v0;

}

- (AAUIServerSuppliedProfilePictureCache)init
{
  AAUIServerSuppliedProfilePictureCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *personIDToEntryMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AAUIServerSuppliedProfilePictureCache;
  v2 = -[AAUIServerSuppliedProfilePictureCache init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    personIDToEntryMap = v2->_personIDToEntryMap;
    v2->_personIDToEntryMap = v3;

    v2->_pictureDiameter = 60.0;
  }
  return v2;
}

- (double)pictureDiameter
{
  NSMutableDictionary *v3;
  double pictureDiameter;

  v3 = self->_personIDToEntryMap;
  objc_sync_enter(v3);
  pictureDiameter = self->_pictureDiameter;
  objc_sync_exit(v3);

  return pictureDiameter;
}

- (void)_ensureMinimumPictureDiameter_mustBeSynchronized:(double)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSMutableDictionary *obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (self->_pictureDiameter < a3)
  {
    _AAUIPPSLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_pictureDiameter);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v6;
      v24 = 2112;
      v25 = v7;
      _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore _ensureMinimumPictureDiameter: %@ _pictureDiameter %@. Will expire all cached pictures.", buf, 0x16u);

    }
    obj = self->_personIDToEntryMap;
    objc_sync_enter(obj);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[NSMutableDictionary allKeys](self->_personIDToEntryMap, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          -[AAUIServerSuppliedProfilePictureCache _entryForPersonID:](self, "_entryForPersonID:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          _AAUIPPSLogSystem();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v12;
            _os_log_impl(&dword_1DB4ED000, v14, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore _ensureMinimumPictureDiameter: Expiring cache entry for %@", buf, 0xCu);
          }

          objc_msgSend(v13, "expire");
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

    objc_sync_exit(obj);
    _AAUIPPSLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v15, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore _ensureMinimumPictureDiameter: Did expire all cached pictures.", buf, 2u);
    }

    self->_pictureDiameter = a3;
  }
}

- (id)serverCacheTagForPersonID:(id)a3 diameter:(double)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _AAUIPPSLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_1DB4ED000, v7, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore profilePictureForPersonID: %@ diameter: %@", (uint8_t *)&v12, 0x16u);

  }
  if (v6)
  {
    -[AAUIServerSuppliedProfilePictureCache _ensureMinimumPictureDiameter_mustBeSynchronized:](self, "_ensureMinimumPictureDiameter_mustBeSynchronized:", a4);
    -[AAUIServerSuppliedProfilePictureCache _entryForPersonID:](self, "_entryForPersonID:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serverCacheTag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)profilePictureForPersonID:(id)a3 diameter:(double)a4 serverFetchBlock:(id)a5
{
  id v8;
  void (**v9)(id, NSObject *);
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, NSObject *))a5;
  _AAUIPPSLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412546;
    v20 = v8;
    v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_1DB4ED000, v10, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore profilePictureForPersonID: %@ diameter: %@", (uint8_t *)&v19, 0x16u);

  }
  if (v8)
  {
    -[AAUIServerSuppliedProfilePictureCache _ensureMinimumPictureDiameter_mustBeSynchronized:](self, "_ensureMinimumPictureDiameter_mustBeSynchronized:", a4);
    -[AAUIServerSuppliedProfilePictureCache _entryForPersonID:](self, "_entryForPersonID:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "picture");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "updating") & 1) != 0 || !objc_msgSend(v12, "expired"))
    {
      _AAUIPPSLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1DB4ED000, v15, OS_LOG_TYPE_DEFAULT, "performServerFetch is False", (uint8_t *)&v19, 2u);
      }
    }
    else
    {
      _AAUIPPSLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1DB4ED000, v14, OS_LOG_TYPE_DEFAULT, "performServerFetch is True", (uint8_t *)&v19, 2u);
      }

      objc_msgSend(v12, "setUpdating:", 1);
      objc_msgSend(v12, "serverCacheTag");
      v15 = objc_claimAutoreleasedReturnValue();
      _AAUIPPSLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138412290;
        v20 = v8;
        _os_log_impl(&dword_1DB4ED000, v16, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore profilePictureForPersonID: %@ triggering performServerFetch", (uint8_t *)&v19, 0xCu);
      }

      v9[2](v9, v15);
    }

  }
  else
  {
    v13 = 0;
  }
  _AAUIPPSLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412546;
    v20 = v8;
    v21 = 2112;
    v22 = v13;
    _os_log_impl(&dword_1DB4ED000, v17, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore profilePictureForPersonID: %@ returning profilePicture %@", (uint8_t *)&v19, 0x16u);
  }

  return v13;
}

- (void)profilePictureForPersonID:(id)a3 diameter:(double)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *, void *, uint64_t);
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *, void *, uint64_t))a5;
  _AAUIPPSLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412546;
    v20 = v8;
    v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_1DB4ED000, v10, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore profilePictureForPersonID: %@ diameter: %@ completion:", (uint8_t *)&v19, 0x16u);

  }
  if (v8)
  {
    -[AAUIServerSuppliedProfilePictureCache _ensureMinimumPictureDiameter_mustBeSynchronized:](self, "_ensureMinimumPictureDiameter_mustBeSynchronized:", a4);
    -[AAUIServerSuppliedProfilePictureCache _entryForPersonID:](self, "_entryForPersonID:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "picture");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serverCacheTag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "expired");
    _AAUIPPSLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138413058;
      v20 = v8;
      v21 = 2112;
      v22 = v13;
      v23 = 2112;
      v24 = v14;
      v25 = 2112;
      v26 = v17;
      _os_log_impl(&dword_1DB4ED000, v16, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore profilePictureForPersonID: %@ completion: calling completion with profilePicture %@ serverCacheTag %@ performServerFetch %@", (uint8_t *)&v19, 0x2Au);

    }
    v9[2](v9, v13, v14, v15);

  }
  else
  {
    _AAUIPPSLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = 0;
      _os_log_impl(&dword_1DB4ED000, v18, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore profilePictureForPersonID: %@ completion: No personID provided!", (uint8_t *)&v19, 0xCu);
    }

    v9[2](v9, 0, 0, 0);
  }

}

- (BOOL)updateProfilePicture:(id)a3 didReceiveNewPicture:(BOOL)a4 serverCacheTag:(id)a5 forPersonID:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  double v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  int v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  NSObject *v35;
  uint64_t v36;

  v8 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  _AAUIPPSLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138413058;
    v27 = v10;
    v28 = 2112;
    v29 = v14;
    v30 = 2112;
    v31 = v11;
    v32 = 2112;
    v33 = v12;
    _os_log_impl(&dword_1DB4ED000, v13, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore updateProfilePicture: %@ didReceiveNewPicture: %@ serverCacheTag: %@ forPersonID: %@", (uint8_t *)&v26, 0x2Au);

  }
  if (v12)
  {
    if (!v10 || (objc_msgSend(v10, "size"), v15 == self->_pictureDiameter))
    {
      -[AAUIServerSuppliedProfilePictureCache _entryForPersonID:](self, "_entryForPersonID:", v12);
      v16 = objc_claimAutoreleasedReturnValue();
      _AAUIPPSLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138413314;
        v27 = v10;
        v28 = 2112;
        v29 = v21;
        v30 = 2112;
        v31 = v11;
        v32 = 2112;
        v33 = v12;
        v34 = 2112;
        v35 = v16;
        _os_log_impl(&dword_1DB4ED000, v20, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore updateProfilePicture: %@ didReceiveNewPicture: %@ serverCacheTag: %@ forPersonID: %@ updating entry %@", (uint8_t *)&v26, 0x34u);

      }
      -[NSObject setUpdating:](v16, "setUpdating:", 0);
      if (v8)
      {
        -[NSObject picture](v16, "picture");
        v22 = (id)objc_claimAutoreleasedReturnValue();
        LOBYTE(v8) = v22 != v10;

        -[NSObject setPicture:](v16, "setPicture:", v10);
        if (v11)
          -[NSObject setServerCacheTag:](v16, "setServerCacheTag:", v11);
        _AAUIPPSLogSystem();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 138413314;
          v27 = v10;
          v28 = 2112;
          v29 = v24;
          v30 = 2112;
          v31 = v11;
          v32 = 2112;
          v33 = v12;
          v34 = 2112;
          v35 = v16;
          _os_log_impl(&dword_1DB4ED000, v23, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore updateProfilePicture: %@ didReceiveNewPicture: %@ serverCacheTag: %@ forPersonID: %@ did update entry %@", (uint8_t *)&v26, 0x34u);

        }
      }
      else
      {
        -[NSObject extendExpirationDate](v16, "extendExpirationDate");
      }
    }
    else
    {
      _AAUIPPSLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (void *)MEMORY[0x1E0CB3B18];
        objc_msgSend(v10, "size");
        objc_msgSend(v17, "valueWithCGSize:");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_pictureDiameter);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138412802;
        v27 = v12;
        v28 = 2112;
        v29 = v18;
        v30 = 2112;
        v31 = v19;
        _os_log_impl(&dword_1DB4ED000, v16, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore updateProfilePicture: ... forPersonID: %@ ignoring picture with size %@ different from _pictureDiameter %@", (uint8_t *)&v26, 0x20u);

      }
      LOBYTE(v8) = 0;
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)_entryForPersonID:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  AAUIServerSuppliedProfilePictureCacheEntry *v6;
  NSObject *v7;

  v4 = a3;
  v5 = self->_personIDToEntryMap;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKey:](self->_personIDToEntryMap, "objectForKey:", v4);
  v6 = (AAUIServerSuppliedProfilePictureCacheEntry *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    _AAUIPPSLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[AAUIServerSuppliedProfilePictureCache _entryForPersonID:].cold.2();
  }
  else
  {
    v6 = objc_alloc_init(AAUIServerSuppliedProfilePictureCacheEntry);
    -[NSMutableDictionary setObject:forKey:](self->_personIDToEntryMap, "setObject:forKey:", v6, v4);
    _AAUIPPSLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[AAUIServerSuppliedProfilePictureCache _entryForPersonID:].cold.1();
  }

  objc_sync_exit(v5);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personIDToEntryMap, 0);
}

- (void)_entryForPersonID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB4ED000, v0, v1, "[AAUIServerSuppliedProfilePictureCache entryForPersonID]: %@ Created entry %@");
}

- (void)_entryForPersonID:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB4ED000, v0, v1, "[AAUIServerSuppliedProfilePictureCache entryForPersonID]: %@ Found entry %@");
}

@end
