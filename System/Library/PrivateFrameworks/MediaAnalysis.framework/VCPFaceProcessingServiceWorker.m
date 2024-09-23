@implementation VCPFaceProcessingServiceWorker

- (VCPFaceProcessingServiceWorker)initWithPhotoLibrary:(id)a3 andContext:(id)a4
{
  id v7;
  id v8;
  VCPFaceProcessingServiceWorker *v9;
  VCPFaceProcessingServiceWorker *v10;
  VCPPhotosPersistenceDelegate *v11;
  VCPPhotosPersistenceDelegate *persistenceDelegate;
  void *clusterer;
  void *v14;
  objc_class *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  GDVUVisualUnderstandingService *vuService;
  VCPFaceProcessingServiceWorker *v23;
  VCPClusterer *v24;
  VCPFaceProcessingServiceWorker *v25;
  objc_class *v27;
  void *v28;
  id v29;
  objc_super v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE buf[24];
  void *v36;
  uint64_t *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v30.receiver = self;
  v30.super_class = (Class)VCPFaceProcessingServiceWorker;
  v9 = -[VCPFaceProcessingServiceWorker init](&v30, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    objc_storeStrong((id *)&v10->_context, a4);
    v11 = -[VCPPhotosPersistenceDelegate initWithPhotoLibrary:]([VCPPhotosPersistenceDelegate alloc], "initWithPhotoLibrary:", v7);
    persistenceDelegate = v10->_persistenceDelegate;
    v10->_persistenceDelegate = v11;

    if (objc_msgSend(v7, "mad_useVUGallery"))
    {
      objc_msgSend(v7, "vcp_visionCacheStorageDirectoryURL");
      clusterer = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      v32 = &v31;
      v33 = 0x2050000000;
      v14 = (void *)getGDVUVisualUnderstandingServiceClass_softClass;
      v34 = getGDVUVisualUnderstandingServiceClass_softClass;
      if (!getGDVUVisualUnderstandingServiceClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getGDVUVisualUnderstandingServiceClass_block_invoke;
        v36 = &unk_1E6B19610;
        v37 = &v31;
        __getGDVUVisualUnderstandingServiceClass_block_invoke((uint64_t)buf);
        v14 = (void *)v32[3];
      }
      v15 = objc_retainAutorelease(v14);
      _Block_object_dispose(&v31, 8);
      v16 = [v15 alloc];
      v31 = 0;
      v32 = &v31;
      v33 = 0x2050000000;
      v17 = (void *)getGDVUEntityRecognitionClientClass_softClass;
      v34 = getGDVUEntityRecognitionClientClass_softClass;
      if (!getGDVUEntityRecognitionClientClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getGDVUEntityRecognitionClientClass_block_invoke;
        v36 = &unk_1E6B19610;
        v37 = &v31;
        __getGDVUEntityRecognitionClientClass_block_invoke((uint64_t)buf);
        v17 = (void *)v32[3];
      }
      v18 = objc_retainAutorelease(v17);
      _Block_object_dispose(&v31, 8);
      objc_msgSend(v18, "photos");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      v20 = objc_msgSend(v16, "initWithClient:version:url:error:", v19, 1, clusterer, &v29);
      v21 = v29;
      vuService = v10->_vuService;
      v10->_vuService = (GDVUVisualUnderstandingService *)v20;

      if (!v10->_vuService)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v27 = (objc_class *)objc_opt_class();
          NSStringFromClass(v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v28;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v21;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to create GDVUVisualUnderstandingService - %@", buf, 0x16u);

        }
        v23 = 0;
        goto LABEL_12;
      }

    }
    else
    {
      v24 = -[VCPClusterer initWithPhotoLibrary:andContext:]([VCPClusterer alloc], "initWithPhotoLibrary:andContext:", v7, v8);
      clusterer = v10->_clusterer;
      v10->_clusterer = v24;
    }
    v23 = v10;
LABEL_12:

    goto LABEL_13;
  }
  v23 = 0;
LABEL_13:
  v25 = v23;

  return v25;
}

+ (id)workerWithPhotoLibrary:(id)a3 andContext:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPhotoLibrary:andContext:", v6, v5);

  return v7;
}

- (void)_openSuggestionsLoggingSession
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSURL *v9;
  NSURL *suggestionLoggingDirectory;
  NSURL **p_suggestionLoggingDirectory;
  void *v12;
  NSURL *v13;
  uint64_t v14;
  uint64_t v15;

  if (!self->_suggestionLoggingSessionOpen)
  {
    if (_openSuggestionsLoggingSession_onceToken != -1)
      dispatch_once(&_openSuggestionsLoggingSession_onceToken, &__block_literal_global_46);
    -[PHPhotoLibrary vcp_visionCacheStorageDirectoryURL](self->_photoLibrary, "vcp_visionCacheStorageDirectoryURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "absoluteURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)sDateFormatter;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringForObjectValue:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("suggestionLog_"), "stringByAppendingString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v4, "URLByAppendingPathComponent:", v8);
      v9 = (NSURL *)objc_claimAutoreleasedReturnValue();
      p_suggestionLoggingDirectory = &self->_suggestionLoggingDirectory;
      suggestionLoggingDirectory = self->_suggestionLoggingDirectory;
      self->_suggestionLoggingDirectory = v9;
    }
    else
    {
      p_suggestionLoggingDirectory = &self->_suggestionLoggingDirectory;
      suggestionLoggingDirectory = self->_suggestionLoggingDirectory;
      self->_suggestionLoggingDirectory = 0;
    }

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *p_suggestionLoggingDirectory;
    v15 = 0;
    objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v13, 0, 0, &v15);
    v14 = v15;

    if (!v14)
      self->_suggestionLoggingSessionOpen = 1;

  }
}

uint64_t __64__VCPFaceProcessingServiceWorker__openSuggestionsLoggingSession__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)sDateFormatter;
  sDateFormatter = (uint64_t)v0;

  return objc_msgSend((id)sDateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd-HH-mm-ss"));
}

- (void)_closeSuggestionsLoggingSession
{
  NSURL *suggestionLoggingDirectory;

  suggestionLoggingDirectory = self->_suggestionLoggingDirectory;
  self->_suggestionLoggingDirectory = 0;

  self->_suggestionLoggingSessionOpen = 0;
}

