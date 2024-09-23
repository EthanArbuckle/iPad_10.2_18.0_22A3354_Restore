@implementation PHImporter

- (PHImporter)initWithLibrary:(id)a3 options:(id)a4 source:(id)a5 delegate:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  PHImporter *v18;
  PHImporter *v19;
  PHImportOptions *v20;
  PHImportOptions *options;
  uint64_t v22;
  PHImportResults *results;
  uint64_t v24;
  NSString *importSessionID;
  NSObject *v26;
  NSObject *v27;
  dispatch_queue_t v28;
  OS_dispatch_queue *importQueue;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  PLImportFileManager *importFileManager;
  NSMutableDictionary *v45;
  NSMutableDictionary *downloadFolderUrlByImportIdentifier;
  NSMutableArray *v47;
  NSMutableArray *additionalDcimImportFolders;
  NSMutableDictionary *v49;
  NSMutableDictionary *parentFolderMapping;
  NSMutableArray *v51;
  NSMutableArray *downloadedRecords;
  uint64_t v53;
  id completionHandler;
  NSMutableDictionary *v55;
  NSMutableDictionary *containerPathByLocalIdentifier;
  NSMutableDictionary *v57;
  NSMutableDictionary *folderByFolderPath;
  NSMutableDictionary *v59;
  NSMutableDictionary *albumByAlbumPath;
  NSMutableDictionary *v61;
  NSMutableDictionary *albumRequestsByAlbumId;
  NSMutableDictionary *v63;
  NSMutableDictionary *folderRequestByFolderId;
  objc_super v66;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v66.receiver = self;
  v66.super_class = (Class)PHImporter;
  v18 = -[PHImporter init](&v66, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_library, a3);
    if (v14)
      v20 = (PHImportOptions *)v14;
    else
      v20 = objc_alloc_init(PHImportOptions);
    options = v19->_options;
    v19->_options = v20;

    v22 = objc_opt_new();
    results = v19->_results;
    v19->_results = (PHImportResults *)v22;

    objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
    v24 = objc_claimAutoreleasedReturnValue();
    importSessionID = v19->_importSessionID;
    v19->_importSessionID = (NSString *)v24;

    v19->_importState = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v26 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v26, QOS_CLASS_USER_INITIATED, -1);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = dispatch_queue_create("com.photos.import.serviceimporter", v27);
    importQueue = v19->_importQueue;
    v19->_importQueue = (OS_dispatch_queue *)v28;

    objc_msgSend(v13, "pathManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v27) = objc_msgSend(v30, "isDCIM");

    v31 = 0x1E0C99000;
    v32 = 0x1E0C99000;
    if ((_DWORD)v27)
    {
      v33 = objc_alloc(MEMORY[0x1E0D73240]);
      objc_msgSend(v13, "photoLibraryBundle");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "pathManager");
      v35 = a5;
      v36 = v14;
      v37 = v17;
      v38 = v13;
      v39 = v16;
      v40 = v15;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v33;
      v32 = 0x1E0C99000uLL;
      v43 = objc_msgSend(v42, "initWithPathManager:", v41);
      importFileManager = v19->_importFileManager;
      v19->_importFileManager = (PLImportFileManager *)v43;

      v15 = v40;
      v16 = v39;
      v13 = v38;
      v17 = v37;
      v14 = v36;
      a5 = v35;
      v31 = 0x1E0C99000uLL;

      v45 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      downloadFolderUrlByImportIdentifier = v19->_downloadFolderUrlByImportIdentifier;
      v19->_downloadFolderUrlByImportIdentifier = v45;

      v47 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      additionalDcimImportFolders = v19->_additionalDcimImportFolders;
      v19->_additionalDcimImportFolders = v47;

    }
    v49 = (NSMutableDictionary *)objc_alloc_init(*(Class *)(v31 + 3592));
    parentFolderMapping = v19->_parentFolderMapping;
    v19->_parentFolderMapping = v49;

    v51 = (NSMutableArray *)objc_alloc_init(*(Class *)(v32 + 3560));
    downloadedRecords = v19->_downloadedRecords;
    v19->_downloadedRecords = v51;

    v19->_isCanceled = 0;
    objc_storeStrong((id *)&v19->_source, a5);
    objc_storeWeak((id *)&v19->_delegate, v16);
    v53 = objc_msgSend(v17, "copy");
    completionHandler = v19->_completionHandler;
    v19->_completionHandler = (id)v53;

    v55 = (NSMutableDictionary *)objc_alloc_init(*(Class *)(v31 + 3592));
    containerPathByLocalIdentifier = v19->_containerPathByLocalIdentifier;
    v19->_containerPathByLocalIdentifier = v55;

    v57 = (NSMutableDictionary *)objc_alloc_init(*(Class *)(v31 + 3592));
    folderByFolderPath = v19->_folderByFolderPath;
    v19->_folderByFolderPath = v57;

    v59 = (NSMutableDictionary *)objc_alloc_init(*(Class *)(v31 + 3592));
    albumByAlbumPath = v19->_albumByAlbumPath;
    v19->_albumByAlbumPath = v59;

    v61 = (NSMutableDictionary *)objc_alloc_init(*(Class *)(v31 + 3592));
    albumRequestsByAlbumId = v19->_albumRequestsByAlbumId;
    v19->_albumRequestsByAlbumId = v61;

    v63 = (NSMutableDictionary *)objc_alloc_init(*(Class *)(v31 + 3592));
    folderRequestByFolderId = v19->_folderRequestByFolderId;
    v19->_folderRequestByFolderId = v63;

    v19->_importBatchSize = 1;
  }

  return v19;
}

- (id)beginImport:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  PHPhotoLibrary *library;
  id v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v32;
  _QWORD v33[5];
  id v34;
  _QWORD *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _QWORD v44[5];
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  _QWORD v57[2];

  v57[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHPhotoLibrary pathManager](self->_library, "pathManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUBF");

  if (v6)
    v7 = -[PHImporter removeImportDirectoryForLibrary:](self, "removeImportDirectoryForLibrary:", self->_library);
  -[PHImporter options](self, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PHImporter options](self, "options");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sortDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedArrayUsingDescriptors:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

  }
  else
  {
    v14 = (void *)objc_msgSend(v4, "mutableCopy");
  }
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "canPreserveFolderStructure");

    if (v16)
    {
      if (-[PHImportOptions preserveFolderStructure](self->_options, "preserveFolderStructure"))
      {
        -[PHImportSource prefix](self->_source, "prefix");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17 == 0;

        if (!v18)
        {
          -[PHImportOptions destinationFolder](self->_options, "destinationFolder");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v19)
          {
            +[PHFetchOptions fetchOptionsWithPhotoLibrary:orObject:](PHFetchOptions, "fetchOptionsWithPhotoLibrary:orObject:", self->_library, 0);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            +[PHCollectionList fetchRootAlbumCollectionListWithOptions:](PHCollectionList, "fetchRootAlbumCollectionListWithOptions:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v21, "firstObject");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

          }
          v51 = 0;
          v52 = &v51;
          v53 = 0x3032000000;
          v54 = __Block_byref_object_copy__22749;
          v55 = __Block_byref_object_dispose__22750;
          v56 = 0;
          v44[0] = 0;
          v44[1] = v44;
          v44[2] = 0x3032000000;
          v44[3] = __Block_byref_object_copy__22749;
          v44[4] = __Block_byref_object_dispose__22750;
          v45 = 0;
          v38 = 0;
          v39 = &v38;
          v40 = 0x3032000000;
          v41 = __Block_byref_object_copy__22749;
          v42 = __Block_byref_object_dispose__22750;
          v43 = 0;
          library = self->_library;
          v33[0] = MEMORY[0x1E0C809B0];
          v33[1] = 3221225472;
          v33[2] = __26__PHImporter_beginImport___block_invoke;
          v33[3] = &unk_1E35DD8B8;
          v35 = v44;
          v33[4] = self;
          v23 = v19;
          v34 = v23;
          v36 = &v38;
          v37 = &v51;
          v32 = 0;
          -[PHPhotoLibrary performChangesAndWait:error:](library, "performChangesAndWait:error:", v33, &v32);
          v24 = v32;
          if (v39[5])
          {
            v50 = v39[5];
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[PHImporter updateFolderCacheWithFolders:](self, "updateFolderCacheWithFolders:", v25);

          }
          if (v52[5])
          {
            PLImportGetLog();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              -[PHImportSource prefix](self->_source, "prefix");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = (void *)v52[5];
              *(_DWORD *)buf = 138412546;
              v47 = v27;
              v48 = 2112;
              v49 = v28;
              _os_log_impl(&dword_1991EC000, v26, OS_LOG_TYPE_ERROR, "Failed to create folder '%@' for import (%@)", buf, 0x16u);

            }
          }
          if (v24)
          {
            PLImportGetLog();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              -[PHImportSource prefix](self->_source, "prefix");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v47 = v30;
              v48 = 2112;
              v49 = v24;
              _os_log_impl(&dword_1991EC000, v29, OS_LOG_TYPE_ERROR, "Failed to create folder '%@' for import (%@)", buf, 0x16u);

            }
          }

          _Block_object_dispose(&v38, 8);
          _Block_object_dispose(v44, 8);

          _Block_object_dispose(&v51, 8);
        }
      }
    }
  }

  return v14;
}

