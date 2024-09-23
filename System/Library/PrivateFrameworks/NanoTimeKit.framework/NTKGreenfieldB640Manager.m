@implementation NTKGreenfieldB640Manager

- (NTKGreenfieldB640Manager)init
{
  NTKGreenfieldB640Manager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *serialQueue;
  void *v5;
  void *v6;
  uint64_t v7;
  NTKPersistentFaceCollection *library;
  NSObject *v9;
  uint64_t v10;
  ProductKitCatalog *productKitCatalog;
  uint8_t v13[16];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NTKGreenfieldB640Manager;
  v2 = -[NTKGreenfieldB640Manager init](&v14, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.nanotimekit.NTKGreenfieldB640WatchFacesManager", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

    +[NTKCompanionFaceCollectionsManager sharedInstance](NTKCompanionFaceCollectionsManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sharedFaceCollectionForDevice:forCollectionIdentifier:", v6, CFSTR("LibraryFaces"));
    v7 = objc_claimAutoreleasedReturnValue();
    library = v2->_library;
    v2->_library = (NTKPersistentFaceCollection *)v7;

    v2->_state = 0;
    -[NTKFaceCollection addObserver:](v2->_library, "addObserver:", v2);
    if (-[NTKPersistentFaceCollection hasLoaded](v2->_library, "hasLoaded"))
    {
      _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "B640 manager init - face library is loaded.", v13, 2u);
      }

      -[NTKGreenfieldB640Manager _setLibraryState:](v2, "_setLibraryState:", 2);
    }
    else
    {
      -[NTKGreenfieldB640Manager _startLibraryTimeoutTimer](v2, "_startLibraryTimeoutTimer");
    }
    v10 = objc_opt_new();
    productKitCatalog = v2->_productKitCatalog;
    v2->_productKitCatalog = (ProductKitCatalog *)v10;

  }
  return v2;
}

- (void)decodeUrl:(id)a3 sourceApplicationBundleIdentifier:(id)a4
{
  id v7;
  NSString *v8;
  NSString *scannedCodeIdentifier;
  id WeakRetained;
  id v11;

  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, a4);
  v7 = a4;
  v11 = a3;
  objc_msgSend(v11, "lastPathComponent");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  scannedCodeIdentifier = self->_scannedCodeIdentifier;
  self->_scannedCodeIdentifier = v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didStartDecodingWatchFaces:", self);

  -[NTKGreenfieldB640Manager _handleProductKitUrl:](self, "_handleProductKitUrl:", v11);
}

- (void)_handleProductKitUrl:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *serialQueue;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_state = 1;
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v4;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "B640 __handleProductKitUrl: %@", buf, 0xCu);
  }

  objc_msgSend(v4, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("="));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x1E0D81858], "isProductKitURL:", v9) & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = 14;
LABEL_8:
    objc_msgSend(v13, "greenfield_addWatchFaceErrorWithCode:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKGreenfieldB640Manager _handleB640WatchFaceManagerDidFinishWithError:watchFaceModels:](self, "_handleB640WatchFaceManagerDidFinishWithError:watchFaceModels:", v15, 0);

    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nrDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = 3;
    goto LABEL_8;
  }
  serialQueue = self->_serialQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __49__NTKGreenfieldB640Manager__handleProductKitUrl___block_invoke;
  v16[3] = &unk_1E6BCD778;
  v16[4] = self;
  v17 = v9;
  dispatch_async(serialQueue, v16);

LABEL_9:
}

void __49__NTKGreenfieldB640Manager__handleProductKitUrl___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  void *v8;
  NSObject *v9;
  dispatch_semaphore_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  dispatch_time_t v16;
  dispatch_semaphore_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  dispatch_time_t v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  NSObject *v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  NSObject *v31;
  _QWORD block[6];
  _QWORD v33[4];
  id v34;
  NSObject *v35;
  _QWORD *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  _QWORD v42[5];
  id v43;
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__34;
  v42[4] = __Block_byref_object_dispose__34;
  v43 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v2 = dispatch_semaphore_create(0);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  v5 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __49__NTKGreenfieldB640Manager__handleProductKitUrl___block_invoke_13;
  v33[3] = &unk_1E6BD5AF8;
  v34 = v3;
  v36 = v42;
  v37 = &v38;
  v6 = v2;
  v35 = v6;
  objc_msgSend(v4, "updateCatalogWithCompletionHandler:", v33);
  v7 = dispatch_time(0, 15000000000);
  dispatch_semaphore_wait(v6, v7);
  if (*((_BYTE *)v39 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(*(id *)(a1 + 32), "bandVariantForPairedDevice"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v8;
      _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "B640 device identifier is:%@", buf, 0xCu);
    }

    v10 = dispatch_semaphore_create(0);
    v11 = *(void **)(a1 + 40);
    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
    v28[0] = v5;
    v28[1] = 3221225472;
    v28[2] = __49__NTKGreenfieldB640Manager__handleProductKitUrl___block_invoke_22;
    v28[3] = &unk_1E6BD5B48;
    v13 = v11;
    v14 = *(_QWORD *)(a1 + 32);
    v29 = v13;
    v30 = v14;
    v15 = v10;
    v31 = v15;
    objc_msgSend(v12, "watchBandImageForFeatureWithURL:featureString:variant:completionHandler:", v13, CFSTR("band"), v8, v28);
    v16 = dispatch_time(0, 15000000000);
    dispatch_semaphore_wait(v15, v16);
    v17 = dispatch_semaphore_create(0);
    v18 = *(void **)(a1 + 40);
    v19 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
    v24[0] = v5;
    v24[1] = 3221225472;
    v24[2] = __49__NTKGreenfieldB640Manager__handleProductKitUrl___block_invoke_24;
    v24[3] = &unk_1E6BD4590;
    v20 = v18;
    v21 = *(_QWORD *)(a1 + 32);
    v25 = v20;
    v26 = v21;
    v22 = v17;
    v27 = v22;
    objc_msgSend(v19, "watchBandFilesForFeatureWithURL:featureString:completionHandler:", v20, CFSTR("watchfaces"), v24);
    v23 = dispatch_time(0, 15000000000);
    dispatch_semaphore_wait(v22, v23);

  }
  else
  {
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __49__NTKGreenfieldB640Manager__handleProductKitUrl___block_invoke_17;
    block[3] = &unk_1E6BD1498;
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = v42;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(v42, 8);

}

