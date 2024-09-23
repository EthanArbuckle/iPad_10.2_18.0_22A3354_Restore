@implementation SFPrivateBrowsingExplanationModuleContentView

- (SFPrivateBrowsingExplanationModuleContentView)initWithBanner:(id)a3
{
  id v5;
  SFPrivateBrowsingExplanationModuleContentView *v6;
  SFPrivateBrowsingExplanationModuleContentView *v7;
  uint64_t v8;
  UILabel *titleLabel;
  double v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  UITextView *messageTextView;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  UIButton *dismissButton;
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
  uint64_t v49;
  NSArray *constraintsForTitleBelowDismissButton;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  NSArray *constraintsForTitleNextToDismissButton;
  UICollectionView *explanationItemCollectionView;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  SFPrivateBrowsingExplanationModuleContentView *v70;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  objc_super v103;
  _QWORD v104[2];
  _QWORD v105[3];
  void *v106;
  void *v107;
  _QWORD v108[2];
  _QWORD v109[4];
  _QWORD v110[10];

  v110[8] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v103.receiver = self;
  v103.super_class = (Class)SFPrivateBrowsingExplanationModuleContentView;
  v6 = -[SFPrivateBrowsingExplanationModuleContentView initWithFrame:](&v103, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    v101 = v5;
    objc_storeStrong((id *)&v6->_banner, a3);
    -[SFPrivateBrowsingExplanationModuleContentView setLayoutMargins:](v7, "setLayoutMargins:", 30.0, 30.0, 30.0, 30.0);
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4B50], *MEMORY[0x1E0DC1448]);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3990], "sf_startPageBannerTitleLabelWithFont:");
    v8 = objc_claimAutoreleasedReturnValue();
    titleLabel = v7->_titleLabel;
    v7->_titleLabel = (UILabel *)v8;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v7->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFPrivateBrowsingExplanationModuleContentView addSubview:](v7, "addSubview:", v7->_titleLabel);
    -[SFPrivateBrowsingExplanationModuleContentView _setUpMessageTextIfNecessary](v7, "_setUpMessageTextIfNecessary");
    -[SFPrivateBrowsingExplanationModuleContentView _setUpExplanationItemCollectionViewIfNeeded](v7, "_setUpExplanationItemCollectionViewIfNeeded");
    -[SFPrivateBrowsingExplanationModuleContentView _setUpDismissButtonIfNeeded](v7, "_setUpDismissButtonIfNeeded");
    LODWORD(v10) = 1132068864;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v7->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v10);
    -[UICollectionView bottomAnchor](v7->_explanationItemCollectionView, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      -[UITextView bottomAnchor](v7->_messageTextView, "bottomAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v16 = v14;
      }
      else
      {
        -[UILabel bottomAnchor](v7->_titleLabel, "bottomAnchor");
        v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      v13 = v16;

    }
    -[SFPrivateBrowsingExplanationModuleContentView readableContentGuide](v7, "readableContentGuide");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel leadingAnchor](v7->_titleLabel, "leadingAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leadingAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "constraintGreaterThanOrEqualToAnchor:", v92);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v110[0] = v89;
    -[UILabel topAnchor](v7->_titleLabel, "topAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "constraintGreaterThanOrEqualToAnchor:", v85);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v110[1] = v83;
    -[UILabel topAnchor](v7->_titleLabel, "topAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "constraintEqualToAnchor:", v81);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = 1132134400;
    objc_msgSend(v80, "sf_withPriority:", v18);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v110[2] = v79;
    objc_msgSend(v17, "trailingAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v7->_titleLabel, "trailingAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintGreaterThanOrEqualToAnchor:", v76);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v110[3] = v75;
    -[UILabel centerXAnchor](v7->_titleLabel, "centerXAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivateBrowsingExplanationModuleContentView centerXAnchor](v7, "centerXAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:", v73);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v110[4] = v72;
    -[UILabel widthAnchor](v7->_titleLabel, "widthAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "widthAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintLessThanOrEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v110[5] = v21;
    objc_msgSend(v17, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintGreaterThanOrEqualToAnchor:", v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v110[6] = v23;
    v102 = v17;
    objc_msgSend(v17, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = v13;
    objc_msgSend(v24, "constraintEqualToAnchor:", v13);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = 1132068864;
    objc_msgSend(v25, "sf_withPriority:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v110[7] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v110, 8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "activateConstraints:", v28);

    messageTextView = v7->_messageTextView;
    if (messageTextView)
    {
      v84 = (void *)MEMORY[0x1E0CB3718];
      -[UITextView firstBaselineAnchor](messageTextView, "firstBaselineAnchor");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel lastBaselineAnchor](v7->_titleLabel, "lastBaselineAnchor");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v93, 1.0);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v109[0] = v90;
      -[UITextView leadingAnchor](v7->_messageTextView, "leadingAnchor");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "leadingAnchor");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "constraintGreaterThanOrEqualToAnchor:", v86);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v109[1] = v30;
      objc_msgSend(v102, "trailingAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView trailingAnchor](v7->_messageTextView, "trailingAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintGreaterThanOrEqualToAnchor:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v109[2] = v33;
      -[UITextView centerXAnchor](v7->_messageTextView, "centerXAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPrivateBrowsingExplanationModuleContentView centerXAnchor](v7, "centerXAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintEqualToAnchor:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v109[3] = v36;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v109, 4);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "activateConstraints:", v37);

    }
    dismissButton = v7->_dismissButton;
    if (dismissButton)
    {
      v94 = (void *)MEMORY[0x1E0CB3718];
      -[UIButton leadingAnchor](dismissButton, "leadingAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPrivateBrowsingExplanationModuleContentView leadingAnchor](v7, "leadingAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40, 10.0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v108[0] = v41;
      -[UIButton topAnchor](v7->_dismissButton, "topAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPrivateBrowsingExplanationModuleContentView topAnchor](v7, "topAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "constraintEqualToAnchor:constant:", v43, 10.0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v108[1] = v44;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v108, 2);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "activateConstraints:", v45);

      -[UILabel topAnchor](v7->_titleLabel, "topAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton bottomAnchor](v7->_dismissButton, "bottomAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "constraintEqualToAnchor:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = v48;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v107, 1);
      v49 = objc_claimAutoreleasedReturnValue();
      constraintsForTitleBelowDismissButton = v7->_constraintsForTitleBelowDismissButton;
      v7->_constraintsForTitleBelowDismissButton = (NSArray *)v49;

      -[UILabel leadingAnchor](v7->_titleLabel, "leadingAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton trailingAnchor](v7->_dismissButton, "trailingAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "constraintGreaterThanOrEqualToAnchor:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = v53;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v106, 1);
      v54 = objc_claimAutoreleasedReturnValue();
      constraintsForTitleNextToDismissButton = v7->_constraintsForTitleNextToDismissButton;
      v7->_constraintsForTitleNextToDismissButton = (NSArray *)v54;

      -[SFPrivateBrowsingExplanationModuleContentView _updateAllowsTitleNextToDismissButton](v7, "_updateAllowsTitleNextToDismissButton");
    }
    explanationItemCollectionView = v7->_explanationItemCollectionView;
    if (explanationItemCollectionView)
    {
      v91 = (void *)MEMORY[0x1E0CB3718];
      -[UICollectionView leadingAnchor](explanationItemCollectionView, "leadingAnchor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "leadingAnchor");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = v57;
      objc_msgSend(v57, "constraintEqualToAnchor:");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v105[0] = v58;
      -[UICollectionView topAnchor](v7->_explanationItemCollectionView, "topAnchor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView lastBaselineAnchor](v7->_messageTextView, "lastBaselineAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v60;
      if (!v60)
      {
        -[UILabel lastBaselineAnchor](v7->_titleLabel, "lastBaselineAnchor");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v59, "constraintEqualToAnchor:constant:", v61, 20.0);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v105[1] = v62;
      objc_msgSend(v102, "trailingAnchor");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionView trailingAnchor](v7->_explanationItemCollectionView, "trailingAnchor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "constraintEqualToAnchor:", v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v105[2] = v65;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 3);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "activateConstraints:", v66);

      if (!v60)
    }
    -[SFPrivateBrowsingExplanationModuleContentView _bannerDidChange](v7, "_bannerDidChange");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "addObserver:selector:name:object:", v7, sel__applyMessageViewLinkTextAttributes, *MEMORY[0x1E0DC44E0], 0);

    v104[0] = objc_opt_class();
    v104[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 2);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = (id)-[SFPrivateBrowsingExplanationModuleContentView registerForTraitChanges:withTarget:action:](v7, "registerForTraitChanges:withTarget:action:", v68, v7, sel__updateAllowsTitleNextToDismissButton);

    v70 = v7;
    v5 = v101;
  }

  return v7;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat Width;
  double v5;
  double v6;
  double v7;
  CGSize result;
  CGRect v9;

  -[SFPrivateBrowsingExplanationModuleContentView bounds](self, "bounds", a3.width, a3.height);
  Width = CGRectGetWidth(v9);
  -[SFPrivateBrowsingExplanationModuleContentView _preferredHeight](self, "_preferredHeight");
  v6 = v5;
  v7 = Width;
  result.height = v6;
  result.width = v7;
  return result;
}

- (double)_preferredHeight
{
  double v3;
  double v4;
  double v5;
  CGRect v7;

  -[SFPrivateBrowsingExplanationModuleContentView bounds](self, "bounds");
  -[SFPrivateBrowsingExplanationModuleContentView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", CGRectGetWidth(v7), *(double *)(MEMORY[0x1E0DC4FF8] + 8));
  v4 = v3;
  -[UICollectionView contentSize](self->_explanationItemCollectionView, "contentSize");
  return v4 + v5;
}

- (void)setBanner:(id)a3
{
  void *v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  -[WBSStartPageBanner privateBrowsingExplanationItems](self->_banner, "privateBrowsingExplanationItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "privateBrowsingExplanationItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_banner, a3);
    -[SFPrivateBrowsingExplanationModuleContentView _bannerDidChange](self, "_bannerDidChange");
  }

}

- (void)_bannerDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  id v8;

  -[SFPrivateBrowsingExplanationModuleContentView _title](self, "_title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleLabel, "setText:", v3);

  if (-[SFPrivateBrowsingExplanationModuleContentView _hasMessageText](self, "_hasMessageText"))
  {
    -[SFPrivateBrowsingExplanationModuleContentView _attributedMessage](self, "_attributedMessage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setAttributedText:](self->_messageTextView, "setAttributedText:", v4);

    -[SFPrivateBrowsingExplanationModuleContentView _applyMessageTextViewStyle](self, "_applyMessageTextViewStyle");
  }
  if (self->_explanationItemCollectionView)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0DC3398]);
    objc_msgSend(v8, "appendSectionsWithIdentifiers:", &unk_1E2245CD8);
    -[WBSStartPageBanner privateBrowsingExplanationItems](self->_banner, "privateBrowsingExplanationItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendItemsWithIdentifiers:", v5);

    -[UICollectionView indexPathsForVisibleItems](self->_explanationItemCollectionView, "indexPathsForVisibleItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") != 0;

    -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_explanationItemCollectionViewDataSource, "applySnapshot:animatingDifferences:", v8, v7);
  }
}

- (id)_title
{
  void *v2;

  v2 = (void *)-[WBSStartPageBanner privateBrowsingExplanationState](self->_banner, "privateBrowsingExplanationState");
  if ((unint64_t)v2 <= 1)
  {
    _WBSLocalizedString();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)_setUpMessageTextIfNecessary
{
  UITextView *v3;
  UITextView *messageTextView;
  void *v5;
  _QWORD v6[5];

  if (-[SFPrivateBrowsingExplanationModuleContentView _hasMessageText](self, "_hasMessageText"))
  {
    v3 = (UITextView *)objc_alloc_init(MEMORY[0x1E0DC3E50]);
    messageTextView = self->_messageTextView;
    self->_messageTextView = v3;

    -[UITextView setAdjustsFontForContentSizeCategory:](self->_messageTextView, "setAdjustsFontForContentSizeCategory:", 1);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __77__SFPrivateBrowsingExplanationModuleContentView__setUpMessageTextIfNecessary__block_invoke;
    v6[3] = &unk_1E21E2050;
    v6[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v6);
    -[UITextView setDelegate:](self->_messageTextView, "setDelegate:", self);
    -[UITextView setEditable:](self->_messageTextView, "setEditable:", 0);
    -[UITextView _setInteractiveTextSelectionDisabled:](self->_messageTextView, "_setInteractiveTextSelectionDisabled:", 1);
    -[UITextView setScrollEnabled:](self->_messageTextView, "setScrollEnabled:", 0);
    -[UITextView textContainer](self->_messageTextView, "textContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLineFragmentPadding:", 0.0);

    -[UITextView setTextContainerInset:](self->_messageTextView, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_messageTextView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFPrivateBrowsingExplanationModuleContentView _applyMessageViewLinkTextAttributes](self, "_applyMessageViewLinkTextAttributes");
    -[SFPrivateBrowsingExplanationModuleContentView addSubview:](self, "addSubview:", self->_messageTextView);
  }
}

uint64_t __77__SFPrivateBrowsingExplanationModuleContentView__setUpMessageTextIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setBackgroundColor:", 0);
}

- (BOOL)_hasMessageText
{
  return -[WBSStartPageBanner privateBrowsingExplanationState](self->_banner, "privateBrowsingExplanationState") == 1;
}

- (id)_attributedMessage
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!-[SFPrivateBrowsingExplanationModuleContentView _hasMessageText](self, "_hasMessageText"))
    return 0;
  v2 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v2, "setParagraphSpacing:", 8.0);
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0CB3778]);
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("\n"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0DC1178];
  v11 = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithString:attributes:", v6, v7);

  return v8;
}

- (void)_applyMessageViewLinkTextAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E08];
  v7 = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (UIAccessibilityButtonShapesEnabled())
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E22454E8, *MEMORY[0x1E0DC1248]);
  -[UITextView setLinkTextAttributes:](self->_messageTextView, "setLinkTextAttributes:", v6);

}

- (void)_applyMessageTextViewStyle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setFont:](self->_messageTextView, "setFont:", v3);

  -[UITextView setTextAlignment:](self->_messageTextView, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setTextColor:](self->_messageTextView, "setTextColor:", v4);

  v7 = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setLinkTextAttributes:](self->_messageTextView, "setLinkTextAttributes:", v6);

}

- (void)_setUpDismissButtonIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIButton *v8;
  UIButton *dismissButton;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  if (!-[WBSStartPageBanner privateBrowsingExplanationState](self->_banner, "privateBrowsingExplanationState"))
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setButtonSize:", 3);
    objc_msgSend(v3, "setContentInsets:", 10.0, 5.0, 10.0, 5.0);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark.circle.fill"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setImage:", v4);

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithWeight:", 9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPreferredSymbolConfigurationForImage:", v5);

    v6 = (void *)MEMORY[0x1E0DC3428];
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __76__SFPrivateBrowsingExplanationModuleContentView__setUpDismissButtonIfNeeded__block_invoke;
    v14 = &unk_1E21E3138;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v6, "actionWithHandler:", &v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v3, v7, v11, v12, v13, v14);
    v8 = (UIButton *)objc_claimAutoreleasedReturnValue();
    dismissButton = self->_dismissButton;
    self->_dismissButton = v8;

    -[UIButton setPointerStyleProvider:](self->_dismissButton, "setPointerStyleProvider:", &__block_literal_global_7);
    -[UIButton setTintAdjustmentMode:](self->_dismissButton, "setTintAdjustmentMode:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](self->_dismissButton, "setTintColor:", v10);

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_dismissButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton _setTouchInsets:](self->_dismissButton, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    -[SFPrivateBrowsingExplanationModuleContentView addSubview:](self, "addSubview:", self->_dismissButton);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __76__SFPrivateBrowsingExplanationModuleContentView__setUpDismissButtonIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dismissModule");

}

