@implementation VCPPhotosAutoCounterWorker

- (VCPPhotosAutoCounterWorker)initWithPhotoLibrary:(id)a3
{
  id v5;
  VCPPhotosAutoCounterWorker *v6;
  VCPPhotosAutoCounterWorker *v7;
  void *v8;
  objc_class *v9;
  objc_class *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v18;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VCPPhotosAutoCounterWorker;
  v6 = -[VCPPhotosAutoCounterWorker init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    +[VCPFaceProcessingVersionManager sharedManagerForPhotoLibrary:](VCPFaceProcessingVersionManager, "sharedManagerForPhotoLibrary:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_processingVersion = objc_msgSend(v8, "currentProcessingVersion");

    v7->_personClusterVersion = *MEMORY[0x1E0D77FC0];
    v9 = (objc_class *)objc_opt_class();
    v7->_detectionVersion = VCPMAGetRevisionForVisionModel(v9, v7->_processingVersion);
    v10 = (objc_class *)objc_opt_class();
    v7->_recognitionVersion = VCPMAGetRevisionForVisionModel(v10, v7->_processingVersion);
    v7->_madVersion = 1;
    v7->_clusterDumpFaceFetched = 0;
    -[PHPhotoLibrary vcp_visionCacheStorageDirectoryURL](v7->_photoLibrary, "vcp_visionCacheStorageDirectoryURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc((Class)getGDVUVisualUnderstandingServiceClass());
    objc_msgSend(getGDVUEntityRecognitionClientClass(), "photos");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v14 = (void *)objc_msgSend(v12, "initWithClient:version:url:error:", v13, 1, v11, &v18);
    v15 = v18;

    objc_msgSend(v14, "gallery");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_vuVersion = objc_msgSend(v16, "version");

  }
  return v7;
}

+ (id)workerWithPhotoLibrary:(id)a3
{
  id v3;
  VCPPhotosAutoCounterWorker *v4;
  uint8_t v6[16];

  v3 = a3;
  if ((VCPMAIsAppleInternal() & 1) != 0)
  {
    v4 = -[VCPPhotosAutoCounterWorker initWithPhotoLibrary:]([VCPPhotosAutoCounterWorker alloc], "initWithPhotoLibrary:", v3);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[AutoCounter] feature not supported on this OS variant", v6, 2u);
    }
    v4 = 0;
  }

  return v4;
}

- (id)_groundTruthURL
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__VCPPhotosAutoCounterWorker__groundTruthURL__block_invoke;
  block[3] = &unk_1E6B15468;
  block[4] = self;
  if (-[VCPPhotosAutoCounterWorker _groundTruthURL]::groundTruthURLToken != -1)
    dispatch_once(&-[VCPPhotosAutoCounterWorker _groundTruthURL]::groundTruthURLToken, block);
  return (id)-[VCPPhotosAutoCounterWorker _groundTruthURL]::groundTruthURL;
}

void __45__VCPPhotosAutoCounterWorker__groundTruthURL__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AutoCounterGroundTruth.plist"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "vcp_visionCacheStorageDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", v5);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)-[VCPPhotosAutoCounterWorker _groundTruthURL]::groundTruthURL;
  -[VCPPhotosAutoCounterWorker _groundTruthURL]::groundTruthURL = v3;

}

- (int)_loadGroundTruthURL:(id)a3 toGroundTruth:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  VCPPhotosAutoCounterWorker *v15;
  int v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

    if (v11)
    {
      LODWORD(a5) = 0;
      *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithContentsOfURL:", v8);
    }
    else
    {
      *a4 = (id)MEMORY[0x1E0C9AA70];
      v15 = self;
      objc_sync_enter(v15);
      v16 = objc_msgSend(*a4, "writeToURL:error:", v8, a5);
      objc_sync_exit(v15);

      if (v16)
        LODWORD(a5) = 0;
      else
        LODWORD(a5) = -20;
    }

  }
  else if (a5)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[AutoCounter] Cannot load ground truth file URL"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v14);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    LODWORD(a5) = 0;
  }

  return (int)a5;
}

- (int)_loadGroundTruth:(id *)a3 error:(id *)a4
{
  void *v7;

  -[VCPPhotosAutoCounterWorker _groundTruthURL](self, "_groundTruthURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = -[VCPPhotosAutoCounterWorker _loadGroundTruthURL:toGroundTruth:error:](self, "_loadGroundTruthURL:toGroundTruth:error:", v7, a3, a4);

  return (int)a4;
}

- (unint64_t)optInPersonCount
{
  int v2;
  id v3;
  void *v4;
  unint64_t v5;
  id v7;

  v7 = 0;
  v2 = -[VCPPhotosAutoCounterWorker _loadGroundTruth:error:](self, "_loadGroundTruth:error:", &v7, 0);
  v3 = v7;
  v4 = v3;
  if (v2)
    v5 = 0;
  else
    v5 = objc_msgSend(v3, "count");

  return v5;
}

- (id)_fetchPeopleHomePersons
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPersonContext:", 1);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("faceCount"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortDescriptors:", v5);

  objc_msgSend(MEMORY[0x1E0CD16C8], "fetchPersonsWithOptions:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_anonymizedName:(id)a3
{
  id v3;
  id v4;
  void *v5;
  __CFString *v6;
  unsigned __int8 md[20];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "dataUsingEncoding:allowLossyConversion:", 1, 1);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CC_SHA1((const void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"), md);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 20);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = CFSTR("no_name");
  }

  return v6;
}

+ (BOOL)_dumpFaceprint
{
  return 0;
}

- (int)_processFetchedFaceGroup:(id)a3 forPersonID:(id)a4 facesPerAsset:(id)a5 assetInformation:(id)a6 extendTimeoutBlock:(id)a7 cancelBlock:(id)a8
{
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  const __CFString *v40;
  void *v41;
  BOOL v42;
  void *v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  double v47;
  double v48;
  unint64_t v49;
  double v50;
  double v51;
  unint64_t v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  __CFString *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  __CFString *v67;
  void *v68;
  NSObject *v69;
  NSObject *v70;
  int v71;
  int v72;
  id v74;
  void *v75;
  id obj;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *context;
  uint64_t v81;
  VCPPhotosAutoCounterWorker *v82;
  void *v83;
  id v84;
  void *v85;
  id v86;
  id v87;
  id v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  void (**v92)(void);
  uint64_t (**v93)(void);
  void *v94;
  void *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  void *v104;
  const __CFString *v105;
  void *v106;
  uint8_t buf[4];
  void *v108;
  void *v109;
  _BYTE v110[128];
  _BYTE v111[128];
  uint64_t v112;
  _QWORD v113[5];
  NSRect v114;

  v113[2] = *MEMORY[0x1E0C80C00];
  v74 = a3;
  v88 = a4;
  v87 = a5;
  v86 = a6;
  v92 = (void (**)(void))a7;
  v93 = (uint64_t (**)(void))a8;
  v82 = self;
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setIncludeNonvisibleFaces:", 0);
  v14 = *MEMORY[0x1E0CD1B68];
  v113[0] = *MEMORY[0x1E0CD1B58];
  v113[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setFetchPropertySets:", v15);

  objc_msgSend(MEMORY[0x1E0CD1398], "vcp_fetchOptionsForLibrary:forTaskID:", self->_photoLibrary, 3);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = *MEMORY[0x1E0CD1970];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v112, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "addFetchPropertySets:", v16);

  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  obj = v74;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v111, 16);
  if (v17)
  {
    v78 = *(_QWORD *)v101;
    while (2)
    {
      v81 = 0;
      v77 = v17;
      do
      {
        if (*(_QWORD *)v101 != v78)
          objc_enumerationMutation(obj);
        v83 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * v81);
        context = (void *)MEMORY[0x1BCCA1B2C]();
        objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesInFaceGroup:options:", v83, v79);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v82->_clusterDumpFaceFetched += objc_msgSend(v18, "count");
        v96 = 0u;
        v97 = 0u;
        v98 = 0u;
        v99 = 0u;
        v84 = v18;
        v19 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v96, v110, 16);
        if (v19)
        {
          v75 = v18;
          v90 = *(_QWORD *)v97;
          while (2)
          {
            v91 = v19;
            for (i = 0; i != v91; ++i)
            {
              if (*(_QWORD *)v97 != v90)
                objc_enumerationMutation(v84);
              v21 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * i);
              if (v93 && (v93[2]() & 1) != 0)
              {
                v71 = 0;
                goto LABEL_76;
              }
              if (v92)
                v92[2]();
              v22 = (void *)MEMORY[0x1E0CD1398];
              v109 = v21;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v109, 1, v74, v75);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "fetchAssetsForFaces:options:", v23, v89);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "firstObject");
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              if (v25)
              {
                objc_msgSend(v25, "cloudIdentifier");
                v26 = objc_claimAutoreleasedReturnValue();
                if (!v26)
                {
                  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                  {
                    objc_msgSend(v25, "localIdentifier");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v108 = v27;
                    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[AutoCounter] Asset without cloudIdentifier, use localIdentifier: %@", buf, 0xCu);

                  }
                  objc_msgSend(v25, "localIdentifier");
                  v26 = objc_claimAutoreleasedReturnValue();
                }
                v95 = (void *)v26;
                objc_msgSend(v87, "objectForKeyedSubscript:");
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v94)
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v87, "setObject:forKeyedSubscript:", v94, v95);
                }
                objc_msgSend(v86, "objectForKeyedSubscript:", v95);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = v28 == 0;

                if (v29)
                {
                  v105 = CFSTR("AddedDate");
                  v30 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v25, "curationProperties");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "addedDate");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "timeIntervalSinceReferenceDate");
                  objc_msgSend(v30, "numberWithDouble:");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v106 = v33;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v86, "setObject:forKeyedSubscript:", v34, v95);

                }
                objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CD16C8], "fetchPersonWithFace:options:", v21, v85);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "firstObject");
                v37 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v37, "localIdentifier");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                if (v38)
                  goto LABEL_30;
                if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[AutoCounter] Person without localIdentifier; use face.personLocalidentifier",
                    buf,
                    2u);
                }
                objc_msgSend(v21, "personLocalIdentifier");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                if (v38)
                {
LABEL_30:
                  objc_msgSend(v35, "setObject:forKey:", v38, CFSTR("personID"));
                  if (v88 && (objc_msgSend(v88, "isEqualToString:", v38) & 1) == 0)
                  {
                    if ((int)MediaAnalysisLogLevel() >= 7)
                    {
                      v69 = MEMORY[0x1E0C81028];
                      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_1B6C4A000, v69, OS_LOG_TYPE_DEBUG, "[AutoCounter] Fetched face/person not matching required person; skip",
                          buf,
                          2u);
                      }
                    }
                  }
                  else
                  {
                    v39 = objc_msgSend(v37, "verifiedType");
                    v40 = CFSTR("unknown");
                    if (v39 < 3)
                      v40 = off_1E6B1AA08[v39];
                    objc_msgSend(v35, "setObject:forKey:", v40, CFSTR("verifiedType"));
                    if (v37)
                    {
                      objc_msgSend(v37, "name");
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      v42 = v41 == 0;

                      if (!v42)
                      {
                        objc_msgSend(v37, "name");
                        v43 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v35, "setObject:forKey:", v43, CFSTR("personName"));

                      }
                    }
                    v44 = objc_msgSend(v25, "pixelWidth");
                    v45 = objc_msgSend(v25, "pixelHeight");
                    if (v44 <= v45)
                      v46 = v45;
                    else
                      v46 = v44;
                    objc_msgSend(v21, "centerX");
                    v48 = v47;
                    v49 = objc_msgSend(v25, "pixelWidth");
                    objc_msgSend(v21, "centerY");
                    v51 = v50;
                    v52 = objc_msgSend(v25, "pixelHeight");
                    objc_msgSend(v21, "size");
                    v54 = v53;
                    objc_msgSend(v21, "size");
                    v114.origin.y = v51 * (double)v52;
                    v114.size.width = v54 * (double)v46;
                    v114.size.height = v55 * (double)v46;
                    v114.origin.x = v48 * (double)v49;
                    NSStringFromRect(v114);
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "setObject:forKey:", v56, CFSTR("faceRect"));

                    objc_msgSend(v83, "localIdentifier");
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v57)
                    {
                      objc_msgSend(v35, "setObject:forKey:", v57, CFSTR("faceGroupID"));
                      if (objc_msgSend((id)objc_opt_class(), "_dumpFaceprint"))
                      {
                        objc_msgSend(v21, "faceClusteringProperties");
                        v58 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v58, "faceprint");
                        v59 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v59, "faceprintData");
                        v60 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_msgSend(v60, "base64EncodedStringWithOptions:", 0);
                        v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
                        if (!v61)
                        {
                          v61 = CFSTR("unknown");
                          if ((int)MediaAnalysisLogLevel() >= 4
                            && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                          {
                            *(_WORD *)buf = 0;
                            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[AutoCounter] No valid faceprint data; leave as unknown",
                              buf,
                              2u);
                          }
                        }
                        objc_msgSend(v35, "setObject:forKey:", v61, CFSTR("faceprint"));

                      }
                      v62 = (void *)MEMORY[0x1E0CD14D0];
                      objc_msgSend(v25, "localIdentifier");
                      v63 = (void *)objc_claimAutoreleasedReturnValue();
                      v104 = v63;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v104, 1);
                      v64 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v62, "fetchMomentsForAssetsWithLocalIdentifiers:options:", v64, v85);
                      v65 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v65, "firstObject");
                      v66 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v66, "localIdentifier");
                      v67 = (__CFString *)objc_claimAutoreleasedReturnValue();

                      if (!v67)
                      {
                        v67 = CFSTR("unknown");
                        if ((int)MediaAnalysisLogLevel() >= 4
                          && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[AutoCounter] No valid momentLocalIdentifier; leave as 'unknown'",
                            buf,
                            2u);
                        }
                      }
                      objc_msgSend(v35, "setObject:forKey:", v67, CFSTR("momentIdentifier"));
                      objc_msgSend(v21, "localIdentifier");
                      v68 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v68)
                      {
                        objc_msgSend(v35, "setObject:forKey:", v68, CFSTR("faceID"));
                        objc_msgSend(v94, "addObject:", v35);
                      }
                      else if ((int)MediaAnalysisLogLevel() >= 4
                             && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[AutoCounter] Face without localIdentifier; skip",
                          buf,
                          2u);
                      }

                    }
                    else if ((int)MediaAnalysisLogLevel() >= 4
                           && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[AutoCounter] Face in a facegroup without localIdentifier; skip",
                        buf,
                        2u);
                    }

                  }
                }
                else
                {
                  if ((int)MediaAnalysisLogLevel() >= 4)
                  {
                    v70 = MEMORY[0x1E0C81028];
                    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1B6C4A000, v70, OS_LOG_TYPE_DEFAULT, "[AutoCounter] Face without personLocalIdentifier; skip",
                        buf,
                        2u);
                    }
                  }
                  v38 = 0;
                }

              }
              else if ((int)MediaAnalysisLogLevel() >= 4
                     && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v108 = v21;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[AutoCounter] Failed to find asset for face: %@; skip",
                  buf,
                  0xCu);
              }

            }
            v19 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v96, v110, 16);
            if (v19)
              continue;
            break;
          }
        }
        v71 = 1;
LABEL_76:

        objc_autoreleasePoolPop(context);
        if (!v71)
        {
          v72 = -128;
          goto LABEL_81;
        }
        ++v81;
      }
      while (v81 != v77);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v111, 16);
      if (v17)
        continue;
      break;
    }
  }
  v72 = 0;
LABEL_81:

  return v72;
}

- (void)_fetchPersonWithIdentifier:(id)a3 facesPerAsset:(id)a4 assetInformation:(id)a5 extendTimeoutBlock:(id)a6 cancelBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  PHPhotoLibrary *photoLibrary;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v33 = a4;
  v34 = a5;
  v13 = a6;
  v14 = a7;
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0CD16C8];
  v38[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fetchPersonsWithLocalIdentifiers:options:", v17, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v18, "count"))
  {
    v19 = -[PHPhotoLibrary mad_useVUGallery](self->_photoLibrary, "mad_useVUGallery");
    photoLibrary = self->_photoLibrary;
    if (v19)
    {
      -[PHPhotoLibrary vcp_visionCacheStorageDirectoryURL](photoLibrary, "vcp_visionCacheStorageDirectoryURL");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_alloc((Class)getGDVUVisualUnderstandingServiceClass());
      objc_msgSend(getGDVUEntityRecognitionClientClass(), "photos");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      v23 = (void *)objc_msgSend(v21, "initWithClient:version:url:error:", v22, 1, v32, &v35);
      v31 = v35;

      objc_msgSend(v23, "gallery");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(getGDVUEntityClassClass(), "person");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "clustersFor:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      -[VCPPhotosAutoCounterWorker _processFetchedVURawCluster:forPersonLocalIdentifier:facesPerAsset:assetInformation:extendTimeoutBlock:cancelBlock:](self, "_processFetchedVURawCluster:forPersonLocalIdentifier:facesPerAsset:assetInformation:extendTimeoutBlock:cancelBlock:", v26, v12, v33, v34, v13, v14);
    }
    else
    {
      -[PHPhotoLibrary librarySpecificFetchOptions](photoLibrary, "librarySpecificFetchOptions");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setMinimumUnverifiedFaceCount:", 1);
      objc_msgSend(v27, "setMinimumVerifiedFaceCount:", 1);
      v28 = (void *)MEMORY[0x1E0CD1558];
      objc_msgSend(v18, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "fetchFaceGroupsForPerson:options:", v29, v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      -[VCPPhotosAutoCounterWorker _processFetchedFaceGroup:forPersonID:facesPerAsset:assetInformation:extendTimeoutBlock:cancelBlock:](self, "_processFetchedFaceGroup:forPersonID:facesPerAsset:assetInformation:extendTimeoutBlock:cancelBlock:", v30, v12, v33, v34, v13, v14);
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v12;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[AutoCounter] Failed to fetch person %@", buf, 0xCu);
  }

}

- (BOOL)optInStatus:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  uint8_t v12[8];
  id v13;

  v6 = a3;
  v13 = 0;
  LODWORD(a4) = -[VCPPhotosAutoCounterWorker _loadGroundTruth:error:](self, "_loadGroundTruth:error:", &v13, a4);
  v7 = v13;
  v8 = v7;
  if ((_DWORD)a4)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[AutoCounter] Fail to load groundtruth file", v12, 2u);
    }
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10 != 0;

  }
  return v9;
}

