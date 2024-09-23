@implementation MKPlaceCollectionImageProvider

+ (id)sharedInstance
{
  if (qword_1ECE2DC58 != -1)
    dispatch_once(&qword_1ECE2DC58, &__block_literal_global_68);
  return (id)_MergedGlobals_158;
}

void __48__MKPlaceCollectionImageProvider_sharedInstance__block_invoke()
{
  MKPlaceCollectionImageProvider *v0;
  void *v1;

  v0 = objc_alloc_init(MKPlaceCollectionImageProvider);
  v1 = (void *)_MergedGlobals_158;
  _MergedGlobals_158 = (uint64_t)v0;

}

- (MKPlaceCollectionImageProvider)init
{
  MKPlaceCollectionImageProvider *v2;
  uint64_t v3;
  geo_isolater *helperQueue;
  uint64_t v5;
  GEOMapItemPhotoOptions *optionsForCollectionCells;
  uint64_t v7;
  GEOMapItemPhotoOptions *optionsForCityBricks;
  NSCache *v9;
  NSCache *gradientImagesCache;
  NSCache *v11;
  NSCache *downloadedImagesCache;
  NSMutableDictionary *v13;
  NSMutableDictionary *downloadOperationsPair;
  NSMutableDictionary *v15;
  NSMutableDictionary *gradientOperationsPair;
  void *v17;
  double v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MKPlaceCollectionImageProvider;
  v2 = -[MKPlaceCollectionImageProvider init](&v20, sel_init);
  if (v2)
  {
    v3 = geo_isolater_create();
    helperQueue = v2->_helperQueue;
    v2->_helperQueue = (geo_isolater *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D271D8]), "initWithAllowSmaller:cropStyle:format:", 1, 4, 0);
    optionsForCollectionCells = v2->_optionsForCollectionCells;
    v2->_optionsForCollectionCells = (GEOMapItemPhotoOptions *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D271D8]), "initWithAllowSmaller:cropStyle:format:", 1, 0, 0);
    optionsForCityBricks = v2->_optionsForCityBricks;
    v2->_optionsForCityBricks = (GEOMapItemPhotoOptions *)v7;

    v9 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    gradientImagesCache = v2->_gradientImagesCache;
    v2->_gradientImagesCache = v9;

    -[NSCache setDelegate:](v2->_gradientImagesCache, "setDelegate:", v2);
    -[NSCache setEvictsObjectsWhenApplicationEntersBackground:](v2->_gradientImagesCache, "setEvictsObjectsWhenApplicationEntersBackground:", 0);
    -[NSCache setEvictsObjectsWithDiscardedContent:](v2->_gradientImagesCache, "setEvictsObjectsWithDiscardedContent:", 0);
    v11 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    downloadedImagesCache = v2->_downloadedImagesCache;
    v2->_downloadedImagesCache = v11;

    -[NSCache setDelegate:](v2->_downloadedImagesCache, "setDelegate:", v2);
    -[NSCache setEvictsObjectsWhenApplicationEntersBackground:](v2->_downloadedImagesCache, "setEvictsObjectsWhenApplicationEntersBackground:", 0);
    -[NSCache setEvictsObjectsWithDiscardedContent:](v2->_downloadedImagesCache, "setEvictsObjectsWithDiscardedContent:", 0);
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    downloadOperationsPair = v2->_downloadOperationsPair;
    v2->_downloadOperationsPair = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    gradientOperationsPair = v2->_gradientOperationsPair;
    v2->_gradientOperationsPair = v15;

    v2->_isRTL = MKApplicationLayoutDirectionIsRightToLeft();
    +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "screenScale");
    v2->_screenScale = v18;

  }
  return v2;
}

- (void)checkQueuesForCollectionSource:(int64_t)a3
{
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  if ((unint64_t)(a3 - 1) > 0xA)
    v5 = CFSTR("SeeAll");
  else
    v5 = off_1E20DBF38[a3 - 1];
  -[MKPlaceCollectionImageProvider downloadOperationsPair](self, "downloadOperationsPair");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MKPlaceCollectionImageProvider.downloadOperationQueue.%@"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setName:", v7);

    objc_msgSend(v13, "setQualityOfService:", 25);
    -[MKPlaceCollectionImageProvider downloadOperationsPair](self, "downloadOperationsPair");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v13, v5);

  }
  if (-[MKPlaceCollectionImageProvider requiresGradientOperationForSource:](self, "requiresGradientOperationForSource:", a3))
  {
    -[MKPlaceCollectionImageProvider gradientOperationsPair](self, "gradientOperationsPair");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v5);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0CB3828]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MKPlaceCollectionImageProvider.gradientOperationQueue.%@"), v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setName:", v11);

      objc_msgSend(v10, "setQualityOfService:", 25);
      -[MKPlaceCollectionImageProvider gradientOperationsPair](self, "gradientOperationsPair");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v10, v5);

    }
  }

}

