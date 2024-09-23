@implementation MKPlaceCompactCollectionsLogicController

- (MKPlaceCompactCollectionsLogicController)initWithGuideLocations:(id)a3 context:(int64_t)a4
{
  id v6;
  MKPlaceCompactCollectionsLogicController *v7;
  MKPlaceCompactCollectionsLogicController *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSArray *viewModels;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MKPlaceCompactCollectionsLogicController;
  v7 = -[MKPlaceCompactCollectionsLogicController init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_context = a4;
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[MKPlaceCompactCollectionsLogicController buildViewModelsFromGuideLocations:](v8, "buildViewModelsFromGuideLocations:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

    v11 = objc_msgSend(v9, "copy");
    viewModels = v8->_viewModels;
    v8->_viewModels = (NSArray *)v11;

  }
  return v8;
}

- (MKPlaceCompactCollectionsLogicController)initWithGuideLocationsResult:(id)a3 context:(int64_t)a4 usingCollectionFetcher:(id)a5 usingGuideConsumer:(id)a6 usingBatchSize:(unint64_t)a7 selectedGuideLocation:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  MKPlaceCompactCollectionsLogicController *v18;
  MKPlaceCompactCollectionsLogicController *v19;
  uint64_t v20;
  NSArray *flattenedIdentifiersForBatching;
  objc_super v23;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)MKPlaceCompactCollectionsLogicController;
  v18 = -[MKPlaceCompactCollectionsLogicController init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_context = a4;
    objc_storeStrong((id *)&v18->_selectedGuideLocation, a8);
    if (!a4)
    {
      -[MKPlaceCompactCollectionsLogicController buildBatchingStructureForResult:](v19, "buildBatchingStructureForResult:", v14);
      v20 = objc_claimAutoreleasedReturnValue();
      flattenedIdentifiersForBatching = v19->_flattenedIdentifiersForBatching;
      v19->_flattenedIdentifiersForBatching = (NSArray *)v20;

      if (-[NSArray count](v19->_flattenedIdentifiersForBatching, "count"))
      {
        objc_storeWeak((id *)&v19->_guideConsumer, v16);
        -[MKPlaceCompactCollectionsLogicController createBatchControllerIfNeededUsingIdentifiers:usingCollectionFetcher:usingGuideConsumer:batchSize:](v19, "createBatchControllerIfNeededUsingIdentifiers:usingCollectionFetcher:usingGuideConsumer:batchSize:", v19->_flattenedIdentifiersForBatching, v15, v19, a7);
      }
    }
  }

  return v19;
}

- (void)willDisplayCellAtIndexpath:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  -[MKPlaceCompactCollectionsLogicController batchController](self, "batchController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "item");

  objc_msgSend(v6, "didDisplayItemAtIndex:", v5);
}

- (unint64_t)numberOfSections
{
  void *v3;
  unint64_t v4;

  if (self->_context)
    return 0;
  -[MKPlaceCompactCollectionsLogicController batchableLocations](self, "batchableLocations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)titleForSectionFromTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && !self->_context)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3498]);
    v11 = *MEMORY[0x1E0CEA098];
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB5C0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_mapkit_fontWithWeight:", *MEMORY[0x1E0CEB5F8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "initWithString:attributes:", v4, v9);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)compactCollectionsInSection:(unint64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  if (self->_context == 1)
    goto LABEL_5;
  if (-[MKPlaceCompactCollectionsLogicController numberOfSections](self, "numberOfSections") - 1 < a3)
    return MEMORY[0x1E0C9AA60];
  if (self->_context)
  {
LABEL_5:
    -[MKPlaceCompactCollectionsLogicController viewModels](self, "viewModels");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MKPlaceCompactCollectionsLogicController batchableLocations](self, "batchableLocations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__MKPlaceCompactCollectionsLogicController_compactCollectionsInSection___block_invoke;
    v11[3] = &unk_1E20DA870;
    v12 = v9;
    v10 = v9;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);
    v7 = (void *)objc_msgSend(v10, "copy");

  }
  return v7;
}

