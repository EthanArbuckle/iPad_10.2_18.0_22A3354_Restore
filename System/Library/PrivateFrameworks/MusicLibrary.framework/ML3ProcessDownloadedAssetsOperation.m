@implementation ML3ProcessDownloadedAssetsOperation

- (ML3ProcessDownloadedAssetsOperation)initWithLibrary:(id)a3 writer:(id)a4
{
  ML3ProcessDownloadedAssetsOperation *v4;
  ML3ProcessDownloadedAssetsOperation *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ML3ProcessDownloadedAssetsOperation;
  v4 = -[ML3DatabaseOperation initWithLibrary:writer:](&v7, sel_initWithLibrary_writer_, a3, a4);
  v5 = v4;
  if (v4)
    -[ML3ProcessDownloadedAssetsOperation setQualityOfService:](v4, "setQualityOfService:", -1);
  return v5;
}

- (unint64_t)type
{
  return 7;
}

- (BOOL)_execute:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  double v24;
  double v25;
  NSObject *v26;
  id obj;
  ML3ProcessDownloadedAssetsOperation *v30;
  unsigned int v31;
  NSObject *v32;
  NSObject *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  _BYTE v40[14];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[ML3DatabaseOperation attributes](self, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("MLDatabaseOperationAttributeTrackSourceKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v5, "intValue");

  v30 = self;
  -[ML3DatabaseOperation attributes](self, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("MLDatabaseOperationAttributeDownloadedAssetsListKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v40 = v31;
    *(_WORD *)&v40[4] = 2048;
    *(_QWORD *)&v40[6] = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] Beginning process assets operation with source %d (%lu downloads)", buf, 0x12u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v10 = v9;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v7;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (!v11)
  {
    v13 = 0;
    v14 = 0;
    goto LABEL_22;
  }
  v12 = v11;
  v13 = 0;
  v14 = 0;
  v15 = *(_QWORD *)v35;
  do
  {
    v16 = 0;
    do
    {
      if (*(_QWORD *)v35 != v15)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v16);
      v18 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)v40 = v17;
        _os_log_impl(&dword_1AC149000, v18, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] Processing asset download: %{public}@", buf, 0xCu);
      }

      objc_msgSend(v17, "objectForKey:", CFSTR("MLDatabaseOperationAttributeDownloadedAssetEntityTypeKey"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "integerValue");

      if (v20 == 1)
      {
        v32 = v13;
        v14 = -[ML3ProcessDownloadedAssetsOperation _processContainerAsset:forSource:withError:](v30, "_processContainerAsset:forSource:withError:", v17, v31, &v32);
        v21 = v32;
        goto LABEL_14;
      }
      if (!v20)
      {
        v33 = v13;
        v14 = -[ML3ProcessDownloadedAssetsOperation _processTrackAsset:forSource:withError:](v30, "_processTrackAsset:forSource:withError:", v17, v31, &v33);
        v21 = v33;
LABEL_14:
        v22 = v13;
        v13 = v21;
        goto LABEL_15;
      }
      v22 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)v40 = v17;
        _os_log_impl(&dword_1AC149000, v22, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] got unknown entity type. attrs=%{public}@", buf, 0xCu);
      }
LABEL_15:

      ++v16;
    }
    while (v12 != v16);
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    v12 = v23;
  }
  while (v23);
LABEL_22:

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v25 = v24;
  v26 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v40 = v14;
    *(_WORD *)&v40[4] = 2048;
    *(double *)&v40[6] = v25 - v10;
    _os_log_impl(&dword_1AC149000, v26, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] Process assets operation success=%d in %.3f seconds", buf, 0x12u);
  }

  if (a3)
    *a3 = objc_retainAutorelease(v13);

  return v14;
}

