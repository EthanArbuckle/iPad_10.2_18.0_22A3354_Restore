@implementation MUPlacePhotoSectionController

- (MUPlacePhotoSectionController)initWithMapItem:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  MUPlacePhotoSectionController *v8;
  NSObject *v9;
  MUPhotoSliderTileProvider *v10;
  MUPhotoSliderTileProvider *photoTileProvider;
  NSObject *v12;
  uint8_t v14[16];
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MUPlacePhotoSectionController;
  v8 = -[MUPlaceSectionController initWithMapItem:](&v15, sel_initWithMapItem_, v6);
  if (v8)
  {
    MUGetPlaceCardLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlacePhotoSectionControllerInit", ", v14, 2u);
    }

    v10 = -[MUPhotoSliderTileProvider initWithMapItem:]([MUPhotoSliderTileProvider alloc], "initWithMapItem:", v6);
    photoTileProvider = v8->_photoTileProvider;
    v8->_photoTileProvider = v10;

    objc_storeStrong((id *)&v8->_configuration, a4);
    -[MUPlacePhotoSectionController _setupSectionView](v8, "_setupSectionView");
    MUGetPlaceCardLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlacePhotoSectionControllerInit", ", v14, 2u);
    }

  }
  return v8;
}

- (void)_setupSectionView
{
  MUPlacePhotoSliderView *v3;
  MUPlacePhotoSliderView *photoSliderView;
  MUPunchoutViewModel *v5;
  MUPunchoutViewModel *attributionViewModel;
  MUPunchoutViewModel *v7;
  MUPunchoutViewModel *addPhotoViewModel;
  uint64_t v9;
  void *v10;
  MUPlaceSectionView *v11;
  MUPlaceSectionView *sectionView;
  MUPlaceSectionView *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  v3 = -[MUPlacePhotoSliderView initWithDataSource:photoTileSize:]([MUPlacePhotoSliderView alloc], "initWithDataSource:photoTileSize:", self, 175.0, 220.0);
  photoSliderView = self->_photoSliderView;
  self->_photoSliderView = v3;

  -[MUPlacePhotoSliderView setDelegate:](self->_photoSliderView, "setDelegate:", self);
  -[MUPlacePhotoSliderView setAnalyticsDelegate:](self->_photoSliderView, "setAnalyticsDelegate:", self);
  if (-[MUPhotoSliderTileProvider showMorePhotoPunchoutAtEndOfSlider](self->_photoTileProvider, "showMorePhotoPunchoutAtEndOfSlider"))
  {
    +[MUPunchoutViewModel viewModelForFullScreenGallery](MUPunchoutViewModel, "viewModelForFullScreenGallery");
    v5 = (MUPunchoutViewModel *)objc_claimAutoreleasedReturnValue();
    attributionViewModel = self->_attributionViewModel;
    self->_attributionViewModel = v5;

  }
  if (-[MUPlacePhotoSectionControllerConfiguration supportsARPCallToAction](self->_configuration, "supportsARPCallToAction")&& -[MUPhotoSliderTileProvider showARPCallToActionAttributionAtEndOfSlider](self->_photoTileProvider, "showARPCallToActionAttributionAtEndOfSlider"))
  {
    +[MUPunchoutViewModel viewModelForAddPhotos](MUPunchoutViewModel, "viewModelForAddPhotos");
    v7 = (MUPunchoutViewModel *)objc_claimAutoreleasedReturnValue();
    addPhotoViewModel = self->_addPhotoViewModel;
    self->_addPhotoViewModel = v7;

    objc_initWeak(&location, self);
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __50__MUPlacePhotoSectionController__setupSectionView__block_invoke;
    v16[3] = &unk_1E2E01DA8;
    objc_copyWeak(&v17, &location);
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __50__MUPlacePhotoSectionController__setupSectionView__block_invoke_2;
    v14[3] = &unk_1E2E01DA8;
    objc_copyWeak(&v15, &location);
    +[MUPhotoOptionsMenuButton menuForPhotoOptionsMenuButtonWithCameraCompletion:libraryCompletion:](MUPhotoOptionsMenuButton, "menuForPhotoOptionsMenuButtonWithCameraCompletion:libraryCompletion:", v16, v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPunchoutViewModel setMenu:](self->_addPhotoViewModel, "setMenu:", v10);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  v11 = -[MUPlaceSectionView initWithStyle:alwaysHideSeparators:]([MUPlaceSectionView alloc], "initWithStyle:alwaysHideSeparators:", 0, 0);
  -[MUPlaceSectionView attachViewToContentView:](v11, "attachViewToContentView:", self->_photoSliderView);
  sectionView = self->_sectionView;
  self->_sectionView = v11;
  v13 = v11;

  -[MUPlaceSectionView configureWithSectionController:](self->_sectionView, "configureWithSectionController:", self);
}

void __50__MUPlacePhotoSectionController__setupSectionView__block_invoke(uint64_t a1)
{
  MUPresentationOptions *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = objc_alloc_init(MUPresentationOptions);
    objc_msgSend(WeakRetained, "_addPhotoButtonTappedWithEntryPoint:presentationOptions:", 1, v1);

  }
}

