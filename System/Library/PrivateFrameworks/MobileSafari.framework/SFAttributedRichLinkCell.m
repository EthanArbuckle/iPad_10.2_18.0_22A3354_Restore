@implementation SFAttributedRichLinkCell

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("AttributedRichLinkCell");
}

- (SFAttributedRichLinkCell)initWithFrame:(CGRect)a3
{
  SFAttributedRichLinkCell *v3;
  SFAttributedRichLinkCell *v4;
  void *v5;
  UIView *v6;
  UIView *linkViewContainer;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  LPLinkView *v22;
  LPLinkView *linkView;
  id v24;
  id v25;
  int v26;
  UIView *v27;
  LPLinkView *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  UILabel *v37;
  UILabel *relativeDateLabel;
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
  id v52;
  void *v53;
  SFAttributedRichLinkCell *v54;
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
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  objc_super v73;
  _QWORD v74[2];
  _QWORD v75[3];
  _QWORD v76[5];
  _QWORD v77[5];

  v77[3] = *MEMORY[0x1E0C80C00];
  v73.receiver = self;
  v73.super_class = (Class)SFAttributedRichLinkCell;
  v3 = -[SFStartPageFilledBackgroundCell initWithFrame:](&v73, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFAttributedRichLinkCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    linkViewContainer = v4->_linkViewContainer;
    v4->_linkViewContainer = v6;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_linkViewContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView _setContinuousCornerRadius:](v4->_linkViewContainer, "_setContinuousCornerRadius:", 10.0);
    objc_msgSend(v5, "addSubview:", v4->_linkViewContainer);
    v63 = (void *)MEMORY[0x1E0CB3718];
    -[UIView topAnchor](v4->_linkViewContainer, "topAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:", v69);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = v66;
    -[UIView leadingAnchor](v4->_linkViewContainer, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v77[1] = v10;
    -[UIView trailingAnchor](v4->_linkViewContainer, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v77[2] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "activateConstraints:", v14);

    v15 = 0x1E0D89000uLL;
    LODWORD(v11) = objc_msgSend(MEMORY[0x1E0D89BE8], "is2024SuggestionsEnabled");
    -[UIView bottomAnchor](v4->_linkViewContainer, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v5;
    objc_msgSend(v5, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v18;
    if ((_DWORD)v11)
    {
      objc_msgSend(v18, "setActive:", 1);
    }
    else
    {
      LODWORD(v19) = 1132068864;
      objc_msgSend(v18, "sf_withPriority:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setActive:", 1);

    }
    v22 = (LPLinkView *)objc_alloc_init(MEMORY[0x1E0CC11C8]);
    linkView = v4->_linkView;
    v4->_linkView = v22;

    v24 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
    -[LPLinkView setMetadata:](v4->_linkView, "setMetadata:", v24);

    if (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024SuggestionsEnabled"))
    {
      -[LPLinkView setContentInset:](v4->_linkView, "setContentInset:", 0.0, 0.0, 30.0, 0.0);
      -[LPLinkView _setEffectiveCornerRadius:](v4->_linkView, "_setEffectiveCornerRadius:", 10.0);
    }
    -[LPLinkView _setPreferredSizeClass:](v4->_linkView, "_setPreferredSizeClass:", 5);
    -[LPLinkView _setDisableTapGesture:](v4->_linkView, "_setDisableTapGesture:", 1);
    -[LPLinkView _setDisableAutoPlay:](v4->_linkView, "_setDisableAutoPlay:", 1);
    -[LPLinkView _setDisableAnimations:](v4->_linkView, "_setDisableAnimations:", 1);
    -[SFAttributedRichLinkCell _updateBackgroundColor](v4, "_updateBackgroundColor");
    -[LPLinkView setTranslatesAutoresizingMaskIntoConstraints:](v4->_linkView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v25 = objc_alloc_init(MEMORY[0x1E0CC11B0]);
    objc_msgSend(v25, "setAlignTextAndMediaHorizontalEdges:", 1);
    if (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024SuggestionsEnabled"))
      -[LPLinkView _setTextSafeAreaInset:](v4->_linkView, "_setTextSafeAreaInset:", 0.0, 7.0, 0.0, 7.0);
    -[LPLinkView _setSizeClassParameters:](v4->_linkView, "_setSizeClassParameters:", v25);
    v26 = objc_msgSend(MEMORY[0x1E0D89BE8], "is2024SuggestionsEnabled");
    v27 = v4->_linkViewContainer;
    v28 = v4->_linkView;
    v70 = v25;
    if (v26)
    {
      -[UIView addSubview:](v27, "addSubview:", v28);
      v58 = (void *)MEMORY[0x1E0CB3718];
      -[LPLinkView topAnchor](v4->_linkView, "topAnchor");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](v4->_linkViewContainer, "topAnchor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "constraintEqualToAnchor:", v64);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v76[0] = v62;
      -[LPLinkView leadingAnchor](v4->_linkView, "leadingAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](v4->_linkViewContainer, "leadingAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "constraintEqualToAnchor:", v60);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v76[1] = v59;
      -[LPLinkView trailingAnchor](v4->_linkView, "trailingAnchor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](v4->_linkViewContainer, "trailingAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "constraintEqualToAnchor:", v56);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v76[2] = v29;
      -[UIView heightAnchor](v4->_linkViewContainer, "heightAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPLinkView widthAnchor](v4->_linkView, "widthAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintEqualToAnchor:multiplier:", v31, 1.0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v76[3] = v32;
      -[LPLinkView heightAnchor](v4->_linkView, "heightAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView heightAnchor](v4->_linkViewContainer, "heightAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintEqualToAnchor:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v76[4] = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 5);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "activateConstraints:", v36);

      v15 = 0x1E0D89000;
    }
    else
    {
      -[UIView _sf_addEdgeMatchedSubview:](v27, "_sf_addEdgeMatchedSubview:", v28);
    }
    -[LPLinkView addObserver:forKeyPath:options:context:](v4->_linkView, "addObserver:forKeyPath:options:context:", v4, CFSTR("_effectiveTraitCollection"), 0, &startPageAttributedRichLinkCellKvoEffectiveTraitCollectionKey);
    if (objc_msgSend(*(id *)(v15 + 3048), "is2024SuggestionsEnabled"))
    {
      v37 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      relativeDateLabel = v4->_relativeDateLabel;
      v4->_relativeDateLabel = v37;

      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_relativeDateLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UILabel layer](v4->_relativeDateLabel, "layer");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setZPosition:", 1000.0);

      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v4->_relativeDateLabel, "setTextColor:", v40);

      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v4->_relativeDateLabel, "setFont:", v41);

      -[SFAttributedRichLinkCell _updateUserInterfaceStyle](v4, "_updateUserInterfaceStyle");
      -[UIView addSubview:](v4->_linkViewContainer, "addSubview:", v4->_relativeDateLabel);
      v65 = (void *)MEMORY[0x1E0CB3718];
      -[UIView bottomAnchor](v4->_linkViewContainer, "bottomAnchor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel bottomAnchor](v4->_relativeDateLabel, "bottomAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "constraintEqualToAnchor:constant:", v42, 12.0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v75[0] = v43;
      -[UILabel leadingAnchor](v4->_relativeDateLabel, "leadingAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](v4->_linkViewContainer, "leadingAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "constraintEqualToAnchor:constant:", v45, 7.0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v75[1] = v46;
      -[UIView trailingAnchor](v4->_linkViewContainer, "trailingAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel trailingAnchor](v4->_relativeDateLabel, "trailingAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "constraintEqualToAnchor:constant:", v48, 7.0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v75[2] = v49;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 3);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "activateConstraints:", v50);

    }
    -[SFAttributedRichLinkCell _updateAttributionViewBackground](v4, "_updateAttributionViewBackground");
    v74[0] = objc_opt_class();
    v74[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 2);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (id)-[SFAttributedRichLinkCell registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v51, sel__updateAttributionViewBackground);

    -[SFStartPageFilledBackgroundCell defaultBackgroundConfiguration](v4, "defaultBackgroundConfiguration");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setCornerRadius:", 10.0);
    -[SFAttributedRichLinkCell setBackgroundConfiguration:](v4, "setBackgroundConfiguration:", v53);
    v54 = v4;

  }
  return v4;
}

- (SFAttributedRichLinkCell)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFAttributedRichLinkCell;
  return -[SFAttributedRichLinkCell initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)dealloc
{
  objc_super v3;

  -[LPLinkView removeObserver:forKeyPath:context:](self->_linkView, "removeObserver:forKeyPath:context:", self, CFSTR("_effectiveTraitCollection"), &startPageAttributedRichLinkCellKvoEffectiveTraitCollectionKey);
  v3.receiver = self;
  v3.super_class = (Class)SFAttributedRichLinkCell;
  -[SFAttributedRichLinkCell dealloc](&v3, sel_dealloc);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  SLAttributionView *attributionView;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  BOOL v20;
  objc_super v21;
  CGPoint v22;
  CGRect v23;

  v6 = a3;
  v7 = a4;
  attributionView = self->_attributionView;
  if (!attributionView)
    goto LABEL_3;
  -[SLAttributionView bounds](attributionView, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v6, "anyObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "locationInView:", self->_attributionView);
  v22.x = v18;
  v22.y = v19;
  v23.origin.x = v10;
  v23.origin.y = v12;
  v23.size.width = v14;
  v23.size.height = v16;
  v20 = CGRectContainsPoint(v23, v22);

  if (!v20)
  {
LABEL_3:
    v21.receiver = self;
    v21.super_class = (Class)SFAttributedRichLinkCell;
    -[SFAttributedRichLinkCell touchesBegan:withEvent:](&v21, sel_touchesBegan_withEvent_, v6, v7);
  }

}

- (UIView)contextMenuPreviewView
{
  return self->_linkViewContainer;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  void *v4;
  double v5;
  double v6;
  int v7;
  SLAttributionView *attributionView;
  double v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SFAttributedRichLinkCell;
  -[SFAttributedRichLinkCell preferredLayoutAttributesFittingAttributes:](&v11, sel_preferredLayoutAttributesFittingAttributes_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v6 = v5;
  if ((objc_msgSend(MEMORY[0x1E0D89BE8], "is2024SuggestionsEnabled") & 1) == 0)
    _SFClamp(v6 * -0.002 + 1.15, 0.7, 0.85);
  v7 = objc_msgSend(MEMORY[0x1E0D89BE8], "is2024SuggestionsEnabled");
  if ((objc_msgSend(MEMORY[0x1E0D89BE8], "is2024SuggestionsEnabled") & 1) == 0)
  {
    attributionView = self->_attributionView;
    if (attributionView)
    {
      -[SLAttributionView layoutIfNeeded](attributionView, "layoutIfNeeded");
      -[SLAttributionView intrinsicContentSize](self->_attributionView, "intrinsicContentSize");
      objc_msgSend(MEMORY[0x1E0D89BE8], "is2024SuggestionsEnabled");
    }
  }
  v9 = 176.0;
  if (!v7)
    v9 = v6;
  objc_msgSend(v4, "setSize:", _SFRoundSizeToPixels(v9));
  return v4;
}

- (void)_updateAttributionViewBackground
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  if ((objc_msgSend(MEMORY[0x1E0D89BE8], "is2024SuggestionsEnabled") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    -[SFAttributedRichLinkCell traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "sf_usesVibrantAppearance"))
    {
      objc_msgSend(v4, "sf_backgroundBlurEffect");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v5 == 0;

    }
    else
    {
      v3 = 0;
    }

  }
  -[SLAttributionView updateBackgroundStyle:](self->_attributionView, "updateBackgroundStyle:", v3);
}

- (LPLinkMetadata)metadata
{
  return -[LPLinkView metadata](self->_linkView, "metadata");
}

- (void)setMetadata:(id)a3
{
  id v4;
  void *v5;
  char v6;
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
  uint64_t v23;
  id v24;
  void (**v25)(_QWORD);
  uint64_t v26;
  void *v27;
  void *v28;
  UITraitChangeRegistration *v29;
  UITraitChangeRegistration *userInterfaceStyleChangeRegistrationForMetadata;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  uint64_t v52;
  _QWORD v53[4];
  id v54;
  void (**v55)(_QWORD);
  id v56;
  _QWORD aBlock[4];
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id location;
  _QWORD v64[3];

  v64[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[LPLinkView metadata](self->_linkView, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = WBSIsEqual();

  if ((v6 & 1) == 0)
  {
    objc_initWeak(&location, self);
    if (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024SuggestionsEnabled"))
    {
      v7 = (void *)objc_msgSend(v4, "copy");

      objc_msgSend(v7, "image");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v50 = v8;
      }
      else
      {
        objc_msgSend(v7, "icon");
        v50 = (id)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(v7, "image");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "platformImage");
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "icon");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "platformImage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D8ACB8], "sharedManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "displayableImageForImage:withRequiredImageSize:", v51, 40.0, 40.0);
      v52 = objc_claimAutoreleasedReturnValue();

      if ((void *)v52 != v51)
      {
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithPlatformImage:", v52);
        objc_msgSend(v7, "setImage:", v14);

      }
      +[_SFTouchIconCache _monogramConfiguration](_SFTouchIconCache, "_monogramConfiguration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "backgroundColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "resolvedColorWithTraitCollection:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "backgroundColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "traitCollectionByModifyingTraits:", &__block_literal_global_62);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "resolvedColorWithTraitCollection:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __40__SFAttributedRichLinkCell_setMetadata___block_invoke_2;
      aBlock[3] = &unk_1E21E7388;
      v48 = v18;
      v58 = v48;
      v49 = v22;
      v59 = v49;
      v24 = v12;
      v60 = v24;
      v46 = v15;
      v61 = v46;
      v4 = v7;
      v62 = v4;
      v25 = (void (**)(_QWORD))_Block_copy(aBlock);
      if (self->_userInterfaceStyleChangeRegistrationForMetadata)
        -[SFAttributedRichLinkCell unregisterForTraitChanges:](self, "unregisterForTraitChanges:", v46, v48, v49);
      v25[2](v25);
      v26 = objc_claimAutoreleasedReturnValue();
      if ((id)v26 != v24)
      {
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithPlatformImage:", v26);
        objc_msgSend(v4, "setIcon:", v27);

        if (v26)
        {
          v64[0] = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v53[0] = v23;
          v53[1] = 3221225472;
          v53[2] = __40__SFAttributedRichLinkCell_setMetadata___block_invoke_3;
          v53[3] = &unk_1E21E73B0;
          objc_copyWeak(&v56, &location);
          v54 = v4;
          v55 = v25;
          -[SFAttributedRichLinkCell registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v28, v53);
          v29 = (UITraitChangeRegistration *)objc_claimAutoreleasedReturnValue();
          userInterfaceStyleChangeRegistrationForMetadata = self->_userInterfaceStyleChangeRegistrationForMetadata;
          self->_userInterfaceStyleChangeRegistrationForMetadata = v29;

          objc_destroyWeak(&v56);
        }
      }
      -[LPLinkView _setOverrideBackgroundColor:](self->_linkView, "_setOverrideBackgroundColor:", 0, v46);
      -[LPLinkView traitOverrides](self->_linkView, "traitOverrides");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v31, "containsTrait:", v32);

      if (v33)
      {
        -[LPLinkView traitOverrides](self->_linkView, "traitOverrides");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "removeTrait:", v35);

      }
      if (!(v52 | v26))
      {
        objc_msgSend(v50, "properties");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "dominantColor");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v37 == 0;

        if (!v38)
        {
          objc_msgSend(v50, "properties");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "dominantColor");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "colorWithAlphaComponent:", 1.0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPLinkView _setOverrideBackgroundColor:](self->_linkView, "_setOverrideBackgroundColor:", v41);

          -[LPLinkView _overrideBackgroundColor](self->_linkView, "_overrideBackgroundColor");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v39) = objc_msgSend(v42, "safari_meetsThresholdForDarkAppearance");

          -[LPLinkView traitOverrides](self->_linkView, "traitOverrides");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v43;
          if ((_DWORD)v39)
            v45 = 2;
          else
            v45 = 1;
          objc_msgSend(v43, "setUserInterfaceStyle:", v45);

        }
      }

    }
    -[LPLinkView setMetadata:](self->_linkView, "setMetadata:", v4);
    -[SFAttributedRichLinkCell setNeedsLayout](self, "setNeedsLayout");
    objc_destroyWeak(&location);
  }

}

