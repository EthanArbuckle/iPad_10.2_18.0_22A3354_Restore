@implementation CAMSmartStyleSettingsView

- (CAMSmartStyleSettingsView)initWithDelegate:(id)a3 stylePresets:(id)a4 selectedIndex:(int64_t)a5 hasEnoughPhotos:(BOOL)a6 usingMostCompatibleFormat:(BOOL)a7
{
  CAMSmartStyleSettingsView *v11;
  CAMSmartStyleSettingsView *v12;
  void *v13;
  CAMScrollViewWithLayoutDelegate *v14;
  CAMScrollViewWithLayoutDelegate *scrollView;
  NSMutableArray *v16;
  NSMutableArray *styleNameBadges;
  NSMutableArray *v18;
  NSMutableArray *intensitySliders;
  NSMutableArray *v20;
  NSMutableArray *styleDescriptionLabels;
  NSMutableArray *v22;
  NSMutableArray *styleBadgeBelowDotsConstraints;
  NSMutableArray *v24;
  NSMutableArray *styleBadgeBelowImageConstraints;
  NSMutableArray *v26;
  NSMutableArray *styleBadgeCenterXConstraints;
  NSMutableArray *v28;
  NSMutableArray *intensitySliderBelowDescriptionConstraints;
  NSMutableArray *v30;
  NSMutableArray *intensitySliderBelowDpadConstraints;
  NSMutableArray *v32;
  NSMutableArray *continueButtonBelowIntensitySliderConstraints;
  void *v34;
  uint64_t v35;
  id WeakRetained;
  uint64_t v37;
  NSArray *styleTypes;
  unint64_t v39;
  NSMutableDictionary *v40;
  NSMutableDictionary *previewViewControllersByStyleIndex;
  uint64_t v42;
  NSMutableSet *stageButtonSuppressionReasons;
  void *v44;
  void *v45;
  uint64_t v46;
  UIImageView *introImageView;
  uint64_t v48;
  UILabel *introTitleLabel;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  UIStackView *finishedStack;
  id v56;
  unint64_t v57;
  id v58;
  CAMSemanticStylePicker *v59;
  CAMSemanticStylePicker *stylePicker;
  void *v61;
  void *v62;
  CAMSemanticStylePicker *v63;
  void *v64;
  NSArray *v65;
  uint64_t v66;
  CAMSmartStyleSettingsView *v67;
  void *v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  PEPhotoStyleDPad *dpadControl;
  void *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  UIPageControl *v82;
  UIPageControl *previewPageDots;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  UIButton *selectAssetsButton;
  void *v90;
  void *v91;
  uint64_t v92;
  UIButton *showGridButton;
  const __CFString *v94;
  __CFString *v95;
  void *v96;
  uint64_t v97;
  UILabel *introInstructionLabel;
  void *v99;
  uint64_t v100;
  UILabel *introDescriptionLabel;
  void *v102;
  void *v103;
  uint64_t v104;
  UILabel *chooseInstructionLabel;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  UIImageView *chooseInstructionArrow;
  void *v111;
  uint64_t v112;
  UILabel *tuneInstructionLabel;
  void *v114;
  void *v115;
  void *v116;
  uint64_t v117;
  UIButton *continueButton;
  uint64_t v119;
  UIButton *resetButton;
  UIButton *v121;
  void *v122;
  uint64_t v123;
  UIButton *startOverButton;
  UIButton *v125;
  void *v126;
  uint64_t v127;
  UIButton *launchCameraButton;
  UIButton *v129;
  void *v130;
  void *v131;
  CAMFeedbackController *v132;
  CAMFeedbackController *feedbackController;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  id *location;
  id *locationa;
  _BOOL4 v143;
  id obj;
  id v145;
  _QWORD v146[4];
  id v147;
  id from;
  _QWORD v149[4];
  CAMSmartStyleSettingsView *v150;
  objc_super v151;
  _QWORD v152[4];

  v143 = a7;
  v152[2] = *MEMORY[0x1E0C80C00];
  obj = a3;
  v145 = a4;
  v151.receiver = self;
  v151.super_class = (Class)CAMSmartStyleSettingsView;
  v11 = -[CAMSmartStyleSettingsView initWithFrame:](&v151, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v12 = v11;
  if (v11)
  {
    location = (id *)&v11->_delegate;
    objc_storeWeak((id *)&v11->_delegate, obj);
    v12->__hasEnoughPhotos = a6;
    v12->__usingMostCompatibleFormat = v143;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSmartStyleSettingsView setBackgroundColor:](v12, "setBackgroundColor:", v13);

    v14 = objc_alloc_init(CAMScrollViewWithLayoutDelegate);
    scrollView = v12->__scrollView;
    v12->__scrollView = v14;

    -[CAMScrollViewWithLayoutDelegate setShowsVerticalScrollIndicator:](v12->__scrollView, "setShowsVerticalScrollIndicator:", 1);
    -[CAMScrollViewWithLayoutDelegate setShowsHorizontalScrollIndicator:](v12->__scrollView, "setShowsHorizontalScrollIndicator:", 0);
    -[CAMScrollViewWithLayoutDelegate setLayoutDelegate:](v12->__scrollView, "setLayoutDelegate:", v12);
    -[CAMSmartStyleSettingsView addSubview:](v12, "addSubview:", v12->__scrollView);
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    styleNameBadges = v12->__styleNameBadges;
    v12->__styleNameBadges = v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    intensitySliders = v12->__intensitySliders;
    v12->__intensitySliders = v18;

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    styleDescriptionLabels = v12->__styleDescriptionLabels;
    v12->__styleDescriptionLabels = v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    styleBadgeBelowDotsConstraints = v12->__styleBadgeBelowDotsConstraints;
    v12->__styleBadgeBelowDotsConstraints = v22;

    v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    styleBadgeBelowImageConstraints = v12->__styleBadgeBelowImageConstraints;
    v12->__styleBadgeBelowImageConstraints = v24;

    v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    styleBadgeCenterXConstraints = v12->__styleBadgeCenterXConstraints;
    v12->__styleBadgeCenterXConstraints = v26;

    v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    intensitySliderBelowDescriptionConstraints = v12->__intensitySliderBelowDescriptionConstraints;
    v12->__intensitySliderBelowDescriptionConstraints = v28;

    v30 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    intensitySliderBelowDpadConstraints = v12->__intensitySliderBelowDpadConstraints;
    v12->__intensitySliderBelowDpadConstraints = v30;

    v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    continueButtonBelowIntensitySliderConstraints = v12->__continueButtonBelowIntensitySliderConstraints;
    v12->__continueButtonBelowIntensitySliderConstraints = v32;

    if (objc_msgSend(v145, "count") < (unint64_t)a5)
      a5 = 0;
    objc_msgSend(v145, "objectAtIndexedSubscript:", a5);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "integerValue");

    WeakRetained = objc_loadWeakRetained(location);
    objc_msgSend(WeakRetained, "settingsView:requestsStyleForPresetType:", v12, v35);
    v136 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(&unk_1EA3B3560, "arrayByAddingObjectsFromArray:", v145);
    v37 = objc_claimAutoreleasedReturnValue();
    styleTypes = v12->__styleTypes;
    v12->__styleTypes = (NSArray *)v37;

    if (a5 > 0 || (objc_msgSend(v136, "isNeutral") & 1) == 0)
      -[CAMSmartStyleSettingsView _setDidCompleteChooseInstructions:](v12, "_setDidCompleteChooseInstructions:", 1);
    if (-[CAMSmartStyleSettingsView _didCompleteChooseInstructions](v12, "_didCompleteChooseInstructions"))
      v39 = a5 + 1;
    else
      v39 = 0;
    v12->_visiblePreviewIndex = v39;
    v12->__stage = 0;
    v40 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    previewViewControllersByStyleIndex = v12->__previewViewControllersByStyleIndex;
    v12->__previewViewControllersByStyleIndex = v40;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v42 = objc_claimAutoreleasedReturnValue();
    stageButtonSuppressionReasons = v12->__stageButtonSuppressionReasons;
    v12->__stageButtonSuppressionReasons = (NSMutableSet *)v42;

    v44 = (void *)MEMORY[0x1E0DC3870];
    CAMCameraUIFrameworkBundle();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "imageNamed:inBundle:", CFSTR("CAMSmartStyleSettingsGraphic"), v45);
    v140 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v140);
    introImageView = v12->__introImageView;
    v12->__introImageView = (UIImageView *)v46;

    -[CAMScrollViewWithLayoutDelegate addSubview:](v12->__scrollView, "addSubview:", v12->__introImageView);
    CAMLocalizedFrameworkString(CFSTR("SMART_STYLES_SETTINGS_TITLE_INTRO"), 0);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSmartStyleSettingsView _titleLabelWithText:](v12, "_titleLabelWithText:", v139);
    v48 = objc_claimAutoreleasedReturnValue();
    introTitleLabel = v12->__introTitleLabel;
    v12->__introTitleLabel = (UILabel *)v48;

    -[CAMScrollViewWithLayoutDelegate addSubview:](v12->__scrollView, "addSubview:", v12->__introTitleLabel);
    CAMLocalizedFrameworkString(CFSTR("SMART_STYLES_SETTINGS_TITLE_FINISHED"), 0);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    -[CAMSmartStyleSettingsView _titleCheckmarkView](v12, "_titleCheckmarkView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v152[0] = v51;
    -[CAMSmartStyleSettingsView _titleLabelWithText:](v12, "_titleLabelWithText:", v138);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v152[1] = v52;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v152, 2);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v50, "initWithArrangedSubviews:", v53);
    finishedStack = v12->__finishedStack;
    v12->__finishedStack = (UIStackView *)v54;

    -[UIStackView setAxis:](v12->__finishedStack, "setAxis:", 0);
    -[UIStackView setSpacing:](v12->__finishedStack, "setSpacing:", 8.0);
    -[UIStackView setAlignment:](v12->__finishedStack, "setAlignment:", 3);
    -[UIStackView setDistribution:](v12->__finishedStack, "setDistribution:", 0);
    -[CAMScrollViewWithLayoutDelegate addSubview:](v12->__scrollView, "addSubview:", v12->__finishedStack);
    v56 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (-[NSArray count](v12->__styleTypes, "count"))
    {
      v57 = 0;
      do
      {
        v58 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
        objc_msgSend(v58, "setClipsToBounds:", 1);
        -[CAMScrollViewWithLayoutDelegate addSubview:](v12->__scrollView, "addSubview:", v58);
        objc_msgSend(v56, "addObject:", v58);

        ++v57;
      }
      while (v57 < -[NSArray count](v12->__styleTypes, "count"));
    }
    objc_storeStrong((id *)&v12->__styleClippingContainerViews, v56);
    -[CAMSmartStyleSettingsView _createNeededStylePages](v12, "_createNeededStylePages");
    v59 = objc_alloc_init(CAMSemanticStylePicker);
    stylePicker = v12->__stylePicker;
    v12->__stylePicker = v59;

    -[CAMSemanticStylePicker setDelegate:](v12->__stylePicker, "setDelegate:", v12);
    -[CAMSemanticStylePicker setNumberOfStyles:](v12->__stylePicker, "setNumberOfStyles:", -[NSArray count](v12->__styleTypes, "count"));
    -[CAMSemanticStylePicker setSelectedStyleIndex:](v12->__stylePicker, "setSelectedStyleIndex:", v39);
    -[CAMSemanticStylePicker setHidesSelfWhenNotExpanded:](v12->__stylePicker, "setHidesSelfWhenNotExpanded:", 0);
    -[CAMSemanticStylePicker setExpanded:](v12->__stylePicker, "setExpanded:", 1);
    -[CAMSemanticStylePicker setSpacerWidth:](v12->__stylePicker, "setSpacerWidth:", 3.0);
    -[CAMSemanticStylePicker setMaterial:](v12->__stylePicker, "setMaterial:", 4);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStylePicker setMaterialColor:](v12->__stylePicker, "setMaterialColor:", v61);

    -[CAMSemanticStylePicker pageControl](v12->__stylePicker, "pageControl");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setHidden:", 1);

    v63 = v12->__stylePicker;
    v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v12, sel__handleStylePickerTap_);
    -[CAMSemanticStylePicker addGestureRecognizer:](v63, "addGestureRecognizer:", v64);

    -[CAMScrollViewWithLayoutDelegate addSubview:](v12->__scrollView, "addSubview:", v12->__stylePicker);
    v65 = v12->__styleTypes;
    v66 = MEMORY[0x1E0C809B0];
    v149[0] = MEMORY[0x1E0C809B0];
    v149[1] = 3221225472;
    v149[2] = __115__CAMSmartStyleSettingsView_initWithDelegate_stylePresets_selectedIndex_hasEnoughPhotos_usingMostCompatibleFormat___block_invoke;
    v149[3] = &unk_1EA32BE58;
    v67 = v12;
    v150 = v67;
    -[NSArray enumerateObjectsUsingBlock:](v65, "enumerateObjectsUsingBlock:", v149);
    if (v39 >= -[NSArray count](v12->__styleTypes, "count"))
    {
      v68 = &unk_1EA3B0C10;
    }
    else
    {
      -[NSArray objectAtIndexedSubscript:](v12->__styleTypes, "objectAtIndexedSubscript:", v39);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v135 = v68;
    v69 = objc_msgSend(v68, "integerValue");
    v70 = objc_loadWeakRetained(location);
    objc_msgSend(v70, "settingsView:requestsStyleForPresetType:", v67, v69);
    locationa = (id *)objc_claimAutoreleasedReturnValue();

    v137 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D098]), "initWithPresetType:", v69);
    v71 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7CB00]), "initWithSize:", 125.0, 125.0);
    dpadControl = v67->__dpadControl;
    v67->__dpadControl = (PEPhotoStyleDPad *)v71;

    objc_msgSend(obj, "addChildViewController:toView:", v67->__dpadControl, v67);
    -[PEPhotoStyleDPad view](v67->__dpadControl, "view");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "layoutIfNeeded");

    -[CAMSmartStyleSettingsView _updateDpadBackground](v67, "_updateDpadBackground");
    objc_initWeak(&from, v67);
    v146[0] = v66;
    v146[1] = 3221225472;
    v146[2] = __115__CAMSmartStyleSettingsView_initWithDelegate_stylePresets_selectedIndex_hasEnoughPhotos_usingMostCompatibleFormat___block_invoke_2;
    v146[3] = &unk_1EA32A6D0;
    objc_copyWeak(&v147, &from);
    -[PEPhotoStyleDPad setOnValueChanged:](v67->__dpadControl, "setOnValueChanged:", v146);
    +[CAMSmartStyleUtilities slider2DValueForStyle:limitRangeForSystemStyles:](CAMSmartStyleUtilities, "slider2DValueForStyle:limitRangeForSystemStyles:", locationa, 1);
    v75 = v74;
    v77 = v76;
    +[CAMSmartStyleUtilities slider2DValueForStyle:limitRangeForSystemStyles:](CAMSmartStyleUtilities, "slider2DValueForStyle:limitRangeForSystemStyles:", v137, 1);
    v79 = v78;
    v81 = v80;
    -[PEPhotoStyleDPad setValue:notifyObserver:](v67->__dpadControl, "setValue:notifyObserver:", 0, v75, v77);
    -[PEPhotoStyleDPad setDefaultValue:](v67->__dpadControl, "setDefaultValue:", v79, v81);
    v82 = (UIPageControl *)objc_alloc_init(MEMORY[0x1E0DC3A88]);
    previewPageDots = v67->__previewPageDots;
    v67->__previewPageDots = v82;

    -[UIPageControl setUserInteractionEnabled:](v67->__previewPageDots, "setUserInteractionEnabled:", 1);
    -[UIPageControl setAllowsContinuousInteraction:](v67->__previewPageDots, "setAllowsContinuousInteraction:", 1);
    -[CAMSmartStyleSettingsView _updatePreviewPageDots](v67, "_updatePreviewPageDots");
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPageControl setPageIndicatorTintColor:](v67->__previewPageDots, "setPageIndicatorTintColor:", v84);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPageControl setCurrentPageIndicatorTintColor:](v67->__previewPageDots, "setCurrentPageIndicatorTintColor:", v85);

    -[UIPageControl addTarget:action:forControlEvents:](v67->__previewPageDots, "addTarget:action:forControlEvents:", v67, sel__handlePageControlValueChanged_, 4096);
    -[UIPageControl addTarget:action:forControlEvents:](v67->__previewPageDots, "addTarget:action:forControlEvents:", v67, sel__handlePageControlTouchDown_, 1);
    -[CAMScrollViewWithLayoutDelegate addSubview:](v12->__scrollView, "addSubview:", v67->__previewPageDots);
    v86 = (void *)MEMORY[0x1E0DC3518];
    -[CAMSmartStyleSettingsView _assetButtonConfiguration](v67, "_assetButtonConfiguration");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "buttonWithConfiguration:primaryAction:", v87, 0);
    v88 = objc_claimAutoreleasedReturnValue();
    selectAssetsButton = v67->__selectAssetsButton;
    v67->__selectAssetsButton = (UIButton *)v88;

    -[UIButton addTarget:action:forControlEvents:](v67->__selectAssetsButton, "addTarget:action:forControlEvents:", v67, sel__beginAssetSelection_, 64);
    -[CAMScrollViewWithLayoutDelegate addSubview:](v12->__scrollView, "addSubview:", v67->__selectAssetsButton);
    v90 = (void *)MEMORY[0x1E0DC3518];
    -[CAMSmartStyleSettingsView _showGridButtonConfiguration](v67, "_showGridButtonConfiguration");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "buttonWithConfiguration:primaryAction:", v91, 0);
    v92 = objc_claimAutoreleasedReturnValue();
    showGridButton = v67->__showGridButton;
    v67->__showGridButton = (UIButton *)v92;

    -[UIButton addTarget:action:forControlEvents:](v67->__showGridButton, "addTarget:action:forControlEvents:", v67, sel__handleShowGridButton_, 64);
    -[CAMScrollViewWithLayoutDelegate addSubview:](v12->__scrollView, "addSubview:", v67->__showGridButton);
    v94 = CFSTR("SMART_STYLES_SETTINGS_INTRO_INSTRUCTION_NOT_ENOUGH_PHOTOS");
    if (v143)
      v94 = CFSTR("SMART_STYLES_SETTINGS_INTRO_INSTRUCTION_MOST_COMPATIBLE_FORMAT");
    if (v12->__hasEnoughPhotos)
      v95 = CFSTR("SMART_STYLES_SETTINGS_INTRO_INSTRUCTION");
    else
      v95 = (__CFString *)v94;
    CAMLocalizedFrameworkString(v95, 0);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = -[CAMSmartStyleSettingsView _newInstructionLabel](v67, "_newInstructionLabel");
    introInstructionLabel = v67->__introInstructionLabel;
    v67->__introInstructionLabel = (UILabel *)v97;

    -[UILabel setText:](v67->__introInstructionLabel, "setText:", v96);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v67->__introInstructionLabel, "setTextColor:", v99);

    -[CAMScrollViewWithLayoutDelegate addSubview:](v12->__scrollView, "addSubview:", v67->__introInstructionLabel);
    v100 = -[CAMSmartStyleSettingsView _newInstructionLabel](v67, "_newInstructionLabel");
    introDescriptionLabel = v67->__introDescriptionLabel;
    v67->__introDescriptionLabel = (UILabel *)v100;

    CAMLocalizedFrameworkString(CFSTR("SMART_STYLES_SETTINGS_INTRO_DESCRIPTION"), 0);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v67->__introDescriptionLabel, "setText:", v102);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v67->__introDescriptionLabel, "setTextColor:", v103);

    -[CAMScrollViewWithLayoutDelegate addSubview:](v12->__scrollView, "addSubview:", v67->__introDescriptionLabel);
    v104 = -[CAMSmartStyleSettingsView _newInstructionLabel](v67, "_newInstructionLabel");
    chooseInstructionLabel = v67->__chooseInstructionLabel;
    v67->__chooseInstructionLabel = (UILabel *)v104;

    CAMLocalizedFrameworkString(CFSTR("SMART_STYLES_SETTINGS_CHOOSE_INSTRUCTION"), 0);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v67->__chooseInstructionLabel, "setText:", v106);

    -[CAMScrollViewWithLayoutDelegate addSubview:](v12->__scrollView, "addSubview:", v67->__chooseInstructionLabel);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:", *MEMORY[0x1E0DC4A88]);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("arrow.forward"), v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v108);
    chooseInstructionArrow = v67->__chooseInstructionArrow;
    v67->__chooseInstructionArrow = (UIImageView *)v109;

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v67->__chooseInstructionArrow, "setTintColor:", v111);

    -[CAMScrollViewWithLayoutDelegate addSubview:](v12->__scrollView, "addSubview:", v67->__chooseInstructionArrow);
    v112 = -[CAMSmartStyleSettingsView _newInstructionLabel](v67, "_newInstructionLabel");
    tuneInstructionLabel = v67->__tuneInstructionLabel;
    v67->__tuneInstructionLabel = (UILabel *)v112;

    CAMLocalizedFrameworkString(CFSTR("SMART_STYLES_SETTINGS_TUNE_INSTRUCTION"), 0);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v67->__tuneInstructionLabel, "setText:", v114);

    -[CAMScrollViewWithLayoutDelegate addSubview:](v12->__scrollView, "addSubview:", v67->__tuneInstructionLabel);
    v115 = (void *)MEMORY[0x1E0DC3518];
    objc_msgSend((id)objc_opt_class(), "continueButtonConfiguration");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "buttonWithConfiguration:primaryAction:", v116, 0);
    v117 = objc_claimAutoreleasedReturnValue();
    continueButton = v67->__continueButton;
    v67->__continueButton = (UIButton *)v117;

    -[UIButton addTarget:action:forControlEvents:](v67->__continueButton, "addTarget:action:forControlEvents:", v67, sel__handleContinueButton_, 64);
    -[CAMScrollViewWithLayoutDelegate addSubview:](v12->__scrollView, "addSubview:", v67->__continueButton);
    v119 = -[CAMSmartStyleSettingsView _newSecondaryButton](v67, "_newSecondaryButton");
    resetButton = v67->__resetButton;
    v67->__resetButton = (UIButton *)v119;

    v121 = v67->__resetButton;
    CAMLocalizedFrameworkString(CFSTR("SMART_STYLES_SETTINGS_RESET"), 0);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v121, "setTitle:forState:", v122, 0);

    -[UIButton addTarget:action:forControlEvents:](v67->__resetButton, "addTarget:action:forControlEvents:", v67, sel__resetStyleAndDismiss_, 64);
    -[CAMScrollViewWithLayoutDelegate addSubview:](v12->__scrollView, "addSubview:", v67->__resetButton);
    v123 = -[CAMSmartStyleSettingsView _newSecondaryButton](v67, "_newSecondaryButton");
    startOverButton = v67->__startOverButton;
    v67->__startOverButton = (UIButton *)v123;

    v125 = v67->__startOverButton;
    CAMLocalizedFrameworkString(CFSTR("SMART_STYLES_SETTINGS_START_OVER"), 0);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v125, "setTitle:forState:", v126, 0);

    -[UIButton addTarget:action:forControlEvents:](v67->__startOverButton, "addTarget:action:forControlEvents:", v67, sel__startOver_, 64);
    -[CAMScrollViewWithLayoutDelegate addSubview:](v12->__scrollView, "addSubview:", v67->__startOverButton);
    v127 = -[CAMSmartStyleSettingsView _newSecondaryButton](v67, "_newSecondaryButton");
    launchCameraButton = v67->__launchCameraButton;
    v67->__launchCameraButton = (UIButton *)v127;

    v129 = v67->__launchCameraButton;
    CAMLocalizedFrameworkString(CFSTR("SMART_STYLES_SETTINGS_LAUNCH_CAMERA"), 0);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v129, "setTitle:forState:", v130, 0);

    -[UIButton addTarget:action:forControlEvents:](v67->__launchCameraButton, "addTarget:action:forControlEvents:", v67, sel__launchCamera_, 64);
    -[CAMScrollViewWithLayoutDelegate addSubview:](v12->__scrollView, "addSubview:", v67->__launchCameraButton);
    -[CAMSmartStyleSettingsView _addConstraints](v67, "_addConstraints");
    -[CAMSmartStyleSettingsView _updatePreviewAdjustmentsUpdateModelValues:](v67, "_updatePreviewAdjustmentsUpdateModelValues:", 1);
    -[CAMSmartStyleSettingsView _stageUpdates](v67, "_stageUpdates");
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v129) = objc_msgSend(v131, "allowHaptics");

    if ((_DWORD)v129)
    {
      v132 = objc_alloc_init(CAMFeedbackController);
      feedbackController = v67->__feedbackController;
      v67->__feedbackController = v132;

    }
    objc_destroyWeak(&v147);
    objc_destroyWeak(&from);

  }
  return v12;
}

