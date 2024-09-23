@implementation MADVectorDatabase

- (MADVectorDatabase)initWithPhotoLibrary:(id)a3
{
  id v5;
  MADVectorDatabase *v6;
  MADVectorDatabase *v7;
  uint64_t v8;
  NSURL *directoryURL;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *vskClientQueue;
  int v13;
  id v14;
  MADVectorDatabase *v15;
  MADVectorDatabase *v16;
  id v18;
  objc_super v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MADVectorDatabase;
  v6 = -[MADVectorDatabase init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    objc_msgSend((id)objc_opt_class(), "databaseDirectoryURLForPhotoLibrary:", v7->_photoLibrary);
    v8 = objc_claimAutoreleasedReturnValue();
    directoryURL = v7->_directoryURL;
    v7->_directoryURL = (NSURL *)v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.mediaanalysis.sql.vector", v10);
    vskClientQueue = v7->_vskClientQueue;
    v7->_vskClientQueue = (OS_dispatch_queue *)v11;

    v18 = 0;
    v13 = -[MADVectorDatabase _openVSKClientWithError:](v7, "_openVSKClientWithError:", &v18);
    v14 = v18;
    v15 = v7;
    if (v13)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v14;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VSKDB] Failed to initialize - %@", buf, 0xCu);
      }
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }
  v16 = v15;

  return v16;
}

+ (id)databaseWithPhotoLibrary:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPhotoLibrary:", v3);

  return v4;
}

+ (id)databaseDirectoryURLForPhotoLibrary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  char v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v3, "vcp_mediaAnalysisDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:isDirectory:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v6, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v8, &v13);

    if (v13)
      v10 = v9;
    else
      v10 = 0;
    if ((v10 & 1) != 0)
    {
      objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("vector_database"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v6;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VSKDB] Invalid media analysis directory %@", buf, 0xCu);
      }
      v11 = 0;
    }

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v3;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VSKDB] Failed to retrieve path for Photo Library %@", buf, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

+ (id)historicalFolderNames
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[9];

  v6[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99DE8];
  v6[0] = CFSTR("vskdata");
  v6[1] = CFSTR("vskdata_MD2");
  v6[2] = CFSTR("vskdata_MD3");
  v6[3] = CFSTR("vskdataMD2");
  v6[4] = CFSTR("vskdataMD3");
  v6[5] = CFSTR("vskdataMD4");
  v6[6] = CFSTR("vskdataMD3_1");
  v6[7] = CFSTR("vskdataMD4_1");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_purgeHistoricalData
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  os_log_type_t v18;
  const char *v19;
  uint32_t v20;
  NSObject *v21;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E98];
  -[PHPhotoLibrary vcp_mediaAnalysisDirectory](self->_photoLibrary, "vcp_mediaAnalysisDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend((id)objc_opt_class(), "historicalFolderNames");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1BCCA1B2C]();
        objc_msgSend(v4, "URLByAppendingPathComponent:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v10) = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v13, 0);

        if ((_DWORD)v10)
        {
          v23 = v6;
          v14 = objc_msgSend(v5, "removeItemAtURL:error:", v12, &v23);
          v15 = v23;

          if ((v14 & 1) != 0)
          {
            if ((int)MediaAnalysisLogLevel() >= 6)
            {
              v16 = MEMORY[0x1E0C81028];
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v29 = v12;
                v17 = v16;
                v18 = OS_LOG_TYPE_INFO;
                v19 = "[VSKDB] Removed %@";
                v20 = 12;
                goto LABEL_14;
              }
            }
          }
          else if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v21 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v29 = v12;
              v30 = 2112;
              v31 = v15;
              v17 = v21;
              v18 = OS_LOG_TYPE_ERROR;
              v19 = "[VSKDB] Failed to remove %@ - %@";
              v20 = 22;
LABEL_14:
              _os_log_impl(&dword_1B6C4A000, v17, v18, v19, buf, v20);
            }
          }
          v6 = v15;
        }

        objc_autoreleasePoolPop(v11);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v7);
  }

}

