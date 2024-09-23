@implementation MADEmbeddingStore

+ (BOOL)includeAudioFusedVideoEmbeddings
{
  return 1;
}

+ (id)embeddingStoreDirectoryForPhotoLibraryURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD16F0]), "initWithPhotoLibraryURL:", v3);
  +[MADVectorDatabase databaseDirectoryURLForPhotoLibrary:](MADVectorDatabase, "databaseDirectoryURLForPhotoLibrary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)preferredImageEmbeddingsForAssetUUID:(id)a3 fromImageEmbeddingResults:(id)a4 error:(id *)a5
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v23;
  id v24;
  void *v25;
  id obj;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v24 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MADEmbeddingStore][%@]"), v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[VCPVideoTransformerBackbone embeddingVersion](VCPVideoTransformerBackbone, "embeddingVersion");
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v24;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("attributes"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("embeddingVersion"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          if (v6 != (int)objc_msgSend(v12, "intValue"))
            goto LABEL_21;
        }
        else if (v6 != 2)
        {
LABEL_21:
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v35 = v25;
            v36 = 1024;
            v37 = v6;
            v38 = 2112;
            v39 = v12;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ Image embedding version mismatch (expect: %u, received: %@); skip",
              buf,
              0x1Cu);
          }
          if (a5)
          {
            v18 = (void *)MEMORY[0x1E0CB35C8];
            v32 = *MEMORY[0x1E0CB2D50];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Image embedding version mismatch (expect: %u, received: %@); skip"),
              v25,
              v6,
              v12);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v19;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v20);
            *a5 = (id)objc_claimAutoreleasedReturnValue();

          }
          v17 = 0;
          v16 = v27;
          goto LABEL_27;
        }
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("attributes"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("embeddings"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v27, "addObject:", v14);
        }
        else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v25;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ Missing embedding attributes from image embedding results", buf, 0xCu);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      if (v7)
        continue;
      break;
    }
  }

  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v15 = objc_msgSend(v27, "count");
    *(_DWORD *)buf = 138412546;
    v35 = v25;
    v36 = 1024;
    v37 = v15;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ %u preferred image embeddings", buf, 0x12u);
  }
  v16 = v27;
  v17 = v27;
LABEL_27:

  return v17;
}