void __50__MUPlacePhotoSectionController__setupSectionView__block_invoke_2(uint64_t a1)
{
  MUPresentationOptions *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = objc_alloc_init(MUPresentationOptions);
    objc_msgSend(WeakRetained, "_addPhotoButtonTappedWithEntryPoint:presentationOptions:", 2, v1);

  }
}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (BOOL)hasContent
{
  void *v3;
  char v4;
  void *v5;
  BOOL v6;
  void *v7;

  if (-[MUPlacePhotoSectionControllerConfiguration showLookAround](self->_configuration, "showLookAround"))
  {
    -[MUPlaceSectionController mapItem](self, "mapItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_hasLookAroundStorefront");

    if ((v4 & 1) != 0)
      return 1;
  }
  -[MUPlacePhotoSectionController userSubmittedPhoto](self, "userSubmittedPhoto");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    return 1;
  -[MUPhotoSliderTileProvider photos](self->_photoTileProvider, "photos");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "count") != 0;

  return v6;
}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  return 0;
}

- (UIViewController)presentingViewController
{
  return -[MUPlacePhotoSectionControllerConfiguration presentingViewController](self->_configuration, "presentingViewController");
}

- (void)photoSliderView:(id)a3 didTapViewModel:(id)a4
{
  id v5;
  int64_t v6;
  void *v7;
  id v8;

  v8 = a4;
  -[MUPlacePhotoSectionController userSubmittedPhoto](self, "userSubmittedPhoto");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v8 || (v6 = -[MUPhotoSliderTileProvider displayType](self->_photoTileProvider, "displayType"), v6 == 1))
  {
    -[MUPlacePhotoSectionController _routeAlbumTapWithViewModel:](self, "_routeAlbumTapWithViewModel:", v8);
    goto LABEL_6;
  }
  v7 = v8;
  if (!v6)
  {
    -[MUPlacePhotoSectionController _routeFlatListTapWithViewModel:](self, "_routeFlatListTapWithViewModel:", v8);
LABEL_6:
    v7 = v8;
  }

}