+ (id)_vectorDatabaseAttributes
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC6858], "mad_embeddingVersionAttribute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_vectorDatabaseVersion
{
  unsigned __int8 v2;
  unsigned __int8 v3;
  unsigned __int8 v4;
  int v6;
  int v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((v2 & 1) == 0
  {
    if (_os_feature_enabled_impl())
      v6 = 5;
    else
      v6 = 4;
    +[MADVectorDatabase _vectorDatabaseVersion]::kVectorDatabaseMajorVersion = v6;
  }
  if ((v3 & 1) == 0
  {
    if (+[MADEmbeddingStore includeAudioFusedVideoEmbeddings](MADEmbeddingStore, "includeAudioFusedVideoEmbeddings"))
    {
      v7 = 3;
    }
    else
    {
      v7 = 2;
    }
    +[MADVectorDatabase _vectorDatabaseVersion]::kVectorDatabaseMinorVersion = v7;
  }
  if ((v4 & 1) == 0
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u.%u"), +[MADVectorDatabase _vectorDatabaseVersion]::kVectorDatabaseMajorVersion, +[MADVectorDatabase _vectorDatabaseVersion]::kVectorDatabaseMinorVersion);
    +[MADVectorDatabase _vectorDatabaseVersion]::vectorDatabaseVersion = objc_claimAutoreleasedReturnValue();
  }
  if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = +[MADVectorDatabase _vectorDatabaseVersion]::vectorDatabaseVersion;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[VSKDB] Target version: %@", buf, 0xCu);
  }
  return (id)+[MADVectorDatabase _vectorDatabaseVersion]::vectorDatabaseVersion;
}

- (id)_vectorDatabaseConfigWithError:(id *)a3
{
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  NSURL *directoryURL;
  void *v10;
  NSURL *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  int v15;
  NSURL *v16;
  id v17;
  void *v18;
  char v19;
  NSURL *v20;
  void *v21;
  void *v22;
  int v23;
  NSURL *v24;
  char v25;
  NSURL *v26;
  NSURL *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  NSURL *v32;
  NSObject *v33;
  os_signpost_id_t v34;
  NSObject *v35;
  NSObject *v36;
  id v37;
  NSURL *v38;
  void *v39;
  void *v40;
  NSURL *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  const char *v45;
  uint32_t v46;
  NSURL *v47;
  uint64_t v49;
  uint64_t v50;
  NSURL *v52;
  NSURL *v53;
  NSURL *v54;
  id v55;
  id v56;
  uint64_t v57;
  void *v58;
  uint8_t buf[4];
  NSURL *v60;
  __int16 v61;
  NSURL *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_vectorDatabaseVersion");
  v52 = (NSURL *)objc_claimAutoreleasedReturnValue();
  VCPSignPostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_generate(v4);

  VCPSignPostLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "MAD_VSKConfigAbbreviatedInit", ", buf, 2u);
  }

  v8 = objc_alloc(MEMORY[0x1E0DC6870]);
  directoryURL = self->_directoryURL;
  v56 = 0;
  v10 = (void *)objc_msgSend(v8, "initWithBaseDirectory:readOnly:perConnectionPeakMemory:error:", directoryURL, 0, 0, &v56);
  v11 = (NSURL *)v56;
  VCPSignPostLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v13, OS_SIGNPOST_INTERVAL_END, v5, "MAD_VSKConfigAbbreviatedInit", ", buf, 2u);
  }

  objc_msgSend(v10, "clientVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", v52);

  if (!v15)
  {
    if (v11)
    {
      if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v60 = v11;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[VSKDB] Unable to initialize vector database with abbreviated initializer: %@", buf, 0xCu);
      }

    }
    else
    {
      objc_msgSend(v10, "clientVersion");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", v52);

      if ((v19 & 1) == 0
        && (int)MediaAnalysisLogLevel() >= 5
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "clientVersion");
        v20 = (NSURL *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v60 = v20;
        v61 = 2112;
        v62 = v52;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[VSKDB] Existing version %@, upgrading to %@", buf, 0x16u);

      }
    }
    self->_hasMigration = 1;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL path](self->_directoryURL, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "fileExistsAtPath:isDirectory:", v22, 0);

    if (v23)
    {
      v24 = self->_directoryURL;
      v55 = 0;
      v25 = objc_msgSend(v21, "removeItemAtURL:error:", v24, &v55);
      v26 = (NSURL *)v55;
      v11 = v26;
      if ((v25 & 1) == 0)
      {
        if (a3)
          *a3 = (id)-[NSURL copy](v26, "copy");
        if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_51;
        v47 = self->_directoryURL;
        *(_DWORD *)buf = 138412546;
        v60 = v47;
        v61 = 2112;
        v62 = v11;
        v44 = MEMORY[0x1E0C81028];
        v45 = "[VSKDB] Failed to remove %@ - %@";
        v46 = 22;
        goto LABEL_50;
      }
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v27 = self->_directoryURL;
        *(_DWORD *)buf = 138412290;
        v60 = v27;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[VSKDB] Removed %@", buf, 0xCu);
      }
    }
    else
    {
      v11 = 0;
    }
    -[NSURL path](self->_directoryURL, "path");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = *MEMORY[0x1E0CB2AA8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", 493);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v11;
    v31 = objc_msgSend(v21, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v28, 1, v30, &v54);
    v32 = v54;

    v11 = v32;
    if ((v31 & 1) != 0)
    {
      VCPSignPostLog();
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = os_signpost_id_generate(v33);

      VCPSignPostLog();
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = v35;
      if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v36, OS_SIGNPOST_INTERVAL_BEGIN, v34, "MAD_VSKConfigFullInit", ", buf, 2u);
      }

      v37 = objc_alloc(MEMORY[0x1E0DC6870]);
      v38 = self->_directoryURL;
      objc_msgSend((id)objc_opt_class(), "_vectorDatabaseAttributes");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v11;
      LOWORD(v50) = 0;
      LOBYTE(v49) = 1;
      v40 = (void *)objc_msgSend(v37, "initWithBaseDirectory:distanceMetric:filterableAttributes:dimension:averagePartitionSize:batchSize:batchFactor:tradeOffParameterBetweenClusteringAndBalance:enableFTS:dataType:maxIndexConstructionBatches:readOnly:pretokenizationEnabled:prefixIndices:perConnectionPeakMemory:clientVersion:error:", v38, 1, v39, 512, 0, 0, 0, 0, v49, 0, 0, v50, MEMORY[0x1E0C9AA60], 0, v52,
                      &v53);
      v41 = v53;

      VCPSignPostLog();
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = v42;
      if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v43, OS_SIGNPOST_INTERVAL_END, v34, "MAD_VSKConfigFullInit", ", buf, 2u);
      }

      if (v41)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v60 = v41;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VSKDB] Failed to setup VSKConfig - %@", buf, 0xCu);
        }
        v17 = 0;
        if (a3)
          *a3 = (id)-[NSURL copy](v41, "copy");
      }
      else
      {
        v17 = v40;
      }

      v11 = v41;
      goto LABEL_54;
    }
    if (a3)
      *a3 = (id)-[NSURL copy](v32, "copy");
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
LABEL_51:
      v17 = 0;
