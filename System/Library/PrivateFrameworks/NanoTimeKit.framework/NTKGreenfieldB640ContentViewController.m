@implementation NTKGreenfieldB640ContentViewController

- (id)initForAddWatchFacesStateWithGreenfieldB640Model:(id)a3
{
  id v5;
  NTKGreenfieldB640ContentViewController *v6;
  NTKGreenfieldB640ContentViewController *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *workQueue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKGreenfieldB640ContentViewController;
  v6 = -[NTKGreenfieldB640ContentViewController initWithTitle:detailText:icon:contentLayout:](&v11, sel_initWithTitle_detailText_icon_contentLayout_, &stru_1E6BDC918, 0, 0, 3);
  v7 = v6;
  if (v6)
  {
    v6->_state = 0;
    -[BPSWelcomeOptinViewController setStyle:](v6, "setStyle:", 10);
    objc_storeStrong((id *)&v7->_greenfieldB640Model, a3);
    v8 = dispatch_queue_create("com.apple.NanoTimeKit.NTKGreenfieldB640ContentViewControllerDecodeBandImage.queue", 0);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v8;

  }
  return v7;
}

- (id)initForErrorStateWithGreenfieldB640Model:(id)a3
{
  id v5;
  NTKGreenfieldB640ContentViewController *v6;
  NTKGreenfieldB640ContentViewController *v7;
  id *p_greenfieldB640Model;
  dispatch_queue_t v9;
  OS_dispatch_queue *workQueue;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)NTKGreenfieldB640ContentViewController;
  v6 = -[NTKGreenfieldB640ContentViewController initWithTitle:detailText:icon:contentLayout:](&v26, sel_initWithTitle_detailText_icon_contentLayout_, &stru_1E6BDC918, 0, 0, 3);
  v7 = v6;
  if (v6)
  {
    p_greenfieldB640Model = (id *)&v6->_greenfieldB640Model;
    objc_storeStrong((id *)&v6->_greenfieldB640Model, a3);
    v9 = dispatch_queue_create("com.apple.NanoTimeKit.NTKGreenfieldB640ContentViewControllerDecodeBandImage.queue", 0);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v9;

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(*p_greenfieldB640Model, "watchFaceModels", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "decodedRecipe");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "watchFace");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16)
          {
            LOBYTE(v12) = 1;
            goto LABEL_12;
          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_12:

    objc_msgSend(*p_greenfieldB640Model, "watchFaceModels");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if ((v12 & 1) != 0 || !v18)
    {
      v7->_state = 2;
    }
    else
    {
      v7->_state = 1;
      if (NTKInternalBuild(v19, v20))
        -[BPSWelcomeOptinViewController setStyle:](v7, "setStyle:", 2);
    }
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKGreenfieldB640ContentViewController;
  -[BPSWelcomeOptinViewController viewDidLoad](&v8, sel_viewDidLoad);
  if (self->_state == 2)
  {
    -[NTKGreenfieldB640ContentViewController _presentErrorAlert](self, "_presentErrorAlert");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKGreenfieldB640ContentViewController _notifyDelegateOfActionEventWatchFaceSelected:](self, "_notifyDelegateOfActionEventWatchFaceSelected:", v3);
    -[NTKGreenfieldB640Model bandImagePath](self->_greenfieldB640Model, "bandImagePath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKGreenfieldB640Model bandImageBundle](self->_greenfieldB640Model, "bandImageBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKGreenfieldB640ContentViewController _setupContentForAddWathFaceWithBandImagePath:bundle:](self, "_setupContentForAddWathFaceWithBandImagePath:bundle:", v4, v5);

    -[BPSWelcomeOptinViewController alternateChoiceButton](self, "alternateChoiceButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    BPSSetupTintColor();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitleColor:forState:", v7, 0);

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  int64x2_t v33;
  int64x2_t v34;
  int64x2_t v35;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)NTKGreenfieldB640ContentViewController;
  -[OBBaseWelcomeController viewDidLayoutSubviews](&v36, sel_viewDidLayoutSubviews);
  -[UICollectionView frame](self->_facesCollectionView, "frame");
  -[NTKGreenfieldB640ContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[NTKGreenfieldB640ContentViewController cellSize](self, "cellSize");
  v7 = v6;
  v8 = 0.0;
  if (!self->_state)
  {
    v31 = 0;
    v32 = 0;
    v33 = vdupq_n_s64(0x404A000000000000uLL);
    v34 = v33;
    v35 = v33;
    BPSScreenValueGetRelevantValue();
    v8 = v9;
  }
  -[UICollectionView setFrame:](self->_facesCollectionView, "setFrame:", 0.0, v8, v5, v7, v31, v32, *(_OWORD *)&v33, *(_OWORD *)&v34, *(_OWORD *)&v35);
  -[NTKGreenfieldB640ContentViewController cellSize](self, "cellSize");
  -[UICollectionViewFlowLayout setItemSize:](self->_collectionViewFlowLayout, "setItemSize:");
  -[NTKGreenfieldB640ContentViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[NTKGreenfieldB640ContentViewController scrollView](self, "scrollView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  -[NTKGreenfieldB640ContentViewController scrollView](self, "scrollView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "verticalScrollIndicatorInsets");
  v22 = v21;
  v24 = v23;
  v26 = v25;

  -[NTKGreenfieldB640ContentViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "safeAreaInsets");
  v29 = v28;

  -[NTKGreenfieldB640ContentViewController scrollView](self, "scrollView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setVerticalScrollIndicatorInsets:", v29, v22, v24, v26);

}

- (id)titleString
{
  unint64_t state;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  state = self->_state;
  if (state == 1)
  {
    -[NTKGreenfieldB640Model error](self->_greenfieldB640Model, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKGreenfieldB640ContentViewController _titleForError:](self, "_titleForError:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (state)
  {
    v12 = 0;
  }
  else
  {
    -[NTKGreenfieldB640Model watchFaceModels](self->_greenfieldB640Model, "watchFaceModels");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5 == 1)
    {
      -[NTKGreenfieldB640Model watchFaceModels](self->_greenfieldB640Model, "watchFaceModels");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "decodedRecipe");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "watchFace");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "faceSharingName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      NTKClockFaceLocalizedString(CFSTR("GREENFIELD_B640_TITLE_WATCH_FACE_MAIN_SCREEN"), CFSTR("Add %@ Watch Face"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v11, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      NTKClockFaceLocalizedString(CFSTR("GREENFIELD_B640_TITLE_MAIN_SCREEN"), CFSTR("Add Watch Face"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v12;
}

- (id)detailString
{
  void *v3;
  void *v4;

  if (self->_state == 1)
  {
    -[NTKGreenfieldB640Model error](self->_greenfieldB640Model, "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKGreenfieldB640ContentViewController _subtitleForError:](self, "_subtitleForError:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)suggestedButtonTitle
{
  unint64_t state;
  void *v3;

  state = self->_state;
  if (state == 1)
  {
    if (NTKInternalBuild(self, a2))
      return CFSTR("[INTERNAL ONLY: SHOW ERROR]");
    else
      return 0;
  }
  else
  {
    if (state)
    {
      v3 = 0;
    }
    else
    {
      NTKClockFaceLocalizedString(CFSTR("GREENFIELD_B640_ADD_TO_MY_FACES_BUTTON_TITLE"), CFSTR("Add to My Faces"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    return v3;
  }
}

- (id)alternateButtonTitle
{
  if (self->_state)
    return 0;
  NTKClockFaceLocalizedString(CFSTR("GREENFIELD__B640_SKIP_BUTTON_TITLE"), CFSTR("Skip"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)suggestedButtonPressed:(id)a3
{
  id v4;
  void *v5;
  unint64_t state;
  id WeakRetained;
  int v8;
  id v9;

  v4 = a3;
  v5 = v4;
  state = self->_state;
  if (state == 1)
  {
    v9 = v4;
    v8 = NTKInternalBuild(v4, v4);
    v5 = v9;
    if (v8)
    {
      -[NTKGreenfieldB640ContentViewController _didTapShowInternalErrorButton](self, "_didTapShowInternalErrorButton");
      goto LABEL_6;
    }
  }
  else if (!state)
  {
    v9 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_greenfieldB640delegate);
    objc_msgSend(WeakRetained, "greenfieldB640ContentViewController:handleButtonActionEvent:", self, 0);

LABEL_6:
    v5 = v9;
  }

}

- (void)alternateButtonPressed:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_greenfieldB640delegate);
  objc_msgSend(WeakRetained, "greenfieldB640ContentViewController:handleButtonActionEvent:", self, 1);

}

- (void)handleWatchFaceSelectedAtIndex:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;

  -[NTKGreenfieldB640Model watchFaceModels](self->_greenfieldB640Model, "watchFaceModels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 > a3)
  {
    -[NTKGreenfieldB640Model watchFaceModels](self->_greenfieldB640Model, "watchFaceModels");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a3);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKGreenfieldB640ContentViewController _updateSelectedState:forCellAtIndexPath:](self, "_updateSelectedState:forCellAtIndexPath:", objc_msgSend(v9, "isSelected"), v8);

  }
}

- (void)handleWatchFaceSelectedWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[NTKGreenfieldB640ContentViewController _titleForError:](self, "_titleForError:", v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKGreenfieldB640ContentViewController _subtitleForError:](self, "_subtitleForError:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v10, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC3448];
  NTKClockFaceLocalizedString(CFSTR("GREENFIELD_B640_ERROR_ALERT_OK_BUTON_TITLE"), CFSTR("OK"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAction:", v9);
  -[NTKGreenfieldB640ContentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)_setupContentForAddWathFaceWithBandImagePath:(id)a3 bundle:(id)a4
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__NTKGreenfieldB640ContentViewController__setupContentForAddWathFaceWithBandImagePath_bundle___block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __94__NTKGreenfieldB640ContentViewController__setupContentForAddWathFaceWithBandImagePath_bundle___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v2 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1272), "bandImagePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1272), "bandImageBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_defaultBandNameForCurrentPairedDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NTKImageNamed(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "size");
  if (v9 != v13 || v11 != v12)
  {
    v15 = v7;

    v5 = v15;
  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __94__NTKGreenfieldB640ContentViewController__setupContentForAddWathFaceWithBandImagePath_bundle___block_invoke_2;
  v17[3] = &unk_1E6BCD778;
  v17[4] = *(_QWORD *)(a1 + 32);
  v18 = v5;
  v16 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v17);

}

uint64_t __94__NTKGreenfieldB640ContentViewController__setupContentForAddWathFaceWithBandImagePath_bundle___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1296), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_setupViews");
}

- (id)_defaultBandNameForCurrentPairedDevice
{
  void *v2;
  uint64_t v3;
  const __CFString *v4;

  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceCategory");
  if ((unint64_t)(v3 - 3) > 2)
    v4 = CFSTR("default_band_asset");
  else
    v4 = off_1E6BCE3A8[v3 - 3];

  return (id)v4;
}

- (void)_setupViews
{
  UICollectionViewFlowLayout *v3;
  UICollectionViewFlowLayout *collectionViewFlowLayout;
  id v5;
  UICollectionView *v6;
  UICollectionView *facesCollectionView;
  UICollectionView *v8;
  uint64_t v9;
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
  void *v30;
  _QWORD v31[5];

  v31[4] = *MEMORY[0x1E0C80C00];
  v3 = (UICollectionViewFlowLayout *)objc_opt_new();
  collectionViewFlowLayout = self->_collectionViewFlowLayout;
  self->_collectionViewFlowLayout = v3;

  -[UICollectionViewFlowLayout setScrollDirection:](self->_collectionViewFlowLayout, "setScrollDirection:", 1);
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](self->_collectionViewFlowLayout, "setMinimumInteritemSpacing:", 4.0);
  v5 = objc_alloc(MEMORY[0x1E0DC35B8]);
  v6 = (UICollectionView *)objc_msgSend(v5, "initWithFrame:collectionViewLayout:", self->_collectionViewFlowLayout, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  facesCollectionView = self->_facesCollectionView;
  self->_facesCollectionView = v6;

  v8 = self->_facesCollectionView;
  v9 = objc_opt_class();
  +[NTKGreenfieldB640CollectionViewCell reuseIdentifier](NTKGreenfieldB640CollectionViewCell, "reuseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v8, "registerClass:forCellWithReuseIdentifier:", v9, v10);

  BPSBackgroundColor();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](self->_facesCollectionView, "setBackgroundColor:", v11);

  -[UICollectionView setDelegate:](self->_facesCollectionView, "setDelegate:", self);
  -[UICollectionView setDataSource:](self->_facesCollectionView, "setDataSource:", self);
  -[UICollectionView setShowsHorizontalScrollIndicator:](self->_facesCollectionView, "setShowsHorizontalScrollIndicator:", 0);
  -[UICollectionView setAlwaysBounceHorizontal:](self->_facesCollectionView, "setAlwaysBounceHorizontal:", 0);
  -[NTKGreenfieldB640ContentViewController contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", self->_facesCollectionView);

  v23 = (void *)MEMORY[0x1E0CB3718];
  -[NTKGreenfieldB640ContentViewController contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView topAnchor](self->_facesCollectionView, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v27;
  -[NTKGreenfieldB640ContentViewController contentView](self, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView leadingAnchor](self->_facesCollectionView, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v13;
  -[NTKGreenfieldB640ContentViewController contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView trailingAnchor](self->_facesCollectionView, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v17;
  -[NTKGreenfieldB640ContentViewController contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView bottomAnchor](self->_facesCollectionView, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activateConstraints:", v22);

}

- (void)_presentErrorAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];

  -[NTKGreenfieldB640Model error](self->_greenfieldB640Model, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKGreenfieldB640ContentViewController _titleForError:](self, "_titleForError:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKGreenfieldB640Model error](self->_greenfieldB640Model, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKGreenfieldB640ContentViewController _subtitleForError:](self, "_subtitleForError:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (NTKInternalBuild(v7, v8))
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    -[NTKGreenfieldB640Model error](self->_greenfieldB640Model, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("\n \n [INTERNAL ONLY] \n Please file a radar and include a sysdiagnose. Error: reason: %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v6, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v12;
  }
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v4, v6, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0DC3448];
  NTKClockFaceLocalizedString(CFSTR("GREENFIELD_B640_ERROR_ALERT_OK_BUTON_TITLE"), CFSTR("OK"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __60__NTKGreenfieldB640ContentViewController__presentErrorAlert__block_invoke;
  v17[3] = &unk_1E6BCE388;
  v17[4] = self;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 1, v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addAction:", v16);
  -[NTKGreenfieldB640ContentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);

}

void __60__NTKGreenfieldB640ContentViewController__presentErrorAlert__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1312));
  objc_msgSend(WeakRetained, "greenfieldB640ContentViewController:handleButtonActionEvent:", *(_QWORD *)(a1 + 32), 2);

}

- (void)_notifyDelegateOfActionEventWatchFaceSelected:(id)a3
{
  void *v4;
  unint64_t v5;
  id WeakRetained;
  id v7;

  v7 = a3;
  -[NTKGreenfieldB640Model watchFaceModels](self->_greenfieldB640Model, "watchFaceModels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "row");
  if (v5 < objc_msgSend(v4, "count") && (objc_msgSend(v7, "row") & 0x8000000000000000) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_greenfieldB640delegate);
    objc_msgSend(WeakRetained, "greenfieldB640ContentViewController:handleWatchFaceSelectedEventAtIndex:", self, objc_msgSend(v7, "row"));

  }
}

- (CGSize)cellSize
{
  CGSize *p_cellSize;
  double width;
  double height;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  __CFString *v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGSize result;

  v25 = *MEMORY[0x1E0C80C00];
  p_cellSize = &self->_cellSize;
  width = self->_cellSize.width;
  height = self->_cellSize.height;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[NTKGreenfieldB640Model watchFaceModels](self->_greenfieldB640Model, "watchFaceModels");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      v10 = &stru_1E6BDC918;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "decodedRecipe");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "watchFace");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "faceSharingName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = objc_msgSend(v14, "length");
          if (v15 > -[__CFString length](v10, "length"))
          {
            v16 = v14;

            v10 = v16;
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v8);
    }
    else
    {
      v10 = &stru_1E6BDC918;
    }
    NTKImageNamed(CFSTR("default_band_asset"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKGreenfieldB640CollectionViewCell cellSizeForWatchBandImage:watchFaceName:](NTKGreenfieldB640CollectionViewCell, "cellSizeForWatchBandImage:watchFaceName:", v17, v10);
    p_cellSize->width = v18;
    p_cellSize->height = v19;

    width = p_cellSize->width;
    height = p_cellSize->height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  UICollectionView *facesCollectionView;
  void *v7;
  void *v8;
  unint64_t state;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = a4;
  facesCollectionView = self->_facesCollectionView;
  +[NTKGreenfieldB640CollectionViewCell reuseIdentifier](NTKGreenfieldB640CollectionViewCell, "reuseIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](facesCollectionView, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  state = self->_state;
  if (state)
  {
    v10 = 0;
  }
  else
  {
    -[NTKGreenfieldB640Model watchFaceModels](self->_greenfieldB640Model, "watchFaceModels");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (unint64_t)objc_msgSend(v11, "count") > 1;

    state = self->_state;
  }
  -[NTKGreenfieldB640Model watchFaceModels](self->_greenfieldB640Model, "watchFaceModels");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v5, "row"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "isSelected");
  objc_msgSend(v13, "decodedRecipe");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_state <= 1)
  {
    v16 = state == 1 || v10;
    objc_msgSend(v8, "prepareCellWithDecodedRecipe:bandImage:shouldPresentFaceName:shouldPresentCheckmark:isSelected:", v15, self->_watchBandImage, v16, v10, v14);
  }
  BPSBackgroundColor();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v17);

  return v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  if (!self->_state)
    -[NTKGreenfieldB640ContentViewController _notifyDelegateOfActionEventWatchFaceSelected:](self, "_notifyDelegateOfActionEventWatchFaceSelected:", a4);
}

- (void)_updateSelectedState:(BOOL)a3 forCellAtIndexPath:(id)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a3;
  -[UICollectionView cellForItemAtIndexPath:](self->_facesCollectionView, "cellForItemAtIndexPath:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateSeletedState:", v4);

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[NTKGreenfieldB640Model watchFaceModels](self->_greenfieldB640Model, "watchFaceModels", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;
  void *v15;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  UIEdgeInsets result;

  -[NTKGreenfieldB640ContentViewController cellSize](self, "cellSize", a3, a4, a5);
  v7 = v6;
  -[NTKGreenfieldB640Model watchFaceModels](self->_greenfieldB640Model, "watchFaceModels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = 0;
    v11 = 0.0;
    do
    {
      -[NTKGreenfieldB640Model watchFaceModels](self->_greenfieldB640Model, "watchFaceModels");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count") - 1;

      if (v10 == v13)
        v14 = v7;
      else
        v14 = v7 + 4.0;
      v11 = v11 + v14;
      ++v10;
      -[NTKGreenfieldB640Model watchFaceModels](self->_greenfieldB640Model, "watchFaceModels");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

    }
    while (v10 < v16);
  }
  else
  {
    v11 = 0.0;
  }
  -[UICollectionView bounds](self->_facesCollectionView, "bounds");
  v17 = 15.0;
  if (v11 < v18)
  {
    -[UICollectionView bounds](self->_facesCollectionView, "bounds");
    v17 = (v19 - v11) * 0.5;
  }
  v20 = 0.0;
  v21 = 0.0;
  v22 = v17;
  result.right = v22;
  result.bottom = v21;
  result.left = v17;
  result.top = v20;
  return result;
}

- (id)_subtitleForError:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  unint64_t v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  unint64_t v12;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  __CFString *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  __CFString *v32;
  __CFString *v33;
  void *v34;
  unint64_t v35;
  void *v36;

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.nanotimekit.NTKGreenfieldAddWatchFaceManager"));

  if (v6)
  {
    switch(objc_msgSend(v4, "code"))
    {
      case 0:
        goto LABEL_5;
      case 1:
      case 8:
      case 11:
        -[NTKGreenfieldB640Model watchFaceModels](self->_greenfieldB640Model, "watchFaceModels");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "count");

        if (v8 < 2)
        {
          v9 = CFSTR("GREENFIELD_B640_WATCH_FACE_NOT_AVAILABLE_ON_DEVICE_ERROR_ALERT_DESCRIPTION_SINGULAR");
          v10 = CFSTR("This watch face is not available on your Apple Watch.");
        }
        else
        {
          v9 = CFSTR("GREENFIELD_B640_WATCH_FACE_NOT_AVAILABLE_ON_DEVICE_ERROR_ALERT_DESCRIPTION_PLURAL");
          v10 = CFSTR("These watch faces are not available on your Apple Watch.");
        }
        goto LABEL_8;
      case 2:
      case 4:
        v9 = CFSTR("GREENFIELD_ADD_WATCH_FACE_ERROR_TRY_AGAIN_LATER");
        v10 = CFSTR("Try again later.");
        goto LABEL_8;
      case 3:
        -[NTKGreenfieldB640Model watchFaceModels](self->_greenfieldB640Model, "watchFaceModels");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        if (v17 < 2)
        {
          v9 = CFSTR("GREENFIELD_B640_WATCH_FACE_NO_WATCH_PAIRED_ERROR_ALERT_DESCRIPTION_SINGULAR");
          v10 = CFSTR("Pair your Apple Watch with this iPhone to add this face.");
        }
        else
        {
          v9 = CFSTR("GREENFIELD_B640_WATCH_FACE_NO_WATCH_PAIRED_ERROR_ALERT_DESCRIPTION_PLURAL");
          v10 = CFSTR("Pair your Apple Watch with this iPhone to add these faces.");
        }
        goto LABEL_8;
      case 5:
        -[NTKGreenfieldB640Model watchFaceModels](self->_greenfieldB640Model, "watchFaceModels");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

        v20 = (void *)MEMORY[0x1E0CB3940];
        if (v19 < 2)
          v21 = CFSTR("GREENFIELD_B640_WATCH_FACE_LIBRARY_LIMIT_ERROR_ALERT_DESCRIPTION");
        else
          v21 = CFSTR("GREENFIELD_B640_MULTIPLE_WATCH_FACES_LIBRARY_LIMIT_ERROR_ALERT_DESCRIPTION");
        NTKClockFaceLocalizedString(v21, CFSTR("too many faces"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localizedStringWithFormat:", v28, NTKFaceLibraryMaxFaceCountForDevice(v36));
        goto LABEL_36;
      case 6:
        -[NTKGreenfieldB640Model watchFaceModels](self->_greenfieldB640Model, "watchFaceModels");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count");

        if (v23 < 2)
        {
          v9 = CFSTR("GREENFIELD_B640_WATCH_FACE_CANNOT_ADD_ANOTHER_FACE_ERROR_DESCRIPTION_SINGULAR");
          v10 = CFSTR("You can switch to this face on your Apple Watch.");
        }
        else
        {
          v9 = CFSTR("GREENFIELD_B640_WATCH_FACE_CANNOT_ADD_ANOTHER_FACE_ERROR_DESCRIPTION_PLURAL");
          v10 = CFSTR("You can switch to these faces on your Apple Watch.");
        }
        goto LABEL_8;
      case 7:
        -[NTKGreenfieldB640Model watchFaceModels](self->_greenfieldB640Model, "watchFaceModels");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "count");

        if (v25 < 2)
        {
          v9 = CFSTR("GREENFIELD_B640_WATCH_FACE_NO_PHOTOS_INCLUDED_IN_PHOTOS_WATCH_FACE_ERROR_DESCRIPTION_SINGULAR");
          v10 = CFSTR("This face cannot be added to your Apple Watch because the sender did not include any photos.");
        }
        else
        {
          v9 = CFSTR("GREENFIELD_B640_WATCH_FACE_NO_PHOTOS_INCLUDED_IN_PHOTOS_WATCH_FACE_ERROR_DESCRIPTION_PLURAL");
          v10 = CFSTR("These faces cannot be added to your Apple Watch because the sender did not include any photos.");
        }
        goto LABEL_8;
      case 9:
        -[NTKGreenfieldB640Model watchFaceModels](self->_greenfieldB640Model, "watchFaceModels");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "count");

        if (v35 < 2)
        {
          v9 = CFSTR("GREENFIELD_B640_WATCH_FACE_LIBRARY_NOT_LOADED_ERROR_ALERT_DESCRIPTION_SINGULAR");
          v10 = CFSTR("Could not add this watch face at this time. Try again later.");
        }
        else
        {
          v9 = CFSTR("GREENFIELD_B640_WATCH_FACE_LIBRARY_NOT_LOADED_ERROR_ALERT_DESCRIPTION_PLURAL");
          v10 = CFSTR("Could not add these watch faces at this time. Try again later.");
        }
        goto LABEL_8;
      case 10:
        v9 = CFSTR("GREENFIELD_ADD_WATCH_FACE_ERROR_NO_NETWORK_CONNECTION_OR_INVALID_URL_SUBTITLE");
        v10 = CFSTR("Check your internet connection and try again.");
        goto LABEL_8;
      case 12:
        v9 = CFSTR("GREENFIELD_COMPANION_ADD_WATCH_FACE_ERROR_REQURE_WATCH_OS_UPDATE");
        v10 = CFSTR("Watch face sharing is not available with your current version of watchOS.");
        goto LABEL_8;
      case 13:
        objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "nrDevice");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "valueForProperty:", *MEMORY[0x1E0D51728]);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        -[NTKGreenfieldB640Model watchFaceModels](self->_greenfieldB640Model, "watchFaceModels");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "count");

        v31 = (void *)MEMORY[0x1E0CB3940];
        if (v30 < 2)
        {
          v32 = CFSTR("GREENFIELD_B640_WATCH_FACE_PAIRED_DEVICE_IS_TINKER_ERROR_ALERT_DESCRIPTION");
          v33 = CFSTR("This face can be added on Apple Watch. Message it to %@ to get started.");
        }
        else
        {
          v32 = CFSTR("GREENFIELD_B640_MULTIPLE_WATCH_FACES_PAIRED_DEVICE_IS_TINKER_ERROR_ALERT_DESCRIPTION");
          v33 = CFSTR("These faces can be added on Apple Watch. Message them to %@ to get started.");
        }
        NTKClockFaceLocalizedString(v32, v33);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "localizedStringWithFormat:", v36, v28);