void __49__NTKGreenfieldB640Manager__handleProductKitUrl___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "absoluteString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v5;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "B640 _failed update asset catalog with bandURL:%@ error:%@", (uint8_t *)&v9, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "greenfield_addWatchFaceErrorWithCode:message:", 15, CFSTR("Failed to update asset catalog"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

uint64_t __49__NTKGreenfieldB640Manager__handleProductKitUrl___block_invoke_17(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "greenfield_addWatchFaceErrorWithCode:message:", 15, CFSTR("Failed to update asset catalog"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_handleB640WatchFaceManagerDidFinishWithError:watchFaceModels:", v2, 0);
}

void __49__NTKGreenfieldB640Manager__handleProductKitUrl___block_invoke_22(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __49__NTKGreenfieldB640Manager__handleProductKitUrl___block_invoke_2;
  v16[3] = &unk_1E6BD5B20;
  v17 = v9;
  v10 = *(id *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(void **)(a1 + 48);
  v18 = v10;
  v19 = v11;
  v20 = v8;
  v21 = v7;
  v22 = v12;
  v13 = v7;
  v14 = v8;
  v15 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v16);

}

intptr_t __49__NTKGreenfieldB640Manager__handleProductKitUrl___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "absoluteString");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v3;
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "B640 _failed to retrieve watch band image path and bundle with bandURL:%@ error:%@", (uint8_t *)&v6, 0x16u);

    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 96), *(id *)(a1 + 56));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 104), *(id *)(a1 + 64));
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));
}

void __49__NTKGreenfieldB640Manager__handleProductKitUrl___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__NTKGreenfieldB640Manager__handleProductKitUrl___block_invoke_2_25;
  v11[3] = &unk_1E6BD17F0;
  v12 = v6;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v13 = v7;
  v14 = v8;
  v15 = v5;
  v9 = v5;
  v10 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v11);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void __49__NTKGreenfieldB640Manager__handleProductKitUrl___block_invoke_2_25(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "absoluteString");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v3;
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "B640 _failed to retrieve watch faces  with bandURL:%@ error:%@", (uint8_t *)&v6, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "greenfield_addWatchFaceErrorWithCode:message:", 15, CFSTR("Failed to retrieve watch faces"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "_handleB640WatchFaceManagerDidFinishWithError:watchFaceModels:", v5, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "_decodeWatchFacesUrls:", *(_QWORD *)(a1 + 56));
  }
}

- (void)_decodeWatchFacesUrls:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *serialQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  NTKGreenfieldB640Manager *v15;
  uint8_t buf[16];

  v4 = a3;
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "B640 did start to decode urls", buf, 2u);
  }

  self->_state = 2;
  if (objc_msgSend(v4, "count"))
  {
    v6 = (void *)objc_opt_new();
    v7 = (void *)objc_opt_new();
    serialQueue = self->_serialQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __50__NTKGreenfieldB640Manager__decodeWatchFacesUrls___block_invoke;
    v11[3] = &unk_1E6BD17F0;
    v12 = v4;
    v13 = v7;
    v14 = v6;
    v15 = self;
    v9 = v6;
    v10 = v7;
    dispatch_async(serialQueue, v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "greenfield_addWatchFaceErrorWithCode:", 15);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[NTKGreenfieldB640Manager _handleB640WatchFaceManagerDidFinishWithError:watchFaceModels:](self, "_handleB640WatchFaceManagerDidFinishWithError:watchFaceModels:", v10, 0);
  }

}