LABEL_54:

      goto LABEL_55;
    }
    *(_DWORD *)buf = 138412290;
    v60 = v32;
    v44 = MEMORY[0x1E0C81028];
    v45 = "[VSKDB] Failed to create database directory - %@";
    v46 = 12;
LABEL_50:
    _os_log_impl(&dword_1B6C4A000, v44, OS_LOG_TYPE_ERROR, v45, buf, v46);
    goto LABEL_51;
  }
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v10, "clientVersion");
    v16 = (NSURL *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v60 = v16;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VSKDB] Existing version %@ matches target", buf, 0xCu);

  }
  self->_hasMigration = 0;
  v17 = v10;
LABEL_55:

  return v17;
}

- (id)_vectorDatabaseReadonlyConfigWithError:(id *)a3
{
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  NSURL *directoryURL;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_directoryURL, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v6, 0);

  if ((v7 & 1) != 0)
  {
    VCPSignPostLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_signpost_id_generate(v8);

    VCPSignPostLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "MAD_VSKConfigReadInitialization_ReadOnly", ", buf, 2u);
    }

    v12 = objc_alloc(MEMORY[0x1E0DC6870]);
    directoryURL = self->_directoryURL;
    v23 = 0;
    v14 = (void *)objc_msgSend(v12, "initWithBaseDirectory:readOnly:perConnectionPeakMemory:error:", directoryURL, 1, 0, &v23);
    v15 = v23;
    VCPSignPostLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v17, OS_SIGNPOST_INTERVAL_END, v9, "MAD_VSKConfigReadInitialization_ReadOnly", ", buf, 2u);
    }

    if (v15)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v15;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VSKDB] Failed to setup read-only VSKConfig - %@", buf, 0xCu);
      }
      v18 = 0;
      if (a3)
        *a3 = (id)objc_msgSend(v15, "copy");
    }
    else
    {
      v18 = v14;
    }

  }
  else
  {
    if (a3)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v26 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[VSKDB] Database directory does not exist"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v21);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VSKDB] Database directory does not exist", buf, 2u);
    }
    v18 = 0;
  }

  return v18;
}