void __72__MKPlaceCompactCollectionsLogicController_compactCollectionsInSection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (id)compactCollectionAtIndex:(unint64_t)a3 sectionIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[MKPlaceCompactCollectionsLogicController context](self, "context"))
  {
    -[MKPlaceCompactCollectionsLogicController viewModels](self, "viewModels");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MKPlaceCompactCollectionsLogicController batchableLocations](self, "batchableLocations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)dismissedCompactCollections
{
  void *v3;
  int64_t context;
  uint64_t v5;
  id v6;

  +[MKPlaceCollectionImageProvider sharedInstance](MKPlaceCollectionImageProvider, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  context = self->_context;
  if (context == 2)
    v5 = 2;
  else
    v5 = context == 0;
  objc_msgSend(v3, "cancelAllOperationsForCompactImageSource:", v5);

}

- (id)buildBatchingStructureForResult:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSArray *v13;
  NSArray *batchableLocations;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

  objc_msgSend(v5, "sections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __76__MKPlaceCompactCollectionsLogicController_buildBatchingStructureForResult___block_invoke;
  v17[3] = &unk_1E20DA898;
  v17[4] = self;
  v18 = v6;
  v19 = v9;
  v11 = v9;
  v12 = v6;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v17);

  v13 = (NSArray *)objc_msgSend(v11, "copy");
  batchableLocations = self->_batchableLocations;
  self->_batchableLocations = v13;

  v15 = (void *)objc_msgSend(v12, "copy");
  return v15;
}

void __76__MKPlaceCompactCollectionsLogicController_buildBatchingStructureForResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  MKPlaceCompactCollectionViewModel *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  MKPlaceCompactCollectionViewModel *v11;
  MKPlaceBatchableCompactCollection *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  unint64_t v19;
  MKMapItemIdentifier *v20;
  void *v21;
  void *v22;
  MKMapItemIdentifier *v23;
  MKPlaceBatchableCompactCollection *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  int v34;
  MKPlaceCompactCollectionViewModel *v35;
  _QWORD *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  unint64_t v42;
  BOOL v43;
  __int128 v44;
  void *v45;
  id v46;
  void *v47;
  uint8_t buf[4];
  MKMapItemIdentifier *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "guideLocations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v47 = v5;
  if ((objc_msgSend(v3, "isWorldwideSection") & 1) != 0)
  {
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [MKPlaceCompactCollectionViewModel alloc];
    v8 = *(_QWORD **)(a1 + 32);
    v9 = v8[1];
    objc_msgSend(v8, "selectedGuideLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MKPlaceCompactCollectionViewModel initWithGuideLocation:context:useBorderHighlight:](v7, "initWithGuideLocation:context:useBorderHighlight:", v6, v9, objc_msgSend(v6, "isEqual:", v10));

    v12 = -[MKPlaceBatchableCompactCollection initWithWorldwideViewModel:]([MKPlaceBatchableCompactCollection alloc], "initWithWorldwideViewModel:", v11);
    objc_msgSend(v5, "addObject:", v12);
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);

    v13 = a1;
    v14 = v4;
  }
  else
  {
    objc_msgSend(v3, "guideLocationIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    v13 = a1;
    v14 = v4;
    if (v16)
    {
      v18 = 0;
      v19 = 0;
      *(_QWORD *)&v17 = 138412290;
      v44 = v17;
      v45 = v14;
      v46 = v3;
      do
      {
        v20 = [MKMapItemIdentifier alloc];
        objc_msgSend(v3, "guideLocationIdentifiers");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndex:", v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[MKMapItemIdentifier initWithGEOMapItemIdentifier:](v20, "initWithGEOMapItemIdentifier:", v22);

        if (v23)
        {
          v24 = -[MKPlaceBatchableCompactCollection initWithIdentifier:]([MKPlaceBatchableCompactCollection alloc], "initWithIdentifier:", v23);
          objc_msgSend(v47, "containsObject:", v24);
          objc_msgSend(v47, "addObject:", v24);
          if (v19 < objc_msgSend(v14, "count")
            && (objc_msgSend(v14, "objectAtIndex:", v19),
                v25 = (void *)objc_claimAutoreleasedReturnValue(),
                v25,
                v25))
          {
            v26 = v14;
            v27 = v13;
            objc_msgSend(v26, "objectAtIndex:", v18);
            v28 = v3;
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "guideLocationIdentifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "guideLocationIdentifiers");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "objectAtIndex:", v19);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v18;
            v34 = objc_msgSend(v30, "isEqualToGEOMapItemIdentifier:", v32);

            if (v34)
            {
              v35 = [MKPlaceCompactCollectionViewModel alloc];
              v36 = *(_QWORD **)(v27 + 32);
              v37 = v36[1];
              objc_msgSend(v36, "selectedGuideLocation");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = -[MKPlaceCompactCollectionViewModel initWithGuideLocation:context:useBorderHighlight:](v35, "initWithGuideLocation:context:useBorderHighlight:", v29, v37, objc_msgSend(v29, "isEqual:", v38));

              v13 = v27;
              -[MKPlaceBatchableCompactCollection setViewModel:](v24, "setViewModel:", v39);
              v18 = v33 + 1;
              ++*(_QWORD *)(*(_QWORD *)(v27 + 32) + 72);
              v14 = v45;
            }
            else
            {
              MKGetCuratedCollectionsLog();
              v39 = objc_claimAutoreleasedReturnValue();
              v13 = v27;
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v44;
                v49 = v23;
                _os_log_impl(&dword_18B0B0000, v39, OS_LOG_TYPE_ERROR, "Identifier mismatch when building batching structure. This implies that we have a location:(%@) for which we cannot build a view model.", buf, 0xCu);
              }
              v14 = v45;
              v18 = v33;
            }

            v3 = v46;
          }
          else
          {
            objc_msgSend(*(id *)(v13 + 40), "addObject:", v23, v44);
          }
          v40 = v18;

        }
        else
        {
          v40 = v18;
        }

        ++v19;
        objc_msgSend(v3, "guideLocationIdentifiers");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "count");

        v43 = v19 >= v42;
        v18 = v40;
      }
      while (!v43);
    }
  }
  objc_msgSend(*(id *)(v13 + 48), "addObject:", v47, v44);

}