- (void)performLegacyDiskSpaceCheckForRequiredBytes:(int64_t)a3 forPath:(id)a4 withCompletion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  NSObject *v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint8_t buf[8];
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_importQueue);
  if (MEMORY[0x19AEBDFF0]())
  {
    PLImportGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_INFO, "Skipping disk space check, as we are in a unit test environment.", buf, 2u);
    }

  }
  else
  {
    v11 = objc_msgSend(MEMORY[0x1E0D731D8], "diskSpaceAvailableForPath:", v8);
    v12 = a3 - v11;
    if (a3 >= v11)
    {
      v13 = v11;
      v24[0] = *MEMORY[0x1E0CB2938];
      v14 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("Not enough storage space available for import. Bytes required: %@. Bytes available: %@"), v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = CFSTR("MoreSpaceRequired");
      v25[0] = v17;
      objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v12, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImportErrorDomain"), -5, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHImporter results](self, "results");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (id)objc_msgSend(v21, "addExceptionWithType:path:underlyingError:file:line:", 5, 0, v20, "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImporter.m", 337);

      -[NSProgress cancel](self->_progress, "cancel");
      v9[2](v9, 0);

      goto LABEL_8;
    }
  }
  v9[2](v9, 1);
LABEL_8:

}

- (void)ensureEnoughDiskSpaceAvailableIfNeededForAssets:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  _QWORD v23[5];
  void (**v24)(id, uint64_t);
  uint8_t v25[16];
  _QWORD v26[4];
  id v27;
  uint8_t *v28;
  uint8_t buf[8];
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_importQueue);
  if (MEMORY[0x19AEBDFF0]())
  {
    PLImportGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v9 = "Skipping disk space check, as we are in a unit test environment.";
LABEL_7:
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_INFO, v9, buf, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (-[PHImportOptions skipDiskSpaceCheck](self->_options, "skipDiskSpaceCheck"))
  {
    PLImportGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v9 = "Skipping disk space check, as specified by importer options.";
      goto LABEL_7;
    }
LABEL_8:

    v7[2](v7, 1);
    goto LABEL_17;
  }
  *(_QWORD *)buf = 0;
  v30 = buf;
  v31 = 0x2020000000;
  v32 = 0x200000;
  v10 = objc_msgSend(v6, "count");
  if (PHImportConcurrencyLimit_onceToken != -1)
    dispatch_once(&PHImportConcurrencyLimit_onceToken, &__block_literal_global_4570);
  v11 = PHImportConcurrencyLimit_concurrencyLimit;
  v12 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __73__PHImporter_ensureEnoughDiskSpaceAvailableIfNeededForAssets_completion___block_invoke;
  v26[3] = &unk_1E35DAC20;
  v27 = v6;
  v28 = buf;
  +[PHImportController dispatchApply:withConcurrencyLimit:canceler:ofBlock:](PHImportController, "dispatchApply:withConcurrencyLimit:canceler:ofBlock:", v10, v11, 0, v26);
  -[PHPhotoLibrary photoLibraryURL](self->_library, "photoLibraryURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v13) = objc_msgSend(MEMORY[0x1E0D715D0], "hasEntitlementsForCacheDelete");
  -[PHPhotoLibrary pathManager](self->_library, "pathManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "capabilities");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isNetworkVolume");

  if ((v13 ^ 1 | v17) == 1)
  {
    PLImportGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_ERROR, "Performing Cache Delete requests from this process is NOT POSSIBLE due to entitlements or network volume, so falling back to just checking for available disk space, and failing if not.", v25, 2u);
    }

    v19 = atomic_load((unint64_t *)v30 + 3);
    -[PHImporter performLegacyDiskSpaceCheckForRequiredBytes:forPath:withCompletion:](self, "performLegacyDiskSpaceCheckForRequiredBytes:forPath:withCompletion:", v19, v14, v7);
  }
  else
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D715D0]), "initWithQoSClass:pathForVolume:callbackQueue:", 25, v14, self->_importQueue);
    -[PHImporter setCacheDeleteClient:](self, "setCacheDeleteClient:", v20);

    -[PHImporter cacheDeleteClient](self, "cacheDeleteClient");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = atomic_load((unint64_t *)v30 + 3);
    v23[0] = v12;
    v23[1] = 3221225472;
    v23[2] = __73__PHImporter_ensureEnoughDiskSpaceAvailableIfNeededForAssets_completion___block_invoke_70;
    v23[3] = &unk_1E35DAC48;
    v23[4] = self;
    v24 = v7;
    objc_msgSend(v21, "requestDiskSpaceAvailabilityOfSize:completion:", v22, v23);

  }
  _Block_object_dispose(buf, 8);
LABEL_17:

}

- (id)makeDownloadUrlForParentFolderPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint8_t v15[16];
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_parentFolderMapping, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[PHPhotoLibrary pathManager](self->_library, "pathManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isUBF") & 1) != 0)
    {
      v17 = 0;
      v7 = (id *)&v17;
      objc_msgSend(v6, "externalDirectoryWithSubType:leafType:additionalPathComponents:createIfNeeded:error:", 1, 1, v4, 1, &v17);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
      v7 = (id *)&v16;
      objc_msgSend(v6, "externalDirectoryWithSubType:createIfNeeded:error:", 1, 1, &v16);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)v8;
    v10 = *v7;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v9, 1);
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v5 = (void *)v11;
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_parentFolderMapping, "setObject:forKeyedSubscript:", v11, v4);
LABEL_14:

        goto LABEL_15;
      }
      PLImportGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        v13 = "Didn't get a url from the bundle path";
        goto LABEL_12;
      }
    }
    else
    {
      PLImportGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        v13 = "Didn't get a bundle path from path manager";
LABEL_12:
        _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_ERROR, v13, v15, 2u);
      }
    }

    v5 = 0;
    goto LABEL_14;
  }
LABEL_15:

  return v5;
}

- (id)getDestinationUrlForImportAsset:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHPhotoLibrary pathManager](self->_library, "pathManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUBF");

  objc_msgSend(v4, "parentFolderPath");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    if (v7)
    {
      -[PHImporter makeDownloadUrlForParentFolderPath:](self, "makeDownloadUrlForParentFolderPath:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PLImportGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v4;
        _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_ERROR, "Didn't get a parent folder for asset %@", buf, 0xCu);
      }

      v9 = 0;
    }
  }
  else
  {
    objc_msgSend(v4, "importIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_downloadFolderUrlByImportIdentifier, "objectForKeyedSubscript:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v9 = (void *)v11;
      -[PHPhotoLibrary pathManager](self->_library, "pathManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      objc_msgSend(v12, "externalDirectoryWithSubType:createIfNeeded:error:", 1, 1, &v22);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v22;

      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v13, 1);
        v15 = objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          -[NSMutableArray addObject:](self->_additionalDcimImportFolders, "addObject:", v15);
          v9 = (void *)v15;
        }
        else
        {
          PLImportGetLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_ERROR, "Didn't get a url from the bundle path", buf, 2u);
          }

          v9 = 0;
        }
      }
      else
      {
        PLImportGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v14;
          _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_ERROR, "Didn't get a bundle path from path manager (%@)", buf, 0xCu);
        }

      }
    }
    else if (v8)
    {
      -[PHImporter makeDownloadUrlForParentFolderPath:](self, "makeDownloadUrlForParentFolderPath:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_downloadFolderUrlByImportIdentifier, "setObject:forKeyedSubscript:", v9, v10);
    }
    else
    {
      PLImportGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "uuid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v24 = v21;
        _os_log_impl(&dword_1991EC000, v20, OS_LOG_TYPE_ERROR, "Didn't get a parent folder for asset %@", buf, 0xCu);

      }
      v9 = 0;
    }

  }
  return v9;
}

- (void)importNextAsset:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  NSObject *importQueue;
  int importState;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  __CFString *v20;
  _BOOL8 isCanceled;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD block[5];
  id v28;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_importQueue);
  if (!self->_isCanceled)
  {
    objc_msgSend(v5, "nextObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "importRecordForPrimaryAsset");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PHImporter handleErrorsForRecord:batch:file:line:](self, "handleErrorsForRecord:batch:file:line:", v3, 0, "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImporter.m", 500))
      {
        -[PHImporter addRecordToResults:](self, "addRecordToResults:", v3);
        importQueue = self->_importQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __30__PHImporter_importNextAsset___block_invoke;
        block[3] = &unk_1E35DF9E8;
        block[4] = self;
        v28 = v5;
        dispatch_async(importQueue, block);

LABEL_18:
        goto LABEL_19;
      }
LABEL_11:
      -[PHImporter getDestinationUrlForImportAsset:](self, "getDestinationUrlForImportAsset:", v7, v20, isCanceled);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v3, "allImportRecords");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectEnumerator");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __30__PHImporter_importNextAsset___block_invoke_3;
        v22[3] = &unk_1E35DFAF8;
        v22[4] = self;
        v23 = v3;
        v24 = v5;
        -[PHImporter downloadNextAssetInRecord:toURL:subRecordEnumerator:completionHandler:](self, "downloadNextAssetInRecord:toURL:subRecordEnumerator:completionHandler:", v23, v10, v12, v22);

      }
      else
      {
        v13 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v7, "fileName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "ph_genericErrorWithLocalizedDescription:", CFSTR("Unable to get a downloadPath for %@"), v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "url");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "path");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (id)objc_msgSend(v3, "addExceptionWithType:path:underlyingError:file:line:", 0, v17, v15, "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImporter.m", 509);

        -[PHImporter handleErrorsForRecord:batch:file:line:](self, "handleErrorsForRecord:batch:file:line:", v3, 0, "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImporter.m", 510);
        -[PHImporter addRecordToResults:](self, "addRecordToResults:", v3);
        v19 = self->_importQueue;
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __30__PHImporter_importNextAsset___block_invoke_2;
        v25[3] = &unk_1E35DF9E8;
        v25[4] = self;
        v26 = v5;
        dispatch_async(v19, v25);

      }
      goto LABEL_18;
    }
    importState = self->_importState;
    if (!self->_importState)
    {
      if (!-[NSMutableArray count](self->_downloadedRecords, "count"))
      {
        -[PHImporter finishImport](self, "finishImport");
        goto LABEL_19;
      }
      self->_importState = 2;
      -[PHImporter _recordsToImportWithCount:](self, "_recordsToImportWithCount:", -[NSMutableArray count](self->_downloadedRecords, "count"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHImporter importRecords:](self, "importRecords:", v3);
      goto LABEL_18;
    }
    if (importState == 1)
    {
      self->_importState = 2;
    }
    else if ((importState - 2) < 2)
    {
      v20 = off_1E35DAD30[(importState - 1)];
      isCanceled = self->_isCanceled;
      _PFAssertFailHandler();
      goto LABEL_11;
    }
LABEL_19:

    goto LABEL_20;
  }
  if (!self->_importState)
    -[PHImporter finishImport](self, "finishImport");
