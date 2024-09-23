@implementation PHMemoryUpNextHelper

+ (id)fetchFallbackMemoriesForMemory:(id)a3 targetCount:(unint64_t)a4 memoryLocalIdentifiersToAvoid:(id)a5 error:(id *)a6
{
  return (id)objc_msgSend(a1, "fetchFallbackMemoriesForMemory:targetCount:memoryLocalIdentifiersToAvoid:sharingFilter:error:", a3, a4, a5, 2, a6);
}

+ (id)fetchFallbackMemoriesForMemory:(id)a3 targetCount:(unint64_t)a4 memoryLocalIdentifiersToAvoid:(id)a5 sharingFilter:(unsigned __int16)a6 error:(id *)a7
{
  uint64_t v7;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  char *v53;
  void *v54;
  NSObject *v55;
  const char *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  char *v61;
  void *v62;
  NSObject *v63;
  const char *v64;
  void *v65;
  void *v66;
  unint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  NSObject *v72;
  char *v73;
  void *v74;
  NSObject *v75;
  char *v76;
  void *v77;
  uint64_t v78;
  NSObject *v79;
  uint64_t v80;
  PHManualFetchResult *v81;
  uint64_t v82;
  uint32_t numer;
  uint32_t denom;
  NSObject *v85;
  NSObject *v86;
  os_signpost_id_t spid;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  NSObject *v93;
  unint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  PHUserFeedbackCalculator *v105;
  id v106;
  void *v107;
  id v108;
  id v109;
  id obj;
  uint64_t v111;
  void *v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v123;
  __int16 v124;
  uint64_t v125;
  __int16 v126;
  void *v127;
  __int16 v128;
  void *v129;
  _BYTE v130[128];
  _BYTE v131[128];
  uint64_t v132;

  v7 = a6;
  v132 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  PLMemoriesGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_DEFAULT, "[PHMemoryUpNextHelper] Start fetching fallback memories", buf, 2u);
  }

  PLUpNextGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_signpost_id_generate(v13);
  info = 0;
  mach_timebase_info(&info);
  v15 = v13;
  v16 = v15;
  v94 = v14 - 1;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PHMemoryUpNextFallbackGenerate", ", buf, 2u);
  }
  spid = v14;
  v93 = v16;

  v89 = mach_absolute_time();
  objc_msgSend(v10, "photoLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v106 = a1;
  objc_msgSend(a1, "fetchFallbackMemoryCandidatesInPhotoLibrary:memoryLocalIdentifiersToAvoid:sharingFilter:", v17, v11, v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "fetchedObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v18, "initWithArray:", v20);

  v22 = objc_alloc(MEMORY[0x1E0D75238]);
  objc_msgSend(v10, "localIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "initWithSeed:", objc_msgSend(v23, "hash"));

  v97 = (void *)v24;
  PFMutableArrayShuffleWithRandomNumberGenerator();
  objc_msgSend(v17, "librarySpecificFetchOptions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("category"), 23);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObject:");
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("category"), 8);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObject:");
  v95 = v26;
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setPredicate:", v27);

  v98 = v11;
  v96 = v25;
  +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:options:](PHAssetCollection, "fetchAssetCollectionsWithLocalIdentifiers:options:", v11, v25);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "count");
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v29);
  v108 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v104 = v17;
  objc_msgSend(v17, "librarySpecificFetchOptions");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  obj = v28;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v131, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v118;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v118 != v33)
          objc_enumerationMutation(obj);
        v35 = *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * i);
        v36 = (void *)MEMORY[0x19AEBEADC]();
        +[PHAsset fetchKeyCuratedAssetInAssetCollection:referenceAsset:options:](PHAsset, "fetchKeyCuratedAssetInAssetCollection:referenceAsset:options:", v35, 0, v112);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "firstObject");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
          objc_msgSend(v38, "localIdentifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v39);

        }
        objc_autoreleasePoolPop(v36);
      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v131, 16);
    }
    while (v32);
  }
  v107 = v30;

  v102 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
  objc_msgSend(v104, "librarySpecificFetchOptions");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = v10;
  +[PHAssetCollection fetchMomentsBackingMemory:options:](PHAssetCollection, "fetchMomentsBackingMemory:options:", v10, v40);
  v41 = objc_claimAutoreleasedReturnValue();

  v42 = v104;
  v90 = (void *)v41;
  v101 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v41, 0);
  v105 = -[PHUserFeedbackCalculator initWithPhotoLibrary:]([PHUserFeedbackCalculator alloc], "initWithPhotoLibrary:", v104);
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v109 = v21;
  v43 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v113, v130, 16);
  v44 = v106;
  v45 = v108;
  if (v43)
  {
    v46 = v43;
    v111 = *(_QWORD *)v114;
    do
    {
      v47 = 0;
      do
      {
        if (*(_QWORD *)v114 != v111)
          objc_enumerationMutation(v109);
        v48 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * v47);
        v49 = (void *)MEMORY[0x19AEBEADC]();
        objc_msgSend(v48, "title");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "lowercaseString");
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v45, "containsObject:", v51))
        {
          PLMemoriesGetLog();
          v52 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            goto LABEL_35;
          objc_msgSend(v48, "localIdentifier");
          v53 = (char *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "title");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v123 = v53;
          v124 = 2112;
          v125 = (uint64_t)v54;
          v55 = v52;
          v56 = "[PHMemoryUpNextHelper] Same Title (ignoring case), skip memory:%@ - %@";
LABEL_26:
          _os_log_impl(&dword_1991EC000, v55, OS_LOG_TYPE_DEFAULT, v56, buf, 0x16u);

          goto LABEL_35;
        }
        if (objc_msgSend(v44, "_hasInvalidMemoryTriggerForMemory:", v48))
        {
          PLMemoriesGetLog();
          v52 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            goto LABEL_35;
          objc_msgSend(v48, "localIdentifier");
          v53 = (char *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "title");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v123 = v53;
          v124 = 2112;
          v125 = (uint64_t)v54;
          v55 = v52;
          v56 = "[PHMemoryUpNextHelper] invalid trigger type, skip memory:%@ - %@";
          goto LABEL_26;
        }
        objc_msgSend(v42, "librarySpecificFetchOptions");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHAsset fetchKeyCuratedAssetInAssetCollection:referenceAsset:options:](PHAsset, "fetchKeyCuratedAssetInAssetCollection:referenceAsset:options:", v48, 0, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "firstObject");
        v52 = objc_claimAutoreleasedReturnValue();

        -[NSObject localIdentifier](v52, "localIdentifier");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        if (v52 && !objc_msgSend(v107, "containsObject:", v59))
        {
          if ((objc_msgSend(v44, "_isAcceptableUserFeedbackForMemory:keyAsset:userFeedbackCalculator:", v48, v52, v105) & 1) != 0)
          {
            objc_msgSend(v42, "librarySpecificFetchOptions");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            +[PHAsset fetchAssetsInAssetCollection:options:](PHAsset, "fetchAssetsInAssetCollection:options:", v48, v65);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = objc_msgSend(v66, "count");

            if (v67 > 0xC)
            {
              objc_msgSend(v104, "librarySpecificFetchOptions");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              +[PHAssetCollection fetchMomentsBackingMemory:options:](PHAssetCollection, "fetchMomentsBackingMemory:options:", v48, v70);
              v71 = objc_claimAutoreleasedReturnValue();

              v44 = v106;
              v103 = (void *)v71;
              if (objc_msgSend(v106, "_isMomentFetchResult:overlappingWithFetchResults:", v71, v101))
              {
                PLMemoriesGetLog();
                v72 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v48, "localIdentifier");
                  v73 = (char *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "title");
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v123 = v73;
                  v124 = 2112;
                  v125 = (uint64_t)v74;
                  _os_log_impl(&dword_1991EC000, v72, OS_LOG_TYPE_DEFAULT, "[PHMemoryUpNextHelper] Overlapped moments, skip memory:%@ - %@", buf, 0x16u);

                }
                v42 = v104;
              }
              else
              {
                objc_msgSend(v107, "addObject:", v59);
                objc_msgSend(v108, "addObject:", v51);
                objc_msgSend(v102, "addObject:", v48);
                objc_msgSend(v101, "addObject:", v71);
                PLMemoriesGetLog();
                v75 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v48, "localIdentifier");
                  v76 = (char *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "title");
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v123 = v76;
                  v124 = 2112;
                  v125 = (uint64_t)v77;
                  _os_log_impl(&dword_1991EC000, v75, OS_LOG_TYPE_DEFAULT, "[PHMemoryUpNextHelper] Found 1 fallback memory:%@ - %@", buf, 0x16u);

                }
                v42 = v104;
                if (objc_msgSend(v102, "count") == a4)
                {

                  objc_autoreleasePoolPop(v49);
                  goto LABEL_55;
                }
              }

              goto LABEL_34;
            }
            PLMemoriesGetLog();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v48, "localIdentifier");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "title");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218754;
              v123 = (const char *)v67;
              v124 = 2048;
              v125 = 13;
              v126 = 2112;
              v127 = v68;
              v128 = 2112;
              v129 = v69;
              _os_log_impl(&dword_1991EC000, v60, OS_LOG_TYPE_DEFAULT, "[PHMemoryUpNextHelper] Number of assets (%lu) below threshold (%lu), skip memory:%@ - %@", buf, 0x2Au);

            }
            v42 = v104;
            goto LABEL_32;
          }
          PLMemoriesGetLog();
          v60 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            goto LABEL_33;
          objc_msgSend(v48, "localIdentifier");
          v61 = (char *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "title");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v123 = v61;
          v124 = 2112;
          v125 = (uint64_t)v62;
          v63 = v60;
          v64 = "[PHMemoryUpNextHelper] UserFeedbackScore below threshold, skip memory:%@ - %@";