- (id)buildViewModelsFromGuideLocations:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  MKPlaceCompactCollectionsLogicController *v17;
  id v18;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithCapacity:", objc_msgSend(v5, "count"));
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __78__MKPlaceCompactCollectionsLogicController_buildViewModelsFromGuideLocations___block_invoke;
  v16 = &unk_1E20DA8C0;
  v17 = self;
  v18 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v13);

  v8 = objc_alloc(MEMORY[0x1E0C99E40]);
  v9 = (void *)objc_msgSend(v8, "initWithArray:", v7, v13, v14, v15, v16, v17);
  objc_msgSend(v9, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  return v11;
}

void __78__MKPlaceCompactCollectionsLogicController_buildViewModelsFromGuideLocations___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  MKPlaceCompactCollectionViewModel *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  MKPlaceCompactCollectionViewModel *v8;
  MKPlaceCompactCollectionViewModel *v9;

  v3 = a2;
  v4 = [MKPlaceCompactCollectionViewModel alloc];
  v5 = *(_QWORD **)(a1 + 32);
  v6 = v5[1];
  objc_msgSend(v5, "selectedGuideLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MKPlaceCompactCollectionViewModel initWithGuideLocation:context:useBorderHighlight:](v4, "initWithGuideLocation:context:useBorderHighlight:", v3, v6, objc_msgSend(v3, "isEqual:", v7));

  v8 = v9;
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
    v8 = v9;
  }

}

- (void)createBatchControllerIfNeededUsingIdentifiers:(id)a3 usingCollectionFetcher:(id)a4 usingGuideConsumer:(id)a5 batchSize:(unint64_t)a6
{
  id v10;
  id v11;
  uint64_t v12;
  MKPlaceBatchController *v13;
  id v14;

  v14 = a3;
  v10 = a4;
  v11 = a5;
  -[MKPlaceCompactCollectionsLogicController setBatchController:](self, "setBatchController:", 0);
  v12 = objc_msgSend(v14, "count");
  if (v11 && v10 && v12)
  {
    v13 = -[MKPlaceBatchController initWithItemIdentifiers:withBatchSize:minimumNumberOfItemBeforeFetching:shouldLoadFirstBatchImmediately:usingBatchFetcher:usingBatchConsumer:displayedItemCount:]([MKPlaceBatchController alloc], "initWithItemIdentifiers:withBatchSize:minimumNumberOfItemBeforeFetching:shouldLoadFirstBatchImmediately:usingBatchFetcher:usingBatchConsumer:displayedItemCount:", v14, a6, 2, 0, v10, v11, -[MKPlaceCompactCollectionsLogicController initialDisplayCount](self, "initialDisplayCount"));
    -[MKPlaceCompactCollectionsLogicController setBatchController:](self, "setBatchController:", v13);

  }
}