- (BOOL)_processTrackAsset:(id)a3 forSource:(int)a4 withError:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  ML3Track *v10;
  void *v11;
  ML3Track *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  const char *v40;
  NSObject *v41;
  uint32_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  ML3ProcessDownloadedAssetsOperation *v46;
  void *v47;
  ML3ArtworkTokenSet *v48;
  int64_t v49;
  void *v50;
  NSObject *v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  os_log_t v60;
  BOOL v61;
  NSObject *v62;
  void *v63;
  void *v65;
  ML3ArtworkTokenSet *v67;
  void *v68;
  ML3Track *v69;
  ML3Track *v70;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  _QWORD v78[5];
  id v79;
  uint64_t v80;
  int v81;
  id v82;
  uint8_t buf[4];
  uint64_t v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  id v88;
  _QWORD v89[8];

  v89[6] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("MLDatabaseOperationAttributeDownloadedAssetPersistentIdKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "longLongValue");

  v10 = [ML3Track alloc];
  -[ML3DatabaseOperation library](self, "library");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v9;
  v12 = -[ML3Entity initWithPersistentID:inLibrary:](v10, "initWithPersistentID:inLibrary:", v9, v11);

  v89[0] = CFSTR("chapter.chapter_data");
  v89[1] = CFSTR("media_type");
  v89[2] = CFSTR("item_extra.genius_id");
  v89[3] = CFSTR("item_extra.pending_genius_checksum");
  v89[4] = CFSTR("lyrics.pending_checksum");
  v89[5] = CFSTR("lyrics.checksum");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3Entity getValuesForProperties:](v12, "getValuesForProperties:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "valueForKey:", CFSTR("lyrics.pending_checksum"));
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = &unk_1E5BAAEA8;
  if (v15)
    v17 = (void *)v15;
  v18 = v17;

  v76 = v14;
  objc_msgSend(v14, "valueForKey:", CFSTR("lyrics.checksum"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "longLongValue");

  v21 = objc_msgSend(v18, "longLongValue");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("MLDatabaseOperationAttributeDownloadedAssetLyricsPathKey"));
  v23 = objc_claimAutoreleasedReturnValue();
  v74 = (void *)v23;
  if (v23 && (v24 = v23, objc_msgSend(v7, "fileExistsAtPath:", v23)))
  {
    v25 = v7;
    v82 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfFile:encoding:error:", v24, 4, &v82);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v82;
    v28 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v84 = v72;
      v85 = 2114;
      v86 = (uint64_t)v74;
      v87 = 2114;
      v88 = v27;
      _os_log_impl(&dword_1AC149000, v28, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] extracted lyrics for track: %lld from %{public}@ with error %{public}@", buf, 0x20u);
    }

    v7 = v25;
  }
  else
  {
    v26 = 0;
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("MLDatabaseOperationAttributeDownloadedAssetTrackPathKey"));
  v29 = objc_claimAutoreleasedReturnValue();
  v75 = v18;
  v73 = (void *)v29;
  if (v29)
  {
    v30 = v29;
    if (objc_msgSend(v7, "fileExistsAtPath:", v29))
    {
      v68 = v22;
      v31 = v7;
      objc_msgSend(v6, "objectForKey:", CFSTR("MLDatabaseOperationAttributeDownloadedAssetProtectionTypeKey"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "integerValue");

      -[ML3Track populateLocationPropertiesWithPath:protectionType:](v12, "populateLocationPropertiesWithPath:protectionType:", v30, v33);
      v7 = v31;
      if (v20 == v21)
      {
        v22 = v68;
      }
      else
      {
        v22 = v68;
        if (!v26)
        {
          v34 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v84 = v72;
            _os_log_impl(&dword_1AC149000, v34, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] extracting new lyrics for track: %lld from the asset", buf, 0xCu);
          }

          v35 = (void *)MEMORY[0x1E0C8B3C0];
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v73, 0);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "assetWithURL:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (v37)
          {
            objc_msgSend(v37, "lyrics");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v26 = 0;
          }

        }
      }
    }
  }
  if (v26)
  {
    objc_msgSend(v22, "addObject:", v18);
    objc_msgSend(v22, "addObject:", v26);
    objc_msgSend(v77, "addObject:", CFSTR("lyrics.checksum"));
    objc_msgSend(v77, "addObject:", CFSTR("lyrics.lyrics"));
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("MLDatabaseOperationAttributeDownloadSourceContainerIDKey"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    objc_msgSend(v22, "addObject:", v38);
    objc_msgSend(v77, "addObject:", CFSTR("download_source_container_pid"));
  }
  if (objc_msgSend(v22, "count"))
  {
    -[ML3Entity setValues:forProperties:](v12, "setValues:forProperties:", v22, v77);
    v39 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v84 = (uint64_t)v22;
      v85 = 2048;
      v86 = v72;
      v40 = "[ML3ProcessDownloadedAssetsOperation] updated values=%{public}@ for track:%lld";
      v41 = v39;
      v42 = 22;
LABEL_29:
      _os_log_impl(&dword_1AC149000, v41, OS_LOG_TYPE_DEFAULT, v40, buf, v42);
    }
  }
  else
  {
    v39 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v84 = v72;
      v40 = "[ML3ProcessDownloadedAssetsOperation] track: %lld has no updated lyrics or enclosing container pid";
      v41 = v39;
      v42 = 12;
      goto LABEL_29;
    }
  }

  objc_msgSend(v6, "objectForKey:", CFSTR("MLDatabaseOperationAttributeDownloadedAssetArtworkPathKey"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43 && objc_msgSend(v7, "fileExistsAtPath:", v43))
  {
    v65 = v7;
    objc_msgSend(v76, "objectForKey:", CFSTR("media_type"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "unsignedIntValue");

    v46 = self;
    objc_msgSend(v76, "objectForKey:", CFSTR("chapter.chapter_data"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v12;
    v48 = -[ML3ArtworkTokenSet initWithEntity:artworkType:]([ML3ArtworkTokenSet alloc], "initWithEntity:artworkType:", v12, 1);
    v49 = -[ML3ProcessDownloadedAssetsOperation _artworkSourceFromTrackSource:](self, "_artworkSourceFromTrackSource:", a4);
    v67 = v48;
    -[ML3ArtworkTokenSet artworkTokenForSource:](v48, "artworkTokenForSource:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v78[0] = MEMORY[0x1E0C809B0];
      v78[1] = 3221225472;
      v78[2] = __78__ML3ProcessDownloadedAssetsOperation__processTrackAsset_forSource_withError___block_invoke;
      v78[3] = &unk_1E5B5FB10;
      v80 = v72;
      v78[4] = self;
      v79 = v43;
      v81 = v45;
      v46 = self;
      +[MLITChapterTOC enumerateChapterTimesInFlattenedChapterData:usingBlock:](MLITChapterTOC, "enumerateChapterTimesInFlattenedChapterData:usingBlock:", v47, v78);

    }
    if (v50)
    {
      -[ML3ProcessDownloadedAssetsOperation _processArtworkIdentifier:artworkToken:artworkType:mediaType:sourceType:](v46, "_processArtworkIdentifier:artworkToken:artworkType:mediaType:sourceType:", v43, v50, 1, v45, v49);
    }
    else
    {
      v51 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AC149000, v51, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] No artwork token - skiping", buf, 2u);
      }

    }
    -[ML3ProcessDownloadedAssetsOperation _videoSnapshotTimeForMediaType:](v46, "_videoSnapshotTimeForMediaType:", v45);
    v7 = v65;
    if (v52 >= 0.0)
    {
      v53 = v52;
      if (-[ML3Track needsVideoSnapshot](v69, "needsVideoSnapshot"))
        -[ML3Track createVideoSnapshotAtTime:](v69, "createVideoSnapshotAtTime:", v53);
    }

    v12 = v69;
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("MLDatabaseOperationAttributeDownloadedAssetGeniusDataPathKey"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    v55 = v7;
    if (objc_msgSend(v7, "fileExistsAtPath:", v54))
    {
      v70 = v12;
      objc_msgSend(v76, "objectForKey:", CFSTR("item_extra.pending_genius_checksum"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "longLongValue");

      objc_msgSend(v76, "objectForKey:", CFSTR("item_extra.genius_id"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (v58)
      {
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v54);
        v59 = objc_claimAutoreleasedReturnValue();
        if (v59)
        {
          v60 = (os_log_t)v59;
          v61 = -[ML3ProcessDownloadedAssetsOperation _processGeniusPlist:geniusIDString:geniusChecksum:](self, "_processGeniusPlist:geniusIDString:geniusChecksum:", v59, v58, v57);
LABEL_56:

          v12 = v70;
          goto LABEL_57;
        }
        v62 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v84 = v72;
          _os_log_impl(&dword_1AC149000, v62, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] failed to parse genius data for track %lld - skiping", buf, 0xCu);
        }

        v60 = 0;
      }
      else
      {
        v60 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v84 = v72;
          _os_log_impl(&dword_1AC149000, v60, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] No genius id in data for track %lld - skiping", buf, 0xCu);
        }
      }
      v61 = 1;
      goto LABEL_56;
    }
  }
  else
  {
    v55 = v7;
  }
  v61 = 1;
LABEL_57:
  objc_msgSend(v6, "objectForKey:", CFSTR("MLDatabaseOperationAttributeDownloadedAssetTrackPropertiesKey"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary() && objc_msgSend(v63, "count"))
    -[ML3Entity setValuesForPropertiesWithDictionary:](v12, "setValuesForPropertiesWithDictionary:", v63);

  return v61;
}

- (BOOL)_processContainerAsset:(id)a3 forSource:(int)a4 withError:(id *)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ML3ArtworkTokenSet *v14;
  void *v15;
  NSObject *v16;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKey:", CFSTR("MLDatabaseOperationAttributeDownloadedAssetPersistentIdKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "longLongValue");

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("MLDatabaseOperationAttributeDownloadedAssetArtworkPathKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && objc_msgSend(v9, "fileExistsAtPath:", v10))
  {
    -[ML3DatabaseOperation library](self, "library");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("container_pid"), v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3Entity anyInLibrary:predicate:](ML3Container, "anyInLibrary:predicate:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = -[ML3ArtworkTokenSet initWithEntity:artworkType:]([ML3ArtworkTokenSet alloc], "initWithEntity:artworkType:", v13, 5);
      -[ML3ArtworkTokenSet artworkTokenForSource:](v14, "artworkTokenForSource:", 300);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        -[ML3ProcessDownloadedAssetsOperation _processArtworkIdentifier:artworkToken:artworkType:mediaType:sourceType:](self, "_processArtworkIdentifier:artworkToken:artworkType:mediaType:sourceType:", v10, v15, 5, 8, 300);
      }
      else
      {
        v16 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_1AC149000, v16, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] No artwork token - skiping", (uint8_t *)&v18, 2u);
        }

      }
    }
    else
    {
      v14 = (ML3ArtworkTokenSet *)os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 134217984;
        v19 = v8;
        _os_log_impl(&dword_1AC149000, &v14->super, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] failed to find container with pid %lld - skipping", (uint8_t *)&v18, 0xCu);
      }
    }

  }
  return 1;
}

