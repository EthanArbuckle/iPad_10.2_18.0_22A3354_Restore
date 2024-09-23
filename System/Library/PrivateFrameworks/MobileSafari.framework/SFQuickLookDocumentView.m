@implementation SFQuickLookDocumentView

- (SFQuickLookDocumentView)initWithFrame:(CGRect)a3
{
  SFQuickLookDocumentView *v3;
  void *v4;
  void *v5;
  UIView *v6;
  UIView *wrapperView;
  UIView *v8;
  UIView *contentView;
  SFQuickLookDocumentInfoView *v10;
  SFQuickLookDocumentInfoView *documentInfoView;
  SFQuickLookDocumentInfoView *v12;
  void *v13;
  UIStackView *v14;
  UIStackView *actionButtonsView;
  void *v16;
  void *v17;
  id v18;
  SFQuickLookDocumentView *v19;
  objc_super v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)SFQuickLookDocumentView;
  v3 = -[SFQuickLookDocumentView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFQuickLookDocumentView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    objc_msgSend(MEMORY[0x1E0DC3658], "sf_safariAccentColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFQuickLookDocumentView setTintColor:](v3, "setTintColor:", v5);

    -[SFQuickLookDocumentView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("QuickLookDocumentView"));
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    wrapperView = v3->_wrapperView;
    v3->_wrapperView = v6;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_wrapperView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFQuickLookDocumentView addSubview:](v3, "addSubview:", v3->_wrapperView);
    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    contentView = v3->_contentView;
    v3->_contentView = v8;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v3->_wrapperView, "addSubview:", v3->_contentView);
    v10 = objc_alloc_init(SFQuickLookDocumentInfoView);
    documentInfoView = v3->_documentInfoView;
    v3->_documentInfoView = v10;

    -[SFQuickLookDocumentInfoView setTranslatesAutoresizingMaskIntoConstraints:](v3->_documentInfoView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFQuickLookDocumentInfoView setUserInteractionEnabled:](v3->_documentInfoView, "setUserInteractionEnabled:", 1);
    v12 = v3->_documentInfoView;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3750]), "initWithDelegate:", v3);
    -[SFQuickLookDocumentInfoView addInteraction:](v12, "addInteraction:", v13);

    -[UIView addSubview:](v3->_contentView, "addSubview:", v3->_documentInfoView);
    v14 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    actionButtonsView = v3->_actionButtonsView;
    v3->_actionButtonsView = v14;

    -[UIStackView setAxis:](v3->_actionButtonsView, "setAxis:", 1);
    -[UIStackView setBaselineRelativeArrangement:](v3->_actionButtonsView, "setBaselineRelativeArrangement:", 1);
    -[UIStackView setDistribution:](v3->_actionButtonsView, "setDistribution:", 3);
    -[UIStackView setSpacing:](v3->_actionButtonsView, "setSpacing:", 32.0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_actionButtonsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v3->_contentView, "addSubview:", v3->_actionButtonsView);
    -[SFQuickLookDocumentView _setUpLayoutConstraints](v3, "_setUpLayoutConstraints");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v3, sel__updatePropertiesDefinedByContentSizeCategory, *MEMORY[0x1E0DC48E8], 0);

    -[SFQuickLookDocumentView _updatePropertiesDefinedByContentSizeCategory](v3, "_updatePropertiesDefinedByContentSizeCategory");
    v22[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)-[SFQuickLookDocumentView registerForTraitChanges:withTarget:action:](v3, "registerForTraitChanges:withTarget:action:", v17, v3, sel__updateOrientationBasedConstraints);

    v19 = v3;
  }

  return v3;
}

