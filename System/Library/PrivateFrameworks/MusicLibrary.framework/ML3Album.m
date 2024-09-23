@implementation ML3Album

+ (id)joinClausesForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend((id)ML3AlbumJoinsForProperties, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___ML3Album;
    objc_msgSendSuper2(&v10, sel_joinClausesForProperty_, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

+ (id)databaseTable
{
  return CFSTR("album");
}

+ (int64_t)revisionTrackingCode
{
  return 4;
}

+ (id)foreignPropertyForProperty:(id)a3 entityClass:(Class)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v6 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___ML3Album;
  objc_msgSendSuper2(&v9, sel_foreignPropertyForProperty_entityClass_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if ((Class)objc_opt_class() == a4)
    {
      objc_msgSend((id)ML3TrackForeignPropertyForML3AlbumProperties, "objectForKey:", v6);
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
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[22];
  _QWORD v20[4];
  _QWORD v21[4];
  _QWORD v22[3];

  v22[1] = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() == a1)
  {
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)ML3AlbumDefaultOrderingTerms;
    ML3AlbumDefaultOrderingTerms = v4;

    v20[0] = CFSTR("album_artist.album_artist");
    v20[1] = CFSTR("album_artist.grouping_key");
    v21[0] = &unk_1E5BAA5D8;
    v21[1] = &unk_1E5BAA5F0;
    v20[2] = CFSTR("album_item_store.store_playlist_id");
    v20[3] = CFSTR("album_item_store.cloud_album_id");
    v21[2] = &unk_1E5BAA608;
    v21[3] = &unk_1E5BAA620;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)ML3AlbumJoinsForProperties;
    ML3AlbumJoinsForProperties = v6;

    v19[0] = CFSTR("ROWID");
    v19[1] = CFSTR("album");
    v19[2] = CFSTR("sort_album");
    v19[3] = CFSTR("album_artist.album_artist");
    v19[4] = CFSTR("album_artist.grouping_key");
    v19[5] = CFSTR("album_artist_pid");
    v19[6] = CFSTR("representative_item_pid");
    v19[7] = CFSTR("user_rating");
    v19[8] = CFSTR("all_compilations");
    v19[9] = CFSTR("feed_url");
    v19[10] = CFSTR("season_number");
    v19[11] = CFSTR("album_year");
    v19[12] = CFSTR("liked_state");
    v19[13] = CFSTR("album_item_store.store_playlist_id");
    v19[14] = CFSTR("app_data");
    v19[15] = CFSTR("contains_classical_work");
    v19[16] = CFSTR("date_played_local");
    v19[17] = CFSTR("sync_id");
    v19[18] = CFSTR("classical_experience_available");
    v19[19] = CFSTR("liked_state_changed_date");
    v19[20] = CFSTR("store_id");
    v19[21] = CFSTR("cloud_library_id");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 22);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)ML3AlbumAllProperties;
    ML3AlbumAllProperties = v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("liked_state"), CFSTR("liked_state_changed_date"), 0);
    v11 = (void *)ML3AlbumContentsUnchangingProperties;
    ML3AlbumContentsUnchangingProperties = v10;

    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(a1, "predisambiguateProperties:toDictionary:", ML3AlbumAllProperties, v12);
    v13 = (void *)ML3AlbumPredisambiguatedPropertyForProperties;
    ML3AlbumPredisambiguatedPropertyForProperties = (uint64_t)v12;
    v14 = v12;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("album_artist.album_artist"), CFSTR("album_artist.album_artist"), CFSTR("album.album"), CFSTR("album"), CFSTR("ROWID"), CFSTR("representative_item_pid"), CFSTR("is_compilation"), CFSTR("all_compilations"), 0);
    v16 = (void *)ML3TrackForeignPropertyForML3AlbumProperties;
    ML3TrackForeignPropertyForML3AlbumProperties = v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("cloud_status"), 0);
    v18 = (void *)ML3AlbumNoAssistantSyncProperties;
    ML3AlbumNoAssistantSyncProperties = v17;

  }
}