- (BOOL)optInUserPickedPerson:(id)a3 error:(id *)a4 extendTimeoutBlock:(id)a5 cancelBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  char v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  VCPPhotosAutoCounterWorker *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  __CFString *v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  _QWORD v55[4];
  __CFString *v56;
  uint8_t buf[4];
  const __CFString *v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  id v62;
  uint64_t v63;
  _QWORD v64[3];

  v64[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PersonIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v58 = CFSTR("[AutoCounter][OptIn]");
    v59 = 2112;
    v60 = (uint64_t)v13;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%@ Receiving opt-in person (%@)", buf, 0x16u);

  }
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __89__VCPPhotosAutoCounterWorker_optInUserPickedPerson_error_extendTimeoutBlock_cancelBlock___block_invoke;
  v55[3] = &unk_1E6B19C78;
  v56 = CFSTR("[AutoCounter][OptIn]");
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v55);
  v54 = 0;
  v14 = -[VCPPhotosAutoCounterWorker _loadGroundTruth:error:](self, "_loadGroundTruth:error:", &v54, a4);
  v15 = v54;
  if (v14)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v58 = CFSTR("[AutoCounter][OptIn]");
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ Fail to load groundtruth file", buf, 0xCu);
    }
    v16 = 1;
  }
  else
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PersonIdentifier"));
    v53 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v53);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17 == 0;

    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCPPhotosAutoCounterWorker _fetchPersonWithIdentifier:facesPerAsset:assetInformation:extendTimeoutBlock:cancelBlock:](self, "_fetchPersonWithIdentifier:facesPerAsset:assetInformation:extendTimeoutBlock:cancelBlock:", v53, v51);
      objc_msgSend(v51, "allKeys");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count") == 0;

      if (v21)
      {
        v41 = (void *)MEMORY[0x1E0CB35C8];
        v63 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Failed to fetch person %@"), CFSTR("[AutoCounter][OptIn]"), v53);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v64[0] = v42;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, &v63, 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v43);
        v40 = (id)objc_claimAutoreleasedReturnValue();

        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v40, "description");
          v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v58 = v44;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
        v16 = 0;
        if (a4)
        {
          v40 = objc_retainAutorelease(v40);
          *a4 = v40;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setObject:forKeyedSubscript:", v51, CFSTR("FacesPerAsset"));
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PersonInformation"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = (void *)objc_msgSend(v22, "mutableCopy");

        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setObject:forKeyedSubscript:");
        v23 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v48, "timeIntervalSinceReferenceDate");
        objc_msgSend(v23, "numberWithDouble:");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setObject:forKeyedSubscript:", v24, CFSTR("OptInDateSinceReferenceDate"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PHPhotoLibrary mad_faceProcessingInternalVersion](self->_photoLibrary, "mad_faceProcessingInternalVersion"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setObject:forKeyedSubscript:", v25, CFSTR("OptInMADFaceVersion"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_detectionVersion);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setObject:forKeyedSubscript:", v26, CFSTR("OptInDetectionModelVersion"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_recognitionVersion);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setObject:forKeyedSubscript:", v27, CFSTR("OptInRecognitionModelVersion"));

        -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = (void *)MEMORY[0x1E0CB37E8];
        v47 = (void *)v28;
        objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithOptions:");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "numberWithUnsignedInteger:", objc_msgSend(v30, "count"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setObject:forKeyedSubscript:", v31, CFSTR("FaceCount"));

        v32 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(MEMORY[0x1E0CD1398], "fetchAssetsWithOptions:", v47);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "numberWithUnsignedInteger:", objc_msgSend(v33, "count"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setObject:forKeyedSubscript:", v34, CFSTR("AssetCount"));

        objc_msgSend(v50, "setObject:forKeyedSubscript:", v52, CFSTR("AdditionalInformation"));
        v35 = (void *)objc_msgSend(v15, "mutableCopy");
        objc_msgSend(v35, "setObject:forKeyedSubscript:", v50, v53);
        v36 = self;
        objc_sync_enter(v36);
        -[VCPPhotosAutoCounterWorker _groundTruthURL](v36, "_groundTruthURL");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v35, "writeToURL:error:", v37, a4);

        objc_sync_exit(v36);
        if ((v16 & 1) == 0
          && (int)MediaAnalysisLogLevel() >= 3
          && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          -[VCPPhotosAutoCounterWorker _groundTruthURL](v36, "_groundTruthURL");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = *a4;
          *(_DWORD *)buf = 138412802;
          v58 = CFSTR("[AutoCounter][OptIn]");
          v59 = 2112;
          v60 = (uint64_t)v38;
          v61 = 2112;
          v62 = v39;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ Cannot write opt-in groundtruth to %@ : %@", buf, 0x20u);

        }
        v40 = v50;
      }

      v19 = (void *)v53;
    }
    else
    {
      v19 = (void *)v53;
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v58 = CFSTR("[AutoCounter][OptIn]");
        v59 = 2112;
        v60 = v53;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%@ Person (%@) already opt-in; skip",
          buf,
          0x16u);
      }
      v16 = 1;
    }

  }
  return v16;
}

void __89__VCPPhotosAutoCounterWorker_optInUserPickedPerson_error_extendTimeoutBlock_cancelBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138412802;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ -> %@ : %@", (uint8_t *)&v8, 0x20u);
  }

}

- (int)_processFetchedVURawCluster:(id)a3 forPersonLocalIdentifier:(id)a4 facesPerAsset:(id)a5 assetInformation:(id)a6 extendTimeoutBlock:(id)a7 cancelBlock:(id)a8
{
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  const __CFString *v46;
  void *v47;
  BOOL v48;
  void *v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  double v53;
  double v54;
  unint64_t v55;
  double v56;
  double v57;
  unint64_t v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  __CFString *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  __CFString *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  NSObject *v76;
  NSObject *v77;
  int v78;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  void *v84;
  id obj;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *context;
  uint64_t v90;
  void *v91;
  VCPPhotosAutoCounterWorker *v92;
  uint64_t v93;
  id v94;
  id v95;
  id v96;
  id v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  void (**v103)(void);
  void *v104;
  uint64_t (**v105)(void);
  void *v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  void *v115;
  const __CFString *v116;
  void *v117;
  _BYTE v118[128];
  uint64_t v119;
  uint8_t buf[4];
  const __CFString *v121;
  __int16 v122;
  uint64_t v123;
  __int16 v124;
  uint64_t v125;
  __int16 v126;
  uint64_t v127;
  __int16 v128;
  uint64_t v129;
  __int16 v130;
  uint64_t v131;
  _BYTE v132[128];
  uint64_t v133;
  _QWORD v134[5];
  NSRect v135;

  v134[2] = *MEMORY[0x1E0C80C00];
  v83 = a3;
  v97 = a4;
  v96 = a5;
  v95 = a6;
  v103 = (void (**)(void))a7;
  v105 = (uint64_t (**)(void))a8;
  v92 = self;
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setIncludeNonvisibleFaces:", 0);
  v14 = *MEMORY[0x1E0CD1B68];
  v134[0] = *MEMORY[0x1E0CD1B58];
  v134[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v134, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setFetchPropertySets:", v15);

  objc_msgSend(MEMORY[0x1E0CD1398], "vcp_fetchOptionsForLibrary:forTaskID:", self->_photoLibrary, 3);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = *MEMORY[0x1E0CD1970];
  v133 = *MEMORY[0x1E0CD1970];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v133, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "addFetchPropertySets:", v16);

  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "allKeys");
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v132, 16);
  if (!v17)
    goto LABEL_96;
  v81 = 0;
  v86 = *(_QWORD *)v112;
  do
  {
    v90 = 0;
    v87 = v17;
    do
    {
      if (*(_QWORD *)v112 != v86)
        objc_enumerationMutation(obj);
      v93 = *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * v90);
      context = (void *)MEMORY[0x1BCCA1B2C]();
      v18 = MEMORY[0x1E0C81028];
      if (!v105 || (v105[2]() & 1) == 0)
      {
        if (v103)
          v103[2]();
        objc_msgSend(v83, "objectForKeyedSubscript:", v93);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithVuObservationIDs:options:");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v20 = objc_msgSend(obj, "count");
          v21 = objc_msgSend(v91, "count");
          v22 = objc_msgSend(v88, "count");
          *(_DWORD *)buf = 138413570;
          v121 = CFSTR("[AutoCounter][VURawCluster]");
          v122 = 2048;
          v123 = ++v81;
          v124 = 2048;
          v125 = v20;
          v126 = 2048;
          v127 = v21;
          v128 = 2048;
          v129 = v22;
          v130 = 2112;
          v131 = v93;
          _os_log_impl(&dword_1B6C4A000, v18, OS_LOG_TYPE_DEBUG, "%@ (%lu out of %lu) Fetched %lu out of %lu faces from raw-cluster %@", buf, 0x3Eu);
        }
        if (objc_msgSend(v91, "count"))
        {
          v92->_clusterDumpFaceFetched += objc_msgSend(v91, "count");
          v23 = (void *)MEMORY[0x1E0CD1398];
          v119 = v82;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v119, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "fetchAssetsGroupedByFaceUUIDForFaces:fetchPropertySets:", v91, v24);
          v99 = (void *)objc_claimAutoreleasedReturnValue();

          v109 = 0u;
          v110 = 0u;
          v107 = 0u;
          v108 = 0u;
          v94 = v91;
          v25 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v107, v118, 16);
          if (v25)
          {
            v100 = *(_QWORD *)v108;
            do
            {
              v26 = 0;
              v102 = v25;
              do
              {
                if (*(_QWORD *)v108 != v100)
                  objc_enumerationMutation(v94);
                v27 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * v26);
                v28 = (void *)MEMORY[0x1BCCA1B2C]();
                if (!v105 || (v105[2]() & 1) == 0)
                {
                  if (v103)
                    v103[2]();
                  objc_msgSend(v27, "uuid");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v99, "objectForKeyedSubscript:", v29);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v30)
                  {
                    objc_msgSend(v30, "cloudIdentifier");
                    v31 = objc_claimAutoreleasedReturnValue();
                    if (!v31)
                    {
                      if ((int)MediaAnalysisLogLevel() >= 6
                        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                      {
                        objc_msgSend(v30, "localIdentifier");
                        v32 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412546;
                        v121 = CFSTR("[AutoCounter][VURawCluster]");
                        v122 = 2112;
                        v123 = (uint64_t)v32;
                        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%@ Asset without cloudIdentifier (use localIdentifier %@)", buf, 0x16u);

                      }
                      objc_msgSend(v30, "localIdentifier");
                      v31 = objc_claimAutoreleasedReturnValue();
                    }
                    objc_msgSend(v96, "objectForKeyedSubscript:", v31);
                    v33 = objc_claimAutoreleasedReturnValue();
                    v101 = (void *)v31;
                    if (!v33)
                    {
                      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                      v33 = objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v96, "setObject:forKeyedSubscript:", v33, v31);
                    }
                    objc_msgSend(v95, "objectForKeyedSubscript:", v31);
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    v104 = (void *)v33;
                    v35 = v34 == 0;

                    if (v35)
                    {
                      v116 = CFSTR("AddedDate");
                      v36 = (void *)MEMORY[0x1E0CB37E8];
                      objc_msgSend(v30, "curationProperties");
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v37, "addedDate");
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v38, "timeIntervalSinceReferenceDate");
                      objc_msgSend(v36, "numberWithDouble:");
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      v117 = v39;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1);
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v95, "setObject:forKeyedSubscript:", v40, v101);

                    }
                    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CD16C8], "fetchPersonWithFace:options:", v27, v98);
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v42, "firstObject");
                    v106 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v106, "localIdentifier");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v43)
                      goto LABEL_40;
                    if ((int)MediaAnalysisLogLevel() >= 4
                      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend(v27, "personLocalIdentifier");
                      v44 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412546;
                      v121 = CFSTR("[AutoCounter][VURawCluster]");
                      v122 = 2112;
                      v123 = (uint64_t)v44;
                      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ Person without localIdentifier (use face.personLocalIdentifier %@)", buf, 0x16u);

                    }
                    objc_msgSend(v27, "personLocalIdentifier");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v43)
                    {
LABEL_40:
                      objc_msgSend(v41, "setObject:forKeyedSubscript:", v43, CFSTR("personID"));
                      if (!v97 || (objc_msgSend(v97, "isEqualToString:", v43) & 1) != 0)
                      {
                        v45 = objc_msgSend(v106, "verifiedType");
                        v46 = CFSTR("unknown");
                        if (v45 < 3)
                          v46 = off_1E6B1AA08[v45];
                        objc_msgSend(v41, "setObject:forKeyedSubscript:", v46, CFSTR("verifiedType"));
                        if (v106)
                        {
                          objc_msgSend(v106, "name");
                          v47 = (void *)objc_claimAutoreleasedReturnValue();
                          v48 = v47 == 0;

                          if (!v48)
                          {
                            objc_msgSend(v106, "name");
                            v49 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v41, "setObject:forKeyedSubscript:", v49, CFSTR("personName"));

                          }
                        }
                        v50 = objc_msgSend(v30, "pixelWidth");
                        v51 = objc_msgSend(v30, "pixelHeight");
                        if (v50 <= v51)
                          v52 = v51;
                        else
                          v52 = v50;
                        objc_msgSend(v27, "centerX");
                        v54 = v53;
                        v55 = objc_msgSend(v30, "pixelWidth");
                        objc_msgSend(v27, "centerY");
                        v57 = v56;
                        v58 = objc_msgSend(v30, "pixelHeight");
                        objc_msgSend(v27, "size");
                        v60 = v59;
                        objc_msgSend(v27, "size");
                        v135.origin.y = v57 * (double)v58;
                        v135.size.width = v60 * (double)v52;
                        v135.size.height = v61 * (double)v52;
                        v135.origin.x = v54 * (double)v55;
                        NSStringFromRect(v135);
                        v62 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v41, "setObject:forKeyedSubscript:", v62, CFSTR("faceRect"));

                        objc_msgSend(v41, "setObject:forKeyedSubscript:", v93, CFSTR("faceGroupID"));
                        if (objc_msgSend((id)objc_opt_class(), "_dumpFaceprint"))
                        {
                          objc_msgSend(v27, "faceClusteringProperties");
                          v63 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v63, "faceprint");
                          v64 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v64, "faceprintData");
                          v65 = (void *)objc_claimAutoreleasedReturnValue();

                          objc_msgSend(v65, "base64EncodedStringWithOptions:", 0);
                          v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
                          if (!v66)
                          {
                            v66 = CFSTR("unknown");
                            if ((int)MediaAnalysisLogLevel() >= 4
                              && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                            {
                              *(_DWORD *)buf = 138412290;
                              v121 = CFSTR("[AutoCounter][VURawCluster]");
                              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ No valid faceprint data; leave as unknown",
                                buf,
                                0xCu);
                            }
                          }
                          objc_msgSend(v41, "setObject:forKeyedSubscript:", v66, CFSTR("faceprint"));

                        }
                        v67 = (void *)MEMORY[0x1E0CD14D0];
                        objc_msgSend(v30, "localIdentifier");
                        v68 = (void *)objc_claimAutoreleasedReturnValue();
                        v115 = v68;
                        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v115, 1);
                        v69 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v67, "fetchMomentsForAssetsWithLocalIdentifiers:options:", v69, v98);
                        v70 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_msgSend(v70, "firstObject");
                        v71 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v71, "localIdentifier");
                        v72 = (__CFString *)objc_claimAutoreleasedReturnValue();

                        if (!v72)
                        {
                          v72 = CFSTR("unknown");
                          if ((int)MediaAnalysisLogLevel() >= 4
                            && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 138412290;
                            v121 = CFSTR("[AutoCounter][VURawCluster]");
                            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ No valid momentLocalIdentifier; leave as 'unknown'",
                              buf,
                              0xCu);
                          }
                        }
                        objc_msgSend(v41, "setObject:forKeyedSubscript:", v72, CFSTR("momentIdentifier"));
                        objc_msgSend(v27, "localIdentifier");
                        v73 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v73)
                        {
                          objc_msgSend(v41, "setObject:forKeyedSubscript:", v73, CFSTR("faceID"));
                          objc_msgSend(v104, "addObject:", v41);
                          v19 = 0;
                        }
                        else
                        {
                          if ((int)MediaAnalysisLogLevel() >= 4)
                          {
                            v76 = MEMORY[0x1E0C81028];
                            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                            {
                              *(_DWORD *)buf = 138412290;
                              v121 = CFSTR("[AutoCounter][VURawCluster]");
                              _os_log_impl(&dword_1B6C4A000, v76, OS_LOG_TYPE_DEFAULT, "%@ Face without localIdentifier; skip",
                                buf,
                                0xCu);
                            }
                          }
                          v19 = 9;
                        }

LABEL_79:
LABEL_80:

                        goto LABEL_81;
                      }
                      if ((int)MediaAnalysisLogLevel() >= 7)
                      {
                        v75 = MEMORY[0x1E0C81028];
                        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 138412802;
                          v121 = CFSTR("[AutoCounter][VURawCluster]");
                          v122 = 2112;
                          v123 = (uint64_t)v43;
                          v124 = 2112;
                          v125 = (uint64_t)v97;
                          _os_log_impl(&dword_1B6C4A000, v75, OS_LOG_TYPE_DEBUG, "%@  Fetched face/person %@ not matching required person %@; skip",
                            buf,
                            0x20u);
                        }
                      }
                    }
                    else
                    {
                      if ((int)MediaAnalysisLogLevel() >= 4)
                      {
                        v77 = MEMORY[0x1E0C81028];
                        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412290;
                          v121 = CFSTR("[AutoCounter][VURawCluster]");
                          _os_log_impl(&dword_1B6C4A000, v77, OS_LOG_TYPE_DEFAULT, "%@ Face without personLocalIdentifier; skip",
                            buf,
                            0xCu);
                        }
                      }
                      v43 = 0;
                    }
                    v19 = 9;
                    goto LABEL_79;
                  }
                  if ((int)MediaAnalysisLogLevel() >= 4
                    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v27, "localIdentifier");
                    v74 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v121 = CFSTR("[AutoCounter][VURawCluster]");
                    v122 = 2112;
                    v123 = (uint64_t)v74;
                    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ Failed to find asset for face %@; skip",
                      buf,
                      0x16u);

                  }
                  v19 = 9;
                  goto LABEL_80;
                }
                v19 = 1;
LABEL_81:
                objc_autoreleasePoolPop(v28);
                if (v19 != 9 && v19)
                  goto LABEL_86;
                ++v26;
              }
              while (v102 != v26);
              v25 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v107, v118, 16);
            }
            while (v25);
          }
          v19 = 0;
