@implementation MKPlaceCollectionsLogicController

- (MKPlaceCollectionsLogicController)initWithPlaceCollections:(id)a3 usingSyncCoordinator:(id)a4 inContext:(int64_t)a5
{
  return -[MKPlaceCollectionsLogicController initWithCollectionView:withPlaceCollections:usingCollectionIds:usingCollectionFetcher:usingGuideConsumer:usingSyncCoordinator:inContext:usingBatchSize:](self, "initWithCollectionView:withPlaceCollections:usingCollectionIds:usingCollectionFetcher:usingGuideConsumer:usingSyncCoordinator:inContext:usingBatchSize:", 0, a3, 0, 0, 0, a4, a5, 0);
}

- (MKPlaceCollectionsLogicController)initWithCollectionView:(id)a3 withPlaceCollections:(id)a4 usingCollectionIds:(id)a5 usingCollectionFetcher:(id)a6 usingGuideConsumer:(id)a7 usingSyncCoordinator:(id)a8 inContext:(int64_t)a9 usingBatchSize:(unint64_t)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  MKPlaceCollectionsLogicController *v22;
  MKPlaceCollectionsLogicController *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  MKPlaceCollectionsLogicController *v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v36;
  id v37;
  objc_super v38;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v38.receiver = self;
  v38.super_class = (Class)MKPlaceCollectionsLogicController;
  v22 = -[MKPlaceCollectionsLogicController init](&v38, sel_init);
  v23 = v22;
  if (v22)
  {
    v36 = v21;
    v37 = v20;
    v24 = v18;
    -[MKPlaceCollectionsLogicController setCollectionView:](v22, "setCollectionView:", v16);
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v17);
    objc_msgSend(v25, "array");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "copy");
    -[MKPlaceCollectionsLogicController setGeoCollections:](v23, "setGeoCollections:", v27);

    objc_storeStrong((id *)&v23->_syncCoordinator, a8);
    v23->_context = a9;
    -[MKPlaceCollectionsLogicController buildCuratedCollectionsFrom:shouldCancelImageDownloads:](v23, "buildCuratedCollectionsFrom:shouldCancelImageDownloads:", v17, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceCollectionsLogicController setCollections:](v23, "setCollections:", v28);

    if (a9 == 9)
    {
      v29 = v23;
      v18 = v24;
      v30 = v24;
    }
    else
    {
      v18 = v24;
      if (a9 != 5)
      {
        v21 = v36;
        v20 = v37;
        if (a9 == 2)
          -[MKPlaceCollectionsLogicController createBatchControllerIfNeededUsingIdentifiers:andPlaceCollections:usingCollectionFetcher:usingGuideConsumer:usingBatchSize:](v23, "createBatchControllerIfNeededUsingIdentifiers:andPlaceCollections:usingCollectionFetcher:usingGuideConsumer:usingBatchSize:", v18, v17, v19, v23, a10);
        goto LABEL_9;
      }
      v29 = v23;
      v30 = v24;
    }
    v20 = v37;
    -[MKPlaceCollectionsLogicController createBatchControllerIfNeededUsingIdentifiers:andPlaceCollections:usingCollectionFetcher:usingGuideConsumer:usingBatchSize:](v29, "createBatchControllerIfNeededUsingIdentifiers:andPlaceCollections:usingCollectionFetcher:usingGuideConsumer:usingBatchSize:", v30, v17, v19, v37, a10);
    v21 = v36;
LABEL_9:
    v31 = objc_opt_class();
    +[MKPlaceCollectionCell reuseIdentifier](MKPlaceCollectionCell, "reuseIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "registerClass:forCellWithReuseIdentifier:", v31, v32);

    v33 = objc_opt_class();
    +[MKCollectionBatchCell reuseIdentifier](MKCollectionBatchCell, "reuseIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "registerClass:forCellWithReuseIdentifier:", v33, v34);

  }
  return v23;
}

- (void)willDisplayCellAtIndexpath:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  -[MKPlaceCollectionsLogicController batchController](self, "batchController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "item");

  objc_msgSend(v6, "didDisplayItemAtIndex:", v5);
}

- (void)clearSnapshotData
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[MKPlaceCollectionsLogicController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshot");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "itemIdentifiersInSectionWithIdentifier:", CFSTR("CarouselSection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIdentifiersInSectionWithIdentifier:", CFSTR("LoadingSection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteItemsWithIdentifiers:", v4);
  objc_msgSend(v6, "deleteItemsWithIdentifiers:", v5);
  -[MKPlaceCollectionsLogicController applySnapShot:animated:](self, "applySnapShot:animated:", v6, 0);

}