- (void)updateActionTitles:(id)a3
{
  NSArray *v4;
  NSArray *actionButtons;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __46__SFQuickLookDocumentView_updateActionTitles___block_invoke;
  v25[3] = &unk_1E21E6370;
  v25[4] = self;
  objc_msgSend(a3, "safari_mapObjectsUsingBlock:", v25);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  actionButtons = self->_actionButtons;
  self->_actionButtons = v4;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[UIStackView arrangedSubviews](self->_actionButtonsView, "arrangedSubviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v11, "removeTarget:action:forControlEvents:", self, 0, 0);
        -[UIStackView removeArrangedSubview:](self->_actionButtonsView, "removeArrangedSubview:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v8);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = self->_actionButtons;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[UIStackView addArrangedSubview:](self->_actionButtonsView, "addArrangedSubview:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
    }
    while (v14);
  }

  -[SFQuickLookDocumentView _updatePropertiesDefinedByContentSizeCategory](self, "_updatePropertiesDefinedByContentSizeCategory");
}

id __46__SFQuickLookDocumentView_updateActionTitles___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0DC3518];
  v4 = a2;
  objc_msgSend(v3, "buttonWithType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:forState:", v4, 0);

  objc_msgSend(v5, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__actionButtonTapped_, 0x2000);
  return v5;
}

- (void)updateDocumentFileName:(id)a3
{
  -[SFQuickLookDocumentInfoView setFileName:](self->_documentInfoView, "setFileName:", a3);
}

- (void)updateDocumentFileSize:(id)a3
{
  -[SFQuickLookDocumentInfoView setFileSize:](self->_documentInfoView, "setFileSize:", a3);
}

- (void)updateDocumentFileType:(id)a3
{
  -[SFQuickLookDocumentInfoView setFileType:](self->_documentInfoView, "setFileType:", a3);
}