LABEL_31:
          _os_log_impl(&dword_1991EC000, v63, OS_LOG_TYPE_DEFAULT, v64, buf, 0x16u);

LABEL_32:
          v44 = v106;
          goto LABEL_33;
        }
        PLMemoriesGetLog();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v48, "localIdentifier");
          v61 = (char *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "title");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v123 = v61;
          v124 = 2112;
          v125 = (uint64_t)v62;
          v63 = v60;
          v64 = "[PHMemoryUpNextHelper] nil or same keyAsset, skip memory:%@ - %@";
          goto LABEL_31;
        }
LABEL_33:

LABEL_34:
        v45 = v108;
LABEL_35:

        objc_autoreleasePoolPop(v49);
        ++v47;
      }
      while (v46 != v47);
      v78 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v113, v130, 16);
      v46 = v78;
    }
    while (v78);
  }
LABEL_55:

  PLMemoriesGetLog();
  v79 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
  {
    v80 = objc_msgSend(v102, "count");
    *(_DWORD *)buf = 134218242;
    v123 = (const char *)v80;
    v124 = 2112;
    v125 = (uint64_t)v102;
    _os_log_impl(&dword_1991EC000, v79, OS_LOG_TYPE_DEFAULT, "[PHMemoryUpNextHelper] Found %lu Fallback memories:%@", buf, 0x16u);
  }

  v81 = -[PHManualFetchResult initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:]([PHManualFetchResult alloc], "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v102, v42, CFSTR("PHMemory"), 0, 0, 1);
  v82 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v85 = v93;
  v86 = v85;
  if (v94 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v85))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v86, OS_SIGNPOST_INTERVAL_END, spid, "PHMemoryUpNextFallbackGenerate", ", buf, 2u);
  }

  if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v123 = "PHMemoryUpNextFallbackGenerate";
    v124 = 2048;
    *(double *)&v125 = (float)((float)((float)((float)(v82 - v89) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1991EC000, v86, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v81;
}

+ (BOOL)isMomentFetchResult:(id)a3 overlappingWithFetchResult:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
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
  v7 = objc_msgSend(v6, "count");
  v18 = 0u;
  v19 = 0u;
  if ((v7 - 1) / 3uLL >= 2)
    v8 = 2;
  else
    v8 = (v7 - 1) / 3uLL;
  v20 = 0uLL;
  v21 = 0uLL;
  objc_msgSend(v5, "fetchedObjectIDs", (_QWORD)v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = 0;
    v12 = v8 + 1;
    v13 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v6, "fetchedObjectIDs");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v15) = objc_msgSend(v16, "containsObject:", v15);

        v11 += v15;
        if (v11 == v12)
        {
          LOBYTE(v10) = 1;
          goto LABEL_14;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_14:

  return v10;
}

+ (BOOL)_isMomentFetchResult:(id)a3 overlappingWithFetchResults:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        if ((objc_msgSend((id)objc_opt_class(), "isMomentFetchResult:overlappingWithFetchResult:", v5, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13) & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

+ (BOOL)_hasInvalidMemoryTriggerForMemory:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "photosGraphVersion");
  if (PLMemoriesAlgorithmsVersionFromPhotosGraphVersion() >= 0x301)
  {
    objc_msgSend(v4, "photosGraphProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("triggerTypes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_memoryTriggerTypesToAvoid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v8, "intersectsSet:", v9);

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_memoryTriggerTypesToAvoid
{
  if (_memoryTriggerTypesToAvoid_onceToken != -1)
    dispatch_once(&_memoryTriggerTypesToAvoid_onceToken, &__block_literal_global_8078);
  return (id)_memoryTriggerTypesToAvoid_triggerTypesToAvoid;
}

+ (id)fetchFallbackMemoryCandidatesInPhotoLibrary:(id)a3 memoryLocalIdentifiersToAvoid:(id)a4 sharingFilter:(unsigned __int16)a5
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint8_t buf[4];
  uint64_t v24;
  _QWORD v25[3];

  v5 = a5;
  v25[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(a3, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWantsIncrementalChangeDetails:", 0);
  objc_msgSend(v8, "setIncludePendingMemories:", 1);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortDescriptors:", v11);

  objc_msgSend(v8, "setSharingFilter:", v5);
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (localIdentifier IN %@)"), v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addObject:", v13);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("rejected == NO"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v14);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dateByAddingTimeInterval:", -31536000.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("creationDate > %@"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v17);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (category IN %@)"), &unk_1E3657150);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v18);

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v19);

  +[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:](PHAssetCollection, "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  PLMemoriesGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v24 = objc_msgSend(v20, "count");
    _os_log_impl(&dword_1991EC000, v21, OS_LOG_TYPE_DEFAULT, "[PHMemoryUpNextHelper] Found %lu fallback memory candidates", buf, 0xCu);
  }

  return v20;
}

+ (BOOL)_isAcceptableUserFeedbackForMemory:(id)a3 keyAsset:(id)a4 userFeedbackCalculator:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v24 = a5;
  objc_msgSend(v7, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "librarySpecificFetchOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIncludedDetectionTypes:", &unk_1E3657168);
  +[PHPerson fetchPersonsInAsset:options:](PHPerson, "fetchPersonsInAsset:options:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v26;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v17), "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v15);
  }

  objc_msgSend(v8, "uuid");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "blockableFeatures");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "scoreForKeyAssetUUID:personsUUIDsInKeyAsset:memoryFeatures:", v19, v12, v20);
  v22 = v21;

  LOBYTE(v19) = +[PHUserFeedbackCalculator score:meetsScoreThreshold:](PHUserFeedbackCalculator, "score:meetsScoreThreshold:", v22, -0.1);
  return (char)v19;
}

void __50__PHMemoryUpNextHelper__memoryTriggerTypesToAvoid__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E3655108, &unk_1E3655120, &unk_1E3655138, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_memoryTriggerTypesToAvoid_triggerTypesToAvoid;
  _memoryTriggerTypesToAvoid_triggerTypesToAvoid = v0;

}

@end
