@implementation MKPlacePhotosViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isSiriProcess
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri"));

  return v4;
}

- (BOOL)isParsecProcess
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Spotlight"));

  return (v5 & 1) != 0 || -[MKPlacePhotosViewController isSafariProcess](self, "isSafariProcess");
}

- (BOOL)isSafariProcess
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilesafari"));

  return v4;
}

- (BOOL)isFirstParty
{
  void *v2;
  char v3;

  -[MKMapItem _mapkit_preferredFirstPhotoVendor](self->_mapItem, "_mapkit_preferredFirstPhotoVendor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldHandlePhotosLocally");

  return v3;
}

- (unint64_t)numberOfBigAttributionViews
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[MKPlacePhotosViewController isFirstParty](self, "isFirstParty");
  if (-[MKPlacePhotosViewController shouldShowAddPhotoButtons](self, "shouldShowAddPhotoButtons"))
  {
    v4 = 1;
    if ((_DWORD)v3)
      v4 = 2;
    if (self->_photosCount > 3)
      return v4;
  }
  return v3;
}

- (BOOL)shouldShowAddPhotoButtons
{
  return 0;
}

- (_MKInfoCardAnalyticsDelegate)analyticsDelegate
{
  void *v3;
  int v4;
  void *v5;

  -[MKPlacePhotosViewController photosControllerDelegate](self, "photosControllerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EDFEAB70);

  if (v4)
  {
    -[MKPlacePhotosViewController photosControllerDelegate](self, "photosControllerDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (_MKInfoCardAnalyticsDelegate *)v5;
}

- (BOOL)isCompactMode
{
  return self->_mode - 1 < 3;
}

- (MKPlacePhotosViewController)initWithMapItem:(id)a3 mode:(unint64_t)a4 options:(unint64_t)a5
{
  id v9;
  MKPlacePhotosViewController *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t initialAppearanceSignpostID;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  MKMapItemPhoto *v27;
  uint64_t v28;
  NSArray *photos;
  uint64_t v30;
  unint64_t v31;
  unint64_t mode;
  uint64_t v33;
  _BOOL4 IsMacCatalyst;
  unint64_t v35;
  uint64_t v36;
  unint64_t photosCount;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  int BOOL;
  void *v43;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[16];
  objc_super v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v50.receiver = self;
  v50.super_class = (Class)MKPlacePhotosViewController;
  v10 = -[MKPlacePhotosViewController init](&v50, sel_init);
  if (v10)
  {
    MKGetPlaceCardLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v10->_initialAppearanceSignpostID = os_signpost_id_generate(v11);

    MKGetPlaceCardLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    initialAppearanceSignpostID = v10->_initialAppearanceSignpostID;
    if (initialAppearanceSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18B0B0000, v13, OS_SIGNPOST_INTERVAL_BEGIN, initialAppearanceSignpostID, "PlacecardPhotosInitialAppearance", (const char *)&unk_18B2CC343, buf, 2u);
    }

    objc_storeStrong((id *)&v10->_mapItem, a3);
    v10->_mode = a4;
    v10->_options = a5;
    v10->_originalMode = a4;
    v10->_photoLoaded = 0;
    v15 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[MKMapItem _geoMapItem](v10->_mapItem, "_geoMapItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_photos");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v15, "initWithCapacity:", objc_msgSend(v17, "count"));

    if ((unint64_t)objc_msgSend(v18, "count") >= 4)
    {
      objc_msgSend(v18, "subarrayWithRange:", 0, 3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "mutableCopy");

      v18 = (void *)v20;
    }
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    -[MKMapItem _geoMapItem](v10->_mapItem, "_geoMapItem", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_photos");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v46 != v25)
            objc_enumerationMutation(v22);
          v27 = -[MKMapItemPhoto initWithGeoMapItemPhoto:]([MKMapItemPhoto alloc], "initWithGeoMapItemPhoto:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i));
          objc_msgSend(v18, "addObject:", v27);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      }
      while (v24);
    }

    v28 = objc_msgSend(v18, "copy");
    photos = v10->_photos;
    v10->_photos = (NSArray *)v28;

    v30 = -[NSArray indexOfObjectPassingTest:](v10->_photos, "indexOfObjectPassingTest:", &__block_literal_global_58);
    v31 = -[NSArray count](v10->_photos, "count");
    v10->_photosCount = v31;
    if (v30 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_17;
    mode = v10->_mode;
    if (mode != 2)
    {
      if (v31 == 3)
      {
LABEL_17:
        v33 = 2;
LABEL_18:
        v10->_mode = v33;
        goto LABEL_19;
      }
      if (!mode && v31 <= 2)
      {
        v33 = 1;
        goto LABEL_18;
      }
    }
LABEL_19:
    IsMacCatalyst = MapKitIdiomIsMacCatalyst();
    v35 = v10->_mode;
    if (IsMacCatalyst && v35 == 2)
    {
      v10->_mode = 0;
    }
    else if (v35)
    {
      goto LABEL_30;
    }
    if (v10->_photosCount >= 4)
    {
      v36 = -[MKPlacePhotosViewController numberOfBigAttributionViews](v10, "numberOfBigAttributionViews");
      photosCount = v10->_photosCount;
      v38 = photosCount % 3;
      if (v36 == 2)
      {
        if (!v38)
          goto LABEL_30;
        v39 = photosCount - v38;
      }
      else
      {
        if (v38 != 2)
          goto LABEL_30;
        v39 = photosCount - 1;
      }
      v10->_photosCount = v39;
    }
LABEL_30:
    if (v10->_mode - 1 <= 2)
    {
      v40 = v10->_photosCount;
      if (v40 >= 3)
        v40 = 3;
      v10->_photosCount = v40;
    }
    v41 = -[NSArray indexOfObjectPassingTest:](v10->_photos, "indexOfObjectPassingTest:", &__block_literal_global_102);
    v10->_canUseFullscreenViewer = v41 == 0x7FFFFFFFFFFFFFFFLL;
    if (v41 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (-[MKPlacePhotosViewController isSiriProcess](v10, "isSiriProcess")
        || -[MKPlacePhotosViewController isParsecProcess](v10, "isParsecProcess"))
      {
        BOOL = GEOConfigGetBOOL();
        v10->_canUseFullscreenViewer = BOOL;
        if (BOOL)
        {
LABEL_39:
          v10->_isRTL = MKApplicationLayoutDirectionIsRightToLeft();

          goto LABEL_40;
        }
      }
      else if (v10->_canUseFullscreenViewer)
      {
        goto LABEL_39;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_canUseFullscreenViewer = objc_msgSend(v43, "BOOLForKey:", CFSTR("MKPlacecardForceFullScreenGallery"));

    goto LABEL_39;
  }
LABEL_40:

  return v10;
}

BOOL __60__MKPlacePhotosViewController_initWithMapItem_mode_options___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  _BOOL8 result;

  if (objc_msgSend(a2, "useGallery"))
    return *a4 != 0;
  result = 1;
  *a4 = 1;
  return result;
}

BOOL __60__MKPlacePhotosViewController_initWithMapItem_mode_options___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  _BOOL8 result;

  if (objc_msgSend(a2, "displayFullScreenPhotoGallery"))
    return *a4 != 0;
  result = 1;
  *a4 = 1;
  return result;
}

- (void)viewDidLoad
{
  NSObject *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIScrollView *v10;
  UIScrollView *photosContainerScrollView;
  void *v12;
  uint64_t v13;
  UIScrollView *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  UIView *v18;
  UIView *attributionClippingview;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  UIButton *v26;
  UIButton *previousPageButton;
  void *v28;
  UIButton *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  UIButton *v33;
  UIButton *nextPageButton;
  void *v35;
  UIButton *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  UIButton *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  char v62;
  void *v63;
  char v64;
  MKPhotoSmallAttributionView *v65;
  UIView *photosSmallAttributionsView;
  UIView *v67;
  unint64_t mode;
  BOOL v69;
  double v70;
  void *v71;
  NSLayoutConstraint *v72;
  NSLayoutConstraint *heightConstraint;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  UIView *v90;
  UIView *bottomHairline;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  double v107;
  double v108;
  double v109;
  double v110;
  void *v111;
  void *v112;
  MKPlaceAttributionCell *attributionCell;
  void *v114;
  void *v115;
  void *v116;
  NSLayoutConstraint *v117;
  NSLayoutConstraint *bottomConstraint;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  NSLayoutConstraint *v129;
  NSLayoutConstraint *v130;
  void *v131;
  void *v132;
  NSObject *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  uint64_t v153;
  void *v154;
  void *v155;
  NSLayoutConstraint *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  objc_super v169;
  uint8_t buf[8];
  _QWORD v171[3];
  _QWORD v172[4];
  _QWORD v173[4];
  _QWORD v174[2];
  _QWORD v175[2];
  _QWORD v176[8];

  v176[6] = *MEMORY[0x1E0C80C00];
  MKGetPlaceCardLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PlacePhotosViewDidLoad", (const char *)&unk_18B2CC343, buf, 2u);
  }

  v169.receiver = self;
  v169.super_class = (Class)MKPlacePhotosViewController;
  -[MKPlacePhotosViewController viewDidLoad](&v169, sel_viewDidLoad);
  -[MKPlacePhotosViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreservesSuperviewLayoutMargins:", 1);

  v5 = objc_alloc(MEMORY[0x1E0CEA970]);
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = (UIScrollView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
  photosContainerScrollView = self->_photosContainerScrollView;
  self->_photosContainerScrollView = v10;

  -[UIScrollView setDelegate:](self->_photosContainerScrollView, "setDelegate:", self);
  -[UIScrollView setAlwaysBounceHorizontal:](self->_photosContainerScrollView, "setAlwaysBounceHorizontal:", 0);
  -[UIScrollView setAlwaysBounceVertical:](self->_photosContainerScrollView, "setAlwaysBounceVertical:", 0);
  -[UIScrollView setShowsHorizontalScrollIndicator:](self->_photosContainerScrollView, "setShowsHorizontalScrollIndicator:", 0);
  -[UIScrollView setShowsVerticalScrollIndicator:](self->_photosContainerScrollView, "setShowsVerticalScrollIndicator:", 0);
  -[MKPlacePhotosViewController traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  v14 = self->_photosContainerScrollView;
  if (v13 == 5)
  {
    -[UIScrollView setClipsToBounds:](v14, "setClipsToBounds:", 1);
    -[UIScrollView layer](self->_photosContainerScrollView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCornerRadius:", 4.0);

  }
  else
  {
    -[UIScrollView setClipsToBounds:](v14, "setClipsToBounds:", 0);
  }
  objc_storeStrong((id *)&self->_photosContainer, self->_photosContainerScrollView);
  -[MKPlacePhotosViewController traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "userInterfaceIdiom");

  if (v17 == 5)
  {
    v18 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v6, v7, v8, v9);
    attributionClippingview = self->_attributionClippingview;
    self->_attributionClippingview = v18;

    -[UIView setClipsToBounds:](self->_attributionClippingview, "setClipsToBounds:", 1);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_attributionClippingview, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  -[UIScrollView setPreservesSuperviewLayoutMargins:](self->_photosContainerScrollView, "setPreservesSuperviewLayoutMargins:", 1);
  -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](self->_photosContainerScrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKPlacePhotosViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSubview:", self->_photosContainerScrollView);

  if (self->_attributionClippingview)
  {
    -[MKPlacePhotosViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", self->_attributionClippingview);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = objc_claimAutoreleasedReturnValue();
  -[MKPlacePhotosViewController traitCollection](self, "traitCollection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "userInterfaceIdiom");

  v168 = (void *)v22;
  if (v24 == 5)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("chevron.compact.left"));
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v26 = (UIButton *)objc_claimAutoreleasedReturnValue();
    previousPageButton = self->_previousPageButton;
    self->_previousPageButton = v26;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_previousPageButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](self->_previousPageButton, "setTintColor:", v28);

    -[UIButton setAlpha:](self->_previousPageButton, "setAlpha:", 0.0);
    v164 = (void *)v25;
    -[UIButton setImage:forState:](self->_previousPageButton, "setImage:forState:", v25, 0);
    v29 = self->_previousPageButton;
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 21.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setPreferredSymbolConfiguration:forImageInState:](v29, "setPreferredSymbolConfiguration:forImageInState:", v30, 0);

    -[UIButton addTarget:action:forControlEvents:](self->_previousPageButton, "addTarget:action:forControlEvents:", self, sel__scrollPrevious, 64);
    -[MKPlacePhotosViewController view](self, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addSubview:", self->_previousPageButton);

    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("chevron.compact.right"));
    v32 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v33 = (UIButton *)objc_claimAutoreleasedReturnValue();
    nextPageButton = self->_nextPageButton;
    self->_nextPageButton = v33;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_nextPageButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](self->_nextPageButton, "setTintColor:", v35);

    -[UIButton setAlpha:](self->_nextPageButton, "setAlpha:", 0.0);
    v162 = (void *)v32;
    -[UIButton setImage:forState:](self->_nextPageButton, "setImage:forState:", v32, 0);
    v36 = self->_nextPageButton;
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 21.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setPreferredSymbolConfiguration:forImageInState:](v36, "setPreferredSymbolConfiguration:forImageInState:", v37, 0);

    -[UIButton addTarget:action:forControlEvents:](self->_nextPageButton, "addTarget:action:forControlEvents:", self, sel__scrollNext, 64);
    -[MKPlacePhotosViewController view](self, "view");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addSubview:", self->_nextPageButton);

    -[UIView centerXAnchor](self->_attributionClippingview, "centerXAnchor");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView centerXAnchor](self->_photosContainerScrollView, "centerXAnchor");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "constraintEqualToAnchor:", v157);
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    v176[0] = v154;
    -[UIView centerYAnchor](self->_attributionClippingview, "centerYAnchor");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView centerYAnchor](self->_photosContainerScrollView, "centerYAnchor");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "constraintEqualToAnchor:", v149);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    v176[1] = v147;
    -[UIView heightAnchor](self->_attributionClippingview, "heightAnchor");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView heightAnchor](self->_photosContainerScrollView, "heightAnchor");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "constraintEqualToAnchor:", v142);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v176[2] = v140;
    -[UIView widthAnchor](self->_attributionClippingview, "widthAnchor");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView widthAnchor](self->_photosContainerScrollView, "widthAnchor");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "constraintEqualToAnchor:", v136);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v176[3] = v135;
    -[UIButton centerYAnchor](self->_previousPageButton, "centerYAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView centerYAnchor](self->_photosContainerScrollView, "centerYAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v40);
    v41 = (void *)v22;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v176[4] = v42;
    -[UIButton centerYAnchor](self->_nextPageButton, "centerYAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView centerYAnchor](self->_photosContainerScrollView, "centerYAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v176[5] = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v176, 6);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObjectsFromArray:", v46);

    v47 = self->_previousPageButton;
    if (self->_isRTL)
    {
      -[UIButton leadingAnchor](v47, "leadingAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIScrollView trailingAnchor](self->_photosContainerScrollView, "trailingAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "constraintEqualToAnchor:constant:", v49, 3.0);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v175[0] = v50;
      -[UIButton trailingAnchor](self->_nextPageButton, "trailingAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIScrollView leadingAnchor](self->_photosContainerScrollView, "leadingAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "constraintEqualToAnchor:constant:", v52, -3.0);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v175[1] = v53;
      v54 = v175;
    }
    else
    {
      -[UIButton trailingAnchor](v47, "trailingAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIScrollView leadingAnchor](self->_photosContainerScrollView, "leadingAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "constraintEqualToAnchor:constant:", v49, -3.0);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v174[0] = v50;
      -[UIButton leadingAnchor](self->_nextPageButton, "leadingAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIScrollView trailingAnchor](self->_photosContainerScrollView, "trailingAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "constraintEqualToAnchor:constant:", v52, 3.0);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v174[1] = v53;
      v54 = v174;
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (uint64_t)v168;
    objc_msgSend(v168, "addObjectsFromArray:", v55);

  }
  v56 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA628]), "initWithTarget:action:", self, sel_handleHover_);
  -[MKPlacePhotosViewController view](self, "view");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = (void *)v56;
  objc_msgSend(v57, "addGestureRecognizer:", v56);

  v58 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__photoSelected_);
  -[MKPlacePhotosViewController view](self, "view");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v165 = (void *)v58;
  objc_msgSend(v59, "addGestureRecognizer:", v58);

  if (-[MKPlacePhotosViewController shouldShowAddPhotoButtons](self, "shouldShowAddPhotoButtons"))
  {
    v60 = (void *)v22;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "BOOLForKey:", CFSTR("MKPlacecardForceNativePhotoCarousel"));

    if ((v62 & 1) != 0)
      goto LABEL_24;
    if (self->_mode == 2)
      goto LABEL_24;
    -[MKMapItem _mapkit_preferredFirstPhotoVendor](self->_mapItem, "_mapkit_preferredFirstPhotoVendor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "shouldSuppressPhotoAttribution");

    if ((v64 & 1) != 0
      || self->_mode == 3
      || (v65 = -[MKPhotoSmallAttributionView initWithMapItem:]([MKPhotoSmallAttributionView alloc], "initWithMapItem:", self->_mapItem), photosSmallAttributionsView = self->_photosSmallAttributionsView, self->_photosSmallAttributionsView = &v65->super, photosSmallAttributionsView, -[UIView setAlpha:](self->_photosSmallAttributionsView, "setAlpha:", 0.0), !self->_photosSmallAttributionsView))
    {
LABEL_24:
      v60 = (void *)v22;
    }
    else
    {
      v67 = self->_attributionClippingview;
      v60 = (void *)v22;
      if (v67)
      {
        -[UIView addSubview:](v67, "addSubview:");
      }
      else
      {
        -[MKPlacePhotosViewController view](self, "view");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v134, "addSubview:", self->_photosSmallAttributionsView);

      }
    }
  }
  mode = self->_mode;
  if (mode)
    v69 = mode == 3;
  else
    v69 = 1;
  if (v69)
    v70 = 170.0;
  else
    v70 = 163.0;
  -[UIScrollView heightAnchor](self->_photosContainerScrollView, "heightAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToConstant:", v70);
  v72 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v72;

  -[UIScrollView leadingAnchor](self->_photosContainerScrollView, "leadingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlacePhotosViewController view](self, "view");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "layoutMarginsGuide");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "leadingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:", v77);
  v78 = objc_claimAutoreleasedReturnValue();

  -[UIScrollView trailingAnchor](self->_photosContainerScrollView, "trailingAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlacePhotosViewController view](self, "view");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "layoutMarginsGuide");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "trailingAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:", v82);
  v83 = objc_claimAutoreleasedReturnValue();

  v173[0] = self->_heightConstraint;
  -[UIScrollView topAnchor](self->_photosContainerScrollView, "topAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlacePhotosViewController view](self, "view");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "topAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintEqualToAnchor:", v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v173[1] = v87;
  v173[2] = v78;
  v161 = (void *)v83;
  v163 = (void *)v78;
  v173[3] = v83;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v173, 4);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v60;
  objc_msgSend(v60, "addObjectsFromArray:", v88);

  v90 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
  bottomHairline = self->_bottomHairline;
  self->_bottomHairline = v90;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_bottomHairline, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKPlacePhotosViewController view](self, "view");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "addSubview:", self->_bottomHairline);

  -[UIViewController mk_theme](self, "mk_theme");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "separatorLineColor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_bottomHairline, "setBackgroundColor:", v94);

  -[UIView setHidden:](self->_bottomHairline, "setHidden:", 1);
  -[UIView leadingAnchor](self->_bottomHairline, "leadingAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlacePhotosViewController view](self, "view");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "layoutMarginsGuide");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "leadingAnchor");
  v158 = v95;
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "constraintEqualToAnchor:");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v172[0] = v148;
  -[UIView trailingAnchor](self->_bottomHairline, "trailingAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlacePhotosViewController view](self, "view");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "layoutMarginsGuide");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "trailingAnchor");
  v146 = v96;
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "constraintEqualToAnchor:");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v172[1] = v139;
  -[UIView bottomAnchor](self->_bottomHairline, "bottomAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlacePhotosViewController view](self, "view");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "bottomAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = v97;
  objc_msgSend(v97, "constraintEqualToAnchor:", v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v172[2] = v100;
  -[UIView heightAnchor](self->_bottomHairline, "heightAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlacePhotosViewController view](self, "view");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "window");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "screen");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  if (v104)
  {
    objc_msgSend(v102, "window");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "screen");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "nativeScale");
    v108 = v107;

    v89 = v168;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "nativeScale");
    v108 = v109;
  }

  v110 = 1.0;
  if (v108 > 0.0)
    v110 = 1.0 / v108;
  objc_msgSend(v101, "constraintEqualToConstant:", v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v172[3] = v111;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v172, 4);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "addObjectsFromArray:", v112);

  if (self->_mapItem)
    -[MKPlacePhotosViewController _createImageViews](self, "_createImageViews");
  attributionCell = self->_attributionCell;
  if (attributionCell)
  {
    -[MKPlaceAttributionCell bottomAnchor](attributionCell, "bottomAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlacePhotosViewController view](self, "view");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "bottomAnchor");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "constraintEqualToAnchor:", v116);
    v117 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    bottomConstraint = self->_bottomConstraint;
    self->_bottomConstraint = v117;

    -[MKPlaceAttributionCell topAnchor](self->_attributionCell, "topAnchor");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_photosContainer, "bottomAnchor");
    v153 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "constraintEqualToAnchor:", v153);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v171[0] = v119;
    -[MKPlaceAttributionCell leadingAnchor](self->_attributionCell, "leadingAnchor");
    v156 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    -[MKPlacePhotosViewController view](self, "view");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "leadingAnchor");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSLayoutConstraint constraintEqualToAnchor:](v156, "constraintEqualToAnchor:", v120);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v171[1] = v121;
    -[MKPlaceAttributionCell trailingAnchor](self->_attributionCell, "trailingAnchor");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlacePhotosViewController view](self, "view");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "trailingAnchor");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "constraintEqualToAnchor:", v124);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v171[2] = v125;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v171, 3);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v168, "addObjectsFromArray:", v126);

    v127 = (void *)v153;
    v128 = v167;

    v89 = v168;
    v129 = v156;
  }
  else
  {
    -[UIScrollView bottomAnchor](self->_photosContainerScrollView, "bottomAnchor");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlacePhotosViewController view](self, "view");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "bottomAnchor");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "constraintEqualToAnchor:", v119);
    v130 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v129 = self->_bottomConstraint;
    self->_bottomConstraint = v130;
  }

  objc_msgSend(v89, "addObject:", self->_bottomConstraint);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v89);
  -[MKPlacePhotosViewController updateBottomHairlineVisibility](self, "updateBottomHairlineVisibility");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "addObserver:selector:name:object:", self, sel__didBecomeActive_, *MEMORY[0x1E0CEB270], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "addObserver:selector:name:object:", self, sel__willResignActive_, *MEMORY[0x1E0CEB358], 0);

  MKGetPlaceCardLog();
  v133 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v133))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v133, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PlacePhotosViewDidLoad", (const char *)&unk_18B2CC343, buf, 2u);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  MKLookAroundContainerView *lookAroundContainerView;
  MKMapItem *mapItem;
  _BOOL8 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t initialAppearanceSignpostID;
  uint8_t v17[8];
  objc_super v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)MKPlacePhotosViewController;
  -[MKPlacePhotosViewController viewDidAppear:](&v18, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__catchScrollNotification_, CFSTR("MKStackingScrollNotification"), 0);

  -[MKPlacePhotosViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  lookAroundContainerView = self->_lookAroundContainerView;
  mapItem = self->_mapItem;
  v9 = v6 == 5 || -[UIViewController contentVisibility](self, "contentVisibility") == 3;
  -[MKLookAroundContainerView setMapItem:wantsCloseUpView:](lookAroundContainerView, "setMapItem:wantsCloseUpView:", mapItem, v9);
  -[MKLookAroundContainerView lookAroundViewIfPresent](self->_lookAroundContainerView, "lookAroundViewIfPresent");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
  {
    v19 = CFSTR("MKLookAroundView");
    v20[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("MKPlacePhotosViewControllerDidDisplayPhotos"), self, v12);

  if (self->_initialAppearanceSignpostID != -1)
  {
    MKGetPlaceCardLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    initialAppearanceSignpostID = self->_initialAppearanceSignpostID;
    if (initialAppearanceSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)v17 = 0;
      _os_signpost_emit_with_name_impl(&dword_18B0B0000, v15, OS_SIGNPOST_INTERVAL_END, initialAppearanceSignpostID, "PlacecardPhotosInitialAppearance", (const char *)&unk_18B2CC343, v17, 2u);
    }

    self->_initialAppearanceSignpostID = -1;
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKPlacePhotosViewController;
  -[MKPlacePhotosViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("MKPlacePhotosViewControllerWillDisplayPhotos"), self);

  self->_isDisappearing = 0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKPlacePhotosViewController;
  -[MKPlacePhotosViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  self->_isDisappearing = 1;
  -[MKPlacePhotosViewController _cancelLoadPhotos](self, "_cancelLoadPhotos");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("MKStackingScrollNotification"), 0);

}

- (void)_didBecomeActive:(id)a3
{
  void *v4;
  void *v5;

  if (-[MKPlacePhotosViewController isViewLoaded](self, "isViewLoaded", a3))
  {
    -[MKPlacePhotosViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[MKPlacePhotosViewController _loadPhotos](self, "_loadPhotos");
  }
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MKPlacePhotosViewController;
  -[MKPlacePhotosViewController dealloc](&v2, sel_dealloc);
}

- (void)setShowsBottomHairline:(BOOL)a3
{
  if (self->_showsBottomHairline != a3)
  {
    self->_showsBottomHairline = a3;
    -[MKPlacePhotosViewController updateBottomHairlineVisibility](self, "updateBottomHairlineVisibility");
  }
}

- (void)updateBottomHairlineVisibility
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  if (-[MKPlacePhotosViewController showsBottomHairline](self, "showsBottomHairline"))
  {
    -[UIView setHidden:](self->_bottomHairline, "setHidden:", 0);
    -[MKPlacePhotosViewController view](self, "view");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "screen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v11, "window");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "screen");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "nativeScale");
      v8 = v7;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "nativeScale");
      v8 = v9;
    }

    v10 = 1.0 / v8 + 16.0;
    if (v8 <= 0.0)
      v10 = 17.0;
    -[NSLayoutConstraint setConstant:](self->_bottomConstraint, "setConstant:", -v10);

  }
  else
  {
    -[NSLayoutConstraint setConstant:](self->_bottomConstraint, "setConstant:", 0.0);
    -[UIView setHidden:](self->_bottomHairline, "setHidden:", 1);
  }
}

