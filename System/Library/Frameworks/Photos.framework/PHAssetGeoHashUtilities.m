@implementation PHAssetGeoHashUtilities

+ (id)assetUUIDsFromBiomeStream
{
  void *v3;
  char v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a1, "_newSystemPhotoLibrary");
  v9 = 0;
  v4 = objc_msgSend(v3, "openAndWaitWithUpgrade:error:", 0, &v9);
  v5 = v9;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(a1, "assetUUIDsFromBiomeStreamWithPhotoLibrary:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "close");
  }
  else
  {
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "[PHAssetGeoHashUtilities] Error opening system photo library: %@", buf, 0xCu);
    }

    v6 = 0;
  }

  return v6;
}

+ (id)assetUUIDsFromBiomeStreamWithPhotoLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint8_t v19[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D71690];
  objc_msgSend(v4, "photoLibraryBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "publishedUUIDsInStream:pathManager:", 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0D71690];
    objc_msgSend(v4, "photoLibraryBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pathManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "publishedUUIDsInStream:pathManager:", 1, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v13);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PLBackendGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_ERROR, "[PHAssetGeoHashUtilities] Failed to retrieve sent UUIDs from Biome", v19, 2u);
      }

      v14 = objc_alloc_init(MEMORY[0x1E0C99E60]);
    }
    v17 = v14;
    objc_msgSend(a1, "_randomPublishedUUIDsFromPublishedUUIDs:sentUUIDs:", v9, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "[PHAssetGeoHashUtilities] Failed to retrieve published UUIDs from Biome", buf, 2u);
    }
    v15 = 0;
  }

  return v15;
}

+ (id)featureVectorByGeoHashForAssetUUID:(id)a3 geoHashSize:(id)a4 geoHashKeySize:(id)a5 sceneLabelMapping:(id)a6 dryRun:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v12 = (void *)MEMORY[0x1E0C99D20];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v12, "arrayWithObjects:count:", &v22, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "featureVectorByGeoHashForAssetUUIDs:geoHashSize:geoHashKeySize:sceneLabelMapping:dryRun:", v18, v16, v15, v14, v13, v22, v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)featureVectorByGeoHashForAssetUUID:(id)a3 geoHashSize:(id)a4 geoHashKeySize:(id)a5 sceneLabelMapping:(id)a6 dryRun:(id)a7 photoLibrary:(id)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v14 = (void *)MEMORY[0x1E0C99D20];
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  objc_msgSend(v14, "arrayWithObjects:count:", &v25, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "featureVectorByGeoHashForAssetUUIDs:geoHashSize:geoHashKeySize:sceneLabelMapping:dryRun:photoLibrary:", v21, v19, v18, v17, v16, v15, v25, v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)featureVectorByGeoHashForAssetUUIDs:(id)a3 geoHashSize:(id)a4 geoHashKeySize:(id)a5 sceneLabelMapping:(id)a6 dryRun:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v20;
  char v21;
  id v22;
  NSObject *v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (objc_msgSend(v14, "integerValue") >= 1 && (unint64_t)objc_msgSend(v14, "integerValue") < 5)
  {
    if (objc_msgSend(v16, "BOOLValue"))
    {
      objc_msgSend(a1, "mockReturnDataWithAssetUUIDs:geoHashKeySize:", v12, v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = (void *)objc_msgSend(a1, "_newSystemPhotoLibrary");
      v24 = 0;
      v21 = objc_msgSend(v20, "openAndWaitWithUpgrade:error:", 0, &v24);
      v22 = v24;
      if ((v21 & 1) != 0)
      {
        objc_msgSend(a1, "featureVectorByGeoHashForAssetUUIDs:geoHashSize:geoHashKeySize:sceneLabelMapping:dryRun:photoLibrary:", v12, v13, v14, v15, v16, v20);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "close");
      }
      else
      {
        PLBackendGetLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v22;
          _os_log_impl(&dword_1991EC000, v23, OS_LOG_TYPE_ERROR, "[PHAssetGeoHashUtilities] Error opening system photo library: %@", buf, 0xCu);
        }

        v18 = 0;
      }

    }
  }
  else
  {
    PLBackendGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v14;
      v27 = 2048;
      v28 = 4;
      _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_ERROR, "[PHAssetGeoHashUtilities] geoHashKeySize %@ not supported. It should be a number between 1 and %tu (inclusive).", buf, 0x16u);
    }

    v18 = 0;
  }

  return v18;
}

