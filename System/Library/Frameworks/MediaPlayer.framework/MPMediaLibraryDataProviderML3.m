@implementation MPMediaLibraryDataProviderML3

- (NSString)uniqueIdentifier
{
  NSString *uniqueIdentifier;
  NSString *v4;
  NSString *v5;
  __CFString *v6;

  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    -[ML3MusicLibrary libraryUID](self->_library, "libraryUID");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v4;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  if (uniqueIdentifier)
    v6 = (__CFString *)uniqueIdentifier;
  else
    v6 = CFSTR("device");
  return (NSString *)v6;
}

- (ML3MusicLibrary)library
{
  return self->_library;
}

- (void)setLibraryPublicEntityFilterPredicatesWithCloudFilteringType:(int64_t)a3 additionalFilterPredicates:(id)a4
{
  id v5;

  -[MPMediaLibraryDataProviderML3 ML3SystemFilterPredicatesWithGroupingType:cloudTrackFilteringType:subscriptionFilteringOptions:additionalFilterPredicates:](self, "ML3SystemFilterPredicatesWithGroupingType:cloudTrackFilteringType:subscriptionFilteringOptions:additionalFilterPredicates:", 0, a3, 1, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary setLibraryPublicEntityFilterPredicates:](self->_library, "setLibraryPublicEntityFilterPredicates:", v5);

}

- (void)setLibraryPublicContainerFilterPredicatesWithCloudFilteringType:(int64_t)a3 additionalFilterPredicates:(id)a4
{
  id v5;

  -[MPMediaLibraryDataProviderML3 ML3SystemFilterPredicatesWithGroupingType:cloudTrackFilteringType:subscriptionFilteringOptions:additionalFilterPredicates:](self, "ML3SystemFilterPredicatesWithGroupingType:cloudTrackFilteringType:subscriptionFilteringOptions:additionalFilterPredicates:", 6, a3, 1, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary setLibraryPublicContainerFilterPredicates:](self->_library, "setLibraryPublicContainerFilterPredicates:", v5);

}

- (void)setLibraryEntityFilterPredicatesWithCloudFilteringType:(int64_t)a3 additionalFilterPredicates:(id)a4
{
  id v5;

  -[MPMediaLibraryDataProviderML3 ML3SystemFilterPredicatesWithGroupingType:cloudTrackFilteringType:subscriptionFilteringOptions:additionalFilterPredicates:](self, "ML3SystemFilterPredicatesWithGroupingType:cloudTrackFilteringType:subscriptionFilteringOptions:additionalFilterPredicates:", 0, a3, 0, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary setLibraryEntityFilterPredicates:](self->_library, "setLibraryEntityFilterPredicates:", v5);

}

- (void)setLibraryContainerFilterPredicatesWithCloudFilteringType:(int64_t)a3 additionalFilterPredicates:(id)a4
{
  id v5;

  -[MPMediaLibraryDataProviderML3 ML3SystemFilterPredicatesWithGroupingType:cloudTrackFilteringType:subscriptionFilteringOptions:additionalFilterPredicates:](self, "ML3SystemFilterPredicatesWithGroupingType:cloudTrackFilteringType:subscriptionFilteringOptions:additionalFilterPredicates:", 6, a3, 0, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ML3MusicLibrary setLibraryContainerFilterPredicates:](self->_library, "setLibraryContainerFilterPredicates:", v5);

}

- (BOOL)itemExistsWithPersistentID:(unint64_t)a3
{
  return objc_msgSend(MEMORY[0x1E0D512C8], "trackWithPersistentID:visibleInLibrary:", a3, self->_library);
}

- (void)loadProperties:(id)a3 ofCollectionWithIdentifier:(int64_t)a4 groupingType:(int64_t)a5 completionBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  v11 = ML3CollectionEntityClassForGroupingType();
  if (v11 == (id)objc_opt_class())
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          v17 = ML3CollectionEntityClassForMPMediaItemCollectionProperty(*(void **)(*((_QWORD *)&v18 + 1) + 8 * i));
          if (v17 != v11)
          {
            v11 = v17;
            goto LABEL_12;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_12:

  }
  -[MPMediaLibraryDataProviderML3 _loadProperties:ofEntityWithIdentifier:ML3EntityClass:completionBlock:](self, "_loadProperties:ofEntityWithIdentifier:ML3EntityClass:completionBlock:", v9, a4, v11, v10, (_QWORD)v18);

}

- (id)ML3SystemFilterPredicatesWithGroupingType:(int64_t)a3 cloudTrackFilteringType:(int64_t)a4 subscriptionFilteringOptions:(int64_t)a5 additionalFilterPredicates:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MPMediaLibraryDataProviderML3 systemFilterPredicatesWithGroupingType:cloudTrackFilteringType:subscriptionFilteringOptions:](self, "systemFilterPredicatesWithGroupingType:cloudTrackFilteringType:subscriptionFilteringOptions:", a3, a4, a5);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "count"))
      goto LABEL_8;
    if (v11)
    {
      objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v10);
      v12 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v12;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (objc_msgSend(v10, "count"))
  {
LABEL_6:
    v11 = v10;
    goto LABEL_8;
  }
  v11 = 0;
LABEL_8:
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v18);
        if (a3 == 6)
          objc_msgSend(v19, "ML3PredicateForContainer");
        else
          objc_msgSend(v19, "ML3PredicateForTrack", (_QWORD)v24);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          objc_msgSend(v13, "addObject:", v20);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v16);
  }

  if (objc_msgSend(v13, "count"))
    v21 = v13;
  else
    v21 = 0;
  v22 = v21;

  return v22;
}

- (void)loadProperties:(id)a3 ofItemWithIdentifier:(int64_t)a4 completionBlock:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a3;
  -[MPMediaLibraryDataProviderML3 _loadProperties:ofEntityWithIdentifier:ML3EntityClass:completionBlock:](self, "_loadProperties:ofEntityWithIdentifier:ML3EntityClass:completionBlock:", v9, a4, objc_opt_class(), v8);

}

- (void)_loadProperties:(id)a3 ofEntityWithIdentifier:(int64_t)a4 ML3EntityClass:(Class)a5 completionBlock:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD);
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  uint64_t *v24;
  MPMediaLibraryDataProviderML3 *v25;
  void *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  MPMediaLibraryDataProviderML3 *v36;
  uint64_t v37;
  uint64_t *v38;
  void *v39;
  void (**v40)(id, _QWORD);
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(id, _QWORD))a6;
  v12 = objc_msgSend(v10, "count");
  if (v12)
  {
    v13 = v12;
    v35 = a4;
    v36 = self;
    v40 = v11;
    v39 = (void *)MEMORY[0x19403A624]();
    v38 = &v34;
    v14 = (char *)&v34 - ((8 * v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v14, 8 * v13);
    v37 = 8 * v13;
    bzero(v14, 8 * v13);
    v44 = 0u;
    v45 = 0u;
    v43 = 0u;
    v42 = 0u;
    v41 = v10;
    v15 = v10;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v43 != v19)
            objc_enumerationMutation(v15);
          v21 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          -[objc_class propertyForMPMediaEntityProperty:](a5, "propertyForMPMediaEntityProperty:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            objc_storeStrong((id *)&v14[8 * v18], v21);
            objc_storeStrong((id *)&v14[8 * v18++], v22);
          }

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v17);
    }
    else
    {
      v18 = 0;
    }

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v18);
    if (v18)
    {
      v34 = (uint64_t)&v34;
      v24 = (uint64_t *)((char *)&v34 - ((8 * v18 + 15) & 0xFFFFFFFFFFFFFFF0));
      bzero(v24, 8 * v18);
      v25 = v36;
      v26 = (void *)-[objc_class newWithPersistentID:inLibrary:](a5, "newWithPersistentID:inLibrary:", v35, v36->_library);
      objc_msgSend(v26, "getValues:forProperties:count:", v24, v14, v18);
      v27 = v14;
      do
      {
        v29 = *(_QWORD *)v27;
        v27 += 8;
        v28 = v29;
        v30 = *v24++;
        -[MPMediaLibraryDataProviderML3 adjustedValueForMPProperty:ofEntity:withDefaultValue:](v25, "adjustedValueForMPProperty:ofEntity:withDefaultValue:", v28, v26, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setValue:forKey:", v31, v28);

        --v18;
      }
      while (v18);

    }
    v11 = v40;
    ((void (**)(id, void *))v40)[2](v40, v23);

    v32 = v37;
    v33 = v37;
    do
    {

      v33 -= 8;
    }
    while (v33);
    v10 = v41;
    do
    {

      v32 -= 8;
    }
    while (v32);
    objc_autoreleasePoolPop(v39);
  }
  else
  {
    v11[2](v11, MEMORY[0x1E0C9AA70]);
  }

}

- (id)adjustedValueForMPProperty:(id)a3 ofEntity:(id)a4 withDefaultValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  id v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (adjustedValueForMPProperty_ofEntity_withDefaultValue__onceToken != -1)
    dispatch_once(&adjustedValueForMPProperty_ofEntity_withDefaultValue__onceToken, &__block_literal_global_203);
  v11 = (const char *)NSMapGet((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, v8);
  if (v11)
  {
    objc_msgSend(self, v11, v9, v10);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v10;
  }
  v13 = v12;

  return v13;
}

- (id)_adjustedPropertyMediaTypeOfEntity:(id)a3 withDefaultValue:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", MPMediaTypeForMLMediaType(objc_msgSend(a4, "integerValue", a3)));
}

- (id)systemFilterPredicatesWithGroupingType:(int64_t)a3 cloudTrackFilteringType:(int64_t)a4 subscriptionFilteringOptions:(int64_t)a5
{
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  int v38;
  void *v39;
  void *v40;
  id v41;

  v38 = a5;
  v8 = (void *)objc_opt_new();
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:comparisonType:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:comparisonType:", MEMORY[0x1E0C9AAB0], CFSTR("hasNonPurgeableAsset"), 109);
  v41 = (id)objc_claimAutoreleasedReturnValue();
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:comparisonType:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:comparisonType:", MEMORY[0x1E0C9AAB0], CFSTR("isPlayable"), 109);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 <= 2 && +[MPMediaQuery isFilteringDisabled](MPMediaQuery, "isFilteringDisabled"))
  {
    v37 = 1;
    v9 = 1;
  }
  else
  {
    -[MPMediaLibraryDataProviderML3 userIdentity](self, "userIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v11, "canShowCloudMusic");

    -[MPMediaLibraryDataProviderML3 userIdentity](self, "userIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v13, "canShowCloudVideo");

    if (a4 >= 6)
    {
      -[MPMediaLibraryDataProviderML3 userIdentity](self, "userIdentity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "hasProperNetworkConditionsToPlayMedia");

      goto LABEL_7;
    }
  }
  v16 = 1;
LABEL_7:
  if (-[ML3MusicLibrary sagaOnDiskDatabaseRevision](self->_library, "sagaOnDiskDatabaseRevision") < 1)
  {
    v19 = 0;
    v17 = 0;
    v39 = 0;
  }
  else
  {
    +[MPMediaPropertyPredicate predicateWithValue:forProperty:comparisonType:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:comparisonType:", MEMORY[0x1E0C9AAB0], CFSTR("isMatchAudio"), 109);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &unk_1E31E4AE0, CFSTR("mediaType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaConditionalPredicate predicateWithConditionPredicate:thenPredicate:elsePredicate:](MPMediaConditionalPredicate, "predicateWithConditionPredicate:thenPredicate:elsePredicate:", v18, v17, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 1;
  }
  v20 = +[MPMediaQuery isFilteringDisabled](MPMediaQuery, "isFilteringDisabled");
  if (a3 == 6)
  {
    if (((v38 | v20) & 1) == 0)
    {
      if ((dyld_program_sdk_at_least() & 1) == 0)
      {
        +[MPMediaPropertyPredicate predicateWithValue:forProperty:comparisonType:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:comparisonType:", MEMORY[0x1E0C9AAB0], CFSTR("hasItems"), 109);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v21);

      }
      +[MPMediaPropertyPredicate predicateWithValue:forProperty:comparisonType:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:comparisonType:", MEMORY[0x1E0C9AAA0], CFSTR("isHidden"), 109);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v22);

    }
  }
  else
  {
    if (v20)
    {
      switch(a4)
      {
        case 0:
          if (v19)
            goto LABEL_22;
          goto LABEL_23;
        case 2:
          goto LABEL_35;
        case 3:
          if (((v9 | v37) & 1) != 0)
          {
            if ((v37 & 1) != 0)
            {
              if ((v9 & 1) == 0)
              {
                +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &unk_1E31E4B10, CFSTR("mediaType"));
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                +[MPMediaConditionalPredicate predicateWithConditionPredicate:thenPredicate:elsePredicate:](MPMediaConditionalPredicate, "predicateWithConditionPredicate:thenPredicate:elsePredicate:", v29, v41, 0);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "addObject:", v30);

              }
            }
            else
            {
              +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &unk_1E31E4AF8, CFSTR("mediaType"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              +[MPMediaConditionalPredicate predicateWithConditionPredicate:thenPredicate:elsePredicate:](MPMediaConditionalPredicate, "predicateWithConditionPredicate:thenPredicate:elsePredicate:", v34, v41, 0);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObject:", v35);

            }
          }
          else
          {
            objc_msgSend(v8, "addObject:", v41);
          }
          if (v19)
            goto LABEL_22;
          goto LABEL_23;
        case 4:
          if ((v37 & 1) == 0)
            goto LABEL_35;
          if (v19)
            goto LABEL_33;
          goto LABEL_23;
        case 5:
          if ((v9 & 1) == 0)
            goto LABEL_35;
          goto LABEL_23;
        case 6:
          v31 = v41;
          if (((v9 | v37) & v16) != 1)
            goto LABEL_54;
          if ((v37 & 1) != 0)
          {
            if ((v9 & 1) != 0)
              goto LABEL_55;
            +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &unk_1E31E4B10, CFSTR("mediaType"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            +[MPMediaConditionalPredicate predicateWithConditionPredicate:thenPredicate:elsePredicate:](MPMediaConditionalPredicate, "predicateWithConditionPredicate:thenPredicate:elsePredicate:", v32, v41, 0);
            v33 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &unk_1E31E4AF8, CFSTR("mediaType"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            +[MPMediaConditionalPredicate predicateWithConditionPredicate:thenPredicate:elsePredicate:](MPMediaConditionalPredicate, "predicateWithConditionPredicate:thenPredicate:elsePredicate:", v32, v41, 0);
            v33 = objc_claimAutoreleasedReturnValue();
          }
          v36 = (void *)v33;
          objc_msgSend(v8, "addObject:", v33);

          v31 = v40;
LABEL_54:
          objc_msgSend(v8, "addObject:", v31);
LABEL_55:
          if (v19)
            goto LABEL_22;
          goto LABEL_23;
        case 7:
          if ((v37 & v16 & 1) == 0)
            goto LABEL_35;
          objc_msgSend(v8, "addObject:", v40);
          if (v19)
LABEL_33:
            objc_msgSend(v8, "addObject:", v17);
          goto LABEL_23;
        case 8:
          if ((v9 & v16 & 1) != 0)
            objc_msgSend(v8, "addObject:", v40);
          else
LABEL_35:
            objc_msgSend(v8, "addObject:", v41);
          goto LABEL_23;
        default:
          goto LABEL_23;
      }
    }
    +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", MEMORY[0x1E0C9AAA0], CFSTR("isRental"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v23);

    v24 = v41;
    if (((a4 != 2) & v37) != 0)
      v24 = v40;
    v25 = v24;
    objc_msgSend(v8, "addObject:", v25);

    if ((v19 & (v25 != v41)) == 1)
LABEL_22:
      objc_msgSend(v8, "addObject:", v39);
  }
LABEL_23:
  if (objc_msgSend(v8, "count"))
    v26 = v8;
  else
    v26 = 0;
  v27 = v26;

  return v27;
}

- (ICUserIdentity)userIdentity
{
  ICUserIdentity *userIdentity;

  userIdentity = self->_userIdentity;
  if (userIdentity)
    return userIdentity;
  objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
  return (ICUserIdentity *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPMediaEntityCache)entityCache
{
  return self->_entityCache;
}

- (NSString)syncValidity
{
  return (NSString *)-[ML3MusicLibrary libraryUID](self->_library, "libraryUID");
}

- (void)_updateArtworkDataSourceMediaLibraryUniqueIdentifier
{
  void *v3;
  void *v4;
  id v5;

  -[MPMediaLibraryDataProviderML3 artworkDataSource](self, "artworkDataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MPMediaLibraryDataProviderML3 artworkDataSource](self, "artworkDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "uniqueIdentifierForLibrary:", self->_library);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setMediaLibraryUniqueIdentifier:", v4);

  }
}

- (MPArtworkDataSource)artworkDataSource
{
  return self->_artworkDataSource;
}

- (NSString)databasePath
{
  return (NSString *)-[ML3MusicLibrary databasePath](self->_library, "databasePath");
}

+ (id)uniqueIdentifierForLibrary:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  objc_msgSend(a3, "libraryUID");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("device");
  v5 = v3;

  return v5;
}

- (void)setMediaLibrary:(id)a3
{
  objc_storeWeak((id *)&self->_mediaLibrary, a3);
}

- (void)setUserIdentity:(id)a3
{
  ICUserIdentity *v4;
  ICUserIdentity *userIdentity;
  void *v6;
  char v7;
  ICUserIdentity *v8;
  ICUserIdentity *v9;
  ICUserIdentity *v10;

  v4 = (ICUserIdentity *)a3;
  userIdentity = self->_userIdentity;
  v10 = v4;
  if (userIdentity != v4)
  {
    objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ICUserIdentity isEqualToIdentity:inStore:](userIdentity, "isEqualToIdentity:inStore:", v10, v6);

    if ((v7 & 1) == 0)
    {
      v8 = (ICUserIdentity *)-[ICUserIdentity copy](v10, "copy");
      v9 = self->_userIdentity;
      self->_userIdentity = v8;

    }
  }

}

- (id)valueForDatabaseProperty:(id)a3
{
  return (id)-[ML3MusicLibrary valueForDatabaseProperty:](self->_library, "valueForDatabaseProperty:", a3);
}

- (unint64_t)currentEntityRevision
{
  return -[ML3MusicLibrary currentRevision](self->_library, "currentRevision");
}

- (MPMediaLibraryDataProviderML3)initWithLibrary:(id)a3
{
  id v5;
  MPMediaLibraryDataProviderML3 *v6;
  MPMediaLibraryDataProviderML3 *v7;
  MPMediaEntityCache *v8;
  MPMediaEntityCache *entityCache;
  dispatch_queue_t v10;
  OS_dispatch_queue *backgroundTaskQueue;
  dispatch_queue_t v12;
  OS_dispatch_queue *cloudUpdateQueue;
  dispatch_queue_t v14;
  OS_dispatch_queue *entitiesAddedOrRemovedNotificationQueue;
  MPMediaLibraryArtworkDataSource *v16;
  NSOperationQueue *v17;
  NSOperationQueue *setValuesWidthLimitedQueue;
  void *v19;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MPMediaLibraryDataProviderML3;
  v6 = -[MPMediaLibraryDataProviderML3 init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_library, a3);
    v8 = -[MPMediaEntityCache initWithMediaLibraryDataProvider:]([MPMediaEntityCache alloc], "initWithMediaLibraryDataProvider:", v7);
    entityCache = v7->_entityCache;
    v7->_entityCache = v8;

    v10 = dispatch_queue_create("com.apple.MPMediaLibraryDataProviderML3.backgroundTask", 0);
    backgroundTaskQueue = v7->_backgroundTaskQueue;
    v7->_backgroundTaskQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_create("com.apple.MPMediaLibraryDataProviderML3.cloudUpdateQueue", 0);
    cloudUpdateQueue = v7->_cloudUpdateQueue;
    v7->_cloudUpdateQueue = (OS_dispatch_queue *)v12;

    v14 = dispatch_queue_create("com.apple.MPMediaLibraryDataProviderML3.entitiesAddedOrRemovedNotificationQueue", 0);
    entitiesAddedOrRemovedNotificationQueue = v7->_entitiesAddedOrRemovedNotificationQueue;
    v7->_entitiesAddedOrRemovedNotificationQueue = (OS_dispatch_queue *)v14;

    v16 = objc_alloc_init(MPMediaLibraryArtworkDataSource);
    objc_storeStrong((id *)&v7->_artworkDataSource, v16);
    v17 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    setValuesWidthLimitedQueue = v7->_setValuesWidthLimitedQueue;
    v7->_setValuesWidthLimitedQueue = v17;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v7->_setValuesWidthLimitedQueue, "setMaxConcurrentOperationCount:", 5);
    if (v7->_library)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObserver:selector:name:object:", v7, sel__libraryContentsDidChange_, *MEMORY[0x1E0D50B00], v7->_library);
      objc_msgSend(v19, "addObserver:selector:name:object:", v7, sel__libraryEntitiesAddedOrRemoved_, *MEMORY[0x1E0D50B10], v7->_library);
      objc_msgSend(v19, "addObserver:selector:name:object:", v7, sel__dynamicPropertiesDidChange_, *MEMORY[0x1E0D50B20], v7->_library);
      objc_msgSend(v19, "addObserver:selector:name:object:", v7, sel__invisiblePropertiesDidChange_, *MEMORY[0x1E0D50B18], v7->_library);
      objc_msgSend(v19, "addObserver:selector:name:object:", v7, sel__displayValuesDidChange_, *MEMORY[0x1E0D50B08], v7->_library);
      objc_msgSend(v19, "addObserver:selector:name:object:", v7, sel__syncGenerationDidChange_, *MEMORY[0x1E0D50B30], v7->_library);
      objc_msgSend(v19, "addObserver:selector:name:object:", v7, sel__libraryUIDDidChange_, *MEMORY[0x1E0D50B38], v7->_library);
      objc_msgSend(v19, "addObserver:selector:name:object:", v7, sel__libraryCloudLibraryAvailabilityDidChange_, *MEMORY[0x1E0D50AF8], v7->_library);
      objc_msgSend(v19, "addObserver:selector:name:object:", v7, sel__libraryPathDidChange_, *MEMORY[0x1E0D50B28], v7->_library);

    }
    -[MPMediaLibraryDataProviderML3 _updateArtworkDataSourceMediaLibraryUniqueIdentifier](v7, "_updateArtworkDataSourceMediaLibraryUniqueIdentifier");

  }
  return v7;
}

- (void)enumerateEntityChangesAfterSyncAnchor:(id)a3 maximumRevisionType:(int64_t)a4 inUsersLibrary:(BOOL)a5 itemBlock:(id)a6 collectionBlock:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  uint64_t v14;
  ML3MusicLibrary *library;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD v23[13];

  v8 = a5;
  v23[12] = *MEMORY[0x1E0C80C00];
  v12 = a6;
  v13 = a7;
  v14 = objc_msgSend(a3, "longLongValue");
  v23[0] = objc_msgSend(MEMORY[0x1E0D51230], "revisionTrackingCode");
  v23[1] = 6;
  v23[2] = objc_msgSend(MEMORY[0x1E0D511E8], "revisionTrackingCode");
  v23[3] = 2;
  v23[4] = objc_msgSend(MEMORY[0x1E0D511C8], "revisionTrackingCode");
  v23[5] = 1;
  v23[6] = objc_msgSend(MEMORY[0x1E0D51220], "revisionTrackingCode");
  v23[7] = 4;
  v23[8] = objc_msgSend(MEMORY[0x1E0D51258], "revisionTrackingCode");
  v23[9] = 5;
  v23[10] = objc_msgSend(MEMORY[0x1E0D511D0], "revisionTrackingCode");
  v23[11] = 3;
  library = self->_library;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __132__MPMediaLibraryDataProviderML3_enumerateEntityChangesAfterSyncAnchor_maximumRevisionType_inUsersLibrary_itemBlock_collectionBlock___block_invoke;
  v18[3] = &unk_1E3157FD0;
  v21 = 6;
  v22 = v23;
  v19 = v12;
  v20 = v13;
  v16 = v13;
  v17 = v12;
  -[ML3MusicLibrary enumeratePersistentIDsAfterRevision:revisionTrackingCode:maximumRevisionType:forMediaTypes:inUsersLibrary:usingBlock:](library, "enumeratePersistentIDsAfterRevision:revisionTrackingCode:maximumRevisionType:forMediaTypes:inUsersLibrary:usingBlock:", v14, 0x7FFFFFFFFFFFFFFFLL, a4, 0, v8, v18);

}

uint64_t __105__MPMediaLibraryDataProviderML3_enumerateItemIdentifiersForQueryCriteria_ordered_cancelBlock_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)loadQueryCriteria:(id)a3 hasCollectionsWithCompletionBlock:(id)a4
{
  ML3MusicLibrary *library;
  id v7;
  id v8;

  library = self->_library;
  v7 = a4;
  objc_msgSend(a3, "ML3CollectionsQueryInLibrary:", library);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, uint64_t))a4 + 2))(v7, objc_msgSend(v8, "hasEntities"));

}

- (void)loadQueryCriteria:(id)a3 countOfCollectionsWithCompletionBlock:(id)a4
{
  ML3MusicLibrary *library;
  id v7;
  id v8;

  library = self->_library;
  v7 = a4;
  objc_msgSend(a3, "ML3CollectionsQueryInLibrary:", library);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, uint64_t))a4 + 2))(v7, objc_msgSend(v8, "countOfEntities"));

}

- (void)loadQueryCriteria:(id)a3 countOfItemsWithCompletionBlock:(id)a4
{
  ML3MusicLibrary *library;
  id v7;
  id v8;

  library = self->_library;
  v7 = a4;
  objc_msgSend(a3, "ML3ItemsQueryInLibrary:", library);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, uint64_t))a4 + 2))(v7, objc_msgSend(v8, "countOfEntities"));

}

- (id)itemResultSetForQueryCriteria:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "ML3ItemsQueryInLibrary:", self->_library);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D512A0]), "initWithQuery:", v3);

  return v4;
}

- (id)collectionResultSetForQueryCriteria:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "ML3CollectionsQueryInLibrary:", self->_library);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D512A0]), "initWithQuery:", v3);

  return v4;
}

