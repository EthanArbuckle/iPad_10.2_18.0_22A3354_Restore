@implementation ML3Collection

+ (id)foreignPropertyForProperty:(id)a3 entityClass:(Class)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v6 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___ML3Collection;
  objc_msgSendSuper2(&v9, sel_foreignPropertyForProperty_entityClass_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if ((Class)objc_opt_class() == a4)
    {
      objc_msgSend((id)ML3TrackForeignPropertyForML3CollectionProperties, "objectForKey:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("item_artist_pid"), CFSTR("item_artist_pid"), CFSTR("album_pid"), CFSTR("album_pid"), CFSTR("ROWID"), CFSTR("item_pid"), 0);
    v3 = (void *)ML3TrackForeignPropertyForML3CollectionProperties;
    ML3TrackForeignPropertyForML3CollectionProperties = v2;

  }
}

- (ML3Collection)initWithDictionary:(id)a3 inLibrary:(id)a4 cachedNameOrders:(id)a5 usingConnection:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  ML3Collection *v23;
  ML3Collection *v25;
  objc_super v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "objectForKey:", CFSTR("grouping_key"));
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = self;
    objc_msgSend((id)objc_opt_class(), "propertiesForGroupingKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v28;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(v10, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v20));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v21, "length"))
          {
            objc_msgSend(v11, "groupingKeyForString:", v21);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {

              goto LABEL_15;
            }
          }
          else
          {

          }
          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v18);
    }

    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
LABEL_15:
      v22 = (void *)objc_msgSend(v10, "mutableCopy");
      objc_msgSend(v22, "setValue:forKey:", v15, CFSTR("grouping_key"));

      v10 = v22;
    }
    self = v25;
  }
  v26.receiver = self;
  v26.super_class = (Class)ML3Collection;
  v23 = -[ML3Entity initWithDictionary:inLibrary:cachedNameOrders:usingConnection:](&v26, sel_initWithDictionary_inLibrary_cachedNameOrders_usingConnection_, v10, v11, v12, v13);

  return v23;
}

- (void)updateCloudStatus
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  objc_msgSend((id)objc_opt_class(), "trackForeignPersistentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", v3, self->super._persistentID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  +[ML3Entity queryWithLibrary:predicate:orderingTerms:](ML3Track, "queryWithLibrary:predicate:orderingTerms:", WeakRetained, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("(item.remote_location_id >= 50 AND item.base_location_id < 250)"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __34__ML3Collection_updateCloudStatus__block_invoke;
  v12[3] = &unk_1E5B61AB8;
  v12[4] = &v17;
  v12[5] = &v13;
  objc_msgSend(v6, "enumeratePersistentIDsAndProperties:usingBlock:", v7, v12);

  if (*((_BYTE *)v18 + 24))
  {
    if (*((_BYTE *)v14 + 24))
      v8 = 1;
    else
      v8 = 2;
  }
  else
  {
    v8 = 0;
  }
  -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("cloud_status"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  if (v10 != v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ML3Entity setValue:forProperty:](self, "setValue:forProperty:", v11, CFSTR("cloud_status"));

  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

}

uint64_t __34__ML3Collection_updateCloudStatus__block_invoke(uint64_t result, uint64_t a2, id *a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v5;
  uint64_t v6;

  v5 = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24)
    && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    *a5 = 1;
  }
  else
  {
    result = objc_msgSend(*a3, "BOOLValue");
    if ((_DWORD)result)
      v6 = *(_QWORD *)(v5 + 32);
    else
      v6 = *(_QWORD *)(v5 + 40);
    *(_BYTE *)(*(_QWORD *)(v6 + 8) + 24) = 1;
  }
  return result;
}

+ (id)propertiesForGroupingKey
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("must be overridden"));
  return 0;
}

+ (id)trackForeignPersistentID
{
  return 0;
}

+ (id)propertiesForGroupingUniqueCollections
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("grouping_key");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)artworkCacheIDProperty
{
  return 0;
}

