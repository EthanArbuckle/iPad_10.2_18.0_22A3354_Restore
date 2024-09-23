@implementation NTKCGalleryCell

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (double)estimatedRowHeight
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x1E0DC39A8], "prominentInsetGroupedHeaderConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lineHeight");
  v6 = v5 + 9.0;

  +[NTKCFaceContainerView sizeForFaceSize:style:](NTKCFaceContainerView, "sizeForFaceSize:style:", 1, FaceSize());
  return v6 + 11.0 + v7 + 25.0;
}

- (NTKCGalleryCell)init
{
  void *v3;
  NTKCGalleryCell *v4;

  objc_msgSend((id)objc_opt_class(), "reuseIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NTKCGalleryCell initWithStyle:reuseIdentifier:](self, "initWithStyle:reuseIdentifier:", 0, v3);

  return v4;
}

- (NTKCGalleryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  NTKCGalleryCell *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  UICollectionView *collectionView;
  uint64_t v23;
  void *v24;
  UICollectionView *v25;
  uint64_t v26;
  void *v27;
  UICollectionView *v28;
  uint64_t v29;
  void *v30;
  UICollectionView *v31;
  uint64_t v32;
  void *v33;
  UICollectionView *v34;
  uint64_t v35;
  void *v36;
  UICollectionView *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
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
  double v61;
  void *v62;
  uint64_t v63;
  NSLayoutConstraint *cvHeightConstraint;
  void *v65;
  void *v66;
  objc_super v68;
  _QWORD v69[5];
  _QWORD v70[4];

  v70[3] = *MEMORY[0x1E0C80C00];
  v68.receiver = self;
  v68.super_class = (Class)NTKCGalleryCell;
  v4 = -[NTKCGalleryCell initWithStyle:reuseIdentifier:](&v68, sel_initWithStyle_reuseIdentifier_, 0, a4);
  if (v4)
  {
    BPSBackgroundColor();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCGalleryCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = NTKCScreenEdgeMargin();
    v7 = (void *)objc_opt_new();
    BPSTextColor();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextColor:", v8);

    objc_msgSend(v7, "setNumberOfLines:", 0);
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v9) = 1053609165;
    objc_msgSend(v7, "_setHyphenationFactor:", v9);
    objc_msgSend(v7, "setLineBreakMode:", 0);
    -[NTKCGalleryCell setTitle:](v4, "setTitle:", v7);

    v10 = (void *)objc_opt_new();
    -[NTKCGalleryCell setTitleStack:](v4, "setTitleStack:", v10);

    -[UIStackView setLayoutMargins:](v4->_titleStack, "setLayoutMargins:", 0.0, v6, 0.0, v6);
    -[UIStackView setLayoutMarginsRelativeArrangement:](v4->_titleStack, "setLayoutMarginsRelativeArrangement:", 1);
    -[UIStackView addArrangedSubview:](v4->_titleStack, "addArrangedSubview:", v4->_title);
    v11 = (void *)objc_opt_new();
    BPSTextColor();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextColor:", v12);

    objc_msgSend(v11, "setNumberOfLines:", 0);
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v13) = 1053609165;
    objc_msgSend(v11, "_setHyphenationFactor:", v13);
    objc_msgSend(v11, "setLineBreakMode:", 0);
    -[NTKCGalleryCell setFooter:](v4, "setFooter:", v11);

    v14 = (void *)objc_opt_new();
    -[NTKCGalleryCell setFooterStack:](v4, "setFooterStack:", v14);

    -[UIStackView setLayoutMargins:](v4->_footerStack, "setLayoutMargins:", 0.0, v6, 0.0, v6);
    -[UIStackView setLayoutMarginsRelativeArrangement:](v4->_footerStack, "setLayoutMarginsRelativeArrangement:", 1);
    -[UIStackView addArrangedSubview:](v4->_footerStack, "addArrangedSubview:", v4->_footer);
    v15 = (void *)objc_opt_new();
    -[NTKCGalleryCell setLayout:](v4, "setLayout:", v15);

    -[UICollectionViewFlowLayout _setWantsRightToLeftHorizontalMirroringIfNeeded:](v4->_layout, "_setWantsRightToLeftHorizontalMirroringIfNeeded:", 1);
    -[UICollectionViewFlowLayout setScrollDirection:](v4->_layout, "setScrollDirection:", 1);
    v16 = NTKCScreenStyle();
    v17 = 15.0;
    if (v16 == -1)
      v17 = 11.0;
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](v4->_layout, "setMinimumLineSpacing:", v17);
    v18 = objc_alloc(MEMORY[0x1E0DC35B8]);
    v19 = (void *)objc_msgSend(v18, "initWithFrame:collectionViewLayout:", v4->_layout, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[NTKCGalleryCell setCollectionView:](v4, "setCollectionView:", v19);

    -[NTKCGalleryCell collectionView](v4, "collectionView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAllowsGroupOpacity:", 0);

    collectionView = v4->_collectionView;
    v23 = objc_opt_class();
    +[_NTKCGalleryCollectionCell classicReuseIdentifier](_NTKCGalleryCollectionCell, "classicReuseIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](collectionView, "registerClass:forCellWithReuseIdentifier:", v23, v24);

    v25 = v4->_collectionView;
    v26 = objc_opt_class();
    +[_NTKCGalleryCollectionCell luxoReuseIdentifier](_NTKCGalleryCollectionCell, "luxoReuseIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v25, "registerClass:forCellWithReuseIdentifier:", v26, v27);

    v28 = v4->_collectionView;
    v29 = objc_opt_class();
    +[_NTKCGalleryCollectionCell aloeReuseIdentifier](_NTKCGalleryCollectionCell, "aloeReuseIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v28, "registerClass:forCellWithReuseIdentifier:", v29, v30);

    v31 = v4->_collectionView;
    v32 = objc_opt_class();
    +[_NTKCGalleryCollectionCell agaveReuseIdentifier](_NTKCGalleryCollectionCell, "agaveReuseIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v31, "registerClass:forCellWithReuseIdentifier:", v32, v33);

    v34 = v4->_collectionView;
    v35 = objc_opt_class();
    +[_NTKCGalleryCollectionCell avoniaReuseIdentifier](_NTKCGalleryCollectionCell, "avoniaReuseIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v34, "registerClass:forCellWithReuseIdentifier:", v35, v36);

    v37 = v4->_collectionView;
    v38 = objc_opt_class();
    v39 = *MEMORY[0x1E0DC48A0];
    +[_NTKCGalleryCollectionFooter reuseIdentifier](_NTKCGalleryCollectionFooter, "reuseIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v37, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v38, v39, v40);

    -[UICollectionView setContentInset:](v4->_collectionView, "setContentInset:", 0.0, v6, 0.0, v6);
    -[UICollectionView setBackgroundColor:](v4->_collectionView, "setBackgroundColor:", 0);
    -[UICollectionView setAlwaysBounceHorizontal:](v4->_collectionView, "setAlwaysBounceHorizontal:", 1);
    -[UICollectionView setShowsVerticalScrollIndicator:](v4->_collectionView, "setShowsVerticalScrollIndicator:", 0);
    -[UICollectionView setShowsHorizontalScrollIndicator:](v4->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
    -[UICollectionView setDelegate:](v4->_collectionView, "setDelegate:", v4);
    -[UICollectionView setDataSource:](v4->_collectionView, "setDataSource:", v4);
    -[UICollectionView setClipsToBounds:](v4->_collectionView, "setClipsToBounds:", 0);
    v4->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    v41 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v70[0] = v4->_titleStack;
    v70[1] = v4->_collectionView;
    v70[2] = v4->_footerStack;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 3);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v41, "initWithArrangedSubviews:", v42);
    -[NTKCGalleryCell setContentStack:](v4, "setContentStack:", v43);

    -[UIStackView setAxis:](v4->_contentStack, "setAxis:", 1);
    -[UIStackView setCustomSpacing:afterView:](v4->_contentStack, "setCustomSpacing:afterView:", v4->_titleStack, 11.0);
    -[UIStackView setCustomSpacing:afterView:](v4->_contentStack, "setCustomSpacing:afterView:", v4->_collectionView, 15.0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4->_contentStack, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[NTKCGalleryCell contentView](v4, "contentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addSubview:", v4->_contentStack);

    -[NTKCGalleryCell contentView](v4, "contentView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView leadingAnchor](v4->_contentStack, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    -[NTKCGalleryCell contentView](v4, "contentView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView trailingAnchor](v4->_contentStack, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIStackView topAnchor](v4->_contentStack, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCGalleryCell contentView](v4, "contentView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "topAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:constant:", v55, 9.0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    -[NTKCGalleryCell contentView](v4, "contentView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "bottomAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView bottomAnchor](v4->_contentStack, "bottomAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:constant:", v59, 25.0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v61) = 1132068864;
    objc_msgSend(v60, "setPriority:", v61);
    -[UICollectionView heightAnchor](v4->_collectionView, "heightAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToConstant:", 0.0);
    v63 = objc_claimAutoreleasedReturnValue();
    cvHeightConstraint = v4->_cvHeightConstraint;
    v4->_cvHeightConstraint = (NSLayoutConstraint *)v63;

    v69[0] = v48;
    v69[1] = v52;
    v69[2] = v56;
    v69[3] = v60;
    v69[4] = v4->_cvHeightConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 5);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v65);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addObserver:selector:name:object:", v4, sel__fontSizeDidChange, *MEMORY[0x1E0DC48E8], 0);

    -[NTKCGalleryCell _fontSizeDidChange](v4, "_fontSizeDidChange");
  }
  return v4;
}

- (void)_configureViews
{
  NTKGalleryCollection *collection;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id *v10;
  NSString *v11;
  _BOOL4 IsAccessibilityCategory;
  void *v13;
  void *v14;
  double v15;
  id v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  NSString *v21;
  NSString *v22;
  _BOOL8 v23;

  collection = self->_collection;
  if (collection)
  {
    -[NTKGalleryCollection title](collection, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_title, "setText:", v4);

    -[NTKGalleryCollection descriptionText](self->_collection, "descriptionText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_footer, "setText:", v5);

    +[NTKCFaceContainerView sizeForFaceSize:style:](NTKCFaceContainerView, "sizeForFaceSize:style:", 1, FaceSize());
    v7 = v6;
    v9 = v8;
    v10 = (id *)MEMORY[0x1E0DC4730];
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v11);

    if (IsAccessibilityCategory)
      v7 = v7 * 1.5;
    -[NTKGalleryCollection calloutName](self->_collection, "calloutName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B08]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v15) = 0.5;
      v16 = (id)objc_msgSend(MEMORY[0x1E0DC1288], "NTKHyphenationParagraphStyleWithFactor:", v15);
      v17 = NTKSingleLineHeight((uint64_t)v14, v16);
      v18 = NTKMaxLineHeightDeltaForEnumeratableFaceCollection(self->_collection, v14, v16, 1, v7);

      v9 = v9 + v17 + v18 + 10.0;
    }
    -[UICollectionViewFlowLayout setItemSize:](self->_layout, "setItemSize:", v7, v9);
    -[NSLayoutConstraint setConstant:](self->_cvHeightConstraint, "setConstant:", v9);
    if (-[NTKGalleryCollection numberOfFaces](self->_collection, "numberOfFaces") == 1
      && (-[NTKGalleryCollection descriptionText](self->_collection, "descriptionText"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v20 = objc_msgSend(v19, "length"),
          v19,
          v20))
    {
      v21 = (NSString *)*MEMORY[0x1E0DC4918];
      objc_msgSend(*v10, "preferredContentSizeCategory");
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      v23 = UIContentSizeCategoryCompareToCategory(v21, v22) != NSOrderedAscending;

      self->_showFooterInCollectionView = v23;
    }
    else
    {
      self->_showFooterInCollectionView = 0;
      v23 = 1;
    }
    -[UIStackView setHidden:](self->_footerStack, "setHidden:", v23);
    -[UICollectionView reloadData](self->_collectionView, "reloadData");
  }
}

- (void)setAllSnapshotsLoaded:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  int v7;
  NTKCGalleryCell *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  _BOOL8 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_allSnapshotsLoaded != a3)
  {
    v3 = a3;
    self->_allSnapshotsLoaded = a3;
    _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[NTKGalleryCollection title](self->_collection, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 134218498;
      v8 = self;
      v9 = 2112;
      v10 = v6;
      v11 = 2048;
      v12 = v3;
      _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "Cell %p (%@) - snapshots loaded %lu", (uint8_t *)&v7, 0x20u);

    }
  }
}

- (void)prepareForReuse
{
  NSObject *v3;
  void *v4;
  NTKCGalleryCell *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  NTKCGalleryCell *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[NTKGalleryCollection title](self->_collection, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "Cell %p (%@) preparing for reuse", buf, 0x16u);

  }
  v8.receiver = self;
  v8.super_class = (Class)NTKCGalleryCell;
  -[NTKCGalleryCell prepareForReuse](&v8, sel_prepareForReuse);
  -[NTKGalleryCollection delegate](self->_collection, "delegate");
  v5 = (NTKCGalleryCell *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
    -[NTKGalleryCollection setDelegate:](self->_collection, "setDelegate:", 0);
  -[NTKCGalleryCell collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCGalleryCell collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentOffset");
  objc_msgSend(v6, "setContentOffset:animated:", 0);

  -[NTKCGalleryCell _resetSnapshotRequests](self, "_resetSnapshotRequests");
}

- (void)_resetSnapshotRequests
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *snapshotRequests;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  NTKCGalleryCell *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[NTKGalleryCollection title](self->_collection, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v18 = self;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "Resetting snapshot requests for cell %p (%@)", buf, 0x16u);

  }
  +[NTKFaceSnapshotCache snapshotCache](NTKFaceSnapshotCache, "snapshotCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_snapshotRequests;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "cancelSnapshotRequest:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++), (_QWORD)v12);
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  snapshotRequests = self->_snapshotRequests;
  self->_snapshotRequests = 0;

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)NTKCGalleryCell;
  -[NTKCGalleryCell dealloc](&v4, sel_dealloc);
}