- (int)_openVSKClientWithError:(id *)a3
{
  MADVSKClient *v5;
  MADVSKClient *v6;
  MADVSKClient *v7;
  NSURL *directoryURL;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  MADVSKClient *v13;
  MADVSKClient *v14;
  MADVSKClient *vskClient;
  NSObject *v16;
  NSObject *v17;
  MADVSKClient *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  MADVSKClient *v26;
  VCPObjectPool *v27;
  VCPObjectPool *searchClientPool;
  int v29;
  NSObject *v30;
  const char *v31;
  _QWORD v33[4];
  id v34;
  MADVSKClient *v35;
  MADVSKClient *v36;
  id v37;
  uint8_t buf[4];
  MADVSKClient *v39;
  __int16 v40;
  NSURL *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[VSKDB][Initialization] Start ...", buf, 2u);
  }
  -[MADVectorDatabase _purgeHistoricalData](self, "_purgeHistoricalData");
  v37 = 0;
  -[MADVectorDatabase _vectorDatabaseConfigWithError:](self, "_vectorDatabaseConfigWithError:", &v37);
  v5 = (MADVSKClient *)objc_claimAutoreleasedReturnValue();
  v6 = (MADVSKClient *)v37;
  v7 = v6;
  if (!v5)
  {
    if (a3)
      *a3 = (id)-[MADVSKClient copy](v6, "copy");
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_40;
    *(_DWORD *)buf = 138412290;
    v39 = v7;
    v30 = MEMORY[0x1E0C81028];
    v31 = "[VSKDB][Initialization] Failed to create vskConfig - %@";
    goto LABEL_39;
  }
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    directoryURL = self->_directoryURL;
    *(_DWORD *)buf = 138412546;
    v39 = v5;
    v40 = 2112;
    v41 = directoryURL;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[VSKDB][Initialization] Load configuration %@ at directory %@", buf, 0x16u);
  }
  VCPSignPostLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  VCPSignPostLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "MAD_VSKClientInitialization", ", buf, 2u);
  }

  v36 = v7;
  v13 = -[MADVSKClient initWithConfig:error:]([MADVSKClient alloc], "initWithConfig:error:", v5, &v36);
  v14 = v36;

  vskClient = self->_vskClient;
  self->_vskClient = v13;

  v7 = v14;
  if (!self->_vskClient)
  {
    if (a3)
      *a3 = (id)-[MADVSKClient copy](v14, "copy");
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_40;
    *(_DWORD *)buf = 138412290;
    v39 = v14;
    v30 = MEMORY[0x1E0C81028];
    v31 = "[VSKDB][Initialization] Failed to initialize VSKClient - %@";
LABEL_39:
    _os_log_impl(&dword_1B6C4A000, v30, OS_LOG_TYPE_ERROR, v31, buf, 0xCu);
LABEL_40:
    v29 = -18;
    goto LABEL_48;
  }
  VCPSignPostLog();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v17, OS_SIGNPOST_INTERVAL_END, v10, "MAD_VSKClientInitialization", ", buf, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v18 = self->_vskClient;
    *(_DWORD *)buf = 138412290;
    v39 = v18;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[VSKDB][Initialization] client %@", buf, 0xCu);
  }
  VCPSignPostLog();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_signpost_id_generate(v19);

  VCPSignPostLog();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "MAD_VSKWarmUp", ", buf, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[VSKDB][Initialization] warming up", buf, 2u);
  }
  -[MADVSKClient warmup](self->_vskClient, "warmup");
  VCPSignPostLog();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v24, OS_SIGNPOST_INTERVAL_END, v20, "MAD_VSKWarmUp", ", buf, 2u);
  }

  v35 = v14;
  -[MADVectorDatabase _vectorDatabaseReadonlyConfigWithError:](self, "_vectorDatabaseReadonlyConfigWithError:", &v35);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v35;

  if (v25)
  {
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __45__MADVectorDatabase__openVSKClientWithError___block_invoke;
    v33[3] = &unk_1E6B16C20;
    v34 = v25;
    +[VCPObjectPool objectPoolWithAllocator:](VCPObjectPool, "objectPoolWithAllocator:", v33);
    v27 = (VCPObjectPool *)objc_claimAutoreleasedReturnValue();
    searchClientPool = self->_searchClientPool;
    self->_searchClientPool = v27;

    v29 = 0;
  }
  else
  {
    if (a3)
      *a3 = (id)-[MADVSKClient copy](v26, "copy");
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v26;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VSKDB][Initialization] Failed to create readonly vskConfig - %@", buf, 0xCu);
    }
    v29 = -18;
  }

  v7 = v26;
LABEL_48:

  return v29;
}

MADVSKClient *__45__MADVectorDatabase__openVSKClientWithError___block_invoke(uint64_t a1)
{
  MADVSKClient *v2;
  uint64_t v3;
  MADVSKClient *v4;
  id v5;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = [MADVSKClient alloc];
  v3 = *(_QWORD *)(a1 + 32);
  v7 = 0;
  v4 = -[MADVSKClient initWithConfig:error:](v2, "initWithConfig:error:", v3, &v7);
  v5 = v7;
  if (!v4 && (int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VSKDB] Failed to create readonly VSKClient - %@", buf, 0xCu);
  }

  return v4;
}