void __50__NTKGreenfieldB640Manager__decodeWatchFacesUrls___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  dispatch_semaphore_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  dispatch_time_t v16;
  dispatch_semaphore_t v17;
  void *v18;
  NSObject *v19;
  dispatch_time_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  id v44;
  id obj;
  id obja;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  int8x16_t v51;
  _QWORD block[4];
  int8x16_t v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[4];
  NSObject *v69;
  _BYTE *v70;
  uint64_t *v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  _QWORD v85[4];
  id v86;
  id v87;
  id v88;
  id v89;
  dispatch_semaphore_t v90;
  id v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  _BYTE v97[128];
  uint8_t v98[128];
  uint8_t v99[4];
  uint64_t v100;
  __int16 v101;
  uint64_t v102;
  __int16 v103;
  uint64_t v104;
  _BYTE buf[24];
  uint64_t (*v106)(uint64_t, uint64_t);
  void (*v107)(uint64_t);
  id v108;
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  obj = *(id *)(a1 + 32);
  v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v109, 16);
  if (v49)
  {
    v47 = *(_QWORD *)v93;
    do
    {
      v1 = 0;
      do
      {
        if (*(_QWORD *)v93 != v47)
          objc_enumerationMutation(obj);
        v2 = *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * v1);
        v3 = dispatch_semaphore_create(0);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        NSTemporaryDirectory();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "UUIDString");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "stringByAppendingPathComponent:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = 0;
        objc_msgSend(v4, "copyItemAtURL:toURL:error:", v2, v9, &v91);
        v10 = (uint64_t (*)(uint64_t, uint64_t))v91;
        if (v10)
        {
          _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v2;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v9;
            *(_WORD *)&buf[22] = 2112;
            v106 = v10;
            _os_log_error_impl(&dword_1B72A3000, v11, OS_LOG_TYPE_ERROR, "Failed to copy file from Mobile Asset URL:%@ to Bridge container URL:%@ with error:%@", buf, 0x20u);
          }

        }
        _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v9;
          _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEFAULT, "B640 did start to decoding url:%@", buf, 0xCu);
        }

        v85[0] = MEMORY[0x1E0C809B0];
        v85[1] = 3221225472;
        v85[2] = __50__NTKGreenfieldB640Manager__decodeWatchFacesUrls___block_invoke_33;
        v85[3] = &unk_1E6BD5B70;
        v86 = v9;
        v87 = *(id *)(a1 + 40);
        v88 = *(id *)(a1 + 48);
        v89 = v4;
        v90 = v3;
        v13 = v3;
        v14 = v4;
        v15 = v9;
        +[NTKGreenfieldUtilities decodeWatchFaceFromUrl:completionBlock:](NTKGreenfieldUtilities, "decodeWatchFaceFromUrl:completionBlock:", v15, v85);
        v16 = dispatch_time(0, 15000000000);
        dispatch_semaphore_wait(v13, v16);

        ++v1;
      }
      while (v49 != v1);
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v109, 16);
    }
    while (v49);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v106 = __Block_byref_object_copy__34;
  v107 = __Block_byref_object_dispose__34;
  v108 = 0;
  v79 = 0;
  v80 = &v79;
  v81 = 0x3032000000;
  v82 = __Block_byref_object_copy__34;
  v83 = __Block_byref_object_dispose__34;
  v84 = 0;
  v73 = 0;
  v74 = &v73;
  v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__34;
  v77 = __Block_byref_object_dispose__34;
  v78 = 0;
  v17 = dispatch_semaphore_create(0);
  +[NTKGreenfieldCompanionAppInstallationMonitor sharedMonitor](NTKGreenfieldCompanionAppInstallationMonitor, "sharedMonitor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v68[2] = __50__NTKGreenfieldB640Manager__decodeWatchFacesUrls___block_invoke_37;
  v68[3] = &unk_1E6BD4BD0;
  v70 = buf;
  v71 = &v79;
  v72 = &v73;
  v19 = v17;
  v69 = v19;
  objc_msgSend(v18, "fetchInstalledAppsOnWatchWithCompletionBlock:", v68);
  v43 = v18;
  v20 = dispatch_time(0, 15000000000);
  v42 = v19;
  dispatch_semaphore_wait(v19, v20);
  if (!v74[5] && *(_QWORD *)(*(_QWORD *)&buf[8] + 40) && v80[5])
  {
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v44 = *(id *)(a1 + 48);
    v36 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v56, v96, 16);
    if (v36)
    {
      v37 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v57 != v37)
            objc_enumerationMutation(v44);
          v39 = *(void **)(a1 + 56);
          objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "decodedRecipe");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "_updateComplicationForDecodedRecipe:installedItemIds:installedBundleIds:", v40, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v80[5]);

        }
        v36 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v56, v96, 16);
      }
      while (v36);
    }
  }
  else
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v74[5];
      v23 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      v24 = v80[5];
      *(_DWORD *)v99 = 138412802;
      v100 = v22;
      v101 = 2112;
      v102 = v23;
      v103 = 2112;
      v104 = v24;
      _os_log_impl(&dword_1B72A3000, v21, OS_LOG_TYPE_DEFAULT, "Setting all complications to nil, error:%@, localResultsItemIds:%@, installedBundleIds:%@", v99, 0x20u);
    }

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v44 = *(id *)(a1 + 48);
    v25 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v64, v98, 16);
    if (v25)
    {
      obja = *(id *)v65;
      do
      {
        v48 = v25;
        for (j = 0; j != v48; ++j)
        {
          if (*(id *)v65 != obja)
            objc_enumerationMutation(v44);
          objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * j), "decodedRecipe");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "complicationSlotToTemplateMapping");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = 0u;
          v63 = 0u;
          v61 = 0u;
          v60 = 0u;
          v50 = v28;
          objc_msgSend(v28, "allKeys");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v60, v97, 16);
          if (v30)
          {
            v31 = *(_QWORD *)v61;
            do
            {
              for (k = 0; k != v30; ++k)
              {
                if (*(_QWORD *)v61 != v31)
                  objc_enumerationMutation(v29);
                v33 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * k);
                objc_msgSend(v27, "watchFace");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                +[NTKComplication nullComplication](NTKComplication, "nullComplication");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "setComplication:forSlot:", v35, v33);

              }
              v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v60, v97, 16);
            }
            while (v30);
          }

        }
        v25 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v64, v98, 16);
      }
      while (v25);
    }
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__NTKGreenfieldB640Manager__decodeWatchFacesUrls___block_invoke_40;
  block[3] = &unk_1E6BCDCB8;
  v51 = *(int8x16_t *)(a1 + 48);
  v41 = (id)v51.i64[0];
  v54 = vextq_s8(v51, v51, 8uLL);
  v55 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v79, 8);

  _Block_object_dispose(buf, 8);
}

