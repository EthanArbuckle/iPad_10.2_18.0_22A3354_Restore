@implementation MUPlacePictureItemSectionController

- (MUPlacePictureItemSectionController)initWithMapItem:(id)a3 annotatedList:(id)a4 presentingViewController:(id)a5
{
  id v9;
  id v10;
  MUPlacePictureItemSectionController *v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v15[16];
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MUPlacePictureItemSectionController;
  v11 = -[MUPlaceSectionController initWithMapItem:](&v16, sel_initWithMapItem_, a3);
  if (v11)
  {
    MUGetPlaceCardLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlacePictureItemSectionControllerInit", ", v15, 2u);
    }

    objc_storeStrong((id *)&v11->_annotatedList, a4);
    objc_storeWeak((id *)&v11->_presentingViewController, v10);
    -[MUPlacePictureItemSectionController _setupSubviews](v11, "_setupSubviews");
    MUGetPlaceCardLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlacePictureItemSectionControllerInit", ", v15, 2u);
    }

  }
  return v11;
}

- (void)_setupSubviews
{
  MUPlaceTilesView *v3;
  MUPlaceTilesView *tilesView;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  MUPlaceSectionView *v17;
  void *v18;
  MUPlaceSectionView *v19;
  MUPlaceSectionView *sectionView;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  +[MUPlaceTilesViewConfiguration annotatedListConfiguration](MUPlaceTilesViewConfiguration, "annotatedListConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[MUPlaceTilesView initWithConfiguration:]([MUPlaceTilesView alloc], "initWithConfiguration:", v21);
  tilesView = self->_tilesView;
  self->_tilesView = v3;

  v22 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[GEOAnnotatedItemList pictureItemContainer](self->_annotatedList, "pictureItemContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pictureItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "pictureItemPhotoType");
        if ((v13 - 2) >= 2)
        {
          if (v13 == 1)
            objc_msgSend(v22, "addObject:", v12);
        }
        else
        {
          -[GEOAnnotatedItemList attribution](self->_annotatedList, "attribution");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "providerName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          +[MUPunchoutViewModel viewModelForVendorName:](MUPunchoutViewModel, "viewModelForVendorName:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_storeStrong((id *)&self->_attributionViewModel, v16);
          v9 = v16;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  -[MUPlaceTilesView setViewModels:](self->_tilesView, "setViewModels:", v22);
  -[MUPlaceTilesView setDelegate:](self->_tilesView, "setDelegate:", self);
  -[MUPlaceTilesView setAnalyticsDelegate:](self->_tilesView, "setAnalyticsDelegate:", self);
  if (v9)
    -[MUPlaceTilesView setAccessoryViewModel:](self->_tilesView, "setAccessoryViewModel:", v9);
  v17 = [MUPlaceSectionView alloc];
  -[MUPlacePictureItemSectionController sectionHeaderViewModel](self, "sectionHeaderViewModel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[MUPlaceSectionView initWithStyle:sectionHeaderViewModel:](v17, "initWithStyle:sectionHeaderViewModel:", 0, v18);
  sectionView = self->_sectionView;
  self->_sectionView = v19;

  -[MUPlaceSectionView configureWithSectionController:](self->_sectionView, "configureWithSectionController:", self);
  -[MUPlaceSectionView attachViewToContentView:](self->_sectionView, "attachViewToContentView:", self->_tilesView);

}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  MUPlaceSectionHeaderViewModel *sectionHeaderViewModel;
  GEOAnnotatedItemList *annotatedList;
  MUPlacePictureItemSectionController *v5;
  GEOAnnotatedItemList *v6;
  void *v7;
  void *v8;
  MUPlaceSectionHeaderViewModel *v9;
  MUPlaceSectionHeaderViewModel *v10;

  sectionHeaderViewModel = self->_sectionHeaderViewModel;
  if (!sectionHeaderViewModel)
  {
    annotatedList = self->_annotatedList;
    v5 = self;
    v6 = annotatedList;
    mkAttributionForAnnotatedList();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOAnnotatedItemList title](v6, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MUPlaceSectionHeaderViewModel viewModelForTitle:attribution:target:action:](MUPlaceSectionHeaderViewModel, "viewModelForTitle:attribution:target:action:", v8, v7, v5, sel__performPunchout);
    v9 = (MUPlaceSectionHeaderViewModel *)objc_claimAutoreleasedReturnValue();

    -[MUPlaceSectionHeaderViewModel setTarget:selector:](v9, "setTarget:selector:", v5, sel__performPunchout);
    v10 = self->_sectionHeaderViewModel;
    self->_sectionHeaderViewModel = v9;

    sectionHeaderViewModel = self->_sectionHeaderViewModel;
  }
  return sectionHeaderViewModel;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    -[MUPlaceTilesView displayPlaceTiles](self->_tilesView, "displayPlaceTiles");
  }
}

- (void)placeTileCollectionView:(id)a3 didTapOnViewModel:(id)a4
{
  MUPlaceTilesView *tilesView;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  tilesView = self->_tilesView;
  v6 = a4;
  -[MUPlaceTilesView viewModels](tilesView, "viewModels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v6);

  -[GEOAnnotatedItemList pictureItemContainer](self->_annotatedList, "pictureItemContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pictureItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v12, "pictureItemPhotoType");
  if ((v11 - 2) >= 2)
  {
    if (v11 == 1)
      -[MUPlacePictureItemSectionController _presentPhotoGalleryForPhotoIndex:](self, "_presentPhotoGalleryForPhotoIndex:", v8);
  }
  else
  {
    -[MUPlacePictureItemSectionController _performPunchout](self, "_performPunchout");
  }

}

- (void)_performPunchout
{
  GEOAnnotatedItemList *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[MUPlacePictureItemSectionController _captureUserAction:](self, "_captureUserAction:", 6054);
  v3 = self->_annotatedList;
  mkAttributionForAnnotatedList();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MUGetPlaceCardLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "providerName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_191DB8000, v5, OS_LOG_TYPE_INFO, "Attempting to punch our with attribution with provider %@", (uint8_t *)&v9, 0xCu);

  }
  v7 = (void *)MEMORY[0x1E0CC1758];
  objc_msgSend(v4, "attributionURLs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "launchAttributionURLs:withAttribution:completionHandler:", v8, v4, &__block_literal_global_51);

}

- (void)_presentPhotoGalleryForPhotoIndex:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  MUPlacePhotoGalleryViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  MUPlacePhotoGalleryViewController *v15;
  MUPlacePhotoGalleryViewController *photoGalleryViewController;
  void *v17;
  void *v18;
  void *v19;
  void *WeakRetained;
  NSObject *v21;
  UIImageView *v22;
  UIImageView *imageViewForTransition;
  uint8_t v24[8];
  _QWORD v25[4];
  id v26;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[GEOAnnotatedItemList pictureItemContainer](self->_annotatedList, "pictureItemContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pictureItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __73__MUPlacePictureItemSectionController__presentPhotoGalleryForPhotoIndex___block_invoke;
  v25[3] = &unk_1E2E05168;
  v8 = v5;
  v26 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v25);

  if (objc_msgSend(v8, "count"))
  {
    -[GEOAnnotatedItemList pictureItemContainer](self->_annotatedList, "pictureItemContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "allowFullScreenPhoto");

    if ((v10 & 1) != 0)
    {
      -[MUPlacePictureItemSectionController _captureUserAction:](self, "_captureUserAction:", 6052);
      v11 = [MUPlacePhotoGalleryViewController alloc];
      v12 = (void *)objc_msgSend(v8, "copy");
      -[MUPlaceTilesView accessoryView](self->_tilesView, "accessoryView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlaceSectionController mapItem](self, "mapItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[MUPlacePhotoGalleryViewController initWithPhotos:additionalView:scrollToIndex:mapItem:delegate:](v11, "initWithPhotos:additionalView:scrollToIndex:mapItem:delegate:", v12, v13, a3, v14, self);
      photoGalleryViewController = self->_photoGalleryViewController;
      self->_photoGalleryViewController = v15;

      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", self->_photoGalleryViewController);
      objc_msgSend(v17, "navigationController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setNavigationBarHidden:animated:", 1, 0);

      objc_msgSend(v17, "setModalPresentationStyle:", 5);
      objc_msgSend(v17, "setTransitioningDelegate:", self);
      objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v13) = objc_msgSend(v19, "userInterfaceIdiom");

      if ((_DWORD)v13 == 2)
      {
        -[MUPlacePhotoGalleryViewController setPanAndSwipeToDismissGestureEnabled:](self->_photoGalleryViewController, "setPanAndSwipeToDismissGestureEnabled:", 0);
        objc_msgSend(v17, "setModalPresentationStyle:", 8);
        -[MUPlacePictureItemSectionController pictureItemDelegate](self, "pictureItemDelegate");
        WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "pictureItemSectionController:requestsSceneActivationWithPhotoGallery:", self, self->_photoGalleryViewController);
      }
      else
      {
        -[MUPlaceTilesView imageViewForIndex:](self->_tilesView, "imageViewForIndex:", a3);
        v22 = (UIImageView *)objc_claimAutoreleasedReturnValue();
        imageViewForTransition = self->_imageViewForTransition;
        self->_imageViewForTransition = v22;

        objc_msgSend(v17, "setModalPresentationStyle:", 5);
        objc_msgSend(v17, "setTransitioningDelegate:", self);
        WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
        objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v17, 1, 0);
      }

    }
    else
    {
      MUGetPlaceCardLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_191DB8000, v21, OS_LOG_TYPE_INFO, "Picture item container does not allow full screen photo. Bail early", v24, 2u);
      }

    }
  }

}