LABEL_20:

}

- (BOOL)shouldImportRecordAsReference:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[PHImportOptions shouldImportAsReferenced](self->_options, "shouldImportAsReferenced"))
    v5 = objc_msgSend(v4, "canReference");
  else
    v5 = 0;

  return v5;
}

- (void)downloadNextAssetInRecord:(id)a3 toURL:(id)a4 subRecordEnumerator:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  NSObject *importQueue;
  void *v25;
  _QWORD block[5];
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_importQueue);
  objc_msgSend(v12, "nextObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    importQueue = self->_importQueue;
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __84__PHImporter_downloadNextAssetInRecord_toURL_subRecordEnumerator_completionHandler___block_invoke;
    v39[3] = &unk_1E35DF948;
    v40 = v13;
    dispatch_async(importQueue, v39);
    v23 = v40;
    goto LABEL_7;
  }
  if (-[PHImporter shouldImportRecordAsReference:](self, "shouldImportRecordAsReference:", v14)
    || !objc_msgSend(v14, "needsDownload"))
  {
    v22 = self->_importQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__PHImporter_downloadNextAssetInRecord_toURL_subRecordEnumerator_completionHandler___block_invoke_89;
    block[3] = &unk_1E35DF688;
    block[4] = self;
    v27 = v10;
    v28 = v11;
    v29 = v12;
    v30 = v13;
    dispatch_async(v22, block);

    v23 = v27;
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend(v14, "timers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startTiming:subtype:", 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "importAsset");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fileName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "uppercaseString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLByAppendingPathComponent:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __84__PHImporter_downloadNextAssetInRecord_toURL_subRecordEnumerator_completionHandler___block_invoke_2;
  v31[3] = &unk_1E35DAC98;
  v31[4] = self;
  v32 = v14;
  v33 = v16;
  v34 = v10;
  v38 = v13;
  v35 = v17;
  v36 = v11;
  v37 = v12;
  v20 = v17;
  v21 = v16;
  objc_msgSend(v20, "copyToURL:completionHandler:", v19, v31);

LABEL_8:
}

- (void)importRecords:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PHImporter *v8;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_importQueue);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28__PHImporter_importRecords___block_invoke;
  v6[3] = &unk_1E35DF9E8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[PHImporter importRecords:completionHandler:](self, "importRecords:completionHandler:", v5, v6);

}

- (id)_recordsToImportWithCount:(unint64_t)a3
{
  void *v5;

  -[NSMutableArray subarrayWithRange:](self->_downloadedRecords, "subarrayWithRange:", 0, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsInRange:](self->_downloadedRecords, "removeObjectsInRange:", 0, a3);
  return v5;
}

- (BOOL)shouldIngestInPlace:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "resourceType");
  return (v3 < 0xA) & (0x21Eu >> v3);
}

- (void)importRecords:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD v17[4];
  id v18;
  PHImporter *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_importQueue);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__22749;
  v24[4] = __Block_byref_object_dispose__22750;
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__22749;
  v22[4] = __Block_byref_object_dispose__22750;
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PHImporter library](self, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __46__PHImporter_importRecords_completionHandler___block_invoke;
  v17[3] = &unk_1E35DE5F8;
  v18 = v6;
  v19 = self;
  v20 = v24;
  v21 = v22;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __46__PHImporter_importRecords_completionHandler___block_invoke_2;
  v12[3] = &unk_1E35DACE8;
  v12[4] = self;
  v15 = v24;
  v16 = v22;
  v10 = v18;
  v13 = v10;
  v11 = v7;
  v14 = v11;
  objc_msgSend(v8, "performChanges:completionHandler:", v17, v12);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);

}

- (id)_importRecord:(id)a3 createdAlbumIdentifiers:(id)a4 createdFolderIdentifiers:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  PHAssetResourceCreationOptions *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id obj;
  uint64_t v55;
  _QWORD v56[4];
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  void *v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v52 = a5;
  objc_msgSend(v8, "importAsset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImporter _applyFastVideoModernizationToRecord:](self, "_applyFastVideoModernizationToRecord:", v8);
  v49 = v9;
  if ((objc_msgSend(v10, "shouldPreserveUUID") & 1) != 0)
  {
    objc_msgSend(v10, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHAssetCreationRequest creationRequestForAssetWithUUID:](PHAssetCreationRequest, "creationRequestForAssetWithUUID:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[PHAssetCreationRequest creationRequestForAssetWithUUID:](PHAssetCreationRequest, "creationRequestForAssetWithUUID:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v12, "setImportSessionID:", self->_importSessionID, v49);
  objc_msgSend(v12, "setImportedBy:", -[PHImportOptions importedBy](self->_options, "importedBy"));
  v53 = v10;
  objc_msgSend(v10, "customAssetProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCustomAssetProperties:", v13);

  v51 = v8;
  objc_msgSend(v8, "allImportRecords");
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  if (v14)
  {
    v15 = v14;
    v55 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v60 != v55)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        objc_msgSend(v17, "importAsset");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHImporter addDescriptionPropertiesFromImportAsset:toCreationRequest:](self, "addDescriptionPropertiesFromImportAsset:toCreationRequest:", v18, v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[PHImporter addLibraryPropertiesFromImportAssetBundleAsset:toCreationRequest:](self, "addLibraryPropertiesFromImportAssetBundleAsset:toCreationRequest:", v18, v12);
        v19 = objc_alloc_init(PHAssetResourceCreationOptions);
        v20 = -[PHImporter shouldImportRecordAsReference:](self, "shouldImportRecordAsReference:", v17);
        if (v20)
        {
          -[PHAssetResourceCreationOptions setShouldMoveFile:](v19, "setShouldMoveFile:", 0);
          objc_msgSend(v17, "importAsset");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHAssetResourceCreationOptions setShouldIngestInPlace:](v19, "setShouldIngestInPlace:", objc_msgSend(v21, "hasOriginalResourceType"));

        }
        else
        {
          -[PHPhotoLibrary pathManager](self->_library, "pathManager");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isUBF");

          if (v23)
          {
            -[PHAssetResourceCreationOptions setShouldMoveFile:](v19, "setShouldMoveFile:", 1);
            -[PHAssetResourceCreationOptions setShouldIngestInPlace:](v19, "setShouldIngestInPlace:", 0);
          }
          else
          {
            objc_msgSend(v17, "importAsset");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[PHAssetResourceCreationOptions setShouldIngestInPlace:](v19, "setShouldIngestInPlace:", -[PHImporter shouldIngestInPlace:](self, "shouldIngestInPlace:", v24));

            -[PHAssetResourceCreationOptions setShouldMoveFile:](v19, "setShouldMoveFile:", -[PHAssetResourceCreationOptions shouldIngestInPlace](v19, "shouldIngestInPlace") ^ 1);
          }
        }
        objc_msgSend(v18, "createdFileName");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          -[PHAssetResourceCreationOptions setOriginalFilename:](v19, "setOriginalFilename:", v25);
        }
        else
        {
          objc_msgSend(v18, "fileName");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHAssetResourceCreationOptions setOriginalFilename:](v19, "setOriginalFilename:", v26);

        }
        objc_msgSend(v18, "contentType");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHAssetResourceCreationOptions setUniformTypeIdentifier:](v19, "setUniformTypeIdentifier:", v28);

        objc_msgSend(v18, "fileCreationDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHAssetResourceCreationOptions setAlternateImportImageDate:](v19, "setAlternateImportImageDate:", v29);

        -[PHAssetResourceCreationOptions setBurstPickType:](v19, "setBurstPickType:", objc_msgSend(v18, "burstPickType"));
        if (!v20)
        {
          objc_msgSend(v17, "downloadedPath");
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31)
          {
            v32 = (void *)MEMORY[0x1E0C99E98];
            objc_msgSend(v17, "downloadedPath");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "fileURLWithPath:", v33);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v30)
              goto LABEL_27;