- (MKLookAroundView)lookAroundView
{
  return (MKLookAroundView *)-[MKLookAroundContainerView lookAroundViewIfPresent](self->_lookAroundContainerView, "lookAroundViewIfPresent");
}

- (void)addAttributionCell
{
  MKPlaceAttributionCell *v3;
  MKPlaceAttributionCell *v4;
  MKPlaceAttributionCell *attributionCell;
  void *v6;

  if (!self->_attributionCell)
  {
    v3 = [MKPlaceAttributionCell alloc];
    v4 = -[MKPlaceAttributionCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    attributionCell = self->_attributionCell;
    self->_attributionCell = v4;

    -[MKPlaceAttributionCell setTranslatesAutoresizingMaskIntoConstraints:](self->_attributionCell, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MKPlaceAttributionCell setCellDelegate:](self->_attributionCell, "setCellDelegate:", self);
    -[MKPlacePhotosViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_attributionCell);

    -[MKPlacePhotosViewController updateAttributionCell](self, "updateAttributionCell");
  }
}

- (void)updateAttributionCell
{
  MKPlaceAttributionCell *attributionCell;
  id v3;

  attributionCell = self->_attributionCell;
  if (attributionCell)
  {
    -[MKPlacePhotosViewController formattedAttributionString](self, "formattedAttributionString");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[MKPlaceAttributionCell setAttributionString:](attributionCell, "setAttributionString:", v3);

  }
}

- (id)formattedAttributionString
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
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  -[MKPlacePhotosViewController attributionString](self, "attributionString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA230], "defaultParagraphStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setAlignment:", 4);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v3);
  v7 = *MEMORY[0x1E0CEA0D0];
  v14[0] = v5;
  v8 = *MEMORY[0x1E0CEA0A0];
  v13[0] = v7;
  v13[1] = v8;
  -[UIViewController mk_theme](self, "mk_theme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAttributes:range:", v11, 0, objc_msgSend(v6, "length"));

  return v6;
}

- (id)_firstPartyMorePhotosAttributionString
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v4 = objc_alloc_init(MEMORY[0x1E0CEA258]);
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("photo.on.rectangle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CEA650];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 13.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configurationWithFont:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithConfiguration:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageWithRenderingMode:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v10);

  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _MKLocalizedStringFromThisBundle(CFSTR("More Photos"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v12);
  objc_msgSend(v3, "appendAttributedString:", v11);
  objc_msgSend(v3, "appendAttributedString:", v13);
  v14 = objc_msgSend(v3, "length");
  v15 = *MEMORY[0x1E0CEA098];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 13.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAttribute:value:range:", v15, v16, 0, v14);

  v17 = *MEMORY[0x1E0CEA0A0];
  -[UIViewController mk_theme](self, "mk_theme");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "tintColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAttribute:value:range:", v17, v19, 0, v14);

  return v3;
}

- (id)attributionString
{
  MKMapItem *mapItem;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  mapItem = self->_mapItem;
  -[MKMapItem _mapkit_preferredFirstPhotoVendor](mapItem, "_mapkit_preferredFirstPhotoVendor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _MKLocalizedStringFromThisBundle(CFSTR("More Photos on %@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _MKLocalizedStringFromThisBundle(CFSTR("More Photos on %@"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController mk_theme](self, "mk_theme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isDarkTheme") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapItem _attributionFor:sourceStringFormat:moreSourceStringFormat:imageTintColor:](mapItem, "_attributionFor:sourceStringFormat:moreSourceStringFormat:imageTintColor:", v4, v5, v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MKMapItem _attributionFor:sourceStringFormat:moreSourceStringFormat:imageTintColor:](mapItem, "_attributionFor:sourceStringFormat:moreSourceStringFormat:imageTintColor:", v4, v5, v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)openURL
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  -[MKPlacePhotosViewController analyticsDelegate](self, "analyticsDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v6, "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:actionRichProviderId:", 6023, 0, 0, 0);
  -[MKPlacePhotosViewController photosControllerDelegate](self, "photosControllerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MKPlacePhotosViewController photosControllerDelegate](self, "photosControllerDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "placeCardActionControllerDidSelectViewAllPhotos:presentingViewController:", 0, self);

  }
}

- (void)_createImageViews
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  unint64_t v7;
  BOOL v8;
  id v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  unint64_t mode;
  _BOOL8 v17;
  MKPhotoBigAttributionView *v18;
  MKPhotoBigAttributionView *primaryAttributionView;
  void *v20;
  unint64_t photosCount;
  MKPhotoBigAttributionView *v22;
  MKPhotoBigAttributionView *secondaryAttributionView;
  id WeakRetained;
  MKLookAroundContainerView *v25;
  MKLookAroundContainerView *lookAroundContainerView;
  NSArray *v27;
  NSArray *photoViews;
  void *v29;
  id v30;

  if (self->_photosCount == 3 && !MapKitIdiomIsMacCatalyst())
    self->_mode = 2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", self->_photosCount);
  v30 = (id)objc_claimAutoreleasedReturnValue();
  -[MKPlacePhotosViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 5
    && (objc_msgSend(MEMORY[0x1E0D27420], "modernManager"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isMuninEnabled"),
        v5,
        v6)
    && ((v7 = self->_options & 1, -[MKMapItem _hasLookAroundStorefront](self->_mapItem, "_hasLookAroundStorefront"))
      ? (v8 = v7 == 0)
      : (v8 = 0),
        v8))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_photosControllerDelegate);
    objc_msgSend(WeakRetained, "lookAroundContainerForPlaceCardPhotosController:", self);
    v25 = (MKLookAroundContainerView *)objc_claimAutoreleasedReturnValue();
    lookAroundContainerView = self->_lookAroundContainerView;
    self->_lookAroundContainerView = v25;

    -[MKLookAroundContainerView setDelegate:](self->_lookAroundContainerView, "setDelegate:", self);
    -[MKLookAroundContainerView setMapItem:](self->_lookAroundContainerView, "setMapItem:", self->_mapItem);
    objc_storeStrong((id *)&self->_externalView, self->_lookAroundContainerView);
    -[UIView addSubview:](self->_photosContainer, "addSubview:", self->_externalView);
  }
  else
  {
    v9 = objc_loadWeakRetained((id *)&self->_photosControllerDelegate);
    objc_msgSend(v9, "cleanLookAroundContainerForPlaceCardPhotosController:", self);

  }
  if (self->_photosCount)
  {
    v10 = 0;
    v11 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", v11, v12, v13, v14);
      objc_msgSend(v15, "setClipsToBounds:", 1);
      objc_msgSend(v15, "setContentMode:", 2);
      objc_msgSend(v30, "addObject:", v15);
      -[UIView addSubview:](self->_photosContainer, "addSubview:", v15);

      ++v10;
    }
    while (v10 < self->_photosCount);
  }
  mode = self->_mode;
  if (mode == 2)
  {
    -[MKPlacePhotosViewController addAttributionCell](self, "addAttributionCell");
  }
  else if (mode != 3)
  {
    v17 = -[MKPlacePhotosViewController isFirstParty](self, "isFirstParty") || self->_photosCount > 2;
    +[MKPhotoBigAttributionView bigAttributionViewForMapItem:attributionType:isFirstParty:context:](MKPhotoBigAttributionView, "bigAttributionViewForMapItem:attributionType:isFirstParty:context:", self->_mapItem, v17, -[MKPlacePhotosViewController isFirstParty](self, "isFirstParty"), 0);
    v18 = (MKPhotoBigAttributionView *)objc_claimAutoreleasedReturnValue();
    primaryAttributionView = self->_primaryAttributionView;
    self->_primaryAttributionView = v18;

    if (-[MKPlacePhotosViewController shouldShowAddPhotoButtons](self, "shouldShowAddPhotoButtons"))
    {
      if (self->_photosCount < 4)
        goto LABEL_28;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v20, "BOOLForKey:", CFSTR("MKPlacecardForceNativePhotoCarousel")) & 1) == 0)
      {

        goto LABEL_28;
      }
      photosCount = self->_photosCount;

      if (photosCount <= 3)
      {
LABEL_28:
        objc_msgSend(v30, "addObject:", self->_primaryAttributionView);
        -[UIView addSubview:](self->_photosContainer, "addSubview:", self->_primaryAttributionView);
        goto LABEL_29;
      }
    }
    +[MKPhotoBigAttributionView bigAttributionViewForMapItem:attributionType:isFirstParty:context:](MKPhotoBigAttributionView, "bigAttributionViewForMapItem:attributionType:isFirstParty:context:", self->_mapItem, 0, -[MKPlacePhotosViewController isFirstParty](self, "isFirstParty"), 0);
    v22 = (MKPhotoBigAttributionView *)objc_claimAutoreleasedReturnValue();
    secondaryAttributionView = self->_secondaryAttributionView;
    self->_secondaryAttributionView = v22;

    objc_msgSend(v30, "addObject:", self->_secondaryAttributionView);
    -[UIView addSubview:](self->_photosContainer, "addSubview:", self->_secondaryAttributionView);
    goto LABEL_28;
  }