void __50__NTKGreenfieldB640Manager__decodeWatchFacesUrls___block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NTKGreenfieldB640WatchFaceModel *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v16 = v8;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "B640 did finish decoding url:%@ with error:%@", buf, 0x16u);
  }

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  }
  else if (v5)
  {
    v9 = -[NTKGreenfieldB640WatchFaceModel initWithDecodedRecipe:]([NTKGreenfieldB640WatchFaceModel alloc], "initWithDecodedRecipe:", v5);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);

  }
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 56);
  v14 = 0;
  objc_msgSend(v11, "removeItemAtURL:error:", v10, &v14);
  v12 = v14;
  if (v12)
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __50__NTKGreenfieldB640Manager__decodeWatchFacesUrls___block_invoke_33_cold_1((uint64_t *)(a1 + 32), (uint64_t)v12, v13);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));

}

void __50__NTKGreenfieldB640Manager__decodeWatchFacesUrls___block_invoke_37(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a4);
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v15 = 138412802;
    v16 = v12;
    v17 = 2112;
    v18 = v13;
    v19 = 2112;
    v20 = v14;
    _os_log_impl(&dword_1B72A3000, v11, OS_LOG_TYPE_DEFAULT, "B640 did finish fetching installed apps with error:%@, installedItemIds:%@, installedBundleIds:%@", (uint8_t *)&v15, 0x20u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __50__NTKGreenfieldB640Manager__decodeWatchFacesUrls___block_invoke_40(id *a1)
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;

  *((_QWORD *)a1[4] + 9) = 3;
  v2 = objc_msgSend(a1[5], "copy");
  v3 = a1[4];
  v4 = (void *)v3[4];
  v3[4] = v2;

  v5 = objc_msgSend(a1[6], "copy");
  v6 = a1[4];
  v7 = (void *)v6[6];
  v6[6] = v5;

  return objc_msgSend(a1[4], "_moveToDecodeStateCompletedIfPossible");
}

- (void)_updateComplicationForDecodedRecipe:(id)a3 installedItemIds:(id)a4 installedBundleIds:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "watchFace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NTKRestrictedComplicationsForDevice(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_opt_new();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __100__NTKGreenfieldB640Manager__updateComplicationForDecodedRecipe_installedItemIds_installedBundleIds___block_invoke;
  v31[3] = &unk_1E6BD4BA8;
  v14 = v10;
  v32 = v14;
  v25 = v12;
  v33 = v25;
  v26 = v7;
  v34 = v26;
  v15 = v9;
  v35 = v15;
  v16 = v8;
  v36 = v16;
  v17 = v13;
  v37 = v17;
  objc_msgSend(v14, "enumerateComplicationSlotsWithBlock:", v31);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = v17;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v28;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v22);
        +[NTKComplication nullComplication](NTKComplication, "nullComplication", v25, v26, (_QWORD)v27);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setComplication:forSlot:", v24, v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
    }
    while (v20);
  }

}

