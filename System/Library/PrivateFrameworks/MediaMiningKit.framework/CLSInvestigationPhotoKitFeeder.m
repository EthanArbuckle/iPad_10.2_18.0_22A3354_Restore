@implementation CLSInvestigationPhotoKitFeeder

- (CLSInvestigationPhotoKitFeeder)initWithAssetCollection:(id)a3 assetFetchOptions:(id)a4 feederPrefetchOptions:(id)a5 curationContext:(id)a6
{
  void *v6;
  id v12;
  id v13;
  id v14;
  id v15;
  CLSInvestigationPhotoKitFeeder *v16;
  void *v17;
  void *v18;
  id *p_assetFetchOptions;
  void *v20;
  void *v21;
  CLSFeederPrefetchOptions *v22;
  CLSFeederPrefetchOptions *v23;
  uint64_t v24;
  _BOOL4 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t assetPrefetchOptions;
  uint64_t v29;
  PHFetchResult *fetchResult;
  uint64_t v31;
  NSSet *shareParticipants;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  objc_super v41;
  _QWORD v42[3];
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v41.receiver = self;
  v41.super_class = (Class)CLSInvestigationPhotoKitFeeder;
  v16 = -[CLSInvestigationFeeder init](&v41, sel_init);
  if (!v16)
    goto LABEL_25;
  v40 = v15;
  v17 = (void *)objc_msgSend(v13, "copy");
  v18 = v17;
  if (!v17)
  {
    objc_msgSend(v12, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "librarySpecificFetchOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  p_assetFetchOptions = (id *)&v16->_assetFetchOptions;
  objc_storeStrong((id *)&v16->_assetFetchOptions, v18);
  if (!v17)
  {

  }
  objc_msgSend(*p_assetFetchOptions, "setChunkSizeForFetch:", 10000);
  objc_msgSend(*p_assetFetchOptions, "setIncludeGuestAssets:", 1);
  objc_storeStrong((id *)&v16->_assetCollection, a3);
  v16->_numberOfAllPeople = -1;
  objc_msgSend(*p_assetFetchOptions, "sortDescriptors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    goto LABEL_7;
  objc_msgSend(*p_assetFetchOptions, "internalSortDescriptors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v20;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_assetFetchOptions, "setSortDescriptors:", v39);

LABEL_7:
  }
  if (v14)
    v22 = (CLSFeederPrefetchOptions *)v14;
  else
    v22 = objc_alloc_init(CLSFeederPrefetchOptions);
  v23 = v22;
  v16->_assetPrefetchOptions = 0;
  v16->_assetPrefetchOptions |= -[CLSFeederPrefetchOptions personCountPrefetchMode](v22, "personCountPrefetchMode") == 2;
  v16->_assetPrefetchOptions |= 2 * (-[CLSFeederPrefetchOptions personsPrefetchMode](v23, "personsPrefetchMode") == 2);
  v16->_assetPrefetchOptions |= 4 * (-[CLSFeederPrefetchOptions scenesPrefetchMode](v23, "scenesPrefetchMode") == 2);
  v16->_assetPrefetchOptions |= 8
                              * (-[CLSFeederPrefetchOptions faceInformationPrefetchMode](v23, "faceInformationPrefetchMode") == 2);
  if (-[CLSFeederPrefetchOptions locationPrefetchMode](v23, "locationPrefetchMode") == 2)
    v24 = 16;
  else
    v24 = 16 * (-[CLSFeederPrefetchOptions locationPrefetchMode](v23, "locationPrefetchMode") == 1);
  v16->_assetPrefetchOptions |= v24;
  if (-[CLSFeederPrefetchOptions personsPrefetchMode](v23, "personsPrefetchMode") == 1
    || -[CLSFeederPrefetchOptions scenesPrefetchMode](v23, "scenesPrefetchMode") == 1
    || -[CLSFeederPrefetchOptions faceInformationPrefetchMode](v23, "faceInformationPrefetchMode") == 1)
  {
    v25 = -[CLSInvestigationPhotoKitFeeder _shouldPrefetchCurationInformation](v16, "_shouldPrefetchCurationInformation");
    v26 = -[CLSFeederPrefetchOptions personCountPrefetchMode](v23, "personCountPrefetchMode");
    if (v25)
    {
      v16->_assetPrefetchOptions |= v26 == 1;
      v16->_assetPrefetchOptions |= 2
                                  * (-[CLSFeederPrefetchOptions personsPrefetchMode](v23, "personsPrefetchMode") == 1);
      v16->_assetPrefetchOptions |= 4
                                  * (-[CLSFeederPrefetchOptions scenesPrefetchMode](v23, "scenesPrefetchMode") == 1);
      v27 = 8 * (-[CLSFeederPrefetchOptions faceInformationPrefetchMode](v23, "faceInformationPrefetchMode") == 1);
      assetPrefetchOptions = v16->_assetPrefetchOptions;
    }
    else
    {
      if (v26 != 1)
        goto LABEL_23;
      v27 = v16->_assetPrefetchOptions;
      assetPrefetchOptions = 1;
    }
    v16->_assetPrefetchOptions = v27 | assetPrefetchOptions;
  }
LABEL_23:
  if (!v13)
  {
    if (v16->_assetPrefetchOptions)
    {
      v34 = *MEMORY[0x1E0CD19F0];
      v42[0] = *MEMORY[0x1E0CD1A50];
      v42[1] = v34;
      v42[2] = *MEMORY[0x1E0CD19A0];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 3);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*p_assetFetchOptions, "setFetchPropertySets:", v35);

      if ((v16->_assetPrefetchOptions & 8) != 0)
      {
        objc_msgSend(*p_assetFetchOptions, "fetchPropertySets");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "arrayByAddingObject:", *MEMORY[0x1E0CD1998]);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*p_assetFetchOptions, "setFetchPropertySets:", v37);

      }
    }
  }
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v16->_assetCollection, *p_assetFetchOptions);
  v29 = objc_claimAutoreleasedReturnValue();
  fetchResult = v16->_fetchResult;
  v16->_fetchResult = (PHFetchResult *)v29;

  -[CLSInvestigationFeeder setAllowsInterview:](v16, "setAllowsInterview:", 1);
  objc_storeStrong((id *)&v16->_curationContext, a6);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v31 = objc_claimAutoreleasedReturnValue();
  shareParticipants = v16->_shareParticipants;
  v16->_shareParticipants = (NSSet *)v31;

  v15 = v40;