id __76__SFPrivateBrowsingExplanationModuleContentView__setUpDismissButtonIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a2;
  v7 = a3;
  v8 = a4;
  if (UIAccessibilityButtonShapesEnabled())
  {
    objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0DC3B20];
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", v6);
    objc_msgSend(v10, "effectWithPreview:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0DC3B30];
    v14 = (void *)MEMORY[0x1E0DC3508];
    objc_msgSend(v6, "imageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    objc_msgSend(v14, "bezierPathWithOvalInRect:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shapeWithPath:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v12, v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)_updateAllowsTitleNextToDismissButton
{
  int *v3;
  int *v4;
  NSString *v5;
  _BOOL4 IsAccessibilityCategory;
  int *v7;
  id v8;

  if (self->_dismissButton)
  {
    -[SFPrivateBrowsingExplanationModuleContentView traitCollection](self, "traitCollection");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v3 = &OBJC_IVAR___SFPrivateBrowsingExplanationModuleContentView__constraintsForTitleNextToDismissButton;
    v4 = &OBJC_IVAR___SFPrivateBrowsingExplanationModuleContentView__constraintsForTitleBelowDismissButton;
    if (objc_msgSend(v8, "horizontalSizeClass") == 1)
    {
      objc_msgSend(v8, "preferredContentSizeCategory");
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

      if (IsAccessibilityCategory)
        v7 = &OBJC_IVAR___SFPrivateBrowsingExplanationModuleContentView__constraintsForTitleNextToDismissButton;
      else
        v7 = &OBJC_IVAR___SFPrivateBrowsingExplanationModuleContentView__constraintsForTitleBelowDismissButton;
      if (IsAccessibilityCategory)
        v3 = &OBJC_IVAR___SFPrivateBrowsingExplanationModuleContentView__constraintsForTitleBelowDismissButton;
      v4 = v7;
    }
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", *(Class *)((char *)&self->super.super.super.isa + *v4));
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", *(Class *)((char *)&self->super.super.super.isa + *v3));

  }
}

- (void)_dismissModule
{
  void (**v2)(void);
  void (**v3)(void);

  -[WBSStartPageBanner privateBrowsingExplanationDismissHandler](self->_banner, "privateBrowsingExplanationDismissHandler");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v2[2]();
    v2 = v3;
  }

}