LABEL_29:
  v27 = (NSArray *)objc_msgSend(v30, "copy");
  photoViews = self->_photoViews;
  self->_photoViews = v27;

  -[UIViewController mk_theme](self, "mk_theme");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlacePhotosViewController _updatePhotoBackgroundColor:](self, "_updatePhotoBackgroundColor:", v29);

  -[MKPlacePhotosViewController layoutImages](self, "layoutImages");
  -[MKPlacePhotosViewController _applyCornerRadius](self, "_applyCornerRadius");

}

- (void)_applyCornerRadius
{
  NSUInteger v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  UIView *externalView;
  UIView *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSArray *photoViews;
  _BOOL4 isRTL;
  void *v25;
  void *v26;
  void *v27;
  NSUInteger v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v3 = -[NSArray count](self->_photoViews, "count");
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v4 = self->_photoViews;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v59 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend(v9, "layer", (_QWORD)v58);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setCornerRadius:", 0.0);

        objc_msgSend(v9, "layer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setMaskedCorners:", 0);

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
    }
    while (v6);
  }

  externalView = self->_externalView;
  if (externalView)
  {
    v13 = externalView;
    -[UIView layer](v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCornerRadius:", 4.0);

    -[UIView layer](v13, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMaskedCorners:", 15);

    v16 = *MEMORY[0x1E0CD2A68];
    -[UIView layer](v13, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setCornerCurve:", v16);
  }
  if (v3)
  {
    if (v3 == 1)
    {
      -[NSArray firstObject](self->_photoViews, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "layer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setCornerRadius:", 4.0);

      objc_msgSend(v18, "layer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setMaskedCorners:", 15);

      v21 = *MEMORY[0x1E0CD2A68];
      objc_msgSend(v18, "layer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setCornerCurve:", v21);
    }
    else
    {
      if (v3 % 3 - 1 >= 2)
      {
        if (v3 % 3)
          goto LABEL_25;
        isRTL = self->_isRTL;
        -[NSArray firstObject](self->_photoViews, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "layer");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setCornerRadius:", 4.0);

        objc_msgSend(v18, "layer");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        v28 = v3 - 2;
        if (isRTL)
        {
          objc_msgSend(v26, "setMaskedCorners:", 10);

          v29 = *MEMORY[0x1E0CD2A68];
          objc_msgSend(v18, "layer");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setCornerCurve:", v29);

          -[NSArray objectAtIndexedSubscript:](self->_photoViews, "objectAtIndexedSubscript:", v28);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "layer");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setCornerRadius:", 4.0);

          objc_msgSend(v22, "layer");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setMaskedCorners:", 1);

          objc_msgSend(v22, "layer");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setCornerCurve:", v29);

          -[NSArray lastObject](self->_photoViews, "lastObject");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "layer");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setCornerRadius:", 4.0);

          objc_msgSend(v34, "layer");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v36;
          v38 = 4;
        }
        else
        {
          objc_msgSend(v26, "setMaskedCorners:", 5);

          v29 = *MEMORY[0x1E0CD2A68];
          objc_msgSend(v18, "layer");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setCornerCurve:", v29);

          -[NSArray objectAtIndexedSubscript:](self->_photoViews, "objectAtIndexedSubscript:", v28);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "layer");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "setCornerRadius:", 4.0);

          objc_msgSend(v22, "layer");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setMaskedCorners:", 2);

          objc_msgSend(v22, "layer");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setCornerCurve:", v29);

          -[NSArray lastObject](self->_photoViews, "lastObject");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "layer");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "setCornerRadius:", 4.0);

          objc_msgSend(v34, "layer");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v36;
          v38 = 8;
        }
        objc_msgSend(v36, "setMaskedCorners:", v38, (_QWORD)v58);

        objc_msgSend(v34, "layer");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setCornerCurve:", v29);

      }
      else
      {
        photoViews = self->_photoViews;
        if (self->_isRTL)
        {
          -[NSArray lastObject](photoViews, "lastObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray firstObject](self->_photoViews, "firstObject");
        }
        else
        {
          -[NSArray firstObject](photoViews, "firstObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray lastObject](self->_photoViews, "lastObject");
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "layer", (_QWORD)v58);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setCornerRadius:", 4.0);

        objc_msgSend(v18, "layer");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setMaskedCorners:", 5);

        v41 = *MEMORY[0x1E0CD2A68];
        objc_msgSend(v18, "layer");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setCornerCurve:", v41);

        objc_msgSend(v22, "layer");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setCornerRadius:", 4.0);

        objc_msgSend(v22, "layer");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setMaskedCorners:", 10);

        objc_msgSend(v22, "layer");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setCornerCurve:", v41);
      }

    }
LABEL_25:
    if (-[MKPlacePhotosViewController numberOfBigAttributionViews](self, "numberOfBigAttributionViews", (_QWORD)v58) == 2)
    {
      -[MKPhotoBigAttributionView layer](self->_secondaryAttributionView, "layer");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setCornerRadius:", 4.0);

      -[MKPhotoBigAttributionView layer](self->_secondaryAttributionView, "layer");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setMaskedCorners:", 2);

      v53 = *MEMORY[0x1E0CD2A68];
      -[MKPhotoBigAttributionView layer](self->_secondaryAttributionView, "layer");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setCornerCurve:", v53);

      -[MKPhotoBigAttributionView layer](self->_primaryAttributionView, "layer");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setCornerRadius:", 4.0);

      -[MKPhotoBigAttributionView layer](self->_primaryAttributionView, "layer");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setMaskedCorners:", 8);

      -[MKPhotoBigAttributionView layer](self->_primaryAttributionView, "layer");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setCornerCurve:", v53);

    }
  }
}