+ (BOOL)libraryContentsChangeForProperty:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("cloud_status")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("representative_item_pid")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___ML3Collection;
    v5 = objc_msgSendSuper2(&v7, sel_libraryContentsChangeForProperty_, v4);
  }

  return v5;
}

+ (BOOL)updateRepresentativeItemPersistentIDsInLibrary:(id)a3 persistentIDs:(id)a4 usingConnection:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  char v22;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;

  v27 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(a1, "trackForeignPersistentID");
  v10 = objc_claimAutoreleasedReturnValue();
  v25 = a1;
  objc_msgSend(a1, "databaseTable");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)v11;
  v26 = (void *)v10;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@ = 0 OR %@"), v10, v11, CFSTR("representative_item_pid"), CFSTR("representative_item_pid"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3DatabaseStatementRenderer defaultRenderer](ML3DatabaseStatementRenderer, "defaultRenderer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "count");
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = 0;
    v17 = -1;
    do
    {
      if (v14 - v16 >= 0x64)
        v18 = 100;
      else
        v18 = v14 - v16;
      objc_msgSend(v8, "subarrayWithRange:", v16, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 != v18)
      {
        objc_msgSend(v28, "statementWithPrefix:inParameterCount:", v29, v18);
        v20 = objc_claimAutoreleasedReturnValue();

        v17 = v18;
        v15 = (void *)v20;
      }
      v16 += v18;
      objc_msgSend(v9, "executeQuery:withParameters:", v15, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __94__ML3Collection_updateRepresentativeItemPersistentIDsInLibrary_persistentIDs_usingConnection___block_invoke;
      v30[3] = &unk_1E5B65EE0;
      v31 = v12;
      objc_msgSend(v21, "enumerateRowsWithBlock:", v30);

    }
    while (v16 < v14);
  }
  else
  {
    v15 = 0;
  }
  v22 = objc_msgSend(v25, "_updateRepresentativeItemsForPersistentIDs:usingConnection:", v12, v9);

  return v22;
}

+ (BOOL)canonicalizeCollectionRepresentativeItemsInLibrary:(id)a3 usingConnection:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  char v25;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v29 = a4;
  v7 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v37 = (id)objc_opt_class();
    v38 = 2114;
    v39 = v6;
    v8 = v37;
    _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_DEFAULT, "Looking for representative items to update for collection type %{public}@ in library %{public}@", buf, 0x16u);

  }
  objc_msgSend(a1, "trackForeignPersistentID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "databaseTable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT DISTINCT item.%@ FROM item JOIN %@ USING (%@) LEFT OUTER JOIN best_artwork_token ON (item.ROWID = best_artwork_token.entity_pid AND best_artwork_token.entity_type = %ld) WHERE %@.%@ = item.ROWID AND (((item.media_type & 1024) = 1024) OR best_artwork_token.available_artwork_token IS NULL)"), v9, v10, v9, 0, v10, CFSTR("representative_item_pid"));
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)v11;
  objc_msgSend(v29, "executeQuery:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __84__ML3Collection_canonicalizeCollectionRepresentativeItemsInLibrary_usingConnection___block_invoke;
  v34[3] = &unk_1E5B65EE0;
  v15 = v12;
  v35 = v15;
  objc_msgSend(v13, "enumerateRowsWithBlock:", v34);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT %@.ROWID FROM %@ WHERE %@.%@ = 0"), v10, v10, v10, CFSTR("representative_item_pid"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "executeQuery:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v14;
  v32[1] = 3221225472;
  v32[2] = __84__ML3Collection_canonicalizeCollectionRepresentativeItemsInLibrary_usingConnection___block_invoke_2;
  v32[3] = &unk_1E5B65EE0;
  v17 = v15;
  v33 = v17;
  objc_msgSend(v16, "enumerateRowsWithBlock:", v32);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT %@.ROWID FROM %@ LEFT OUTER JOIN item ON (%@.%@ = item.ROWID) where %@.ROWID != IFNULL(item.%@, 0)"), v10, v10, v10, CFSTR("representative_item_pid"), v10, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "executeQuery:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v14;
  v30[1] = 3221225472;
  v30[2] = __84__ML3Collection_canonicalizeCollectionRepresentativeItemsInLibrary_usingConnection___block_invoke_3;
  v30[3] = &unk_1E5B65EE0;
  v20 = v17;
  v31 = v20;
  objc_msgSend(v19, "enumerateRowsWithBlock:", v30);

  v21 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (void *)objc_msgSend(v20, "count");
    v23 = (void *)objc_opt_class();
    *(_DWORD *)buf = 134218498;
    v37 = v22;
    v38 = 2114;
    v39 = v23;
    v40 = 2114;
    v41 = v6;
    v24 = v23;
    _os_log_impl(&dword_1AC149000, v21, OS_LOG_TYPE_DEFAULT, "Updating %lu representative items for collection %{public}@ in library %{public}@", buf, 0x20u);

  }
  v25 = objc_msgSend(a1, "_updateRepresentativeItemsForPersistentIDs:usingConnection:", v20, v29);

  return v25;
}