void __100__NTKGreenfieldB640Manager__updateComplicationForDecodedRecipe_installedItemIds_installedBundleIds___block_invoke(id *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  id v17;

  v17 = a2;
  objc_msgSend(a1[4], "complicationForSlot:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "complication");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  if (objc_msgSend(v3, "complicationType"))
  {
    objc_msgSend(v3, "appIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = NTKCanAddInternalComplicationWithBundleId(v5);

    if (v6 && (objc_msgSend(a1[5], "containsIndex:", objc_msgSend(v3, "complicationType")) & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = objc_msgSend(a1[4], "preferredComplicationFamilyForComplication:withSlot:", v3, v17);
        +[NTKBundleComplicationManager sharedManager](NTKBundleComplicationManager, "sharedManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "device");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "dataSourceClassForBundleComplication:withFamily:andDevice:factorInMigration:", v3, v7, v9, 1);

        if (v10)
          goto LABEL_7;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_7;
        objc_msgSend(a1[6], "complicationSlotToItemIdMapping");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 && objc_msgSend(v12, "intValue"))
        {
          v13 = objc_msgSend(a1[8], "containsObject:", v12);

          if ((v13 & 1) != 0)
            goto LABEL_7;
        }
        else
        {
          objc_msgSend(a1[6], "complicationSlotToBundleIdMapping");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            v16 = objc_msgSend(a1[7], "containsObject:", v15);

            if ((v16 & 1) != 0)
              goto LABEL_7;
          }
          else
          {

          }
        }
      }
    }
    objc_msgSend(a1[9], "addObject:", v17);
  }
LABEL_7:

}

- (void)_moveToDecodeStateCompletedIfPossible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  unint64_t state;
  const char *v14;
  uint64_t v15;
  unint64_t libraryState;
  unint64_t v17;
  NTKGreenfieldAddWatchFaceManager *v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NTKGreenfieldB640Model *v28;
  NTKGreenfieldB640Model *greenfieldB640Model;
  NSObject *v30;
  void *v31;
  id WeakRetained;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  unint64_t v57;
  __int16 v58;
  uint64_t v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  if (self->_state != 3)
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:

      return;
    }
    state = self->_state;
    *(_DWORD *)buf = 134217984;
    v57 = state;
    v14 = "B640 waiting for decode completion with decoding state: %lu.";
LABEL_8:
    _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nrDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = 3;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("21EB4560-EFA0-46AA-B75C-401D30C5BBF1"));
  v7 = objc_msgSend(v5, "supportsCapability:", v6);

  if ((v7 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = 12;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isTinker");

  if (!v9)
  {
    libraryState = self->_libraryState;
    if (libraryState != 1)
    {
      if (!libraryState)
      {
        _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          goto LABEL_9;
        v17 = self->_libraryState;
        *(_DWORD *)buf = 134217984;
        v57 = v17;
        v14 = "B640 waiting for library to load, library state is: %lu.";
        goto LABEL_8;
      }
      if (-[NTKPersistentFaceCollection hasLoaded](self->_library, "hasLoaded"))
      {
        v12 = objc_opt_new();
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_watchFacesDecodeErrors);
        v47 = (id)objc_claimAutoreleasedReturnValue();
        v45 = objc_opt_new();
        v18 = objc_alloc_init(NTKGreenfieldAddWatchFaceManager);
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v19 = self->_watchFacesModels;
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v53;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v53 != v22)
                objc_enumerationMutation(v19);
              v24 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
              objc_msgSend(v24, "decodedRecipe", v45);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[NTKGreenfieldAddWatchFaceManager canAddWatchFaceFromDecodedRecipe:toLibrary:](v18, "canAddWatchFaceFromDecodedRecipe:toLibrary:", v25, self->_library);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = v12;
              if (v26)
              {
                objc_msgSend(v47, "addObject:", v26);
                v27 = (void *)v45;
              }
              objc_msgSend(v27, "addObject:", v24);

            }
            v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
          }
          while (v21);
        }

        if (-[NSObject count](v12, "count"))
        {
          v28 = -[NTKGreenfieldB640Model initWithWatchFaceModels:error:bandImagePath:bandImageBundle:]([NTKGreenfieldB640Model alloc], "initWithWatchFaceModels:error:bandImagePath:bandImageBundle:", v12, 0, self->_bandImagePath, self->_bandImageBundle);
          greenfieldB640Model = self->_greenfieldB640Model;
          self->_greenfieldB640Model = v28;

          _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = v47;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B72A3000, v30, OS_LOG_TYPE_DEFAULT, "B640 did finish to decode urls", buf, 2u);
          }

          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(WeakRetained, "greenfieldB640WatchFacesManager:updateStateToSelectWatchFacesState:", self, self->_greenfieldB640Model);

          self->_state = 4;
          v33 = (void *)v45;
        }
        else
        {
          v31 = v47;
          if (objc_msgSend(v47, "count"))
          {
            objc_msgSend(v47, "firstObject");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "code");
            v48 = 0u;
            v49 = 0u;
            v50 = 0u;
            v51 = 0u;
            v36 = v47;
            v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
            if (v37)
            {
              v38 = v37;
              v39 = *(_QWORD *)v49;
              while (2)
              {
                for (j = 0; j != v38; ++j)
                {
                  if (*(_QWORD *)v49 != v39)
                    objc_enumerationMutation(v36);
                  v41 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
                  if (v35 != objc_msgSend(v41, "code", v45))
                  {
                    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
                    v42 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                    {
                      v43 = objc_msgSend(v41, "code");
                      *(_DWORD *)buf = 134218240;
                      v57 = v35;
                      v58 = 2048;
                      v59 = v43;
                      _os_log_impl(&dword_1B72A3000, v42, OS_LOG_TYPE_DEFAULT, "B640 encountered different error codes errorCode:%ld and code:%ld:", buf, 0x16u);
                    }

                    objc_msgSend(MEMORY[0x1E0CB35C8], "greenfield_addWatchFaceErrorWithCode:", 16);
                    v44 = objc_claimAutoreleasedReturnValue();

                    v34 = (void *)v44;
                    goto LABEL_46;
                  }
                }
                v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
                if (v38)
                  continue;
                break;
              }
LABEL_46:
              v31 = v47;
            }
            v33 = (void *)v45;

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "greenfield_addWatchFaceErrorWithCode:", 16);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = (void *)v45;
          }
          -[NTKGreenfieldB640Manager _handleB640WatchFaceManagerDidFinishWithError:watchFaceModels:](self, "_handleB640WatchFaceManagerDidFinishWithError:watchFaceModels:", v34, v33, v45);

        }
        goto LABEL_9;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "greenfield_addWatchFaceErrorWithCode:message:", 9, CFSTR("Library failed to load."));
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v10 = (void *)MEMORY[0x1E0CB35C8];
  v11 = 13;
