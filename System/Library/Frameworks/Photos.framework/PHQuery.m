@implementation PHQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchIndexLookupIdentifier, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_seedOIDs, 0);
  objc_storeStrong((id *)&self->_fetchType, 0);
  objc_storeStrong((id *)&self->_propertiesToFetchWhenGrouping, 0);
  objc_storeStrong((id *)&self->_propertiesToGroupBy, 0);
  objc_storeStrong((id *)&self->_fetchOptions, 0);
  objc_storeStrong(&self->_identificationBlock, 0);
  objc_storeStrong((id *)&self->_filteringRelationshipsIndexValueByBaseEntityName, 0);
  objc_storeStrong((id *)&self->_filteringObjectKeyPaths, 0);
  objc_storeStrong((id *)&self->_filteringOids, 0);
  objc_storeStrong((id *)&self->_filteringKeys, 0);
  objc_storeStrong((id *)&self->_combinedQuerySeparatingIdentifier, 0);
  objc_storeStrong((id *)&self->_combinedQueryKeyPath, 0);
  objc_storeStrong(&self->_combinedQueryGroupKey, 0);
  objc_storeStrong((id *)&self->_containerCollection, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_containerRelationship, 0);
  objc_storeStrong((id *)&self->_fetchRequest, 0);
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_basePredicate, 0);
  objc_storeStrong((id *)&self->_cachedFetchOptionsPredicate, 0);
}

- (void)setFetchOptions:(id)a3
{
  id v4;
  PHFetchOptions *v5;
  PHFetchOptions *fetchOptions;
  void *v7;
  PHPhotoLibrary *v8;
  PHPhotoLibrary *photoLibrary;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    v5 = (PHFetchOptions *)objc_msgSend(v4, "copy");
    fetchOptions = self->_fetchOptions;
    self->_fetchOptions = v5;

    objc_msgSend(v10, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v10;
    if (v7)
    {
      objc_msgSend(v10, "photoLibrary");
      v8 = (PHPhotoLibrary *)objc_claimAutoreleasedReturnValue();
      photoLibrary = self->_photoLibrary;
      self->_photoLibrary = v8;

      v4 = v10;
    }
  }

}

+ (id)queryForAssetsInAssetCollection:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v6 = a3;
  v7 = a4;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "assetCollectionType") == 3)
  {
    v9 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v6, "objectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicateWithFormat:", CFSTR("moment = %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (const void *)PHQueryForAssetsInMoment;
LABEL_7:
    v15 = (uint64_t)_Block_copy(v12);
LABEL_8:
    v16 = (void *)v15;
LABEL_9:
    v17 = 0;
    goto LABEL_10;
  }
  if (objc_msgSend(v6, "assetCollectionType") == 7)
  {
    v13 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v6, "objectID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "predicateWithFormat:", CFSTR("momentShare = %@"), v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (const void *)PHQueryForAssetsInMomentShare;
    goto LABEL_7;
  }
  if (objc_msgSend(v6, "assetCollectionType") == 4)
  {
    objc_msgSend(v6, "predicateForAllAssetsWithLibrary:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (const void *)PHQueryForAssetsInMemory;
    goto LABEL_7;
  }
  if (objc_msgSend(v6, "assetCollectionType") == 2)
  {
    v21 = objc_msgSend(v6, "plAlbumKind");
    if ((_DWORD)v21 == 1507)
    {
      objc_msgSend(v6, "userQuery");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_alloc_init(MEMORY[0x1E0D71A30]);
      v23 = (void *)MEMORY[0x1E0D71A38];
      objc_msgSend(v6, "photoLibrary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "photoLibrary");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "predicateForQuery:inLibrary:changeDetectionCriteria:", v22, v25, v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = _Block_copy((const void *)PHQueryForAssetsInUserSmartAlbum);
    }
    else
    {
      v26 = v21;
      objc_msgSend(MEMORY[0x1E0D71738], "predicateForAlbumKind:includeGuest:", v21, objc_msgSend(v7, "includeGuestAssets"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "identificationBlockForSmartAlbumKind:", v26);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "hasAnySortDescriptors") & 1) != 0)
        goto LABEL_9;
      objc_msgSend(v6, "photoLibrary");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v7, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D71738], "sortDescriptorsForAlbumKind:", v26);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setInternalSortDescriptors:", v29);

      v17 = 0;
      v7 = v28;
    }
  }
  else
  {
    if (objc_msgSend(v6, "assetCollectionType") == 6 && objc_msgSend(v6, "isSharingSuggestion"))
    {
      _predicateForAssetsInSharedLibrarySharingSuggestionWithOptions(v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (const void *)PHQueryForAssetsInSharedLibrarySuggestion;
      goto LABEL_7;
    }
    if (objc_msgSend(v6, "assetCollectionType") == 6)
    {
      _predicateForAssetsInPhotosHighlightWithOptions(v6, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (const void *)PHQueryForAssetsInPhotosHighlight;
      goto LABEL_7;
    }
    if (objc_msgSend(v6, "assetCollectionType") == 8)
    {
      objc_msgSend(v6, "predicateForAllAssets");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (const void *)PHQueryForAssetsInSuggestion;
      goto LABEL_7;
    }
    if (objc_msgSend(v6, "assetCollectionType") == 9)
    {
      v30 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v6, "objectID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("importSession"), v31);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (const void *)PHQueryForAssetsInImportSession;
      goto LABEL_7;
    }
    if (objc_msgSend(v6, "assetCollectionSubtype") != 1000000601
      || objc_msgSend(v7, "sharingFilter") == 2)
    {
      v32 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v6, "objectID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "predicateWithFormat:", CFSTR("albums CONTAINS %@"), v33);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "identificationBlockForAlbumSortKey:", objc_msgSend(v6, "customSortKey"));
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v16 = 0;
  }
LABEL_10:
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v11, v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_fetchOptionsForFetchingAssetsFromAssetCollection:options:changeDetectionCriteria:", v6, v7, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "_setContainerCollection:", v6);
  objc_msgSend(v18, "_setIdentificationBlock:", v16);
  if (v19)
    objc_msgSend(v18, "setFetchOptions:", v19);

  return v18;
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)objc_getProperty(self, a2, 264, 1);
}

- (BOOL)overrideResultClassWithFetchType
{
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("PHMomentList");
  v6[1] = CFSTR("PHSocialGroup");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHQuery fetchType](self, "fetchType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "containsObject:", v4);

  return (char)self;
}

- (NSString)fetchType
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (id)containerIdentifier
{
  -[PHQuery _prepareContainerInfo](self, "_prepareContainerInfo");
  return self->_containerIdentifier;
}

- (void)_prepareContainerInfo
{
  PHQuery *v2;
  void *v3;
  NSString *fetchType;
  NSPredicate *basePredicate;
  uint64_t v6;
  NSRelationshipDescription *v7;
  NSManagedObjectID *containerIdentifier;
  void *containerRelationship;
  uint64_t v10;
  id v11;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_preparedContainerInfo)
  {
    if (-[PHQuery collectionFetchType](v2, "collectionFetchType") == 3)
    {
      v3 = (void *)objc_opt_class();
      fetchType = v2->_fetchType;
      basePredicate = v2->_basePredicate;
      v11 = 0;
      objc_msgSend(v3, "_containerIdentifierForFetchType:predicate:outRelationship:", fetchType, basePredicate, &v11);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (NSRelationshipDescription *)v11;
      containerIdentifier = v2->_containerIdentifier;
      v2->_containerIdentifier = (NSManagedObjectID *)v6;

      containerRelationship = v2->_containerRelationship;
      v2->_containerRelationship = v7;
    }
    else
    {
      if (!-[PHQuery _isUserSmartAlbum](v2, "_isUserSmartAlbum"))
      {
LABEL_7:
        v2->_preparedContainerInfo = 1;
        goto LABEL_8;
      }
      -[PHObject objectID](v2->_containerCollection, "objectID");
      v10 = objc_claimAutoreleasedReturnValue();
      containerRelationship = v2->_containerIdentifier;
      v2->_containerIdentifier = (NSManagedObjectID *)v10;
    }

    goto LABEL_7;
  }
LABEL_8:
  objc_sync_exit(v2);

}

- (NSFetchRequest)fetchRequest
{
  NSFetchRequest *v2;
  NSFetchRequest *fetchRequest;
  NSFetchRequest *v5;
  NSFetchRequest *v6;

  if (self->_searchIndexLookupIdentifier)
  {
    v2 = 0;
  }
  else
  {
    fetchRequest = self->_fetchRequest;
    if (!fetchRequest)
    {
      -[PHQuery _createFetchRequestIncludingBasePredicate:](self, "_createFetchRequestIncludingBasePredicate:", 1);
      v5 = (NSFetchRequest *)objc_claimAutoreleasedReturnValue();
      v6 = self->_fetchRequest;
      self->_fetchRequest = v5;

      fetchRequest = self->_fetchRequest;
    }
    v2 = fetchRequest;
  }
  return v2;
}

- (id)effectivePredicateForPHClass:(Class)a3 includingBasePredicate:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSPredicate *v15;
  NSPredicate *basePredicate;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  PHPhotoLibrary *v28;
  PHPhotoLibrary *photoLibrary;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSPredicate *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint8_t buf[8];
  _QWORD v71[3];

  v4 = a4;
  v71[2] = *MEMORY[0x1E0C80C00];
  -[PHQuery photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContextForCurrentQueueQoS");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHQuery filterPredicate](self, "filterPredicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHQuery fetchOptions](self, "fetchOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "internalPredicate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHQuery fetchOptions](self, "fetchOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "internalInclusionPredicate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0;
  basePredicate = self->_basePredicate;
  if (basePredicate && v4)
  {
    v15 = basePredicate;
    objc_msgSend(v14, "addObject:", v15);
  }
  v17 = v9;
  if (v9 || (v17 = v11) != 0)
    objc_msgSend(v14, "addObject:", v17);
  -[PHQuery fetchOptions](self, "fetchOptions", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isExclusivePredicate");

  if ((v19 & 1) == 0)
  {
    -[PHQuery _globalPredicatesForPHClass:](self, "_globalPredicatesForPHClass:", a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObjectsFromArray:", v20);

  }
  -[objc_class managedEntityName](a3, "managedEntityName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeEntityForNameInManagedObjectContext();
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0D71778], "entityName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PLSafeEntityForNameInManagedObjectContext();
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      PLSafeEntityForNameInManagedObjectContext();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v69 = v13;
        if (objc_msgSend(v22, "isKindOfEntity:", v24)
          && !-[PHQuery _includesCameraRoll](self, "_includesCameraRoll"))
        {
          v65 = v25;
          -[PHQuery fetchOptions](self, "fetchOptions");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v26)
          {
            -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v26, "photoLibrary");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v27)
            objc_msgSend(v26, "setPhotoLibrary:", self->_photoLibrary);
          objc_msgSend(v26, "photoLibrary");
          v28 = (PHPhotoLibrary *)objc_claimAutoreleasedReturnValue();
          photoLibrary = self->_photoLibrary;

          if (v28 != photoLibrary)
          {
            PLPhotoKitGetLog();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1991EC000, v30, OS_LOG_TYPE_FAULT, "fetchOptions passed to PHQuery has a photoLibrary set that does not match _photoLibrary", buf, 2u);
            }

          }
          v31 = v26;
          objc_msgSend(v31, "photoLibrary");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v32)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSPredicate *_predicateForFilteringCollections(PHFetchOptions *__strong)");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "handleFailureInFunction:file:lineNumber:description:", v64, CFSTR("PHQuery.m"), 2828, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fetchOptions.photoLibrary != nil"));

          }
          v33 = (void *)MEMORY[0x1E0D71778];
          objc_msgSend(v31, "photoLibrary");
          v34 = v31;
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "defaultAlbumKindsForFetchingWithCPLEnabled:", objc_msgSend(v35, "isCloudPhotoLibraryEnabled"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          v67 = v34;
          if (objc_msgSend(v34, "includeFavoriteMemoriesCollectionList"))
          {
            objc_msgSend(v36, "arrayByAddingObject:", &unk_1E3655CA8);
            v37 = objc_claimAutoreleasedReturnValue();

            v36 = (void *)v37;
            v34 = v67;
          }
          v25 = v65;
          if (objc_msgSend(v34, "includePlacesSmartAlbum"))
          {
            objc_msgSend(v36, "arrayByAddingObject:", &unk_1E3655CD8);
            v38 = objc_claimAutoreleasedReturnValue();

            v36 = (void *)v38;
            v34 = v67;
          }
          if (objc_msgSend(v34, "includeUserSmartAlbums"))
          {
            objc_msgSend(v36, "arrayByAddingObject:", &unk_1E3655CF0);
            v39 = objc_claimAutoreleasedReturnValue();

            v36 = (void *)v39;
            v34 = v67;
          }
          if (objc_msgSend(v34, "includeRecentlyEditedSmartAlbum"))
          {
            objc_msgSend(v36, "arrayByAddingObject:", &unk_1E3655D08);
            v40 = objc_claimAutoreleasedReturnValue();

            v36 = (void *)v40;
            v34 = v67;
          }
          if (objc_msgSend(v34, "includeScreenRecordingsSmartAlbum"))
          {
            objc_msgSend(v36, "arrayByAddingObject:", &unk_1E3655D20);
            v41 = objc_claimAutoreleasedReturnValue();

            v36 = (void *)v41;
            v34 = v67;
          }
          if (objc_msgSend(v34, "includeSharedLibrarySharingSuggestionsSmartAlbum"))
          {
            objc_msgSend(v36, "arrayByAddingObject:", &unk_1E3655D38);
            v42 = objc_claimAutoreleasedReturnValue();

            v36 = (void *)v42;
            v34 = v67;
          }
          if (objc_msgSend(v34, "includeAllPhotosSmartAlbum"))
          {
            objc_msgSend(v36, "arrayByAddingObject:", &unk_1E3655D50);
            v43 = objc_claimAutoreleasedReturnValue();

            v36 = (void *)v43;
            v34 = v67;
          }
          if (objc_msgSend(v34, "includeActionCamVideoSmartAlbum"))
          {
            objc_msgSend(v36, "arrayByAddingObject:", &unk_1E3655D68);
            v44 = objc_claimAutoreleasedReturnValue();

            v36 = (void *)v44;
            v34 = v67;
          }
          if (objc_msgSend(v34, "includeProResSmartAlbum"))
          {
            objc_msgSend(v36, "arrayByAddingObject:", &unk_1E3655D80);
            v45 = objc_claimAutoreleasedReturnValue();

            v36 = (void *)v45;
            v34 = v67;
          }
          if (objc_msgSend(v34, "includeDuplicatesAlbums"))
          {
            objc_msgSend(v36, "arrayByAddingObject:", &unk_1E3655D98);
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v46, "arrayByAddingObject:", &unk_1E3655DB0);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind IN %@"), v36);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "addObject:", v47);
        }
        v68 = v11;
        if (objc_msgSend(v22, "isKindOfEntity:", v25))
        {
          objc_msgSend(v9, "description");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "containsString:", CFSTR("cloudRelationshipState"));

          if ((v49 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("cloudRelationshipState != %d"), 1);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v50);

          }
        }
        v66 = v24;
        if (!objc_msgSend(v14, "count"))
        {
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v51);

        }
        objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v14);
        v52 = objc_claimAutoreleasedReturnValue();
        v53 = (void *)v52;
        v13 = v69;
        if (v69)
        {
          v54 = (void *)MEMORY[0x1E0CB3528];
          v71[0] = v52;
          v71[1] = v69;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 2);
          v55 = v22;
          v56 = v9;
          v57 = v8;
          v58 = v15;
          v59 = v25;
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "orPredicateWithSubpredicates:", v60);
          v61 = objc_claimAutoreleasedReturnValue();

          v25 = v59;
          v15 = v58;
          v8 = v57;
          v9 = v56;
          v22 = v55;
          v53 = (void *)v61;
        }
        v24 = v66;
        v11 = v68;
      }
      else
      {
        v53 = 0;
      }

    }
    else
    {
      v53 = 0;
    }

  }
  else
  {
    v53 = 0;
  }

  return v53;
}

- (PHFetchOptions)fetchOptions
{
  return self->_fetchOptions;
}

- (NSPredicate)filterPredicate
{
  void *v3;
  NSPredicate *v4;
  NSPredicate *v5;
  NSPredicate *filterPredicate;
  NSPredicate *v7;

  -[PHQuery fetchOptions](self, "fetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicate");
  v4 = (NSPredicate *)objc_claimAutoreleasedReturnValue();
  if (v4 != self->_cachedFetchOptionsPredicate)
  {
    objc_storeStrong((id *)&self->_cachedFetchOptionsPredicate, v4);
    if (self->_cachedFetchOptionsPredicate)
    {
      objc_msgSend((id)objc_opt_class(), "_filterPredicateFromFetchOptionsPredicate:options:phClass:", self->_cachedFetchOptionsPredicate, v3, +[PHPhotoLibrary classForFetchType:](PHPhotoLibrary, "classForFetchType:", self->_fetchType));
      v5 = (NSPredicate *)objc_claimAutoreleasedReturnValue();
      filterPredicate = self->_filterPredicate;
      self->_filterPredicate = v5;
    }
    else
    {
      filterPredicate = self->_filterPredicate;
      self->_filterPredicate = 0;
    }

  }
  v7 = self->_filterPredicate;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (id *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initForType:withBasePredicate:inLibrary:", self->_fetchType, self->_basePredicate, self->_photoLibrary);
  -[PHQuery fetchOptions](self, "fetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFetchOptions:", v5);

  objc_msgSend(v4, "_setIncludesCameraRoll:", -[PHQuery _includesCameraRoll](self, "_includesCameraRoll"));
  v6 = (void *)-[PHCollection copy](self->_containerCollection, "copy");
  objc_msgSend(v4, "_setContainerCollection:", v6);

  objc_msgSend(v4, "_setCollectionFetchType:", -[PHQuery collectionFetchType](self, "collectionFetchType"));
  objc_msgSend(v4, "_setIdentificationBlock:", self->_identificationBlock);
  -[PHQuery propertiesToGroupBy](self, "propertiesToGroupBy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPropertiesToGroupBy:", v7);

  -[PHQuery propertiesToFetchWhenGrouping](self, "propertiesToFetchWhenGrouping");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPropertiesToFetchWhenGrouping:", v8);

  objc_storeStrong(v4 + 34, self->_searchIndexLookupIdentifier);
  return v4;
}

- (int64_t)collectionFetchType
{
  int64_t result;
  void *v4;
  int64_t v5;

  result = self->_collectionFetchType;
  if (!result)
  {
    objc_msgSend((id)objc_opt_class(), "_relationshipForFetchType:predicate:", self->_fetchType, self->_basePredicate);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 2;
    if (v4)
      v5 = 3;
    self->_collectionFetchType = v5;

    return self->_collectionFetchType;
  }
  return result;
}

- (void)_setContainerCollection:(id)a3
{
  objc_storeStrong((id *)&self->_containerCollection, a3);
}

- (void)_setIdentificationBlock:(id)a3
{
  void *v4;
  id identificationBlock;

  v4 = (void *)objc_msgSend(a3, "copy");
  identificationBlock = self->_identificationBlock;
  self->_identificationBlock = v4;

}

- (BOOL)_includesCameraRoll
{
  return self->__includesCameraRoll;
}

- (void)setPropertiesToGroupBy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (void)setPropertiesToFetchWhenGrouping:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSArray)propertiesToFetchWhenGrouping
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (void)_setIncludesCameraRoll:(BOOL)a3
{
  self->__includesCameraRoll = a3;
}

- (void)_setCollectionFetchType:(int64_t)a3
{
  self->_collectionFetchType = a3;
}

- (id)_createFetchRequestIncludingBasePredicate:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v26;
  void *v27;
  _QWORD v28[2];

  v3 = a3;
  v28[1] = *MEMORY[0x1E0C80C00];
  v5 = +[PHPhotoLibrary classForFetchType:](PHPhotoLibrary, "classForFetchType:", self->_fetchType);
  -[objc_class managedEntityName](v5, "managedEntityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHQuery photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContextForCurrentQueueQoS");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeEntityForNameInManagedObjectContext();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setEntity:", v9);
    -[PHQuery effectivePredicateForPHClass:includingBasePredicate:](self, "effectivePredicateForPHClass:includingBasePredicate:", v5, v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v10, "setPredicate:", v11);
    -[PHQuery propertiesToGroupBy](self, "propertiesToGroupBy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v6;
    if (objc_msgSend(v12, "count"))
    {
      v26 = v11;
      objc_msgSend(v10, "setResultType:", 2);
      objc_msgSend(v10, "setPropertiesToGroupBy:", v12);
      v13 = objc_alloc_init(MEMORY[0x1E0C97B30]);
      objc_msgSend(v13, "setName:", CFSTR("objectID"));
      objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setExpression:", v14);

      objc_msgSend(v13, "setExpressionResultType:", 2000);
      v28[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHQuery propertiesToFetchWhenGrouping](self, "propertiesToFetchWhenGrouping");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (v17)
      {
        -[PHQuery propertiesToFetchWhenGrouping](self, "propertiesToFetchWhenGrouping");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v18);
        v19 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v19;
      }
      objc_msgSend(v10, "setPropertiesToFetch:", v15);

      v11 = v26;
    }
    else
    {
      objc_msgSend(v10, "setResultType:", 1);
    }
    objc_msgSend(v10, "setIncludesPropertyValues:", 0);
    objc_msgSend(v10, "setIncludesPendingChanges:", 0);
    -[PHQuery _effectiveSortDescriptors](self, "_effectiveSortDescriptors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSortDescriptors:", v20);
    -[PHQuery fetchOptions](self, "fetchOptions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "fetchLimit");

    if (v22)
      objc_msgSend(v10, "setFetchLimit:", v22);
    -[PHQuery fetchOptions](self, "fetchOptions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "fetchOffset");

    if (v24)
      objc_msgSend(v10, "setFetchOffset:", v24);

    v6 = v27;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSArray)propertiesToGroupBy
{
  return (NSArray *)objc_getProperty(self, a2, 232, 1);
}

- (id)_effectiveSortDescriptors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v19;
  void *v20;
  const __CFString *v21;
  _BOOL8 v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  -[PHQuery fetchOptions](self, "fetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortDescriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHQuery fetchOptions](self, "fetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internalSortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "_transformedSortDescriptors:forFetchType:", v4, self->_fetchType);
    v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = v7;
    goto LABEL_6;
  }
  if (v6)
  {
    v7 = v6;
    goto LABEL_5;
  }
  if (!-[PHCollection isUserSmartAlbum](self->_containerCollection, "isUserSmartAlbum"))
  {
    -[PHCollection effectiveCustomSortDescriptors](self->_containerCollection, "effectiveCustomSortDescriptors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHQuery fetchOptions](self, "fetchOptions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHQuery _effectiveDefaultSortDescriptorReversingOrder:](self, "_effectiveDefaultSortDescriptorReversingOrder:", objc_msgSend(v24, "reverseDefaultSortDescriptors"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23 && v8)
    {
      objc_msgSend(v8, "arrayByAddingObject:", v23);
      v25 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v25;
    }
    else if (v23 && !v8)
    {
      v32[0] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0D71738], "sortDescriptorsForAlbumKind:", 1507);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v19, "mutableCopy");

  if (-[PHCollection customSortKey](self->_containerCollection, "customSortKey") == 5
    || -[PHCollection customSortKey](self->_containerCollection, "customSortKey") == 101)
  {
    v20 = (void *)MEMORY[0x1E0CB3928];
    v21 = CFSTR("additionalAttributes.title");
    v22 = 1;
LABEL_21:
    objc_msgSend(v20, "sortDescriptorWithKey:ascending:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertObject:atIndex:", v23, 0);
LABEL_28:

    goto LABEL_6;
  }
  if (-[PHCollection customSortKey](self->_containerCollection, "customSortKey") == 1)
  {
    v26 = (void *)MEMORY[0x1E0CB3928];
    v22 = -[PHCollection customSortAscending](self->_containerCollection, "customSortAscending");
    v21 = CFSTR("dateCreated");
    v20 = v26;
    goto LABEL_21;
  }
