@implementation ML3Composer

+ (id)joinClausesForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend((id)ML3ComposerJoinsForProperties, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___ML3Composer;
    objc_msgSendSuper2(&v10, sel_joinClausesForProperty_, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

+ (id)databaseTable
{
  return CFSTR("composer");
}

+ (int64_t)revisionTrackingCode
{
  return 5;
}

+ (void)initialize
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() == a1)
  {
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("composer"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)ML3ComposerDefaultOrderingTerms;
    ML3ComposerDefaultOrderingTerms = v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("ROWID"), CFSTR("composer"), CFSTR("sort_composer"), CFSTR("representative_item_pid"), 0);
    v7 = (void *)ML3ComposerAllProperties;
    ML3ComposerAllProperties = v6;

    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(a1, "predisambiguateProperties:toDictionary:", ML3ComposerAllProperties, v8);
    v9 = (void *)ML3ComposerPredisambiguatedPropertyForProperties;
    ML3ComposerPredisambiguatedPropertyForProperties = (uint64_t)v8;
    v10 = v8;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("composer.composer"), CFSTR("composer"), CFSTR("ROWID"), CFSTR("representative_item_pid"), 0);
    v12 = (void *)ML3TrackForeignPropertyForML3ComposerProperties;
    ML3TrackForeignPropertyForML3ComposerProperties = v11;

    v15 = CFSTR("composer_item_store.store_composer_id");
    v16 = &unk_1E5BAA8A8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)ML3ComposerJoinsForProperties;
    ML3ComposerJoinsForProperties = v13;

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
  __int128 v25;
  _QWORD v26[7];

  v26[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = CFSTR("ROWID");
  v26[0] = CFSTR("ROWID");
  v26[1] = CFSTR("composer");
  v26[2] = CFSTR("sort_composer");
  v6 = CFSTR("representative_item_pid");
  v26[3] = CFSTR("representative_item_pid");
  v26[4] = 0;
  v7 = CFSTR("cloud_status");
  v26[5] = CFSTR("cloud_status");
  v24 = 0u;
  v25 = 0u;
  v23 = 0u;
  -[ML3Entity getValues:forProperties:count:](self, "getValues:forProperties:count:", &v23, v26, 6);
  objc_msgSend(v4, "setValue:forKey:", (_QWORD)v23, CFSTR("composer_pid"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[ML3Track trackValueAreInTheCloud:](ML3Track, "trackValueAreInTheCloud:", v4);
  v10 = objc_msgSend(*((id *)&v25 + 1), "integerValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("ROWID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(*((id *)&v24 + 1), "longLongValue");
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v4, "setValue:forKey:", *((_QWORD *)&v23 + 1), CFSTR("composer.composer"));
    objc_msgSend(v4, "setValue:forKey:", (_QWORD)v24, CFSTR("composer.sort_composer"));
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
  objc_msgSend(v4, "objectForKey:", CFSTR("composer.composer"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v14, CFSTR("composer"));

  objc_msgSend(v4, "objectForKey:", CFSTR("composer.sort_composer"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v15, CFSTR("sort_composer"));

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

  for (i = 5; i != -1; --i)
}

+ (id)defaultOrderingTerms
{
  return (id)ML3ComposerDefaultOrderingTerms;
}

+ (id)predisambiguatedProperties
{
  return (id)ML3ComposerPredisambiguatedPropertyForProperties;
}

+ (id)allProperties
{
  return (id)ML3ComposerAllProperties;
}

+ (id)foreignPropertyForProperty:(id)a3 entityClass:(Class)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v6 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___ML3Composer;
  objc_msgSendSuper2(&v9, sel_foreignPropertyForProperty_entityClass_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if ((Class)objc_opt_class() == a4)
    {
      objc_msgSend((id)ML3TrackForeignPropertyForML3ComposerProperties, "objectForKey:", v6);
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
  return a3 == CFSTR("item_pid") || a3 == CFSTR("album_pid") || a3 == CFSTR("item_artist_pid");
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
  uint64_t v18;
  const __CFString *v19;
  objc_super v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (__CFString *)a4;
  objc_msgSend(v8, "predicateIncludingSystemwidePredicates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "predicateIncludingSystemwidePredicates");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v11;
    +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("composer_pid"), a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("composer_pid"), a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v9 == CFSTR("item_pid"))
  {
    objc_msgSend(v8, "library");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3Entity queryWithLibrary:predicate:options:](ML3Track, "queryWithLibrary:predicate:options:", v16, v14, objc_msgSend(v8, "options"));
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v15 = (void *)v17;

    goto LABEL_13;
  }
  if (v9 == CFSTR("album_pid"))
  {
    objc_msgSend(v8, "library");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v8, "options");
    v19 = CFSTR("album_pid");
LABEL_11:
    +[ML3Entity queryWithLibrary:predicate:orderingTerms:propertyToCount:options:](ML3Track, "queryWithLibrary:predicate:orderingTerms:propertyToCount:options:", v16, v14, 0, v19, v18);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (v9 == CFSTR("item_artist_pid"))
  {
    objc_msgSend(v8, "library");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v8, "options");
    v19 = CFSTR("item_artist_pid");
    goto LABEL_11;
  }
  v21.receiver = a1;
  v21.super_class = (Class)&OBJC_METACLASS___ML3Composer;
  objc_msgSendSuper2(&v21, sel_countingQueryForBaseQuery_countProperty_forIdentifier_, v8, v9, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v15;
}

+ (id)propertiesForGroupingKey
{
  if (propertiesForGroupingKey_onceToken_7563 != -1)
    dispatch_once(&propertiesForGroupingKey_onceToken_7563, &__block_literal_global_7564);
  return (id)propertiesForGroupingKey_propertiesForGroupingKey_7565;
}

+ (id)trackForeignPersistentID
{
  __CFString *v2;

  v2 = CFSTR("composer_pid");
  return CFSTR("composer_pid");
}

void __39__ML3Composer_propertiesForGroupingKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("composer"), 0);
  v1 = (void *)propertiesForGroupingKey_propertiesForGroupingKey_7565;
  propertiesForGroupingKey_propertiesForGroupingKey_7565 = v0;

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
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MIPMultiverseIdentifier);
  -[MIPMultiverseIdentifier setMediaObjectType:](v3, "setMediaObjectType:", 3);
  v4 = objc_alloc_init(MIPLibraryIdentifier);
  -[MIPLibraryIdentifier setLibraryId:](v4, "setLibraryId:", self->super.super._persistentID);
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._library);
  objc_msgSend(WeakRetained, "libraryUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPLibraryIdentifier setLibraryName:](v4, "setLibraryName:", v6);

  -[MIPMultiverseIdentifier addLibraryIdentifiers:](v3, "addLibraryIdentifiers:", v4);
  v11[0] = CFSTR("composer");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3Entity getValuesForProperties:](self, "getValuesForProperties:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("composer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPMultiverseIdentifier setName:](v3, "setName:", v9);

  return v3;
}

- (id)protocolItem
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("ROWID");
  v8[1] = CFSTR("composer");
  v8[2] = CFSTR("sort_composer");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3Entity getValuesForProperties:](self, "getValuesForProperties:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._library);
  +[ML3Composer protocolItemWithProperties:inLibrary:](ML3Composer, "protocolItemWithProperties:inLibrary:", v4, WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)protocolItemWithProperties:(id)a3 inLibrary:(id)a4
{
  id v4;
  MIPArtist *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(MIPArtist);
  objc_msgSend(v4, "objectForKey:", CFSTR("composer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("sort_composer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
    -[MIPArtist setName:](v5, "setName:", v6);
  if (objc_msgSend(v7, "length"))
    -[MIPArtist setSortName:](v5, "setSortName:", v7);

  return v5;
}

@end