- (id)searchWithEmbeddings:(id)a3 localIdentifiers:(id)a4 attributeFilters:(id)a5 limit:(int)a6 fullScan:(BOOL)a7 includePayload:(BOOL)a8 numberOfProbes:(id)a9 batchSize:(id)a10 numConcurrentReaders:(id)a11 error:(id *)a12
{
  _BOOL8 v12;
  _BOOL8 v13;
  uint64_t v14;
  NSObject *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  os_signpost_id_t v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  NSObject *v39;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint8_t buf[16];

  v12 = a8;
  v13 = a7;
  v14 = *(_QWORD *)&a6;
  v45 = a3;
  v46 = a4;
  v44 = a5;
  v43 = a9;
  v42 = a10;
  v41 = a11;
  VCPSignPostLog();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_signpost_id_generate(v18);

  VCPSignPostLog();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "MAD_VSKSearchGetVSKClient", ", buf, 2u);
  }

  -[VCPObjectPool getObject](self->_searchClientPool, "getObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  VCPSignPostLog();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v24, OS_SIGNPOST_INTERVAL_END, v19, "MAD_VSKSearchGetVSKClient", ", buf, 2u);
  }

  objc_msgSend(v22, "object");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "warmup");

  objc_msgSend(MEMORY[0x1E0DC6850], "mad_stringIdentifiersFromLocalIdentifiers:", v46);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  v28 = (void *)MEMORY[0x1E0C9AA60];
  if (v26)
    v28 = (void *)v26;
  v29 = v28;

  VCPSignPostLog();
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = os_signpost_id_generate(v30);

  VCPSignPostLog();
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v31, "MAD_VSKSearchBatchSearch", ", buf, 2u);
  }

  objc_msgSend(v22, "object");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "client");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  objc_msgSend(v35, "searchByBatch:stringIdentifiers:attributeFilters:limit:fullScan:includePayload:numberOfProbes:batchSize:numConcurrentReaders:error:", v45, v29, v44, v14, v13, v12, v43, v42, v41, &v47);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v47;

  VCPSignPostLog();
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v39, OS_SIGNPOST_INTERVAL_END, v31, "MAD_VSKSearchBatchSearch", ", buf, 2u);
  }

  if (a12 && v37)
    *a12 = (id)objc_msgSend(v37, "copy");

  return v36;
}

- (id)databaseDirectoryURL
{
  return self->_directoryURL;
}

- (int)insertOrReplaceAssetsEmbeddings:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *vskClientQueue;
  id v8;
  _QWORD block[5];
  id v11;
  __CFString *v12;
  uint64_t *v13;
  id *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  vskClientQueue = self->_vskClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MADVectorDatabase_insertOrReplaceAssetsEmbeddings_error___block_invoke;
  block[3] = &unk_1E6B16C48;
  block[4] = self;
  v11 = v6;
  v13 = &v15;
  v14 = a4;
  v12 = CFSTR("[VSKDB][InsertOrReplace]");
  v8 = v6;
  dispatch_sync(vskClientQueue, block);
  LODWORD(self) = *((_DWORD *)v16 + 6);

  _Block_object_dispose(&v15, 8);
  return (int)self;
}

void __59__MADVectorDatabase_insertOrReplaceAssetsEmbeddings_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  VCPSignPostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  VCPSignPostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "MAD_VSKInsertMultipleAssets", ", buf, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v13 = 0;
  v8 = (id)objc_msgSend(v6, "insertAssets:error:", v7, &v13);
  v9 = v13;

  if (v9)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v15 = v10;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ Operation failed - %@", buf, 0x16u);
    }
    if (*(_QWORD *)(a1 + 64))
      **(_QWORD **)(a1 + 64) = (id)objc_msgSend(v9, "copy");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = -18;
  }
  else
  {
    VCPSignPostLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v12, OS_SIGNPOST_INTERVAL_END, v3, "MAD_VSKInsertMultipleAssets", ", buf, 2u);
    }

  }
}

- (int)removeEmbeddingsWithLocalIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *vskClientQueue;
  id v8;
  _QWORD block[4];
  id v11;
  MADVectorDatabase *v12;
  __CFString *v13;
  uint64_t *v14;
  id *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  vskClientQueue = self->_vskClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__MADVectorDatabase_removeEmbeddingsWithLocalIdentifiers_error___block_invoke;
  block[3] = &unk_1E6B16C48;
  v11 = v6;
  v12 = self;
  v13 = CFSTR("[VSKDB][Remove]");
  v14 = &v16;
  v15 = a4;
  v8 = v6;
  dispatch_sync(vskClientQueue, block);
  LODWORD(self) = *((_DWORD *)v17 + 6);

  _Block_object_dispose(&v16, 8);
  return (int)self;
}

void __64__MADVectorDatabase_removeEmbeddingsWithLocalIdentifiers_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  VCPSignPostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  VCPSignPostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134217984;
    v20 = v6;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "MAD_VSKDeleteEmbedding", "%ld", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0DC6850], "mad_stringIdentifiersFromLocalIdentifiers:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v8, "deleteStringIdentifiers:error:", v7, &v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v18;

  if (v10)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 48);
      v12 = objc_msgSend(*(id *)(a1 + 32), "count");
      *(_DWORD *)buf = 138412802;
      v20 = v11;
      v21 = 2048;
      v22 = v12;
      v23 = 2112;
      v24 = (uint64_t)v10;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ Failed to remove (expected %lu) assets - %@", buf, 0x20u);
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v10, "code");
    if (*(_QWORD *)(a1 + 64))
      **(_QWORD **)(a1 + 64) = (id)objc_msgSend(v10, "copy");
  }
  else if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v13 = *(_QWORD *)(a1 + 48);
    v14 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 138412802;
    v20 = v13;
    v21 = 2112;
    v22 = (uint64_t)v9;
    v23 = 2048;
    v24 = v14;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%@ Removed %@ (expected: %lu) assets", buf, 0x20u);
  }
  VCPSignPostLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    v17 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134217984;
    v20 = v17;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v16, OS_SIGNPOST_INTERVAL_END, v3, "MAD_VSKDeleteEmbedding", "%ld", buf, 0xCu);
  }

}