LABEL_86:

        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v121 = CFSTR("[AutoCounter][VURawCluster]");
            _os_log_impl(&dword_1B6C4A000, v18, OS_LOG_TYPE_DEBUG, "%@ Skipping raw-cluster with non visible faces", buf, 0xCu);
          }
          v19 = 3;
        }

        goto LABEL_92;
      }
      v19 = 1;
LABEL_92:
      objc_autoreleasePoolPop(context);
      if (v19 != 3 && v19)
      {
        v78 = -128;
        goto LABEL_98;
      }
      ++v90;
    }
    while (v90 != v87);
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v132, 16);
  }
  while (v17);
LABEL_96:
  v78 = 0;
LABEL_98:

  return v78;
}

- (int)exportVUGalleryClusterStates:(id *)a3 error:(id *)a4 extendTimeoutBlock:(id)a5 cancelBlock:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  unint64_t clusterDumpFaceFetched;
  VCPPhotosAutoCounterWorker *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  id v34;
  void *v37;
  id v38;
  void *v39;
  id v41;
  id v42;
  void *v43;
  _QWORD v44[4];
  __CFString *v45;
  id v46;
  uint8_t buf[4];
  const __CFString *v48;
  __int16 v49;
  unint64_t v50;
  __int16 v51;
  id v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  _QWORD v56[3];

  v56[1] = *MEMORY[0x1E0C80C00];
  v41 = a5;
  v42 = a6;
  -[PHPhotoLibrary vcp_visionCacheStorageDirectoryURL](self->_photoLibrary, "vcp_visionCacheStorageDirectoryURL");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc((Class)getGDVUVisualUnderstandingServiceClass());
  objc_msgSend(getGDVUEntityRecognitionClientClass(), "photos");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  v43 = (void *)objc_msgSend(v8, "initWithClient:version:url:error:", v9, 1, v39, &v46);
  v38 = v46;

  objc_msgSend(v43, "gallery");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getGDVUEntityClassClass(), "person");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clustersFor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v13 = objc_msgSend(v12, "count");
    *(_DWORD *)buf = 138412546;
    v48 = CFSTR("[AutoCounter][ExportVUGallery]");
    v49 = 2048;
    v50 = v13;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ Retrieved %lu raw-cluster", buf, 0x16u);
  }
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __96__VCPPhotosAutoCounterWorker_exportVUGalleryClusterStates_error_extendTimeoutBlock_cancelBlock___block_invoke;
  v44[3] = &unk_1E6B1A700;
  v45 = CFSTR("[AutoCounter][ExportVUGallery]");
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v44);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AutoCounterClustersVU_Ver%d_Detector%lu_Printer%lu_MAD%lu_VU%lu_PhotosPerson%lu.plist"), -[PHPhotoLibrary mad_faceProcessingInternalVersion](self->_photoLibrary, "mad_faceProcessingInternalVersion"), self->_detectionVersion, self->_recognitionVersion, self->_madVersion, self->_vuVersion, self->_personClusterVersion);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary vcp_visionCacheStorageDirectoryURL](self->_photoLibrary, "vcp_visionCacheStorageDirectoryURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URLByAppendingPathComponent:", v37);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v48 = CFSTR("[AutoCounter][ExportVUGallery]");
      v49 = 2112;
      v50 = (unint64_t)v15;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ Export to file-URL %@", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("faces"));
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("assetInformation"));
    -[VCPPhotosAutoCounterWorker _processFetchedVURawCluster:forPersonLocalIdentifier:facesPerAsset:assetInformation:extendTimeoutBlock:cancelBlock:](self, "_processFetchedVURawCluster:forPersonLocalIdentifier:facesPerAsset:assetInformation:extendTimeoutBlock:cancelBlock:", v12, 0, v17, v18, v41, v42);
    objc_msgSend(v17, "allKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count") == 0;

    if (v20)
    {
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v53 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Failed to process raw-clusters"), CFSTR("[AutoCounter][ExportVUGallery]"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v32, "description");
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v48 = v33;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
      if (a4)
        *a4 = objc_retainAutorelease(v32);

    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        clusterDumpFaceFetched = self->_clusterDumpFaceFetched;
        *(_DWORD *)buf = 138412546;
        v48 = CFSTR("[AutoCounter][ExportVUGallery]");
        v49 = 2048;
        v50 = clusterDumpFaceFetched;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%@ Retrieved and dumpped %lu faces", buf, 0x16u);
      }
      v22 = self;
      objc_sync_enter(v22);
      v23 = objc_msgSend(v16, "writeToURL:error:", v15, a4);
      objc_sync_exit(v22);

      if (!v23)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v34 = *a4;
          *(_DWORD *)buf = 138412802;
          v48 = CFSTR("[AutoCounter][ExportVUGallery]");
          v49 = 2112;
          v50 = (unint64_t)v15;
          v51 = 2112;
          v52 = v34;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ Failed to write to %@ - %@", buf, 0x20u);
        }
        v28 = -20;
        goto LABEL_34;
      }
      if (a3)
        *a3 = objc_retainAutorelease(v15);
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v48 = CFSTR("[AutoCounter][ExportVUGallery]");
        v49 = 2112;
        v50 = (unint64_t)v15;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%@ Saved cluster state to %@", buf, 0x16u);
      }
    }
    v28 = 0;
LABEL_34:

    goto LABEL_35;
  }
  v24 = (void *)MEMORY[0x1E0CB35C8];
  v55 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Failed to retrive export file-URL"), CFSTR("[AutoCounter][ExportVUGallery]"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v26);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v16, "description");
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v48 = v27;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

  }
  if (a4)
  {
    v16 = objc_retainAutorelease(v16);
    v28 = 0;
    *a4 = v16;
  }
  else
  {
    v28 = 0;
  }
LABEL_35:

  return v28;
}

void __96__VCPPhotosAutoCounterWorker_exportVUGalleryClusterStates_error_extendTimeoutBlock_cancelBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138412802;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    v12 = 2048;
    v13 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ raw-cluster %@ has %lu observation(s)", (uint8_t *)&v8, 0x20u);
  }

}

- (int)exportClustersStates:(id *)a3 error:(id *)a4 extendTimeoutBlock:(id)a5 cancelBlock:(id)a6
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  int v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  uint64_t v35;
  unint64_t clusterDumpFaceFetched;
  VCPPhotosAutoCounterWorker *v37;
  int v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v52;
  id v54;
  VCPPhotosAutoCounterWorker *v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  id obj;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void (**v64)(void);
  uint64_t (**v65)(void);
  void *context;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t buf[4];
  uint64_t v80;
  __int16 v81;
  id v82;
  uint64_t v83;
  void *v84;
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;
  _QWORD v88[4];

  v88[1] = *MEMORY[0x1E0C80C00];
  v64 = (void (**)(void))a5;
  v65 = (uint64_t (**)(void))a6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AutoCounterClusters_Ver%d_Detector%lu_Printer%lu_MAD%lu_VU%lu_PhotosPerson%lu.plist"), -[PHPhotoLibrary mad_faceProcessingInternalVersion](self->_photoLibrary, "mad_faceProcessingInternalVersion"), self->_detectionVersion, self->_recognitionVersion, self->_madVersion, self->_vuVersion, self->_personClusterVersion);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = self;
  -[PHPhotoLibrary vcp_visionCacheStorageDirectoryURL](self->_photoLibrary, "vcp_visionCacheStorageDirectoryURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:", v56);
  v9 = objc_claimAutoreleasedReturnValue();

  v54 = (id)v9;
  if (v9)
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v80 = v9;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[AutoCounter] Export URL: %@", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v57 = (id)objc_claimAutoreleasedReturnValue();
    -[VCPPhotosAutoCounterWorker _fetchPeopleHomePersons](v55, "_fetchPeopleHomePersons");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHPhotoLibrary librarySpecificFetchOptions](v55->_photoLibrary, "librarySpecificFetchOptions");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    obj = v52;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
    if (v10)
    {
      v63 = *(_QWORD *)v76;
      do
      {
        v68 = 0;
        v62 = v10;
        do
        {
          if (*(_QWORD *)v76 != v63)
            objc_enumerationMutation(obj);
          v67 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * v68);
          context = (void *)MEMORY[0x1BCCA1B2C]();
          if (v65 && (v65[2]() & 1) != 0)
          {
            v11 = 0;
            goto LABEL_40;
          }
          if (v64)
            v64[2]();
          objc_msgSend(MEMORY[0x1E0CD16C8], "fetchMergeCandidatePersonsForPerson:options:", v67, v70);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = 0u;
          v74 = 0u;
          v71 = 0u;
          v72 = 0u;
          v13 = v61;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v71, v85, 16);
          v69 = v12;
          if (v14)
          {
            v15 = 0;
            v16 = *(_QWORD *)v72;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v72 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i);
                v19 = (void *)MEMORY[0x1BCCA1B2C]();
                objc_msgSend(MEMORY[0x1E0CD1558], "fetchFaceGroupsForPerson:options:", v18, v70);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v20, "count"))
                {
                  objc_msgSend(v20, "firstObject");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "localIdentifier");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v12, "addObject:", v22);

                  if (v15 < 9)
                  {
                    ++v15;
LABEL_27:
                    v24 = 1;
                    goto LABEL_32;
                  }
                  if ((int)MediaAnalysisLogLevel() >= 7)
                  {
                    v25 = MEMORY[0x1E0C81028];
                    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 134217984;
                      v80 = 9;
                      _os_log_impl(&dword_1B6C4A000, v25, OS_LOG_TYPE_DEBUG, "[AutoCounter] Reach kVCPMaximumNumberOfMergeCandidatesShown (%lu); skip the rest",
                        buf,
                        0xCu);
                    }
                  }
                  v24 = 0;
                  v15 = 10;
                }
                else
                {
                  if ((int)MediaAnalysisLogLevel() < 4)
                    goto LABEL_27;
                  v23 = MEMORY[0x1E0C81028];
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v80 = v18;
                    _os_log_impl(&dword_1B6C4A000, v23, OS_LOG_TYPE_DEFAULT, "[AutoCounter] Failed to find facegroup for mergeCandidate: %@", buf, 0xCu);
                  }
                  v24 = 1;
                  v12 = v69;
                }
LABEL_32:

                objc_autoreleasePoolPop(v19);
                if (!v24)
                  goto LABEL_35;
              }
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v71, v85, 16);
            }
            while (v14);
          }
LABEL_35:

          if (objc_msgSend(v12, "count"))
          {
            objc_msgSend(MEMORY[0x1E0CD1558], "fetchFaceGroupsForPerson:options:", v67, v70);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v26, "count"))
            {
              objc_msgSend(v26, "firstObject");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "localIdentifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "setObject:forKeyedSubscript:", v12, v28);

            }
          }

          v11 = 1;
LABEL_40:
          objc_autoreleasePoolPop(context);
          if (!v11)
          {
            v39 = -128;
            v29 = obj;
LABEL_75:

            goto LABEL_76;
          }
          ++v68;
        }
        while (v68 != v62);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
      }
      while (v10);
    }

    objc_msgSend(v57, "setObject:forKey:", v59, CFSTR("mergecandidates"));
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setObject:forKey:", v29, CFSTR("faces"));
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setObject:forKey:", v30, CFSTR("assetInformation"));
    -[PHPhotoLibrary librarySpecificFetchOptions](v55->_photoLibrary, "librarySpecificFetchOptions");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setMinimumUnverifiedFaceCount:", 1);
    objc_msgSend(v31, "setMinimumVerifiedFaceCount:", 1);
    objc_msgSend(MEMORY[0x1E0CD1558], "fetchFaceGroupsWithOptions:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPPhotosAutoCounterWorker _processFetchedFaceGroup:forPersonID:facesPerAsset:assetInformation:extendTimeoutBlock:cancelBlock:](v55, "_processFetchedFaceGroup:forPersonID:facesPerAsset:assetInformation:extendTimeoutBlock:cancelBlock:", v32, 0, v29, v30, v64, v65);
    objc_msgSend(v29, "allKeys");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "count") == 0;

    if (v34)
    {
      v44 = (void *)MEMORY[0x1E0CB35C8];
      v83 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[AutoCounter] Failed to process FaceGroups"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = v45;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v47, "description");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v80 = (uint64_t)v48;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
      if (a4)
        *a4 = objc_retainAutorelease(v47);

    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v35 = objc_msgSend(v32, "count");
        *(_DWORD *)buf = 134217984;
        v80 = v35;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[AutoCounter][ClusterDump] FaceGroupCount %lu", buf, 0xCu);
      }
      if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        clusterDumpFaceFetched = v55->_clusterDumpFaceFetched;
        *(_DWORD *)buf = 134217984;
        v80 = clusterDumpFaceFetched;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[AutoCounter][ClusterDump] FaceCount %lu", buf, 0xCu);
      }
      v37 = v55;
      objc_sync_enter(v37);
      v38 = objc_msgSend(v57, "writeToURL:error:", v54, a4);
      objc_sync_exit(v37);

      if (!v38)
      {
        if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v49 = *a4;
          *(_DWORD *)buf = 138412546;
          v80 = (uint64_t)v54;
          v81 = 2112;
          v82 = v49;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[AutoCounter] Cannot write to %@ : %@", buf, 0x16u);
        }
        v39 = -20;
        goto LABEL_74;
      }
      if (a3)
        *a3 = objc_retainAutorelease(v54);
      if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v80 = (uint64_t)v54;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[AutoCounter] Saved cluster state to %@", buf, 0xCu);
      }
    }
    v39 = 0;
LABEL_74:

    goto LABEL_75;
  }
  v40 = (void *)MEMORY[0x1E0CB35C8];
  v87 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[AutoCounter] Failed to retrive export URL"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = v41;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, &v87, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v42);
  v57 = (id)objc_claimAutoreleasedReturnValue();

  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v57, "description");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v80 = (uint64_t)v43;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

  }
  if (!a4)
  {
    v39 = 0;
LABEL_76:

    goto LABEL_77;
  }
  v58 = objc_retainAutorelease(v57);
  v39 = 0;
  *a4 = v58;

LABEL_77:
  return v39;
}

- (double)_overlapRatioOf:(CGRect)a3 with:(CGRect)a4
{
  CGFloat v4;
  CGFloat v5;
  CGRect v7;

  v4 = a3.size.width * a3.size.height;
  v5 = a4.size.width * a4.size.height;
  v7 = CGRectIntersection(a3, a4);
  return v7.size.width * v7.size.height / (v4 + v5 - v7.size.width * v7.size.height);
}

- (int)_parseGroundTruthWithURL:(id)a3 faceCountPerPerson:(id *)a4 personInformation:(id *)a5 faceToPerson:(id *)a6 assetToFaces:(id *)a7 extendTimeoutBlock:(id)a8 cancelBlock:(id)a9
{
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  id v23;
  id *v25;
  id *v26;
  id *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  __CFString *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t *v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  int v44;
  uint8_t buf[4];
  const __CFString *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a8;
  v17 = a9;
  v26 = a5;
  v27 = a4;
  *a4 = 0;
  *a5 = 0;
  v25 = a6;
  *a6 = 0;
  *a7 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1BCCA1B2C]();
  v39 = 0;
  v40 = 0;
  v21 = -[VCPPhotosAutoCounterWorker _loadGroundTruthURL:toGroundTruth:error:](self, "_loadGroundTruthURL:toGroundTruth:error:", v15, &v40, &v39);
  v22 = v40;
  v23 = v39;
  if (v21)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v46 = CFSTR("[AutoCounter][ParseGT]");
      v47 = 2112;
      v48 = v23;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ Fail to load groundtruth file: %@", buf, 0x16u);
    }
  }
  else
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __149__VCPPhotosAutoCounterWorker__parseGroundTruthWithURL_faceCountPerPerson_personInformation_faceToPerson_assetToFaces_extendTimeoutBlock_cancelBlock___block_invoke;
    v30[3] = &unk_1E6B1A778;
    v31 = v19;
    v32 = CFSTR("[AutoCounter][ParseGT]");
    v36 = v17;
    v38 = &v41;
    v37 = v16;
    v33 = v28;
    v34 = v29;
    v35 = v18;
    objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v30);

  }
  objc_autoreleasePoolPop(v20);
  if (!v21)
  {
    *v27 = objc_retainAutorelease(v18);
    *v26 = objc_retainAutorelease(v19);
    *v25 = objc_retainAutorelease(v29);
    *a7 = objc_retainAutorelease(v28);
    v21 = *((_DWORD *)v42 + 6);
  }

  _Block_object_dispose(&v41, 8);
  return v21;
}

void __149__VCPPhotosAutoCounterWorker__parseGroundTruthWithURL_faceCountPerPerson_personInformation_faceToPerson_assetToFaces_extendTimeoutBlock_cancelBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  __int128 v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  __int128 v24;
  uint64_t v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = (void *)MEMORY[0x1BCCA1B2C]();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AdditionalInformation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v7);

  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v27 = v11;
    v28 = 2112;
    v29 = v12;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ person information: %@", buf, 0x16u);

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("FacesPerAsset"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __149__VCPPhotosAutoCounterWorker__parseGroundTruthWithURL_faceCountPerPerson_personInformation_faceToPerson_assetToFaces_extendTimeoutBlock_cancelBlock___block_invoke_335;
  v17[3] = &unk_1E6B1A750;
  v23 = *(id *)(a1 + 72);
  v25 = a4;
  v16 = *(_OWORD *)(a1 + 80);
  v14 = (id)v16;
  v24 = v16;
  v18 = *(id *)(a1 + 48);
  v19 = *(id *)(a1 + 40);
  v15 = v7;
  v20 = v15;
  v21 = *(id *)(a1 + 56);
  v22 = *(id *)(a1 + 64);
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v17);

  objc_autoreleasePoolPop(v9);
}

void __149__VCPPhotosAutoCounterWorker__parseGroundTruthWithURL_faceCountPerPerson_personInformation_faceToPerson_assetToFaces_extendTimeoutBlock_cancelBlock___block_invoke_335(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v16 = a2;
  v7 = a3;
  v8 = (void *)MEMORY[0x1BCCA1B2C]();
  v9 = *(_QWORD *)(a1 + 72);
  if (v9 && (*(unsigned int (**)(void))(v9 + 16))())
  {
    v10 = *(_BYTE **)(a1 + 96);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = -128;
    *a4 = 1;
    *v10 = 1;
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 80);
    if (v11)
      (*(void (**)(void))(v11 + 16))();
    objc_msgSend(*(id *)(a1 + 32), "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", v16);

    if ((v13 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, v16);

    }
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObjectsFromArray:", v7);

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __149__VCPPhotosAutoCounterWorker__parseGroundTruthWithURL_faceCountPerPerson_personInformation_faceToPerson_assetToFaces_extendTimeoutBlock_cancelBlock___block_invoke_2;
    v17[3] = &unk_1E6B1A728;
    v18 = *(id *)(a1 + 40);
    v19 = *(id *)(a1 + 48);
    v20 = *(id *)(a1 + 56);
    v21 = *(id *)(a1 + 64);
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v17);

  }
  objc_autoreleasePoolPop(v8);

}

