@implementation VCPMobileAssetManager

- (VCPMobileAssetManager)init
{
  VCPMobileAssetManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *assetQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *retrieveAssetOnceQueue;
  uint64_t v7;
  NSMutableDictionary *assetsURL;
  uint64_t v9;
  NSMutableSet *assetsNotAvailable;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VCPMobileAssetManager;
  v2 = -[VCPMobileAssetManager init](&v12, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.mediaanalysis.VCPMobileAssetManager", 0);
    assetQueue = v2->_assetQueue;
    v2->_assetQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.mediaanalysis.VCPMobileAssetManager.retrieveAssetOnce", 0);
    retrieveAssetOnceQueue = v2->_retrieveAssetOnceQueue;
    v2->_retrieveAssetOnceQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    assetsURL = v2->_assetsURL;
    v2->_assetsURL = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    assetsNotAvailable = v2->_assetsNotAvailable;
    v2->_assetsNotAvailable = (NSMutableSet *)v9;

  }
  return v2;
}

+ (BOOL)isCaptionOTAEnabled
{
  return 0;
}

+ (BOOL)isOTAFailTestEnabled
{
  return 0;
}

+ (id)sharedManager
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedInstanceWithIdentifier:andCreationBlock:", v4, &__block_literal_global_95);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

VCPMobileAssetManager *__38__VCPMobileAssetManager_sharedManager__block_invoke()
{
  return objc_alloc_init(VCPMobileAssetManager);
}

+ (id)assetName:(int64_t)a3
{
  if ((unint64_t)a3 < 7)
    return off_1E6B1B590[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UnknownType(%lu)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)assetTypeForName:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AXImageCaption")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AXImageCaptionCSU")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AXVideoCaptionEncoder")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AXVideoCaptionDecoder")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MiCaImageCaptionDecoder")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MiCaVideoCaptionDecoder")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Pissarro")))
  {
    v4 = 6;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

+ (id)assetVersion:(int64_t)a3
{
  __CFString *v4;

  v4 = CFSTR("9.5");
  switch(a3)
  {
    case 0:
    case 3:
      return v4;
    case 1:
      v4 = CFSTR("8.3");
      break;
    case 2:
      v4 = CFSTR("3.0");
      break;
    case 4:
    case 5:
      if (+[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision") == 3)
      {
        v4 = CFSTR("3.0.0");
      }
      else
      {
        if (+[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision") != 4)
          goto LABEL_8;
        v4 = CFSTR("4.0.0");
      }
      break;
    case 6:
      v4 = CFSTR("LatestVersion");
      break;
    default:
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UnknownType(%lu)"), a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v4;
}

- (id)cloneAsset:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  NSObject *assetQueue;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__57;
  v21 = __Block_byref_object_dispose__57;
  v22 = 0;
  assetQueue = self->_assetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__VCPMobileAssetManager_cloneAsset_to___block_invoke;
  block[3] = &unk_1E6B1B460;
  v14 = v7;
  v15 = v6;
  v16 = &v17;
  v9 = v6;
  v10 = v7;
  dispatch_sync(assetQueue, block);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __39__VCPMobileAssetManager_cloneAsset_to___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  int v26;
  NSObject *v27;
  const char *v28;
  os_log_type_t v29;
  uint32_t v30;
  id v31;
  const char *v32;
  id v33;
  int v34;
  int v35;
  int *v36;
  char *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  char v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  char *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/tmp/com.apple.mediaanalysisd/"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", *(_QWORD *)(a1 + 32), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = 0;
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "fileExistsAtPath:isDirectory:", v5, &v46);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
    goto LABEL_7;
  }
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v4;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MobileAssetManager] Creating clone directory for asset: %@", buf, 0xCu);
  }
  v45 = 0;
  v8 = objc_msgSend(v2, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v45);
  v7 = v45;
  if ((v8 & 1) != 0)
  {
LABEL_7:
    objc_msgSend(*(id *)(a1 + 40), "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "path");
    v41 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "URLByAppendingPathComponent:isDirectory:", CFSTR("model_info.json"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", CFSTR("model_info.json"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v12;
    objc_msgSend(v12, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v13;
    if (objc_msgSend(v2, "fileExistsAtPath:", v14))
    {
      objc_msgSend(v13, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v2, "fileExistsAtPath:", v15);

      if (!v16)
      {
        v22 = v7;
        v19 = (void *)v11;
        goto LABEL_26;
      }
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v40);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v13);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      v19 = (void *)v11;
      if (v14 && v17)
      {
        v44 = v7;
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v14, 0, &v44);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v44;

        v43 = v20;
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v18, 0, &v43);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v43;

        if (v38 && v21 && objc_msgSend(v38, "isEqualToDictionary:", v21))
        {
          if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v48 = v10;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MobileAssetManager] Same asset already existing at %@, skip cloning", buf, 0xCu);
          }
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v10);

LABEL_47:
          goto LABEL_48;
        }

      }
    }
    else
    {
      v19 = (void *)v11;
    }

    v22 = v7;