- (void)checkQueuesForCompactCollectionSource:(int64_t)a3
{
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v4 = CFSTR("CompactCollection_SearchHome");
  if (a3 == 1)
    v4 = CFSTR("CompactCollection_CitySelector");
  if (a3 == 2)
    v5 = CFSTR("CompactCollection_GuidesHome");
  else
    v5 = v4;
  -[MKPlaceCollectionImageProvider downloadOperationsPair](self, "downloadOperationsPair");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v10;
  if (!v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MKPlaceCompactCollectionImageProvider.downloadOperationQueue.%@"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setName:", v8);

    objc_msgSend(v11, "setQualityOfService:", 25);
    -[MKPlaceCollectionImageProvider downloadOperationsPair](self, "downloadOperationsPair");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v11, v5);

    v7 = v11;
  }

}

- (BOOL)requiresGradientOperationForSource:(int64_t)a3
{
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(&unk_1E215A000, "containsObject:", v3) ^ 1;

  return v4;
}

- (void)loadGradientCoverImageWithCuratedCollection:(id)a3 size:(CGSize)a4 contentSizeCategory:(id)a5 usingImageSource:(int64_t)a6 completion:(id)a7
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v9 = a3;
  v10 = a5;
  v14 = a7;
  v11 = v10;
  v12 = v14;
  v13 = v9;
  geo_isolate_sync();

}