+ (id)preferredVideoEmbeddingsForAssetUUID:(id)a3 fromVideoEmbeddingResults:(id)a4 audioFusedVideoEmbeddingResults:(id)a5 summarizedVideoEmbeddingResults:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _OWORD *v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  CMTimeFlags v43;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id obj;
  unint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  CMTimeRange range2;
  CMTimeRange range1;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t v63[128];
  uint8_t v64[4];
  void *v65;
  CMTimeRange buf;
  uint64_t v67;
  void *v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v48 = a6;
  v45 = v10;
  v46 = v12;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MADEmbeddingStore][%@]"), v10);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  v14 = v13;
  v47 = v13;
  if (objc_msgSend((id)objc_opt_class(), "includeAudioFusedVideoEmbeddings"))
  {
    v15 = !+[VCPMovieAnalyzer enableAudioVideoFusion](VCPMovieAnalyzer, "enableAudioVideoFusion");
    if (!v12)
      LOBYTE(v15) = 1;
    v14 = v13;
    if ((v15 & 1) == 0)
    {
      v16 = objc_msgSend(v12, "count");
      if (v16 == objc_msgSend(v13, "count"))
      {
        v14 = v12;

        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buf.start.value) = 138412546;
          *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v50;
          LOWORD(buf.start.flags) = 1024;
          *(CMTimeFlags *)((char *)&buf.start.flags + 2) = objc_msgSend(v14, "count");
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ Using audio-fused video embeddings (count %d)", (uint8_t *)&buf, 0x12u);
        }
      }
      else
      {
        v14 = v13;
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v14 = v13;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf.start.value) = 138412802;
            *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v50;
            LOWORD(buf.start.flags) = 1024;
            *(CMTimeFlags *)((char *)&buf.start.flags + 2) = objc_msgSend(v12, "count");
            WORD1(buf.start.epoch) = 1024;
            HIDWORD(buf.start.epoch) = objc_msgSend(v13, "count");
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ Unexpected audio-fused video embeddings count %d, expected %d", (uint8_t *)&buf, 0x18u);
            v14 = v13;
          }
        }
      }
    }
  }
  v49 = v14;
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = +[VCPVideoTransformerBackbone embeddingVersion](VCPVideoTransformerBackbone, "embeddingVersion");
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    obj = v14;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v60;
      v20 = (_OWORD *)MEMORY[0x1E0CA2E50];
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v60 != v19)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("attributes"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("embeddingVersion"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            if (v52 != (int)objc_msgSend(v24, "intValue"))
              goto LABEL_46;
          }
          else if (v52 != 2)
          {
LABEL_46:
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf.start.value) = 138412802;
              *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v50;
              LOWORD(buf.start.flags) = 1024;
              *(CMTimeFlags *)((char *)&buf.start.flags + 2) = v52;
              WORD1(buf.start.epoch) = 2112;
              *(CMTimeEpoch *)((char *)&buf.start.epoch + 4) = (CMTimeEpoch)v24;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ Video embedding version mismatch (expect: %u, received: %@); skip",
                (uint8_t *)&buf,
                0x1Cu);
            }
            if (a7)
            {
              v39 = (void *)MEMORY[0x1E0CB35C8];
              v67 = *MEMORY[0x1E0CB2D50];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Video embedding version mismatch (expect: %u, received: %@); skip"),
                v50,
                v52,
                v24);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v68 = v40;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v41);
              *a7 = (id)objc_claimAutoreleasedReturnValue();

            }
            goto LABEL_52;
          }
          memset(&buf, 0, sizeof(buf));
          CMTimeRangeMakeFromDictionary(&buf, (CFDictionaryRef)v22);
          range1 = buf;
          v25 = v20[1];
          *(_OWORD *)&range2.start.value = *v20;
          *(_OWORD *)&range2.start.epoch = v25;
          *(_OWORD *)&range2.duration.timescale = v20[2];
          if (CMTimeRangeEqual(&range1, &range2))
          {
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v64 = 138412290;
              v65 = v50;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ Found image embedding within video embeddings", v64, 0xCu);
            }
          }
          else
          {
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("attributes"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("embeddings"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (v27)
            {
              objc_msgSend(v17, "addObject:", v27);
            }
            else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v64 = 138412290;
              v65 = v50;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ Missing embedding attributes from video embedding results", v64, 0xCu);
            }

          }
        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
        if (v18)
          continue;
        break;
      }
    }

    if (objc_msgSend(v17, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v48, "count"))
      {
        objc_msgSend(v48, "objectAtIndexedSubscript:", 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("attributes"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("embeddingIds"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v32 = v31;
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
        if (v33)
        {
          v34 = *(_QWORD *)v54;
          do
          {
            for (j = 0; j != v33; ++j)
            {
              if (*(_QWORD *)v54 != v34)
                objc_enumerationMutation(v32);
              v36 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
              v37 = (void *)MEMORY[0x1BCCA1B2C]();
              LODWORD(v36) = objc_msgSend(v36, "unsignedIntValue");
              if (objc_msgSend(v17, "count") > (unint64_t)(int)v36)
              {
                objc_msgSend(v17, "objectAtIndexedSubscript:");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "addObject:", v38);

              }
              objc_autoreleasePoolPop(v37);
            }
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
          }
          while (v33);
        }

      }
      else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf.start.value) = 138412290;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v50;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ Missing summarized embedding from embedding results", (uint8_t *)&buf, 0xCu);
      }
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v43 = objc_msgSend(v28, "count");
        LODWORD(buf.start.value) = 138412546;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v50;
        LOWORD(buf.start.flags) = 1024;
        *(CMTimeFlags *)((char *)&buf.start.flags + 2) = v43;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ %u preferred video embeddings", (uint8_t *)&buf, 0x12u);
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf.start.value) = 138412290;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v50;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ No valid video embedding data", (uint8_t *)&buf, 0xCu);
      }
LABEL_52:
      v28 = 0;
    }

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.start.value) = 138412290;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v50;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ Missing video embedding results from full analysis results", (uint8_t *)&buf, 0xCu);
    }
    v28 = 0;
  }

  return v28;
}

