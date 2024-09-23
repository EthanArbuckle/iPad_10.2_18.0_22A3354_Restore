@implementation PHRelatedCollection

- (id)initTransientWithAssets:(id)a3 orFetchResult:(id)a4 relationType:(unint64_t)a5 relatedObject:(id)a6 title:(id)a7 subtitle:(id)a8 titleCategory:(int64_t)a9 highlightLocalIdentifier:(id)a10 momentLocalIdentifiers:(id)a11 debugInfo:(id)a12
{
  id v19;
  id *v20;
  id *v21;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a6;
  v24 = a8;
  v23 = a10;
  v19 = a11;
  v26.receiver = self;
  v26.super_class = (Class)PHRelatedCollection;
  v20 = -[PHAssetCollection initTransientWithAssets:orFetchResult:title:identifier:albumKind:](&v26, sel_initTransientWithAssets_orFetchResult_title_identifier_albumKind_, a3, a4, a7, 0, 0);
  v21 = v20;
  if (v20)
  {
    v20[45] = (id)a5;
    objc_storeStrong(v20 + 47, a6);
    objc_storeStrong(v21 + 48, a10);
    objc_storeStrong(v21 + 49, a11);
    objc_storeStrong(v21 + 50, a8);
    v21[13] = (id)5;
    v21[44] = (id)a9;
  }

  return v21;
}

- (id)localizedSubtitle
{
  return self->_subtitle;
}

- (int64_t)titleCategory
{
  return self->_titleCategory;
}

- (BOOL)canPerformEditOperation:(int64_t)a3
{
  return a3 == 1;
}

- (unint64_t)relationType
{
  return self->_relationType;
}

- (NSArray)debugInfo
{
  return self->_debugInfo;
}

- (PHObject)relatedObject
{
  return self->_relatedObject;
}

- (NSString)highlightLocalIdentifier
{
  return self->_highlightLocalIdentifier;
}

- (NSArray)momentLocalIdentifiers
{
  return self->_momentLocalIdentifiers;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_momentLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_highlightLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_relatedObject, 0);
  objc_storeStrong((id *)&self->_debugInfo, 0);
}

