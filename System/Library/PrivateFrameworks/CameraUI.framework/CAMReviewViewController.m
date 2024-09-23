@implementation CAMReviewViewController

- (CAMReviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[CAMReviewViewController initWithAssets:](self, "initWithAssets:", 0, a4);
}

- (CAMReviewViewController)initWithCoder:(id)a3
{
  return -[CAMReviewViewController initWithAssets:](self, "initWithAssets:", MEMORY[0x1E0C9AA60]);
}

- (CAMReviewViewController)initWithAssets:(id)a3
{
  id v4;
  CAMReviewViewController *v5;
  uint64_t v6;
  NSArray *initialAssets;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  PUReviewDataSource *v15;
  PUReviewDataSource *reviewDataSource;
  uint64_t v17;
  PUReviewAssetsDataSourceManager *internalReviewDataSourceManager;
  PUReviewAssetsMediaProvider *v19;
  PUReviewAssetsMediaProvider *internalReviewMediaProvider;
  void *v21;
  uint64_t v22;
  PUAssetExplorerReviewScreenViewController *internalReviewViewController;
  CAMReviewViewController *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CAMReviewViewController;
  v5 = -[CAMReviewViewController initWithNibName:bundle:](&v30, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    initialAssets = v5->__initialAssets;
    v5->__initialAssets = (NSArray *)v6;

    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v13), "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v11);
    }

    v15 = (PUReviewDataSource *)objc_alloc_init(MEMORY[0x1E0D7D230]);
    reviewDataSource = v5->__reviewDataSource;
    v5->__reviewDataSource = v15;

    -[PUReviewDataSource insertAssets:](v5->__reviewDataSource, "insertAssets:", v9);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7D220]), "initWithReviewDataSource:", v5->__reviewDataSource);
    internalReviewDataSourceManager = v5->__internalReviewDataSourceManager;
    v5->__internalReviewDataSourceManager = (PUReviewAssetsDataSourceManager *)v17;

    v19 = (PUReviewAssetsMediaProvider *)objc_alloc_init(MEMORY[0x1E0D7D228]);
    internalReviewMediaProvider = v5->__internalReviewMediaProvider;
    v5->__internalReviewMediaProvider = v19;

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7D1A8]), "initWithDataSourceManager:mediaProvider:reviewAssetProvider:initialIndexPath:initialSelectedAssetUUIDs:initialDisabledLivePhotoAssetUUIDs:sourceType:", v5->__internalReviewDataSourceManager, v5->__internalReviewMediaProvider, 0, v21, v8, 0, 2);
    internalReviewViewController = v5->__internalReviewViewController;
    v5->__internalReviewViewController = (PUAssetExplorerReviewScreenViewController *)v22;

    -[PUAssetExplorerReviewScreenViewController setDelegate:](v5->__internalReviewViewController, "setDelegate:", v5);
    v24 = v5;

  }
  return v5;
}

- (void)loadView
{
  CAMReviewViewControllerContainerView *v3;
  void *v4;
  void *v5;
  CAMReviewViewControllerContainerView *v6;

  v3 = [CAMReviewViewControllerContainerView alloc];
  v6 = -[CAMReviewViewControllerContainerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CAMReviewViewController _internalReviewViewController](self, "_internalReviewViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMReviewViewController addChildViewController:](self, "addChildViewController:", v4);
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMReviewViewControllerContainerView setReviewView:](v6, "setReviewView:", v5);
  objc_msgSend(v4, "didMoveToParentViewController:", self);
  -[CAMReviewViewController setView:](self, "setView:", v6);

}

- (BOOL)assetExplorerReviewScreenViewController:(id)a3 canPerformActionType:(unint64_t)a4 onAsset:(id)a5 inAssetCollection:(id)a6
{
  return (a4 < 7) & (0x67u >> a4);
}

- (BOOL)assetExplorerReviewScreenViewController:(id)a3 shouldEnableActionType:(unint64_t)a4 onAsset:(id)a5 inAssetCollection:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  BOOL result;

  result = 0;
  if (a4 <= 6)
  {
    if (((1 << a4) & 0x65) != 0)
    {
      return 1;
    }
    else if (a4 == 1)
    {
      return objc_msgSend(a5, "isTemporaryPlaceholder", a3, v6, v7) ^ 1;
    }
  }
  return result;
}

- (void)assetExplorerReviewScreenViewControllerDidPressCancel:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  -[CAMReviewViewController reviewDelegate](self, "reviewDelegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v7 = (void *)v4;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "reviewViewControllerDidCancelReview:", self);
      v5 = v7;
    }
  }

}

- (void)assetExplorerReviewScreenViewControllerDidPressRetake:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  -[CAMReviewViewController reviewDelegate](self, "reviewDelegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v7 = (void *)v4;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "reviewViewControllerDidRequestRetake:", self);
      v5 = v7;
    }
  }

}

- (void)assetExplorerReviewScreenViewController:(id)a3 didPerformCompletionAction:(unint64_t)a4 withSelectedAssetUUIDs:(id)a5 livePhotoDisabledAssetUUIDs:(id)a6 substituteAssetsByUUID:(id)a7
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CAMReviewViewController *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a7;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = self;
  -[CAMReviewViewController _initialAssets](self, "_initialAssets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v17, "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "containsObject:", v18))
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            v20 = v19;
          else
            v20 = v17;
          objc_msgSend(v11, "addObject:", v20);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v14);
  }
  v21 = (void *)objc_msgSend(v11, "copy");
  -[CAMReviewViewController reviewDelegate](v23, "reviewDelegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v22, "reviewViewController:didFinishReviewingAssets:", v23, v21);

}

- (CAMCameraReviewDelegate)reviewDelegate
{
  return (CAMCameraReviewDelegate *)objc_loadWeakRetained((id *)&self->_reviewDelegate);
}

- (void)setReviewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_reviewDelegate, a3);
}

- (NSArray)_initialAssets
{
  return self->__initialAssets;
}

- (PUReviewDataSource)_reviewDataSource
{
  return self->__reviewDataSource;
}

- (PUReviewAssetsDataSourceManager)_internalReviewDataSourceManager
{
  return self->__internalReviewDataSourceManager;
}

- (PUReviewAssetsMediaProvider)_internalReviewMediaProvider
{
  return self->__internalReviewMediaProvider;
}

- (PUAssetExplorerReviewScreenViewController)_internalReviewViewController
{
  return self->__internalReviewViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__internalReviewViewController, 0);
  objc_storeStrong((id *)&self->__internalReviewMediaProvider, 0);
  objc_storeStrong((id *)&self->__internalReviewDataSourceManager, 0);
  objc_storeStrong((id *)&self->__reviewDataSource, 0);
  objc_storeStrong((id *)&self->__initialAssets, 0);
  objc_destroyWeak((id *)&self->_reviewDelegate);
}

@end