void __115__CAMSmartStyleSettingsView_initWithDelegate_stylePresets_selectedIndex_hasEnoughPhotos_usingMostCompatibleFormat___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v3 = objc_msgSend(a2, "integerValue");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 424));
  objc_msgSend(WeakRetained, "settingsView:requestsStyleForPresetType:", *(_QWORD *)(a1 + 32), v3);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x1E0D0D028]);
  objc_msgSend(v5, "setFontStyle:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorWithAlphaComponent:", 0.5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setFillColor:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setContentColor:", v8);

  objc_msgSend(v18, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CAMPreferredLocale();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uppercaseStringWithLocale:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setText:", v11);

  v12 = objc_alloc_init(MEMORY[0x1E0D0D038]);
  objc_msgSend(v12, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__intensitySliderUpdated_, 4096);
  objc_msgSend(v18, "castType");
  CEKSmartStyleIntensitySliderGradientColorsForCastType();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setColors:", v13);

  objc_msgSend(v18, "castIntensity");
  *(float *)&v14 = v14;
  objc_msgSend(v12, "setValue:", v14);
  objc_msgSend(v12, "setHidden:", objc_msgSend(MEMORY[0x1E0D0D098], "canCustomizeCastIntensityForCastType:", objc_msgSend(v18, "castType")) ^ 1);
  v15 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v15, "setTextAlignment:", 1);
  objc_msgSend(v15, "setNumberOfLines:", 0);
  objc_msgSend(v15, "setLineBreakMode:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_fontWithTextStyle:", *MEMORY[0x1E0DC4A90]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v16);

  objc_msgSend((id)objc_opt_class(), "_descriptionForStylePreset:", v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v17);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "addSubview:", v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "addSubview:", v12);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "addSubview:", v15);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "addObject:", v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "addObject:", v12);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "addObject:", v15);

}

void __115__CAMSmartStyleSettingsView_initWithDelegate_stylePresets_selectedIndex_hasEnoughPhotos_usingMostCompatibleFormat___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v2, "_dpadControl");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_dpadControlUpdated:", v1);

}

- (id)_newInstructionLabel
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v3, "setTextAlignment:", 1);
  objc_msgSend(v3, "setNumberOfLines:", 0);
  objc_msgSend(v3, "setLineBreakMode:", 0);
  -[CAMSmartStyleSettingsView _fontWithTextStyle:](self, "_fontWithTextStyle:", *MEMORY[0x1E0DC4A88]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

  return v3;
}