LABEL_24:
            objc_msgSend(v12, "addResourceWithType:fileURL:options:", objc_msgSend(v18, "resourceType"), v30, v19);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("Importing as copy. Expected record to have a download path."));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "fileName");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = (id)objc_msgSend(v17, "addExceptionWithType:path:underlyingError:file:line:", 0, v34, v30, "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImporter.m", 783);

          }
          goto LABEL_27;
        }
        objc_msgSend(v18, "url");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
          goto LABEL_24;
LABEL_27:

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    }
    while (v15);
  }
  objc_msgSend(v12, "placeholderForCreatedAsset");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (!v36)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("Failed to get a placeholder object for asset"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "fileName");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v51;
    v44 = (id)objc_msgSend(v51, "addExceptionWithType:path:underlyingError:file:line:", 0, v43, v42, "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImporter.m", 808);
    goto LABEL_33;
  }
  objc_msgSend(v36, "localIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v51;
  objc_msgSend(v51, "setAssetIdentifier:", v38);

  -[PHImportOptions destinationAlbum](self->_options, "destinationAlbum");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[PHImportOptions destinationAlbum](self->_options, "destinationAlbum");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHAssetCollectionChangeRequest changeRequestForAssetCollection:](PHAssetCollectionChangeRequest, "changeRequestForAssetCollection:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v63 = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addAssets:", v43);
LABEL_33:

    goto LABEL_34;
  }
  if (objc_msgSend(v53, "canPreserveFolderStructure")
    && -[PHImportOptions preserveFolderStructure](self->_options, "preserveFolderStructure"))
  {
    objc_msgSend(v53, "url");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "path");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "stringByDeletingLastPathComponent");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __77__PHImporter__importRecord_createdAlbumIdentifiers_createdFolderIdentifiers___block_invoke;
    v56[3] = &unk_1E35DBE10;
    v57 = v50;
    v58 = v52;
    -[PHImporter ensureContainersExistForAlbumPath:forAsset:completion:](self, "ensureContainersExistForAlbumPath:forAsset:completion:", v42, v37, v56);

    v43 = v57;
    goto LABEL_33;
  }
LABEL_34:
  objc_msgSend(v12, "placeholderForCreatedAsset");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  return v45;
}

- (void)_applyFastVideoModernizationToRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "importAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startTiming:subtype:", 10, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isMovie")
    && !-[PHImporter shouldImportRecordAsReference:](self, "shouldImportRecordAsReference:", v4))
  {
    objc_msgSend(v5, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentTypeFromFastModernizeVideoMedia");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v5, "contentType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqual:", v9);

      if ((v11 & 1) == 0)
      {
        objc_msgSend(v9, "preferredFilenameExtension");
        v12 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "downloadedPath");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByDeletingPathExtension");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)v12;
        objc_msgSend(v14, "stringByAppendingPathExtension:", v12);
        v15 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v4, "downloadedPath");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "fileURLWithPath:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)v15;
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0;
        LOBYTE(v17) = objc_msgSend(v16, "moveItemAtURL:toURL:error:", v19, v20, &v26);
        v21 = v26;

        if ((v17 & 1) == 0)
        {
          PLImportGetLog();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v28 = v21;
            _os_log_impl(&dword_1991EC000, v22, OS_LOG_TYPE_ERROR, "Error renaming file for fast modernization: %@", buf, 0xCu);
          }

        }
        objc_msgSend(v4, "setDownloadedPath:", v24);

      }
    }

  }
  objc_msgSend(v4, "timers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stopTiming:", v7);

}

- (void)addDescriptionPropertiesFromImportAsset:(id)a3 toCreationRequest:(id)a4
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
  id v14;

  v14 = a3;
  v5 = a4;
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v14, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v5, "setTitle:", v7);

  }
  objc_msgSend(v5, "keywordTitles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v14, "keywordTitles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v5, "setKeywordTitles:", v9);

  }
  objc_msgSend(v5, "assetDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(v14, "assetDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v5, "setAssetDescription:", v11);

  }
  objc_msgSend(v5, "accessibilityDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(v14, "accessibilityDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v5, "setAccessibilityDescription:", v13);

  }
}

- (void)addLibraryPropertiesFromImportAssetBundleAsset:(id)a3 toCreationRequest:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  objc_msgSend(a3, "assetBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "videoComplementVisibilityState");
  if ((_DWORD)v6)
    objc_msgSend(v12, "setPhotoIrisVisibilityState:", v6);
  objc_msgSend(v12, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v5, "libraryCreationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v12, "setCreationDate:", v8);
      objc_msgSend(v5, "libraryCreationDateTimeZone");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        objc_msgSend(v12, "setTimeZone:withDate:", v9, v8);

    }
  }
  objc_msgSend(v12, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(v5, "libraryLocation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(v12, "setLocation:", v11);
    }

  }
  if (objc_msgSend(v5, "spatialOvercaptureResourcesPurgeable"))
    objc_msgSend(v12, "trashAllSpatialOverCaptureResources");

}

- (void)finishImport
{
  NSObject *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  PHPhotoLibrary *library;
  BOOL v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void (**completionHandler)(id, void *);
  void *v29;
  id v30;
  _QWORD v31[5];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_importQueue);
  if (self->_importState <= 2u)
  {
    PLImportGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_INFO, "IMPORT FINISHED", buf, 2u);
    }

    if (self->_isCanceled)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v4 = self->_downloadedRecords;
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v34 != v7)
              objc_enumerationMutation(v4);
            objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "cleanupAfterFailure");
          }
          v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        }
        while (v6);
      }

      -[NSMutableArray removeAllObjects](self->_downloadedRecords, "removeAllObjects");
    }
    else
    {
      -[PHImporter progress](self, "progress");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "totalUnitCount");
      -[PHImporter progress](self, "progress");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCompletedUnitCount:", v10);

    }
    self->_importState = 3;
    if (-[NSMutableSet count](self->_importedBurstUUIDs, "count"))
    {
      objc_msgSend(MEMORY[0x1E0D715A0], "sharedAssetsSaver");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet allObjects](self->_importedBurstUUIDs, "allObjects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHPhotoLibrary photoLibraryURL](self->_library, "photoLibraryURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "validateAvalanches:inLibraryWithURL:", v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[PHImportOptions destinationAlbum](self->_options, "destinationAlbum");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        v18 = objc_msgSend(v15, "count");

        if (v18)
        {
          library = self->_library;
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __26__PHImporter_finishImport__block_invoke;
          v31[3] = &unk_1E35DF9E8;
          v31[4] = self;
          v32 = v15;
          v30 = 0;
          v20 = -[PHPhotoLibrary performChangesAndWait:error:](library, "performChangesAndWait:error:", v31, &v30);
          v21 = v30;
          if (!v20)
          {
            PLImportGetLog();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              -[PHImportOptions destinationAlbum](self->_options, "destinationAlbum");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "localizedTitle");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v38 = v24;
              v39 = 2112;
              v40 = v21;
              _os_log_impl(&dword_1991EC000, v22, OS_LOG_TYPE_ERROR, "Error adding bursts to album '%@': %@", buf, 0x16u);

            }
          }

        }
      }

    }
    -[PHImporter removeImportDirectoryForLibrary:](self, "removeImportDirectoryForLibrary:", self->_library);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      PLImportGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v25;
        _os_log_impl(&dword_1991EC000, v26, OS_LOG_TYPE_ERROR, "Error removing empyt DCIM folder: %@", buf, 0xCu);
      }

    }
    -[PHImporter results](self, "results");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "logPMR");

    completionHandler = (void (**)(id, void *))self->_completionHandler;
    if (completionHandler)
    {
      -[PHImporter results](self, "results");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      completionHandler[2](completionHandler, v29);

    }
  }
}

- (BOOL)handleErrorsForRecord:(id)a3 batch:(id)a4 file:(char *)a5 line:(int)a6
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  int v17;
  const __CFString *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "exceptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    objc_msgSend(v7, "importAsset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      PLImportGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "exceptions");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v12, "count") <= 1)
          v13 = CFSTR("]");
        else
          v13 = CFSTR("S]\n");
        +[PHImportException logForAllExceptions:](PHImportException, "logForAllExceptions:", v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412546;
        v18 = v13;
        v19 = 2112;
        v20 = v14;
        _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_ERROR, "[IMPORT ERROR%@ %@", (uint8_t *)&v17, 0x16u);

      }
      objc_msgSend(v7, "importAsset");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHImporter validateSourceForAsset:](self, "validateSourceForAsset:", v15);

      objc_msgSend(v7, "cleanupAfterFailure");
    }
  }

  return v9 != 0;
}

- (void)validateSourceForAsset:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAvailable");

  if ((v5 & 1) == 0)
  {
    -[PHImporter results](self, "results");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "source");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v6, "addExceptionWithType:path:underlyingError:file:line:", 3, v8, 0, "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImporter.m", 976);

    self->_isCanceled = 1;
  }

}