- (void)enumerateItemIdentifiersForQueryCriteria:(id)a3 ordered:(BOOL)a4 cancelBlock:(id)a5 usingBlock:(id)a6
{
  _BOOL8 v7;
  id v10;
  ML3MusicLibrary *library;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a4;
  v10 = a6;
  library = self->_library;
  v12 = a5;
  objc_msgSend(a3, "ML3ItemsQueryInLibrary:", library);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __105__MPMediaLibraryDataProviderML3_enumerateItemIdentifiersForQueryCriteria_ordered_cancelBlock_usingBlock___block_invoke;
  v15[3] = &unk_1E3157B30;
  v16 = v10;
  v14 = v10;
  objc_msgSend(v13, "enumeratePersistentIDsAndProperties:ordered:cancelBlock:usingBlock:", 0, v7, v12, v15);

}

- (int64_t)favoriteSongsPlaylistPersistentID
{
  void *v2;
  void *v3;
  int64_t v4;

  -[ML3MusicLibrary currentDeviceFavoriteSongsPlaylist](self->_library, "currentDeviceFavoriteSongsPlaylist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "persistentID");
  else
    v4 = 0;

  return v4;
}

void __86__MPMediaLibraryDataProviderML3_adjustedValueForMPProperty_ofEntity_withDefaultValue___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 258, 31);
  v1 = (void *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap;
  adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap = v0;

  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("assetURL"), sel__adjustedItemPropertyAssetURLOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("bookmarkTime"), sel__adjustedItemTimeOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("chapterArtworkTimes"), sel__adjustedItemPropertyChapterArtworkTimesOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("chapters"), sel__adjustedItemPropertyChaptersOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("contentRating"), sel__adjustedItemPropertyContentRatingOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("dateAccessed"), sel__adjustedItemDateOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("dateAdded"), sel__adjustedItemNonnullDateOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("episodeNumber"), sel__adjustedItemPropertyEpisodeNumberOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("eqPreset"), sel__adjustedItemPropertyEQPresetOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("filePath"), sel__adjustedItemPropertyFilePathOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("lastPlayedDate"), sel__adjustedItemDateOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("lastSkippedDate"), sel__adjustedItemDateOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("mediaType"), sel__adjustedPropertyMediaTypeOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("movieInfo"), sel__adjustedItemPropertyMovieInfoOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("playbackDuration"), sel__adjustedItemTimeOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("rating"), sel__adjustedItemPropertyRatingOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("releaseDate"), sel__adjustedItemDateOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("seasonName"), sel__adjustedItemPropertySeasonNameOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("seasonNumber"), sel__adjustedItemPropertySeasonNumberOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("startTime"), sel__adjustedItemTimeOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("stopTime"), sel__adjustedItemTimeOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("storeDatePurchased"), sel__adjustedItemDateOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("verifiedIntegrity"), sel__adjustedItemPropertyVerifiedIntegrityOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("volumeAdjustment"), sel__adjustedItemPropertyVolumeAdjustmentOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("volumeNormalization"), sel__adjustedItemPropertyVolumeNormalizationOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("dateCreated"), sel__adjustedItemDateOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("dateModified"), sel__adjustedItemDateOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("datePlayed"), sel__adjustedItemDateOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("datePlayedLocal"), sel__adjustedItemDateOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("seedItems"), sel__adjustedPlaylistPropertySeedItemsOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("dateDownloaded"), sel__adjustedItemDateOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("booklets"), sel__adjustedItemPropertyBookletsOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("albumDatePlayedLocal"), sel__adjustedItemDateOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("likedStateChangedDate"), sel__adjustedItemDateOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("albumArtistDateFavorited"), sel__adjustedItemDateOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("likedStateChangedDate"), sel__adjustedItemDateOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("artistLikedStateChangedDate"), sel__adjustedItemDateOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, CFSTR("albumArtistDateFavorited"), sel__adjustedItemDateOfEntity_withDefaultValue_);
}

- (NSString)name
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)loadQueryCriteria:(id)a3 hasItemsWithCompletionBlock:(id)a4
{
  ML3MusicLibrary *library;
  id v7;
  id v8;

  library = self->_library;
  v7 = a4;
  objc_msgSend(a3, "ML3ItemsQueryInLibrary:", library);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, uint64_t))a4 + 2))(v7, objc_msgSend(v8, "hasEntities"));

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__postEvents, 0);
  v4.receiver = self;
  v4.super_class = (Class)MPMediaLibraryDataProviderML3;
  -[MPMediaLibraryDataProviderML3 dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MPMediaLibraryDataProviderML3 library](self, "library");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<DataProvider: %p> MusicLibrary=%@"), self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)setLibrary:(id)a3
{
  ML3MusicLibrary *v5;
  void *v6;
  NSString *uniqueIdentifier;
  ML3MusicLibrary *v8;

  v5 = (ML3MusicLibrary *)a3;
  if (self->_library != v5)
  {
    v8 = v5;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, 0, self->_library);
    objc_storeStrong((id *)&self->_library, a3);
    uniqueIdentifier = self->_uniqueIdentifier;
    self->_uniqueIdentifier = 0;

    -[MPMediaLibraryDataProviderML3 _updateArtworkDataSourceMediaLibraryUniqueIdentifier](self, "_updateArtworkDataSourceMediaLibraryUniqueIdentifier");
    if (v8)
    {
      objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__libraryContentsDidChange_, *MEMORY[0x1E0D50B00], v8);
      objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__dynamicPropertiesDidChange_, *MEMORY[0x1E0D50B20], v8);
      objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__invisiblePropertiesDidChange_, *MEMORY[0x1E0D50B18], v8);
    }

    v5 = v8;
  }

}

- (NSString)accountDSID
{
  void *v3;
  void *v4;

  -[ML3MusicLibrary sagaAccountID](self->_library, "sagaAccountID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[ML3MusicLibrary jaliscoAccountID](self->_library, "jaliscoAccountID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)lastModifiedDate
{
  ML3MusicLibrary *library;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__20164;
  v22 = __Block_byref_object_dispose__20165;
  v23 = 0;
  library = self->_library;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __49__MPMediaLibraryDataProviderML3_lastModifiedDate__block_invoke;
  v17[3] = &unk_1E3157928;
  v17[4] = &v18;
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](library, "databaseConnectionAllowingWrites:withBlock:", 0, v17);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (id)v19[5];
  v5 = 0;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v24, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "attributesOfItemAtPath:error:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8), 0, (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "fileModificationDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v5 || objc_msgSend(v10, "compare:", v5) == 1)
        {
          v11 = v10;

          v5 = v11;
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v24, 16);
    }
    while (v6);
  }

  _Block_object_dispose(&v18, 8);
  return v5;
}

- (unint64_t)syncGenerationID
{
  return -[ML3MusicLibrary syncGenerationID](self->_library, "syncGenerationID");
}

- (int64_t)playlistGeneration
{
  ML3MusicLibrary *library;
  int64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  library = self->_library;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__MPMediaLibraryDataProviderML3_playlistGeneration__block_invoke;
  v5[3] = &unk_1E3157928;
  v5[4] = &v6;
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](library, "databaseConnectionAllowingWrites:withBlock:", 0, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)writable
{
  return 1;
}

- (BOOL)hasMediaOfType:(unint64_t)a3
{
  char v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__MPMediaLibraryDataProviderML3_hasMediaOfType___block_invoke;
  v5[3] = &unk_1E3163780;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  -[MPMediaLibraryDataProviderML3 performBackgroundTaskWithBlock:](self, "performBackgroundTaskWithBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)hasGeniusMixes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:equalToInteger:", *MEMORY[0x1E0D509E8], 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:equalToInteger:", *MEMORY[0x1E0D509E0], 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D511D8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v3, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateMatchingPredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D51230], "anyInLibrary:predicate:", self->_library, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v8 != 0;

  return (char)self;
}

- (BOOL)hasUbiquitousBookmarkableItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:equalToInteger:", *MEMORY[0x1E0D50F70], 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D511D8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateMatchingPredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D512C8], "anyInLibrary:predicate:", self->_library, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v7 != 0;

  return (char)self;
}

- (int64_t)itemPersistentIDForStoreID:(int64_t)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:equalToInt64:", *MEMORY[0x1E0D51100], a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D512C8], "anyInLibrary:predicate:", self->_library, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "persistentID");

  return v6;
}

- (BOOL)playlistExistsWithPersistentID:(unint64_t)a3
{
  void *v3;
  char v4;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0D51230], "newWithPersistentID:inLibrary:", a3, self->_library);
  v4 = objc_msgSend(v3, "existsInLibrary");

  return v4;
}

- (BOOL)collectionExistsWithPersistentID:(unint64_t)a3 groupingType:(int64_t)a4
{
  id v6;
  void *v7;
  char v8;

  v6 = MPML3CollectionClassFromGroupingType(a4);
  if (v6)
  {
    v7 = (void *)objc_msgSend(v6, "newWithPersistentID:inLibrary:", a3, self->_library);
    v8 = objc_msgSend(v7, "existsInLibrary");

    LOBYTE(v6) = v8;
  }
  return (char)v6;
}

- (BOOL)collectionExistsContainedWithinPersistentIDs:(const unint64_t *)a3 count:(unint64_t)a4 groupingType:(int64_t)a5 existentPID:(unint64_t *)a6
{
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  if (a3)
  {
    v10 = MPML3CollectionClassFromGroupingType(a5);
    objc_msgSend(MEMORY[0x1E0D51290], "predicateWithPersistentIDs:count:shouldContain:", a3, a4, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "queryWithLibrary:predicate:", self->_library, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __109__MPMediaLibraryDataProviderML3_collectionExistsContainedWithinPersistentIDs_count_groupingType_existentPID___block_invoke;
    v15[3] = &unk_1E3157978;
    v15[4] = &v20;
    v15[5] = &v16;
    objc_msgSend(v12, "enumeratePersistentIDsUsingBlock:", v15);

    v13 = *((_BYTE *)v21 + 24) != 0;
    if (a6 && *((_BYTE *)v21 + 24))
    {
      *a6 = v17[3];
      v13 = 1;
    }
  }
  else
  {
    v13 = 0;
  }
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  return v13;
}

- (BOOL)collectionExistsWithName:(id)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  void *v12;
  void *v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v8 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  if (v8)
  {
    v9 = MPML3CollectionClassFromGroupingType(a4);
    if ((unint64_t)a4 > 7)
      v10 = 0;
    else
      v10 = **((id **)&unk_1E31581C8 + a4);
    objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:value:comparison:", v10, v8, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "queryWithLibrary:predicate:", self->_library, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __83__MPMediaLibraryDataProviderML3_collectionExistsWithName_groupingType_existentPID___block_invoke;
    v15[3] = &unk_1E3157978;
    v15[4] = &v20;
    v15[5] = &v16;
    objc_msgSend(v13, "enumeratePersistentIDsUsingBlock:", v15);

    v11 = *((_BYTE *)v21 + 24) != 0;
    if (a5 && *((_BYTE *)v21 + 24))
    {
      *a5 = v17[3];
      v11 = 1;
    }
  }
  else
  {
    v11 = 0;
  }
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v11;
}

- (BOOL)collectionExistsWithStoreID:(int64_t)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  if ((unint64_t)a4 > 5)
  {
    v9 = 0;
    goto LABEL_7;
  }
  v9 = **((id **)&unk_1E3158208 + a4);
  if (!v9)
  {
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  v10 = MPML3CollectionClassFromGroupingType(a4);
  objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:equalToInt64:", v9, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queryWithLibrary:predicate:", self->_library, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __86__MPMediaLibraryDataProviderML3_collectionExistsWithStoreID_groupingType_existentPID___block_invoke;
  v15[3] = &unk_1E3157978;
  v15[4] = &v20;
  v15[5] = &v16;
  objc_msgSend(v12, "enumeratePersistentIDsUsingBlock:", v15);

  v13 = *((_BYTE *)v21 + 24) != 0;
  if (a5 && *((_BYTE *)v21 + 24))
    *a5 = v17[3];
LABEL_8:

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  return v13;
}

- (BOOL)collectionExistsWithSagaID:(int64_t)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5
{
  id *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  if (a4)
  {
    if (a4 != 6)
    {
      v10 = 0;
      goto LABEL_10;
    }
    v9 = (id *)MEMORY[0x1E0D50AA8];
  }
  else
  {
    v9 = (id *)MEMORY[0x1E0D51148];
  }
  v10 = *v9;
  if (!v10)
  {
LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }
  v11 = MPML3CollectionClassFromGroupingType(a4);
  objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:equalToInt64:", v10, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queryWithLibrary:predicate:", self->_library, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__MPMediaLibraryDataProviderML3_collectionExistsWithSagaID_groupingType_existentPID___block_invoke;
  v16[3] = &unk_1E3157978;
  v16[4] = &v21;
  v16[5] = &v17;
  objc_msgSend(v13, "enumeratePersistentIDsUsingBlock:", v16);

  v14 = *((_BYTE *)v22 + 24) != 0;
  if (a5 && *((_BYTE *)v22 + 24))
    *a5 = v18[3];
LABEL_11:

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v14;
}

- (BOOL)collectionExistsWithCloudLibraryID:(id)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5
{
  id v8;
  id *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v8 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  if (a4 == 1)
  {
    v9 = (id *)MEMORY[0x1E0D507C0];
  }
  else
  {
    if (a4 != 3)
    {
      v10 = 0;
      goto LABEL_10;
    }
    v9 = (id *)MEMORY[0x1E0D50770];
  }
  v10 = *v9;
  if (!v10)
  {
LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }
  v11 = MPML3CollectionClassFromGroupingType(a4);
  objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:value:comparison:", v10, v8, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queryWithLibrary:predicate:", self->_library, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __93__MPMediaLibraryDataProviderML3_collectionExistsWithCloudLibraryID_groupingType_existentPID___block_invoke;
  v16[3] = &unk_1E3157978;
  v16[4] = &v21;
  v16[5] = &v17;
  objc_msgSend(v13, "enumeratePersistentIDsUsingBlock:", v16);

  v14 = *((_BYTE *)v22 + 24) != 0;
  if (a5 && *((_BYTE *)v22 + 24))
    *a5 = v18[3];
LABEL_11:

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v14;
}

- (BOOL)collectionExistsWithCloudUniversalLibraryID:(id)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5
{
  id v8;
  id v9;
  BOOL v10;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v8 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  if ((unint64_t)a4 > 6 || ((0x4Bu >> a4) & 1) == 0)
  {
    v9 = 0;
LABEL_4:
    v10 = 0;
    goto LABEL_5;
  }
  v9 = **((id **)&unk_1E3158238 + a4);
  if (!v9)
    goto LABEL_4;
  v12 = MPML3CollectionClassFromGroupingType(a4);
  objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:value:comparison:", v9, v8, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "queryWithLibrary:predicate:", self->_library, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __102__MPMediaLibraryDataProviderML3_collectionExistsWithCloudUniversalLibraryID_groupingType_existentPID___block_invoke;
  v15[3] = &unk_1E3157978;
  v15[4] = &v20;
  v15[5] = &v16;
  objc_msgSend(v14, "enumeratePersistentIDsUsingBlock:", v15);

  v10 = *((_BYTE *)v21 + 24) != 0;
  if (a5 && *((_BYTE *)v21 + 24))
    *a5 = v17[3];
LABEL_5:

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

- (BOOL)collectionExistsContainedWithinSyncIDs:(id)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5
{
  id v8;
  id v9;
  id *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v8 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  if (a4 == 1)
  {
    v10 = (id *)MEMORY[0x1E0D50800];
    goto LABEL_5;
  }
  v9 = 0;
  if (a4 == 6)
  {
    v10 = (id *)MEMORY[0x1E0D50AB0];
LABEL_5:
    v9 = *v10;
  }
  if (v8 && objc_msgSend(v8, "count"))
  {
    v11 = MPML3CollectionClassFromGroupingType(a4);
    objc_msgSend(MEMORY[0x1E0D51248], "predicateWithProperty:values:", v9, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "queryWithLibrary:predicate:", self->_library, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __97__MPMediaLibraryDataProviderML3_collectionExistsContainedWithinSyncIDs_groupingType_existentPID___block_invoke;
    v17[3] = &unk_1E3157978;
    v17[4] = &v22;
    v17[5] = &v18;
    objc_msgSend(v13, "enumeratePersistentIDsUsingBlock:", v17);

  }
  v14 = *((unsigned __int8 *)v23 + 24);
  if (a5 && *((_BYTE *)v23 + 24))
    *a5 = v19[3];
  v15 = v14 != 0;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v15;
}

- (id)localizedSectionHeaderForSectionIndex:(unint64_t)a3
{
  return (id)-[ML3MusicLibrary localizedSectionHeaderForSectionIndex:](self->_library, "localizedSectionHeaderForSectionIndex:", a3);
}

- (NSArray)localizedSectionIndexTitles
{
  return (NSArray *)-[ML3MusicLibrary localizedSectionIndexTitles](self->_library, "localizedSectionIndexTitles");
}

- (BOOL)setValue:(id)a3 forDatabaseProperty:(id)a4
{
  return -[ML3MusicLibrary setValue:forDatabaseProperty:](self->_library, "setValue:forDatabaseProperty:", a3, a4);
}

- (BOOL)deleteDatabaseProperty:(id)a3
{
  return -[ML3MusicLibrary deleteDatabaseProperty:](self->_library, "deleteDatabaseProperty:", a3);
}

- (id)multiverseIdentifierForTrackWithPersistentID:(int64_t)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D512C8]), "initWithPersistentID:inLibrary:", a3, self->_library);
  objc_msgSend(v3, "multiverseIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)multiverseIdentifierForCollectionWithPersistentID:(int64_t)a3 groupingType:(int64_t)a4
{
  void *v4;
  void *v5;

  if ((unint64_t)(a4 - 1) > 5)
  {
    v5 = 0;
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(**((Class **)&unk_1E3163C20 + a4 - 1)), "initWithPersistentID:inLibrary:", a3, self->_library);
    objc_msgSend(v4, "multiverseIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)addTracksToMyLibrary:(id)a3
{
  void *v4;
  ML3MusicLibrary *library;
  id v6;
  _QWORD v7[4];
  id v8;
  MPMediaLibraryDataProviderML3 *v9;

  objc_msgSend(a3, "valueForKey:", CFSTR("persistentID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  library = self->_library;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__MPMediaLibraryDataProviderML3_addTracksToMyLibrary___block_invoke;
  v7[3] = &unk_1E31579A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[ML3MusicLibrary performDatabaseTransactionWithBlock:](library, "performDatabaseTransactionWithBlock:", v7);

}

- (void)sdk_addItemWithOpaqueID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v7 = a3;
  -[MPMediaLibraryDataProviderML3 userIdentity](self, "userIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__MPMediaLibraryDataProviderML3_sdk_addItemWithOpaqueID_withCompletion___block_invoke;
  v11[3] = &unk_1E31579C8;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "sdk_addStoreItemWithOpaqueID:completionHandler:", v7, v11);

}

- (id)_storePlatformRequestContext
{
  id v3;
  _QWORD v5[5];

  v3 = objc_alloc(MEMORY[0x1E0DDC0A0]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__MPMediaLibraryDataProviderML3__storePlatformRequestContext__block_invoke;
  v5[3] = &unk_1E315F468;
  v5[4] = self;
  return (id)objc_msgSend(v3, "initWithBlock:", v5);
}

- (void)performStoreItemLibraryImport:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  id v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  MPMediaLibraryDataProviderML3 *v43;
  id v44;
  id v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v38 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v39 = v5;
  objc_msgSend(v5, "importElements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v52 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v14, "storeItem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v6, "addObject:", v14);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v14, "storeItemID"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v16);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v14, "storeItemID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v14, v17);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    }
    while (v11);
  }
  v18 = objc_msgSend(v7, "count");
  if (v18)
  {
    v19 = v18;
    if (v18 == 1)
    {
      objc_msgSend(v7, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v20, "longLongValue");

    }
    else
    {
      v36 = 0;
    }
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v19);
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v27 = v7;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v48 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * j), "stringValue", v36);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v32);

        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      }
      while (v29);
    }

    v33 = objc_alloc_init(MEMORY[0x1E0DDC098]);
    -[MPMediaLibraryDataProviderML3 _storePlatformRequestContext](self, "_storePlatformRequestContext");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setRequestContext:", v34);

    objc_msgSend(v33, "setItemIdentifiers:", v22);
    objc_msgSend(v33, "setPersonalizationStyle:", 0);
    objc_msgSend(v33, "setKeyProfile:", *MEMORY[0x1E0DDBE30]);
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __78__MPMediaLibraryDataProviderML3_performStoreItemLibraryImport_withCompletion___block_invoke;
    v40[3] = &unk_1E31579F0;
    v26 = v38;
    v45 = v38;
    v41 = v8;
    v42 = v6;
    v43 = self;
    v21 = v39;
    v44 = v39;
    v46 = v36;
    v35 = (id)objc_msgSend(v33, "performWithResponseHandler:", v40);

  }
  else
  {
    v21 = v39;
    objc_msgSend(v39, "referralObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v39, "addToDeviceLibraryOnly");
    v24 = objc_msgSend(v39, "addToCloudLibrary");
    v25 = v23;
    v26 = v38;
    -[MPMediaLibraryDataProviderML3 _importStoreItemElements:withReferralObject:addTracksToDeviceLibraryOnly:andAddTracksToCloudLibrary:usingCloudAdamID:withCompletion:](self, "_importStoreItemElements:withReferralObject:addTracksToDeviceLibraryOnly:andAddTracksToCloudLibrary:usingCloudAdamID:withCompletion:", v6, v22, v25, v24, 0, v38);
  }

}

- (void)performStoreAlbumArtistLibraryImport:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t quot;
  uint64_t v15;
  char *v16;
  lldiv_t v17;
  uint64_t v18;
  const UInt8 *v19;
  __CFString *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v28;
  id v29;
  id obj;
  _QWORD v31[4];
  id v32;
  id v33;
  MPMediaLibraryDataProviderML3 *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _QWORD v42[2];

  v42[0] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v28 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "importElements");
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v38 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v12, "storeItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v6, "addObject:", v12);
        }
        else
        {
          quot = objc_msgSend(v12, "storeItemID");
          v15 = quot;
          v16 = (char *)v42 + 1;
          do
          {
            v17 = lldiv(quot, 10);
            quot = v17.quot;
            if (v17.rem >= 0)
              LOBYTE(v18) = v17.rem;
            else
              v18 = -v17.rem;
            *(v16 - 2) = v18 + 48;
            v19 = (const UInt8 *)(v16 - 2);
            --v16;
          }
          while (v17.quot);
          if (v15 < 0)
          {
            *(v16 - 2) = 45;
            v19 = (const UInt8 *)(v16 - 2);
          }
          v20 = (__CFString *)CFStringCreateWithBytes(0, v19, (char *)v42 - (char *)v19, 0x8000100u, 0);
          objc_msgSend(v29, "addObject:", v20);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v12, "storeItemID"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v12, v21);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v9);
  }
  if (objc_msgSend(v29, "count"))
  {
    v22 = objc_alloc_init(MEMORY[0x1E0DDC098]);
    -[MPMediaLibraryDataProviderML3 _storePlatformRequestContext](self, "_storePlatformRequestContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setRequestContext:", v23);

    objc_msgSend(v22, "setItemIdentifiers:", v29);
    objc_msgSend(v22, "setPersonalizationStyle:", 0);
    objc_msgSend(v22, "setKeyProfile:", *MEMORY[0x1E0DDBE30]);
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __85__MPMediaLibraryDataProviderML3_performStoreAlbumArtistLibraryImport_withCompletion___block_invoke;
    v31[3] = &unk_1E3157A18;
    v24 = v28;
    v36 = v28;
    v32 = v7;
    v33 = v6;
    v34 = self;
    v25 = v5;
    v35 = v5;
    v26 = (id)objc_msgSend(v22, "performWithResponseHandler:", v31);

  }
  else
  {
    v25 = v5;
    objc_msgSend(v5, "referralObject");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v24 = v28;
    -[MPMediaLibraryDataProviderML3 _importStoreAlbumArtistElements:withReferralObject:withCompletion:](self, "_importStoreAlbumArtistElements:withReferralObject:withCompletion:", v6, v22, v28);
  }

}

- (void)addPlaylistStoreItemsForLookupItems:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEFAULT, "Parsing track data...", buf, 2u);
  }

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D512C0]), "initWithLookupItems:", v7);
  -[MPMediaLibraryDataProviderML3 userIdentity](self, "userIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "cloudAddToPlaylistBehavior");

  v13 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_msgSend(v9, "trackCount");
    *(_DWORD *)buf = 134217984;
    v26 = v14;
    _os_log_impl(&dword_193B9B000, v13, OS_LOG_TYPE_DEFAULT, "Importing %lu tracks...", buf, 0xCu);
  }
  v15 = v12 != 2;

  -[MPMediaLibraryDataProviderML3 library](self, "library");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "databasePath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_alloc(MEMORY[0x1E0D51278]);
  objc_msgSend(v9, "trackData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithLibraryPath:trackData:playlistData:", v17, v19, 0);

  objc_msgSend(v20, "setTracksAreLibraryOwnedContent:", v15);
  objc_msgSend(v20, "setPendingMatch:", v15);
  objc_msgSend(MEMORY[0x1E0D512D8], "sharedMediaLibraryService");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __84__MPMediaLibraryDataProviderML3_addPlaylistStoreItemsForLookupItems_withCompletion___block_invoke;
  v23[3] = &unk_1E3157A40;
  v24 = v6;
  v22 = v6;
  objc_msgSend(v21, "performImport:fromSource:withProgressBlock:completionHandler:", v20, 6, 0, v23);

}