- (int)removeEmbeddingsWithLocalIdentifiers:(id)a3 embeddingType:(unint64_t)a4 error:(id *)a5
{
  id v8;
  NSObject *vskClientQueue;
  id v10;
  _QWORD v12[4];
  id v13;
  MADVectorDatabase *v14;
  __CFString *v15;
  uint64_t *v16;
  unint64_t v17;
  id *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;

  v8 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  vskClientQueue = self->_vskClientQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__MADVectorDatabase_removeEmbeddingsWithLocalIdentifiers_embeddingType_error___block_invoke;
  v12[3] = &unk_1E6B16C70;
  v13 = v8;
  v14 = self;
  v15 = CFSTR("[VSKDB][Remove]");
  v16 = &v19;
  v17 = a4;
  v18 = a5;
  v10 = v8;
  dispatch_sync(vskClientQueue, v12);
  LODWORD(a4) = *((_DWORD *)v20 + 6);

  _Block_object_dispose(&v19, 8);
  return a4;
}

void __78__MADVectorDatabase_removeEmbeddingsWithLocalIdentifiers_embeddingType_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  _BYTE v39[14];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v31 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1BCCA1B2C]();
        objc_msgSend(MEMORY[0x1E0DC6850], "mad_stringIdentifierFromLocalIdentifier:embeddingType:", v7, *(_QWORD *)(a1 + 64));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v9);

        objc_autoreleasePoolPop(v8);
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    }
    while (v4);
  }

  VCPSignPostLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);

  VCPSignPostLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v14 = objc_msgSend(*(id *)(a1 + 32), "count");
    v15 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 134218240;
    v35 = v14;
    v36 = 1024;
    LODWORD(v37) = v15;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "MAD_VSKDeleteEmbeddingWithType", "%ld assets, embeddingType %u", buf, 0x12u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "client");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v16, "deleteStringIdentifiers:error:", v2, &v29);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v29;

  if (v18)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v19 = *(_QWORD *)(a1 + 48);
      v20 = objc_msgSend(*(id *)(a1 + 32), "count");
      v21 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138413058;
      v35 = v19;
      v36 = 2048;
      v37 = v20;
      v38 = 1024;
      *(_DWORD *)v39 = v21;
      *(_WORD *)&v39[4] = 2112;
      *(_QWORD *)&v39[6] = v18;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ Failed to remove (expected %lu) assets of embedding type %u - %@", buf, 0x26u);
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v18, "code");
    if (*(_QWORD *)(a1 + 72))
      **(_QWORD **)(a1 + 72) = (id)objc_msgSend(v18, "copy");
  }
  else if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v22 = *(_QWORD *)(a1 + 48);
    v23 = objc_msgSend(*(id *)(a1 + 32), "count");
    v24 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 138413058;
    v35 = v22;
    v36 = 2112;
    v37 = (uint64_t)v17;
    v38 = 2048;
    *(_QWORD *)v39 = v23;
    *(_WORD *)&v39[8] = 1024;
    *(_DWORD *)&v39[10] = v24;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%@ Removed %@ (expected: %lu) assets of embedding type %u", buf, 0x26u);
  }
  VCPSignPostLog();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    v27 = objc_msgSend(*(id *)(a1 + 32), "count");
    v28 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 134218240;
    v35 = v27;
    v36 = 1024;
    LODWORD(v37) = v28;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v26, OS_SIGNPOST_INTERVAL_END, v11, "MAD_VSKDeleteEmbeddingWithType", "%ld assets, embeddingType %u", buf, 0x12u);
  }

}

- (int)rebuildWithError:(id *)a3 force:(BOOL)a4
{
  NSObject *vskClientQueue;
  int v5;
  _QWORD block[5];
  __CFString *v8;
  uint64_t *v9;
  id *v10;
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  vskClientQueue = self->_vskClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __44__MADVectorDatabase_rebuildWithError_force___block_invoke;
  block[3] = &unk_1E6B16C98;
  block[1] = 3221225472;
  block[4] = self;
  v8 = CFSTR("[VSKDB][Rebuild]");
  v11 = a4;
  v9 = &v12;
  v10 = a3;
  dispatch_sync(vskClientQueue, block);
  v5 = *((_DWORD *)v13 + 6);

  _Block_object_dispose(&v12, 8);
  return v5;
}

void __44__MADVectorDatabase_rebuildWithError_force___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  os_log_type_t v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  os_signpost_id_t v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  char v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  _BYTE v36[10];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  VCPSignPostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  VCPSignPostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "MAD_VSKStatistics", ", buf, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v6, "statisticsWithError:", &v32);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v32;

  if (!v7 || v8)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v34 = v17;
      v35 = 2112;
      *(_QWORD *)v36 = v8;
      v15 = MEMORY[0x1E0C81028];
      v16 = "%@ Failed to query delta embedding count, skip index rebuild: %@";
      v18 = OS_LOG_TYPE_ERROR;
      v19 = 22;