void __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  NSString *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  MKPlaceCollectionImageDownloadOperation *v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  double v44;
  void *v45;
  void *v46;
  unint64_t v47;
  const __CFString *v48;
  void *v49;
  id *v50;
  id *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  MKPlaceCollectionImageGradientOperation *v55;
  MKPlaceCollectionImageGradientOperation *v56;
  MKPlaceCollectionImageDownloadOperation *v57;
  void *v58;
  void *v59;
  _QWORD v60[8];
  id v61;
  _QWORD v62[8];
  id v63;
  id v64;
  id location;
  _QWORD block[4];
  id v67;
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  _QWORD v72[4];
  id v73;
  id v74;
  uint8_t buf[4];
  id v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  void *v80;
  const __CFString *v81;
  _QWORD v82[4];

  v82[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "desiredSizeFromFrameSize:", *(double *)(a1 + 64), *(double *)(a1 + 72));
  v3 = v2;
  v5 = v4;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "photos");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoInfoWithPhoto:desiredSize:", v8, v3, v5);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v59, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "collectionTitle");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "requiresGradientOperationForSource:", *(_QWORD *)(a1 + 80));
    objc_msgSend(v9, "absoluteString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 80));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("[Url:%@ Source:%@ preferredContentSizeCategory:%@]"), v13, v14, *(_QWORD *)(a1 + 48));
    v15 = (id)objc_claimAutoreleasedReturnValue();

    MKGetCuratedCollectionsLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v76 = v15;
      _os_log_impl(&dword_18B0B0000, v16, OS_LOG_TYPE_DEBUG, "Requesting image for ID: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "downloadedImagesCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      v19 = v10;
    else
      v19 = 1;
    if ((v19 & 1) != 0)
    {
      if (v10
        && (objc_msgSend(*(id *)(a1 + 32), "gradientImagesCache"),
            v20 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v20, "objectForKey:", v15),
            v21 = (void *)objc_claimAutoreleasedReturnValue(),
            v20,
            v21))
      {
        MKGetCuratedCollectionsLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v76 = v15;
          _os_log_impl(&dword_18B0B0000, v22, OS_LOG_TYPE_DEBUG, "[✔]Gradient Cache Hit. Image ID: %@", buf, 0xCu);
        }

        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_27;
        block[3] = &unk_1E20D7F70;
        v23 = *(id *)(a1 + 56);
        v67 = v21;
        v68 = v23;
        v24 = v21;
        dispatch_async(MEMORY[0x1E0C80D38], block);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "checkQueuesForCollectionSource:", *(_QWORD *)(a1 + 80));
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(&location, *(id *)(a1 + 32));
        MKGetCuratedCollectionsLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v9, "absoluteString");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v76 = v33;
          v77 = 2112;
          v78 = v58;
          _os_log_impl(&dword_18B0B0000, v32, OS_LOG_TYPE_INFO, "[X]Cache Miss. Downloading and applying Gradient to Image for \nUrl: %@. \nCollection: %@", buf, 0x16u);

        }
        v34 = [MKPlaceCollectionImageDownloadOperation alloc];
        objc_msgSend(*(id *)(a1 + 32), "downloadedImagesCache");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = -[MKPlaceCollectionImageDownloadOperation initWithUrl:downloadCache:cacheId:](v34, "initWithUrl:downloadCache:cacheId:", v9, v35, v11);

        objc_msgSend(*(id *)(a1 + 32), "downloadOperationsPair");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v36;
        v38 = *(_QWORD *)(a1 + 80) - 1;
        if (v38 > 0xA)
          v39 = CFSTR("SeeAll");
        else
          v39 = off_1E20DBF38[v38];
        objc_msgSend(v36, "objectForKey:", v39);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v55 = [MKPlaceCollectionImageGradientOperation alloc];
          v52 = *(_QWORD *)(a1 + 48);
          objc_msgSend(*(id *)(a1 + 40), "collectionTitle");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "downloadedImagesCache");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "gradientImagesCache");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(*(id *)(a1 + 32), "isRTL");
          objc_msgSend(*(id *)(a1 + 32), "screenScale");
          v56 = -[MKPlaceCollectionImageGradientOperation initWithUrl:size:contentSizeCategory:name:downloadCache:gradientCache:isRTL:screenScale:cacheId:](v55, "initWithUrl:size:contentSizeCategory:name:downloadCache:gradientCache:isRTL:screenScale:cacheId:", v9, v52, v40, v41, v42, v43, v3, v5, v44, v15);

          objc_msgSend(*(id *)(a1 + 32), "gradientOperationsPair");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v45;
          v47 = *(_QWORD *)(a1 + 80) - 1;
          if (v47 > 0xA)
            v48 = CFSTR("SeeAll");
          else
            v48 = off_1E20DBF38[v47];
          objc_msgSend(v45, "objectForKey:", v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          -[MKPlaceCollectionImageGradientOperation addDependency:](v56, "addDependency:", v57);
        }
        else
        {
          v56 = 0;
          v49 = 0;
        }
        objc_msgSend(v53, "addOperation:", v57);
        if (v10)
        {
          objc_msgSend(v49, "addOperation:", v56);
          v62[0] = MEMORY[0x1E0C809B0];
          v62[1] = 3221225472;
          v62[2] = __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_31;
          v62[3] = &unk_1E20DBEA0;
          v50 = (id *)v62;
          v51 = &v64;
          objc_copyWeak(&v64, &location);
          v62[4] = v15;
          v62[5] = v9;
          v62[6] = v58;
          v62[7] = v54;
          v63 = *(id *)(a1 + 56);
          -[MKPlaceCollectionImageGradientOperation setCompletionBlock:](v56, "setCompletionBlock:", v62);

        }
        else
        {
          v60[0] = MEMORY[0x1E0C809B0];
          v60[1] = 3221225472;
          v60[2] = __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_2;
          v60[3] = &unk_1E20DBEC8;
          v50 = (id *)v60;
          v51 = &v61;
          objc_copyWeak(&v61, &location);
          v60[4] = v9;
          v60[5] = v58;
          v60[6] = v54;
          v60[7] = *(id *)(a1 + 56);
          -[MKPlaceCollectionImageDownloadOperation setCompletionBlock:](v57, "setCompletionBlock:", v60);
        }

        objc_destroyWeak(v51);
        objc_destroyWeak(&location);
        v24 = v54;
      }
    }
    else
    {
      MKGetCuratedCollectionsLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v76 = v18;
        v77 = 2112;
        v78 = v9;
        v79 = 2112;
        v80 = v58;
        _os_log_impl(&dword_18B0B0000, v31, OS_LOG_TYPE_DEBUG, "[✔]Collection image Cache Hit. \nImage: %@ \n Photo URL: %@ \nCollection: %@", buf, 0x20u);
      }

      v69[0] = MEMORY[0x1E0C809B0];
      v69[1] = 3221225472;
      v69[2] = __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_26;
      v69[3] = &unk_1E20D7F70;
      v71 = *(id *)(a1 + 56);
      v70 = v18;
      dispatch_async(MEMORY[0x1E0C80D38], v69);

      v24 = v71;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No image for collection: %@"), v58);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v26 = MKErrorDomain;
    v81 = CFSTR("Reason");
    v82[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, &v81, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 1, v27);

    MKGetCuratedCollectionsLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v76 = v28;
      _os_log_impl(&dword_18B0B0000, v29, OS_LOG_TYPE_ERROR, "[!!]Error applying gradient to image: %@", buf, 0xCu);
    }

    v72[0] = MEMORY[0x1E0C809B0];
    v72[1] = 3221225472;
    v72[2] = __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_23;
    v72[3] = &unk_1E20D7F70;
    v30 = *(id *)(a1 + 56);
    v73 = v28;
    v74 = v30;
    v15 = v28;
    dispatch_async(MEMORY[0x1E0C80D38], v72);

    v18 = v74;
  }

}