- (BOOL)_processArtworkIdentifier:(id)a3 artworkToken:(id)a4 artworkType:(int64_t)a5 mediaType:(unsigned int)a6 sourceType:(int64_t)a7
{
  uint64_t v8;
  id v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  id v18;
  char v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  void *v27;
  char v28;
  NSObject *v29;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v8 = *(_QWORD *)&a6;
  v36 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  +[ML3MusicLibrary artworkRelativePathFromToken:](ML3MusicLibrary, "artworkRelativePathFromToken:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3DatabaseOperation library](self, "library");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hasOriginalArtworkForRelativePath:", v14);

  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend(v20, "attributesOfItemAtPath:error:", v12, &v31);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v31;

    if (v21)
    {
      if ((unint64_t)objc_msgSend(v21, "fileSize") < 0x1900001)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v12, 0);
        v22 = objc_claimAutoreleasedReturnValue();
        -[ML3DatabaseOperation library](self, "library");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "importOriginalArtworkFromFileURL:withArtworkToken:artworkType:sourceType:mediaType:", v22, v13, a5, a7, v8);

        if ((v28 & 1) != 0)
        {
          v19 = 1;
LABEL_18:

          goto LABEL_19;
        }
        v29 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v33 = (uint64_t)v13;
          _os_log_impl(&dword_1AC149000, v29, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] Failed to insert new artwork for token: %{public}@", buf, 0xCu);
        }

      }
      else
      {
        v22 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = objc_msgSend(v21, "fileSize");
          *(_DWORD *)buf = 134217984;
          v33 = v23;
          v24 = "[ML3ProcessDownloadedAssetsOperation] Artwork file too big: %llu bytes. Discarding.";
          v25 = v22;
          v26 = 12;
LABEL_11:
          _os_log_impl(&dword_1AC149000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
        }
      }
    }
    else
    {
      v22 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v33 = (uint64_t)v12;
        v34 = 2114;
        v35 = v18;
        v24 = "[ML3ProcessDownloadedAssetsOperation] Could not read file attributes for %{public}@: %{public}@";
        v25 = v22;
        v26 = 22;
        goto LABEL_11;
      }
    }
    v19 = 0;
    goto LABEL_18;
  }
  v17 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v33 = (uint64_t)v13;
    _os_log_impl(&dword_1AC149000, v17, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] Artwork already exists on disk, checking database consistency (artworkToken: %{public}@)", buf, 0xCu);
  }

  -[ML3DatabaseOperation library](self, "library");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "importExistingOriginalArtworkWithArtworkToken:artworkType:sourceType:mediaType:", v13, a5, a7, v8);