- (void)updateTrackValues:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id WeakRetained;
  char v22;
  uint64_t i;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[7];

  v27[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = CFSTR("ROWID");
  v27[0] = CFSTR("ROWID");
  v27[1] = CFSTR("album");
  v27[2] = CFSTR("sort_album");
  v27[3] = CFSTR("season_number");
  v6 = CFSTR("representative_item_pid");
  v27[4] = CFSTR("representative_item_pid");
  v7 = CFSTR("cloud_status");
  v27[5] = CFSTR("cloud_status");
  v25 = 0u;
  v26 = 0u;
  v24 = 0u;
  -[ML3Entity getValues:forProperties:count:](self, "getValues:forProperties:count:", &v24, v27, 6);
  objc_msgSend(v4, "setValue:forKey:", (_QWORD)v24, CFSTR("album_pid"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[ML3Track trackValueAreInTheCloud:](ML3Track, "trackValueAreInTheCloud:", v4);
  v10 = objc_msgSend(*((id *)&v26 + 1), "integerValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("ROWID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend((id)v26, "longLongValue");
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v4, "setValue:forKey:", *((_QWORD *)&v24 + 1), CFSTR("album.album"));
    objc_msgSend(v4, "setValue:forKey:", (_QWORD)v25, CFSTR("album.sort_album"));
    objc_msgSend(v4, "setValue:forKey:", *((_QWORD *)&v25 + 1), CFSTR("item_video.season_number"));
    if (v9)
    {
      if (v10)
        goto LABEL_9;
    }
    else if (v10 != 2)
    {
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v19, CFSTR("cloud_status"));

LABEL_9:
    -[ML3Collection updateRepresentativeCollectionValues:existingRepresentativePersistentID:forUpdateTrackValues:](self, "updateRepresentativeCollectionValues:existingRepresentativePersistentID:forUpdateTrackValues:", v8, v13, v4);
    objc_msgSend(v8, "objectForKey:", CFSTR("representative_item_pid"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "longLongValue");
    if (v20)
      v18 = v20;
    else
      v18 = v13;
    goto LABEL_12;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("album.album"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v14, CFSTR("album"));

  objc_msgSend(v4, "objectForKey:", CFSTR("album.sort_album"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v15, CFSTR("sort_album"));

  objc_msgSend(v4, "objectForKey:", CFSTR("item_video.season_number"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v16, CFSTR("season_number"));

  if (!v9)
  {
    v18 = 0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v17, CFSTR("cloud_status"));
  v18 = 0;
LABEL_12:

LABEL_13:
  if (objc_msgSend(v11, "longLongValue") != v18)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super.super._library);
    v22 = (char)+[ML3Track trackWithPersistentID:existsInLibrary:](ML3Track, "trackWithPersistentID:existsInLibrary:", v18, WeakRetained);

    if ((v22 & 1) == 0)
      objc_msgSend(v8, "setValue:forKey:", v11, CFSTR("representative_item_pid"));
  }
  -[ML3Entity setValuesForPropertiesWithDictionary:](self, "setValuesForPropertiesWithDictionary:", v8);

  for (i = 5; i != -1; --i)
}

+ (id)defaultOrderingTerms
{
  return (id)ML3AlbumDefaultOrderingTerms;
}

+ (id)predisambiguatedProperties
{
  return (id)ML3AlbumPredisambiguatedPropertyForProperties;
}

+ (id)allProperties
{
  return (id)ML3AlbumAllProperties;
}

+ (BOOL)libraryContentsChangeForProperty:(id)a3
{
  id v3;
  char v4;
  char v5;
  char v6;
  char v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("date_played_local"));
  v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("liked_state"));
  v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("liked_state_changed_date"));
  v7 = objc_msgSend(v3, "isEqualToString:", CFSTR("app_data"));

  return (v4 | v5 | v6 | v7) ^ 1;
}

+ (BOOL)libraryDynamicChangeForProperty:(id)a3
{
  return objc_msgSend((id)ML3AlbumContentsUnchangingProperties, "containsObject:", a3);
}

+ (BOOL)assistantLibraryContentsChangeForProperty:(id)a3
{
  return objc_msgSend((id)ML3AlbumNoAssistantSyncProperties, "containsObject:", a3) ^ 1;
}

+ (BOOL)propertyIsCountProperty:(id)a3
{
  return a3 == CFSTR("item_pid");
}

