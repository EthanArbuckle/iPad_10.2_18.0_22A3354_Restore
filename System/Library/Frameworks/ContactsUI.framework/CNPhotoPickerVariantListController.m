@implementation CNPhotoPickerVariantListController

- (CNPhotoPickerVariantListController)initWithVariantsManager:(id)a3 originalItem:(id)a4
{
  return -[CNPhotoPickerVariantListController initWithVariantsManager:originalItem:selectedVariantIdentifier:](self, "initWithVariantsManager:originalItem:selectedVariantIdentifier:", a3, a4, 0);
}

- (CNPhotoPickerVariantListController)initWithVariantsManager:(id)a3 originalItem:(id)a4 selectedVariantIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNPhotoPickerVariantListController *v12;
  CNPhotoPickerVariantListController *v13;
  uint64_t v14;
  id numberOfItemsPerRowProvider;
  CNPhotoPickerVariantListController *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CNPhotoPickerVariantListController;
  v12 = -[CNPhotoPickerVariantListController initWithNibName:bundle:](&v18, sel_initWithNibName_bundle_, 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_variantsManager, a3);
    objc_storeStrong((id *)&v13->_originalItem, a4);
    v14 = objc_msgSend(&__block_literal_global_33135, "copy");
    numberOfItemsPerRowProvider = v13->_numberOfItemsPerRowProvider;
    v13->_numberOfItemsPerRowProvider = (id)v14;

    v13->_cellStyle = 1;
    v13->_shouldShowCaptions = objc_msgSend(v10, "shouldShowCaption");
    objc_storeStrong((id *)&v13->_selectedVariantIdentifier, a5);
    v13->_showsSelection = 1;
    v16 = v13;
  }

  return v13;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CNPhotoPickerVariantListController;
  -[CNPhotoPickerVariantListController viewDidLoad](&v20, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerVariantListController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[CNPhotoPickerVariantListController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInsetsLayoutMarginsFromSafeArea:", 0);

  -[CNPhotoPickerVariantListController originalItem](self, "originalItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CNPhotoPickerVariantListController originalItem](self, "originalItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedVariantsTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerVariantListController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:", v8);

  }
  if (-[CNPhotoPickerVariantListController showPreview](self, "showPreview"))
  {
    -[CNPhotoPickerVariantListController buildHeader](self, "buildHeader");
    -[CNPhotoPickerVariantListController originalItem](self, "originalItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerVariantListController updatePreviewWithItem:](self, "updatePreviewWithItem:", v10);

  }
  -[CNPhotoPickerVariantListController buildCollectionView](self, "buildCollectionView");
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancel_);
  -[CNPhotoPickerVariantListController navigationItem](self, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLeftBarButtonItem:", v11);

  v13 = objc_alloc(MEMORY[0x1E0DC34F0]);
  -[CNPhotoPickerVariantListController rightBarButtonTitle](self, "rightBarButtonTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithTitle:style:target:action:", v14, 2, self, sel_didFinishSelectingVariant);
  -[CNPhotoPickerVariantListController navigationItem](self, "navigationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setRightBarButtonItem:", v15);

  -[CNPhotoPickerVariantListController navigationItem](self, "navigationItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rightBarButtonItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setEnabled:", 0);

  -[CNPhotoPickerVariantListController generateProviderItems](self, "generateProviderItems");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObserver:selector:name:object:", self, sel_contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CNPhotoPickerVariantListController;
  -[CNPhotoPickerVariantListController viewWillAppear:](&v15, sel_viewWillAppear_, a3);
  -[CNPhotoPickerVariantListController selectedVariantIdentifier](self, "selectedVariantIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    -[CNPhotoPickerVariantListController originalItem](self, "originalItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "imageType");

    if (v7 == 1)
      v5 = 0;
    else
      v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[CNPhotoPickerVariantListController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathsForSelectedItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {

  }
  else
  {
    -[CNPhotoPickerVariantListController selectedVariantIdentifier](self, "selectedVariantIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_11;
    -[CNPhotoPickerVariantListController providerItems](self, "providerItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __53__CNPhotoPickerVariantListController_viewWillAppear___block_invoke;
    v14[3] = &unk_1E204F1C8;
    v14[4] = self;
    v5 = objc_msgSend(v8, "_cn_indexOfFirstObjectPassingTest:", v14);
  }

LABEL_11:
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v5, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerVariantListController collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "selectItemAtIndexPath:animated:scrollPosition:", v11, 0, 2);

    -[CNPhotoPickerVariantListController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerVariantListController collectionView:didSelectItemAtIndexPath:](self, "collectionView:didSelectItemAtIndexPath:", v13, v11);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNPhotoPickerVariantListController;
  -[CNPhotoPickerVariantListController viewDidAppear:](&v9, sel_viewDidAppear_, a3);
  -[CNPhotoPickerVariantListController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForSelectedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    -[CNPhotoPickerVariantListController selectedVariantIdentifier](self, "selectedVariantIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

    }
    else
    {
      v7 = -[CNPhotoPickerVariantListController commitsChangesOnSelection](self, "commitsChangesOnSelection");

      if (v7)
        return;
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPhotoPickerVariantListController collectionView](self, "collectionView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "selectItemAtIndexPath:animated:scrollPosition:", v4, 0, 0);

      -[CNPhotoPickerVariantListController collectionView](self, "collectionView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPhotoPickerVariantListController collectionView:didSelectItemAtIndexPath:](self, "collectionView:didSelectItemAtIndexPath:", v5, v4);
    }
  }

}

- (void)buildHeader
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double x;
  double y;
  double width;
  double height;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  id v22;
  CGFloat v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
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
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD v66[10];
  CGRect v67;
  CGRect v68;
  CGRect v69;

  v66[8] = *MEMORY[0x1E0C80C00];
  -[CNPhotoPickerVariantListController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, v5, 100.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNPhotoPickerVariantListController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v6);

  -[CNPhotoPickerVariantListController setHeaderView:](self, "setHeaderView:", v6);
  v67.origin.x = 0.0;
  v67.origin.y = 0.0;
  v67.size.width = v5;
  v67.size.height = 100.0;
  v68 = CGRectInset(v67, 20.0, 20.0);
  x = v68.origin.x;
  y = v68.origin.y;
  width = v68.size.width;
  height = v68.size.height;
  -[CNPhotoPickerVariantListController originalItem](self, "originalItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPhotoPickerPreviewView pickerPreviewWithFrame:forItem:](CNPhotoPickerPreviewView, "pickerPreviewWithFrame:forItem:", v13, x, y, width, height);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v14, "setClipsToBounds:", 1);
  objc_msgSend(v6, "addSubview:", v14);
  v15 = v14;
  -[CNPhotoPickerVariantListController setPosePreview:](self, "setPosePreview:", v14);
  -[CNPhotoPickerVariantListController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "window");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "screen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "scale");
  v20 = v19;

  if (v20 <= 0.0)
    v21 = 1.0;
  else
    v21 = 1.0 / v20;
  v22 = objc_alloc(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v6, "frame");
  v23 = CGRectGetMaxY(v69) - v21;
  objc_msgSend(v6, "bounds");
  v24 = (void *)objc_msgSend(v22, "initWithFrame:", 0.0, v23);
  +[CNUIColorRepository photoPickerBackgroundColor](CNUIColorRepository, "photoPickerBackgroundColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setBackgroundColor:", v25);

  +[CNUIColorRepository photoPickerBackgroundShadowColor](CNUIColorRepository, "photoPickerBackgroundShadowColor");
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v27 = objc_msgSend(v26, "CGColor");
  objc_msgSend(v24, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setShadowColor:", v27);

  objc_msgSend(v24, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v30) = 1.0;
  objc_msgSend(v29, "setShadowOpacity:", v30);

  objc_msgSend(v24, "layer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setShadowOffset:", 0.0, 1.0);

  objc_msgSend(v24, "layer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setShadowRadius:", 0.5);

  objc_msgSend(v24, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setMasksToBounds:", 0);

  v64 = v24;
  objc_msgSend(v24, "setAutoresizingMask:", 10);
  objc_msgSend(v6, "addSubview:", v24);
  -[CNPhotoPickerVariantListController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerVariantListController view](self, "view");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "safeAreaLayoutGuide");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "topAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:", v61);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v60;
  objc_msgSend(v6, "heightAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "heightAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:multiplier:", v58, 0.3);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v56;
  objc_msgSend(v6, "leftAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v34;
  objc_msgSend(v34, "leftAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v54);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v66[2] = v53;
  objc_msgSend(v6, "rightAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "rightAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v51);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v66[3] = v49;
  v35 = v15;
  objc_msgSend(v15, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, 20.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v66[4] = v46;
  v50 = v15;
  objc_msgSend(v15, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:constant:", v36, -20.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v66[5] = v37;
  objc_msgSend(v15, "centerXAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "centerXAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v66[6] = v40;
  objc_msgSend(v35, "widthAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "heightAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v66[7] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 8);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "addConstraints:", v44);

}

- (void)buildCollectionView
{
  id v3;
  _BOOL4 v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[6];
  CGRect v42;

  v41[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  v4 = -[CNPhotoPickerVariantListController shouldShowCaptions](self, "shouldShowCaptions");
  v5 = 20.0;
  if (v4)
    v5 = 18.0;
  objc_msgSend(v3, "setMinimumLineSpacing:", v5);
  objc_msgSend(v3, "setMinimumInteritemSpacing:", 20.0);
  objc_msgSend(v3, "setScrollDirection:", 0);
  objc_msgSend(v3, "setSectionInsetReference:", 1);
  -[CNPhotoPickerVariantListController sectionHeaderView](self, "sectionHeaderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    objc_msgSend(v3, "setHeaderReferenceSize:", CGRectGetWidth(v42), 50.0);

  }
  v8 = (void *)objc_opt_class();
  -[CNPhotoPickerVariantListController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v14 = (double)objc_msgSend(v8, "topMarginForBounds:shouldShowCaptions:", -[CNPhotoPickerVariantListController shouldShowCaptions](self, "shouldShowCaptions"), v10, v11, v12, v13);

  objc_msgSend(v3, "setSectionInset:", v14, 16.0, 20.0, 16.0);
  v15 = objc_alloc(MEMORY[0x1E0DC35B8]);
  -[CNPhotoPickerVariantListController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v17 = (void *)objc_msgSend(v15, "initWithFrame:collectionViewLayout:", v3);

  objc_msgSend(v17, "setDelegate:", self);
  objc_msgSend(v17, "setDataSource:", self);
  v18 = objc_opt_class();
  +[CNPhotoPickerCollectionViewCell cellIdentifier](CNPhotoPickerCollectionViewCell, "cellIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "registerClass:forCellWithReuseIdentifier:", v18, v19);

  objc_msgSend(v17, "setClipsToBounds:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBackgroundColor:", v20);

  objc_msgSend(v17, "setAlwaysBounceVertical:", 1);
  objc_msgSend(v17, "setContentInsetAdjustmentBehavior:", 2);
  objc_msgSend(v17, "setContentInset:", 0.0, 16.0, 0.0, 16.0);
  -[CNPhotoPickerVariantListController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", v17);

  -[CNPhotoPickerVariantListController headerView](self, "headerView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNPhotoPickerVariantListController view](self, "view");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerVariantListController headerView](self, "headerView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v36;
    objc_msgSend(v17, "leftAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerVariantListController view](self, "view");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "leftAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v32;
    objc_msgSend(v17, "rightAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerVariantListController view](self, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "rightAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v41[2] = v24;
    objc_msgSend(v17, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerVariantListController view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v41[3] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addConstraints:", v29);

  }
  else
  {
    objc_msgSend(v17, "setAutoresizingMask:", 18);
  }
  -[CNPhotoPickerVariantListController setCollectionView:](self, "setCollectionView:", v17);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNPhotoPickerVariantListController;
  -[CNPhotoPickerVariantListController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  -[CNPhotoPickerVariantListController updateFlowLayoutItemSize](self, "updateFlowLayoutItemSize");
  -[CNPhotoPickerVariantListController posePreview](self, "posePreview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNPhotoPickerVariantListController posePreview](self, "posePreview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutIfNeeded");

  }
}

- (NSString)variantsDisplayTitle
{
  void *v2;
  void *v3;

  -[CNPhotoPickerVariantListController originalItem](self, "originalItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedVariantsTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)updateForNewOriginalItem:(id)a3
{
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[CNPhotoPickerVariantListController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForSelectedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)&self->_originalItem, a3);
  -[CNPhotoPickerVariantListController generateProviderItems](self, "generateProviderItems");
  if (objc_msgSend(v6, "count"))
  {
    v7 = -[NSArray count](self->_providerItems, "count");
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "item");

    if (v7 > v9)
    {
      -[CNPhotoPickerVariantListController collectionView](self, "collectionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "selectItemAtIndexPath:animated:scrollPosition:", v11, 0, 0);

    }
  }

}

- (void)updateFlowLayoutItemSize
{
  void *v3;
  uint64_t (**v4)(_QWORD);
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  id v15;

  -[CNPhotoPickerVariantListController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewLayout");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[CNPhotoPickerVariantListController numberOfItemsPerRowProvider](self, "numberOfItemsPerRowProvider");
  v4 = (uint64_t (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerVariantListController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v6 = v4[2](v4);

  -[CNPhotoPickerVariantListController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;

  objc_msgSend(v15, "minimumInteritemSpacing");
  *(float *)&v10 = (v9 - (double)(v6 - 1) * v10 + -64.0) / (double)v6;
  v11 = floorf(*(float *)&v10);
  v12 = v11;
  if (-[CNPhotoPickerVariantListController shouldShowCaptions](self, "shouldShowCaptions"))
  {
    +[CNUIFontRepository contactCardPhotoPickerCaptionFont](CNUIFontRepository, "contactCardPhotoPickerCaptionFont");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lineHeight");
    v12 = v14 * 2.0 + 8.0 + v11;

  }
  objc_msgSend(v15, "setItemSize:", v11, v12);
  objc_msgSend(v15, "invalidateLayout");

}

- (void)generateProviderItems
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  -[CNPhotoPickerVariantListController originalItem](self, "originalItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerVariantListController variantsManager](self, "variantsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createVariantsItemsWithVariantsManager:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__CNPhotoPickerVariantListController_generateProviderItems__block_invoke;
  v7[3] = &unk_1E204C1A8;
  v7[4] = self;
  objc_msgSend(v6, "_cn_each:", v7);
  -[CNPhotoPickerVariantListController setProviderItems:](self, "setProviderItems:", v6);
  -[CNPhotoPickerVariantListController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

}

- (void)cancel:(id)a3
{
  void *v4;
  id v5;

  -[CNPhotoPickerVariantListController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNPhotoPickerVariantListController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoPickerVariantListControllerDidCancel:", self);

  }
  else
  {
    -[CNPhotoPickerVariantListController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void)didFinishSelectingVariant
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  -[CNPhotoPickerVariantListController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNPhotoPickerVariantListController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "indexPathsForSelectedItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNPhotoPickerVariantListController providerItems](self, "providerItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __63__CNPhotoPickerVariantListController_didFinishSelectingVariant__block_invoke;
    v10[3] = &unk_1E2050400;
    v10[4] = self;
    v11 = v8;
    v9 = v8;
    objc_msgSend(v9, "applyVariantEffectToFullsizeImageWithCompletion:", v10);

  }
}

- (void)updatePreviewWithItem:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[CNPhotoPickerVariantListController showPreview](self, "showPreview"))
  {
    -[CNPhotoPickerVariantListController posePreview](self, "posePreview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updatePreviewWithItem:", v5);

  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[CNPhotoPickerVariantListController providerItems](self, "providerItems", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t, int);
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;

  v6 = a4;
  v7 = a3;
  +[CNPhotoPickerCollectionViewCell cellIdentifier](CNPhotoPickerCollectionViewCell, "cellIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setCellStyle:", -[CNPhotoPickerVariantListController cellStyle](self, "cellStyle"));
  objc_msgSend(v9, "setDisplaySelection:", -[CNPhotoPickerVariantListController showsSelection](self, "showsSelection"));
  +[CNUIColorRepository photoPickerAvatarBackgroundDefaultColor](CNUIColorRepository, "photoPickerAvatarBackgroundDefaultColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTintColor:", v10);

  objc_msgSend(v7, "indexPathsForSelectedItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setSelected:", objc_msgSend(v11, "containsObject:", v6));
  -[CNPhotoPickerVariantListController providerItems](self, "providerItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v6, "row");

  objc_msgSend(v12, "objectAtIndexedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __76__CNPhotoPickerVariantListController_collectionView_cellForItemAtIndexPath___block_invoke;
  v26[3] = &unk_1E204D958;
  v27 = v9;
  v21 = v15;
  v22 = 3221225472;
  v23 = __76__CNPhotoPickerVariantListController_collectionView_cellForItemAtIndexPath___block_invoke_2;
  v24 = &unk_1E204C1D0;
  v16 = v27;
  v25 = v16;
  objc_msgSend(v14, "thumbnailViewWithPlaceholderProvider:completion:", v26, &v21);
  if (-[CNPhotoPickerVariantListController shouldShowCaptions](self, "shouldShowCaptions", v21, v22, v23, v24))
  {
    objc_msgSend(v14, "localizedVariantDisplayName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "updateWithCaption:", v17);

  }
  v18 = v25;
  v19 = v16;

  return v19;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  objc_msgSend(a3, "indexPathsForSelectedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  return v7 ^ 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  -[CNPhotoPickerVariantListController providerItems](self, "providerItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "item");

  objc_msgSend(v6, "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerVariantListController updatePreviewWithItem:](self, "updatePreviewWithItem:", v8);

  -[CNPhotoPickerVariantListController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rightBarButtonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", 1);

  if (-[CNPhotoPickerVariantListController commitsChangesOnSelection](self, "commitsChangesOnSelection"))
    -[CNPhotoPickerVariantListController didFinishSelectingVariant](self, "didFinishSelectingVariant");
}

- (void)providerItemDidUpdate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNPhotoPickerVariantListController providerItems](self, "providerItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerVariantListController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadItemsAtIndexPaths:", v9);

    if (-[CNPhotoPickerVariantListController showPreview](self, "showPreview"))
    {
      -[CNPhotoPickerVariantListController collectionView](self, "collectionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "indexPathsForSelectedItems");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqual:", v7);

      if (v13)
        -[CNPhotoPickerVariantListController updatePreviewWithItem:](self, "updatePreviewWithItem:", v4);
    }

  }
}

- (CNPhotoPickerVariantListControllerDelegate)delegate
{
  return (CNPhotoPickerVariantListControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNPhotoPickerProviderItem)originalItem
{
  return self->_originalItem;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UIView)sectionHeaderView
{
  return self->_sectionHeaderView;
}

- (void)setSectionHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_sectionHeaderView, a3);
}

- (id)numberOfItemsPerRowProvider
{
  return self->_numberOfItemsPerRowProvider;
}

- (void)setNumberOfItemsPerRowProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (BOOL)showPreview
{
  return self->_showPreview;
}

- (void)setShowPreview:(BOOL)a3
{
  self->_showPreview = a3;
}

- (unint64_t)cellStyle
{
  return self->_cellStyle;
}

- (void)setCellStyle:(unint64_t)a3
{
  self->_cellStyle = a3;
}

- (BOOL)showsToolbar
{
  return self->_showsToolbar;
}

- (void)setShowsToolbar:(BOOL)a3
{
  self->_showsToolbar = a3;
}

- (BOOL)commitsChangesOnSelection
{
  return self->_commitsChangesOnSelection;
}

- (void)setCommitsChangesOnSelection:(BOOL)a3
{
  self->_commitsChangesOnSelection = a3;
}

- (BOOL)showsSelection
{
  return self->_showsSelection;
}

- (void)setShowsSelection:(BOOL)a3
{
  self->_showsSelection = a3;
}

- (NSString)rightBarButtonTitle
{
  return self->_rightBarButtonTitle;
}

- (void)setRightBarButtonTitle:(id)a3
{
  self->_rightBarButtonTitle = (NSString *)a3;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (UIImageView)previewImageView
{
  return self->_previewImageView;
}

- (void)setPreviewImageView:(id)a3
{
  objc_storeStrong((id *)&self->_previewImageView, a3);
}

- (CNPhotoPickerPreviewView)posePreview
{
  return self->_posePreview;
}

- (void)setPosePreview:(id)a3
{
  objc_storeStrong((id *)&self->_posePreview, a3);
}

- (NSString)selectedVariantIdentifier
{
  return self->_selectedVariantIdentifier;
}

- (void)setSelectedVariantIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_selectedVariantIdentifier, a3);
}

- (NSArray)providerItems
{
  return self->_providerItems;
}

- (void)setProviderItems:(id)a3
{
  objc_storeStrong((id *)&self->_providerItems, a3);
}

- (CNPhotoPickerVariantsManager)variantsManager
{
  return self->_variantsManager;
}

- (void)setVariantsManager:(id)a3
{
  objc_storeStrong((id *)&self->_variantsManager, a3);
}

- (BOOL)shouldShowCaptions
{
  return self->_shouldShowCaptions;
}

- (void)setShouldShowCaptions:(BOOL)a3
{
  self->_shouldShowCaptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variantsManager, 0);
  objc_storeStrong((id *)&self->_providerItems, 0);
  objc_storeStrong((id *)&self->_selectedVariantIdentifier, 0);
  objc_storeStrong((id *)&self->_posePreview, 0);
  objc_storeStrong((id *)&self->_previewImageView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong(&self->_numberOfItemsPerRowProvider, 0);
  objc_storeStrong((id *)&self->_sectionHeaderView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_originalItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __76__CNPhotoPickerVariantListController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateWithView:animation:", a2, 0);
}

uint64_t __76__CNPhotoPickerVariantListController_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  void *v3;
  uint64_t v4;

  v3 = *(void **)(a1 + 32);
  if (a3)
    v4 = 2;
  else
    v4 = 0;
  return objc_msgSend(v3, "updateWithView:animation:", a2, v4);
}

void __63__CNPhotoPickerVariantListController_didFinishSelectingVariant__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoPickerVariantListController:didSelectProviderItem:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __59__CNPhotoPickerVariantListController_generateProviderItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDelegate:", *(_QWORD *)(a1 + 32));
}

uint64_t __53__CNPhotoPickerVariantListController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "variantIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "selectedVariantIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __101__CNPhotoPickerVariantListController_initWithVariantsManager_originalItem_selectedVariantIdentifier___block_invoke(double a1, double a2, double a3)
{
  if (a3 <= 460.0)
    return 2;
  else
    return 4;
}

+ (int64_t)topMarginForBounds:(CGRect)a3 shouldShowCaptions:(BOOL)a4
{
  if (a3.size.width > 460.0 || a4)
    return 20;
  else
    return 40;
}

+ (CGRect)frameForHeaderInBounds:(CGRect)result
{
  double v3;
  double v4;
  double v5;

  v3 = result.size.height / 3.0;
  v4 = 0.0;
  v5 = 0.0;
  result.size.height = v3;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

@end