LABEL_19:

  return v19;
}

- (double)_videoSnapshotTimeForMediaType:(unsigned int)a3
{
  BOOL v3;
  double result;

  v3 = a3 == 0x2000 || a3 == 512;
  result = 105.0;
  if (!v3)
    return 0.0;
  return result;
}

- (BOOL)_processGeniusPlist:(id)a3 geniusIDString:(id)a4 geniusChecksum:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  int64_t v21;
  void *v22;
  char v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  id v29;
  BOOL v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  id v37;
  NSObject *v38;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[3];
  uint8_t buf[4];
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "objectForKey:", CFSTR("genius_metadata"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v51 = v10;
        _os_log_impl(&dword_1AC149000, v11, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] Unhandled genius metadata format: %{public}@", buf, 0xCu);
      }

      v10 = 0;
    }
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("genius_similarities"));
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = v13;
      goto LABEL_13;
    }
    v14 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v51 = v13;
      _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] Unhandled genius similarities format: %{public}@", buf, 0xCu);
    }

  }
  v43 = 0;
LABEL_13:
  -[ML3DatabaseOperation transaction](self, "transaction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "connection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v9, "longLongValue");

  v18 = 0x1E0C99000uLL;
  if (v10)
  {
    v41 = v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v19;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v20;
    v49[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 3);
    v21 = a5;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    v23 = objc_msgSend(v16, "executeUpdate:withParameters:error:", CFSTR("INSERT OR REPLACE INTO genius_metadata (genius_id, checksum, data) VALUES (?, ?, ?);"),
            v22,
            &v46);
    v24 = v46;

    if ((v23 & 1) != 0)
    {
      v40 = v15;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v21);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v25;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v17);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v48[1] = v26;
      v18 = 0x1E0C99000uLL;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v24;
      v28 = objc_msgSend(v16, "executeUpdate:withParameters:error:", CFSTR("UPDATE item_extra SET pending_genius_checksum = ? WHERE genius_id = ?;"),
              v27,
              &v45);
      v29 = v45;

      if ((v28 & 1) != 0)
      {
        v30 = 1;
        v15 = v40;
        v8 = v41;
        goto LABEL_25;
      }
      v31 = os_log_create("com.apple.amp.medialibrary", "Default");
      v8 = v41;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v51 = v29;
        _os_log_impl(&dword_1AC149000, v31, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] failed to update genius checksum. err=%{public}@", buf, 0xCu);
      }
      v24 = v29;
      v15 = v40;
    }
    else
    {
      v18 = 0x1E0C99000;
      v31 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v51 = v24;
        _os_log_impl(&dword_1AC149000, v31, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] failed to update genius metadata. err=%{public}@", buf, 0xCu);
      }
      v8 = v41;
    }

    v30 = 0;
    v29 = v24;
  }
  else
  {
    v29 = 0;
    v30 = 1;
  }
