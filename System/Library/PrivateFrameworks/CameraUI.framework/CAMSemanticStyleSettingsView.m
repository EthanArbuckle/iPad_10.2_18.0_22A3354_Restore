@implementation CAMSemanticStyleSettingsView

- (CAMSemanticStyleSettingsView)init
{
  CAMSemanticStyleSettingsView *v2;
  void *v3;
  UIScrollView *v4;
  UIScrollView *scrollView;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  UILabel *v11;
  UILabel *titleLabel;
  void *v13;
  UILabel *v14;
  UILabel *descriptionLabel;
  void *v16;
  uint64_t v17;
  NSArray *semanticStyles;
  uint64_t i;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  CAMSemanticStyleMaskedBadge *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSArray *semanticStyleBadges;
  NSArray *semanticStyleImageViews;
  unint64_t AppIntegerValue;
  uint64_t v40;
  CAMSemanticStylePicker *v41;
  CAMSemanticStylePicker *semanticStylePicker;
  void *v43;
  CAMSemanticStyleDetailView *v44;
  CAMSemanticStyleDetailView *semanticStyleDetailView;
  void *v46;
  void *v47;
  uint64_t v48;
  UIButton *selectButton;
  double v50;
  double v51;
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
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  NSArray *obj;
  id obja;
  uint64_t v126;
  void *v127;
  NSArray *v128;
  void *v129;
  NSArray *v130;
  NSArray *v131;
  id *p_isa;
  uint64_t v133;
  NSArray *v134;
  _QWORD v135[4];
  id v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  objc_super v141;
  _QWORD v142[21];
  _BYTE v143[128];
  uint64_t v144;

  v144 = *MEMORY[0x1E0C80C00];
  v141.receiver = self;
  v141.super_class = (Class)CAMSemanticStyleSettingsView;
  v2 = -[CAMSemanticStyleSettingsView initWithFrame:](&v141, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStyleSettingsView setBackgroundColor:](v2, "setBackgroundColor:", v3);

    v4 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0DC3C28]);
    scrollView = v2->__scrollView;
    v2->__scrollView = v4;

    -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](v2->__scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIScrollView setShowsVerticalScrollIndicator:](v2->__scrollView, "setShowsVerticalScrollIndicator:", 1);
    -[UIScrollView setShowsHorizontalScrollIndicator:](v2->__scrollView, "setShowsHorizontalScrollIndicator:", 0);
    -[CAMSemanticStyleSettingsView addSubview:](v2, "addSubview:", v2->__scrollView);
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4B48], 32770, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4AD0], 0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v123 = (void *)v6;
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v6, 0.0);
    v9 = objc_claimAutoreleasedReturnValue();
    v122 = (void *)v7;
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v7, 0.0);
    v10 = objc_claimAutoreleasedReturnValue();
    v121 = (void *)v8;
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v8, 0.0);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v2->__titleLabel;
    v2->__titleLabel = v11;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v2->__titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    CAMLocalizedFrameworkString(CFSTR("SEMANTIC_STYLES_SETTINGS_TITLE"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v2->__titleLabel, "setText:", v13);

    -[UILabel setTextAlignment:](v2->__titleLabel, "setTextAlignment:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v2->__titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    v120 = (void *)v9;
    -[UILabel setFont:](v2->__titleLabel, "setFont:", v9);
    -[UIScrollView addSubview:](v2->__scrollView, "addSubview:", v2->__titleLabel);
    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    descriptionLabel = v2->__descriptionLabel;
    v2->__descriptionLabel = v14;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v2->__descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    CAMLocalizedFrameworkString(CFSTR("SEMANTIC_STYLES_SETTINGS_DESCRIPTION"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v2->__descriptionLabel, "setText:", v16);

    -[UILabel setTextAlignment:](v2->__descriptionLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v2->__descriptionLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v2->__descriptionLabel, "setLineBreakMode:", 0);
    v119 = (void *)v10;
    -[UILabel setFont:](v2->__descriptionLabel, "setFont:", v10);
    -[UIScrollView addSubview:](v2->__scrollView, "addSubview:", v2->__descriptionLabel);
    +[CAMSemanticStyle defaultStyles](CAMSemanticStyle, "defaultStyles");
    v17 = objc_claimAutoreleasedReturnValue();
    semanticStyles = v2->__semanticStyles;
    v2->__semanticStyles = (NSArray *)v17;

    v128 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v130 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v137 = 0u;
    v138 = 0u;
    v139 = 0u;
    v140 = 0u;
    obj = v2->__semanticStyles;
    p_isa = (id *)&v2->super.super.super.isa;
    v133 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v137, v143, 16);
    if (v133)
    {
      v126 = *(_QWORD *)v138;
      do
      {
        for (i = 0; i != v133; ++i)
        {
          if (*(_QWORD *)v138 != v126)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * i);
          v21 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
          objc_msgSend(v21, "setClipsToBounds:", 1);
          v22 = (void *)MEMORY[0x1E0DC3870];
          -[CAMSemanticStyleSettingsView _previewImageNameForSemanticStylePreset:](v2, "_previewImageNameForSemanticStylePreset:", objc_msgSend(v20, "presetType"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          CAMCameraUIFrameworkBundle();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "imageNamed:inBundle:", v23, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v25);
          objc_msgSend(v26, "setContentMode:", 2);
          -[NSArray addObject:](v130, "addObject:", v26);
          objc_msgSend(v21, "addSubview:", v26);
          -[UIScrollView addSubview:](v2->__scrollView, "addSubview:", v21);
          v27 = objc_alloc_init(CAMSemanticStyleMaskedBadge);
          -[CAMSemanticStyleMaskedBadge setSemanticStyle:](v27, "setSemanticStyle:", v20);
          -[CAMSemanticStyleMaskedBadge badgeView](v27, "badgeView");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setDelegate:", v2);

          +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "sfCameraFontSupported");
          -[CAMSemanticStyleMaskedBadge badgeView](v27, "badgeView");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v30;
          v2 = (CAMSemanticStyleSettingsView *)p_isa;
          objc_msgSend(v31, "setFontStyle:", v32);

          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.7);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[CAMSemanticStyleMaskedBadge badgeView](v27, "badgeView");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "_setFillColor:", v33);

          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.7);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[CAMSemanticStyleMaskedBadge badgeView](v27, "badgeView");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "_setContentColor:", v35);

          -[NSArray addObject:](v128, "addObject:", v27);
          objc_msgSend(p_isa[54], "addSubview:", v27);

        }
        v133 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v137, v143, 16);
      }
      while (v133);
    }

    semanticStyleBadges = v2->__semanticStyleBadges;
    v2->__semanticStyleBadges = v128;
    v134 = v128;

    semanticStyleImageViews = v2->__semanticStyleImageViews;
    v2->__semanticStyleImageViews = v130;
    v131 = v130;

    AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("CAMUserPreferenceSelectedSemanticStyleIndex"), CFSTR("com.apple.camera"), 0);
    v40 = -[NSArray count](v2->__semanticStyles, "count");
    if (AppIntegerValue >= v40 - 1)
      AppIntegerValue = v40 - 1;
    -[NSArray objectAtIndex:](v2->__semanticStyles, "objectAtIndex:", AppIntegerValue);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_alloc_init(CAMSemanticStylePicker);
    semanticStylePicker = v2->__semanticStylePicker;
    v2->__semanticStylePicker = v41;

    -[CAMSemanticStylePicker setTranslatesAutoresizingMaskIntoConstraints:](v2->__semanticStylePicker, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CAMSemanticStylePicker setDelegate:](v2->__semanticStylePicker, "setDelegate:", v2);
    -[CAMSemanticStylePicker setNumberOfStyles:](v2->__semanticStylePicker, "setNumberOfStyles:", -[NSArray count](v2->__semanticStyles, "count"));
    -[CAMSemanticStylePicker setSelectedStyleIndex:](v2->__semanticStylePicker, "setSelectedStyleIndex:", AppIntegerValue);
    -[CAMSemanticStylePicker setExpanded:](v2->__semanticStylePicker, "setExpanded:", 1);
    -[CAMSemanticStylePicker setMaterial:](v2->__semanticStylePicker, "setMaterial:", 4);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStylePicker setMaterialColor:](v2->__semanticStylePicker, "setMaterialColor:", v43);

    -[UIScrollView addSubview:](v2->__scrollView, "addSubview:", v2->__semanticStylePicker);
    v44 = objc_alloc_init(CAMSemanticStyleDetailView);
    semanticStyleDetailView = v2->__semanticStyleDetailView;
    v2->__semanticStyleDetailView = v44;

    -[CAMSemanticStyleDetailView setTranslatesAutoresizingMaskIntoConstraints:](v2->__semanticStyleDetailView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIScrollView addSubview:](v2->__scrollView, "addSubview:", v2->__semanticStyleDetailView);
    objc_msgSend(MEMORY[0x1E0DC3520], "filledButtonConfiguration");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setContentInsets:", 16.0, 16.0, 16.0, 16.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setBaseBackgroundColor:", v47);

    v127 = v46;
    objc_msgSend(v46, "setCornerStyle:", 3);
    v135[0] = MEMORY[0x1E0C809B0];
    v135[1] = 3221225472;
    v135[2] = __36__CAMSemanticStyleSettingsView_init__block_invoke;
    v135[3] = &unk_1EA32CE08;
    v136 = v115;
    obja = v115;
    objc_msgSend(v46, "setTitleTextAttributesTransformer:", v135);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v46, 0);
    v48 = objc_claimAutoreleasedReturnValue();
    selectButton = v2->__selectButton;
    v2->__selectButton = (UIButton *)v48;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v2->__selectButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addTarget:action:forControlEvents:](v2->__selectButton, "addTarget:action:forControlEvents:", v2, sel__handleUseStyleButtonReleased_, 64);
    -[UIScrollView addSubview:](v2->__scrollView, "addSubview:", v2->__selectButton);
    -[CAMSemanticStylePicker spacerWidth](v2->__semanticStylePicker, "spacerWidth");
    v51 = v50 + 10.0;
    v91 = (void *)MEMORY[0x1E0CB3718];
    -[UIScrollView leadingAnchor](v2->__scrollView, "leadingAnchor");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStyleSettingsView leadingAnchor](v2, "leadingAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "constraintEqualToAnchor:", v114);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v142[0] = v113;
    -[UIScrollView trailingAnchor](v2->__scrollView, "trailingAnchor");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStyleSettingsView trailingAnchor](v2, "trailingAnchor");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "constraintEqualToAnchor:", v111);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v142[1] = v110;
    -[UIScrollView topAnchor](v2->__scrollView, "topAnchor");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStyleSettingsView topAnchor](v2, "topAnchor");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "constraintEqualToAnchor:", v108);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v142[2] = v107;
    -[UIScrollView bottomAnchor](v2->__scrollView, "bottomAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStyleSettingsView bottomAnchor](v2, "bottomAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "constraintEqualToAnchor:", v105);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v142[3] = v104;
    -[UIScrollView contentLayoutGuide](v2->__scrollView, "contentLayoutGuide");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "heightAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStyleSettingsView safeAreaLayoutGuide](v2, "safeAreaLayoutGuide");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "heightAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "constraintGreaterThanOrEqualToAnchor:", v100);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v142[4] = v99;
    -[UILabel leadingAnchor](v2->__titleLabel, "leadingAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStyleSettingsView leadingAnchor](v2, "leadingAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "constraintEqualToAnchor:constant:", v97, v51);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v142[5] = v96;
    -[UILabel trailingAnchor](v2->__titleLabel, "trailingAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStyleSettingsView trailingAnchor](v2, "trailingAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "constraintEqualToAnchor:constant:", v94, -v51);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v142[6] = v93;
    -[UILabel topAnchor](v2->__titleLabel, "topAnchor");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView topAnchor](v2->__scrollView, "topAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "constraintEqualToAnchor:constant:", v92, v51);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v142[7] = v90;
    -[UILabel leadingAnchor](v2->__descriptionLabel, "leadingAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStyleSettingsView leadingAnchor](v2, "leadingAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "constraintEqualToAnchor:constant:", v88, v51);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v142[8] = v87;
    -[UILabel trailingAnchor](v2->__descriptionLabel, "trailingAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStyleSettingsView trailingAnchor](v2, "trailingAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "constraintEqualToAnchor:constant:", v85, -v51);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v142[9] = v84;
    -[CAMSemanticStylePicker leadingAnchor](v2->__semanticStylePicker, "leadingAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStyleSettingsView leadingAnchor](v2, "leadingAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintEqualToAnchor:", v82);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v142[10] = v81;
    -[CAMSemanticStylePicker trailingAnchor](v2->__semanticStylePicker, "trailingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStyleSettingsView trailingAnchor](v2, "trailingAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:", v79);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v142[11] = v78;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v2->__semanticStylePicker, 7, 0, v2->__semanticStylePicker, 8, 1.33333333, 0.0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v142[12] = v77;
    -[CAMSemanticStylePicker topAnchor](v2->__semanticStylePicker, "topAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v2->__descriptionLabel, "bottomAnchor");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintEqualToAnchor:constant:", v118, 32.0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v142[13] = v75;
    -[CAMSemanticStyleDetailView leadingAnchor](v2->__semanticStyleDetailView, "leadingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStyleSettingsView leadingAnchor](v2, "leadingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:constant:", v73, v51);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v142[14] = v72;
    -[CAMSemanticStyleDetailView trailingAnchor](v2->__semanticStyleDetailView, "trailingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStyleSettingsView trailingAnchor](v2, "trailingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:constant:", v70, -v51);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v142[15] = v69;
    -[CAMSemanticStyleDetailView topAnchor](v2->__semanticStyleDetailView, "topAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStylePicker bottomAnchor](v2->__semanticStylePicker, "bottomAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStylePicker spacerWidth](v2->__semanticStylePicker, "spacerWidth");
    objc_msgSend(v68, "constraintEqualToAnchor:constant:", v67);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v142[16] = v66;
    -[UIButton leadingAnchor](v2->__selectButton, "leadingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStyleSettingsView leadingAnchor](v2, "leadingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:constant:", v64, v51 + v51);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v142[17] = v63;
    -[UIButton trailingAnchor](v2->__selectButton, "trailingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStyleSettingsView trailingAnchor](v2, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:constant:", v53, v51 * -2.0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v142[18] = v54;
    -[UIButton topAnchor](v2->__selectButton, "topAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStyleDetailView bottomAnchor](v2->__semanticStyleDetailView, "bottomAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintGreaterThanOrEqualToAnchor:constant:", v56, v51);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v142[19] = v57;
    -[UIButton bottomAnchor](v2->__selectButton, "bottomAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView bottomAnchor](v2->__scrollView, "bottomAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:constant:", v59, -v51);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v142[20] = v60;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v142, 21);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "activateConstraints:", v61);

    v2 = (CAMSemanticStyleSettingsView *)p_isa;
    objc_msgSend(p_isa, "_updateUIForStyle:", v129);
    objc_msgSend(p_isa, "_updateUIForShowsTitle");

  }
  return v2;
}

id __36__CAMSemanticStyleSettingsView_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0DC1138]);
  return v3;
}

- (void)setShowsTitle:(BOOL)a3
{
  if (self->_showsTitle != a3)
  {
    self->_showsTitle = a3;
    -[CAMSemanticStyleSettingsView _updateUIForShowsTitle](self, "_updateUIForShowsTitle");
  }
}

- (void)_updateUIForShowsTitle
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[CAMSemanticStyleSettingsView _descriptionLabelTopConstraint](self, "_descriptionLabelTopConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CAMSemanticStyleSettingsView _descriptionLabelTopConstraint](self, "_descriptionLabelTopConstraint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setActive:", 0);

  }
  v5 = -[CAMSemanticStyleSettingsView showsTitle](self, "showsTitle");
  -[CAMSemanticStyleSettingsView _titleLabel](self, "_titleLabel");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMSemanticStyleSettingsView _descriptionLabel](self, "_descriptionLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v11, "bottomAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CAMSemanticStyleSettingsView _scrollView](self, "_scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v7, 16.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setActive:", 1);
  -[CAMSemanticStyleSettingsView _setDescriptionLabelTopConstraint:](self, "_setDescriptionLabelTopConstraint:", v10);
  objc_msgSend(v11, "setHidden:", !v5);

}

- (id)_previewImageNameForSemanticStylePreset:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return CFSTR("CAMSemanticStylePreviewStandard");
  else
    return off_1EA32CE28[a3 - 1];
}

- (void)_updateUIForStyle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[CAMSemanticStyleSettingsView _semanticStyleDetailView](self, "_semanticStyleDetailView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSemanticStyle:", v4);

  v6 = (void *)MEMORY[0x1E0CB3940];
  CAMLocalizedFrameworkString(CFSTR("SEMANTIC_STYLES_SETTINGS_USE_STYLE_FORMAT"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringWithValidatedFormat:validFormatSpecifiers:error:", v7, CFSTR("%@"), 0, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[CAMSemanticStyleSettingsView _selectButton](self, "_selectButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:forState:", v10, 0);

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CAMSemanticStyleSettingsView;
  -[CAMSemanticStyleSettingsView layoutSubviews](&v13, sel_layoutSubviews);
  -[CAMSemanticStyleSettingsView _scrollView](self, "_scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  -[CAMSemanticStyleSettingsView _semanticStylePicker](self, "_semanticStylePicker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[CAMSemanticStyleSettingsView _layoutSemanticStyleMaskedBadgesForContentFrame:](self, "_layoutSemanticStyleMaskedBadgesForContentFrame:", v6, v8, v10, v12);
}

- (void)_layoutSemanticStyleMaskedBadgesForContentFrame:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  double height;
  double v36;
  double v37;
  _BOOL4 IsNull;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  _BOOL4 v46;
  double v47;
  void *v48;
  void *v49;
  unint64_t v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CGFloat y;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  double v66;
  id v67;
  double v68;
  double x;
  double width;
  double r1;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;

  width = a3.size.width;
  r1 = a3.size.height;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CAMSemanticStyleSettingsView _semanticStylePicker](self, "_semanticStylePicker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  CGRectGetMaxY(v72);
  -[CAMSemanticStyleSettingsView _semanticStylePicker](self, "_semanticStylePicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pageControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  CGRectGetMinY(v73);

  -[CAMSemanticStyleSettingsView _semanticStyles](self, "_semanticStyles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = 0;
    v55 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v56 = *MEMORY[0x1E0C9D820];
    v53 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v54 = *MEMORY[0x1E0C9D648];
    v51 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v52 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    while (1)
    {
      -[CAMSemanticStyleSettingsView _semanticStyleBadges](self, "_semanticStyleBadges", *(_QWORD *)&v51);
      v67 = (id)objc_claimAutoreleasedReturnValue();
      if (v9 >= objc_msgSend(v67, "count"))
        break;
      -[CAMSemanticStyleSettingsView _semanticStyleImageViews](self, "_semanticStyleImageViews");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v9 < v11)
      {
        -[CAMSemanticStyleSettingsView _semanticStyleBadges](self, "_semanticStyleBadges");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[CAMSemanticStyleSettingsView _semanticStyleImageViews](self, "_semanticStyleImageViews");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        -[CAMSemanticStyleSettingsView _semanticStylePicker](self, "_semanticStylePicker");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "presentatationStyleRectAtIndex:", v9);
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v24 = v23;

        -[CAMSemanticStyleSettingsView _scrollView](self, "_scrollView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMSemanticStyleSettingsView _semanticStylePicker](self, "_semanticStylePicker");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "convertRect:fromView:", v26, v18, v20, v22, v24);
        v63 = v28;
        v65 = v27;
        v30 = v29;
        v32 = v31;

        objc_msgSend(v13, "sizeThatFits:", v56, v55);
        UIRectGetCenter();
        v74.origin.x = x;
        v74.origin.y = y;
        v74.size.width = width;
        v74.size.height = r1;
        CGRectGetMaxY(v74);
        UIRectCenteredAboutPointScale();
        v68 = v75.origin.x;
        v79.origin.x = v65;
        v79.origin.y = v63;
        v79.size.width = v30;
        v79.size.height = v32;
        v76 = CGRectIntersection(v75, v79);
        v33 = v76.origin.x;
        v61 = v76.origin.y;
        v34 = v76.size.width;
        height = v76.size.height;
        v76.origin.x = x;
        v76.size.width = width;
        v76.origin.y = y;
        v76.size.height = r1;
        v80.origin.x = v65;
        v80.origin.y = v63;
        v80.size.width = v30;
        v80.size.height = v32;
        v77 = CGRectIntersection(v76, v80);
        v64 = v77.origin.x;
        v36 = v77.origin.y;
        v60 = v77.size.width;
        v37 = v77.size.height;
        v77.origin.x = v33;
        v77.origin.y = v61;
        v77.size.width = v34;
        v77.size.height = height;
        IsNull = CGRectIsNull(v77);
        v39 = v51;
        v40 = IsNull ? v51 : height;
        v66 = v40;
        v41 = IsNull ? v52 : v34;
        v59 = v41;
        v42 = v53;
        v43 = IsNull ? v53 : v61;
        v62 = v43;
        v44 = IsNull ? v54 : v33;
        v58 = v44;
        v45 = v64;
        v78.origin.x = v64;
        v78.origin.y = v36;
        v78.size.width = v60;
        v78.size.height = v37;
        v46 = CGRectIsNull(v78);
        if (v46)
          v45 = v54;
        else
          v42 = v36;
        v47 = v46 ? v52 : v60;
        if (!v46)
          v39 = v37;
        objc_msgSend(v13, "setFrame:", v58, v62, v59, v66);
        objc_msgSend(v13, "setBadgeLeftInset:", v68 - v58);
        objc_msgSend(v15, "superview");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setFrame:", v45, v42, v47, v39);

        objc_msgSend(v15, "setFrame:", x - v45, 0.0, width, r1);
        ++v9;
        -[CAMSemanticStyleSettingsView _semanticStyles](self, "_semanticStyles");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "count");

        if (v9 < v50)
          continue;
      }
      return;
    }

  }
}

- (void)_handleUseStyleButtonReleased:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[CAMSemanticStyleSettingsView _semanticStylePicker](self, "_semanticStylePicker", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("CAMUserPreferenceSelectedSemanticStyleIndex"), (CFPropertyListRef)objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "selectedStyleIndex")), CFSTR("com.apple.camera"));

  CFPreferencesAppSynchronize(CFSTR("com.apple.camera"));
  -[CAMSemanticStyleSettingsView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "settingsViewDidDismiss:", self);

}