- (void)layoutImages
{
  MKPlacePhotosViewController *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIView *externalView;
  double v8;
  double v9;
  double Width;
  double Height;
  id v12;
  double v13;
  double v14;
  id v15;
  id *p_isa;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  double v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  int v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  unint64_t v36;
  NSArray *photoViews;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  _BOOL8 v47;
  UIScrollView *photosContainerScrollView;
  double MaxX;
  double v50;
  NSArray *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  void *v56;
  UIView *v57;
  uint64_t v58;
  uint64_t v59;
  NSArray *obj;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  v2 = self;
  v71 = *MEMORY[0x1E0C80C00];
  -[UIScrollView bounds](self->_photosContainerScrollView, "bounds");
  v4 = v3;
  v6 = v5;
  if (-[NSArray count](v2->_photoViews, "count"))
  {
    if (v6 == 0.0 || v4 == 0.0)
      return;
    externalView = v2->_externalView;
  }
  else
  {
    externalView = v2->_externalView;
    if (!externalView || v6 == 0.0 || v4 == 0.0)
      return;
  }
  if (externalView)
    v8 = 170.0;
  else
    v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (externalView)
    v9 = 226.5;
  else
    v9 = *MEMORY[0x1E0C9D820];
  if (!v2->_mode)
  {
    v59 = 1064;
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    p_isa = (id *)&v2->super.super.super.isa;
    v58 = 1000;
    obj = v2->_photoViews;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
    if (v17)
    {
      v18 = v17;
      v19 = 0;
      v12 = 0;
      if (externalView)
        v20 = 231.5;
      else
        v20 = 0.0;
      v21 = *(_QWORD *)v66;
      v22 = 0.0;
      do
      {
        v23 = 0;
        v24 = v19;
        v25 = v12;
        do
        {
          if (*(_QWORD *)v66 != v21)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v23);
          objc_opt_class();
          v27 = v19 + v23 + (objc_opt_isKindOfClass() & 1) - 3 * (v24 / 3);
          objc_msgSend(p_isa, "sizeForIndex:", v19 + v23);
          v29 = v28;
          v31 = v30;
          objc_msgSend(v26, "setFrame:", v20, v22, v28, v30);
          v32 = v31 + 2.0;
          if (v27)
            v33 = v22;
          else
            v33 = 0.0;
          if (v27)
            v34 = v20;
          else
            v34 = v20 + v29 + 2.0;
          if (v27 == 1)
          {
            v35 = v20;
          }
          else
          {
            v32 = v33;
            v35 = v34;
          }
          if (v27 == 2)
            v22 = 0.0;
          else
            v22 = v32;
          if (v27 == 2)
            v20 = v20 + v29 + 2.0;
          else
            v20 = v35;
          v12 = v26;

          ++v24;
          ++v23;
          v25 = v12;
        }
        while (v18 != v23);
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
        v19 += v23;
      }
      while (v18);
    }
    else
    {
      v12 = 0;
    }

    v2 = (MKPlacePhotosViewController *)p_isa;
    objc_msgSend(p_isa[128], "setHidden:", 0);
    objc_msgSend(p_isa[126], "setAlwaysBounceHorizontal:", 1);
    goto LABEL_63;
  }
  -[UIScrollView bounds](v2->_photosContainerScrollView, "bounds", *MEMORY[0x1E0C9D820]);
  Width = CGRectGetWidth(v72);
  -[UIScrollView bounds](v2->_photosContainerScrollView, "bounds");
  Height = CGRectGetHeight(v73);
  v12 = v2->_externalView;
  v13 = (Width + -2.0) / 1.5;
  if (v12)
  {
    if (v2->_photosCount)
      v9 = (Width + -2.0) / 1.5;
    else
      v9 = Width;
    v14 = v9 + 5.0;
    v15 = v12;
    v8 = Height;
  }
  else
  {
    v14 = 0.0;
  }
  v36 = -[NSArray count](v2->_photoViews, "count");
  photoViews = v2->_photoViews;
  if (v36 < 2)
  {
    if (-[NSArray count](photoViews, "count") != 1)
      goto LABEL_52;
    -[NSArray objectAtIndexedSubscript:](v2->_photoViews, "objectAtIndexedSubscript:", 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setFrame:", v14, 0.0, Width, Height);

    -[NSArray objectAtIndexedSubscript:](v2->_photoViews, "objectAtIndexedSubscript:", 0);
    v38 = v12;
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](photoViews, "objectAtIndexedSubscript:", 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setFrame:", v14, 0.0, (Width + -2.0) / 1.5, Height);
  }

LABEL_52:
  v40 = Width + -2.0 - v13;
  if (-[NSArray count](v2->_photoViews, "count") == 3)
  {
    Height = (Height + -2.0) * 0.5;
    v41 = v13 + v14 + 2.0;
    -[NSArray objectAtIndexedSubscript:](v2->_photoViews, "objectAtIndexedSubscript:", 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setFrame:", v41, 0.0, v40, Height);

    v43 = Height + 2.0;
    v44 = 2;
    -[NSArray objectAtIndexedSubscript:](v2->_photoViews, "objectAtIndexedSubscript:", 2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_56:
    objc_msgSend(v45, "setFrame:", v41, v43, v40, Height);

    -[NSArray objectAtIndexedSubscript:](v2->_photoViews, "objectAtIndexedSubscript:", v44);
    v46 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v46;
    goto LABEL_57;
  }
  if (-[NSArray count](v2->_photoViews, "count") == 2)
  {
    v41 = v13 + v14 + 2.0;
    v44 = 1;
    -[NSArray objectAtIndexedSubscript:](v2->_photoViews, "objectAtIndexedSubscript:", 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0.0;
    goto LABEL_56;
  }
LABEL_57:
  if (v2->_externalView)
    v47 = -[NSArray count](v2->_photoViews, "count") != 0;
  else
    v47 = 0;
  -[UIScrollView setAlwaysBounceHorizontal:](v2->_photosContainerScrollView, "setAlwaysBounceHorizontal:", v47);
LABEL_63:
  -[UIView setFrame:](v2->_externalView, "setFrame:", 0.0, 0.0, v9, v8, v58, v59);
  photosContainerScrollView = v2->_photosContainerScrollView;
  objc_msgSend(v12, "frame");
  MaxX = CGRectGetMaxX(v74);
  -[UIScrollView frame](v2->_photosContainerScrollView, "frame");
  -[UIScrollView setContentSize:](photosContainerScrollView, "setContentSize:", MaxX, CGRectGetHeight(v75));
  if (v2->_isRTL)
  {
    objc_msgSend(v12, "frame");
    v50 = CGRectGetMaxX(v76);
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v51 = v2->_photoViews;
    v52 = -[NSArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v53; ++i)
        {
          if (*(_QWORD *)v62 != v54)
            objc_enumerationMutation(v51);
          v56 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          objc_msgSend(v56, "frame");
          objc_msgSend(v56, "setFrame:", v50 - CGRectGetMaxX(v77), v77.origin.y, v77.size.width, v77.size.height);
        }
        v53 = -[NSArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
      }
      while (v53);
    }

    v57 = v2->_externalView;
    if (v57)
    {
      -[UIView frame](v57, "frame");
      -[UIView setFrame:](v2->_externalView, "setFrame:", v50 - CGRectGetMaxX(v78), v78.origin.y, v78.size.width, v78.size.height);
    }
    -[UIScrollView frame](v2->_photosContainerScrollView, "frame");
    -[UIScrollView setContentOffset:](v2->_photosContainerScrollView, "setContentOffset:", v50 - CGRectGetWidth(v79), 0.0);
  }

}

- (CGSize)sizeForIndex:(unint64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  if (self->_photosCount <= a3)
    -[MKPlacePhotosViewController _photoActionSize](self, "_photoActionSize");
  else
    -[MKPlacePhotosViewController _photoSizeForIndex:](self, "_photoSizeForIndex:");
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_photoActionSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 112.0;
  v3 = 170.0;
  if ((self->_primaryAttributionView != 0) != (self->_secondaryAttributionView != 0))
    v2 = 170.0;
  else
    v3 = 84.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)_photoSizeForIndex:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  double v11;
  double v12;
  _BOOL4 v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  CGSize result;

  if (self->_photosCount <= a3)
  {
    v13 = a3 != 0;
    v14 = 0xAAAAAAAAAAAAAAABLL * a3 - 0x5555555555555556 < 0x5555555555555555;
    if (v13 && v14)
      v11 = 84.0;
    else
      v11 = 170.0;
    if (v13 && v14)
      v12 = 112.0;
    else
      v12 = 170.0;
  }
  else
  {
    v5 = a3 % 3;
    if (a3 % 3)
    {
      -[NSArray objectAtIndexedSubscript:](self->_photos, "objectAtIndexedSubscript:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 == 1)
        v7 = 1;
      else
        v7 = -1;
      v8 = v7 + a3;
      if (v7 + a3 >= -[NSArray count](self->_photos, "count"))
        v9 = a3;
      else
        v9 = v8;
      -[NSArray objectAtIndexedSubscript:](self->_photos, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "format") == 2 && objc_msgSend(v10, "format") == 2)
      {
        v11 = 84.0;
        v12 = 112.0;
      }
      else
      {
        v12 = 84.0;
        v11 = 84.0;
      }

    }
    else
    {
      -[NSArray objectAtIndexedSubscript:](self->_photos, "objectAtIndexedSubscript:", a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "format");
      if (v16 == 2)
        v12 = 226.5;
      else
        v12 = dbl_18B2A9F00[v16 == 1];

      v11 = 170.0;
    }
  }
  v17 = v12;
  v18 = v11;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  CGRect v9;

  v8 = a3;
  objc_msgSend(v8, "contentOffset");
  v5 = v4;
  if (self->_isRTL)
  {
    objc_msgSend(v8, "contentSize");
    v7 = v6 - v5;
    objc_msgSend(v8, "frame");
    v5 = v7 - CGRectGetWidth(v9);
  }
  -[MKPlacePhotosViewController updateAttributionPositionWithOffset:](self, "updateAttributionPositionWithOffset:", v5);
  -[MKPlacePhotosViewController _updateChevronVisibility](self, "_updateChevronVisibility");

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  self->_photoScrollViewScrollingLeft = 0;
  self->_photoScrollViewScrollingRight = 0;
}

- (void)updateAttributionPositionWithOffset:(double)a3
{
  UIView *photosSmallAttributionsView;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  UIView *externalView;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  UIView *v18;
  double v19;
  double v20;
  void *v21;
  double lastPhotoScrollOffset;
  void *v23;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double MaxX;
  double v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  photosSmallAttributionsView = self->_photosSmallAttributionsView;
  if (!photosSmallAttributionsView)
    return;
  -[UIView intrinsicContentSize](photosSmallAttributionsView, "intrinsicContentSize");
  v7 = v6;
  v9 = v8;
  -[MKPlacePhotosViewController traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  if (v11 == 5)
  {
    externalView = self->_externalView;
    if (externalView)
    {
      -[UIView bounds](externalView, "bounds");
      v14 = v13 + 0.0;
    }
    else
    {
      v14 = 0.0;
    }
  }
  else
  {
    -[MKPlacePhotosViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "directionalLayoutMargins");
    v17 = v16;

    v18 = self->_externalView;
    if (v18)
    {
      -[UIView bounds](v18, "bounds");
      v20 = v19 + 5.0;
    }
    else
    {
      v20 = 0.0;
    }
    v14 = v17 + v20;
  }
  -[MKPlacePhotosViewController analyticsDelegate](self, "analyticsDelegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    lastPhotoScrollOffset = self->_lastPhotoScrollOffset;
    if (lastPhotoScrollOffset < a3 && !self->_photoScrollViewScrollingLeft)
    {
      self->_photoScrollViewScrollingLeft = 1;
      self->_photoScrollViewScrollingRight = 0;
      -[MKPlacePhotosViewController analyticsDelegate](self, "analyticsDelegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      v25 = 6048;
      goto LABEL_17;
    }
    if (lastPhotoScrollOffset > a3 && !self->_photoScrollViewScrollingRight)
    {
      self->_photoScrollViewScrollingLeft = 0;
      self->_photoScrollViewScrollingRight = 1;
      -[MKPlacePhotosViewController analyticsDelegate](self, "analyticsDelegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      v25 = 6049;
LABEL_17:
      objc_msgSend(v23, "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:actionRichProviderId:", v25, 0, 0, 0);

    }
  }
  self->_lastPhotoScrollOffset = a3;
  v26 = v14 - a3;
  if (v14 - a3 <= 0.0)
    v27 = 8.0;
  else
    v27 = v14 - a3 + 8.0;
  -[UIScrollView frame](self->_photosContainerScrollView, "frame", v26);
  v28 = CGRectGetHeight(v32) - v9 + -8.0;
  if (self->_isRTL)
  {
    -[MKPlacePhotosViewController view](self, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "frame");
    MaxX = CGRectGetMaxX(v33);

    v34.origin.x = v27;
    v34.origin.y = v28;
    v34.size.width = v7;
    v34.size.height = v9;
    v27 = MaxX - CGRectGetMaxX(v34) + -8.0;
  }
  -[UIView setFrame:](self->_photosSmallAttributionsView, "setFrame:", v27, v28, v7, v9);
  if (v28 < 0.0 || !self->_parentScrollView)
  {
    v31 = 0.0;
    if (v28 >= 0.0)
      v31 = 1.0;
    -[UIView setAlpha:](self->_photosSmallAttributionsView, "setAlpha:", v31);
  }
}

- (void)_catchScrollNotification:(id)a3
{
  UIScrollView *v4;
  UIScrollView *parentScrollView;

  objc_msgSend(a3, "object");
  v4 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
  parentScrollView = self->_parentScrollView;
  self->_parentScrollView = v4;

  -[MKPlacePhotosViewController _updateAlphaAttribution](self, "_updateAlphaAttribution");
}

- (void)_updateAlphaAttribution
{
  UIView *photosSmallAttributionsView;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v33;
  double MaxY;
  CGFloat rect;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  if (self->_parentScrollView)
  {
    photosSmallAttributionsView = self->_photosSmallAttributionsView;
    if (photosSmallAttributionsView)
    {
      -[UIView bounds](photosSmallAttributionsView, "bounds");
      v5 = v4;
      v7 = v6;
      v9 = v8;
      v11 = v10;
      -[UIScrollView bounds](self->_parentScrollView, "bounds");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v36.origin.x = v5;
      v36.origin.y = v7;
      v36.size.width = v9;
      v36.size.height = v11;
      MaxY = CGRectGetMaxY(v36);
      -[UIScrollView convertRect:fromView:](self->_parentScrollView, "convertRect:fromView:", self->_photosSmallAttributionsView, v5, v7, v9, v11);
      v21 = v20;
      v23 = v22;
      v25 = v24;
      rect = v26;
      v37.origin.x = v13;
      v37.origin.y = v15;
      v37.size.width = v17;
      v37.size.height = v19;
      v27 = CGRectGetMaxY(v37);
      v38.origin.x = v13;
      v38.origin.y = v15;
      v38.size.width = v17;
      v38.size.height = v19;
      v28 = CGRectGetMaxY(v38);
      v39.origin.x = v21;
      v39.origin.y = v23;
      v39.size.width = v25;
      v39.size.height = rect;
      v29 = CGRectGetMaxY(v39);
      -[UIView setHidden:](self->_photosSmallAttributionsView, "setHidden:", v29 >= v27);
      v31 = 0.0;
      if (v29 < v27)
      {
        v30 = v28 - MaxY;
        v31 = 1.0;
        if (v28 - MaxY <= v29 && v29 < v27)
        {
          v33 = (v29 - v30) / MaxY;
          v30 = 1.0;
          v31 = 1.0 - v33;
        }
      }
      -[UIView setAlpha:](self->_photosSmallAttributionsView, "setAlpha:", v31, v30);
    }
  }
}

- (void)_scrollPrevious
{
  -[MKPlacePhotosViewController _adjustScrollIndexByOffset:](self, "_adjustScrollIndexByOffset:", -1);
}

- (void)_scrollNext
{
  -[MKPlacePhotosViewController _adjustScrollIndexByOffset:](self, "_adjustScrollIndexByOffset:", 1);
}

- (void)_adjustScrollIndexByOffset:(int64_t)a3
{
  double Width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[6];
  CGRect v13;

  -[UIScrollView frame](self->_photosContainerScrollView, "frame");
  Width = CGRectGetWidth(v13);
  -[UIScrollView contentOffset](self->_photosContainerScrollView, "contentOffset");
  v7 = round(v6 / Width);
  -[UIScrollView contentSize](self->_photosContainerScrollView, "contentSize");
  v9 = v8 - Width;
  v10 = v7 + (double)a3;
  if (v10 < 0.0)
    v10 = 0.0;
  v11 = Width * v10;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__MKPlacePhotosViewController__adjustScrollIndexByOffset___block_invoke;
  v12[3] = &unk_1E20D7DC0;
  if (v11 < v9)
    v9 = v11;
  v12[4] = self;
  *(double *)&v12[5] = v9;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v12, 0.2);
}

uint64_t __58__MKPlacePhotosViewController__adjustScrollIndexByOffset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setContentOffset:", *(double *)(a1 + 40), 0.0);
}

- (void)handleHover:(id)a3
{
  -[MKPlacePhotosViewController setHoverActive:](self, "setHoverActive:", (unint64_t)(objc_msgSend(a3, "state") - 1) < 2);
}

- (void)setHoverActive:(BOOL)a3
{
  if (self->_hoverActive != a3)
  {
    self->_hoverActive = a3;
    -[MKPlacePhotosViewController _updateChevronVisibility](self, "_updateChevronVisibility");
  }
}

- (void)_updateChevronVisibility
{
  double Width;
  double v4;
  double v5;
  double v6;
  BOOL v7;
  double v8;
  _QWORD v9[5];
  BOOL v10;
  BOOL v11;
  CGRect v12;

  -[UIScrollView frame](self->_photosContainerScrollView, "frame");
  Width = CGRectGetWidth(v12);
  -[UIScrollView contentSize](self->_photosContainerScrollView, "contentSize");
  v5 = v4 - Width;
  -[UIScrollView contentOffset](self->_photosContainerScrollView, "contentOffset");
  v7 = v6 <= 0.0;
  -[UIScrollView contentOffset](self->_photosContainerScrollView, "contentOffset");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__MKPlacePhotosViewController__updateChevronVisibility__block_invoke;
  v9[3] = &unk_1E20DB5B0;
  v9[4] = self;
  v10 = v7;
  v11 = v8 >= v5;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v9, 0.2);
}

uint64_t __55__MKPlacePhotosViewController__updateChevronVisibility__block_invoke(uint64_t a1)
{
  int v2;
  double v3;
  double v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hoverActive");
  v3 = 0.0;
  v4 = 0.0;
  if (v2 && !*(_BYTE *)(a1 + 40))
    v4 = 1.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "setAlpha:", v4);
  if (objc_msgSend(*(id *)(a1 + 32), "hoverActive"))
  {
    if (*(_BYTE *)(a1 + 41))
      v3 = 0.0;
    else
      v3 = 1.0;
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "setAlpha:", v3);
}

