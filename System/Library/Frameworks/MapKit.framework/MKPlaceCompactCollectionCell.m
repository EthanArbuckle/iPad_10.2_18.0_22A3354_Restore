@implementation MKPlaceCompactCollectionCell

- (MKPlaceCompactCollectionCell)initWithFrame:(CGRect)a3
{
  MKPlaceCompactCollectionCell *v3;
  MKPlaceCompactCollectionCell *v4;
  void *v5;
  id v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)MKPlaceCompactCollectionCell;
  v3 = -[MKPlaceCompactCollectionCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MKPlaceCompactCollectionCell setupSubviews](v3, "setupSubviews");
    -[MKPlaceCompactCollectionCell setupCornerRadius](v4, "setupCornerRadius");
    -[MKPlaceCompactCollectionCell setupConstraints](v4, "setupConstraints");
    -[MKPlaceCompactCollectionCell setupShadows](v4, "setupShadows");
    -[MKPlaceCompactCollectionCell setupAccessibility](v4, "setupAccessibility");
    v9[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)-[MKPlaceCompactCollectionCell registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v5, sel_traitEnvironment_didChangeTraitCollection_);

  }
  return v4;
}

- (BOOL)canBecomeFirstResponder
{
  void *v2;
  BOOL v3;

  -[MKPlaceCompactCollectionCell traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 5;

  return v3;
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a4, "preferredContentSizeCategory", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompactCollectionCell traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v7)
  {
    -[MKPlaceCompactCollectionCell item](self, "item");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceCompactCollectionCell traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferredContentSizeCategory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentCategorySizeDidChange:", v10);

    -[MKPlaceCompactCollectionCell setTextMetadata](self, "setTextMetadata");
  }
}