uint64_t __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_23(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32), 0, 0);
}

uint64_t __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, 1, 1);
}

uint64_t __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, 1, 1);
}

void __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_31(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSString *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  id v24;
  const __CFString *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "gradientImagesCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  if (v5)
  {
    MKGetCuratedCollectionsLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 40), "absoluteString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138413058;
      v28 = v5;
      v29 = 2112;
      v30 = v7;
      v31 = 2112;
      v32 = v8;
      v33 = 2048;
      v34 = v10;
      _os_log_impl(&dword_18B0B0000, v6, OS_LOG_TYPE_DEBUG, "[⌛]Completed applying gradient to \nImage: %@ \nPhotoURL: %@ \nCollection: %@ \nDuration: %f seconds", buf, 0x2Au);

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_32;
    block[3] = &unk_1E20D7F70;
    v24 = *(id *)(a1 + 64);
    v23 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v11 = v24;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image gradient failed for Collection \nURL: %@. \n Collection: %@"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v13 = MKErrorDomain;
    v25 = CFSTR("Reason");
    v26 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithDomain:code:userInfo:", v13, 1, v14);

    MKGetCuratedCollectionsLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v15;
      _os_log_impl(&dword_18B0B0000, v16, OS_LOG_TYPE_ERROR, "[!!]Error blurring image: %@", buf, 0xCu);
    }

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_35;
    v19[3] = &unk_1E20D7F70;
    v17 = *(id *)(a1 + 64);
    v20 = v15;
    v21 = v17;
    v18 = v15;
    dispatch_async(MEMORY[0x1E0C80D38], v19);

  }
}

uint64_t __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_32(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, 0, 1);
}

uint64_t __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32), 0, 0);
}

void __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSString *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  const __CFString *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "downloadedImagesCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  if (v6)
  {
    MKGetCuratedCollectionsLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "absoluteString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      *(_DWORD *)buf = 138413058;
      v29 = v6;
      v30 = 2112;
      v31 = v8;
      v32 = 2112;
      v33 = v9;
      v34 = 2048;
      v35 = v11;
      _os_log_impl(&dword_18B0B0000, v7, OS_LOG_TYPE_DEBUG, "[⌛]Completed download for \nImage: %@ \nPhotoURL: %@ \nCollection: %@ \nDuration: %f seconds", buf, 0x2Au);

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_36;
    block[3] = &unk_1E20D7F70;
    v25 = *(id *)(a1 + 56);
    v24 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v12 = v25;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image download failed for Collection. \nURL: %@. \nGuide Location: %@"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v14 = MKErrorDomain;
    v26 = CFSTR("Reason");
    v27 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v13, "initWithDomain:code:userInfo:", v14, 1, v15);

    MKGetCuratedCollectionsLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v16;
      _os_log_impl(&dword_18B0B0000, v17, OS_LOG_TYPE_ERROR, "[!!]Error downloading image: %@", buf, 0xCu);
    }

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_39;
    v20[3] = &unk_1E20D7F70;
    v18 = *(id *)(a1 + 56);
    v21 = v16;
    v22 = v18;
    v19 = v16;
    dispatch_async(MEMORY[0x1E0C80D38], v20);

  }
}