- (void)infoCardThemeChanged
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKPlacePhotosViewController;
  -[UIViewController infoCardThemeChanged](&v6, sel_infoCardThemeChanged);
  -[UIViewController mk_theme](self, "mk_theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlacePhotosViewController _updatePhotoBackgroundColor:](self, "_updatePhotoBackgroundColor:", v3);

  -[MKPlacePhotosViewController updateAttributionCell](self, "updateAttributionCell");
  -[UIViewController mk_theme](self, "mk_theme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "separatorLineColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_bottomHairline, "setBackgroundColor:", v5);

}

- (void)_updatePhotoBackgroundColor:(id)a3
{
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "normalBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_photoViews;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_mapkit_setBackgroundColor:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_cancelLoadPhotos
{
  NSUInteger v3;
  unint64_t photosCount;
  uint64_t i;
  void *v6;
  id v7;
  void *v8;
  double Width;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  CGRect v16;

  if (self->_photoLoaded)
  {
    v3 = -[NSArray count](self->_photoViews, "count");
    photosCount = self->_photosCount;
    if (v3 < photosCount)
      photosCount = -[NSArray count](self->_photoViews, "count");
    if (photosCount)
    {
      for (i = 0; i != photosCount; ++i)
      {
        -[NSArray objectAtIndexedSubscript:](self->_photoViews, "objectAtIndexedSubscript:", i);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v7 = v6;
          -[NSArray objectAtIndex:](self->_photos, "objectAtIndex:", i);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "frame");
          Width = CGRectGetWidth(v16);
          if (Width <= 0.0)
          {
            v13 = 100.0;
          }
          else
          {
            v10 = Width;
            +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "screenScale");
            v13 = v10 * v12;

          }
          objc_msgSend(v8, "urlForBestPhotoForSize:", v13, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            +[MKAppImageManager sharedImageManager](MKAppImageManager, "sharedImageManager");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "cancelLoadAppImageAtURL:", v14);

          }
        }

      }
    }
  }
}