- (id)_newSecondaryButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0DC3518];
  -[CAMSmartStyleSettingsView _secondaryButtonConfiguration](self, "_secondaryButtonConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buttonWithConfiguration:primaryAction:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleColor:forState:", v5, 0);

  return v4;
}

- (void)_createNeededStylePages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  -[CAMSmartStyleSettingsView _previewViewControllersByStyleIndex](self, "_previewViewControllersByStyleIndex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CAMSmartStyleSettingsView visiblePreviewIndex](self, "visiblePreviewIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMSmartStyleSettingsView _styleClippingContainerViews](self, "_styleClippingContainerViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__CAMSmartStyleSettingsView__createNeededStylePages__block_invoke;
  v8[3] = &unk_1EA32CF28;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

void __52__CAMSmartStyleSettingsView__createNeededStylePages__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v5 = a2;
  v6 = objc_msgSend(*(id *)(a1 + 32), "visiblePreviewIndex");
  v8 = v6 - 1 <= a3 && v6 + 1 >= a3;
  if (!a3)
    v8 &= ~objc_msgSend(*(id *)(a1 + 32), "_didCompleteChooseInstructions");
  objc_msgSend(v5, "viewWithTag:", 47);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 0;
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "_styleTypes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue");

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 32);
    v22 = 0;
    objc_msgSend(v15, "settingsView:requestsViewControllerForPresetType:pageIndex:parentViewController:", v16, v14, a3, &v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v22;

    objc_msgSend(v18, "addChildViewController:", v17);
    v19 = *(void **)(a1 + 40);
    if (v19)
      objc_msgSend(v17, "setExpandedItemIndex:", objc_msgSend(v19, "expandedItemIndex"));
    v20 = *(void **)(*(_QWORD *)(a1 + 32) + 496);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v17, v21);

    objc_msgSend(v17, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTag:", 47);
    objc_msgSend(v5, "addSubview:", v10);
    objc_msgSend(v17, "didMoveToParentViewController:", v18);

  }
}

- (void)_removeStylePageForIndex:(int64_t)a3
{
  NSMutableDictionary *previewViewControllersByStyleIndex;
  void *v6;
  void *v7;
  NSObject *v8;
  NSMutableDictionary *v9;
  void *v10;
  int v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  previewViewControllersByStyleIndex = self->__previewViewControllersByStyleIndex;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](previewViewControllersByStyleIndex, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134217984;
      v12 = a3;
      _os_log_impl(&dword_1DB760000, v8, OS_LOG_TYPE_DEFAULT, "Removing page=%lu", (uint8_t *)&v11, 0xCu);
    }

    v9 = self->__previewViewControllersByStyleIndex;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", 0, v10);

    -[CAMSmartStyleSettingsView _removeChildViewController:](self, "_removeChildViewController:", v7);
  }

}

- (void)_removeChildViewController:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(v4, "willMoveToParentViewController:", 0);
  objc_msgSend(v4, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  objc_msgSend(v4, "removeFromParentViewController");
}

- (BOOL)scrollEnabled
{
  void *v2;
  char v3;

  -[CAMSmartStyleSettingsView _stylePicker](self, "_stylePicker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "scrollEnabled");

  return v3;
}

- (void)setScrollEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CAMSmartStyleSettingsView _stylePicker](self, "_stylePicker");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScrollEnabled:", v3);

}

+ (double)dpadWidthRatio
{
  return 0.333333333;
}

- (void)updateImageViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  -[CAMSmartStyleSettingsView _previewViewControllersByStyleIndex](self, "_previewViewControllersByStyleIndex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CAMSmartStyleSettingsView visiblePreviewIndex](self, "visiblePreviewIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "updateViewsWithLoadResults");
  -[CAMSmartStyleSettingsView _previewViewControllersByStyleIndex](self, "_previewViewControllersByStyleIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__CAMSmartStyleSettingsView_updateImageViews__block_invoke;
  v8[3] = &unk_1EA32CF50;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v8);

}

uint64_t __45__CAMSmartStyleSettingsView_updateImageViews__block_invoke(uint64_t result, uint64_t a2, void *a3)
{
  if (*(void **)(result + 32) != a3)
    return objc_msgSend(a3, "updateViewsWithLoadResults");
  return result;
}

- (void)zoomOutToGridAnimated:(BOOL)a3
{
  -[CAMSmartStyleSettingsView _setPreviewViewControllersExpandedItemIndex:animated:](self, "_setPreviewViewControllersExpandedItemIndex:animated:", 0x7FFFFFFFFFFFFFFFLL, a3);
}

- (void)didFinishPickingAssets
{
  if (!self->__stage)
    -[CAMSmartStyleSettingsView _moveToNextStageIfAllowed](self, "_moveToNextStageIfAllowed");
}

- (void)stopAllAnimations
{
  id v3;

  -[CAMSmartStyleSettingsView _setAnimationSequence:](self, "_setAnimationSequence:", 0);
  -[CAMSmartStyleSettingsView _dpadControl](self, "_dpadControl");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPulsingValueIndicator:", 0);

}

- (void)_setVisiblePreviewIndex:(int64_t)a3 updatePageControl:(BOOL)a4 updateStylePicker:(BOOL)a5 animated:(BOOL)a6 notifyDelegate:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL8 v8;
  _BOOL4 v9;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  if (self->_visiblePreviewIndex != a3)
  {
    v7 = a7;
    v8 = a6;
    v9 = a5;
    self->_visiblePreviewIndex = a3;
    if (a4)
      -[CAMSmartStyleSettingsView _updatePreviewPageDots](self, "_updatePreviewPageDots");
    if (v9)
    {
      -[CAMSmartStyleSettingsView _stylePicker](self, "_stylePicker");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSelectedStyleIndex:animated:", a3, v8);

    }
    -[CAMSmartStyleSettingsView _createNeededStylePages](self, "_createNeededStylePages");
    -[CAMSmartStyleSettingsView _updateDpadBackground](self, "_updateDpadBackground");
    -[CAMSmartStyleSettingsView _updatePreviewAdjustmentsUpdateModelValues:](self, "_updatePreviewAdjustmentsUpdateModelValues:", 0);
    if (v7)
    {
      -[CAMSmartStyleSettingsView _styleTypes](self, "_styleTypes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "integerValue");

      -[CAMSmartStyleSettingsView delegate](self, "delegate");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "settingsView:didChangeToStylePreset:", self, v15);

    }
  }
}

- (void)_updatePreviewPageDots
{
  _BOOL4 v3;
  NSUInteger v4;
  UIPageControl **p_previewPageDots;
  int64_t v6;

  v3 = -[CAMSmartStyleSettingsView _didCompleteChooseInstructions](self, "_didCompleteChooseInstructions");
  v4 = -[NSArray count](self->__styleTypes, "count");
  if (v3)
  {
    p_previewPageDots = &self->__previewPageDots;
    -[UIPageControl setNumberOfPages:](self->__previewPageDots, "setNumberOfPages:", v4 - 1);
    v6 = -[CAMSmartStyleSettingsView visiblePreviewIndex](self, "visiblePreviewIndex") - 1;
  }
  else
  {
    p_previewPageDots = &self->__previewPageDots;
    -[UIPageControl setNumberOfPages:](self->__previewPageDots, "setNumberOfPages:", v4);
    v6 = 0;
  }
  -[UIPageControl setCurrentPage:](*p_previewPageDots, "setCurrentPage:", v6);
}

- (int64_t)_previewIndexFromPageDots
{
  _BOOL4 v3;

  v3 = -[CAMSmartStyleSettingsView _didCompleteChooseInstructions](self, "_didCompleteChooseInstructions");
  return -[UIPageControl currentPage](self->__previewPageDots, "currentPage") + v3;
}

- (id)_centerSquareOfImage:(id)a3 appliesScale:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  id v16;
  double Width;
  id v18;
  CGFloat v19;
  id v20;
  CGImage *v21;
  CGImage *v22;
  void *v23;
  CGRect v25;

  v4 = a4;
  v6 = a3;
  v7 = 1.0;
  if (v4)
  {
    -[CAMSmartStyleSettingsView window](self, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "windowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "screen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");
    v7 = v11;

  }
  objc_msgSend(v6, "size");
  v13 = v7 * v12;
  objc_msgSend(v6, "size");
  v15 = fmin(v13, v7 * v14);
  v16 = objc_retainAutorelease(v6);
  Width = (double)CGImageGetWidth((CGImageRef)objc_msgSend(v16, "CGImage"));
  v18 = objc_retainAutorelease(v16);
  v19 = ((double)CGImageGetHeight((CGImageRef)objc_msgSend(v18, "CGImage")) - v15) * 0.5;
  v20 = objc_retainAutorelease(v18);
  v21 = (CGImage *)objc_msgSend(v20, "CGImage");
  v25.origin.x = (Width - v15) * 0.5;
  v25.origin.y = v19;
  v25.size.width = v15;
  v25.size.height = v15;
  v22 = CGImageCreateWithImageInRect(v21, v25);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v22);

  return v23;
}

- (void)_updateForStageAnimated:(BOOL)a3 scrollToTop:(BOOL)a4
{
  _BOOL4 v5;
  double v7;
  _QWORD v8[5];
  _QWORD v9[5];
  BOOL v10;

  v5 = a3;
  -[CAMSmartStyleSettingsView _setStageButtonsEnabled:forReason:](self, "_setStageButtonsEnabled:forReason:", 0, CFSTR("StageUpdate"));
  v7 = 0.35;
  if (!v5)
    v7 = 0.0;
  v8[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__CAMSmartStyleSettingsView__updateForStageAnimated_scrollToTop___block_invoke;
  v9[3] = &unk_1EA328908;
  v9[4] = self;
  v10 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__CAMSmartStyleSettingsView__updateForStageAnimated_scrollToTop___block_invoke_2;
  v8[3] = &unk_1EA328A68;
  +[CAMView animateIfNeededWithDuration:animations:completion:](CAMView, "animateIfNeededWithDuration:animations:completion:", v9, v8, v7);
}

void __65__CAMSmartStyleSettingsView__updateForStageAnimated_scrollToTop___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_stageUpdates");
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_scrollView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "adjustedContentInset");
    v4 = -v3;

    objc_msgSend(*(id *)(a1 + 32), "_scrollView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContentOffset:", 0.0, v4);

  }
}

uint64_t __65__CAMSmartStyleSettingsView__updateForStageAnimated_scrollToTop___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_setStageButtonsEnabled:forReason:", 1, CFSTR("StageUpdate"));
  result = objc_msgSend(*(id *)(a1 + 32), "_didCompleteChooseInstructions");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_removeStylePageForIndex:", 0);
  return result;
}

- (void)_setStageButtonsEnabled:(BOOL)a3 forReason:(id)a4
{
  NSMutableSet *stageButtonSuppressionReasons;

  stageButtonSuppressionReasons = self->__stageButtonSuppressionReasons;
  if (a3)
    -[NSMutableSet removeObject:](stageButtonSuppressionReasons, "removeObject:", a4);
  else
    -[NSMutableSet addObject:](stageButtonSuppressionReasons, "addObject:", a4);
}

- (BOOL)_isBlockingStageButtons
{
  return -[NSMutableSet count](self->__stageButtonSuppressionReasons, "count") != 0;
}