LABEL_6:
  -[PHQuery fetchOptions](self, "fetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "reverseSortOrder");

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v28;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v28 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v16), "reversedSortDescriptor", (_QWORD)v27);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v14);
    }

  }
  else
  {
    v11 = v8;
  }

  return v11;
}

+ (id)queryForType:(id)a3 withBasePredicate:(id)a4 inLibrary:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForType:withBasePredicate:inLibrary:", v10, v9, v8);

  return v11;
}

- (id)initForType:(id)a3 withBasePredicate:(id)a4 seedOIDs:(id)a5 inLibrary:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PHQuery *v15;
  PHQuery *v16;
  uint64_t v17;
  PHFetchOptions *fetchOptions;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  id v23;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PHQuery;
  v15 = -[PHQuery init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fetchType, a3);
    objc_storeStrong((id *)&v16->_basePredicate, a4);
    objc_storeStrong((id *)&v16->_seedOIDs, a5);
    objc_storeStrong((id *)&v16->_photoLibrary, a6);
    -[PHPhotoLibrary librarySpecificFetchOptions](v16->_photoLibrary, "librarySpecificFetchOptions");
    v17 = objc_claimAutoreleasedReturnValue();
    fetchOptions = v16->_fetchOptions;
    v16->_fetchOptions = (PHFetchOptions *)v17;

    if (v11)
    {
      if (v14)
        goto LABEL_4;
      v20 = (void *)MEMORY[0x1E0C99DA0];
      v21 = *MEMORY[0x1E0C99778];
      v22 = CFSTR("PHQuery requires a library");
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0C99DA0];
      v21 = *MEMORY[0x1E0C99778];
      v22 = CFSTR("PHQuery requires a type");
    }
    objc_msgSend(v20, "exceptionWithName:reason:userInfo:", v21, v22, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
LABEL_4:

  return v16;
}

- (id)initForType:(id)a3 withBasePredicate:(id)a4 inLibrary:(id)a5
{
  return -[PHQuery initForType:withBasePredicate:seedOIDs:inLibrary:](self, "initForType:withBasePredicate:seedOIDs:inLibrary:", a3, a4, 0, a5);
}

+ (id)_fetchOptionsForFetchingAssetsFromAssetCollection:(id)a3 options:(id)a4 changeDetectionCriteria:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void **v29;
  void *v30;
  void *v31;
  void *v32;
  PHQueryChangeDetectionCriteria *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    goto LABEL_2;
  objc_msgSend(v10, "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHQuery.m"), 1440, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetCollection.photoLibrary || options.photoLibrary"));
LABEL_2:

  }
  if (objc_msgSend(v9, "assetCollectionType") == 1)
  {
    if (objc_msgSend(v9, "assetCollectionSubtype") == 100)
    {
      objc_msgSend(v9, "photoLibrary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v10, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v15, "hasAnySortDescriptors") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = v16;
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("sortToken"), 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v40[1] = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "setInternalSortDescriptors:", v18);
      }
      objc_msgSend(v15, "setIncludeDuplicateAssets:", 1);
      goto LABEL_36;
    }
LABEL_35:
    v15 = v10;
    goto LABEL_36;
  }
  if (objc_msgSend(v9, "assetCollectionType") == 2)
  {
    if (objc_msgSend(v9, "assetCollectionSubtype") == 205)
    {
      objc_msgSend(v9, "photoLibrary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v10, v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setIncludeHiddenAssets:", 1);
      goto LABEL_36;
    }
    if (objc_msgSend(v9, "assetCollectionSubtype") == 1000000201)
    {
      objc_msgSend(v9, "photoLibrary");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v10, v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setIncludeHiddenAssets:", 1);
LABEL_20:
      objc_msgSend(v15, "setIncludeTrashedAssets:", 1);
      goto LABEL_36;
    }
    if (objc_msgSend(v9, "assetCollectionSubtype") != 1000000204)
    {
      if (objc_msgSend(v9, "assetCollectionSubtype") == 1000000219)
      {
        objc_msgSend(v9, "photoLibrary");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v10, v30);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "setIsExclusivePredicate:", 1);
        goto LABEL_36;
      }
      goto LABEL_35;
    }
    objc_msgSend(v9, "userQuery");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "photoLibrary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v10, v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setIncludeHiddenAssets:", objc_msgSend(MEMORY[0x1E0D71A38], "includesHiddenAssetsKeyInQuery:", v24));
    goto LABEL_34;
  }
  if (objc_msgSend(v9, "assetCollectionType") != 4
    && objc_msgSend(v9, "assetCollectionType") != 7
    && objc_msgSend(v9, "assetCollectionType") != 8)
  {
    if (objc_msgSend(v9, "assetCollectionType") == 9)
    {
      objc_msgSend(v9, "photoLibrary");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v10, v26);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v15, "hasAnySortDescriptors") & 1) != 0)
        goto LABEL_36;
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v27;
      v28 = (void *)MEMORY[0x1E0C99D20];
      v29 = &v38;
    }
    else
    {
      if (objc_msgSend(v9, "assetCollectionType") == 3)
      {
        objc_msgSend(v9, "photoLibrary");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v10, v31);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_20;
      }
      if (objc_msgSend(v9, "assetCollectionType") != 6)
        goto LABEL_35;
      objc_msgSend(v9, "photoLibrary");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v10, v32);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v15, "hasAnySortDescriptors") & 1) != 0)
        goto LABEL_36;
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v27;
      v28 = (void *)MEMORY[0x1E0C99D20];
      v29 = &v37;
    }
    objc_msgSend(v28, "arrayWithObjects:count:", v29, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setInternalSortDescriptors:", v24);
LABEL_34:

    goto LABEL_36;
  }
  objc_msgSend(v9, "photoLibrary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v10, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v15, "hasAnySortDescriptors") & 1) == 0)
  {
    +[PHObject internalSortDescriptorForPropertyKey:ascending:](PHAsset, "internalSortDescriptorForPropertyKey:ascending:", CFSTR("creationDate"), 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setInternalSortDescriptors:", v22);

  }
LABEL_36:
  if (v11)
  {
    v33 = -[PHQueryChangeDetectionCriteria initWithPLQueryChangeDetectionCriteria:]([PHQueryChangeDetectionCriteria alloc], "initWithPLQueryChangeDetectionCriteria:", v11);
    if (v33)
    {
      objc_msgSend(v9, "photoLibrary");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v15, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v35, "setChangeDetectionCriteria:", v33);
      v15 = v35;
    }

  }
  return v15;
}

+ (id)_containerIdentifierForFetchType:(id)a3 predicate:(id)a4 outRelationship:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char isKindOfClass;
  void *v19;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "leftExpression");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "expressionType") != 3)
    {
      v16 = 0;
      v10 = 0;
      goto LABEL_13;
    }
    objc_msgSend(v9, "keyPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[objc_class managedEntityName](+[PHPhotoLibrary classForFetchType:](PHPhotoLibrary, "classForFetchType:", v7), "managedEntityName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D718B0], "managedObjectModel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "entitiesByName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "relationshipsByName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v8, "rightExpression");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "expressionType"))
        {
          objc_msgSend(v9, "constantValue");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v9, "constantValue");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_14;
          }
        }
LABEL_13:
        v19 = 0;
LABEL_14:

        if (!a5)
          goto LABEL_11;
        goto LABEL_10;
      }
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
    v10 = 0;
  }
  v19 = 0;
  if (a5)
LABEL_10:
    *a5 = objc_retainAutorelease(v16);
LABEL_11:

  return v19;
}

+ (id)_relationshipForFetchType:(id)a3 predicate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "leftExpression");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "expressionType") == 3)
    {
      objc_msgSend(v7, "keyPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v7, "expressionType") != 4)
        goto LABEL_13;
      objc_msgSend(v7, "function");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lowercaseString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "isEqualToString:", CFSTR("noindex:")))
      {
        v8 = 0;
        v13 = 0;
        goto LABEL_15;
      }
      objc_msgSend(v7, "arguments");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15 != 1)
      {
LABEL_13:
        v8 = 0;
        v13 = 0;
LABEL_16:

        goto LABEL_17;
      }
      objc_msgSend(v7, "arguments");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v17, "expressionType") == 3)
      {
        objc_msgSend(v17, "keyPath");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }

    }
    if (v8)
    {
      -[objc_class managedEntityName](+[PHPhotoLibrary classForFetchType:](PHPhotoLibrary, "classForFetchType:", v5), "managedEntityName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D718B0], "managedObjectModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "entitiesByName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "relationshipsByName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
      goto LABEL_16;
    }
  }
  else
  {
    v8 = 0;
  }
  v13 = 0;
LABEL_17:

  return v13;
}

- (BOOL)_isUserSmartAlbum
{
  return -[PHCollection isUserSmartAlbum](self->_containerCollection, "isUserSmartAlbum");
}

+ (id)identificationBlockForSmartAlbumKind:(int)a3
{
  void *v3;
  const void *v4;
  void *v7;
  const void *v8;
  void *v9;
  void *v10;

  v3 = 0;
  if (a3 <= 1549)
  {
    if (a3 <= 999)
    {
      if (a3 > 14)
      {
        if (a3 == 15)
        {
          v4 = (const void *)PHQueryForAssetInAlbumKind_LegacyFaces;
        }
        else
        {
          if (a3 != 16)
            goto LABEL_90;
          v4 = (const void *)PHQueryForAssetInAlbumKind_Places;
        }
      }
      else if (a3 == 2)
      {
        v4 = (const void *)PHQueryForAssetInAlbumKind_Regular;
      }
      else
      {
        if (a3 != 12)
          goto LABEL_90;
        v4 = (const void *)PHQueryForAssetInAlbumKind_Event;
      }
    }
    else
    {
      switch(a3)
      {
        case 1500:
          v4 = (const void *)PHQueryForAssetInAlbumKind_PhotoStream;
          break;
        case 1501:
          v4 = (const void *)PHQueryForAssetInAlbumKind_Wallpaper_UNUSED;
          break;
        case 1502:
          v4 = (const void *)PHQueryForAssetInAlbumKind_PictureFrame;
          break;
        case 1503:
          v4 = (const void *)PHQueryForAssetInAlbumKind_CameraSession;
          break;
        case 1504:
          goto LABEL_90;
        case 1505:
          v4 = (const void *)PHQueryForAssetInAlbumKind_CloudSharedAlbum;
          break;
        case 1506:
          v4 = (const void *)PHQueryForAssetInAlbumKind_ImportSessionAlbum;
          break;
        case 1507:
          v4 = (const void *)PHQueryForAssetInAlbumKind_UserSmartAlbum;
          break;
        case 1508:
          v4 = (const void *)PHQueryForAssetInAlbumKind_Project;
          break;
        case 1509:
          v4 = (const void *)PHQueryForAssetInAlbumKind_ConversationAlbum;
          break;
        case 1510:
          v4 = (const void *)PHQueryForAssetInAlbumKind_Duplicate;
          break;
        default:
          if (a3 == 1000)
          {
            v4 = (const void *)PHQueryForAssetInAlbumKind_SavedPhotos;
          }
          else
          {
            if (a3 != 1100)
              goto LABEL_90;
            v4 = (const void *)PHQueryForAssetInAlbumKind_1stSpecial;
          }
          break;
      }
    }
  }
  else if (a3 > 3571)
  {
    switch(a3)
    {
      case 3998:
        v4 = (const void *)PHQueryForAssetInAlbumKind_ProjectAlbumRootFolder;
        break;
      case 3999:
        v4 = (const void *)PHQueryForAssetInAlbumKind_RootFolder;
        break;
      case 4000:
        v4 = (const void *)PHQueryForAssetInAlbumKind_Folder;
        break;
      case 4001:
        v4 = (const void *)PHQueryForAssetInAlbumKind_FacesStandIn;
        break;
      case 4002:
        v4 = (const void *)PHQueryForAssetInAlbumKind_EventsStandIn;
        break;
      case 4003:
        v4 = (const void *)PHQueryForAssetInAlbumKind_ImportStandIn;
        break;
      case 4004:
        v4 = (const void *)PHQueryForAssetInAlbumKind_EventsSmartFolder;
        break;
      case 4005:
        v4 = (const void *)PHQueryForAssetInAlbumKind_FacesSmartFolder;
        break;
      case 4006:
        v4 = (const void *)PHQueryForAssetInAlbumKind_FavoriteMemoriesSmartFolder;
        break;
      default:
        if (a3 == 3572)
        {
          v4 = (const void *)PHQueryForAssetInAlbumKind_OTARestoreProgressAlbum;
        }
        else
        {
          if (a3 != 3573)
            goto LABEL_90;
          v4 = (const void *)PHQueryForAssetInAlbumKind_FilesystemImportProgressAlbum;
        }
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 1550:
        v4 = (const void *)PHQueryForAssetInAlbumKind_1WaySyncAlbum;
        break;
      case 1551:
        v4 = (const void *)PHQueryForAssetInAlbumKind_1WaySyncEvent;
        break;
      case 1552:
        v4 = (const void *)PHQueryForAssetInAlbumKind_1WaySyncLibraryAlbum;
        break;
      case 1553:
        v4 = (const void *)PHQueryForAssetInAlbumKind_1WaySyncFolder;
        break;
      case 1554:
      case 1555:
      case 1556:
      case 1557:
      case 1558:
      case 1559:
      case 1560:
      case 1561:
      case 1562:
      case 1563:
      case 1564:
      case 1565:
      case 1566:
      case 1567:
      case 1568:
      case 1569:
      case 1570:
      case 1571:
      case 1572:
      case 1573:
      case 1574:
      case 1575:
      case 1576:
      case 1577:
      case 1578:
      case 1579:
      case 1580:
      case 1581:
      case 1582:
      case 1583:
      case 1584:
      case 1585:
      case 1586:
      case 1587:
      case 1588:
      case 1589:
      case 1590:
      case 1591:
      case 1592:
      case 1593:
      case 1594:
      case 1595:
      case 1596:
      case 1597:
      case 1598:
      case 1599:
      case 1633:
      case 1638:
        goto LABEL_90;
      case 1600:
        v4 = (const void *)PHQueryForAssetInAlbumKind_AllAssetsAlbum;
        break;
      case 1601:
        v4 = (const void *)PHQueryForAssetInAlbumKind_AllNonPhotoStreamAssetsAlbum;
        break;
      case 1602:
        v4 = (const void *)PHQueryForAssetInAlbumKind_AllPhotoStream;
        break;
      case 1603:
        v4 = (const void *)PHQueryForAssetInAlbumKind_LastImportAlbum;
        break;
      case 1604:
        v4 = (const void *)PHQueryForAssetInAlbumKind_AllImportedAlbum;
        break;
      case 1605:
        v4 = (const void *)PHQueryForAssetInAlbumKind_PanoramasAlbum;
        break;
      case 1606:
        v4 = (const void *)PHQueryForAssetInAlbumKind_VideosAlbum;
        break;
      case 1607:
        v4 = (const void *)PHQueryForAssetInAlbumKind_VerticalPanoramasAlbum;
        break;
      case 1608:
        v4 = (const void *)PHQueryForAssetInAlbumKind_HorizontalPanoramasAlbum;
        break;
      case 1609:
        v4 = (const void *)PHQueryForAssetInAlbumKind_FavoritesAlbum;
        break;
      case 1610:
        v4 = (const void *)PHQueryForAssetInAlbumKind_TimelapsesAlbum;
        break;
      case 1611:
        v4 = (const void *)PHQueryForAssetInAlbumKind_AllHiddenAlbum;
        break;
      case 1612:
        v4 = (const void *)PHQueryForAssetInAlbumKind_TrashBinAlbum;
        break;
      case 1613:
        v4 = (const void *)PHQueryForAssetInAlbumKind_UserLibraryAlbum;
        break;
      case 1614:
        v4 = (const void *)PHQueryForAssetInAlbumKind_BurstsAlbum;
        break;
      case 1615:
        v4 = (const void *)PHQueryForAssetInAlbumKind_SlomoVideosAlbum;
        break;
      case 1616:
        v4 = (const void *)PHQueryForAssetInAlbumKind_RecentlyAddedAlbum;
        break;
      case 1617:
        v4 = (const void *)PHQueryForAssetInAlbumKind_SelfPortraitsAlbum;
        break;
      case 1618:
        v4 = (const void *)PHQueryForAssetInAlbumKind_ScreenshotsAlbum;
        break;
      case 1619:
        v4 = (const void *)PHQueryForAssetInAlbumKind_PlacesSmartAlbum;
        break;
      case 1620:
        v4 = (const void *)PHQueryForAssetInAlbumKind_DepthEffectAlbum;
        break;
      case 1621:
        v4 = (const void *)PHQueryForAssetInAlbumKind_LivePhotosAlbum;
        break;
      case 1622:
        v4 = (const void *)PHQueryForAssetInAlbumKind_AnimatedAlbum;
        break;
      case 1623:
        v4 = (const void *)PHQueryForAssetInAlbumKind_LongExposuresAlbum;
        break;
      case 1624:
        v4 = (const void *)PHQueryForAssetInAlbumKind_UnableToUploadAlbum;
        break;
      case 1625:
        v4 = (const void *)PHQueryForAssetInAlbumKind_RecentsAlbum_DEPRECATED;
        break;
      case 1626:
        v4 = (const void *)PHQueryForAssetInAlbumKind_RecentlyEditedAlbum;
        break;
      case 1627:
        v4 = (const void *)PHQueryForAssetInAlbumKind_ScreenRecordingsAlbum;
        break;
      case 1628:
        v4 = (const void *)PHQueryForAssetInAlbumKind_AllPhotosAlbum;
        break;
      case 1629:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHQuery.m"), 4689, CFSTR("Unreachable Code: Attempting to get id for DEPRECATED Shared Library Album"));

        v3 = 0;
        goto LABEL_90;
      case 1630:
        v4 = (const void *)PHQueryForAssetInAlbumKind_RAWAlbum;
        break;
      case 1631:
        v4 = (const void *)PHQueryForAssetInAlbumKind_CinematicVideoAlbum;
        break;
      case 1632:
        v4 = (const void *)PHQueryForAssetInAlbumKind_ProResAlbum;
        break;
      case 1634:
        v4 = (const void *)PHQueryForAssetInAlbumKind_AllLibraryDuplicatesAlbum;
        break;
      case 1635:
        v4 = (const void *)PHQueryForAssetInAlbumKind_NotUploadedAlbum_DEPRECATED;
        break;
      case 1636:
        v4 = (const void *)PHQueryForAssetInAlbumKind_SharedLibrarySharingSuggestionsAlbum;
        break;
      case 1637:
        v4 = (const void *)PHQueryForAssetInAlbumKind_ActionCamVideoAlbum;
        break;
      case 1639:
        v4 = (const void *)PHQueryForAssetInAlbumKind_SpatialAlbum;
        break;
      case 1640:
        v4 = (const void *)PHQueryForAssetInAlbumKind_RecentlySavedAlbum;
        break;
      case 1641:
        v4 = (const void *)PHQueryForAssetInAlbumKind_RecoveredAlbum;
        break;
      default:
        if (a3 != 3571)
          goto LABEL_90;
        v4 = (const void *)PHQueryForAssetInAlbumKind_SyncProgressAlbum;
        break;
    }
  }
  v3 = _Block_copy(v4);
LABEL_90:
  if (v3)
    v8 = v3;
  else
    v8 = (const void *)PHQueryForAssetsInOtherSmartAlbum;
  v9 = _Block_copy(v8);

  v10 = _Block_copy(v9);
  return v10;
}

- (NSPredicate)basePredicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 16, 1);
}

+ (id)_transformedSortDescriptors:(id)a3 forFetchType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  objc_class *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  objc_class *v13;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v8 = +[PHPhotoLibrary classForFetchType:](PHPhotoLibrary, "classForFetchType:", v5);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__PHQuery__transformedSortDescriptors_forFetchType___block_invoke;
  v11[3] = &unk_1E35DC4A8;
  v13 = v8;
  v9 = v7;
  v12 = v9;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);

  return v9;
}

+ (id)queryForPreviewLibraryScopeWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_setLibraryScopeDefaultSortDescriptor:", v6);
  objc_msgSend(MEMORY[0x1E0D71808], "predicateForPreviewLibraryScope");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHLibraryScope"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setFetchOptions:", v6);
  return v9;
}