LABEL_26:
    objc_msgSend(v10, "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v2, "fileExistsAtPath:isDirectory:", v23, 0);

    if (v24)
    {
      v42 = v22;
      v25 = objc_msgSend(v2, "removeItemAtURL:error:", v10, &v42);
      v7 = v42;

      v26 = MediaAnalysisLogLevel();
      if (v25)
      {
        if (v26 < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          goto LABEL_36;
        *(_DWORD *)buf = 138412290;
        v48 = v10;
        v27 = MEMORY[0x1E0C81028];
        v28 = "[MobileAssetManager] Delete old clone asset at %@";
        v29 = OS_LOG_TYPE_DEBUG;
        v30 = 12;
      }
      else
      {
        if (v26 < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_36;
        *(_DWORD *)buf = 138412546;
        v48 = v10;
        v49 = 2112;
        v50 = v7;
        v27 = MEMORY[0x1E0C81028];
        v28 = "[MobileAssetManager] Could not delete old clone asset at %@ with error: %@";
        v29 = OS_LOG_TYPE_ERROR;
        v30 = 22;
      }
      _os_log_impl(&dword_1B6C4A000, v27, v29, v28, buf, v30);
    }
    else
    {
      v7 = v22;
    }
LABEL_36:
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v48 = v41;
      v49 = 2112;
      v50 = v19;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MobileAssetManager] Cloning asset: '%@' to: '%@'", buf, 0x16u);
    }
    v31 = objc_retainAutorelease(v41);
    v32 = (const char *)objc_msgSend(v31, "UTF8String");
    v33 = objc_retainAutorelease(v19);
    LODWORD(v32) = clonefile(v32, (const char *)objc_msgSend(v33, "UTF8String"), 1u);
    v34 = MediaAnalysisLogLevel();
    if ((_DWORD)v32)
    {
      if (v34 >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v35 = *__error();
        v36 = __error();
        v37 = strerror(*v36);
        *(_DWORD *)buf = 138413314;
        v48 = v31;
        v49 = 2112;
        v50 = v33;
        v51 = 1024;
        v52 = 1;
        v53 = 1024;
        v54 = v35;
        v55 = 2080;
        v56 = v37;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MobileAssetManager] Could not clone asset. clonefile(%@, %@, %o) FAILED with (%d : %s)", buf, 0x2Cu);
      }
    }
    else
    {
      if (v34 >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v10;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MobileAssetManager] Asset successfully cloned at: %@", buf, 0xCu);
      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v10);
    }
    goto LABEL_47;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v48 = v4;
    v49 = 2112;
    v50 = v7;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MobileAssetManager] Could not create clone directory for asset: %@. error: %@", buf, 0x16u);
  }
LABEL_48:

}