+ (id)featureVectorByGeoHashForAssetUUIDs:(id)a3 geoHashSize:(id)a4 geoHashKeySize:(id)a5 sceneLabelMapping:(id)a6 dryRun:(id)a7 photoLibrary:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  BOOL v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t j;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id obj;
  void *context;
  uint64_t v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  void *v80;
  void *v81;
  _BYTE v82[128];
  const __CFString *v83;
  uint8_t buf[4];
  id v85;
  __int16 v86;
  uint64_t v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v66 = a4;
  v15 = a5;
  v70 = a6;
  v16 = a7;
  v17 = a8;
  if (objc_msgSend(v15, "integerValue") >= 1 && (unint64_t)objc_msgSend(v15, "integerValue") < 5)
  {
    if (objc_msgSend(v16, "BOOLValue"))
    {
      objc_msgSend(a1, "mockReturnDataWithAssetUUIDs:geoHashKeySize:", v14, v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v61 = v16;
      v65 = v15;
      v21 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v70, "allValues");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setWithArray:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v64 = v23;
      objc_msgSend(v23, "allObjects");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "sortedArrayUsingSelector:", sel_compare_);
      v25 = objc_claimAutoreleasedReturnValue();

      v60 = v17;
      objc_msgSend(v17, "librarySpecificFetchOptions");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = CFSTR("PHAssetPropertySetSceneAnalysis");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setFetchPropertySets:", v27);

      v62 = v14;
      v59 = v26;
      +[PHAsset fetchAssetsWithLocalIdentifiers:options:](PHAsset, "fetchAssetsWithLocalIdentifiers:options:", v14, v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v75 = 0u;
      v76 = 0u;
      v77 = 0u;
      v78 = 0u;
      obj = v28;
      v30 = v66;
      v63 = (void *)v25;
      v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v82, 16);
      if (v69)
      {
        v31 = *(_QWORD *)v76;
        while (2)
        {
          for (i = 0; i != v69; ++i)
          {
            if (*(_QWORD *)v76 != v31)
              objc_enumerationMutation(obj);
            v33 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
            v34 = (void *)MEMORY[0x19AEBEADC]();
            v35 = objc_msgSend(a1, "_randomSceneIndexForAsset:sceneLabelMapping:orderedRemappedSceneLabels:", v33, v70, v25);
            if (v35 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v36 = v35;
              context = v34;
              objc_msgSend(a1, "_poiGeoHashForAsset:geoHashSize:", v33, objc_msgSend(v30, "integerValue"));
              v37 = a1;
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              if (v38)
              {
                v39 = objc_msgSend(v37, "_indexForPOIGeoHash:geoHashKeySize:", v38, objc_msgSend(v65, "integerValue"));
                v40 = (unint64_t)exp2((double)(objc_msgSend(v30, "integerValue") - objc_msgSend(v65, "integerValue"))* 5.0);
                objc_msgSend(v37, "_featureVectorDataWithOneHotAtIndex:featureVectorSize:", v39 + v36 * v40, objc_msgSend(v64, "count") * v40);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = (uint64_t)v63;
                objc_msgSend(v38, "substringWithRange:", 0, objc_msgSend(v65, "integerValue"));
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v80 = v42;
                v81 = v41;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "uuid");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "setObject:forKeyedSubscript:", v43, v44);

                v45 = objc_msgSend(v29, "count");
                v46 = v45 > 9;
                v30 = v66;
                if (v46)
                {

                  objc_autoreleasePoolPop(context);
                  goto LABEL_22;
                }
              }

              a1 = v37;
              v34 = context;
            }
            objc_autoreleasePoolPop(v34);
          }
          v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v82, 16);
          if (v69)
            continue;
          break;
        }
      }
LABEL_22:

      v17 = v60;
      if (objc_msgSend(v29, "count"))
      {
        v47 = (void *)MEMORY[0x1E0D71690];
        objc_msgSend(v29, "allKeys");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "photoLibraryBundle");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "pathManager");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "publishUUIDs:stream:pathManager:", v48, 1, v50);

      }
      v14 = v62;
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v62, "count"));
      v71 = 0u;
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v51 = v62;
      v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
      if (v52)
      {
        v53 = v52;
        v54 = *(_QWORD *)v72;
        v55 = (void *)MEMORY[0x1E0C9AA70];
        do
        {
          for (j = 0; j != v53; ++j)
          {
            if (*(_QWORD *)v72 != v54)
              objc_enumerationMutation(v51);
            objc_msgSend(v29, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * j));
            v57 = objc_claimAutoreleasedReturnValue();
            if (v57)
              v58 = (void *)v57;
            else
              v58 = v55;
            objc_msgSend(v19, "addObject:", v58);

          }
          v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
        }
        while (v53);
      }

      v15 = v65;
      v16 = v61;
    }
  }
  else
  {
    PLBackendGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v85 = v15;
      v86 = 2048;
      v87 = 4;
      _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_ERROR, "[PHAssetGeoHashUtilities] geoHashKeySize %@ not supported. It should be a number between 1 and %tu (inclusive).", buf, 0x16u);
    }

    v19 = 0;
  }

  return v19;
}