- (id)executeQuery
{
  void (**identificationBlock)(id, _QWORD *);
  PHFetchResult *v4;
  PHFetchResult *v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  _QWORD v10[5];

  identificationBlock = (void (**)(id, _QWORD *))self->_identificationBlock;
  if (identificationBlock)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __23__PHQuery_executeQuery__block_invoke;
    v10[3] = &unk_1E35DC518;
    v10[4] = self;
    identificationBlock[2](identificationBlock, v10);
    v4 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = -[PHFetchResult initWithQuery:]([PHFetchResult alloc], "initWithQuery:", self);
  }
  v5 = v4;
  if (MEMORY[0x19AEBEEFC]())
  {
    -[PHFetchResult query](v5, "query");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchType");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v7 == CFSTR("PHAsset"))
    {
      v8 = -[PHFetchResult count](v5, "count");

      if (v8)
        plslogGreenTeaReadingPhotosOrVideos();
    }
    else
    {

    }
  }
  +[PHQuery photoLibraryWasAccessed](PHQuery, "photoLibraryWasAccessed");
  return v5;
}

PHFetchResult *__23__PHQuery_executeQuery__block_invoke(uint64_t a1)
{
  return -[PHFetchResult initWithQuery:]([PHFetchResult alloc], "initWithQuery:", *(_QWORD *)(a1 + 32));
}

- (NSArray)seedOIDs
{
  return (NSArray *)objc_getProperty(self, a2, 256, 1);
}

+ (id)queryForAssetCollectionsWithType:(int64_t)a3 subtype:(int64_t)a4 options:(id)a5
{
  id v7;
  void *v8;
  _UNKNOWN **v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  int v14;
  int64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  _UNKNOWN **v31;
  void *v32;
  void *v33;
  id v34;
  const __CFString **v35;
  int v36;
  void *v37;
  void *v38;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint8_t buf[8];
  __int16 v59;
  int v60;
  const __CFString *v61;
  const __CFString *v62;
  _QWORD v63[2];

  v63[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  _fetchTypeForAssetCollectionTypeAndSubtype(a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = &off_1E35D2000;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v11 = v7;
    v12 = dyld_program_sdk_at_least();
    v13 = 0;
    if (a4)
      v14 = 1;
    else
      v14 = v12;
    if (v14)
      v15 = a4;
    else
      v15 = 0x7FFFFFFFFFFFFFFFLL;
    switch(a3)
    {
      case 1:
        if (v15 <= 99)
        {
          switch(v15)
          {
            case 2:
              goto LABEL_68;
            case 3:
              v27 = (void *)MEMORY[0x1E0CB3880];
              v28 = 1551;
              goto LABEL_80;
            case 4:
              v27 = (void *)MEMORY[0x1E0CB3880];
              v28 = 15;
              goto LABEL_80;
            case 5:
              v27 = (void *)MEMORY[0x1E0CB3880];
              v28 = 1550;
              goto LABEL_80;
            case 6:
              v27 = (void *)MEMORY[0x1E0CB3880];
              v28 = 12;
              goto LABEL_80;
            default:
              goto LABEL_82;
          }
        }
        if (v15 <= 1000000000)
        {
          if (v15 == 100)
          {
            v27 = (void *)MEMORY[0x1E0CB3880];
            v28 = 1500;
          }
          else
          {
            if (v15 != 101)
              goto LABEL_82;
            v27 = (void *)MEMORY[0x1E0CB3880];
            v28 = 1505;
          }
        }
        else
        {
          switch(v15)
          {
            case 0x3B9ACA01:
              v27 = (void *)MEMORY[0x1E0CB3880];
              v28 = 1000;
              break;
            case 0x3B9ACC59:
              v27 = (void *)MEMORY[0x1E0CB3880];
              v28 = 1510;
              break;
            case 0x7FFFFFFFFFFFFFFFLL:
              goto LABEL_113;
            default:
LABEL_82:
              PLPhotoKitGetLog();
              v43 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = 1;
                v59 = 1024;
                v60 = v15;
                _os_log_impl(&dword_1991EC000, v43, OS_LOG_TYPE_ERROR, "Unsupported fetch for asset collections with type %d and subtype %d", buf, 0xEu);
              }

              if (!dyld_program_sdk_at_least())
                goto LABEL_113;
LABEL_118:
              v16 = (void *)MEMORY[0x1E0CB3880];
              v17 = 0;
LABEL_10:
              objc_msgSend(v16, "predicateWithValue:", v17);
              v18 = objc_claimAutoreleasedReturnValue();
LABEL_11:
              v13 = (void *)v18;
LABEL_12:

              +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", v8, v13, v10);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              +[PHQuery identificationBlockForAssetCollectionType:](PHQuery, "identificationBlockForAssetCollectionType:", a3);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (a3 == 1 && a4 == 1000000001)
              {
                objc_msgSend(v19, "_setIncludesCameraRoll:", 1);
LABEL_38:
                v26 = 0;
                goto LABEL_39;
              }
              switch(a3)
              {
                case 9:
                  v23 = (void *)MEMORY[0x1E0CB3928];
                  v24 = CFSTR("startDate");
                  break;
                case 2:
                  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
                    goto LABEL_38;
                  v23 = (void *)MEMORY[0x1E0CB3928];
                  v24 = CFSTR("parentFolder");
                  break;
                case 1:
                  if ((unint64_t)(a4 - 3) >= 2)
                  {
                    if (a4 != 101)
                      goto LABEL_38;
                    v23 = (void *)MEMORY[0x1E0CB3928];
                    v24 = CFSTR("cloudLastInterestingChangeDate");
                    v25 = 0;
LABEL_27:
                    objc_msgSend(v23, "sortDescriptorWithKey:ascending:", v24, v25);
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_39:
                    if ((objc_msgSend(v11, "hasAnySortDescriptors") & 1) == 0 && v26)
                    {
                      objc_msgSend(v9[368], "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v11, v10);
                      v31 = v9;
                      v32 = (void *)objc_claimAutoreleasedReturnValue();

                      v57 = v26;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v32, "setInternalSortDescriptors:", v33);

                      v11 = v32;
                      v9 = v31;
                    }
                    v34 = v11;
                    v7 = v34;
                    if (a3 != 6)
                    {
                      if (a3 == 2 && a4 == 219)
                      {
                        *(_QWORD *)buf = CFSTR("PHAssetPropertySetSpatialMedia");
                        v35 = (const __CFString **)buf;
                        goto LABEL_53;
                      }
LABEL_50:

LABEL_55:
                      objc_msgSend(v19, "setFetchOptions:", v7);

                      goto LABEL_56;
                    }
                    v36 = objc_msgSend(v34, "sharingFilter");
                    if (v36 == 2)
                    {
                      v61 = CFSTR("PHPhotosHighlightPropertySetPrivateOrShared");
                      v35 = &v61;
                    }
                    else if (v36 == 1)
                    {
                      v62 = CFSTR("PHPhotosHighlightPropertySetOnlyShared");
                      v35 = &v62;
                    }
                    else
                    {
                      if (v36)
                        goto LABEL_50;
                      v63[0] = CFSTR("PHPhotosHighlightPropertySetOnlyPrivate");
                      v35 = (const __CFString **)v63;
                    }
LABEL_53:
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
                    v37 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v37)
                    {
                      objc_msgSend(v9[368], "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v7, v10);
                      v38 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v38, "addFetchPropertySets:", v37);
                      v7 = v38;
                    }
                    goto LABEL_55;
                  }
                  v23 = (void *)MEMORY[0x1E0CB3928];
                  v24 = CFSTR("syncEventOrderKey");
                  break;
                default:
                  goto LABEL_38;
              }
              v25 = 1;
              goto LABEL_27;
          }
        }
LABEL_80:
        objc_msgSend(v27, "predicateWithFormat:", CFSTR("kind = %d"), v28);
LABEL_81:
        v18 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 2:
        +[PHSmartAlbum albumKindFromSmartAlbumSubtype:](PHSmartAlbum, "albumKindFromSmartAlbumSubtype:", v15);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "integerValue");

        if ((unint64_t)(v15 - 200) >= 0x14)
        {
          switch(v15)
          {
            case 1000000201:
              v40 = (void *)MEMORY[0x1E0CB3880];
              v41 = 1612;
              goto LABEL_91;
            case 1000000202:
            case 1000000208:
            case 1000000209:
            case 1000000210:
            case 1000000213:
            case 1000000216:
            case 1000000217:
              goto LABEL_110;
            case 1000000203:
              if (objc_msgSend(v11, "includePlacesSmartAlbum"))
              {
                v40 = (void *)MEMORY[0x1E0CB3880];
                v41 = 1619;
LABEL_91:
                objc_msgSend(v40, "predicateWithFormat:", CFSTR("kind = %d"), v41);
                goto LABEL_33;
              }
              PLPhotoKitGetLog();
              v45 = objc_claimAutoreleasedReturnValue();
              v9 = &off_1E35D2000;
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = 2;
                v59 = 1024;
                v60 = 1000000203;
LABEL_116:
                _os_log_impl(&dword_1991EC000, v45, OS_LOG_TYPE_ERROR, "Unsupported fetch for asset collections with type %d and subtype %d", buf, 0xEu);
              }
LABEL_117:

              goto LABEL_118;
            case 1000000204:
            case 1000000212:
            case 1000000218:
            case 1000000219:
              goto LABEL_32;
            case 1000000205:
              if (objc_msgSend(v11, "includeAllPhotosSmartAlbum"))
                goto LABEL_32;
              PLPhotoKitGetLog();
              v45 = objc_claimAutoreleasedReturnValue();
              v9 = &off_1E35D2000;
              if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                goto LABEL_117;
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = 2;
              v59 = 1024;
              v60 = 1000000205;
              goto LABEL_116;
            case 1000000206:
              if (objc_msgSend(v11, "includeRecentlyEditedSmartAlbum"))
                goto LABEL_32;
              PLPhotoKitGetLog();
              v45 = objc_claimAutoreleasedReturnValue();
              v9 = &off_1E35D2000;
              if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                goto LABEL_117;
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = 2;
              v59 = 1024;
              v60 = 1000000206;
              goto LABEL_116;
            case 1000000207:
              if (objc_msgSend(v11, "includeScreenRecordingsSmartAlbum"))
                goto LABEL_32;
              PLPhotoKitGetLog();
              v45 = objc_claimAutoreleasedReturnValue();
              v9 = &off_1E35D2000;
              if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                goto LABEL_117;
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = 2;
              v59 = 1024;
              v60 = 1000000207;
              goto LABEL_116;
            case 1000000211:
              if (objc_msgSend(v11, "includeProResSmartAlbum"))
                goto LABEL_32;
              PLPhotoKitGetLog();
              v45 = objc_claimAutoreleasedReturnValue();
              v9 = &off_1E35D2000;
              if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                goto LABEL_117;
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = 2;
              v59 = 1024;
              v60 = 1000000211;
              goto LABEL_116;
            case 1000000214:
              if (objc_msgSend(v11, "includeSharedLibrarySharingSuggestionsSmartAlbum"))
                goto LABEL_32;
              PLPhotoKitGetLog();
              v45 = objc_claimAutoreleasedReturnValue();
              v9 = &off_1E35D2000;
              if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                goto LABEL_117;
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = 2;
              v59 = 1024;
              v60 = 1000000214;
              goto LABEL_116;
            case 1000000215:
              if (objc_msgSend(v11, "includeActionCamVideoSmartAlbum"))
                goto LABEL_32;
              PLPhotoKitGetLog();
              v45 = objc_claimAutoreleasedReturnValue();
              v9 = &off_1E35D2000;
              if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                goto LABEL_117;
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = 2;
              v59 = 1024;
              v60 = 1000000215;
              goto LABEL_116;
            default:
              if (v15 == 0x7FFFFFFFFFFFFFFFLL)
              {
                if (_os_feature_enabled_impl())
                {
                  objc_msgSend(&unk_1E3657498, "arrayByAddingObject:", &unk_1E3655F90);
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v44 = &unk_1E3657498;
                }
                v9 = &off_1E35D2000;
                if (objc_msgSend(v11, "includePlacesSmartAlbum"))
                {
                  objc_msgSend(v44, "arrayByAddingObject:", &unk_1E3655CD8);
                  v47 = objc_claimAutoreleasedReturnValue();

                  v44 = (void *)v47;
                }
                if (objc_msgSend(v11, "includeUserSmartAlbums"))
                {
                  objc_msgSend(v44, "arrayByAddingObject:", &unk_1E3655CF0);
                  v48 = objc_claimAutoreleasedReturnValue();

                  v44 = (void *)v48;
                }
                if (objc_msgSend(v11, "includeRecentlyEditedSmartAlbum"))
                {
                  objc_msgSend(v44, "arrayByAddingObject:", &unk_1E3655D08);
                  v49 = objc_claimAutoreleasedReturnValue();

                  v44 = (void *)v49;
                }
                if (objc_msgSend(v11, "includeScreenRecordingsSmartAlbum"))
                {
                  objc_msgSend(v44, "arrayByAddingObject:", &unk_1E3655D20);
                  v50 = objc_claimAutoreleasedReturnValue();

                  v44 = (void *)v50;
                }
                if (objc_msgSend(v11, "includeSharedLibrarySharingSuggestionsSmartAlbum"))
                {
                  objc_msgSend(v44, "arrayByAddingObject:", &unk_1E3655D38);
                  v51 = objc_claimAutoreleasedReturnValue();

                  v44 = (void *)v51;
                }
                if (objc_msgSend(v11, "includeActionCamVideoSmartAlbum"))
                {
                  objc_msgSend(v44, "arrayByAddingObject:", &unk_1E3655D68);
                  v52 = objc_claimAutoreleasedReturnValue();

                  v44 = (void *)v52;
                }
                if (objc_msgSend(v11, "includeProResSmartAlbum"))
                {
                  objc_msgSend(v44, "arrayByAddingObject:", &unk_1E3655D80);
                  v53 = objc_claimAutoreleasedReturnValue();

                  v44 = (void *)v53;
                }
                if (objc_msgSend(v11, "includeAllPhotosSmartAlbum"))
                {
                  objc_msgSend(v44, "arrayByAddingObject:", &unk_1E3655D50);
                  v54 = objc_claimAutoreleasedReturnValue();

                  v44 = (void *)v54;
                }
                if (objc_msgSend(v11, "includeTrashBinAlbum"))
                {
                  objc_msgSend(v44, "arrayByAddingObject:", &unk_1E3655FA8);
                  v55 = objc_claimAutoreleasedReturnValue();

                  v44 = (void *)v55;
                }
                if (objc_msgSend(v11, "includeDuplicatesAlbums"))
                {
                  objc_msgSend(v44, "arrayByAddingObject:", &unk_1E3655D98);
                  v56 = objc_claimAutoreleasedReturnValue();

                  v44 = (void *)v56;
                }
                objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind IN %@"), v44);
                v13 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_12;
              }
LABEL_110:
              PLPhotoKitGetLog();
              v46 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = 2;
                v59 = 1024;
                v60 = v15;
                _os_log_impl(&dword_1991EC000, v46, OS_LOG_TYPE_ERROR, "Unsupported fetch for asset collections with type %d and subtype %d", buf, 0xEu);
              }

              v9 = &off_1E35D2000;
              if (dyld_program_sdk_at_least())
                goto LABEL_118;
              break;
          }
LABEL_113:
          v13 = 0;
        }
        else
        {
LABEL_32:
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind = %d"), v30);
LABEL_33:
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = &off_1E35D2000;
        }
        goto LABEL_12;
      case 3:
      case 4:
      case 7:
      case 8:
      case 9:
      case 10:
LABEL_9:
        v16 = (void *)MEMORY[0x1E0CB3880];
        v17 = 1;
        goto LABEL_10;
      case 6:
        switch(v15)
        {
          case 1000000301:
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind = %d"), 0);
            goto LABEL_81;
          case 1000000302:
            v27 = (void *)MEMORY[0x1E0CB3880];
            v28 = 1;
            goto LABEL_80;
          case 1000000303:
LABEL_68:
            v27 = (void *)MEMORY[0x1E0CB3880];
            v28 = 2;
            goto LABEL_80;
          case 1000000304:
            v27 = (void *)MEMORY[0x1E0CB3880];
            v28 = 3;
            goto LABEL_80;
          default:
            if (v15 == 0x7FFFFFFFFFFFFFFFLL)
              goto LABEL_9;
            PLPhotoKitGetLog();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = 6;
              v59 = 1024;
              v60 = v15;
              _os_log_impl(&dword_1991EC000, v42, OS_LOG_TYPE_ERROR, "Unsupported fetch for asset collections with type %d and subtype %d", buf, 0xEu);
            }

            break;
        }
        goto LABEL_118;
      default:
        goto LABEL_12;
    }
  }
  PLPhotoKitGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = a3;
    v59 = 1024;
    v60 = a4;
    _os_log_impl(&dword_1991EC000, v21, OS_LOG_TYPE_ERROR, "Unsupported fetch for asset collections with type %d and subtype %d (no fetch type)", buf, 0xEu);
  }

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAssetCollection"), v22, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = _Block_copy((const void *)PHQueryForAssetCollectionType_NoFetchType);
LABEL_56:
  objc_msgSend(v19, "_setIdentificationBlock:", v20);

  return v19;
}

+ (id)identificationBlockForAssetCollectionType:(int64_t)a3
{
  void *v3;
  const void *v4;
  void *v5;
  void *v6;

  if ((unint64_t)a3 > 0xB)
    v3 = 0;
  else
    v3 = _Block_copy(*off_1E35DD4F0[a3]);
  if (v3)
    v4 = v3;
  else
    v4 = (const void *)PHQueryForAssetCollectionType_Other;
  v5 = _Block_copy(v4);

  v6 = _Block_copy(v5);
  return v6;
}

+ (id)queryForActiveLibraryScopeWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_setLibraryScopeDefaultSortDescriptor:", v6);
  v7 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0D71808], "predicateForActiveLibraryScope");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d || %K == %d"), CFSTR("status"), 1, CFSTR("status"), 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHLibraryScope"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setFetchOptions:", v6);
  return v13;
}

+ (void)_setLibraryScopeDefaultSortDescriptor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "hasAnySortDescriptors") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setSortDescriptors:", v5);
  }

}

+ (id)queryForKeyAssetInPhotosHighlight:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v7 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "assetCollectionType") != 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHQuery.m"), 1694, CFSTR("Expected input collection to be a PhotosHighlight"));

  }
  +[PHPhotosHighlight keyAssetInverseRelationshipPredicateForHighlight:forHighlightFilter:](PHPhotosHighlight, "keyAssetInverseRelationshipPredicateForHighlight:forHighlightFilter:", v8, objc_msgSend(v7, "sharingFilter"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_fetchOptionsForFetchingAssetsFromAssetCollection:options:changeDetectionCriteria:", v8, v7, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setSortDescriptors:", 0);
  objc_msgSend(v12, "setInternalSortDescriptors:", 0);
  objc_msgSend(v11, "_setContainerCollection:", v8);

  objc_msgSend(v11, "setFetchOptions:", v12);
  return v11;
}

- (id)_globalPredicatesForPHClass:(Class)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  PHCollection *v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  int v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  _BOOL8 v72;
  BOOL v73;
  char v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  id *v79;
  uint64_t v80;
  void *v81;
  int64_t v82;
  void *v83;
  void *v84;
  int v85;
  void *v86;
  id v87;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  _QWORD v92[2];

  v92[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHQuery fetchOptions](self, "fetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "includeTrashedAssets");
  if (-[objc_class managedObjectSupportsTrashedState](a3, "managedObjectSupportsTrashedState")
    && (v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D71880], "predicateToExcludeTrashedAssets");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

  }
  v9 = objc_msgSend(v6, "includeHiddenAssets");
  if (-[objc_class managedObjectSupportsHiddenState](a3, "managedObjectSupportsHiddenState")
    && (v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D71880], "predicateToExcludeHiddenAssets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v10);

  }
  v11 = objc_msgSend(v6, "includeTrashedShares");
  if (-[objc_class managedObjectSupportsShareTrashedState](a3, "managedObjectSupportsShareTrashedState")
    && (v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D71B00], "predicateToExcludeTrashedShares");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v12);

  }
  v13 = objc_msgSend(v6, "includeExpiredShares");
  if (-[objc_class managedObjectSupportsShareExpiredState](a3, "managedObjectSupportsShareExpiredState")
    && (v13 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D71B00], "predicateToExcludeExpiredShares");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v14);

  }
  v15 = objc_msgSend(v6, "includeExitingShares");
  if (-[objc_class managedObjectSupportsShareExitingState](a3, "managedObjectSupportsShareExitingState")
    && (v15 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D71808], "predicateToExcludeExitingLibraryScopes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v16);

  }
  v17 = objc_msgSend(v6, "includeOnlyAssetsAllowedForAnalysis");
  if (-[objc_class managedObjectSupportsAllowedForAnalysis](a3, "managedObjectSupportsAllowedForAnalysis")&& v17)
  {
    objc_msgSend(MEMORY[0x1E0D71880], "predicateToIncludeOnlyAllowedForAnalysisAssets");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v18);

  }
  v19 = objc_msgSend(v6, "includeOnlyContentContributedByCurrentUser");
  v20 = objc_msgSend(v6, "includeBothPrivateAssetsAndSharedContentContributedByCurrentUser");
  if (-[objc_class managedObjectSupportsContributor](a3, "managedObjectSupportsContributor"))
  {
    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0D71880], "predicateToIncludeOnlyContentContributedByCurrentUser");
      v21 = objc_claimAutoreleasedReturnValue();
LABEL_36:
      v27 = (void *)v21;
      objc_msgSend(v5, "addObject:", v21);

      goto LABEL_37;
    }
    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0D71880], "predicateToIncludeBothPrivateAssetsAndSharedContentContributedByCurrentUser");
      v21 = objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    }
    v22 = objc_msgSend(v6, "useNoIndexOnSharingFilter");
    if (objc_msgSend(v6, "sharingFilter") != 2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = self->_containerCollection;
        if (-[PHCollection assetCollectionType](v23, "assetCollectionType") == 2)
        {
          if (-[PHCollection assetCollectionSubtype](v23, "assetCollectionSubtype") == 209)
            v22 = 1;
          else
            v22 = v22;
        }

      }
    }
    v24 = objc_msgSend(v6, "sharingFilter");
    if (v24 == 1)
    {
      v25 = (void *)MEMORY[0x1E0D71880];
      v26 = 1;
      goto LABEL_35;
    }
    if (!v24)
    {
      v25 = (void *)MEMORY[0x1E0D71880];
      v26 = 0;
LABEL_35:
      objc_msgSend(v25, "predicateForAssetSharingFilter:noindex:", v26, v22);
      v21 = objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    }
  }