- (void)shouldConsumeBatch:(BOOL)a3 fetchedBatch:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  MKPlaceCompactCollectionsLogicController *v12;
  _QWORD *v13;
  _QWORD v14[4];

  v4 = a3;
  v6 = a4;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  -[MKPlaceCompactCollectionsLogicController batchableLocations](self, "batchableLocations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__MKPlaceCompactCollectionsLogicController_shouldConsumeBatch_fetchedBatch___block_invoke;
  v10[3] = &unk_1E20DA910;
  v13 = v14;
  v8 = v6;
  v11 = v8;
  v12 = self;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

  -[MKPlaceCompactCollectionsLogicController guideConsumer](self, "guideConsumer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shouldConsumeBatch:fetchedBatch:", v4, v8);

  _Block_object_dispose(v14, 8);
}

void __76__MKPlaceCompactCollectionsLogicController_shouldConsumeBatch_fetchedBatch___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__MKPlaceCompactCollectionsLogicController_shouldConsumeBatch_fetchedBatch___block_invoke_2;
  v9[3] = &unk_1E20DA8E8;
  v12 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 32);
  v13 = a4;
  v8 = *(_QWORD *)(a1 + 40);
  v10 = v7;
  v11 = v8;
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v9);

}

void __76__MKPlaceCompactCollectionsLogicController_shouldConsumeBatch_fetchedBatch___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  MKPlaceCompactCollectionViewModel *v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  MKPlaceCompactCollectionViewModel *v17;
  id v18;

  v18 = a2;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v6 == objc_msgSend(*(id *)(a1 + 32), "count") - 1)
  {
    *a4 = 1;
    **(_BYTE **)(a1 + 56) = 1;
  }
  objc_msgSend(v18, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "guideLocationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "geoMapItemIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "guideLocationIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (v12)
    {
      v13 = [MKPlaceCompactCollectionViewModel alloc];
      v14 = *(_QWORD **)(a1 + 40);
      v15 = v14[1];
      objc_msgSend(v14, "selectedGuideLocation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[MKPlaceCompactCollectionViewModel initWithGuideLocation:context:useBorderHighlight:](v13, "initWithGuideLocation:context:useBorderHighlight:", v8, v15, objc_msgSend(v8, "isEqual:", v16));

      objc_msgSend(v18, "setViewModel:", v17);
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

    }
  }

}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (NSArray)viewModels
{
  return self->_viewModels;
}

- (void)setViewModels:(id)a3
{
  objc_storeStrong((id *)&self->_viewModels, a3);
}

- (NSArray)batchableLocations
{
  return self->_batchableLocations;
}

- (void)setBatchableLocations:(id)a3
{
  objc_storeStrong((id *)&self->_batchableLocations, a3);
}

- (NSArray)flattenedIdentifiersForBatching
{
  return self->_flattenedIdentifiersForBatching;
}

- (void)setFlattenedIdentifiersForBatching:(id)a3
{
  objc_storeStrong((id *)&self->_flattenedIdentifiersForBatching, a3);
}

- (MKPlaceBatchController)batchController
{
  return self->_batchController;
}

- (void)setBatchController:(id)a3
{
  objc_storeStrong((id *)&self->_batchController, a3);
}

- (MKPlaceBatchConsumer)guideConsumer
{
  return (MKPlaceBatchConsumer *)objc_loadWeakRetained((id *)&self->_guideConsumer);
}

- (void)setGuideConsumer:(id)a3
{
  objc_storeWeak((id *)&self->_guideConsumer, a3);
}

- (GEOGuideLocation)selectedGuideLocation
{
  return self->_selectedGuideLocation;
}

- (void)setSelectedGuideLocation:(id)a3
{
  objc_storeStrong((id *)&self->_selectedGuideLocation, a3);
}

- (unint64_t)initialDisplayCount
{
  return self->_initialDisplayCount;
}

- (void)setInitialDisplayCount:(unint64_t)a3
{
  self->_initialDisplayCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedGuideLocation, 0);
  objc_destroyWeak((id *)&self->_guideConsumer);
  objc_storeStrong((id *)&self->_batchController, 0);
  objc_storeStrong((id *)&self->_flattenedIdentifiersForBatching, 0);
  objc_storeStrong((id *)&self->_batchableLocations, 0);
  objc_storeStrong((id *)&self->_viewModels, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