- (void)_importStoreItemElements:(id)a3 withReferralObject:(id)a4 addTracksToDeviceLibraryOnly:(BOOL)a5 andAddTracksToCloudLibrary:(BOOL)a6 usingCloudAdamID:(int64_t)a7 withCompletion:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  MPStoreItemImportTrackData *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v30[5];
  id v31;
  id v32;
  int64_t v33;
  BOOL v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  _BOOL4 v38;
  __int16 v39;
  _BOOL4 v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v9 = a6;
  v10 = a5;
  v43 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a8;
  v16 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    v36 = objc_msgSend(v13, "count");
    v37 = 1024;
    v38 = v9;
    v39 = 1024;
    v40 = v10;
    v41 = 2114;
    v42 = v13;
    _os_log_impl(&dword_193B9B000, v16, OS_LOG_TYPE_DEFAULT, "Adding %llu store items to library (add to cloud library: %{BOOL}u, local library:%{BOOL}u): %{public}@", buf, 0x22u);
  }

  v17 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_193B9B000, v17, OS_LOG_TYPE_DEFAULT, "Parsing track data...", buf, 2u);
  }

  v18 = -[MPStoreItemImportTrackData initWithImportElements:]([MPStoreItemImportTrackData alloc], "initWithImportElements:", v13);
  v19 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = -[ML3StoreItemTrackData trackCount](v18, "trackCount");
    *(_DWORD *)buf = 134217984;
    v36 = v20;
    _os_log_impl(&dword_193B9B000, v19, OS_LOG_TYPE_DEFAULT, "Importing %lu tracks...", buf, 0xCu);
  }

  -[MPMediaLibraryDataProviderML3 library](self, "library");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "databasePath");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_alloc(MEMORY[0x1E0D51278]);
  -[ML3StoreItemTrackData trackData](v18, "trackData");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithLibraryPath:trackData:playlistData:", v22, v24, 0);

  objc_msgSend(v25, "setTracksAreLibraryOwnedContent:", v10 | v9);
  objc_msgSend(v25, "setPendingMatch:", v10 | v9);
  objc_msgSend(MEMORY[0x1E0D512D8], "sharedMediaLibraryService");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __165__MPMediaLibraryDataProviderML3__importStoreItemElements_withReferralObject_addTracksToDeviceLibraryOnly_andAddTracksToCloudLibrary_usingCloudAdamID_withCompletion___block_invoke;
  v30[3] = &unk_1E3157A68;
  v34 = v9;
  v30[4] = self;
  v31 = v14;
  v32 = v15;
  v33 = a7;
  v27 = v15;
  v28 = v14;
  objc_msgSend(v26, "performImport:fromSource:withProgressBlock:completionHandler:", v25, 6, 0, v30);

}

- (void)_importStoreAlbumArtistElements:(id)a3 withReferralObject:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  MPStoreItemImportAlbumArtistData *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = os_log_create("com.apple.amp.mediaplayer", "Library_Oversize");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v25 = objc_msgSend(v7, "count");
    v26 = 2114;
    v27 = v7;
    _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEFAULT, "Adding %llu store album artists to device only library %{public}@", buf, 0x16u);
  }

  v10 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_DEFAULT, "Parsing album artist data...", buf, 2u);
  }

  v11 = -[MPStoreItemImportAlbumArtistData initWithAlbumArtistImportElements:]([MPStoreItemImportAlbumArtistData alloc], "initWithAlbumArtistImportElements:", v7);
  v12 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = -[ML3StoreItemAlbumArtistData albumArtistCount](v11, "albumArtistCount");
    *(_DWORD *)buf = 134217984;
    v25 = v13;
    _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_DEFAULT, "Importing %lu album artists...", buf, 0xCu);
  }

  -[MPMediaLibraryDataProviderML3 library](self, "library");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "databasePath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc(MEMORY[0x1E0D51278]);
  -[ML3StoreItemAlbumArtistData albumArtistData](v11, "albumArtistData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  MSVTCCIdentityForCurrentProcess();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "initWithLibraryPath:trackData:playlistData:albumArtistData:albumData:clientIdentity:", v15, 0, 0, v17, 0, v18);

  objc_msgSend(MEMORY[0x1E0D512D8], "sharedMediaLibraryService");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __99__MPMediaLibraryDataProviderML3__importStoreAlbumArtistElements_withReferralObject_withCompletion___block_invoke;
  v22[3] = &unk_1E3157A40;
  v23 = v8;
  v21 = v8;
  objc_msgSend(v20, "performImport:fromSource:withProgressBlock:completionHandler:", v19, 6, 0, v22);

}

- (void)importArtworkTokenForEntityPersistentID:(unint64_t)a3 entityType:(int64_t)a4 artworkToken:(id)a5 artworkType:(int64_t)a6 sourceType:(int64_t)a7
{
  id v12;

  v12 = a5;
  -[ML3MusicLibrary importArtworkTokenForEntityPersistentID:entityType:artworkToken:artworkType:sourceType:](self->_library, "importArtworkTokenForEntityPersistentID:entityType:artworkToken:artworkType:sourceType:", a3, a4, v12, a6, a7);

}

- (BOOL)importOriginalArtworkFromImageData:(id)a3 withArtworkToken:(id)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6 mediaType:(unint64_t)a7
{
  unsigned int v7;
  id v12;
  id v13;

  v7 = a7;
  v12 = a4;
  v13 = a3;
  LOBYTE(v7) = -[ML3MusicLibrary importOriginalArtworkFromImageData:withArtworkToken:artworkType:sourceType:mediaType:](self->_library, "importOriginalArtworkFromImageData:withArtworkToken:artworkType:sourceType:mediaType:", v13, v12, a5, a6, MLMediaTypeForMPMediaType(v7));

  return v7;
}

- (void)removeArtworkForEntityPersistentID:(unint64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6
{
  ML3MusicLibrary *library;
  _QWORD v7[9];

  library = self->_library;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __102__MPMediaLibraryDataProviderML3_removeArtworkForEntityPersistentID_entityType_artworkType_sourceType___block_invoke;
  v7[3] = &unk_1E3157A90;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = a4;
  v7[7] = a5;
  v7[8] = a6;
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](library, "databaseConnectionAllowingWrites:withBlock:", 1, v7);
}

- (void)addGlobalPlaylistWithID:(id)a3 andAddToCloudLibrary:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  MPMediaLibraryDataProviderML3 *v23;
  id v24;
  id v25;
  BOOL v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v6 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __89__MPMediaLibraryDataProviderML3_addGlobalPlaylistWithID_andAddToCloudLibrary_completion___block_invoke;
  v27[3] = &unk_1E31624C0;
  v28 = v9;
  v11 = v9;
  v12 = (void *)MEMORY[0x19403A810](v27);
  v19 = v10;
  v20 = 3221225472;
  v21 = __89__MPMediaLibraryDataProviderML3_addGlobalPlaylistWithID_andAddToCloudLibrary_completion___block_invoke_2;
  v22 = &unk_1E3157AB8;
  v26 = v6;
  v23 = self;
  v13 = v8;
  v24 = v13;
  v25 = v12;
  v14 = v12;
  v15 = (void *)MEMORY[0x19403A810](&v19);
  v16 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = "no";
    if (v6)
      v17 = "yes";
    *(_DWORD *)buf = 138412546;
    v31 = v13;
    v32 = 2080;
    v33 = v17;
    _os_log_impl(&dword_193B9B000, v16, OS_LOG_TYPE_DEFAULT, "import global playlist with id %@ - add to cloud library: %s...", buf, 0x16u);
  }

  v29 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1, v19, v20, v21, v22, v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaLibraryDataProviderML3 _addGlobalPlaylistsToLibraryDatabase:asLibraryOwned:completion:](self, "_addGlobalPlaylistsToLibraryDatabase:asLibraryOwned:completion:", v18, 1, v15);

}

- (void)addToLocalDeviceLibraryGlobalPlaylistWithID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEFAULT, "import global playlist with id %@ to local device library", buf, 0xCu);
  }

  v13 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__MPMediaLibraryDataProviderML3_addToLocalDeviceLibraryGlobalPlaylistWithID_completion___block_invoke;
  v11[3] = &unk_1E3161F98;
  v12 = v7;
  v10 = v7;
  -[MPMediaLibraryDataProviderML3 _addGlobalPlaylistsToLibraryDatabase:asLibraryOwned:completion:](self, "_addGlobalPlaylistsToLibraryDatabase:asLibraryOwned:completion:", v9, 1, v11);

}

- (void)addNonLibraryOwnedPlaylistsWithGlobalIDs:(id)a3 completion:(id)a4
{
  -[MPMediaLibraryDataProviderML3 _addGlobalPlaylistsToLibraryDatabase:asLibraryOwned:completion:](self, "_addGlobalPlaylistsToLibraryDatabase:asLibraryOwned:completion:", a3, 0, a4);
}

- (void)_addGlobalPlaylistsToLibraryDatabase:(id)a3 asLibraryOwned:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  MPMediaLibraryDataProviderML3 *v18;
  id v19;
  __int128 *p_buf;
  BOOL v21;
  __int128 buf;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_DEFAULT, "Fetching global playlists with IDs %{public}@...", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__20164;
  v25 = __Block_byref_object_dispose__20165;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0DDC098]);
  -[MPMediaLibraryDataProviderML3 _storePlatformRequestContext](self, "_storePlatformRequestContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRequestContext:", v12);

  objc_msgSend(v11, "setPersonalizationStyle:", 0);
  objc_msgSend(v11, "setKeyProfile:", *MEMORY[0x1E0DDBE30]);
  objc_msgSend(v11, "setItemIdentifiers:", v8);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __96__MPMediaLibraryDataProviderML3__addGlobalPlaylistsToLibraryDatabase_asLibraryOwned_completion___block_invoke;
  v16[3] = &unk_1E3157B08;
  v13 = v8;
  v21 = a4;
  v17 = v13;
  v18 = self;
  p_buf = &buf;
  v14 = v9;
  v19 = v14;
  v15 = (id)objc_msgSend(v11, "performWithResponseHandler:", v16);

  _Block_object_dispose(&buf, 8);
}

- (void)enumerateCollectionIdentifiersForQueryCriteria:(id)a3 ordered:(BOOL)a4 cancelBlock:(id)a5 usingBlock:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  size_t v23;
  void *v24;
  id v25;
  id v26;
  MPMediaLibraryDataProviderML3 *v27;
  _BOOL4 v28;
  id v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  size_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v28 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v29 = a5;
  v26 = a6;
  v27 = self;
  objc_msgSend(v9, "ML3CollectionsQueryInLibrary:", self->_library);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v9;
  objc_msgSend(v9, "collectionPropertiesToFetch");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v10, "entityClass");
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v16 = v11;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v15, "propertyForMPMediaEntityProperty:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          objc_msgSend(v13, "addObject:", v22);
          objc_msgSend(v14, "addObject:", v21);
        }

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v18);
  }

  v23 = objc_msgSend(v14, "count");
  v24 = malloc_type_calloc(v23, 8uLL, 0x80040B8603338uLL);
  objc_msgSend(v14, "getObjects:range:", v24, 0, v23);
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __111__MPMediaLibraryDataProviderML3_enumerateCollectionIdentifiersForQueryCriteria_ordered_cancelBlock_usingBlock___block_invoke;
  v31[3] = &unk_1E3157B58;
  v33 = v23;
  v34 = v24;
  v31[4] = v27;
  v32 = v26;
  v25 = v26;
  objc_msgSend(v10, "enumeratePersistentIDsAndProperties:ordered:cancelBlock:usingBlock:", v13, v28, v29, v31);
  free(v24);

}

- (void)loadValueForAggregateFunction:(id)a3 onItemsForProperty:(id)a4 queryCriteria:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_opt_class();
  objc_msgSend(v11, "ML3ItemsQueryInLibrary:", self->_library);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[MPMediaLibraryDataProviderML3 _loadValueForAggregateFunction:entityClass:property:query:completionBlock:](self, "_loadValueForAggregateFunction:entityClass:property:query:completionBlock:", v13, v14, v12, v15, v10);
}

- (void)loadValueForAggregateFunction:(id)a3 onCollectionsForProperty:(id)a4 queryCriteria:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = ML3CollectionEntityClassForMPMediaItemCollectionProperty(v12);
  objc_msgSend(v11, "ML3CollectionsQueryInLibrary:", self->_library);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[MPMediaLibraryDataProviderML3 _loadValueForAggregateFunction:entityClass:property:query:completionBlock:](self, "_loadValueForAggregateFunction:entityClass:property:query:completionBlock:", v13, v14, v12, v15, v10);
}

- (BOOL)performTransactionWithBlock:(id)a3
{
  id v4;
  ML3MusicLibrary *library;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  library = self->_library;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__MPMediaLibraryDataProviderML3_performTransactionWithBlock___block_invoke;
  v8[3] = &unk_1E3157B80;
  v10 = &v11;
  v6 = v4;
  v9 = v6;
  -[ML3MusicLibrary performDatabaseTransactionWithBlock:](library, "performDatabaseTransactionWithBlock:", v8);
  LOBYTE(library) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)library;
}

- (void)performReadTransactionWithBlock:(id)a3
{
  id v4;
  ML3MusicLibrary *library;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  library = self->_library;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__MPMediaLibraryDataProviderML3_performReadTransactionWithBlock___block_invoke;
  v7[3] = &unk_1E3157BD0;
  v8 = v4;
  v6 = v4;
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](library, "databaseConnectionAllowingWrites:withBlock:", 0, v7);

}

- (BOOL)isCurrentThreadInTransaction
{
  return -[ML3MusicLibrary isCurrentThreadInTransaction](self->_library, "isCurrentThreadInTransaction");
}

- (void)setValue:(id)a3 forProperty:(id)a4 ofItemWithIdentifier:(int64_t)a5 completionBlock:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  NSObject *v25;
  NSObject *v26;
  char v27;
  id v28;
  void *v29;
  NSObject *cloudUpdateQueue;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  _QWORD block[4];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  MPMediaLibraryDataProviderML3 *v51;
  uint64_t *v52;
  __int128 *p_buf;
  uint64_t *v54;
  int64_t v55;
  char v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint8_t v65[4];
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  int64_t v70;
  __int128 buf;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v10 = a4;
  v42 = a6;
  objc_msgSend(MEMORY[0x1E0D512C8], "propertyForMPMediaEntityProperty:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[MPMediaLibraryDataProviderML3 userIdentity](self, "userIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v12);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(MEMORY[0x1E0D512C8], "newWithPersistentID:inLibrary:", a5, self->_library);
    v14 = objc_msgSend(v36, "isCloudEnabled");
    v61 = 0;
    v62 = &v61;
    v63 = 0x2020000000;
    v64 = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v72 = 0x3032000000;
    v73 = __Block_byref_object_copy__20164;
    v74 = __Block_byref_object_dispose__20165;
    v75 = 0;
    v57 = 0;
    v58 = &v57;
    v59 = 0x2020000000;
    v60 = 0;
    objc_msgSend((id)objc_opt_class(), "_unadjustedValueForMPProperty:withDefaultValue:", v10, v40);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0C99DE8];
    v17 = (void *)v15;
    v38 = (void *)v15;
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "arrayWithObject:", v17);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v38)

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v18;
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D50F00]))
    {
      v19 = objc_msgSend(v38, "integerValue");
      v62[3] = v19;
      objc_msgSend(v41, "addObject:", MEMORY[0x1E0C9AAB0]);
      objc_msgSend(v18, "addObject:", *MEMORY[0x1E0D50F08]);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v20;

      objc_msgSend(v41, "addObject:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
      v22 = v18;
      objc_msgSend(v18, "addObject:", *MEMORY[0x1E0D50F10]);
      *((_BYTE *)v58 + 24) = 1;
      if (v14)
      {
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("_itemLikedState")))
        {
          if (v62[3] == 2)
          {
            v35 = *MEMORY[0x1E0D50E80];
            objc_msgSend(v13, "valueForProperty:");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "intValue") == 0;

            v22 = v37;
            if (v24
              && (!_os_feature_enabled_impl() || objc_msgSend(v36, "favoriteSongAddToLibraryBehavior") != 2))
            {
              objc_msgSend(v41, "addObject:", &unk_1E31E4A68);
              objc_msgSend(v37, "addObject:", v35);
              objc_msgSend(v41, "addObject:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
              objc_msgSend(v37, "addObject:", *MEMORY[0x1E0D50C98]);
            }
          }
        }
      }
      v26 = os_log_create("com.apple.amp.mediaplayer", "Library_Oversize");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v65 = 138543874;
        v66 = v41;
        v67 = 2114;
        v68 = v22;
        v69 = 2048;
        v70 = a5;
        _os_log_impl(&dword_193B9B000, v26, OS_LOG_TYPE_DEFAULT, "Setting values=%{public}@ for properties=%{public}@, trackPid=%lld", v65, 0x20u);
      }

      v18 = v37;
    }
    objc_msgSend(v13, "setValues:forProperties:async:withCompletionBlock:", v41, v18, 1, v42);
    v27 = v14;
    if (MPTrackCloudPropertiesToUpload_onceToken != -1)
      dispatch_once(&MPTrackCloudPropertiesToUpload_onceToken, &__block_literal_global_627);
    v28 = (id)MPTrackCloudPropertiesToUpload___trackPropertiesToUpload;
    MPTrackCloudPropertiesToAggregate();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    cloudUpdateQueue = self->_cloudUpdateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__MPMediaLibraryDataProviderML3_setValue_forProperty_ofItemWithIdentifier_completionBlock___block_invoke;
    block[3] = &unk_1E3157C20;
    v56 = v27;
    v44 = v29;
    v45 = v10;
    v46 = v36;
    v55 = a5;
    v47 = v28;
    v48 = v13;
    v52 = &v61;
    p_buf = &buf;
    v49 = v38;
    v54 = &v57;
    v50 = v11;
    v51 = self;
    v31 = v38;
    v39 = v13;
    v32 = v28;
    v33 = v36;
    v34 = v29;
    dispatch_async(cloudUpdateQueue, block);

    _Block_object_dispose(&v57, 8);
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(&v61, 8);
  }
  else
  {
    v25 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_193B9B000, v25, OS_LOG_TYPE_ERROR, "Could not find track property for property=%{public}@", (uint8_t *)&buf, 0xCu);
    }

    if (v42)
      (*((void (**)(id, _QWORD, _QWORD))v42 + 2))(v42, 0, 0);
  }

}

- (void)setValues:(id)a3 forProperties:(id)a4 forItemPersistentIDs:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSOperationQueue *setValuesWidthLimitedQueue;
  uint64_t v21;
  id v22;
  id v23;
  NSObject *cloudUpdateQueue;
  SEL v25;
  void *v26;
  _QWORD block[5];
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v10, "count") && objc_msgSend(v11, "count"))
  {
    v25 = a2;
    v26 = v11;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      v14 = 0;
      do
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D512C8], "propertyForMPMediaEntityProperty:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", v25, self, CFSTR("MPMediaLibraryDataProviderML3.m"), 1481, CFSTR("No ML3Property for MPProperty: %@"), v15);

        }
        objc_msgSend(v12, "addObject:", v17);
        objc_msgSend((id)objc_opt_class(), "_unadjustedValueForMPProperty:withDefaultValue:", v15, v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v18)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v13, "addObject:", v18);

        ++v14;
      }
      while (v14 < objc_msgSend(v10, "count"));
    }
    setValuesWidthLimitedQueue = self->_setValuesWidthLimitedQueue;
    v21 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __78__MPMediaLibraryDataProviderML3_setValues_forProperties_forItemPersistentIDs___block_invoke;
    v29[3] = &unk_1E315D848;
    v29[4] = self;
    v30 = v13;
    v31 = v12;
    v11 = v26;
    v32 = v26;
    v22 = v12;
    v23 = v13;
    -[NSOperationQueue addOperationWithBlock:](setValuesWidthLimitedQueue, "addOperationWithBlock:", v29);
    cloudUpdateQueue = self->_cloudUpdateQueue;
    block[0] = v21;
    block[1] = 3221225472;
    block[2] = __78__MPMediaLibraryDataProviderML3_setValues_forProperties_forItemPersistentIDs___block_invoke_3;
    block[3] = &unk_1E31635F8;
    block[4] = self;
    v28 = v10;
    dispatch_async(cloudUpdateQueue, block);

  }
}

- (void)setValue:(id)a3 forProperty:(id)a4 ofCollectionWithIdentifier:(int64_t)a5 groupingType:(int64_t)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSOperationQueue *setValuesWidthLimitedQueue;
  id v23;
  id v24;
  id v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD *v33;
  _QWORD *v34;
  _BYTE *v35;
  id v36;
  int64_t v37;
  int64_t v38;
  _QWORD v39[3];
  char v40;
  _QWORD v41[4];
  _BYTE buf[24];
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = ML3CollectionEntityClassForGroupingType();
  objc_msgSend(v15, "propertyForMPMediaEntityProperty:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16
    || v15 == (id)objc_opt_class()
    && (v15 = ML3CollectionEntityClassForMPMediaItemCollectionProperty(v13),
        objc_msgSend(v15, "propertyForMPMediaEntityProperty:", v13),
        (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v26 = v13;
    if (v12)
    {
      v17 = v14;
      v18 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v17 = v14;
    }
    v20 = (void *)objc_msgSend(v15, "newWithPersistentID:inLibrary:", a5, self->_library);
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x2020000000;
    v41[3] = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v43 = __Block_byref_object_copy__20164;
    v44 = __Block_byref_object_dispose__20165;
    v45 = 0;
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x2020000000;
    v40 = 1;
    v21 = v12;
    if (setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock__onceToken != -1)
      dispatch_once(&setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock__onceToken, &__block_literal_global_20234);
    setValuesWidthLimitedQueue = self->_setValuesWidthLimitedQueue;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __110__MPMediaLibraryDataProviderML3_setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock___block_invoke_2;
    v27[3] = &unk_1E3157D30;
    v27[4] = self;
    v23 = v18;
    v28 = v23;
    v24 = v16;
    v36 = v15;
    v37 = a5;
    v29 = v24;
    v33 = v39;
    v25 = v20;
    v30 = v25;
    v34 = v41;
    v35 = buf;
    v14 = v17;
    v32 = v17;
    v13 = v26;
    v31 = v26;
    v38 = a6;
    -[NSOperationQueue addOperationWithBlock:](setValuesWidthLimitedQueue, "addOperationWithBlock:", v27);

    v12 = v21;
    _Block_object_dispose(v39, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(v41, 8);
  }
  else
  {
    v19 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a6;
      *(_WORD *)&buf[22] = 2112;
      v43 = (uint64_t (*)(uint64_t, uint64_t))v13;
      _os_log_impl(&dword_193B9B000, v19, OS_LOG_TYPE_ERROR, "entityClass %@ (groupingType = %ld) has no ML3Property for MPProperty %@", buf, 0x20u);
    }

    if (v14)
      (*((void (**)(id, _QWORD, _QWORD))v14 + 2))(v14, 0, 0);
  }

}

- (void)setValue:(id)a3 forProperty:(id)a4 ofPlaylistWithIdentifier:(int64_t)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v10)
  {
    v13 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  v16 = v11;
  v17[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaLibraryDataProviderML3 setValuesForProperties:trackList:andEntryProperties:ofPlaylistWithIdentifier:completionBlock:](self, "setValuesForProperties:trackList:andEntryProperties:ofPlaylistWithIdentifier:completionBlock:", v15, 0, 0, a5, v12);

}

- (void)setValuesForProperties:(id)a3 trackList:(id)a4 andEntryProperties:(id)a5 ofPlaylistWithIdentifier:(int64_t)a6 completionBlock:(id)a7
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSOperationQueue *setValuesWidthLimitedQueue;
  id v25;
  NSObject *v26;
  void *v27;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id obj;
  id v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  __int128 *p_buf;
  int64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 buf;
  uint64_t v60;
  char v61;
  _QWORD v62[2];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v30 = a4;
  v31 = a5;
  v32 = a7;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v42, "count"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0u;
  v58 = 0u;
  v56 = 0u;
  v55 = 0u;
  objc_msgSend(v42, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
  if (v10)
  {
    v40 = 0;
    v11 = *(_QWORD *)v56;
    v12 = *MEMORY[0x1E0D50AB8];
    v39 = *MEMORY[0x1E0D50A48];
    v34 = *MEMORY[0x1E0D50A50];
    v36 = *MEMORY[0x1E0D50AD0];
    v37 = *MEMORY[0x1E0D50AC8];
    v33 = *MEMORY[0x1E0D50E08];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v56 != v11)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0D51230], "propertyForMPMediaEntityProperty:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v42, "objectForKey:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "isEqualToString:", v12))
          {
            if (objc_msgSend(v16, "integerValue") == -1)
            {

              v16 = &unk_1E31E4A80;
            }
            if (!objc_msgSend(v16, "integerValue") || objc_msgSend(v16, "integerValue") == -2)
            {
              objc_msgSend(v43, "setValue:forKey:", &unk_1E31E4A80, v37);
              objc_msgSend(v43, "setValue:forKey:", &unk_1E31E4AC8, v36);
            }
            if (objc_msgSend(v16, "integerValue"))
            {
              if (objc_msgSend(v16, "integerValue") == -2)
              {
                objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:value:comparison:", v33, &unk_1E31E4A80, 1);
                v17 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v38, "setObject:forKey:", &unk_1E31E4AB0, v12);
                v40 = (void *)v17;
              }
              else if (objc_msgSend(v16, "integerValue") >= 1)
              {
                v18 = (void *)MEMORY[0x1E0D511E0];
                objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:equalToInteger:", v12, -1);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v62[0] = v19;
                objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:equalToInteger:", v12, -2);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v62[1] = v20;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "predicateMatchingPredicates:", v21);
                v22 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v38, "setObject:forKey:", &unk_1E31E4A80, v12);
                v40 = (void *)v22;
              }
            }
            else
            {
              objc_msgSend(v38, "setObject:forKey:", &unk_1E31E4A98, v12);
            }
          }
          else if (objc_msgSend(v15, "isEqualToString:", v39))
          {
            objc_msgSend(v43, "setValue:forKey:", v35, v34);
          }
          objc_msgSend(v43, "setValue:forKey:", v16, v15);

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    }
    while (v10);
  }
  else
  {
    v40 = 0;
  }

  if (objc_msgSend(v43, "count"))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v60 = 0x2020000000;
    v61 = 1;
    v23 = (void *)objc_msgSend(MEMORY[0x1E0D51230], "newWithPersistentID:inLibrary:", a6, self->_library);
    setValuesWidthLimitedQueue = self->_setValuesWidthLimitedQueue;
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __126__MPMediaLibraryDataProviderML3_setValuesForProperties_trackList_andEntryProperties_ofPlaylistWithIdentifier_completionBlock___block_invoke;
    v44[3] = &unk_1E3157DC8;
    v44[4] = self;
    p_buf = &buf;
    v25 = v23;
    v45 = v25;
    v46 = v43;
    v47 = v30;
    v48 = v31;
    v49 = v38;
    v50 = v40;
    v54 = a6;
    v52 = v32;
    v51 = v42;
    -[NSOperationQueue addOperationWithBlock:](setValuesWidthLimitedQueue, "addOperationWithBlock:", v44);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v26 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v42;
      _os_log_impl(&dword_193B9B000, v26, OS_LOG_TYPE_DEFAULT, "Failed to map any playlist properties from %{public}@", (uint8_t *)&buf, 0xCu);
    }

    if (v32)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPErrorDomain"), 0, CFSTR("Failed to map provided properties in setValuesForProperties"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v32 + 2))(v32, 0, v27);

    }
  }

}