LABEL_37:
  if (-[objc_class managedObjectSupportsVisibilityState](a3, "managedObjectSupportsVisibilityState"))
  {
    if ((objc_msgSend(v6, "includeDuplicateAssets") & 1) == 0)
    {
      -[PHQuery photoLibrary](self, "photoLibrary");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isCloudPhotoLibraryEnabled");

      if ((v29 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(visibilityState) = %d"), 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)MEMORY[0x1E0CB3528];
        v92[0] = v30;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D73310], "subpredicatesForExcludeMask:", objc_msgSend(MEMORY[0x1E0D73310], "maskForPhotoStreamAsset"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "arrayByAddingObjectsFromArray:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "orPredicateWithSubpredicates:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addObject:", v35);
      }
    }
  }
  if (-[objc_class managedObjectSupportsDuplicateVisibilityState](a3, "managedObjectSupportsDuplicateVisibilityState")&& objc_msgSend(v6, "excludeDuplicateAssetVisibilityStateHidden"))
  {
    objc_msgSend(MEMORY[0x1E0D71880], "predicateToExcludeDuplicateAssetVisibilityStateHidden");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v36);

  }
  if (-[objc_class managedObjectSupportsDuplicateVisibilityState](a3, "managedObjectSupportsDuplicateVisibilityState")&& objc_msgSend(v6, "includeDuplicateAssetVisibilityStateMostRelevant"))
  {
    objc_msgSend(MEMORY[0x1E0D71880], "predicateToIncludeDuplicateAssetVisibilityStateMostRelevant");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v37);

  }
  if (-[objc_class managedObjectSupportsAssetStacks](a3, "managedObjectSupportsAssetStacks")
    && objc_msgSend(v6, "excludeNonVisibleStackedAssets"))
  {
    objc_msgSend(MEMORY[0x1E0D71880], "predicateToExcludeNonVisibleStackedAssets");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v38);

  }
  if (-[objc_class managedObjectSupportsPendingState](a3, "managedObjectSupportsPendingState")
    && (objc_msgSend(v6, "includePendingMemories") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(pendingState) != %d"), 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v39);

  }
  if (-[objc_class managedObjectSupportsPendingState](a3, "managedObjectSupportsPendingState")
    && (objc_msgSend(v6, "includeLocalMemories") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(pendingState) != %d"), 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v40);

  }
  if (-[objc_class managedObjectSupportsCreationType](a3, "managedObjectSupportsCreationType")
    && (objc_msgSend(v6, "includeStoryMemories") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(creationType) != %d"), 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v41);

  }
  if (-[objc_class managedObjectSupportsPendingState](a3, "managedObjectSupportsPendingState")
    && (objc_msgSend(v6, "includeSourceMemories") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(%K) == nil"), CFSTR("targetUserEditedMemory"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v42);

  }
  if (-[objc_class managedObjectSupportsRejectedState](a3, "managedObjectSupportsRejectedState")
    && (objc_msgSend(v6, "includeRejectedMemories") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(rejected) == NO"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v43);

  }
  if (-[objc_class managedObjectSupportsPersonFilters](a3, "managedObjectSupportsPersonFilters"))
  {
    +[PHQueryPersonContext subpredicatesForFetchOptions:](PHQueryPersonContext, "subpredicatesForFetchOptions:", v6);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v44);

  }
  if (-[objc_class managedObjectSupportsKeyFaces](a3, "managedObjectSupportsKeyFaces")
    && objc_msgSend(v6, "includeOnlyPersonsWithVisibleKeyFaces"))
  {
    objc_msgSend(MEMORY[0x1E0D71940], "predicateForVisibleKeyFace");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v45);

  }
  if (-[objc_class managedObjectSupportsMontage](a3, "managedObjectSupportsMontage")
    && objc_msgSend(v6, "excludeMontageAssets"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(additionalAttributes.montage) == nil"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v46);

  }
  if (-[objc_class managedObjectSupportsScreenshot](a3, "managedObjectSupportsScreenshot")
    && objc_msgSend(v6, "excludeScreenshotAssets"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(%K) == NO"), CFSTR("isDetectedScreenshot"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v47);

  }
  if (-[objc_class managedObjectSupportsBursts](a3, "managedObjectSupportsBursts")
    && (objc_msgSend(v6, "includeAllBurstAssets") & 1) == 0)
  {
    -[PHQuery containerIdentifier](self, "containerIdentifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v48)
      goto LABEL_81;
    v49 = (void *)objc_opt_class();
    objc_msgSend(v48, "entity");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v49) = objc_msgSend(v49, "_isKindOfMomentOrAlbumEntity:", v50);

    if (!(_DWORD)v49)
      goto LABEL_81;
    -[PHQuery containerRelationship](self, "containerRelationship");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "inverseRelationship");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v52, "name");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "isEqualToString:", CFSTR("assets"));

    if ((v54 & 1) == 0)
    {
LABEL_81:
      objc_msgSend(MEMORY[0x1E0D71880], "predicateToExcludeNonvisibleBurstAssets");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v55);

    }
  }
  v56 = -[objc_class managedObjectSupportsFaceState](a3, "managedObjectSupportsFaceState");
  if (v6 && v56 && (objc_msgSend(v6, "includeNonvisibleFaces") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D716C8], "predicatesToExcludeNonVisibleFaces");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v57);

  }
  if (-[objc_class managedObjectSupportsFaceState](a3, "managedObjectSupportsFaceState")
    && objc_msgSend(v6, "includeOnlyFacesNeedingFaceCrop"))
  {
    objc_msgSend(MEMORY[0x1E0D716C8], "predicatesForFacesNeedingFaceCropGeneration");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v58);

  }
  if (-[objc_class managedObjectSupportsFaceState](a3, "managedObjectSupportsFaceState")
    && objc_msgSend(v6, "includeOnlyFacesWithFaceprints"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(faceprint) != nil"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v59);

  }
  if (-[objc_class managedObjectSupportsFaceState](a3, "managedObjectSupportsFaceState")
    && objc_msgSend(v6, "includeOnlyFacesInFaceGroups"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(faceGroup) != nil"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v60);

  }
  if (-[objc_class managedObjectSupportsSavedAssetType](a3, "managedObjectSupportsSavedAssetType"))
  {
    -[PHQuery photoLibrary](self, "photoLibrary");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "isCloudPhotoLibraryEnabled");

    if (v62)
    {
      objc_msgSend(MEMORY[0x1E0D73310], "subpredicatesForExcludeMask:", objc_msgSend(MEMORY[0x1E0D73310], "maskForPhotoStreamAsset"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v63);

    }
  }
  if (-[objc_class managedObjectSupportsAdjustments](a3, "managedObjectSupportsAdjustments")
    && objc_msgSend(v6, "includeRecentlyEditedSmartAlbum"))
  {
    objc_msgSend(MEMORY[0x1E0D71880], "predicateToExcludeCameraAutoAdjustments");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v64);

  }
  if (_globalPredicatesForPHClass__onceToken != -1)
    dispatch_once(&_globalPredicatesForPHClass__onceToken, &__block_literal_global_105);
  objc_msgSend(v6, "photoLibrary");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v65, "type");

  if (v66)
  {
    objc_msgSend(v6, "photoLibrary");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "type");

    if (v68 == 1)
    {
      v69 = objc_msgSend(v6, "includePlaceholderAssets");
      if (-[objc_class managedObjectSupportsSavedAssetType](a3, "managedObjectSupportsSavedAssetType"))
      {
        LOWORD(v91) = 257;
        HIDWORD(v89) = 16843009;
        BYTE3(v89) = v69 ^ 1;
        BYTE2(v89) = 0;
        LOWORD(v89) = 257;
        v70 = objc_msgSend(MEMORY[0x1E0D73310], "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 1, 1, 1, 1, v89, v91);
LABEL_125:
        objc_msgSend(MEMORY[0x1E0D73310], "subpredicatesForExcludeMask:", v70);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v75);

      }
    }
  }
  else if (-[objc_class managedObjectSupportsSavedAssetType](a3, "managedObjectSupportsSavedAssetType")
         && !_globalPredicatesForPHClass__linkedOnOrBefore8_0)
  {
    if (v6)
      v71 = objc_msgSend(v6, "includeAssetSourceTypes");
    else
      v71 = 0;
    v72 = (v71 & 2) == 0 && v71 != 0;
    v73 = (v71 & 4) == 0 && v71 != 0;
    if (v6)
      v74 = objc_msgSend(v6, "includeGuestAssets") ^ 1;
    else
      v74 = 1;
    BYTE1(v91) = v73;
    LOBYTE(v91) = 1;
    HIBYTE(v90) = (v71 & 0x40) == 0;
    BYTE6(v90) = v74;
    BYTE5(v90) = (v71 & 0x10) == 0;
    BYTE4(v90) = 0;
    LODWORD(v90) = 16842752;
    v70 = objc_msgSend(MEMORY[0x1E0D73310], "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, v72, 0, v90, v91);
    if (v71 && (v71 & 1) == 0)
      v70 = objc_msgSend(MEMORY[0x1E0D73310], "maskForUserLibrary") | v70;
    goto LABEL_125;
  }
  if (!-[objc_class managedObjectSupportsDetectionType](a3, "managedObjectSupportsDetectionType"))
    goto LABEL_137;
  objc_msgSend(v6, "includedDetectionTypes");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v76;
  if (v76)
  {
    v78 = v76;
  }
  else
  {
    +[PHFetchOptions defaultDetectionTypes](PHFetchOptions, "defaultDetectionTypes");
    v78 = (id)objc_claimAutoreleasedReturnValue();

  }
  if ((Class)objc_opt_class() == a3)
  {
    v79 = (id *)0x1E0D716C8;
LABEL_134:
    objc_msgSend(*v79, "predicateForIncludedDetectionTypes:", v78);
    v80 = objc_claimAutoreleasedReturnValue();
    if (v80)
    {
      v81 = (void *)v80;
      objc_msgSend(v5, "addObject:", v80);

    }
    goto LABEL_136;
  }
  if ((Class)objc_opt_class() == a3)
  {
    v79 = (id *)0x1E0D71940;
    goto LABEL_134;
  }
LABEL_136:

LABEL_137:
  if (-[objc_class managedObjectSupportsBodyDetection](a3, "managedObjectSupportsBodyDetection"))
  {
    v82 = +[PHFace faceFetchTypeForOptions:](PHFace, "faceFetchTypeForOptions:", v6);
    objc_msgSend(MEMORY[0x1E0D716C8], "predicateForFetchType:", v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_pl_addNonNilObject:", v83);

  }
  if (-[objc_class managedObjectSupportsTorsoOnly](a3, "managedObjectSupportsTorsoOnly")
    && (!v6 || (objc_msgSend(v6, "includeTorsoOnlyPerson") & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0D71940], "predicateToExcludeTorsoOnlyPerson");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v84);

  }
  v85 = -[objc_class managedObjectSupportsSharingComposition](a3, "managedObjectSupportsSharingComposition");
  if (v6 && v85 && objc_msgSend(v6, "sharingFilter") != 2)
  {
    -[objc_class fetchPredicateForSharingFilter:](a3, "fetchPredicateForSharingFilter:", objc_msgSend(v6, "sharingFilter"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    if (v86)
      objc_msgSend(v5, "addObject:", v86);

  }
  v87 = v5;

  return v87;
}

void __52__PHQuery__transformedSortDescriptors_forFetchType___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v14 = a2;
  objc_msgSend(v14, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "entityKeyForPropertyKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v15 = CFSTR("sortDescriptor");
    v16[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v14, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Unsupported sort descriptor in fetch options: %@"), v11);
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v12, v9);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v13);
  }
  v7 = v6;
  if ((objc_msgSend(v6, "isEqualToString:", v5) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v7, objc_msgSend(v14, "ascending"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "replaceObjectAtIndex:withObject:", a3, v8);

  }
}

uint64_t __39__PHQuery__globalPredicatesForPHClass___block_invoke()
{
  uint64_t result;

  result = dyld_get_program_sdk_version();
  _globalPredicatesForPHClass__linkedOnOrBefore8_0 = result <= 0x80000;
  return result;
}

+ (id)queryForPendingLibraryScopeInvitationWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_setLibraryScopeDefaultSortDescriptor:", v6);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@ && %K == %d && %K == %d && %K == %d"), CFSTR("scopeType"), &unk_1E3655CC0, CFSTR("status"), 2, CFSTR("localPublishState"), 2, CFSTR("previewState"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHLibraryScope"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setFetchOptions:", v6);
  return v9;
}

+ (id)_filterPredicateFromFetchOptionsPredicate:(id)a3 options:(id)a4 phClass:(Class)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  const __CFString *v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v8;
    v11 = (void *)objc_opt_new();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v25 = v10;
    objc_msgSend(v10, "subpredicates");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(a1, "_filterPredicateFromFetchOptionsPredicate:options:phClass:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i), v9, a5);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v14);
    }

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", objc_msgSend(v25, "compoundPredicateType"), v11);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_14;
    -[objc_class fetchPredicateFromComparisonPredicate:options:](a5, "fetchPredicateFromComparisonPredicate:options:", v8, v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!v18)
  {
LABEL_14:
    v30 = CFSTR("predicate");
    v31 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "predicateFormat");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("Unsupported predicate in fetch options: %@"), v22);
    v23 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v23, v20);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }

  return v18;
}

- (id)updatedQueryWithChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  PHQuery *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  PHQueryChangeDetectionCriteria *v25;
  void *v26;
  void *v28;
  void *v29;

  v4 = a3;
  v5 = v4;
  if (!self->_containerCollection)
    goto LABEL_14;
  objc_msgSend(v4, "changeDetailsForObject:");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "objectAfterChanges");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!(v6 | v7))
  {
    -[PHQuery fetchOptions](self, "fetchOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "changeDetectionCriteria");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHQuery photoLibrary](self, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "managedObjectContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v5, "intersectsWithDetectionCriteria:managedObjectContext:", v9, v11);

    if (!v12)
    {
LABEL_13:

LABEL_14:
      v13 = self;
      goto LABEL_15;
    }
    v7 = self->_containerCollection;
  }
  if (!v7)
    goto LABEL_13;
  v13 = (PHQuery *)-[PHQuery copy](self, "copy");
  -[PHQuery _setContainerCollection:](v13, "_setContainerCollection:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = (void *)v7;
  else
    v14 = 0;
  v15 = v14;
  if (objc_msgSend(v15, "plAlbumKind") == 1507)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0D71A30]);
    v28 = (void *)MEMORY[0x1E0D71A38];
    v29 = v16;
    objc_msgSend(v15, "userQuery");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "photoLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "photoLibrary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "predicateForQuery:inLibrary:changeDetectionCriteria:", v17, v19, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHQuery _setBasePredicate:](v13, "_setBasePredicate:", v20);

    v21 = (void *)MEMORY[0x1E0D71A38];
    objc_msgSend(v15, "userQuery");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "includesHiddenAssetsInQuery:", v22);

    -[PHQuery fetchOptions](v13, "fetchOptions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setIncludeHiddenAssets:", v23);

    v25 = -[PHQueryChangeDetectionCriteria initWithPLQueryChangeDetectionCriteria:]([PHQueryChangeDetectionCriteria alloc], "initWithPLQueryChangeDetectionCriteria:", v29);
    -[PHQuery fetchOptions](v13, "fetchOptions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setChangeDetectionCriteria:", v25);

  }
  if (!v13)
    goto LABEL_14;
LABEL_15:

  return v13;
}

- (unint64_t)possibleChangesForChange:(id)a3
{
  return 0;
}

- (BOOL)requiresFullRefetchForChange:(id)a3
{
  return 0;
}

- (BOOL)_isAlbumContentSort
{
  return -[PHCollection isAlbumContentSort](self->_containerCollection, "isAlbumContentSort");
}

- (BOOL)_isAlbumContentTitleSort
{
  return -[PHCollection isAlbumContentTitleSort](self->_containerCollection, "isAlbumContentTitleSort");
}

- (id)_effectiveDefaultSortDescriptorReversingOrder:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  -[PHQuery basePredicate](self, "basePredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_3;
  v6 = (void *)objc_opt_class();
  -[PHQuery fetchType](self, "fetchType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHQuery basePredicate](self, "basePredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultSortDescriptorForFetchType:predicate:ascending:", v7, v8, !v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_3:
    -[PHCollection defaultSortDescriptor](self->_containerCollection, "defaultSortDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (NSRelationshipDescription)containerRelationship
{
  -[PHQuery _prepareContainerInfo](self, "_prepareContainerInfo");
  return self->_containerRelationship;
}

- (id)changeHandlingContainerIdentifier
{
  return 0;
}

- (void)_setBasePredicate:(id)a3
{
  objc_storeStrong((id *)&self->_basePredicate, a3);
}

- (BOOL)evaluateWithObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PHQuery fetchRequest](self, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "evaluateWithObject:", v4);
  return (char)v5;
}

- (void)_prepareCombinedQueryKeys
{
  PHQuery *v2;
  PHCollection *containerCollection;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _PHFetchRequestWrapper *v18;
  id combinedQueryGroupKey;
  _PHFetchRequestWrapper *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_preparedCombinedQueryKeys)
  {
    v2->_preparedCombinedQueryKeys = 1;
    containerCollection = v2->_containerCollection;
    if ((!containerCollection || -[PHCollection collectionHasFixedOrder](containerCollection, "collectionHasFixedOrder"))&& !v2->_seedOIDs)
    {
      -[PHQuery basePredicate](v2, "basePredicate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_22:

        goto LABEL_28;
      }
      -[PHQuery fetchOptions](v2, "fetchOptions");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "fetchLimit");

      if (!v6)
      {
        -[PHQuery basePredicate](v2, "basePredicate");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "predicateOperatorType") != 4 || objc_msgSend(v4, "comparisonPredicateModifier"))
          goto LABEL_27;
        objc_msgSend(v4, "leftExpression");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "rightExpression");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "expressionType") != 3 || objc_msgSend(v8, "expressionType"))
        {
LABEL_26:

LABEL_27:
          goto LABEL_28;
        }
        objc_msgSend(v8, "constantValue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "constantValue");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = 0;
        }

        objc_msgSend(v7, "keyPath");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "_relationshipForFetchType:predicate:", v2->_fetchType, v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10 || !objc_msgSend(v11, "length") || !v12 || (objc_msgSend(v12, "isToMany") & 1) != 0)
        {
LABEL_25:

          goto LABEL_26;
        }
        -[PHQuery _createFetchRequestIncludingBasePredicate:](v2, "_createFetchRequestIncludingBasePredicate:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)MEMORY[0x1E0CB3880];
          objc_msgSend(v11, "stringByAppendingString:", CFSTR(" == %@"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "predicateWithFormat:", v15, MEMORY[0x1E0C9AAB0]);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "predicate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v22 = (void *)MEMORY[0x1E0CB3528];
            v25[0] = v24;
            objc_msgSend(v13, "predicate");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v25[1] = v21;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "andPredicateWithSubpredicates:", v17);
            v23 = (id)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v23 = v24;
          }

          objc_msgSend(v13, "setPredicate:", v23);
          v18 = -[_PHFetchRequestWrapper initWithFetchRequest:containerIdentifier:fetchPropertySets:]([_PHFetchRequestWrapper alloc], "initWithFetchRequest:containerIdentifier:fetchPropertySets:", v13, 0, 0);
          combinedQueryGroupKey = v2->_combinedQueryGroupKey;
          v2->_combinedQueryGroupKey = v18;
          v20 = v18;

          objc_storeStrong((id *)&v2->_combinedQueryKeyPath, v11);
          objc_storeStrong((id *)&v2->_combinedQuerySeparatingIdentifier, v10);

          goto LABEL_25;
        }

        goto LABEL_22;
      }
    }
  }
LABEL_28:
  objc_sync_exit(v2);

}

- (id)combinedQueryGroupKey
{
  -[PHQuery _prepareCombinedQueryKeys](self, "_prepareCombinedQueryKeys");
  return self->_combinedQueryGroupKey;
}

- (NSString)combinedQueryKeyPath
{
  -[PHQuery _prepareCombinedQueryKeys](self, "_prepareCombinedQueryKeys");
  return self->_combinedQueryKeyPath;
}

- (NSManagedObjectID)combinedQuerySeparatingIdentifier
{
  -[PHQuery _prepareCombinedQueryKeys](self, "_prepareCombinedQueryKeys");
  return self->_combinedQuerySeparatingIdentifier;
}

- (NSSet)filteringKeys
{
  -[PHQuery _prepareFilteringAttributes](self, "_prepareFilteringAttributes");
  return (NSSet *)(id)-[NSMutableSet copy](self->_filteringKeys, "copy");
}

- (unint64_t)containerSortingAttributesIndexValue
{
  -[PHQuery _prepareFilteringAttributes](self, "_prepareFilteringAttributes");
  return self->_containerSortingAttributesIndexValue;
}

- (unint64_t)filteringAttributesIndexValue
{
  -[PHQuery _prepareFilteringAttributes](self, "_prepareFilteringAttributes");
  return self->_filteringAttributesIndexValue;
}

- (unint64_t)filteringRelationshipsIndexValue
{
  -[PHQuery _prepareFilteringAttributes](self, "_prepareFilteringAttributes");
  return self->_filteringRelationshipsIndexValue;
}

- (unint64_t)sortingAttributesIndexValue
{
  -[PHQuery _prepareFilteringAttributes](self, "_prepareFilteringAttributes");
  return self->_sortingAttributesIndexValue;
}

- (unint64_t)objectToContainerRelationshipIndexValue
{
  -[PHQuery _prepareFilteringAttributes](self, "_prepareFilteringAttributes");
  return self->_objectToContainerRelationshipIndexValue;
}