- (void)_loadPhotos
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  double Width;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  NSUInteger v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;
  CGRect v23;

  if (!self->_photoLoaded || self->_loadAppImageCanceledOrFailed)
  {
    self->_photoLoaded = 1;
    self->_loadAppImageCanceledOrFailed = 0;
    v3 = -[NSArray count](self->_photoViews, "count");
    if (v3)
    {
      v4 = v3;
      v5 = 0;
      v6 = 0;
      v18 = v3;
      do
      {
        -[NSArray objectAtIndexedSubscript:](self->_photoViews, "objectAtIndexedSubscript:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = v7;
          -[NSArray objectAtIndex:](self->_photos, "objectAtIndex:", v6);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "frame");
          Width = CGRectGetWidth(v23);
          if (Width <= 0.0)
          {
            v14 = 100.0;
          }
          else
          {
            v11 = Width;
            +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "screenScale");
            v14 = v11 * v13;

          }
          objc_msgSend(v9, "urlForBestPhotoForSize:", v14, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(v8, "image");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v16)
            {
              objc_initWeak(&location, self);
              +[MKAppImageManager sharedImageManager](MKAppImageManager, "sharedImageManager");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v19[0] = MEMORY[0x1E0C809B0];
              v19[1] = 3221225472;
              v19[2] = __42__MKPlacePhotosViewController__loadPhotos__block_invoke;
              v19[3] = &unk_1E20DB5D8;
              objc_copyWeak(&v21, &location);
              v20 = v8;
              objc_msgSend(v17, "loadAppImageAtURL:completionHandler:", v15, v19);

              objc_destroyWeak(&v21);
              objc_destroyWeak(&location);
            }
          }
          ++v6;

          v4 = v18;
        }

        ++v5;
      }
      while (v4 != v5);
    }
  }
}