- (id)queryMobileAssets
{
  NSObject *assetQueue;
  id v4;
  uint8_t v6[8];
  _QWORD block[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  if (queryMobileAssets_once != -1)
    dispatch_once(&queryMobileAssets_once, &__block_literal_global_402);
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__57;
  v12 = __Block_byref_object_dispose__57;
  v13 = 0;
  assetQueue = self->_assetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__VCPMobileAssetManager_queryMobileAssets__block_invoke_406;
  block[3] = &unk_1E6B19610;
  block[4] = &v8;
  dispatch_sync(assetQueue, block);
  if (!v9[5] && (int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MobileAssetManager] No VCPMobileAsset query results", v6, 2u);
  }
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __42__VCPMobileAssetManager_queryMobileAssets__block_invoke()
{
  _QWORD v0[5];
  uint8_t buf[8];
  uint8_t *v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);
  void (*v5)(uint64_t);
  dispatch_semaphore_t v6;

  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MobileAssetManager] Updating MobileAsset catalog", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v2 = buf;
  v3 = 0x3032000000;
  v4 = __Block_byref_object_copy__57;
  v5 = __Block_byref_object_dispose__57;
  v6 = dispatch_semaphore_create(0);
  v0[0] = MEMORY[0x1E0C809B0];
  v0[1] = 3221225472;
  v0[2] = __42__VCPMobileAssetManager_queryMobileAssets__block_invoke_404;
  v0[3] = &unk_1E6B1B4A8;
  v0[4] = buf;
  objc_msgSend(MEMORY[0x1E0D4E038], "startCatalogDownload:then:", CFSTR("com.apple.MobileAsset.VCPMobileAssets"), v0);
  dispatch_semaphore_wait(*((dispatch_semaphore_t *)v2 + 5), 0xFFFFFFFFFFFFFFFFLL);
  _Block_object_dispose(buf, 8);

}

intptr_t __42__VCPMobileAssetManager_queryMobileAssets__block_invoke_404(uint64_t a1, uint64_t a2)
{
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v5 = 134217984;
    v6 = a2;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MobileAssetManager] Download meta data reply %ld", (uint8_t *)&v5, 0xCu);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

void __42__VCPMobileAssetManager_queryMobileAssets__block_invoke_406(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4E050]), "initWithType:", CFSTR("com.apple.MobileAsset.VCPMobileAssets"));
  v3 = objc_msgSend(v2, "queryMetaDataSync");
  if (v3)
  {
    v4 = v3;
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = 134217984;
      v9 = v4;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MobileAssetManager] Queried asset metadata error with MAQueryResult: %ld", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v2, "results");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (id)downloadMobileAssetIfNeeded:(id)a3 petWatchDog:(id)a4
{
  id v6;
  id v7;
  NSObject *assetQueue;
  id v9;
  _QWORD block[4];
  id v12;
  id v13;
  uint8_t *v14;
  uint8_t buf[8];
  uint8_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    *(_QWORD *)buf = 0;
    v16 = buf;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__57;
    v19 = __Block_byref_object_dispose__57;
    v20 = 0;
    assetQueue = self->_assetQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__VCPMobileAssetManager_downloadMobileAssetIfNeeded_petWatchDog___block_invoke;
    block[3] = &unk_1E6B1B520;
    v12 = v6;
    v13 = v7;
    v14 = buf;
    dispatch_sync(assetQueue, block);
    v9 = *((id *)v16 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MobileAssetManager] Asset to download is nil", buf, 2u);
    }
    v9 = 0;
  }

  return v9;
}