- (unint64_t)containerToObjectRelationshipIndexValue
{
  -[PHQuery _prepareFilteringAttributes](self, "_prepareFilteringAttributes");
  return self->_containerToObjectRelationshipIndexValue;
}

- (unint64_t)containerUserQueryIndexValue
{
  -[PHQuery _prepareFilteringAttributes](self, "_prepareFilteringAttributes");
  return self->_containerUserQueryIndexValue;
}

- (NSSet)filteringOids
{
  -[PHQuery _prepareFilteringAttributes](self, "_prepareFilteringAttributes");
  return (NSSet *)self->_filteringOids;
}

- (NSDictionary)filteringRelationshipsIndexValueByBaseEntityName
{
  -[PHQuery _prepareFilteringAttributes](self, "_prepareFilteringAttributes");
  return (NSDictionary *)self->_filteringRelationshipsIndexValueByBaseEntityName;
}

- (void)_prepareFilteringAttributes
{
  PHQuery *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableSet *filteringKeys;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *filteringRelationshipsIndexValueByBaseEntityName;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  PHQuery *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  NSMutableSet *v39;
  NSMutableSet *v40;
  void *v41;
  void *v42;
  void *v43;
  NSManagedObjectID *containerIdentifier;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSMutableSet *obj;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  PHQuery *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint64_t v69;
  _BYTE v70[128];
  uint64_t v71;
  _QWORD v72[3];

  v72[1] = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_preparedFilteringAttributes)
  {
    v2->_preparedFilteringAttributes = 1;
    v59 = v2;
    -[PHQuery fetchRequest](v2, "fetchRequest");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "entityName");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHQuery containerRelationship](v2, "containerRelationship");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "name");
    v3 = objc_claimAutoreleasedReturnValue();
    v49 = (void *)v3;
    if (v3)
    {
      v72[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 1);
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = MEMORY[0x1E0C9AA60];
    }
    v50 = (void *)v4;
    v2->_objectToContainerRelationshipIndexValue = objc_msgSend(MEMORY[0x1E0D71A28], "indexValueForRelationshipNames:entity:");
    objc_msgSend(v53, "inverseRelationship");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "entity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v52, "name");
    v6 = objc_claimAutoreleasedReturnValue();
    v47 = (void *)v6;
    if (v6)
    {
      v71 = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = MEMORY[0x1E0C9AA60];
    }
    v48 = (void *)v7;
    v59->_containerToObjectRelationshipIndexValue = objc_msgSend(MEMORY[0x1E0D71A28], "indexValueForRelationshipNames:entity:");
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    filteringKeys = v59->_filteringKeys;
    v59->_filteringKeys = (NSMutableSet *)v8;

    objc_msgSend(v57, "predicate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "acceptVisitor:flags:", v59, 1);

    if (v59->_filteringOids && v59->_filteringObjectKeyPaths)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = objc_claimAutoreleasedReturnValue();
      filteringRelationshipsIndexValueByBaseEntityName = v59->_filteringRelationshipsIndexValueByBaseEntityName;
      v59->_filteringRelationshipsIndexValueByBaseEntityName = (NSMutableDictionary *)v11;

      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      obj = v59->_filteringObjectKeyPaths;
      v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
      if (v13)
      {
        v56 = *(_QWORD *)v65;
        do
        {
          v58 = v13;
          for (i = 0; i != v58; ++i)
          {
            if (*(_QWORD *)v65 != v56)
              objc_enumerationMutation(obj);
            v15 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i);
            objc_msgSend(v57, "entity");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "ph_relationshipDescriptionsForKeyPath:", v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v17, "lastObject");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "inverseRelationship");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              objc_msgSend(v19, "entity");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "name");
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v19, "name");
              v22 = objc_claimAutoreleasedReturnValue();
              v23 = (void *)v22;
              if (v22)
              {
                v69 = v22;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v24 = (void *)MEMORY[0x1E0C9AA60];
              }
              v25 = objc_msgSend(MEMORY[0x1E0D71A28], "indexValueForRelationshipNames:entity:", v24, v21);
              objc_msgSend(v19, "entity");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "ph_baseEntity");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "name");
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              -[NSMutableDictionary objectForKeyedSubscript:](v59->_filteringRelationshipsIndexValueByBaseEntityName, "objectForKeyedSubscript:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v29, "unsignedLongLongValue");

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v30 | v25);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](v59->_filteringRelationshipsIndexValueByBaseEntityName, "setObject:forKeyedSubscript:", v31, v28);

            }
          }
          v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
        }
        while (v13);
      }

    }
    v32 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v33 = v59;
    if (!v59->_filteringKeys)
      goto LABEL_37;
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    objc_msgSend(v57, "sortDescriptors");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    if (v35)
    {
      v36 = *(_QWORD *)v61;
      while (2)
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v61 != v36)
            objc_enumerationMutation(v34);
          objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * j), "key");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v38, "length") || objc_msgSend(v38, "rangeOfString:", CFSTR(".")) != 0x7FFFFFFFFFFFFFFFLL)
          {
            v39 = v59->_filteringKeys;
            v59->_filteringKeys = 0;

            goto LABEL_35;
          }
          -[NSMutableSet addObject:](v59->_filteringKeys, "addObject:", v38);
          objc_msgSend(v32, "addObject:", v38);

        }
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
        if (v35)
          continue;
        break;
      }
    }
LABEL_35:

    v33 = v59;
    v40 = v59->_filteringKeys;
    if (v40)
    {
      -[NSMutableSet allObjects](v40, "allObjects");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v59->_filteringAttributesIndexValue = objc_msgSend(MEMORY[0x1E0D71A28], "indexValueForAttributeNames:entity:", v41, v54);
      v59->_filteringRelationshipsIndexValue = objc_msgSend(MEMORY[0x1E0D71A28], "indexValueForRelationshipNames:entity:", v41, v54);
      v42 = (void *)MEMORY[0x1E0D71A28];
      objc_msgSend(v32, "allObjects");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v59->_sortingAttributesIndexValue = objc_msgSend(v42, "indexValueForRelationshipNames:entity:", v43, v54);

      v33 = v59;
    }
    else
    {
LABEL_37:
      v33->_filteringRelationshipsIndexValue = -1;
      v33->_sortingAttributesIndexValue = -1;
      v33->_filteringAttributesIndexValue = -1;
    }
    containerIdentifier = v33->_containerIdentifier;
    if (containerIdentifier)
    {
      -[NSManagedObjectID entity](containerIdentifier, "entity");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "name");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v59->_containerSortingAttributesIndexValue = objc_msgSend(MEMORY[0x1E0D71A28], "indexValueForAttributeNames:entity:", &unk_1E3657408, v46);
      v59->_containerUserQueryIndexValue = objc_msgSend(MEMORY[0x1E0D71A28], "indexValueForAttributeNames:entity:", &unk_1E3657420, v46);

    }
    v2 = v59;
  }
  objc_sync_exit(v2);

}

- (id)_substitutedChangeTrackingKeyPathFromKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v27;
  void *v28;
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)MEMORY[0x19AEBEADC]();
  -[NSFetchRequest entity](self->_fetchRequest, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if (objc_msgSend(v7, "count") == 2)
  {
    objc_msgSend(v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D71880], "entityName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    v8 = v4;
    if (v11)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "relationshipsByName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)v12;
      objc_msgSend(v14, "objectForKeyedSubscript:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "destinationEntity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "propertiesByName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)v13;
      objc_msgSend(v17, "objectForKeyedSubscript:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "userInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0D71F98]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v12) = objc_msgSend(v20, "BOOLValue");

      objc_msgSend(v18, "userInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D71C20]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if ((_DWORD)v12)
      {

        v8 = 0;
      }
      else
      {
        v8 = v4;
        if (v22)
        {
          objc_msgSend(v6, "propertiesByName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            v8 = v22;

          }
          else
          {
            PLPhotoKitGetLog();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1991EC000, v25, OS_LOG_TYPE_ERROR, "Unable to find target property defined by userInfo key PHQueryChangeTrackingFilteringAssetAttributesSubstituteProperty.", buf, 2u);
            }

            v8 = v4;
          }

        }
      }

    }
  }

  objc_autoreleasePoolPop(v5);
  return v8;
}

- (void)visitPredicate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableSet *v11;
  NSMutableSet *filteringOids;
  NSMutableSet *v13;
  NSMutableSet *filteringObjectKeyPaths;
  void (**v15)(void *, void *);
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD aBlock[5];
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "leftExpression");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rightExpression");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "expressionType") == 10 || objc_msgSend(v6, "expressionType") == 3)
      && !objc_msgSend(v7, "expressionType"))
    {
      objc_msgSend(v6, "keyPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "length"))
      {
        -[PHQuery _substitutedChangeTrackingKeyPathFromKeyPath:](self, "_substitutedChangeTrackingKeyPathFromKeyPath:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (!v9 || objc_msgSend(v9, "rangeOfString:", CFSTR(".")) != 0x7FFFFFFFFFFFFFFFLL)
        {
          if (!self->_filteringOids)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v11 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
            filteringOids = self->_filteringOids;
            self->_filteringOids = v11;

            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v13 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
            filteringObjectKeyPaths = self->_filteringObjectKeyPaths;
            self->_filteringObjectKeyPaths = v13;

          }
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __26__PHQuery_visitPredicate___block_invoke;
          aBlock[3] = &unk_1E35DC548;
          aBlock[4] = self;
          v32 = v10;
          v15 = (void (**)(void *, void *))_Block_copy(aBlock);
          if (v10)
          {
            objc_msgSend(v7, "constantValue");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15[2](v15, v16);
            }
            else if (objc_msgSend(v16, "conformsToProtocol:", &unk_1EE35B348))
            {
              v24 = v10;
              v25 = v8;
              v26 = v7;
              v29 = 0u;
              v30 = 0u;
              v27 = 0u;
              v28 = 0u;
              v23 = v16;
              v17 = v16;
              v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
              if (v18)
              {
                v19 = v18;
                v20 = *(_QWORD *)v28;
                do
                {
                  v21 = 0;
                  do
                  {
                    if (*(_QWORD *)v28 != v20)
                      objc_enumerationMutation(v17);
                    v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v21);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                      v15[2](v15, v22);
                    ++v21;
                  }
                  while (v19 != v21);
                  v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
                }
                while (v19);
              }

              v8 = v25;
              v7 = v26;
              v16 = v23;
              v10 = v24;
            }

          }
        }

      }
    }

  }
}

- (void)visitPredicateExpression:(id)a3
{
  unint64_t v4;
  _BOOL4 v5;
  NSMutableSet *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  NSMutableSet *filteringKeys;
  NSMutableSet *filteringOids;
  id v13;

  v13 = a3;
  v4 = objc_msgSend(v13, "expressionType");
  if (v4 > 0x14)
    goto LABEL_11;
  if (((1 << v4) & 0x1048F7) != 0)
  {
    v5 = 0;
    goto LABEL_4;
  }
  if (((1 << v4) & 0x408) == 0)
  {
LABEL_11:
    filteringKeys = self->_filteringKeys;
    self->_filteringKeys = 0;

LABEL_12:
    filteringOids = self->_filteringOids;
    self->_filteringOids = 0;

    goto LABEL_13;
  }
  objc_msgSend(v13, "keyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");
  v5 = v8 == 0;
  if (v8)
  {
    -[PHQuery _substitutedChangeTrackingKeyPathFromKeyPath:](self, "_substitutedChangeTrackingKeyPathFromKeyPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "rangeOfString:", CFSTR(".")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableSet addObject:](self->_filteringKeys, "addObject:", v9);
      v10 = 0;
    }
    else
    {
      v10 = v9 != 0;
    }

  }
  else
  {
    v10 = 0;
  }

  if (v10)
  {
LABEL_5:
    v6 = self->_filteringKeys;
    self->_filteringKeys = 0;

    if (!v5)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_4:
  if (v5)
    goto LABEL_5;
LABEL_13:

}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHQuery;
  -[PHQuery description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PHQuery;
  -[PHQuery description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHQuery fetchOptions](self, "fetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHQuery fetchType](self, "fetchType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHQuery basePredicate](self, "basePredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" opts=%@, type=%@, base=%@"), v5, v6, objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)searchIndexLookupIdentifier
{
  return self->_searchIndexLookupIdentifier;
}

void __26__PHQuery_visitPredicate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 192);
  v5 = a2;
  objc_msgSend(v4, "addObject:", v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "addObject:", v5);

}

+ (id)queryForType:(id)a3 withBasePredicate:(id)a4 seedOIDs:(id)a5 inLibrary:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForType:withBasePredicate:seedOIDs:inLibrary:", v13, v12, v11, v10);

  return v14;
}

+ (id)defaultSortDescriptorForFetchType:(id)a3 predicate:(id)a4 ascending:(BOOL)a5
{
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a5;
  objc_msgSend(a1, "_relationshipForFetchType:predicate:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inverseRelationship");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "isToMany") && objc_msgSend(v8, "isOrdered"))
  {
    v9 = (void *)MEMORY[0x1E0CB3928];
    objc_msgSend(v6, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortDescriptorWithKey:ascending:", v10, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)_isKindOfMomentOrAlbumEntity:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (_isKindOfMomentOrAlbumEntity__onceToken != -1)
    dispatch_once(&_isKindOfMomentOrAlbumEntity__onceToken, &__block_literal_global_31374);
  if ((objc_msgSend(v3, "isKindOfEntity:", _isKindOfMomentOrAlbumEntity__momentEntity) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isKindOfEntity:", _isKindOfMomentOrAlbumEntity__albumEntity);

  return v4;
}

+ (signed)_participationStateFromLibraryScope:(id)a3
{
  return a3 != 0;
}

+ (void)photoLibraryWasAccessed
{
  id v2;

  if (PLPlatformPhotosAccessLoggingSupported())
  {
    objc_msgSend(MEMORY[0x1E0D73298], "sharedInstance");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "logPhotosAccessWithSelfAuditToken");

  }
}

+ (id)combinedFetchRequestForQueries:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  const __CFString *v45;
  _QWORD v46[2];
  _QWORD v47[2];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[PHPhotoLibrary classForFetchType:](PHPhotoLibrary, "classForFetchType:", v5);

  -[objc_class managedEntityName](v6, "managedEntityName");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContextForCurrentQueueQoS");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)v7;
  PLSafeEntityForNameInManagedObjectContext();
  v10 = objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_opt_new();
  v39 = (void *)v10;
  objc_msgSend(v11, "setEntity:", v10);
  objc_msgSend(v4, "combinedQueryKeyPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v3, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v14 = v3;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v42 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "combinedQuerySeparatingIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    }
    while (v16);
  }

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN (%@)"), v12, v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "effectivePredicateForPHClass:includingBasePredicate:", v6, 0);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v21)
  {
    v23 = (void *)MEMORY[0x1E0CB3528];
    v38 = v20;
    v47[0] = v20;
    v47[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "andPredicateWithSubpredicates:", v24);
    v25 = objc_claimAutoreleasedReturnValue();

    v37 = (void *)v25;
    objc_msgSend(v11, "setPredicate:", v25);
    objc_msgSend(v11, "setIncludesPendingChanges:", 0);
    objc_msgSend(v11, "setResultType:", 2);
    v26 = objc_alloc_init(MEMORY[0x1E0C97B30]);
    objc_msgSend(v26, "setName:", CFSTR("objectID"));
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setExpression:", v27);

    objc_msgSend(v26, "setExpressionResultType:", 2000);
    v28 = objc_alloc_init(MEMORY[0x1E0C97B30]);
    objc_msgSend(v28, "setName:", v12);
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", v12);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setExpression:", v29);

    objc_msgSend(v28, "setExpressionResultType:", 2000);
    v46[0] = v26;
    v46[1] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPropertiesToFetch:", v30);

    objc_msgSend(v4, "_effectiveSortDescriptors");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSortDescriptors:", v31);
    if (objc_msgSend(v4, "_isAlbumContentSort")
      && objc_msgSend(v4, "_isAlbumContentTitleSort"))
    {
      objc_msgSend(v11, "relationshipKeyPathsForPrefetching");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v32, "containsObject:", CFSTR("additionalAttributes.title")) & 1) == 0)
      {
        v36 = v32;
        if (objc_msgSend(v32, "count"))
        {
          objc_msgSend(v32, "arrayByAddingObject:", CFSTR("additionalAttributes.title"));
        }
        else
        {
          v45 = CFSTR("additionalAttributes.title");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
        }
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setRelationshipKeyPathsForPrefetching:", v34);

        v32 = v36;
      }

    }
    v33 = v11;

    v20 = v38;
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

+ (id)_fetchOptionsForFetchingAssetsFromImportSessions:(id)a3 options:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "hasAnySortDescriptors") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setInternalSortDescriptors:", v10);
  }
  return v8;
}

+ (id)_assetIDsFromAssets:(id)a3 anyAsset:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  _OWORD v18[4];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "fetchedObjectIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && !v6)
  {
    objc_msgSend(v5, "objectIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v6)
  {
    if (a4)
    {
      memset(v18, 0, sizeof(v18));
      if (objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", v18, v23, 16))
        *a4 = objc_retainAutorelease(**((id **)&v18[0] + 1));
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v14, "objectID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v14, "objectID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v16);

            if (!((a4 == 0) | v11 & 1))
            {
              *a4 = objc_retainAutorelease(v14);
              v11 = 1;
            }
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v10);
    }

  }
  return v6;
}

+ (id)queryForMemoriesWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a1, "queryForType:withIdentifiers:local:options:", CFSTR("PHMemory"), a3, 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchOptions:", v6);

  return v7;
}

+ (id)queryForCuratedAssetsInMemory:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v16;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "assetCollectionType") != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHQuery.m"), 1545, CFSTR("Fetching for curated assets is only supported in a memory"));

  }
  if (objc_msgSend(v7, "isTransient"))
  {
    objc_msgSend(v7, "queryForCuratedAssetsWithOptions:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v7, "objectID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateWithFormat:", CFSTR("memoriesBeingCuratedAssets CONTAINS %@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v8, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v12, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_fetchOptionsForFetchingAssetsFromAssetCollection:options:changeDetectionCriteria:", v7, v8, 0);
    v14 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "_setContainerCollection:", v7);
    objc_msgSend(v9, "setFetchOptions:", v14);

    v8 = (id)v14;
  }

  return v9;
}

+ (id)queryForExtendedCuratedAssetsInMemory:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v16;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "assetCollectionType") != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHQuery.m"), 1565, CFSTR("Fetching for curated assets is only supported in a memory"));

  }
  if (objc_msgSend(v7, "isTransient"))
  {
    objc_msgSend(v7, "queryForExtendedCuratedAssetsWithOptions:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v7, "objectID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateWithFormat:", CFSTR("memoriesBeingExtendedCuratedAssets CONTAINS %@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v8, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v12, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_fetchOptionsForFetchingAssetsFromAssetCollection:options:changeDetectionCriteria:", v7, v8, 0);
    v14 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "_setContainerCollection:", v7);
    objc_msgSend(v9, "setFetchOptions:", v14);

    v8 = (id)v14;
  }

  return v9;
}

+ (id)queryForKeyAssetInMemory:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v7 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "assetCollectionType") != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHQuery.m"), 1585, CFSTR("Fetching for curated assets is only supported in a memory"));

  }
  v9 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v8, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("memoriesBeingKeyAsset CONTAINS %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_fetchOptionsForFetchingAssetsFromAssetCollection:options:changeDetectionCriteria:", v8, v7, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "_setContainerCollection:", v8);
  objc_msgSend(v13, "setFetchOptions:", v14);

  return v13;
}

+ (id)queryForAllAssetsAssociatedWithMemory:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v7 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "assetCollectionType") != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHQuery.m"), 1598, CFSTR("Fetching for all associated assets for a memory is only supported for a memory"));

  }
  objc_msgSend(v8, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K CONTAINS %@ OR %K CONTAINS %@"), CFSTR("memoriesBeingExtendedCuratedAssets"), v9, CFSTR("memoriesBeingRepresentativeAssets"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_fetchOptionsForFetchingAssetsFromAssetCollection:options:changeDetectionCriteria:", v8, v7, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "_setContainerCollection:", v8);
  objc_msgSend(v12, "setFetchOptions:", v13);

  return v12;
}

+ (id)queryForAssetsAssociatedWithMomentsOfMemory:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v7 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "assetCollectionType") != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHQuery.m"), 1610, CFSTR("queryForAssetsAssociatedWithMomentsOfMemory is only supported for a memory"));

  }
  objc_msgSend(v8, "predicateForAssetsContainedInMomentsFromRepresentativeAssets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_fetchOptionsForFetchingAssetsFromAssetCollection:options:changeDetectionCriteria:", v8, v7, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "_setContainerCollection:", v8);
  objc_msgSend(v11, "setFetchOptions:", v12);

  return v11;
}

+ (id)queryForKeyAssetsInSuggestion:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v7 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "assetCollectionType") != 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHQuery.m"), 1622, CFSTR("Fetching for key assets by suggestionsBeingKeyAssets is only supported in a suggestion"));

  }
  v9 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v8, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("suggestionsBeingKeyAssets CONTAINS %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_fetchOptionsForFetchingAssetsFromAssetCollection:options:changeDetectionCriteria:", v8, v7, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "_setContainerCollection:", v8);
  objc_msgSend(v13, "setFetchOptions:", v14);

  return v13;
}

+ (id)queryForRepresentativeAssetsInSuggestion:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v7 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "assetCollectionType") != 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHQuery.m"), 1636, CFSTR("Fetching for representative assets by suggestionsBeingRepresentativeAssets is only supported in a suggestion"));

  }
  v9 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v8, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("suggestionsBeingRepresentativeAssets CONTAINS %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_fetchOptionsForFetchingAssetsFromAssetCollection:options:changeDetectionCriteria:", v8, v7, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "_setContainerCollection:", v8);
  objc_msgSend(v13, "setFetchOptions:", v14);

  return v13;
}

+ (id)queryForRepresentativeAssetsInMemory:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v7 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "assetCollectionType") != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHQuery.m"), 1650, CFSTR("Fetching for representative assets is only supported in a memory"));

  }
  v9 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v8, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("memoriesBeingRepresentativeAssets CONTAINS %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_fetchOptionsForFetchingAssetsFromAssetCollection:options:changeDetectionCriteria:", v8, v7, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "_setContainerCollection:", v8);
  objc_msgSend(v13, "setFetchOptions:", v14);

  return v13;
}