- (void)getCollectionsUsingDataSource:(id)a3 onCompletion:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[MKPlaceCollectionsLogicController setDataSource:](self, "setDataSource:", a3);
  -[MKPlaceCollectionsLogicController prepareSnapshot](self, "prepareSnapshot");
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }

}

- (void)getCollections:(id)a3
{
  void (**v4)(_QWORD);
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t, void *, void *, void *);
  void *v11;
  id v12;
  id location;

  v4 = (void (**)(_QWORD))a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0CEA440]);
  -[MKPlaceCollectionsLogicController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __52__MKPlaceCollectionsLogicController_getCollections___block_invoke;
  v11 = &unk_1E20DF408;
  objc_copyWeak(&v12, &location);
  v7 = (void *)objc_msgSend(v5, "initWithCollectionView:cellProvider:", v6, &v8);
  -[MKPlaceCollectionsLogicController setDataSource:](self, "setDataSource:", v7, v8, v9, v10, v11);

  -[MKPlaceCollectionsLogicController prepareSnapshot](self, "prepareSnapshot");
  if (v4)
    v4[2](v4);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

id __52__MKPlaceCollectionsLogicController_getCollections___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[MKCollectionBatchCell reuseIdentifier](MKCollectionBatchCell, "reuseIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v9, "isEqualToString:", v14);

    if (v15)
    {
      +[MKCollectionBatchCell reuseIdentifier](MKCollectionBatchCell, "reuseIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v16, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "startedLoadingBatch");
      goto LABEL_7;
    }
LABEL_6:
    v12 = 0;
    goto LABEL_7;
  }
  +[MKPlaceCollectionCell reuseIdentifier](MKPlaceCollectionCell, "reuseIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "collectionAtIndex:", objc_msgSend(v8, "item"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configureWithModel:", v13);

LABEL_7:
  return v12;
}

- (void)displayCollections
{
  id v3;

  -[MKPlaceCollectionsLogicController snapshot](self, "snapshot");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionsLogicController applySnapShot:animated:](self, "applySnapShot:animated:", v3, 0);

}

- (void)refreshCollections
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (-[MKPlaceCollectionsLogicController numberOfCollections](self, "numberOfCollections"))
  {
    MKGetCuratedCollectionsLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_DEBUG, "Logic controller is refreshing collections", v7, 2u);
    }

    -[MKPlaceCollectionsLogicController dataSource](self, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "snapshot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v8[0] = CFSTR("CarouselSection");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadSectionsWithIdentifiers:", v6);

    -[MKPlaceCollectionsLogicController applySnapShot:animated:](self, "applySnapShot:animated:", v5, 0);
  }
}

- (int64_t)numberOfSections
{
  return 2;
}

- (int64_t)sectionKindAtIndex:(int64_t)a3
{
  int64_t v4;
  int64_t v5;

  v4 = -[MKPlaceCollectionsLogicController numberOfSections](self, "numberOfSections");
  if (a3 == 1)
    v5 = 1;
  else
    v5 = -1;
  if (!a3)
    v5 = 0;
  if (v4 <= a3)
    return 0;
  else
    return v5;
}

- (int64_t)numberOfCollections
{
  void *v2;
  int64_t v3;

  -[MKPlaceCollectionsLogicController collections](self, "collections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)collectionAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[MKPlaceCollectionsLogicController collections](self, "collections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)geoCollectionAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[MKPlaceCollectionsLogicController geoCollections](self, "geoCollections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)updateCollections:(id)a3 usingBatchedIdentifiers:(id)a4 usingCollectionFetcher:(id)a5 usingBatchSize:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[MKPlaceCollectionsLogicController setGeoCollections:](self, "setGeoCollections:", v12);
  -[MKPlaceCollectionsLogicController geoCollections](self, "geoCollections");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionsLogicController buildCuratedCollectionsFrom:shouldCancelImageDownloads:](self, "buildCuratedCollectionsFrom:shouldCancelImageDownloads:", v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionsLogicController setCollections:](self, "setCollections:", v14);

  -[MKPlaceCollectionsLogicController createBatchControllerIfNeededUsingIdentifiers:andPlaceCollections:usingCollectionFetcher:usingGuideConsumer:usingBatchSize:](self, "createBatchControllerIfNeededUsingIdentifiers:andPlaceCollections:usingCollectionFetcher:usingGuideConsumer:usingBatchSize:", v11, v12, v10, self, a6);
  -[MKPlaceCollectionsLogicController prepareSnapshot](self, "prepareSnapshot");
}