- (void)_stageUpdates
{
  unint64_t stage;
  _BOOL4 v4;
  BOOL v5;
  unint64_t v6;
  void *v7;
  _BOOL4 v8;
  unint64_t v9;
  double v10;
  double v11;
  _BOOL8 v12;
  id WeakRetained;
  void *v14;
  _BOOL8 v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL8 v20;
  double v21;
  _BOOL4 v22;
  double v23;
  NSArray *styleClippingContainerViews;
  uint64_t v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  UIButton *continueButton;
  void *v34;
  double v35;
  id v36;
  void *v37;
  char v38;
  double v39;
  BOOL v40;
  _BOOL4 v41;
  char v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  _BOOL4 v48;
  _QWORD v49[5];
  BOOL v50;
  BOOL v51;
  BOOL v52;
  BOOL v53;
  _QWORD v54[4];
  BOOL v55;
  _QWORD v56[4];
  BOOL v57;
  _QWORD v58[4];
  BOOL v59;
  _QWORD v60[4];
  BOOL v61;
  BOOL v62;
  _QWORD v63[5];
  BOOL v64;
  BOOL v65;
  BOOL v66;

  stage = self->__stage;
  v4 = -[CAMSmartStyleSettingsView _didCompleteChooseInstructions](self, "_didCompleteChooseInstructions");
  v5 = !v4;
  v6 = self->__stage - 1;
  if (v6 > 3)
  {
    v7 = 0;
  }
  else
  {
    CAMLocalizedFrameworkString(off_1EA32D118[v6], 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = stage == 1;
  v9 = stage - 3;
  v10 = 0.0;
  if (stage == 3)
    v11 = 1.0;
  else
    v11 = 0.0;
  if (stage == 3)
    v8 = 1;
  v48 = v8;
  v12 = v9 > 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v14 = WeakRetained;
  v15 = v9 < 2;
  if (v9 >= 2)
    v16 = 50.0;
  else
    v16 = 0.0;
  if (v9 >= 2)
    v17 = 0.0;
  else
    v17 = 1.0;
  if (stage)
    v18 = 1.0;
  else
    v18 = 0.0;
  if (stage)
    v19 = 0.0;
  else
    v19 = 1.0;
  v20 = stage != 5;
  if (stage == 5)
    v21 = 1.0;
  else
    v21 = 0.0;
  v22 = stage == 5 || stage == 0;
  objc_msgSend(WeakRetained, "settingsView:requestsTitle:showBackButton:showCancelButton:cancelButtonOnLeft:", self, v7, v15, v20);

  -[UIStackView setAlpha:](self->__finishedStack, "setAlpha:", v21);
  -[NSLayoutConstraint setActive:](self->__finishedStackTopConstraint, "setActive:", stage == 5);
  -[NSLayoutConstraint setActive:](self->__pickerFinishedStackConstraint, "setActive:", stage == 5);
  -[NSLayoutConstraint setActive:](self->__pickerTopConstraint, "setActive:", v20);
  -[NSLayoutConstraint setConstant:](self->__pickerTopConstraint, "setConstant:", v16);
  -[CAMSemanticStylePicker setMinimumScrollablePageIndex:](self->__stylePicker, "setMinimumScrollablePageIndex:", v4);
  -[CAMSemanticStylePicker setExpanded:](self->__stylePicker, "setExpanded:", v12);
  -[CAMSemanticStylePicker setUserInteractionEnabled:](self->__stylePicker, "setUserInteractionEnabled:", !v22);
  if (v18 == 0.0)
    v23 = 0.0;
  else
    v23 = 1.0;
  -[CAMSemanticStylePicker setAlpha:](self->__stylePicker, "setAlpha:", v23);
  styleClippingContainerViews = self->__styleClippingContainerViews;
  v25 = MEMORY[0x1E0C809B0];
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __42__CAMSmartStyleSettingsView__stageUpdates__block_invoke;
  v63[3] = &unk_1EA32CF78;
  v64 = v5;
  v65 = stage == 5;
  v63[4] = self;
  v66 = v18 != 0.0;
  -[NSArray enumerateObjectsUsingBlock:](styleClippingContainerViews, "enumerateObjectsUsingBlock:", v63);
  -[UIImageView setAlpha:](self->__introImageView, "setAlpha:", v19);
  -[UILabel setAlpha:](self->__introTitleLabel, "setAlpha:", v19);
  -[UILabel setAlpha:](self->__introInstructionLabel, "setAlpha:", v19);
  -[UILabel setAlpha:](self->__introDescriptionLabel, "setAlpha:", v19);
  -[CAMSmartStyleSettingsView _updateAlphaForChooseInstructions](self, "_updateAlphaForChooseInstructions");
  -[UILabel setAlpha:](self->__tuneInstructionLabel, "setAlpha:", v11);
  -[NSLayoutConstraint setActive:](self->__tuneInstructionLabelBottomConstraint, "setActive:", stage == 3);
  -[CAMSmartStyleSettingsView _updateShowGridButtonAnimated:](self, "_updateShowGridButtonAnimated:", 0);
  if (v22)
    v26 = 0.0;
  else
    v26 = 1.0;
  -[UIButton setAlpha:](self->__selectAssetsButton, "setAlpha:", v26);
  -[CAMSmartStyleSettingsView _styleDescriptionLabels](self, "_styleDescriptionLabels");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v25;
  v60[1] = 3221225472;
  v60[2] = __42__CAMSmartStyleSettingsView__stageUpdates__block_invoke_2;
  v60[3] = &__block_descriptor_34_e24_v32__0__UILabel_8Q16_B24l;
  v61 = stage == 1;
  v62 = stage == 2;
  objc_msgSend(v27, "enumerateObjectsUsingBlock:", v60);

  -[UIPageControl setAlpha:](self->__previewPageDots, "setAlpha:", v26);
  -[CAMSmartStyleSettingsView _updatePreviewPageDots](self, "_updatePreviewPageDots");
  -[CAMSmartStyleSettingsView _styleBadgeBelowDotsConstraints](self, "_styleBadgeBelowDotsConstraints");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v25;
  v58[1] = 3221225472;
  v58[2] = __42__CAMSmartStyleSettingsView__stageUpdates__block_invoke_3;
  v58[3] = &__block_descriptor_33_e35_v32__0__NSLayoutConstraint_8Q16_B24l;
  v59 = v22;
  objc_msgSend(v28, "enumerateObjectsUsingBlock:", v58);

  -[CAMSmartStyleSettingsView _styleBadgeBelowImageConstraints](self, "_styleBadgeBelowImageConstraints");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v25;
  v56[1] = 3221225472;
  v56[2] = __42__CAMSmartStyleSettingsView__stageUpdates__block_invoke_4;
  v56[3] = &__block_descriptor_33_e35_v32__0__NSLayoutConstraint_8Q16_B24l;
  v57 = v22;
  objc_msgSend(v29, "enumerateObjectsUsingBlock:", v56);

  -[CAMSmartStyleSettingsView _styleNameBadges](self, "_styleNameBadges");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v25;
  v54[1] = 3221225472;
  v54[2] = __42__CAMSmartStyleSettingsView__stageUpdates__block_invoke_5;
  v54[3] = &__block_descriptor_33_e33_v32__0__CEKBadgeTextView_8Q16_B24l;
  v55 = stage == 0;
  objc_msgSend(v30, "enumerateObjectsUsingBlock:", v54);

  -[PEPhotoStyleDPad view](self->__dpadControl, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setAlpha:", v17);

  -[CAMSmartStyleSettingsView _intensitySliders](self, "_intensitySliders");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v25;
  v49[1] = 3221225472;
  v49[2] = __42__CAMSmartStyleSettingsView__stageUpdates__block_invoke_6;
  v49[3] = &unk_1EA32D000;
  v49[4] = self;
  v50 = stage == 2;
  v51 = stage == 3;
  v52 = stage == 4;
  v53 = stage == 1;
  objc_msgSend(v32, "enumerateObjectsUsingBlock:", v49);

  continueButton = self->__continueButton;
  -[CAMSmartStyleSettingsView _continueButtonTitle](self, "_continueButtonTitle");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](continueButton, "setTitle:forState:", v34, 0);

  if (v48)
    v35 = 0.0;
  else
    v35 = 1.0;
  -[UIButton setAlpha:](self->__continueButton, "setAlpha:", v35);
  v36 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v36, "settingsViewRequestsPersistedSystemStyle:", self);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = objc_msgSend(v37, "isNeutral");
  v39 = 0.0;
  if (!stage)
  {
    v40 = -[CAMSmartStyleSettingsView _hasEnoughPhotos](self, "_hasEnoughPhotos", 0.0);
    v39 = 0.0;
    if (!v40)
    {
      v41 = -[CAMSmartStyleSettingsView _usingMostCompatibleFormat](self, "_usingMostCompatibleFormat", 0.0);
      v39 = 1.0;
      if (v41)
        v39 = 0.0;
    }
  }
  -[UIButton setAlpha:](self->__launchCameraButton, "setAlpha:", v39);
  if (stage)
    v42 = 1;
  else
    v42 = v38;
  if ((v42 & 1) == 0)
  {
    if (-[CAMSmartStyleSettingsView _hasEnoughPhotos](self, "_hasEnoughPhotos"))
      v10 = 1.0;
    else
      v10 = 0.0;
  }
  -[UIButton setAlpha:](self->__resetButton, "setAlpha:", v10);
  -[UIButton setAlpha:](self->__startOverButton, "setAlpha:", v21);

  -[UILabel alpha](self->__introDescriptionLabel, "alpha");
  -[NSLayoutConstraint setActive:](self->__continueButtonIntroDescriptionLabelConstraint, "setActive:", v43 > 0.0);
  -[UIButton alpha](self->__resetButton, "alpha");
  -[NSLayoutConstraint setActive:](self->__continueButtonResetButtonConstraint, "setActive:", v44 > 0.0);
  -[UIButton alpha](self->__launchCameraButton, "alpha");
  -[NSLayoutConstraint setActive:](self->__continueButtonLaunchCameraButtonConstraint, "setActive:", v45 > 0.0);
  -[UIButton alpha](self->__startOverButton, "alpha");
  -[NSLayoutConstraint setActive:](self->__continueButtonStartOverButtonConstraint, "setActive:", v46 > 0.0);
  if (-[NSLayoutConstraint isActive](self->__continueButtonResetButtonConstraint, "isActive")
    || -[NSLayoutConstraint isActive](self->__continueButtonLaunchCameraButtonConstraint, "isActive"))
  {
    v47 = 0;
  }
  else
  {
    v47 = -[NSLayoutConstraint isActive](self->__continueButtonStartOverButtonConstraint, "isActive") ^ 1;
  }
  -[NSLayoutConstraint setActive:](self->__continueButtonBottomConstraint, "setActive:", v47);
}

void __42__CAMSmartStyleSettingsView__stageUpdates__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  _BOOL4 v5;
  int v6;
  double v7;
  id v8;

  v8 = a2;
  if (a3)
    v5 = 0;
  else
    v5 = *(_BYTE *)(a1 + 40) == 0;
  v6 = *(unsigned __int8 *)(a1 + 41);
  if (*(_BYTE *)(a1 + 41))
    v6 = objc_msgSend(*(id *)(a1 + 32), "visiblePreviewIndex") != a3;
  v7 = 0.0;
  if (((v5 | v6) & 1) == 0)
  {
    LOBYTE(v7) = *(_BYTE *)(a1 + 42);
    v7 = (double)*(unint64_t *)&v7;
  }
  objc_msgSend(v8, "setAlpha:", v7);

}

uint64_t __42__CAMSmartStyleSettingsView__stageUpdates__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  double v3;

  if (*(_BYTE *)(a1 + 32) || *(_BYTE *)(a1 + 33))
  {
    v3 = 1.0;
    if (!a3)
      v3 = 0.0;
  }
  else
  {
    v3 = 0.0;
  }
  return objc_msgSend(a2, "setAlpha:", v3);
}

uint64_t __42__CAMSmartStyleSettingsView__stageUpdates__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setActive:", *(_BYTE *)(a1 + 32) == 0);
}

uint64_t __42__CAMSmartStyleSettingsView__stageUpdates__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setActive:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __42__CAMSmartStyleSettingsView__stageUpdates__block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  BOOL v3;
  double v4;

  if (*(_BYTE *)(a1 + 32))
    v3 = 1;
  else
    v3 = a3 == 0;
  v4 = 1.0;
  if (v3)
    v4 = 0.0;
  return objc_msgSend(a2, "setAlpha:", v4);
}

void __42__CAMSmartStyleSettingsView__stageUpdates__block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  _BOOL8 v13;
  _BOOL8 v14;
  id v15;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "_intensitySliderBelowDescriptionConstraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_intensitySliderBelowDpadConstraints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_continueButtonBelowIntensitySliderConstraints");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 1.0;
  if (!*(_BYTE *)(a1 + 40) && !*(_BYTE *)(a1 + 41) && !*(_BYTE *)(a1 + 42))
    v12 = 0.0;
  objc_msgSend(v6, "setAlpha:", v12);

  if (*(_BYTE *)(a1 + 42))
    v13 = 1;
  else
    v13 = *(_BYTE *)(a1 + 41) != 0;
  objc_msgSend(v9, "setActive:", v13);
  objc_msgSend(v15, "setActive:", objc_msgSend(v9, "isActive") ^ 1);
  v14 = *(_BYTE *)(a1 + 43) || *(_BYTE *)(a1 + 40) || *(_BYTE *)(a1 + 41) || *(_BYTE *)(a1 + 42) != 0;
  objc_msgSend(v11, "setActive:", v14);

}

- (void)_updateAlphaForChooseInstructions
{
  double v3;
  double v4;

  v3 = 0.0;
  if (self->__stage == 1)
  {
    -[CAMSemanticStylePicker fractionalPageIndex](self->__stylePicker, "fractionalPageIndex");
    CEKProgressClamped();
    CEKInterpolate();
    v3 = v4;
  }
  -[UILabel setAlpha:](self->__chooseInstructionLabel, "setAlpha:", v3);
  -[UIImageView setAlpha:](self->__chooseInstructionArrow, "setAlpha:", v3);
}

- (void)_updateShowGridButtonAnimated:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  _QWORD v10[6];

  v3 = a3;
  v5 = 0.0;
  if (self->__stage - 1 <= 4)
  {
    -[CAMSmartStyleSettingsView _previewViewControllersByStyleIndex](self, "_previewViewControllersByStyleIndex");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CAMSmartStyleSettingsView visiblePreviewIndex](self, "visiblePreviewIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "expandedItemIndex") == 0x7FFFFFFFFFFFFFFFLL)
      v5 = 0.0;
    else
      v5 = 1.0;

  }
  v9 = 0.25;
  if (!v3)
    v9 = 0.0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__CAMSmartStyleSettingsView__updateShowGridButtonAnimated___block_invoke;
  v10[3] = &unk_1EA328B18;
  v10[4] = self;
  *(double *)&v10[5] = v5;
  +[CAMView animateIfNeededWithDuration:animations:](CAMView, "animateIfNeededWithDuration:animations:", v10, v9);
}

uint64_t __59__CAMSmartStyleSettingsView__updateShowGridButtonAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setAlpha:", *(double *)(a1 + 40));
}