LABEL_36:
        self = (NTKGreenfieldB640ContentViewController *)objc_claimAutoreleasedReturnValue();

        break;
      case 14:
      case 15:
      case 16:
        -[NTKGreenfieldB640Model watchFaceModels](self->_greenfieldB640Model, "watchFaceModels");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");

        if (v15 < 2)
        {
          v9 = CFSTR("GREENFIELD_B640_WATCH_FACE_UNAVAILABLE_ERROR_ALERT_DESCRIPTION_SINGULAR");
          v10 = CFSTR("This watch face is not available at this time. Try again later.");
        }
        else
        {
          v9 = CFSTR("GREENFIELD_B640_WATCH_FACE_UNAVAILABLE_ERROR_ALERT_DESCRIPTION_PLURAL");
          v10 = CFSTR("These watch faces are not available at this time. Try again later.");
        }
        goto LABEL_8;
      default:
        break;
    }
  }
  else
  {
LABEL_5:
    -[NTKGreenfieldB640Model watchFaceModels](self->_greenfieldB640Model, "watchFaceModels");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12 < 2)
    {
      v9 = CFSTR("GREENFIELD_B640_WATCH_FACE_GENERIC_ERROR_DEFAULT_ALERT_DESCRIPTION_SINGULAR");
      v10 = CFSTR("This watch face is not available with your current version of watchOS.");
    }
    else
    {
      v9 = CFSTR("GREENFIELD_B640_WATCH_FACE_GENERIC_ERROR_DEFAULT_ALERT_DESCRIPTION_PLURAL");
      v10 = CFSTR("These watch faces are not available with your current version of watchOS.");
    }