- (void)_routeFlatListTapWithViewModel:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  MUPlacePhotoGalleryViewController *v23;
  void *v24;
  void *v25;
  MUPlacePhotoGalleryViewController *v26;
  MUPlacePhotoGalleryViewController *photoGalleryViewController;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  uint64_t v33;
  UIImageView *v34;
  UIImageView *imageViewForTransition;
  void *v36;
  void *v37;
  id v38;

  v38 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MUPlacePhotoSectionController userSubmittedPhoto](self, "userSubmittedPhoto");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[MUPlaceSectionController mapItem](self, "mapItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "_mapkit_supportsFullScreenExperience");

      if (v7)
      {
        -[MUPlacePhotoSectionController _routeAlbumTapWithViewModel:](self, "_routeAlbumTapWithViewModel:", v38);
        goto LABEL_15;
      }
    }
    v8 = v38;
    -[MUPhotoSliderTileProvider photos](self->_photoTileProvider, "photos");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "indexOfObject:", v8);

    if (-[MUPhotoSliderTileProvider shouldRouteToPhotoThumbnailGallery](self->_photoTileProvider, "shouldRouteToPhotoThumbnailGallery"))
    {
      -[MUPlacePhotoSectionController photoSectionControllerDelegate](self, "photoSectionControllerDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[MUPlaceSectionController captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:](self, "captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:", 6006, v13, 0, 0);

        -[MUPlacePhotoSectionController _captureSliderInstrumentationWithAction:](self, "_captureSliderInstrumentationWithAction:", 6087);
        -[MUPlacePhotoSectionController photoSectionControllerDelegate](self, "photoSectionControllerDelegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "placePhotoSectionControllerRequestsToOpenThumbnailGallery:withStartingIndex:", self, v10);
LABEL_13:

      }
LABEL_14:

      goto LABEL_15;
    }
    if (-[MUPhotoSliderTileProvider showFullScreen](self->_photoTileProvider, "showFullScreen")
      && !objc_msgSend(v8, "needsObfuscationWhenRenderedInFullScreen"))
    {
      v23 = [MUPlacePhotoGalleryViewController alloc];
      -[MUPhotoSliderTileProvider photos](self->_photoTileProvider, "photos");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlaceSectionController mapItem](self, "mapItem");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[MUPlacePhotoGalleryViewController initWithPhotos:additionalView:scrollToIndex:mapItem:delegate:](v23, "initWithPhotos:additionalView:scrollToIndex:mapItem:delegate:", v24, 0, v10, v25, self);
      photoGalleryViewController = self->_photoGalleryViewController;
      self->_photoGalleryViewController = v26;

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v10);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "attribution");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "providerID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlacePhotoSectionController _captureSliderInstrumentationWithAction:eventValue:actionRichProviderId:](self, "_captureSliderInstrumentationWithAction:eventValue:actionRichProviderId:", 6006, v28, v30);

      -[MUPlacePhotoSectionController _captureSliderInstrumentationWithAction:](self, "_captureSliderInstrumentationWithAction:", 6087);
      if (MapKitIdiomIsMacCatalyst())
      {
        -[MUPlacePhotoSectionController photoSectionControllerDelegate](self, "photoSectionControllerDelegate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_opt_respondsToSelector();

        if ((v32 & 1) != 0)
        {
          -[MUPlacePhotoSectionController photoSectionControllerDelegate](self, "photoSectionControllerDelegate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "placePhotoSectionController:requestsSceneActivationForPhotoGalleryViewController:", self, self->_photoGalleryViewController);
          goto LABEL_13;
        }
      }
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", self->_photoGalleryViewController);
      objc_msgSend(v14, "navigationController");
      v33 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v33, "setNavigationBarHidden:animated:", 1, 0);

      objc_msgSend(v14, "setModalPresentationStyle:", 5);
      objc_msgSend(v14, "setTransitioningDelegate:", self);
      -[MUPlacePhotoSliderView imageViewForIndex:](self->_photoSliderView, "imageViewForIndex:", v10);
      v34 = (UIImageView *)objc_claimAutoreleasedReturnValue();
      imageViewForTransition = self->_imageViewForTransition;
      self->_imageViewForTransition = v34;

      -[MUPlacePhotoSectionController presentingViewController](self, "presentingViewController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "presentViewController:animated:completion:", v14, 1, 0);

      -[MUPlacePhotoSectionController photoSectionControllerDelegate](self, "photoSectionControllerDelegate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v33) = objc_opt_respondsToSelector();

      if ((v33 & 1) == 0)
        goto LABEL_13;
      -[MUPlacePhotoSectionController photoSectionControllerDelegate](self, "photoSectionControllerDelegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "placePhotoSectionControllerDidOpenFullscreenPhotos:", self);
    }
    else
    {
      -[MUPlacePhotoSectionController photoSectionControllerDelegate](self, "photoSectionControllerDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) == 0)
        goto LABEL_14;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlacePhotoSectionController _captureSliderInstrumentationWithAction:eventValue:actionRichProviderId:](self, "_captureSliderInstrumentationWithAction:eventValue:actionRichProviderId:", 6006, v17, 0);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "attribution");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "providerID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlacePhotoSectionController _captureSliderInstrumentationWithAction:eventValue:actionRichProviderId:](self, "_captureSliderInstrumentationWithAction:eventValue:actionRichProviderId:", 6018, v18, v20);

      -[MUPlacePhotoSectionController photoSectionControllerDelegate](self, "photoSectionControllerDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "photoID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlacePhotoSectionController presentingViewController](self, "presentingViewController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "placePhotoSectionController:didSelectViewPhoto:withID:presentingViewController:", self, v8, v21, v22);

    }
    goto LABEL_13;
  }
LABEL_15:

}

- (void)_routeAlbumTapWithViewModel:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;
  _BOOL4 v8;
  char isKindOfClass;
  int64_t v10;
  void *v11;
  void *v12;
  MUPlacePhotoSectionController *v13;
  uint64_t v14;
  int64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  -[MUPlacePhotoSectionController photoSectionControllerDelegate](self, "photoSectionControllerDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  v6 = v24;
  if ((v5 & 1) != 0)
  {
    if (v24)
    {
      -[MUPlacePhotoSectionController userSubmittedPhoto](self, "userSubmittedPhoto");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = v7 == v24;

      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      v8 = 0;
      isKindOfClass = 0;
    }
    v10 = -[MUPhotoSliderTileProvider displayType](self->_photoTileProvider, "displayType");
    if (v8)
    {
      -[MUPlacePhotoSectionController _captureSliderInstrumentationWithAction:](self, "_captureSliderInstrumentationWithAction:", 329);
      -[MUPlacePhotoSectionController photoSectionControllerDelegate](self, "photoSectionControllerDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = self;
      v14 = 0;
LABEL_12:
      objc_msgSend(v11, "placePhotoSectionController:didSelectPhotoCategoryAtIndex:", v13, v14);

      v6 = v24;
      goto LABEL_13;
    }
    v15 = v10;
    v6 = v24;
    if ((isKindOfClass & 1) != 0)
    {
      -[MUPhotoSliderTileProvider photos](self->_photoTileProvider, "photos");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "indexOfObject:", v24);

      if (v15 == 1)
      {
        -[MUPhotoSliderTileProvider albumIdForPhoto:](self->_photoTileProvider, "albumIdForPhoto:", v24);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[MUPlacePhotoSectionController _captureSliderInstrumentationWithAction:eventValue:actionRichProviderId:](self, "_captureSliderInstrumentationWithAction:eventValue:actionRichProviderId:", 284, v18, 0);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[MUPlacePhotoSectionController _captureSliderInstrumentationWithAction:eventValue:actionRichProviderId:](self, "_captureSliderInstrumentationWithAction:eventValue:actionRichProviderId:", 6006, v19, 0);

        -[MUPlacePhotoSectionController photoSliderViewRequestsViewModels:](self, "photoSliderViewRequestsViewModels:", self->_photoSliderView);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "indexOfObject:", v24);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[MUPlacePhotoSectionController _captureSliderInstrumentationWithAction:eventValue:actionRichProviderId:](self, "_captureSliderInstrumentationWithAction:eventValue:actionRichProviderId:", 6006, v22, 0);

        -[MUPlacePhotoSectionController userSubmittedPhoto](self, "userSubmittedPhoto");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v23 != 0;

      }
      -[MUPlacePhotoSectionController photoSectionControllerDelegate](self, "photoSectionControllerDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = self;
      v14 = v21;
      goto LABEL_12;
    }
  }
LABEL_13:

}

- (void)setActive:(BOOL)a3
{
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (self->_active != a3)
  {
    self->_active = a3;
    MUGetPlaceCardLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlacePhotoSectionControllerActivate", ", buf, 2u);
    }

    -[MUPlacePhotoSectionController _update](self, "_update");
    MUGetPlaceCardLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)v6 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlacePhotoSectionControllerActivate", ", v6, 2u);
    }

  }
}