- (int64_t)_selectedStylePreset
{
  void *v2;
  int64_t v3;

  -[NSArray objectAtIndexedSubscript:](self->__styleTypes, "objectAtIndexedSubscript:", -[CAMSmartStyleSettingsView visiblePreviewIndex](self, "visiblePreviewIndex"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (CEKSmartStyle)_selectedStyle
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "settingsView:requestsStyleForPresetType:", self, -[CAMSmartStyleSettingsView _selectedStylePreset](self, "_selectedStylePreset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CEKSmartStyle *)v4;
}

- (id)_selectedStyleDescription
{
  return (id)objc_msgSend((id)objc_opt_class(), "_descriptionForStylePreset:", -[CAMSmartStyleSettingsView _selectedStylePreset](self, "_selectedStylePreset"));
}

+ (id)_descriptionForStylePreset:(int64_t)a3
{
  NSObject *v4;
  __CFString *v5;

  switch(a3)
  {
    case 0:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
      v4 = os_log_create("com.apple.camera", "SmartStyleSettings");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        +[CAMSmartStyleSettingsView _descriptionForStylePreset:].cold.1(a3, v4);

      goto LABEL_5;
    case 1:
      v5 = CFSTR("SMART_STYLES_SETTINGS_DESCRIPTION_STANDARD");
      break;
    case 2:
      v5 = CFSTR("SMART_STYLES_SETTINGS_DESCRIPTION_TAN_WARM");
      break;
    case 3:
      v5 = CFSTR("SMART_STYLES_SETTINGS_DESCRIPTION_BLUSH_WARM");
      break;
    case 4:
      v5 = CFSTR("SMART_STYLES_SETTINGS_DESCRIPTION_GOLD_WARM");
      break;
    case 5:
      v5 = CFSTR("SMART_STYLES_SETTINGS_DESCRIPTION_COOL");
      break;
    case 6:
      v5 = CFSTR("SMART_STYLES_SETTINGS_DESCRIPTION_NEUTRAL");
      break;
    default:
LABEL_5:
      v5 = 0;
      break;
  }
  CAMLocalizedFrameworkString(v5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_continueButtonTitle
{
  __CFString *v2;

  switch(self->__stage)
  {
    case 0uLL:
      if (-[CAMSmartStyleSettingsView _hasEnoughPhotos](self, "_hasEnoughPhotos"))
      {
        v2 = CFSTR("SMART_STYLES_SETTINGS_CUSTOMIZE_NOW");
      }
      else if (-[CAMSmartStyleSettingsView _usingMostCompatibleFormat](self, "_usingMostCompatibleFormat"))
      {
        v2 = CFSTR("SMART_STYLES_SETTINGS_NAVIGATE_TO_FORMATS");
      }
      else
      {
        v2 = CFSTR("SMART_STYLES_SETTINGS_NOT_ENOUGH_PHOTOS_DISMISS");
      }
      break;
    case 1uLL:
    case 2uLL:
      v2 = CFSTR("SMART_STYLES_SETTINGS_CONTINUE");
      break;
    case 3uLL:
    case 4uLL:
      v2 = CFSTR("SMART_STYLES_SETTINGS_CONFIRM_TUNE");
      break;
    case 5uLL:
      v2 = CFSTR("SMART_STYLES_SETTINGS_DONE");
      break;
    default:
      v2 = 0;
      break;
  }
  return CAMLocalizedFrameworkString(v2, 0);
}

- (void)_beginAssetSelection:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "settingsViewRequestsUserAssetSelection:", self);

}

- (void)_handleShowGridButton:(id)a3
{
  -[CAMSmartStyleSettingsView _setPreviewViewControllersExpandedItemIndex:animated:](self, "_setPreviewViewControllersExpandedItemIndex:animated:", 0x7FFFFFFFFFFFFFFFLL, 1);
}

- (void)_dpadControlUpdated:(id)a3
{
  -[CAMSmartStyleSettingsView _updatePreviewAdjustmentsUpdateModelValues:](self, "_updatePreviewAdjustmentsUpdateModelValues:", 1);
  -[CAMSmartStyleSettingsView _advanceToTuneStageIfPossible](self, "_advanceToTuneStageIfPossible");
}

- (void)_intensitySliderUpdated:(id)a3
{
  -[CAMSmartStyleSettingsView _updatePreviewAdjustmentsUpdateModelValues:](self, "_updatePreviewAdjustmentsUpdateModelValues:", 1);
  -[CAMSmartStyleSettingsView _advanceToTuneStageIfPossible](self, "_advanceToTuneStageIfPossible");
}

- (void)_advanceToTuneStageIfPossible
{
  if (self->__stage == 3)
  {
    -[CAMSmartStyleSettingsView _moveToNextStageIfAllowed](self, "_moveToNextStageIfAllowed");
    -[CAMSmartStyleSettingsView _updatePreviewAdjustmentsUpdateModelValues:](self, "_updatePreviewAdjustmentsUpdateModelValues:", 1);
  }
}

- (void)_updatePreviewAdjustmentsUpdateModelValues:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  float v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id WeakRetained;
  id v21;

  v3 = a3;
  v5 = -[CAMSmartStyleSettingsView visiblePreviewIndex](self, "visiblePreviewIndex");
  -[NSArray objectAtIndexedSubscript:](self->__styleTypes, "objectAtIndexedSubscript:", v5);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v21, "integerValue");
  -[CAMSmartStyleSettingsView _dpadControl](self, "_dpadControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView _intensitySliders](self, "_intensitySliders");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "value");
  +[CAMSmartStyleUtilities colorAndToneBiasForSlider2DValue:limitRangeForSystemStyles:](CAMSmartStyleUtilities, "colorAndToneBiasForSlider2DValue:limitRangeForSystemStyles:", 1);
  v11 = v10;
  v13 = v12;
  v14 = objc_alloc(MEMORY[0x1E0D0D098]);
  objc_msgSend(v9, "value");
  v16 = (void *)objc_msgSend(v14, "initWithPresetType:castIntensity:toneBias:colorBias:", v6, v15, v13, v11);
  -[CAMSmartStyleSettingsView _previewViewControllersByStyleIndex](self, "_previewViewControllersByStyleIndex");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "updateWithStyle:", v16);
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "settingsView:didUpdateStyle:forPresetType:", self, v16, v6);

  }
}

- (void)_updateDpadBackground
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  -[NSArray objectAtIndexedSubscript:](self->__styleTypes, "objectAtIndexedSubscript:", -[CAMSmartStyleSettingsView visiblePreviewIndex](self, "visiblePreviewIndex"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v9, "integerValue");
  v4 = objc_msgSend(MEMORY[0x1E0D0D098], "castTypeForPresetType:", v3);
  -[CAMSmartStyleSettingsView _dpadControl](self, "_dpadControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    +[CAMCaptureConversions PISemanticStyleCastForCEKCastType:](CAMCaptureConversions, "PISemanticStyleCastForCEKCastType:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSmartStyleSettingsView _dpadControl](self, "_dpadControl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setGradientCast:", v7);

  }
}

- (void)_handleContinueButton:(id)a3
{
  unint64_t v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  CAMSmartStyleSettingsView *v8;
  id WeakRetained;

  v4 = -[CAMSmartStyleSettingsView _stage](self, "_stage", a3);
  if (v4 - 1 >= 5)
  {
    if (!v4)
    {
      if (-[CAMSmartStyleSettingsView _hasEnoughPhotos](self, "_hasEnoughPhotos"))
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "settingsViewRequestsUserAssetSelection:", self);
      }
      else
      {
        v5 = -[CAMSmartStyleSettingsView _usingMostCompatibleFormat](self, "_usingMostCompatibleFormat");
        v6 = objc_loadWeakRetained((id *)&self->_delegate);
        WeakRetained = v6;
        if (v5)
        {
          v7 = &__block_literal_global_34;
          v8 = self;
        }
        else
        {
          v8 = self;
          v7 = 0;
        }
        objc_msgSend(v6, "settingsViewRequestsDismiss:completion:", v8, v7);
      }

    }
  }
  else
  {
    -[CAMSmartStyleSettingsView _moveToNextStageIfAllowed](self, "_moveToNextStageIfAllowed");
  }
}

void __51__CAMSmartStyleSettingsView__handleContinueButton___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.Camera/CameraFormatsSettingsList"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  CAMOpenSensitiveURLWithUnlockRequest(v0, 0);

}

- (id)_debugStringForStage:(unint64_t)a3
{
  if (a3 > 5)
    return 0;
  else
    return off_1EA32D138[a3];
}

- (void)_setStage:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  unint64_t stage;
  id WeakRetained;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->__stage != a3)
  {
    v5 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMSmartStyleSettingsView _debugStringForStage:](self, "_debugStringForStage:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "Settings: changing stage to %{public}@", (uint8_t *)&v9, 0xCu);

    }
    -[CAMSmartStyleSettingsView _setAnimationSequence:](self, "_setAnimationSequence:", 0);
    -[PEPhotoStyleDPad setPulsingValueIndicator:](self->__dpadControl, "setPulsingValueIndicator:", 0);
    -[CAMSmartStyleSettingsView layoutIfNeeded](self, "layoutIfNeeded");
    stage = self->__stage;
    self->__stage = a3;
    switch(a3)
    {
      case 2uLL:
        -[CAMSmartStyleSettingsView _setDidCompleteChooseInstructions:](self, "_setDidCompleteChooseInstructions:", 1);
        break;
      case 3uLL:
        -[CAMSmartStyleSettingsView _playTuneInstructionAnimations](self, "_playTuneInstructionAnimations");
        break;
      case 4uLL:
        -[CAMSmartStyleSettingsView _setDidCompleteTuneInstructions:](self, "_setDidCompleteTuneInstructions:", 1);
        break;
      case 5uLL:
        -[CAMSmartStyleSettingsView _setPreviewViewControllersExpandedItemIndex:animated:](self, "_setPreviewViewControllersExpandedItemIndex:animated:", 0x7FFFFFFFFFFFFFFFLL, 1);
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "settingsViewDidConfirmStyle:", self);

        break;
      default:
        break;
    }
    -[CAMSmartStyleSettingsView _updateForStageAnimated:scrollToTop:](self, "_updateForStageAnimated:scrollToTop:", 1, -[CAMSmartStyleSettingsView _userFacingContentPageNumberForStage:](self, "_userFacingContentPageNumberForStage:", stage) != -[CAMSmartStyleSettingsView _userFacingContentPageNumberForStage:](self, "_userFacingContentPageNumberForStage:", a3));
  }
}

- (int64_t)_userFacingContentPageNumberForStage:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return 0;
  else
    return qword_1DB9A72C8[a3 - 1];
}

- (void)_moveToPreviousStageIfAllowed
{
  unint64_t stage;
  id WeakRetained;

  if (!-[CAMSmartStyleSettingsView _isBlockingStageButtons](self, "_isBlockingStageButtons"))
  {
    stage = self->__stage;
    switch(stage)
    {
      case 0uLL:
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "settingsViewRequestsDismiss:completion:", self, 0);

        goto LABEL_5;
      case 1uLL:
      case 2uLL:
LABEL_5:
        stage = 0;
        break;
      case 3uLL:
      case 4uLL:
        stage = 2;
        break;
      case 5uLL:
        stage = 4;
        break;
      default:
        break;
    }
    -[CAMSmartStyleSettingsView _setStage:](self, "_setStage:", stage);
  }
}

- (void)_moveToNextStageIfAllowed
{
  unint64_t stage;
  id WeakRetained;
  void *v5;

  if (!-[CAMSmartStyleSettingsView _isBlockingStageButtons](self, "_isBlockingStageButtons"))
  {
    stage = self->__stage;
    switch(stage)
    {
      case 0uLL:
        if (-[CAMSmartStyleSettingsView _didCompleteChooseInstructions](self, "_didCompleteChooseInstructions"))
          stage = 2;
        else
          stage = 1;
        break;
      case 1uLL:
        stage = 2;
        break;
      case 2uLL:
        if (-[CAMSmartStyleSettingsView _didCompleteTuneInstructions](self, "_didCompleteTuneInstructions"))
          goto LABEL_7;
        -[CAMSmartStyleSettingsView _selectedStyle](self, "_selectedStyle");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "isCustomized"))
          stage = 4;
        else
          stage = 3;

        break;
      case 3uLL:
LABEL_7:
        stage = 4;
        break;
      case 4uLL:
        goto LABEL_10;
      case 5uLL:
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "settingsViewRequestsDismiss:completion:", self, 0);

LABEL_10:
        stage = 5;
        break;
      default:
        break;
    }
    -[CAMSmartStyleSettingsView _setStage:](self, "_setStage:", stage);
  }
}

- (void)_resetStyleAndDismiss:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "settingsViewRequestsResetToStandardStyleAndDismiss:", self);

}

- (void)_startOver:(id)a3
{
  if (!-[CAMSmartStyleSettingsView _isBlockingStageButtons](self, "_isBlockingStageButtons", a3))
    -[CAMSmartStyleSettingsView _setStage:](self, "_setStage:", 0);
}

- (void)_launchCamera:(id)a3
{
  id WeakRetained;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("camera://configuration?capturemode=photo&capturedevice=back"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  CAMOpenSensitiveURLWithUnlockRequest(v5, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "settingsViewRequestsDismiss:completion:", self, 0);

}

- (void)_setAnimationSequence:(id)a3
{
  CEKAnimationSequence *v5;
  CEKAnimationSequence **p_animationSequence;
  CEKAnimationSequence *v7;

  v5 = (CEKAnimationSequence *)a3;
  p_animationSequence = &self->__animationSequence;
  if (*p_animationSequence != v5)
  {
    v7 = v5;
    -[CEKAnimationSequence stopAllAnimations](*p_animationSequence, "stopAllAnimations");
    objc_storeStrong((id *)p_animationSequence, a3);
    v5 = v7;
  }

}

- (void)_playTuneInstructionAnimations
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D0D088]);
  v4 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__CAMSmartStyleSettingsView__playTuneInstructionAnimations__block_invoke;
  v15[3] = &unk_1EA32D048;
  v15[4] = self;
  v5 = (void *)objc_msgSend(v3, "initWithWithIdentifier:duration:updateHandler:", CFSTR("InitialDelay"), v15, 0.5);
  v16[0] = v5;
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __59__CAMSmartStyleSettingsView__playTuneInstructionAnimations__block_invoke_2;
  v14[3] = &unk_1EA32D048;
  v14[4] = self;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D088]), "initWithWithIdentifier:duration:updateHandler:", CFSTR("TuneTone"), v14, 2.5);
  v16[1] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D088]), "initWithWithIdentifier:duration:updateHandler:", CFSTR("MiddleDelay"), &__block_literal_global_283, 0.5);
  v16[2] = v7;
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __59__CAMSmartStyleSettingsView__playTuneInstructionAnimations__block_invoke_4;
  v13[3] = &unk_1EA32D048;
  v13[4] = self;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D088]), "initWithWithIdentifier:duration:updateHandler:", CFSTR("TuneColor"), v13, 2.5);
  v16[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __59__CAMSmartStyleSettingsView__playTuneInstructionAnimations__block_invoke_5;
  v12[3] = &unk_1EA328A68;
  v12[4] = self;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D008]), "initWithAnimations:completionHandler:", v9, v12);
  -[CAMSmartStyleSettingsView _setAnimationSequence:](self, "_setAnimationSequence:", v10);

  -[CAMSmartStyleSettingsView _animationSequence](self, "_animationSequence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "start");

}