void __40__SFAttributedRichLinkCell_setMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setUserInterfaceStyle:", 2);
  objc_msgSend(v2, "setUserInterfaceLevel:", 1);

}

id __40__SFAttributedRichLinkCell_setMetadata___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;

  objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle");
  v4 = 40;
  if (v3 == 1)
    v4 = 32;
  v5 = *(id *)(a1 + v4);

  objc_msgSend(MEMORY[0x1E0D8ACB8], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "fontSize");
  v9 = v8;
  v10 = objc_msgSend(*(id *)(a1 + 56), "fontWeight");
  v11 = objc_msgSend(*(id *)(a1 + 56), "fontDesign");
  objc_msgSend(*(id *)(a1 + 56), "baselineOffset");
  v13 = v12;
  +[_SFSiteIcon cornerRadius](_SFSiteIcon, "cornerRadius");
  v15 = v14;
  objc_msgSend(*(id *)(a1 + 64), "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v20) = 0;
  objc_msgSend(v6, "displayableImageForImage:withRequiredImageSize:fallbackImageSize:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:cornerRadius:title:url:shouldGenerateGlyph:", v7, v10, v11, v5, v16, v17, 40.0, 40.0, 80.0, 80.0, v9, v13, v15, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void __40__SFAttributedRichLinkCell_setMetadata___block_invoke_3(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v2 = objc_alloc(MEMORY[0x1E0CC1178]);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v2, "initWithPlatformImage:", v3);
    objc_msgSend(*(id *)(a1 + 32), "setIcon:", v4);

    objc_msgSend(WeakRetained[83], "setMetadata:", *(_QWORD *)(a1 + 32));
  }

}