- (id)createFolderForPath:(id)a3 inFolder:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *containerPathByLocalIdentifier;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    objc_msgSend(v8, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHCollectionListChangeRequest creationRequestForCollectionListWithTitle:](PHCollectionListChangeRequest, "creationRequestForCollectionListWithTitle:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "placeholderForCreatedCollectionList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[PHImporter folderChangeRequestForFolder:](self, "folderChangeRequestForFolder:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addChildCollections:", v14);

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_folderByFolderPath, "setObject:forKeyedSubscript:", v12, v8);
      objc_msgSend(v12, "localIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        containerPathByLocalIdentifier = self->_containerPathByLocalIdentifier;
        objc_msgSend(v12, "localIdentifier");
        v17 = objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](containerPathByLocalIdentifier, "setObject:forKeyedSubscript:", v8, v17);
      }
      else
      {
        PLImportGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v8;
          _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_ERROR, "Failed to get a local identifier for collection created for %@", buf, 0xCu);
        }
      }

      v19 = 0;
    }
    else
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("folder local identifier was nil for %@"), v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImportErrorDomain"), -6, v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (a5)
      *a5 = objc_retainAutorelease(v19);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)folderChangeRequestForFolder:(id)a3
{
  id v4;
  NSMutableDictionary *folderRequestByFolderId;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  folderRequestByFolderId = self->_folderRequestByFolderId;
  objc_msgSend(v4, "localIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](folderRequestByFolderId, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    +[PHCollectionListChangeRequest changeRequestForCollectionList:](PHCollectionListChangeRequest, "changeRequestForCollectionList:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && v7)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_folderRequestByFolderId, "setObject:forKeyedSubscript:", v7, v8);
    }
    else
    {
      PLImportGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v11 = 134218240;
        v12 = v8;
        v13 = 2048;
        v14 = v7;
        _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "Failed to get a local identifier (%p) or request (%p) for collection", (uint8_t *)&v11, 0x16u);
      }

    }
  }

  return v7;
}

- (void)updateAlbumCacheWithAlbumIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableDictionary *containerPathByLocalIdentifier;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PHFetchOptions fetchOptionsWithPhotoLibrary:orObject:](PHFetchOptions, "fetchOptionsWithPhotoLibrary:orObject:", self->_library, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:options:](PHAssetCollection, "fetchAssetCollectionsWithLocalIdentifiers:options:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v6;
  objc_msgSend(v6, "fetchedObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v20 = v4;
  if (v7)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
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
          v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          containerPathByLocalIdentifier = self->_containerPathByLocalIdentifier;
          objc_msgSend(v13, "localIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](containerPathByLocalIdentifier, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_albumByAlbumPath, "setObject:forKeyedSubscript:", v13, v16);
          }
          else
          {
            PLImportGetLog();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_ERROR, "pathKey should have existed unless we are trying to update a container that did not previously have a cached placeholder", buf, 2u);
            }

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v10);
    }
  }
  else
  {
    PLImportGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v4;
      _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_ERROR, "no PHAssetCollection for identifiers: %@", buf, 0xCu);
    }

  }
}

- (void)updateFolderCacheWithFolders:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSMutableDictionary *containerPathByLocalIdentifier;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PHFetchOptions fetchOptionsWithPhotoLibrary:orObject:](PHFetchOptions, "fetchOptionsWithPhotoLibrary:orObject:", self->_library, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHCollectionList fetchCollectionListsWithLocalIdentifiers:options:](PHCollectionList, "fetchCollectionListsWithLocalIdentifiers:options:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v6;
  objc_msgSend(v6, "fetchedObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
  {
    PLImportGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v4;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "no PHCollectionLists for %@", buf, 0xCu);
    }

  }
  v20 = v4;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        containerPathByLocalIdentifier = self->_containerPathByLocalIdentifier;
        objc_msgSend(v14, "localIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](containerPathByLocalIdentifier, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_folderByFolderPath, "setObject:forKeyedSubscript:", v14, v17);
        }
        else
        {
          PLImportGetLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_ERROR, "pathKey should have existed unless we are trying to update a container that did not previously have a cached placeholder", buf, 2u);
          }

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

}

- (void)addRecordToResults:(id)a3
{
  NSObject *importQueue;
  id v5;
  void *v6;
  void *v7;
  id WeakRetained;

  importQueue = self->_importQueue;
  v5 = a3;
  dispatch_assert_queue_V2(importQueue);
  -[PHImporter results](self, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addImportRecord:", v5);

  -[PHImporter progress](self, "progress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCompletedUnitCount:", objc_msgSend(v7, "completedUnitCount") + 1);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "completedImportRecord:", v5);

}

- (id)relativePathComponentsForAlbumPath:(id)a3 fromRootPath:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (v5 && (v7 = objc_msgSend(v5, "length"), v7 > objc_msgSend(v6, "length")))
  {
    objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v6, "length") + 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("/"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)ensureContainersExistForAlbumPath:(id)a3 forAsset:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, id);
  void *v11;
  NSMutableDictionary *albumRequestsByAlbumId;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  PHImporter *v31;
  void *v32;
  id v33;
  void *v34;
  NSObject *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  PHImporter *v40;
  PHImporter *v41;
  void *v42;
  void *v43;
  void *v44;
  void (**v45)(id, void *, id);
  id v46;
  id v47;
  id v48;
  void *v49;
  NSObject *v50;
  id v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  id v59;
  uint8_t buf[4];
  id v61;
  __int16 v62;
  id v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, id))a5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_albumByAlbumPath, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v11)
  {
    albumRequestsByAlbumId = self->_albumRequestsByAlbumId;
    objc_msgSend(v11, "localIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](albumRequestsByAlbumId, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      +[PHAssetCollectionChangeRequest changeRequestForAssetCollection:](PHAssetCollectionChangeRequest, "changeRequestForAssetCollection:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_albumRequestsByAlbumId, "setObject:forKeyedSubscript:", v14, v15);

    }
    v58 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAssets:", v16);
LABEL_7:
    v17 = 0;
    goto LABEL_42;
  }
  -[PHImportSource prefix](self->_source, "prefix");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_folderByFolderPath, "objectForKeyedSubscript:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    PLImportGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v14, "lastPathComponent");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v61 = v36;
      _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_ERROR, "Failed to create root folder '%@'", buf, 0xCu);

    }
    goto LABEL_7;
  }
  v45 = v10;
  v19 = v18;
  -[PHImporter relativePathComponentsForAlbumPath:fromRootPath:](self, "relativePathComponentsForAlbumPath:fromRootPath:", v8, v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v14;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v22 = v20;
  v23 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
  v50 = v22;
  v47 = v9;
  v48 = v8;
  v46 = v21;
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v55;
    v26 = v22;
    while (2)
    {
      v27 = 0;
      v28 = v21;
      v29 = v19;
      do
      {
        if (*(_QWORD *)v55 != v25)
          objc_enumerationMutation(v26);
        objc_msgSend(v28, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v27));
        v21 = (id)objc_claimAutoreleasedReturnValue();

        -[NSMutableDictionary objectForKeyedSubscript:](self->_folderByFolderPath, "objectForKeyedSubscript:", v21);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v30)
        {
          v53 = 0;
          v31 = self;
          -[PHImporter createFolderForPath:inFolder:error:](self, "createFolderForPath:inFolder:error:", v21, v29, &v53);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v53;
          if (v33)
          {
            v37 = v33;
            PLImportGetLog();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v21, "lastPathComponent");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v61 = v39;
              v62 = 2112;
              v63 = v37;
              _os_log_impl(&dword_1991EC000, v38, OS_LOG_TYPE_ERROR, "Failed to create folder '%@' (%@)", buf, 0x16u);

            }
            v17 = 0;
            v19 = v26;
            goto LABEL_40;
          }
          objc_msgSend(v32, "placeholderForCreatedCollectionList");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "localIdentifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v34)
          {
            objc_msgSend(v51, "addObject:", v34);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v31->_folderRequestByFolderId, "setObject:forKeyedSubscript:", v32, v34);
          }
          else
          {
            PLImportGetLog();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v30, "localizedTitle");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v61 = v49;
              _os_log_impl(&dword_1991EC000, v35, OS_LOG_TYPE_ERROR, "Failed to get a valid local identifier for collection '%@'", buf, 0xCu);

            }
            v26 = v50;
          }

          self = v31;
        }
        v19 = v30;

        ++v27;
        v28 = v21;
        v29 = v19;
      }
      while (v24 != v27);
      v24 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
      if (v24)
        continue;
      break;
    }

    if (v19)
    {
      v9 = v47;
      v8 = v48;
      goto LABEL_32;
    }
    v17 = 0;
  }
  else
  {

LABEL_32:
    v52 = 0;
    -[PHImporter createAlbumForPath:inFolder:error:](self, "createAlbumForPath:inFolder:error:", v8, v19, &v52);
    v40 = self;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v52;
    if (v37)
    {
      PLImportGetLog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v61 = v8;
        v62 = 2112;
        v63 = v37;
        _os_log_impl(&dword_1991EC000, v38, OS_LOG_TYPE_ERROR, "Failed to lookup or create folder path to album '%@' (%@)", buf, 0x16u);
      }
      v17 = 0;
    }
    else
    {
      v41 = v40;
      v59 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addAssets:", v42);

      objc_msgSend(v32, "placeholderForCreatedAssetCollection");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "localIdentifier");
      v38 = objc_claimAutoreleasedReturnValue();

      if (v38)
        -[NSMutableDictionary setObject:forKeyedSubscript:](v41->_albumRequestsByAlbumId, "setObject:forKeyedSubscript:", v32, v38);
      objc_msgSend(v32, "placeholderForCreatedAssetCollection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v29 = v19;
LABEL_40:

  }
  v9 = v47;
  v8 = v48;
  v10 = v45;

  v14 = v46;
  v11 = 0;
  v16 = v50;
