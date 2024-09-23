@implementation CKPhotosGridFooterViewModel

- (id)initAssetsDataSourceManager:(id)a3 syndicationIdentifiers:(id)a4
{
  id v7;
  id v8;
  CKPhotosGridFooterViewModel *v9;
  CKPhotosGridFooterViewModel *v10;
  uint64_t v11;
  uint64_t v12;
  PXAssetsDataSourceCountsController *assetsCountsController;
  uint64_t v14;
  NSArray *syndicationIdentifiers;
  void *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CKPhotosGridFooterViewModel;
  v9 = -[PXFooterViewModel init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    v11 = MEMORY[0x1E0D7C348];
    *(_OWORD *)&v9->_detailedCounts.photosCount = *MEMORY[0x1E0D7C348];
    v9->_detailedCounts.othersCount = *(_QWORD *)(v11 + 16);
    v9->_savedCount = -1;
    objc_storeStrong((id *)&v9->_assetsDataSourceManager, a3);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7B210]), "initWithAssetsDataSourceManager:", v10->_assetsDataSourceManager);
    assetsCountsController = v10->_assetsCountsController;
    v10->_assetsCountsController = (PXAssetsDataSourceCountsController *)v12;

    -[PXAssetsDataSourceCountsController registerChangeObserver:context:](v10->_assetsCountsController, "registerChangeObserver:context:", v10, PXAssetsDataSourceCountsControllerObserverContext);
    -[PXAssetsDataSourceCountsController prepareCountsIfNeeded](v10->_assetsCountsController, "prepareCountsIfNeeded");
    -[CKPhotosGridFooterViewModel _updateDetailedCounts](v10, "_updateDetailedCounts");
    if (v8)
    {
      v14 = objc_msgSend(v8, "copy");
      syndicationIdentifiers = v10->_syndicationIdentifiers;
      v10->_syndicationIdentifiers = (NSArray *)v14;

      objc_msgSend(MEMORY[0x1E0D358C0], "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "registerPhotoLibraryPersistenceManagerListener:", v10);

      -[CKPhotosGridFooterViewModel _updateSavedCount](v10, "_updateSavedCount");
    }
  }

  return v10;
}

- (void)_updateDetailedCounts
{
  PXAssetsDataSourceCountsController *assetsCountsController;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  v6 = 0uLL;
  v7 = 0;
  assetsCountsController = self->_assetsCountsController;
  if (assetsCountsController)
    -[PXAssetsDataSourceCountsController counts](assetsCountsController, "counts");
  v4 = v6;
  v5 = v7;
  -[CKPhotosGridFooterViewModel setDetailedCounts:](self, "setDetailedCounts:", &v4);
}

- (void)_updateSavedCount
{
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_syndicationIdentifiers);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D358C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cachedCountOfSyndicationIdentifiersSavedToSystemPhotoLibrary:shouldFetchAndNotifyAsNeeded:didStartFetch:", v5, 1, 0);

  -[CKPhotosGridFooterViewModel setSavedCount:](self, "setSavedCount:", v4);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 1) != 0 && (void *)PXAssetsDataSourceCountsControllerObserverContext == a5)
    -[CKPhotosGridFooterViewModel _updateDetailedCounts](self, "_updateDetailedCounts", a3);
}