- (int64_t)playbackHistoryPlaylistPersistentID
{
  void *v2;
  void *v3;
  int64_t v4;

  -[ML3MusicLibrary currentDevicePlaybackHistoryPlaylist](self->_library, "currentDevicePlaybackHistoryPlaylist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "persistentID");
  else
    v4 = 0;

  return v4;
}

- (int64_t)photosMemoriesPlaylistPersistentID
{
  void *v2;
  void *v3;
  int64_t v4;

  -[ML3MusicLibrary currentDevicePhotosMemoriesPlaylist](self->_library, "currentDevicePhotosMemoriesPlaylist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "persistentID");
  else
    v4 = 0;

  return v4;
}

- (int64_t)addPlaylistWithValuesForProperties:(id)a3
{
  return -[MPMediaLibraryDataProviderML3 addPlaylistWithValuesForProperties:trackList:playlistEntryProperties:](self, "addPlaylistWithValuesForProperties:trackList:playlistEntryProperties:", a3, 0, 0);
}

- (int64_t)addPlaylistWithValuesForProperties:(id)a3 trackList:(id)a4 playlistEntryProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int64_t v15;
  _QWORD v17[4];
  id v18;
  MPMediaLibraryDataProviderML3 *v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__20164;
  v27 = __Block_byref_object_dispose__20165;
  v28 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __102__MPMediaLibraryDataProviderML3_addPlaylistWithValuesForProperties_trackList_playlistEntryProperties___block_invoke;
  v17[3] = &unk_1E3157EB8;
  v11 = v8;
  v22 = &v23;
  v18 = v11;
  v19 = self;
  v12 = v9;
  v20 = v12;
  v13 = v10;
  v21 = v13;
  -[MPMediaLibraryDataProviderML3 performTransactionWithBlock:](self, "performTransactionWithBlock:", v17);
  if (v24[5]
    && (+[MPMediaLibrary reloadLibraryDataProvider:](MPMediaLibrary, "reloadLibraryDataProvider:", self),
        (v14 = (void *)v24[5]) != 0))
  {
    v15 = objc_msgSend(v14, "persistentID");
  }
  else
  {
    v15 = 0;
  }

  _Block_object_dispose(&v23, 8);
  return v15;
}

- (int64_t)sdk_addPlaylistWithValuesForProperties:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int64_t v7;
  _QWORD v9[4];
  id v10;
  MPMediaLibraryDataProviderML3 *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__20164;
  v17 = __Block_byref_object_dispose__20165;
  v18 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__MPMediaLibraryDataProviderML3_sdk_addPlaylistWithValuesForProperties___block_invoke;
  v9[3] = &unk_1E3157F30;
  v5 = v4;
  v11 = self;
  v12 = &v13;
  v10 = v5;
  -[MPMediaLibraryDataProviderML3 performTransactionWithBlock:](self, "performTransactionWithBlock:", v9);
  v6 = (void *)v14[5];
  if (v6)
    v7 = objc_msgSend(v6, "persistentID");
  else
    v7 = 0;

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (BOOL)removePlaylistWithIdentifier:(int64_t)a3
{
  BOOL v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__MPMediaLibraryDataProviderML3_removePlaylistWithIdentifier___block_invoke;
  v6[3] = &unk_1E3157DF0;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = a3;
  -[MPMediaLibraryDataProviderML3 performTransactionWithBlock:](self, "performTransactionWithBlock:", v6);
  if (*((_BYTE *)v8 + 24))
  {
    +[MPMediaLibrary reloadLibraryDataProvider:](MPMediaLibrary, "reloadLibraryDataProvider:", self);
    v4 = *((_BYTE *)v8 + 24) != 0;
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)deleteItemsWithIdentifiers:(int64_t *)a3 count:(unint64_t)a4
{
  BOOL v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__MPMediaLibraryDataProviderML3_deleteItemsWithIdentifiers_count___block_invoke;
  v7[3] = &unk_1E3157E18;
  v7[6] = a3;
  v7[7] = a4;
  v7[4] = self;
  v7[5] = &v8;
  -[MPMediaLibraryDataProviderML3 performTransactionWithBlock:](self, "performTransactionWithBlock:", v7);
  if (*((_BYTE *)v9 + 24))
  {
    +[MPMediaLibrary reloadLibraryDataProvider:](MPMediaLibrary, "reloadLibraryDataProvider:", self);
    v5 = *((_BYTE *)v9 + 24) != 0;
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)removeItemsWithIdentifiers:(int64_t *)a3 count:(unint64_t)a4
{
  BOOL v5;
  _QWORD v7[8];
  char v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__MPMediaLibraryDataProviderML3_removeItemsWithIdentifiers_count___block_invoke;
  v7[3] = &unk_1E3157E40;
  v7[6] = a3;
  v7[7] = a4;
  v8 = 1;
  v7[4] = self;
  v7[5] = &v9;
  -[MPMediaLibraryDataProviderML3 performTransactionWithBlock:](self, "performTransactionWithBlock:", v7);
  if (*((_BYTE *)v10 + 24))
  {
    +[MPMediaLibrary reloadLibraryDataProvider:](MPMediaLibrary, "reloadLibraryDataProvider:", self);
    v5 = *((_BYTE *)v10 + 24) != 0;
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v9, 8);
  return v5;
}

- (void)_invalidatePersistentKeysForIdentifiers:(int64_t *)a3 count:(unint64_t)a4
{
  __int128 v4;
  unint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  __int128 v28;
  NSObject *log;
  void *v30;
  uint64_t v31;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD block[5];
  _QWORD v37[4];
  id v38;
  MPMediaLibraryDataProviderML3 *v39;
  uint64_t *v40;
  void *v41;
  id v42;
  char v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint8_t buf[4];
  MPMediaLibraryDataProviderML3 *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  _QWORD v54[6];

  v54[3] = *MEMORY[0x1E0C80C00];
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  if (a4)
  {
    v5 = a4;
    v31 = *MEMORY[0x1E0D50D40];
    v34 = *MEMORY[0x1E0D50E90];
    v35 = *MEMORY[0x1E0D50F30];
    *(_QWORD *)&v4 = 138543618;
    v28 = v4;
    do
    {
      v8 = (void *)*a3++;
      v7 = v8;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D512C8]), "initWithPersistentID:inLibrary:", v8, self->_library);
      v54[0] = v35;
      v54[1] = v31;
      v54[2] = v34;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "getValuesForProperties:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v35);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "integerValue");

      objc_msgSend(v11, "objectForKeyedSubscript:", v34);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "BOOLValue");

      if (v13 == 4)
        v16 = v15;
      else
        v16 = 0;
      if (v16 == 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v31);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "length"))
        {
          -[ML3MusicLibrary libraryContainerPathByAppendingPathComponent:](self->_library, "libraryContainerPathByAppendingPathComponent:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = 0;
        }
        v43 = 0;
        v19 = objc_msgSend(v33, "fileExistsAtPath:isDirectory:", v18, &v43, v28);
        if (v43)
          v20 = v19;
        else
          v20 = 0;
        if (v20 == 1)
        {
          v21 = os_log_create("com.apple.amp.mediaplayer", "Library");
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v49 = self;
            v50 = 2048;
            v51 = v7;
            v52 = 2114;
            v53 = v18;
            _os_log_impl(&dword_193B9B000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Looking for offline keys for track with persistentID %lld, in path '%{public}@", buf, 0x20u);
          }

          objc_msgSend(MEMORY[0x1E0DDBF40], "pendingInvalidationKeyStorePath");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v33, "fileExistsAtPath:", v30) & 1) == 0)
          {
            v42 = 0;
            objc_msgSend(v33, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v30, 1, 0, &v42);
            v22 = v42;
            if (v22)
            {
              log = os_log_create("com.apple.amp.mediaplayer", "Library");
              if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v22, "msv_description");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v28;
                v49 = self;
                v50 = 2114;
                v51 = v23;
                _os_log_impl(&dword_193B9B000, log, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create key purgatory directory error=%{public}@", buf, 0x16u);

              }
            }

          }
          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDBF68]), "initWithPath:", v30);
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDBF68]), "initWithPath:", v18);
          v37[0] = MEMORY[0x1E0C809B0];
          v37[1] = 3221225472;
          v37[2] = __79__MPMediaLibraryDataProviderML3__invalidatePersistentKeysForIdentifiers_count___block_invoke;
          v37[3] = &unk_1E3157E68;
          v26 = v24;
          v38 = v26;
          v39 = self;
          v40 = &v44;
          v41 = v7;
          objc_msgSend(v25, "enumerateKeyEntriesUsingBlock:", v37);

        }
      }

      --v5;
    }
    while (v5);
    if (*((_BYTE *)v45 + 24))
    {
      dispatch_get_global_queue(0, 0);
      v27 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __79__MPMediaLibraryDataProviderML3__invalidatePersistentKeysForIdentifiers_count___block_invoke_153;
      block[3] = &unk_1E3163508;
      block[4] = self;
      dispatch_async(v27, block);

    }
  }
  _Block_object_dispose(&v44, 8);
}

- (void)setItemsWithIdentifiers:(id)a3 forPlaylistWithIdentifier:(int64_t)a4 completionBlock:(id)a5
{
  -[MPMediaLibraryDataProviderML3 setItemsWithIdentifiers:andEntryProperties:forPlaylistWithIdentifier:completionBlock:](self, "setItemsWithIdentifiers:andEntryProperties:forPlaylistWithIdentifier:completionBlock:", a3, MEMORY[0x1E0C9AA70], a4, a5);
}

- (void)setItemsWithIdentifiers:(id)a3 andEntryProperties:(id)a4 forPlaylistWithIdentifier:(int64_t)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD block[5];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD *v35;
  _QWORD v36[3];
  char v37;
  _QWORD v38[4];
  id v39;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_msgSend(MEMORY[0x1E0D51230], "newWithPersistentID:inLibrary:", a5, self->_library);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __118__MPMediaLibraryDataProviderML3_setItemsWithIdentifiers_andEntryProperties_forPlaylistWithIdentifier_completionBlock___block_invoke;
  v38[3] = &unk_1E3157E90;
  v15 = v14;
  v39 = v15;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v38);
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v37 = 0;
  objc_msgSend(v13, "valueForProperty:", *MEMORY[0x1E0D509B0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a6) = objc_msgSend(v16, "BOOLValue");

  if ((_DWORD)a6)
  {
    v28 = v10;
    objc_msgSend(MEMORY[0x1E0DDBF98], "shared");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activeUserState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "music");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "userProfile");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "socialProfileID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v28;
  }
  else
  {
    v21 = 0;
  }
  dispatch_get_global_queue(0, 0);
  v22 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __118__MPMediaLibraryDataProviderML3_setItemsWithIdentifiers_andEntryProperties_forPlaylistWithIdentifier_completionBlock___block_invoke_3;
  block[3] = &unk_1E3157EE0;
  v34 = v12;
  v35 = v36;
  block[4] = self;
  v30 = v13;
  v31 = v10;
  v32 = v15;
  v33 = v21;
  v23 = v12;
  v24 = v21;
  v25 = v15;
  v26 = v10;
  v27 = v13;
  dispatch_async(v22, block);

  _Block_object_dispose(v36, 8);
}

- (void)addItemWithIdentifier:(int64_t)a3 toPlaylistWithIdentifier:(int64_t)a4 completionBlock:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  _QWORD *v16;
  int64_t v17;
  _QWORD v18[3];
  char v19;

  v8 = a5;
  v9 = (void *)objc_msgSend(MEMORY[0x1E0D51230], "newWithPersistentID:inLibrary:", a4, self->_library);
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  dispatch_get_global_queue(0, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__MPMediaLibraryDataProviderML3_addItemWithIdentifier_toPlaylistWithIdentifier_completionBlock___block_invoke;
  block[3] = &unk_1E3157F08;
  block[4] = self;
  v14 = v9;
  v16 = v18;
  v17 = a3;
  v15 = v8;
  v11 = v8;
  v12 = v9;
  dispatch_async(v10, block);

  _Block_object_dispose(v18, 8);
}

- (void)addItemsWithIdentifiers:(id)a3 toPlaylistWithIdentifier:(int64_t)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[3];
  char v21;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_msgSend(MEMORY[0x1E0D51230], "newWithPersistentID:inLibrary:", a4, self->_library);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__MPMediaLibraryDataProviderML3_addItemsWithIdentifiers_toPlaylistWithIdentifier_completionBlock___block_invoke;
  block[3] = &unk_1E3157F58;
  v18 = v9;
  v19 = v20;
  block[4] = self;
  v16 = v10;
  v17 = v8;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(v11, block);

  _Block_object_dispose(v20, 8);
}

- (void)addItemsWithIdentifiers:(id)a3 andEntryProperties:(id)a4 toPlaylistWithIdentifier:(int64_t)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD block[5];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD *v35;
  _QWORD v36[3];
  char v37;
  _QWORD v38[4];
  id v39;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_msgSend(MEMORY[0x1E0D51230], "newWithPersistentID:inLibrary:", a5, self->_library);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __117__MPMediaLibraryDataProviderML3_addItemsWithIdentifiers_andEntryProperties_toPlaylistWithIdentifier_completionBlock___block_invoke;
  v38[3] = &unk_1E3157E90;
  v15 = v14;
  v39 = v15;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v38);
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v37 = 0;
  objc_msgSend(v13, "valueForProperty:", *MEMORY[0x1E0D509B0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a6) = objc_msgSend(v16, "BOOLValue");

  if ((_DWORD)a6)
  {
    v28 = v10;
    objc_msgSend(MEMORY[0x1E0DDBF98], "shared");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activeUserState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "music");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "userProfile");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "socialProfileID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v28;
  }
  else
  {
    v21 = 0;
  }
  dispatch_get_global_queue(0, 0);
  v22 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __117__MPMediaLibraryDataProviderML3_addItemsWithIdentifiers_andEntryProperties_toPlaylistWithIdentifier_completionBlock___block_invoke_3;
  block[3] = &unk_1E3157EE0;
  v34 = v12;
  v35 = v36;
  block[4] = self;
  v30 = v13;
  v31 = v10;
  v32 = v15;
  v33 = v21;
  v23 = v12;
  v24 = v21;
  v25 = v15;
  v26 = v10;
  v27 = v13;
  dispatch_async(v22, block);

  _Block_object_dispose(v36, 8);
}

- (void)sdk_addItemWithOpaqueIdentifier:(id)a3 toPlaylistWithIdentifier:(int64_t)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  int64_t v15;

  v8 = a5;
  v9 = a3;
  -[MPMediaLibraryDataProviderML3 userIdentity](self, "userIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __106__MPMediaLibraryDataProviderML3_sdk_addItemWithOpaqueIdentifier_toPlaylistWithIdentifier_completionBlock___block_invoke;
  v13[3] = &unk_1E3157F80;
  v13[4] = self;
  v14 = v8;
  v15 = a4;
  v12 = v8;
  objc_msgSend(v11, "sdk_addStoreItemWithOpaqueID:toPlaylistWithPersistentID:completionHandler:", v9, a4, v13);

}

- (void)removeItemsAtIndexes:(id)a3 inPlaylistWithIdentifier:(int64_t)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_msgSend(MEMORY[0x1E0D51230], "newWithPersistentID:inLibrary:", a4, self->_library);
  dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __95__MPMediaLibraryDataProviderML3_removeItemsAtIndexes_inPlaylistWithIdentifier_completionBlock___block_invoke;
  v15[3] = &unk_1E315C088;
  v15[4] = self;
  v16 = v10;
  v17 = v8;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(v11, v15);

}

- (void)sdk_addItemWithSagaIdentifier:(int64_t)a3 toPlaylistWithIdentifier:(int64_t)a4 completionBlock:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  -[MPMediaLibraryDataProviderML3 userIdentity](self, "userIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __104__MPMediaLibraryDataProviderML3_sdk_addItemWithSagaIdentifier_toPlaylistWithIdentifier_completionBlock___block_invoke;
  v12[3] = &unk_1E31624C0;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "sdk_addItemWithSagaID:toPlaylistWithPersistentID:completionHandler:", a3, a4, v12);

}

- (void)removeAllItemsInPlaylistWithIdentifier:(int64_t)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0D51230], "newWithPersistentID:inLibrary:", a3, self->_library);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__MPMediaLibraryDataProviderML3_removeAllItemsInPlaylistWithIdentifier___block_invoke;
  v6[3] = &unk_1E3157FA8;
  v7 = v4;
  v5 = v4;
  -[MPMediaLibraryDataProviderML3 performTransactionWithBlock:](self, "performTransactionWithBlock:", v6);

}

- (void)removeFirstItemFromPlaylistWithIdentifier:(int64_t)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0D51230], "newWithPersistentID:inLibrary:", a3, self->_library);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__MPMediaLibraryDataProviderML3_removeFirstItemFromPlaylistWithIdentifier___block_invoke;
  v6[3] = &unk_1E3157FA8;
  v7 = v4;
  v5 = v4;
  -[MPMediaLibraryDataProviderML3 performTransactionWithBlock:](self, "performTransactionWithBlock:", v6);

}

- (void)moveItemFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4 inPlaylistWithIdentifier:(int64_t)a5 completionBlock:(id)a6
{
  void (**v10)(id, _QWORD);
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v10 = (void (**)(id, _QWORD))a6;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v11 = (void *)objc_msgSend(MEMORY[0x1E0D51230], "newWithPersistentID:inLibrary:", a5, self->_library);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __100__MPMediaLibraryDataProviderML3_moveItemFromIndex_toIndex_inPlaylistWithIdentifier_completionBlock___block_invoke;
  v13[3] = &unk_1E3157E18;
  v12 = v11;
  v14 = v12;
  v15 = &v18;
  v16 = a3;
  v17 = a4;
  -[MPMediaLibraryDataProviderML3 performTransactionWithBlock:](self, "performTransactionWithBlock:", v13);
  if (v10)
    v10[2](v10, *((unsigned __int8 *)v19 + 24));

  _Block_object_dispose(&v18, 8);
}

- (void)setReactionText:(id)a3 onEntryAtPosition:(unint64_t)a4 inPlaylistWithIdentifier:(int64_t)a5 completion:(id)a6
{
  void (**v10)(id, uint64_t, id);
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;

  v10 = (void (**)(id, uint64_t, id))a6;
  v11 = a3;
  -[MPMediaLibraryDataProviderML3 _userSocialProfileID](self, "_userSocialProfileID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D51230]), "initWithPersistentID:inLibrary:", a5, self->_library);
  v16 = 0;
  v14 = objc_msgSend(v13, "setItemReactionText:onEntryAtPosition:forUserIdentifier:previousReactionText:", v11, a4, v12, &v16);

  v15 = v16;
  if (v10)
    v10[2](v10, v14, v15);

}

- (NSArray)preferredAudioLanguages
{
  return (NSArray *)-[ML3MusicLibrary preferredAudioTracks](self->_library, "preferredAudioTracks");
}

- (NSArray)preferredSubtitleLanguages
{
  return (NSArray *)-[ML3MusicLibrary preferredSubtitleTracks](self->_library, "preferredSubtitleTracks");
}

- (void)populateLocationPropertiesOfItemWithIdentifier:(int64_t)a3 withPath:(id)a4 assetProtectionType:(int64_t)a5
{
  void *v7;
  ML3MusicLibrary *library;
  id v9;
  id v10;

  v7 = (void *)MEMORY[0x1E0D512C8];
  library = self->_library;
  v9 = a4;
  v10 = (id)objc_msgSend(v7, "newWithPersistentID:inLibrary:", a3, library);
  objc_msgSend(v10, "populateLocationPropertiesWithPath:protectionType:", v9, a5);

}

- (void)populateLocationPropertiesOfItemWithIdentifier:(int64_t)a3 withPath:(id)a4 assetProtectionType:(int64_t)a5 completionBlock:(id)a6
{
  void *v9;
  ML3MusicLibrary *library;
  id v11;
  id v12;
  id v13;

  v9 = (void *)MEMORY[0x1E0D512C8];
  library = self->_library;
  v11 = a6;
  v12 = a4;
  v13 = (id)objc_msgSend(v9, "newWithPersistentID:inLibrary:", a3, library);
  objc_msgSend(v13, "populateLocationPropertiesWithPath:protectionType:completionBlock:", v12, a5, v11);

}

- (void)clearLocationPropertiesOfItemWithIdentifier:(int64_t)a3
{
  void *v3;
  ML3MusicLibrary *library;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D512C8];
  library = self->_library;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearLocationFromLibrary:persistentIDs:disableKeepLocal:", library, v6, 0);

}

- (void)performBackgroundTaskWithBlock:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  NSObject *backgroundTaskQueue;
  dispatch_time_t v7;
  NSObject *v8;
  _QWORD v9[5];
  _QWORD block[5];

  v4 = (void (**)(_QWORD))a3;
  if (performBackgroundTaskWithBlock____once != -1)
    dispatch_once(&performBackgroundTaskWithBlock____once, &__block_literal_global_168);
  if (performBackgroundTaskWithBlock____appRunsContinously)
  {
    v4[2](v4);
  }
  else
  {
    v5 = MEMORY[0x1E0C809B0];
    backgroundTaskQueue = self->_backgroundTaskQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__MPMediaLibraryDataProviderML3_performBackgroundTaskWithBlock___block_invoke_2;
    block[3] = &unk_1E3163508;
    block[4] = self;
    dispatch_sync(backgroundTaskQueue, block);
    v4[2](v4);
    v7 = dispatch_time(0, 1000000000);
    v8 = self->_backgroundTaskQueue;
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __64__MPMediaLibraryDataProviderML3_performBackgroundTaskWithBlock___block_invoke_177;
    v9[3] = &unk_1E3163508;
    v9[4] = self;
    dispatch_after(v7, v8, v9);
  }

}

- (id)_adjustedPlaylistPropertySeedItemsOfEntity:(id)a3 withDefaultValue:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (!a4)
    return MEMORY[0x1E0C9AA60];
  v8[0] = a4;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a4;
  objc_msgSend(v4, "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_adjustedItemTimeOfEntity:(id)a3 withDefaultValue:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)objc_msgSend(a4, "unsignedIntValue", a3) / 1000.0);
}

- (id)_adjustedItemPropertyVolumeNormalizationOfEntity:(id)a3 withDefaultValue:(id)a4
{
  void *v4;
  unint64_t v5;
  double v6;
  float v7;
  double v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = objc_msgSend(a4, "integerValue", a3);
  v6 = 1.0;
  if (v5 && v5 != 0xFFFF)
  {
    v7 = sqrt(1000.0 / (float)v5);
    v6 = v7;
  }
  if (v6 < 0.251188643)
    v6 = 0.251188636;
  if (v6 > 3.98107171)
    v6 = 3.98107171;
  v8 = floor(log10(v6) * 20.0 + 0.5);
  *(float *)&v8 = v8;
  return (id)objc_msgSend(v4, "numberWithFloat:", v8);
}

- (id)_adjustedItemPropertyVolumeAdjustmentOfEntity:(id)a3 withDefaultValue:(id)a4
{
  void *v4;
  double v5;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  *(float *)&v5 = (float)((float)((float)(unint64_t)(objc_msgSend(a4, "integerValue", a3) + 1000) / 2000.0) * 2.0)
                + 0.0;
  if (*(float *)&v5 < 0.0)
    *(float *)&v5 = 0.0;
  if (*(float *)&v5 > 2.0)
    *(float *)&v5 = 2.0;
  return (id)objc_msgSend(v4, "numberWithFloat:", v5);
}

- (id)_adjustedItemPropertyRatingOfEntity:(id)a3 withDefaultValue:(id)a4
{
  void *v4;
  float v5;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a4, "floatValue", a3);
  return (id)objc_msgSend(v4, "numberWithDouble:", v5 / 20.0);
}

- (id)_adjustedItemDateOfEntity:(id)a3 withDefaultValue:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a4;
  if (objc_msgSend(v4, "longLongValue"))
  {
    v5 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "doubleValue");
    objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_adjustedItemPropertyBookletsOfEntity:(id)a3 withDefaultValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__20164;
  v25 = __Block_byref_object_dispose__20165;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D51218];
  v9 = objc_msgSend(v6, "persistentID");
  objc_msgSend(v8, "predicateWithProperty:equalToInt64:", *MEMORY[0x1E0D50830], v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0D50838];
  v27[0] = *MEMORY[0x1E0D50848];
  v27[1] = v11;
  v12 = *MEMORY[0x1E0D50828];
  v27[2] = *MEMORY[0x1E0D50840];
  v27[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D51210], "queryWithLibrary:predicate:", self->_library, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __88__MPMediaLibraryDataProviderML3__adjustedItemPropertyBookletsOfEntity_withDefaultValue___block_invoke;
  v18[3] = &unk_1E3158018;
  v15 = v6;
  v19 = v15;
  v20 = &v21;
  objc_msgSend(v14, "enumeratePersistentIDsAndProperties:usingBlock:", v13, v18);

  v16 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v16;
}

- (id)_adjustedItemNonnullDateOfEntity:(id)a3 withDefaultValue:(id)a4
{
  void *v4;

  v4 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a4, "doubleValue", a3);
  return (id)objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
}

- (id)_adjustedItemPropertyFilePathOfEntity:(id)a3 withDefaultValue:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a4;
  if ((unint64_t)objc_msgSend(v4, "length") < 2)
  {
    v7 = 0;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CPSharedResourcesDirectory(), CFSTR("Media"), v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathWithComponents:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)_adjustedItemPropertyMovieInfoOfEntity:(id)a3 withDefaultValue:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "length"))
  {
    v5 = (void *)MEMORY[0x1E0CB38B0];
    objc_msgSend(v4, "dataUsingEncoding:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "propertyListWithData:options:format:error:", v6, 0, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v7;
}

- (id)_adjustedItemPropertyEpisodeNumberOfEntity:(id)a3 withDefaultValue:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0D51190]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || !objc_msgSend(v5, "integerValue"))
  {
    objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0D50CF0]);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }

  return v6;
}

- (id)_adjustedItemPropertyChapterArtworkTimesOfEntity:(id)a3 withDefaultValue:(id)a4
{
  void *v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "chapterTOC");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countOfGroupsForProperty:", 4);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = 0;
    do
    {
      v8 = objc_msgSend(v4, "chapterIndexForGroupIndex:groupingProperty:", v7, 4);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)objc_msgSend(v4, "timeLocationInMSOfChapterAtIndex:", v8) / 1000.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v9);

      v7 = (v7 + 1);
    }
    while (v5 != (_DWORD)v7);
  }
  v10 = v6;

  return v10;
}