void __149__VCPPhotosAutoCounterWorker__parseGroundTruthWithURL_faceCountPerPerson_personInformation_faceToPerson_assetToFaces_extendTimeoutBlock_cancelBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("faceID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if ((int)MediaAnalysisLogLevel() < 4 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v13 = *(_QWORD *)(a1 + 32);
    v15 = 138412546;
    v16 = v13;
    v17 = 2112;
    v18 = v3;
    v9 = MEMORY[0x1E0C81028];
    v10 = "%@ Invalid faceID for face: %@; ignore";
LABEL_12:
    v11 = OS_LOG_TYPE_DEFAULT;
    v12 = 22;
    goto LABEL_13;
  }
  v5 = *(void **)(a1 + 40);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("personID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v5 & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() < 4 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v14 = *(_QWORD *)(a1 + 32);
    v15 = 138412546;
    v16 = v14;
    v17 = 2112;
    v18 = v4;
    v9 = MEMORY[0x1E0C81028];
    v10 = "%@ Invalid PersonID for faceID: %@; ignore";
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), v4);
  objc_msgSend(*(id *)(a1 + 56), "addObject:", *(_QWORD *)(a1 + 40));
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v15 = 138412802;
    v16 = v7;
    v17 = 2112;
    v18 = v4;
    v19 = 2112;
    v20 = v8;
    v9 = MEMORY[0x1E0C81028];
    v10 = "%@ Load faceID: %@ for PersonID: %@";
    v11 = OS_LOG_TYPE_DEBUG;
    v12 = 32;
LABEL_13:
    _os_log_impl(&dword_1B6C4A000, v9, v11, v10, (uint8_t *)&v15, v12);
  }
LABEL_14:

}

- (void)_exportAssetsToFacesDetails:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  VCPPhotosAutoCounterWorker *v8;
  int v9;
  id v10;
  NSObject *v11;
  const char *v12;
  uint32_t v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AutoCounterClusterAssetsToFaces_Ver%d_Detector%lu_Printer%lu_MAD%lu_VU%lu_PhotosPerson%lu.plist"), -[PHPhotoLibrary mad_faceProcessingInternalVersion](self->_photoLibrary, "mad_faceProcessingInternalVersion"), self->_detectionVersion, self->_recognitionVersion, self->_madVersion, self->_vuVersion, self->_personClusterVersion);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary vcp_visionCacheStorageDirectoryURL](self->_photoLibrary, "vcp_visionCacheStorageDirectoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = self;
  objc_sync_enter(v8);
  v14 = 0;
  v9 = objc_msgSend(v4, "writeToURL:error:", v7, &v14);
  v10 = v14;
  objc_sync_exit(v8);

  if (v9)
  {
    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v7;
      v11 = MEMORY[0x1E0C81028];
      v12 = "[AutoCounter] Saved assets-to-faces details to %@";
      v13 = 12;
LABEL_8:
      _os_log_impl(&dword_1B6C4A000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, v13);
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v7;
    v17 = 2112;
    v18 = v10;
    v11 = MEMORY[0x1E0C81028];
    v12 = "[AutoCounter] Cannot write assets-to-faces to %@ : %@";
    v13 = 22;
    goto LABEL_8;
  }

}

+ (BOOL)_dumpAssetsToFaces
{
  return 0;
}

- (int)_measureClusterWithClusterStateURL:(id)a3 groundTruthFaceCountPerPerson:(id)a4 groundTruthPersonInformation:(id)a5 groundTruthFaceToPerson:(id)a6 groundTruthAssetToFaces:(id)a7 measures:(id *)a8 extendTimeoutBlock:(id)a9 cancelBlock:(id)a10
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  int v25;
  void *v26;
  int v27;
  __int128 v28;
  float v29;
  int v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  void *v50;
  unint64_t v51;
  id v52;
  double v53;
  double v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t m;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  double v67;
  void *v68;
  int v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t n;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  double v83;
  void *v84;
  void *v85;
  int v86;
  int v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  double v94;
  double v95;
  double v96;
  float v97;
  float v98;
  float v99;
  float v100;
  char v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t i;
  uint64_t v110;
  void *v111;
  _BOOL4 v112;
  void *v113;
  void *v114;
  double v115;
  double v116;
  void *v117;
  void *v118;
  double v119;
  double v120;
  double v121;
  float v122;
  float v123;
  float v124;
  double v125;
  double v126;
  __int128 v128;
  int v129;
  unint64_t v130;
  unint64_t v131;
  void *v132;
  float v133;
  VCPClusteringAccuracyMeasures *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  id *v139;
  void *v140;
  void *v141;
  void *context;
  void *v143;
  id v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  id v150;
  void (**v151)(void);
  unint64_t v152;
  unint64_t v153;
  id v154;
  uint64_t (**v155)(void);
  unint64_t v156;
  void *v157;
  id v158;
  id v159;
  id obj;
  unsigned int obja;
  void *v162;
  unint64_t v163;
  void *v164;
  id v165;
  id v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  _QWORD v171[4];
  __CFString *v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  _QWORD v189[4];
  id v190;
  __CFString *v191;
  id v192;
  VCPPhotosAutoCounterWorker *v193;
  id v194;
  id v195;
  id v196;
  id v197;
  id v198;
  uint64_t (**v199)(void);
  void (**v200)(void);
  uint64_t *v201;
  uint64_t v202;
  uint64_t *v203;
  uint64_t v204;
  int v205;
  uint8_t v206[128];
  uint8_t buf[4];
  const __CFString *v208;
  __int16 v209;
  _BYTE v210[34];
  _BYTE v211[128];
  _BYTE v212[128];
  _BYTE v213[128];
  _BYTE v214[128];
  uint64_t v215;

  v215 = *MEMORY[0x1E0C80C00];
  v154 = a3;
  v150 = a4;
  v165 = a5;
  v166 = a6;
  v144 = a7;
  v151 = (void (**)(void))a9;
  v155 = (uint64_t (**)(void))a10;
  v139 = a8;
  *a8 = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "path");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v16, "fileExistsAtPath:", v17);

  if ((_DWORD)a4
    && (v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithContentsOfURL:", v154), (v19 = v18) != 0))
  {
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("assetInformation"));
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = v19;
    if (v136)
    {
      v202 = 0;
      v203 = &v202;
      v204 = 0x2020000000;
      v205 = 0;
      v20 = (void *)MEMORY[0x1BCCA1B2C]();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("faces"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count");
      if (v22)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v189[0] = MEMORY[0x1E0C809B0];
        v189[1] = 3221225472;
        v189[2] = __212__VCPPhotosAutoCounterWorker__measureClusterWithClusterStateURL_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke;
        v189[3] = &unk_1E6B1A7F0;
        v190 = v136;
        v191 = CFSTR("[AutoCounter][P/R]");
        v192 = v144;
        v199 = v155;
        v201 = &v202;
        v200 = v151;
        v193 = self;
        v194 = v147;
        v195 = v146;
        v196 = v145;
        v197 = v164;
        v24 = v23;
        v198 = v24;
        objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v189);
        if (objc_msgSend((id)objc_opt_class(), "_dumpAssetsToFaces"))
          -[VCPPhotosAutoCounterWorker _exportAssetsToFacesDetails:](self, "_exportAssetsToFacesDetails:", v24);

      }
      else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v208 = CFSTR("[AutoCounter][P/R]");
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ Cluster contains no data", buf, 0xCu);
      }

      objc_autoreleasePoolPop(v20);
      if (!v22)
      {
        v25 = -18;
        goto LABEL_157;
      }
      v25 = *((_DWORD *)v203 + 6);
      if (v25)
        v27 = *((_DWORD *)v203 + 6);
      else
        v27 = -18;
      if (!v25)
      {
        v129 = v27;
        v134 = objc_alloc_init(VCPClusteringAccuracyMeasures);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v147, "allValues");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        v152 = 0;
        v130 = 0;
        v131 = 0;
        v133 = 0.0;
        *(_QWORD *)&v28 = 138413314;
        v128 = v28;
        v29 = 0.0;
        while (1)
        {
          if (v152 >= objc_msgSend(v143, "count", v128))
          {
LABEL_107:
            v25 = *((_DWORD *)v203 + 6);
            if (!v25)
            {
              if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412802;
                v208 = CFSTR("[AutoCounter][P/R]");
                v209 = 2048;
                *(_QWORD *)v210 = v130;
                *(_WORD *)&v210[8] = 2048;
                *(_QWORD *)&v210[10] = v131;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%@ Valid singleton count = %lu, invalid singleton count = %lu", buf, 0x20u);
              }
              *(float *)&v95 = (float)v130;
              -[VCPClusteringAccuracyMeasures setNumSingletons:](v134, "setNumSingletons:", v95);
              *(float *)&v96 = (float)v131;
              -[VCPClusteringAccuracyMeasures setNumValidSingletons:](v134, "setNumValidSingletons:", v96);
              v171[0] = MEMORY[0x1E0C809B0];
              v171[1] = 3221225472;
              v171[2] = __212__VCPPhotosAutoCounterWorker__measureClusterWithClusterStateURL_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_361;
              v171[3] = &unk_1E6B174E8;
              v172 = CFSTR("[AutoCounter][P/R]");
              objc_msgSend(v135, "enumerateKeysAndObjectsUsingBlock:", v171);
              objc_msgSend(v150, "allObjects");
              v157 = (void *)objc_claimAutoreleasedReturnValue();
              v163 = 0;
              v97 = 0.0;
              v98 = 0.0;
              v99 = 0.0;
              v100 = 0.0;
              while (v163 < objc_msgSend(v157, "count"))
              {
                v159 = (id)MEMORY[0x1BCCA1B2C]();
                if (v155 && (v155[2]() & 1) != 0)
                {
                  v101 = 0;
                  v129 = -128;
                }
                else
                {
                  if (v151)
                    v151[2]();
                  objc_msgSend(v157, "objectAtIndexedSubscript:", v163);
                  v102 = (void *)objc_claimAutoreleasedReturnValue();
                  v153 = objc_msgSend(v150, "countForObject:", v102);
                  objc_msgSend(v135, "objectForKeyedSubscript:", v102);
                  v103 = (void *)objc_claimAutoreleasedReturnValue();
                  obja = objc_msgSend(v103, "unsignedIntValue");

                  objc_msgSend(v138, "objectForKeyedSubscript:", v102);
                  v104 = (void *)objc_claimAutoreleasedReturnValue();
                  v169 = 0u;
                  v170 = 0u;
                  v167 = 0u;
                  v168 = 0u;
                  v149 = v104;
                  objc_msgSend(v104, "allObjects");
                  v105 = (void *)objc_claimAutoreleasedReturnValue();
                  v106 = 0;
                  v107 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v167, v206, 16);
                  if (v107)
                  {
                    v108 = *(_QWORD *)v168;
                    do
                    {
                      for (i = 0; i != v107; ++i)
                      {
                        if (*(_QWORD *)v168 != v108)
                          objc_enumerationMutation(v105);
                        v110 = *(_QWORD *)(*((_QWORD *)&v167 + 1) + 8 * i);
                        objc_msgSend(v166, "objectForKeyedSubscript:", v110);
                        v111 = (void *)objc_claimAutoreleasedReturnValue();
                        v112 = v111 == v102;

                        if (v112)
                        {
                          objc_msgSend(v165, "objectForKeyedSubscript:", v102);
                          v113 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("OptInDateSinceReferenceDate"));
                          v114 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v114, "doubleValue");
                          v116 = v115;

                          objc_msgSend(v164, "objectForKeyedSubscript:", v110);
                          v117 = (void *)objc_claimAutoreleasedReturnValue();
                          v118 = v117;
                          if (v117)
                          {
                            objc_msgSend(v117, "doubleValue");
                            if (v116 > v119)
                              ++v106;
                          }

                        }
                      }
                      v107 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v167, v206, 16);
                    }
                    while (v107);
                  }

                  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138413058;
                    v208 = CFSTR("[AutoCounter][P/R]");
                    v209 = 2112;
                    *(_QWORD *)v210 = v102;
                    *(_WORD *)&v210[8] = 2048;
                    *(_QWORD *)&v210[10] = v153;
                    *(_WORD *)&v210[18] = 2048;
                    *(double *)&v210[20] = (float)((float)v106 / (float)v153);
                    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%@ personID %@ Recall (of size %lu) is %f", buf, 0x2Au);
                  }
                  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138413058;
                    v208 = CFSTR("[AutoCounter][P/R]");
                    v209 = 2112;
                    *(_QWORD *)v210 = v102;
                    *(_WORD *)&v210[8] = 2048;
                    *(_QWORD *)&v210[10] = obja;
                    *(_WORD *)&v210[18] = 2048;
                    *(double *)&v210[20] = (float)((float)v106 / (float)obja);
                    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%@ personID %@ Recall (exclude detection miss) (of size %lu) is %f", buf, 0x2Au);
                  }
                  *(float *)&v120 = (float)v106 / (float)v153;
                  -[VCPClusteringAccuracyMeasures addIdentityRecallToGroundTruth:forPersonID:personFaceCount:identitySize:](v134, "addIdentityRecallToGroundTruth:forPersonID:personFaceCount:identitySize:", v102, v106, v120);
                  *(float *)&v121 = (float)v106 / (float)obja;
                  -[VCPClusteringAccuracyMeasures addIdentityRecallExcludeMissDetection:forPersonID:personFaceCount:identitySize:](v134, "addIdentityRecallExcludeMissDetection:forPersonID:personFaceCount:identitySize:", v102, v106, obja, v121);

                  v100 = v100 + (float)v106;
                  v98 = v98 + (float)v106;
                  v99 = v99 + (float)v153;
                  v101 = 1;
                  v97 = v97 + (float)obja;
                }
                objc_autoreleasePoolPop(v159);
                ++v163;
                if ((v101 & 1) == 0)
                  goto LABEL_155;
              }
              if (v133 <= 0.0)
                v122 = 0.0;
              else
                v122 = v29 / v133;
              if (v99 <= 0.0)
                v123 = 0.0;
              else
                v123 = v100 / v99;
              if (v97 <= 0.0)
                v124 = 0.0;
              else
                v124 = v98 / v97;
              if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138413058;
                v208 = CFSTR("[AutoCounter][P/R]");
                v209 = 2048;
                *(double *)v210 = v122;
                *(_WORD *)&v210[8] = 2048;
                *(double *)&v210[10] = v123;
                *(_WORD *)&v210[18] = 2048;
                *(double *)&v210[20] = v99;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ Weighted Precision: %f, Weighted Recall: %f (number of best face: %.0f)", buf, 0x2Au);
              }
              if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                v208 = CFSTR("[AutoCounter][P/R]");
                v209 = 2048;
                *(double *)v210 = v124;
                *(_WORD *)&v210[8] = 2048;
                *(double *)&v210[10] = v97;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ Weighted Recall (exclude detection miss): %f (number of best face: %.0f)", buf, 0x20u);
              }
              *(float *)&v125 = v123;
              -[VCPClusteringAccuracyMeasures setWeightedAverageRecall:](v134, "setWeightedAverageRecall:", v125);
              *(float *)&v126 = v122;
              -[VCPClusteringAccuracyMeasures setWeightedAveragePrecision:](v134, "setWeightedAveragePrecision:", v126);
              v129 = 0;
              *v139 = objc_retainAutorelease(v134);
LABEL_155:

              v25 = v129;
            }

            goto LABEL_157;
          }
          context = (void *)MEMORY[0x1BCCA1B2C]();
          objc_msgSend(v143, "objectAtIndexedSubscript:", v152);
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v155 || !v155[2]())
            break;
          *((_DWORD *)v203 + 6) = -128;
          v30 = 16;