LABEL_25:
  if (v43)
  {
    v42 = v10;
    v32 = v15;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v17);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v33;
    v47[1] = v43;
    objc_msgSend(*(id *)(v18 + 3360), "arrayWithObjects:count:", v47, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v29;
    v35 = v16;
    v36 = objc_msgSend(v16, "executeUpdate:withParameters:error:", CFSTR("INSERT OR REPLACE INTO genius_similarities (genius_id, data) VALUES (?, ?);"),
            v34,
            &v44);
    v37 = v44;

    if ((v36 & 1) != 0)
    {
      v30 = 1;
      v15 = v32;
    }
    else
    {
      v38 = os_log_create("com.apple.amp.medialibrary", "Default");
      v15 = v32;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v51 = v37;
        _os_log_impl(&dword_1AC149000, v38, OS_LOG_TYPE_DEFAULT, "[ML3ProcessDownloadedAssetsOperation] failed to update genius similarities. err=%{public}@", buf, 0xCu);
      }

      v30 = 0;
    }
    v16 = v35;
    v10 = v42;
  }
  else
  {
    v37 = v29;
  }

  return v30;
}

- (int64_t)_artworkSourceFromTrackSource:(int)a3
{
  if ((a3 - 1) > 5)
    return 0;
  else
    return qword_1AC3D92F0[a3 - 1];
}

void __78__ML3ProcessDownloadedAssetsOperation__processTrackAsset_forSource_withError___block_invoke(uint64_t a1, double a2)
{
  void *v4;
  void *v5;
  id v6;

  +[ML3MusicLibrary artworkTokenForChapterWithItemPID:retrievalTime:](ML3MusicLibrary, "artworkTokenForChapterWithItemPID:retrievalTime:", *(_QWORD *)(a1 + 48));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%.f"), *(_QWORD *)(a1 + 40), a2 * 1000.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_processArtworkIdentifier:artworkToken:artworkType:mediaType:sourceType:", v5, v6, 3, *(unsigned int *)(a1 + 56), 300);

}

@end