- (void)prepareForReuse
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
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MKPlaceCompactCollectionCell;
  -[MKPlaceCompactCollectionCell prepareForReuse](&v13, sel_prepareForReuse);
  -[MKPlaceCompactCollectionCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttributedText:", 0);

  -[MKPlaceCompactCollectionCell subTitleLabel](self, "subTitleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributedText:", 0);

  -[MKPlaceCompactCollectionCell collectionImageView](self, "collectionImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", 0);

  -[MKPlaceCompactCollectionCell overlayHeightConstraint](self, "overlayHeightConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", 60.0);

  -[MKPlaceCompactCollectionCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", 0);

  -[MKPlaceCompactCollectionCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBorderWidth:", 0.0);

  -[MKPlaceCompactCollectionCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBorderColor:", 0);

  -[MKPlaceCompactCollectionCell metadataStackView](self, "metadataStackView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityLabel:", 0);

  -[MKPlaceCompactCollectionCell setItem:](self, "setItem:", 0);
}

- (void)setTextMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  -[MKPlaceCompactCollectionCell item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompactCollectionCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedText:", v4);

  -[MKPlaceCompactCollectionCell item](self, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompactCollectionCell traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredContentSizeCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "shouldShowSubtitleForCategory:", v8);

  if (v9)
  {
    -[MKPlaceCompactCollectionCell item](self, "item");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceCompactCollectionCell subTitleLabel](self, "subTitleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAttributedText:", v11);

    -[MKPlaceCompactCollectionCell subTitleLabel](self, "subTitleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v13;
    v14 = 0;
  }
  else
  {
    -[MKPlaceCompactCollectionCell subTitleLabel](self, "subTitleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v13;
    v14 = 1;
  }
  objc_msgSend(v13, "setHidden:", v14);

}

- (void)setUpCellUsingModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id location;

  v4 = a3;
  -[MKPlaceCompactCollectionCell setItem:](self, "setItem:", v4);
  -[MKPlaceCompactCollectionCell setTextMetadata](self, "setTextMetadata");
  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompactCollectionCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v7 = (void *)MEMORY[0x1E0CB3940];
  -[MKPlaceCompactCollectionCell titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = &stru_1E20DFC00;
  -[MKPlaceCompactCollectionCell subTitleLabel](self, "subTitleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "text");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = &stru_1E20DFC00;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ %@"), v11, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompactCollectionCell metadataStackView](self, "metadataStackView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAccessibilityLabel:", v16);

  if (objc_msgSend(v4, "useBorderHighlight"))
    -[MKPlaceCompactCollectionCell setupBorderHighlight](self, "setupBorderHighlight");
  if (objc_msgSend(v4, "isWorldwide"))
  {
    -[MKPlaceCompactCollectionCell overlayHeightConstraint](self, "overlayHeightConstraint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setConstant:", 40.0);

  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompactCollectionCell setUpdateIdentifier:](self, "setUpdateIdentifier:", v19);
  objc_initWeak(&location, self);
  -[MKPlaceCompactCollectionCell item](self, "item");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompactCollectionCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "frame");
  v23 = v22;
  v25 = v24;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __52__MKPlaceCompactCollectionCell_setUpCellUsingModel___block_invoke;
  v27[3] = &unk_1E20DF5B8;
  objc_copyWeak(&v29, &location);
  v26 = v19;
  v28 = v26;
  objc_msgSend(v20, "compactCollectionImageForSize:onCompletion:", v27, v23, v25);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

void __52__MKPlaceCompactCollectionCell_setUpCellUsingModel___block_invoke(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  double v14;
  const char *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[16];

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_10;
  objc_msgSend(WeakRetained, "updateIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {

    goto LABEL_10;
  }
  objc_msgSend(v9, "item");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_10:
    MKGetCuratedCollectionsLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B0B0000, v16, OS_LOG_TYPE_INFO, "Cell doesn't exist OR identifier mistach", buf, 2u);
    }

    goto LABEL_13;
  }
  if (v7 && !a3)
  {
    MKGetCuratedCollectionsLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (a4)
    {
      v14 = 0.0;
      if (v13)
      {
        *(_WORD *)buf = 0;
        v15 = "Received cached image. Displaying without animation.";
LABEL_16:
        _os_log_impl(&dword_18B0B0000, v12, OS_LOG_TYPE_INFO, v15, buf, 2u);
      }
    }
    else
    {
      v14 = 0.100000001;
      if (v13)
      {
        *(_WORD *)buf = 0;
        v15 = "Received non-cached image. Displaying with animation.";
        goto LABEL_16;
      }
    }

    v17 = (void *)MEMORY[0x1E0CEABB0];
    objc_msgSend(v9, "collectionImageView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __52__MKPlaceCompactCollectionCell_setUpCellUsingModel___block_invoke_16;
    v19[3] = &unk_1E20D7E58;
    v19[4] = v9;
    v20 = v7;
    objc_msgSend(v17, "transitionWithView:duration:options:animations:completion:", v18, 5242882, v19, 0, v14);

  }
LABEL_13:

}

void __52__MKPlaceCompactCollectionCell_setUpCellUsingModel___block_invoke_16(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "collectionImageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v1);

}

- (void)setupSubviews
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompactCollectionCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[MKPlaceCompactCollectionCell setupCompactCollectionImage](self, "setupCompactCollectionImage");
  -[MKPlaceCompactCollectionCell setupCompactCollectionImageOverlay](self, "setupCompactCollectionImageOverlay");
  -[MKPlaceCompactCollectionCell setupCompactCollectionData](self, "setupCompactCollectionData");
}