+ (id)fetchEmbeddingsWithAssetUUIDs:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  NSObject *v26;
  const char *v27;
  void *v28;
  uint64_t v29;
  int v30;
  int v31;
  int v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  MADEmbedding *v45;
  int v46;
  void *v47;
  void *v48;
  id v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  unint64_t v61;
  void *obj;
  void *v63;
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
  __int128 v74;
  __int128 v75;
  id v76;
  uint8_t buf[4];
  _BYTE v78[10];
  _BYTE v79[6];
  int v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;
  _QWORD v85[4];

  v85[1] = *MEMORY[0x1E0C80C00];
  v57 = a3;
  v9 = a4;
  v50 = a5;
  v52 = v9;
  if (v9)
  {
    v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD16F0]), "initWithPhotoLibraryURL:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD16F0], "vcp_defaultPhotoLibrary");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CD1398], "localIdentifiersWithUUIDs:", v57);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v55, "count");
  if (v10 != objc_msgSend(v57, "count")
    && (int)MediaAnalysisLogLevel() >= 3
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v78 = objc_msgSend(v57, "count");
    *(_WORD *)&v78[4] = 1024;
    *(_DWORD *)&v78[6] = objc_msgSend(v55, "count");
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADEmbeddingStore] Failed to convert all UUIDs to local identifiers, converted %u but expected %u", buf, 0xEu);
  }
  +[MADVectorDatabaseManager sharedDatabaseWithPhotoLibrary:](MADVectorDatabaseManager, "sharedDatabaseWithPhotoLibrary:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = 0;
  objc_msgSend(v54, "fetchAssetsWithLocalIdentifiers:error:", v11, &v76);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v76;

  if (objc_msgSend(v56, "count"))
  {
    v61 = +[VCPVideoTransformerBackbone embeddingVersion](VCPVideoTransformerBackbone, "embeddingVersion");
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v12 = v56;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v73 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
          v17 = (void *)MEMORY[0x1BCCA1B2C]();
          v18 = (void *)MEMORY[0x1E0CD1398];
          objc_msgSend(v16, "mad_photosLocalIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "uuidFromLocalIdentifier:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v63, "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v19) = v21 == 0;

          if ((_DWORD)v19)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "setObject:forKeyedSubscript:", v22, v20);

          }
          objc_msgSend(v16, "vectors");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "count") == 0;

          if (v24)
          {
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v78 = v20;
              v26 = MEMORY[0x1E0C81028];
              v27 = "[MADEmbeddingStore][%@] Invalid embedding count";
LABEL_27:
              _os_log_impl(&dword_1B6C4A000, v26, OS_LOG_TYPE_ERROR, v27, buf, 0xCu);
            }
          }
          else
          {
            if (objc_msgSend(v16, "mad_hasImageEmbedding"))
            {
              objc_msgSend(v63, "objectForKeyedSubscript:", v20);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "insertObject:atIndex:", v16, 0);

              goto LABEL_28;
            }
            if (objc_msgSend(v16, "mad_hasVideoEmbedding"))
            {
              objc_msgSend(v63, "objectForKeyedSubscript:", v20);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "addObject:", v16);

              goto LABEL_28;
            }
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v78 = v20;
              v26 = MEMORY[0x1E0C81028];
              v27 = "[MADEmbeddingStore][%@] Invalid embedding type";
              goto LABEL_27;
            }
          }