void __65__VCPMobileAssetManager_downloadMobileAssetIfNeeded_petWatchDog___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  unint64_t v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  NSObject *v33;
  uint64_t *v34;
  uint64_t *v35;
  _QWORD v36[4];
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v2 = dispatch_group_create();
  v3 = objc_alloc_init(MEMORY[0x1E0D4E088]);
  objc_msgSend(v3, "setAllowsCellularAccess:", 1);
  objc_msgSend(v3, "setDiscretionary:", 0);
  objc_msgSend(v3, "setTimeoutIntervalForResource:", 110);
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__57;
  v47 = __Block_byref_object_dispose__57;
  v48 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 1 || !objc_msgSend(*(id *)(a1 + 32), "state"))
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v11 = MEMORY[0x1E0C81028];
      v12 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "assetId");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v50 = v13;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MobileAssetManager] Mobile asset %@ not local - downloading", buf, 0xCu);

      }
    }
    v38 = 0;
    if (objc_msgSend(*(id *)(a1 + 32), "spaceCheck:", &v38))
    {
      dispatch_group_enter(v2);
      v14 = MEMORY[0x1E0C809B0];
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __65__VCPMobileAssetManager_downloadMobileAssetIfNeeded_petWatchDog___block_invoke_409;
      v36[3] = &unk_1E6B1B4D0;
      v15 = *(void **)(a1 + 32);
      v37 = *(id *)(a1 + 40);
      objc_msgSend(v15, "attachProgressCallBack:", v36);
      v16 = *(_QWORD *)(a1 + 40);
      if (v16)
        (*(void (**)(void))(v16 + 16))();
      v17 = *(void **)(a1 + 32);
      v32[0] = v14;
      v32[1] = 3221225472;
      v32[2] = __65__VCPMobileAssetManager_downloadMobileAssetIfNeeded_petWatchDog___block_invoke_411;
      v32[3] = &unk_1E6B1B4F8;
      v18 = v2;
      v33 = v18;
      v34 = &v43;
      v35 = &v39;
      objc_msgSend(v17, "startDownload:completionWithError:", v3, v32);

      dispatch_group_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
      v19 = v40[3];
      if (v19 <= 0x1D && ((1 << v19) & 0x2000C001) != 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          v20 = MEMORY[0x1E0C81028];
          v21 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(*(id *)(a1 + 32), "getLocalUrl");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (void *)v40[3];
            *(_DWORD *)buf = 138412546;
            v50 = v22;
            v51 = 2048;
            v52 = v23;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MobileAssetManager] Mobile asset successfully downloaded at:%@ with downloadResult:%ld", buf, 0x16u);

          }
        }
        objc_msgSend(*(id *)(a1 + 32), "getLocalUrl");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v26 = *(void **)(v25 + 40);
        *(_QWORD *)(v25 + 40) = v24;

      }
      else if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v27 = MEMORY[0x1E0C81028];
        v28 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 32), "assetId");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)v40[3];
          objc_msgSend((id)v44[5], "description");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v50 = v29;
          v51 = 2048;
          v52 = v30;
          v53 = 2112;
          v54 = v31;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MobileAssetManager] Mobile asset %@ download failed with MADownloadResult:%ld and error:%@", buf, 0x20u);

        }
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v50 = v38;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MobileAssetManager] Space not available to download asset %lli", buf, 0xCu);
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v4 = MEMORY[0x1E0C81028];
      v5 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "assetId");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "getLocalUrl");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v50 = v6;
        v51 = 2112;
        v52 = v7;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MobileAssetManager] Mobile asset %@ already exists at %@, skip downloading", buf, 0x16u);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "getLocalUrl");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);

}

void __65__VCPMobileAssetManager_downloadMobileAssetIfNeeded_petWatchDog___block_invoke_409(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v5 = 134218240;
    v6 = objc_msgSend(v3, "totalWritten");
    v7 = 2048;
    v8 = objc_msgSend(v3, "totalExpected");
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MobileAssetManager] Progress callback: %lld %lld", (uint8_t *)&v5, 0x16u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(void))(v4 + 16))();

}

void __65__VCPMobileAssetManager_downloadMobileAssetIfNeeded_petWatchDog___block_invoke_411(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = 134217984;
    v8 = a2;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MobileAssetManager] Downloaded asset with result %li", (uint8_t *)&v7, 0xCu);
  }

}