- (void)semanticStylePickerDidChangeSelectedStyle:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CAMSemanticStyleSettingsView _semanticStyles](self, "_semanticStyles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "selectedStyleIndex");

  objc_msgSend(v5, "objectAtIndex:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v8)
  {
    -[CAMSemanticStyleSettingsView _updateUIForStyle:](self, "_updateUIForStyle:", v8);
    v7 = v8;
  }

}

- (void)semanticStylePickerDidScroll:(id)a3
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

  -[CAMSemanticStyleSettingsView _semanticStylePicker](self, "_semanticStylePicker", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[CAMSemanticStyleSettingsView _layoutSemanticStyleMaskedBadgesForContentFrame:](self, "_layoutSemanticStyleMaskedBadgesForContentFrame:", v6, v8, v10, v12);
}

- (BOOL)showsTitle
{
  return self->_showsTitle;
}

- (CAMSemanticStyleSettingsViewDelegate)delegate
{
  return (CAMSemanticStyleSettingsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIScrollView)_scrollView
{
  return self->__scrollView;
}

- (UILabel)_titleLabel
{
  return self->__titleLabel;
}

- (UILabel)_descriptionLabel
{
  return self->__descriptionLabel;
}

- (UIButton)_selectButton
{
  return self->__selectButton;
}

- (CAMSemanticStylePicker)_semanticStylePicker
{
  return self->__semanticStylePicker;
}

- (CAMSemanticStyleDetailView)_semanticStyleDetailView
{
  return self->__semanticStyleDetailView;
}

- (NSArray)_semanticStyles
{
  return self->__semanticStyles;
}

- (NSArray)_semanticStyleBadges
{
  return self->__semanticStyleBadges;
}

- (NSArray)_semanticStyleImageViews
{
  return self->__semanticStyleImageViews;
}

- (NSLayoutConstraint)_descriptionLabelTopConstraint
{
  return self->__descriptionLabelTopConstraint;
}

- (void)_setDescriptionLabelTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->__descriptionLabelTopConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__descriptionLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->__semanticStyleImageViews, 0);
  objc_storeStrong((id *)&self->__semanticStyleBadges, 0);
  objc_storeStrong((id *)&self->__semanticStyles, 0);
  objc_storeStrong((id *)&self->__semanticStyleDetailView, 0);
  objc_storeStrong((id *)&self->__semanticStylePicker, 0);
  objc_storeStrong((id *)&self->__selectButton, 0);
  objc_storeStrong((id *)&self->__descriptionLabel, 0);
  objc_storeStrong((id *)&self->__titleLabel, 0);
  objc_storeStrong((id *)&self->__scrollView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