+ (id)_relatedCollectionsFromInfos:(id)a3 relatedObject:(id)a4 photoLibrary:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  PHRelatedCollection *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  PHManualFetchResult *v54;
  void *v55;
  PHManualFetchResult *v56;
  PHRelatedCollection *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  id obj;
  id v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  uint64_t v86;
  uint64_t v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v76 = a5;
  v69 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  obj = v7;
  v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v88, 16);
  if (v70)
  {
    v9 = *(_QWORD *)v82;
    v75 = v8;
    v66 = *(_QWORD *)v82;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v82 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v10);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHRelatedMemoryIdentifierKey"));
        v12 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHRelatedHighlightIdentifierKey"));
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHRelatedMomentIdentifiersKey"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v14;
        v72 = (void *)v13;
        if (v13)
        {
          v15 = v13;
          v16 = (void *)v12;
          v17 = v10;
          v87 = v15;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v87, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          +[PHFetchOptions fetchOptionsWithPhotoLibrary:orObject:](PHFetchOptions, "fetchOptionsWithPhotoLibrary:orObject:", v76, v8);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:options:](PHAssetCollection, "fetchAssetCollectionsWithLocalIdentifiers:options:", v18, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "firstObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
            objc_msgSend(v69, "addObject:", v21);
LABEL_17:
          v10 = v17;
          goto LABEL_18;
        }
        v22 = v14;
        if (objc_msgSend(v14, "count") == 1)
        {
          v67 = (void *)v12;
          objc_msgSend(v22, "firstObject");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[PHObject uuidFromLocalIdentifier:](PHObject, "uuidFromLocalIdentifier:", v23);
          v24 = objc_claimAutoreleasedReturnValue();

          +[PHFetchOptions fetchOptionsWithPhotoLibrary:orObject:](PHFetchOptions, "fetchOptionsWithPhotoLibrary:orObject:", v76, v8);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = (void *)v24;
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid = %@"), v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setPredicate:", v26);
          +[PHAssetCollection fetchMomentsWithOptions:](PHAssetCollection, "fetchMomentsWithOptions:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "lastObject");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            +[PHAsset fetchAssetsInAssetCollection:options:](PHAsset, "fetchAssetsInAssetCollection:options:", v28, 0);
            v29 = v10;
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = [PHRelatedCollection alloc];
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHRelatedSuggestedTitleKey"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHRelatedSuggestedSubtitleKey"));
            v33 = objc_claimAutoreleasedReturnValue();
            v34 = v11;
            v35 = (void *)v33;
            objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("PHRelatedTitleCategoryKey"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = -[PHRelatedCollection initTransientWithAssets:orFetchResult:relationType:relatedObject:title:subtitle:titleCategory:highlightLocalIdentifier:momentLocalIdentifiers:debugInfo:](v31, "initTransientWithAssets:orFetchResult:relationType:relatedObject:title:subtitle:titleCategory:highlightLocalIdentifier:momentLocalIdentifiers:debugInfo:", 0, v30, 63, v75, v32, v35, objc_msgSend(v36, "integerValue"), 0, v22, 0);

            v8 = v75;
            objc_msgSend(v69, "addObject:", v37);

            v10 = v29;
          }

          v9 = v66;
          v16 = v67;
          v21 = v73;
        }
        else
        {
          if (v12)
          {
            v17 = v10;
            objc_msgSend(v76, "librarySpecificFetchOptions");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "setIncludeLocalMemories:", 1);
            objc_msgSend(v38, "setFetchLimit:", 1);
            v16 = (void *)v12;
            v86 = v12;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v38;
            +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:options:](PHAssetCollection, "fetchAssetCollectionsWithLocalIdentifiers:options:", v39, v38);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "firstObject");
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            if (v41)
              objc_msgSend(v69, "addObject:", v41);

            goto LABEL_17;
          }
          v64 = v11;
          v65 = v10;
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = 0u;
          v78 = 0u;
          v79 = 0u;
          v80 = 0u;
          v42 = v22;
          v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
          if (v43)
          {
            v44 = v43;
            v45 = *(_QWORD *)v78;
            do
            {
              for (i = 0; i != v44; ++i)
              {
                if (*(_QWORD *)v78 != v45)
                  objc_enumerationMutation(v42);
                +[PHObject uuidFromLocalIdentifier:](PHObject, "uuidFromLocalIdentifier:", *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i));
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                +[PHFetchOptions fetchOptionsWithPhotoLibrary:orObject:](PHFetchOptions, "fetchOptionsWithPhotoLibrary:orObject:", v76, v8);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid = %@"), v47);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "setPredicate:", v49);
                +[PHAssetCollection fetchMomentsWithOptions:](PHAssetCollection, "fetchMomentsWithOptions:", v48);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "lastObject");
                v51 = (void *)objc_claimAutoreleasedReturnValue();

                if (v51)
                {
                  +[PHAsset fetchAssetsInAssetCollection:options:](PHAsset, "fetchAssetsInAssetCollection:options:", v51, 0);
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "fetchedObjectIDs");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v53)
                    objc_msgSend(v74, "addObjectsFromArray:", v53);

                  v8 = v75;
                }

              }
              v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
            }
            while (v44);
          }

          v54 = [PHManualFetchResult alloc];
          +[PHAsset fetchType](PHAsset, "fetchType");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = -[PHManualFetchResult initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:](v54, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v74, v76, v55, 0, 0, 1);

          v57 = [PHRelatedCollection alloc];
          objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("PHRelatedSuggestedTitleKey"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("PHRelatedSuggestedSubtitleKey"));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("PHRelatedTitleCategoryKey"));
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = -[PHRelatedCollection initTransientWithAssets:orFetchResult:relationType:relatedObject:title:subtitle:titleCategory:highlightLocalIdentifier:momentLocalIdentifiers:debugInfo:](v57, "initTransientWithAssets:orFetchResult:relationType:relatedObject:title:subtitle:titleCategory:highlightLocalIdentifier:momentLocalIdentifiers:debugInfo:", 0, v56, 63, v8, v58, v59, objc_msgSend(v60, "integerValue"), 0, v42, 0);

          objc_msgSend(v69, "addObject:", v61);
          v21 = v74;

          v10 = v65;
          v9 = v66;
          v16 = 0;
        }
LABEL_18:

        ++v10;
      }
      while (v10 != v70);
      v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v88, 16);
      v70 = v62;
    }
    while (v62);
  }

  return v69;
}