- (id)retrieveAssetLocalURL:(id)a3 assetVersion:(id)a4 petWatchDog:(id)a5 cancelBlock:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD);
  unsigned int (**v13)(_QWORD);
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  NSObject *v21;
  const char *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unsigned int (**v28)(_QWORD);
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  int v34;
  int v35;
  void *v36;
  id v37;
  uint64_t v39;
  int v40;
  void *v41;
  void *v42;
  void (**v43)(_QWORD);
  VCPMobileAssetManager *v44;
  void *v45;
  void *v46;
  id obj;
  id v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  uint8_t v56[128];
  uint8_t buf[4];
  id v58;
  __int16 v59;
  id v60;
  __int16 v61;
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(_QWORD))a5;
  v13 = (unsigned int (**)(_QWORD))a6;
  if (objc_msgSend((id)objc_opt_class(), "isOTAFailTestEnabled"))
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MobileAssetManager] OTAFailTest enabled, asset downloading fail for testing", buf, 2u);
    }
    v14 = 0;
    goto LABEL_52;
  }
  v44 = self;
  if (VCPMAIsAppleInternal())
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "resourceURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v10, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", v17, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0;
    v19 = objc_msgSend(v18, "checkResourceIsReachableAndReturnError:", &v55);
    v20 = v55;
    if (v19)
    {
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v58 = v10;
        v59 = 2112;
        v60 = v11;
        v61 = 2112;
        v62 = (uint64_t)v18;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MobileAssetManager] In-framework asset (%@-%@) available at %@", buf, 0x20u);
      }
      v14 = v18;

      goto LABEL_52;
    }

  }
  else
  {
    v18 = 0;
  }
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v58 = v10;
    v59 = 2112;
    v60 = v11;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MobileAssetManager] Retrieving (download if not present) mobile asset: %@-%@", buf, 0x16u);
  }
  if (v13 && v13[2](v13))
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_49;
    *(_WORD *)buf = 0;
    v21 = MEMORY[0x1E0C81028];
    v22 = "[MobileAssetManager] Cancelled";
LABEL_48:
    _os_log_impl(&dword_1B6C4A000, v21, OS_LOG_TYPE_ERROR, v22, buf, 2u);
LABEL_49:
    v36 = 0;
    v24 = 0;
    obj = 0;
    goto LABEL_50;
  }
  if (v12)
    v12[2](v12);
  -[VCPMobileAssetManager queryMobileAssets](v44, "queryMobileAssets");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_49;
    *(_WORD *)buf = 0;
    v21 = MEMORY[0x1E0C81028];
    v22 = "[MobileAssetManager] No results queried with MobileAsset";
    goto LABEL_48;
  }
  v43 = v12;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v23;
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  v24 = 0;
  if (v50)
  {
    v49 = *(_QWORD *)v52;
    v48 = v10;
    v45 = v11;
    v42 = v18;
LABEL_27:
    v46 = v24;
    v25 = 0;
    while (1)
    {
      if (*(_QWORD *)v52 != v49)
        objc_enumerationMutation(obj);
      v26 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v25);
      v27 = (void *)MEMORY[0x1BCCA1B2C]();
      if (v13 && v13[2](v13))
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v26, "assetId");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v58 = v41;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MobileAssetManager] Cancelled processing %@", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v27);

        v36 = 0;
        v11 = v45;
        v24 = v46;
        v12 = v43;
        v18 = v42;
        goto LABEL_50;
      }
      v28 = v13;
      objc_msgSend(v26, "attributes");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKey:", CFSTR("Model"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKey:", CFSTR("AssetName"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKey:", CFSTR("Version"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v31, "isEqualToString:", v10))
        goto LABEL_39;
      if ((objc_msgSend(v45, "isEqualToString:", CFSTR("LatestVersion")) & 1) != 0
        || objc_msgSend(v32, "isEqualToString:", v45))
      {
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          v58 = v26;
          v59 = 2112;
          v60 = v31;
          v61 = 2112;
          v62 = (uint64_t)v32;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MobileAssetManager] Asset successfully queried: %@ (name %@ ver %@)", buf, 0x20u);
        }
        v33 = v26;

        v34 = 0;
        v35 = 1;
        v46 = v33;
      }
      else
      {
LABEL_39:
        v35 = 0;
        v34 = 1;
      }

      objc_autoreleasePoolPop(v27);
      if (!v34)
        break;
      ++v25;
      v10 = v48;
      v13 = v28;
      if (v50 == v25)
      {
        v11 = v45;
        v24 = v46;
        v18 = v42;
        v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
        if (v50)
          goto LABEL_27;
        goto LABEL_43;
      }
    }

    v11 = v45;
    v13 = v28;
    if (!v35)
    {
      v37 = 0;
      v18 = v42;
      v14 = v42;
      v10 = v48;
      v12 = v43;
      v24 = v46;
      goto LABEL_51;
    }
    v10 = v48;
    v12 = v43;
    v18 = v42;
    v24 = v46;
    if (!v13)
      goto LABEL_60;
  }
  else
  {
LABEL_43:

    v12 = v43;
    if (!v13)
    {
LABEL_60:
      -[VCPMobileAssetManager downloadMobileAssetIfNeeded:petWatchDog:](v44, "downloadMobileAssetIfNeeded:petWatchDog:", v24, v12);
      v39 = objc_claimAutoreleasedReturnValue();

      v40 = MediaAnalysisLogLevel();
      if (v39)
      {
        if (v40 >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          v58 = v10;
          v59 = 2112;
          v60 = v11;
          v61 = 2112;
          v62 = v39;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MobileAssetManager] Asset %@-%@ local url: %@", buf, 0x20u);
        }
        if (v13 && v13[2](v13))
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MobileAssetManager] Cancelled", buf, 2u);
          }
          v36 = 0;
        }
        else
        {
          -[VCPMobileAssetManager cloneAsset:to:](v44, "cloneAsset:to:", v39, v10);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            v58 = v10;
            v59 = 2112;
            v60 = v11;
            v61 = 2112;
            v62 = (uint64_t)v36;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MobileAssetManager] Retrieved asset %@-%@ at: %@", buf, 0x20u);
          }
        }
        v18 = (void *)v39;
      }
      else if (v40 < 3)
      {
        v36 = 0;
        v18 = 0;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v58 = v10;
          v59 = 2112;
          v60 = v11;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MobileAssetManager] Failed to download asset: %@-%@", buf, 0x16u);
        }
        v36 = 0;
        v18 = 0;
      }
      goto LABEL_50;
    }
  }
  if (!v13[2](v13))
    goto LABEL_60;
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MobileAssetManager] Cancelled", buf, 2u);
  }
  v36 = 0;