- (id)_adjustedItemPropertySeasonNumberOfEntity:(id)a3 withDefaultValue:(id)a4
{
  id v4;
  id v5;

  v4 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "integerValue") < 1)
    v5 = 0;
  else
    v5 = v4;

  return v5;
}

- (id)_adjustedItemPropertySeasonNameOfEntity:(id)a3 withDefaultValue:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  v4 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "integerValue") < 1)
  {
    v8 = &stru_1E3163D10;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SEASON_DISPLAY_FORMAT_%@"), &stru_1E3163D10, CFSTR("MediaPlayer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v7, v4);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)_adjustedItemPropertyChaptersOfEntity:(id)a3 withDefaultValue:(id)a4
{
  id v5;
  MPMediaLibraryDataProviderML3 *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  MPMediaLibraryDataProviderML3 *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v16;
  id v17;
  void (*v18)(_QWORD, uint64_t, uint64_t, _QWORD *);
  id v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  MPMediaLibraryDataProviderML3 *v31;
  id v32;
  id v33;

  v5 = a3;
  v6 = self;
  objc_msgSend(v5, "chapterTOC");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countOfChapters");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __MPMediaChaptersFromML3Entity_block_invoke;
  v29[3] = &unk_1E3158088;
  v11 = v7;
  v30 = v11;
  v31 = v6;
  v32 = v5;
  v12 = v9;
  v33 = v12;
  v13 = v5;
  v14 = v6;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x19403A810](v29);
  v15[2](v15, 0, 5, 0);
  v27[0] = v10;
  v27[1] = 3221225472;
  v27[2] = __MPMediaChaptersFromML3Entity_block_invoke_2;
  v27[3] = &unk_1E31580B0;
  v16 = v11;
  v28 = v16;
  ((void (**)(_QWORD, uint64_t, uint64_t, _QWORD *))v15)[2](v15, 1, 1, v27);
  v25[0] = v10;
  v25[1] = 3221225472;
  v25[2] = __MPMediaChaptersFromML3Entity_block_invoke_3;
  v25[3] = &unk_1E31580B0;
  v17 = v16;
  v26 = v17;
  ((void (**)(_QWORD, uint64_t, uint64_t, _QWORD *))v15)[2](v15, 3, 2, v25);
  v23[0] = v10;
  v23[1] = 3221225472;
  v23[2] = __MPMediaChaptersFromML3Entity_block_invoke_4;
  v23[3] = &unk_1E31580B0;
  v24 = v17;
  v18 = (void (*)(_QWORD, uint64_t, uint64_t, _QWORD *))v15[2];
  v19 = v17;
  v18(v15, 4, 3, v23);
  ((void (**)(_QWORD, uint64_t, uint64_t, void *))v15)[2](v15, 2, 4, &__block_literal_global_621);
  objc_msgSend(v12, "sortUsingSelector:", sel__sortByChapterIndex_);
  v20 = v24;
  v21 = v12;

  return v21;
}

- (id)_adjustedItemPropertyContentRatingOfEntity:(id)a3 withDefaultValue:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  NSObject *v12;
  void *v13;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("|"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v5, "objectAtIndex:", 0);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v7 == 1)
      {
        v9 = &stru_1E3163D10;
        v10 = &stru_1E3163D10;
        v11 = &stru_1E3163D10;
      }
      else
      {
        objc_msgSend(v5, "objectAtIndex:", 1);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v7 < 3)
        {
          v9 = &stru_1E3163D10;
          v10 = &stru_1E3163D10;
        }
        else
        {
          objc_msgSend(v5, "objectAtIndex:", 2);
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v7 == 3)
          {
            v9 = &stru_1E3163D10;
          }
          else
          {
            objc_msgSend(v5, "objectAtIndex:", 3);
            v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
      }
    }
    else
    {
      v9 = &stru_1E3163D10;
      v10 = &stru_1E3163D10;
      v11 = &stru_1E3163D10;
      v8 = &stru_1E3163D10;
    }
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v8, CFSTR("ratingProvider"), v11, CFSTR("localizedRating"), v10, CFSTR("ratingLevel"), v9, CFSTR("localizedReason"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v4;
      _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_ERROR, "Unexpected content rating format: %@", buf, 0xCu);
    }

    v13 = 0;
  }

  return v13;
}

- (id)_adjustedItemPropertyEQPresetOfEntity:(id)a3 withDefaultValue:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend(a4, "integerValue", a3);
  if (v4 <= 99)
    v5 = 0;
  else
    v5 = v4 - 99;
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
}

- (id)_adjustedItemPropertyAssetURLOfEntity:(id)a3 withDefaultValue:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a3;
  objc_msgSend(a4, "pathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForProperty:", *MEMORY[0x1E0D51130]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v8
    || (objc_msgSend(v5, "valueForProperty:", *MEMORY[0x1E0D50F18]),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "length"),
        v10,
        !v11))
  {
    v9 = 0;
  }
  else
  {
    v12 = objc_msgSend(v5, "persistentID");
    objc_msgSend(MEMORY[0x1E0C99E98], "msv_urlForMediaAssetWithPersistentID:pathExtension:", v12, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)_adjustedItemPropertyVerifiedIntegrityOfEntity:(id)a3 withDefaultValue:(id)a4
{
  return a4;
}

- (void)_coalesceEvents
{
  if (!self->_hasScheduledEventPosting)
  {
    -[MPMediaLibraryDataProviderML3 performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__postEvents, 0, 0.75);
    self->_hasScheduledEventPosting = 1;
  }
}

- (void)_postEvents
{
  NSObject *backgroundTaskQueue;
  _QWORD block[5];

  backgroundTaskQueue = self->_backgroundTaskQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MPMediaLibraryDataProviderML3__postEvents__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(backgroundTaskQueue, block);
}

- (BOOL)_dataProviderSupportsEntityChangeTracking
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[MPMediaLibraryDataProviderML3 supportsEntityChangeTrackingForMediaEntityType:collectionGroupingType:dataProviderClass:](self, "supportsEntityChangeTrackingForMediaEntityType:collectionGroupingType:dataProviderClass:", 0, 0, 0);
  else
    return 0;
}

- (void)_libraryContentsDidChange:(id)a3
{
  void *v4;
  id v5;

  self->_refreshState = 3;
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("isSourceExternal"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_msgSend(v5, "BOOLValue") & 1) == 0)
    -[MPMediaLibraryDataProviderML3 _postEvents](self, "_postEvents");
  else
    -[MPMediaLibraryDataProviderML3 _coalesceEvents](self, "_coalesceEvents");

}

- (void)_libraryPathDidChange:(id)a3
{
  NSString *uniqueIdentifier;

  uniqueIdentifier = self->_uniqueIdentifier;
  self->_uniqueIdentifier = 0;

  +[MPMediaLibrary libraryPathDidChangeForDataProvider:](MPMediaLibrary, "libraryPathDidChangeForDataProvider:", self);
  -[MPMediaLibraryDataProviderML3 _updateArtworkDataSourceMediaLibraryUniqueIdentifier](self, "_updateArtworkDataSourceMediaLibraryUniqueIdentifier");
}

- (void)_libraryEntitiesAddedOrRemoved:(id)a3
{
  NSObject *entitiesAddedOrRemovedNotificationQueue;
  _QWORD block[5];

  entitiesAddedOrRemovedNotificationQueue = self->_entitiesAddedOrRemovedNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__MPMediaLibraryDataProviderML3__libraryEntitiesAddedOrRemoved___block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_sync(entitiesAddedOrRemovedNotificationQueue, block);
}

- (void)_dynamicPropertiesDidChange:(id)a3
{
  uint64_t refreshState;

  refreshState = self->_refreshState;
  if (refreshState <= 2)
    refreshState = 2;
  self->_refreshState = refreshState;
  -[MPMediaLibraryDataProviderML3 _coalesceEvents](self, "_coalesceEvents", a3);
}

- (void)_invisiblePropertiesDidChange:(id)a3
{
  uint64_t refreshState;

  refreshState = self->_refreshState;
  if (refreshState <= 1)
    refreshState = 1;
  self->_refreshState = refreshState;
  -[MPMediaLibraryDataProviderML3 _coalesceEvents](self, "_coalesceEvents", a3);
}

- (void)_displayValuesDidChange:(id)a3
{
  +[MPMediaLibrary reloadDisplayValuesForLibraryDataProvider:](MPMediaLibrary, "reloadDisplayValuesForLibraryDataProvider:", self);
}

- (void)_syncGenerationDidChange:(id)a3
{
  +[MPMediaLibrary syncGenerationDidChangeForLibraryDataProvider:](MPMediaLibrary, "syncGenerationDidChangeForLibraryDataProvider:", self);
}

- (void)_libraryUIDDidChange:(id)a3
{
  +[MPMediaLibrary uniqueIdentifierDidChangeForLibraryDataProvider:](MPMediaLibrary, "uniqueIdentifierDidChangeForLibraryDataProvider:", self);
}

- (void)_libraryCloudLibraryAvailabilityDidChange:(id)a3
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "Received cloud library availability did change notification", v5, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("MPMediaLibraryCloudLibraryAvailabilityDidChangeNotification"), 0);

}

- (void)_loadValueForAggregateFunction:(id)a3 entityClass:(Class)a4 property:(id)a5 query:(id)a6 completionBlock:(id)a7
{
  void (**v12)(id, void *);
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a5;
  v12 = (void (**)(id, void *))a7;
  v13 = a6;
  v14 = a3;
  -[objc_class propertyForMPMediaEntityProperty:](a4, "propertyForMPMediaEntityProperty:", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "valueForAggregateFunction:onEntitiesForProperty:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[MPMediaLibraryDataProviderML3 adjustedValueForMPProperty:ofEntity:withDefaultValue:](self, "adjustedValueForMPProperty:ofEntity:withDefaultValue:", v18, 0, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }
  v12[2](v12, v17);

}

- (BOOL)_removeEntitiesWithIdentifiers:(int64_t *)a3 count:(unint64_t)a4 entityClass:(Class)a5
{
  BOOL v6;
  _QWORD v8[9];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__MPMediaLibraryDataProviderML3__removeEntitiesWithIdentifiers_count_entityClass___block_invoke;
  v8[3] = &unk_1E3158060;
  v8[6] = a5;
  v8[7] = a4;
  v8[8] = a3;
  v8[4] = self;
  v8[5] = &v9;
  -[MPMediaLibraryDataProviderML3 performTransactionWithBlock:](self, "performTransactionWithBlock:", v8);
  if (*((_BYTE *)v10 + 24))
  {
    +[MPMediaLibrary reloadLibraryDataProvider:](MPMediaLibrary, "reloadLibraryDataProvider:", self);
    v6 = *((_BYTE *)v10 + 24) != 0;
  }
  else
  {
    v6 = 0;
  }
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (id)_userSocialProfileID
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaLibraryDataProviderML3 userIdentity](self, "userIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v3, "DSIDForUserIdentity:outError:", v4, &v25);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v25;

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DDBF98], "shared");
    v7 = objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[NSObject allUserStates](v7, "allUserStates", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v13, "dsid");
          v14 = (id)objc_claimAutoreleasedReturnValue();
          if (v5 == v14)
          {

LABEL_17:
            objc_msgSend(v13, "music");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "userProfile");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "socialProfileID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_18;
          }
          v15 = v14;
          v16 = objc_msgSend(v5, "isEqual:", v14);

          if (v16)
            goto LABEL_17;
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        v17 = 0;
        if (v10)
          continue;
        break;
      }
    }
    else
    {
      v17 = 0;
    }
LABEL_18:

  }
  else
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v28 = v6;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_ERROR, "Can't get user social profile ID because DSID = nil. err = %{public}@", buf, 0xCu);
    }
    v17 = 0;
  }

  return v17;
}

- (MPMediaLibrary)mediaLibrary
{
  return (MPMediaLibrary *)objc_loadWeakRetained((id *)&self->_mediaLibrary);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mediaLibrary);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_artworkDataSource, 0);
  objc_storeStrong((id *)&self->_entityCache, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_entitiesAddedOrRemovedCoalescingTimer, 0);
  objc_storeStrong((id *)&self->_entitiesAddedOrRemovedNotificationQueue, 0);
  objc_storeStrong((id *)&self->_setValuesWidthLimitedQueue, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_cloudUpdateQueue, 0);
  objc_storeStrong((id *)&self->_backgroundTaskQueue, 0);
}

uint64_t __82__MPMediaLibraryDataProviderML3__removeEntitiesWithIdentifiers_count_entityClass___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  unint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2 == objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 56))
    {
      v4 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8 * v4));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v5);

        ++v4;
      }
      while (*(_QWORD *)(a1 + 56) > v4);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D512C8], "unlinkRedownloadableAssetsFromLibrary:persistentIDs:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), v3);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 48), "deleteFromLibrary:deletionType:persistentIDs:count:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), 1, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
  }
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void __64__MPMediaLibraryDataProviderML3__libraryEntitiesAddedOrRemoved___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  dispatch_time_t v6;
  dispatch_source_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD handler[5];
  uint8_t buf[16];

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  v3 = os_log_create("com.apple.amp.mediaplayer", "Library");
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "Postponing MPMediaLibraryEntitiesAddedOrRemovedNotification timer due to continued notifications", buf, 2u);
    }

    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
    v6 = dispatch_time(0, 1000000000);
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "Created timer to coalesce MPMediaLibraryEntitiesAddedOrRemovedNotification", buf, 2u);
    }

    v7 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 72));
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 80);
    *(_QWORD *)(v8 + 80) = v7;

    v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
    v11 = dispatch_time(0, 1000000000);
    dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(NSObject **)(v12 + 80);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __64__MPMediaLibraryDataProviderML3__libraryEntitiesAddedOrRemoved___block_invoke_260;
    handler[3] = &unk_1E3163508;
    handler[4] = v12;
    dispatch_source_set_event_handler(v13, handler);
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 80));
  }
}

void __64__MPMediaLibraryDataProviderML3__libraryEntitiesAddedOrRemoved___block_invoke_260(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  v2 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "Posting MPMediaLibraryEntitiesAddedOrRemovedNotification", v5, 2u);
  }

  +[MPMediaLibrary postEntitiesAddedOrRemovedNotificationForLibraryDataProvider:](MPMediaLibrary, "postEntitiesAddedOrRemovedNotificationForLibraryDataProvider:", *(_QWORD *)(a1 + 32));
  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 80));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = 0;

}

_QWORD *__44__MPMediaLibraryDataProviderML3__postEvents__block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  result = *(_QWORD **)(a1 + 32);
  v3 = result[6];
  switch(v3)
  {
    case 1:
      result[6] = 0;
      return (_QWORD *)+[MPMediaLibrary reloadInvisiblePropertiesForLibraryDataProvider:](MPMediaLibrary, "reloadInvisiblePropertiesForLibraryDataProvider:", *(_QWORD *)(a1 + 32));
    case 2:
      if (objc_msgSend(result, "_dataProviderSupportsEntityChangeTracking"))
        objc_msgSend(*(id *)(a1 + 32), "updateEntitesToCurrentRevision");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
      return (_QWORD *)+[MPMediaLibrary reloadDynamicPropertiesForLibraryDataProvider:](MPMediaLibrary, "reloadDynamicPropertiesForLibraryDataProvider:", *(_QWORD *)(a1 + 32));
    case 3:
      if (objc_msgSend(result, "_dataProviderSupportsEntityChangeTracking"))
        objc_msgSend(*(id *)(a1 + 32), "updateEntitesToCurrentRevision");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
      return (_QWORD *)+[MPMediaLibrary reloadLibraryDataProvider:](MPMediaLibrary, "reloadLibraryDataProvider:", *(_QWORD *)(a1 + 32));
  }
  return result;
}

void __88__MPMediaLibraryDataProviderML3__adjustedItemPropertyBookletsOfEntity_withDefaultValue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MPMediaBooklet *v5;

  v5 = objc_alloc_init(MPMediaBooklet);
  -[MPMediaBooklet setItemPersistentID:](v5, "setItemPersistentID:", objc_msgSend(*(id *)(a1 + 32), "persistentID"));
  -[MPMediaBooklet setStoreItemID:](v5, "setStoreItemID:", objc_msgSend(*(id *)a3, "longLongValue"));
  -[MPMediaBooklet setName:](v5, "setName:", *(_QWORD *)(a3 + 8));
  -[MPMediaBooklet setRedownloadParams:](v5, "setRedownloadParams:", *(_QWORD *)(a3 + 16));
  -[MPMediaBooklet setFileSize:](v5, "setFileSize:", objc_msgSend(*(id *)(a3 + 24), "longLongValue"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v5);

}

void __64__MPMediaLibraryDataProviderML3_performBackgroundTaskWithBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v7[5];
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 32);
  if (!v2)
  {
    MPSharedBackgroundTaskProvider();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __64__MPMediaLibraryDataProviderML3_performBackgroundTaskWithBlock___block_invoke_3;
    v7[3] = &unk_1E3163508;
    v7[4] = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = objc_msgSend(v4, "beginTaskWithExpirationHandler:", v7);

    v5 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      *(_DWORD *)buf = 134218498;
      v9 = v6;
      v10 = 2082;
      v11 = "/Library/Caches/com.apple.xbs/Sources/MediaPlayer/MediaPlayer/Core/MusicLibrary Support/_ios_tvos_watchos/MP"
            "MediaLibraryDataProviderML3.m";
      v12 = 1024;
      v13 = 2788;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "BackgroundTask: Took assertion (%lli) at %{public}s:%d", buf, 0x1Cu);
    }

    v1 = *(_QWORD *)(a1 + 32);
    v2 = *(_QWORD *)(v1 + 32);
  }
  *(_QWORD *)(v1 + 32) = v2 + 1;
}

void __64__MPMediaLibraryDataProviderML3_performBackgroundTaskWithBlock___block_invoke_177(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 32);
  if (v2)
  {
    *(_QWORD *)(v1 + 32) = v2 - 1;
    v4 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v4 + 32))
    {
      v5 = *MEMORY[0x1E0D4CE50];
      if (*(_QWORD *)(v4 + 24) != *MEMORY[0x1E0D4CE50])
      {
        MPSharedBackgroundTaskProvider();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "endTask:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));

        v7 = os_log_create("com.apple.amp.mediaplayer", "Playback");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
          v9 = 134218498;
          v10 = v8;
          v11 = 2082;
          v12 = "/Library/Caches/com.apple.xbs/Sources/MediaPlayer/MediaPlayer/Core/MusicLibrary Support/_ios_tvos_watcho"
                "s/MPMediaLibraryDataProviderML3.m";
          v13 = 1024;
          v14 = 2803;
          _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "BackgroundTask: End assertion (%lli) at %{public}s:%d", (uint8_t *)&v9, 0x1Cu);
        }

        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = v5;
      }
    }
  }
}

void __64__MPMediaLibraryDataProviderML3_performBackgroundTaskWithBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  MPSharedBackgroundTaskProvider();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endTask:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));

  v3 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    v5 = 134218498;
    v6 = v4;
    v7 = 2082;
    v8 = "/Library/Caches/com.apple.xbs/Sources/MediaPlayer/MediaPlayer/Core/MusicLibrary Support/_ios_tvos_watchos/MPMed"
         "iaLibraryDataProviderML3.m";
    v9 = 1024;
    v10 = 2784;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "BackgroundTask: End assertion (%lli) at %{public}s:%d", (uint8_t *)&v5, 0x1Cu);
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = *MEMORY[0x1E0D4CE50];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
}

void __64__MPMediaLibraryDataProviderML3_performBackgroundTaskWithBlock___block_invoke()
{
  __CFBundle *MainBundle;
  void *v1;
  char v2;
  void *v3;
  id v4;

  MainBundle = CFBundleGetMainBundle();
  if (MainBundle)
  {
    CFBundleGetValueForInfoDictionaryKey(MainBundle, CFSTR("UIBackgroundModes"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v2 = objc_msgSend(v1, "containsObject:", CFSTR("continuous"));
    else
      v2 = 0;
    performBackgroundTaskWithBlock____appRunsContinously = v2;

  }
  if (!performBackgroundTaskWithBlock____appRunsContinously)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "processName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    performBackgroundTaskWithBlock____appRunsContinously = objc_msgSend(v3, "isEqualToString:", CFSTR("iapd"));

  }
}

void __132__MPMediaLibraryDataProviderML3_enumerateEntityChangesAfterSyncAnchor_maximumRevisionType_inUsersLibrary_itemBlock_collectionBlock___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;

  v9 = (void *)MEMORY[0x19403A624]();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), a3);
  if (objc_msgSend(MEMORY[0x1E0D512C8], "revisionTrackingCode") == a6)
  {
    (*(void (**)(void))(a1[4] + 16))();
  }
  else
  {
    v11 = a1[6];
    if (v11)
    {
      v12 = 0;
      v13 = (uint64_t *)a1[7];
      while (1)
      {
        v14 = *v13;
        v13 += 2;
        if (v14 == a6)
          break;
        if (v11 == ++v12)
          goto LABEL_9;
      }
      (*(void (**)(void))(a1[5] + 16))();
    }
  }
LABEL_9:

  objc_autoreleasePoolPop(v9);
}

uint64_t __100__MPMediaLibraryDataProviderML3_moveItemFromIndex_toIndex_inPlaylistWithIdentifier_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "valueForProperty:", *MEMORY[0x1E0D50990]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "BOOLValue") & 1) == 0)
  {
LABEL_5:

    goto LABEL_6;
  }
  v3 = *MEMORY[0x1E0D50A80];
  objc_msgSend(*(id *)(a1 + 32), "valueForProperty:", *MEMORY[0x1E0D50A80]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  if (v5 != 1)
  {
    objc_msgSend(MEMORY[0x1E0D512C8], "containerQueryWithContainer:", *(_QWORD *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v2, "countOfEntities");
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __100__MPMediaLibraryDataProviderML3_moveItemFromIndex_toIndex_inPlaylistWithIdentifier_completionBlock___block_invoke_2;
      v12[3] = &unk_1E3157C90;
      v13 = v7;
      v8 = v7;
      objc_msgSend(v2, "enumeratePersistentIDsUsingBlock:", v12);
      objc_msgSend(*(id *)(a1 + 32), "setTracksWithPersistentIDs:notify:", v8, 0);
      v9 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setValue:forProperty:", v10, v3);

    }
    goto LABEL_5;
  }
LABEL_6:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "moveTrackFromIndex:toIndex:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void __100__MPMediaLibraryDataProviderML3_moveItemFromIndex_toIndex_inPlaylistWithIdentifier_completionBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __75__MPMediaLibraryDataProviderML3_removeFirstItemFromPlaylistWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFirstTrack");
}

uint64_t __72__MPMediaLibraryDataProviderML3_removeAllItemsInPlaylistWithIdentifier___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeAllTracks");
  return 1;
}

uint64_t __104__MPMediaLibraryDataProviderML3_sdk_addItemWithSagaIdentifier_toPlaylistWithIdentifier_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __95__MPMediaLibraryDataProviderML3_removeItemsAtIndexes_inPlaylistWithIdentifier_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __95__MPMediaLibraryDataProviderML3_removeItemsAtIndexes_inPlaylistWithIdentifier_completionBlock___block_invoke_2;
  v4[3] = &unk_1E3157F30;
  v7 = &v8;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "performTransactionWithBlock:", v4);
  v3 = *(_QWORD *)(a1 + 56);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *((unsigned __int8 *)v9 + 24));

  _Block_object_dispose(&v8, 8);
}

uint64_t __95__MPMediaLibraryDataProviderML3_removeItemsAtIndexes_inPlaylistWithIdentifier_completionBlock___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "removeTracksAtIndexes:notify:", *(_QWORD *)(a1 + 40), 1);
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

void __106__MPMediaLibraryDataProviderML3_sdk_addItemWithOpaqueIdentifier_toPlaylistWithIdentifier_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a3);
    v19 = v5;
    objc_msgSend(v5, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = v7;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v12);
          objc_msgSend(*(id *)(a1 + 32), "mediaLibrary");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "playlistWithPersistentID:", *(_QWORD *)(a1 + 48));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "itemsQuery");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v13, CFSTR("storeSagaID"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addFilterPredicate:", v17);
          objc_msgSend(v16, "items");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObjectsFromArray:", v18);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v10);
    }

    MPFetchArtworkForAddedMediaItems(v8);
    v5 = v19;
  }

}

void __117__MPMediaLibraryDataProviderML3_addItemsWithIdentifiers_andEntryProperties_toPlaylistWithIdentifier_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __117__MPMediaLibraryDataProviderML3_addItemsWithIdentifiers_andEntryProperties_toPlaylistWithIdentifier_completionBlock___block_invoke_2;
  v10[3] = &unk_1E315C670;
  v11 = v8;
  v9 = v8;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v7);
}

void __117__MPMediaLibraryDataProviderML3_addItemsWithIdentifiers_andEntryProperties_toPlaylistWithIdentifier_completionBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __117__MPMediaLibraryDataProviderML3_addItemsWithIdentifiers_andEntryProperties_toPlaylistWithIdentifier_completionBlock___block_invoke_4;
  v4[3] = &unk_1E3157EB8;
  v9 = *(_QWORD *)(a1 + 80);
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  objc_msgSend(v2, "performTransactionWithBlock:", v4);
  v3 = *(_QWORD *)(a1 + 72);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));

}

uint64_t __117__MPMediaLibraryDataProviderML3_addItemsWithIdentifiers_andEntryProperties_toPlaylistWithIdentifier_completionBlock___block_invoke_4(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "appendTracksWithPersistentIDs:andEntryProperties:withAttributionIdentifier:notify:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 1);
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
}

void __117__MPMediaLibraryDataProviderML3_addItemsWithIdentifiers_andEntryProperties_toPlaylistWithIdentifier_completionBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0D51238];
  v6 = a3;
  objc_msgSend(v5, "propertyForMPMediaEntityProperty:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);

}

void __98__MPMediaLibraryDataProviderML3_addItemsWithIdentifiers_toPlaylistWithIdentifier_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint64_t v7;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __98__MPMediaLibraryDataProviderML3_addItemsWithIdentifiers_toPlaylistWithIdentifier_completionBlock___block_invoke_2;
  v4[3] = &unk_1E3157F30;
  v7 = *(_QWORD *)(a1 + 64);
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "performTransactionWithBlock:", v4);
  v3 = *(_QWORD *)(a1 + 56);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));

}

uint64_t __98__MPMediaLibraryDataProviderML3_addItemsWithIdentifiers_toPlaylistWithIdentifier_completionBlock___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "appendTracksWithPersistentIDs:notify:", *(_QWORD *)(a1 + 40), 1);
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