LABEL_25:

  return v16;
}

- (CLSInvestigationPhotoKitFeeder)initWithAssetFetchResult:(id)a3 curationContext:(id)a4
{
  id v7;
  id v8;
  CLSInvestigationPhotoKitFeeder *v9;
  CLSInvestigationPhotoKitFeeder *v10;
  uint64_t v11;
  PHAssetCollection *assetCollection;
  uint64_t v13;
  PHFetchOptions *assetFetchOptions;
  uint64_t v15;
  NSSet *shareParticipants;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CLSInvestigationPhotoKitFeeder;
  v9 = -[CLSInvestigationFeeder init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fetchResult, a3);
    objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:", v7, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    assetCollection = v10->_assetCollection;
    v10->_assetCollection = (PHAssetCollection *)v11;

    objc_msgSend(v7, "fetchOptions");
    v13 = objc_claimAutoreleasedReturnValue();
    assetFetchOptions = v10->_assetFetchOptions;
    v10->_assetFetchOptions = (PHFetchOptions *)v13;

    objc_storeStrong((id *)&v10->_curationContext, a4);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v15 = objc_claimAutoreleasedReturnValue();
    shareParticipants = v10->_shareParticipants;
    v10->_shareParticipants = (NSSet *)v15;

  }
  return v10;
}

- (PHFetchResult)assetFetchResult
{
  return self->_fetchResult;
}