- (void)updateCollectionsWithoutPreparingSnapshot:(id)a3 usingBatchedIdentifiers:(id)a4 usingCollectionFetcher:(id)a5 usingGuideConsumer:(id)a6 usingBatchSize:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v17 = a3;
  -[MKPlaceCollectionsLogicController setGeoCollections:](self, "setGeoCollections:", v17);
  -[MKPlaceCollectionsLogicController geoCollections](self, "geoCollections");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionsLogicController buildCuratedCollectionsFrom:shouldCancelImageDownloads:](self, "buildCuratedCollectionsFrom:shouldCancelImageDownloads:", v15, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionsLogicController setCollections:](self, "setCollections:", v16);

  -[MKPlaceCollectionsLogicController createBatchControllerIfNeededUsingIdentifiers:andPlaceCollections:usingCollectionFetcher:usingGuideConsumer:usingBatchSize:](self, "createBatchControllerIfNeededUsingIdentifiers:andPlaceCollections:usingCollectionFetcher:usingGuideConsumer:usingBatchSize:", v14, v17, v13, v12, a7);
}

- (void)updateUsingBatchedIdentifiers:(id)a3 usingCollectionFetcher:(id)a4 usingBatchSize:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  -[MKPlaceCollectionsLogicController geoCollections](self, "geoCollections");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionsLogicController createBatchControllerIfNeededUsingIdentifiers:andPlaceCollections:usingCollectionFetcher:usingGuideConsumer:usingBatchSize:](self, "createBatchControllerIfNeededUsingIdentifiers:andPlaceCollections:usingCollectionFetcher:usingGuideConsumer:usingBatchSize:", v9, v10, v8, self, a5);

}

- (void)appendBatchOfCollections:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  -[MKPlaceCollectionsLogicController geoCollections](self, "geoCollections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__MKPlaceCollectionsLogicController_appendBatchOfCollections___block_invoke;
  v16[3] = &unk_1E20DF430;
  v17 = v6;
  v13 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v16);
  -[MKPlaceCollectionsLogicController setGeoCollections:](self, "setGeoCollections:", v13);
  -[MKPlaceCollectionsLogicController buildCuratedCollectionsFrom:shouldCancelImageDownloads:](self, "buildCuratedCollectionsFrom:shouldCancelImageDownloads:", v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKPlaceCollectionsLogicController collections](self, "collections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __62__MKPlaceCollectionsLogicController_appendBatchOfCollections___block_invoke_2;
  v14[3] = &unk_1E20DF458;
  v15 = v10;
  v11 = v10;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v14);
  v12 = (void *)objc_msgSend(v11, "copy");
  -[MKPlaceCollectionsLogicController setCollections:](self, "setCollections:", v12);

}