uint64_t __59__CAMSmartStyleSettingsView__playTuneInstructionAnimations__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "setSnapIndicatorToGrid:", 0);
  return result;
}

uint64_t __59__CAMSmartStyleSettingsView__playTuneInstructionAnimations__block_invoke_2(uint64_t a1, double a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "setValue:notifyObserver:", 0, 0.0, (double)sin((a2 + a2) * 3.14159265));
  return objc_msgSend(*(id *)(a1 + 32), "_updatePreviewAdjustmentsUpdateModelValues:", 0);
}

uint64_t __59__CAMSmartStyleSettingsView__playTuneInstructionAnimations__block_invoke_4(uint64_t a1, double a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "setValue:notifyObserver:", 0, (double)sin((a2 + a2) * -3.14159265), 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "_updatePreviewAdjustmentsUpdateModelValues:", 0);
}

uint64_t __59__CAMSmartStyleSettingsView__playTuneInstructionAnimations__block_invoke_5(uint64_t a1, int a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "setSnapIndicatorToGrid:", 1);
  if (a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "setPulsingValueIndicator:", 1);
  return result;
}

- (void)_layoutMaskedViews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  CAMSmartStyleSettingsView *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  -[CAMSmartStyleSettingsView _stylePicker](self, "_stylePicker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CAMSmartStyleSettingsView _styleClippingContainerViews](self, "_styleClippingContainerViews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __47__CAMSmartStyleSettingsView__layoutMaskedViews__block_invoke;
  v14[3] = &unk_1EA32D0B0;
  v17 = v5;
  v18 = v7;
  v19 = v9;
  v20 = v11;
  v15 = v3;
  v16 = self;
  v13 = v3;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v14);

}

void __47__CAMSmartStyleSettingsView__layoutMaskedViews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  CGRect v20;

  v19 = a2;
  objc_msgSend(*(id *)(a1 + 32), "modelStyleRectAtIndex:", a3);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = *(void **)(a1 + 32);
  objc_msgSend(v19, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertRect:toView:", v14, v6, v8, v10, v12);
  objc_msgSend(v19, "setFrame:");

  objc_msgSend(v19, "subviews");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "superview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "convertRect:toView:", v19, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(v16, "setFrame:");

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 704), "count") <= a3)
  {
    v18 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 704), "objectAtIndexedSubscript:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v19, "frame");
  objc_msgSend(v18, "setConstant:", CGRectGetMidX(v20));

}