uint64_t __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, 0, 1);
}

uint64_t __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_39(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32), 0, 0);
}

- (void)loadCoverImageWithGuideLocation:(id)a3 size:(CGSize)a4 usingImageSource:(int64_t)a5 completion:(id)a6
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a3;
  v10 = a6;
  v8 = v10;
  v9 = v7;
  geo_isolate_sync();

}

void __99__MKPlaceCollectionImageProvider_loadCoverImageWithGuideLocation_size_usingImageSource_completion___block_invoke(uint64_t a1)
{
  id *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  NSString *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  MKPlaceCollectionImageDownloadOperation *v25;
  void *v26;
  MKPlaceCollectionImageDownloadOperation *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD block[4];
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  const __CFString *v53;
  _QWORD v54[4];

  v54[1] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "desiredSizeFromFrameSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  v4 = v3;
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 40), "photosForType:", objc_msgSend(*v2, "photoTypeForImageSource:", *(_QWORD *)(a1 + 72)));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*v2, "photoInfoWithPhoto:desiredSize:usingOptions:", v34, *((_QWORD *)*v2 + 4), v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    MKGetCuratedCollectionsLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v48 = v10;
      _os_log_impl(&dword_18B0B0000, v12, OS_LOG_TYPE_DEBUG, "Requesting image for ID: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "downloadedImagesCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      MKGetCuratedCollectionsLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v48 = v14;
        v49 = 2112;
        v50 = v9;
        v51 = 2112;
        v52 = v11;
        _os_log_impl(&dword_18B0B0000, v15, OS_LOG_TYPE_DEBUG, "[✔]Guide location image Cache Hit. \nImage: %@ \n Photo URL: %@ \nGuide Location: %@", buf, 0x20u);
      }

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __99__MKPlaceCollectionImageProvider_loadCoverImageWithGuideLocation_size_usingImageSource_completion___block_invoke_43;
      block[3] = &unk_1E20D7F70;
      v43 = *(id *)(a1 + 48);
      v16 = v14;
      v42 = v16;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      v17 = v43;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "checkQueuesForCompactCollectionSource:", *(_QWORD *)(a1 + 72));
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      v25 = [MKPlaceCollectionImageDownloadOperation alloc];
      objc_msgSend(*(id *)(a1 + 32), "downloadedImagesCache");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[MKPlaceCollectionImageDownloadOperation initWithUrl:downloadCache:cacheId:](v25, "initWithUrl:downloadCache:cacheId:", v9, v26, v10);

      objc_msgSend(*(id *)(a1 + 32), "downloadOperationsPair");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      v30 = *(_QWORD *)(a1 + 72);
      v31 = CFSTR("CompactCollection_SearchHome");
      if (v30 == 1)
        v31 = CFSTR("CompactCollection_CitySelector");
      if (v30 == 2)
        v32 = CFSTR("CompactCollection_GuidesHome");
      else
        v32 = v31;
      objc_msgSend(v28, "objectForKey:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v33, "addOperation:", v27);
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __99__MKPlaceCollectionImageProvider_loadCoverImageWithGuideLocation_size_usingImageSource_completion___block_invoke_2;
      v35[3] = &unk_1E20DBEC8;
      objc_copyWeak(&v40, (id *)buf);
      v36 = v9;
      v37 = v11;
      v17 = v24;
      v38 = v17;
      v39 = *(id *)(a1 + 48);
      -[MKPlaceCollectionImageDownloadOperation setCompletionBlock:](v27, "setCompletionBlock:", v35);

      objc_destroyWeak(&v40);
      objc_destroyWeak((id *)buf);
      v16 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No image for guide location: %@"), v11);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v19 = MKErrorDomain;
    v53 = CFSTR("Reason");
    v54[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, &v53, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, 1, v20);

    MKGetCuratedCollectionsLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v48 = v21;
      _os_log_impl(&dword_18B0B0000, v22, OS_LOG_TYPE_ERROR, "[!!]Error downloading image: %@", buf, 0xCu);
    }

    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __99__MKPlaceCollectionImageProvider_loadCoverImageWithGuideLocation_size_usingImageSource_completion___block_invoke_42;
    v44[3] = &unk_1E20D7F70;
    v23 = *(id *)(a1 + 48);
    v45 = v21;
    v46 = v23;
    v17 = v21;
    dispatch_async(MEMORY[0x1E0C80D38], v44);

  }
}