- (BOOL)_shouldPrefetchCurationInformation
{
  CLSInvestigationPhotoKitFeeder *v2;
  void *v3;
  double v4;
  PHFetchResult *v5;
  uint64_t v6;
  CLSInvestigationPhotoKitFeeder *i;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[2];
  _BYTE v23[128];
  uint64_t v24;

  v2 = self;
  v24 = *MEMORY[0x1E0C80C00];
  if (-[PHAssetCollection assetCollectionType](self->_assetCollection, "assetCollectionType") == PHAssetCollectionTypeMoment)
  {
    -[PHFetchResult firstObject](v2->_fetchResult, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "curationScore");
    LOBYTE(v2) = v4 == 0.0;
  }
  else
  {
    -[PHFetchOptions predicate](v2->_assetFetchOptions, "predicate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v5 = v2->_fetchResult;
      v2 = (CLSInvestigationPhotoKitFeeder *)-[PHFetchResult countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v2)
      {
        v6 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v2; i = (CLSInvestigationPhotoKitFeeder *)((char *)i + 1))
          {
            if (*(_QWORD *)v19 != v6)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "curationScore", (_QWORD)v18);
            if (v8 == 0.0)
            {
              LOBYTE(v2) = 1;
              goto LABEL_17;
            }
          }
          v2 = (CLSInvestigationPhotoKitFeeder *)-[PHFetchResult countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
          if (v2)
            continue;
          break;
        }
      }
    }
    else
    {
      -[PHAssetCollection photoLibrary](v2->_assetCollection, "photoLibrary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "librarySpecificFetchOptions");
      v5 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();

      -[PHFetchResult setShouldPrefetchCount:](v5, "setShouldPrefetchCount:", 1);
      -[PHFetchResult setIncludeGuestAssets:](v5, "setIncludeGuestAssets:", 1);
      -[PHFetchResult setFetchLimit:](v5, "setFetchLimit:", 1);
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(curationScore) == 0"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHFetchOptions internalPredicate](v2->_assetFetchOptions, "internalPredicate");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (v11)
      {
        v13 = (void *)MEMORY[0x1E0CB3528];
        v22[0] = v10;
        v22[1] = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "andPredicateWithSubpredicates:", v14);
        v15 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v15;
      }
      -[PHFetchResult setInternalPredicate:](v5, "setInternalPredicate:", v10);
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v2->_assetCollection, v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v2) = objc_msgSend(v16, "count") != 0;

    }
LABEL_17:

  }
  return (char)v2;
}

- (unint64_t)numberOfItems
{
  PHFetchResult *v3;
  unint64_t v4;

  v3 = self->_fetchResult;
  objc_sync_enter(v3);
  v4 = -[PHFetchResult count](self->_fetchResult, "count");
  objc_sync_exit(v3);

  return v4;
}

- (BOOL)hasPeople
{
  PHFetchResult *v3;
  PHFetchResult *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = self->_fetchResult;
  objc_sync_enter(v3);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_fetchResult;
  v5 = -[PHFetchResult countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "clsPeopleCount", (_QWORD)v9))
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = -[PHFetchResult countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v3);
  return v5;
}

- (BOOL)hasFavoritedAssets
{
  PHFetchResult *v3;
  PHFetchResult *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = self->_fetchResult;
  objc_sync_enter(v3);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_fetchResult;
  v5 = -[PHFetchResult countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isFavorite", (_QWORD)v9) & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = -[PHFetchResult countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v3);
  return v5;
}

- (BOOL)hasBestScoringAssets
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint64_t i;
  void *v7;
  double v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[CLSInvestigationPhotoKitFeeder allItems](self, "allItems");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    v5 = *MEMORY[0x1E0D77DD8];
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v7, "clsContentScore", (_QWORD)v10);
        if (v8 >= v5 && !objc_msgSend(v7, "clsIsUtility"))
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return v3;
}

- (BOOL)hasNonJunkAssets
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint64_t i;
  double v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[CLSInvestigationPhotoKitFeeder allItems](self, "allItems");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    v5 = *MEMORY[0x1E0D77DF0];
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "clsContentScore", (_QWORD)v9);
        if (v7 > v5)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)universalStartDate
{
  return -[PHAssetCollection cls_universalStartDate](self->_assetCollection, "cls_universalStartDate");
}

- (id)universalEndDate
{
  return -[PHAssetCollection cls_universalEndDate](self->_assetCollection, "cls_universalEndDate");
}

- (id)localStartDate
{
  return -[PHAssetCollection cls_localStartDate](self->_assetCollection, "cls_localStartDate");
}

- (id)localEndDate
{
  return -[PHAssetCollection cls_localEndDate](self->_assetCollection, "cls_localEndDate");
}