- (void)layoutSubviews
{
  int64_t selectedIndex;
  UICollectionView *collectionView;
  void *v5;
  objc_super v6;
  CGRect v7;

  v6.receiver = self;
  v6.super_class = (Class)NTKCGalleryCell;
  -[NTKCGalleryCell layoutSubviews](&v6, sel_layoutSubviews);
  -[UICollectionView frame](self->_collectionView, "frame");
  if (CGRectIsEmpty(v7))
  {
    selectedIndex = self->_selectedIndex;
    if (selectedIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      collectionView = self->_collectionView;
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", selectedIndex, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionView scrollToItemAtIndexPath:atScrollPosition:animated:](collectionView, "scrollToItemAtIndexPath:atScrollPosition:animated:", v5, 16, 0);

    }
  }
}

- (void)setCollection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  _BOOL8 v19;
  NSObject *v20;
  NTKCGalleryCell *v21;
  double v22;
  void *v23;
  NSObject *v24;
  uint64_t i;
  void *v26;
  void *v27;
  NTKFaceSnapshotCacheRequestOptions *v28;
  NTKFaceSnapshotCacheRequest *v29;
  NTKFaceSnapshotCacheRequest *v30;
  void *v31;
  id v32;
  id v33;
  NSArray *v34;
  NSArray *snapshotRequests;
  NTKGalleryCollection **p_collection;
  _QWORD block[4];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43[2];
  _QWORD v44[4];
  NSObject *v45;
  uint8_t buf[4];
  NTKCGalleryCell *v47;
  __int16 v48;
  NTKCGalleryCell *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    v47 = self;
    v48 = 2112;
    v49 = self;
    v50 = 2112;
    v51 = v4;
    v52 = 2048;
    v53 = v4;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "Cell %p (%@) setting collection to %@ (%p)", buf, 0x2Au);
  }

  p_collection = &self->_collection;
  objc_storeStrong((id *)&self->_collection, a3);
  objc_msgSend(v4, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == 0;

  if (v7)
    objc_msgSend(v4, "setDelegate:", self);
  -[NTKCGalleryCell _configureViews](self, "_configureViews");
  -[NTKCGalleryCell _resetSnapshotRequests](self, "_resetSnapshotRequests");
  +[NTKFaceSnapshotCache snapshotCache](NTKFaceSnapshotCache, "snapshotCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "numberOfFaces");
  if (v9 >= 4)
    v10 = 4;
  else
    v10 = v9;
  if (v10)
  {
    objc_msgSend(v4, "faceAtIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cachedSnapshotOfFace:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 == 0;

    if (v13)
    {
      v19 = 0;
    }
    else
    {
      v14 = 1;
      do
      {
        v15 = v14;
        if (v10 == v14)
          break;
        objc_msgSend(v4, "faceAtIndex:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "cachedSnapshotOfFace:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17 == 0;

        v14 = v15 + 1;
      }
      while (!v18);
      v19 = v15 >= v10;
    }
  }
  else
  {
    v19 = 1;
  }
  -[NTKCGalleryCell setAllSnapshotsLoaded:](self, "setAllSnapshotsLoaded:", v19);
  _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    -[NTKGalleryCollection title](*p_collection, "title");
    v21 = (NTKCGalleryCell *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v47 = self;
    v48 = 2112;
    v49 = v21;
    _os_log_impl(&dword_1B72A3000, v20, OS_LOG_TYPE_DEFAULT, "Cell %p (%@) - reloading data", buf, 0x16u);

  }
  if (v19)
    v22 = 1.0;
  else
    v22 = 0.0;
  -[UICollectionView setAlpha:](self->_collectionView, "setAlpha:", v22);
  -[UILabel setAlpha:](self->_footer, "setAlpha:", v22);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    v24 = dispatch_group_create();
    dispatch_group_enter(v24);
    if (v10)
    {
      for (i = 0; i != v10; ++i)
      {
        objc_msgSend(v4, "faceAtIndex:", i);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "cachedSnapshotOfFace:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v27)
        {
          dispatch_group_enter(v24);
          v28 = -[NTKFaceSnapshotCacheRequestOptions initWithPriority:]([NTKFaceSnapshotCacheRequestOptions alloc], "initWithPriority:", 3);
          v29 = [NTKFaceSnapshotCacheRequest alloc];
          v44[0] = MEMORY[0x1E0C809B0];
          v44[1] = 3221225472;
          v44[2] = __33__NTKCGalleryCell_setCollection___block_invoke;
          v44[3] = &unk_1E6BD2D40;
          v45 = v24;
          v30 = -[NTKFaceSnapshotCacheRequest initWithFace:options:completion:](v29, "initWithFace:options:completion:", v26, v28, v44);
          objc_msgSend(v23, "addObject:", v30);
          objc_msgSend(v8, "fetchSnapshotWithRequest:", v30);

        }
      }
    }
    objc_initWeak((id *)buf, self);
    -[NTKGalleryCollection title](*p_collection, "title");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__NTKCGalleryCell_setCollection___block_invoke_2;
    block[3] = &unk_1E6BD2DA8;
    objc_copyWeak(v43, (id *)buf);
    v39 = v4;
    v32 = v31;
    v40 = v32;
    v43[1] = (id)v10;
    v41 = v8;
    v33 = v23;
    v42 = v33;
    dispatch_group_notify(v24, MEMORY[0x1E0C80D38], block);
    v34 = (NSArray *)objc_msgSend(v33, "copy");
    snapshotRequests = self->_snapshotRequests;
    self->_snapshotRequests = v34;

    dispatch_group_leave(v24);
    objc_destroyWeak(v43);

    objc_destroyWeak((id *)buf);
  }

}

void __33__NTKCGalleryCell_setCollection___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __33__NTKCGalleryCell_setCollection___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  NTKFaceSnapshotCacheRequestOptions *v13;
  NTKFaceSnapshotCacheRequest *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  uint8_t buf[4];
  id *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained && WeakRetained[129] == *(id *)(a1 + 32))
  {
    objc_msgSend(WeakRetained, "setAllSnapshotsLoaded:", 1);
    _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      v18 = v3;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "Cell %p (%@) - reloading data with snapshots", buf, 0x16u);
    }

    objc_msgSend(v3[133], "reloadData");
    v15[4] = v3;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __33__NTKCGalleryCell_setCollection___block_invoke_83;
    v16[3] = &unk_1E6BCD5F0;
    v16[4] = v3;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __33__NTKCGalleryCell_setCollection___block_invoke_2_85;
    v15[3] = &unk_1E6BD05C8;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v16, v15, 0.3, 0.0);
    v8 = objc_msgSend(*(id *)(a1 + 32), "numberOfFaces");
    v9 = *(_QWORD *)(a1 + 72);
    if (v9 < v8)
    {
      v10 = v8;
      do
      {
        objc_msgSend(*(id *)(a1 + 32), "faceAtIndex:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "cachedSnapshotOfFace:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v13 = -[NTKFaceSnapshotCacheRequestOptions initWithPriority:]([NTKFaceSnapshotCacheRequestOptions alloc], "initWithPriority:", 2);
          v14 = -[NTKFaceSnapshotCacheRequest initWithFace:options:completion:]([NTKFaceSnapshotCacheRequest alloc], "initWithFace:options:completion:", v11, v13, &__block_literal_global_64);
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v14);
          objc_msgSend(*(id *)(a1 + 48), "fetchSnapshotWithRequest:", v14);

        }
        ++v9;
      }
      while (v10 != v9);
    }
  }
  else
  {
    _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      v18 = v3;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "Cell %p (%@) - skipping notify", buf, 0x16u);
    }

  }
}