LABEL_12:
  objc_msgSend(v10, "greenfield_addWatchFaceErrorWithCode:", v11);
  v15 = objc_claimAutoreleasedReturnValue();
LABEL_13:
  v46 = (id)v15;
  -[NTKGreenfieldB640Manager _handleB640WatchFaceManagerDidFinishWithError:watchFaceModels:](self, "_handleB640WatchFaceManagerDidFinishWithError:watchFaceModels:");

}

- (void)_startLibraryTimeoutTimer
{
  NSObject *v3;
  void *v4;
  NSTimer *v5;
  NSTimer *libraryTimeoutTimer;
  _QWORD v7[4];
  id v8;
  id buf[2];

  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "B640 _startLibraryTimeoutTimer", (uint8_t *)buf, 2u);
  }

  -[NTKGreenfieldB640Manager _setLibraryState:](self, "_setLibraryState:", 0);
  -[NSTimer invalidate](self->_libraryTimeoutTimer, "invalidate");
  objc_initWeak(buf, self);
  v4 = (void *)MEMORY[0x1E0C99E88];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__NTKGreenfieldB640Manager__startLibraryTimeoutTimer__block_invoke;
  v7[3] = &unk_1E6BCDE70;
  objc_copyWeak(&v8, buf);
  objc_msgSend(v4, "scheduledTimerWithTimeInterval:repeats:block:", 0, v7, 10.0);
  v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  libraryTimeoutTimer = self->_libraryTimeoutTimer;
  self->_libraryTimeoutTimer = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(buf);
}

void __53__NTKGreenfieldB640Manager__startLibraryTimeoutTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_libraryTimeoutTimerFired");

}

- (void)_libraryTimeoutTimerFired
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "B640 _libraryTimeoutTimerFired", v1, 2u);
}

- (void)_cancelLibraryTimeoutTimer
{
  NSObject *v3;
  NSTimer *libraryTimeoutTimer;
  uint8_t v5[16];

  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "B640 _cancelLibraryTimeoutTimer", v5, 2u);
  }

  -[NSTimer invalidate](self->_libraryTimeoutTimer, "invalidate");
  libraryTimeoutTimer = self->_libraryTimeoutTimer;
  self->_libraryTimeoutTimer = 0;

}

- (void)faceCollectionDidLoad:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "B640 faceCollectionDidLoad", v5, 2u);
  }

  -[NTKGreenfieldB640Manager _cancelLibraryTimeoutTimer](self, "_cancelLibraryTimeoutTimer");
  -[NTKGreenfieldB640Manager _setLibraryState:](self, "_setLibraryState:", 2);
}

- (void)_setLibraryState:(unint64_t)a3
{
  NSObject *v5;
  unint64_t v6;
  NSObject *v7;
  unint64_t libraryState;
  int v9;
  unint64_t v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_libraryState - 1 > 1)
  {
    self->_libraryState = a3;
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      libraryState = self->_libraryState;
      v9 = 134217984;
      v10 = libraryState;
      _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "B640 library state updated to: %lu", (uint8_t *)&v9, 0xCu);
    }

    if (self->_libraryState - 1 <= 1)
      -[NTKGreenfieldB640Manager _moveToDecodeStateCompletedIfPossible](self, "_moveToDecodeStateCompletedIfPossible");
  }
  else
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = self->_libraryState;
      v9 = 134218240;
      v10 = a3;
      v11 = 2048;
      v12 = v6;
      _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "B640 setLibraryState called with state: %lu, when current state is: %lu", (uint8_t *)&v9, 0x16u);
    }

  }
}