+ (id)transientCollectionListWithCollectionsRelatedToObject:(id)a3 relationType:(unint64_t)a4 options:(id)a5
{
  id v8;
  id v9;
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
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t buf[4];
  id v79;
  __int16 v80;
  id v81;
  void *v82;
  _BYTE v83[128];
  _QWORD v84[2];
  _QWORD v85[4];

  v85[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "photoAnalysisClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v62 = a1;
    v12 = (void *)MEMORY[0x1E0C99E08];
    v84[0] = CFSTR("PHRelatedOptionRelationOptionsKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v84[1] = CFSTR("PHRelatedOptionIsDiversityEnabledKey");
    v85[0] = v13;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v9, "enableDiversity"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v85[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryWithDictionary:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "referenceAsset");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "localIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("PHRelatedOptionReferenceAssetIdentifier"));

    }
    objc_msgSend(v9, "excludedAssetCollections");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v16;
    v65 = v11;
    if (objc_msgSend(v63, "count"))
    {
      v59 = v18;
      v60 = v9;
      v61 = v8;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v63, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = 0u;
      v75 = 0u;
      v76 = 0u;
      v77 = 0u;
      v21 = v63;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v75;
        v66 = v21;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v75 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
            switch(objc_msgSend(v26, "assetCollectionType"))
            {
              case 3:
                v28 = v14;
                objc_msgSend(v26, "localIdentifier");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                +[PHFetchOptions fetchOptionsWithPhotoLibrary:orObject:](PHFetchOptions, "fetchOptionsWithPhotoLibrary:orObject:", 0, v26);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v82 = v26;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                +[PHAssetCollection fetchPhotosHighlightsContainingMoments:options:](PHAssetCollection, "fetchPhotosHighlightsContainingMoments:options:", v30, v29);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "firstObject");
                v32 = (void *)objc_claimAutoreleasedReturnValue();

                if (v32)
                {
                  objc_msgSend(v32, "localIdentifier");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "addObject:", v33);

                }
                v14 = v28;
                v21 = v66;
                if (v27)
                  goto LABEL_18;
                break;
              case 4:
              case 6:
                objc_msgSend(v26, "localIdentifier");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                if (v27)
                  goto LABEL_18;
                break;
              case 5:
                v34 = v26;
                objc_msgSend(v34, "highlightLocalIdentifier");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "momentLocalIdentifiers");
                v35 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v20, "addObjectsFromArray:", v35);
                if (v27)
                {
LABEL_18:
                  objc_msgSend(v20, "addObject:", v27);

                }
                break;
              default:
                continue;
            }
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
        }
        while (v23);
      }

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v20);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v64;
      objc_msgSend(v64, "setObject:forKeyedSubscript:", v36, CFSTR("PHRelatedOptionFilteringLocalIdentifiers"));

      v9 = v60;
      v8 = v61;
      v11 = v65;
      v18 = v59;
    }
    v37 = objc_msgSend(v9, "fetchLimit");
    if (v37)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v38, CFSTR("PHRelatedOptionFetchLimitKey"));

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "localIdentifier");
      v39 = (id)objc_claimAutoreleasedReturnValue();
      v73 = 0;
      objc_msgSend(v11, "requestAssetCollectionsRelatedToAssetWithLocalIdentifier:options:error:", v39, v16, &v73);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v73;
      goto LABEL_45;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v47 = v8;
        objc_msgSend(v47, "localIdentifier");
        v39 = (id)objc_claimAutoreleasedReturnValue();
        v69 = 0;
        objc_msgSend(v11, "requestAssetCollectionsRelatedToAssetCollectionWithLocalIdentifier:options:error:", v39, v16, &v69);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v69;

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          PLPhotoKitGetLog();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v79 = v8;
            _os_log_impl(&dword_1991EC000, v50, OS_LOG_TYPE_ERROR, "Invalid PHObject type for related query: %@", buf, 0xCu);
          }

          v41 = 0;
          goto LABEL_47;
        }
        v39 = v8;
        if (objc_msgSend(v39, "assetCollectionType") == 3
          || objc_msgSend(v39, "assetCollectionType") == 6
          || objc_msgSend(v39, "assetCollectionType") == 1
          || objc_msgSend(v39, "assetCollectionType") == 2 && objc_msgSend(v39, "assetCollectionSubtype") != 200)
        {
          objc_msgSend(v39, "localIdentifier");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = 0;
          objc_msgSend(v11, "requestAssetCollectionsRelatedToAssetCollectionWithLocalIdentifier:options:error:", v48, v16, &v68);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v68;

        }
        else
        {
          +[PHAssetCollection graphOptionsForTransientAssetCollection:needsCompleteMomentsInfo:options:](PHAssetCollection, "graphOptionsForTransientAssetCollection:needsCompleteMomentsInfo:options:", v39, 0, 0);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addEntriesFromDictionary:", v58);

          v67 = 0;
          objc_msgSend(v11, "requestAssetCollectionsRelatedToAssetCollectionWithLocalIdentifier:options:error:", 0, v16, &v67);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v67;
        }
      }
