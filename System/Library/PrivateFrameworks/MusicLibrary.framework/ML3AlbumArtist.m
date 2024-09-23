@implementation ML3AlbumArtist

+ (id)databaseTable
{
  return CFSTR("album_artist");
}

+ (int64_t)revisionTrackingCode
{
  return 7;
}

+ (void)initialize
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
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
  _QWORD v17[13];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() == a1)
  {
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("album_artist"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)ML3AlbumArtistDefaultOrderingTerms;
    ML3AlbumArtistDefaultOrderingTerms = v4;

    v6 = objc_alloc_init(MEMORY[0x1E0C99D80]);
    v7 = (void *)ML3AlbumArtistSectionPropertyForProperties;
    ML3AlbumArtistSectionPropertyForProperties = (uint64_t)v6;

    v17[0] = CFSTR("ROWID");
    v17[1] = CFSTR("album_artist");
    v17[2] = CFSTR("sort_album_artist");
    v17[3] = CFSTR("store_id");
    v17[4] = CFSTR("cloud_universal_library_id");
    v17[5] = CFSTR("classical_experience_available");
    v17[6] = CFSTR("liked_state");
    v17[7] = CFSTR("liked_state_changed_date");
    v17[8] = CFSTR("sync_id");
    v17[9] = CFSTR("album_artist_pid");
    v17[10] = CFSTR("grouping_key");
    v17[11] = CFSTR("sort_order");
    v17[12] = CFSTR("sort_order_section");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 13);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)ML3AlbumArtistAllProperties;
    ML3AlbumArtistAllProperties = v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("liked_state"), CFSTR("liked_state_changed_date"), 0);
    v11 = (void *)ML3AlbumArtistContentsUnchangingProperties;
    ML3AlbumArtistContentsUnchangingProperties = v10;

    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(a1, "predisambiguateProperties:toDictionary:", ML3AlbumArtistAllProperties, v12);
    v13 = (void *)ML3AlbumArtistPredisambiguatedPropertyForProperties;
    ML3AlbumArtistPredisambiguatedPropertyForProperties = (uint64_t)v12;
    v14 = v12;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("album_artist.album_artist"), CFSTR("album_artist"), CFSTR("ROWID"), CFSTR("representative_item_pid"), 0);
    v16 = (void *)ML3TrackForeignPropertyForML3AlbumArtistProperties;
    ML3TrackForeignPropertyForML3AlbumArtistProperties = v15;

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
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id WeakRetained;
  char v21;
  uint64_t i;
  __int128 v23;
  __int128 v24;
  id v25;
  _QWORD v26[6];

  v26[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = CFSTR("ROWID");
  v26[0] = CFSTR("ROWID");
  v26[1] = CFSTR("album_artist");
  v26[2] = CFSTR("sort_album_artist");
  v6 = CFSTR("representative_item_pid");
  v26[3] = CFSTR("representative_item_pid");
  v7 = CFSTR("cloud_status");
  v26[4] = CFSTR("cloud_status");
  v25 = 0;
  v23 = 0u;
  v24 = 0u;
  -[ML3Entity getValues:forProperties:count:](self, "getValues:forProperties:count:", &v23, v26, 5);
  objc_msgSend(v4, "setValue:forKey:", (_QWORD)v23, CFSTR("album_artist_pid"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[ML3Track trackValueAreInTheCloud:](ML3Track, "trackValueAreInTheCloud:", v4);
  v10 = objc_msgSend(v25, "integerValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("ROWID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(*((id *)&v24 + 1), "longLongValue");
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v4, "setValue:forKey:", *((_QWORD *)&v23 + 1), CFSTR("album_artist.album_artist"));
    objc_msgSend(v4, "setValue:forKey:", (_QWORD)v24, CFSTR("album_artist.sort_album_artist"));
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
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v18, CFSTR("cloud_status"));

LABEL_9:
    -[ML3Collection updateRepresentativeCollectionValues:existingRepresentativePersistentID:forUpdateTrackValues:](self, "updateRepresentativeCollectionValues:existingRepresentativePersistentID:forUpdateTrackValues:", v8, v13, v4);
    objc_msgSend(v8, "objectForKey:", CFSTR("representative_item_pid"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v16, "longLongValue");
    if (v19)
      v17 = v19;
    else
      v17 = v13;
    goto LABEL_12;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("album_artist.album_artist"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v14, CFSTR("album_artist"));

  objc_msgSend(v4, "objectForKey:", CFSTR("album_artist.sort_album_artist"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v15, CFSTR("sort_album_artist"));

  if (!v9)
  {
    v17 = 0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v16, CFSTR("cloud_status"));
  v17 = 0;
LABEL_12:

LABEL_13:
  if (objc_msgSend(v11, "longLongValue") != v17)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super.super._library);
    v21 = (char)+[ML3Track trackWithPersistentID:existsInLibrary:](ML3Track, "trackWithPersistentID:existsInLibrary:", v17, WeakRetained);

    if ((v21 & 1) == 0)
      objc_msgSend(v8, "setValue:forKey:", v11, CFSTR("representative_item_pid"));
  }
  -[ML3Entity setValuesForPropertiesWithDictionary:](self, "setValuesForPropertiesWithDictionary:", v8);

  for (i = 4; i != -1; --i)
}

+ (id)defaultOrderingTerms
{
  return (id)ML3AlbumArtistDefaultOrderingTerms;
}

+ (id)sectionPropertyForProperty:(id)a3
{
  return (id)objc_msgSend((id)ML3AlbumArtistSectionPropertyForProperties, "objectForKey:", a3);
}

+ (id)predisambiguatedProperties
{
  return (id)ML3AlbumArtistPredisambiguatedPropertyForProperties;
}

+ (id)allProperties
{
  return (id)ML3AlbumArtistAllProperties;
}

+ (BOOL)libraryDynamicChangeForProperty:(id)a3
{
  return objc_msgSend((id)ML3AlbumArtistContentsUnchangingProperties, "containsObject:", a3);
}

+ (BOOL)libraryContentsChangeForProperty:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend((id)ML3AlbumArtistContentsUnchangingProperties, "containsObject:", v3) & 1) != 0)
    LOBYTE(v4) = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("app_data")) ^ 1;

  return v4;
}