LABEL_50:
  v37 = v36;
  v14 = v37;
LABEL_51:

LABEL_52:
  return v14;
}

- (id)retrieveAssetLocalURL:(int64_t)a3 petWatchDog:(id)a4 cancelBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  objc_msgSend((id)objc_opt_class(), "assetName:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "assetVersion:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPMobileAssetManager retrieveAssetLocalURL:assetVersion:petWatchDog:cancelBlock:](self, "retrieveAssetLocalURL:assetVersion:petWatchDog:cancelBlock:", v10, v11, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)retrieveAssetLocalURL:(int64_t)a3
{
  return -[VCPMobileAssetManager retrieveAssetLocalURL:petWatchDog:cancelBlock:](self, "retrieveAssetLocalURL:petWatchDog:cancelBlock:", a3, 0, 0);
}

- (id)retrieveAssetOnce:(int64_t)a3 petWatchDog:(id)a4 cancelBlock:(id)a5
{
  id v8;
  id v9;
  NSObject *retrieveAssetOnceQueue;
  id v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v16;
  id v17;
  uint64_t *v18;
  int64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a4;
  v9 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__57;
  v24 = __Block_byref_object_dispose__57;
  v25 = 0;
  retrieveAssetOnceQueue = self->_retrieveAssetOnceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__VCPMobileAssetManager_retrieveAssetOnce_petWatchDog_cancelBlock___block_invoke;
  block[3] = &unk_1E6B1B548;
  v18 = &v20;
  v19 = a3;
  block[4] = self;
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_sync(retrieveAssetOnceQueue, block);
  v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __67__VCPMobileAssetManager_retrieveAssetOnce_petWatchDog_cancelBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  const char *v5;
  os_log_type_t v6;
  uint32_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "assetName:", *(_QWORD *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "assetVersion:", *(_QWORD *)(a1 + 64));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "containsObject:", v2))
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v17 = 138412546;
      v18 = v2;
      v19 = 2112;
      v20 = v3;
      v4 = MEMORY[0x1E0C81028];
      v5 = "[MobileAssetManager] Asset %@-%@ not present and failed to download";
      v6 = OS_LOG_TYPE_ERROR;
      v7 = 22;