- (void)_appendToSuggestionsLog:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  FILE *v7;
  FILE *v8;
  id v9;

  v4 = a3;
  if (v4 && self->_suggestionLoggingSessionOpen)
  {
    v9 = v4;
    -[NSURL URLByAppendingPathComponent:](self->_suggestionLoggingDirectory, "URLByAppendingPathComponent:", CFSTR("suggestions.html"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = fopen((const char *)objc_msgSend(objc_retainAutorelease(v5), "fileSystemRepresentation"), "a");
      if (v7)
      {
        v8 = v7;
        fprintf(v7, "%s\n", (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
        fclose(v8);
      }
    }

    v4 = v9;
  }

}

- (void)_copyImageAtURLToSuggestionsLoggingSession:(id)a3
{
  id v4;
  void *v5;
  NSURL *suggestionLoggingDirectory;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v4 = a3;
  v5 = v4;
  if (v4 && self->_suggestionLoggingSessionOpen)
  {
    suggestionLoggingDirectory = self->_suggestionLoggingDirectory;
    objc_msgSend(v4, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL URLByAppendingPathComponent:](suggestionLoggingDirectory, "URLByAppendingPathComponent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v9, "copyItemAtURL:toURL:error:", v5, v8, &v11);
    v10 = v11;

  }
}

+ (BOOL)_includeTorsoOnlyFaces
{
  return 1;
}

+ (id)newAllFacesFetchOptionsWithPhotoLibrary:(id)a3
{
  void *v3;

  objc_msgSend(a3, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIncludeNonvisibleFaces:", 1);
  objc_msgSend(v3, "setIncludeTorsoOnlyDetectionData:", 1);
  if (objc_msgSend(MEMORY[0x1E0CD16F0], "mad_clusterVideoFaces"))
    objc_msgSend(v3, "setIncludeMediaAnalysisProcessingRangeTypes:", 3);
  if (_os_feature_enabled_impl())
    objc_msgSend(v3, "setIncludedDetectionTypes:", &unk_1E6B76620);
  return v3;
}

+ (id)newAllPersonsWithAtLeastOneFaceFetchOptionsWithPhotoLibrary:(id)a3
{
  void *v3;

  objc_msgSend(a3, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMinimumUnverifiedFaceCount:", 1);
  objc_msgSend(v3, "setMinimumVerifiedFaceCount:", 1);
  if (_os_feature_enabled_impl())
    objc_msgSend(v3, "setIncludedDetectionTypes:", &unk_1E6B76638);
  return v3;
}

- (void)_logFaceToSuggestionsLog:(id)a3
{
  id v3;

  v3 = (id)objc_msgSend((id)objc_opt_class(), "newAllFacesFetchOptionsWithPhotoLibrary:", self->_photoLibrary);
  objc_msgSend(v3, "setIncludeHiddenAssets:", 1);
  objc_msgSend(v3, "setIncludeAllBurstAssets:", 1);

}

- (void)_finalizeSuggestionsLog
{
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
  void *v29;
  id v30;

  objc_msgSend(CFSTR("];\n\n\t\tfunction addPlaceHolders() {\n"),
    "stringByAppendingString:",
    CFSTR("\t\t\taddPlaceholdersForSet(\"visionInput\", inputFaces);\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("\t\t\taddPlaceholdersForSet(\"visionOutput\", outputFaces);\n"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByAppendingString:", CFSTR("\t\t\taddPlaceholdersForSet(\"visionFiltered\", filteredFaces);\n\t\t}\n\n"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByAppendingString:", CFSTR("\t\tfunction isElementHidden(element) {\n\t\t\tvar style = window.getComputedStyle(element);\n"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAppendingString:", CFSTR("\t\t\treturn (style.display === 'none')\n\t\t}\n"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAppendingString:", CFSTR("\t\tfunction updateVisibility() {\n"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringByAppendingString:", CFSTR("\t\t\tvar allDivs = document.getElementsByTagName(\"div\");\n"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringByAppendingString:", CFSTR("\t\t\tfor (var i = 0; i < allDivs.length; i++) {\n"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringByAppendingString:", CFSTR("\t\t\t\tvar d = allDivs[i];\n\t\t\t\tif (!d.attributes[\"img\"]) continue;\n"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "stringByAppendingString:", CFSTR("\t\t\t\tvar rect = d.getBoundingClientRect();\n\t\t\t\tif (\n"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "stringByAppendingString:", CFSTR("\t\t\t\t\t\trect.top >= -100 &&\n\t\t\t\t\t\trect.left >= -100 &&\n"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "stringByAppendingString:", CFSTR("\t\t\t\t\t\trect.bottom - 100 <= (window.innerHeight || document.documentElement.clientHeight) &&\n"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "stringByAppendingString:", CFSTR("\t\t\t\t\t\trect.right - 100 <= (window.innerWidth || document.documentElement.clientWidth)\n"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "stringByAppendingString:", CFSTR("\t\t\t\t) {\n\t\t\t\t\tif (d.childNodes.length == 0) {\n"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "stringByAppendingString:", CFSTR("\t\t\t\t\t\td.innerHTML = \"<img src='\" + d.attributes[\"img\"].value + \"' width='100' height='100'>\";\n"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "stringByAppendingString:", CFSTR("\t\t\t\t\t}\n\t\t\t\t}\n\t\t\t\telse {\n\t\t\t\t\tif (d.childNodes.length != 0) {\n\t\t\t\t\t\td.innerHTML = \"\";\n\t\t\t\t\t}\n\t\t\t\t}\n\t\t\t}\n\t\t}\n"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "stringByAppendingString:", CFSTR("\t\tfunction addPlaceholdersForSet(containerId, elements) {\n"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "stringByAppendingString:", CFSTR("\t\t\tvar content = \"\";\n\t\t\tfor (var i = 0; i < elements.length; i++) {\n"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "stringByAppendingString:", CFSTR("\t\t\t\tcontent += \"<div style='float: left; width: 100px; height: 100px; margin: 3px; background-color: darkgray' img='\" + elements[i] + \"'></div>\"\n\t\t\t}\n"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "stringByAppendingString:", CFSTR("\t\t\tdocument.getElementById(containerId).innerHTML = content;\n"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "stringByAppendingString:", CFSTR("\t\t\tdocument.onscroll = function (e) {\n\t\t\t\tupdateVisibility();\n\t\t\t}\n\t\t}\n"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "stringByAppendingString:", CFSTR("</script>\n</head>\n<body>\n<p>Vision input:</p>\n"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "stringByAppendingString:", CFSTR("<div id=\"visionInput\">\n</div>\n"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "stringByAppendingString:", CFSTR("<p style=\"clear: both;\">Vision output:</p>\n<div id=\"visionOutput\">\n</div>\n\n"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "stringByAppendingString:", CFSTR("<p style=\"clear: both;\">Vision filtered output:</p>\n<div id=\"visionFiltered\">\n"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "stringByAppendingString:", CFSTR("</div>\n\n</div>\n<script>\n"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "stringByAppendingString:", CFSTR("document.addEventListener(\"DOMContentLoaded\", function (event) {\n"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "stringByAppendingString:", CFSTR("addPlaceHolders();\n});\n\n</script>\n</body>\n</html>\n"));
  v30 = (id)objc_claimAutoreleasedReturnValue();

  -[VCPFaceProcessingServiceWorker _appendToSuggestionsLog:](self, "_appendToSuggestionsLog:", v30);
}

- (void)_startAndSyncClusterCacheWithLibrary:(BOOL)a3 reply:(id)a4
{
  id v6;
  qos_class_t v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  BOOL v12;

  v6 = a4;
  v7 = qos_class_self();
  dispatch_get_global_queue(v7, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__VCPFaceProcessingServiceWorker__startAndSyncClusterCacheWithLibrary_reply___block_invoke;
  block[3] = &unk_1E6B19470;
  v12 = a3;
  block[4] = self;
  v11 = v6;
  v9 = v6;
  dispatch_async(v8, block);

}

void __77__VCPFaceProcessingServiceWorker__startAndSyncClusterCacheWithLibrary_reply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  int v6;
  NSObject *v7;
  const char *v8;
  os_log_type_t v9;
  uint32_t v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v3 = *(unsigned __int8 *)(a1 + 48);
  v12 = 0;
  v4 = objc_msgSend(v2, "restoreClusterCacheAndSyncWithLibrary:cancelOrExtendTimeoutBlock:error:", v3, &__block_literal_global_253, &v12);
  v5 = v12;
  v6 = MediaAnalysisLogLevel();
  if (v5)
  {
    if (v6 >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v14 = v4;
      v15 = 2112;
      v16 = v5;
      v7 = MEMORY[0x1E0C81028];
      v8 = "Restore clusterer error (ClusterState = %ld): %@";
      v9 = OS_LOG_TYPE_DEFAULT;
      v10 = 22;
LABEL_8:
      _os_log_impl(&dword_1B6C4A000, v7, v9, v8, buf, v10);
    }
  }
  else if (v6 >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v14 = v4;
    v7 = MEMORY[0x1E0C81028];
    v8 = "Restored clusterer, ClusterState = %ld";
    v9 = OS_LOG_TYPE_INFO;
    v10 = 12;
    goto LABEL_8;
  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, v4);

}

uint64_t __77__VCPFaceProcessingServiceWorker__startAndSyncClusterCacheWithLibrary_reply___block_invoke_2()
{
  return 0;
}

- (void)updateKeyFacesOfPersonsWithLocalIdentifiers:(id)a3 forceUpdate:(BOOL)a4 context:(id)a5 cancelOrExtendTimeoutBlock:(id)a6 reply:(id)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  void (**v13)(id, uint64_t, id);
  VCPPhotosPersistenceDelegate *persistenceDelegate;
  uint64_t v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v9 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  v13 = (void (**)(id, uint64_t, id))a7;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v11;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "UpdateKeyFaces for: '%@'", buf, 0xCu);
  }
  persistenceDelegate = self->_persistenceDelegate;
  v17 = 0;
  v15 = -[VCPPhotosPersistenceDelegate updateKeyFacesOfPersonsWithLocalIdentifiers:forceUpdate:cancelOrExtendTimeoutBlock:error:](persistenceDelegate, "updateKeyFacesOfPersonsWithLocalIdentifiers:forceUpdate:cancelOrExtendTimeoutBlock:error:", v11, v9, v12, &v17);
  v16 = v17;
  v13[2](v13, v15, v16);

}

- (id)_suggestionsForPersonLocalIdentifier:(id)a3 clusterSequenceNumbers:(id)a4 excludePersonLocalIdentifiers:(id)a5 context:(id)a6 cancelOrExtendTimeoutBlock:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  PHPhotoLibrary *photoLibrary;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;
  _QWORD v54[3];

  v54[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = v18;
  photoLibrary = self->_photoLibrary;
  if (photoLibrary)
  {
    v40 = a8;
    v41 = v18;
    v42 = v17;
    v44 = v15;
    v45 = v14;
    v43 = v16;
    -[PHPhotoLibrary suggestionsForPersonLocalIdentifier:clusterSequenceNumbers:excludePersonLocalIdentifiers:minimumSuggestionFaceCount:](photoLibrary, "suggestionsForPersonLocalIdentifier:clusterSequenceNumbers:excludePersonLocalIdentifiers:minimumSuggestionFaceCount:", v14, v15, v16, objc_msgSend(v17, "minimumSuggestionSize"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v23 = v21;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v47 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("faceIdentifier"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v29)
          {
            objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("personIdentifier"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (v30)
              objc_msgSend(v22, "addObject:", v30);

          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      }
      while (v25);
    }

    v19 = v41;
    if (objc_msgSend(v22, "count"))
      -[VCPFaceProcessingServiceWorker updateKeyFacesOfPersonsWithLocalIdentifiers:forceUpdate:context:cancelOrExtendTimeoutBlock:reply:](self, "updateKeyFacesOfPersonsWithLocalIdentifiers:forceUpdate:context:cancelOrExtendTimeoutBlock:reply:", v22, 0, MEMORY[0x1E0C9AA70], v41, &__block_literal_global_261);
    if (v23)
    {
      v23 = v23;
      v31 = v23;
    }
    else
    {
      if (v40)
      {
        v35 = (void *)MEMORY[0x1E0CB35C8];
        v36 = *MEMORY[0x1E0CB2F90];
        v50 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("photo library could not provide suggestions"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v37;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "errorWithDomain:code:userInfo:", v36, -18, v38);
        *v40 = (id)objc_claimAutoreleasedReturnValue();

      }
      v31 = 0;
    }
    v15 = v44;
    v14 = v45;
    v17 = v42;
    v16 = v43;
  }
  else
  {
    if (!a8)
    {
      v31 = 0;
      goto LABEL_24;
    }
    v32 = a8;
    v33 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0CB2F90];
    v53 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("could not obtain access to the photo library"));
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v54[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, &v53, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "errorWithDomain:code:userInfo:", v34, -50, v22);
    v31 = 0;
    *v32 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_24:
  return v31;
}

void __165__VCPFaceProcessingServiceWorker__suggestionsForPersonLocalIdentifier_clusterSequenceNumbers_excludePersonLocalIdentifiers_context_cancelOrExtendTimeoutBlock_error___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0
    && (int)MediaAnalysisLogLevel() >= 4
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "could not update key faces for suggestions: %@", (uint8_t *)&v5, 0xCu);
  }

}

+ (float)_similarityScoreThreshold
{
  return 0.75;
}

- (id)_suggestionsForPersonWithLocalIdentifier:(id)a3 toBeConfirmedPersonSuggestions:(id)a4 toBeRejectedPersonSuggestions:(id)a5 cancelOrExtendTimeoutBlock:(id)a6 error:(id *)a7
{
  void *v12;
  void *v13;
  void *v14;
  dispatch_semaphore_t v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  _BOOL4 v28;
  void *v29;
  unsigned int (**v30)(void);
  id v31;
  void *v32;
  void *v33;
  GDVUVisualUnderstandingService *vuService;
  char v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  id v42;
  NSObject *v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t m;
  uint64_t v64;
  void *v65;
  VCPFaceProcessingServiceWorker *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t n;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  NSObject *v78;
  id v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t i;
  void *v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t j;
  void *v89;
  unint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  unint64_t v97;
  void *v98;
  void *v99;
  int v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  id v113;
  void *v114;
  dispatch_semaphore_t v115;
  void *v116;
  void *v117;
  void *v118;
  VCPFaceProcessingServiceWorker *v119;
  id v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t ii;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  id v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t jj;
  void *v132;
  id v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t kk;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  NSObject *v141;
  id v142;
  void *v143;
  VCPFaceProcessingServiceWorker *v144;
  NSObject *v145;
  id v146;
  id v147;
  uint64_t v148;
  uint64_t mm;
  void *v150;
  void *v151;
  id v152;
  void *v153;
  void *v154;
  id v155;
  void *v156;
  void *v157;
  id v158;
  void *v159;
  void *v160;
  void *v161;
  id *context;
  void *contexta;
  void *contextb;
  id v165;
  void *v166;
  id v167;
  id v168;
  id v169;
  unsigned int (**v170)(void);
  VCPFaceProcessingServiceWorker *v171;
  void *v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  uint8_t v177[16];
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
  __int128 v189;
  _QWORD v190[4];
  NSObject *v191;
  _BYTE *v192;
  uint64_t *v193;
  uint64_t v194;
  uint64_t *v195;
  uint64_t v196;
  uint64_t (*v197)(uint64_t, uint64_t);
  void (*v198)(uint64_t);
  id v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  id v220;
  _QWORD aBlock[5];
  id v222;
  unsigned int (**v223)(void);
  _QWORD v224[4];
  NSObject *v225;
  _BYTE v226[128];
  uint64_t v227;
  void *v228;
  _BYTE v229[128];
  _BYTE v230[128];
  uint64_t v231;
  void *v232;
  _BYTE v233[128];
  uint64_t v234;
  void *v235;
  _BYTE buf[24];
  uint64_t (*v237)(uint64_t, uint64_t);
  void (*v238)(uint64_t);
  id v239;
  _BYTE v240[128];
  _BYTE v241[128];
  uint64_t v242;
  void *v243;
  _BYTE v244[128];
  _BYTE v245[128];
  _BYTE v246[128];
  uint64_t v247;
  void *v248;
  uint64_t v249;
  void *v250;
  uint64_t v251;
  void *v252;
  uint64_t v253;
  _QWORD v254[4];

  v254[1] = *MEMORY[0x1E0C80C00];
  v169 = a3;
  v168 = a4;
  v167 = a5;
  v170 = (unsigned int (**)(void))a6;
  v171 = self;
  if (v170[2]())
  {
    if (a7)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v253 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_suggestionsForPersonWithLocalIdentifier cancelled"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v254[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v254, &v253, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -128, v14);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (self->_suggestionLoggingSessionOpen)
      -[VCPFaceProcessingServiceWorker _closeSuggestionsLoggingSession](self, "_closeSuggestionsLoggingSession");
LABEL_21:
    v22 = 0;
    goto LABEL_34;
  }
  context = a7;
  if (-[PHPhotoLibrary mad_useVUGallery](self->_photoLibrary, "mad_useVUGallery"))
  {
LABEL_9:
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v17 = MEMORY[0x1E0C81028];
      v18 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "suggestions first phase query start", buf, 2u);
      }

    }
    if (self->_suggestionsLoggingEnabled)
    {
      -[VCPFaceProcessingServiceWorker _openSuggestionsLoggingSession](self, "_openSuggestionsLoggingSession");
      if (self->_suggestionLoggingSessionOpen)
        -[VCPFaceProcessingServiceWorker _appendToSuggestionsLog:](self, "_appendToSuggestionsLog:", CFSTR("<html>\n<head>\n<script>\n var inputFaces = [\n"));
    }
    if (v170[2]())
    {
      if (a7)
      {
        v19 = (void *)MEMORY[0x1E0CB35C8];
        v251 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_suggestionsForPersonWithLocalIdentifier cancelled"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v252 = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v252, &v251, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -128, v21);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (self->_suggestionLoggingSessionOpen)
        -[VCPFaceProcessingServiceWorker _closeSuggestionsLoggingSession](self, "_closeSuggestionsLoggingSession");
      goto LABEL_21;
    }
    v161 = (void *)objc_msgSend((id)objc_opt_class(), "newAllPersonsWithAtLeastOneFaceFetchOptionsWithPhotoLibrary:", self->_photoLibrary);
    objc_msgSend(v161, "setMinimumUnverifiedFaceCount:", 1);
    objc_msgSend(v161, "setMinimumVerifiedFaceCount:", 1);
    -[VCPPhotosPersistenceDelegate fetchPersonWithLocalIdentifier:options:error:](self->_persistenceDelegate, "fetchPersonWithLocalIdentifier:options:error:", v169, v161, a7);
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v160)
      goto LABEL_28;
    if (v170[2]())
    {
      if (a7)
      {
        v23 = (void *)MEMORY[0x1E0CB35C8];
        v249 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_suggestionsForPersonWithLocalIdentifier cancelled"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v250 = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v250, &v249, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -128, v25);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (self->_suggestionLoggingSessionOpen)
        -[VCPFaceProcessingServiceWorker _closeSuggestionsLoggingSession](self, "_closeSuggestionsLoggingSession");
LABEL_28:
      v22 = 0;
LABEL_29:

      goto LABEL_34;
    }
    if (-[PHPhotoLibrary mad_useVUGallery](self->_photoLibrary, "mad_useVUGallery"))
    {
      objc_msgSend(v160, "mdID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27 == 0;

      if (v28)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v160, "localIdentifier");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v75;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PersonSuggestionVU] Person %@ does not have mdID", buf, 0xCu);

        }
        goto LABEL_28;
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __169__VCPFaceProcessingServiceWorker__suggestionsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_cancelOrExtendTimeoutBlock_error___block_invoke_271;
      aBlock[3] = &unk_1E6B194E0;
      aBlock[4] = self;
      v158 = v29;
      v222 = v158;
      v30 = v170;
      v223 = v30;
      v157 = _Block_copy(aBlock);
      v31 = objc_alloc((Class)getGDEntityIdentifierClass());
      objc_msgSend(v160, "mdID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v156 = (void *)objc_msgSend(v31, "initWithString:", v32);

      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v160, "localIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v33;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PersonSuggestionVU] Retrieving similar entities to %@", buf, 0xCu);

      }
      vuService = self->_vuService;
      v220 = 0;
      v35 = -[GDVUVisualUnderstandingService similarEntitiesTo:error:body:](vuService, "similarEntitiesTo:error:body:", v156, &v220, v157);
      v155 = v220;
      v36 = MediaAnalysisLogLevel();
      if ((v35 & 1) != 0)
      {
        if (v36 >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          v37 = objc_msgSend(v158, "count");
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v37;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PersonSuggestionVU] Retrieved %lu similar entitiy(ies)", buf, 0xCu);
        }
        if (!((unsigned int (*)(unsigned int (**)(void)))v170[2])(v30))
        {
          if (objc_msgSend(v158, "count"))
          {
            v79 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            v218 = 0u;
            v219 = 0u;
            v216 = 0u;
            v217 = 0u;
            v80 = v168;
            v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v216, v246, 16);
            if (v81)
            {
              v82 = *(_QWORD *)v217;
              do
              {
                for (i = 0; i != v81; ++i)
                {
                  if (*(_QWORD *)v217 != v82)
                    objc_enumerationMutation(v80);
                  objc_msgSend(*(id *)(*((_QWORD *)&v216 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("personIdentifier"));
                  v84 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v84)
                    objc_msgSend(v79, "addObject:", v84);

                }
                v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v216, v246, 16);
              }
              while (v81);
            }

            v214 = 0u;
            v215 = 0u;
            v212 = 0u;
            v213 = 0u;
            v85 = v167;
            v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v212, v245, 16);
            if (v86)
            {
              v87 = *(_QWORD *)v213;
              do
              {
                for (j = 0; j != v86; ++j)
                {
                  if (*(_QWORD *)v213 != v87)
                    objc_enumerationMutation(v85);
                  objc_msgSend(*(id *)(*((_QWORD *)&v212 + 1) + 8 * j), "objectForKeyedSubscript:", CFSTR("personIdentifier"));
                  v89 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v89)
                    objc_msgSend(v79, "addObject:", v89);

                }
                v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v212, v245, 16);
              }
              while (v86);
            }

            -[PHPhotoLibrary mad_allFacesFetchOptions](v171->_photoLibrary, "mad_allFacesFetchOptions");
            v153 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CD1520], "fetchRejectedFacesForPerson:options:", v160, v153);
            v166 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v166, "count"))
            {
              v90 = 0;
              do
              {
                v91 = (void *)MEMORY[0x1BCCA1B2C]();
                objc_msgSend(v166, "objectAtIndexedSubscript:", v90);
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v92, "personLocalIdentifier");
                v93 = (void *)objc_claimAutoreleasedReturnValue();

                if (v93)
                  objc_msgSend(v79, "addObject:", v93);

                objc_autoreleasePoolPop(v91);
                ++v90;
              }
              while (v90 < objc_msgSend(v166, "count"));
            }
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[PHPhotoLibrary mad_allPersonsFetchOptions](v171->_photoLibrary, "mad_allPersonsFetchOptions");
            v154 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("verifiedType = %@"), &unk_1E6B74378);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v154, "setInternalPredicate:", v94);

            v95 = (void *)MEMORY[0x1E0CD16C8];
            objc_msgSend(v158, "allKeys");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "fetchPersonsWithMdIDs:options:", v96, v154);
            v172 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v172, "count"))
            {
              v97 = 0;
              do
              {
                contexta = (void *)MEMORY[0x1BCCA1B2C]();
                objc_msgSend(v172, "objectAtIndexedSubscript:", v97);
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v98, "localIdentifier");
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                v100 = objc_msgSend(v79, "containsObject:", v99);

                if (v100)
                {
                  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend(v98, "localIdentifier");
                    v101 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)&buf[4] = v101;
                    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PersonSuggestionVU] Ignoring person %@ from the exclusion list", buf, 0xCu);

                  }
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CD1520], "fetchKeyFaceForPerson:options:", v98, 0);
                  v102 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v102, "firstObject");
                  v103 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v103)
                  {
                    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                    v104 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v98, "localIdentifier");
                    v105 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v104, "setObject:forKeyedSubscript:", v105, CFSTR("personIdentifier"));

                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v98, "faceCount"));
                    v106 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v104, "setObject:forKeyedSubscript:", v106, CFSTR("personFaceCount"));

                    objc_msgSend(v104, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("confirmed"));
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v103, "vuObservationID"));
                    v107 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v104, "setObject:forKeyedSubscript:", v107, CFSTR("faceCSN"));

                    objc_msgSend(v103, "localIdentifier");
                    v108 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v104, "setObject:forKeyedSubscript:", v108, CFSTR("faceIdentifier"));

                    objc_msgSend(v98, "mdID");
                    v109 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v158, "objectForKeyedSubscript:", v109);
                    v110 = objc_claimAutoreleasedReturnValue();
                    v111 = (void *)v110;
                    v112 = &unk_1E6B74390;
                    if (v110)
                      v112 = (void *)v110;
                    v113 = v112;

                    objc_msgSend(v104, "setObject:forKeyedSubscript:", v113, CFSTR("similarityScore"));
                    objc_msgSend(v22, "addObject:", v104);
                    if ((int)MediaAnalysisLogLevel() >= 7
                      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(_QWORD *)&buf[4] = v104;
                      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PersonSuggestionVU] Adding suggestion %@", buf, 0xCu);
                    }

                  }
                  else if ((int)MediaAnalysisLogLevel() >= 7
                         && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend(v98, "localIdentifier");
                    v114 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)&buf[4] = v114;
                    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PersonSuggestionVU] Ignoring person %@ without keyface", buf, 0xCu);

                  }
                }

                objc_autoreleasePoolPop(contexta);
                ++v97;
              }
              while (v97 < objc_msgSend(v172, "count"));
            }
            objc_msgSend(v22, "sortUsingComparator:", &__block_literal_global_286);

          }
          else
          {
            v22 = (void *)MEMORY[0x1E0C9AA60];
          }
          goto LABEL_112;
        }
        if (a7)
        {
          v38 = (void *)MEMORY[0x1E0CB35C8];
          v247 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_suggestionsForPersonWithLocalIdentifier cancelled"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v248 = v39;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v248, &v247, 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -128, v40);
          *a7 = (id)objc_claimAutoreleasedReturnValue();

        }
        if (self->_suggestionLoggingSessionOpen)
          -[VCPFaceProcessingServiceWorker _closeSuggestionsLoggingSession](self, "_closeSuggestionsLoggingSession");
      }
      else if (v36 >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v160, "localIdentifier");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v76;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v155;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PersonSuggestionVU] Failed to retrieve similar entities to %@ - %@", buf, 0x16u);

      }
      v22 = 0;