LABEL_28:

          objc_autoreleasePoolPop(v17);
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
      }
      while (v13);
    }

    v29 = objc_msgSend(v63, "count");
    if (v29 != objc_msgSend(v57, "count")
      && (int)MediaAnalysisLogLevel() >= 3
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v30 = objc_msgSend(v63, "count");
      v31 = objc_msgSend(v12, "count");
      v32 = objc_msgSend(v57, "count");
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v78 = v30;
      *(_WORD *)&v78[4] = 1024;
      *(_DWORD *)&v78[6] = v31;
      *(_WORD *)v79 = 1024;
      *(_DWORD *)&v79[2] = v32;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADEmbeddingStore] Fetched %u assets (%u image+video entries) from vector database, but expecting %u", buf, 0x14u);
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v59 = (id)objc_claimAutoreleasedReturnValue();
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v33 = v63;
    obj = v33;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
    if (v34)
    {
      v58 = *(_QWORD *)v69;
      do
      {
        v35 = 0;
        v60 = v34;
        do
        {
          if (*(_QWORD *)v69 != v58)
            objc_enumerationMutation(obj);
          v36 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * v35);
          v37 = (void *)MEMORY[0x1BCCA1B2C]();
          objc_msgSend(obj, "objectForKeyedSubscript:", v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = 0u;
          v67 = 0u;
          v64 = 0u;
          v65 = 0u;
          v40 = v38;
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
          if (v41)
          {
            v42 = *(_QWORD *)v65;
            do
            {
              for (j = 0; j != v41; ++j)
              {
                if (*(_QWORD *)v65 != v42)
                  objc_enumerationMutation(v40);
                objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * j), "vectors");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "addObjectsFromArray:", v44);

              }
              v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
            }
            while (v41);
          }

          v45 = -[MADEmbedding initWithFormat:dimension:version:vectors:]([MADEmbedding alloc], "initWithFormat:dimension:version:vectors:", 1, 1, v61, v39);
          objc_msgSend(v59, "setObject:forKeyedSubscript:", v45, v36);

          if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            v46 = objc_msgSend(v39, "count");
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)v78 = v36;
            *(_WORD *)&v78[8] = 1024;
            *(_DWORD *)v79 = v46;
            *(_WORD *)&v79[4] = 1024;
            v80 = v61;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADEmbeddingStore][%@] Fetched %u embeddings (version %u) from vector database", buf, 0x18u);
          }

          objc_autoreleasePoolPop(v37);
          ++v35;
        }
        while (v35 != v60);
        v33 = obj;
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
      }
      while (v34);
    }
    v47 = v33;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v78 = v51;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADEmbeddingStore] Failed to fetch embeddings from vector database: %@", buf, 0xCu);
    }
    if (!a6)
    {
      v59 = 0;
      goto LABEL_58;
    }
    v48 = (void *)MEMORY[0x1E0CB35C8];
    v84 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MADEmbeddingStore] Failed to fetch embeddings from vector database: %@"), v51);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v85[0] = v47;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, &v84, 1);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18);
    v59 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_58:
  return v59;
}

