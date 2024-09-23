@implementation MUPlacePhotoGalleryAttributionView

- (MUPlacePhotoGalleryAttributionView)init
{
  MUPlacePhotoGalleryAttributionView *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MUPlacePhotoGalleryAttributionView;
  v2 = -[MUPlacePhotoGalleryAttributionView initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlacePhotoGalleryAttributionView setBackgroundColor:](v2, "setBackgroundColor:", v3);

    -[MUPlacePhotoGalleryAttributionView setAccessibilityIdentifier:](v2, "setAccessibilityIdentifier:", CFSTR("PlacePhotoGalleryAttributionView"));
    -[MUPlacePhotoGalleryAttributionView setupSubviews](v2, "setupSubviews");
  }
  return v2;
}

- (void)setupSubviews
{
  id v3;
  void *v4;
  UIVisualEffectView *v5;
  UIVisualEffectView *effectView;
  UILabel *v7;
  UILabel *captionLabel;
  void *v9;
  void *v10;
  void *v11;
  MULinkView *v12;
  MULinkView *v13;
  MULinkView *primaryLabel;
  MULinkView *v15;
  void *v16;
  UILabel *v17;
  UILabel *secondaryLabel;
  void *v19;
  void *v20;
  void *v21;
  UIButton *v22;
  UIButton *accessoryButton;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  NSLayoutConstraint *v30;
  NSLayoutConstraint *captionToPrimaryLabelConstraint;
  NSLayoutConstraint *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
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
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
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
  _QWORD v88[4];
  id v89;
  id location;
  void *v91;
  _QWORD v92[19];

  v92[17] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3F58]);
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (UIVisualEffectView *)objc_msgSend(v3, "initWithEffect:", v4);
  effectView = self->_effectView;
  self->_effectView = v5;

  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_effectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MUPlacePhotoGalleryAttributionView addSubview:](self, "addSubview:", self->_effectView);
  v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  captionLabel = self->_captionLabel;
  self->_captionLabel = v7;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_captionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_captionLabel, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_mapkit_fontWithSymbolicTraits:", 0x8000);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_captionLabel, "setFont:", v10);

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_captionLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[UILabel setHidden:](self->_captionLabel, "setHidden:", 1);
  -[UILabel setAccessibilityIdentifier:](self->_captionLabel, "setAccessibilityIdentifier:", CFSTR("CaptionLabel"));
  -[UIVisualEffectView contentView](self->_effectView, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", self->_captionLabel);

  v12 = [MULinkView alloc];
  v13 = -[MULinkView initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = v13;

  -[MULinkView setTranslatesAutoresizingMaskIntoConstraints:](self->_primaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_initWeak(&location, self);
  v15 = self->_primaryLabel;
  v88[0] = MEMORY[0x1E0C809B0];
  v88[1] = 3221225472;
  v88[2] = __51__MUPlacePhotoGalleryAttributionView_setupSubviews__block_invoke;
  v88[3] = &unk_1E2E027C8;
  objc_copyWeak(&v89, &location);
  -[MULinkView setSelectionBlock:](v15, "setSelectionBlock:", v88);
  -[UIVisualEffectView contentView](self->_effectView, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", self->_primaryLabel);

  v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = v17;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_secondaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](self->_secondaryLabel, "setBackgroundColor:", v19);

  -[UILabel setNumberOfLines:](self->_secondaryLabel, "setNumberOfLines:", 0);
  -[UILabel setHidden:](self->_secondaryLabel, "setHidden:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_secondaryLabel, "setTextColor:", v20);

  -[UILabel setAccessibilityIdentifier:](self->_secondaryLabel, "setAccessibilityIdentifier:", CFSTR("SecondaryLabel"));
  -[UIVisualEffectView contentView](self->_effectView, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", self->_secondaryLabel);

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
  v22 = (UIButton *)objc_claimAutoreleasedReturnValue();
  accessoryButton = self->_accessoryButton;
  self->_accessoryButton = v22;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_accessoryButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setContentMode:](self->_accessoryButton, "setContentMode:", 4);
  -[UIButton setAccessibilityIdentifier:](self->_accessoryButton, "setAccessibilityIdentifier:", CFSTR("AccessoryButton"));
  LODWORD(v24) = 1144750080;
  -[UIButton setContentHuggingPriority:forAxis:](self->_accessoryButton, "setContentHuggingPriority:forAxis:", 0, v24);
  LODWORD(v25) = 1148846080;
  -[UIButton setContentCompressionResistancePriority:forAxis:](self->_accessoryButton, "setContentCompressionResistancePriority:forAxis:", 0, v25);
  LODWORD(v26) = 1144750080;
  -[UIButton setContentHuggingPriority:forAxis:](self->_accessoryButton, "setContentHuggingPriority:forAxis:", 1, v26);
  -[UIButton _mapkit_setTarget:action:](self->_accessoryButton, "_mapkit_setTarget:action:", self, sel__accessoryViewTapped);
  -[UIVisualEffectView contentView](self->_effectView, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addSubview:", self->_accessoryButton);

  -[UIVisualEffectView safeAreaLayoutGuide](self->_effectView, "safeAreaLayoutGuide");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULinkView topAnchor](self->_primaryLabel, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_captionLabel, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, 0.0);
  v30 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  captionToPrimaryLabelConstraint = self->_captionToPrimaryLabelConstraint;
  self->_captionToPrimaryLabelConstraint = v30;

  v46 = (void *)MEMORY[0x1E0CB3718];
  -[UILabel leadingAnchor](self->_captionLabel, "leadingAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "leadingAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintEqualToAnchor:constant:", v85, 16.0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v92[0] = v84;
  -[UILabel topAnchor](self->_captionLabel, "topAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView topAnchor](self->_effectView, "topAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:constant:", v82, 14.0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v92[1] = v81;
  -[UILabel trailingAnchor](self->_captionLabel, "trailingAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton leadingAnchor](self->_accessoryButton, "leadingAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintLessThanOrEqualToAnchor:", v79);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = self->_captionToPrimaryLabelConstraint;
  v92[2] = v78;
  v92[3] = v32;
  -[MULinkView leadingAnchor](self->_primaryLabel, "leadingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "leadingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToAnchor:constant:", v76, 16.0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v92[4] = v75;
  -[MULinkView trailingAnchor](self->_primaryLabel, "trailingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton leadingAnchor](self->_accessoryButton, "leadingAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintLessThanOrEqualToAnchor:", v73);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v92[5] = v72;
  -[UILabel leadingAnchor](self->_secondaryLabel, "leadingAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULinkView leadingAnchor](self->_primaryLabel, "leadingAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:", v70);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v92[6] = v69;
  -[UILabel topAnchor](self->_secondaryLabel, "topAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULinkView bottomAnchor](self->_primaryLabel, "bottomAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:", v67);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v92[7] = v66;
  -[UILabel bottomAnchor](self->_secondaryLabel, "bottomAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlacePhotoGalleryAttributionView bottomAnchor](self, "bottomAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:constant:", v64, -39.0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v92[8] = v63;
  -[UIButton trailingAnchor](self->_accessoryButton, "trailingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "trailingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:constant:", v61, -16.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v92[9] = v60;
  -[UIButton topAnchor](self->_accessoryButton, "topAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "topAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:constant:", v58, 8.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v92[10] = v57;
  -[UIButton bottomAnchor](self->_accessoryButton, "bottomAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlacePhotoGalleryAttributionView bottomAnchor](self, "bottomAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintLessThanOrEqualToAnchor:", v55);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v92[11] = v54;
  -[UIButton leadingAnchor](self->_accessoryButton, "leadingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](self->_secondaryLabel, "trailingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintGreaterThanOrEqualToAnchor:", v52);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v92[12] = v51;
  -[UIVisualEffectView leadingAnchor](self->_effectView, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlacePhotoGalleryAttributionView leadingAnchor](self, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v92[13] = v48;
  -[UIVisualEffectView trailingAnchor](self->_effectView, "trailingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlacePhotoGalleryAttributionView trailingAnchor](self, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v92[14] = v34;
  -[UIVisualEffectView topAnchor](self->_effectView, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlacePhotoGalleryAttributionView topAnchor](self, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v92[15] = v37;
  -[UIVisualEffectView bottomAnchor](self->_effectView, "bottomAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlacePhotoGalleryAttributionView bottomAnchor](self, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v92[16] = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 17);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "activateConstraints:", v41);

  v42 = -[UIView _mapsui_addHairlineAtTopWithMargin:](self, "_mapsui_addHairlineAtTopWithMargin:", 0.0);
  objc_opt_self();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v91, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (id)-[MUPlacePhotoGalleryAttributionView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v44, sel__buildAndUpdateDescription);

  objc_destroyWeak(&v89);
  objc_destroyWeak(&location);
}

void __51__MUPlacePhotoGalleryAttributionView_setupSubviews__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_attributionTapped");
    WeakRetained = v2;
  }

}

- (void)_buildAndUpdateDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  id v53;
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
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  __CFString *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  __CFString *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  _QWORD v87[3];
  _QWORD v88[3];
  uint64_t v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD v93[4];

  v93[2] = *MEMORY[0x1E0C80C00];
  -[MUPlacePhotoGalleryAttributionViewModel caption](self->_viewModel, "caption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  -[MUPlacePhotoGalleryAttributionView captionLabel](self, "captionLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "setText:", v3);

    -[MUPlacePhotoGalleryAttributionView captionLabel](self, "captionLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 0);

    -[MUPlacePhotoGalleryAttributionView captionToPrimaryLabelConstraint](self, "captionToPrimaryLabelConstraint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 8.0;
  }
  else
  {
    objc_msgSend(v5, "setText:", 0);

    -[MUPlacePhotoGalleryAttributionView captionLabel](self, "captionLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", 1);

    -[MUPlacePhotoGalleryAttributionView captionToPrimaryLabelConstraint](self, "captionToPrimaryLabelConstraint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 0.0;
  }
  objc_msgSend(v8, "setConstant:", v10);

  v91 = *MEMORY[0x1E0DC1138];
  v12 = v91;
  objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "subtitleFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v93[0] = v14;
  v92 = *MEMORY[0x1E0DC1140];
  v15 = v92;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v93[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, &v91, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v89 = v12;
  objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "subtitleFont");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x1E0DC1448];
  objc_msgSend(v19, "_mapkit_fontWithWeight:", *MEMORY[0x1E0DC1448]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v87[0] = v12;
  objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "subtitleFont");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_mapkit_fontWithWeight:", v20);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *MEMORY[0x1E0DC1160];
  v88[0] = v25;
  v88[1] = &stru_1E2E05448;
  v87[1] = v26;
  v87[2] = v15;
  objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v88[2] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, v87, 3);
  v28 = objc_claimAutoreleasedReturnValue();

  -[MUPlacePhotoGalleryAttributionViewModel titleText](self->_viewModel, "titleText");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "length");

  v84 = (void *)v28;
  v85 = v22;
  v86 = v17;
  if (v30)
  {
    v31 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[MUPlacePhotoGalleryAttributionViewModel titleText](self->_viewModel, "titleText");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "initWithString:attributes:", v32, v17);
  }
  else
  {
    switch(-[MUPlacePhotoGalleryAttributionViewModel attributionType](self->_viewModel, "attributionType"))
    {
      case 1:
        -[MUPlacePhotoGalleryAttributionViewModel vendorName](self->_viewModel, "vendorName");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "length");

        if (!v43)
        {
          v34 = 0;
          v35 = 1;
          goto LABEL_9;
        }
        _MULocalizedStringFromThisBundle(CFSTR("From Vendor [Vendor Photo Attribution]"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v32, v17);
        if (-[MUPlacePhotoGalleryAttributionViewModel supportsPunchOut](self->_viewModel, "supportsPunchOut"))
          v44 = (void *)v28;
        else
          v44 = v22;
        v45 = v44;
        v46 = objc_alloc(MEMORY[0x1E0CB3498]);
        -[MUPlacePhotoGalleryAttributionViewModel vendorName](self->_viewModel, "vendorName");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = (void *)objc_msgSend(v46, "initWithString:attributes:", v47, v45);

        v48 = (void *)MEMORY[0x1E0DC3888];
        objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "subtitleFont");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "_mapkit_fontWithWeight:", v20);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "configurationWithFont:scale:", v51, 1);
        v52 = objc_claimAutoreleasedReturnValue();

        v53 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
        v81 = (void *)v52;
        objc_msgSend(MEMORY[0x1E0DC3870], "_mapsui_systemImageNamed:withConfiguration:", CFSTR("arrow.up.right.square.fill"), v52);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "imageWithRenderingMode:", 2);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setImage:", v55);

        if (-[MUPlacePhotoGalleryAttributionViewModel supportsPunchOut](self->_viewModel, "supportsPunchOut"))
        {
          objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v53);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = (void *)objc_msgSend(v56, "mutableCopy");

          objc_msgSend(v57, "addAttributes:range:", v45, 0, objc_msgSend(v57, "length"));
        }
        else
        {
          v57 = (void *)objc_opt_new();
        }
        v79 = (void *)MEMORY[0x1E0CB3498];
        v80 = (void *)objc_msgSend(v57, "copy");
        objc_msgSend(v79, "localizedAttributedStringWithFormat:options:", v83, 2, v82, v80);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = 1;
        goto LABEL_8;
      case 2:
        -[MUPlacePhotoGalleryAttributionViewModel authorName](self->_viewModel, "authorName");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend(v71, "length");

        if (v72)
        {
          v73 = CFSTR("From %@ [Public Attribution]");
          goto LABEL_39;
        }
        v78 = CFSTR("From a Visitor [Public Attribution]");
        goto LABEL_43;
      case 3:
        _MULocalizedStringFromThisBundle(CFSTR("From %@ (Owner) [Business Owner Photo Attribution"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[MUPlacePhotoGalleryAttributionViewModel placeName](self->_viewModel, "placeName");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        MUHighlightedAttributionString(v32, v17, v74, v22);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = 0;
        goto LABEL_8;
      case 4:
        -[MUPlacePhotoGalleryAttributionViewModel authorName](self->_viewModel, "authorName");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = objc_msgSend(v75, "length");

        if (v76)
        {
          v73 = CFSTR("[Photo Credit On - Full Screen Gallery] From [photo credit name] (You)");
LABEL_39:
          _MULocalizedStringFromThisBundle(v73);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[MUPlacePhotoGalleryAttributionViewModel authorName](self->_viewModel, "authorName");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          MUHighlightedAttributionString(v32, v17, v77, v22);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_7;
        }
        v78 = CFSTR("[No Photo Credit - Full Screen Gallery] From a Visitor (You)");
LABEL_43:
        _MULocalizedStringFromThisBundle(v78);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        MUHighlightedAttributionString(v32, v17, 0, 0);
        v33 = objc_claimAutoreleasedReturnValue();
        break;
      default:
        v34 = 0;
        v35 = 1;
        goto LABEL_9;
    }
  }
  v34 = (void *)v33;
LABEL_7:
  v35 = 1;
LABEL_8:

LABEL_9:
  -[MUPlacePhotoGalleryAttributionView primaryLabel](self, "primaryLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setAttributedText:", v34);

  -[MUPlacePhotoGalleryAttributionViewModel subtitleText](self->_viewModel, "subtitleText");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "length");

  if (v38)
  {
    v39 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[MUPlacePhotoGalleryAttributionViewModel subtitleText](self->_viewModel, "subtitleText");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_msgSend(v39, "initWithString:", v40);
  }
  else
  {
    -[MUPlacePhotoGalleryAttributionViewModel placeName](self->_viewModel, "placeName");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1EE23BB80 != -1)
      dispatch_once(&qword_1EE23BB80, &__block_literal_global_25);
    v58 = (void *)_MergedGlobals_1_0;
    -[MUPlacePhotoGalleryAttributionViewModel photoDate](self->_viewModel, "photoDate");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "stringFromDate:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
    if (v35 && objc_msgSend(v40, "length"))
      objc_msgSend(v61, "addObject:", v40);
    if (objc_msgSend(v61, "count") && objc_msgSend(v60, "length"))
    {
      _MULocalizedStringFromThisBundle(CFSTR(" · "));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "addObject:", v62);

    }
    if (objc_msgSend(v60, "length"))
      objc_msgSend(v61, "addObject:", v60);
    MUMap(v61, &__block_literal_global_151);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = (void *)objc_msgSend(v63, "copy");
    +[MapsUILayout buildAttributedDisplayStringForComponents:](MapsUILayout, "buildAttributedDisplayStringForComponents:", v64);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v65 = objc_msgSend(v41, "length");
  -[MUPlacePhotoGalleryAttributionView secondaryLabel](self, "secondaryLabel");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v66;
  if (v65)
  {
    objc_msgSend(v66, "setAttributedText:", v41);

    -[MUPlacePhotoGalleryAttributionView secondaryLabel](self, "secondaryLabel");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v68;
    v70 = 0;
  }
  else
  {
    objc_msgSend(v66, "setAttributedText:", 0);

    -[MUPlacePhotoGalleryAttributionView secondaryLabel](self, "secondaryLabel");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v68;
    v70 = 1;
  }
  objc_msgSend(v68, "setHidden:", v70);

}

void __64__MUPlacePhotoGalleryAttributionView__buildAndUpdateDescription__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_1_0;
  _MergedGlobals_1_0 = (uint64_t)v0;

  objc_msgSend((id)_MergedGlobals_1_0, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMM yyyy"));
  v2 = (void *)_MergedGlobals_1_0;
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  v4 = (void *)_MergedGlobals_1_0;
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v5);

}

id __64__MUPlacePhotoGalleryAttributionView__buildAndUpdateDescription__block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v2 = (objc_class *)MEMORY[0x1E0CB3498];
  v3 = a2;
  v4 = [v2 alloc];
  v10 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributionFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithString:attributes:", v3, v7);

  return v8;
}

- (void)setViewModel:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[MUPlacePhotoGalleryAttributionViewModel isEqual:](self->_viewModel, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[MUPlacePhotoGalleryAttributionView _updateAppearance](self, "_updateAppearance");
  }

}

- (void)_updateAppearance
{
  void *v3;
  int64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
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
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id location;
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  -[MUPlacePhotoGalleryAttributionView _buildAndUpdateDescription](self, "_buildAndUpdateDescription");
  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MUPlacePhotoGalleryAttributionViewModel accessoryStyle](self->_viewModel, "accessoryStyle");
  if (v4 == 3)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("ellipsis.circle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configurationWithFont:scale:", v9, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageWithConfiguration:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setImage:", v11);

    objc_initWeak(&location, self);
    v12 = (void *)MEMORY[0x1E0DC3428];
    _MULocalizedStringFromThisBundle(CFSTR("Delete Your Photo"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __55__MUPlacePhotoGalleryAttributionView__updateAppearance__block_invoke;
    v36[3] = &unk_1E2E02840;
    objc_copyWeak(&v37, &location);
    objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v13, 0, 0, v36);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0DC3428];
    _MULocalizedStringFromThisBundle(CFSTR("Change Photo Credit"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v14;
    v32 = 3221225472;
    v33 = __55__MUPlacePhotoGalleryAttributionView__updateAppearance__block_invoke_2;
    v34 = &unk_1E2E02840;
    objc_copyWeak(&v35, &location);
    objc_msgSend(v16, "actionWithTitle:image:identifier:handler:", v17, 0, 0, &v31);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x1E0DC39D0];
    v39[0] = v15;
    v39[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2, v31, v32, v33, v34);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "menuWithChildren:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[MUPlacePhotoGalleryAttributionView accessoryButton](self, "accessoryButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setMenu:", v21);

    -[MUPlacePhotoGalleryAttributionView accessoryButton](self, "accessoryButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setShowsMenuAsPrimaryAction:", 1);

    objc_destroyWeak(&v35);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
    goto LABEL_7;
  }
  if (v4 == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("exclamationmark.bubble"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "configurationWithFont:scale:", v26, 3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "imageWithConfiguration:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setImage:", v28);

    goto LABEL_7;
  }
  if (v4)
  {
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  -[MUPlacePhotoGalleryAttributionView accessoryButton](self, "accessoryButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:forState:", 0, 0);

  v6 = 1;
LABEL_8:
  -[MUPlacePhotoGalleryAttributionView accessoryButton](self, "accessoryButton");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setConfiguration:", v3);

  -[MUPlacePhotoGalleryAttributionView accessoryButton](self, "accessoryButton");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setHidden:", v6);

}

void __55__MUPlacePhotoGalleryAttributionView__updateAppearance__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "attributionViewDidSelectDeletePhoto:", v3);

    WeakRetained = v3;
  }

}

void __55__MUPlacePhotoGalleryAttributionView__updateAppearance__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "attributionViewDidSelectEditPhotoCredit:", v3);

    WeakRetained = v3;
  }

}

- (void)_accessoryViewTapped
{
  int64_t v3;
  id v4;

  v3 = -[MUPlacePhotoGalleryAttributionViewModel accessoryStyle](self->_viewModel, "accessoryStyle");
  if (v3 == 2)
  {
    -[MUPlacePhotoGalleryAttributionView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributionViewDidTapReportAnIssue:", self);
  }
  else
  {
    if (v3 != 1)
      return;
    -[MUPlacePhotoGalleryAttributionView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributionViewDidTapAttributionPunchout:", self);
  }

}

- (void)beginAnimatingActivityIndicator
{
  void *v3;
  void *v4;
  id v5;

  -[MUPlacePhotoGalleryAttributionView accessoryButton](self, "accessoryButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setShowsActivityIndicator:", 1);
  -[MUPlacePhotoGalleryAttributionView accessoryButton](self, "accessoryButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConfiguration:", v5);

}

- (void)endAnimatingActivityIndicatorWithError:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[MUPlacePhotoGalleryAttributionView accessoryButton](self, "accessoryButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setShowsActivityIndicator:", 0);
  -[MUPlacePhotoGalleryAttributionView accessoryButton](self, "accessoryButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConfiguration:", v6);

}

- (void)_attributionTapped
{
  id v3;

  -[MUPlacePhotoGalleryAttributionView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributionViewDidTapAttributionPunchout:", self);

}

- (MUPlacePhotoGalleryAttributionViewDelegate)delegate
{
  return (MUPlacePhotoGalleryAttributionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MUPlacePhotoGalleryAttributionViewModel)viewModel
{
  return self->_viewModel;
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_effectView, a3);
}

- (MULinkView)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLabel, a3);
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabel, a3);
}

- (UIButton)accessoryButton
{
  return self->_accessoryButton;
}

- (void)setAccessoryButton:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryButton, a3);
}

- (UIMenu)menu
{
  return self->_menu;
}

- (void)setMenu:(id)a3
{
  objc_storeStrong((id *)&self->_menu, a3);
}

- (UILabel)captionLabel
{
  return self->_captionLabel;
}

- (void)setCaptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_captionLabel, a3);
}

- (NSLayoutConstraint)captionToPrimaryLabelConstraint
{
  return self->_captionToPrimaryLabelConstraint;
}

- (void)setCaptionToPrimaryLabelConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_captionToPrimaryLabelConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captionToPrimaryLabelConstraint, 0);
  objc_storeStrong((id *)&self->_captionLabel, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_accessoryButton, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