uint64_t __62__MKPlaceCollectionsLogicController_appendBatchOfCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __62__MKPlaceCollectionsLogicController_appendBatchOfCollections___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)identifierForCollectionAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;

  -[MKPlaceCollectionsLogicController geoCollectionAtIndex:](self, "geoCollectionAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isCollectionSavedAtIndex:(int64_t)a3
{
  void *v3;
  char v4;

  -[MKPlaceCollectionsLogicController collectionAtIndex:](self, "collectionAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSaved");

  return v4;
}

- (void)prepareSnapshot
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CEA210]);
  -[MKPlaceCollectionsLogicController setSnapshot:](self, "setSnapshot:", v3);

  -[MKPlaceCollectionsLogicController snapshot](self, "snapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("CarouselSection");
  v9[1] = CFSTR("LoadingSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendSectionsWithIdentifiers:", v5);

  -[MKPlaceCollectionsLogicController snapshot](self, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionsLogicController geoCollections](self, "geoCollections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v7, CFSTR("CarouselSection"));

  -[MKPlaceCollectionsLogicController snapshot](self, "snapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", MEMORY[0x1E0C9AA60], CFSTR("LoadingSection"));

}

- (id)buildCuratedCollectionsFrom:(id)a3 shouldCancelImageDownloads:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  MKPlaceCollectionViewModel *v14;
  void *v15;
  MKPlaceCollectionViewModel *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v4)
    -[MKPlaceCollectionsLogicController clearPreviousModelImageDownloads](self, "clearPreviousModelImageDownloads");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
        v14 = [MKPlaceCollectionViewModel alloc];
        -[MKPlaceCollectionsLogicController syncCoordinator](self, "syncCoordinator", (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[MKPlaceCollectionViewModel initWithGEOPlaceCollection:usingSyncCoordinator:inContext:usingTitleFont:](v14, "initWithGEOPlaceCollection:usingSyncCoordinator:inContext:usingTitleFont:", v13, v15, self->_context, 0);

        objc_msgSend(v7, "addObject:", v16);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  return v7;
}

- (void)clearPreviousModelImageDownloads
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  id v6;

  +[MKPlaceCollectionImageProvider sharedInstance](MKPlaceCollectionImageProvider, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_context - 1;
  if (v4 > 9)
    v5 = 0;
  else
    v5 = qword_18B2AFA30[v4];
  v6 = v3;
  objc_msgSend(v3, "cancelAllOperationsForImageSource:", v5);

}

- (id)removeIdentifiers:(id)a3 collidingWithPlaceCollections:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v6, "count"));
  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __85__MKPlaceCollectionsLogicController_removeIdentifiers_collidingWithPlaceCollections___block_invoke;
  v20[3] = &unk_1E20DF430;
  v21 = v8;
  v10 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v20);

  v11 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v11, "removeObjectsInArray:", v10);
  v15 = v9;
  v16 = 3221225472;
  v17 = __85__MKPlaceCollectionsLogicController_removeIdentifiers_collidingWithPlaceCollections___block_invoke_2;
  v18 = &unk_1E20DF480;
  v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v12 = v19;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v15);
  v13 = (void *)objc_msgSend(v12, "copy", v15, v16, v17, v18);

  return v13;
}

void __85__MKPlaceCollectionsLogicController_removeIdentifiers_collidingWithPlaceCollections___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "collectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

void __85__MKPlaceCollectionsLogicController_removeIdentifiers_collidingWithPlaceCollections___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  MKMapItemIdentifier *v4;
  MKMapItemIdentifier *v5;

  v3 = a2;
  v5 = -[MKMapItemIdentifier initWithGEOMapItemIdentifier:]([MKMapItemIdentifier alloc], "initWithGEOMapItemIdentifier:", v3);

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v4 = v5;
  }

}

- (void)createBatchControllerIfNeededUsingIdentifiers:(id)a3 andPlaceCollections:(id)a4 usingCollectionFetcher:(id)a5 usingGuideConsumer:(id)a6 usingBatchSize:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  MKPlaceBatchController *v17;
  id v18;

  v18 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  -[MKPlaceCollectionsLogicController setBatchController:](self, "setBatchController:", 0);
  if (v18)
  {
    -[MKPlaceCollectionsLogicController removeIdentifiers:collidingWithPlaceCollections:](self, "removeIdentifiers:collidingWithPlaceCollections:", v18, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");
    if (v14 && v13 && v16)
    {
      v17 = -[MKPlaceBatchController initWithItemIdentifiers:withBatchSize:minimumNumberOfItemBeforeFetching:shouldLoadFirstBatchImmediately:usingBatchFetcher:usingBatchConsumer:displayedItemCount:]([MKPlaceBatchController alloc], "initWithItemIdentifiers:withBatchSize:minimumNumberOfItemBeforeFetching:shouldLoadFirstBatchImmediately:usingBatchFetcher:usingBatchConsumer:displayedItemCount:", v15, a7, 2, 0, v13, v14, objc_msgSend(v12, "count"));
      -[MKPlaceCollectionsLogicController setBatchController:](self, "setBatchController:", v17);

    }
  }

}

- (void)_dispatchOnManThread:(id)a3
{
  void (**v3)(_QWORD);
  _QWORD block[4];
  void (**v5)(_QWORD);
  uint8_t buf[16];

  v3 = (void (**)(_QWORD))a3;
  if (v3)
  {
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      v3[2](v3);
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58__MKPlaceCollectionsLogicController__dispatchOnManThread___block_invoke;
      block[3] = &unk_1E20D7EF8;
      v5 = v3;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_18B0B0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: block", buf, 2u);
  }

}