+ (id)foreignPropertyForProperty:(id)a3 entityClass:(Class)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v6 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___ML3AlbumArtist;
  objc_msgSendSuper2(&v9, sel_foreignPropertyForProperty_entityClass_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if ((Class)objc_opt_class() == a4)
    {
      objc_msgSend((id)ML3TrackForeignPropertyForML3AlbumArtistProperties, "objectForKey:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

+ (BOOL)propertyIsCountProperty:(id)a3
{
  return a3 == CFSTR("item_pid") || a3 == CFSTR("album_pid");
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
  uint64_t v17;
  objc_super v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (__CFString *)a4;
  objc_msgSend(v8, "predicateIncludingSystemwidePredicates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "predicateIncludingSystemwidePredicates");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("album_artist_pid"), a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("album_artist_pid"), a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v9 == CFSTR("item_pid"))
  {
    objc_msgSend(v8, "library");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3Entity queryWithLibrary:predicate:options:](ML3Track, "queryWithLibrary:predicate:options:", v16, v14, objc_msgSend(v8, "options"));
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v15 = (void *)v17;

    goto LABEL_10;
  }
  if (v9 == CFSTR("album_pid"))
  {
    objc_msgSend(v8, "library");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3Entity queryWithLibrary:predicate:orderingTerms:propertyToCount:options:](ML3Track, "queryWithLibrary:predicate:orderingTerms:propertyToCount:options:", v16, v14, 0, CFSTR("album_pid"), objc_msgSend(v8, "options"));
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v19.receiver = a1;
  v19.super_class = (Class)&OBJC_METACLASS___ML3AlbumArtist;
  objc_msgSendSuper2(&v19, sel_countingQueryForBaseQuery_countProperty_forIdentifier_, v8, v9, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v15;
}

+ (id)propertiesForGroupingKey
{
  if (propertiesForGroupingKey_onceToken_7661 != -1)
    dispatch_once(&propertiesForGroupingKey_onceToken_7661, &__block_literal_global_7662);
  return (id)propertiesForGroupingKey_propertiesForGroupingKey_7663;
}

+ (id)trackForeignPersistentID
{
  __CFString *v2;

  v2 = CFSTR("album_artist_pid");
  return CFSTR("album_artist_pid");
}

+ (id)propertiesForGroupingUniqueCollections
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("grouping_key");
  v3[1] = CFSTR("store_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)deleteFromLibrary:(id)a3 deletionType:(int)a4 persistentIDs:(const int64_t *)a5 count:(unint64_t)a6 usingConnection:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  unsigned int v14;
  objc_super v16;

  v10 = *(_QWORD *)&a4;
  v12 = a3;
  v13 = a7;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___ML3AlbumArtist;
  v14 = objc_msgSendSuper2(&v16, sel_deleteFromLibrary_deletionType_persistentIDs_count_usingConnection_, v12, v10, a5, a6, v13);
  if (v14)
    objc_msgSend(v12, "repairAlbumArtistRelationshipsWithConnection:", v13);

  return v14;
}

void __42__ML3AlbumArtist_propertiesForGroupingKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("album_artist"), 0);
  v1 = (void *)propertiesForGroupingKey_propertiesForGroupingKey_7663;
  propertiesForGroupingKey_propertiesForGroupingKey_7663 = v0;

}

- (id)multiverseIdentifier
{
  MIPMultiverseIdentifier *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  MIPLibraryIdentifier *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  MIPLibraryIdentifier *v16;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MIPMultiverseIdentifier);
  -[MIPMultiverseIdentifier setMediaObjectType:](v3, "setMediaObjectType:", 8);
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._library);
  objc_msgSend(WeakRetained, "libraryUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "syncLibraryID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MIPLibraryIdentifier);
  -[MIPLibraryIdentifier setLibraryId:](v7, "setLibraryId:", self->super.super._persistentID);
  -[MIPLibraryIdentifier setLibraryName:](v7, "setLibraryName:", v5);
  -[MIPMultiverseIdentifier addLibraryIdentifiers:](v3, "addLibraryIdentifiers:", v7);
  v18[0] = CFSTR("album_artist");
  v18[1] = CFSTR("store_id");
  v18[2] = CFSTR("sync_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3Entity getValuesForProperties:](self, "getValuesForProperties:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("album_artist"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPMultiverseIdentifier setName:](v3, "setName:", v10);

  objc_msgSend(v9, "objectForKey:", CFSTR("store_id"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "longLongValue");

  if (v12 >= 1)
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("store_id"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIPMultiverseIdentifier setStoreId:](v3, "setStoreId:", objc_msgSend(v13, "longLongValue"));

  }
  objc_msgSend(v9, "objectForKey:", CFSTR("sync_id"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "longLongValue");

  if (v15 >= 1 && objc_msgSend(v6, "length"))
  {
    v16 = objc_alloc_init(MIPLibraryIdentifier);
    -[MIPLibraryIdentifier setLibraryId:](v16, "setLibraryId:", v15);
    -[MIPLibraryIdentifier setLibraryName:](v16, "setLibraryName:", v6);
    -[MIPMultiverseIdentifier addLibraryIdentifiers:](v3, "addLibraryIdentifiers:", v16);

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
  v8[1] = CFSTR("album_artist");
  v8[2] = CFSTR("sort_album_artist");
  v8[3] = CFSTR("cloud_universal_library_id");
  v8[4] = CFSTR("store_id");
  v8[5] = CFSTR("liked_state");
  v8[6] = CFSTR("liked_state_changed_date");
  v8[7] = CFSTR("sort_order");
  v8[8] = CFSTR("sort_order_section");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3Entity getValuesForProperties:](self, "getValuesForProperties:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._library);
  +[ML3AlbumArtist protocolItemWithProperties:inLibrary:](ML3AlbumArtist, "protocolItemWithProperties:inLibrary:", v4, WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)protocolItemWithProperties:(id)a3 inLibrary:(id)a4
{
  id v4;
  MIPArtist *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v21;

  v4 = a3;
  v5 = objc_alloc_init(MIPArtist);
  objc_msgSend(v4, "objectForKey:", CFSTR("ROWID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longLongValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("store_id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "longLongValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("album_artist"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("sort_album_artist"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("cloud_universal_library_id"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("liked_state"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v13, "integerValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("liked_state_changed_date"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "longLongValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("sort_order"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "longLongValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("sort_order_section"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "longLongValue");
  if (v7)
    -[MIPArtist setPersistentId:](v5, "setPersistentId:", v7);
  if (v9)
    -[MIPArtist setStoreId:](v5, "setStoreId:", v9);
  if (objc_msgSend(v10, "length"))
    -[MIPArtist setName:](v5, "setName:", v10);
  if (objc_msgSend(v11, "length"))
    -[MIPArtist setSortName:](v5, "setSortName:", v11);
  if (v17)
    -[MIPArtist setSortOrder:](v5, "setSortOrder:", v17);
  if (v19)
    -[MIPArtist setSortOrderSection:](v5, "setSortOrderSection:", v19);
  -[MIPArtist setLikedState:](v5, "setLikedState:", v21);
  -[MIPArtist setLikedStateChangedDate:](v5, "setLikedStateChangedDate:", v15);
  -[MIPArtist setCloudUniversalLibraryId:](v5, "setCloudUniversalLibraryId:", v12);

  return v5;
}

@end