- (unint64_t)numberOfAllPeople
{
  CLSInvestigationPhotoKitFeeder *v2;
  unint64_t result;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  CLSInvestigationPhotoKitFeeder *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v2 = self;
  v36 = *MEMORY[0x1E0C80C00];
  result = self->_numberOfAllPeople;
  if (result == -1)
  {
    v4 = MEMORY[0x1D1796094](-1, a2);
    v5 = (void *)v4;
    if ((v2->_assetPrefetchOptions & 8) != 0)
    {
      v23 = (void *)v4;
      v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      -[CLSCurationContext nonPetFacedPersonLocalIdentifiers](v2->_curationContext, "nonPetFacedPersonLocalIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v24 = v2;
      -[CLSInvestigationPhotoKitFeeder allItems](v2, "allItems");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v31 != v13)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            v26 = 0u;
            v27 = 0u;
            v28 = 0u;
            v29 = 0u;
            objc_msgSend(v15, "clsFaceInformationSummary", v23);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "faceInformationByPersonLocalIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            if (v18)
            {
              v19 = v18;
              v20 = *(_QWORD *)v27;
              do
              {
                for (j = 0; j != v19; ++j)
                {
                  if (*(_QWORD *)v27 != v20)
                    objc_enumerationMutation(v17);
                  v22 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j);
                  if (objc_msgSend(v10, "containsObject:", v22))
                    objc_msgSend(v9, "addObject:", v22);
                }
                v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
              }
              while (v19);
            }

          }
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        }
        while (v12);
      }

      v2 = v24;
      v24->_numberOfAllPeople = objc_msgSend(v9, "count");

      v5 = v23;
    }
    else
    {
      -[PHAssetCollection photoLibrary](v2->_assetCollection, "photoLibrary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "librarySpecificFetchOptions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "setShouldPrefetchCount:", 1);
      objc_msgSend(v7, "setPersonContext:", 1);
      objc_msgSend(v7, "setIncludedDetectionTypes:", &unk_1E85121B8);
      objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsForAssetCollection:options:", v2->_assetCollection, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v2->_numberOfAllPeople = objc_msgSend(v8, "count");

    }
    objc_autoreleasePoolPop(v5);
    return v2->_numberOfAllPeople;
  }
  return result;
}

- (id)localStartDateComponents
{
  return -[PHAssetCollection cls_localStartDateComponents](self->_assetCollection, "cls_localStartDateComponents");
}

- (id)localEndDateComponents
{
  return -[PHAssetCollection cls_localEndDateComponents](self->_assetCollection, "cls_localEndDateComponents");
}