void __42__MKPlacePhotosViewController__loadPhotos__block_invoke(uint64_t a1, void *a2, uint64_t a3, char a4, uint64_t a5)
{
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    if (!a5 && (a4 & 1) != 0 || (*((_BYTE *)WeakRetained + 1052) = 1, !*((_BYTE *)WeakRetained + 1176)))
    {
      v11 = (void *)MEMORY[0x1E0CEABB0];
      v12 = *(void **)(a1 + 32);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __42__MKPlacePhotosViewController__loadPhotos__block_invoke_2;
      v13[3] = &unk_1E20D7E58;
      v14 = v12;
      v15 = v8;
      objc_msgSend(v11, "transitionWithView:duration:options:animations:completion:", v14, 5242880, v13, 0, 0.200000003);

    }
  }

}

uint64_t __42__MKPlacePhotosViewController__loadPhotos__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setImage:", *(_QWORD *)(a1 + 40));
}

- (void)_photoSelected:(id)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  NSArray *photoViews;
  id v14;
  _QWORD v15[7];
  CGPoint v16;
  CGRect v17;

  objc_msgSend(a3, "locationInView:", self->_photosContainer);
  v5 = v4;
  v7 = v6;
  if (self->_externalView)
  {
    -[MKLookAroundContainerView lookAroundViewIfPresent](self->_lookAroundContainerView, "lookAroundViewIfPresent");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[MKLookAroundContainerView frame](self->_lookAroundContainerView, "frame");
    v16.x = v5;
    v16.y = v7;
    if (CGRectContainsPoint(v17, v16))
    {
      objc_msgSend(v14, "jumpToCloseUpView");
      -[MKPlacePhotosViewController photosControllerDelegate](self, "photosControllerDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        -[MKPlacePhotosViewController photosControllerDelegate](self, "photosControllerDelegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "placeCardPhotosController:enterLookAroundForMapItem:lookAroundView:", self, self->_mapItem, v14);

      }
      return;
    }

  }
  -[MKPlacePhotosViewController photosControllerDelegate](self, "photosControllerDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    photoViews = self->_photoViews;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __46__MKPlacePhotosViewController__photoSelected___block_invoke;
    v15[3] = &unk_1E20DB600;
    *(CGFloat *)&v15[5] = v5;
    *(CGFloat *)&v15[6] = v7;
    v15[4] = self;
    -[NSArray enumerateObjectsUsingBlock:](photoViews, "enumerateObjectsUsingBlock:", v15);
  }
}

uint64_t __46__MKPlacePhotosViewController__photoSelected___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  CGRect v6;

  objc_msgSend(a2, "frame");
  result = CGRectContainsPoint(v6, *(CGPoint *)(a1 + 40));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_photoTappedAtIndex:", a3);
  return result;
}