+ (id)mockReturnDataWithAssetUUIDs:(id)a3 geoHashKeySize:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
        objc_msgSend(a1, "_featureVectorDataWithOneHotAtIndex:featureVectorSize:", 1, 3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "substringWithRange:", 0, objc_msgSend(v7, "integerValue"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v15;
        v24 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v16);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v10);
  }

  return v8;
}

+ (unint64_t)_randomSceneIndexForAsset:(id)a3 sceneLabelMapping:(id)a4 orderedRemappedSceneLabels:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v27 = a5;
  objc_msgSend(v8, "sceneClassifications");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_sceneLabelsForSceneClassifications:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  PLBackendGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v34 = v13;
    v35 = 2112;
    v36 = v11;
    _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_INFO, "[PHAssetGeoHashUtilities] Scene labels for asset %@: %@", buf, 0x16u);

  }
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v15 = v11;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v29;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v29 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v19), "lowercaseString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
          objc_msgSend(v14, "addObject:", v21);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v17);
  }

  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(a1, "_randomIndexFromCount:", objc_msgSend(v14, "count")));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v27;
    v24 = objc_msgSend(v27, "indexOfObject:", v22);
  }
  else
  {
    PLBackendGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v27;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "uuid");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v34 = v25;
      v35 = 2112;
      v36 = v15;
      _os_log_impl(&dword_1991EC000, v22, OS_LOG_TYPE_DEFAULT, "[PHAssetGeoHashUtilities] Scene labels for asset %@ are empty after remapping. Scene Labels: %@", buf, 0x16u);

    }
    v24 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v24;
}

+ (id)_sceneLabelsForSceneClassifications:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(a1, "sceneLabelExclusionList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0D75250]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v14 = objc_msgSend(v7, "nodeRefForExtendedSceneClassId:", objc_msgSend(v13, "extendedSceneIdentifier", (_QWORD)v25));
        v15 = PFSceneTaxonomyNodeNetworkId();
        if (v14)
          v16 = v15 == 1;
        else
          v16 = 0;
        if (v16)
        {
          objc_msgSend(v13, "confidence");
          v18 = v17;
          PFSceneTaxonomyNodeSearchThreshold();
          if (v18 >= v19)
          {
            PFSceneTaxonomyNodeName();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v20;
            if (v20)
            {
              objc_msgSend(v20, "lowercaseString");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v6, "containsObject:", v22);

              if ((v23 & 1) == 0)
                objc_msgSend(v5, "addObject:", v21);
            }

          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v10);
  }

  return v5;
}

+ (unint64_t)_randomIndexFromCount:(unint64_t)a3
{
  return arc4random_uniform(a3);
}

+ (unint64_t)_indexForPOIGeoHash:(id)a3 geoHashKeySize:(unint64_t)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;

  v5 = a3;
  objc_msgSend(v5, "substringWithRange:", a4, objc_msgSend(v5, "length") - a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  if (objc_msgSend(v6, "length"))
  {
    v8 = 0;
    do
    {
      objc_msgSend(v6, "substringWithRange:", v8, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(CFSTR("0123456789bcdefghjkmnpqrstuvwxyz"), "rangeOfString:", v9);
      v7 = (unint64_t)((double)v7 + exp2((double)v8 * 5.0) * (double)v10);

      ++v8;
    }
    while (v8 < objc_msgSend(v6, "length"));
  }

  return v7;
}

+ (id)_featureVectorDataWithOneHotAtIndex:(unint64_t)a3 featureVectorSize:(unint64_t)a4
{
  _BYTE *v6;
  void *v10;

  if (a3 >= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHAssetGeoHashUtilities.m"), 242, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("oneHotIndex < featureVectorSize"));

  }
  v6 = malloc_type_calloc(a4, 1uLL, 0x100004077774924uLL);
  v6[a3] = 1;
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v6, a4);
}