LABEL_42:

  if (v10)
  {
    objc_msgSend(v17, "localIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v44, v51);

  }
}

- (id)createAlbumForPath:(id)a3 inFolder:(id)a4 error:(id *)a5
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
  uint64_t v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:](PHAssetCollectionChangeRequest, "creationRequestForAssetCollectionWithTitle:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "placeholderForCreatedAssetCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_albumByAlbumPath, "setObject:forKeyedSubscript:", v12, v8);
    objc_msgSend(v12, "localIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_containerPathByLocalIdentifier, "setObject:forKeyedSubscript:", v8, v13);
    -[PHImporter folderChangeRequestForFolder:](self, "folderChangeRequestForFolder:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addChildCollections:", v15);

    v16 = 0;
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No error was returned from -[PHPhotoLibrary performChangesAndWait:error:] but the album local identifier was nil for %@"), v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImportErrorDomain"), -6, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (a5)
    *a5 = objc_retainAutorelease(v16);

  return v11;
}

- (void)cancellationHandler
{
  NSObject *importQueue;
  _QWORD block[5];

  importQueue = self->_importQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__PHImporter_cancellationHandler__block_invoke;
  block[3] = &unk_1E35DF110;
  block[4] = self;
  dispatch_async(importQueue, block);
}

- (void)importedBurstAsset:(id)a3
{
  id v4;
  NSMutableSet *importedBurstUUIDs;
  NSMutableSet *v6;
  NSMutableSet *v7;
  void *v8;
  id v9;

  v4 = a3;
  importedBurstUUIDs = self->_importedBurstUUIDs;
  v9 = v4;
  if (!importedBurstUUIDs)
  {
    v6 = (NSMutableSet *)objc_opt_new();
    v7 = self->_importedBurstUUIDs;
    self->_importedBurstUUIDs = v6;

    v4 = v9;
    importedBurstUUIDs = self->_importedBurstUUIDs;
  }
  objc_msgSend(v4, "burstUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](importedBurstUUIDs, "addObject:", v8);

}

- (id)removeImportDirectoryForLibrary:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSMutableDictionary *parentFolderMapping;
  id v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  PLImportFileManager *importFileManager;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  id v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "pathManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUBF");

  if (v6)
  {
    objc_msgSend(v4, "pathManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    objc_msgSend(v7, "externalDirectoryWithSubType:leafType:additionalPathComponents:createIfNeeded:error:", 1, 1, 0, 0, &v29);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v29;

    if (v8)
    {
      objc_msgSend((id)objc_opt_class(), "removeItemAtPath:type:recursive:", v8, 1, 1);
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v10;
    }
  }
  else
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_importQueue);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableDictionary count](self->_parentFolderMapping, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    parentFolderMapping = self->_parentFolderMapping;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __46__PHImporter_removeImportDirectoryForLibrary___block_invoke;
    v27[3] = &unk_1E35DAD10;
    v27[4] = self;
    v28 = v11;
    v13 = v11;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](parentFolderMapping, "enumerateKeysAndObjectsUsingBlock:", v27);
    -[NSMutableDictionary removeObjectsForKeys:](self->_parentFolderMapping, "removeObjectsForKeys:", v13);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->_additionalDcimImportFolders, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v14 = self->_additionalDcimImportFolders;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          importFileManager = self->_importFileManager;
          objc_msgSend(v19, "path", (_QWORD)v23);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(importFileManager) = -[PLImportFileManager removeUnusedDCIMDirectoryAtPath:](importFileManager, "removeUnusedDCIMDirectoryAtPath:", v21);

          if ((_DWORD)importFileManager)
            objc_msgSend(v8, "addObject:", v19);
        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
      }
      while (v16);
    }

    -[NSMutableArray removeObjectsInArray:](self->_additionalDcimImportFolders, "removeObjectsInArray:", v8);
    v9 = 0;
  }

  return v9;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (PHImportOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (PHImportResults)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (PHPhotoLibrary)library
{
  return self->_library;
}

- (void)setLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_library, a3);
}

- (NSString)importSessionID
{
  return self->_importSessionID;
}

- (void)setImportSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_importSessionID, a3);
}

- (NSMutableSet)importedBurstUUIDs
{
  return self->_importedBurstUUIDs;
}

- (void)setImportedBurstUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_importedBurstUUIDs, a3);
}

- (PHImportSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (PLCacheDeleteClient)cacheDeleteClient
{
  return self->_cacheDeleteClient;
}

- (void)setCacheDeleteClient:(id)a3
{
  objc_storeStrong((id *)&self->_cacheDeleteClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheDeleteClient, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_importedBurstUUIDs, 0);
  objc_storeStrong((id *)&self->_importSessionID, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_folderRequestByFolderId, 0);
  objc_storeStrong((id *)&self->_albumRequestsByAlbumId, 0);
  objc_storeStrong((id *)&self->_albumByAlbumPath, 0);
  objc_storeStrong((id *)&self->_containerPathByLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_folderByFolderPath, 0);
  objc_storeStrong((id *)&self->_downloadedRecords, 0);
  objc_storeStrong((id *)&self->_parentFolderMapping, 0);
  objc_storeStrong((id *)&self->_additionalDcimImportFolders, 0);
  objc_storeStrong((id *)&self->_downloadFolderUrlByImportIdentifier, 0);
  objc_storeStrong((id *)&self->_importFileManager, 0);
  objc_storeStrong((id *)&self->_importQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __46__PHImporter_removeImportDirectoryForLibrary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(a3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "removeUnusedDCIMDirectoryAtPath:", v6);

  if ((_DWORD)v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

_QWORD *__33__PHImporter_cancellationHandler__block_invoke(_QWORD *result)
{
  uint64_t v1;
  _QWORD *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v1 = result[4];
  if (!*(_BYTE *)(v1 + 80))
  {
    v2 = result;
    *(_BYTE *)(v1 + 80) = 1;
    objc_msgSend(*(id *)(result[4] + 152), "setResult:", 3);
    PLImportGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEBUG, "IMPORT CANCELLED: during download, finishing", v6, 2u);
    }

    objc_msgSend((id)v2[4], "cacheDeleteClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend((id)v2[4], "cacheDeleteClient");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cancelDiskSpaceAvailabilityRequest");

    }
    result = (_QWORD *)v2[4];
    if (!*((_BYTE *)result + 32))
      return (_QWORD *)objc_msgSend(result, "finishImport");
  }
  return result;
}

void __26__PHImporter_finishImport__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[PHFetchOptions fetchOptionsWithPhotoLibrary:orObject:](PHFetchOptions, "fetchOptionsWithPhotoLibrary:orObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid in %@"), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v2);

  +[PHAsset fetchAssetsWithOptions:](PHAsset, "fetchAssetsWithOptions:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "destinationAlbum");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHAssetCollectionChangeRequest changeRequestForAssetCollection:](PHAssetCollectionChangeRequest, "changeRequestForAssetCollection:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addAssets:", v3);
  }

}

void __77__PHImporter__importRecord_createdAlbumIdentifiers_createdFolderIdentifiers___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v5);

}

void __46__PHImporter_importRecords_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  void *v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_importRecord:createdAlbumIdentifiers:createdFolderIdentifiers:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v6), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), (_QWORD)v12);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "libraryScope");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "libraryScope");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          +[PHLibraryScopeChangeRequest changeRequestForLibraryScope:](PHLibraryScopeChangeRequest, "changeRequestForLibraryScope:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = v7;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "moveToSharedLibrary:", v11);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v4);
  }

}

void __46__PHImporter_importRecords_completionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  id v13;
  __int128 v14;
  char v15;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __46__PHImporter_importRecords_completionHandler___block_invoke_3;
  block[3] = &unk_1E35DACC0;
  block[1] = 3221225472;
  v15 = a2;
  block[4] = v6;
  v14 = *(_OWORD *)(a1 + 56);
  v11 = v7;
  v12 = v5;
  v13 = *(id *)(a1 + 48);
  v9 = v5;
  dispatch_async(v8, block);

}

uint64_t __46__PHImporter_importRecords_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t j;
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
  id v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v1 = a1;
  v35 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "removeAllObjects");
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 120), "removeAllObjects");
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 40), "count"))
      objc_msgSend(*(id *)(v1 + 32), "updateAlbumCacheWithAlbumIdentifiers:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 40));
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 72) + 8) + 40), "count"))
      objc_msgSend(*(id *)(v1 + 32), "updateFolderCacheWithFolders:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 72) + 8) + 40));
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = *(id *)(v1 + 40);
    v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v30 != v4)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "importAsset");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "burstUUID");
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          if (v7)
            objc_msgSend(*(id *)(v1 + 32), "importedBurstAsset:", v6);

        }
        v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v3);
    }
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = *(id *)(a1 + 40);
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v23)
    {
      v21 = *(_QWORD *)v26;
      v22 = v1;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v26 != v21)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
          objc_msgSend(v9, "importAsset");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v10, "fileName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "rawAsset");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v10, "rawAsset");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "fileName");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "stringWithFormat:", CFSTR(", %@"), v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "stringWithFormat:", CFSTR("%@%@"), v12, v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_msgSend(v11, "stringWithFormat:", CFSTR("%@%@"), v12, &stru_1E35DFFF8);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
          }

          v1 = v22;
          v19 = (id)objc_msgSend(v9, "addExceptionWithType:path:underlyingError:file:line:", 0, v18, *(_QWORD *)(v22 + 48), "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImporter.m", 728);

        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v23);
    }
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 56) + 16))();
}