uint64_t __33__NTKCGalleryCell_setCollection___block_invoke_83(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setAlpha:", 1.0);
}

uint64_t __33__NTKCGalleryCell_setCollection___block_invoke_2_85(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setAlpha:", 1.0);
}

- (CGPoint)contentOffset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  -[UICollectionView contentOffset](self->_collectionView, "contentOffset");
  v4 = v3;
  v6 = v5;
  -[NTKCGalleryCell _contentInsetPoint](self, "_contentInsetPoint");
  v8 = v4 + v7;
  v10 = v6 + v9;
  result.y = v10;
  result.x = v8;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;

  y = a3.y;
  x = a3.x;
  -[NTKCGalleryCell layoutIfNeeded](self, "layoutIfNeeded");
  -[NTKCGalleryCell _contentInsetPoint](self, "_contentInsetPoint");
  -[UICollectionView setContentOffset:](self->_collectionView, "setContentOffset:", x - v6, y - v7);
}

- (CGPoint)_contentInsetPoint
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[UICollectionView contentInset](self->_collectionView, "contentInset");
  v4 = v3;
  -[UICollectionView contentInset](self->_collectionView, "contentInset");
  v6 = v5;
  v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (void)updateFaceAtIndex:(unint64_t)a3
{
  UICollectionView *collectionView;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  collectionView = self->_collectionView;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView reloadItemsAtIndexPaths:](collectionView, "reloadItemsAtIndexPaths:", v5);

}