LABEL_103:

          objc_autoreleasePoolPop(context);
          if (v30 != 18 && v30)
            goto LABEL_107;
          ++v152;
        }
        if (v151)
          v151[2]();
        objc_msgSend(MEMORY[0x1E0CB3550], "set");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v187 = 0u;
        v188 = 0u;
        v185 = 0u;
        v186 = 0u;
        v32 = v148;
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v185, v214, 16);
        if (v33)
        {
          v34 = *(_QWORD *)v186;
          do
          {
            for (j = 0; j != v33; ++j)
            {
              if (*(_QWORD *)v186 != v34)
                objc_enumerationMutation(v32);
              v36 = *(_QWORD *)(*((_QWORD *)&v185 + 1) + 8 * j);
              objc_msgSend(v166, "objectForKeyedSubscript:", v36);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              if (v37)
              {
                objc_msgSend(v165, "objectForKeyedSubscript:", v37);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("OptInDateSinceReferenceDate"));
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "doubleValue");
                v41 = v40;

                objc_msgSend(v164, "objectForKeyedSubscript:", v36);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = v42;
                if (v42)
                {
                  objc_msgSend(v42, "doubleValue");
                  if (v41 > v44)
                    objc_msgSend(v31, "addObject:", v37);
                }

              }
              else
              {
                objc_msgSend(v31, "addObject:", CFSTR("Unknown"));
              }

            }
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v185, v214, 16);
          }
          while (v33);
        }

        v183 = 0u;
        v184 = 0u;
        v181 = 0u;
        v182 = 0u;
        objc_msgSend(v31, "allObjects");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 0;
        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v181, v213, 16);
        if (v47)
        {
          v162 = 0;
          v48 = *(_QWORD *)v182;
          do
          {
            for (k = 0; k != v47; ++k)
            {
              if (*(_QWORD *)v182 != v48)
                objc_enumerationMutation(v45);
              v50 = *(void **)(*((_QWORD *)&v181 + 1) + 8 * k);
              if ((objc_msgSend(v50, "isEqualToString:", CFSTR("Unknown")) & 1) == 0)
              {
                v51 = objc_msgSend(v31, "countForObject:", v50);
                if (v51 > v46)
                {
                  v52 = v50;

                  v46 = v51;
                  v162 = v52;
                }
              }
            }
            v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v181, v213, 16);
          }
          while (v47);
        }
        else
        {
          v162 = 0;
        }

        objc_msgSend(v165, "objectForKeyedSubscript:", v162);
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "objectForKeyedSubscript:", CFSTR("OptInDateSinceReferenceDate"));
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 18;
        if (v162)
        {
          if (!v141)
          {
            v84 = 0;
LABEL_102:

            goto LABEL_103;
          }
          objc_msgSend(v141, "doubleValue");
          v54 = v53;
          v179 = 0u;
          v180 = 0u;
          v177 = 0u;
          v178 = 0u;
          obj = v32;
          v55 = 0;
          v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v177, v212, 16);
          if (v56)
          {
            v57 = *(_QWORD *)v178;
            do
            {
              for (m = 0; m != v56; ++m)
              {
                if (*(_QWORD *)v178 != v57)
                  objc_enumerationMutation(obj);
                v59 = *(_QWORD *)(*((_QWORD *)&v177 + 1) + 8 * m);
                objc_msgSend(v166, "objectForKeyedSubscript:", v59);
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                if (v60)
                {
                  objc_msgSend(v165, "objectForKeyedSubscript:", v60);
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("OptInDateSinceReferenceDate"));
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v62, "doubleValue");
                  v64 = v63;

                  if (v64 <= v54 + 21600.0)
                  {
                    objc_msgSend(v164, "objectForKeyedSubscript:", v59);
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    v66 = v65;
                    if (v65)
                    {
                      objc_msgSend(v65, "doubleValue");
                      if (v67 > v54)
                        ++v55;
                    }

                  }
                  else
                  {
                    ++v55;
                  }

                }
              }
              v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v177, v212, 16);
            }
            while (v56);
          }

          objc_msgSend(v138, "allKeys");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v68, "containsObject:", v162);

          if (v69)
          {
            objc_msgSend(v138, "objectForKeyedSubscript:", v162);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v175 = 0u;
            v176 = 0u;
            v173 = 0u;
            v174 = 0u;
            v132 = v70;
            objc_msgSend(v70, "allObjects");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v158 = v71;
            v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v173, v211, 16);
            if (v72)
            {
              v156 = 0;
              v73 = *(_QWORD *)v174;
              do
              {
                for (n = 0; n != v72; ++n)
                {
                  if (*(_QWORD *)v174 != v73)
                    objc_enumerationMutation(v158);
                  v75 = *(_QWORD *)(*((_QWORD *)&v173 + 1) + 8 * n);
                  objc_msgSend(v166, "objectForKeyedSubscript:", v75);
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v76, "isEqualToString:", v162))
                  {
                    objc_msgSend(v165, "objectForKeyedSubscript:", v76);
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("OptInDateSinceReferenceDate"));
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v78, "doubleValue");
                    v80 = v79;

                    objc_msgSend(v164, "objectForKeyedSubscript:", v75);
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    v82 = v81;
                    if (v81)
                    {
                      objc_msgSend(v81, "doubleValue");
                      if (v80 > v83)
                        ++v156;
                    }

                  }
                }
                v71 = v158;
                v72 = objc_msgSend(v158, "countByEnumeratingWithState:objects:count:", &v173, v211, 16);
              }
              while (v72);
            }
            else
            {
              v156 = 0;
            }

            if (v46 > v156)
              objc_msgSend(v138, "setObject:forKeyedSubscript:", obj, v162);

          }
          else
          {
            objc_msgSend(v138, "setObject:forKeyedSubscript:", obj, v162);
          }
          objc_msgSend(obj, "allObjects");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = objc_msgSend(v85, "count");
          v87 = objc_msgSend(v31, "countForObject:", CFSTR("Unknown"));

          v88 = (v86 - v55 - v87);
          if ((int)v88 < 1)
          {
            v30 = 0;
            ++v131;
          }
          else
          {
            v89 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v135, "objectForKeyedSubscript:", v162);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "numberWithUnsignedInteger:", v46 + (int)objc_msgSend(v90, "intValue"));
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v135, "setObject:forKeyedSubscript:", v91, v162);

            v29 = v29 + (float)v46;
            v133 = v133 + (float)(int)v88;
            if (v88 >= 2)
            {
              v84 = v141;
              v92 = objc_msgSend(v150, "countForObject:", v162);
              if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v128;
                v208 = CFSTR("[AutoCounter][P/R]");
                v209 = 1024;
                *(_DWORD *)v210 = v88;
                *(_WORD *)&v210[4] = 2112;
                *(_QWORD *)&v210[6] = v162;
                *(_WORD *)&v210[14] = 2048;
                *(_QWORD *)&v210[16] = v92;
                *(_WORD *)&v210[24] = 2048;
                *(double *)&v210[26] = (float)((float)v46 / (float)(int)v88);
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%@ Precision for FaceGroup (of size %d) for personID %@ (of size %lu) is %f", buf, 0x30u);
              }
              v93 = objc_msgSend(v150, "countForObject:", v162);
              *(float *)&v94 = (float)v46 / (float)(int)v88;
              -[VCPClusteringAccuracyMeasures addClusterPrecision:forPersonID:personFaceCount:validFaceCount:identitySize:](v134, "addClusterPrecision:forPersonID:personFaceCount:validFaceCount:identitySize:", v162, v46, v88, v93, v94);
              v30 = 0;
              goto LABEL_102;
            }
            v30 = 0;
            ++v130;
          }
        }
        v84 = v141;
        goto LABEL_102;
      }
LABEL_157:
      _Block_object_dispose(&v202, 8);
      v26 = v136;
    }
    else
    {
      v26 = 0;
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v208 = CFSTR("[AutoCounter][P/R]");
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ Cluster contains no asset information", buf, 0xCu);
      }
      v25 = -50;
    }

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v208 = CFSTR("[AutoCounter][P/R]");
      v209 = 2112;
      *(_QWORD *)v210 = v154;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ Fail to load cluster state file: %@", buf, 0x16u);
    }
    v25 = -50;
  }

  return v25;
}

void __212__VCPPhotosAutoCounterWorker__measureClusterWithClusterStateURL_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  char v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  __int128 v40;
  uint64_t v41;
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1BCCA1B2C]();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11
    && (objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AddedDate")),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v13))
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __212__VCPPhotosAutoCounterWorker__measureClusterWithClusterStateURL_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_343;
    v28[3] = &unk_1E6B1A7C8;
    v39 = *(id *)(a1 + 104);
    v41 = a4;
    v27 = *(_OWORD *)(a1 + 112);
    v15 = (id)v27;
    v40 = v27;
    v29 = *(id *)(a1 + 40);
    v30 = v14;
    v31 = *(_QWORD *)(a1 + 56);
    v32 = v7;
    v33 = v9;
    v34 = *(id *)(a1 + 64);
    v35 = *(id *)(a1 + 72);
    v36 = *(id *)(a1 + 80);
    v37 = *(id *)(a1 + 88);
    v38 = v12;
    v16 = v14;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v28);

    v17 = 0;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v44 = v18;
      v45 = 2112;
      v46 = v7;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ Invalid information for asset %@ in cluster; ignore",
        buf,
        0x16u);
    }
    v17 = 1;
  }

  objc_autoreleasePoolPop(v10);
  if ((v17 & 1) == 0 && objc_msgSend((id)objc_opt_class(), "_dumpAssetsToFaces"))
  {
    objc_msgSend(MEMORY[0x1E0CD1398], "vcp_fetchOptionsForLibrary:forTaskID:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8), 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0CD1398];
    v42 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "fetchAssetsWithLocalIdentifiers:options:", v21, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v24 = *(void **)(a1 + 96);
      objc_msgSend(v23, "originalFilename");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v9, v25);

    }
    else if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v26 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v44 = v26;
      v45 = 2112;
      v46 = v7;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%@ Cannot find asset for id %@", buf, 0x16u);
    }

  }
}

void __212__VCPPhotosAutoCounterWorker__measureClusterWithClusterStateURL_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_343(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSString *v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  uint64_t *v39;
  uint64_t *v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint8_t buf[4];
  uint64_t v58;
  __int16 v59;
  id v60;
  __int16 v61;
  void *v62;
  uint64_t v63;
  NSRect v64;
  CGRect v65;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = (void *)MEMORY[0x1BCCA1B2C]();
  v8 = *(_QWORD *)(a1 + 112);
  if (!v8 || !(*(unsigned int (**)(void))(v8 + 16))())
  {
    v9 = *(_QWORD *)(a1 + 120);
    if (v9)
      (*(void (**)(void))(v9 + 16))();
    v51 = 0;
    v52 = &v51;
    v53 = 0x3032000000;
    v54 = __Block_byref_object_copy__48;
    v55 = __Block_byref_object_dispose__48;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("faceID"));
    v56 = (id)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    v46 = &v45;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__48;
    v49 = __Block_byref_object_dispose__48;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("faceGroupID"));
    v50 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("personID"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v52[5] && v46[5] && v10)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("faceRect"));
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      v64 = NSRectFromString(v12);
      x = v64.origin.x;
      y = v64.origin.y;
      width = v64.size.width;
      height = v64.size.height;

      v65.origin.x = x;
      v65.origin.y = y;
      v65.size.width = width;
      v65.size.height = height;
      if (!CGRectIsEmpty(v65))
      {
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          v22 = *(_QWORD *)(a1 + 32);
          v23 = (void *)v52[5];
          *(_DWORD *)buf = 138412802;
          v58 = v22;
          v59 = 2112;
          v60 = v23;
          v61 = 2112;
          v62 = v11;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ processing cluster state faceID: %@ forPersonID: %@", buf, 0x20u);
        }
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __212__VCPPhotosAutoCounterWorker__measureClusterWithClusterStateURL_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_344;
        v33[3] = &unk_1E6B1A7A0;
        v39 = &v51;
        v24 = *(void **)(a1 + 40);
        v25 = *(id *)(a1 + 32);
        v26 = *(_QWORD *)(a1 + 48);
        v27 = *(void **)(a1 + 56);
        v34 = v25;
        v35 = v26;
        v41 = x;
        v42 = y;
        v43 = width;
        v44 = height;
        v36 = v27;
        v37 = v6;
        v38 = *(id *)(a1 + 64);
        v40 = &v45;
        objc_msgSend(v24, "enumerateObjectsUsingBlock:", v33);
        objc_msgSend(*(id *)(a1 + 72), "allKeys");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "containsObject:", v46[5]);

        if ((v29 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 72), "setObject:forKeyedSubscript:", v30, v46[5]);

        }
        objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", v46[5]);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addObject:", v52[5]);

        objc_msgSend(*(id *)(a1 + 80), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 56), v52[5]);
        objc_msgSend(*(id *)(a1 + 88), "setObject:forKeyedSubscript:", v11, v52[5]);
        objc_msgSend(*(id *)(a1 + 104), "objectForKeyedSubscript:", CFSTR("AddedDate"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 96), "setObject:forKeyedSubscript:", v32, v52[5]);

        goto LABEL_23;
      }
      if ((int)MediaAnalysisLogLevel() < 4 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
LABEL_23:

        _Block_object_dispose(&v45, 8);
        _Block_object_dispose(&v51, 8);

        goto LABEL_24;
      }
      v17 = *(_QWORD *)(a1 + 32);
      v18 = (void *)v52[5];
      *(_DWORD *)buf = 138412546;
      v58 = v17;
      v59 = 2112;
      v60 = v18;
      v19 = MEMORY[0x1E0C81028];
      v20 = "%@ Invalid face rectangle in cluster state for faceID:%@; ignore";
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 4 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      v21 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v58 = v21;
      v59 = 2112;
      v60 = v6;
      v19 = MEMORY[0x1E0C81028];
      v20 = "%@ Invalid ID(s) in cluster: %@; ignore";
    }
    _os_log_impl(&dword_1B6C4A000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0x16u);
    goto LABEL_23;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24) = -128;
  *a4 = 1;
  **(_BYTE **)(a1 + 136) = 1;
LABEL_24:
  objc_autoreleasePoolPop(v7);

}

void __212__VCPPhotosAutoCounterWorker__measureClusterWithClusterStateURL_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_344(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  double x;
  double y;
  double width;
  double height;
  uint64_t v15;
  double v16;
  float v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[6];
  _QWORD v33[6];
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  double v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;
  NSRect v49;
  CGRect v50;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = (void *)MEMORY[0x1BCCA1B2C]();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("faceID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("personID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "isEqualToString:", v8))
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("faceRect"));
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    v49 = NSRectFromString(v10);
    x = v49.origin.x;
    y = v49.origin.y;
    width = v49.size.width;
    height = v49.size.height;

    v50.origin.x = x;
    v50.origin.y = y;
    v50.size.width = width;
    v50.size.height = height;
    if (CGRectIsEmpty(v50))
    {
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v35 = v15;
        v36 = 2112;
        v37 = v8;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ Invalid ground truth rect for faceID:%@", buf, 0x16u);
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "_overlapRatioOf:with:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), x, y, width, height);
      v17 = v16;
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v18 = *(_QWORD *)(a1 + 32);
        v19 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", CFSTR("faceRect"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("faceRect"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413826;
        v35 = v18;
        v36 = 2112;
        v37 = v19;
        v38 = 2048;
        v39 = v17;
        v40 = 2112;
        v41 = v30;
        v42 = 2112;
        v43 = v20;
        v44 = 2112;
        v45 = v8;
        v46 = 2112;
        v47 = v9;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@[%@] %.4f library: %@, gt: %@ (fid:%@, pid:%@)", buf, 0x48u);

      }
      if (v17 > 0.3)
      {
        v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        v32[0] = CFSTR("phFaceID");
        v32[1] = CFSTR("gtFaceID");
        v33[0] = v21;
        v33[1] = v8;
        v33[2] = v9;
        v32[2] = CFSTR("gtPersonID");
        v32[3] = CFSTR("centerX");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CGRectGetMidX(*(CGRect *)(a1 + 88)));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v33[3] = v22;
        v32[4] = CFSTR("centerY");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CGRectGetMidY(*(CGRect *)(a1 + 88)));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v33[4] = v23;
        v32[5] = CFSTR("size");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 104));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v33[5] = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 6);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 64), "addObject:", v25);
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          v28 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
          v29 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
          v31 = *(_QWORD *)(a1 + 32);
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("faceID"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("faceGroupID"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v35 = v31;
          v36 = 2112;
          v37 = v28;
          v38 = 2112;
          v39 = v29;
          v40 = 2112;
          v41 = v26;
          v42 = 2112;
          v43 = v27;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ Co-location mapping faceID:faceGroupID %@:%@ -> %@:%@", buf, 0x34u);

        }
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v8);
        *a4 = 1;

      }
    }
  }

  objc_autoreleasePoolPop(v7);
}

void __212__VCPPhotosAutoCounterWorker__measureClusterWithClusterStateURL_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_361(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138412802;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    v12 = 1024;
    v13 = objc_msgSend(v6, "intValue");
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%@ Valid face count for person %@ is %d", (uint8_t *)&v8, 0x1Cu);
  }

}