+ (id)queryForCuratedAssetsInPhotosHighlight:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v6 = a3;
  v7 = a4;
  _predicateForAssetsInPhotosHighlightWithOptions(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_fetchOptionsForFetchingAssetsFromAssetCollection:options:changeDetectionCriteria:", v6, v7, 0);
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setContainerCollection:", v6);
    objc_msgSend(v10, "setFetchOptions:", v11);

    v7 = (id)v11;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)queryForCuratedAssetsInMomentShare:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "preview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "curatedAssetIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v5, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@ OR cloudAssetGUID IN %@"), v8, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setInternalPredicate:", v11);
    +[PHQuery queryForAssetsInAssetCollection:options:](PHQuery, "queryForAssetsInAssetCollection:options:", v5, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v10;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)queryForCollageAssetsInDayHighlight:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "kind"))
  {
    v7 = 0;
  }
  else
  {
    +[PHPhotosHighlight collageAssetsInverseRelationshipPredicateForDayHighlight:forHighlightFilter:](PHPhotosHighlight, "collageAssetsInverseRelationshipPredicateForDayHighlight:forHighlightFilter:", v5, objc_msgSend(v6, "sharingFilter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v8, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setUseNoIndexOnSharingFilter:", 1);
    objc_msgSend(v7, "_setContainerCollection:", v5);
    objc_msgSend(v7, "setFetchOptions:", v6);

  }
  return v7;
}

+ (id)queryForAssetsInBoundingBoxWithTopLeftLocation:(id)a3 bottomRightLocation:(id)a4 options:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB35D0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "expressionForKeyPath:", CFSTR("boundedByRect"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB35D0];
  v19[0] = v10;
  v19[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "expressionForConstantValue:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3518], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v11, v14, 0, 2000, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v8, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setFetchOptions:", v8);
  return v17;
}

+ (id)_guestAssetOnlyPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForGuestAsset"), 1);
}

+ (id)queryForAssetsInImportSessions:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v13), "objectID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("importSession IN %@"), v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v7, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_fetchOptionsForFetchingAssetsFromImportSessions:options:", v9, v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "_setContainerCollection:", 0);
  objc_msgSend(v17, "setFetchOptions:", v18);

  return v17;
}

+ (id)queryForMovieCuratedAssetsInMemory:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v7 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "assetCollectionType") != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHQuery.m"), 1836, CFSTR("Fetching for movie curated assets is only supported in a memory"));

  }
  v9 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v8, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("memoriesBeingMovieCuratedAssets CONTAINS %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_fetchOptionsForFetchingAssetsFromAssetCollection:options:changeDetectionCriteria:", v8, v7, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "_setContainerCollection:", v8);
  objc_msgSend(v13, "setFetchOptions:", v14);

  return v13;
}

+ (id)queryForUserCuratedAssetsInMemory:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v7 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "assetCollectionType") != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHQuery.m"), 1850, CFSTR("Fetching for user curated assets is only supported in a memory"));

  }
  v9 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v8, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("memoriesBeingUserCuratedAssets CONTAINS %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_fetchOptionsForFetchingAssetsFromAssetCollection:options:changeDetectionCriteria:", v8, v7, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "_setContainerCollection:", v8);
  objc_msgSend(v13, "setFetchOptions:", v14);

  return v13;
}

+ (id)queryForCustomUserAssetsInMemory:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v7 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "assetCollectionType") != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHQuery.m"), 1863, CFSTR("Fetching for user curated assets is only supported in a memory"));

  }
  v9 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v8, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("%K CONTAINS %@"), CFSTR("memoriesBeingCustomUserAssets"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "_setContainerCollection:", v8);
  objc_msgSend(v13, "setFetchOptions:", v7);

  return v13;
}

+ (id)queryForAssetsWithMediaType:(int64_t)a3 options:(id)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)a3 >= 4)
    v7 = 3;
  else
    v7 = (0x2000100000003uLL >> (16 * a3)) & 3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind = %d"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || !objc_msgSend(v5, "includeAssetSourceTypes"))
  {
    +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v5, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setIncludeAssetSourceTypes:", 1);
    v5 = v10;
  }
  objc_msgSend(v9, "setFetchOptions:", v5);

  return v9;
}

+ (id)queryForType:(id)a3 withIdentifiers:(id)a4 identifierKeyPath:(id)a5 options:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        +[PHObject uuidFromLocalIdentifier:](PHObject, "uuidFromLocalIdentifier:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(v13, "addObject:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v16);
  }

  v20 = (void *)MEMORY[0x1E0C9AA60];
  if (v13)
    v20 = v13;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN (%@)"), v11, v20, (_QWORD)v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v12, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", v9, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "setFetchOptions:", v12);
  return v23;
}

+ (id)queryForType:(id)a3 withIdentifiers:(id)a4 local:(BOOL)a5 options:(id)a6
{
  const __CFString *v6;

  if (a5)
    v6 = CFSTR("uuid");
  else
    v6 = CFSTR("cloudAssetGUID");
  return (id)objc_msgSend(a1, "queryForType:withIdentifiers:identifierKeyPath:options:", a3, a4, v6, a6);
}

+ (id)_defaultFetchOptionsForIdentifiedAssetsQueryInPhotoLibrary:(id)a3
{
  void *v3;

  +[PHFetchOptions fetchOptionsWithPhotoLibrary:orObject:](PHFetchOptions, "fetchOptionsWithPhotoLibrary:orObject:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIncludeDuplicateAssets:", 1);
  objc_msgSend(v3, "setIncludeHiddenAssets:", 1);
  return v3;
}

+ (id)_queryForAssetsWithIdentifiers:(id)a3 local:(BOOL)a4 options:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  v8 = a5;
  objc_msgSend(a1, "queryForType:withIdentifiers:local:options:", CFSTR("PHAsset"), a3, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_class();
  objc_msgSend(v8, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_defaultFetchOptionsForIdentifiedAssetsQueryInPhotoLibrary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v12, "mergeWithFetchOptions:", v8);
  objc_msgSend(v9, "setFetchOptions:", v12);

  return v9;
}

+ (id)queryForAssetsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  return (id)objc_msgSend(a1, "_queryForAssetsWithIdentifiers:local:options:", a3, 1, a4);
}

+ (id)queryForAssetsWithUUIDs:(id)a3 options:(id)a4
{
  return (id)objc_msgSend(a1, "_queryForAssetsWithIdentifiers:local:options:", a3, 1, a4);
}

+ (id)queryForAssetsWithCloudIdentifiers:(id)a3 options:(id)a4
{
  return (id)objc_msgSend(a1, "_queryForAssetsWithIdentifiers:local:options:", a3, 0, a4);
}

+ (id)queryForCloudSharedAlbumsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a1, "queryForType:withIdentifiers:local:options:", CFSTR("PHCloudSharedAlbum"), a3, 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchOptions:", v6);

  return v7;
}

+ (id)queryForCloudSharedAlbumInvitationRecordsWithOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHCloudSharedAlbumInvitationRecord"), 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", 0, v4);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setFetchOptions:", v3);

  return v5;
}

+ (id)queryForCloudSharedAlbumInvitationRecordsForCloudSharedAlbum:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v6, "cloudGUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("albumGUID"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHCloudSharedAlbumInvitationRecord"), v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", 0, v7);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "setFetchOptions:", v5);

  return v11;
}

+ (id)queryForAssetsWithOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 || !objc_msgSend(v3, "includeAssetSourceTypes"))
  {
    +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setIncludeAssetSourceTypes:", 1);
    v3 = v6;
  }
  objc_msgSend(v5, "setFetchOptions:", v3);

  return v5;
}

+ (id)queryForAssetsForPTPWithOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v3 = a3;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__31074;
  v20 = __Block_byref_object_dispose__31075;
  v21 = 0;
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__PHQuery_queryForAssetsForPTPWithOptions___block_invoke;
  v12[3] = &unk_1E35DEE50;
  v15 = &v16;
  v7 = v6;
  v13 = v7;
  v8 = v5;
  v14 = v8;
  objc_msgSend(v7, "performBlockAndWait:", v12);
  objc_msgSend(MEMORY[0x1E0D71918], "predicateForAssetsExposedByPHPTPExcludingObjectIDs:", v17[5]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", 0, v4);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "setIncludeAllBurstAssets:", 1);
  objc_msgSend(v3, "setIncludeHiddenAssets:", 1);
  objc_msgSend(v10, "setFetchOptions:", v3);

  _Block_object_dispose(&v16, 8);
  return v10;
}

+ (id)queryForAnyCinematicVideosNeedingDeferredProcessingWithOtions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d AND %K = %d"), CFSTR("depthType"), 2, CFSTR("deferredProcessingNeeded"), 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", 0, v4);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "setFetchLimit:", 1);
  objc_msgSend(v6, "setFetchOptions:", v3);

  return v6;
}

+ (id)queryForGuestAssetsWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(a1, "_guestAssetOnlyPredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  +[PHAsset filterPredicateToExcludeNoSyndicationAssets](PHAsset, "filterPredicateToExcludeNoSyndicationAssets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || !objc_msgSend(v4, "includeAssetSourceTypes"))
  {
    +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v4, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setIncludeAssetSourceTypes:", 1);
    v4 = v12;
  }
  objc_msgSend(v11, "setFetchOptions:", v4);

  return v11;
}

+ (id)queryForGuestAssetsInCollectionContainingAsset:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "fetchPropertySetsIfNeeded");
  objc_msgSend(v6, "curationProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "syndicationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  PLSearchableIdentifierFromMessagesSyndicationID();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("additionalAttributes.syndicationIdentifier CONTAINS %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internalPredicate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(v5, "internalPredicate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v13;
    v18[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "andPredicateWithSubpredicates:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInternalPredicate:", v15);

  }
  else
  {
    objc_msgSend(v5, "setInternalPredicate:", v10);
  }
  +[PHQuery queryForGuestAssetsWithOptions:](PHQuery, "queryForGuestAssetsWithOptions:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)queryForAssetsWithObjectIDs:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self in %@"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForType:withBasePredicate:seedOIDs:inLibrary:](PHQuery, "queryForType:withBasePredicate:seedOIDs:inLibrary:", CFSTR("PHAsset"), v8, 0, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v5, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setIncludeTrashedAssets:", 1);
  objc_msgSend(v10, "setIncludeAllBurstAssets:", 1);
  objc_msgSend(v10, "setIncludeHiddenAssets:", 1);
  objc_msgSend(v9, "setFetchOptions:", v10);

  return v9;
}

+ (id)queryForVisibleAssetsWithObjectIDs:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self in %@"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "queryForType:withBasePredicate:seedOIDs:inLibrary:", CFSTR("PHAsset"), v9, 0, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v6, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setFetchOptions:", v11);
  return v10;
}

+ (id)queryForAssetsWithBurstIdentifier:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0D71880];
  v6 = a4;
  objc_msgSend(v5, "predicateForBurstAssetsWithBurstUUID:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setFetchOptions:", v6);
  return v9;
}

+ (id)queryForKeyAssetsInMomentShare:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "preview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyAssetIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v5, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid == %@ OR cloudAssetGUID == %@"), v8, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setInternalPredicate:", v11);
    +[PHQuery queryForAssetsInAssetCollection:options:](PHQuery, "queryForAssetsInAssetCollection:options:", v5, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v10;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)queryForKeySharingSuggestionAssetsInHighlight:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "assetCollectionSubtype") == 1000000302)
  {
    objc_msgSend(v5, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v5, "objectID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateWithFormat:", CFSTR("highlightBeingAssets.parentPhotosHighlight == %@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v12);

    PLManagedAssetPredicateToFetchAssetsSuggestedForSharing();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v13);

    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInternalPredicate:", v14);

    objc_msgSend(v8, "setSharingFilter:", 0);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInternalSortDescriptors:", v16);

    +[PHQuery queryForAssetsWithOptions:](PHQuery, "queryForAssetsWithOptions:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v8;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)queryForKeyAssetsInAssetCollection:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "assetCollectionType") == 8)
  {
    +[PHQuery queryForKeyAssetsInSuggestion:options:](PHQuery, "queryForKeyAssetsInSuggestion:options:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = PHQueryForKeyAssetsInSuggestion;
LABEL_5:
    objc_msgSend(v7, "_setIdentificationBlock:", v9);
    goto LABEL_6;
  }
  if (objc_msgSend(v5, "assetCollectionType") == 7)
  {
    +[PHQuery queryForKeyAssetsInMomentShare:options:](PHQuery, "queryForKeyAssetsInMomentShare:options:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = PHQueryForKeyAssetsInMomentShare;
    goto LABEL_5;
  }
  if (objc_msgSend(v5, "assetCollectionType") == 6
    && objc_msgSend(v5, "assetCollectionSubtype") == 1000000302
    && objc_msgSend(v5, "isSharingSuggestion"))
  {
    +[PHQuery queryForKeySharingSuggestionAssetsInHighlight:options:](PHQuery, "queryForKeySharingSuggestionAssetsInHighlight:options:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = PHQueryForKeySharingSuggestionAssetsInHighlight;
    goto LABEL_5;
  }
  if (objc_msgSend(v5, "canContainCustomKeyAssets"))
  {
    v11 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v5, "objectID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predicateWithFormat:", CFSTR("%K CONTAINS %@"), CFSTR("albumsBeingKeyAssets"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v13, v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "photoLibrary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v6, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setFetchOptions:", v16);
    objc_msgSend(v8, "_setIdentificationBlock:", PHQueryForKeyAssetsInAssetCollection);

  }
  else if (objc_msgSend(v5, "assetCollectionType") == 3)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v5, "photoLibrary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v6, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v18, "fetchLimit");
    v20 = +[PHQuery maxKeyAssets](PHQuery, "maxKeyAssets");
    if (v19 >= v20)
      v21 = v20;
    else
      v21 = v19;
    if (v19)
      v22 = v21;
    else
      v22 = v20;
    objc_msgSend(v18, "setFetchLimit:", v22);
    objc_msgSend(v18, "setReverseSortOrder:", objc_msgSend(v18, "reverseSortOrder") ^ objc_msgSend(v5, "keyAssetsAtEnd"));
    +[PHQuery queryForAssetsInAssetCollection:options:](PHQuery, "queryForAssetsInAssetCollection:options:", v5, v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v18;
  }
LABEL_6:

  return v8;
}

+ (id)queryForAssetsForKeywords:(id)a3 options:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  objc_msgSend(a3, "_pl_map:", &__block_literal_global_246);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY %K IN %@"), CFSTR("additionalAttributes.keywords"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setFetchOptions:", v5);
  return v9;
}

+ (id)queryForReferencedAssetsWithOptions:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PHQueryChangeDetectionCriteria *v13;
  void *v14;

  v3 = (objc_class *)MEMORY[0x1E0D732A0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = objc_alloc_init(MEMORY[0x1E0D732E8]);
  objc_msgSend(v6, "setComparator:", 1);
  objc_msgSend(v6, "setKey:", 6);
  objc_msgSend(v5, "addSingleQueries:", v6);
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0D71A30]);
  v9 = (void *)MEMORY[0x1E0D71A38];
  objc_msgSend(v7, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateForQuery:inLibrary:changeDetectionCriteria:", v5, v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFetchOptions:", v4);

  v13 = -[PHQueryChangeDetectionCriteria initWithPLQueryChangeDetectionCriteria:]([PHQueryChangeDetectionCriteria alloc], "initWithPLQueryChangeDetectionCriteria:", v8);
  if (v13)
  {
    objc_msgSend(v12, "fetchOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setChangeDetectionCriteria:", v13);

  }
  return v12;
}

+ (id)queryForAllAssetsInYearRepresentedByYearHighlight:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "kind") == 2)
  {
    objc_msgSend(v6, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v6, "objectID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateWithFormat:", CFSTR("highlightBeingAssets.parentPhotosHighlight.parentPhotosHighlight = %@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setInternalPredicate:", v12);

    objc_msgSend(a1, "queryForAssetsWithOptions:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)queryForAssetsForBehavioralCurationWithOptions:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D71880];
  v4 = a3;
  objc_msgSend(v3, "predicateToIncludeOnlyAllowedForAnalysisAndProcessedAssetsToSceneVersion:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("faceAdjustmentVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3528];
  v13[0] = v5;
  v13[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setFetchOptions:", v4);
  return v11;
}

+ (id)queryForAssetsFromCameraSinceDate:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHQuery.m"), 2222, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

  }
  if (+[PHPhotoLibrary isMultiLibraryModeEnabled](PHPhotoLibrary, "isMultiLibraryModeEnabled"))
  {
    objc_msgSend(v8, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHQuery.m"), 2224, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options.photoLibrary"));

    }
  }
  v10 = (void *)objc_msgSend(v8, "copy");

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("addedDate"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForCameraAsset"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3528];
  v26[0] = v11;
  v26[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "internalPredicate");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
  {
    v18 = (void *)MEMORY[0x1E0CB3528];
    v25[0] = v16;
    v25[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "andPredicateWithSubpredicates:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setInternalPredicate:", v20);

  }
  else
  {
    objc_msgSend(v10, "setInternalPredicate:", v15);
  }
  objc_msgSend(a1, "queryForAssetsWithOptions:", v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)queryForAssetsCapturedOnThisCameraSinceDate:(id)a3 options:(id)a4
{
  return (id)objc_msgSend(a1, "queryForAssetsCaptured:orEdited:onThisCameraSinceDate:options:", 1, 0, a3, a4);
}

+ (id)queryForAssetsEditedOnThisCameraSinceDate:(id)a3 options:(id)a4
{
  return (id)objc_msgSend(a1, "queryForAssetsCaptured:orEdited:onThisCameraSinceDate:options:", 0, 1, a3, a4);
}

+ (id)queryForAssetsCaptured:(BOOL)a3 orEdited:(BOOL)a4 onThisCameraSinceDate:(id)a5 options:(id)a6
{
  int v7;
  int v8;
  id v11;
  id v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];

  v7 = a4;
  v8 = a3;
  v33[4] = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHQuery.m"), 2253, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date != nil"));

  }
  objc_msgSend(v12, "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHQuery.m"), 2254, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options.photoLibrary != nil"));

  }
  objc_msgSend(v11, "timeIntervalSinceNow");
  if (v14 >= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHQuery.m"), 2255, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date.timeIntervalSinceNow < 0"));

  }
  objc_msgSend(v12, "internalPredicate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHQuery.m"), 2256, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options.internalPredicate == nil"));

  }
  if (v8 == v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHQuery.m"), 2257, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("captured != edited"));

  }
  v16 = (void *)objc_msgSend(v12, "copy");
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("dateCreated"), v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D71880], "predicateForUnadjustedAssetsWithKeyPathToAsset:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_16;
    goto LABEL_15;
  }
  v18 = 0;
  v17 = 0;
  if (v7)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("adjustmentTimestamp"), v11);
    v19 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D71880], "predicateForAdjustedAssetsWithKeyPathToAsset:", 0);
    v20 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v20;
    v17 = (void *)v19;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > %d"), CFSTR("currentSleetCast"), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForCameraAsset"), 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0CB3528];
  v33[0] = v17;
  v33[1] = v18;
  v33[2] = v21;
  v33[3] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "andPredicateWithSubpredicates:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setInternalPredicate:", v25);
  objc_msgSend(a1, "queryForAssetsWithOptions:", v16);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

+ (id)queryForAssetsInLibraryScope:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(a1, "_participationStateFromLibraryScope:", v7);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("activeLibraryScopeParticipationState"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setFetchOptions:", v6);
  return v11;
}

+ (id)queryForAssetsWithCurrentUserAsLibraryScopeContributor:(BOOL)a3 inLibraryScope:(id)a4 options:(id)a5
{
  _BOOL4 v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[3];

  v6 = a3;
  v20[2] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB3880];
  v8 = a5;
  objc_msgSend(a4, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("libraryScope == %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3528];
  if (v6)
  {
    v20[0] = v10;
    objc_msgSend(MEMORY[0x1E0D71880], "predicateToIncludeOnlyContentContributedByCurrentUser");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "andPredicateWithSubpredicates:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19[0] = v10;
    objc_msgSend(MEMORY[0x1E0D71880], "predicateToIncludeOnlyContentContributedByCurrentUser");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "notPredicateWithSubpredicate:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "andPredicateWithSubpredicates:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)v15;
  }

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v8, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setFetchOptions:", v8);
  return v17;
}

+ (id)queryForAssetsInPreviewStateInLibraryScope:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(a1, "_participationStateFromLibraryScope:", v7);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("activeLibraryScopeParticipationState"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PLManagedAssetPredicateToFetchAllAssetsInLibraryScopePreviewState();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3528];
  v17[0] = v9;
  v17[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setFetchOptions:", v6);
  return v15;
}

+ (id)queryForAssetsInPreviewStateWithSuggestedByClientTypes:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "integerValue", (_QWORD)v18);
        PLManagedAssetPredicateToFetchAllAssetsInLibraryScopePreviewStateWithSuggestedByClientType();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setFetchOptions:", v6);
  return v16;
}

+ (id)queryForAssetsForComment:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K CONTAINS %@ OR %K CONTAINS %@"), CFSTR("likeComments"), v8, CFSTR("cloudComments"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFetchOptions:", v6);

  return v12;
}