- (void)_addConstraints
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *pickerTopConstraint;
  void *v18;
  void *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *pickerFinishedStackConstraint;
  void *v22;
  void *v23;
  NSLayoutConstraint *v24;
  NSLayoutConstraint *continueButtonIntroDescriptionLabelConstraint;
  void *v26;
  void *v27;
  NSLayoutConstraint *v28;
  NSLayoutConstraint *continueButtonResetButtonConstraint;
  void *v30;
  void *v31;
  NSLayoutConstraint *v32;
  NSLayoutConstraint *continueButtonLaunchCameraButtonConstraint;
  void *v34;
  void *v35;
  NSLayoutConstraint *v36;
  NSLayoutConstraint *continueButtonStartOverButtonConstraint;
  void *v38;
  void *v39;
  NSLayoutConstraint *v40;
  NSLayoutConstraint *continueButtonBottomConstraint;
  NSLayoutConstraint *v42;
  float v43;
  double v44;
  void *v45;
  void *v46;
  NSLayoutConstraint *v47;
  NSLayoutConstraint *tuneInstructionLabelBottomConstraint;
  void *v49;
  void *v50;
  NSLayoutConstraint *v51;
  NSLayoutConstraint *finishedStackTopConstraint;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  NSLayoutConstraint *v62;
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
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
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
  void *v153;
  void *v154;
  void *v155;
  void *v156;
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
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  id v218;
  void *v219;
  _QWORD v220[5];
  id v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  _QWORD v231[51];
  _BYTE v232[128];
  _BYTE v233[128];
  uint64_t v234;

  v234 = *MEMORY[0x1E0C80C00];
  v227 = 0u;
  v228 = 0u;
  v229 = 0u;
  v230 = 0u;
  -[CAMSmartStyleSettingsView subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v227, v233, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v228;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v228 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v227 + 1) + 8 * i), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v227, v233, 16);
    }
    while (v5);
  }

  v226 = 0u;
  v225 = 0u;
  v224 = 0u;
  v223 = 0u;
  -[CAMSmartStyleSettingsView _scrollView](self, "_scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subviews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v223, v232, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v224;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v224 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v223 + 1) + 8 * j), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v223, v232, 16);
    }
    while (v11);
  }

  -[CAMSemanticStylePicker topAnchor](self->__stylePicker, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMScrollViewWithLayoutDelegate topAnchor](self->__scrollView, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintLessThanOrEqualToAnchor:", v15);
  v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  pickerTopConstraint = self->__pickerTopConstraint;
  self->__pickerTopConstraint = v16;

  -[CAMSemanticStylePicker topAnchor](self->__stylePicker, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView lastBaselineAnchor](self->__finishedStack, "lastBaselineAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintGreaterThanOrEqualToAnchor:constant:", v19, 30.0);
  v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  pickerFinishedStackConstraint = self->__pickerFinishedStackConstraint;
  self->__pickerFinishedStackConstraint = v20;

  -[UIButton topAnchor](self->__continueButton, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->__introDescriptionLabel, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintGreaterThanOrEqualToAnchor:constant:", v23, 30.0);
  v24 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  continueButtonIntroDescriptionLabelConstraint = self->__continueButtonIntroDescriptionLabelConstraint;
  self->__continueButtonIntroDescriptionLabelConstraint = v24;

  -[UIButton bottomAnchor](self->__continueButton, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton topAnchor](self->__resetButton, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintLessThanOrEqualToAnchor:constant:", v27, -10.0);
  v28 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  continueButtonResetButtonConstraint = self->__continueButtonResetButtonConstraint;
  self->__continueButtonResetButtonConstraint = v28;

  -[UIButton bottomAnchor](self->__continueButton, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton topAnchor](self->__launchCameraButton, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintLessThanOrEqualToAnchor:constant:", v31, -10.0);
  v32 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  continueButtonLaunchCameraButtonConstraint = self->__continueButtonLaunchCameraButtonConstraint;
  self->__continueButtonLaunchCameraButtonConstraint = v32;

  -[UIButton bottomAnchor](self->__continueButton, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton topAnchor](self->__startOverButton, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintLessThanOrEqualToAnchor:constant:", v35, -10.0);
  v36 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  continueButtonStartOverButtonConstraint = self->__continueButtonStartOverButtonConstraint;
  self->__continueButtonStartOverButtonConstraint = v36;

  -[UIButton bottomAnchor](self->__continueButton, "bottomAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMScrollViewWithLayoutDelegate bottomAnchor](self->__scrollView, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:constant:", v39, -14.0);
  v40 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  continueButtonBottomConstraint = self->__continueButtonBottomConstraint;
  self->__continueButtonBottomConstraint = v40;

  v42 = self->__continueButtonBottomConstraint;
  -[NSLayoutConstraint priority](v42, "priority");
  *(float *)&v44 = v43 + -1.0;
  -[NSLayoutConstraint setPriority:](v42, "setPriority:", v44);
  -[UILabel lastBaselineAnchor](self->__tuneInstructionLabel, "lastBaselineAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMScrollViewWithLayoutDelegate bottomAnchor](self->__scrollView, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintLessThanOrEqualToAnchor:", v46);
  v47 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  tuneInstructionLabelBottomConstraint = self->__tuneInstructionLabelBottomConstraint;
  self->__tuneInstructionLabelBottomConstraint = v47;

  -[UIStackView topAnchor](self->__finishedStack, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMScrollViewWithLayoutDelegate topAnchor](self->__scrollView, "topAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintGreaterThanOrEqualToAnchor:", v50);
  v51 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  finishedStackTopConstraint = self->__finishedStackTopConstraint;
  self->__finishedStackTopConstraint = v51;

  -[CAMSmartStyleSettingsView _dpadControl](self, "_dpadControl");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView _styleTypes](self, "_styleTypes");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v220[0] = MEMORY[0x1E0C809B0];
  v220[1] = 3221225472;
  v220[2] = __44__CAMSmartStyleSettingsView__addConstraints__block_invoke;
  v220[3] = &unk_1EA32D0D8;
  v220[4] = self;
  v221 = v53;
  v222 = xmmword_1DB9A72F0;
  v218 = v53;
  objc_msgSend(v54, "enumerateObjectsUsingBlock:", v220);

  -[CAMSmartStyleSettingsView _intensitySliders](self, "_intensitySliders");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "firstObject");
  v219 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMScrollViewWithLayoutDelegate contentLayoutGuide](self->__scrollView, "contentLayoutGuide");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "heightAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "heightAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v61) = 1132003328;
  v208 = v60;
  objc_msgSend(v60, "setPriority:", v61);
  v156 = (void *)MEMORY[0x1E0CB3718];
  -[CAMScrollViewWithLayoutDelegate leadingAnchor](self->__scrollView, "leadingAnchor");
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView leadingAnchor](self, "leadingAnchor");
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v217, "constraintEqualToAnchor:", v216);
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  v231[0] = v215;
  -[CAMScrollViewWithLayoutDelegate trailingAnchor](self->__scrollView, "trailingAnchor");
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView trailingAnchor](self, "trailingAnchor");
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v214, "constraintEqualToAnchor:", v213);
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  v231[1] = v212;
  -[CAMScrollViewWithLayoutDelegate topAnchor](self->__scrollView, "topAnchor");
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView topAnchor](self, "topAnchor");
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v211, "constraintEqualToAnchor:", v210);
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  v231[2] = v209;
  -[CAMScrollViewWithLayoutDelegate bottomAnchor](self->__scrollView, "bottomAnchor");
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView bottomAnchor](self, "bottomAnchor");
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v207, "constraintEqualToAnchor:", v206);
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  v231[3] = v205;
  -[CAMScrollViewWithLayoutDelegate contentLayoutGuide](self->__scrollView, "contentLayoutGuide");
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v204, "heightAnchor");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v203, "heightAnchor");
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v202, "constraintGreaterThanOrEqualToAnchor:", v201);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v231[4] = v200;
  v231[5] = v60;
  -[UIStackView centerXAnchor](self->__finishedStack, "centerXAnchor");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView centerXAnchor](self, "centerXAnchor");
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "constraintEqualToAnchor:", v198);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  v231[6] = v197;
  -[UIStackView leadingAnchor](self->__finishedStack, "leadingAnchor");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView leadingAnchor](self, "leadingAnchor");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v196, "constraintEqualToAnchor:constant:", v195, 28.0);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  v231[7] = v194;
  -[UIStackView trailingAnchor](self->__finishedStack, "trailingAnchor");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView trailingAnchor](self, "trailingAnchor");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v193, "constraintEqualToAnchor:constant:", v192, -28.0);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v231[8] = v191;
  -[UIImageView topAnchor](self->__introImageView, "topAnchor");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMScrollViewWithLayoutDelegate topAnchor](self->__scrollView, "topAnchor");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "constraintEqualToAnchor:constant:", v189, 0.0);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v231[9] = v188;
  -[UIImageView centerXAnchor](self->__introImageView, "centerXAnchor");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView centerXAnchor](self, "centerXAnchor");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "constraintEqualToAnchor:", v186);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v231[10] = v185;
  -[UILabel topAnchor](self->__introTitleLabel, "topAnchor");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView bottomAnchor](self->__introImageView, "bottomAnchor");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "constraintEqualToAnchor:constant:", v183, 25.0);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v231[11] = v182;
  -[UILabel centerXAnchor](self->__introTitleLabel, "centerXAnchor");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView centerXAnchor](self, "centerXAnchor");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "constraintEqualToAnchor:", v180);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v231[12] = v179;
  -[UILabel leadingAnchor](self->__introTitleLabel, "leadingAnchor");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView leadingAnchor](self, "leadingAnchor");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "constraintEqualToAnchor:constant:", v177, 28.0);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v231[13] = v176;
  -[UILabel trailingAnchor](self->__introTitleLabel, "trailingAnchor");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView trailingAnchor](self, "trailingAnchor");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "constraintEqualToAnchor:constant:", v174, -28.0);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = self->__pickerTopConstraint;
  v231[14] = v173;
  v231[15] = v62;
  -[CAMSemanticStylePicker topAnchor](self->__stylePicker, "topAnchor");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMScrollViewWithLayoutDelegate topAnchor](self->__scrollView, "topAnchor");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "constraintGreaterThanOrEqualToAnchor:", v171);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v231[16] = v170;
  -[CAMSemanticStylePicker leadingAnchor](self->__stylePicker, "leadingAnchor");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView leadingAnchor](self, "leadingAnchor");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "constraintEqualToAnchor:", v166);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v231[17] = v165;
  -[CAMSemanticStylePicker trailingAnchor](self->__stylePicker, "trailingAnchor");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView trailingAnchor](self, "trailingAnchor");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "constraintEqualToAnchor:", v163);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v231[18] = v162;
  -[CAMSemanticStylePicker heightAnchor](self->__stylePicker, "heightAnchor");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSemanticStylePicker widthAnchor](self->__stylePicker, "widthAnchor");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView _desiredCarouselRatio](self, "_desiredCarouselRatio");
  objc_msgSend(v161, "constraintEqualToAnchor:multiplier:", v160);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v231[19] = v159;
  -[UIPageControl topAnchor](self->__previewPageDots, "topAnchor");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSemanticStylePicker bottomAnchor](self->__stylePicker, "bottomAnchor");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "constraintEqualToAnchor:constant:", v157, 12.0);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v231[20] = v155;
  -[UIPageControl centerXAnchor](self->__previewPageDots, "centerXAnchor");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView centerXAnchor](self, "centerXAnchor");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "constraintEqualToAnchor:", v153);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v231[21] = v152;
  -[UIButton bottomAnchor](self->__selectAssetsButton, "bottomAnchor");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSemanticStylePicker bottomAnchor](self->__stylePicker, "bottomAnchor");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "constraintEqualToAnchor:constant:", v150, -12.0);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v231[22] = v149;
  -[UIButton leadingAnchor](self->__selectAssetsButton, "leadingAnchor");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSemanticStylePicker leadingAnchor](self->__stylePicker, "leadingAnchor");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "constraintEqualToAnchor:constant:", v147, 24.0);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v231[23] = v145;
  -[UIButton topAnchor](self->__showGridButton, "topAnchor");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSemanticStylePicker topAnchor](self->__stylePicker, "topAnchor");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "constraintEqualToAnchor:constant:", v142, 8.0);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v231[24] = v141;
  -[UIButton leadingAnchor](self->__showGridButton, "leadingAnchor");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSemanticStylePicker leadingAnchor](self->__stylePicker, "leadingAnchor");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "constraintEqualToAnchor:constant:", v139, 20.0);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v231[25] = v138;
  -[UILabel topAnchor](self->__introInstructionLabel, "topAnchor");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel lastBaselineAnchor](self->__introTitleLabel, "lastBaselineAnchor");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "constraintEqualToAnchor:constant:", v136, 60.0);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v231[26] = v135;
  -[UILabel leadingAnchor](self->__introInstructionLabel, "leadingAnchor");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView leadingAnchor](self, "leadingAnchor");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "constraintEqualToAnchor:constant:", v133, 28.0);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v231[27] = v132;
  -[UILabel trailingAnchor](self->__introInstructionLabel, "trailingAnchor");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView trailingAnchor](self, "trailingAnchor");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "constraintEqualToAnchor:constant:", v130, -28.0);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v231[28] = v129;
  -[UILabel topAnchor](self->__introDescriptionLabel, "topAnchor");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel lastBaselineAnchor](self->__introInstructionLabel, "lastBaselineAnchor");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "constraintEqualToAnchor:constant:", v127, 60.0);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v231[29] = v126;
  -[UILabel leadingAnchor](self->__introDescriptionLabel, "leadingAnchor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView leadingAnchor](self, "leadingAnchor");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "constraintEqualToAnchor:constant:", v124, 28.0);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v231[30] = v123;
  -[UILabel trailingAnchor](self->__introDescriptionLabel, "trailingAnchor");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView trailingAnchor](self, "trailingAnchor");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "constraintEqualToAnchor:constant:", v122, -28.0);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v231[31] = v121;
  -[UILabel topAnchor](self->__chooseInstructionLabel, "topAnchor");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPageControl bottomAnchor](self->__previewPageDots, "bottomAnchor");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "constraintEqualToAnchor:constant:", v119, 40.0);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v231[32] = v118;
  -[UILabel leadingAnchor](self->__chooseInstructionLabel, "leadingAnchor");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView leadingAnchor](self, "leadingAnchor");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "constraintEqualToAnchor:constant:", v116, 28.0);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v231[33] = v115;
  -[UILabel trailingAnchor](self->__chooseInstructionLabel, "trailingAnchor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView trailingAnchor](self, "trailingAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "constraintEqualToAnchor:constant:", v113, -28.0);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v231[34] = v112;
  -[UIImageView centerYAnchor](self->__chooseInstructionArrow, "centerYAnchor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPageControl bottomAnchor](self->__previewPageDots, "bottomAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "constraintEqualToAnchor:constant:", v110, 20.0);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v231[35] = v109;
  -[UIImageView centerXAnchor](self->__chooseInstructionArrow, "centerXAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPageControl centerXAnchor](self->__previewPageDots, "centerXAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "constraintEqualToAnchor:", v107);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v231[36] = v106;
  -[UILabel topAnchor](self->__tuneInstructionLabel, "topAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v219, "bottomAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "constraintEqualToAnchor:constant:", v104, 40.0);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v231[37] = v103;
  -[UILabel leadingAnchor](self->__tuneInstructionLabel, "leadingAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView leadingAnchor](self, "leadingAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "constraintEqualToAnchor:constant:", v101, 28.0);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v231[38] = v100;
  -[UILabel trailingAnchor](self->__tuneInstructionLabel, "trailingAnchor");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView trailingAnchor](self, "trailingAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "constraintEqualToAnchor:constant:", v99, -28.0);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v231[39] = v98;
  -[UIButton leadingAnchor](self->__continueButton, "leadingAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView leadingAnchor](self, "leadingAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "constraintEqualToAnchor:constant:", v96, 28.0);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v231[40] = v95;
  -[UIButton trailingAnchor](self->__continueButton, "trailingAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView trailingAnchor](self, "trailingAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "constraintEqualToAnchor:constant:", v93, -28.0);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v231[41] = v92;
  -[UIButton leadingAnchor](self->__resetButton, "leadingAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView leadingAnchor](self, "leadingAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "constraintEqualToAnchor:constant:", v90, 28.0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v231[42] = v89;
  -[UIButton trailingAnchor](self->__resetButton, "trailingAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView trailingAnchor](self, "trailingAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "constraintEqualToAnchor:constant:", v87, -28.0);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v231[43] = v86;
  -[UIButton titleLabel](self->__resetButton, "titleLabel");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "lastBaselineAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMScrollViewWithLayoutDelegate bottomAnchor](self->__scrollView, "bottomAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:constant:", v84, -26.0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v231[44] = v83;
  -[UIButton leadingAnchor](self->__startOverButton, "leadingAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView leadingAnchor](self, "leadingAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "constraintEqualToAnchor:constant:", v81, 28.0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v231[45] = v80;
  -[UIButton trailingAnchor](self->__startOverButton, "trailingAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView trailingAnchor](self, "trailingAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:constant:", v78, -28.0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v231[46] = v77;
  -[UIButton titleLabel](self->__startOverButton, "titleLabel");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "lastBaselineAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMScrollViewWithLayoutDelegate bottomAnchor](self->__scrollView, "bottomAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:constant:", v75, -26.0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v231[47] = v74;
  -[UIButton leadingAnchor](self->__launchCameraButton, "leadingAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView leadingAnchor](self, "leadingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToAnchor:constant:", v63, 28.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v231[48] = v64;
  -[UIButton trailingAnchor](self->__launchCameraButton, "trailingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsView trailingAnchor](self, "trailingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:constant:", v66, -28.0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v231[49] = v67;
  -[UIButton titleLabel](self->__launchCameraButton, "titleLabel");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "lastBaselineAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMScrollViewWithLayoutDelegate bottomAnchor](self->__scrollView, "bottomAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:constant:", v70, -26.0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v231[50] = v71;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v231, 51);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "activateConstraints:", v72);

}

void __44__CAMSmartStyleSettingsView__addConstraints__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
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
  float v62;
  double v63;
  float v64;
  double v65;
  void *v66;
  void *v67;
  id v68;

  objc_msgSend(*(id *)(a1 + 32), "_styleNameBadges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v68 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_intensitySliders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_styleDescriptionLabels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v68, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 7.0);
  v12 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v68, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, *(double *)(a1 + 48));
  v15 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v68, "centerXAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "leftAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setActive:", 1);
  v67 = (void *)v12;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 688), "addObject:", v12);
  v66 = (void *)v15;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 696), "addObject:", v15);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 704), "addObject:", v18);
  if (!a3)
  {
    objc_msgSend(*(id *)(a1 + 40), "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, *(double *)(a1 + 48));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setActive:", 1);

    objc_msgSend(*(id *)(a1 + 40), "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "widthAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "widthAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAMSmartStyleSettingsView dpadWidthRatio](CAMSmartStyleSettingsView, "dpadWidthRatio");
    objc_msgSend(v24, "constraintEqualToAnchor:multiplier:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setActive:", 1);

    objc_msgSend(*(id *)(a1 + 40), "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "heightAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "widthAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setActive:", 1);

    objc_msgSend(*(id *)(a1 + 40), "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "centerXAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "centerXAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setActive:", 1);

  }
  objc_msgSend(v7, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bottomAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, *(double *)(a1 + 48));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "bottomAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:constant:", v41, *(double *)(a1 + 48));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 584), "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintGreaterThanOrEqualToAnchor:constant:", v44, *(double *)(a1 + 48));
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 712), "addObject:", v38);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 720), "addObject:", v42);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 728), "addObject:", v45);
  objc_msgSend(v7, "widthAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToConstant:", 108.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setActive:", 1);

  objc_msgSend(v7, "heightAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToConstant:", 20.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setActive:", 1);

  objc_msgSend(v7, "centerXAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "centerXAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setActive:", 1);

  objc_msgSend(v9, "topAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "bottomAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, *(double *)(a1 + 48));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setActive:", 1);

  objc_msgSend(v9, "centerXAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "centerXAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setActive:", 1);

  objc_msgSend(v9, "widthAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "widthAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:constant:", v60, *(double *)(a1 + 56) * -2.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setActive:", 1);

  objc_msgSend(v67, "priority");
  *(float *)&v63 = v62 + -1.0;
  objc_msgSend(v66, "setPriority:", v63);
  objc_msgSend(v42, "priority");
  *(float *)&v65 = v64 + -1.0;
  objc_msgSend(v38, "setPriority:", v65);

}

- (double)_desiredCarouselRatio
{
  double v2;
  double v3;
  double v4;
  double result;

  -[CAMSmartStyleSettingsView bounds](self, "bounds");
  v4 = fabs(v3 / v2 + -1.77777778);
  +[CAMSmartStylePreviewViewController desiredCarouselRatio](CAMSmartStylePreviewViewController, "desiredCarouselRatio");
  if (v4 < 0.01)
    return 0.875;
  return result;
}

- (id)_titleCheckmarkView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:", *MEMORY[0x1E0DC4B48]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("checkmark.circle"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v3);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v5);

  return v4;
}

- (id)_titleLabelWithText:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0DC1358];
  v4 = *MEMORY[0x1E0DC4B48];
  v5 = a3;
  objc_msgSend(v3, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v4, 32770, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v6, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v8, "setText:", v5);

  objc_msgSend(v8, "setFont:", v7);
  objc_msgSend(v8, "setNumberOfLines:", 0);
  objc_msgSend(v8, "setTextAlignment:", 1);

  return v8;
}

- (id)_assetButtonConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0DC3520], "filledButtonConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCornerStyle:", 4);
  objc_msgSend(v2, "setButtonSize:", 3);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBaseBackgroundColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBaseForegroundColor:", v5);

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 14.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("photo.on.rectangle"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v7);

  objc_msgSend(v2, "setContentInsets:", 12.0, 12.0, 12.0, 12.0);
  return v2;
}

- (id)_showGridButtonConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3520], "borderlessButtonConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setButtonSize:", 3);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBaseForegroundColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 16.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("square.grid.2x2.fill"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v5);

  objc_msgSend(v2, "setContentInsets:", 12.0, 12.0, 12.0, 12.0);
  return v2;
}

+ (id)continueButtonConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4AD0], 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3520], "filledButtonConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentInsets:", 16.0, 16.0, 16.0, 16.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBaseBackgroundColor:", v5);

  objc_msgSend(v4, "setCornerStyle:", 3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__CAMSmartStyleSettingsView_continueButtonConfiguration__block_invoke;
  v8[3] = &unk_1EA32CE08;
  v9 = v3;
  v6 = v3;
  objc_msgSend(v4, "setTitleTextAttributesTransformer:", v8);

  return v4;
}

id __56__CAMSmartStyleSettingsView_continueButtonConfiguration__block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0DC1138]);
  return v3;
}

- (id)_secondaryButtonConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4AD0], 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentInsets:", 16.0, 16.0, 16.0, 16.0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__CAMSmartStyleSettingsView__secondaryButtonConfiguration__block_invoke;
  v7[3] = &unk_1EA32CE08;
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "setTitleTextAttributesTransformer:", v7);

  return v4;
}

id __58__CAMSmartStyleSettingsView__secondaryButtonConfiguration__block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0DC1138]);
  return v3;
}

- (id)_fontWithTextStyle:(id)a3
{
  return -[CAMSmartStyleSettingsView _fontWithTextStyle:traits:](self, "_fontWithTextStyle:traits:", a3, 0);
}

- (id)_fontWithTextStyle:(id)a3 traits:(unsigned int)a4
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a3, *(_QWORD *)&a4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_handleStylePickerTap:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CAMSmartStyleSettingsView _previewViewControllersByStyleIndex](self, "_previewViewControllersByStyleIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CAMSmartStyleSettingsView visiblePreviewIndex](self, "visiblePreviewIndex"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v5) = objc_opt_isKindOfClass();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v6, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleTap:", v9);
    -[CAMSmartStyleSettingsView _setPreviewViewControllersExpandedItemIndex:animated:](self, "_setPreviewViewControllersExpandedItemIndex:animated:", objc_msgSend(v8, "expandedItemIndex"), 1);
    -[CAMSmartStyleSettingsView _updateShowGridButtonAnimated:](self, "_updateShowGridButtonAnimated:", 1);

  }
}

- (void)_setPreviewViewControllersExpandedItemIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  _QWORD v8[5];
  BOOL v9;

  v4 = a4;
  -[CAMSmartStyleSettingsView _previewViewControllersByStyleIndex](self, "_previewViewControllersByStyleIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__CAMSmartStyleSettingsView__setPreviewViewControllersExpandedItemIndex_animated___block_invoke;
  v8[3] = &__block_descriptor_41_e61_v32__0__NSNumber_8__CAMSmartStylePreviewViewController_16_B24l;
  v8[4] = a3;
  v9 = v4;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v8);

  -[CAMSmartStyleSettingsView _updateShowGridButtonAnimated:](self, "_updateShowGridButtonAnimated:", v4);
}

uint64_t __82__CAMSmartStyleSettingsView__setPreviewViewControllersExpandedItemIndex_animated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setExpandedItemIndex:animated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)semanticStylePickerDidChangeSelectedStyle:(id)a3
{
  -[CAMSmartStyleSettingsView _setVisiblePreviewIndex:updatePageControl:updateStylePicker:animated:notifyDelegate:](self, "_setVisiblePreviewIndex:updatePageControl:updateStylePicker:animated:notifyDelegate:", objc_msgSend(a3, "selectedStyleIndex"), 1, 0, 1, 1);
}

- (void)semanticStylePickerDidScroll:(id)a3
{
  double v4;
  id v5;

  v5 = a3;
  -[CAMSmartStyleSettingsView _layoutMaskedViews](self, "_layoutMaskedViews");
  -[CAMSmartStyleSettingsView _updateAlphaForChooseInstructions](self, "_updateAlphaForChooseInstructions");
  if (self->__stage == 1)
  {
    objc_msgSend(v5, "fractionalPageIndex");
    if (v4 >= 1.0)
      -[CAMSmartStyleSettingsView _moveToNextStageIfAllowed](self, "_moveToNextStageIfAllowed");
  }

}

- (void)_prepareHaptics
{
  id v2;

  -[CAMSmartStyleSettingsView _feedbackController](self, "_feedbackController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prepareDiscreteFeedback:", 0);

}

- (void)_performHaptics
{
  id v2;

  -[CAMSmartStyleSettingsView _feedbackController](self, "_feedbackController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performDiscreteFeedback:", 0);

}

- (void)_handlePageControlValueChanged:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  -[CAMSmartStyleSettingsView _performHaptics](self, "_performHaptics");
  -[CAMSmartStyleSettingsView _prepareHaptics](self, "_prepareHaptics");
  v5 = objc_msgSend(v4, "interactionState");

  -[CAMSmartStyleSettingsView _setVisiblePreviewIndex:updatePageControl:updateStylePicker:animated:notifyDelegate:](self, "_setVisiblePreviewIndex:updatePageControl:updateStylePicker:animated:notifyDelegate:", -[CAMSmartStyleSettingsView _previewIndexFromPageDots](self, "_previewIndexFromPageDots"), 0, 1, v5 == 1, 1);
}

- (BOOL)_didCompleteChooseInstructions
{
  return -[CAMSmartStyleSettingsView _readBooleanPreferenceForKey:](self, "_readBooleanPreferenceForKey:", CFSTR("CAMUserPreferenceSmartStyleSettingsDidCompleteChooseInstructions"));
}

- (void)_setDidCompleteChooseInstructions:(BOOL)a3
{
  -[CAMSmartStyleSettingsView _setBooleanPreference:forKey:](self, "_setBooleanPreference:forKey:", a3, CFSTR("CAMUserPreferenceSmartStyleSettingsDidCompleteChooseInstructions"));
}

- (BOOL)_didCompleteTuneInstructions
{
  return -[CAMSmartStyleSettingsView _readBooleanPreferenceForKey:](self, "_readBooleanPreferenceForKey:", CFSTR("CAMUserPreferenceSmartStyleSettingsDidCompleteTuneInstructions"));
}

- (void)_setDidCompleteTuneInstructions:(BOOL)a3
{
  -[CAMSmartStyleSettingsView _setBooleanPreference:forKey:](self, "_setBooleanPreference:forKey:", a3, CFSTR("CAMUserPreferenceSmartStyleSettingsDidCompleteTuneInstructions"));
}

- (BOOL)_readBooleanPreferenceForKey:(id)a3
{
  return CFPreferencesGetAppBooleanValue((CFStringRef)a3, CFSTR("com.apple.camera"), 0) != 0;
}

- (void)_setBooleanPreference:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v5;
  __CFString *v6;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = (__CFString *)a4;
  CFPreferencesSetAppValue(v6, (CFPropertyListRef)objc_msgSend(v5, "numberWithBool:", v4), CFSTR("com.apple.camera"));

  CFPreferencesAppSynchronize(CFSTR("com.apple.camera"));
}

- (CAMSmartStyleSettingsViewDelegate)delegate
{
  return (CAMSmartStyleSettingsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CAMScrollViewWithLayoutDelegate)_scrollView
{
  return self->__scrollView;
}

- (UIImageView)_introImageView
{
  return self->__introImageView;
}

- (UIStackView)_finishedStack
{
  return self->__finishedStack;
}

- (UILabel)_introTitleLabel
{
  return self->__introTitleLabel;
}

- (UIButton)_selectAssetsButton
{
  return self->__selectAssetsButton;
}

- (UIButton)_showGridButton
{
  return self->__showGridButton;
}

- (NSArray)_styleClippingContainerViews
{
  return self->__styleClippingContainerViews;
}

- (CAMSemanticStylePicker)_stylePicker
{
  return self->__stylePicker;
}

- (NSMutableDictionary)_previewViewControllersByStyleIndex
{
  return self->__previewViewControllersByStyleIndex;
}

- (UIPageControl)_previewPageDots
{
  return self->__previewPageDots;
}

- (NSMutableArray)_styleNameBadges
{
  return self->__styleNameBadges;
}

- (PEPhotoStyleDPad)_dpadControl
{
  return self->__dpadControl;
}

- (NSMutableArray)_intensitySliders
{
  return self->__intensitySliders;
}

- (NSMutableArray)_styleDescriptionLabels
{
  return self->__styleDescriptionLabels;
}

- (UILabel)_introInstructionLabel
{
  return self->__introInstructionLabel;
}

- (UILabel)_introDescriptionLabel
{
  return self->__introDescriptionLabel;
}

- (UILabel)_chooseInstructionLabel
{
  return self->__chooseInstructionLabel;
}

- (UIImageView)_chooseInstructionArrow
{
  return self->__chooseInstructionArrow;
}

- (UILabel)_tuneInstructionLabel
{
  return self->__tuneInstructionLabel;
}

- (UIButton)_continueButton
{
  return self->__continueButton;
}

- (UIButton)_startOverButton
{
  return self->__startOverButton;
}

- (UIButton)_resetButton
{
  return self->__resetButton;
}

- (UIButton)_launchCameraButton
{
  return self->__launchCameraButton;
}

- (unint64_t)_stage
{
  return self->__stage;
}

- (BOOL)_hasEnoughPhotos
{
  return self->__hasEnoughPhotos;
}

- (BOOL)_usingMostCompatibleFormat
{
  return self->__usingMostCompatibleFormat;
}

- (NSArray)_styleTypes
{
  return self->__styleTypes;
}

- (int64_t)visiblePreviewIndex
{
  return self->_visiblePreviewIndex;
}

- (NSArray)_styleNames
{
  return self->__styleNames;
}

- (UIImage)_thumbnailPreviewImage
{
  return self->__thumbnailPreviewImage;
}

- (NSMutableSet)_stageButtonSuppressionReasons
{
  return self->__stageButtonSuppressionReasons;
}

- (CEKAnimationSequence)_animationSequence
{
  return self->__animationSequence;
}

- (NSLayoutConstraint)_pickerTopConstraint
{
  return self->__pickerTopConstraint;
}

- (NSLayoutConstraint)_pickerFinishedStackConstraint
{
  return self->__pickerFinishedStackConstraint;
}

- (NSMutableArray)_styleBadgeBelowDotsConstraints
{
  return self->__styleBadgeBelowDotsConstraints;
}

- (NSMutableArray)_styleBadgeBelowImageConstraints
{
  return self->__styleBadgeBelowImageConstraints;
}

- (NSMutableArray)_styleBadgeCenterXConstraints
{
  return self->__styleBadgeCenterXConstraints;
}

- (NSMutableArray)_intensitySliderBelowDescriptionConstraints
{
  return self->__intensitySliderBelowDescriptionConstraints;
}

- (NSMutableArray)_intensitySliderBelowDpadConstraints
{
  return self->__intensitySliderBelowDpadConstraints;
}

- (NSMutableArray)_continueButtonBelowIntensitySliderConstraints
{
  return self->__continueButtonBelowIntensitySliderConstraints;
}

- (NSLayoutConstraint)_continueButtonIntroDescriptionLabelConstraint
{
  return self->__continueButtonIntroDescriptionLabelConstraint;
}

- (NSLayoutConstraint)_continueButtonResetButtonConstraint
{
  return self->__continueButtonResetButtonConstraint;
}

- (NSLayoutConstraint)_continueButtonLaunchCameraButtonConstraint
{
  return self->__continueButtonLaunchCameraButtonConstraint;
}

- (NSLayoutConstraint)_continueButtonStartOverButtonConstraint
{
  return self->__continueButtonStartOverButtonConstraint;
}

- (NSLayoutConstraint)_continueButtonBottomConstraint
{
  return self->__continueButtonBottomConstraint;
}

- (NSLayoutConstraint)_tuneInstructionLabelBottomConstraint
{
  return self->__tuneInstructionLabelBottomConstraint;
}

- (NSLayoutConstraint)_finishedStackTopConstraint
{
  return self->__finishedStackTopConstraint;
}

- (CAMFeedbackController)_feedbackController
{
  return self->__feedbackController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__feedbackController, 0);
  objc_storeStrong((id *)&self->__finishedStackTopConstraint, 0);
  objc_storeStrong((id *)&self->__tuneInstructionLabelBottomConstraint, 0);
  objc_storeStrong((id *)&self->__continueButtonBottomConstraint, 0);
  objc_storeStrong((id *)&self->__continueButtonStartOverButtonConstraint, 0);
  objc_storeStrong((id *)&self->__continueButtonLaunchCameraButtonConstraint, 0);
  objc_storeStrong((id *)&self->__continueButtonResetButtonConstraint, 0);
  objc_storeStrong((id *)&self->__continueButtonIntroDescriptionLabelConstraint, 0);
  objc_storeStrong((id *)&self->__continueButtonBelowIntensitySliderConstraints, 0);
  objc_storeStrong((id *)&self->__intensitySliderBelowDpadConstraints, 0);
  objc_storeStrong((id *)&self->__intensitySliderBelowDescriptionConstraints, 0);
  objc_storeStrong((id *)&self->__styleBadgeCenterXConstraints, 0);
  objc_storeStrong((id *)&self->__styleBadgeBelowImageConstraints, 0);
  objc_storeStrong((id *)&self->__styleBadgeBelowDotsConstraints, 0);
  objc_storeStrong((id *)&self->__pickerFinishedStackConstraint, 0);
  objc_storeStrong((id *)&self->__pickerTopConstraint, 0);
  objc_storeStrong((id *)&self->__animationSequence, 0);
  objc_storeStrong((id *)&self->__stageButtonSuppressionReasons, 0);
  objc_storeStrong((id *)&self->__thumbnailPreviewImage, 0);
  objc_storeStrong((id *)&self->__styleNames, 0);
  objc_storeStrong((id *)&self->__styleTypes, 0);
  objc_storeStrong((id *)&self->__launchCameraButton, 0);
  objc_storeStrong((id *)&self->__resetButton, 0);
  objc_storeStrong((id *)&self->__startOverButton, 0);
  objc_storeStrong((id *)&self->__continueButton, 0);
  objc_storeStrong((id *)&self->__tuneInstructionLabel, 0);
  objc_storeStrong((id *)&self->__chooseInstructionArrow, 0);
  objc_storeStrong((id *)&self->__chooseInstructionLabel, 0);
  objc_storeStrong((id *)&self->__introDescriptionLabel, 0);
  objc_storeStrong((id *)&self->__introInstructionLabel, 0);
  objc_storeStrong((id *)&self->__styleDescriptionLabels, 0);
  objc_storeStrong((id *)&self->__intensitySliders, 0);
  objc_storeStrong((id *)&self->__dpadControl, 0);
  objc_storeStrong((id *)&self->__styleNameBadges, 0);
  objc_storeStrong((id *)&self->__previewPageDots, 0);
  objc_storeStrong((id *)&self->__previewViewControllersByStyleIndex, 0);
  objc_storeStrong((id *)&self->__stylePicker, 0);
  objc_storeStrong((id *)&self->__styleClippingContainerViews, 0);
  objc_storeStrong((id *)&self->__showGridButton, 0);
  objc_storeStrong((id *)&self->__selectAssetsButton, 0);
  objc_storeStrong((id *)&self->__introTitleLabel, 0);
  objc_storeStrong((id *)&self->__finishedStack, 0);
  objc_storeStrong((id *)&self->__introImageView, 0);
  objc_storeStrong((id *)&self->__scrollView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (void)_descriptionForStylePreset:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  CEKDebugStringForSmartStylePresetType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "Unexpected style preset %{public}@", (uint8_t *)&v4, 0xCu);

}

@end