- (void)_update
{
  if (self->_active)
    -[MUPlacePhotoSliderView displayPhotos](self->_photoSliderView, "displayPhotos");
}

- (id)photoSliderViewRequestsViewModels:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MUPlacePhotoSectionController userSubmittedPhoto](self, "userSubmittedPhoto");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_mapsui_addObjectIfNotNil:", v5);

  -[MUPhotoSliderTileProvider photos](self->_photoTileProvider, "photos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_mapsui_addObjectsFromArrayIfNotNil:", v6);

  v7 = (void *)objc_msgSend(v4, "copy");
  return v7;
}

- (BOOL)photoSliderView:(id)a3 shouldShowFullWidthForModel:(id)a4
{
  id v5;
  char isKindOfClass;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v5 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[MUPhotoSliderTileProvider photos](self->_photoTileProvider, "photos");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    -[MUPhotoSliderTileProvider photos](self->_photoTileProvider, "photos");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8 == 1)
    {
      objc_msgSend(v9, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[MUPlacePhotoSectionController userSubmittedPhoto](self, "userSubmittedPhoto");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "photoID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "photoID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqualToString:", v14);

      if ((v15 & 1) != 0)
        return 1;
    }
    else
    {
      v17 = objc_msgSend(v9, "count");

      if (!v17)
        return 1;
    }
  }
  -[MUPlacePhotoSectionController userSubmittedPhoto](self, "userSubmittedPhoto");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[MUPhotoSliderTileProvider photos](self->_photoTileProvider, "photos");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21)
      return 0;
  }
  if (self->_lookAroundContainerView)
    return 0;
  -[MUPhotoSliderTileProvider photos](self->_photoTileProvider, "photos");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v22, "count") == 1;

  return v16;
}