LABEL_112:

      goto LABEL_29;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v41 = MEMORY[0x1E0C81028];
      v42 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "suggestions first phase query end", buf, 2u);
      }

    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v43 = MEMORY[0x1E0C81028];
      v44 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "suggestions middle phase query start (includes face groups for person query)", buf, 2u);
      }

    }
    v45 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v165 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[PHPhotoLibrary faceClusterSequenceNumbersOfKeyFacesInAlgorithmicFaceGroupsForPerson:verifiedClusterSequenceNumbers:](self->_photoLibrary, "faceClusterSequenceNumbersOfKeyFacesInAlgorithmicFaceGroupsForPerson:verifiedClusterSequenceNumbers:", v160, v45);
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v160, "verifiedType") == 1 || objc_msgSend(v160, "verifiedType") == 2)
      objc_msgSend(v45, "unionSet:", v159);
    if (objc_msgSend(v168, "count"))
    {
      v46 = (void *)objc_msgSend(v159, "mutableCopy");
      v210 = 0u;
      v211 = 0u;
      v208 = 0u;
      v209 = 0u;
      v47 = v168;
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v208, v244, 16);
      if (v48)
      {
        v49 = *(_QWORD *)v209;
        do
        {
          for (k = 0; k != v48; ++k)
          {
            if (*(_QWORD *)v209 != v49)
              objc_enumerationMutation(v47);
            objc_msgSend(*(id *)(*((_QWORD *)&v208 + 1) + 8 * k), "objectForKeyedSubscript:", CFSTR("faceCSN"));
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (v51)
            {
              objc_msgSend(v45, "addObject:", v51);
              objc_msgSend(v46, "addObject:", v51);
            }

          }
          v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v208, v244, 16);
        }
        while (v48);
      }

      v52 = objc_msgSend(v46, "copy");
      v159 = (void *)v52;
    }
    if (v170[2]())
    {
      if (context)
      {
        v53 = (void *)MEMORY[0x1E0CB35C8];
        v242 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_suggestionsForPersonWithLocalIdentifier cancelled"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v243 = v54;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v243, &v242, 1);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -128, v55);
        *context = (id)objc_claimAutoreleasedReturnValue();

      }
      if (v171->_suggestionLoggingSessionOpen)
        -[VCPFaceProcessingServiceWorker _closeSuggestionsLoggingSession](v171, "_closeSuggestionsLoggingSession");
      v22 = 0;
      goto LABEL_210;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v56 = MEMORY[0x1E0C81028];
      v57 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "suggestions middle phase query end", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v159, "count"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v159, "count"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v206 = 0u;
    v207 = 0u;
    v204 = 0u;
    v205 = 0u;
    v60 = v159;
    v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v204, v241, 16);
    if (v61)
    {
      v62 = *(_QWORD *)v205;
      do
      {
        for (m = 0; m != v61; ++m)
        {
          if (*(_QWORD *)v205 != v62)
            objc_enumerationMutation(v60);
          v64 = *(_QWORD *)(*((_QWORD *)&v204 + 1) + 8 * m);
          objc_msgSend(v59, "addObject:", v64);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v45, "containsObject:", v64) ^ 1);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "addObject:", v65);

        }
        v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v204, v241, 16);
      }
      while (v61);
    }

    v66 = v171;
    if (v171->_suggestionLoggingSessionOpen)
    {
      v202 = 0u;
      v203 = 0u;
      v200 = 0u;
      v201 = 0u;
      v67 = v45;
      v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v200, v240, 16);
      if (v68)
      {
        v69 = *(_QWORD *)v201;
        do
        {
          for (n = 0; n != v68; ++n)
          {
            if (*(_QWORD *)v201 != v69)
              objc_enumerationMutation(v67);
            -[VCPPhotosPersistenceDelegate fetchFaceWithClusterSequenceNumber:error:](v171->_persistenceDelegate, "fetchFaceWithClusterSequenceNumber:error:", *(_QWORD *)(*((_QWORD *)&v200 + 1) + 8 * n), 0);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            if (v71)
              -[VCPFaceProcessingServiceWorker _logFaceToSuggestionsLog:](v171, "_logFaceToSuggestionsLog:", v71);

          }
          v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v200, v240, 16);
        }
        while (v68);
      }

      v66 = v171;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v237 = __Block_byref_object_copy__28;
    v238 = __Block_byref_object_dispose__28;
    v239 = 0;
    v194 = 0;
    v195 = &v194;
    v196 = 0x3032000000;
    v197 = __Block_byref_object_copy__28;
    v198 = __Block_byref_object_dispose__28;
    v199 = 0;
    if (objc_msgSend(v59, "count"))
    {
      if (v170[2]())
      {
        if (context)
        {
          v72 = (void *)MEMORY[0x1E0CB35C8];
          v234 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_suggestionsForPersonWithLocalIdentifier cancelled"));
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v235 = v73;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v235, &v234, 1);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -128, v74);
          *context = (id)objc_claimAutoreleasedReturnValue();

          v66 = v171;
        }
        if (v66->_suggestionLoggingSessionOpen)
          -[VCPFaceProcessingServiceWorker _closeSuggestionsLoggingSession](v66, "_closeSuggestionsLoggingSession");
        goto LABEL_208;
      }
      v115 = dispatch_semaphore_create(0);
      v190[0] = MEMORY[0x1E0C809B0];
      v190[1] = 3221225472;
      v190[2] = __169__VCPFaceProcessingServiceWorker__suggestionsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_cancelOrExtendTimeoutBlock_error___block_invoke_287;
      v190[3] = &unk_1E6B19528;
      v192 = buf;
      v193 = &v194;
      v78 = v115;
      v191 = v78;
      v116 = _Block_copy(v190);
      -[VCPClusterer requestSuggestionsForFaceClusterSequenceNumbers:withClusteringFlags:updateHandler:error:](v171->_clusterer, "requestSuggestionsForFaceClusterSequenceNumbers:withClusteringFlags:updateHandler:error:", v59, v58, v116, context);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v117)
      {

        goto LABEL_208;
      }
      dispatch_semaphore_wait(v78, 0xFFFFFFFFFFFFFFFFLL);

    }
    else
    {
      objc_msgSend(v60, "allObjects");
      v77 = objc_claimAutoreleasedReturnValue();
      v78 = *(NSObject **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v77;
    }

    v118 = *(void **)(*(_QWORD *)&buf[8] + 40);
    v119 = v171;
    if (v118)
    {
      if (v171->_suggestionLoggingSessionOpen)
      {
        -[VCPFaceProcessingServiceWorker _appendToSuggestionsLog:](v171, "_appendToSuggestionsLog:", CFSTR("];\n\nvar outputFaces = [\n"));
        v188 = 0u;
        v189 = 0u;
        v186 = 0u;
        v187 = 0u;
        v120 = *(id *)(*(_QWORD *)&buf[8] + 40);
        v121 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v186, v233, 16);
        if (v121)
        {
          v122 = *(_QWORD *)v187;
          do
          {
            for (ii = 0; ii != v121; ++ii)
            {
              if (*(_QWORD *)v187 != v122)
                objc_enumerationMutation(v120);
              -[VCPPhotosPersistenceDelegate fetchFaceWithClusterSequenceNumber:error:](v119->_persistenceDelegate, "fetchFaceWithClusterSequenceNumber:error:", *(_QWORD *)(*((_QWORD *)&v186 + 1) + 8 * ii), 0);
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              if (v124)
                -[VCPFaceProcessingServiceWorker _logFaceToSuggestionsLog:](v119, "_logFaceToSuggestionsLog:", v124);

              v119 = v171;
            }
            v121 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v186, v233, 16);
          }
          while (v121);
        }

        v118 = *(void **)(*(_QWORD *)&buf[8] + 40);
        v119 = v171;
      }
      if (!objc_msgSend(v118, "count"))
      {
        if (v119->_suggestionLoggingSessionOpen)
          -[VCPFaceProcessingServiceWorker _closeSuggestionsLoggingSession](v119, "_closeSuggestionsLoggingSession");
        objc_msgSend(MEMORY[0x1E0C99D20], "array");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_209;
      }
      if (v170[2]())
      {
        if (!context)
          goto LABEL_206;
        v125 = (void *)MEMORY[0x1E0CB35C8];
        v231 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_suggestionsForPersonWithLocalIdentifier cancelled"));
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        v232 = v126;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v232, &v231, 1);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -128, v127);
        *context = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v184 = 0u;
        v185 = 0u;
        v182 = 0u;
        v183 = 0u;
        v128 = v168;
        v129 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v182, v230, 16);
        if (v129)
        {
          v130 = *(_QWORD *)v183;
          do
          {
            for (jj = 0; jj != v129; ++jj)
            {
              if (*(_QWORD *)v183 != v130)
                objc_enumerationMutation(v128);
              objc_msgSend(*(id *)(*((_QWORD *)&v182 + 1) + 8 * jj), "objectForKeyedSubscript:", CFSTR("personIdentifier"));
              v132 = (void *)objc_claimAutoreleasedReturnValue();
              if (v132)
                objc_msgSend(v165, "addObject:", v132);

            }
            v129 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v182, v230, 16);
          }
          while (v129);
        }

        v180 = 0u;
        v181 = 0u;
        v178 = 0u;
        v179 = 0u;
        v133 = v167;
        v134 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v178, v229, 16);
        if (v134)
        {
          v135 = *(_QWORD *)v179;
          do
          {
            for (kk = 0; kk != v134; ++kk)
            {
              if (*(_QWORD *)v179 != v135)
                objc_enumerationMutation(v133);
              objc_msgSend(*(id *)(*((_QWORD *)&v178 + 1) + 8 * kk), "objectForKeyedSubscript:", CFSTR("personIdentifier"));
              v137 = (void *)objc_claimAutoreleasedReturnValue();
              if (v137)
                objc_msgSend(v165, "addObject:", v137);

            }
            v134 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v178, v229, 16);
          }
          while (v134);
        }

        v119 = v171;
        if (!v170[2]())
        {
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v141 = MEMORY[0x1E0C81028];
            v142 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(v141, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)v177 = 0;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "suggestions last phase query start", v177, 2u);
            }

            v119 = v171;
          }
          -[VCPFaceProcessingServiceWorker _suggestionsForPersonLocalIdentifier:clusterSequenceNumbers:excludePersonLocalIdentifiers:context:cancelOrExtendTimeoutBlock:error:](v119, "_suggestionsForPersonLocalIdentifier:clusterSequenceNumbers:excludePersonLocalIdentifiers:context:cancelOrExtendTimeoutBlock:error:", v169, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v165, v119->_context, v170, context);
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_msgSend(v143, "mutableCopy");

          v144 = v171;
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v145 = MEMORY[0x1E0C81028];
            v146 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(v145, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)v177 = 0;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "suggestions last phase query end", v177, 2u);
            }

            v144 = v171;
          }
          if (v22)
          {
            if ((_personSuggestionsAreAllSingletons(v22) & 1) == 0)
              _removeAllSingletonPersonSuggestionsInArray(v22);
            if (v144->_suggestionLoggingSessionOpen)
            {
              -[VCPFaceProcessingServiceWorker _appendToSuggestionsLog:](v144, "_appendToSuggestionsLog:", CFSTR("];\n\nvar filteredFaces = [\n"));
              v175 = 0u;
              v176 = 0u;
              v173 = 0u;
              v174 = 0u;
              v147 = v22;
              v148 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v173, v226, 16);
              if (v148)
              {
                contextb = *(void **)v174;
                do
                {
                  for (mm = 0; mm != v148; ++mm)
                  {
                    if (*(void **)v174 != contextb)
                      objc_enumerationMutation(v147);
                    objc_msgSend(*(id *)(*((_QWORD *)&v173 + 1) + 8 * mm), "objectForKeyedSubscript:", CFSTR("faceIdentifier"));
                    v150 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v150)
                    {
                      -[VCPPhotosPersistenceDelegate fetchFaceWithLocalIdentifier:error:](v171->_persistenceDelegate, "fetchFaceWithLocalIdentifier:error:", v150, 0);
                      v151 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v151)
                        -[VCPFaceProcessingServiceWorker _logFaceToSuggestionsLog:](v171, "_logFaceToSuggestionsLog:", v151);

                    }
                  }
                  v148 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v173, v226, 16);
                }
                while (v148);
              }

              -[VCPFaceProcessingServiceWorker _finalizeSuggestionsLog](v171, "_finalizeSuggestionsLog");
              -[VCPFaceProcessingServiceWorker _closeSuggestionsLoggingSession](v171, "_closeSuggestionsLoggingSession");
            }
            v152 = v22;
          }

          goto LABEL_209;
        }
        if (!context)
          goto LABEL_206;
        v138 = (void *)MEMORY[0x1E0CB35C8];
        v227 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_suggestionsForPersonWithLocalIdentifier cancelled"));
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        v228 = v139;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v228, &v227, 1);
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -128, v140);
        *context = (id)objc_claimAutoreleasedReturnValue();

      }
      v119 = v171;