void __28__PHImporter_importRecords___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "handleErrorsForRecord:batch:file:line:", v7, 0, "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImporter.m", 636);
        objc_msgSend(*(id *)(a1 + 40), "addRecordToResults:", v7);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  v8 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v8 + 80))
  {
LABEL_9:
    objc_msgSend((id)v8, "finishImport");
  }
  else
  {
    v9 = objc_msgSend(*(id *)(v8 + 72), "count");
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(v10 + 128);
    if (v9 >= v11)
    {
LABEL_15:
      objc_msgSend((id)v10, "_recordsToImportWithCount:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "importRecords:", v14);

    }
    else
    {
      switch(*(_BYTE *)(v10 + 32))
      {
        case 0:
        case 3:
          if (*(unsigned __int8 *)(v10 + 32) - 1 > 2)
            v15 = CFSTR("Downloading");
          else
            v15 = off_1E35DAD30[(*(_BYTE *)(v10 + 32) - 1)];
          v15;
          v16 = _PFAssertFailHandler();
          __84__PHImporter_downloadNextAssetInRecord_toURL_subRecordEnumerator_completionHandler___block_invoke(v16);
          break;
        case 1:
          *(_BYTE *)(v10 + 32) = 0;
          break;
        case 2:
          v12 = objc_msgSend(*(id *)(v10 + 72), "count");
          v13 = *(_QWORD *)(a1 + 40);
          if (v12)
          {
            v11 = objc_msgSend(*(id *)(v13 + 72), "count");
            v10 = v13;
            goto LABEL_15;
          }
          v8 = *(_QWORD *)(a1 + 40);
          goto LABEL_9;
        default:
          return;
      }
    }
  }
}

uint64_t __84__PHImporter_downloadNextAssetInRecord_toURL_subRecordEnumerator_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __84__PHImporter_downloadNextAssetInRecord_toURL_subRecordEnumerator_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __84__PHImporter_downloadNextAssetInRecord_toURL_subRecordEnumerator_completionHandler___block_invoke_3;
  v13[3] = &unk_1E35DAC70;
  v14 = v7;
  v9 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 32);
  v15 = v9;
  v16 = v10;
  v17 = *(id *)(a1 + 56);
  v18 = v5;
  v19 = v6;
  v23 = *(id *)(a1 + 88);
  v20 = *(id *)(a1 + 64);
  v21 = *(id *)(a1 + 72);
  v22 = *(id *)(a1 + 80);
  v11 = v6;
  v12 = v5;
  dispatch_async(v8, v13);

}

uint64_t __84__PHImporter_downloadNextAssetInRecord_toURL_subRecordEnumerator_completionHandler___block_invoke_89(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "downloadNextAssetInRecord:toURL:subRecordEnumerator:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __84__PHImporter_downloadNextAssetInRecord_toURL_subRecordEnumerator_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "timers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopTiming:", *(_QWORD *)(a1 + 40));

  if (*(_BYTE *)(*(_QWORD *)(a1 + 48) + 32) != 3)
  {
    if (*(_QWORD *)(a1 + 72))
    {
      objc_msgSend(*(id *)(a1 + 56), "addException:");
      (*(void (**)(void))(*(_QWORD *)(a1 + 104) + 16))();
      return;
    }
    PLImportGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 64), "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 80);
      *(_DWORD *)buf = 138412546;
      v41 = v8;
      v42 = 2112;
      v43 = v9;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEBUG, "IMPORT DOWNLOAD: completed to path: %@, for asset: %@", buf, 0x16u);

    }
    if (objc_msgSend(*(id *)(a1 + 80), "isTIFF"))
    {
      objc_msgSend(*(id *)(a1 + 80), "url");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        +[PHImportAsset determineIfTIFFIsRAW:url:](PHImportAsset, "determineIfTIFFIsRAW:url:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 64));
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    objc_msgSend(v11, "attributesOfItemAtPath:error:", v12, &v37);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v37;

    if (v13)
    {
      v15 = *MEMORY[0x1E0CB2AA8];
      objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AA8]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "integerValue");

      if ((v17 & 0x80) != 0)
      {
LABEL_22:
        v26 = (void *)MEMORY[0x1E0D73200];
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 160), "photoLibrary");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "managedObjectContextStoreUUID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "persistString:forKey:fileURL:", v28, *MEMORY[0x1E0D73F00], *(_QWORD *)(a1 + 64));

        objc_msgSend(*(id *)(a1 + 64), "path");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setDownloadedPath:", v29);

        objc_msgSend(*(id *)(a1 + 80), "metadata");
        v30 = objc_claimAutoreleasedReturnValue();
        if (!v30)
          goto LABEL_27;
        v31 = (void *)v30;
        if ((!objc_msgSend(*(id *)(a1 + 80), "isJPEG")
           || objc_msgSend(*(id *)(a1 + 80), "isRender"))
          && (objc_msgSend(*(id *)(a1 + 80), "isHEIF") & 1) == 0)
        {

          goto LABEL_30;
        }
        objc_msgSend(*(id *)(a1 + 80), "source");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "isAppleDevice");

        if ((v33 & 1) == 0)
        {
LABEL_27:
          objc_msgSend(*(id *)(a1 + 80), "validateMetadataForImportRecord:", *(_QWORD *)(a1 + 32));
          v34 = objc_claimAutoreleasedReturnValue();
          if (v34)
          {
            v35 = (void *)v34;
            (*(void (**)(void))(*(_QWORD *)(a1 + 104) + 16))();

LABEL_31:
            return;
          }
        }
LABEL_30:
        objc_msgSend(*(id *)(a1 + 48), "downloadNextAssetInRecord:toURL:subRecordEnumerator:completionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104));
        goto LABEL_31;
      }
      v18 = v17 | 0x80;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v15;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "path");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v14;
      v23 = objc_msgSend(v19, "setAttributes:ofItemAtPath:error:", v21, v22, &v36);
      v24 = v36;

      if ((v23 & 1) != 0)
      {
        v14 = v24;
        goto LABEL_22;
      }
      PLImportGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v24;
        _os_log_impl(&dword_1991EC000, v25, OS_LOG_TYPE_ERROR, "Unable to make read-only imported file writeable with error: %@", buf, 0xCu);
      }
      v14 = v24;
    }
    else
    {
      PLImportGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v14;
        _os_log_impl(&dword_1991EC000, v25, OS_LOG_TYPE_ERROR, "Unable to read file attributes at import downloaded file url, error: %@", buf, 0xCu);
      }
    }

    goto LABEL_22;
  }
  PLImportGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(void **)(a1 + 56);
    *(_DWORD *)buf = 138412290;
    v41 = v4;
    _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEBUG, "IMPORT CANCELLED: download completed after cancellation: %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 64), "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setDownloadedPath:", v5);

  objc_msgSend(*(id *)(a1 + 56), "cleanupAfterFailure");
  v6 = (id)objc_msgSend(*(id *)(a1 + 48), "removeImportDirectoryForLibrary:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 160));
}

uint64_t __30__PHImporter_importNextAsset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "importNextAsset:", *(_QWORD *)(a1 + 40));
}

uint64_t __30__PHImporter_importNextAsset___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "importNextAsset:", *(_QWORD *)(a1 + 40));
}

uint64_t __30__PHImporter_importNextAsset___block_invoke_3(uint64_t a1)
{
  int v2;
  id *v3;
  uint64_t v4;
  int v5;
  unint64_t v6;
  void *v8;
  __CFString *v9;
  uint64_t v10;

  v2 = objc_msgSend(*(id *)(a1 + 32), "handleErrorsForRecord:batch:file:line:", *(_QWORD *)(a1 + 40), 0, "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImporter.m", 517);
  v3 = *(id **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "addRecordToResults:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v3[9], "addObject:", *(_QWORD *)(a1 + 40));
    v4 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v4 + 80))
      return objc_msgSend((id)v4, "importNextAsset:", *(_QWORD *)(a1 + 48));
    v5 = *(unsigned __int8 *)(v4 + 32);
    if (*(_BYTE *)(v4 + 32))
    {
      if ((v5 - 2) >= 2)
        return objc_msgSend((id)v4, "importNextAsset:", *(_QWORD *)(a1 + 48));
      v9 = off_1E35DAD30[(v5 - 1)];
      v10 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 80);
      v4 = _PFAssertFailHandler();
    }
    v6 = objc_msgSend(*(id *)(v4 + 72), "count", v9, v10);
    v4 = *(_QWORD *)(a1 + 32);
    if (v6 < *(_QWORD *)(v4 + 128))
      return objc_msgSend((id)v4, "importNextAsset:", *(_QWORD *)(a1 + 48));
    *(_BYTE *)(v4 + 32) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_recordsToImportWithCount:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "importRecords:", v8);

  }
  v4 = *(_QWORD *)(a1 + 32);
  return objc_msgSend((id)v4, "importNextAsset:", *(_QWORD *)(a1 + 48));
}