+ (id)searchWithEmbeddings:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  MADEmbeddingSearchResult *v39;
  void *v40;
  MADEmbeddingSearchResult *v41;
  int v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  void *context;
  void *v60;
  unint64_t i;
  void *v62;
  id obj;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  id v68;
  _BYTE v69[128];
  uint64_t v70;
  void *v71;
  uint8_t buf[4];
  _BYTE v73[10];
  uint64_t v74;
  _QWORD v75[4];

  v75[1] = *MEMORY[0x1E0C80C00];
  v56 = a3;
  v9 = a4;
  v53 = a5;
  v49 = v9;
  if (v9)
  {
    v57 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD16F0], "systemPhotoLibraryURL");
    v57 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD16F0]), "initWithPhotoLibraryURL:", v57);
  v50 = (void *)v10;
  if (v10)
  {
    +[MADVectorDatabaseManager sharedDatabaseWithPhotoLibrary:](MADVectorDatabaseManager, "sharedDatabaseWithPhotoLibrary:", v10);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      v11 = v53;
    }
    else
    {
      +[MADEmbeddingSearchOptions defaultOptions](MADEmbeddingSearchOptions, "defaultOptions");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v54 = v11;
    objc_msgSend(v11, "assetUUIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      v15 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v54, "assetUUIDs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setWithArray:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CD1398], "localIdentifiersWithUUIDs:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");
      if (v19 != objc_msgSend(v17, "count")
        && (int)MediaAnalysisLogLevel() >= 3
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v73 = objc_msgSend(v18, "count");
        *(_WORD *)&v73[4] = 1024;
        *(_DWORD *)&v73[6] = objc_msgSend(v17, "count");
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADEmbeddingStore] Failed to convert all UUIDs to local identifiers, converted %u but expected %u", buf, 0xEu);
      }

      v20 = v18;
    }
    else
    {
      v20 = 0;
    }
    v48 = v20;
    objc_msgSend(v20, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v54, "resultLimit");
    v23 = objc_msgSend(v54, "fullScan");
    v24 = objc_msgSend(v54, "includePayload");
    objc_msgSend(v54, "numberOfProbes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "batchSize");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "numConcurrentReaders");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = 0;
    objc_msgSend(v52, "searchWithEmbeddings:localIdentifiers:attributeFilters:limit:fullScan:includePayload:numberOfProbes:batchSize:numConcurrentReaders:error:", v56, v21, 0, v22, v23, v24, v25, v26, v27, &v68);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v68;

    if (v51)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v73 = v51;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADEmbeddingStore] Failed to search with embeddings %@", buf, 0xCu);
      }
      if (a6)
      {
        v58 = 0;
        *a6 = (id)objc_msgSend(v51, "copy");
LABEL_46:

        goto LABEL_47;
      }
    }
    else
    {
      v28 = objc_msgSend(v60, "count");
      if (v28 == objc_msgSend(v56, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v58 = (id)objc_claimAutoreleasedReturnValue();
        for (i = 0; i < objc_msgSend(v60, "count"); ++i)
        {
          context = (void *)MEMORY[0x1BCCA1B2C]();
          objc_msgSend(v60, "objectAtIndexedSubscript:", i);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = 0u;
          v67 = 0u;
          v64 = 0u;
          v65 = 0u;
          obj = v55;
          v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
          if (v30)
          {
            v31 = *(_QWORD *)v65;
            do
            {
              for (j = 0; j != v30; ++j)
              {
                if (*(_QWORD *)v65 != v31)
                  objc_enumerationMutation(obj);
                v33 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
                v34 = (void *)MEMORY[0x1BCCA1B2C]();
                v35 = (void *)MEMORY[0x1E0DC6850];
                objc_msgSend(v33, "stringIdentifier");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "mad_localIdentifierFromStringIdentifier:", v36);
                v37 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x1E0CD1398], "uuidFromLocalIdentifier:", v37);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v29, "containsObject:", v38) & 1) == 0)
                {
                  v39 = [MADEmbeddingSearchResult alloc];
                  objc_msgSend(v33, "value");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  v41 = -[MADEmbeddingSearchResult initWithAssetUUID:distance:metric:](v39, "initWithAssetUUID:distance:metric:", v38, v40, objc_msgSend(v33, "metric"));

                  objc_msgSend(v62, "addObject:", v41);
                  objc_msgSend(v29, "addObject:", v38);

                }
                objc_autoreleasePoolPop(v34);
              }
              v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
            }
            while (v30);
          }

          objc_msgSend(v58, "addObject:", v62);
          objc_autoreleasePoolPop(context);
        }
        goto LABEL_46;
      }
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v42 = objc_msgSend(v56, "count");
        v43 = objc_msgSend(v60, "count");
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v73 = v42;
        *(_WORD *)&v73[4] = 1024;
        *(_DWORD *)&v73[6] = v43;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADEmbeddingStore] Invalid search results count: expected %u but received %u", buf, 0xEu);
      }
      if (a6)
      {
        v44 = (void *)MEMORY[0x1E0CB35C8];
        v70 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MADEmbeddingStore] Invalid search results count: expected %u but received %u"), objc_msgSend(v56, "count"), objc_msgSend(v60, "count"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v45;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v46);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    v58 = 0;
    goto LABEL_46;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v73 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADEmbeddingStore] Failed to initialize Photo Library %@", buf, 0xCu);
  }
  if (a6)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v74 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MADEmbeddingStore] Failed to initialize Photo Library %@"), 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v75[0] = v52;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, &v74, 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50);
    v58 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_47:

    goto LABEL_48;
  }
  v58 = 0;
LABEL_48:

  return v58;
}

+ (void)prewarmSearchWithConcurrencyLimit:(unint64_t)a3 photoLibraryURL:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD16F0], "systemPhotoLibraryURL");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD16F0]), "initWithPhotoLibraryURL:", v9);
  if (v11)
  {
    +[MADVectorDatabaseManager sharedDatabaseWithPhotoLibrary:](MADVectorDatabaseManager, "sharedDatabaseWithPhotoLibrary:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "prewarmSearchWithConcurrencyLimit:", a3);

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADEmbeddingStore] Failed to initialize Photo Library %@", buf, 0xCu);
    }
    if (a5)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MADEmbeddingStore] Failed to initialize Photo Library %@"), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v15);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

}

@end