LABEL_206:
      if (v119->_suggestionLoggingSessionOpen)
        -[VCPFaceProcessingServiceWorker _closeSuggestionsLoggingSession](v119, "_closeSuggestionsLoggingSession");
      goto LABEL_208;
    }
    if (v171->_suggestionLoggingSessionOpen)
      -[VCPFaceProcessingServiceWorker _closeSuggestionsLoggingSession](v171, "_closeSuggestionsLoggingSession");
    if (context)
    {
      v22 = 0;
      *context = objc_retainAutorelease((id)v195[5]);
LABEL_209:
      _Block_object_dispose(&v194, 8);

      _Block_object_dispose(buf, 8);
LABEL_210:

      goto LABEL_29;
    }
LABEL_208:
    v22 = 0;
    goto LABEL_209;
  }
  v15 = dispatch_semaphore_create(0);
  v224[0] = MEMORY[0x1E0C809B0];
  v224[1] = 3221225472;
  v224[2] = __169__VCPFaceProcessingServiceWorker__suggestionsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_cancelOrExtendTimeoutBlock_error___block_invoke;
  v224[3] = &unk_1E6B194B8;
  v16 = v15;
  v225 = v16;
  -[VCPFaceProcessingServiceWorker _startAndSyncClusterCacheWithLibrary:reply:](self, "_startAndSyncClusterCacheWithLibrary:reply:", 1, v224);
  dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  if (-[VCPClusterer isReadyToReturnSuggestions](self->_clusterer, "isReadyToReturnSuggestions"))
  {

    goto LABEL_9;
  }
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Returning no suggestions because the clusterer is working", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_34:
  return v22;
}