- (id)approximateLocation
{
  PHFetchResult *v3;
  void *v4;

  v3 = self->_fetchResult;
  objc_sync_enter(v3);
  -[PHAssetCollection approximateLocation](self->_assetCollection, "approximateLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  return v4;
}

- (id)allItems
{
  NSArray *v3;
  NSArray *allItems;
  PHFetchResult *v5;
  unint64_t assetPrefetchOptions;
  NSArray *v7;
  void *v8;
  id v9;
  NSArray *v10;
  NSArray *v11;
  NSArray *v12;

  v3 = self->_allItems;
  objc_sync_enter(v3);
  allItems = self->_allItems;
  if (!allItems)
  {
    v5 = self->_fetchResult;
    objc_sync_enter(v5);
    assetPrefetchOptions = self->_assetPrefetchOptions;
    if (assetPrefetchOptions)
    {
      objc_msgSend(MEMORY[0x1E0CD1390], "clsAllAssetsFromFetchResult:prefetchOptions:curationContext:", self->_fetchResult, assetPrefetchOptions, self->_curationContext);
      v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v8 = self->_allItems;
      self->_allItems = v7;
    }
    else
    {
      v9 = objc_alloc(MEMORY[0x1E0C99D20]);
      -[PHFetchResult fetchedObjects](self->_fetchResult, "fetchedObjects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (NSArray *)objc_msgSend(v9, "initWithArray:copyItems:", v8, 0);
      v11 = self->_allItems;
      self->_allItems = v10;

    }
    objc_sync_exit(v5);

    allItems = self->_allItems;
  }
  v12 = allItems;
  objc_sync_exit(v3);

  return v12;
}

- (id)privateItems
{
  void *v2;
  void *v3;
  void *v4;

  -[CLSInvestigationPhotoKitFeeder allItems](self, "allItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("clsIsInSharedLibrary == NO"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sharedItems
{
  void *v2;
  void *v3;
  void *v4;

  -[CLSInvestigationPhotoKitFeeder allItems](self, "allItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("clsIsInSharedLibrary == YES"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)itemAtIndex:(unint64_t)a3
{
  PHFetchResult *v5;
  void *v6;
  void *v7;

  v5 = self->_fetchResult;
  objc_sync_enter(v5);
  if (self->_assetPrefetchOptions)
  {
    -[CLSInvestigationPhotoKitFeeder allItems](self, "allItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PHFetchResult objectAtIndex:](self->_fetchResult, "objectAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_sync_exit(v5);

  return v7;
}

- (void)enumerateItemsUsingBlock:(id)a3
{
  id v4;

  v4 = (id)MEMORY[0x1D1796244](a3, a2);
  -[CLSInvestigationPhotoKitFeeder enumerateItemsWithOptions:usingBlock:](self, "enumerateItemsWithOptions:usingBlock:", 0, v4);

}

- (void)enumerateItemsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  PHFetchResult *v7;
  void *v8;
  PHFetchResult *fetchResult;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = self->_fetchResult;
  objc_sync_enter(v7);
  if (self->_assetPrefetchOptions)
  {
    -[CLSInvestigationPhotoKitFeeder allItems](self, "allItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __71__CLSInvestigationPhotoKitFeeder_enumerateItemsWithOptions_usingBlock___block_invoke_2;
    v10[3] = &unk_1E84F84D8;
    v11 = v6;
    objc_msgSend(v8, "enumerateObjectsWithOptions:usingBlock:", a3, v10);

  }
  else
  {
    fetchResult = self->_fetchResult;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71__CLSInvestigationPhotoKitFeeder_enumerateItemsWithOptions_usingBlock___block_invoke;
    v12[3] = &unk_1E84F84D8;
    v13 = v6;
    -[PHFetchResult enumerateObjectsWithOptions:usingBlock:](fetchResult, "enumerateObjectsWithOptions:usingBlock:", a3, v12);

  }
  objc_sync_exit(v7);

}

- (unint64_t)numberOfShinyGemItems
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[CLSInvestigationPhotoKitFeeder allItems](self, "allItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isShinyGem");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)numberOfRegularGemItems
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[CLSInvestigationPhotoKitFeeder allItems](self, "allItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isRegularGem");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (double)behavioralScore
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  float v9;
  unint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[CLSInvestigationPhotoKitFeeder allItems](self, "allItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "clsBehavioralScore");
        v7 = v7 + v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }
  v10 = -[PHFetchResult count](self->_fetchResult, "count");

  return v7 / (double)v10;
}

- (void)_prefetchShareParticipants
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSSet *v7;
  NSSet *shareParticipants;
  id v9;

  -[PHFetchResult photoLibrary](self->_fetchResult, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD17A8], "fetchContributorsForAssets:options:", self->_fetchResult, v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v4, "fetchedObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
  shareParticipants = self->_shareParticipants;
  self->_shareParticipants = v7;

}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (PHFetchOptions)assetFetchOptions
{
  return self->_assetFetchOptions;
}

- (NSSet)shareParticipants
{
  return self->_shareParticipants;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareParticipants, 0);
  objc_storeStrong((id *)&self->_assetFetchOptions, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_curationContext, 0);
  objc_storeStrong((id *)&self->_allItems, 0);
  objc_storeStrong((id *)&self->_fetchResult, 0);
}

uint64_t __71__CLSInvestigationPhotoKitFeeder_enumerateItemsWithOptions_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __71__CLSInvestigationPhotoKitFeeder_enumerateItemsWithOptions_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)feederForAssetCollection:(id)a3 options:(id)a4 feederPrefetchOptions:(id)a5 curationContext:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  CLSInvestigationPhotoKitFeeder *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[CLSInvestigationPhotoKitFeeder initWithAssetCollection:assetFetchOptions:feederPrefetchOptions:curationContext:]([CLSInvestigationPhotoKitFeeder alloc], "initWithAssetCollection:assetFetchOptions:feederPrefetchOptions:curationContext:", v12, v11, v10, v9);

  return v13;
}

+ (id)feederForAssetCollection:(id)a3 options:(id)a4 feederPrefetchOptions:(id)a5 curationContext:(id)a6 sharedLibraryEnabled:(BOOL)a7
{
  _BOOL4 v7;
  void *v8;
  void *v9;

  v7 = a7;
  +[CLSInvestigationPhotoKitFeeder feederForAssetCollection:options:feederPrefetchOptions:curationContext:](CLSInvestigationPhotoKitFeeder, "feederForAssetCollection:options:feederPrefetchOptions:curationContext:", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
    objc_msgSend(v8, "_prefetchShareParticipants");
  return v9;
}

@end