- (void)_handleB640WatchFaceManagerDidFinishWithError:(id)a3 watchFaceModels:(id)a4
{
  id v7;
  id v8;
  unint64_t state;
  NTKGreenfieldB640Model *v10;
  _BOOL4 v11;
  id WeakRetained;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  state = self->_state;
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v10 = (NTKGreenfieldB640Model *)objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEFAULT);
  if (state == 5)
  {
    if (v11)
    {
      v13 = 138412290;
      v14 = v7;
      _os_log_impl(&dword_1B72A3000, &v10->super, OS_LOG_TYPE_DEFAULT, "B640 did tried to present another error while NTKGreenfieldB640ManagerStateError: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    if (v11)
    {
      v13 = 138412290;
      v14 = v7;
      _os_log_impl(&dword_1B72A3000, &v10->super, OS_LOG_TYPE_DEFAULT, "B640 _handleB640WatchFaceManagerDidFinishWithError: %@", (uint8_t *)&v13, 0xCu);
    }

    objc_storeStrong((id *)&self->_error, a3);
    self->_state = 5;
    v10 = -[NTKGreenfieldB640Model initWithWatchFaceModels:error:bandImagePath:bandImageBundle:]([NTKGreenfieldB640Model alloc], "initWithWatchFaceModels:error:bandImagePath:bandImageBundle:", v8, v7, self->_bandImagePath, self->_bandImageBundle);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "greenfieldB640WatchFacesManager:updateStateToError:", self, v10);

  }
}

- (void)handleAddToMyFacesAction
{
  NTKGreenfieldAddWatchFaceManager *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSUUID *v20;
  NSUUID *addedFaceID;
  void *v22;
  void *v23;
  id v24;
  NTKFace *v25;
  NTKFace *watchFaceAddedToLibrary;
  id WeakRetained;
  _QWORD v28[4];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(NTKGreenfieldAddWatchFaceManager);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[NTKGreenfieldB640Model watchFaceModels](self->_greenfieldB640Model, "watchFaceModels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v8);
      if (objc_msgSend(v9, "isSelected"))
      {
        objc_msgSend(v9, "decodedRecipe");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKGreenfieldAddWatchFaceManager canAddWatchFaceFromDecodedRecipe:toLibrary:](v3, "canAddWatchFaceFromDecodedRecipe:toLibrary:", v10, self->_library);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          break;
      }
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  -[NTKGreenfieldB640Model watchFaceModels](self->_greenfieldB640Model, "watchFaceModels");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13 - 1 >= 0)
  {
    v14 = MEMORY[0x1E0C809B0];
    do
    {
      --v13;
      -[NTKGreenfieldB640Model watchFaceModels](self->_greenfieldB640Model, "watchFaceModels");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndex:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v16, "isSelected"))
      {
        objc_msgSend(v16, "decodedRecipe");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "watchFace");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v18, "copy");

        if (!objc_msgSend(v19, "origin"))
          objc_msgSend(v19, "setOrigin:", 13);
        -[NTKFaceCollection appendFace:suppressingCallbackToObserver:](self->_library, "appendFace:suppressingCallbackToObserver:", v19, 0);
        -[NTKFaceCollection setSelectedFace:suppressingCallbackToObserver:](self->_library, "setSelectedFace:suppressingCallbackToObserver:", v19, 0);
        -[NTKFaceCollection selectedUUID](self->_library, "selectedUUID");
        v20 = (NSUUID *)objc_claimAutoreleasedReturnValue();
        addedFaceID = self->_addedFaceID;
        self->_addedFaceID = v20;

        if (objc_msgSend(v19, "editedState") == 2)
        {
          objc_msgSend(v19, "lastEditedDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setCreationDate:", v22);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setCreationDate:", v23);

          objc_msgSend(v19, "setEditedState:", 1);
        }
        v28[0] = v14;
        v28[1] = 3221225472;
        v28[2] = __52__NTKGreenfieldB640Manager_handleAddToMyFacesAction__block_invoke;
        v28[3] = &unk_1E6BD2138;
        v29 = v19;
        v24 = v19;
        objc_msgSend(v24, "enumerateVisibleComplicationSlotsForCurrentConfigurationWithBlock:", v28);
        v25 = (NTKFace *)objc_msgSend(v24, "copy");
        watchFaceAddedToLibrary = self->_watchFaceAddedToLibrary;
        self->_watchFaceAddedToLibrary = v25;

      }
    }
    while (v13 > 0);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didFinishAddingWatchFaceToLibrary:", self);

}

void __52__NTKGreenfieldB640Manager_handleAddToMyFacesAction__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "complicationForSlot:", a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleAddedFromFaceSharing");

}