LABEL_26:
      _os_log_impl(&dword_1B6C4A000, v15, v18, v16, buf, v19);
    }
  }
  else
  {
    VCPSignPostLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v10, OS_SIGNPOST_INTERVAL_END, v3, "MAD_VSKStatistics", ", buf, 2u);
    }

    v11 = objc_msgSend(v7, "deltaStoreCount");
    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 40);
      v13 = objc_msgSend(v7, "deltaStoreCount");
      *(_DWORD *)buf = 138412802;
      v34 = v12;
      v35 = 1024;
      *(_DWORD *)v36 = v11;
      *(_WORD *)&v36[4] = 1024;
      *(_DWORD *)&v36[6] = v13;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@[VSKStatistics] deltaStoreCount: %d, storeCount: %d", buf, 0x18u);
    }
    if (*(_BYTE *)(a1 + 64) && v11 <= 0x3E7)
    {
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v14 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        v34 = v14;
        v35 = 2048;
        *(_QWORD *)v36 = v11;
        *(_WORD *)&v36[8] = 2048;
        v37 = 1000;
        v15 = MEMORY[0x1E0C81028];
        v16 = "%@ delta embedding count %lu less than force limit %lu; skip index rebuild";
LABEL_25:
        v18 = OS_LOG_TYPE_INFO;
        v19 = 32;
        goto LABEL_26;
      }
    }
    else if (*(_BYTE *)(a1 + 64) || v11 >> 3 > 0x270)
    {
      VCPSignPostLog();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_signpost_id_generate(v21);

      VCPSignPostLog();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "MAD_VSKRebuild", ", buf, 2u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "client");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      v26 = objc_msgSend(v25, "rebuildWithError:", &v31);
      v27 = v31;

      if ((v26 & 1) != 0)
      {
        VCPSignPostLog();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v29, OS_SIGNPOST_INTERVAL_END, v22, "MAD_VSKRebuild", ", buf, 2u);
        }

      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v30 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          v34 = v30;
          v35 = 2112;
          *(_QWORD *)v36 = v27;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ Operation failed - %@", buf, 0x16u);
        }
        if (*(_QWORD *)(a1 + 56))
          **(_QWORD **)(a1 + 56) = (id)objc_msgSend(v27, "copy");
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v27, "code");
      }

    }
    else if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v20 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v34 = v20;
      v35 = 2048;
      *(_QWORD *)v36 = v11;
      *(_WORD *)&v36[8] = 2048;
      v37 = 5000;
      v15 = MEMORY[0x1E0C81028];
      v16 = "%@ delta embedding count %lu less than limit %lu; skip index rebuild";
      goto LABEL_25;
    }
  }

}

- (unint64_t)assetCountWithError:(id *)a3
{
  NSObject *vskClientQueue;
  unint64_t v4;
  _QWORD v6[5];
  __CFString *v7;
  uint64_t *v8;
  id *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  vskClientQueue = self->_vskClientQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__MADVectorDatabase_assetCountWithError___block_invoke;
  v6[3] = &unk_1E6B16CC0;
  v6[4] = self;
  v7 = CFSTR("[VSKDB][AssetCount]");
  v8 = &v10;
  v9 = a3;
  dispatch_sync(vskClientQueue, v6);
  v4 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v4;
}

void __41__MADVectorDatabase_assetCountWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  VCPSignPostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  VCPSignPostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "MAD_VSKAssetCount", ", buf, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v6, "countWithError:", &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;

  if (v7)
  {
    v9 = objc_msgSend(v7, "unsignedIntegerValue");
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v16 = v10;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ Operation failed - %@", buf, 0x16u);
    }
    if (*(_QWORD *)(a1 + 56))
    {
      v11 = (id)objc_msgSend(v8, "copy");
      v9 = 0;
      **(_QWORD **)(a1 + 56) = v11;
    }
    else
    {
      v9 = 0;
    }
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9;
  VCPSignPostLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v13, OS_SIGNPOST_INTERVAL_END, v3, "MAD_VSKAssetCount", ", buf, 2u);
  }

}

- (unint64_t)embeddingCountWithError:(id *)a3
{
  NSObject *vskClientQueue;
  unint64_t v4;
  _QWORD v6[5];
  __CFString *v7;
  uint64_t *v8;
  id *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  vskClientQueue = self->_vskClientQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__MADVectorDatabase_embeddingCountWithError___block_invoke;
  v6[3] = &unk_1E6B16CC0;
  v6[4] = self;
  v7 = CFSTR("[VSKDB][EmbeddingCount]");
  v8 = &v10;
  v9 = a3;
  dispatch_sync(vskClientQueue, v6);
  v4 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v4;
}