- (int)_measurePNPersonClusters:(id)a3 groundTruthFaceCountPerPerson:(id)a4 groundTruthPersonInformation:(id)a5 groundTruthFaceToPerson:(id)a6 groundTruthAssetToFaces:(id)a7 measures:(id *)a8 extendTimeoutBlock:(id)a9 cancelBlock:(id)a10
{
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  double v45;
  double v46;
  unint64_t v47;
  double v48;
  double v49;
  unint64_t v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  NSObject *v58;
  uint64_t v59;
  NSObject *v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  char v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  VCPClusteringAccuracyMeasures *v85;
  void *v86;
  uint64_t (**v87)(void);
  id v88;
  VCPClusteringAccuracyMeasures *v89;
  double v90;
  double v91;
  double v92;
  double v93;
  void *v94;
  unint64_t v95;
  float v96;
  float v97;
  void *v98;
  char v99;
  double v100;
  double v101;
  void *v102;
  unsigned int v103;
  double v104;
  int v105;
  float v106;
  float v107;
  float v108;
  double v109;
  double v110;
  double v111;
  id *v113;
  void *v114;
  id v115;
  id v116;
  id v117;
  void *context;
  void *v119;
  unint64_t i;
  id v121;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  id obj;
  void *v130;
  uint64_t v131;
  void (**v132)(void);
  uint64_t v133;
  id v134;
  void (**v135)(void);
  uint64_t (**v136)(void);
  _QWORD v137[4];
  id v138;
  id v139;
  id v140;
  id v141;
  VCPClusteringAccuracyMeasures *v142;
  uint64_t (**v143)(void);
  void (**v144)(void);
  uint64_t *v145;
  _BYTE *v146;
  uint64_t *v147;
  _BYTE *v148;
  uint64_t *v149;
  uint64_t v150;
  uint64_t *v151;
  uint64_t v152;
  int v153;
  uint64_t v154;
  double *v155;
  uint64_t v156;
  uint64_t v157;
  _QWORD v158[4];
  id v159;
  VCPPhotosAutoCounterWorker *v160;
  uint64_t *v161;
  _BYTE *v162;
  double v163;
  double v164;
  double v165;
  double v166;
  uint64_t v167;
  float *v168;
  uint64_t v169;
  uint64_t (*v170)(uint64_t, uint64_t);
  void (*v171)(uint64_t);
  id v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  uint8_t v181[4];
  double v182;
  __int16 v183;
  double v184;
  __int16 v185;
  double v186;
  _BYTE v187[24];
  void *v188;
  void *v189;
  _BYTE buf[24];
  uint64_t (*v191)(uint64_t, uint64_t);
  void (*v192)(uint64_t);
  id v193;
  _BYTE v194[128];
  _BYTE v195[128];
  _QWORD v196[4];
  CGRect v197;

  v196[1] = *MEMORY[0x1E0C80C00];
  v117 = a3;
  v115 = a4;
  v116 = a5;
  v15 = a6;
  v121 = a7;
  v135 = (void (**)(void))a9;
  v136 = (uint64_t (**)(void))a10;
  v113 = a8;
  v114 = v15;
  *a8 = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1398], "vcp_fetchOptionsForLibrary:forTaskID:", self->_photoLibrary, 3);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v196[0] = *MEMORY[0x1E0CD1970];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v196, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "addFetchPropertySets:", v16);

  objc_msgSend(v117, "allObjects");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend(v119, "count"); ++i)
  {
    context = (void *)MEMORY[0x1BCCA1B2C]();
    objc_msgSend(v119, "objectAtIndexedSubscript:", i);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "localIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "setObject:forKeyedSubscript:", v17, v18);

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "fetchFaces");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v179 = 0u;
    v180 = 0u;
    v177 = 0u;
    v178 = 0u;
    v21 = v20;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v177, v195, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v178;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v178 != v23)
            objc_enumerationMutation(v21);
          v25 = *(void **)(*((_QWORD *)&v177 + 1) + 8 * j);
          v26 = (void *)MEMORY[0x1BCCA1B2C]();
          objc_msgSend(v25, "personLocalIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27 == 0;

          if (!v28)
          {
            objc_msgSend(v25, "personLocalIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v29);

          }
          objc_autoreleasePoolPop(v26);
        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v177, v195, 16);
      }
      while (v22);
    }

    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v128, "localIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v21, "count");
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v30;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v31;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[AutoCounter][P/R][PV] Processing person cluster %@ with %lu faces", buf, 0x16u);

    }
    v175 = 0u;
    v176 = 0u;
    v173 = 0u;
    v174 = 0u;
    obj = v21;
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v173, v194, 16);
    if (v32)
    {
      v131 = *(_QWORD *)v174;
LABEL_17:
      v33 = 0;
      v133 = v32;
      while (1)
      {
        if (*(_QWORD *)v174 != v131)
          objc_enumerationMutation(obj);
        v34 = *(void **)(*((_QWORD *)&v173 + 1) + 8 * v33);
        v35 = (void *)MEMORY[0x1BCCA1B2C]();
        if (v136 && (v136[2]() & 1) != 0)
        {
          v36 = 1;
        }
        else
        {
          if (v135)
            v135[2]();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v191 = __Block_byref_object_copy__48;
          v192 = __Block_byref_object_dispose__48;
          objc_msgSend(v34, "personLocalIdentifier");
          v193 = (id)objc_claimAutoreleasedReturnValue();
          v167 = 0;
          v168 = (float *)&v167;
          v169 = 0x3032000000;
          v170 = __Block_byref_object_copy__48;
          v171 = __Block_byref_object_dispose__48;
          objc_msgSend(v34, "localIdentifier");
          v172 = (id)objc_claimAutoreleasedReturnValue();
          if (*((_QWORD *)v168 + 5))
          {
            v37 = (void *)MEMORY[0x1E0CD1398];
            v189 = v34;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v189, 1);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "fetchAssetsForFaces:options:", v38, v127);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v39, "count"))
            {
              objc_msgSend(v39, "firstObject");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "cloudIdentifier");
              v130 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v130)
              {
                if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v40, "localIdentifier");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v187 = 138412290;
                  *(_QWORD *)&v187[4] = v41;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[AutoCounter][P/R][PV] Asset without cloudIdentifier, use localIdentifier: %@", v187, 0xCu);

                }
                objc_msgSend(v40, "localIdentifier");
                v130 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v42 = objc_msgSend(v40, "pixelWidth");
              v43 = objc_msgSend(v40, "pixelHeight");
              v44 = v42 <= v43 ? v43 : v42;
              objc_msgSend(v34, "centerX");
              v46 = v45;
              v47 = objc_msgSend(v40, "pixelWidth");
              objc_msgSend(v34, "centerY");
              v49 = v48;
              v50 = objc_msgSend(v40, "pixelHeight");
              objc_msgSend(v34, "size");
              v52 = v51;
              objc_msgSend(v34, "size");
              v53 = v46 * (double)v47;
              v54 = v49 * (double)v50;
              v55 = v52 * (double)v44;
              v57 = v56 * (double)v44;
              v197.origin.x = v53;
              v197.origin.y = v54;
              v197.size.width = v55;
              v197.size.height = v57;
              if (CGRectIsEmpty(v197))
              {
                if ((int)MediaAnalysisLogLevel() >= 4)
                {
                  v58 = MEMORY[0x1E0C81028];
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                  {
                    v59 = *((_QWORD *)v168 + 5);
                    *(_DWORD *)v187 = 138412290;
                    *(_QWORD *)&v187[4] = v59;
                    _os_log_impl(&dword_1B6C4A000, v58, OS_LOG_TYPE_DEFAULT, "[AutoCounter][P/R][PV] Invalid face rectangle in person cluster state for face: %@; ignore",
                      v187,
                      0xCu);
                  }
                }
                v36 = 10;
              }
              else
              {
                if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                {
                  v63 = *((_QWORD *)v168 + 5);
                  objc_msgSend(v34, "personLocalIdentifier");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v128, "localIdentifier");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v187 = 138412802;
                  *(_QWORD *)&v187[4] = v63;
                  *(_WORD *)&v187[12] = 2112;
                  *(_QWORD *)&v187[14] = v64;
                  *(_WORD *)&v187[22] = 2112;
                  v188 = v65;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[AutoCounter][P/R][PV] processing person cluster faceID: %@ for PersonID: %@ and clusterID: %@", v187, 0x20u);

                }
                objc_msgSend(v121, "objectForKeyedSubscript:", v130);
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                v158[0] = MEMORY[0x1E0C809B0];
                v158[1] = 3221225472;
                v158[2] = __202__VCPPhotosAutoCounterWorker__measurePNPersonClusters_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke;
                v158[3] = &unk_1E6B1A818;
                v161 = &v167;
                v67 = v19;
                v162 = buf;
                v159 = v67;
                v160 = self;
                v163 = v53;
                v164 = v54;
                v165 = v55;
                v166 = v57;
                v124 = v66;
                objc_msgSend(v66, "enumerateObjectsUsingBlock:", v158);
                objc_msgSend(v128, "localIdentifier");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v126, "objectForKeyedSubscript:", v68);
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v69, "allKeys");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                v71 = objc_msgSend(v70, "containsObject:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

                if ((v71 & 1) == 0)
                {
                  objc_msgSend(MEMORY[0x1E0C99E20], "set");
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v128, "localIdentifier");
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v126, "objectForKeyedSubscript:", v73);
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v74, "setObject:forKeyedSubscript:", v72, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

                }
                objc_msgSend(v128, "localIdentifier");
                v75 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v126, "objectForKeyedSubscript:", v75);
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v76, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v77, "addObject:", *((_QWORD *)v168 + 5));

                objc_msgSend(v125, "allKeys");
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v75) = objc_msgSend(v78, "containsObject:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

                if ((v75 & 1) == 0)
                {
                  objc_msgSend(MEMORY[0x1E0C99E20], "set");
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v125, "setObject:forKeyedSubscript:", v79, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

                }
                objc_msgSend(v125, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v80, "addObject:", v130);

                v81 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v40, "curationProperties");
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v82, "addedDate");
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v83, "timeIntervalSinceReferenceDate");
                objc_msgSend(v81, "numberWithDouble:");
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v123, "setObject:forKeyedSubscript:", v84, *((_QWORD *)v168 + 5));

                v36 = 0;
              }

            }
            else
            {
              if ((int)MediaAnalysisLogLevel() >= 4)
              {
                v61 = MEMORY[0x1E0C81028];
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                {
                  v62 = *((_QWORD *)v168 + 5);
                  *(_DWORD *)v187 = 138412290;
                  *(_QWORD *)&v187[4] = v62;
                  _os_log_impl(&dword_1B6C4A000, v61, OS_LOG_TYPE_DEFAULT, "[AutoCounter][P/R][PV] Failed to fetch asset for face %@; ignore",
                    v187,
                    0xCu);
                }
              }
              v36 = 10;
            }

          }
          else
          {
            if ((int)MediaAnalysisLogLevel() >= 4)
            {
              v60 = MEMORY[0x1E0C81028];
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v187 = 138412290;
                *(_QWORD *)&v187[4] = v34;
                _os_log_impl(&dword_1B6C4A000, v60, OS_LOG_TYPE_DEFAULT, "[AutoCounter][P/R][PV] Invalid faceID in person cluster: %@; ignore",
                  v187,
                  0xCu);
              }
            }
            v36 = 10;
          }
          _Block_object_dispose(&v167, 8);

          _Block_object_dispose(buf, 8);
        }
        objc_autoreleasePoolPop(v35);
        if (v36 != 10)
        {
          if (v36)
            break;
        }
        if (v133 == ++v33)
        {
          v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v173, v194, 16);
          if (v32)
            goto LABEL_17;
          goto LABEL_63;
        }
      }
    }
    else
    {
LABEL_63:
      v36 = 0;
    }

    objc_autoreleasePoolPop(context);
    if (v36)
    {
      v105 = -128;
      goto LABEL_95;
    }
  }
  v85 = objc_alloc_init(VCPClusteringAccuracyMeasures);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LODWORD(v191) = 0;
  v167 = 0;
  v168 = (float *)&v167;
  v169 = 0x2020000000;
  LODWORD(v170) = 0;
  *(_QWORD *)v187 = 0;
  *(_QWORD *)&v187[8] = v187;
  *(_QWORD *)&v187[16] = 0x2020000000;
  v188 = 0;
  v154 = 0;
  v155 = (double *)&v154;
  v156 = 0x2020000000;
  v157 = 0;
  v150 = 0;
  v151 = &v150;
  v152 = 0x2020000000;
  v153 = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v137[0] = MEMORY[0x1E0C809B0];
  v137[1] = 3221225472;
  v137[2] = __202__VCPPhotosAutoCounterWorker__measurePNPersonClusters_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_363;
  v137[3] = &unk_1E6B1A8B8;
  v87 = v136;
  v143 = v87;
  v145 = &v150;
  v132 = v135;
  v144 = v132;
  v138 = v116;
  v139 = v123;
  v134 = v86;
  v140 = v134;
  v146 = buf;
  v147 = &v167;
  v88 = v115;
  v141 = v88;
  v89 = v85;
  v142 = v89;
  v148 = v187;
  v149 = &v154;
  objc_msgSend(v126, "enumerateKeysAndObjectsUsingBlock:", v137);
  v105 = *((_DWORD *)v151 + 6);
  if (!v105)
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v91 = *(double *)(*(_QWORD *)&v187[8] + 24);
      v92 = v155[3];
      *(_DWORD *)v181 = 134218240;
      v182 = v91;
      v183 = 2048;
      v184 = v92;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[AutoCounter][P/R][PV] Valid singleton count = %lu, invalid singleton count = %lu", v181, 0x16u);
    }
    *(float *)&v90 = (float)*(unint64_t *)(*(_QWORD *)&v187[8] + 24);
    -[VCPClusteringAccuracyMeasures setNumSingletons:](v89, "setNumSingletons:", v90);
    *(float *)&v93 = (float)*((unint64_t *)v155 + 3);
    -[VCPClusteringAccuracyMeasures setNumValidSingletons:](v89, "setNumValidSingletons:", v93);
    objc_msgSend(v88, "allObjects");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = 0;
    v96 = 0.0;
    v97 = 0.0;
    while (v95 < objc_msgSend(v94, "count"))
    {
      v98 = (void *)MEMORY[0x1BCCA1B2C]();
      if (v136 && (((uint64_t (*)(uint64_t (**)(void)))v136[2])(v87) & 1) != 0)
      {
        v99 = 0;
      }
      else
      {
        if (v135)
          ((void (*)(void (**)(void)))v135[2])(v132);
        objc_msgSend(v94, "objectAtIndexedSubscript:", v95);
        v100 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        v101 = COERCE_DOUBLE(objc_msgSend(v88, "countForObject:", *(_QWORD *)&v100));
        objc_msgSend(v134, "objectForKeyedSubscript:", *(_QWORD *)&v100);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = objc_msgSend(v102, "unsignedIntValue");

        if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v181 = 138412802;
          v182 = v100;
          v183 = 2048;
          v184 = v101;
          v185 = 2048;
          v186 = (float)((float)v103 / (float)*(unint64_t *)&v101);
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[AutoCounter][P/R][PV] Recall for personID %@ (of size %lu) is %f", v181, 0x20u);
        }
        *(float *)&v104 = (float)v103 / (float)*(unint64_t *)&v101;
        -[VCPClusteringAccuracyMeasures addIdentityRecallToGroundTruth:forPersonID:personFaceCount:identitySize:](v89, "addIdentityRecallToGroundTruth:forPersonID:personFaceCount:identitySize:", *(_QWORD *)&v100, v103, *(_QWORD *)&v101, v104);

        v96 = v96 + (float)v103;
        v97 = v97 + (float)*(unint64_t *)&v101;
        v99 = 1;
      }
      objc_autoreleasePoolPop(v98);
      ++v95;
      if ((v99 & 1) == 0)
      {
        v105 = -128;
        goto LABEL_93;
      }
    }
    v106 = v168[6];
    v107 = 0.0;
    if (v106 > 0.0)
      v107 = *(float *)(*(_QWORD *)&buf[8] + 24) / v106;
    *(float *)(*(_QWORD *)&buf[8] + 24) = v107;
    if (v97 <= 0.0)
      v108 = 0.0;
    else
      v108 = v96 / v97;
    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v110 = *(float *)(*(_QWORD *)&buf[8] + 24);
      *(_DWORD *)v181 = 134218240;
      v182 = v110;
      v183 = 2048;
      v184 = v108;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[AutoCounter][P/R][PV] Weighted Precision: %f, Weighted Recall: %f", v181, 0x16u);
    }
    *(float *)&v109 = v108;
    -[VCPClusteringAccuracyMeasures setWeightedAverageRecall:](v89, "setWeightedAverageRecall:", v109);
    LODWORD(v111) = *(_DWORD *)(*(_QWORD *)&buf[8] + 24);
    -[VCPClusteringAccuracyMeasures setWeightedAveragePrecision:](v89, "setWeightedAveragePrecision:", v111);
    v105 = 0;
    *v113 = objc_retainAutorelease(v89);
LABEL_93:

  }
  _Block_object_dispose(&v150, 8);
  _Block_object_dispose(&v154, 8);
  _Block_object_dispose(v187, 8);
  _Block_object_dispose(&v167, 8);
  _Block_object_dispose(buf, 8);

LABEL_95:
  return v105;
}

void __202__VCPPhotosAutoCounterWorker__measurePNPersonClusters_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *v11;
  double x;
  double y;
  double width;
  double height;
  NSObject *v16;
  const char *v17;
  os_log_type_t v18;
  uint32_t v19;
  void *v20;
  uint64_t v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  int v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;
  NSRect v36;
  CGRect v37;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("faceID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("personID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v8))
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        v27 = 138413058;
        v28 = v9;
        v29 = 2112;
        v30 = v10;
        v31 = 2112;
        v32 = v7;
        v33 = 2112;
        v34 = v8;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[AutoCounter][P/R][PV] Valid faceID mapping faceID:personID %@:%@ -> %@:%@", (uint8_t *)&v27, 0x2Au);
      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v8);
LABEL_7:
      *a4 = 1;
      goto LABEL_26;
    }
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v27 = 138413058;
      v28 = v20;
      v29 = 2112;
      v30 = v21;
      v31 = 2112;
      v32 = v7;
      v33 = 2112;
      v34 = v8;
      v16 = MEMORY[0x1E0C81028];
      v17 = "[AutoCounter][P/R][PV] Invalid faceID mapping faceID:faceGroupID %@:%@ -> %@:%@";
LABEL_15:
      v18 = OS_LOG_TYPE_DEBUG;
      v19 = 42;
      goto LABEL_16;
    }
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("faceRect"));
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    v36 = NSRectFromString(v11);
    x = v36.origin.x;
    y = v36.origin.y;
    width = v36.size.width;
    height = v36.size.height;

    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = width;
    v37.size.height = height;
    if (CGRectIsEmpty(v37))
    {
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v27 = 138412290;
        v28 = v7;
        v16 = MEMORY[0x1E0C81028];
        v17 = "[AutoCounter][P/R][PV] Invalid ground truth face rectangle for faceID:%@";
        v18 = OS_LOG_TYPE_INFO;
        v19 = 12;
LABEL_16:
        _os_log_impl(&dword_1B6C4A000, v16, v18, v17, (uint8_t *)&v27, v19);
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "_overlapRatioOf:with:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), x, y, width, height);
      if (v22 <= 0.8)
        goto LABEL_26;
      if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v8))
      {
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
          v27 = 138413058;
          v28 = v23;
          v29 = 2112;
          v30 = v24;
          v31 = 2112;
          v32 = v7;
          v33 = 2112;
          v34 = v8;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[AutoCounter][P/R][PV] Valid co-locate mapping faceID:personID %@:%@ -> %@:%@", (uint8_t *)&v27, 0x2Au);
        }
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v7);
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v8);
        goto LABEL_7;
      }
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v25 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        v27 = 138413058;
        v28 = v25;
        v29 = 2112;
        v30 = v26;
        v31 = 2112;
        v32 = v7;
        v33 = 2112;
        v34 = v8;
        v16 = MEMORY[0x1E0C81028];
        v17 = "[AutoCounter][P/R][PV] Invalid co-location mapping faceID:faceGroupID %@:%@ -> %@:%@";
        goto LABEL_15;
      }
    }
  }
LABEL_26:

}