- (void)selectFace:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  UICollectionView *collectionView;
  id v8;

  v4 = a3;
  -[NTKCGalleryCell collection](self, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfFace:", v4);

  collectionView = self->_collectionView;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v6, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UICollectionView selectItemAtIndexPath:animated:scrollPosition:](collectionView, "selectItemAtIndexPath:animated:scrollPosition:", v8, 1, 0);

}

- (void)clearSelectedFaces
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[UICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[UICollectionView deselectItemAtIndexPath:animated:](self->_collectionView, "deselectItemAtIndexPath:animated:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), 1);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (id)faceForLocation:(CGPoint)a3
{
  UICollectionView *collectionView;
  void *v5;
  void *v6;
  void *v7;

  collectionView = self->_collectionView;
  -[NTKCGalleryCell convertPoint:toView:](self, "convertPoint:toView:", collectionView, a3.x, a3.y);
  -[UICollectionView indexPathForItemAtPoint:](collectionView, "indexPathForItemAtPoint:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    -[NTKGalleryCollection faceAtIndex:](self->_collection, "faceAtIndex:", objc_msgSend(v5, "item"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)containerViewForFace:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", -[NTKGalleryCollection indexOfFace:](self->_collection, "indexOfFace:", a3), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "faceContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  int64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  NTKCGalleryCell *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[NTKCGalleryCell allSnapshotsLoaded](self, "allSnapshotsLoaded", a3, a4))
  {
    v5 = -[NTKGalleryCollection numberOfFaces](self->_collection, "numberOfFaces");
    _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[NTKGalleryCollection title](self->_collection, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 134218498;
      v11 = self;
      v12 = 2112;
      v13 = v7;
      v14 = 2048;
      v15 = v5;
      _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "Cell %p (%@)- number of items - %ld", (uint8_t *)&v10, 0x20u);

    }
  }
  else
  {
    _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[NTKGalleryCollection title](self->_collection, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 134218242;
      v11 = self;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "Cell %p (%@) - number of items - NOT loaded", (uint8_t *)&v10, 0x16u);

    }
    v5 = 0;
  }

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  UICollectionView *collectionView;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;

  v5 = a4;
  collectionView = self->_collectionView;
  +[_NTKCGalleryCollectionCell reuseIdentifier](_NTKCGalleryCollectionCell, "reuseIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](collectionView, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v5, "item");
  -[NTKGalleryCollection faceAtIndex:](self->_collection, "faceAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCGalleryCell delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "galleryCell:viewForFace:atIndex:", self, v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFaceView:", v12);

  -[NTKGalleryCollection calloutName](self->_collection, "calloutName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[NTKGalleryCollection calloutName](self->_collection, "calloutName");
    v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v14)[2](v14, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCalloutName:", v15);

  }
  else
  {
    objc_msgSend(v8, "setCalloutName:", 0);
  }
  objc_msgSend(v8, "setActive:", objc_msgSend(v5, "item") == self->_selectedIndex);

  return v8;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[_NTKCGalleryCollectionFooter reuseIdentifier](_NTKCGalleryCollectionFooter, "reuseIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKGalleryCollection descriptionText](self->_collection, "descriptionText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v13);

  return v12;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[NTKGalleryCollection faceAtIndex:](self->_collection, "faceAtIndex:", objc_msgSend(v7, "item"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCGalleryCell delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__NTKCGalleryCell_collectionView_didSelectItemAtIndexPath___block_invoke;
  v12[3] = &unk_1E6BCD778;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "galleryCell:didSelectFace:finishedSelectionHandler:", self, v8, v12);

}

uint64_t __59__NTKCGalleryCell_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deselectItemAtIndexPath:animated:", *(_QWORD *)(a1 + 40), 1);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  id v6;
  void *v7;
  double Width;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;
  CGRect v19;

  v6 = a3;
  v7 = v6;
  if (self->_showFooterInCollectionView)
  {
    objc_msgSend(v6, "bounds");
    Width = CGRectGetWidth(v19);
    objc_msgSend(v7, "contentInset");
    v10 = v9;
    objc_msgSend(v7, "contentInset");
    v12 = Width - (v10 + v11);
    +[NTKCFaceContainerView sizeForFaceSize:style:](NTKCFaceContainerView, "sizeForFaceSize:style:", 1, FaceSize());
    v14 = v12 - v13;
    v15 = 0.0;
  }
  else
  {
    v14 = *MEMORY[0x1E0C9D820];
    v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v16 = v14;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)_fontSizeDidChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0DC39A8], "prominentInsetGroupedHeaderConfiguration");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_title, "setFont:", v4);

  v5 = NTKCScreenStyle();
  v6 = (_QWORD *)MEMORY[0x1E0DC4AB8];
  if (v5 != -1)
    v6 = (_QWORD *)MEMORY[0x1E0DC4B08];
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontDescriptorWithSymbolicTraits:", 0x8000);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v8, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel setFont:](self->_footer, "setFont:", v9);
  -[NTKCGalleryCell _configureViews](self, "_configureViews");

}