void __73__MUPlacePictureItemSectionController__presentPhotoGalleryForPhotoIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "photo");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = objc_msgSend(v8, "pictureItemPhotoType");

    if (v5 == 1)
    {
      v6 = *(void **)(a1 + 32);
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1838]), "initWithPictureItem:", v8);
      objc_msgSend(v6, "addObject:", v7);

    }
  }

}

- (id)placePhotoGalleryImageViewForPhotoAtIndex:(unint64_t)a3
{
  return -[MUPlaceTilesView imageViewForIndex:](self->_tilesView, "imageViewForIndex:", a3);
}

- (void)placePhotoGallery:(id)a3 willCloseAtIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  MUPlaceTilesView *tilesView;
  id v14;
  _QWORD v15[4];
  id v16;

  -[GEOAnnotatedItemList pictureItemContainer](self->_annotatedList, "pictureItemContainer", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pictureItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a4)
  {
    -[GEOAnnotatedItemList pictureItemContainer](self->_annotatedList, "pictureItemContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pictureItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count") + 1;

    if (v12 <= a4)
    {
      v9 = 0;
    }
    else
    {
      -[MUPlaceTilesView accessoryView](self->_tilesView, "accessoryView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[MUPlaceTilesView imageViewForIndex:](self->_tilesView, "imageViewForIndex:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  tilesView = self->_tilesView;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__MUPlacePictureItemSectionController_placePhotoGallery_willCloseAtIndex___block_invoke;
  v15[3] = &unk_1E2E03520;
  v16 = v9;
  v14 = v9;
  -[MUPlaceTilesView enumerateImageViewsWithBlock:](tilesView, "enumerateImageViewsWithBlock:", v15);
  -[MUPlaceTilesView scrollToViewAtIndex:](self->_tilesView, "scrollToViewAtIndex:", a4);

}

uint64_t __74__MUPlacePictureItemSectionController_placePhotoGallery_willCloseAtIndex___block_invoke(uint64_t a1, void *a2)
{
  double v2;

  v2 = 1.0;
  if (*(void **)(a1 + 32) == a2)
    v2 = 0.0;
  return objc_msgSend(a2, "setAlpha:", v2);
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  MUPhotoGalleryTransitionAnimator *v9;

  v6 = objc_alloc(MEMORY[0x1E0DC3890]);
  -[UIImageView image](self->_imageViewForTransition, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithImage:", v7);

  objc_msgSend(v8, "setContentMode:", -[UIImageView contentMode](self->_imageViewForTransition, "contentMode"));
  v9 = -[MUPhotoGalleryTransitionAnimator initWithView:transitionView:]([MUPhotoGalleryTransitionAnimator alloc], "initWithView:transitionView:", self->_imageViewForTransition, v8);
  -[MUPhotoGalleryTransitionAnimator setDelegate:](v9, "setDelegate:", self);

  return v9;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  MUPhotoGalleryTransitionAnimator *v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "viewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v19 = 0;
      v10 = v5;
LABEL_10:

      goto LABEL_11;
    }
    objc_msgSend(v5, "viewControllers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = objc_msgSend(v10, "indexOfVisibleView");
      -[GEOAnnotatedItemList pictureItemContainer](self->_annotatedList, "pictureItemContainer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pictureItems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v11 >= v14)
      {
        v19 = 0;
      }
      else
      {
        -[MUPlaceTilesView imageViewForIndex:](self->_tilesView, "imageViewForIndex:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_alloc(MEMORY[0x1E0DC3890]);
        objc_msgSend(v15, "image");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v16, "initWithImage:", v17);

        objc_msgSend(v18, "setContentMode:", objc_msgSend(v15, "contentMode"));
        v19 = -[MUPhotoGalleryTransitionAnimator initWithView:transitionView:]([MUPhotoGalleryTransitionAnimator alloc], "initWithView:transitionView:", v15, v18);

      }
      -[MUPhotoGalleryTransitionAnimator setDelegate:](v19, "setDelegate:", self);
      goto LABEL_10;
    }
  }
  v19 = 0;
LABEL_11:

  return v19;
}

- (void)photoGalleryTransitionAnimatorDidFinishAnimation
{
  -[MUPlaceTilesView updateViewsWithAlpha:](self->_tilesView, "updateViewsWithAlpha:", 1.0);
}

- (void)_captureUserAction:(int)a3
{
  -[MUPlaceSectionController captureInfoCardAction:eventValue:feedbackType:](self, "captureInfoCardAction:eventValue:feedbackType:", *(_QWORD *)&a3, 0, 0);
}

- (int)analyticsModuleType
{
  return 20;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (void)performInstrumentationForScrollLeft
{
  -[MUPlacePictureItemSectionController _captureUserAction:](self, "_captureUserAction:", 6056);
}

- (void)performInstrumentationForScrollRight
{
  -[MUPlacePictureItemSectionController _captureUserAction:](self, "_captureUserAction:", 6055);
}

- (BOOL)isActive
{
  return self->_active;
}

- (MUPlacePictureItemSectionControllerDelegate)pictureItemDelegate
{
  return (MUPlacePictureItemSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_pictureItemDelegate);
}

- (void)setPictureItemDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pictureItemDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pictureItemDelegate);
  objc_storeStrong((id *)&self->_sectionHeaderViewModel, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_photoGalleryViewController, 0);
  objc_storeStrong((id *)&self->_attributionViewModel, 0);
  objc_storeStrong((id *)&self->_imageViewForTransition, 0);
  objc_storeStrong((id *)&self->_tilesView, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_annotatedList, 0);
}

@end