+ (id)queryForAssetCollectionsContainingAsset:(id)a3 withType:(int64_t)a4 options:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __CFString *v31;
  uint8_t buf[4];
  __CFString *v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    switch(a4)
    {
      case 1:
        v16 = (void *)MEMORY[0x1E0CB3880];
        objc_msgSend(v7, "objectID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "predicateWithFormat:", CFSTR("assets CONTAINS %@"), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = CFSTR("PHAlbum");
        goto LABEL_13;
      case 3:
      case 7:
        v11 = (void *)MEMORY[0x1E0CB3880];
        objc_msgSend(v7, "objectID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "predicateWithFormat:", CFSTR("assets CONTAINS %@"), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = CFSTR("PHMoment");
        goto LABEL_13;
      case 6:
        v19 = (void *)MEMORY[0x1E0CB3880];
        objc_msgSend(v7, "objectID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "predicateWithFormat:", CFSTR("assets CONTAINS %@"), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = CFSTR("PHPhotosHighlight");
        goto LABEL_13;
      case 8:
        v20 = (void *)MEMORY[0x1E0CB3880];
        objc_msgSend(v7, "objectID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "predicateWithFormat:", CFSTR("keyAssets CONTAINS %@"), v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = (void *)MEMORY[0x1E0CB3880];
        objc_msgSend(v7, "objectID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "predicateWithFormat:", CFSTR("representativeAssets CONTAINS %@"), v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = (void *)MEMORY[0x1E0CB3528];
        v34[0] = v22;
        v34[1] = v25;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "orPredicateWithSubpredicates:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHSuggestion"), v28, v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        break;
      case 9:
        v29 = (void *)MEMORY[0x1E0CB3880];
        objc_msgSend(v7, "objectID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "predicateWithFormat:", CFSTR("%K CONTAINS %@"), CFSTR("assets"), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = CFSTR("PHImportSession");
LABEL_13:
        +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", v14, v13, v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        break;
      default:
        if ((queryForAssetCollectionsContainingAsset_withType_options__didLog & 1) == 0)
        {
          queryForAssetCollectionsContainingAsset_withType_options__didLog = 1;
          PLPhotoKitGetLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            if ((unint64_t)a4 > 0xB)
              v18 = 0;
            else
              v18 = off_1E35DD478[a4];
            v31 = v18;
            *(_DWORD *)buf = 138412290;
            v33 = v31;
            _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_DEFAULT, "Fetching for asset collection type %@ containing an asset is not supported", buf, 0xCu);

          }
        }
        v15 = 0;
        break;
    }

  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v15, "setFetchOptions:", v8);

  return v15;
}

+ (id)queryForAllTripHighlightsContainingAssetUUIDs:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("ANY %K.%K IN %@"), CFSTR("dayGroupAssets"), CFSTR("uuid"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D719E8], "predicateForAllTripHighlights");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3528];
  v15[0] = v7;
  v15[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHPhotosHighlight"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFetchOptions:", v6);

  return v13;
}

+ (id)queryForAssetCollectionsContainingAssets:(id)a3 withType:(int64_t)a4 options:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v20;
  __CFString *v21;
  id v22;
  uint8_t buf[4];
  __CFString *v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v22 = 0;
  objc_msgSend(a1, "_assetIDsFromAssets:anyAsset:", a3, &v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v22;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    switch(a4)
    {
      case 1:
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY assets IN %@"), v9);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = CFSTR("PHAlbum");
        goto LABEL_13;
      case 3:
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY assets IN %@"), v9);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = CFSTR("PHMoment");
        goto LABEL_13;
      case 4:
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY extendedCuratedAssets IN %@"), v9);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = CFSTR("PHMemory");
        goto LABEL_13;
      case 6:
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY assets IN %@"), v9);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = CFSTR("PHPhotosHighlight");
        goto LABEL_13;
      case 7:
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY assets IN %@"), v9);
        v12 = objc_claimAutoreleasedReturnValue();
        +[PHPhotoLibrary sharedMomentSharePhotoLibrary](PHPhotoLibrary, "sharedMomentSharePhotoLibrary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHMoment"), v12, v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 8:
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY keyAssets IN %@"), v9);
        v12 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY representativeAssets IN %@"), v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0CB3528];
        v25[0] = v12;
        v25[1] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "orPredicateWithSubpredicates:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHSuggestion"), v18, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
        break;
      case 9:
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY %K IN %@"), CFSTR("assets"), v9);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = CFSTR("PHImportSession");
LABEL_13:
        +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", v13, v12, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        if ((queryForAssetCollectionsContainingAssets_withType_options__didLog & 1) != 0)
          goto LABEL_5;
        queryForAssetCollectionsContainingAssets_withType_options__didLog = 1;
        PLPhotoKitGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          if ((unint64_t)a4 > 0xB)
            v20 = 0;
          else
            v20 = off_1E35DD478[a4];
          v21 = v20;
          *(_DWORD *)buf = 138412290;
          v24 = v21;
          _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_DEFAULT, "Fetching for asset collection type %@ containing an asset is not supported", buf, 0xCu);

        }
        v14 = 0;
        break;
    }

  }
  else
  {
LABEL_5:
    v14 = 0;
  }
  objc_msgSend(v14, "setFetchOptions:", v8);

  return v14;
}

+ (BOOL)_validateLocalIdentifiers:(id)a3 compatibilityWithFetchType:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  __int128 v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v5;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v21;
    v11 = 1;
    *(_QWORD *)&v8 = 138412546;
    v18 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        +[PHObject identifierCodeFromLocalIdentifier:](PHObject, "identifierCodeFromLocalIdentifier:", v13, v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHPhotoLibrary fetchTypeForLocalIdentifierCode:](PHPhotoLibrary, "fetchTypeForLocalIdentifierCode:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isEqualToString:", v6) & 1) == 0)
        {
          PLPhotoKitGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            v25 = v13;
            v26 = 2112;
            v27 = v6;
            _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_ERROR, "Invalid localIdentifier %@ passed to query for %@", buf, 0x16u);
          }

          v11 = 0;
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v9);
  }
  else
  {
    v11 = 1;
  }

  return v11 & 1;
}

+ (id)queryForAssetCollectionsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_fetchTypeForLocalIdentifiers:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryForType:withIdentifiers:local:options:", v8, v7, 1, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_fetchTypeForLocalIdentifiers:(id)a3
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  __CFString *v9;

  v3 = a3;
  v4 = CFSTR("PHAssetCollection");
  v5 = CFSTR("PHAssetCollection");
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHObject identifierCodeFromLocalIdentifier:](PHObject, "identifierCodeFromLocalIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = v7;
      pl_dispatch_once();
      objc_msgSend((id)_fetchTypeForLocalIdentifierCode_pl_once_object_20, "objectForKeyedSubscript:", v8);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        v4 = CFSTR("PHAssetCollection");
        v9 = CFSTR("PHAssetCollection");
      }

    }
    else
    {
      v4 = CFSTR("PHAssetCollection");
    }

  }
  return v4;
}

+ (id)queryForAssetCollectionsWithType:(int64_t)a3 localIdentifiers:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  _fetchTypeForAssetCollectionTypeAndSubtype(a3, 0x7FFFFFFFFFFFFFFFLL);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryForType:withIdentifiers:local:options:", v10, v9, 1, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)queryForAssetCollectionsWithObjectIDs:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self in %@"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAssetCollection"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v9, "setFetchOptions:", v6);

  return v9;
}

+ (id)queryForMomentsWithOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHMoment"), 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(v5, "setFetchOptions:", v3);

  return v5;
}

+ (id)queryForMomentsBackingMemory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateForAllMomentsFromRepresentativeAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHMoment"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_setCollectionFetchType:", 2);
  return v6;
}

+ (id)queryForMomentsBackingSuggestion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateForAllMomentsFromRepresentativeAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHMoment"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_setCollectionFetchType:", 2);
  return v6;
}

+ (id)queryForPhotosHighlightsContainingMoments:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "objectID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

        if (!v8)
        {
          objc_msgSend(v11, "photoLibrary");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY moments IN %@"), v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHPhotosHighlight"), v13, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)queryForParentHighlightForPhotosHighlight:(id)a3 options:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a3;
  objc_msgSend(v7, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("ANY childPhotosHighlights = %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHPhotosHighlight"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v11, "setFetchOptions:", v5);

  return v11;
}

+ (id)queryForParentHighlightsForPhotosHighlights:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v13);
        if (!v8)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v13), "photoLibrary");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v14, "objectID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v15);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY childPhotosHighlights IN %@"), v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHPhotosHighlight"), v16, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v17, "setFetchOptions:", v6);

  return v17;
}

+ (id)queryForChildrenHighlightsForPhotosHighlight:(id)a3 options:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a3;
  objc_msgSend(v7, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("parentPhotosHighlight = %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHPhotosHighlight"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v11, "setFetchOptions:", v5);

  return v11;
}

+ (id)queryForParentDayGroupHighlightForPhotosHighlight:(id)a3 options:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a3;
  objc_msgSend(v7, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("ANY childDayGroupPhotosHighlights = %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHPhotosHighlight"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v11, "setFetchOptions:", v5);

  return v11;
}

+ (id)queryForChildrenDayGroupHighlightsForPhotosHighlight:(id)a3 options:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a3;
  objc_msgSend(v7, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("parentDayGroupPhotosHighlight = %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHPhotosHighlight"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v11, "setFetchOptions:", v5);

  return v11;
}

+ (id)queryForMomentsInPhotosHighlight:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v3, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("highlight = %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = objc_msgSend(v3, "isSharingSuggestion");
  if ((_DWORD)v6)
  {
    v8 = (void *)MEMORY[0x1E0CB3528];
    v14[0] = v7;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY assets.%K IN %@"), CFSTR("libraryScopeShareState"), &unk_1E3657438);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "andPredicateWithSubpredicates:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v11;
  }
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHMoment"), v7, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)queryForMomentsInMomentList:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  NSObject *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "collectionListSubtype") == 1)
  {
    v8 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v5, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateWithFormat:", CFSTR("highlight.parentPhotosHighlight == %@"), v9);
  }
  else
  {
    if (objc_msgSend(v5, "collectionListSubtype") != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported collectionListSubtype: %li for querying moments within a moment list."), objc_msgSend(v5, "collectionListSubtype"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PLPhotoKitGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v17 = v14;
        _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }

      v12 = 0;
      if (v6)
        goto LABEL_6;
      goto LABEL_7;
    }
    v10 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v5, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateWithFormat:", CFSTR("highlight.parentPhotosHighlight.parentPhotosHighlight == %@"), v9);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHMoment"), v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
LABEL_6:
    objc_msgSend(v12, "setFetchOptions:", v6);
LABEL_7:

  return v12;
}

+ (id)queryForMomentsForFacesWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        +[PHObject uuidFromLocalIdentifier:](PHFace, "uuidFromLocalIdentifier:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v7, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  objc_msgSend(v6, "verifiedPersonTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SUBQUERY(assets, $a, SUBQUERY($a.%K, $f, $f.%K IN %@ AND $f.%K IN %@).@count != 0).@count != 0"), CFSTR("detectedFaces"), CFSTR("uuid"), v7, CFSTR("personForFace.verifiedType"), v14);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SUBQUERY(assets, $a, SUBQUERY($a.%K, $f, $f.%K IN %@).@count != 0).@count != 0"), CFSTR("detectedFaces"), CFSTR("uuid"), v7, v19, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHMoment"), v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setFetchOptions:", v6);
  objc_msgSend(v17, "_setCollectionFetchType:", 2);

  return v17;
}

+ (id)queryForMomentsForPersonsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = a3;
  v6 = a4;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", 0, v7);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__31074;
  v25 = __Block_byref_object_dispose__31075;
  v26 = 0;
  objc_msgSend(v7, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__PHQuery_queryForMomentsForPersonsWithLocalIdentifiers_options___block_invoke;
  v16[3] = &unk_1E35DEB38;
  v10 = v5;
  v17 = v10;
  v11 = v6;
  v18 = v11;
  v12 = v9;
  v19 = v12;
  v20 = &v21;
  objc_msgSend(v8, "performBlockAndWait:", v16);
  if (v22[5])
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v22[5]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHMoment"), v13, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setFetchOptions:", v11);
    objc_msgSend(v14, "_setCollectionFetchType:", 2);
  }
  else
  {
    v14 = 0;
  }

  _Block_object_dispose(&v21, 8);
  return v14;
}

+ (id)queryForMomentsContainingAssetsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        +[PHObject uuidFromLocalIdentifier:](PHAsset, "uuidFromLocalIdentifier:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY assets.uuid IN %@"), v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHMoment"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setFetchOptions:", v6);
  return v16;
}

+ (id)queryForMomentsContainingAssetsWithOIDs:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("ANY assets IN %@"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHMoment"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setFetchOptions:", v6);
  return v9;
}

+ (id)queryForCollectionsInCollectionList:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  const void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "collectionListType") == 1)
  {
    +[PHQuery queryForMomentsInMomentList:options:](PHQuery, "queryForMomentsInMomentList:options:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (const void *)PHQueryForCollectionsInMomentList;
LABEL_9:
    v9 = _Block_copy(v8);
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "collectionListType") == 3 && objc_msgSend(v5, "collectionListSubtype") == 200)
  {
    +[PHQuery queryForAssetCollectionsWithType:subtype:options:](PHQuery, "queryForAssetCollectionsWithType:subtype:options:", 1, 3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (const void *)PHQueryForCollectionsInSmartFolderEvents;
    goto LABEL_9;
  }
  if (objc_msgSend(v5, "collectionListType") == 3 && objc_msgSend(v5, "collectionListSubtype") == 201)
  {
    +[PHQuery queryForAssetCollectionsWithType:subtype:options:](PHQuery, "queryForAssetCollectionsWithType:subtype:options:", 1, 4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (const void *)PHQueryForCollectionsInSmartFolderFaces;
    goto LABEL_9;
  }
  if (objc_msgSend(v5, "collectionListType") == 3 && objc_msgSend(v5, "collectionListSubtype") == 1000000202)
  {
    +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("favorite != 0 AND rejected == 0"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v6, "sharingFilter");
    if (v13 == 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v13 == 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("sharingComposition"), 1);
      }
      else
      {
        if (v13)
        {
          v19 = 0;
          goto LABEL_27;
        }
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("sharingComposition"), 0);
      }
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v19 = (void *)v18;
LABEL_27:
    v20 = (void *)MEMORY[0x1E0CB3528];
    v28[0] = v12;
    v28[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "andPredicateWithSubpredicates:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHMemory"), v22, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "hasAnySortDescriptors") & 1) == 0)
    {
      objc_msgSend(v5, "photoLibrary");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v6, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "setInternalSortDescriptors:", v26);
      v6 = v24;
    }
    objc_msgSend(v7, "setFetchOptions:", v6);
    v9 = _Block_copy((const void *)PHQueryForCollectionsInSmartFolderFavoriteMemories);

LABEL_10:
    v10 = 0;
    if (v7)
      goto LABEL_21;
    goto LABEL_19;
  }
  v14 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v5, "objectID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "predicateWithFormat:", CFSTR("parentFolder = %@"), v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = _Block_copy((const void *)PHQueryForCollectionsInFolder);
LABEL_19:
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHCollection"), v10, v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v7, "setFetchOptions:", v6);
LABEL_21:
  objc_msgSend(v7, "_setContainerCollection:", v5);
  objc_msgSend(v7, "_setIdentificationBlock:", v9);

  return v7;
}

+ (id)queryForCollectionListContainingCollection:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "assetCollectionType") == 3)
  {
    v7 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v5, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateWithFormat:", CFSTR("SUBQUERY(childPhotosHighlights, $cph, ANY $cph.moments == %@).@count > 0"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v5, "objectID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateWithFormat:", CFSTR("SUBQUERY(childPhotosHighlights, $cph, SUBQUERY($cph.childPhotosHighlights, $ccph, ANY $ccph.moments == %@).@count > 0).@count > 0"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0CB3528];
    v28[0] = v9;
    v28[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "orPredicateWithSubpredicates:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHMomentList"), v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "photoLibrary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHCollectionList"), v18, v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        goto LABEL_12;
      goto LABEL_11;
    }
    v20 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v5, "objectID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "predicateWithFormat:", CFSTR("childCollections CONTAINS %@"), v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v6, "includeRootFolder") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT kind IN %@"), &unk_1E3657450);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0CB3528];
      v27[0] = v9;
      v27[1] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "andPredicateWithSubpredicates:", v24);
      v25 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v25;
    }
    objc_msgSend(v5, "photoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHCollectionList"), v9, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v6)
LABEL_11:
    objc_msgSend(v17, "setFetchOptions:", v6);
LABEL_12:

  return v17;
}

+ (id)queryForCollectionListsWithType:(int64_t)a3 localIdentifiers:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  _fetchTypeForCollectionListTypeAndSubtype(a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryForType:withIdentifiers:local:options:", v10, v9, 1, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)queryForCollectionListsWithType:(int64_t)a3 subtype:(int64_t)a4 options:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v23;
  void *v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  _fetchTypeForCollectionListTypeAndSubtype(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 3)
  {
    switch(a4)
    {
      case 0x7FFFFFFFFFFFFFFFLL:
        if (objc_msgSend(v8, "includeFavoriteMemoriesCollectionList"))
        {
          objc_msgSend(&unk_1E3657480, "arrayByAddingObject:", &unk_1E3655CA8);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = &unk_1E3657480;
        }
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind IN %@"), v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
        +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v8, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", v9, v11, v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("kind"), 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "hasAnySortDescriptors") & 1) == 0 && v19)
        {
          +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v8, v10);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = v19;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setInternalSortDescriptors:", v21);

          v8 = v20;
        }
        objc_msgSend(v12, "setFetchOptions:", v8);

        goto LABEL_23;
      case 0xC9:
        v13 = (void *)MEMORY[0x1E0CB3880];
        v14 = 4005;
        break;
      case 0xC8:
        v13 = (void *)MEMORY[0x1E0CB3880];
        v14 = 4004;
        break;
      default:
        v16 = objc_msgSend(v8, "includeFavoriteMemoriesCollectionList");
        if (a4 != 1000000202 || !v16)
        {
          PLPhotoKitGetLog();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109376;
            v26 = 3;
            v27 = 1024;
            v28 = a4;
            _os_log_impl(&dword_1991EC000, v23, OS_LOG_TYPE_ERROR, "Unsupported fetch for collections with type %d and subtype %d", buf, 0xEu);
          }

          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
          v17 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
        v13 = (void *)MEMORY[0x1E0CB3880];
        v14 = 4006;
        break;
    }
    objc_msgSend(v13, "predicateWithFormat:", CFSTR("kind = %d"), v14);
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v11 = (void *)v17;
    goto LABEL_19;
  }
  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind IN %@"), &unk_1E3657468);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", v9, v11, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFetchOptions:", v8);
LABEL_23:

    goto LABEL_24;
  }
  objc_msgSend(a1, "queryForMomentListsWithSubType:options:", a4, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:

  return v12;
}

+ (id)fetchRootFolderIDForAlbumKind:(int)a3 photoLibrary:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v4 = *(_QWORD *)&a3;
  v37 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "photoLibraryForCurrentQueueQoS");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D71898], "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind = %d"), v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIncludesPropertyValues:", 0);
  objc_msgSend(v9, "setResultType:", 1);
  objc_msgSend(v9, "setFetchLimit:", 1);
  objc_msgSend(v9, "setPredicate:", v10);
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__31074;
  v33 = __Block_byref_object_dispose__31075;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__31074;
  v27 = __Block_byref_object_dispose__31075;
  v28 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __54__PHQuery_fetchRootFolderIDForAlbumKind_photoLibrary___block_invoke;
  v18[3] = &unk_1E35DE5F8;
  v21 = &v29;
  v11 = v6;
  v19 = v11;
  v12 = v9;
  v20 = v12;
  v22 = &v23;
  objc_msgSend(v11, "performBlockAndWait:", v18);
  v13 = (void *)v30[5];
  if (v13)
  {
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLPhotoKitGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = v24[5];
      *(_DWORD *)buf = 138412290;
      v36 = v16;
      _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_ERROR, "Failed to fetch root folder %@", buf, 0xCu);
    }

    v14 = 0;
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v14;
}

+ (id)queryForRootAlbumCollectionListWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "albumRootFolderObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_queryForRootCollectionListWithRootFolder:options:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)queryForRootProjectCollectionListWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "projectAlbumRootFolderObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_queryForRootCollectionListWithRootFolder:options:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_queryForRootCollectionListWithRootFolder:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("self = %@"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHCollectionList"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setFetchOptions:", v6);
  return v9;
}

+ (id)queryForTopLevelUserCollectionsWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[PHCollection predicateForUserCollections](PHCollection, "predicateForUserCollections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryForTopLevelCollectionsMatchingPredicate:options:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)queryForTopLevelCollectionsMatchingPredicate:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "albumRootFolderObjectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("parentFolder"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3528];
  v19[0] = v9;
  v19[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("parentFolder"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "hasAnySortDescriptors") & 1) == 0 && v13)
  {
    +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v6, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setInternalSortDescriptors:", v15);

    v6 = v14;
  }
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHCollection"), v12, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFetchOptions:", v6);

  return v16;
}

+ (id)queryForMomentListsWithSubType:(int64_t)a3 containingMoment:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v5, "objectID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "predicateWithFormat:", CFSTR("(kind == %d) AND (moments CONTAINS %@)"), 1, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v6, "objectID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "predicateWithFormat:", CFSTR("(kind == %d) AND (moments CONTAINS %@)"), 2, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0CB3528];
    v26[0] = v9;
    v26[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "orPredicateWithSubpredicates:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "photoLibrary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHMomentList"), v19, v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a3 == 2)
  {
    v21 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v5, "objectID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "predicateWithFormat:", CFSTR("(kind == %d) AND (SUBQUERY(childPhotosHighlights, $cph, SUBQUERY($cph.childPhotosHighlights, $ccph, ANY $ccph.moments == %@).@count > 0).@count > 0)"), 2, v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "photoLibrary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHMomentList"), v16, v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 0;
  }
  else
  {
    if (a3 == 1)
    {
      v7 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v5, "objectID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "predicateWithFormat:", CFSTR("(kind == %d) AND (SUBQUERY(childPhotosHighlights, $cph, ANY $cph.moments == %@).@count > 0)"), 1, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "photoLibrary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHMomentList"), v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
      v9 = 0;
    }
    v16 = 0;
  }
  v24 = v11;

  return v24;
}

+ (id)queryForMomentListsWithSubType:(int64_t)a3 options:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void **v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a3)
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind == %d"), 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHMomentList"), v11, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v9;
      v10 = (void **)v19;
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind == %d"), 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHMomentList"), v12, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v9;
      v10 = &v18;
      break;
    case 0x7FFFFFFFFFFFFFFFLL:
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind == %d OR kind == %d"), 2, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHMomentList"), v7, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v9;
      v10 = &v17;
      break;
    default:
      objc_msgSend(v5, "hasAnySortDescriptors");
      v13 = 0;
      v8 = 0;
      goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "hasAnySortDescriptors") & 1) == 0 && v13)
  {
    +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v5, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setInternalSortDescriptors:", v13);
    v5 = v14;
  }