- (void)updateWithUserSubmittedPhotos:(BOOL)a3
{
  void *v4;

  -[MUPlacePhotoSliderView updatePhotoSliderViews:](self->_photoSliderView, "updatePhotoSliderViews:", a3);
  -[MUPlaceSectionController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placeSectionControllerDidUpdateContent:", self);

  -[MUPlacePhotoSectionController _captureSliderInstrumentationWithAction:](self, "_captureSliderInstrumentationWithAction:", 335);
}

- (id)photoSliderView:(id)a3 photoOverlayForModel:(id)a4
{
  id v5;
  id v6;
  MUPhotoSliderTileProvider *photoTileProvider;
  void *v8;

  v5 = a4;
  -[MUPlacePhotoSectionController userSubmittedPhoto](self, "userSubmittedPhoto");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  photoTileProvider = self->_photoTileProvider;
  if (v6 == v5)
    -[MUPhotoSliderTileProvider yourPhotosTileOverlay](photoTileProvider, "yourPhotosTileOverlay");
  else
    -[MUPhotoSliderTileProvider overlayForPhoto:](photoTileProvider, "overlayForPhoto:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)attributionViewModelsForPhotoSliderView:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = v4;
  if (self->_addPhotoViewModel)
    objc_msgSend(v4, "addObject:");
  if (self->_attributionViewModel)
    objc_msgSend(v5, "addObject:");
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (unint64_t)numberOfAttributionsForPhotoSliderView:(id)a3
{
  MUPunchoutViewModel *attributionViewModel;
  BOOL v4;
  unint64_t v5;
  unint64_t v6;

  attributionViewModel = self->_attributionViewModel;
  v4 = attributionViewModel == 0;
  v5 = attributionViewModel != 0;
  v6 = 1;
  if (!v4)
    v6 = 2;
  if (self->_addPhotoViewModel)
    return v6;
  else
    return v5;
}

- (void)photoSliderView:(id)a3 didTapAttribution:(id)a4
{
  void *v5;
  MUPresentationOptions *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  MUPunchoutViewModel *v14;

  v14 = (MUPunchoutViewModel *)a4;
  -[MUPlacePhotoSliderView attributionViewForAttribution:](self->_photoSliderView, "attributionViewForAttribution:", v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MUPresentationOptions);
  -[MUPresentationOptions setProgressObserver:](v6, "setProgressObserver:", v5);
  -[MUPresentationOptions setSourceView:](v6, "setSourceView:", v5);
  objc_msgSend(v5, "frame");
  -[MUPresentationOptions setSourceRect:](v6, "setSourceRect:");
  if (self->_attributionViewModel == v14)
  {
    if (-[MUPhotoSliderTileProvider displayType](self->_photoTileProvider, "displayType") == 1)
    {
      -[MUPlacePhotoSectionController _captureSliderInstrumentationWithAction:](self, "_captureSliderInstrumentationWithAction:", 6018);
      -[MUPhotoSliderTileProvider photos](self->_photoTileProvider, "photos");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlacePhotoSectionController _routeAlbumTapWithViewModel:](self, "_routeAlbumTapWithViewModel:", v8);
    }
    else
    {
      -[MUPlaceSectionController mapItem](self, "mapItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "_mapkit_hasMultiplePhotoVendors");

      if (v10)
      {
        -[MUPlacePhotoSectionController _captureSliderInstrumentationWithAction:](self, "_captureSliderInstrumentationWithAction:", 6018);
        -[MUPlacePhotoSectionController photoSectionControllerDelegate](self, "photoSectionControllerDelegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "placePhotoSectionControllerRequestsToOpenThumbnailGallery:withStartingIndex:", self, 0);
        goto LABEL_9;
      }
      -[MUPlaceSectionController mapItem](self, "mapItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_mapkit_preferredFirstPhotoVendor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v7, "shouldHandlePhotosLocally");
      objc_msgSend(v7, "providerID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[MUPlacePhotoSectionController _captureSliderInstrumentationWithAction:eventValue:actionRichProviderId:](self, "_captureSliderInstrumentationWithAction:eventValue:actionRichProviderId:", 6018, 0, v13);

        -[MUPlacePhotoSectionController photoSectionControllerDelegate](self, "photoSectionControllerDelegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "placePhotoSectionControllerRequestsToOpenThumbnailGallery:withStartingIndex:", self, 0);
      }
      else
      {
        -[MUPlacePhotoSectionController _captureSliderInstrumentationWithAction:eventValue:actionRichProviderId:](self, "_captureSliderInstrumentationWithAction:eventValue:actionRichProviderId:", 6023, 0, v13);

        -[MUPlacePhotoSectionController photoSectionControllerDelegate](self, "photoSectionControllerDelegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "placePhotoSectionController:requestsToOpenPhotoAttribution:presentationOptions:", self, v7, v6);
      }
    }

LABEL_9:
    goto LABEL_10;
  }
  if (self->_addPhotoViewModel == v14)
    -[MUPlacePhotoSectionController _addPhotoButtonTappedWithEntryPoint:presentationOptions:](self, "_addPhotoButtonTappedWithEntryPoint:presentationOptions:", 2, v6);
LABEL_10:

}

- (void)photoSliderViewDidTapHeaderView:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[MUPlaceSectionController captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:](self, "captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:", 6060, 0, 0, 0);
  -[MUPlacePhotoSectionController lookAroundDelegate](self, "lookAroundDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MUPlaceSectionController mapItem](self, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLookAroundContainerView lookAroundViewIfPresent](self->_lookAroundContainerView, "lookAroundViewIfPresent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "placePhotoSectionController:enterLookAroundForMapItem:lookAroundView:", self, v4, v5);

}

- (id)photoSliderViewHeaderViewForPhotoSlider:(id)a3
{
  void *v4;
  int v5;
  MKLookAroundContainerView *v6;
  void *v8;
  void *v9;
  void *v10;
  MKLookAroundContainerView *v11;
  MKLookAroundContainerView *lookAroundContainerView;
  MKLookAroundContainerView *v13;
  void *v14;

  if (!-[MUPlacePhotoSectionControllerConfiguration showLookAround](self->_configuration, "showLookAround", a3))
    goto LABEL_4;
  -[MUPlaceSectionController mapItem](self, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_hasLookAroundStorefront");

  if (!v5)
    goto LABEL_4;
  if (!self->_lookAroundContainerView
    && (-[MUPlacePhotoSectionController lookAroundDelegate](self, "lookAroundDelegate"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "lookAroundContainerForPlacePhotoSectionController:", self),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    -[MUPlacePhotoSectionController lookAroundDelegate](self, "lookAroundDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lookAroundContainerForPlacePhotoSectionController:", self);
    v11 = (MKLookAroundContainerView *)objc_claimAutoreleasedReturnValue();
    lookAroundContainerView = self->_lookAroundContainerView;
    self->_lookAroundContainerView = v11;

    -[MKLookAroundContainerView setDelegate:](self->_lookAroundContainerView, "setDelegate:", self);
    v13 = self->_lookAroundContainerView;
    -[MUPlaceSectionController mapItem](self, "mapItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKLookAroundContainerView setMapItem:wantsCloseUpView:](v13, "setMapItem:wantsCloseUpView:", v14, 1);

    v6 = self->_lookAroundContainerView;
  }
  else
  {
LABEL_4:
    v6 = 0;
  }
  return v6;
}

- (MKLookAroundView)lookAroundView
{
  return (MKLookAroundView *)-[MKLookAroundContainerView lookAroundViewIfPresent](self->_lookAroundContainerView, "lookAroundViewIfPresent");
}

- (void)_addPhotoButtonTappedWithEntryPoint:(int64_t)a3 presentationOptions:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[MUPlaceSectionController captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:](self, "captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:", 2147, CFSTR("photo slider"), 0, 0);
  -[MUPlacePhotoSectionController photoSectionControllerDelegate](self, "photoSectionControllerDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "placePhotoSectionController:requestsAddPhotosToMapsWithEntryPoint:options:", self, a3, v6);

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
  id v13;
  void *v14;
  void *v15;
  MUPhotoGalleryTransitionAnimator *v16;

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
      v16 = 0;
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
      if (v11 >= -[MUPhotoSliderTileProvider numberOfPhotos](self->_photoTileProvider, "numberOfPhotos"))
      {
        v16 = 0;
      }
      else
      {
        -[MUPlacePhotoSliderView imageViewForIndex:](self->_photoSliderView, "imageViewForIndex:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_alloc(MEMORY[0x1E0DC3890]);
        objc_msgSend(v12, "image");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v13, "initWithImage:", v14);

        objc_msgSend(v15, "setContentMode:", objc_msgSend(v12, "contentMode"));
        v16 = -[MUPhotoGalleryTransitionAnimator initWithView:transitionView:]([MUPhotoGalleryTransitionAnimator alloc], "initWithView:transitionView:", v12, v15);
        -[MUPhotoGalleryTransitionAnimator setDelegate:](v16, "setDelegate:", self);

      }
      v5 = v10;
      goto LABEL_10;
    }
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (void)placePhotoGalleryDidScrollLeftToIndex:(unint64_t)a3
{
  -[MUPlacePhotoSectionController _capturePhotoGallerySwipeUserAction:atIndex:](self, "_capturePhotoGallerySwipeUserAction:atIndex:", 6048, a3);
}

- (void)placePhotoGalleryDidScrollRightToIndex:(unint64_t)a3
{
  -[MUPlacePhotoSectionController _capturePhotoGallerySwipeUserAction:atIndex:](self, "_capturePhotoGallerySwipeUserAction:atIndex:", 6049, a3);
}

- (void)placePhotoGallery:(id)a3 willCloseAtIndex:(unint64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  MUPlacePhotoSliderView *photoSliderView;
  id v12;
  _QWORD v13[4];
  id v14;

  -[MUPhotoSliderTileProvider photos](self->_photoTileProvider, "photos", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= a4)
  {
    -[MUPhotoSliderTileProvider photos](self->_photoTileProvider, "photos");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count") + 1;

    if (v10 <= a4)
    {
      v8 = 0;
    }
    else
    {
      -[MUPlacePhotoSliderView attributionViewForAttribution:](self->_photoSliderView, "attributionViewForAttribution:", self->_attributionViewModel);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[MUPlacePhotoSliderView imageViewForIndex:](self->_photoSliderView, "imageViewForIndex:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  photoSliderView = self->_photoSliderView;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__MUPlacePhotoSectionController_placePhotoGallery_willCloseAtIndex___block_invoke;
  v13[3] = &unk_1E2E03520;
  v14 = v8;
  v12 = v8;
  -[MUPlacePhotoSliderView enumerateImageViewsWithBlock:](photoSliderView, "enumerateImageViewsWithBlock:", v13);
  -[MUPlacePhotoSliderView scrollToViewAtIndex:](self->_photoSliderView, "scrollToViewAtIndex:", a4);

}

uint64_t __68__MUPlacePhotoSectionController_placePhotoGallery_willCloseAtIndex___block_invoke(uint64_t a1, void *a2)
{
  double v2;

  v2 = 1.0;
  if (*(void **)(a1 + 32) == a2)
    v2 = 0.0;
  return objc_msgSend(a2, "setAlpha:", v2);
}

- (void)placePhotoGalleryDidCloseAtIndex:(unint64_t)a3
{
  void *v4;
  char v5;
  id v6;

  -[MUPlacePhotoSectionController photoSectionControllerDelegate](self, "photoSectionControllerDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MUPlacePhotoSectionController photoSectionControllerDelegate](self, "photoSectionControllerDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "placePhotoSectionControllerDidCloseFullscreenPhotos:", self);

  }
}

- (void)placePhotoGalleryAdditionalViewTapped:(id)a3
{
  -[MUPlacePhotoSectionController photoSliderView:didTapAttribution:](self, "photoSliderView:didTapAttribution:", self->_photoSliderView, self->_attributionViewModel);
}

- (void)placePhotoGallery:(id)a3 attributionViewTappedAtIndex:(unint64_t)a4
{
  id v6;

  -[MUPlacePhotoSectionController photoSectionControllerDelegate](self, "photoSectionControllerDelegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "placePhotoSectionController:didSelectPhotoCategoryAtIndex:", self, a4);

}

- (void)placePhotoGallery:(id)a3 openButtonTappedAtIndex:(unint64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  char v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v16 = a3;
  -[MUPhotoSliderTileProvider photos](self->_photoTileProvider, "photos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 > a4)
  {
    -[MUPlacePhotoSectionController photoSectionControllerDelegate](self, "photoSectionControllerDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v10 = -[MUPlacePhotoSectionController dismissPhotoGalleryIfNecessary:](self, "dismissPhotoGalleryIfNecessary:", v16);
      -[MUPhotoSliderTileProvider photos](self->_photoTileProvider, "photos");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndex:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[MUPlacePhotoSectionController photoSectionControllerDelegate](self, "photoSectionControllerDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "photoID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        v15 = 0;
      else
        v15 = v16;
      objc_msgSend(v13, "placePhotoSectionController:didSelectViewPhoto:withID:presentingViewController:", self, v12, v14, v15);

    }
  }

}

- (void)placePhotoGallery:(id)a3 didSelectReportImageAtIndex:(unint64_t)a4
{
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[MUPlacePhotoSectionController photoSectionControllerDelegate](self, "photoSectionControllerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[MUPhotoSliderTileProvider photoItemAtIndex:](self->_photoTileProvider, "photoItemAtIndex:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlacePhotoSectionController _captureSliderInstrumentationWithAction:](self, "_captureSliderInstrumentationWithAction:", 86);
    -[MUPlacePhotoSectionController photoSectionControllerDelegate](self, "photoSectionControllerDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "geoMapItemPhoto");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "placePhotoSectionController:didSelectPhotoToReport:withPhotoGalleryViewController:", self, v10, v11);

  }
}

- (void)placePhotoGallery:(id)a3 selectedAddPhotoWithEntryPoint:(int64_t)a4 usingPresentationOptions:(id)a5
{
  -[MUPlacePhotoSectionController _addPhotoButtonTappedWithEntryPoint:presentationOptions:](self, "_addPhotoButtonTappedWithEntryPoint:presentationOptions:", 0, a5);
}

- (id)placePhotoGalleryImageViewForPhotoAtIndex:(unint64_t)a3
{
  return -[MUPlacePhotoSliderView imageViewForIndex:](self->_photoSliderView, "imageViewForIndex:", a3);
}

- (id)draggableContent
{
  return 0;
}

- (void)updateForAttributionChange
{
  -[MUPlacePhotoSliderView displayPhotos](self->_photoSliderView, "displayPhotos");
}

- (void)photoGalleryTransitionAnimatorDidFinishAnimation
{
  -[MUPlacePhotoSliderView updateViewsWithAlpha:](self->_photoSliderView, "updateViewsWithAlpha:", 1.0);
}

- (BOOL)dismissPhotoGalleryIfNecessary:(id)a3
{
  id v3;
  _BOOL4 v4;

  v3 = a3;
  v4 = +[MapsUIUtilities isSafariProcess](MapsUIUtilities, "isSafariProcess");
  if (v4)
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  return v4;
}

- (BOOL)isFirstParty
{
  void *v2;
  void *v3;
  char v4;

  -[MUPlaceSectionController mapItem](self, "mapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mapkit_preferredFirstPhotoVendor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldHandlePhotosLocally");

  return v4;
}

- (void)performInstrumentationForScrollLeft
{
  -[MUPlacePhotoSectionController _captureSliderInstrumentationWithAction:](self, "_captureSliderInstrumentationWithAction:", 6048);
}

- (void)performInstrumentationForScrollRight
{
  -[MUPlacePhotoSectionController _captureSliderInstrumentationWithAction:](self, "_captureSliderInstrumentationWithAction:", 6049);
}

- (void)_captureSliderInstrumentationWithAction:(int)a3
{
  -[MUPlaceSectionController captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:](self, "captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:", *(_QWORD *)&a3, 0, 0, 0);
}

- (void)_captureSliderInstrumentationWithAction:(int)a3 eventValue:(id)a4 actionRichProviderId:(id)a5
{
  -[MUPlaceSectionController captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:](self, "captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:", *(_QWORD *)&a3, a4, 0, a5);
}

- (void)_capturePhotoGallerySwipeUserAction:(int)a3 atIndex:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v5 = *(_QWORD *)&a3;
  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceSectionController captureInfoCardAction:target:eventValue:](self, "captureInfoCardAction:target:eventValue:", v5, 612, v7);
  -[MUPlacePhotoGalleryViewController currentPhoto](self->_photoGalleryViewController, "currentPhoto");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attribution");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isUserSubmitted"))
  {
    v10 = (void *)MEMORY[0x1E0D263E8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "captureUGCUserAction:target:value:photoSources:", v5, 612, v7, v12);

  }
}

- (int)analyticsModuleType
{
  return 4;
}

- (BOOL)isImpressionable
{
  return -[MUPhotoSliderTileProvider numberOfPhotos](self->_photoTileProvider, "numberOfPhotos")
      || self->_lookAroundContainerView != 0;
}

- (void)_populateRevealedAnalyticsModule:(id)a3
{
  MUPhotoSliderTileProvider *photoTileProvider;
  id v4;
  id v5;

  photoTileProvider = self->_photoTileProvider;
  v4 = a3;
  MUPhotosRevealedModuleForProvider(photoTileProvider);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPhotos:", v5);

}

- (void)_setContentVisibility:(int64_t)a3
{
  void *v5;
  char v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  id v11;

  if (-[MUPlacePhotoSectionController contentVisibility](self, "contentVisibility") != a3)
  {
    -[MKLookAroundContainerView lookAroundViewIfPresent](self->_lookAroundContainerView, "lookAroundViewIfPresent");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[MUPlacePhotoSectionController lookAroundDelegate](self, "lookAroundDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[MUPlacePhotoSectionController lookAroundDelegate](self, "lookAroundDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "shouldMoveLookAroundStorefrontViewForPlacePhotoSectionController:", self);

      v9 = v8 ^ 1;
    }
    else
    {
      v9 = 0;
    }
    v10 = v11;
    if (!v11 || (v9 & 1) != 0)
      goto LABEL_12;
    if (a3 == 2)
    {
      objc_msgSend(v11, "moveToStandOffView");
    }
    else
    {
      if (a3 != 3)
      {
LABEL_12:

        return;
      }
      objc_msgSend(v11, "moveToCloseUpView");
    }
    v10 = v11;
    goto LABEL_12;
  }
}

- (void)lookAroundContainerView:(id)a3 didAddLookAroundView:(id)a4
{
  int64_t v5;
  BOOL v6;
  void *v7;
  id v8;

  v8 = a4;
  if (!MapKitIdiomIsMacCatalyst())
  {
    v5 = -[MUPlacePhotoSectionController contentVisibility](self, "contentVisibility");
    if (v5 == 2)
    {
      objc_msgSend(v8, "moveToStandOffView");
      goto LABEL_7;
    }
    v6 = v5 == 3;
    v7 = v8;
    if (!v6)
      goto LABEL_8;
  }
  objc_msgSend(v8, "moveToCloseUpView");
LABEL_7:
  v7 = v8;
LABEL_8:

}

- (id)infoCardChildPossibleActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_lookAroundContainerView)
    objc_msgSend(v3, "addObject:", &unk_1E2E55608);
  if (-[MUPhotoSliderTileProvider showFullScreen](self->_photoTileProvider, "showFullScreen"))
    v5 = &unk_1E2E55638;
  else
    v5 = &unk_1E2E55620;
  objc_msgSend(v4, "addObject:", v5);
  v6 = (void *)objc_msgSend(v4, "copy");

  return v6;
}

- (BOOL)isActive
{
  return self->_active;
}

- (MUPlacePhotoSectionControllerLookAroundDelegate)lookAroundDelegate
{
  return (MUPlacePhotoSectionControllerLookAroundDelegate *)objc_loadWeakRetained((id *)&self->_lookAroundDelegate);
}

- (void)setLookAroundDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_lookAroundDelegate, a3);
}

- (MUPlacePhotoSectionControllerDelegate)photoSectionControllerDelegate
{
  return (MUPlacePhotoSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_photoSectionControllerDelegate);
}

- (void)setPhotoSectionControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_photoSectionControllerDelegate, a3);
}

- (MUUserInformationProvider)userInfoProvider
{
  return (MUUserInformationProvider *)objc_loadWeakRetained((id *)&self->_userInfoProvider);
}

- (void)setUserInfoProvider:(id)a3
{
  objc_storeWeak((id *)&self->_userInfoProvider, a3);
}

- (MUUserSubmittedPhoto)userSubmittedPhoto
{
  return self->_userSubmittedPhoto;
}

- (void)setUserSubmittedPhoto:(id)a3
{
  objc_storeStrong((id *)&self->_userSubmittedPhoto, a3);
}

- (int64_t)numberOfUserSubmittedPhotos
{
  return self->_numberOfUserSubmittedPhotos;
}

- (void)setNumberOfUserSubmittedPhotos:(int64_t)a3
{
  self->_numberOfUserSubmittedPhotos = a3;
}

- (int64_t)contentVisibility
{
  return self->_contentVisibility;
}

- (void)setContentVisibility:(int64_t)a3
{
  self->_contentVisibility = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSubmittedPhoto, 0);
  objc_destroyWeak((id *)&self->_userInfoProvider);
  objc_destroyWeak((id *)&self->_photoSectionControllerDelegate);
  objc_destroyWeak((id *)&self->_lookAroundDelegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_lookAroundContainerView, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_addPhotoViewModel, 0);
  objc_storeStrong((id *)&self->_attributionViewModel, 0);
  objc_storeStrong((id *)&self->_imageViewForTransition, 0);
  objc_storeStrong((id *)&self->_photoGalleryViewController, 0);
  objc_storeStrong((id *)&self->_photoSliderView, 0);
  objc_storeStrong((id *)&self->_photoTileProvider, 0);
}

@end