+ (id)_newSystemPhotoLibrary
{
  PHPhotoLibrary *v2;
  void *v3;
  PHPhotoLibrary *v4;

  v2 = [PHPhotoLibrary alloc];
  +[PHPhotoLibrary systemPhotoLibraryURL](PHPhotoLibrary, "systemPhotoLibraryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PHPhotoLibrary initWithPhotoLibraryURL:](v2, "initWithPhotoLibraryURL:", v3);

  return v4;
}

+ (id)_randomPublishedUUIDsFromPublishedUUIDs:(id)a3 sentUUIDs:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint32_t v10;
  id v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t j;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7 > 0x64)
  {
    v10 = v7;
    objc_msgSend(v5, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    for (i = 0; i != 100; ++i)
    {
      v13 = arc4random_uniform(v10);
      objc_msgSend(v8, "objectAtIndexedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v6, "containsObject:", v14);

      for (j = 0; j != 100; ++j)
      {
        if ((objc_msgSend(v11, "containsIndex:", v13) | v15) != 1)
          break;
        v13 = arc4random_uniform(j);
      }
      objc_msgSend(v11, "addIndex:", v13);
    }
    objc_msgSend(v8, "objectsAtIndexes:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v8, "minusSet:", v6);
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)sceneLabelExclusionList
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E36575B8);
}

+ (id)poiGeoHashWithGeoHashSize:(unint64_t)a3 latitude:(double)a4 longitude:(double)a5
{
  NSObject *v8;
  unint64_t v9;
  unint64_t v10;
  char v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  int v23;
  unint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a4 == 0.0 && a5 == 0.0)
  {
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_DEFAULT, "[PHAssetGeoHashUtilities] Invalid coordinates", (uint8_t *)&v23, 2u);
    }
    goto LABEL_22;
  }
  v8 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (-[NSObject length](v8, "length") >= a3)
  {
LABEL_18:
    v8 = v8;
    v20 = v8;
    goto LABEL_23;
  }
  v9 = 0;
  v10 = 0;
  v11 = 1;
  v12 = -180.0;
  v13 = 180.0;
  v14 = -90.0;
  v15 = 90.0;
  while (1)
  {
    if ((v11 & 1) != 0)
    {
      v16 = (v12 + v13) * 0.5;
      v17 = v14;
      if (v16 >= a5)
      {
        v13 = (v12 + v13) * 0.5;
        goto LABEL_13;
      }
LABEL_11:
      objc_msgSend(&unk_1E36575D0, "objectAtIndexedSubscript:", v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v9 |= objc_msgSend(v18, "integerValue");

      v12 = v16;
      v14 = v17;
      goto LABEL_13;
    }
    v17 = (v14 + v15) * 0.5;
    v16 = v12;
    if (v17 < a4)
      goto LABEL_11;
    v15 = (v14 + v15) * 0.5;
LABEL_13:
    if (v10 > 3)
      break;
    ++v10;
LABEL_17:
    v11 ^= 1u;
    if (-[NSObject length](v8, "length") >= a3)
      goto LABEL_18;
  }
  if (v9 < objc_msgSend(CFSTR("0123456789bcdefghjkmnpqrstuvwxyz"), "length"))
  {
    objc_msgSend(CFSTR("0123456789bcdefghjkmnpqrstuvwxyz"), "substringWithRange:", v9, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject appendString:](v8, "appendString:", v19);

    v10 = 0;
    v9 = 0;
    goto LABEL_17;
  }
  PLBackendGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 134218240;
    v24 = v9;
    v25 = 2048;
    v26 = objc_msgSend(CFSTR("0123456789bcdefghjkmnpqrstuvwxyz"), "length");
    _os_log_impl(&dword_1991EC000, v21, OS_LOG_TYPE_DEFAULT, "[PHAssetGeoHashUtilities] Character index (%lu) is larger than base32 length (%lu).", (uint8_t *)&v23, 0x16u);
  }

LABEL_22:
  v20 = 0;
LABEL_23:

  return v20;
}

+ (id)_poiGeoHashForAsset:(id)a3 geoHashSize:(unint64_t)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coordinate");
  v8 = v7;

  objc_msgSend(v5, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "coordinate");
  v11 = v10;

  if (v8 == 0.0 && v11 == 0.0)
  {
    PLBackendGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v13;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_DEFAULT, "[PHAssetGeoHashUtilities] Invalid coordinates for asset uuid %@", (uint8_t *)&v16, 0xCu);

    }
    v14 = 0;
  }
  else
  {
    +[PHAssetGeoHashUtilities poiGeoHashWithGeoHashSize:latitude:longitude:](PHAssetGeoHashUtilities, "poiGeoHashWithGeoHashSize:latitude:longitude:", a4, v8, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

@end