+ (id)countingQueryForBaseQuery:(id)a3 countProperty:(id)a4 forIdentifier:(int64_t)a5
{
  id v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (__CFString *)a4;
  objc_msgSend(v8, "predicateIncludingSystemwidePredicates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "predicateIncludingSystemwidePredicates");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v11;
    +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("album_pid"), a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("album_pid"), a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v9 == CFSTR("item_pid"))
  {
    objc_msgSend(v8, "library");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3Entity queryWithLibrary:predicate:options:](ML3Track, "queryWithLibrary:predicate:options:", v16, v14, objc_msgSend(v8, "options"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18.receiver = a1;
    v18.super_class = (Class)&OBJC_METACLASS___ML3Album;
    objc_msgSendSuper2(&v18, sel_countingQueryForBaseQuery_countProperty_forIdentifier_, v8, v9, a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

+ (id)propertiesForGroupingKey
{
  if (propertiesForGroupingKey_onceToken_4678 != -1)
    dispatch_once(&propertiesForGroupingKey_onceToken_4678, &__block_literal_global_4679);
  return (id)propertiesForGroupingKey_propertiesForGroupingKey_4680;
}

+ (id)propertiesForGroupingUniqueCollections
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("grouping_key");
  v3[1] = CFSTR("album_artist_pid");
  v3[2] = CFSTR("feed_url");
  v3[3] = CFSTR("season_number");
  v3[4] = CFSTR("album_year");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)trackForeignPersistentID
{
  __CFString *v2;

  v2 = CFSTR("album_pid");
  return CFSTR("album_pid");
}

void __36__ML3Album_propertiesForGroupingKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("album"), 0);
  v1 = (void *)propertiesForGroupingKey_propertiesForGroupingKey_4680;
  propertiesForGroupingKey_propertiesForGroupingKey_4680 = v0;

}

- (id)multiverseIdentifier
{
  MIPMultiverseIdentifier *v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  MIPLibraryIdentifier *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  MIPLibraryIdentifier *v15;
  void *v17;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MIPMultiverseIdentifier);
  -[MIPMultiverseIdentifier setMediaObjectType:](v3, "setMediaObjectType:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._library);
  objc_msgSend(WeakRetained, "libraryUID");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "syncLibraryID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MIPLibraryIdentifier);
  -[MIPLibraryIdentifier setLibraryId:](v7, "setLibraryId:", self->super.super._persistentID);
  v17 = (void *)v5;
  -[MIPLibraryIdentifier setLibraryName:](v7, "setLibraryName:", v5);
  -[MIPMultiverseIdentifier addLibraryIdentifiers:](v3, "addLibraryIdentifiers:", v7);
  v18[0] = CFSTR("album");
  v18[1] = CFSTR("album_item_store.store_playlist_id");
  v18[2] = CFSTR("album_item_store.cloud_album_id");
  v18[3] = CFSTR("sync_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3Entity getValuesForProperties:](self, "getValuesForProperties:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("album"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPMultiverseIdentifier setName:](v3, "setName:", v10);

  objc_msgSend(v9, "objectForKey:", CFSTR("album_item_store.store_playlist_id"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPMultiverseIdentifier setStoreId:](v3, "setStoreId:", objc_msgSend(v11, "longLongValue"));

  objc_msgSend(v9, "objectForKey:", CFSTR("album_item_store.cloud_album_id"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPMultiverseIdentifier setCloudUniversalLibraryId:](v3, "setCloudUniversalLibraryId:", v12);

  objc_msgSend(v9, "objectForKey:", CFSTR("sync_id"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "longLongValue");

  if (v14 >= 1 && objc_msgSend(v6, "length"))
  {
    v15 = objc_alloc_init(MIPLibraryIdentifier);
    -[MIPLibraryIdentifier setLibraryId:](v15, "setLibraryId:", v14);
    -[MIPLibraryIdentifier setLibraryName:](v15, "setLibraryName:", v6);
    -[MIPMultiverseIdentifier addLibraryIdentifiers:](v3, "addLibraryIdentifiers:", v15);

  }
  return v3;
}

- (id)protocolItem
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  _QWORD v8[10];

  v8[9] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("ROWID");
  v8[1] = CFSTR("album");
  v8[2] = CFSTR("sort_album");
  v8[3] = CFSTR("user_rating");
  v8[4] = CFSTR("album_artist.album_artist");
  v8[5] = CFSTR("album_artist_pid");
  v8[6] = CFSTR("liked_state");
  v8[7] = CFSTR("liked_state_changed_date");
  v8[8] = CFSTR("cloud_library_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3Entity getValuesForProperties:](self, "getValuesForProperties:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._library);
  +[ML3Album protocolItemWithProperties:inLibrary:](ML3Album, "protocolItemWithProperties:inLibrary:", v4, WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)protocolItemWithProperties:(id)a3 inLibrary:(id)a4
{
  id v5;
  id v6;
  MIPAlbum *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  ML3AlbumArtist *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v24;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MIPAlbum);
  objc_msgSend(v5, "objectForKey:", CFSTR("album_artist_pid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "longLongValue");

  objc_msgSend(v5, "objectForKey:", CFSTR("album_item_store.store_playlist_id"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "longLongValue");

  v24 = v6;
  if (v9)
  {
    v12 = -[ML3Entity initWithPersistentID:inLibrary:]([ML3AlbumArtist alloc], "initWithPersistentID:inLibrary:", v9, v6);
    -[ML3AlbumArtist protocolItem](v12, "protocolItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("album"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("sort_album"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("user_rating"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "integerValue");

  objc_msgSend(v5, "objectForKey:", CFSTR("liked_state"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "integerValue");

  objc_msgSend(v5, "objectForKey:", CFSTR("liked_state_changed_date"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "longLongValue");

  objc_msgSend(v5, "objectForKey:", CFSTR("cloud_library_id"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    -[MIPAlbum setStoreId:](v7, "setStoreId:", v11);
  if (v13)
    -[MIPAlbum setArtist:](v7, "setArtist:", v13);
  if (objc_msgSend(v14, "length"))
    -[MIPAlbum setName:](v7, "setName:", v14);
  if (objc_msgSend(v15, "length"))
    -[MIPAlbum setSortName:](v7, "setSortName:", v15);
  if ((_DWORD)v17)
    -[MIPAlbum setUserRating:](v7, "setUserRating:", v17);
  -[MIPAlbum setLikedState:](v7, "setLikedState:", v19);
  -[MIPAlbum setLikedStateChangedDate:](v7, "setLikedStateChangedDate:", v21);
  -[MIPAlbum setCloudId:](v7, "setCloudId:", v22);

  return v7;
}

@end
