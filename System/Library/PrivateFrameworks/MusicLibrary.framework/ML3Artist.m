@implementation ML3Artist

+ (BOOL)propertyIsCountProperty:(id)a3
{
  return a3 == CFSTR("item_pid") || a3 == CFSTR("album_pid");
}

+ (id)databaseTable
{
  return CFSTR("item_artist");
}

+ (int64_t)revisionTrackingCode
{
  return 2;
}

+ (void)initialize
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[10];

  v11[9] = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() == a1)
  {
    v3 = (void *)ML3ArtistDefaultOrderingTerms;
    ML3ArtistDefaultOrderingTerms = MEMORY[0x1E0C9AA60];

    v11[0] = CFSTR("ROWID");
    v11[1] = CFSTR("item_artist");
    v11[2] = CFSTR("sort_item_artist");
    v11[3] = CFSTR("series_name");
    v11[4] = CFSTR("sort_series_name");
    v11[5] = CFSTR("representative_item_pid");
    v11[6] = CFSTR("classical_experience_available");
    v11[7] = CFSTR("sync_id");
    v11[8] = CFSTR("item_artist_pid");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 9);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)ML3ArtistAllProperties;
    ML3ArtistAllProperties = v4;

    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(a1, "predisambiguateProperties:toDictionary:", ML3ArtistAllProperties, v6);
    v7 = (void *)ML3ArtistPredisambiguatedPropertyForProperties;
    ML3ArtistPredisambiguatedPropertyForProperties = (uint64_t)v6;
    v8 = v6;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("item_artist.item_artist"), CFSTR("item_artist"), CFSTR("ROWID"), CFSTR("representative_item_pid"), 0);
    v10 = (void *)ML3TrackForeignPropertyForML3ArtistProperties;
    ML3TrackForeignPropertyForML3ArtistProperties = v9;

  }
}

+ (id)predisambiguatedProperties
{
  return (id)ML3ArtistPredisambiguatedPropertyForProperties;
}