uint64_t __58__MKPlaceCollectionsLogicController__dispatchOnManThread___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)applySnapShot:(id)a3 animated:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  BOOL v11;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__MKPlaceCollectionsLogicController_applySnapShot_animated___block_invoke;
  v8[3] = &unk_1E20D8830;
  objc_copyWeak(&v10, &location);
  v7 = v6;
  v9 = v7;
  v11 = a4;
  -[MKPlaceCollectionsLogicController _dispatchOnManThread:](self, "_dispatchOnManThread:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __60__MKPlaceCollectionsLogicController_applySnapShot_animated___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applySnapshot:animatingDifferences:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

}

- (void)shouldConsumeBatch:(BOOL)a3 fetchedBatch:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  MKGetCuratedCollectionsLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_18B0B0000, v7, OS_LOG_TYPE_DEBUG, "[􀉟] Logic controller informed to consume a batch. Removing loading cell.", (uint8_t *)&v15, 2u);
  }

  -[MKPlaceCollectionsLogicController snapshot](self, "snapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionsLogicController snapshot](self, "snapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemIdentifiersInSectionWithIdentifier:", CFSTR("LoadingSection"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteItemsWithIdentifiers:", v10);

  if (v4 && objc_msgSend(v6, "count"))
  {
    MKGetCuratedCollectionsLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = objc_msgSend(v6, "count");
      v15 = 134217984;
      v16 = v12;
      _os_log_impl(&dword_18B0B0000, v11, OS_LOG_TYPE_DEBUG, "[􀉟] Logic controller showing %ld more collections.", (uint8_t *)&v15, 0xCu);
    }

    -[MKPlaceCollectionsLogicController appendBatchOfCollections:](self, "appendBatchOfCollections:", v6);
    -[MKPlaceCollectionsLogicController snapshot](self, "snapshot");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject appendItemsWithIdentifiers:intoSectionWithIdentifier:](v13, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v6, CFSTR("CarouselSection"));
  }
  else
  {
    if (!objc_msgSend(v6, "count"))
    {
      MKGetCuratedCollectionsLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_18B0B0000, v14, OS_LOG_TYPE_ERROR, "[􀉟] placeCollections shouldn't be empty when we were sure to load a batch.", (uint8_t *)&v15, 2u);
      }

    }
    MKGetCuratedCollectionsLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_18B0B0000, v13, OS_LOG_TYPE_DEBUG, "[􀉟] Logic controller was informed about batch load failure.", (uint8_t *)&v15, 2u);
    }
  }

  -[MKPlaceCollectionsLogicController displayCollections](self, "displayCollections");
}

- (void)didStartFetchingBatch
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[MKPlaceCollectionsLogicController snapshot](self, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemIdentifiersInSectionWithIdentifier:", CFSTR("LoadingSection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  MKGetCuratedCollectionsLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_18B0B0000, v6, OS_LOG_TYPE_DEBUG, "[􀉟] Logic controller informed about batch load started when there is already one happening.", v11, 2u);
    }

  }
  else
  {
    if (v7)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_18B0B0000, v6, OS_LOG_TYPE_DEBUG, "[􀉟] Logic controller informed about batch load started. Showing loading cell.", v11, 2u);
    }

    -[MKPlaceCollectionsLogicController snapshot](self, "snapshot");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKCollectionBatchCell reuseIdentifier](MKCollectionBatchCell, "reuseIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v10, CFSTR("LoadingSection"));

    -[MKPlaceCollectionsLogicController displayCollections](self, "displayCollections");
  }
}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (void)setCollectionView:(id)a3
{
  objc_storeWeak((id *)&self->_collectionView, a3);
}

- (NSArray)collections
{
  return self->_collections;
}

- (void)setCollections:(id)a3
{
  objc_storeStrong((id *)&self->_collections, a3);
}

- (NSArray)geoCollections
{
  return self->_geoCollections;
}

- (void)setGeoCollections:(id)a3
{
  objc_storeStrong((id *)&self->_geoCollections, a3);
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (NSDiffableDataSourceSnapshot)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_snapshot, a3);
}

- (MKCuratedCollectionsSyncCoordinator)syncCoordinator
{
  return self->_syncCoordinator;
}

- (void)setSyncCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_syncCoordinator, a3);
}

- (MKPlaceBatchController)batchController
{
  return self->_batchController;
}

- (void)setBatchController:(id)a3
{
  objc_storeStrong((id *)&self->_batchController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchController, 0);
  objc_storeStrong((id *)&self->_syncCoordinator, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_geoCollections, 0);
  objc_storeStrong((id *)&self->_collections, 0);
  objc_destroyWeak((id *)&self->_collectionView);
}

@end