- (void)_setUpExplanationItemCollectionViewIfNeeded
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  UICollectionView *v13;
  UICollectionView *explanationItemCollectionView;
  uint64_t v15;
  void *v16;
  id v17;
  UICollectionView *v18;
  id v19;
  UICollectionViewDiffableDataSource *v20;
  UICollectionViewDiffableDataSource *explanationItemCollectionViewDataSource;
  _QWORD v22[4];
  id v23;
  _QWORD v24[5];

  if (!-[WBSStartPageBanner privateBrowsingExplanationState](self->_banner, "privateBrowsingExplanationState"))
  {
    v3 = objc_alloc(MEMORY[0x1E0DC35B8]);
    -[SFPrivateBrowsingExplanationModuleContentView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35D0]), "initWithSectionProvider:", &__block_literal_global_226);
    v13 = (UICollectionView *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v12, v5, v7, v9, v11);
    explanationItemCollectionView = self->_explanationItemCollectionView;
    self->_explanationItemCollectionView = v13;

    -[UICollectionView setAllowsSelection:](self->_explanationItemCollectionView, "setAllowsSelection:", 0);
    -[UICollectionView setClipsToBounds:](self->_explanationItemCollectionView, "setClipsToBounds:", 0);
    v15 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __92__SFPrivateBrowsingExplanationModuleContentView__setUpExplanationItemCollectionViewIfNeeded__block_invoke;
    v24[3] = &unk_1E21E2050;
    v24[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v24);
    -[UICollectionView setScrollEnabled:](self->_explanationItemCollectionView, "setScrollEnabled:", 0);
    -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](self->_explanationItemCollectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFPrivateBrowsingExplanationModuleContentView addSubview:](self, "addSubview:", self->_explanationItemCollectionView);
    objc_msgSend(MEMORY[0x1E0DC35C8], "registrationWithCellClass:configurationHandler:", objc_opt_class(), &__block_literal_global_72);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc(MEMORY[0x1E0DC35E8]);
    v18 = self->_explanationItemCollectionView;
    v22[0] = v15;
    v22[1] = 3221225472;
    v22[2] = __92__SFPrivateBrowsingExplanationModuleContentView__setUpExplanationItemCollectionViewIfNeeded__block_invoke_3;
    v22[3] = &unk_1E21E31E0;
    v23 = v16;
    v19 = v16;
    v20 = (UICollectionViewDiffableDataSource *)objc_msgSend(v17, "initWithCollectionView:cellProvider:", v18, v22);
    explanationItemCollectionViewDataSource = self->_explanationItemCollectionViewDataSource;
    self->_explanationItemCollectionViewDataSource = v20;

  }
}

uint64_t __92__SFPrivateBrowsingExplanationModuleContentView__setUpExplanationItemCollectionViewIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setBackgroundColor:", 0);
}

uint64_t __92__SFPrivateBrowsingExplanationModuleContentView__setUpExplanationItemCollectionViewIfNeeded__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "setItem:", a4);
}

uint64_t __92__SFPrivateBrowsingExplanationModuleContentView__setUpExplanationItemCollectionViewIfNeeded__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", *(_QWORD *)(a1 + 32), a3, a4);
}

- (WBSStartPageBanner)banner
{
  return self->_banner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_messageTextView, 0);
  objc_storeStrong((id *)&self->_explanationItemCollectionViewDataSource, 0);
  objc_storeStrong((id *)&self->_explanationItemCollectionView, 0);
  objc_storeStrong((id *)&self->_constraintsForTitleNextToDismissButton, 0);
  objc_storeStrong((id *)&self->_constraintsForTitleBelowDismissButton, 0);
  objc_storeStrong((id *)&self->_banner, 0);
}

@end