- (void)setDetailedCounts:(id *)a3
{
  $C8986E5AD9146E03F7E851F39E835596 *p_detailedCounts;
  unint64_t var2;
  unint64_t photosCount;
  unint64_t videosCount;
  BOOL v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void (*v16)(unint64_t, unint64_t, unint64_t, uint64_t, _QWORD);
  int64_t savedCount;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  __int128 v23;
  void *(*othersCount)(uint64_t);
  void *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void *v30;

  p_detailedCounts = &self->_detailedCounts;
  if (self->_detailedCounts.photosCount != a3->var0
    || self->_detailedCounts.videosCount != a3->var1
    || self->_detailedCounts.othersCount != a3->var2)
  {
    var2 = a3->var2;
    *(_OWORD *)&p_detailedCounts->photosCount = *(_OWORD *)&a3->var0;
    self->_detailedCounts.othersCount = var2;
    photosCount = p_detailedCounts->photosCount;
    videosCount = self->_detailedCounts.videosCount;
    v12 = p_detailedCounts->photosCount == 0x7FFFFFFFFFFFFFFFLL
       || videosCount == 0x7FFFFFFFFFFFFFFFLL
       || var2 == 0x7FFFFFFFFFFFFFFFLL
       || videosCount + photosCount + var2 == 0;
    v13 = MEMORY[0x1E0C809B0];
    if (v12)
    {
      CKFrameworkBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CKPhotosGridFooterViewModelLoadingCountsTitle"), &stru_1E276D870, CFSTR("ChatKit"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v27 = 0;
      v28 = &v27;
      v29 = 0x2020000000;
      v16 = (void (*)(unint64_t, unint64_t, unint64_t, uint64_t, _QWORD))getPLLocalizedCountDescriptionSymbolLoc_ptr;
      v30 = getPLLocalizedCountDescriptionSymbolLoc_ptr;
      if (!getPLLocalizedCountDescriptionSymbolLoc_ptr)
      {
        *(_QWORD *)&v23 = MEMORY[0x1E0C809B0];
        *((_QWORD *)&v23 + 1) = 3221225472;
        othersCount = __getPLLocalizedCountDescriptionSymbolLoc_block_invoke;
        v25 = &unk_1E274A178;
        v26 = &v27;
        __getPLLocalizedCountDescriptionSymbolLoc_block_invoke((uint64_t)&v23);
        v16 = (void (*)(unint64_t, unint64_t, unint64_t, uint64_t, _QWORD))v28[3];
      }
      _Block_object_dispose(&v27, 8);
      if (!v16)
        -[CKPhotosGridFooterViewModel setDetailedCounts:].cold.1();
      v16(photosCount, videosCount, var2, 1, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    savedCount = self->_savedCount;
    v23 = *(_OWORD *)&p_detailedCounts->photosCount;
    othersCount = (void *(*)(uint64_t))p_detailedCounts->othersCount;
    _SavedCountDescriptionWithCounts(&v23, savedCount);
    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __49__CKPhotosGridFooterViewModel_setDetailedCounts___block_invoke;
    v20[3] = &unk_1E2755DE8;
    v21 = v15;
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v18 = v22;
    v19 = v15;
    -[PXFooterViewModel performChanges:](self, "performChanges:", v20);

  }
}

void __49__CKPhotosGridFooterViewModel_setDetailedCounts___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setTitle:", v3);
  objc_msgSend(v4, "setSubtitle1:", *(_QWORD *)(a1 + 40));

}

- (void)setSavedCount:(int64_t)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  $C8986E5AD9146E03F7E851F39E835596 detailedCounts;

  if (self->_savedCount != a3)
  {
    self->_savedCount = a3;
    detailedCounts = self->_detailedCounts;
    _SavedCountDescriptionWithCounts(&detailedCounts, a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __45__CKPhotosGridFooterViewModel_setSavedCount___block_invoke;
    v6[3] = &unk_1E2755E10;
    v7 = v4;
    v5 = v4;
    -[PXFooterViewModel performChanges:](self, "performChanges:", v6);

  }
}

uint64_t __45__CKPhotosGridFooterViewModel_setSavedCount___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSubtitle1:", *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsCountsController, 0);
  objc_storeStrong((id *)&self->_syndicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_assetsDataSourceManager, 0);
}

- (void)setDetailedCounts:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *SOFT_LINKED_PLLocalizedCountDescription(NSUInteger, NSUInteger, NSUInteger, BOOL, BOOL)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKPhotosGridFooterViewModel.m"), 28, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