LABEL_11:
  objc_msgSend(v8, "setFetchOptions:", v5);
  v15 = v8;

  return v15;
}

+ (id)queryForFacesWithOptions:(id)a3
{
  id v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "includeMediaAnalysisProcessingRangeTypes") == 1)
  {
    v4 = CFSTR("%K == 0.0");
  }
  else
  {
    if (objc_msgSend(v3, "includeMediaAnalysisProcessingRangeTypes") != 2)
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = CFSTR("%K > 0.0");
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v4, CFSTR("duration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHFace"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setFetchOptions:", v3);
  return v7;
}

+ (id)queryForSingletonFacesWithOptions:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  v4 = (void *)MEMORY[0x1E0CB3880];
  v5 = a3;
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("%K == NULL"), CFSTR("faceGroup"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == NULL"), CFSTR("personForFace"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHFace"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setFetchOptions:", v5);
  objc_msgSend(v11, "_setCollectionFetchType:", 2);

  return v11;
}

+ (id)queryForFacesInAsset:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v6 || (objc_msgSend(v6, "includeMediaAnalysisProcessingRangeTypes") & 1) != 0)
  {
    v8 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v5, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("assetForFace"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v10);

  }
  if ((objc_msgSend(v6, "includeMediaAnalysisProcessingRangeTypes") & 2) != 0)
  {
    v11 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v5, "objectID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("assetForTemporalDetectedFaces"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v13);

  }
  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHFace"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setFetchOptions:", v6);
  return v16;
}

+ (id)queryForFacesInAssets:(id)a3 options:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  objc_msgSend(a3, "fetchedObjectIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v5 || (objc_msgSend(v5, "includeMediaAnalysisProcessingRangeTypes") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("assetForFace"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  if ((objc_msgSend(v5, "includeMediaAnalysisProcessingRangeTypes") & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("assetForTemporalDetectedFaces"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

  }
  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v5, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHFace"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setFetchOptions:", v5);
  return v12;
}

+ (id)queryForFacesForPerson:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!objc_msgSend(v6, "includeMediaAnalysisProcessingRangeTypes")
    || (objc_msgSend(v6, "includeMediaAnalysisProcessingRangeTypes") & 1) != 0)
  {
    v8 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v5, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("personForFace"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v10);

  }
  if ((objc_msgSend(v6, "includeMediaAnalysisProcessingRangeTypes") & 2) != 0)
  {
    v11 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v5, "objectID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("personForTemporalDetectedFaces"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v13);

  }
  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHFace"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setFetchOptions:", v6);
  return v16;
}

+ (id)queryForFacesInFaceGroup:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("faceGroup = %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHFace"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setFetchOptions:", v6);
  return v11;
}

+ (id)queryForKeyFaceForFaceGroup:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("faceGroupBeingKeyFace == %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHFace"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setFetchOptions:", v6);
  return v11;
}

+ (id)queryForFacesWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a1, "queryForType:withIdentifiers:local:options:", CFSTR("PHFace"), a3, 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchOptions:", v6);

  return v7;
}

+ (id)queryForFacesWithVuObservationIDs:(id)a3 options:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("vuObservationID"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHFace"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setFetchOptions:", v7);
  return v10;
}

+ (id)queryForFacesOnAssetWithFace:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  char v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB3528];
  v8 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v5, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K CONTAINS %@"), CFSTR("assetForFace.detectedFaces"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v10;
  v11 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v5, "objectID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateWithFormat:", CFSTR("%K CONTAINS %@"), CFSTR("assetForTemporalDetectedFaces.temporalDetectedFaces"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "orPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v16 = objc_msgSend(v6, "includeMediaAnalysisProcessingRangeTypes") & 1;
  else
    v16 = 1;
  v17 = objc_msgSend(v6, "includeMediaAnalysisProcessingRangeTypes");
  if (v16 && (v17 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == 0"), CFSTR("duration"));
    }
    else
    {
      if ((v17 & 2) == 0)
      {
LABEL_14:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHQuery.m"), 3763, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("durationPredicate != nil"));

        v19 = 0;
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > 0"), CFSTR("duration"));
    }
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v18;
  if (!v18)
    goto LABEL_14;
LABEL_13:
  v20 = (void *)MEMORY[0x1E0CB3528];
  v29[0] = v15;
  v29[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "andPredicateWithSubpredicates:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHFace"), v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "setFetchOptions:", v6);
  objc_msgSend(v24, "_setCollectionFetchType:", 2);

  return v24;
}

+ (id)queryForFacesOnFaceCrop:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("faceCrop == %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHFace"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setFetchOptions:", v6);
  objc_msgSend(v11, "_setCollectionFetchType:", 2);

  return v11;
}

+ (id)queryForRejectedFacesOnPerson:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("rejectedPersons CONTAINS %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHFace"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setFetchOptions:", v6);
  return v11;
}

+ (id)queryForKeyFaceOnPerson:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setIncludeNonvisibleFaces:", 0);
  v9 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v6, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("personBeingKeyFace"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v8, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHFace"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setFetchOptions:", v8);
  return v13;
}

+ (id)queryForPersonsWithOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHPerson"), 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setFetchOptions:", v3);
  return v5;
}

+ (id)queryForPersonsWithType:(int64_t)a3 options:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  if (a3)
    objc_msgSend(v5, "predicateWithFormat:", CFSTR("type == %d"), a3);
  else
    objc_msgSend(v5, "predicateWithFormat:", CFSTR("noindex:(type) == %d"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHPerson"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setFetchOptions:", v6);
  return v9;
}

+ (id)queryForPersonsWithQuestionType:(unsigned __int16)a3 options:(id)a4
{
  unsigned int v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("questionType == %d"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHPerson"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setFetchOptions:", v6);
  return v9;
}

+ (id)queryForPersonsWithObjectIDs:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self in %@"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "queryForType:withBasePredicate:seedOIDs:inLibrary:", CFSTR("PHPerson"), v9, 0, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setFetchOptions:", v6);
  return v10;
}

+ (id)queryForPersonsInAsset:(id)a3 options:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v12 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "queryForPersonsInAssets:withOptions:", v9, v7, v12, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)queryForPersonsInAssets:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_pl_map:", &__block_literal_global_459);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_queryForPersonsInAssetsWithObjectIDs:withOptions:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)queryForPersonsInAssetsFetchResult:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_assetIDsFromAssets:anyAsset:", v7, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_queryForPersonsInAssetsWithObjectIDs:withOptions:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_queryForPersonsInAssetsWithObjectIDs:(id)a3 withOptions:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("ANY %K.%K IN %@"), CFSTR("detectedFaces"), CFSTR("assetForFace"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHPerson"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setFetchOptions:", v6);
  objc_msgSend(v9, "_setCollectionFetchType:", 2);

  return v9;
}

+ (id)queryForPersonsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        +[PHObject uuidFromLocalIdentifier:](PHObject, "uuidFromLocalIdentifier:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN (%@)"), CFSTR("personUUID"), v7, (_QWORD)v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHPerson"), v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(v16, "setFetchOptions:", v6);

  return v16;
}

+ (id)queryForPersonsWithMdIDs:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v7 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("mdID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN (%@)"), CFSTR("mdID"), v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "andPredicateWithSubpredicates:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHPerson"), v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v13, "setFetchOptions:", v6);

  return v13;
}

+ (id)_queryForPersonsWithFaceRelationshipPredicate:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHPerson"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setFetchOptions:", v5);
  objc_msgSend(v8, "_setCollectionFetchType:", 2);
  return v8;
}

+ (id)queryForPersonsWithContactIdentifiers:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("personUri IN (%@)"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHPerson"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setFetchOptions:", v6);
  return v9;
}

+ (id)queryForPersonWithShareParticipant:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("shareParticipant"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHPerson"), v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setFetchOptions:", v12);
  return v14;
}

+ (id)queryForPersonWithFace:(id)a3 options:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K CONTAINS %@"), CFSTR("detectedFaces"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_queryForPersonsWithFaceRelationshipPredicate:options:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)queryForPersonsWithFaces:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v13);
        v15 = (void *)MEMORY[0x19AEBEADC]();
        objc_msgSend(v14, "objectID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v16);

        objc_autoreleasePoolPop(v15);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY %K IN %@"), CFSTR("detectedFaces"), v8, (_QWORD)v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "photoLibrary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v7, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_queryForPersonsWithFaceRelationshipPredicate:options:", v17, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)queryForRejectedPersonsForFace:(id)a3 options:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("rejectedFaces CONTAINS %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setMinimumVerifiedFaceCount:", 0);
  objc_msgSend(v12, "setMinimumUnverifiedFaceCount:", 0);
  objc_msgSend(a1, "_queryForPersonsWithFaceRelationshipPredicate:options:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)queryForPersonForFaceCrop:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("faceCrops CONTAINS %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setMinimumVerifiedFaceCount:", 0);
  objc_msgSend(v11, "setMinimumUnverifiedFaceCount:", 0);
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHPerson"), v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setFetchOptions:", v11);
  objc_msgSend(v13, "_setCollectionFetchType:", 2);

  return v13;
}

+ (id)queryForAssetsForPersons:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v14, "objectID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v15);

        if (!v11)
          v11 = v14;
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY %K.%K IN %@"), CFSTR("detectedFaces"), CFSTR("personForFace"), v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setFetchOptions:", v6);
  objc_msgSend(v18, "_setCollectionFetchType:", 2);

  return v18;
}

+ (id)queryForKeyAssetForPerson:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("ANY %K.%K = %@"), CFSTR("detectedFaces"), CFSTR("personBeingKeyFace"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)queryForAssetsForFaceGroups:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v36;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v12), "objectID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("faceGroup"), v7);
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)v14;
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHFace"), v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v6;
  objc_msgSend(v17, "setFetchOptions:", v6);
  objc_msgSend(v17, "_setCollectionFetchType:", 2);
  objc_msgSend(v17, "executeQuery");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v20 = v18;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v32;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v24), "objectID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v25);

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v22);
  }

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY %K IN %@"), CFSTR("detectedFaces"), v19);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v26, v16);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFetchOptions:", v30);
  objc_msgSend(v27, "_setCollectionFetchType:", 2);

  return v27;
}

+ (id)queryForAssetsForFaces:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v14, "objectID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v15);

        if (!v11)
          v11 = v14;
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY %K IN %@"), CFSTR("detectedFaces"), v7, (_QWORD)v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setFetchOptions:", v6);
  objc_msgSend(v18, "_setCollectionFetchType:", 2);

  return v18;
}

+ (id)queryForFaceGroupsWithOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHFaceGroup"), 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setFetchOptions:", v3);
  return v5;
}

+ (id)queryForFaceGroupsForPerson:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("ANY %K.%K = %@"), CFSTR("detectedFaces"), CFSTR("personForFace"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHFaceGroup"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setFetchOptions:", v6);
  objc_msgSend(v11, "_setCollectionFetchType:", 2);

  return v11;
}

+ (id)queryForFaceGroupsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a1, "queryForType:withIdentifiers:local:options:", CFSTR("PHFaceGroup"), a3, 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchOptions:", v6);

  return v7;
}

+ (id)queryForFaceGroupsWithFace:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K CONTAINS %@"), CFSTR("detectedFaces"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHFaceGroup"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setFetchOptions:", v6);
  objc_msgSend(v11, "_setCollectionFetchType:", 2);

  return v11;
}

+ (id)queryForEmptyFaceGroupsWithOptions:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K.@count == 0"), CFSTR("detectedFaces"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHFaceGroup"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setFetchOptions:", v4);
  return v7;
}

+ (id)queryForAssociatedPersonForFaceGroup:(id)a3 withOptions:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("associatedFaceGroup = %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHPerson"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setFetchOptions:", v6);
  objc_msgSend(v11, "_setCollectionFetchType:", 2);

  return v11;
}

+ (id)queryForMergeCandidatePersonsForPerson:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("mergeCandidates CONTAINS %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHPerson"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setFetchOptions:", v6);
  objc_msgSend(v11, "_setCollectionFetchType:", 2);

  return v11;
}

+ (id)queryForMergeCandidateWithConfidencePersonsForPerson:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K CONTAINS %@"), CFSTR("mergeCandidatesWithConfidence"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHPerson"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setFetchOptions:", v6);
  objc_msgSend(v11, "_setCollectionFetchType:", 2);

  return v11;
}

+ (id)queryForInvalidMergeCandidatePersonsForPerson:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("invalidMergeCandidates CONTAINS %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHPerson"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setFetchOptions:", v6);
  objc_msgSend(v11, "_setCollectionFetchType:", 2);

  return v11;
}

+ (id)queryForFaceCropsWithOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHFaceCrop"), 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setFetchOptions:", v3);
  return v5;
}

+ (id)queryForFaceCropsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a1, "queryForType:withIdentifiers:local:options:", CFSTR("PHFaceCrop"), a3, 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchOptions:", v6);

  return v7;
}

+ (id)queryForFaceCropsForPerson:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("person"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHFaceCrop"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setFetchOptions:", v6);
  return v11;
}

+ (id)queryForPersonsWithNonNilUserFeedbackWithTypes:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("ANY userFeedbacks.feature IN %@"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHPerson"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setFetchOptions:", v6);
  objc_msgSend(v9, "_setCollectionFetchType:", 2);

  return v9;
}

+ (id)queryForShareParticipantsInShare:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("share"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHShareParticipant"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFetchOptions:", v6);

  return v11;
}

+ (id)queryForShareParticipantsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a1, "queryForType:withIdentifiers:local:options:", CFSTR("PHShareParticipant"), a3, 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchOptions:", v6);

  return v7;
}

+ (id)queryForShareParticipantWithPerson:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("person"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHShareParticipant"), v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setFetchOptions:", v12);
  return v14;
}

+ (id)queryForSuggestionsWithOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHSuggestion"), 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setFetchOptions:", v3);
  return v5;
}

+ (id)queryForSuggestionsWithState:(unsigned __int16)a3 options:(id)a4
{
  unsigned int v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("state = %d"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHSuggestion"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setFetchOptions:", v6);
  return v9;
}

+ (id)queryForSuggestionsWithState:(unsigned __int16)a3 type:(unsigned __int16)a4 subtype:(unsigned __int16)a5 options:(id)a6
{
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[3];

  v6 = a5;
  v7 = a4;
  v8 = a3;
  v20[2] = *MEMORY[0x1E0C80C00];
  v9 = (void *)MEMORY[0x1E0CB3880];
  v10 = a6;
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("state"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("type"), v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  v20[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("subtype"), v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayByAddingObject:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v15;
  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v10, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHSuggestion"), v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setFetchOptions:", v10);
  return v18;
}

+ (id)queryForSuggestionsWithTypes:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("type"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3528];
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHSuggestion"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setFetchOptions:", v6);
  return v12;
}

+ (id)queryForSuggestionsWithFeaturedState:(unsigned __int16)a3 types:(id)a4 options:(id)a5
{
  unsigned int v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];

  v6 = a3;
  v18[2] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB3880];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("featuredState"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("type"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3528];
  v18[0] = v10;
  v18[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v8, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHSuggestion"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setFetchOptions:", v8);
  return v16;
}

+ (id)queryForImportSessionsWithOptions:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasAnySortDescriptors") & 1) == 0 && v4)
  {
    if (v3)
    {
      v5 = objc_msgSend(v3, "copy");

      v3 = (id)v5;
    }
    else
    {
      v3 = (id)objc_opt_new();
    }
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInternalSortDescriptors:", v6);

  }
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHImportSession"), 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setFetchOptions:", v3);
  return v8;
}

+ (id)queryForProjectsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  +[PHQuery queryForAssetCollectionsWithType:localIdentifiers:options:](PHQuery, "queryForAssetCollectionsWithType:localIdentifiers:options:", 10, a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFetchOptions:", v5);

  return v6;
}

+ (id)queryForKeywordsWithOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHKeyword"), 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchOptions:", v3);

  return v5;
}

+ (id)queryForKeywordsWithTitles:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("title"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHKeyword"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFetchOptions:", v6);

  return v9;
}

+ (id)queryForKeywordsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a1, "queryForType:withIdentifiers:local:options:", CFSTR("PHKeyword"), a3, 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchOptions:", v6);

  return v7;
}

+ (id)queryForKeywordsForAsset:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("ANY assetAttributes.asset = %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHKeyword"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFetchOptions:", v6);

  return v11;
}

+ (id)queryForQuestionsWithOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHQuestion"), 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchOptions:", v3);

  return v5;
}

+ (id)queryForQuestionsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("uuid IN (%@)"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHQuestion"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFetchOptions:", v6);

  return v9;
}

+ (id)queryForAnsweredYesOrNoQuestionsWithOptions:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("state = %d OR state = %d"), 2, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHQuestion"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchOptions:", v4);

  return v7;
}

+ (id)queryForAnsweredQuestionsWithOptions:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("state = %d OR state = %d OR state = %d"), 2, 3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHQuestion"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchOptions:", v4);

  return v7;
}

+ (id)queryForQuestionsWithState:(unsigned __int16)a3 options:(id)a4
{
  unsigned int v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("state = %d"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHQuestion"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFetchOptions:", v6);

  return v9;
}

+ (id)queryForCommentsForAsset:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("commentedAsset"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAssetComment"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFetchOptions:", v6);

  return v11;
}

+ (id)queryForLikesForAsset:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("likedAsset"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAssetComment"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFetchOptions:", v6);

  return v11;
}

+ (id)queryforLibraryScopesWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_setLibraryScopeDefaultSortDescriptor:", v9);
  objc_msgSend(a1, "queryForType:withIdentifiers:local:options:", CFSTR("PHLibraryScope"), v7, 1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setFetchOptions:", v9);
  return v10;
}

+ (id)queryForLibraryScopesWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_setLibraryScopeDefaultSortDescriptor:", v6);
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHLibraryScope"), 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setFetchOptions:", v6);
  return v8;
}

+ (id)queryForAssetsUsingSearchIndexLookupIdentifier:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  _QWORD *v8;
  void *v9;

  v6 = a3;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHAsset"), 0, v7);
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)v8[34];
  v8[34] = v6;

  return v8;
}

+ (id)queryForAssetsInUtilityCollectionWithType:(unsigned __int16)a3 options:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  v6 = a4;
  +[PHUtilityCollection searchLookupIdentifierForUtilityCollectionType:](PHUtilityCollection, "searchLookupIdentifierForUtilityCollectionType:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v6, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "queryForAssetsUsingSearchIndexLookupIdentifier:options:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFetchOptions:", v9);

    v6 = (id)v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (unint64_t)maxKeyAssets
{
  return 5;
}

+ (id)identificationBlockForAlbumSortKey:(unsigned int)a3
{
  const void **v3;
  void *v4;
  const void *v5;
  void *v6;
  void *v7;

  v3 = (const void **)&PHQueryForAssetsInAlbum_SortKeyManual;
  switch(a3)
  {
    case 0u:
      goto LABEL_9;
    case 1u:
      v3 = (const void **)&PHQueryForAssetsInAlbum_SortKeyCreationDate;
      goto LABEL_9;
    case 2u:
      v3 = (const void **)&PHQueryForAssetsInAlbum_SortKeyLastModifiedDate;
      goto LABEL_9;
    case 3u:
      v3 = (const void **)&PHQueryForAssetsInAlbum_SortKeyImportDate;
      goto LABEL_9;
    case 4u:
      v3 = (const void **)&PHQueryForAssetsInAlbum_SortKeyTrashDate;
      goto LABEL_9;
    case 5u:
      v3 = (const void **)&PHQueryForAssetsInAlbum_SortKeyTitle;
      goto LABEL_9;
    default:
      if (a3 == 101)
      {
        v3 = (const void **)&PHQueryForAssetsInAlbum_SortKeyContentTitle;
LABEL_9:
        v4 = _Block_copy(*v3);
      }
      else
      {
        v4 = 0;
      }
      if (v4)
        v5 = v4;
      else
        v5 = (const void *)PHQueryForAssetsAlbum_SortKeyOther;
      v6 = _Block_copy(v5);

      v7 = _Block_copy(v6);
      return v7;
  }
}

uint64_t __47__PHQuery_queryForPersonsInAssets_withOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

void __54__PHQuery_fetchRootFolderIDForAlbumKind_photoLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __65__PHQuery_queryForMomentsForPersonsWithLocalIdentifiers_options___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_pl_map:", &__block_literal_global_349);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71940], "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setResultType:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("personUUID"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v4);

  objc_msgSend(*(id *)(a1 + 40), "verifiedPersonTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(v3, "predicate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v7;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("verifiedType"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "andPredicateWithSubpredicates:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPredicate:", v10);

  }
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = *(void **)(a1 + 48);
  v19 = 0;
  objc_msgSend(v12, "executeFetchRequest:error:", v3, &v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v19;
  objc_msgSend(v11, "setWithArray:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0D718E8], "momentIDsWithPersonIDs:inContext:", v15, *(_QWORD *)(a1 + 48));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v18 = *(NSObject **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;
  }
  else
  {
    PLPhotoKitGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v14;
      _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_ERROR, "Failed queryForMomentsForPersonsWithLocalIdentifiers, error fetching person IDs: %@", buf, 0xCu);
    }
  }

}

id __65__PHQuery_queryForMomentsForPersonsWithLocalIdentifiers_options___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[PHObject uuidFromLocalIdentifier:](PHPerson, "uuidFromLocalIdentifier:", a2);
}

uint64_t __45__PHQuery_queryForAssetsForKeywords_options___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

void __43__PHQuery_queryForAssetsForPTPWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D71918], "fetchAssetIdsToExcludeFromPTPInContext:isCloudPhotoLibraryEnabled:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "isCloudPhotoLibraryEnabled"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __40__PHQuery__isKindOfMomentOrAlbumEntity___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D718B0], "managedObjectModel");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "entitiesByName");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D718E8], "entityName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_isKindOfMomentOrAlbumEntity__momentEntity;
  _isKindOfMomentOrAlbumEntity__momentEntity = v2;

  objc_msgSend(MEMORY[0x1E0D71870], "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_isKindOfMomentOrAlbumEntity__albumEntity;
  _isKindOfMomentOrAlbumEntity__albumEntity = v5;

}

@end