+ (BOOL)removeOrphanedCollectionsInLibrary:(id)a3 usingConnection:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  unint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  unint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  unint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _QWORD *v29;
  unint64_t v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  _QWORD *v36;
  unint64_t v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  int v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v42 = 138543362;
    v43 = (uint64_t)v5;
    _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_DEFAULT, "Checking for orphaned collections in library %{public}@", (uint8_t *)&v42, 0xCu);
  }

  objc_msgSend(v6, "executeQuery:", CFSTR("SELECT album_pid FROM album WHERE album_pid NOT IN (SELECT album_pid FROM item)"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectsInColumn:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    v10 = malloc_type_calloc(objc_msgSend(v9, "count"), 8uLL, 0x100004000313F17uLL);
    if (objc_msgSend(v9, "count"))
    {
      v11 = 0;
      do
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v10[v11] = objc_msgSend(v12, "longLongValue");

        ++v11;
      }
      while (v11 < objc_msgSend(v9, "count"));
    }
    if (+[ML3Collection deleteFromLibrary:deletionType:persistentIDs:count:usingConnection:](ML3Album, "deleteFromLibrary:deletionType:persistentIDs:count:usingConnection:", v5, 2, v10, objc_msgSend(v9, "count"), v6))
    {
      v13 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v42 = 138543362;
        v43 = (uint64_t)v9;
        _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_DEFAULT, "Deleted Orphaned Album Pids=%{public}@", (uint8_t *)&v42, 0xCu);
      }

    }
    free(v10);
  }
  if (_os_feature_enabled_impl())
    objc_msgSend(v6, "executeQuery:withParameters:", CFSTR("SELECT album_artist_pid FROM album_artist WHERE ((album_artist_pid NOT IN (SELECT album_artist_pid FROM item) AND album_artist_pid NOT IN (SELECT album_artist_pid FROM album)) AND album_artist.liked_state=?)"), &unk_1E5BAA638);
  else
    objc_msgSend(v6, "executeQuery:", CFSTR("SELECT album_artist_pid FROM album_artist WHERE album_artist_pid NOT IN (SELECT album_artist_pid FROM item) AND album_artist_pid NOT IN (SELECT album_artist_pid FROM album)"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectsInColumn:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "count"))
  {
    v16 = malloc_type_calloc(objc_msgSend(v15, "count"), 8uLL, 0x100004000313F17uLL);
    if (objc_msgSend(v15, "count"))
    {
      v17 = 0;
      do
      {
        objc_msgSend(v15, "objectAtIndexedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v16[v17] = objc_msgSend(v18, "longLongValue");

        ++v17;
      }
      while (v17 < objc_msgSend(v15, "count"));
    }
    if (+[ML3AlbumArtist deleteFromLibrary:deletionType:persistentIDs:count:usingConnection:](ML3AlbumArtist, "deleteFromLibrary:deletionType:persistentIDs:count:usingConnection:", v5, 2, v16, objc_msgSend(v15, "count"), v6))
    {
      v19 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v42 = 138543362;
        v43 = (uint64_t)v15;
        _os_log_impl(&dword_1AC149000, v19, OS_LOG_TYPE_DEFAULT, "Deleted Orphaned Album Artist Pids=%{public}@", (uint8_t *)&v42, 0xCu);
      }

    }
    free(v16);
  }
  objc_msgSend(v6, "executeQuery:", CFSTR("SELECT item_artist_pid FROM item_artist WHERE item_artist_pid NOT IN (SELECT item_artist_pid FROM item)"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectsInColumn:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v21, "count"))
  {
    v22 = malloc_type_calloc(objc_msgSend(v21, "count"), 8uLL, 0x100004000313F17uLL);
    if (objc_msgSend(v21, "count"))
    {
      v23 = 0;
      do
      {
        objc_msgSend(v21, "objectAtIndexedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v22[v23] = objc_msgSend(v24, "longLongValue");

        ++v23;
      }
      while (v23 < objc_msgSend(v21, "count"));
    }
    if (+[ML3Collection deleteFromLibrary:deletionType:persistentIDs:count:usingConnection:](ML3Artist, "deleteFromLibrary:deletionType:persistentIDs:count:usingConnection:", v5, 2, v22, objc_msgSend(v21, "count"), v6))
    {
      v25 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = objc_msgSend(v21, "count");
        v42 = 134217984;
        v43 = v26;
        _os_log_impl(&dword_1AC149000, v25, OS_LOG_TYPE_DEFAULT, "Deleted %lu orphaned Artists", (uint8_t *)&v42, 0xCu);
      }

    }
    free(v22);
  }
  objc_msgSend(v6, "executeQuery:", CFSTR("SELECT composer_pid FROM composer WHERE composer_pid NOT IN (SELECT composer_pid FROM item)"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectsInColumn:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v28, "count"))
  {
    v29 = malloc_type_calloc(objc_msgSend(v28, "count"), 8uLL, 0x100004000313F17uLL);
    if (objc_msgSend(v28, "count"))
    {
      v30 = 0;
      do
      {
        objc_msgSend(v28, "objectAtIndexedSubscript:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v29[v30] = objc_msgSend(v31, "longLongValue");

        ++v30;
      }
      while (v30 < objc_msgSend(v28, "count"));
    }
    if (+[ML3Collection deleteFromLibrary:deletionType:persistentIDs:count:usingConnection:](ML3Composer, "deleteFromLibrary:deletionType:persistentIDs:count:usingConnection:", v5, 2, v29, objc_msgSend(v28, "count"), v6))
    {
      v32 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = objc_msgSend(v28, "count");
        v42 = 134217984;
        v43 = v33;
        _os_log_impl(&dword_1AC149000, v32, OS_LOG_TYPE_DEFAULT, "Deleted %lu orphaned Composers", (uint8_t *)&v42, 0xCu);
      }

    }
    free(v29);
  }
  objc_msgSend(v6, "executeQuery:", CFSTR("SELECT genre_id FROM genre WHERE genre_id NOT IN (SELECT genre_id FROM item)"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectsInColumn:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v35, "count"))
  {
    v36 = malloc_type_calloc(objc_msgSend(v35, "count"), 8uLL, 0x100004000313F17uLL);
    if (objc_msgSend(v35, "count"))
    {
      v37 = 0;
      do
      {
        objc_msgSend(v35, "objectAtIndexedSubscript:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v36[v37] = objc_msgSend(v38, "longLongValue");

        ++v37;
      }
      while (v37 < objc_msgSend(v35, "count"));
    }
    if (+[ML3Collection deleteFromLibrary:deletionType:persistentIDs:count:usingConnection:](ML3Genre, "deleteFromLibrary:deletionType:persistentIDs:count:usingConnection:", v5, 2, v36, objc_msgSend(v35, "count"), v6))
    {
      v39 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = objc_msgSend(v35, "count");
        v42 = 134217984;
        v43 = v40;
        _os_log_impl(&dword_1AC149000, v39, OS_LOG_TYPE_DEFAULT, "Deleted %lu orphaned Genres", (uint8_t *)&v42, 0xCu);
      }

    }
    free(v36);
  }

  return 1;
}