- (void)setRelativeDateString:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_relativeDateString, a3);
  v5 = a3;
  -[UILabel setText:](self->_relativeDateLabel, "setText:", v5);

}

- (void)setAttributionView:(id)a3
{
  id v5;
  int v6;
  SLAttributionView **p_attributionView;
  SLAttributionView *v8;
  double v9;
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
  _QWORD v36[4];
  _QWORD v37[4];

  v37[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(MEMORY[0x1E0D89BE8], "is2024SuggestionsEnabled");
  p_attributionView = &self->_attributionView;
  if (v5 || !v6)
  {
    if (!WBSIsEqual() || (objc_msgSend(v5, "isDescendantOfView:", self) & 1) == 0)
    {
      objc_msgSend(v5, "removeFromSuperview");
      if (-[SLAttributionView isDescendantOfView:](*p_attributionView, "isDescendantOfView:", self))
        -[SLAttributionView removeFromSuperview](*p_attributionView, "removeFromSuperview");
      objc_storeStrong((id *)&self->_attributionView, a3);
      -[SLAttributionView setBlurEffectGroupName:](*p_attributionView, "setBlurEffectGroupName:", CFSTR("start-page-attribution-view"));
      -[SFAttributedRichLinkCell _updateAttributionViewBackground](self, "_updateAttributionViewBackground");
      -[SLAttributionView setTranslatesAutoresizingMaskIntoConstraints:](*p_attributionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      LODWORD(v9) = 1148846080;
      -[SLAttributionView setContentHuggingPriority:forAxis:](*p_attributionView, "setContentHuggingPriority:forAxis:", 1, v9);
      if (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024SuggestionsEnabled"))
      {
        -[UIView addSubview:](self->_linkViewContainer, "addSubview:", *p_attributionView);
        v30 = (void *)MEMORY[0x1E0CB3718];
        -[UIView bottomAnchor](self->_linkViewContainer, "bottomAnchor");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[SLAttributionView bottomAnchor](*p_attributionView, "bottomAnchor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "constraintEqualToAnchor:constant:", v32, 7.0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = v10;
        -[SLAttributionView leadingAnchor](*p_attributionView, "leadingAnchor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView leadingAnchor](self->_linkViewContainer, "leadingAnchor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 7.0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v37[1] = v13;
        -[UIView trailingAnchor](self->_linkViewContainer, "trailingAnchor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SLAttributionView trailingAnchor](*p_attributionView, "trailingAnchor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 7.0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v37[2] = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "activateConstraints:", v17);

        -[SFAttributedRichLinkCell _updateUserInterfaceStyle](self, "_updateUserInterfaceStyle");
      }
      else
      {
        -[SFAttributedRichLinkCell contentView](self, "contentView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addSubview:", *p_attributionView);
        v27 = (void *)MEMORY[0x1E0CB3718];
        -[SLAttributionView topAnchor](*p_attributionView, "topAnchor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView bottomAnchor](self->_linkViewContainer, "bottomAnchor");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "constraintEqualToAnchor:constant:", v33, 6.0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = v31;
        -[SLAttributionView bottomAnchor](*p_attributionView, "bottomAnchor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "bottomAnchor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "constraintEqualToAnchor:", v28);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v36[1] = v26;
        -[SLAttributionView leadingAnchor](*p_attributionView, "leadingAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "leadingAnchor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "constraintEqualToAnchor:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v36[2] = v21;
        -[SLAttributionView trailingAnchor](*p_attributionView, "trailingAnchor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "trailingAnchor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "constraintEqualToAnchor:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v36[3] = v24;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "activateConstraints:", v25);

      }
      -[SFAttributedRichLinkCell setNeedsLayout](self, "setNeedsLayout");
    }
  }
  else
  {
    -[SLAttributionView removeFromSuperview](self->_attributionView, "removeFromSuperview");
    v8 = *p_attributionView;
    *p_attributionView = 0;

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6 == &startPageAttributedRichLinkCellKvoEffectiveTraitCollectionKey
    && objc_msgSend(v10, "isEqualToString:", CFSTR("_effectiveTraitCollection")))
  {
    if (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024SuggestionsEnabled"))
      -[SFAttributedRichLinkCell _updateUserInterfaceStyle](self, "_updateUserInterfaceStyle");
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SFAttributedRichLinkCell;
    -[SFAttributedRichLinkCell observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)_updateUserInterfaceStyle
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[LPLinkView _effectiveTraitCollection](self->_linkView, "_effectiveTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  -[SLAttributionView traitOverrides](self->_attributionView, "traitOverrides");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInterfaceStyle:", v4);

  -[UILabel traitOverrides](self->_relativeDateLabel, "traitOverrides");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInterfaceStyle:", v4);

}

- (BOOL)shouldShowContextMenuFromPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPoint v6;
  CGRect v7;

  y = a3.y;
  x = a3.x;
  -[UIView frame](self->_linkViewContainer, "frame");
  v6.x = x;
  v6.y = y;
  return CGRectContainsPoint(v7, v6);
}

- (SLAttributionView)attributionView
{
  return self->_attributionView;
}

- (SLHighlight)highlight
{
  return self->_highlight;
}

- (void)setHighlight:(id)a3
{
  objc_storeStrong((id *)&self->_highlight, a3);
}

- (NSString)relativeDateString
{
  return self->_relativeDateString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativeDateString, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_attributionView, 0);
  objc_storeStrong((id *)&self->_userInterfaceStyleChangeRegistrationForMetadata, 0);
  objc_storeStrong((id *)&self->_relativeDateLabel, 0);
  objc_storeStrong((id *)&self->_linkView, 0);
  objc_storeStrong((id *)&self->_linkViewContainer, 0);
}

@end