LABEL_9:
      _os_log_impl(&dword_1B6C4A000, v4, v6, v5, (uint8_t *)&v17, v7);
    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", v2);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        v17 = 138412802;
        v18 = v2;
        v19 = 2112;
        v20 = v3;
        v21 = 2112;
        v22 = v11;
        v4 = MEMORY[0x1E0C81028];
        v5 = "[MobileAssetManager] Asset %@-%@ present at %@";
        v6 = OS_LOG_TYPE_DEBUG;
        v7 = 32;
        goto LABEL_9;
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "retrieveAssetLocalURL:petWatchDog:cancelBlock:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v16 = *(_QWORD *)(a1 + 32);
      if (v15)
        objc_msgSend(*(id *)(v16 + 24), "setObject:forKeyedSubscript:", v15, v2);
      else
        objc_msgSend(*(id *)(v16 + 32), "addObject:", v2);
    }
  }

}

- (int)purgeAllInstalledAssets
{
  NSObject *assetQueue;
  int v3;
  _QWORD block[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  assetQueue = self->_assetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__VCPMobileAssetManager_purgeAllInstalledAssets__block_invoke;
  block[3] = &unk_1E6B19610;
  block[4] = &v6;
  dispatch_sync(assetQueue, block);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __48__VCPMobileAssetManager_purgeAllInstalledAssets__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, void *);
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[4];
  NSObject *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = dispatch_group_create();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4E050]), "initWithType:", CFSTR("com.apple.MobileAsset.VCPMobileAssets"));
  objc_msgSend(v3, "returnTypes:", 2);
  if (objc_msgSend(v3, "queryMetaDataSync"))
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MobileAssetManager] Mobile asset query failed", buf, 2u);
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -18;
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v21 = v3;
    objc_msgSend(v3, "results");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v27;
      v8 = MEMORY[0x1E0C809B0];
      v9 = __48__VCPMobileAssetManager_purgeAllInstalledAssets__block_invoke_416;
      v10 = &unk_1E6B1B570;
      do
      {
        v11 = 0;
        v22 = v6;
        do
        {
          if (*(_QWORD *)v27 != v7)
            objc_enumerationMutation(v4);
          v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v11);
          if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v12, "attributes");
            v13 = v2;
            v14 = v7;
            v15 = v10;
            v16 = a1;
            v17 = v9;
            v18 = v8;
            v19 = v4;
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v31 = v20;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MobileAssetManager] Requesting purge of asset attributes:%@", buf, 0xCu);

            v4 = v19;
            v8 = v18;
            v9 = v17;
            a1 = v16;
            v10 = v15;
            v7 = v14;
            v2 = v13;
            v6 = v22;
          }
          dispatch_group_enter(v2);
          v23[0] = v8;
          v23[1] = 3221225472;
          v23[2] = v9;
          v23[3] = v10;
          v25 = *(_QWORD *)(a1 + 32);
          v24 = v2;
          objc_msgSend(v12, "purgeWithError:", v23);

          ++v11;
        }
        while (v6 != v11);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v6);
    }

    v3 = v21;
  }
  dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);

}

void __48__VCPMobileAssetManager_purgeAllInstalledAssets__block_invoke_416(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2 != (void *)3 && a2)
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v6;
      v9 = 2048;
      v10 = a2;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MobileAssetManager] Failed to purge the asset with error: (%@) and result: (%ld)", (uint8_t *)&v7, 0x16u);

    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -18;
  }
  else if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = 134217984;
    v8 = a2;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MobileAssetManager] Asset purged successfully %ld", (uint8_t *)&v7, 0xCu);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsNotAvailable, 0);
  objc_storeStrong((id *)&self->_assetsURL, 0);
  objc_storeStrong((id *)&self->_retrieveAssetOnceQueue, 0);
  objc_storeStrong((id *)&self->_assetQueue, 0);
}

@end