LABEL_45:

      if (v40)
      {
        objc_msgSend(v8, "photoLibrary");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "_relatedCollectionsFromInfos:relatedObject:photoLibrary:", v40, v8, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "photoLibrary");
        v54 = v18;
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHCollectionList transientCollectionListWithCollections:title:identifier:photoLibrary:](PHCollectionList, "transientCollectionListWithCollections:title:identifier:photoLibrary:", v53, 0, 0, v55);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = v54;
LABEL_50:

        v11 = v65;
        goto LABEL_51;
      }
LABEL_47:
      PLPhotoKitGetLog();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v79 = v8;
        v80 = 2112;
        v81 = v41;
        _os_log_impl(&dword_1991EC000, v56, OS_LOG_TYPE_ERROR, "Request for asset collections related to object %@ failed with error %@", buf, 0x16u);
      }

      objc_msgSend(v8, "photoLibrary");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHCollectionList transientCollectionListWithCollections:title:identifier:photoLibrary:](PHCollectionList, "transientCollectionListWithCollections:title:identifier:photoLibrary:", MEMORY[0x1E0C9AA60], 0, 0, v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_50;
    }
    v39 = v8;
    objc_msgSend(v39, "highlightLocalIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "momentLocalIdentifiers");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v44;
    if (v43)
    {
      v72 = 0;
      objc_msgSend(v11, "requestAssetCollectionsRelatedToAssetCollectionWithLocalIdentifier:options:error:", v43, v16, &v72);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v72;
    }
    else
    {
      if (objc_msgSend(v44, "count") == 1)
      {
        objc_msgSend(v45, "firstObject");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = 0;
        objc_msgSend(v11, "requestAssetCollectionsRelatedToMomentWithLocalIdentifier:options:error:", v49, v16, &v71);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v71;

LABEL_44:
        goto LABEL_45;
      }
      +[PHAssetCollection graphOptionsForTransientAssetCollection:needsCompleteMomentsInfo:options:](PHAssetCollection, "graphOptionsForTransientAssetCollection:needsCompleteMomentsInfo:options:", v39, 0, 0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addEntriesFromDictionary:", v51);

      v70 = 0;
      objc_msgSend(v11, "requestAssetCollectionsRelatedToAssetCollectionWithLocalIdentifier:options:error:", 0, v16, &v70);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v70;
    }
    v41 = v46;
    goto LABEL_44;
  }
  +[PHCollectionList transientCollectionListWithCollections:title:](PHCollectionList, "transientCollectionListWithCollections:title:", MEMORY[0x1E0C9AA60], 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_51:

  return v42;
}

+ (id)transientCollectionListWithCollectionsRelatedToPersons:(id)a3 relationType:(unint64_t)a4 options:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "_pl_map:", &__block_literal_global_25764);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(v8, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "photoLibrary");
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(a1, "_transientCollectionListWithCollectionsRelatedToLocalIdentifiers:relationType:options:photoLibrary:", v10, a4, v9, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_transientCollectionListWithCollectionsRelatedToLocalIdentifiers:(id)a3 relationType:(unint64_t)a4 options:(id)a5 photoLibrary:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v12, "photoAnalysisClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0C99E08];
    v28 = CFSTR("PHRelatedOptionRelationOptionsKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryWithDictionary:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v11, "fetchLimit");
    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("PHRelatedOptionFetchLimitKey"));

    }
    objc_msgSend(v11, "referenceAsset");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      objc_msgSend(v20, "localIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v22, CFSTR("PHRelatedOptionReferenceAssetIdentifier"));

    }
    v27 = 0;
    objc_msgSend(v13, "requestAssetCollectionsRelatedToPersonLocalIdentifiers:options:error:", v10, v17, &v27);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(a1, "_relatedCollectionsFromInfos:relatedObject:photoLibrary:", v23, 0, v12);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHCollectionList transientCollectionListWithCollections:title:identifier:photoLibrary:](PHCollectionList, "transientCollectionListWithCollections:title:identifier:photoLibrary:", v24, 0, 0, v12);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[PHCollectionList transientCollectionListWithCollections:title:identifier:photoLibrary:](PHCollectionList, "transientCollectionListWithCollections:title:identifier:photoLibrary:", MEMORY[0x1E0C9AA60], 0, 0, v12);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    +[PHCollectionList transientCollectionListWithCollections:title:](PHCollectionList, "transientCollectionListWithCollections:title:", MEMORY[0x1E0C9AA60], 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v25;
}

uint64_t __99__PHRelatedCollection_transientCollectionListWithCollectionsRelatedToPersons_relationType_options___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localIdentifier");
}

@end