- (void)handleWatchFaceSelectedActionWithSelectedIndex:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  unint64_t v16;
  void *v17;
  id v18;
  id WeakRetained;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[NTKGreenfieldB640Model watchFaceModels](self->_greenfieldB640Model, "watchFaceModels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if ((a3 & 0x8000000000000000) == 0 && v6 > a3)
  {
    -[NTKGreenfieldB640Model watchFaceModels](self->_greenfieldB640Model, "watchFaceModels");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setIsSelected:", objc_msgSend(v8, "isSelected") ^ 1);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[NTKGreenfieldB640Model watchFaceModels](self->_greenfieldB640Model, "watchFaceModels", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v9);
          v12 += objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "isSelected");
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }

    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v16 = -[NTKFaceCollection numberOfFaces](self->_library, "numberOfFaces") + v12;
      if (v16 <= NTKFaceLibraryMaxFaceCountForDevice(v15))
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "greenfieldB640WatchFacesManager:didSelectWatchFaceAtIndex:", self, a3);

      }
      else
      {
        objc_msgSend(v8, "setIsSelected:", objc_msgSend(v8, "isSelected") ^ 1);
        objc_msgSend(MEMORY[0x1E0CB35C8], "greenfield_addWatchFaceErrorWithCode:", 5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v18, "greenfieldB640WatchFacesManager:didSelectWatchFaceWithError:", self, v17);

      }
    }
    else
    {
      objc_msgSend(v8, "setIsSelected:", 1);
    }

  }
}

- (void)handleDidExitGreenfieldB640Flow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_error)
  {
    -[NTKGreenfieldB640Model watchFaceModels](self->_greenfieldB640Model, "watchFaceModels");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodedRecipe");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "watchFace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKGreenfieldB640Manager _analyticsModelForAddFaceEventsForWatchFace:](self, "_analyticsModelForAddFaceEventsForWatchFace:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setError:", self->_error);
    NTKSubmitAnalyticsForErrorAddFaceFlow(v9);

  }
  else if (self->_addedFaceID)
  {
    -[NTKGreenfieldB640Manager _analyticsModelForAddFaceEventsForWatchFace:](self, "_analyticsModelForAddFaceEventsForWatchFace:", self->_watchFaceAddedToLibrary);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    NTKSubmitAnalyticsForAddSharedFace(v9);
  }
  else
  {
    -[NTKGreenfieldDecodedRecipe watchFace](self->_selectedRecipe, "watchFace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKGreenfieldB640Manager _analyticsModelForAddFaceEventsForWatchFace:](self, "_analyticsModelForAddFaceEventsForWatchFace:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[NTKGreenfieldB640Manager _analyticsExitScreenNameForCurrentState](self, "_analyticsExitScreenNameForCurrentState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAddFaceFlowExitScreenName:", v8);

    NTKSubmitAnalyticsForExitAddSharedFaceFlow(v9);
  }

}

- (id)_analyticsExitScreenNameForCurrentState
{
  unint64_t state;

  state = self->_state;
  if (state > 4)
    return 0;
  else
    return off_1E6BD5B90[state];
}

- (id)_analyticsModelForAddFaceEventsForWatchFace:(id)a3
{
  id v4;
  NTKGreenfieldAnalyticsModel *v5;
  const __CFString *sourceApplicationBundleIdentifier;

  v4 = a3;
  v5 = objc_alloc_init(NTKGreenfieldAnalyticsModel);
  -[NTKGreenfieldAnalyticsModel setWatchFace:](v5, "setWatchFace:", v4);

  if (self->_sourceApplicationBundleIdentifier)
    sourceApplicationBundleIdentifier = (const __CFString *)self->_sourceApplicationBundleIdentifier;
  else
    sourceApplicationBundleIdentifier = CFSTR("com.apple.mpn");
  -[NTKGreenfieldAnalyticsModel setDistributionMechanism:](v5, "setDistributionMechanism:", sourceApplicationBundleIdentifier);
  -[NTKGreenfieldAnalyticsModel setScannedCodeIdentifier:](v5, "setScannedCodeIdentifier:", self->_scannedCodeIdentifier);
  return v5;
}

- (unint64_t)bandVariantForPairedDevice
{
  void *v2;
  uint64_t v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceCategory");
  if ((unint64_t)(v3 - 3) >= 3)
    v4 = 0;
  else
    v4 = v3 - 2;

  return v4;
}

- (NSUUID)addedFaceID
{
  return self->_addedFaceID;
}

- (NTKGreenfieldB640WatchFacesManagerDelegate)delegate
{
  return (NTKGreenfieldB640WatchFacesManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_addedFaceID, 0);
  objc_storeStrong((id *)&self->_productKitCatalog, 0);
  objc_storeStrong((id *)&self->_selectedRecipe, 0);
  objc_storeStrong((id *)&self->_bandImageBundle, 0);
  objc_storeStrong((id *)&self->_bandImagePath, 0);
  objc_storeStrong((id *)&self->_watchFaceAddedToLibrary, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_libraryTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_watchFacesDecodeErrors, 0);
  objc_storeStrong((id *)&self->_greenfieldB640Model, 0);
  objc_storeStrong((id *)&self->_watchFacesModels, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_scannedCodeIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);
}

void __50__NTKGreenfieldB640Manager__decodeWatchFacesUrls___block_invoke_33_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "Failed to cleanup file at URL:%@ with error:%@", (uint8_t *)&v4, 0x16u);
}

@end