+ (id)foreignPropertyForProperty:(id)a3 entityClass:(Class)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v6 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___ML3Artist;
  objc_msgSendSuper2(&v9, sel_foreignPropertyForProperty_entityClass_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if ((Class)objc_opt_class() == a4)
    {
      objc_msgSend((id)ML3TrackForeignPropertyForML3ArtistProperties, "objectForKey:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
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
  id v27;
  _QWORD v28[8];

  v28[7] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = CFSTR("ROWID");
  v28[0] = CFSTR("ROWID");
  v28[1] = CFSTR("item_artist");
  v28[2] = CFSTR("sort_item_artist");
  v28[3] = CFSTR("series_name");
  v28[4] = CFSTR("sort_series_name");
  v6 = CFSTR("representative_item_pid");
  v28[5] = CFSTR("representative_item_pid");
  v7 = CFSTR("cloud_status");
  v28[6] = CFSTR("cloud_status");
  v27 = 0;
  v25 = 0u;
  v26 = 0u;
  v24 = 0u;
  -[ML3Entity getValues:forProperties:count:](self, "getValues:forProperties:count:", &v24, v28, 7);
  objc_msgSend(v4, "setValue:forKey:", (_QWORD)v24, CFSTR("item_artist_pid"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[ML3Track trackValueAreInTheCloud:](ML3Track, "trackValueAreInTheCloud:", v4);
  v10 = objc_msgSend(v27, "integerValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("ROWID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(*((id *)&v26 + 1), "longLongValue");
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v4, "setValue:forKey:", *((_QWORD *)&v24 + 1), CFSTR("item_artist.item_artist"));
    objc_msgSend(v4, "setValue:forKey:", (_QWORD)v25, CFSTR("item_artist.sort_item_artist"));
    objc_msgSend(v4, "setValue:forKey:", *((_QWORD *)&v25 + 1), CFSTR("item_artist.series_name"));
    objc_msgSend(v4, "setValue:forKey:", (_QWORD)v26, CFSTR("item_artist.sort_series_name"));
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
  objc_msgSend(v4, "objectForKey:", CFSTR("item_artist.item_artist"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v14, CFSTR("item_artist"));

  objc_msgSend(v4, "objectForKey:", CFSTR("item_artist.sort_item_artist"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v15, CFSTR("sort_item_artist"));

  objc_msgSend(v4, "objectForKey:", CFSTR("item_artist.sort_series_name"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v16, CFSTR("sort_series_name"));

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

  for (i = 6; i != -1; --i)
}

+ (id)defaultOrderingTerms
{
  return (id)ML3ArtistDefaultOrderingTerms;
}

+ (id)allProperties
{
  return (id)ML3ArtistAllProperties;
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
    +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("item_artist_pid"), a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("item_artist_pid"), a5);
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
  v19.super_class = (Class)&OBJC_METACLASS___ML3Artist;
  objc_msgSendSuper2(&v19, sel_countingQueryForBaseQuery_countProperty_forIdentifier_, v8, v9, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v15;
}

+ (id)propertiesForGroupingKey
{
  if (propertiesForGroupingKey_onceToken != -1)
    dispatch_once(&propertiesForGroupingKey_onceToken, &__block_literal_global_4152);
  return (id)propertiesForGroupingKey_propertiesForGroupingKey;
}

+ (id)trackForeignPersistentID
{
  __CFString *v2;

  v2 = CFSTR("item_artist_pid");
  return CFSTR("item_artist_pid");
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

void __37__ML3Artist_propertiesForGroupingKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("series_name"), CFSTR("item_artist"), 0);
  v1 = (void *)propertiesForGroupingKey_propertiesForGroupingKey;
  propertiesForGroupingKey_propertiesForGroupingKey = v0;

}

- (id)multiverseIdentifier
{
  MIPMultiverseIdentifier *v3;
  MIPLibraryIdentifier *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MIPMultiverseIdentifier);
  -[MIPMultiverseIdentifier setMediaObjectType:](v3, "setMediaObjectType:", 2);
  v4 = objc_alloc_init(MIPLibraryIdentifier);
  -[MIPLibraryIdentifier setLibraryId:](v4, "setLibraryId:", self->super.super._persistentID);
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._library);
  objc_msgSend(WeakRetained, "libraryUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPLibraryIdentifier setLibraryName:](v4, "setLibraryName:", v6);

  -[MIPMultiverseIdentifier addLibraryIdentifiers:](v3, "addLibraryIdentifiers:", v4);
  v14[0] = CFSTR("item_artist");
  v14[1] = CFSTR("store_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3Entity getValuesForProperties:](self, "getValuesForProperties:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("item_artist"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPMultiverseIdentifier setName:](v3, "setName:", v9);

  objc_msgSend(v8, "objectForKey:", CFSTR("store_id"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "longLongValue");

  if (v11 >= 1)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("store_id"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIPMultiverseIdentifier setStoreId:](v3, "setStoreId:", objc_msgSend(v12, "longLongValue"));

  }
  return v3;
}

- (id)protocolItem
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("ROWID");
  v8[1] = CFSTR("item_artist");
  v8[2] = CFSTR("sort_item_artist");
  v8[3] = CFSTR("store_id");
  v8[4] = CFSTR("sync_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3Entity getValuesForProperties:](self, "getValuesForProperties:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._library);
  +[ML3Artist protocolItemWithProperties:inLibrary:](ML3Artist, "protocolItemWithProperties:inLibrary:", v4, WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)protocolItemWithProperties:(id)a3 inLibrary:(id)a4
{
  id v5;
  id v6;
  MIPArtist *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MIPLibraryIdentifier *v18;
  void *v19;
  MIPLibraryIdentifier *v20;
  void *v21;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(MIPArtist);
  objc_msgSend(v6, "objectForKey:", CFSTR("ROWID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "longLongValue");

  objc_msgSend(v6, "objectForKey:", CFSTR("store_id"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "longLongValue");

  objc_msgSend(v6, "objectForKey:", CFSTR("sync_id"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "longLongValue");

  objc_msgSend(v6, "objectForKey:", CFSTR("item_artist"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("sort_item_artist"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    -[MIPArtist setPersistentId:](v7, "setPersistentId:", v9);
  if (v11)
    -[MIPArtist setStoreId:](v7, "setStoreId:", v11);
  if (objc_msgSend(v14, "length"))
    -[MIPArtist setName:](v7, "setName:", v14);
  if (objc_msgSend(v15, "length"))
    -[MIPArtist setSortName:](v7, "setSortName:", v15);
  objc_msgSend(v5, "libraryUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncLibraryID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_alloc_init(MIPLibraryIdentifier);
  -[MIPLibraryIdentifier setLibraryId:](v18, "setLibraryId:", v9);
  -[MIPLibraryIdentifier setLibraryName:](v18, "setLibraryName:", v16);
  -[MIPArtist libraryIdentifiers](v7, "libraryIdentifiers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v18);

  if (v13 >= 1 && objc_msgSend(v17, "length"))
  {
    v20 = objc_alloc_init(MIPLibraryIdentifier);
    -[MIPLibraryIdentifier setLibraryId:](v20, "setLibraryId:", v13);
    -[MIPLibraryIdentifier setLibraryName:](v20, "setLibraryName:", v17);
    -[MIPArtist libraryIdentifiers](v7, "libraryIdentifiers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v20);

  }
  return v7;
}

@end