void __169__VCPFaceProcessingServiceWorker__suggestionsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_cancelOrExtendTimeoutBlock_error___block_invoke(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v3 = 134217984;
    v4 = a2;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Loaded clustererState: %ld", (uint8_t *)&v3, 0xCu);
  }
}

uint64_t __169__VCPFaceProcessingServiceWorker__suggestionsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_cancelOrExtendTimeoutBlock_error___block_invoke_271(uint64_t a1, void *a2, double a3)
{
  id v5;
  float v6;
  double v7;
  int v8;
  void *v9;
  float v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v18;
  void *v19;
  __int16 v20;
  double v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend((id)objc_opt_class(), "_similarityScoreThreshold");
  v7 = v6;
  v8 = MediaAnalysisLogLevel();
  if (v7 <= a3)
  {
    if (v8 >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v5, "stringValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v11;
      v20 = 2048;
      v21 = a3;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PersonSuggestionVU] Receiving person %@ (similarityScore: %.3f)", (uint8_t *)&v18, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 40);
    objc_msgSend(v5, "stringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

  }
  else if (v8 >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_similarityScoreThreshold");
    v18 = 138412802;
    v19 = v9;
    v20 = 2048;
    v21 = a3;
    v22 = 2048;
    v23 = v10;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PersonSuggestionVU] Ignoring person %@ (similarityScore: %.3f < %.3f)", (uint8_t *)&v18, 0x20u);

  }
  v15 = *(_QWORD *)(a1 + 48);
  if (v15)
    v16 = (*(unsigned int (**)(void))(v15 + 16))() ^ 1;
  else
    v16 = 1;

  return v16;
}

uint64_t __169__VCPFaceProcessingServiceWorker__suggestionsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_cancelOrExtendTimeoutBlock_error___block_invoke_284(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("personFaceCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("personFaceCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "integerValue");
  if (v6 > v8)
    return -1;
  else
    return v6 < v8;
}