void __96__MPMediaLibraryDataProviderML3_addItemWithIdentifier_toPlaylistWithIdentifier_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  uint64_t v9;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __96__MPMediaLibraryDataProviderML3_addItemWithIdentifier_toPlaylistWithIdentifier_completionBlock___block_invoke_2;
  v6[3] = &unk_1E3157DF0;
  v8 = *(_QWORD *)(a1 + 56);
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 64);
  v7 = v3;
  v9 = v4;
  objc_msgSend(v2, "performTransactionWithBlock:", v6);
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));

}

uint64_t __96__MPMediaLibraryDataProviderML3_addItemWithIdentifier_toPlaylistWithIdentifier_completionBlock___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v2, "appendTracksWithPersistentIDs:notify:", v4, 1);

  return *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
}

void __118__MPMediaLibraryDataProviderML3_setItemsWithIdentifiers_andEntryProperties_forPlaylistWithIdentifier_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __118__MPMediaLibraryDataProviderML3_setItemsWithIdentifiers_andEntryProperties_forPlaylistWithIdentifier_completionBlock___block_invoke_2;
  v10[3] = &unk_1E315C670;
  v11 = v8;
  v9 = v8;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v7);
}

void __118__MPMediaLibraryDataProviderML3_setItemsWithIdentifiers_andEntryProperties_forPlaylistWithIdentifier_completionBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __118__MPMediaLibraryDataProviderML3_setItemsWithIdentifiers_andEntryProperties_forPlaylistWithIdentifier_completionBlock___block_invoke_4;
  v4[3] = &unk_1E3157EB8;
  v9 = *(_QWORD *)(a1 + 80);
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  objc_msgSend(v2, "performTransactionWithBlock:", v4);
  v3 = *(_QWORD *)(a1 + 72);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));

}

uint64_t __118__MPMediaLibraryDataProviderML3_setItemsWithIdentifiers_andEntryProperties_forPlaylistWithIdentifier_completionBlock___block_invoke_4(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "setTracksWithPersistentIDs:andEntryProperties:withAttributionIdentifier:notify:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 1);
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
}

void __118__MPMediaLibraryDataProviderML3_setItemsWithIdentifiers_andEntryProperties_forPlaylistWithIdentifier_completionBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0D51238];
  v6 = a3;
  objc_msgSend(v5, "propertyForMPMediaEntityProperty:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);

}

void __79__MPMediaLibraryDataProviderML3__invalidatePersistentKeysForIdentifiers_count___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "saveKeyEntry:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = os_log_create("com.apple.amp.mediaplayer", "Library");
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 56);
      objc_msgSend(v4, "msv_description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138544130;
      v14 = v7;
      v15 = 2114;
      v16 = v8;
      v17 = 2048;
      v18 = v9;
      v19 = 2114;
      v20 = v10;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Moving key '%{public}@' for pid %lld to invalidate error=%{public}@", (uint8_t *)&v13, 0x2Au);

LABEL_6:
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 56);
    v13 = 138543874;
    v14 = v11;
    v15 = 2114;
    v16 = v8;
    v17 = 2048;
    v18 = v12;
    _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Moving key '%{public}@' for pid %lld to invalidate", (uint8_t *)&v13, 0x20u);
    goto LABEL_6;
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
}

void __79__MPMediaLibraryDataProviderML3__invalidatePersistentKeysForIdentifiers_count___block_invoke_153(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "userIdentity");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "processPendingKeyInvalidations");

}

uint64_t __66__MPMediaLibraryDataProviderML3_removeItemsWithIdentifiers_count___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_invalidatePersistentKeysForIdentifiers:count:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 56))
    {
      v3 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v3));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v4);

        ++v3;
      }
      while (*(_QWORD *)(a1 + 56) > v3);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D512C8], "unlinkRedownloadableAssetsFromLibrary:persistentIDs:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), v2);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D512C8], "removeFromMyLibrary:deletionType:persistentIDs:count:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

uint64_t __66__MPMediaLibraryDataProviderML3_deleteItemsWithIdentifiers_count___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidatePersistentKeysForIdentifiers:count:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D512C8], "removeFromMyLibrary:deletionType:persistentIDs:count:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

uint64_t __62__MPMediaLibraryDataProviderML3_removePlaylistWithIdentifier___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D51230], "deleteFromLibrary:deletionType:persistentIDs:count:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), 1, a1 + 48, 1);
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

BOOL __72__MPMediaLibraryDataProviderML3_sdk_addPlaylistWithValuesForProperties___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v2, "setObject:forKey:", v3, *MEMORY[0x1E0D50A58]);
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("externalVendorDisplayName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v2, "setObject:forKey:", v4, *MEMORY[0x1E0D50980]);
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("descriptionInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v2, "setObject:forKey:", v5, *MEMORY[0x1E0D50968]);
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("externalVendorContainerTag"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v2, "setObject:forKey:", v6, *MEMORY[0x1E0D50978]);
  v7 = objc_msgSend(MEMORY[0x1E0D51230], "newWithDictionary:inLibrary:", v2, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88));
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
  return v10;
}

BOOL __102__MPMediaLibraryDataProviderML3_addPlaylistWithValuesForProperties_trackList_playlistEntryProperties___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("isActiveGeniusPlaylist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (!v3)
    goto LABEL_4;
  v4 = (void *)MEMORY[0x1E0D51230];
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88);
  objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:equalToInt64:", *MEMORY[0x1E0D509A0], 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyInLibrary:predicate:", v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    return 0;
LABEL_4:
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v34 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0D51230], "propertyForMPMediaEntityProperty:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setValue:forKey:", v19, v18);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v14);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v20, *MEMORY[0x1E0D50A20]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v21, *MEMORY[0x1E0D50A28]);

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("isActiveGeniusPlaylist"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "BOOLValue");

  if (v23)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forKey:", v24, *MEMORY[0x1E0D509F8]);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v25, *MEMORY[0x1E0D509E8]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v26, *MEMORY[0x1E0D50A68]);

  v27 = objc_msgSend(MEMORY[0x1E0D51230], "newWithDictionary:inLibrary:", v11, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88));
  v28 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v29 = *(void **)(v28 + 40);
  *(_QWORD *)(v28 + 40) = v27;

  v30 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v30)
  {
    v31 = *(_QWORD *)(a1 + 48);
    if (v31)
    {
      objc_msgSend(v30, "setTracksWithPersistentIDs:andEntryProperties:withAttributionIdentifier:notify:", v31, *(_QWORD *)(a1 + 56), 0, 0);
      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) != 0;
    }
    else
    {
      v10 = 1;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __126__MPMediaLibraryDataProviderML3_setValuesForProperties_trackList_andEntryProperties_ofPlaylistWithIdentifier_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  v17[2] = __126__MPMediaLibraryDataProviderML3_setValuesForProperties_trackList_andEntryProperties_ofPlaylistWithIdentifier_completionBlock___block_invoke_2;
  v17[3] = &unk_1E3157D58;
  v25 = *(_QWORD *)(a1 + 104);
  v4 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v18 = v2;
  v19 = *(id *)(a1 + 48);
  v20 = *(id *)(a1 + 56);
  v21 = *(id *)(a1 + 64);
  v22 = *(id *)(a1 + 72);
  v5 = *(id *)(a1 + 80);
  v26 = *(_QWORD *)(a1 + 112);
  v6 = *(_QWORD *)(a1 + 32);
  v23 = v5;
  v24 = v6;
  objc_msgSend(v3, "performDatabaseTransactionWithBlock:", v17);
  v7 = *(_QWORD *)(a1 + 96);
  if (v7)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v7 + 16))(v7, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24), 0);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 16);
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __126__MPMediaLibraryDataProviderML3_setValuesForProperties_trackList_andEntryProperties_ofPlaylistWithIdentifier_completionBlock___block_invoke_146;
  v12[3] = &unk_1E3157DA0;
  v12[4] = v8;
  v13 = *(id *)(a1 + 88);
  v14 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 112);
  v15 = v10;
  v16 = v11;
  dispatch_async(v9, v12);

}

uint64_t __126__MPMediaLibraryDataProviderML3_setValuesForProperties_trackList_andEntryProperties_ofPlaylistWithIdentifier_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[4];
  NSObject *v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = objc_msgSend(v4, "setValues:forProperties:usingConnection:", v5, v6, v3);

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
  {
    v10 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v26 = v20;
      _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_DEFAULT, "Failed to update properties for container %{public}@", buf, 0xCu);
    }
    goto LABEL_14;
  }
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "setTracksWithPersistentIDs:andEntryProperties:withAttributionIdentifier:notify:", v7, *(_QWORD *)(a1 + 56), 0, 0);
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0D512C8], "containerQueryWithContainer:predicate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __126__MPMediaLibraryDataProviderML3_setValuesForProperties_trackList_andEntryProperties_ofPlaylistWithIdentifier_completionBlock___block_invoke_145;
    v23[3] = &unk_1E3157C90;
    v10 = v8;
    v24 = v10;
    objc_msgSend(v9, "enumeratePersistentIDsUsingBlock:", v23);
    v11 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = -[NSObject count](v10, "count");
      v13 = *(_QWORD *)(a1 + 96);
      v14 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 134218498;
      v26 = v12;
      v27 = 2048;
      v28 = v13;
      v29 = 2114;
      v30 = v14;
      _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_DEFAULT, "Adjusting track properties for %lu tracks in playlist:%lld: %{public}@", buf, 0x20u);
    }

    v15 = (void *)MEMORY[0x1E0D512C8];
    objc_msgSend(*(id *)(a1 + 64), "allValues");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = objc_msgSend(v15, "setValues:forProperties:forEntityPersistentIDs:inLibrary:usingConnection:", v16, v17, v10, *(_QWORD *)(*(_QWORD *)(a1 + 80) + 88), v3);

    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
    {
      v18 = os_log_create("com.apple.amp.mediaplayer", "Library");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = *(_QWORD *)(a1 + 96);
        *(_DWORD *)buf = 134217984;
        v26 = v19;
        _os_log_impl(&dword_193B9B000, v18, OS_LOG_TYPE_ERROR, "Failed to update track properties for playlist:%lld", buf, 0xCu);
      }

    }
LABEL_14:

  }
  v21 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);

  return v21;
}

void __126__MPMediaLibraryDataProviderML3_setValuesForProperties_trackList_andEntryProperties_ofPlaylistWithIdentifier_completionBlock___block_invoke_146(uint64_t a1)
{
  void *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  __objc2_prot_list **p_prots;
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void **v33;
  void **v34;
  uint64_t v35;
  NSObject *v36;
  const char *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  _QWORD v78[2];
  _QWORD v79[2];
  uint8_t buf[4];
  _BYTE v81[28];
  __int16 v82;
  int v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  if (MPML3LookupItemAdvertisementType_block_invoke_onceToken != -1)
    dispatch_once(&MPML3LookupItemAdvertisementType_block_invoke_onceToken, &__block_literal_global_148_20217);
  objc_msgSend(*(id *)(a1 + 32), "userIdentity");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "isCloudEnabled");
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
  v53 = v2;
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v71;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v71 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend((id)MPML3LookupItemAdvertisementType_block_invoke___cloudPropertiesToAggregate, "containsObject:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i)) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_14;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
      if (v6)
        continue;
      break;
    }
    v9 = 0;
  }
  else
  {
    v9 = 0;
  }
LABEL_14:

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v66, v85, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v67;
    while (2)
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v67 != v12)
          objc_enumerationMutation(v10);
        if ((objc_msgSend((id)MPML3LookupItemAdvertisementType_block_invoke___cloudPropertiesToUpload, "containsObject:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * j)) & 1) != 0)
        {
          LODWORD(v11) = 1;
          goto LABEL_24;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v66, v85, 16);
      if (v11)
        continue;
      break;
    }
LABEL_24:
    v2 = v53;
  }

  if ((v3 & (v9 | v11)) == 1)
  {
    if (v9)
      objc_msgSend(v2, "uploadCloudPlaylistProperties");
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "allKeys");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v62, v84, 16);
    if (v15)
    {
      v16 = v15;
      v17 = 0x1E0D51000uLL;
      p_prots = &OBJC_PROTOCOL___MPMusicMediaPickerClientController.prots;
      v61 = *(_QWORD *)v63;
      v59 = *MEMORY[0x1E0D50AA8];
      v57 = *MEMORY[0x1E0D508D8];
      v56 = *MEMORY[0x1E0D50A48];
      v54 = *MEMORY[0x1E0D50A50];
      v55 = v14;
      do
      {
        v19 = 0;
        v58 = v16;
        do
        {
          if (*(_QWORD *)v63 != v61)
            objc_enumerationMutation(v14);
          v20 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v19);
          objc_msgSend(*(id *)(v17 + 560), "propertyForMPMediaEntityProperty:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v21)
          {
            v25 = os_log_create("com.apple.amp.mediaplayer", "Library");
            if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              goto LABEL_66;
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)v81 = v20;
            v36 = v25;
            v37 = "Property %{public}@ is invalid and will not be propagated";
LABEL_47:
            _os_log_impl(&dword_193B9B000, v36, OS_LOG_TYPE_ERROR, v37, buf, 0xCu);
            goto LABEL_66;
          }
          if ((-[__objc2_prot_list containsObject:](p_prots[399], "containsObject:", v20) & 1) == 0)
          {
            v25 = os_log_create("com.apple.amp.mediaplayer", "Library");
            if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              goto LABEL_66;
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)v81 = v20;
            v36 = v25;
            v37 = "Property %{public}@ is not a valid property to upload and will not be propagated";
            goto LABEL_47;
          }
          v22 = v17;
          objc_msgSend(*(id *)(a1 + 48), "valueForProperty:", v59);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "unsignedLongLongValue");

          objc_msgSend(*(id *)(a1 + 48), "valueForProperty:", v57);
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = os_log_create("com.apple.amp.mediaplayer", "Library");
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138544130;
            *(_QWORD *)v81 = v21;
            *(_WORD *)&v81[8] = 2048;
            *(_QWORD *)&v81[10] = v24;
            *(_WORD *)&v81[18] = 2114;
            *(_QWORD *)&v81[20] = v25;
            v82 = 1024;
            v83 = 1;
            _os_log_impl(&dword_193B9B000, v26, OS_LOG_TYPE_DEFAULT, "Uploading property=%{public}@ for playlist sagaID=%lld, containerGlobalID=%{public}@ isCloudLibraryEnabled=%{BOOL}u", buf, 0x26u);
          }

          if (objc_msgSend(v21, "isEqualToString:", v56))
          {
            objc_msgSend(*(id *)(a1 + 56), "valueForKey:", v21);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "integerValue");

            objc_msgSend(*(id *)(a1 + 56), "valueForKey:", v54);
            v29 = objc_claimAutoreleasedReturnValue();
            v30 = (void *)v29;
            if (v28 && v29)
            {
              if (objc_msgSend(v20, "isEqualToString:", CFSTR("_playlistLikedState")))
              {
                if (v24)
                {
                  v78[0] = CFSTR("_playlistLikedState");
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v28);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v78[1] = CFSTR("likedStateChangedDate");
                  v79[0] = v31;
                  v79[1] = v30;
                  v32 = (void *)MEMORY[0x1E0C99D80];
                  v33 = (void **)v79;
                  v34 = (void **)v78;
                  v35 = 2;
                  goto LABEL_61;
                }
                if (v25)
                {
                  v17 = v22;
                  if (v28 == 2)
                    objc_msgSend(v2, "favoritePlaylistWithPersistentID:globalID:time:completionHandler:", *(_QWORD *)(a1 + 64), v25, v30, 0);
                  else
                    objc_msgSend(v2, "setLikedState:forPlaylistWithGlobalID:persistentID:timeStamp:completion:", v28, v25, *(_QWORD *)(a1 + 64), v30, 0);
                }
                else
                {
                  v48 = os_log_create("com.apple.amp.mediaplayer", "Library");
                  v17 = v22;
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                  {
                    v49 = *(_QWORD *)(a1 + 64);
                    *(_DWORD *)buf = 67109634;
                    *(_DWORD *)v81 = v28;
                    *(_WORD *)&v81[4] = 2114;
                    *(_QWORD *)&v81[6] = v30;
                    *(_WORD *)&v81[14] = 2048;
                    *(_QWORD *)&v81[16] = v49;
                    _os_log_impl(&dword_193B9B000, v48, OS_LOG_TYPE_ERROR, "Not propagating favorite state change for playlist (likedState=%d, timeStamp=%{public}@) with persistentID=%lld as it's missing store identifiers", buf, 0x1Cu);
                  }

                }
LABEL_63:
                v16 = v58;
LABEL_64:

                v14 = v55;
                goto LABEL_65;
              }
              if (objc_msgSend(v20, "isEqualToString:", CFSTR("likedState")))
              {
                if (v24)
                {
                  v76 = v20;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v28);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v77 = v31;
                  v32 = (void *)MEMORY[0x1E0C99D80];
                  v33 = &v77;
                  v34 = &v76;
                  v35 = 1;
LABEL_61:
                  objc_msgSend(v32, "dictionaryWithObjects:forKeys:count:", v33, v34, v35);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v2, "setPlaylistProperties:trackList:forPlaylistWithPersistentID:completionHandler:", v47, 0, *(_QWORD *)(a1 + 64), 0);

                }
                else
                {
                  if (!v25)
                  {
                    v50 = os_log_create("com.apple.amp.mediaplayer", "Library");
                    v17 = v22;
                    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                    {
                      v51 = *(_QWORD *)(a1 + 48);
                      *(_DWORD *)buf = 138543362;
                      *(_QWORD *)v81 = v51;
                      _os_log_impl(&dword_193B9B000, v50, OS_LOG_TYPE_ERROR, "Not propagating favorite state change for %{public}@ as store identifiers are missing", buf, 0xCu);
                    }

                    goto LABEL_63;
                  }
                  objc_msgSend(v2, "setLikedState:forPlaylistWithGlobalID:", v28, v25);
                }
              }
            }
            else
            {
              v44 = os_log_create("com.apple.amp.mediaplayer", "Library");
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              {
                v45 = *(_QWORD *)(a1 + 64);
                *(_DWORD *)buf = 67109634;
                *(_DWORD *)v81 = v28;
                *(_WORD *)&v81[4] = 2114;
                *(_QWORD *)&v81[6] = v30;
                *(_WORD *)&v81[14] = 2048;
                *(_QWORD *)&v81[16] = v45;
                _os_log_impl(&dword_193B9B000, v44, OS_LOG_TYPE_ERROR, "Not propagating favorite state change for playlist (likedState=%d, timeStamp=%{public}@) with persistentID=%lld as the request is not valid", buf, 0x1Cu);
              }

            }
            v17 = v22;
            goto LABEL_63;
          }
          if (v24)
          {
            objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v21);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v20, "isEqualToString:", CFSTR("parentPersistentID")))
            {
              v17 = v22;
              if (objc_msgSend(v30, "longLongValue"))
              {
                v38 = *(void **)(v22 + 560);
                v39 = objc_msgSend(v30, "longLongValue");
                objc_msgSend(*(id *)(a1 + 32), "library");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = v39;
                v17 = v22;
                v42 = (void *)objc_msgSend(v38, "newWithPersistentID:inLibrary:", v41, v40);

                objc_msgSend(v42, "valueForProperty:", v59);
                v43 = objc_claimAutoreleasedReturnValue();

                v30 = (void *)v43;
                v2 = v53;
              }
            }
            else
            {
              v17 = v22;
            }
            v16 = v58;
            v74 = v20;
            v75 = v30;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "setPlaylistProperties:trackList:forPlaylistWithPersistentID:completionHandler:", v46, 0, *(_QWORD *)(a1 + 64), 0);

            goto LABEL_64;
          }
          v17 = v22;
          v16 = v58;
LABEL_65:
          p_prots = (__objc2_prot_list **)(&OBJC_PROTOCOL___MPMusicMediaPickerClientController + 16);
LABEL_66:

          ++v19;
        }
        while (v16 != v19);
        v52 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v62, v84, 16);
        v16 = v52;
      }
      while (v52);
    }
  }
  else
  {
    v14 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v81 = v3;
      *(_WORD *)&v81[4] = 1024;
      *(_DWORD *)&v81[6] = v11;
      *(_WORD *)&v81[10] = 1024;
      *(_DWORD *)&v81[12] = v9;
      _os_log_impl(&dword_193B9B000, v14, OS_LOG_TYPE_ERROR, "Not propagating change(s) - cloudLibraryEnabled=%{BOOL}u, hasCloudPropertyToUpdate=%{BOOL}u, hasCloudPropertyToAggregate=%{BOOL}u", buf, 0x14u);
    }
  }

}

void __126__MPMediaLibraryDataProviderML3_setValuesForProperties_trackList_andEntryProperties_ofPlaylistWithIdentifier_completionBlock___block_invoke_2_147()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("likedState"), CFSTR("_playlistLikedState"), CFSTR("parentPersistentID"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MPML3LookupItemAdvertisementType_block_invoke___cloudPropertiesToUpload;
  MPML3LookupItemAdvertisementType_block_invoke___cloudPropertiesToUpload = v0;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("playCountSinceSync"), CFSTR("datePlayed"), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)MPML3LookupItemAdvertisementType_block_invoke___cloudPropertiesToAggregate;
  MPML3LookupItemAdvertisementType_block_invoke___cloudPropertiesToAggregate = v2;

}

void __126__MPMediaLibraryDataProviderML3_setValuesForProperties_trackList_andEntryProperties_ofPlaylistWithIdentifier_completionBlock___block_invoke_145(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __110__MPMediaLibraryDataProviderML3_setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  id v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  v4 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __110__MPMediaLibraryDataProviderML3_setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock___block_invoke_3;
  v23[3] = &unk_1E3157CE0;
  v24 = v2;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 112);
  v30 = *(_QWORD *)(a1 + 104);
  v31 = v6;
  v7 = *(_QWORD *)(a1 + 32);
  v25 = v5;
  v26 = v7;
  v28 = *(_QWORD *)(a1 + 80);
  v27 = *(id *)(a1 + 56);
  v29 = *(_OWORD *)(a1 + 88);
  objc_msgSend(v3, "performDatabaseTransactionWithBlock:", v23);
  v8 = *(_QWORD *)(a1 + 72);
  if (v8)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v8 + 16))(v8, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), 0);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(NSObject **)(v9 + 16);
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __110__MPMediaLibraryDataProviderML3_setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock___block_invoke_140;
  block[3] = &unk_1E3157D08;
  block[4] = v9;
  v15 = *(id *)(a1 + 64);
  v16 = *(id *)(a1 + 48);
  v19 = *(_OWORD *)(a1 + 88);
  v11 = *(_QWORD *)(a1 + 112);
  v20 = *(_QWORD *)(a1 + 104);
  v21 = v11;
  v17 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 120);
  v18 = v12;
  v22 = v13;
  dispatch_async(v10, block);

}

BOOL __110__MPMediaLibraryDataProviderML3_setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  NSObject *v70;
  uint64_t v71;
  int v72;
  _BOOL8 v73;
  void *v74;
  void *v75;
  uint64_t *v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  _QWORD v90[4];
  id v91;
  _QWORD v92[4];
  id v93;
  _QWORD v94[4];
  id v95;
  uint64_t v96;
  id v97;
  _QWORD v98[2];
  _QWORD v99[2];
  uint64_t v100;
  id v101;
  _QWORD v102[3];
  _QWORD v103[3];
  uint64_t v104;
  _QWORD v105[2];
  _QWORD v106[2];
  uint64_t v107;
  uint64_t v108;
  _QWORD v109[2];
  uint8_t buf[4];
  uint64_t v111;
  __int16 v112;
  int v113;
  __int16 v114;
  uint64_t v115;
  uint64_t v116;
  _QWORD v117[4];

  v117[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = *MEMORY[0x1E0D50AB8];
  if (!objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *MEMORY[0x1E0D50AB8]))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("liked_state")))
    {
      v26 = *(_QWORD *)(a1 + 88);
      if (v26 == objc_opt_class())
      {
        v29 = (id *)MEMORY[0x1E0D50A50];
      }
      else
      {
        v27 = *(_QWORD *)(a1 + 88);
        if (v27 == objc_opt_class())
        {
          v29 = (id *)MEMORY[0x1E0D507D8];
        }
        else
        {
          v28 = *(_QWORD *)(a1 + 88);
          if (v28 != objc_opt_class())
            goto LABEL_36;
          v29 = (id *)MEMORY[0x1E0D50780];
        }
      }
      v78 = *v29;
      if (v78)
      {
        v6 = v78;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v4, "integerValue");
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v79 = objc_claimAutoreleasedReturnValue();
        v80 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
        v81 = *(void **)(v80 + 40);
        *(_QWORD *)(v80 + 40) = v79;

        v74 = *(void **)(a1 + 56);
        v82 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
        v99[0] = v4;
        v99[1] = v82;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 2);
        v70 = objc_claimAutoreleasedReturnValue();
        v98[0] = *(_QWORD *)(a1 + 40);
        v98[1] = v6;
        v75 = (void *)MEMORY[0x1E0C99D20];
        v76 = v98;
        v77 = 2;
LABEL_35:
        objc_msgSend(v75, "arrayWithObjects:count:", v76, v77);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v74, "setValues:forProperties:usingConnection:", v70, v83, v3);

LABEL_37:
        v73 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) != 0;
        goto LABEL_38;
      }
    }