- (NTKGalleryCollection)collection
{
  return self->_collection;
}

- (NTKCGalleryCellDelegate)delegate
{
  return (NTKCGalleryCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(int64_t)a3
{
  self->_selectedIndex = a3;
}

- (UILabel)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UICollectionViewFlowLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (NSLayoutConstraint)cvHeightConstraint
{
  return self->_cvHeightConstraint;
}

- (void)setCvHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_cvHeightConstraint, a3);
}

- (UIStackView)contentStack
{
  return self->_contentStack;
}

- (void)setContentStack:(id)a3
{
  objc_storeStrong((id *)&self->_contentStack, a3);
}

- (UIStackView)titleStack
{
  return self->_titleStack;
}

- (void)setTitleStack:(id)a3
{
  objc_storeStrong((id *)&self->_titleStack, a3);
}

- (UIStackView)footerStack
{
  return self->_footerStack;
}

- (void)setFooterStack:(id)a3
{
  objc_storeStrong((id *)&self->_footerStack, a3);
}

- (UILabel)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
  objc_storeStrong((id *)&self->_footer, a3);
}

- (NSArray)snapshotRequests
{
  return self->_snapshotRequests;
}

- (void)setSnapshotRequests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1120);
}

- (BOOL)allSnapshotsLoaded
{
  return self->_allSnapshotsLoaded;
}

- (BOOL)showFooterInCollectionView
{
  return self->_showFooterInCollectionView;
}

- (void)setShowFooterInCollectionView:(BOOL)a3
{
  self->_showFooterInCollectionView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotRequests, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_footerStack, 0);
  objc_storeStrong((id *)&self->_titleStack, 0);
  objc_storeStrong((id *)&self->_contentStack, 0);
  objc_storeStrong((id *)&self->_cvHeightConstraint, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end