void __73__PHImporter_ensureEnoughDiskSpaceAvailableIfNeededForAssets_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "approximateBytesRequiredToImport");
  v4 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5 + v3, v4));

}

void __73__PHImporter_ensureEnoughDiskSpaceAvailableIfNeededForAssets_completion___block_invoke_70(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  NSObject *v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void (*v20)(void);
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  _QWORD v26[2];
  _QWORD v27[2];
  uint8_t buf[4];
  const __CFString *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  PLImportGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = CFSTR("NO");
    *(_DWORD *)buf = 138544130;
    if (a2)
      v11 = CFSTR("YES");
    v29 = v11;
    v30 = 2048;
    v31 = a3;
    v32 = 2048;
    v33 = a4;
    v34 = 2112;
    v35 = v9;
    _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_INFO, "Requesting disk space succeeded: %{public}@. Bytes purged: %llu, Additional bytes required: %llu, Error: %@", buf, 0x2Au);
  }

  if (v9)
  {
    v12 = objc_msgSend(v9, "code");
    if (!a2)
    {
      v13 = v12;
      if (objc_msgSend(v9, "code") == 3)
      {
        objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", a4, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = *MEMORY[0x1E0CB2938];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not enough storage space available for import. Additional space required: %@]"), v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v26[1] = CFSTR("MoreSpaceRequired");
        v27[0] = v15;
        v27[1] = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImportErrorDomain"), -5, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "results");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (id)objc_msgSend(v18, "addExceptionWithType:path:underlyingError:file:line:", 5, 0, v17, "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImporter.m", 395);

      }
      else
      {
        if (v13 == 1)
        {
LABEL_14:
          v20 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
          goto LABEL_15;
        }
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v24 = *MEMORY[0x1E0CB3388];
        v25 = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImportErrorDomain"), -8, v22);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "results");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (id)objc_msgSend(v16, "addExceptionWithType:path:underlyingError:file:line:", 6, 0, v14, "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImporter.m", 400);
      }

      goto LABEL_14;
    }
LABEL_10:
    v20 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_15:
    v20();
    goto LABEL_16;
  }
  if ((a2 & 1) != 0)
    goto LABEL_10;
LABEL_16:

}

void __26__PHImporter_beginImport___block_invoke(_QWORD *a1)
{
  id *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v2 = (id *)a1[4];
  objc_msgSend(v2[23], "prefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = a1[5];
  v15 = 0;
  objc_msgSend(v2, "createFolderForPath:inFolder:error:", v3, v4, &v15);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v15;
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "placeholderForCreatedCollectionList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1[7] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  v13 = *(_QWORD *)(a1[8] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v6;

}

+ (void)importAssets:(id)a3 fromImportSource:(id)a4 intoLibrary:(id)a5 withOptions:(id)a6 progress:(id *)a7 delegate:(id)a8 atEnd:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  PHImporter *v20;
  id v21;
  NSObject *v22;
  void *v23;
  PHImportResults *v24;
  uint64_t v25;
  id v26;
  NSObject *importQueue;
  void *v28;
  _QWORD block[4];
  PHImporter *v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = a9;
  v28 = v15;
  if (objc_msgSend(v14, "count"))
  {
    v20 = -[PHImporter initWithLibrary:options:source:delegate:completionHandler:]([PHImporter alloc], "initWithLibrary:options:source:delegate:completionHandler:", v16, v17, v15, v18, v19);
    if (a7)
    {
      if (*a7)
      {
        v21 = *a7;
        objc_msgSend(v21, "setTotalUnitCount:", objc_msgSend(v14, "count"));
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", objc_msgSend(v14, "count"));
        v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a7 = v21;
      }
    }
    else
    {
      v21 = 0;
    }
    objc_msgSend(v21, "setCancellable:", 1);
    objc_initWeak((id *)buf, v20);
    v25 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __92__PHImporter_importAssets_fromImportSource_intoLibrary_withOptions_progress_delegate_atEnd___block_invoke;
    v33[3] = &unk_1E35DE1F8;
    objc_copyWeak(&v34, (id *)buf);
    objc_msgSend(v21, "setCancellationHandler:", v33);
    v26 = v16;
    -[PHImporter setProgress:](v20, "setProgress:", v21);
    importQueue = v20->_importQueue;
    block[0] = v25;
    block[1] = 3221225472;
    block[2] = __92__PHImporter_importAssets_fromImportSource_intoLibrary_withOptions_progress_delegate_atEnd___block_invoke_2;
    block[3] = &unk_1E35DF3B8;
    v30 = v20;
    v31 = v14;
    v32 = v19;
    v24 = v20;
    dispatch_async(importQueue, block);

    v16 = v26;
    objc_destroyWeak(&v34);
    objc_destroyWeak((id *)buf);

LABEL_12:
    goto LABEL_13;
  }
  if (v19)
  {
    PLImportGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v15, "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v23;
      _os_log_impl(&dword_1991EC000, v22, OS_LOG_TYPE_INFO, "Nothing to import from '%{public}@'", buf, 0xCu);

    }
    v24 = objc_alloc_init(PHImportResults);
    (*((void (**)(id, PHImportResults *))v19 + 2))(v19, v24);
    goto LABEL_12;
  }
LABEL_13:

}

+ (id)removeItemAtPath:(id)a3 type:(unint64_t)a4 recursive:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v32;
  id v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(v8, "attributesOfItemAtPath:error:", v7, &v33);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v33;
  if (!v9)
    goto LABEL_21;
  objc_msgSend(v9, "fileType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a4 || v11 != (void *)*MEMORY[0x1E0CB2B28])
  {
    objc_msgSend(v9, "fileType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4 != 1 || v13 != (void *)*MEMORY[0x1E0CB2B20])
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0CB2D50];
      v34[0] = *MEMORY[0x1E0CB2AA0];
      v34[1] = v25;
      v35[0] = v7;
      v26 = CFSTR("file");
      if (a4)
        v26 = CFSTR("folder");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempting to delete '%@' as a %@"), v7, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PHImport"), 2, v28);
      v29 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v29;
      goto LABEL_21;
    }
  }
  else
  {

    v13 = (void *)*MEMORY[0x1E0CB2B20];
  }
  objc_msgSend(v9, "fileType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 == v13)
  {
    objc_msgSend(v8, "enumeratorAtPath:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0CB2D50];
      v38[0] = *MEMORY[0x1E0CB2AA0];
      v38[1] = v17;
      v39[0] = v7;
      v39[1] = CFSTR("Can't get a directory enumerator");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PHImport"), 1, v18);
      v19 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v19;
    }
    if (!v10)
    {
      objc_msgSend(v15, "nextObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        if (!a5)
        {
          v21 = (void *)MEMORY[0x1E0CB35C8];
          v22 = *MEMORY[0x1E0CB2D50];
          v36[0] = *MEMORY[0x1E0CB2AA0];
          v36[1] = v22;
          v37[0] = v7;
          v37[1] = CFSTR("Directory is not empty");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PHImport"), 2, v23);
          v10 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
    }

    if (!v10)
      goto LABEL_17;
  }
  else if (!v10)
  {
LABEL_17:
    v32 = 0;
    objc_msgSend(v8, "removeItemAtPath:error:", v7, &v32);
    v10 = v32;
  }
LABEL_21:
  v30 = v10;

  return v30;
}

+ (void)dumpImageData:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFData *v6;
  const __CFDictionary *v7;
  CGImageSource *v8;
  const __CFDictionary *v9;
  CGImageRef ImageAtIndex;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = *MEMORY[0x1E0CBD288];
  v3 = v13;
  v4 = MEMORY[0x1E0C9AAB0];
  v14[0] = MEMORY[0x1E0C9AAB0];
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = (const __CFData *)a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v8 = CGImageSourceCreateWithData(v6, v7);

  v11 = v3;
  v12 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v8, 0, v9);

  if (ImageAtIndex)
    CFAutorelease(ImageAtIndex);
  CFRelease(v8);
  CGImageWriteToFile();
}

+ (void)dumpMetadataForData:(id)a3
{
  CGImageSource *v3;
  CFDictionaryRef v4;
  NSObject *v5;
  int v6;
  CFDictionaryRef v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CGImageSourceCreateWithData((CFDataRef)a3, 0);
  v4 = CGImageSourceCopyPropertiesAtIndex(v3, 0, 0);
  PLImportGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_INFO, "properties %@", (uint8_t *)&v6, 0xCu);
  }

  CFRelease(v3);
}

void __92__PHImporter_importAssets_fromImportSource_intoLibrary_withOptions_progress_delegate_atEnd___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cancellationHandler");

}

void __92__PHImporter_importAssets_fromImportSource_intoLibrary_withOptions_progress_delegate_atEnd___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "beginImport:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __92__PHImporter_importAssets_fromImportSource_intoLibrary_withOptions_progress_delegate_atEnd___block_invoke_3;
  v5[3] = &unk_1E35DABF0;
  v6 = v3;
  v7 = v2;
  v8 = *(id *)(a1 + 48);
  v4 = v2;
  objc_msgSend(v6, "ensureEnoughDiskSpaceAvailableIfNeededForAssets:completion:", v4, v5);

}

void __92__PHImporter_importAssets_fromImportSource_intoLibrary_withOptions_progress_delegate_atEnd___block_invoke_3(uint64_t a1, int a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "objectEnumerator");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "importNextAsset:");
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "results");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }

}

@end