void __169__VCPFaceProcessingServiceWorker__suggestionsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_cancelOrExtendTimeoutBlock_error___block_invoke_287(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  __CFString *v14;

  v14 = a2;
  v7 = a3;
  v8 = a4;
  if (CFSTR("VCPSuggestionUpdateFinished") == v14)
  {
    if (v7)
    {
      v9 = objc_msgSend(v7, "copy");
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;
    }
    else
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v13 = v8;
      v11 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v13;
    }

    goto LABEL_8;
  }
  if (CFSTR("VCPSuggestionUpdateCancelled") == v14)
LABEL_8:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)suggestPersonsForPersonWithLocalIdentifier:(id)a3 toBeConfirmedPersonSuggestions:(id)a4 toBeRejectedPersonSuggestions:(id)a5 context:(id)a6 cancelOrExtendTimeoutBlock:(id)a7 reply:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  unsigned int (**v18)(_QWORD);
  void (**v19)(id, _QWORD, void *);
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = (unsigned int (**)(_QWORD))a7;
  v19 = (void (**)(id, _QWORD, void *))a8;
  if (v18 && v18[2](v18))
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = v17;
    v22 = *MEMORY[0x1E0CB2F90];
    v44 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("suggestPersonsForPersonWithLocalIdentifier cancelled"));
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v45[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v22;
    v17 = v21;
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", v25, -128, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2](v19, 0, v26);

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v39 = (uint64_t)v14;
      v40 = 2112;
      v41 = v15;
      v42 = 2112;
      v43 = v16;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Querying suggestions for person %@ (Photos: %@ to-be-confirmed, %@ to-be-rejected suggestions)", buf, 0x20u);
    }
    v35 = 0;
    -[VCPFaceProcessingServiceWorker _suggestionsForPersonWithLocalIdentifier:toBeConfirmedPersonSuggestions:toBeRejectedPersonSuggestions:cancelOrExtendTimeoutBlock:error:](self, "_suggestionsForPersonWithLocalIdentifier:toBeConfirmedPersonSuggestions:toBeRejectedPersonSuggestions:cancelOrExtendTimeoutBlock:error:", v14, v15, v16, v18, &v35);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v35;
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v27 = objc_msgSend(v24, "count");
      *(_DWORD *)buf = 134218242;
      v39 = v27;
      v40 = 2112;
      v41 = v14;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Returning %lu suggestions for person %@", buf, 0x16u);
    }
    if (v18 && v18[2](v18))
    {
      v33 = (void *)MEMORY[0x1E0CB35C8];
      v34 = v17;
      v28 = *MEMORY[0x1E0CB2F90];
      v36 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("suggestPersonsForPersonWithLocalIdentifier cancelled"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", v28, -128, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v19[2](v19, 0, v31);

      v17 = v34;
    }
    else
    {
      if (v24)
        v32 = 0;
      else
        v32 = v23;
      ((void (**)(id, void *, void *))v19)[2](v19, v24, v32);
    }
  }

}

- (void)faceCandidatesforKeyFaceForPersonsWithLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  dispatch_semaphore_t v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void (**v38)(id, _QWORD, void *);
  id v39;
  id v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  NSObject *v47;
  _BYTE v48[128];
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint8_t buf[4];
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v12 = (void *)objc_msgSend((id)objc_opt_class(), "newAllPersonsWithAtLeastOneFaceFetchOptionsWithPhotoLibrary:", self->_photoLibrary);
    objc_msgSend(MEMORY[0x1E0CD16C8], "fetchPersonsWithLocalIdentifiers:options:", v8, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fetchedObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v14;
    if (objc_msgSend(v14, "count"))
    {
      v36 = v13;
      v37 = v12;
      v38 = v10;
      v39 = v9;
      v40 = v8;
      v15 = dispatch_semaphore_create(0);
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __103__VCPFaceProcessingServiceWorker_faceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_context_reply___block_invoke;
      v46[3] = &unk_1E6B194B8;
      v16 = v15;
      v47 = v16;
      -[VCPFaceProcessingServiceWorker _startAndSyncClusterCacheWithLibrary:reply:](self, "_startAndSyncClusterCacheWithLibrary:reply:", 1, v46);
      v35 = v16;
      dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v17 = v14;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v43;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v43 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v21);
            v23 = (void *)MEMORY[0x1BCCA1B2C]();
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v24);
            v25 = -[VCPPhotosPersistenceDelegate bestRepresentativeFaceForPerson:qualityMeasureByFace:candidateFaces:cancelOrExtendTimeoutBlock:](self->_persistenceDelegate, "bestRepresentativeFaceForPerson:qualityMeasureByFace:candidateFaces:cancelOrExtendTimeoutBlock:", v22, 0, v24, &__block_literal_global_300_0);

            objc_autoreleasePoolPop(v23);
            ++v21;
          }
          while (v19 != v21);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
        }
        while (v19);
      }

      v10 = v38;
      ((void (**)(id, void *, void *))v38)[2](v38, v11, 0);

      v26 = 0;
      v9 = v39;
      v8 = v40;
      v13 = v36;
      v12 = v37;
    }
    else
    {
      v31 = (void *)MEMORY[0x1E0CB35C8];
      v32 = *MEMORY[0x1E0CB2F90];
      v49 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to find persons with local identifiers: '%@'"), v8);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v33;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "errorWithDomain:code:userInfo:", v32, -18, v34);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v10[2](v10, 0, v26);
    }

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v8;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Input parameter is empty or nil: '%@'", buf, 0xCu);
    }
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB2F90];
    v51 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Input parameter is empty or nil: '%@'"), v8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, -50, v30);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v10[2](v10, 0, v26);
  }

}

void __103__VCPFaceProcessingServiceWorker_faceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_context_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v3 = 134217984;
    v4 = a2;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Loaded clustererState: %ld", (uint8_t *)&v3, 0xCu);
  }
}

uint64_t __103__VCPFaceProcessingServiceWorker_faceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_context_reply___block_invoke_299()
{
  return 0;
}

- (void)resetPersonsModelWithReply:(id)a3
{
  void (**v4)(id, uint64_t, void *);
  PHPhotoLibrary *photoLibrary;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, void *))a3;
  photoLibrary = self->_photoLibrary;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary vcp_setAnalysisPreferencesValue:forKey:](photoLibrary, "vcp_setAnalysisPreferencesValue:forKey:", v6, CFSTR("FaceIDModelLastGenerationKey"));

  -[PHPhotoLibrary vcp_vipModelFilepathForVIPType:](self->_photoLibrary, "vcp_vipModelFilepathForVIPType:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v9 = objc_msgSend(v8, "removeItemAtPath:error:", v7, &v15);
  v10 = v15;
  v11 = v10;
  if ((v9 & 1) != 0)
    goto LABEL_5;
  if (objc_msgSend(v10, "code") == 4)
  {
    objc_msgSend(v11, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

    if (v13)
    {

      v11 = 0;
LABEL_5:
      v14 = 1;
      goto LABEL_10;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v7;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Persons Model: Failed to remove model at %@ - %@", buf, 0x16u);
  }
  v14 = 0;
LABEL_10:
  v4[2](v4, v14, v11);

}

- (void)resetPetsModelWithReply:(id)a3
{
  void (**v4)(id, uint64_t, void *);
  PHPhotoLibrary *photoLibrary;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, void *))a3;
  photoLibrary = self->_photoLibrary;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary vcp_setAnalysisPreferencesValue:forKey:](photoLibrary, "vcp_setAnalysisPreferencesValue:forKey:", v6, CFSTR("PetIDModelLastGenerationKey"));

  v7 = 1;
  -[PHPhotoLibrary vcp_vipModelFilepathForVIPType:](self->_photoLibrary, "vcp_vipModelFilepathForVIPType:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v10 = objc_msgSend(v9, "removeItemAtPath:error:", v8, &v15);
  v11 = v15;
  v12 = v11;
  if ((v10 & 1) == 0)
  {
    if (objc_msgSend(v11, "code") == 4
      && (objc_msgSend(v12, "domain"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB28A8]),
          v13,
          v14))
    {

      v12 = 0;
      v7 = 1;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v17 = v8;
        v18 = 2112;
        v19 = v12;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Pets Model: Failed to remove model at %@ - %@", buf, 0x16u);
      }
      v7 = 0;
    }
  }
  v4[2](v4, v7, v12);

}

- (void)requestSuggestedMePersonIdentifierWithContext:(id)a3 reply:(id)a4
{
  void (**v5)(id, _QWORD, void *);
  PHPhotoLibrary *photoLibrary;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD, void *))a4;
  photoLibrary = self->_photoLibrary;
  if (!photoLibrary)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB2F90];
    v16 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("could not obtain access to the photo library"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, -50, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0, v11);

    photoLibrary = self->_photoLibrary;
  }
  -[PHPhotoLibrary vcp_visionCacheStorageDirectoryURL](photoLibrary, "vcp_visionCacheStorageDirectoryURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0D77EB8], "requestSuggestedMePersonIdentifierAtURL:withError:", v12, &v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v15;
  ((void (**)(id, void *, void *))v5)[2](v5, v13, v14);

}

- (void)personPromoterStatusWithContext:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (!self->_photoLibrary)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2F90];
    v20 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("could not obtain access to the photo library"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, -50, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v12);

  }
  v13 = (void *)objc_opt_new();
  if (objc_msgSend(MEMORY[0x1E0D77EB8], "hasProcessedForLibrary:", self->_photoLibrary))
    v14 = -[VCPPhotosPersistenceDelegate needsPersonBuilding](self->_persistenceDelegate, "needsPersonBuilding") ^ 1;
  else
    v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("status"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("requestAdvancedStatus"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  if (v17)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D77EB8]), "initWithPhotoLibrary:andDelegate:", self->_photoLibrary, self->_persistenceDelegate);
    objc_msgSend(v18, "advancedStatus");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v19, CFSTR("advancedStatus"));

  }
  ((void (**)(id, void *, void *))v7)[2](v7, v13, 0);

}