LABEL_8:
    NTKClockFaceLocalizedString(v9, v10);
    self = (NTKGreenfieldB640ContentViewController *)objc_claimAutoreleasedReturnValue();
  }

  return self;
}

- (id)_titleForError:(id)a3
{
  id v4;
  void *v5;
  int v6;
  __CFString *v7;
  __CFString *v8;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.nanotimekit.NTKGreenfieldAddWatchFaceManager"));

  if (v6)
  {
    switch(objc_msgSend(v4, "code"))
    {
      case 0:
      case 1:
      case 7:
      case 8:
      case 10:
      case 11:
      case 12:
      case 13:
        goto LABEL_3;
      case 2:
      case 3:
        v7 = CFSTR("GREENFIELD_B640_WATCH_FACE_NO_WATCH_PAIRED_ERROR_ALERT_TITLE");
        v8 = CFSTR("No Apple Watch Paired");
        goto LABEL_4;
      case 4:
        v7 = CFSTR("GREENFIELD_ADD_WATCH_FACE_ERROR_FAILED_TO_DOWNLOAD_WATCH_FACE_DATA_TITLE");
        v8 = CFSTR("This Watch Face is Not Available at This Time");
        goto LABEL_4;
      case 5:
        v7 = CFSTR("GREENFIELD_B640_WATCH_FACE_LIBRARY_FULL_ERROR_ALERT_TITLE");
        v8 = CFSTR("Limit Reached");
        goto LABEL_4;
      case 6:
        -[NTKGreenfieldB640Model watchFaceModels](self->_greenfieldB640Model, "watchFaceModels");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        if (v13 < 2)
        {
          v7 = CFSTR("GREENFIELD_B640_WATCH_FACE_CANNOT_ADD_ANOTHER_FACE_ERROR_TITLE_SINGULAR");
          v8 = CFSTR("You Already Have This Face");
        }
        else
        {
          v7 = CFSTR("GREENFIELD_B640_WATCH_FACE_CANNOT_ADD_ANOTHER_FACE_ERROR_TITLE_PLURAL");
          v8 = CFSTR("You Already Have These Faces");
        }
        goto LABEL_4;
      case 9:
      case 14:
      case 15:
      case 16:
        -[NTKGreenfieldB640Model watchFaceModels](self->_greenfieldB640Model, "watchFaceModels");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");

        if (v11 < 2)
        {
          v7 = CFSTR("GREENFIELD_B640_WATCH_FACE_UNAVAILABLE_ERROR_ALERT_TITLE_SINGULAR");
          v8 = CFSTR("Watch Face Unavailable");
        }
        else
        {
          v7 = CFSTR("GREENFIELD_B640_WATCH_FACE_UNAVAILABLE_ERROR_ALERT_TITLE_PLURAL");
          v8 = CFSTR("Watch Faces Unavailable");
        }
        goto LABEL_4;
      default:
        break;
    }
  }
  else
  {
LABEL_3:
    v7 = CFSTR("GREENFIELD_B640_WATCH_FACE_GENERIC_ERROR_ALERT_TITLE");
    v8 = CFSTR("Add Watch Face");
LABEL_4:
    NTKClockFaceLocalizedString(v7, v8);
    self = (NTKGreenfieldB640ContentViewController *)objc_claimAutoreleasedReturnValue();
  }

  return self;
}

- (void)_didTapShowInternalErrorButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NTKGreenfieldB640Model error](self->_greenfieldB640Model, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Please file a radar to Watch Faces if you think this is an error.\n %@"), v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("[Internal Only]"), v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Ok"), 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v6);

  -[NTKGreenfieldB640ContentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

- (NTKGreenfieldB640ContentViewControllerDelegate)greenfieldB640delegate
{
  return (NTKGreenfieldB640ContentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_greenfieldB640delegate);
}

- (void)setGreenfieldB640delegate:(id)a3
{
  objc_storeWeak((id *)&self->_greenfieldB640delegate, a3);
}

- (void)setCellSize:(CGSize)a3
{
  self->_cellSize = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_greenfieldB640delegate);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_watchBandImage, 0);
  objc_storeStrong((id *)&self->_collectionViewFlowLayout, 0);
  objc_storeStrong((id *)&self->_facesCollectionView, 0);
  objc_storeStrong((id *)&self->_greenfieldB640Model, 0);
}

@end