LABEL_36:
    v84 = *(void **)(a1 + 56);
    v97 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v97, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v96, 1);
    v70 = objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v84, "setValues:forProperties:usingConnection:", v6, v70, v3);
    goto LABEL_37;
  }
  if (objc_msgSend(v4, "integerValue") == -1)
  {

    v4 = &unk_1E31E4A80;
  }
  v4 = v4;
  v6 = v4;
  if (!objc_msgSend(v4, "integerValue"))
  {

    v6 = &unk_1E31E4A98;
  }
  if (objc_msgSend(v6, "integerValue") == -1)
  {
    v30 = (void *)MEMORY[0x1E0D51218];
    objc_msgSend(*(id *)(a1 + 88), "trackForeignPersistentID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "predicateWithProperty:equalToInt64:", v31, *(_QWORD *)(a1 + 96));
    v32 = objc_claimAutoreleasedReturnValue();

    v89 = (void *)v32;
    objc_msgSend(MEMORY[0x1E0D512C8], "queryWithLibrary:predicate:orderingTerms:usingSections:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 88), v32, 0, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_opt_new();
    v94[0] = MEMORY[0x1E0C809B0];
    v94[1] = 3221225472;
    v94[2] = __110__MPMediaLibraryDataProviderML3_setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock___block_invoke_126;
    v94[3] = &unk_1E3157C90;
    v35 = v34;
    v95 = v35;
    objc_msgSend(v33, "enumeratePersistentIDsUsingBlock:", v94);
    v36 = (void *)MEMORY[0x1E0D512C8];
    v117[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v116, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v36, "setValues:forProperties:forEntityPersistentIDs:inLibrary:usingConnection:", v37, v38, v35, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 88), v3);

    v39 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = objc_msgSend(v35, "count");
      v41 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      v42 = *(_QWORD *)(a1 + 96);
      *(_DWORD *)buf = 134218496;
      v111 = v40;
      v112 = 1024;
      v113 = v41;
      v114 = 2048;
      v115 = v42;
      _os_log_impl(&dword_193B9B000, v39, OS_LOG_TYPE_DEFAULT, "Disabled keep_local on %lu tracks with status:%d for collection:%lld", buf, 0x1Cu);
    }

    v43 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    if (v43)
      goto LABEL_25;
  }
  else
  {
    if (objc_msgSend(v6, "integerValue") == -2)
    {
      objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:value:comparison:", *MEMORY[0x1E0D50E08], &unk_1E31E4A80, 1);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D511D8];
      v9 = (void *)MEMORY[0x1E0D51218];
      objc_msgSend(*(id *)(a1 + 88), "trackForeignPersistentID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "predicateWithProperty:equalToInt64:", v10, *(_QWORD *)(a1 + 96));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v109[0] = v11;
      v109[1] = v7;
      v88 = (void *)v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v109, 2);
      v87 = v3;
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "predicateMatchingPredicates:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v86 = (void *)v13;
      objc_msgSend(MEMORY[0x1E0D512C8], "queryWithLibrary:predicate:orderingTerms:usingSections:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 88), v13, 0, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_opt_new();
      v108 = *MEMORY[0x1E0D50C08];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v108, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v92[0] = MEMORY[0x1E0C809B0];
      v92[1] = 3221225472;
      v92[2] = __110__MPMediaLibraryDataProviderML3_setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock___block_invoke_127;
      v92[3] = &unk_1E3157CB8;
      v17 = v15;
      v93 = v17;
      objc_msgSend(v14, "enumeratePersistentIDsAndProperties:usingBlock:", v16, v92);

      v18 = (void *)MEMORY[0x1E0D512C8];
      v107 = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v107, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v18;
      v3 = v87;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v20, "setValues:forProperties:forEntityPersistentIDs:inLibrary:usingConnection:", &unk_1E31E5968, v19, v17, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 88), v87);

      v21 = os_log_create("com.apple.amp.mediaplayer", "Library");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = objc_msgSend(v17, "count");
        v23 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        v24 = *(_QWORD *)(a1 + 96);
        *(_DWORD *)buf = 134218496;
        v111 = v22;
        v112 = 1024;
        v113 = v23;
        v114 = 2048;
        v115 = v24;
        _os_log_impl(&dword_193B9B000, v21, OS_LOG_TYPE_DEFAULT, "Cancelled keep_local on %lu tracks with status:%d for collection: %lld", buf, 0x1Cu);
      }

      v25 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    }
    else
    {
      if (objc_msgSend(v6, "integerValue") < 1)
        goto LABEL_25;
      v44 = (void *)MEMORY[0x1E0D511E0];
      objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:equalToInteger:", v5, -1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v106[0] = v45;
      objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:equalToInteger:", v5, -2);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v106[1] = v46;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 2);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "predicateMatchingPredicates:", v47);
      v48 = objc_claimAutoreleasedReturnValue();

      v49 = (void *)MEMORY[0x1E0D511D8];
      v50 = (void *)MEMORY[0x1E0D51218];
      objc_msgSend(*(id *)(a1 + 88), "trackForeignPersistentID");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "predicateWithProperty:equalToInt64:", v51, *(_QWORD *)(a1 + 96));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v105[0] = v52;
      v105[1] = v48;
      v88 = (void *)v48;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 2);
      v53 = v3;
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "predicateMatchingPredicates:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D512C8], "queryWithLibrary:predicate:orderingTerms:usingSections:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 88), v55, 0, 0);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = (void *)objc_opt_new();
      v90[0] = MEMORY[0x1E0C809B0];
      v90[1] = 3221225472;
      v90[2] = __110__MPMediaLibraryDataProviderML3_setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock___block_invoke_132;
      v90[3] = &unk_1E3157C90;
      v58 = v57;
      v91 = v58;
      objc_msgSend(v56, "enumeratePersistentIDsUsingBlock:", v90);
      v59 = (void *)MEMORY[0x1E0D512C8];
      v104 = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v104, 1);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v59;
      v3 = v53;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v61, "setValues:forProperties:forEntityPersistentIDs:inLibrary:usingConnection:", &unk_1E31E5980, v60, v58, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 88), v53);

      v62 = os_log_create("com.apple.amp.mediaplayer", "Library");
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v63 = objc_msgSend(v58, "count");
        v64 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        v65 = *(_QWORD *)(a1 + 96);
        *(_DWORD *)buf = 134218496;
        v111 = v63;
        v112 = 1024;
        v113 = v64;
        v114 = 2048;
        v115 = v65;
        _os_log_impl(&dword_193B9B000, v62, OS_LOG_TYPE_DEFAULT, "Cleared keep_local on %lu tracks with status:%d for collection:%lld", buf, 0x1Cu);
      }

      v25 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    }

    if (v25)
    {
LABEL_25:
      if (!objc_msgSend(v4, "integerValue") || objc_msgSend(v4, "integerValue") == -2)
      {
        v66 = *(void **)(a1 + 56);
        v103[0] = v4;
        v103[1] = &unk_1E31E4A80;
        v103[2] = &unk_1E31E4AC8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 3);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = *MEMORY[0x1E0D50AC8];
        v102[0] = *(_QWORD *)(a1 + 40);
        v102[1] = v68;
        v102[2] = *MEMORY[0x1E0D50AD0];
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 3);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v66, "setValues:forProperties:usingConnection:", v67, v69, v3);

        v70 = os_log_create("com.apple.amp.mediaplayer", "Library");
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          v71 = *(_QWORD *)(a1 + 96);
          v72 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
          *(_DWORD *)buf = 134218240;
          v111 = v71;
          v112 = 1024;
          v113 = v72;
          _os_log_impl(&dword_193B9B000, v70, OS_LOG_TYPE_DEFAULT, "Cleared keep_local_status for collection %lld with status:%d", buf, 0x12u);
        }
        goto LABEL_37;
      }
      v74 = *(void **)(a1 + 56);
      v101 = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v101, 1);
      v70 = objc_claimAutoreleasedReturnValue();
      v100 = *(_QWORD *)(a1 + 40);
      v75 = (void *)MEMORY[0x1E0C99D20];
      v76 = &v100;
      v77 = 1;
      goto LABEL_35;
    }
  }

  v73 = 0;
LABEL_38:

  return v73;
}

void __110__MPMediaLibraryDataProviderML3_setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock___block_invoke_140(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint32_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  NSObject *v47;
  uint32_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD v63[3];
  _QWORD v64[3];
  _QWORD v65[3];
  _QWORD v66[3];
  uint8_t buf[4];
  _BYTE v68[28];
  __int16 v69;
  int v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "isCloudLibraryEnabled");
  if (!objc_msgSend((id)setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock____cloudPropertiesToUpload, "containsObject:", *(_QWORD *)(a1 + 40))|| !objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("liked_state")))
  {
    goto LABEL_64;
  }
  v5 = *(_QWORD *)(a1 + 88);
  if (v5 != objc_opt_class())
  {
    v6 = *(_QWORD *)(a1 + 88);
    if (v6 == objc_opt_class())
    {
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)
        && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
      {
        if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("_albumLikedState")))
        {
          objc_msgSend(*(id *)(a1 + 56), "valueForProperty:", *MEMORY[0x1E0D507C0]);
          v7 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "valueForProperty:", *MEMORY[0x1E0D507F8]);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "longLongValue");

          _MPLogCategoryLibrary();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            v11 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 138544130;
            *(_QWORD *)v68 = v11;
            *(_WORD *)&v68[8] = 2114;
            *(_QWORD *)&v68[10] = v7;
            *(_WORD *)&v68[18] = 2048;
            *(_QWORD *)&v68[20] = v9;
            v69 = 1024;
            v70 = v4;
            _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_DEFAULT, "Uploading property=%{public}@ for albumCloudID=%{public}@, storeID=%lld isCloudLibraryEnabled=%{BOOL}u", buf, 0x26u);
          }

          if (v4)
          {
            if (-[NSObject length](v7, "length"))
            {
              v12 = *(_QWORD *)(a1 + 64);
              v63[0] = *(_QWORD *)(a1 + 40);
              v63[1] = CFSTR("albumLikedStateChangedDate");
              v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
              v64[0] = v12;
              v64[1] = v13;
              v63[2] = CFSTR("albumCloudLibraryID");
              v64[2] = v7;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 3);
              v14 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "setAlbumProperties:forEntityWithPersistentID:cloudLibraryID:completionHandler:", v14, *(_QWORD *)(a1 + 96), v7, 0);
LABEL_62:

              goto LABEL_63;
            }
            if (v9)
            {
              v35 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
              v36 = *(_QWORD *)(a1 + 96);
              v34 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
              if (v35 == 2)
              {
                v38 = v3;
                v39 = *(_QWORD *)(a1 + 96);
                v40 = v9;
                v41 = 3;
                goto LABEL_49;
              }
              goto LABEL_37;
            }
            _MPLogCategoryLibrary();
            v14 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              goto LABEL_62;
            v58 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
            v59 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
            v60 = *(_QWORD *)(a1 + 96);
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)v68 = v58;
            *(_WORD *)&v68[4] = 2114;
            *(_QWORD *)&v68[6] = v59;
            *(_WORD *)&v68[14] = 2048;
            *(_QWORD *)&v68[16] = v60;
            v46 = "Not propagating favorite state change for album (likedState=%d, timeStamp=%{public}@) with persistentI"
                  "D=%lld as it's missing store identifiers";
          }
          else
          {
            if (v9 || -[NSObject length](v7, "length"))
            {
              v35 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
              v36 = *(_QWORD *)(a1 + 96);
              v34 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
LABEL_37:
              objc_msgSend(v3, "setLikedState:forAlbumWithStoreID:persistentID:timeStamp:completion:", v35, v9, v36, v34, 0);
              goto LABEL_63;
            }
            _MPLogCategoryLibrary();
            v14 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              goto LABEL_62;
            v55 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
            v56 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
            v57 = *(_QWORD *)(a1 + 96);
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)v68 = v55;
            *(_WORD *)&v68[4] = 2114;
            *(_QWORD *)&v68[6] = v56;
            *(_WORD *)&v68[14] = 2048;
            *(_QWORD *)&v68[16] = v57;
            v46 = "Not propagating favorite state change for album (likedState=%d, timeStamp=%{public}@) with persistentI"
                  "D=%lld as cloudLibrary is not enabled and it's missing store identifiers";
          }
          goto LABEL_60;
        }
        if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("albumLikedState")))
        {
          if (!objc_msgSend(v3, "isCloudEnabled"))
          {
            ML3CollectionStoreIDPropertyForGroupingType(*(_QWORD *)(a1 + 104));
            v7 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 56), "valueForProperty:", v7);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v42, "unsignedLongLongValue");

            if (v43 && *(_QWORD *)(a1 + 104) == 1)
            {
              objc_msgSend(v3, "setLikedState:forAlbumWithStoreID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), v43);
              goto LABEL_63;
            }
            _MPLogCategoryLibrary();
            v14 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              goto LABEL_62;
            v44 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
            v45 = *(_QWORD *)(a1 + 56);
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v68 = v44;
            *(_WORD *)&v68[4] = 2114;
            *(_QWORD *)&v68[6] = v45;
            v46 = "Not propagating liked state=%d for album=%{public}@";
            v47 = v14;
            v48 = 18;
LABEL_61:
            _os_log_impl(&dword_193B9B000, v47, OS_LOG_TYPE_ERROR, v46, buf, v48);
            goto LABEL_62;
          }
          v31 = *(_QWORD *)(a1 + 64);
          v61 = *(_QWORD *)(a1 + 40);
          v62 = v31;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
          v7 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setCollectionProperties:forCollectionWithPersistentID:groupingType:completionHandler:", v7, *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), 0);
LABEL_63:

          goto LABEL_64;
        }
        _MPLogCategoryLibrary();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          goto LABEL_63;
        v37 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)v68 = v37;
        v24 = "Not propagating favorite state change for %{public}@ as cloud library is not enabled";
        v28 = v7;
        v29 = OS_LOG_TYPE_DEFAULT;
        v30 = 12;
LABEL_26:
        _os_log_impl(&dword_193B9B000, v28, v29, v24, buf, v30);
        goto LABEL_63;
      }
      v7 = os_log_create("com.apple.amp.mediaplayer", "Library");
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        goto LABEL_63;
      v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      v27 = *(_QWORD *)(a1 + 96);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v68 = v25;
      *(_WORD *)&v68[4] = 2114;
      *(_QWORD *)&v68[6] = v26;
      *(_WORD *)&v68[14] = 2048;
      *(_QWORD *)&v68[16] = v27;
      v24 = "Not propagating favorite state change for album (likedState=%d, timeStamp=%{public}@) with persistentID=%lld"
            " as the request is not valid";
LABEL_25:
      v28 = v7;
      v29 = OS_LOG_TYPE_ERROR;
      v30 = 28;
      goto LABEL_26;
    }
    goto LABEL_64;
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)
    || !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_63;
    v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    v23 = *(_QWORD *)(a1 + 96);
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v68 = v21;
    *(_WORD *)&v68[4] = 2114;
    *(_QWORD *)&v68[6] = v22;
    *(_WORD *)&v68[14] = 2048;
    *(_QWORD *)&v68[16] = v23;
    v24 = "Not propagating favorite state change for album artist (likedState=%d, timeStamp=%{public}@) with persistentID"
          "=%lld as the request is not valid";
    goto LABEL_25;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("_albumArtistLikedState")))
  {
    objc_msgSend(*(id *)(a1 + 56), "valueForProperty:", *MEMORY[0x1E0D50770]);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "valueForProperty:", *MEMORY[0x1E0D50798]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "longLongValue");

    _MPLogCategoryLibrary();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)v68 = v18;
      *(_WORD *)&v68[8] = 2114;
      *(_QWORD *)&v68[10] = v7;
      *(_WORD *)&v68[18] = 2048;
      *(_QWORD *)&v68[20] = v16;
      v69 = 1024;
      v70 = v4;
      _os_log_impl(&dword_193B9B000, v17, OS_LOG_TYPE_DEFAULT, "Uploading property=%{public}@ for artistCloudID=%{public}@, storeID=%lld isCloudLibraryEnabled=%{BOOL}u", buf, 0x26u);
    }

    if (v4)
    {
      if (-[NSObject length](v7, "length"))
      {
        v19 = *(_QWORD *)(a1 + 64);
        v65[0] = *(_QWORD *)(a1 + 40);
        v65[1] = CFSTR("albumArtistDateFavorited");
        v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
        v66[0] = v19;
        v66[1] = v20;
        v65[2] = CFSTR("albumArtistCloudUniversalLibraryID");
        v66[2] = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 3);
        v14 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setAlbumArtistProperties:forEntityWithPersistentID:completionHandler:", v14, *(_QWORD *)(a1 + 96), 0);
        goto LABEL_62;
      }
      if (v16)
      {
        v32 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
        v33 = *(_QWORD *)(a1 + 96);
        v34 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
        if (v32 == 2)
        {
          v38 = v3;
          v39 = *(_QWORD *)(a1 + 96);
          v40 = v16;
          v41 = 2;
LABEL_49:
          objc_msgSend(v38, "favoriteEntityWithPersistentID:storeID:entityType:time:completionHandler:", v39, v40, v41, v34, 0);
          goto LABEL_63;
        }
        goto LABEL_33;
      }
      _MPLogCategoryLibrary();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_62;
      v52 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      v53 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      v54 = *(_QWORD *)(a1 + 96);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v68 = v52;
      *(_WORD *)&v68[4] = 2114;
      *(_QWORD *)&v68[6] = v53;
      *(_WORD *)&v68[14] = 2048;
      *(_QWORD *)&v68[16] = v54;
      v46 = "Not propagating favorite state change for album artist (likedState=%d, timeStamp=%{public}@) with persistent"
            "ID=%lld as it's missing store identifiers";
    }
    else
    {
      if (v16 || -[NSObject length](v7, "length"))
      {
        v32 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
        v33 = *(_QWORD *)(a1 + 96);
        v34 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
LABEL_33:
        objc_msgSend(v3, "setLikedState:forArtistWithStoreID:persistentID:timeStamp:completion:", v32, v16, v33, v34, 0);
        goto LABEL_63;
      }
      _MPLogCategoryLibrary();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_62;
      v49 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      v50 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      v51 = *(_QWORD *)(a1 + 96);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v68 = v49;
      *(_WORD *)&v68[4] = 2114;
      *(_QWORD *)&v68[6] = v50;
      *(_WORD *)&v68[14] = 2048;
      *(_QWORD *)&v68[16] = v51;
      v46 = "Not propagating favorite state change for album artist (likedState=%d, timeStamp=%{public}@) with persistent"
            "ID=%lld as cloudLibrary is not enabled and it's missing store identifiers";
    }
LABEL_60:
    v47 = v14;
    v48 = 28;
    goto LABEL_61;
  }
LABEL_64:

}

void __110__MPMediaLibraryDataProviderML3_setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock___block_invoke_126(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __110__MPMediaLibraryDataProviderML3_setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock___block_invoke_127(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __110__MPMediaLibraryDataProviderML3_setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock___block_invoke_132(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __110__MPMediaLibraryDataProviderML3_setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("albumLikedState"), CFSTR("_albumLikedState"), CFSTR("albumArtistFavoriteState"), CFSTR("_albumArtistLikedState"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock____cloudPropertiesToUpload;
  setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock____cloudPropertiesToUpload = v0;

}

void __78__MPMediaLibraryDataProviderML3_setValues_forProperties_forItemPersistentIDs___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__MPMediaLibraryDataProviderML3_setValues_forProperties_forItemPersistentIDs___block_invoke_2;
  v6[3] = &unk_1E3157C48;
  v7 = v2;
  v8 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 32);
  v9 = v4;
  v10 = v5;
  objc_msgSend(v3, "performDatabaseTransactionWithBlock:", v6);

}

void __78__MPMediaLibraryDataProviderML3_setValues_forProperties_forItemPersistentIDs___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "userIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v2);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isCloudEnabled"))
  {
    MPTrackCloudPropertiesToAggregate();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "intersectsSet:", v4);

    if (v5)
      objc_msgSend(v6, "uploadCloudItemProperties");

  }
}

uint64_t __78__MPMediaLibraryDataProviderML3_setValues_forProperties_forItemPersistentIDs___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D512C8], "setValues:forProperties:forEntityPersistentIDs:inLibrary:usingConnection:", a1[4], a1[5], a1[6], *(_QWORD *)(a1[7] + 88), a2);
}

void __91__MPMediaLibraryDataProviderML3_setValue_forProperty_ofItemWithIdentifier_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t *v11;
  uint64_t *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[6];
  uint8_t buf[4];
  _BYTE v49[28];
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[3];

  v59[2] = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 128) && objc_msgSend(*(id *)(a1 + 32), "containsObject:", *(_QWORD *)(a1 + 40)))
    objc_msgSend(*(id *)(a1 + 48), "uploadCloudItemProperties");
  if (objc_msgSend(*(id *)(a1 + 56), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("_itemLikedState")))
    {
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24)
        && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40))
      {
        objc_msgSend(*(id *)(a1 + 64), "valueForProperty:", *MEMORY[0x1E0D51148]);
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v2, "unsignedLongLongValue");

        objc_msgSend(*(id *)(a1 + 64), "valueForProperty:", *MEMORY[0x1E0D51100]);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "unsignedLongLongValue");

        if (!v5)
        {
          objc_msgSend(*(id *)(a1 + 64), "valueForProperty:", *MEMORY[0x1E0D51150]);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = objc_msgSend(v6, "unsignedLongLongValue");

        }
        if (*(_BYTE *)(a1 + 128))
        {
          if (v3)
          {
            v7 = *(void **)(a1 + 48);
            v8 = *(_QWORD *)(a1 + 72);
            v58[0] = *(_QWORD *)(a1 + 40);
            v58[1] = CFSTR("likedStateChangedDate");
            v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
            v59[0] = v8;
            v59[1] = v9;
            v10 = (void *)MEMORY[0x1E0C99D80];
            v11 = v59;
            v12 = v58;
            goto LABEL_29;
          }
          if (v5)
          {
            v35 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
            v34 = *(void **)(a1 + 48);
            v36 = *(_QWORD *)(a1 + 120);
            v37 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
            if (v35 == 2)
            {
              objc_msgSend(v34, "favoriteEntityWithPersistentID:storeID:entityType:time:completionHandler:", *(_QWORD *)(a1 + 120), v5, 0, v37, 0);
              goto LABEL_40;
            }
            goto LABEL_46;
          }
          _MPLogCategoryLibrary();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v44 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
            v45 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
            v46 = *(_QWORD *)(a1 + 120);
            *(_DWORD *)buf = 67109632;
            *(_DWORD *)v49 = v44;
            *(_WORD *)&v49[4] = 2048;
            *(_QWORD *)&v49[6] = v45;
            *(_WORD *)&v49[14] = 2048;
            *(_QWORD *)&v49[16] = v46;
            v18 = "Not propagating favorite state change for track (likedState=%d, timeStamp=%p) with persistentID=%lld a"
                  "s it's missing store identifiers";
            goto LABEL_17;
          }
LABEL_18:

          goto LABEL_40;
        }
        if (v5 | v3)
        {
          v34 = *(void **)(a1 + 48);
          v35 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
          v36 = *(_QWORD *)(a1 + 120);
          v37 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
LABEL_46:
          objc_msgSend(v34, "setLikedState:forEntityWithStoreID:persistentID:timeStamp:completion:", v35, v5, v36, v37, 0);
          goto LABEL_40;
        }
        _MPLogCategoryLibrary();
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          goto LABEL_18;
        v41 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
        v42 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
        v43 = *(_QWORD *)(a1 + 120);
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v49 = v41;
        *(_WORD *)&v49[4] = 2114;
        *(_QWORD *)&v49[6] = v42;
        *(_WORD *)&v49[14] = 2048;
        *(_QWORD *)&v49[16] = v43;
        v18 = "Not propagating favorite state change for track (likedState=%d, timeStamp=%{public}@) with persistentID=%l"
              "ld as cloudLibrary is not enabled and it's missing store identifiers";
      }
      else
      {
        v14 = os_log_create("com.apple.amp.mediaplayer", "Library");
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          goto LABEL_18;
        v15 = *(_QWORD *)(a1 + 120);
        v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
        v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
        *(_DWORD *)buf = 134218498;
        *(_QWORD *)v49 = v15;
        *(_WORD *)&v49[8] = 1024;
        *(_DWORD *)&v49[10] = v16;
        *(_WORD *)&v49[14] = 2114;
        *(_QWORD *)&v49[16] = v17;
        v18 = "Not propagating favorite state change for trackPID=%lld as the request is not valid (likedState=%d, timeStamp=%{public}@";
      }
LABEL_17:
      _os_log_impl(&dword_193B9B000, v14, OS_LOG_TYPE_ERROR, v18, buf, 0x1Cu);
      goto LABEL_18;
    }
    if (*(_BYTE *)(a1 + 128))
    {
      objc_msgSend(*(id *)(a1 + 64), "valueForProperty:", *MEMORY[0x1E0D51148]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v13, "unsignedLongLongValue");

    }
    else
    {
      v3 = 0;
    }
    objc_msgSend(*(id *)(a1 + 64), "valueForProperty:", *MEMORY[0x1E0D51100]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "unsignedLongLongValue");

    if (v20)
    {
      if (!v3)
        goto LABEL_30;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 64), "valueForProperty:", *MEMORY[0x1E0D51150]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v21, "unsignedLongLongValue");

      if (!v3)
        goto LABEL_30;
    }
    v22 = *(_QWORD *)(a1 + 72);
    if (v22)
    {
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24))
      {
        v7 = *(void **)(a1 + 48);
        v54 = *(_QWORD *)(a1 + 40);
        v55 = v22;
        v10 = (void *)MEMORY[0x1E0C99D80];
        v11 = &v55;
        v12 = &v54;
        v27 = 1;
        goto LABEL_38;
      }
      v23 = os_log_create("com.apple.amp.mediaplayer", "Library");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "timeIntervalSince1970");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v49 = (uint64_t)v24;
        _os_log_impl(&dword_193B9B000, v23, OS_LOG_TYPE_DEFAULT, "setting time stamp for content taste change=%lld", buf, 0xCu);
      }

      v7 = *(void **)(a1 + 48);
      v25 = *(_QWORD *)(a1 + 72);
      v56[0] = *(_QWORD *)(a1 + 40);
      v56[1] = CFSTR("likedStateChangedDate");
      v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
      v57[0] = v25;
      v57[1] = v26;
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = v57;
      v12 = v56;
LABEL_29:
      v27 = 2;
LABEL_38:
      objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, v27);
      v30 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setItemProperties:forSagaID:", v30, v3);
LABEL_39:

      goto LABEL_40;
    }
LABEL_30:
    if (v20 && objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("likedState")))
    {
      objc_msgSend(*(id *)(a1 + 64), "valueForProperty:", *MEMORY[0x1E0D50F30]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = MPMediaTypeForMLMediaType(objc_msgSend(v28, "unsignedIntegerValue"));

      objc_msgSend(*(id *)(a1 + 48), "setLikedState:forEntityWithStoreID:withMediaType:timeStamp:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24), v20, v29, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
      goto LABEL_40;
    }
    v30 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = *(_QWORD *)(a1 + 120);
      v33 = *(_QWORD *)(a1 + 72);
      v32 = *(_QWORD *)(a1 + 80);
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)v49 = v32;
      *(_WORD *)&v49[8] = 2048;
      *(_QWORD *)&v49[10] = v31;
      *(_WORD *)&v49[18] = 2048;
      *(_QWORD *)&v49[20] = v3;
      v50 = 2048;
      v51 = v20;
      v52 = 2048;
      v53 = v33;
      _os_log_impl(&dword_193B9B000, v30, OS_LOG_TYPE_DEFAULT, "Not propagating change for property %{public}@, trackPID=%lld, sagaID=%lld, storeID=%lld, id=%p", buf, 0x34u);
    }
    goto LABEL_39;
  }