void __202__VCPPhotosAutoCounterWorker__measurePNPersonClusters_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_363(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  int v20;
  unint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  float v25;
  uint64_t v26;
  float v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, uint64_t, void *);
  void *v38;
  id v39;
  id v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[4];
  id v48;
  id v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  uint8_t buf[4];
  int v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  double v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = (void *)MEMORY[0x1BCCA1B2C]();
  v10 = *(_QWORD *)(a1 + 72);
  if (!v10 || !(*(unsigned int (**)(void))(v10 + 16))())
  {
    v11 = *(_QWORD *)(a1 + 80);
    if (v11)
      (*(void (**)(void))(v11 + 16))();
    v66 = 0;
    v67 = &v66;
    v68 = 0x3032000000;
    v69 = __Block_byref_object_copy__48;
    v70 = __Block_byref_object_dispose__48;
    v71 = 0;
    v62 = 0;
    v63 = &v62;
    v64 = 0x2020000000;
    v65 = 0;
    v58 = 0;
    v59 = &v58;
    v60 = 0x2020000000;
    v61 = 0;
    v54 = 0;
    v55 = &v54;
    v56 = 0x2020000000;
    v57 = 0;
    v12 = MEMORY[0x1E0C809B0];
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __202__VCPPhotosAutoCounterWorker__measurePNPersonClusters_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_2;
    v47[3] = &unk_1E6B1A868;
    v50 = &v62;
    v48 = *(id *)(a1 + 32);
    v51 = &v54;
    v49 = *(id *)(a1 + 40);
    v52 = &v58;
    v53 = &v66;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v47);
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v67[5]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("OptInDateSinceReferenceDate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v67[5] || !v14)
      goto LABEL_21;
    objc_msgSend(v14, "doubleValue");
    v17 = v16;
    v43 = 0;
    v44 = &v43;
    v45 = 0x2020000000;
    v46 = 0;
    v35 = v12;
    v36 = 3221225472;
    v37 = __202__VCPPhotosAutoCounterWorker__measurePNPersonClusters_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_4;
    v38 = &unk_1E6B1A890;
    v18 = *(id *)(a1 + 32);
    v42 = v17;
    v39 = v18;
    v41 = &v43;
    v40 = *(id *)(a1 + 40);
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &v35);
    objc_msgSend(*(id *)(a1 + 48), "allKeys", v35, v36, v37, v38);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "containsObject:", v67[5]);

    if (!v20
      || (v21 = v59[3],
          objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v67[5]),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          LODWORD(v21) = v21 > objc_msgSend(v22, "unsignedIntValue"),
          v22,
          (_DWORD)v21))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v59[3]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v23, v67[5]);

    }
    v24 = (*((_DWORD *)v63 + 6) - (*((_DWORD *)v55 + 6) + *((_DWORD *)v44 + 6)));
    if ((int)v24 < 1)
    {
      v26 = *(_QWORD *)(a1 + 120);
    }
    else
    {
      v25 = (float)(unint64_t)v59[3];
      *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8)
                                                                            + 24)
                                                                 + v25;
      *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8)
                                                                             + 24)
                                                                  + (float)(int)v24;
      if ((_DWORD)v24 != 1)
      {
        v27 = v25 / (float)(int)v24;
        if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          v28 = v67[5];
          v29 = objc_msgSend(*(id *)(a1 + 56), "countForObject:", v28);
          *(_DWORD *)buf = 67109890;
          v73 = v24;
          v74 = 2112;
          v75 = v28;
          v76 = 2048;
          v77 = v29;
          v78 = 2048;
          v79 = v27;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[AutoCounter][P/R][PV] Precision for cluster (of size %d) for personID %@ (of size %lu) is %f", buf, 0x26u);
        }
        v30 = v67[5];
        v31 = v59[3];
        v32 = *(void **)(a1 + 64);
        v33 = objc_msgSend(*(id *)(a1 + 56), "countForObject:", v30);
        *(float *)&v34 = v27;
        objc_msgSend(v32, "addClusterPrecision:forPersonID:personFaceCount:validFaceCount:identitySize:", v30, v31, v24, v33, v34);
        goto LABEL_20;
      }
      v26 = *(_QWORD *)(a1 + 112);
    }
    ++*(_QWORD *)(*(_QWORD *)(v26 + 8) + 24);
LABEL_20:

    _Block_object_dispose(&v43, 8);
LABEL_21:

    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(&v58, 8);
    _Block_object_dispose(&v62, 8);
    _Block_object_dispose(&v66, 8);

    goto LABEL_22;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = -128;
  *a4 = 1;
LABEL_22:
  objc_autoreleasePoolPop(v9);

}

void __202__VCPPhotosAutoCounterWorker__measurePNPersonClusters_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v6 = a2;
  v7 = a3;
  v8 = (void *)MEMORY[0x1BCCA1B2C]();
  objc_msgSend(v7, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v9, "count");

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("OptInDateSinceReferenceDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "doubleValue");
    v14 = v13;
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __202__VCPPhotosAutoCounterWorker__measurePNPersonClusters_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_3;
    v19[3] = &unk_1E6B1A840;
    v15 = *(id *)(a1 + 40);
    v22 = v14;
    v20 = v15;
    v21 = &v23;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v19);
    v16 = v24[3];
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if (v16 > *(_QWORD *)(v17 + 24))
    {
      *(_QWORD *)(v17 + 24) = v16;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a2);
    }

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    objc_msgSend(v7, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v18, "count");

  }
  objc_autoreleasePoolPop(v8);

}

void __202__VCPPhotosAutoCounterWorker__measurePNPersonClusters_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  if (v5 < *(double *)(a1 + 48))
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void __202__VCPPhotosAutoCounterWorker__measurePNPersonClusters_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint64_t v17;

  v13 = a3;
  v5 = (void *)MEMORY[0x1BCCA1B2C]();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OptInDateSinceReferenceDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "doubleValue");
    if (v9 <= *(double *)(a1 + 56) + 21600.0)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __202__VCPPhotosAutoCounterWorker__measurePNPersonClusters_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_5;
      v14[3] = &unk_1E6B1A840;
      v11 = *(id *)(a1 + 40);
      v17 = *(_QWORD *)(a1 + 56);
      v12 = *(_QWORD *)(a1 + 48);
      v15 = v11;
      v16 = v12;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v14);
      v10 = v15;
    }
    else
    {
      objc_msgSend(v13, "allObjects");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v10, "count");
    }

  }
  objc_autoreleasePoolPop(v5);

}

void __202__VCPPhotosAutoCounterWorker__measurePNPersonClusters_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_5(uint64_t a1, uint64_t a2)
{
  double v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  if (v3 > *(double *)(a1 + 48))
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

- (int)_reportCoreAnalyticsWithVisionClusterMeasure:(id)a3 personClusterMeasure:(id)a4 personClusters:(id)a5 andGroundTruthInformation:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  __CFString *v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  VCPPhotosAutoCounterWorker *v42;
  id v43;
  id v44;
  id v45;
  __CFString *v46;
  uint8_t buf[4];
  const __CFString *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v33 = v13;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v48 = CFSTR("[AutoCounter][CA]");
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ Collecting data ...", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1398], "vcp_fetchOptionsForLibrary:forTaskID:", self->_photoLibrary, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __137__VCPPhotosAutoCounterWorker__reportCoreAnalyticsWithVisionClusterMeasure_personClusterMeasure_personClusters_andGroundTruthInformation___block_invoke;
  v39[3] = &unk_1E6B1A958;
  v15 = v10;
  v40 = v15;
  v16 = v11;
  v41 = v16;
  v42 = self;
  v17 = v12;
  v43 = v17;
  v32 = v14;
  v44 = v32;
  v18 = v34;
  v45 = v18;
  v46 = CFSTR("[AutoCounter][CA]");
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v39);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_Ver%d_Detector%lu_Printer%lu_MAD%lu_VU%lu_PhotosPerson%lu.plist"), CFSTR("AutoCounterCoreAnalytics"), -[PHPhotoLibrary mad_faceProcessingInternalVersion](self->_photoLibrary, "mad_faceProcessingInternalVersion"), self->_detectionVersion, self->_recognitionVersion, self->_madVersion, self->_vuVersion, self->_personClusterVersion);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary vcp_visionCacheStorageDirectoryURL](self->_photoLibrary, "vcp_visionCacheStorageDirectoryURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "URLByAppendingPathComponent:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v38 = 0;
    v22 = objc_msgSend(v18, "writeToURL:error:", v21, &v38);
    v23 = v38;
    if (v22)
    {
      if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v48 = CFSTR("[AutoCounter][CA]");
        v49 = 2112;
        v50 = v21;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ Saved CoreAnalytics to %@", buf, 0x16u);
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHPhotoLibrary vcp_visionCacheStorageDirectoryURL](self->_photoLibrary, "vcp_visionCacheStorageDirectoryURL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v23;
      objc_msgSend(v29, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v24, 0, 1, &v37);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v37;

      if (v31)
      {
        if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v48 = CFSTR("[AutoCounter][CA]");
          v49 = 2112;
          v50 = v31;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ Cannot retrieve CoreAnalytics files %@", buf, 0x16u);
        }
        v25 = -19;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self.lastPathComponent BEGINSWITH %@"), CFSTR("AutoCounterCoreAnalytics"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v48 = CFSTR("[AutoCounter][CA]");
          v49 = 2112;
          v50 = v30;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ Files in folder %@", buf, 0x16u);
        }
        objc_msgSend(v30, "filteredArrayUsingPredicate:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v48 = CFSTR("[AutoCounter][CA]");
          v49 = 2112;
          v50 = v27;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ Report CoreAnalytics files: %@", buf, 0x16u);
        }
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __137__VCPPhotosAutoCounterWorker__reportCoreAnalyticsWithVisionClusterMeasure_personClusterMeasure_personClusters_andGroundTruthInformation___block_invoke_441;
        v35[3] = &unk_1E6B1A9A8;
        v36 = CFSTR("[AutoCounter][CA]");
        objc_msgSend(v27, "enumerateObjectsUsingBlock:", v35);
        if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v48 = CFSTR("[AutoCounter][CA]");
          v49 = 2112;
          v50 = v27;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ Finished reporting CoreAnalytics %@", buf, 0x16u);
        }

        v25 = 0;
      }

      v23 = v31;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v48 = CFSTR("[AutoCounter][CA]");
        v49 = 2112;
        v50 = v21;
        v51 = 2112;
        v52 = v23;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ Cannot write CoreAnalytics to %@ - %@", buf, 0x20u);
      }
      v25 = -20;
    }

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v48 = CFSTR("[AutoCounter][CA]");
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ Failed to retrive CoreAnalytics export URL", buf, 0xCu);
    }
    v25 = -18;
  }

  return v25;
}

void __137__VCPPhotosAutoCounterWorker__reportCoreAnalyticsWithVisionClusterMeasure_personClusterMeasure_personClusters_andGroundTruthInformation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  unint64_t v14;
  double v15;
  double v16;
  unint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  _QWORD v68[4];
  id v69;
  uint64_t *v70;
  uint64_t v71;
  double *v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD v75[4];
  id v76;
  uint64_t *v77;
  uint64_t v78;
  double *v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD v82[4];
  id v83;
  uint64_t *v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD v94[4];
  id v95;
  uint64_t *v96;
  uint64_t *v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t v110;
  uint8_t buf[4];
  uint64_t v112;
  __int16 v113;
  void *v114;
  _QWORD v115[26];
  _QWORD v116[29];

  v116[26] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v67 = a3;
  v107 = 0;
  v108 = &v107;
  v109 = 0x2020000000;
  v110 = 0;
  v103 = 0;
  v104 = &v103;
  v105 = 0x2020000000;
  v106 = 0;
  v99 = 0;
  v100 = &v99;
  v101 = 0x2020000000;
  v102 = 0;
  objc_msgSend(*(id *)(a1 + 32), "precisionPerCluster");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v94[0] = MEMORY[0x1E0C809B0];
  v94[1] = 3221225472;
  v94[2] = __137__VCPPhotosAutoCounterWorker__reportCoreAnalyticsWithVisionClusterMeasure_personClusterMeasure_personClusters_andGroundTruthInformation___block_invoke_2;
  v94[3] = &unk_1E6B1A8E0;
  v8 = v5;
  v95 = v8;
  v96 = &v107;
  v97 = &v103;
  v98 = &v99;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v94);

  v90 = 0;
  v91 = &v90;
  v92 = 0x2020000000;
  v93 = 0;
  v86 = 0;
  v87 = &v86;
  v88 = 0x2020000000;
  v89 = 0;
  objc_msgSend(*(id *)(a1 + 40), "precisionPerCluster");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = v7;
  v82[1] = 3221225472;
  v82[2] = __137__VCPPhotosAutoCounterWorker__reportCoreAnalyticsWithVisionClusterMeasure_personClusterMeasure_personClusters_andGroundTruthInformation___block_invoke_3;
  v82[3] = &unk_1E6B1A908;
  v10 = v8;
  v83 = v10;
  v84 = &v90;
  v85 = &v86;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v82);

  v78 = 0;
  v79 = (double *)&v78;
  v80 = 0x2020000000;
  v81 = 0;
  objc_msgSend(*(id *)(a1 + 32), "recallPerPersonToGroundTruth");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = v7;
  v75[1] = 3221225472;
  v75[2] = __137__VCPPhotosAutoCounterWorker__reportCoreAnalyticsWithVisionClusterMeasure_personClusterMeasure_personClusters_andGroundTruthInformation___block_invoke_4;
  v75[3] = &unk_1E6B1A930;
  v12 = v10;
  v76 = v12;
  v77 = &v78;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v75);

  v71 = 0;
  v72 = (double *)&v71;
  v73 = 0x2020000000;
  v74 = 0;
  objc_msgSend(*(id *)(a1 + 40), "recallPerPersonToGroundTruth");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v7;
  v68[1] = 3221225472;
  v68[2] = __137__VCPPhotosAutoCounterWorker__reportCoreAnalyticsWithVisionClusterMeasure_personClusterMeasure_personClusters_andGroundTruthInformation___block_invoke_5;
  v68[3] = &unk_1E6B1A930;
  v66 = v12;
  v69 = v66;
  v70 = &v71;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v68);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("nightly-Ver%d_Detector%lu_Printer%lu_MAD%lu_VU%lu_PhotosPerson%lu"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "mad_faceProcessingInternalVersion"), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 56), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 32));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v87[3];
  v15 = 0.0;
  v16 = 0.0;
  if (v14)
    v16 = (float)((float)(unint64_t)v91[3] / (float)v14);
  v17 = v100[3];
  if (v17)
    v15 = (float)((float)(unint64_t)v104[3] / (float)v17);
  v115[0] = CFSTR("date_optin");
  objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("OptInDate"));
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = CFSTR("NA");
  v62 = (void *)v18;
  if (v18)
    v19 = (const __CFString *)v18;
  v116[0] = v19;
  v115[1] = CFSTR("detection_version_current");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v116[1] = v63;
  v115[2] = CFSTR("detection_version_optin");
  objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("OptInDetectionModelVersion"));
  v20 = objc_claimAutoreleasedReturnValue();
  v64 = (void *)v20;
  if (v20)
    v21 = (void *)v20;
  else
    v21 = &unk_1E6B74C78;
  v116[2] = v21;
  v115[3] = CFSTR("mad_version_current");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "mad_faceProcessingInternalVersion"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v116[3] = v60;
  v115[4] = CFSTR("mad_version_optin");
  objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("OptInMADFaceVersion"));
  v22 = objc_claimAutoreleasedReturnValue();
  v61 = (void *)v22;
  if (v22)
    v23 = (void *)v22;
  else
    v23 = &unk_1E6B74C78;
  v116[4] = v23;
  v116[5] = v66;
  v115[5] = CFSTR("person_id");
  v115[6] = CFSTR("promoter_clusters");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 56), "count"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v116[6] = v55;
  v116[7] = &unk_1E6B74C78;
  v115[7] = CFSTR("promoter_clusters_duplicates");
  v115[8] = CFSTR("promoter_precision");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v116[8] = v54;
  v115[9] = CFSTR("promoter_recall");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v72[3]);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v116[9] = v53;
  v115[10] = CFSTR("promoter_version_current");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 32));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v116[10] = v52;
  v115[11] = CFSTR("promoter_version_optin");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 32));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v116[11] = v56;
  v115[12] = CFSTR("recognition_version_current");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v116[12] = v57;
  v115[13] = CFSTR("recognition_version_optin");
  objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("OptInRecognitionModelVersion"));
  v24 = objc_claimAutoreleasedReturnValue();
  v58 = (void *)v24;
  if (v24)
    v25 = (void *)v24;
  else
    v25 = &unk_1E6B74C78;
  v116[13] = v25;
  v115[14] = CFSTR("total_assets");
  v26 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CD1398], "fetchAssetsWithOptions:", *(_QWORD *)(a1 + 64));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v59, "count"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v116[14] = v50;
  v115[15] = CFSTR("total_assets_optin");
  objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("AssetCount"));
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v27;
  if (v27)
    v29 = (void *)v27;
  else
    v29 = &unk_1E6B74C78;
  v116[15] = v29;
  v115[16] = CFSTR("total_faces");
  v30 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithOptions:", *(_QWORD *)(a1 + 64));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "numberWithUnsignedInteger:", objc_msgSend(v51, "count"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v116[16] = v49;
  v115[17] = CFSTR("total_faces_optin");
  objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("FaceCount"));
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v31;
  if (v31)
    v33 = (void *)v31;
  else
    v33 = &unk_1E6B74C78;
  v116[17] = v33;
  v116[18] = v65;
  v115[18] = CFSTR("type");
  v115[19] = CFSTR("userLabeledAge");
  objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("UserLabeledAge"));
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v34;
  if (v34)
    v36 = (void *)v34;
  else
    v36 = &unk_1E6B74C78;
  v116[19] = v36;
  v115[20] = CFSTR("userLabeledEthnicity");
  objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("UserLabeledEthnicity"));
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)v37;
  if (v37)
    v39 = (void *)v37;
  else
    v39 = &unk_1E6B74C78;
  v116[20] = v39;
  v115[21] = CFSTR("userLabeledGender");
  objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("UserLabeledGender"));
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = (void *)v40;
  if (v40)
    v42 = (void *)v40;
  else
    v42 = &unk_1E6B74C78;
  v116[21] = v42;
  v115[22] = CFSTR("vision_clusters");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v108[3]);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v116[22] = v43;
  v116[23] = &unk_1E6B74C78;
  v115[23] = CFSTR("vision_clusters_duplicates");
  v115[24] = CFSTR("vision_precision");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v116[24] = v44;
  v115[25] = CFSTR("vision_recall");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v79[3]);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v116[25] = v45;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, v115, 26);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 72), "addObject:", v46);
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v47 = *(_QWORD *)(a1 + 80);
    *(_DWORD *)buf = 138412546;
    v112 = v47;
    v113 = 2112;
    v114 = v46;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ Report CoreAnalytics: %@", buf, 0x16u);
  }
  +[VCPMADCoreAnalyticsManager sharedManager](VCPMADCoreAnalyticsManager, "sharedManager");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "sendEvent:withAnalytics:", CFSTR("com.apple.photos.autocounter"), v46);

  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v78, 8);

  _Block_object_dispose(&v86, 8);
  _Block_object_dispose(&v90, 8);

  _Block_object_dispose(&v99, 8);
  _Block_object_dispose(&v103, 8);
  _Block_object_dispose(&v107, 8);

}

void __137__VCPPhotosAutoCounterWorker__reportCoreAnalyticsWithVisionClusterMeasure_personClusterMeasure_personClusters_andGroundTruthInformation___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = (void *)a1[4];
  v8 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("personID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "isEqual:", v5);

  if ((_DWORD)v4)
  {
    ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("personFaceCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("validFaceCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) += objc_msgSend(v7, "unsignedIntegerValue");

  }
}

void __137__VCPPhotosAutoCounterWorker__reportCoreAnalyticsWithVisionClusterMeasure_personClusterMeasure_personClusters_andGroundTruthInformation___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = (void *)a1[4];
  v8 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("personID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "isEqual:", v5);

  if ((_DWORD)v4)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("personFaceCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("validFaceCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += objc_msgSend(v7, "unsignedIntegerValue");

  }
}

void __137__VCPPhotosAutoCounterWorker__reportCoreAnalyticsWithVisionClusterMeasure_personClusterMeasure_personClusters_andGroundTruthInformation___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  v11 = v6;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("personID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "isEqual:", v8);

  if ((_DWORD)v7)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("recall"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10;

    *a4 = 1;
  }

}