- (void)_photoTappedAtIndex:(unint64_t)a3
{
  MKPhotoBigAttributionView *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[MKPlacePhotosViewController analyticsDelegate](self, "analyticsDelegate");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_photoViews, "count") > a3)
  {
    -[NSArray objectAtIndexedSubscript:](self->_photoViews, "objectAtIndexedSubscript:", a3);
    v5 = (MKPhotoBigAttributionView *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (self->_secondaryAttributionView == v5)
      {
        -[MKPlacePhotosViewController didTapSecondaryAttributionViewWithPresentingViewController:](self, "didTapSecondaryAttributionViewWithPresentingViewController:", self);
      }
      else if (self->_primaryAttributionView == v5)
      {
        -[MKPlacePhotosViewController didTapPrimaryAttributionViewWithPresentingViewController:](self, "didTapPrimaryAttributionViewWithPresentingViewController:", self);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MKPlacePhotosViewController photosControllerDelegate](self, "photosControllerDelegate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_opt_respondsToSelector();

        if ((v7 & 1) != 0)
        {
          -[NSArray objectAtIndex:](self->_photos, "objectAtIndex:", a3);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKPlacePhotosViewController photosControllerDelegate](self, "photosControllerDelegate");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "photoID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "placeCardPhotosController:didSelectViewPhotoWithID:presentingViewController:", self, v10, self);

        }
        else
        {
          v8 = 0;
        }
        if (self->_canUseFullscreenViewer)
          v11 = 6006;
        else
          v11 = 6018;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "attribution");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "providerID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:actionRichProviderId:", v11, v12, 173, v14);

      }
    }

  }
}

- (void)didTapSecondaryAttributionViewWithPresentingViewController:(id)a3
{
  -[MKPlacePhotosViewController _didTapAttributionViewWithPresentingViewController:photoAttributionView:](self, "_didTapAttributionViewWithPresentingViewController:photoAttributionView:", a3, self->_secondaryAttributionView);
}

- (void)didTapPrimaryAttributionViewWithPresentingViewController:(id)a3
{
  -[MKPlacePhotosViewController _didTapAttributionViewWithPresentingViewController:photoAttributionView:](self, "_didTapAttributionViewWithPresentingViewController:photoAttributionView:", a3, self->_primaryAttributionView);
}

- (void)_didTapAttributionViewWithPresentingViewController:(id)a3 photoAttributionView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v6 = a4;
  if (v6)
  {
    -[MKPlacePhotosViewController analyticsDelegate](self, "analyticsDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "type"))
    {
      if (-[MKPlacePhotosViewController isFirstParty](self, "isFirstParty"))
        objc_msgSend(v7, "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:actionRichProviderId:", 6102, CFSTR("photo slider"), 0, 0);
      -[MKMapItem _mapkit_preferredFirstPhotoVendor](self->_mapItem, "_mapkit_preferredFirstPhotoVendor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "providerID");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "mapItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_attribution");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "providerID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:actionRichProviderId:", 6023, v9, 0, v12);

      -[MKPlacePhotosViewController photosControllerDelegate](self, "photosControllerDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v9) = objc_opt_respondsToSelector();

      if ((v9 & 1) == 0)
        goto LABEL_11;
      -[MKPlacePhotosViewController photosControllerDelegate](self, "photosControllerDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "placeCardActionControllerDidSelectViewAllPhotos:presentingViewController:", 0, v21);
    }
    else
    {
      -[MKPlacePhotosViewController photosControllerDelegate](self, "photosControllerDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        objc_msgSend(v7, "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:actionRichProviderId:", 2147, CFSTR("photo slider"), 0, 0);
        -[MKPlacePhotosViewController photosControllerDelegate](self, "photosControllerDelegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "placeCardActionControllerDidSelectAddPhoto:presentingViewController:sourceView:", 0, v21, v6);
      }
      else
      {
        -[MKMapItem _mapkit_preferredFirstPhotoVendor](self->_mapItem, "_mapkit_preferredFirstPhotoVendor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "providerID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "mapItem");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "_attribution");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "providerID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:actionRichProviderId:", 6025, v17, 174, v20);

      }
    }

LABEL_11:
  }

}

- (void)lookAroundContainerView:(id)a3 didAddLookAroundView:(id)a4
{
  void *v5;
  uint64_t v6;
  int64_t v7;
  BOOL v8;
  void *v9;
  id v10;

  v10 = a4;
  -[MKPlacePhotosViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 != 5)
  {
    v7 = -[UIViewController contentVisibility](self, "contentVisibility");
    if (v7 == 2)
    {
      objc_msgSend(v10, "moveToStandOffView");
      goto LABEL_7;
    }
    v8 = v7 == 3;
    v9 = v10;
    if (!v8)
      goto LABEL_8;
  }
  objc_msgSend(v10, "moveToCloseUpView");
LABEL_7:
  v9 = v10;
LABEL_8:

}

- (void)_logUGCAction:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (-[MKPlacePhotosViewController isFirstParty](self, "isFirstParty"))
    objc_msgSend(MEMORY[0x1E0D263E8], "captureUGCUserAction:target:value:photoSources:", v3, 612, 0, 0);
}

- (id)infoCardChildPossibleActions
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_externalView)
    objc_msgSend(v3, "addObject:", &unk_1E2158C50);
  if (-[NSArray count](self->_photoViews, "count"))
  {
    v5 = 0;
    do
    {
      if (self->_canUseFullscreenViewer)
        v6 = &unk_1E2158C80;
      else
        v6 = &unk_1E2158C68;
      objc_msgSend(v4, "addObject:", v6);
      ++v5;
    }
    while (v5 < -[NSArray count](self->_photoViews, "count"));
  }
  return v4;
}

- (id)infoCardChildUnactionableUIElements
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)setContentVisibility:(int64_t)a3
{
  void *v5;
  uint64_t v6;

  -[MKPlacePhotosViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 != 5)
    -[MKPlacePhotosViewController _setContentVisibility:](self, "_setContentVisibility:", a3);
}

- (void)_setContentVisibility:(int64_t)a3
{
  int64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  char v11;
  objc_super v12;

  v5 = -[UIViewController contentVisibility](self, "contentVisibility");
  v12.receiver = self;
  v12.super_class = (Class)MKPlacePhotosViewController;
  -[UIViewController setContentVisibility:](&v12, sel_setContentVisibility_, a3);
  if (v5 != a3)
  {
    -[MKLookAroundContainerView lookAroundViewIfPresent](self->_lookAroundContainerView, "lookAroundViewIfPresent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlacePhotosViewController photosControllerDelegate](self, "photosControllerDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[MKPlacePhotosViewController photosControllerDelegate](self, "photosControllerDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "shouldMoveLookAroundStorefrontViewForPlaceCardPhotosController:", self);

      v11 = v10 ^ 1;
      if (!v6)
        goto LABEL_11;
    }
    else
    {
      v11 = 0;
      if (!v6)
      {
LABEL_11:

        return;
      }
    }
    if ((v11 & 1) == 0)
    {
      if (a3 == 2)
      {
        objc_msgSend(v6, "moveToStandOffView");
      }
      else if (a3 == 3)
      {
        objc_msgSend(v6, "moveToCloseUpView");
      }
    }
    goto LABEL_11;
  }
}

- (void)viewLayoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKPlacePhotosViewController;
  -[MKPlacePhotosViewController viewLayoutMarginsDidChange](&v3, sel_viewLayoutMarginsDidChange);
  -[MKPlacePhotosViewController scrollViewDidScroll:](self, "scrollViewDidScroll:", self->_photosContainerScrollView);
}

- (void)viewDidLayoutSubviews
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKPlacePhotosViewController;
  -[MKPlacePhotosViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  -[MKPlacePhotosViewController layoutImages](self, "layoutImages");
  -[UIView alpha](self->_photosSmallAttributionsView, "alpha");
  if (v3 == 0.0)
    -[MKPlacePhotosViewController updateAttributionPositionWithOffset:](self, "updateAttributionPositionWithOffset:", 0.0);
  -[MKPlacePhotosViewController _loadPhotos](self, "_loadPhotos");
}

- (_MKPlaceViewController)owner
{
  return (_MKPlaceViewController *)objc_loadWeakRetained((id *)&self->_owner);
}

- (void)setOwner:(id)a3
{
  objc_storeWeak((id *)&self->_owner, a3);
}

- (MKPlaceCardPhotosControllerDelegate)photosControllerDelegate
{
  return (MKPlaceCardPhotosControllerDelegate *)objc_loadWeakRetained((id *)&self->_photosControllerDelegate);
}

- (void)setPhotosControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_photosControllerDelegate, a3);
}

- (BOOL)showsBottomHairline
{
  return self->_showsBottomHairline;
}

- (BOOL)hoverActive
{
  return self->_hoverActive;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_photosControllerDelegate);
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_parentScrollView, 0);
  objc_storeStrong((id *)&self->_lookAroundContainerView, 0);
  objc_storeStrong((id *)&self->_nextPageButton, 0);
  objc_storeStrong((id *)&self->_previousPageButton, 0);
  objc_storeStrong((id *)&self->_attributionCell, 0);
  objc_storeStrong((id *)&self->_photos, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_externalView, 0);
  objc_storeStrong((id *)&self->_attributionClippingview, 0);
  objc_storeStrong((id *)&self->_photosSmallAttributionsView, 0);
  objc_storeStrong((id *)&self->_photosContainer, 0);
  objc_storeStrong((id *)&self->_photosContainerScrollView, 0);
  objc_storeStrong((id *)&self->_photoViews, 0);
  objc_storeStrong((id *)&self->_secondaryAttributionView, 0);
  objc_storeStrong((id *)&self->_primaryAttributionView, 0);
  objc_storeStrong((id *)&self->_imageViewForTransition, 0);
  objc_storeStrong((id *)&self->_bottomHairline, 0);
}

@end