void __45__MADVectorDatabase_embeddingCountWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  VCPSignPostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  VCPSignPostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "MAD_VSKEmbeddingCount", ", buf, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v6, "embeddingCountWithError:", &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;

  if (v7)
  {
    v9 = objc_msgSend(v7, "unsignedIntegerValue");
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v16 = v10;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ Operation failed - %@", buf, 0x16u);
    }
    if (*(_QWORD *)(a1 + 56))
    {
      v11 = (id)objc_msgSend(v8, "copy");
      v9 = 0;
      **(_QWORD **)(a1 + 56) = v11;
    }
    else
    {
      v9 = 0;
    }
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9;
  VCPSignPostLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v13, OS_SIGNPOST_INTERVAL_END, v3, "MAD_VSKEmbeddingCount", ", buf, 2u);
  }

}

- (id)fetchAllAssetsWithLimit:(unint64_t)a3 offset:(unint64_t)a4 error:(id *)a5
{
  NSObject *vskClientQueue;
  id v6;
  _QWORD v8[5];
  __CFString *v9;
  uint64_t *v10;
  unint64_t v11;
  unint64_t v12;
  id *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__10;
  v18 = __Block_byref_object_dispose__10;
  v19 = 0;
  vskClientQueue = self->_vskClientQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__MADVectorDatabase_fetchAllAssetsWithLimit_offset_error___block_invoke;
  v8[3] = &unk_1E6B16CE8;
  v10 = &v14;
  v11 = a3;
  v8[4] = self;
  v9 = CFSTR("[VSKDB][FetchAllAssets]");
  v12 = a4;
  v13 = a5;
  dispatch_sync(vskClientQueue, v8);
  v6 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v6;
}

void __58__MADVectorDatabase_fetchAllAssetsWithLimit_offset_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  VCPSignPostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  VCPSignPostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "MAD_VSKFetchAllAssets", ", buf, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6880]), "initWithLimit:offset:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v17 = 0;
  objc_msgSend(v6, "stringIdentifiedAssetsWithIdentifiers:attributeFilters:pagination:error:", 0, MEMORY[0x1E0C9AA60], v7, &v17);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v17;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v8;

  if (v9)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = 0;

    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v19 = v14;
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ Operation failed - %@", buf, 0x16u);
    }
    if (*(_QWORD *)(a1 + 72))
      **(_QWORD **)(a1 + 72) = (id)objc_msgSend(v9, "copy");
  }
  VCPSignPostLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v16, OS_SIGNPOST_INTERVAL_END, v3, "MAD_VSKFetchAllAssets", ", buf, 2u);
  }

}

- (id)fetchAssetsWithLocalIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *vskClientQueue;
  id v8;
  id v9;
  _QWORD block[4];
  id v12;
  MADVectorDatabase *v13;
  __CFString *v14;
  uint64_t *v15;
  id *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__10;
  v21 = __Block_byref_object_dispose__10;
  v22 = 0;
  vskClientQueue = self->_vskClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MADVectorDatabase_fetchAssetsWithLocalIdentifiers_error___block_invoke;
  block[3] = &unk_1E6B16D10;
  v12 = v6;
  v13 = self;
  v14 = CFSTR("[VSKDB][FetchAssets]");
  v15 = &v17;
  v16 = a4;
  v8 = v6;
  dispatch_sync(vskClientQueue, block);
  v9 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __59__MADVectorDatabase_fetchAssetsWithLocalIdentifiers_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  VCPSignPostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  VCPSignPostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134217984;
    v21 = v6;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "MAD_VSKFetchAssets", "%lu assets", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0DC6850], "mad_stringIdentifiersFromLocalIdentifiers:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v8, "stringIdentifiedAssetsWithIdentifiers:attributeFilters:pagination:error:", v7, MEMORY[0x1E0C9AA60], 0, &v19);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v19;
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v9;

  if (v10)
  {
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = 0;

    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v21 = v15;
      v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ Operation failed - %@", buf, 0x16u);
    }
    if (*(_QWORD *)(a1 + 64))
      **(_QWORD **)(a1 + 64) = (id)objc_msgSend(v10, "copy");
  }
  VCPSignPostLog();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    v18 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134217984;
    v21 = v18;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v17, OS_SIGNPOST_INTERVAL_END, v3, "MAD_VSKFetchAssets", "%lu assets", buf, 0xCu);
  }

}

- (void)prewarmSearchWithConcurrencyLimit:(unint64_t)a3
{
  void *v5;
  void *v6;
  id i;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  for (i = (id)objc_claimAutoreleasedReturnValue(); a3; --a3)
  {
    -[VCPObjectPool getObject](self->_searchClientPool, "getObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "warmup");

    objc_msgSend(i, "addObject:", v5);
  }

}

- (BOOL)hasMigration
{
  return self->_hasMigration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchClientPool, 0);
  objc_storeStrong((id *)&self->_vskClientQueue, 0);
  objc_storeStrong((id *)&self->_vskClient, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_directoryURL, 0);
}

@end