+ (BOOL)deleteFromLibrary:(id)a3 deletionType:(int)a4 persistentIDs:(const int64_t *)a5 count:(unint64_t)a6 usingConnection:(id)a7
{
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___ML3Collection;
  return objc_msgSendSuper2(&v8, sel_deleteFromLibrary_deletionType_persistentIDs_count_usingConnection_, a3, *(_QWORD *)&a4, a5, a6, a7);
}

+ (id)collectionEntityClasses
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)_updateRepresentativeItemsForPersistentIDs:(id)a3 usingConnection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  BOOL v12;
  NSObject *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  char v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v31 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(a1, "trackForeignPersistentID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "databaseTable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("UPDATE %@ SET %@ = IFNULL( (SELECT item_pid FROM item LEFT OUTER JOIN best_artwork_token ON (item.ROWID = best_artwork_token.entity_pid AND best_artwork_token.entity_type = %ld) WHERE item.%@ = %@.ROWID ORDER BY item.media_type, best_artwork_token.available_artwork_token IS NOT NULL DESC LIMIT 1), 0)"), v8, CFSTR("representative_item_pid"), 0, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "count") < 0x3E9)
    {
      objc_msgSend(v9, "appendString:", CFSTR(" WHERE ROWID"));
      objc_msgSend(v6, "allObjects");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      +[ML3DatabaseStatementRenderer defaultRenderer](ML3DatabaseStatementRenderer, "defaultRenderer");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v11, "count");
      if (v14)
      {
        v15 = v14;
        v30 = v13;
        v27 = v8;
        v28 = v7;
        v29 = v6;
        v16 = 0;
        v17 = 0;
        v18 = -1;
        while (1)
        {
          if (v15 - v17 >= 0x64)
            v19 = 100;
          else
            v19 = v15 - v17;
          objc_msgSend(v11, "subarrayWithRange:", v17, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18 != v19)
          {
            -[NSObject statementWithPrefix:inParameterCount:](v30, "statementWithPrefix:inParameterCount:", v9, v19);
            v21 = objc_claimAutoreleasedReturnValue();

            v18 = v19;
            v16 = (void *)v21;
          }
          v32 = 0;
          v22 = objc_msgSend(v31, "executeUpdate:withParameters:error:", v16, v20, &v32);
          v23 = v32;
          v24 = v23;
          if ((v22 & 1) == 0)
            break;
          v17 += v19;

          if (v17 >= v15)
          {

            v12 = 1;
            goto LABEL_23;
          }
        }
        v25 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v35 = v24;
          _os_log_impl(&dword_1AC149000, v25, OS_LOG_TYPE_ERROR, "Failed to update collection representative items with error: %{public}@", buf, 0xCu);
        }

        v12 = 0;
LABEL_23:
        v7 = v28;
        v6 = v29;
        v8 = v27;
        v13 = v30;
      }
      else
      {
        v12 = 1;
      }
    }
    else
    {
      v33 = 0;
      v10 = objc_msgSend(v31, "executeUpdate:withParameters:error:", v9, 0, &v33);
      v11 = v33;
      if ((v10 & 1) != 0)
      {
        v12 = 1;
LABEL_25:

        goto LABEL_26;
      }
      v13 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v35 = v11;
        _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_ERROR, "Failed to update collection representative items with error: %{public}@", buf, 0xCu);
      }
      v12 = 0;
    }

    goto LABEL_25;
  }
  v12 = 1;
LABEL_26:

  return v12;
}

void __84__ML3Collection_canonicalizeCollectionRepresentativeItemsInLibrary_usingConnection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

void __84__ML3Collection_canonicalizeCollectionRepresentativeItemsInLibrary_usingConnection___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

void __84__ML3Collection_canonicalizeCollectionRepresentativeItemsInLibrary_usingConnection___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

void __94__ML3Collection_updateRepresentativeItemPersistentIDsInLibrary_persistentIDs_usingConnection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

@end