- (void)setupCompactCollectionImage
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_alloc(MEMORY[0x1E0CEA658]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MKPlaceCompactCollectionCell setCollectionImageView:](self, "setCollectionImageView:", v4);

  -[MKPlaceCompactCollectionCell collectionImageView](self, "collectionImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[MKPlaceCompactCollectionCell collectionImageView](self, "collectionImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIgnoresInvertColors:", 1);

  -[MKPlaceCompactCollectionCell collectionImageView](self, "collectionImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("CompactCollectionImageView"));

  -[MKPlaceCompactCollectionCell collectionImageView](self, "collectionImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentMode:", 2);

  -[MKPlaceCompactCollectionCell contentView](self, "contentView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompactCollectionCell collectionImageView](self, "collectionImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v9);

}

- (void)setupCompactCollectionImageOverlay
{
  MKPlaceCompactCollectionOverlayView *v3;
  MKPlaceCompactCollectionOverlayView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v3 = [MKPlaceCompactCollectionOverlayView alloc];
  v4 = -[MKPlaceCompactCollectionOverlayView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MKPlaceCompactCollectionCell setImageOverlayView:](self, "setImageOverlayView:", v4);

  -[MKPlaceCompactCollectionCell imageOverlayView](self, "imageOverlayView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompactCollectionCell imageOverlayView](self, "imageOverlayView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  -[MKPlaceCompactCollectionCell imageOverlayView](self, "imageOverlayView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "gradientLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setStartPoint:", 0.5, 0.0);

  -[MKPlaceCompactCollectionCell imageOverlayView](self, "imageOverlayView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "gradientLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEndPoint:", 0.5, 1.0);

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "colorWithAlphaComponent:", 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_retainAutorelease(v13);
  v22[0] = objc_msgSend(v14, "CGColor");
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "colorWithAlphaComponent:", 0.38);
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v22[1] = objc_msgSend(v16, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompactCollectionCell imageOverlayView](self, "imageOverlayView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "gradientLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setColors:", v17);

  -[MKPlaceCompactCollectionCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompactCollectionCell imageOverlayView](self, "imageOverlayView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSubview:", v21);

}

- (void)setupCompactCollectionData
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc(MEMORY[0x1E0CEA9E0]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MKPlaceCompactCollectionCell setMetadataStackView:](self, "setMetadataStackView:", v4);

  -[MKPlaceCompactCollectionCell metadataStackView](self, "metadataStackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[MKPlaceCompactCollectionCell metadataStackView](self, "metadataStackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAxis:", 1);

  -[MKPlaceCompactCollectionCell metadataStackView](self, "metadataStackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDistribution:", 0);

  -[MKPlaceCompactCollectionCell metadataStackView](self, "metadataStackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlignment:", 1);

  -[MKPlaceCompactCollectionCell metadataStackView](self, "metadataStackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSpacing:", 0.0);

  -[MKPlaceCompactCollectionCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompactCollectionCell metadataStackView](self, "metadataStackView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v11);

  -[MKPlaceCompactCollectionCell setupTitle](self, "setupTitle");
  -[MKPlaceCompactCollectionCell setupSubTitle](self, "setupSubTitle");
}

- (void)setupTitle
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_alloc(MEMORY[0x1E0CEA700]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MKPlaceCompactCollectionCell setTitleLabel:](self, "setTitleLabel:", v4);

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompactCollectionCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v5);

  -[MKPlaceCompactCollectionCell titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNumberOfLines:", 3);

  -[MKPlaceCompactCollectionCell titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("CompactCollectionTitle"));

  -[MKPlaceCompactCollectionCell metadataStackView](self, "metadataStackView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompactCollectionCell titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addArrangedSubview:", v9);

}

- (void)setupSubTitle
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = objc_alloc(MEMORY[0x1E0CEA700]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MKPlaceCompactCollectionCell setSubTitleLabel:](self, "setSubTitleLabel:", v4);

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorWithAlphaComponent:", 0.9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompactCollectionCell subTitleLabel](self, "subTitleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v6);

  -[MKPlaceCompactCollectionCell subTitleLabel](self, "subTitleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNumberOfLines:", 3);

  -[MKPlaceCompactCollectionCell subTitleLabel](self, "subTitleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("CompactCollectionSubtitle"));

  -[MKPlaceCompactCollectionCell metadataStackView](self, "metadataStackView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompactCollectionCell subTitleLabel](self, "subTitleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addArrangedSubview:", v10);

}

- (void)setupShadows
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "CGColor");
  -[MKPlaceCompactCollectionCell layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShadowColor:", v4);

  -[MKPlaceCompactCollectionCell layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 1028443341;
  objc_msgSend(v6, "setShadowOpacity:", v7);

  -[MKPlaceCompactCollectionCell layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShadowOffset:", 0.0, 2.0);

  -[MKPlaceCompactCollectionCell layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShadowRadius:", 12.0);

  -[MKPlaceCompactCollectionCell layer](self, "layer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShadowPathIsBounds:", 1);

}

- (void)setupAccessibility
{
  void *v3;
  uint64_t v4;
  id v5;

  -[MKPlaceCompactCollectionCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("CompactCollectionCell"));
  -[MKPlaceCompactCollectionCell metadataStackView](self, "metadataStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);

  v4 = *MEMORY[0x1E0CEB110];
  -[MKPlaceCompactCollectionCell metadataStackView](self, "metadataStackView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityTraits:", v4);

}

- (void)setupConstraints
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
  _QWORD v64[14];

  v64[12] = *MEMORY[0x1E0C80C00];
  -[MKPlaceCompactCollectionCell imageOverlayView](self, "imageOverlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "heightAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToConstant:", 60.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompactCollectionCell setOverlayHeightConstraint:](self, "setOverlayHeightConstraint:", v5);

  v39 = (void *)MEMORY[0x1E0CB3718];
  -[MKPlaceCompactCollectionCell collectionImageView](self, "collectionImageView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "leadingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompactCollectionCell contentView](self, "contentView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "leadingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v60);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v59;
  -[MKPlaceCompactCollectionCell collectionImageView](self, "collectionImageView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "trailingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompactCollectionCell contentView](self, "contentView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "trailingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v55);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v54;
  -[MKPlaceCompactCollectionCell collectionImageView](self, "collectionImageView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "topAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompactCollectionCell contentView](self, "contentView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "topAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v50);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v64[2] = v49;
  -[MKPlaceCompactCollectionCell collectionImageView](self, "collectionImageView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompactCollectionCell contentView](self, "contentView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v64[3] = v44;
  -[MKPlaceCompactCollectionCell imageOverlayView](self, "imageOverlayView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompactCollectionCell contentView](self, "contentView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v64[4] = v38;
  -[MKPlaceCompactCollectionCell imageOverlayView](self, "imageOverlayView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompactCollectionCell contentView](self, "contentView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v64[5] = v33;
  -[MKPlaceCompactCollectionCell overlayHeightConstraint](self, "overlayHeightConstraint");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v64[6] = v32;
  -[MKPlaceCompactCollectionCell imageOverlayView](self, "imageOverlayView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompactCollectionCell contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v64[7] = v27;
  -[MKPlaceCompactCollectionCell metadataStackView](self, "metadataStackView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompactCollectionCell contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, 12.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v64[8] = v22;
  -[MKPlaceCompactCollectionCell metadataStackView](self, "metadataStackView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompactCollectionCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v18, -12.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v64[9] = v17;
  -[MKPlaceCompactCollectionCell metadataStackView](self, "metadataStackView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompactCollectionCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintGreaterThanOrEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v64[10] = v9;
  -[MKPlaceCompactCollectionCell metadataStackView](self, "metadataStackView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompactCollectionCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, -12.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v64[11] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "activateConstraints:", v15);

}

- (void)setupCornerRadius
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[MKPlaceCompactCollectionCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", 10.0);

  -[MKPlaceCompactCollectionCell contentView](self, "contentView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMasksToBounds:", 1);

}

- (void)setupBorderHighlight
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  -[MKPlaceCompactCollectionCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBorderWidth:", 3.0);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v8, "CGColor");
  -[MKPlaceCompactCollectionCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBorderColor:", v5);

}

- (UIStackView)metadataStackView
{
  return self->_metadataStackView;
}

- (void)setMetadataStackView:(id)a3
{
  objc_storeStrong((id *)&self->_metadataStackView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subTitleLabel
{
  return self->_subTitleLabel;
}

- (void)setSubTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subTitleLabel, a3);
}

- (UIImageView)collectionImageView
{
  return self->_collectionImageView;
}

- (void)setCollectionImageView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionImageView, a3);
}

- (MKPlaceCompactCollectionOverlayView)imageOverlayView
{
  return self->_imageOverlayView;
}

- (void)setImageOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_imageOverlayView, a3);
}

- (MKPlaceCompactCollectionViewModel)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (NSUUID)updateIdentifier
{
  return self->_updateIdentifier;
}

- (void)setUpdateIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_updateIdentifier, a3);
}

- (NSLayoutConstraint)overlayHeightConstraint
{
  return self->_overlayHeightConstraint;
}

- (void)setOverlayHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_overlayHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayHeightConstraint, 0);
  objc_storeStrong((id *)&self->_updateIdentifier, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_imageOverlayView, 0);
  objc_storeStrong((id *)&self->_collectionImageView, 0);
  objc_storeStrong((id *)&self->_subTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_metadataStackView, 0);
}

@end