- (void)updateDocumentIcon:(id)a3
{
  SFQuickLookDocumentInfoView *documentInfoView;
  id v4;
  id v5;

  documentInfoView = self->_documentInfoView;
  v4 = a3;
  -[SFQuickLookDocumentInfoView iconImageView](documentInfoView, "iconImageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (CGRect)frameForButtonAtIndex:(unint64_t)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[NSArray objectAtIndexedSubscript:](self->_actionButtons, "objectAtIndexedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[SFQuickLookDocumentView convertRect:fromView:](self, "convertRect:fromView:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)_setUpLayoutConstraints
{
  void *v3;
  void *v4;
  NSLayoutConstraint *v5;
  NSLayoutConstraint *documentInfoViewBottomAnchorConstraint;
  NSLayoutConstraint *v7;
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
  _QWORD v64[21];

  v64[19] = *MEMORY[0x1E0C80C00];
  -[UIStackView topAnchor](self->_actionButtonsView, "topAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFQuickLookDocumentInfoView bottomAnchor](self->_documentInfoView, "bottomAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v4);
  v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  documentInfoViewBottomAnchorConstraint = self->_documentInfoViewBottomAnchorConstraint;
  self->_documentInfoViewBottomAnchorConstraint = v5;

  v42 = (void *)MEMORY[0x1E0CB3718];
  -[UIView topAnchor](self->_wrapperView, "topAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFQuickLookDocumentView topAnchor](self, "topAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:", v62);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v61;
  -[UIView bottomAnchor](self->_wrapperView, "bottomAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFQuickLookDocumentView bottomAnchor](self, "bottomAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:", v59);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v58;
  -[UIView leadingAnchor](self->_wrapperView, "leadingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFQuickLookDocumentView leadingAnchor](self, "leadingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:", v56);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v64[2] = v55;
  -[UIView trailingAnchor](self->_wrapperView, "trailingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFQuickLookDocumentView trailingAnchor](self, "trailingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v53);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v64[3] = v52;
  -[UIView centerXAnchor](self->_wrapperView, "centerXAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFQuickLookDocumentView centerXAnchor](self, "centerXAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v50);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v64[4] = v49;
  -[UIView heightAnchor](self->_wrapperView, "heightAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFQuickLookDocumentView heightAnchor](self, "heightAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintGreaterThanOrEqualToAnchor:", v47);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v64[5] = v46;
  -[UIView topAnchor](self->_contentView, "topAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_wrapperView, "topAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintGreaterThanOrEqualToAnchor:constant:", v44, 16.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v64[6] = v43;
  -[UIView bottomAnchor](self->_contentView, "bottomAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_wrapperView, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintLessThanOrEqualToAnchor:constant:", v40, -16.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v64[7] = v39;
  -[UIView leadingAnchor](self->_contentView, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_wrapperView, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, 10.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v64[8] = v36;
  -[UIView trailingAnchor](self->_contentView, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_wrapperView, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34, -10.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v64[9] = v33;
  -[UIView centerXAnchor](self->_contentView, "centerXAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_wrapperView, "centerXAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v64[10] = v30;
  -[UIView centerYAnchor](self->_contentView, "centerYAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self->_wrapperView, "centerYAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self->_documentInfoViewBottomAnchorConstraint;
  v64[11] = v27;
  v64[12] = v7;
  -[SFQuickLookDocumentInfoView centerXAnchor](self->_documentInfoView, "centerXAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_contentView, "centerXAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v64[13] = v24;
  -[SFQuickLookDocumentInfoView topAnchor](self->_documentInfoView, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_contentView, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v64[14] = v21;
  -[SFQuickLookDocumentInfoView widthAnchor](self->_documentInfoView, "widthAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](self->_contentView, "widthAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintLessThanOrEqualToAnchor:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v64[15] = v18;
  -[UIStackView centerXAnchor](self->_actionButtonsView, "centerXAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_contentView, "centerXAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v64[16] = v9;
  -[UIStackView widthAnchor](self->_actionButtonsView, "widthAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](self->_contentView, "widthAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintLessThanOrEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v64[17] = v12;
  -[UIStackView bottomAnchor](self->_actionButtonsView, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_contentView, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintLessThanOrEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v64[18] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "activateConstraints:", v16);

  -[SFQuickLookDocumentView _updateOrientationBasedConstraints](self, "_updateOrientationBasedConstraints");
}

- (void)_updateOrientationBasedConstraints
{
  void *v3;
  uint64_t v4;
  double v5;

  -[SFQuickLookDocumentView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "verticalSizeClass");

  v5 = 56.0;
  if (v4 == 1)
    v5 = 32.0;
  -[NSLayoutConstraint setConstant:](self->_documentInfoViewBottomAnchorConstraint, "setConstant:", v5);
}

- (void)_updatePropertiesDefinedByContentSizeCategory
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 0, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_actionButtons;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "titleLabel", (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setFont:", v4);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "_scaledValueForValue:", 32.0);
  -[UIStackView setSpacing:](self->_actionButtonsView, "setSpacing:");

}

- (void)_actionButtonTapped:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_quickLookDocumentViewDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "quickLookDocumentView:didSelectActionAtIndex:", self, -[NSArray indexOfObjectIdenticalTo:](self->_actionButtons, "indexOfObjectIdenticalTo:", v5));

}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_quickLookDocumentViewDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "itemProviderForQuickLookDocumentView:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3758]), "initWithItemProvider:", v6);
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v6 = objc_alloc_init(MEMORY[0x1E0DC3768]);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  v8 = objc_alloc(MEMORY[0x1E0DC3D88]);
  -[SFQuickLookDocumentInfoView iconImageView](self->_documentInfoView, "iconImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithView:parameters:", v9, v6);

  return v10;
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  id WeakRetained;
  int64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_quickLookDocumentViewDelegate);
  v6 = objc_msgSend(WeakRetained, "dataOwnerForQuickLookDocumentView:", self);

  return v6;
}

- (SFQuickLookDocumentViewDelegate)quickLookDocumentViewDelegate
{
  return (SFQuickLookDocumentViewDelegate *)objc_loadWeakRetained((id *)&self->_quickLookDocumentViewDelegate);
}

- (void)setQuickLookDocumentViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_quickLookDocumentViewDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_quickLookDocumentViewDelegate);
  objc_storeStrong((id *)&self->_documentInfoViewBottomAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_actionButtonsView, 0);
  objc_storeStrong((id *)&self->_actionButtons, 0);
  objc_storeStrong((id *)&self->_documentInfoView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_wrapperView, 0);
}

@end