- (void)validateClusterCacheWithContext:(id)a3 cancelOrExtendTimeoutBlock:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  dispatch_semaphore_t v9;
  uint64_t v10;
  NSObject *v11;
  VCPClusterer *clusterer;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  NSObject *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void (**)(id, _QWORD, void *))a5;
  v9 = dispatch_semaphore_create(0);
  v10 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __99__VCPFaceProcessingServiceWorker_validateClusterCacheWithContext_cancelOrExtendTimeoutBlock_reply___block_invoke;
  v26[3] = &unk_1E6B194B8;
  v11 = v9;
  v27 = v11;
  -[VCPFaceProcessingServiceWorker _startAndSyncClusterCacheWithLibrary:reply:](self, "_startAndSyncClusterCacheWithLibrary:reply:", 0, v26);
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  clusterer = self->_clusterer;
  if (!clusterer)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2F90];
    v28 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPClusterer is nil"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, -18, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v17);

    clusterer = self->_clusterer;
  }
  v24 = 0;
  v25 = 0;
  -[VCPClusterer differencesBetweenClusterCacheAndLibrary:excludedL0ClustersByL1ClusterId:cancelOrExtendTimeoutBlock:](clusterer, "differencesBetweenClusterCacheAndLibrary:excludedL0ClustersByL1ClusterId:cancelOrExtendTimeoutBlock:", &v25, &v24, v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v25;
  v20 = v24;
  if (objc_msgSend(v18, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v22[0] = v10;
    v22[1] = 3221225472;
    v22[2] = __99__VCPFaceProcessingServiceWorker_validateClusterCacheWithContext_cancelOrExtendTimeoutBlock_reply___block_invoke_304;
    v22[3] = &unk_1E6B19598;
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v23 = v21;
    objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v22);

  }
  else
  {
    v21 = 0;
  }
  ((void (**)(id, id, void *))v8)[2](v8, v21, v19);

}

void __99__VCPFaceProcessingServiceWorker_validateClusterCacheWithContext_cancelOrExtendTimeoutBlock_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v3 = 134217984;
    v4 = a2;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Loaded clustererState: %ld", (uint8_t *)&v3, 0xCu);
  }
}

void __99__VCPFaceProcessingServiceWorker_validateClusterCacheWithContext_cancelOrExtendTimeoutBlock_reply___block_invoke_304(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = (void *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __99__VCPFaceProcessingServiceWorker_validateClusterCacheWithContext_cancelOrExtendTimeoutBlock_reply___block_invoke_2;
  v10[3] = &unk_1E6B19570;
  v11 = v8;
  v9 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

}

void __99__VCPFaceProcessingServiceWorker_validateClusterCacheWithContext_cancelOrExtendTimeoutBlock_reply___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "allObjects");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)resetFaceClusteringStateWithContext:(id)a3 reply:(id)a4
{
  void (**v5)(id, _BOOL8, _QWORD);
  dispatch_semaphore_t v6;
  NSObject *v7;
  VCPClusterer *clusterer;
  VCPClusterer *v9;
  void *v10;
  _BOOL8 v11;
  id v12;
  VCPClusterer *v13;
  VCPClusterer *v14;
  VCPClusterer *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  NSObject *v21;

  v5 = (void (**)(id, _BOOL8, _QWORD))a4;
  v6 = dispatch_semaphore_create(0);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __76__VCPFaceProcessingServiceWorker_resetFaceClusteringStateWithContext_reply___block_invoke;
  v20[3] = &unk_1E6B194B8;
  v7 = v6;
  v21 = v7;
  -[VCPFaceProcessingServiceWorker _startAndSyncClusterCacheWithLibrary:reply:](self, "_startAndSyncClusterCacheWithLibrary:reply:", 1, v20);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  clusterer = self->_clusterer;
  if (clusterer)
  {
    -[VCPClusterer terminate](self->_clusterer, "terminate");
    v9 = self->_clusterer;
    self->_clusterer = 0;

  }
  -[PHPhotoLibrary vcp_visionCacheStorageDirectoryURL](self->_photoLibrary, "vcp_visionCacheStorageDirectoryURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v11 = +[VCPClusterer removeClusteringStateCacheWithURL:error:](VCPClusterer, "removeClusteringStateCacheWithURL:error:", v10, &v19);
  v12 = v19;
  if (clusterer)
  {
    v13 = -[VCPClusterer initWithPhotoLibrary:andContext:]([VCPClusterer alloc], "initWithPhotoLibrary:andContext:", self->_photoLibrary, self->_context);
    v14 = self->_clusterer;
    self->_clusterer = v13;

    v15 = self->_clusterer;
    v18 = v12;
    -[VCPClusterer restoreClusterCacheAndSyncWithLibrary:cancelOrExtendTimeoutBlock:error:](v15, "restoreClusterCacheAndSyncWithLibrary:cancelOrExtendTimeoutBlock:error:", 1, &__block_literal_global_308_0, &v18);
    v16 = v18;

    v11 = v16 == 0;
    v12 = v16;
  }
  objc_msgSend(MEMORY[0x1E0D77EB8], "setProcessed:forLibrary:", 0, self->_photoLibrary);
  if (v11)
    v17 = 0;
  else
    v17 = v12;
  ((void (**)(id, _BOOL8, id))v5)[2](v5, v11, v17);

}

void __76__VCPFaceProcessingServiceWorker_resetFaceClusteringStateWithContext_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v3 = 134217984;
    v4 = a2;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Loaded clustererState: %ld", (uint8_t *)&v3, 0xCu);
  }
}

uint64_t __76__VCPFaceProcessingServiceWorker_resetFaceClusteringStateWithContext_reply___block_invoke_307()
{
  return 0;
}

- (BOOL)_deleteAllVerifiedPersonsWithError:(id *)a3
{
  uint64_t v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  PHPhotoLibrary *photoLibrary;
  id v14;
  _BOOL4 v15;
  NSObject *v16;
  NSObject *v17;
  const __CFString *v18;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Person Processing: Starting Deleting Persons", buf, 2u);
  }
  v5 = mach_absolute_time();
  VCPSignPostLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  VCPSignPostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "VCPFaceProcessingDeleteAllVerifiedPersons", ", buf, 2u);
  }

  v10 = (void *)objc_msgSend((id)objc_opt_class(), "newAllPersonsWithAtLeastOneFaceFetchOptionsWithPhotoLibrary:", self->_photoLibrary);
  objc_msgSend(v10, "setMinimumVerifiedFaceCount:", 0);
  objc_msgSend(v10, "setMinimumUnverifiedFaceCount:", 0);
  objc_msgSend(v10, "setIncludeTorsoOnlyPerson:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("verifiedType != %d"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v11);

  objc_msgSend(MEMORY[0x1E0CD16C8], "fetchPersonsWithOptions:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  photoLibrary = self->_photoLibrary;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __69__VCPFaceProcessingServiceWorker__deleteAllVerifiedPersonsWithError___block_invoke;
  v20[3] = &unk_1E6B15440;
  v14 = v12;
  v21 = v14;
  v15 = -[PHPhotoLibrary performChangesAndWait:error:](photoLibrary, "performChangesAndWait:error:", v20, a3);
  VCPSignPostLog();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v17, OS_SIGNPOST_INTERVAL_END, v7, "VCPFaceProcessingDeleteAllVerifiedPersons", ", buf, 2u);
  }

  if (v5)
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v18 = CFSTR("failed");
    if (v15)
      v18 = CFSTR("succeeded");
    *(_DWORD *)buf = 138412290;
    v23 = v18;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Person Processing: Deleting Persons %@", buf, 0xCu);
  }

  return v15;
}

uint64_t __69__VCPFaceProcessingServiceWorker__deleteAllVerifiedPersonsWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CD16D0], "deletePersons:", *(_QWORD *)(a1 + 32));
}