void __137__VCPPhotosAutoCounterWorker__reportCoreAnalyticsWithVisionClusterMeasure_personClusterMeasure_personClusters_andGroundTruthInformation___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  v11 = v6;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("personID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "isEqual:", v8);

  if ((_DWORD)v7)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("recall"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10;

    *a4 = 1;
  }

}

void __137__VCPPhotosAutoCounterWorker__reportCoreAnalyticsWithVisionClusterMeasure_personClusterMeasure_personClusters_andGroundTruthInformation___block_invoke_441(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ Report CoreAnalytics file: %@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithContentsOfURL:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __137__VCPPhotosAutoCounterWorker__reportCoreAnalyticsWithVisionClusterMeasure_personClusterMeasure_personClusters_andGroundTruthInformation___block_invoke_442;
  v6[3] = &unk_1E6B1A980;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

}

void __137__VCPPhotosAutoCounterWorker__reportCoreAnalyticsWithVisionClusterMeasure_personClusterMeasure_personClusters_andGroundTruthInformation___block_invoke_442(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ Report CoreAnalytics: %@", (uint8_t *)&v6, 0x16u);
  }
  +[VCPMADCoreAnalyticsManager sharedManager](VCPMADCoreAnalyticsManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendEvent:withAnalytics:", CFSTR("com.apple.photos.autocounter"), v3);

}

- (int)calculateAndReportClusterAccuracyWithVisionClusterURL:(id)a3 andPersonClusters:(id)a4 withGroundtruth:(id)a5 results:(id *)a6 extendTimeoutBlock:(id)a7 cancelBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  int v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  const char *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
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
  id v50;
  id v51;
  id v52;
  uint8_t buf[8];
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  _QWORD v59[6];
  _QWORD v60[6];
  _QWORD v61[7];
  _QWORD v62[7];
  _QWORD v63[2];
  _QWORD v64[4];

  v64[2] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v51 = a4;
  v15 = a7;
  v16 = a8;
  v57 = 0;
  v58 = 0;
  v55 = 0;
  v56 = 0;
  v17 = -[VCPPhotosAutoCounterWorker _parseGroundTruthWithURL:faceCountPerPerson:personInformation:faceToPerson:assetToFaces:extendTimeoutBlock:cancelBlock:](self, "_parseGroundTruthWithURL:faceCountPerPerson:personInformation:faceToPerson:assetToFaces:extendTimeoutBlock:cancelBlock:", a5, &v58, &v57, &v56, &v55, v15, v16);
  v18 = v58;
  v19 = v57;
  v20 = v56;
  v21 = v55;
  if (!v17)
  {
    v54 = 0;
    v17 = -[VCPPhotosAutoCounterWorker _measureClusterWithClusterStateURL:groundTruthFaceCountPerPerson:groundTruthPersonInformation:groundTruthFaceToPerson:groundTruthAssetToFaces:measures:extendTimeoutBlock:cancelBlock:](self, "_measureClusterWithClusterStateURL:groundTruthFaceCountPerPerson:groundTruthPersonInformation:groundTruthFaceToPerson:groundTruthAssetToFaces:measures:extendTimeoutBlock:cancelBlock:", v14, v18, v19, v20, v21, &v54, v15, v16);
    v50 = v54;
    if (v17)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[AutoCounter][P/R] Failed to measure Vision cluster state against ground truth", buf, 2u);
      }
      goto LABEL_19;
    }
    v52 = 0;
    v17 = -[VCPPhotosAutoCounterWorker _measurePNPersonClusters:groundTruthFaceCountPerPerson:groundTruthPersonInformation:groundTruthFaceToPerson:groundTruthAssetToFaces:measures:extendTimeoutBlock:cancelBlock:](self, "_measurePNPersonClusters:groundTruthFaceCountPerPerson:groundTruthPersonInformation:groundTruthFaceToPerson:groundTruthAssetToFaces:measures:extendTimeoutBlock:cancelBlock:", v51, v18, v19, v20, v21, &v52, v15, v16);
    v22 = v52;
    v49 = v22;
    if (v17)
    {
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      *(_WORD *)buf = 0;
      v23 = MEMORY[0x1E0C81028];
      v24 = "[AutoCounter][P/R][PV] Failed to measure Person cluster state against ground truth";
    }
    else
    {
      v17 = -[VCPPhotosAutoCounterWorker _reportCoreAnalyticsWithVisionClusterMeasure:personClusterMeasure:personClusters:andGroundTruthInformation:](self, "_reportCoreAnalyticsWithVisionClusterMeasure:personClusterMeasure:personClusters:andGroundTruthInformation:", v50, v22, v51, v19);
      if (!v17)
      {
        if (a6)
        {
          v63[0] = CFSTR("visionCluster");
          v61[0] = CFSTR("weightedAveragePrecision");
          v25 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v50, "weightedAveragePrecision");
          objc_msgSend(v25, "numberWithFloat:");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v62[0] = v48;
          v61[1] = CFSTR("weightedAverageRecall");
          v26 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v50, "weightedAverageRecall");
          objc_msgSend(v26, "numberWithFloat:");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v62[1] = v47;
          v61[2] = CFSTR("numSingletons");
          v27 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v50, "numSingletons");
          objc_msgSend(v27, "numberWithFloat:");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v62[2] = v46;
          v61[3] = CFSTR("numValidSingletons");
          v28 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v50, "numValidSingletons");
          objc_msgSend(v28, "numberWithFloat:");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v62[3] = v40;
          v61[4] = CFSTR("precisionPerCluster");
          objc_msgSend(v50, "precisionPerCluster");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v62[4] = v41;
          v61[5] = CFSTR("recallPerPersonToGroundTruth");
          objc_msgSend(v50, "recallPerPersonToGroundTruth");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v62[5] = v42;
          v61[6] = CFSTR("recallPerPersonExcludeMissDetection");
          objc_msgSend(v50, "recallPerPersonExcludeMissDetection");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v62[6] = v44;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 7);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v63[1] = CFSTR("personCluster");
          v64[0] = v45;
          v59[0] = CFSTR("weightedAveragePrecision");
          v29 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v49, "weightedAveragePrecision");
          objc_msgSend(v29, "numberWithFloat:");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v60[0] = v43;
          v59[1] = CFSTR("weightedAverageRecall");
          v30 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v49, "weightedAverageRecall");
          objc_msgSend(v30, "numberWithFloat:");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v60[1] = v38;
          v59[2] = CFSTR("numSingletons");
          v31 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v49, "numSingletons");
          objc_msgSend(v31, "numberWithFloat:");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v60[2] = v37;
          v59[3] = CFSTR("numValidSingletons");
          v32 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v49, "numValidSingletons");
          objc_msgSend(v32, "numberWithFloat:");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v60[3] = v39;
          v59[4] = CFSTR("precisionPerCluster");
          objc_msgSend(v49, "precisionPerCluster");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v60[4] = v36;
          v59[5] = CFSTR("recallPerPersonToGroundTruth");
          objc_msgSend(v49, "recallPerPersonToGroundTruth");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v60[5] = v35;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 6);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v64[1] = v33;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 2);
          *a6 = (id)objc_claimAutoreleasedReturnValue();

        }
        v17 = 0;
        goto LABEL_18;
      }
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      *(_WORD *)buf = 0;
      v23 = MEMORY[0x1E0C81028];
      v24 = "[AutoCounter][P/R][PV] Failed to report CoreAnalytics";
    }
    _os_log_impl(&dword_1B6C4A000, v23, OS_LOG_TYPE_ERROR, v24, buf, 2u);
    goto LABEL_18;
  }
LABEL_20:

  return v17;
}

- (int)calculateAndReportClusterAccuracyWithVisionClusterURL:(id)a3 andPersonClusters:(id)a4 results:(id *)a5 extendTimeoutBlock:(id)a6 cancelBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  -[VCPPhotosAutoCounterWorker _groundTruthURL](self, "_groundTruthURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = -[VCPPhotosAutoCounterWorker calculateAndReportClusterAccuracyWithVisionClusterURL:andPersonClusters:withGroundtruth:results:extendTimeoutBlock:cancelBlock:](self, "calculateAndReportClusterAccuracyWithVisionClusterURL:andPersonClusters:withGroundtruth:results:extendTimeoutBlock:cancelBlock:", v12, v13, v16, a5, v14, v15);

  return (int)a5;
}

- (int)_parseSIMLGroundTruthWithURL:(id)a3 faceCountPerPerson:(id *)a4 personInformation:(id *)a5 faceToPerson:(id *)a6 assetToFaces:(id *)a7 extendTimeoutBlock:(id)a8 cancelBlock:(id)a9
{
  uint64_t (**v15)(_QWORD);
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t i;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  int v37;
  id *v39;
  id *v40;
  id *v41;
  void *v42;
  id *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  void (**v54)(void);
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  const __CFString *v65;
  void *v66;
  uint8_t buf[4];
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v48 = a3;
  v54 = (void (**)(void))a8;
  v15 = (uint64_t (**)(_QWORD))a9;
  v43 = a4;
  *a4 = 0;
  *a5 = 0;
  *a6 = 0;
  *a7 = 0;
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v53 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v52 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v51 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v50 = (id)objc_claimAutoreleasedReturnValue();
  v64 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v48, 0, &v64);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v64;
  v46 = (void *)v16;
  if (!v16 || v17)
  {
    v45 = v17;
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v68 = v45;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[AutoCounter][P/R][SIMLGT] Failed to load SIML ground truth - %@", buf, 0xCu);
    }
    v37 = -18;
  }
  else
  {
    v63 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v16, 0, &v63);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v63;
    v44 = v18;
    v45 = v19;
    if (!v18 || v19)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v68 = v45;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[AutoCounter][P/R][SIMLGT] Failed to serialize SIML ground truth - %@", buf, 0xCu);
      }
      v37 = -18;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __153__VCPPhotosAutoCounterWorker__parseSIMLGroundTruthWithURL_faceCountPerPerson_personInformation_faceToPerson_assetToFaces_extendTimeoutBlock_cancelBlock___block_invoke;
      v61[3] = &unk_1E6B1A980;
      v49 = v20;
      v62 = v49;
      objc_msgSend(v18, "enumerateObjectsUsingBlock:", v61);
      v65 = CFSTR("OptInDateSinceReferenceDate");
      v21 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "timeIntervalSinceReferenceDate");
      objc_msgSend(v21, "numberWithDouble:");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = a6;
      v41 = a5;
      v39 = a7;
      v66 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CD1398], "vcp_fetchOptionsForLibrary:forTaskID:", self->_photoLibrary, 3);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD1398], "fetchAssetsWithOptions:");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = 0; ; ++i)
      {
        if (i >= objc_msgSend(v24, "count"))
        {
          *v43 = objc_retainAutorelease(v53);
          *v41 = objc_retainAutorelease(v52);
          *v40 = objc_retainAutorelease(v51);
          v37 = 0;
          *v39 = objc_retainAutorelease(v50);
          goto LABEL_29;
        }
        v26 = (void *)MEMORY[0x1BCCA1B2C]();
        if (v15 && (v15[2](v15) & 1) != 0)
        {
          v27 = 1;
        }
        else
        {
          if (v54)
            v54[2]();
          objc_msgSend(v24, "objectAtIndexedSubscript:", i);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "originalFilename");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "stringByDeletingPathExtension");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v30, "integerValue"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "objectForKeyedSubscript:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
          {
            objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("faces"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v55[0] = MEMORY[0x1E0C809B0];
            v55[1] = 3221225472;
            v55[2] = __153__VCPPhotosAutoCounterWorker__parseSIMLGroundTruthWithURL_faceCountPerPerson_personInformation_faceToPerson_assetToFaces_extendTimeoutBlock_cancelBlock___block_invoke_2;
            v55[3] = &unk_1E6B1A9D0;
            v35 = v34;
            v56 = v35;
            v57 = v51;
            v58 = v53;
            v59 = v52;
            v60 = v47;
            objc_msgSend(v33, "enumerateObjectsUsingBlock:", v55);
            objc_msgSend(v28, "localIdentifier");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "setObject:forKeyedSubscript:", v35, v36);

            v27 = 0;
          }
          else
          {
            v27 = 12;
          }

        }
        objc_autoreleasePoolPop(v26);
        if (v27 != 12)
        {
          if (v27)
            break;
        }
      }
      v37 = -128;
LABEL_29:

    }
  }

  return v37;
}

void __153__VCPPhotosAutoCounterWorker__parseSIMLGroundTruthWithURL_faceCountPerPerson_personInformation_faceToPerson_assetToFaces_extendTimeoutBlock_cancelBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

void __153__VCPPhotosAutoCounterWorker__parseSIMLGroundTruthWithURL_faceCountPerPerson_personInformation_faceToPerson_assetToFaces_extendTimeoutBlock_cancelBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  float v11;
  float v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  float v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;
  NSRect v29;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("identity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("centerX"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    v9 = v8;

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("centerY"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    v12 = v11;

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("size"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    v15 = v14;

    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("id"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("f%@"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("p%@"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setObject:forKey:", v18, CFSTR("faceID"));
    objc_msgSend(v6, "setObject:forKey:", v21, CFSTR("personID"));
    v22 = v15 * 1.76;
    v29.origin.x = v9;
    v29.origin.y = v12;
    v29.size.width = v22;
    v29.size.height = v29.size.width;
    NSStringFromRect(v29);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v23, CFSTR("faceRect"));

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v21, v18);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v21);
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 64), v21);
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v18;
      v26 = 2112;
      v27 = v21;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[AutoCounter][P/R][SIMLGT] Load faceID: %@ for PersonID: %@", buf, 0x16u);
    }

  }
}

- (int)validateClusterAccuracyWithSIMLGroundtruth:(id)a3 results:(id *)a4 extendTimeoutBlock:(id)a5 cancelBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  id v14;
  id v15;
  id v16;
  id *v17;
  id *v18;
  int v19;
  int v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  id v52;
  _QWORD v53[7];
  _QWORD v54[7];
  uint8_t buf[4];
  id v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v51 = 0;
  v52 = 0;
  v49 = 0;
  v50 = 0;
  v13 = -[VCPPhotosAutoCounterWorker _parseSIMLGroundTruthWithURL:faceCountPerPerson:personInformation:faceToPerson:assetToFaces:extendTimeoutBlock:cancelBlock:](self, "_parseSIMLGroundTruthWithURL:faceCountPerPerson:personInformation:faceToPerson:assetToFaces:extendTimeoutBlock:cancelBlock:", v10, &v52, &v51, &v50, &v49, v11, v12);
  v14 = v52;
  v43 = v51;
  v15 = v50;
  v16 = v49;
  if (!v13)
  {
    v39 = a4;
    v41 = v14;
    if (-[PHPhotoLibrary mad_useVUGallery](self->_photoLibrary, "mad_useVUGallery"))
    {
      v47 = 0;
      v48 = 0;
      v17 = (id *)&v47;
      v18 = (id *)&v48;
      v19 = -[VCPPhotosAutoCounterWorker exportVUGalleryClusterStates:error:extendTimeoutBlock:cancelBlock:](self, "exportVUGalleryClusterStates:error:extendTimeoutBlock:cancelBlock:", &v48, &v47, v11, v12);
    }
    else
    {
      v45 = 0;
      v46 = 0;
      v17 = (id *)&v45;
      v18 = (id *)&v46;
      v19 = -[VCPPhotosAutoCounterWorker exportClustersStates:error:extendTimeoutBlock:cancelBlock:](self, "exportClustersStates:error:extendTimeoutBlock:cancelBlock:", &v46, &v45, v11, v12);
    }
    v20 = v19;
    v21 = *v18;
    v22 = *v17;
    v40 = v22;
    if (v20 || v22)
    {
      v14 = v41;
      v23 = v21;
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[AutoCounter][P/R][SIML] Failed to export current clusters states", buf, 2u);
      }
      v13 = -18;
    }
    else
    {
      v23 = v21;
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v56 = v21;
        v57 = 2112;
        v58 = v10;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[AutoCounter][P/R][SIML] Validate cluster state  %@ against ground truth %@", buf, 0x16u);
      }
      v44 = 0;
      v14 = v41;
      v13 = -[VCPPhotosAutoCounterWorker _measureClusterWithClusterStateURL:groundTruthFaceCountPerPerson:groundTruthPersonInformation:groundTruthFaceToPerson:groundTruthAssetToFaces:measures:extendTimeoutBlock:cancelBlock:](self, "_measureClusterWithClusterStateURL:groundTruthFaceCountPerPerson:groundTruthPersonInformation:groundTruthFaceToPerson:groundTruthAssetToFaces:measures:extendTimeoutBlock:cancelBlock:", v21, v41, v43, v15, v16, &v44, v11, v12);
      v42 = v44;
      if (v13)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[AutoCounter][P/R][SIML] Failed to measure Vision cluster state against SIML ground truth", buf, 2u);
        }
      }
      else if (v39)
      {
        v53[0] = CFSTR("weightedAveragePrecision");
        v24 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v42, "weightedAveragePrecision");
        objc_msgSend(v24, "numberWithFloat:");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v54[0] = v38;
        v53[1] = CFSTR("weightedAverageRecall");
        v25 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v42, "weightedAverageRecall");
        objc_msgSend(v25, "numberWithFloat:");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v54[1] = v37;
        v53[2] = CFSTR("numSingletons");
        v26 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v42, "numSingletons");
        objc_msgSend(v26, "numberWithFloat:");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v54[2] = v36;
        v53[3] = CFSTR("numValidSingletons");
        v27 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v42, "numValidSingletons");
        objc_msgSend(v27, "numberWithFloat:");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v54[3] = v35;
        v53[4] = CFSTR("precisionPerCluster");
        objc_msgSend(v42, "precisionPerCluster");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "sortedArrayUsingComparator:", &__block_literal_global_74);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v54[4] = v33;
        v53[5] = CFSTR("recallPerPersonToGroundTruth");
        objc_msgSend(v42, "recallPerPersonToGroundTruth");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "sortedArrayUsingComparator:", &__block_literal_global_74);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v54[5] = v31;
        v53[6] = CFSTR("recallPerPersonExcludeMissDetection");
        objc_msgSend(v42, "recallPerPersonExcludeMissDetection");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "sortedArrayUsingComparator:", &__block_literal_global_74);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v54[6] = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 7);
        *v39 = (id)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  return v13;
}

uint64_t __112__VCPPhotosAutoCounterWorker_validateClusterAccuracyWithSIMLGroundtruth_results_extendTimeoutBlock_cancelBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("personID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("personID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:options:", v7, 64);
  if (!v8)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("validFaceCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("validFaceCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "compare:", v10);

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end