uint64_t __99__MKPlaceCollectionImageProvider_loadCoverImageWithGuideLocation_size_usingImageSource_completion___block_invoke_42(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32), 0, 0);
}

uint64_t __99__MKPlaceCollectionImageProvider_loadCoverImageWithGuideLocation_size_usingImageSource_completion___block_invoke_43(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, 1, 1);
}

void __99__MKPlaceCollectionImageProvider_loadCoverImageWithGuideLocation_size_usingImageSource_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSString *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  const __CFString *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "downloadedImagesCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  if (v6)
  {
    MKGetCuratedCollectionsLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "absoluteString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      *(_DWORD *)buf = 138413058;
      v29 = v6;
      v30 = 2112;
      v31 = v8;
      v32 = 2112;
      v33 = v9;
      v34 = 2048;
      v35 = v11;
      _os_log_impl(&dword_18B0B0000, v7, OS_LOG_TYPE_DEBUG, "[⌛]Completed download for \nImage: %@ \nPhotoURL: %@ \nGuide Location: %@ \nDuration: %f seconds", buf, 0x2Au);

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __99__MKPlaceCollectionImageProvider_loadCoverImageWithGuideLocation_size_usingImageSource_completion___block_invoke_44;
    block[3] = &unk_1E20D7F70;
    v25 = *(id *)(a1 + 56);
    v24 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v12 = v25;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image download failed for Guide Location. \nURL: %@. \nGuide Location: %@"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v14 = MKErrorDomain;
    v26 = CFSTR("Reason");
    v27 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v13, "initWithDomain:code:userInfo:", v14, 1, v15);

    MKGetCuratedCollectionsLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v16;
      _os_log_impl(&dword_18B0B0000, v17, OS_LOG_TYPE_ERROR, "[!!]Error downloading image: %@", buf, 0xCu);
    }

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __99__MKPlaceCollectionImageProvider_loadCoverImageWithGuideLocation_size_usingImageSource_completion___block_invoke_47;
    v20[3] = &unk_1E20D7F70;
    v18 = *(id *)(a1 + 56);
    v21 = v16;
    v22 = v18;
    v19 = v16;
    dispatch_async(MEMORY[0x1E0C80D38], v20);

  }
}

uint64_t __99__MKPlaceCollectionImageProvider_loadCoverImageWithGuideLocation_size_usingImageSource_completion___block_invoke_44(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, 0, 1);
}

uint64_t __99__MKPlaceCollectionImageProvider_loadCoverImageWithGuideLocation_size_usingImageSource_completion___block_invoke_47(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32), 0, 0);
}

- (void)cancelAllOperationsForImageSource:(int64_t)a3
{
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a3 - 1) > 0xA)
    v4 = CFSTR("SeeAll");
  else
    v4 = off_1E20DBF38[a3 - 1];
  -[MKPlaceCollectionImageProvider downloadOperationsPair](self, "downloadOperationsPair");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKPlaceCollectionImageProvider gradientOperationsPair](self, "gradientOperationsPair");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  MKGetCuratedCollectionsLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_18B0B0000, v9, OS_LOG_TYPE_INFO, "Cancelling ALL download and gradient operations for source: %@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(v6, "cancelAllOperations");
  objc_msgSend(v8, "cancelAllOperations");

}

- (void)cancelAllOperationsForCompactImageSource:(int64_t)a3
{
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("CompactCollection_SearchHome");
  if (a3 == 1)
    v4 = CFSTR("CompactCollection_CitySelector");
  if (a3 == 2)
    v5 = CFSTR("CompactCollection_GuidesHome");
  else
    v5 = v4;
  -[MKPlaceCollectionImageProvider downloadOperationsPair](self, "downloadOperationsPair");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKPlaceCollectionImageProvider gradientOperationsPair](self, "gradientOperationsPair");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  MKGetCuratedCollectionsLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_18B0B0000, v10, OS_LOG_TYPE_INFO, "Cancelling ALL download and gradient operations for source: %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend(v7, "cancelAllOperations");
  objc_msgSend(v9, "cancelAllOperations");

}