- (void)reclusterFacesWithContext:(id)a3 reply:(id)a4 extendTimeout:(id)a5 cancel:(id)a6
{
  id v10;
  void (**v11)(id, uint64_t, _QWORD);
  void *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_signpost_id_t v23;
  NSObject *v24;
  NSObject *v25;
  VCPFaceClusterer *v26;
  PHPhotoLibrary *photoLibrary;
  VCPPhotosFaceProcessingContext *context;
  id v29;
  VCPFaceClusterer *v30;
  void *v31;
  _BOOL4 v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  const __CFString *v36;
  VCPFaceClusterer *v37;
  uint64_t v38;
  NSObject *v39;
  os_signpost_id_t v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  const __CFString *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void **v51;
  uint64_t *v52;
  uint64_t v53;
  NSObject *v54;
  os_signpost_id_t v55;
  NSObject *v56;
  NSObject *v57;
  uint64_t v58;
  NSObject *v59;
  NSObject *v60;
  const __CFString *v61;
  void *v62;
  uint64_t v63;
  id v64;
  VCPFaceProcessingServiceWorker *v65;
  void *v66;
  void (**v67)(id, uint64_t, _QWORD);
  id v68;
  id v69;
  id v70;
  _QWORD v71[4];
  id v72;
  id v73;
  id v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint8_t buf[4];
  const __CFString *v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(id, uint64_t, _QWORD))a4;
  v69 = a5;
  v68 = a6;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PersonProcessingDeletePersons"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v12, "BOOLValue");

  if ((_DWORD)a5)
  {
    v74 = 0;
    v13 = -[VCPFaceProcessingServiceWorker _deleteAllVerifiedPersonsWithError:](self, "_deleteAllVerifiedPersonsWithError:", &v74);
    v14 = v74;
    v15 = v14;
    if (!v13)
    {
      v16 = 0;
      v17 = v14;
      goto LABEL_68;
    }
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D77EB8], "setProcessed:forLibrary:", 0, self->_photoLibrary);
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLPhotoAnalysisVisionServiceFaceReclusteringThreshold"));
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLPhotoAnalysisVisionServiceFaceReclusteringShouldRecluster"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v19;
  if (v19)
    v20 = objc_msgSend(v19, "BOOLValue");
  else
    v20 = 1;
  v67 = v11;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Person Processing: Starting Face Reclustering", buf, 2u);
  }
  v21 = mach_absolute_time();
  VCPSignPostLog();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = os_signpost_id_generate(v22);

  VCPSignPostLog();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "VCPFaceProcessingReclusterFacesWithThreshold", ", buf, 2u);
  }

  v26 = [VCPFaceClusterer alloc];
  v65 = self;
  photoLibrary = self->_photoLibrary;
  context = self->_context;
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __87__VCPFaceProcessingServiceWorker_reclusterFacesWithContext_reply_extendTimeout_cancel___block_invoke;
  v71[3] = &unk_1E6B195C0;
  v64 = v68;
  v72 = v64;
  v29 = v69;
  v73 = v29;
  v30 = -[VCPFaceClusterer initWithPhotoLibrary:context:cancelOrExtendTimeoutBlock:](v26, "initWithPhotoLibrary:context:cancelOrExtendTimeoutBlock:", photoLibrary, context, v71);
  v70 = v15;
  v31 = (void *)v18;
  v32 = -[VCPFaceClusterer reclusterFacesWithThreshold:shouldRecluster:error:](v30, "reclusterFacesWithThreshold:shouldRecluster:error:", v18, v20, &v70);
  v33 = v70;

  VCPSignPostLog();
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v35, OS_SIGNPOST_INTERVAL_END, v23, "VCPFaceProcessingReclusterFacesWithThreshold", ", buf, 2u);
  }

  if (v21)
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v36 = CFSTR("failed");
    if (v32)
      v36 = CFSTR("succeeded");
    *(_DWORD *)buf = 138412290;
    v80 = v36;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Person Processing: Face Clustering %@", buf, 0xCu);
  }
  if (v32)
  {
    v37 = v30;
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Person Processing: Starting Person Building", buf, 2u);
    }
    v38 = mach_absolute_time();
    VCPSignPostLog();
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = os_signpost_id_generate(v39);

    VCPSignPostLog();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v42, OS_SIGNPOST_INTERVAL_BEGIN, v40, "VCPFaceProcessingBuildPersons", ", buf, 2u);
    }

    v43 = VCPBuildPersons(v65->_photoLibrary, v37, v65->_context, v29, v64);
    VCPSignPostLog();
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = v44;
    if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v45, OS_SIGNPOST_INTERVAL_END, v40, "VCPFaceProcessingBuildPersons", ", buf, 2u);
    }

    if (v38)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v46 = CFSTR("failed");
      if (!(_DWORD)v43)
        v46 = CFSTR("succeeded");
      *(_DWORD *)buf = 138412290;
      v80 = v46;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Person Processing: Person Building %@", buf, 0xCu);
    }
    if ((_DWORD)v43)
    {
      v47 = (void *)MEMORY[0x1E0CB35C8];
      v48 = *MEMORY[0x1E0CB2F90];
      v77 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPBuildPersons failed %d"), v43);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v49;
      v50 = (void *)MEMORY[0x1E0C99D80];
      v51 = &v78;
      v52 = &v77;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Person Processing: Starting Person Promotion", buf, 2u);
      }
      v53 = mach_absolute_time();
      VCPSignPostLog();
      v54 = objc_claimAutoreleasedReturnValue();
      v55 = os_signpost_id_generate(v54);

      VCPSignPostLog();
      v56 = objc_claimAutoreleasedReturnValue();
      v57 = v56;
      if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v57, OS_SIGNPOST_INTERVAL_BEGIN, v55, "VCPFaceProcessingPromotePersons", ", buf, 2u);
      }

      v58 = VCPPromotePersons(v65->_photoLibrary, v29, v64);
      VCPSignPostLog();
      v59 = objc_claimAutoreleasedReturnValue();
      v60 = v59;
      if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v59))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v60, OS_SIGNPOST_INTERVAL_END, v55, "VCPFaceProcessingPromotePersons", ", buf, 2u);
      }

      if (v53)
      {
        mach_absolute_time();
        VCPPerformance_LogMeasurement();
      }
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v61 = CFSTR("failed");
        if (!(_DWORD)v58)
          v61 = CFSTR("succeeded");
        *(_DWORD *)buf = 138412290;
        v80 = v61;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Person Processing: Person Promotion %@", buf, 0xCu);
      }
      if (!(_DWORD)v58)
      {
        v16 = 1;
        objc_msgSend(MEMORY[0x1E0D77EB8], "setProcessed:forLibrary:", 1, v65->_photoLibrary);
        goto LABEL_63;
      }
      v47 = (void *)MEMORY[0x1E0CB35C8];
      v48 = *MEMORY[0x1E0CB2F90];
      v75 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPPromotePersons failed %d"), v58);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = v49;
      v50 = (void *)MEMORY[0x1E0C99D80];
      v51 = &v76;
      v52 = &v75;
    }
    objc_msgSend(v50, "dictionaryWithObjects:forKeys:count:", v51, v52, 1);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "errorWithDomain:code:userInfo:", v48, -18, v62);
    v63 = objc_claimAutoreleasedReturnValue();

    v16 = 0;
    v33 = (id)v63;
LABEL_63:
    v30 = v37;
    goto LABEL_64;
  }
  v16 = 0;
LABEL_64:

  if ((_DWORD)v16)
    v17 = 0;
  else
    v17 = v33;
  v15 = v33;
  v11 = v67;
LABEL_68:
  ((void (**)(id, uint64_t, id))v11)[2](v11, v16, v17);

}

uint64_t __87__VCPFaceProcessingServiceWorker_reclusterFacesWithContext_reply_extendTimeout_cancel___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && ((*(uint64_t (**)(void))(v2 + 16))() & 1) != 0)
    return 1;
  result = *(_QWORD *)(a1 + 40);
  if (result)
  {
    (*(void (**)(void))(result + 16))();
    return 0;
  }
  return result;
}

- (void)rebuildPersonsWithContext:(id)a3 reply:(id)a4 extendTimeout:(id)a5 cancel:(id)a6
{
  void (**v10)(id, _QWORD, id);
  id v11;
  id v12;
  VCPPhotosPersistenceDelegate *persistenceDelegate;
  id v14;
  VCPPhotosFaceProcessingContext *v15;
  uint64_t v16;
  void *v17;
  uint64_t *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  VCPFaceClusterer *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  _QWORD aBlock[4];
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  _QWORD v45[3];

  v45[1] = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v10 = (void (**)(id, _QWORD, id))a4;
  v11 = a5;
  v12 = a6;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__VCPFaceProcessingServiceWorker_rebuildPersonsWithContext_reply_extendTimeout_cancel___block_invoke;
  aBlock[3] = &unk_1E6B195E8;
  v31 = v12;
  v35 = v31;
  v37 = &v38;
  v30 = v11;
  v36 = v30;
  v32 = _Block_copy(aBlock);
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("personLocalIdentifier"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  persistenceDelegate = self->_persistenceDelegate;
  v33 = 0;
  LOBYTE(a6) = -[VCPPhotosPersistenceDelegate removeAutoAssignedFacesFromVerifiedPersonsAndPrepareForPersonBuilding:cancelOrExtendTimeoutBlock:error:](persistenceDelegate, "removeAutoAssignedFacesFromVerifiedPersonsAndPrepareForPersonBuilding:cancelOrExtendTimeoutBlock:error:", v29, v32, &v33);
  v14 = v33;
  if ((a6 & 1) == 0)
    v10[2](v10, 0, v14);
  v15 = -[VCPPhotosFaceProcessingContext initWithPhotoLibrary:]([VCPPhotosFaceProcessingContext alloc], "initWithPhotoLibrary:", self->_photoLibrary);
  v27 = -[VCPFaceClusterer initWithPhotoLibrary:context:cancelOrExtendTimeoutBlock:]([VCPFaceClusterer alloc], "initWithPhotoLibrary:context:cancelOrExtendTimeoutBlock:", self->_photoLibrary, v15, v32);
  v16 = VCPBuildPersons(self->_photoLibrary, v27, v15, v30, v31);
  *((_DWORD *)v39 + 6) = v16;
  if ((_DWORD)v16)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = (uint64_t *)MEMORY[0x1E0CB2D50];
    v44 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to rebuild persons (error: %d)"), v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v10[2](v10, 0, (id)v21);
    v14 = (id)v21;
  }
  else
  {
    v18 = (uint64_t *)MEMORY[0x1E0CB2D50];
  }
  v22 = VCPPromotePersons(self->_photoLibrary, v30, v31);
  *((_DWORD *)v39 + 6) = v22;
  if ((_DWORD)v22)
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v42 = *v18;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to promote persons (error: %d)"), v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v25);
    v26 = objc_claimAutoreleasedReturnValue();

    v10[2](v10, 0, (id)v26);
    v14 = (id)v26;
  }
  v10[2](v10, 1, 0);

  _Block_object_dispose(&v38, 8);
}

uint64_t __87__VCPFaceProcessingServiceWorker_rebuildPersonsWithContext_reply_extendTimeout_cancel___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = a1[4];
  if (v2 && (*(unsigned int (**)(void))(v2 + 16))())
  {
    *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = -128;
    return 1;
  }
  else
  {
    result = a1[5];
    if (result)
    {
      (*(void (**)(void))(result + 16))();
      return 0;
    }
  }
  return result;
}

- (void)resetPersonPromoterStatusWithReply:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  PHPhotoLibrary *photoLibrary;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  photoLibrary = self->_photoLibrary;
  if (!photoLibrary)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0CB2F90];
    v11 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("could not obtain access to the photo library"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, -50, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v10);

    photoLibrary = self->_photoLibrary;
  }
  objc_msgSend(MEMORY[0x1E0D77EB8], "setProcessed:forLibrary:", 0, photoLibrary);
  v4[2](v4, 1, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionLoggingDirectory, 0);
  objc_storeStrong((id *)&self->_vuService, 0);
  objc_storeStrong((id *)&self->_persistenceDelegate, 0);
  objc_storeStrong((id *)&self->_clusterer, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end