LABEL_40:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24))
  {
    v38 = *(_QWORD *)(a1 + 88);
    v39 = *(void **)(v38 + 88);
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __91__MPMediaLibraryDataProviderML3_setValue_forProperty_ofItemWithIdentifier_completionBlock___block_invoke_118;
    v47[3] = &unk_1E3157BF8;
    v40 = *(_QWORD *)(a1 + 104);
    v47[4] = v38;
    v47[5] = v40;
    objc_msgSend(v39, "databaseConnectionAllowingWrites:withBlock:", 1, v47);
  }
}

void __91__MPMediaLibraryDataProviderML3_setValue_forProperty_ofItemWithIdentifier_completionBlock___block_invoke_118(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D51230], "currentDeviceFavoritesPlaylistInLibrary:usingConnection:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setValue:forProperty:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *MEMORY[0x1E0D50950]);
    v3 = v4;
  }

}

void __65__MPMediaLibraryDataProviderML3_performReadTransactionWithBlock___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__MPMediaLibraryDataProviderML3_performReadTransactionWithBlock___block_invoke_2;
  v3[3] = &unk_1E3157BA8;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "performTransactionWithBlock:", v3);

}

uint64_t __65__MPMediaLibraryDataProviderML3_performReadTransactionWithBlock___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 1;
}

uint64_t __61__MPMediaLibraryDataProviderML3_performTransactionWithBlock___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void __111__MPMediaLibraryDataProviderML3_enumerateCollectionIdentifiersForQueryCriteria_ordered_cancelBlock_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;

  v5 = (void *)MEMORY[0x19403A624]();
  if (*(_QWORD *)(a1 + 48))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", *(_QWORD *)(a1 + 48));
    if (*(_QWORD *)(a1 + 48))
    {
      v7 = 0;
      do
      {
        objc_msgSend(*(id *)(a1 + 32), "adjustedValueForMPProperty:ofEntity:withDefaultValue:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v7), 0, *(_QWORD *)(a3 + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setValue:forKey:", v8, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v7));

        ++v7;
      }
      while (v7 < *(_QWORD *)(a1 + 48));
    }
  }
  else
  {
    v6 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  objc_autoreleasePoolPop(v5);
}

void __96__MPMediaLibraryDataProviderML3__addGlobalPlaylistsToLibraryDatabase_asLibraryOwned_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  id v40;
  void *v41;
  uint64_t v42;
  __int128 v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  const __CFString *v54;
  uint64_t v55;
  const __CFString *v56;
  uint8_t buf[4];
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  v44 = v5;
  if (v5 && !v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v42 = a1;
    v9 = *(id *)(a1 + 32);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v50 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(v44, "itemForIdentifier:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = os_log_create("com.apple.amp.mediaplayer", "Library");
          v17 = v16;
          if (v15)
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v58 = v14;
              _os_log_impl(&dword_193B9B000, v17, OS_LOG_TYPE_DEFAULT, "Found playlist data for %{public}@", buf, 0xCu);
            }

            objc_msgSend(v8, "addObject:", v15);
            if (*(_BYTE *)(a1 + 64))
              objc_msgSend(v41, "addObject:", v15);
          }
          else
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v58 = v14;
              _os_log_impl(&dword_193B9B000, v17, OS_LOG_TYPE_ERROR, "Did not find playlist data for %{public}@", buf, 0xCu);
            }

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
      }
      while (v11);
    }

    v18 = v8;
    if (objc_msgSend(v8, "count"))
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D512B8]), "initWithLookupItems:", v8);
      if (*(_BYTE *)(a1 + 64))
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D512C0]), "initWithLookupItems:", v41);
      else
        v20 = 0;
      objc_msgSend(*(id *)(v42 + 40), "library");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "databasePath");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = objc_alloc(MEMORY[0x1E0D51278]);
      objc_msgSend(v20, "trackData");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "playlistsData");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(v33, "initWithLibraryPath:trackData:playlistData:", v31, v34, v35);

      objc_msgSend(v36, "setTracksAreLibraryOwnedContent:", 0);
      objc_msgSend(v36, "setPlaylistsAreLibraryOwnedContent:", *(unsigned __int8 *)(v42 + 64));
      objc_msgSend(v36, "setPendingMatch:", 0);
      objc_msgSend(MEMORY[0x1E0D512D8], "sharedMediaLibraryService");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __96__MPMediaLibraryDataProviderML3__addGlobalPlaylistsToLibraryDatabase_asLibraryOwned_completion___block_invoke_102;
      v45[3] = &unk_1E3157AE0;
      v38 = *(id *)(v42 + 32);
      v39 = *(_QWORD *)(v42 + 40);
      v46 = v38;
      v47 = v39;
      v43 = *(_OWORD *)(v42 + 48);
      v40 = (id)v43;
      v48 = v43;
      objc_msgSend(v37, "performImport:fromSource:withProgressBlock:completionHandler:", v36, 6, 0, v45);

      v7 = 0;
    }
    else
    {
      v27 = *(_QWORD *)(a1 + 48);
      v7 = 0;
      if (!v27)
      {
LABEL_33:

        goto LABEL_34;
      }
      v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = *MEMORY[0x1E0CB2D50];
      v56 = CFSTR("items not found");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", v19, -1, v20);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v27 + 16))(v27, v28, v31);
    }

    goto LABEL_33;
  }
  if (v6)
  {
    v21 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v58 = v7;
      _os_log_impl(&dword_193B9B000, v21, OS_LOG_TYPE_ERROR, "Error fetching playlist data. %{public}@", buf, 0xCu);
    }

    v18 = v7;
  }
  else
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = *MEMORY[0x1E0CB2D50];
    v54 = CFSTR("item not found");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", v24, -1, v25);
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  v26 = *(_QWORD *)(a1 + 48);
  if (v26)
    (*(void (**)(uint64_t, _QWORD, id))(v26 + 16))(v26, 0, v18);
LABEL_34:

}

void __96__MPMediaLibraryDataProviderML3__addGlobalPlaylistsToLibraryDatabase_asLibraryOwned_completion___block_invoke_102(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a2)
  {
    if (v8)
    {
      MSVPropertyListDataClasses();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      MSVUnarchivedObjectOfClasses();
      v11 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
    v30 = v9;
    v31 = v7;
    v13 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v11;
      _os_log_impl(&dword_193B9B000, v13, OS_LOG_TYPE_DEFAULT, "Successfully imported playlist data. Imported tracks: %@", buf, 0xCu);
    }
    v29 = v11;

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = *(id *)(a1 + 32);
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v34;
      v17 = *MEMORY[0x1E0D508D8];
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v34 != v16)
            objc_enumerationMutation(obj);
          v19 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          v20 = (void *)MEMORY[0x1E0D51230];
          objc_msgSend(*(id *)(a1 + 40), "library");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:equalToValue:", v17, v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "queryWithLibrary:predicate:options:", v21, v22, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = objc_msgSend(v23, "anyEntityPersistentID");
          v25 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKey:", v26, v19);

          v27 = os_log_create("com.apple.amp.mediaplayer", "Library");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v38 = v24;
            v39 = 2114;
            v40 = v19;
            _os_log_impl(&dword_193B9B000, v27, OS_LOG_TYPE_DEFAULT, "found container_pid:%lld for global playlistid:%{public}@", buf, 0x16u);
          }

        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v15);
    }

    v9 = v30;
    v7 = v31;
    v12 = v29;
  }
  else
  {
    v12 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_ERROR, "Error importing playlist data.", buf, 2u);
    }
  }

  v28 = *(_QWORD *)(a1 + 48);
  if (v28)
    (*(void (**)(uint64_t, _QWORD, id))(v28 + 16))(v28, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v7);

}

uint64_t __88__MPMediaLibraryDataProviderML3_addToLocalDeviceLibraryGlobalPlaylistWithID_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __89__MPMediaLibraryDataProviderML3_addGlobalPlaylistWithID_andAddToCloudLibrary_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __89__MPMediaLibraryDataProviderML3_addGlobalPlaylistWithID_andAddToCloudLibrary_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "userIdentity");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __89__MPMediaLibraryDataProviderML3_addGlobalPlaylistWithID_andAddToCloudLibrary_completion___block_invoke_3;
    v5[3] = &unk_1E3161F98;
    v4 = *(_QWORD *)(a1 + 40);
    v6 = *(id *)(a1 + 48);
    objc_msgSend(v3, "addStorePlaylistWithGlobalID:completionHandler:", v4, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __89__MPMediaLibraryDataProviderML3_addGlobalPlaylistWithID_andAddToCloudLibrary_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "Library");
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v11 = 138543362;
      v12 = v4;
      v7 = "Failed to add global playlist to cloud library. %{public}@";
      v8 = v6;
      v9 = OS_LOG_TYPE_ERROR;
      v10 = 12;
LABEL_6:
      _os_log_impl(&dword_193B9B000, v8, v9, v7, (uint8_t *)&v11, v10);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    v7 = "Successfully added playlist to cloud library.";
    v8 = v6;
    v9 = OS_LOG_TYPE_DEFAULT;
    v10 = 2;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v4);
}

void __102__MPMediaLibraryDataProviderML3_removeArtworkForEntityPersistentID_entityType_artworkType_sourceType___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = a1[5];
  v4 = *(void **)(a1[4] + 88);
  v5 = a1[6];
  v6 = a1[7];
  v7 = a1[8];
  v8 = a2;
  objc_msgSend(v4, "removeArtworkTokenForEntityPersistentID:entityType:artworkType:sourceType:usingConnection:", v3, v5, v6, v7, v8);
  objc_msgSend(*(id *)(a1[4] + 88), "updateBestArtworkTokenForEntityPersistentID:entityType:artworkType:retrievalTime:preserveExistingAvailableToken:usingConnection:", a1[5], a1[6], a1[7], 0, v8, 0.0);

}

void __99__MPMediaLibraryDataProviderML3__importStoreAlbumArtistElements_withReferralObject_withCompletion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (a2)
  {
    v9 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEFAULT, "Successfully imported artist data.", (uint8_t *)&v14, 2u);
    }

  }
  if (v8)
  {
    MSVPropertyListDataClasses();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    MSVUnarchivedObjectOfClasses();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }
  v12 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543362;
    v15 = v11;
    _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_DEFAULT, "Importing album artists pids=%{public}@", (uint8_t *)&v14, 0xCu);
  }

  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
    (*(void (**)(uint64_t, void *, id))(v13 + 16))(v13, v11, v7);

}

void __165__MPMediaLibraryDataProviderML3__importStoreItemElements_withReferralObject_addTracksToDeviceLibraryOnly_andAddTracksToCloudLibrary_usingCloudAdamID_withCompletion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = os_log_create("com.apple.amp.mediaplayer", "Library");
  v10 = v9;
  if (a2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_DEFAULT, "Successfully imported track data.", buf, 2u);
    }

    if (v8)
    {
      MSVPropertyListDataClasses();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      MSVUnarchivedObjectOfClasses();
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = (void *)MEMORY[0x1E0C9AA60];
    }
    if (*(_BYTE *)(a1 + 64))
    {
      v14 = os_log_create("com.apple.amp.mediaplayer", "Library");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 134217984;
        v25 = v15;
        _os_log_impl(&dword_193B9B000, v14, OS_LOG_TYPE_DEFAULT, "Adding %lld to cloud library...", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "userIdentity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __165__MPMediaLibraryDataProviderML3__importStoreItemElements_withReferralObject_addTracksToDeviceLibraryOnly_andAddTracksToCloudLibrary_usingCloudAdamID_withCompletion___block_invoke_96;
      v21[3] = &unk_1E31579C8;
      v18 = *(_QWORD *)(a1 + 40);
      v19 = *(_QWORD *)(a1 + 56);
      v23 = *(id *)(a1 + 48);
      v22 = v12;
      objc_msgSend(v17, "addStoreItemWithAdamID:referralObject:completionHandler:", v19, v18, v21);

    }
    else
    {
      v20 = *(_QWORD *)(a1 + 48);
      if (v20)
        (*(void (**)(uint64_t, void *, _QWORD))(v20 + 16))(v20, v12, 0);
    }

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v7;
      _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_ERROR, "Failed to import track data. %{public}@", buf, 0xCu);
    }

    v13 = *(_QWORD *)(a1 + 48);
    if (v13)
      (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v7);
  }

}

void __165__MPMediaLibraryDataProviderML3__importStoreItemElements_withReferralObject_addTracksToDeviceLibraryOnly_andAddTracksToCloudLibrary_usingCloudAdamID_withCompletion___block_invoke_96(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void (*v10)(void);
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.mediaplayer", "Library");
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v12 = 138543362;
      v13 = v6;
      _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_ERROR, "Error adding track(s) to cloud library. %{public}@", (uint8_t *)&v12, 0xCu);
    }

    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
    {
      v10 = *(void (**)(void))(v9 + 16);
LABEL_10:
      v10();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEFAULT, "Successfully added track(s) to cloud library.", (uint8_t *)&v12, 2u);
    }

    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
    {
      v10 = *(void (**)(void))(v11 + 16);
      goto LABEL_10;
    }
  }

}

void __84__MPMediaLibraryDataProviderML3_addPlaylistStoreItemsForLookupItems_withCompletion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = os_log_create("com.apple.amp.mediaplayer", "Library");
  v10 = v9;
  if (a2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_DEFAULT, "Successfully imported track data.", (uint8_t *)&v15, 2u);
    }

    MSVPropertyListDataClasses();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    MSVUnarchivedObjectOfClasses();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = *(_QWORD *)(a1 + 32);
    if (v13)
      (*(void (**)(uint64_t, void *, _QWORD))(v13 + 16))(v13, v12, 0);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v15 = 138543362;
      v16 = v7;
      _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_ERROR, "Failed to import track data. %{public}@", (uint8_t *)&v15, 0xCu);
    }

    v14 = *(_QWORD *)(a1 + 32);
    if (v14)
      (*(void (**)(uint64_t, _QWORD, id))(v14 + 16))(v14, 0, v7);
  }

}

void __85__MPMediaLibraryDataProviderML3_performStoreAlbumArtistLibraryImport_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MPStoreItemLibraryImportLookupElement *v18;
  void *v19;
  MPStoreItemLibraryImportLookupElement *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v31 = v6;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_ERROR, "Error fetching store content for item add. %{public}@", buf, 0xCu);
    }

    v8 = *(_QWORD *)(a1 + 64);
    if (v8)
      (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v6);
  }
  else
  {
    objc_msgSend(v5, "allItems");
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v14 = *(void **)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v13, "storeAdamID"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "additionalTrackMetadata");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = [MPStoreItemLibraryImportLookupElement alloc];
          objc_msgSend(v13, "metadataDictionary");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[MPStoreItemLibraryImportLookupElement initWithLookupDictionary:additionalTrackMetadata:](v18, "initWithLookupDictionary:additionalTrackMetadata:", v19, v17);

          objc_msgSend(*(id *)(a1 + 40), "addObject:", v20);
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v10);
    }
    v22 = *(_QWORD *)(a1 + 40);
    v21 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "referralObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_importStoreAlbumArtistElements:withReferralObject:withCompletion:", v22, v23, *(_QWORD *)(a1 + 64));

    v6 = 0;
  }

}

void __78__MPMediaLibraryDataProviderML3_performStoreItemLibraryImport_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MPStoreItemLibraryImportLookupElement *v18;
  void *v19;
  MPStoreItemLibraryImportLookupElement *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v31 = v6;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_ERROR, "Error fetching store content for item add. %{public}@", buf, 0xCu);
    }

    v8 = *(_QWORD *)(a1 + 64);
    if (v8)
      (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v6);
  }
  else
  {
    objc_msgSend(v5, "allItems");
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v14 = *(void **)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v13, "storeAdamID"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "additionalTrackMetadata");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = [MPStoreItemLibraryImportLookupElement alloc];
          objc_msgSend(v13, "metadataDictionary");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[MPStoreItemLibraryImportLookupElement initWithLookupDictionary:additionalTrackMetadata:](v18, "initWithLookupDictionary:additionalTrackMetadata:", v19, v17);

          objc_msgSend(*(id *)(a1 + 40), "addObject:", v20);
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v10);
    }
    v22 = *(_QWORD *)(a1 + 40);
    v21 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "referralObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_importStoreItemElements:withReferralObject:addTracksToDeviceLibraryOnly:andAddTracksToCloudLibrary:usingCloudAdamID:withCompletion:", v22, v23, objc_msgSend(*(id *)(a1 + 56), "addToDeviceLibraryOnly"), objc_msgSend(*(id *)(a1 + 56), "addToCloudLibrary"), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));

    v6 = 0;
  }

}

void __61__MPMediaLibraryDataProviderML3__storePlatformRequestContext__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  int v11;
  __CFString *v12;
  __CFString *v13;
  id v14;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "userIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdentity:", v4);

  objc_msgSend(MEMORY[0x1E0DDBEF8], "defaultInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isWatch");
  v8 = CFSTR("Music");
  if (v7)
    v8 = CFSTR("NanoMusic");
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isWatch");
  v12 = CFSTR("3.1");
  if (v11)
    v12 = CFSTR("2");
  v13 = v12;

  objc_msgSend(v14, "setClientIdentifier:", v9);
  objc_msgSend(v14, "setClientVersion:", v13);

  objc_msgSend(v3, "setClientInfo:", v14);
}

void __72__MPMediaLibraryDataProviderML3_sdk_addItemWithOpaqueID_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  id v29;
  id obj;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    if (v6)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v6);
    }
    else
    {
      v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v29 = v5;
      objc_msgSend(v5, "allValues");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(*(id *)(a1 + 32), "mediaLibrary");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      obj = v8;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v38 != v12)
              objc_enumerationMutation(obj);
            +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i), CFSTR("storeSagaID"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            +[MPMediaQuery songsQuery](MPMediaQuery, "songsQuery");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setMediaLibrary:", v31);
            objc_msgSend(v15, "addFilterPredicate:", v14);
            objc_msgSend(v15, "items");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObjectsFromArray:", v16);
            objc_msgSend(v32, "addObjectsFromArray:", v16);

          }
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        }
        while (v11);
      }

      v17 = v9;
      if (!objc_msgSend(v9, "count") && objc_msgSend(obj, "count"))
      {
        objc_msgSend(obj, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v18, CFSTR("storeCloudID"));
        v19 = objc_claimAutoreleasedReturnValue();
        +[MPMediaQuery playlistsQuery](MPMediaQuery, "playlistsQuery");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setMediaLibrary:", v31);
        v28 = (void *)v19;
        objc_msgSend(v20, "addFilterPredicate:", v19);
        objc_msgSend(v20, "collections");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObjectsFromArray:", v21);
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v22 = v21;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v34;
          do
          {
            for (j = 0; j != v24; ++j)
            {
              if (*(_QWORD *)v34 != v25)
                objc_enumerationMutation(v22);
              objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "items");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "addObjectsFromArray:", v27);

            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          }
          while (v24);
        }

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      MPFetchArtworkForAddedMediaItems(v32);

      v6 = 0;
      v5 = v29;
    }
  }

}

uint64_t __54__MPMediaLibraryDataProviderML3_addTracksToMyLibrary___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D512C8];
  v9 = *MEMORY[0x1E0D50E80];
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a2;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "setValues:forProperties:forEntityPersistentIDs:inLibrary:usingConnection:", &unk_1E31E5950, v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88), v5, v9, v10);

  return v7;
}

uint64_t __97__MPMediaLibraryDataProviderML3_collectionExistsContainedWithinSyncIDs_groupingType_existentPID___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a2;
  *a4 = 1;
  return result;
}

uint64_t __102__MPMediaLibraryDataProviderML3_collectionExistsWithCloudUniversalLibraryID_groupingType_existentPID___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a2;
  *a4 = 1;
  return result;
}

uint64_t __93__MPMediaLibraryDataProviderML3_collectionExistsWithCloudLibraryID_groupingType_existentPID___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a2;
  *a4 = 1;
  return result;
}

uint64_t __85__MPMediaLibraryDataProviderML3_collectionExistsWithSagaID_groupingType_existentPID___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a2;
  *a4 = 1;
  return result;
}

uint64_t __86__MPMediaLibraryDataProviderML3_collectionExistsWithStoreID_groupingType_existentPID___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a2;
  *a4 = 1;
  return result;
}

uint64_t __83__MPMediaLibraryDataProviderML3_collectionExistsWithName_groupingType_existentPID___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a2;
  *a4 = 1;
  return result;
}

uint64_t __109__MPMediaLibraryDataProviderML3_collectionExistsContainedWithinPersistentIDs_count_groupingType_existentPID___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a2;
  *a4 = 1;
  return result;
}

uint64_t __48__MPMediaLibraryDataProviderML3_hasMediaOfType___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  __int128 v3;
  uint64_t v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__MPMediaLibraryDataProviderML3_hasMediaOfType___block_invoke_2;
  v2[3] = &unk_1E3157950;
  v4 = *(_QWORD *)(a1 + 48);
  v3 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(*(id *)(v3 + 88), "databaseConnectionAllowingWrites:withBlock:", 0, v2);
}

void __48__MPMediaLibraryDataProviderML3_hasMediaOfType___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  MPMediaQuery *v4;
  MPMediaQuery *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MPMediaQuery *v10;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "mediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [MPMediaQuery alloc];
  v5 = v4;
  if (v2 == -1)
  {
    v10 = -[MPMediaQuery initWithFilterPredicates:library:](v4, "initWithFilterPredicates:library:", 0, v3);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v7, CFSTR("mediaType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MPMediaQuery initWithFilterPredicates:library:](v5, "initWithFilterPredicates:library:", v9, v3);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -[MPMediaQuery _hasItems](v10, "_hasItems");

}

void __51__MPMediaLibraryDataProviderML3_playlistGeneration__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "executeQuery:", CFSTR("SELECT revision FROM entity_revision WHERE class = 1 ORDER BY revision DESC LIMIT 1;"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "int64ValueForFirstRowAndColumn");

}

void __49__MPMediaLibraryDataProviderML3_lastModifiedDate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "_databaseFilePaths");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (NSArray)onDiskProviders
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  MPMediaLibraryDataProviderML3 *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(MEMORY[0x1E0D51270], "allLibraries", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = -[MPMediaLibraryDataProviderML3 initWithLibrary:]([MPMediaLibraryDataProviderML3 alloc], "initWithLibrary:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7));
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v9 = (void *)objc_msgSend(v2, "copy");
  return (NSArray *)v9;
}

+ (id)_unadjustedValueForItemPropertyVolumeNormalizationWithDefaultValue:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "floatValue");
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSUInteger MPITScaledVolumeNormalization(float)");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("MPMediaLibraryDataProviderML3.m"), 3439, CFSTR("MPITScaledVolumeNormalization is Unimplemented"));

  return (id)objc_msgSend(v3, "numberWithUnsignedInteger:", 0);
}

+ (id)_unadjustedValueForItemPropertyVolumeAdjustmentWithDefaultValue:(id)a3
{
  void *v3;
  float v4;
  uint64_t v5;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "floatValue");
  if ((unint64_t)(float)((float)((float)(v4 * 2000.0) * 0.5) + 1.8447e19) < 0xFFFFFFFFFFFFFC18)
    v5 = -1000;
  else
    v5 = 1000;
  return (id)objc_msgSend(v3, "numberWithUnsignedInteger:", v5);
}

+ (id)_unadjustedValueForItemPropertyRatingWithDefaultValue:(id)a3
{
  void *v3;
  float v4;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "floatValue");
  return (id)objc_msgSend(v3, "numberWithDouble:", v4 * 20.0);
}

+ (id)_unadjustedValueForItemTimeWithDefaultValue:(id)a3
{
  void *v3;
  double v4;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "doubleValue");
  return (id)objc_msgSend(v3, "numberWithDouble:", v4 * 1000.0);
}

+ (id)_unadjustedValueForItemDateWithDefaultValue:(id)a3
{
  void *v3;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  return (id)objc_msgSend(v3, "numberWithDouble:");
}

+ (id)_unadjustedValueForMPProperty:(id)a3 withDefaultValue:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  id v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (_unadjustedValueForMPProperty_withDefaultValue__onceToken != -1)
    dispatch_once(&_unadjustedValueForMPProperty_withDefaultValue__onceToken, &__block_literal_global_245);
  v8 = (const char *)NSMapGet((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, v6);
  if (v8)
  {
    objc_msgSend(a1, v8, v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v7;
  }
  v10 = v9;

  return v10;
}

void __80__MPMediaLibraryDataProviderML3__unadjustedValueForMPProperty_withDefaultValue___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 258, 13);
  v1 = (void *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap;
  _unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap = v0;

  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, CFSTR("bookmarkTime"), sel__unadjustedValueForItemTimeWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, CFSTR("dateAccessed"), sel__unadjustedValueForItemDateWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, CFSTR("dateAdded"), sel__unadjustedValueForItemDateWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, CFSTR("lastPlayedDate"), sel__unadjustedValueForItemDateWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, CFSTR("lastSkippedDate"), sel__unadjustedValueForItemDateWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, CFSTR("playbackDuration"), sel__unadjustedValueForItemTimeWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, CFSTR("rating"), sel__unadjustedValueForItemPropertyRatingWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, CFSTR("releaseDate"), sel__unadjustedValueForItemDateWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, CFSTR("startTime"), sel__unadjustedValueForItemTimeWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, CFSTR("stopTime"), sel__unadjustedValueForItemTimeWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, CFSTR("storeDatePurchased"), sel__unadjustedValueForItemDateWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, CFSTR("volumeAdjustment"), sel__unadjustedValueForItemPropertyVolumeAdjustmentWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, CFSTR("volumeNormalization"), sel__unadjustedValueForItemPropertyVolumeNormalizationWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, CFSTR("dateCreated"), sel__unadjustedValueForItemDateWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, CFSTR("dateModified"), sel__unadjustedValueForItemDateWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, CFSTR("datePlayed"), sel__unadjustedValueForItemDateWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, CFSTR("datePlayedLocal"), sel__unadjustedValueForItemDateWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, CFSTR("dateDownloaded"), sel__unadjustedValueForItemDateWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, CFSTR("albumDatePlayedLocal"), sel__unadjustedValueForItemDateWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, CFSTR("likedStateChangedDate"), sel__unadjustedValueForItemDateWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, CFSTR("likedStateChangedDate"), sel__unadjustedValueForItemDateWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, CFSTR("albumArtistDateFavorited"), sel__unadjustedValueForItemDateWithDefaultValue_);
}

@end