- (CGSize)desiredSizeFromFrameSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screenScale");
  v7 = v6;

  v8 = width * v7;
  v9 = height * v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)photoInfoWithPhoto:(id)a3 desiredSize:(CGSize)a4 usingOptions:(id)a5
{
  return (id)objc_msgSend(a3, "bestPhotoForSize:options:", a5, a4.width, a4.height);
}

- (id)photoInfoWithPhoto:(id)a3 desiredSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  -[MKPlaceCollectionImageProvider optionsForCollectionCells](self, "optionsForCollectionCells");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionImageProvider photoInfoWithPhoto:desiredSize:usingOptions:](self, "photoInfoWithPhoto:desiredSize:usingOptions:", v7, v8, width, height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)photoTypeForImageSource:(int64_t)a3
{
  return a3 != 1;
}

- (id)joeColorForCuratedCollection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "photos");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundJoeColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6
    || (objc_msgSend(MEMORY[0x1E0CEA478], "_maps_colorFromHexString:", v6),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    MKGetCuratedCollectionsLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "collectionTitle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_18B0B0000, v8, OS_LOG_TYPE_ERROR, "JoeColor is missing background color string for collection: %@", (uint8_t *)&v11, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)isJoeColorManuallyCuratedForCuratedCollection:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "photos");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isBackgroundJoeColorCurated");

  return v5;
}

- (id)joeColorForCompactCollection:(id)a3 usingCarouselContext:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4 == 2)
    v7 = 2;
  else
    v7 = a4 == 0;
  objc_msgSend(v6, "photosForType:", -[MKPlaceCollectionImageProvider photoTypeForImageSource:](self, "photoTypeForImageSource:", v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "backgroundJoeColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10
    || (objc_msgSend(MEMORY[0x1E0CEA478], "_maps_colorFromHexString:", v10),
        (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    MKGetCuratedCollectionsLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v13;
      _os_log_impl(&dword_18B0B0000, v12, OS_LOG_TYPE_ERROR, "JoeColor is missing background color string for guide location: %@", (uint8_t *)&v15, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  MKGetCuratedCollectionsLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_18B0B0000, v7, OS_LOG_TYPE_DEBUG, "[!]Cache %@ is evicting: %@", (uint8_t *)&v8, 0x16u);
  }

}

- (geo_isolater)helperQueue
{
  return self->_helperQueue;
}

- (void)setHelperQueue:(id)a3
{
  objc_storeStrong((id *)&self->_helperQueue, a3);
}

- (GEOMapItemPhotoOptions)optionsForCollectionCells
{
  return self->_optionsForCollectionCells;
}

- (GEOMapItemPhotoOptions)optionsForCityBricks
{
  return self->_optionsForCityBricks;
}

- (NSCache)gradientImagesCache
{
  return self->_gradientImagesCache;
}

- (void)setGradientImagesCache:(id)a3
{
  objc_storeStrong((id *)&self->_gradientImagesCache, a3);
}

- (NSCache)downloadedImagesCache
{
  return self->_downloadedImagesCache;
}

- (void)setDownloadedImagesCache:(id)a3
{
  objc_storeStrong((id *)&self->_downloadedImagesCache, a3);
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (void)setScreenScale:(double)a3
{
  self->_screenScale = a3;
}

- (NSMutableDictionary)downloadOperationsPair
{
  return self->_downloadOperationsPair;
}

- (void)setDownloadOperationsPair:(id)a3
{
  objc_storeStrong((id *)&self->_downloadOperationsPair, a3);
}

- (NSMutableDictionary)gradientOperationsPair
{
  return self->_gradientOperationsPair;
}

- (void)setGradientOperationsPair:(id)a3
{
  objc_storeStrong((id *)&self->_gradientOperationsPair, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientOperationsPair, 0);
  objc_storeStrong((id *)&self->_downloadOperationsPair, 0);
  objc_storeStrong((id *)&self->_downloadedImagesCache, 0);
  objc_storeStrong((id *)&self->_gradientImagesCache, 0);
  objc_storeStrong((id *)&self->_optionsForCityBricks, 0);
  objc_storeStrong((id *)&self->_optionsForCollectionCells, 0);
  objc_storeStrong((id *)&self->_helperQueue, 0);
}

@end
