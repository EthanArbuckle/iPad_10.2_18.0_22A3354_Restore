@implementation SFUnifiedTabBarItemView

- (SFUnifiedTabBarItemView)initWithFrame:(CGRect)a3
{
  SFUnifiedTabBarItemView *v3;
  SFUnifiedTabBarItemView *v4;
  void *v5;
  uint64_t v6;
  SFUnifiedTabBarItemViewCloseButton *closeButton;
  SFUnifiedTabBarItemViewCloseButton *v8;
  void *v9;
  void *v10;
  SFUnifiedTabBarItemViewCloseButton *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  SFUnifiedTabBarItemViewCloseButton *closeButtonForHover;
  SFUnifiedTabBarItemTitleContainerView *v17;
  SFUnifiedTabBarItemTitleContainerView *titleContainer;
  SFMoreMenuButton *v19;
  SFMoreMenuButton *moreMenuButton;
  SFMoreMenuButton *v21;
  id v22;
  SFBadgeContainerView *v23;
  SFBadgeContainerView *moreMenuButtonContainer;
  SFNavigationBarToggleButton *v25;
  void *v26;
  uint64_t v27;
  SFNavigationBarToggleButton *formatMenuButton;
  void *v29;
  void *v30;
  SFNavigationBarToggleButton *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  UIButton *voiceSearchButton;
  void *v37;
  void *v38;
  uint64_t v39;
  UIButton *reloadButton;
  UIButton *v41;
  id v42;
  double v43;
  UIButton *v44;
  void *v45;
  double v46;
  void *v47;
  uint64_t v48;
  UIButton *stopButton;
  UIButton *v50;
  id v51;
  uint64_t v52;
  UIButton *mediaStateMuteButton;
  _SFFluidProgressView *v54;
  _SFFluidProgressView *progressView;
  void *v56;
  id v57;
  UIButton *v58;
  UIButton *firstExtensionButton;
  UIButton *v60;
  id v61;
  SFBadgeContainerView *v62;
  SFBadgeContainerView *firstExtensionButtonContainer;
  UIButton *v64;
  UIButton *secondExtensionButton;
  UIButton *v66;
  id v67;
  SFBadgeContainerView *v68;
  SFBadgeContainerView *secondExtensionButtonContainer;
  UIButton *v70;
  UIButton *multipleExtensionsButton;
  UIButton *v72;
  void *v73;
  UIButton *v74;
  id v75;
  SFBadgeContainerView *v76;
  SFBadgeContainerView *multipleExtensionsButtonContainer;
  SFUnreadIndicator *v78;
  SFUnreadIndicator *unreadIndicator;
  SFAvatarStackView *v80;
  SFAvatarStackView *participantsView;
  void *v82;
  uint64_t v83;
  UIButton *pinnedIndicator;
  void *v85;
  SFUnifiedTabBarItemAccessoryButtonArrangement *v86;
  SFUnifiedTabBarItemAccessoryButtonArrangement *accessoryButtonArrangement;
  id *v88;
  uint64_t v89;
  id v90;
  void *v91;
  id *v92;
  void *v94;
  _QWORD v95[4];
  id *v96;
  objc_super v97;

  v97.receiver = self;
  v97.super_class = (Class)SFUnifiedTabBarItemView;
  v3 = -[SFUnifiedBarItemView initWithFrame:](&v97, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFUnifiedTabBarItemView setPlatterStyle:](v3, "setPlatterStyle:", 1);
    -[SFUnifiedTabBarItemView setFocusGroupIdentifier:](v4, "setFocusGroupIdentifier:", 0);
    -[SFUnifiedBarItemView contentView](v4, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedTabBarItemView _closeButtonConfiguration](v4, "_closeButtonConfiguration");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFUnifiedTabBarItemViewCloseButton buttonWithConfiguration:primaryAction:](SFUnifiedTabBarItemViewCloseButton, "buttonWithConfiguration:primaryAction:", v94, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    closeButton = v4->_closeButton;
    v4->_closeButton = (SFUnifiedTabBarItemViewCloseButton *)v6;

    -[SFUnifiedTabBarItemViewCloseButton addTarget:action:forControlEvents:](v4->_closeButton, "addTarget:action:forControlEvents:", v4, sel__closeButtonTapped, 0x2000);
    -[UIView sf_applyContentSizeCategoryLimitsForToolbarButton](v4->_closeButton, "sf_applyContentSizeCategoryLimitsForToolbarButton");
    v8 = v4->_closeButton;
    objc_msgSend(v94, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView sf_configureLargeContentViewerWithImage:title:](v8, "sf_configureLargeContentViewerWithImage:title:", v9, v10);

    v11 = v4->_closeButton;
    v12 = objc_alloc_init(MEMORY[0x1E0DC3998]);
    -[SFUnifiedTabBarItemViewCloseButton addInteraction:](v11, "addInteraction:", v12);

    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("xmark.noshape"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedTabBarItemView _accessoryButtonConfigurationWithImage:scale:](v4, "_accessoryButtonConfigurationWithImage:scale:", v13, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFUnifiedTabBarItemViewCloseButton buttonWithConfiguration:primaryAction:](SFUnifiedTabBarItemViewCloseButton, "buttonWithConfiguration:primaryAction:", v14, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    closeButtonForHover = v4->_closeButtonForHover;
    v4->_closeButtonForHover = (SFUnifiedTabBarItemViewCloseButton *)v15;

    -[SFUnifiedTabBarItemViewCloseButton addTarget:action:forControlEvents:](v4->_closeButtonForHover, "addTarget:action:forControlEvents:", v4, sel__closeButtonTapped, 0x2000);
    -[UIView sf_applyContentSizeCategoryLimitsForToolbarButton](v4->_closeButtonForHover, "sf_applyContentSizeCategoryLimitsForToolbarButton");
    objc_msgSend(v5, "addSubview:", v4->_closeButtonForHover);
    objc_msgSend(v5, "addSubview:", v4->_closeButton);
    v17 = -[SFUnifiedTabBarItemTitleContainerView initWithAlignment:]([SFUnifiedTabBarItemTitleContainerView alloc], "initWithAlignment:", 0);
    titleContainer = v4->_titleContainer;
    v4->_titleContainer = v17;

    -[SFUnifiedTabBarItemTitleContainerView setShowsIcon:](v4->_titleContainer, "setShowsIcon:", 1);
    -[SFUnifiedTabBarItemTitleContainerView setTitleTextStyle:](v4->_titleContainer, "setTitleTextStyle:", *MEMORY[0x1E0DC4B10]);
    objc_msgSend(v5, "addSubview:", v4->_titleContainer);
    v19 = objc_alloc_init(SFMoreMenuButton);
    moreMenuButton = v4->_moreMenuButton;
    v4->_moreMenuButton = v19;

    -[SFMoreMenuButton setIconFilled:](v4->_moreMenuButton, "setIconFilled:", 1);
    -[SFMoreMenuButton setContentInsets:](v4->_moreMenuButton, "setContentInsets:", 6.0, 6.0, 6.0, 6.0);
    -[UIView sf_applyContentSizeCategoryLimitsForToolbarButton](v4->_moreMenuButton, "sf_applyContentSizeCategoryLimitsForToolbarButton");
    -[UIView sf_configureLargeContentViewerForBarItem:](v4->_moreMenuButton, "sf_configureLargeContentViewerForBarItem:", 5);
    v21 = v4->_moreMenuButton;
    v22 = objc_alloc_init(MEMORY[0x1E0DC3998]);
    -[SFMoreMenuButton addInteraction:](v21, "addInteraction:", v22);

    -[SFMoreMenuButton addTarget:action:forControlEvents:](v4->_moreMenuButton, "addTarget:action:forControlEvents:", v4, sel__menuButtonTapped, 0x2000);
    -[SFMoreMenuButton addTarget:action:forControlEvents:](v4->_moreMenuButton, "addTarget:action:forControlEvents:", v4, sel__menuButtonReceivedTouchDown, 1);
    -[SFMoreMenuButton addTarget:action:forControlEvents:](v4->_moreMenuButton, "addTarget:action:forControlEvents:", v4, sel__menuButtonClicked, 0x1000000);
    objc_storeStrong((id *)&v4->_menuButton, v4->_moreMenuButton);
    v23 = objc_alloc_init(SFBadgeContainerView);
    moreMenuButtonContainer = v4->_moreMenuButtonContainer;
    v4->_moreMenuButtonContainer = v23;

    -[SFBadgeContainerView setPositionsBadgeRelativeToLayoutMargins:](v4->_moreMenuButtonContainer, "setPositionsBadgeRelativeToLayoutMargins:", 1);
    -[SFBadgeContainerView setContentView:](v4->_moreMenuButtonContainer, "setContentView:", v4->_moreMenuButton);
    objc_msgSend(v5, "addSubview:", v4->_moreMenuButtonContainer);
    v25 = [SFNavigationBarToggleButton alloc];
    +[SFNavigationBarToggleButton pageMenuImageWithIntelligence:](SFNavigationBarToggleButton, "pageMenuImageWithIntelligence:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[SFNavigationBarToggleButton initWithImage:forInputMode:](v25, "initWithImage:forInputMode:", v26, 0);
    formatMenuButton = v4->_formatMenuButton;
    v4->_formatMenuButton = (SFNavigationBarToggleButton *)v27;

    -[SFNavigationBarToggleButton setMinimumSideMargin:](v4->_formatMenuButton, "setMinimumSideMargin:", 6.0);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:", *MEMORY[0x1E0DC4A88]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFNavigationBarToggleButton setPreferredSymbolConfiguration:](v4->_formatMenuButton, "setPreferredSymbolConfiguration:", v29);

    -[SFClickableButton setClickEnabled:](v4->_formatMenuButton, "setClickEnabled:", 1);
    -[SFNavigationBarToggleButton pointerInteraction](v4->_formatMenuButton, "pointerInteraction");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setEnabled:", 0);

    -[SFNavigationBarToggleButton setPointerPreviewContainer:](v4->_formatMenuButton, "setPointerPreviewContainer:", v4);
    -[UIView sf_applyContentSizeCategoryLimitsForToolbarButton](v4->_formatMenuButton, "sf_applyContentSizeCategoryLimitsForToolbarButton");
    -[UIView sf_configureLargeContentViewerForBarItem:](v4->_formatMenuButton, "sf_configureLargeContentViewerForBarItem:", 13);
    v31 = v4->_formatMenuButton;
    v32 = objc_alloc_init(MEMORY[0x1E0DC3998]);
    -[SFNavigationBarToggleButton addInteraction:](v31, "addInteraction:", v32);

    -[SFNavigationBarToggleButton addTarget:action:forControlEvents:](v4->_formatMenuButton, "addTarget:action:forControlEvents:", v4, sel__menuButtonTapped, 0x2000);
    -[SFNavigationBarToggleButton addTarget:action:forControlEvents:](v4->_formatMenuButton, "addTarget:action:forControlEvents:", v4, sel__menuButtonReceivedTouchDown, 1);
    -[SFNavigationBarToggleButton addTarget:action:forControlEvents:](v4->_formatMenuButton, "addTarget:action:forControlEvents:", v4, sel__menuButtonClicked, 0x1000000);
    -[SFUnifiedBarItemView contentView](v4, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addSubview:", v4->_formatMenuButton);

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("mic.fill"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedTabBarItemView _makeAccessoryButtonWithImage:action:](v4, "_makeAccessoryButtonWithImage:action:", v34, sel__voiceSearchButtonTapped);
    v35 = objc_claimAutoreleasedReturnValue();
    voiceSearchButton = v4->_voiceSearchButton;
    v4->_voiceSearchButton = (UIButton *)v35;

    -[UIButton _setDisableDictationTouchCancellation:](v4->_voiceSearchButton, "_setDisableDictationTouchCancellation:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObserver:selector:name:object:", v4, sel__voiceSearchAvailabilityDidChange_, CFSTR("SFVoiceSearchAvailabilityDidChangeNotification"), 0);

    v4->_needsVoiceSearchAvailabilityUpdate = 1;
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.clockwise"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedTabBarItemView _makeAccessoryButtonWithImage:action:](v4, "_makeAccessoryButtonWithImage:action:", v38, sel__reloadButtonTapped);
    v39 = objc_claimAutoreleasedReturnValue();
    reloadButton = v4->_reloadButton;
    v4->_reloadButton = (UIButton *)v39;

    -[UIButton sf_configureLargeContentViewerForBarItem:](v4->_reloadButton, "sf_configureLargeContentViewerForBarItem:", 15);
    v41 = v4->_reloadButton;
    v42 = objc_alloc_init(MEMORY[0x1E0DC3998]);
    -[UIButton addInteraction:](v41, "addInteraction:", v42);

    v43 = _SFOnePixel();
    v44 = v4->_reloadButton;
    -[UIButton configuration](v44, "configuration");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "contentInsets");
    objc_msgSend(v45, "setContentInsets:", v43 + v46);
    -[UIButton setConfiguration:](v44, "setConfiguration:", v45);

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedTabBarItemView _makeAccessoryButtonWithImage:action:](v4, "_makeAccessoryButtonWithImage:action:", v47, sel__stopButtonTapped);
    v48 = objc_claimAutoreleasedReturnValue();
    stopButton = v4->_stopButton;
    v4->_stopButton = (UIButton *)v48;

    v50 = v4->_stopButton;
    v51 = objc_alloc_init(MEMORY[0x1E0DC3998]);
    -[UIButton addInteraction:](v50, "addInteraction:", v51);

    -[UIButton sf_configureLargeContentViewerForBarItem:](v4->_stopButton, "sf_configureLargeContentViewerForBarItem:", 14);
    -[SFUnifiedTabBarItemView _makeMediaStateMuteButton](v4, "_makeMediaStateMuteButton");
    v52 = objc_claimAutoreleasedReturnValue();
    mediaStateMuteButton = v4->_mediaStateMuteButton;
    v4->_mediaStateMuteButton = (UIButton *)v52;

    v54 = objc_alloc_init(_SFFluidProgressView);
    progressView = v4->_progressView;
    v4->_progressView = v54;

    -[_SFFluidProgressView setDelegate:](v4->_progressView, "setDelegate:", v4);
    -[SFUnifiedTabBarItemView _updateProgressViewColor](v4, "_updateProgressViewColor");
    -[SFUnifiedTabBarItemView _updateShowsProgressView](v4, "_updateShowsProgressView");
    -[SFUnifiedBarItemView contentView](v4, "contentView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "addSubview:", v4->_progressView);

    v57 = objc_alloc_init(MEMORY[0x1E0CD1210]);
    objc_msgSend(v57, "setDelegate:", v4);
    objc_msgSend(v57, "setElementSource:", v4);
    -[SFUnifiedTabBarItemView addInteraction:](v4, "addInteraction:", v57);
    v58 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
    firstExtensionButton = v4->_firstExtensionButton;
    v4->_firstExtensionButton = v58;

    -[UIButton addTarget:action:forControlEvents:](v4->_firstExtensionButton, "addTarget:action:forControlEvents:", v4, sel__extensionButtonTapped_, 0x2000);
    UIEdgeInsetsMakeWithEdges();
    -[UIButton setLayoutMargins:](v4->_firstExtensionButton, "setLayoutMargins:");
    -[UIButton sf_configureLargeContentViewerWithImage:title:](v4->_firstExtensionButton, "sf_configureLargeContentViewerWithImage:title:", 0, 0);
    v60 = v4->_firstExtensionButton;
    v61 = objc_alloc_init(MEMORY[0x1E0DC3998]);
    -[UIButton addInteraction:](v60, "addInteraction:", v61);

    v62 = objc_alloc_init(SFBadgeContainerView);
    firstExtensionButtonContainer = v4->_firstExtensionButtonContainer;
    v4->_firstExtensionButtonContainer = v62;

    -[SFBadgeContainerView setPositionsBadgeRelativeToLayoutMargins:](v4->_firstExtensionButtonContainer, "setPositionsBadgeRelativeToLayoutMargins:", 1);
    -[SFBadgeContainerView setContentView:](v4->_firstExtensionButtonContainer, "setContentView:", v4->_firstExtensionButton);
    objc_msgSend(v5, "addSubview:", v4->_firstExtensionButtonContainer);
    v64 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
    secondExtensionButton = v4->_secondExtensionButton;
    v4->_secondExtensionButton = v64;

    -[UIButton addTarget:action:forControlEvents:](v4->_secondExtensionButton, "addTarget:action:forControlEvents:", v4, sel__extensionButtonTapped_, 0x2000);
    UIEdgeInsetsMakeWithEdges();
    -[UIButton setLayoutMargins:](v4->_secondExtensionButton, "setLayoutMargins:");
    -[UIButton sf_configureLargeContentViewerWithImage:title:](v4->_secondExtensionButton, "sf_configureLargeContentViewerWithImage:title:", 0, 0);
    v66 = v4->_secondExtensionButton;
    v67 = objc_alloc_init(MEMORY[0x1E0DC3998]);
    -[UIButton addInteraction:](v66, "addInteraction:", v67);

    v68 = objc_alloc_init(SFBadgeContainerView);
    secondExtensionButtonContainer = v4->_secondExtensionButtonContainer;
    v4->_secondExtensionButtonContainer = v68;

    -[SFBadgeContainerView setPositionsBadgeRelativeToLayoutMargins:](v4->_secondExtensionButtonContainer, "setPositionsBadgeRelativeToLayoutMargins:", 1);
    -[SFBadgeContainerView setContentView:](v4->_secondExtensionButtonContainer, "setContentView:", v4->_secondExtensionButton);
    objc_msgSend(v5, "addSubview:", v4->_secondExtensionButtonContainer);
    v70 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
    multipleExtensionsButton = v4->_multipleExtensionsButton;
    v4->_multipleExtensionsButton = v70;

    -[UIButton sf_applyContentSizeCategoryLimitsForToolbarButton](v4->_multipleExtensionsButton, "sf_applyContentSizeCategoryLimitsForToolbarButton");
    -[UIButton addTarget:action:forControlEvents:](v4->_multipleExtensionsButton, "addTarget:action:forControlEvents:", v4, sel__extensionButtonTapped_, 0x2000);
    v72 = v4->_multipleExtensionsButton;
    _WBSLocalizedString();
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton sf_configureLargeContentViewerWithImage:title:](v72, "sf_configureLargeContentViewerWithImage:title:", 0, v73);

    v74 = v4->_multipleExtensionsButton;
    v75 = objc_alloc_init(MEMORY[0x1E0DC3998]);
    -[UIButton addInteraction:](v74, "addInteraction:", v75);

    v76 = objc_alloc_init(SFBadgeContainerView);
    multipleExtensionsButtonContainer = v4->_multipleExtensionsButtonContainer;
    v4->_multipleExtensionsButtonContainer = v76;

    -[SFBadgeContainerView setPositionsBadgeRelativeToLayoutMargins:](v4->_multipleExtensionsButtonContainer, "setPositionsBadgeRelativeToLayoutMargins:", 1);
    -[SFBadgeContainerView setContentView:](v4->_multipleExtensionsButtonContainer, "setContentView:", v4->_multipleExtensionsButton);
    objc_msgSend(v5, "addSubview:", v4->_multipleExtensionsButtonContainer);
    v78 = objc_alloc_init(SFUnreadIndicator);
    unreadIndicator = v4->_unreadIndicator;
    v4->_unreadIndicator = v78;

    objc_msgSend(v5, "addSubview:", v4->_unreadIndicator);
    v80 = objc_alloc_init(SFAvatarStackView);
    participantsView = v4->_participantsView;
    v4->_participantsView = v80;

    objc_msgSend(v5, "addSubview:", v4->_participantsView);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("pin.fill"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedTabBarItemView _makeAccessoryButtonWithImage:scale:action:](v4, "_makeAccessoryButtonWithImage:scale:action:", v82, 1, 0);
    v83 = objc_claimAutoreleasedReturnValue();
    pinnedIndicator = v4->_pinnedIndicator;
    v4->_pinnedIndicator = (UIButton *)v83;

    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v4->_pinnedIndicator, "setTintColor:", v85);

    -[UIButton setUserInteractionEnabled:](v4->_pinnedIndicator, "setUserInteractionEnabled:", 0);
    v86 = objc_alloc_init(SFUnifiedTabBarItemAccessoryButtonArrangement);
    accessoryButtonArrangement = v4->_accessoryButtonArrangement;
    v4->_accessoryButtonArrangement = v86;

    v95[0] = MEMORY[0x1E0C809B0];
    v95[1] = 3221225472;
    v95[2] = __41__SFUnifiedTabBarItemView_initWithFrame___block_invoke;
    v95[3] = &unk_1E21E3608;
    v88 = v4;
    v96 = v88;
    SFUnifiedTabBarItemAccessoryButtonTypeEnumerateCases((uint64_t)v95);
    v89 = objc_msgSend(objc_alloc(MEMORY[0x1E0D8A870]), "initWithPresenter:", v88);
    v90 = v88[142];
    v88[142] = (id)v89;

    objc_msgSend(v88[142], "setLabelDisplayDuration:", 1.9);
    v91 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3858]), "initWithTarget:action:", v88, sel__hover_);
    objc_msgSend(v88, "addGestureRecognizer:", v91);
    objc_msgSend(v88, "applyTheme");
    v92 = v88;

  }
  return v4;
}

void __41__SFUnifiedTabBarItemView_initWithFrame___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_viewForAccessoryButtonOfType:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);
  SFAccessibilityIdentifierForUnifiedTabBarItemAccessoryButtonType(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", v3);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SFUnifiedTabBarItemView;
  -[SFUnifiedTabBarItemView dealloc](&v4, sel_dealloc);
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)SFUnifiedTabBarItemView;
  -[SFUnifiedTabBarItemView tintColorDidChange](&v8, sel_tintColorDidChange);
  if (-[SFUnifiedTabBarItemView tintAdjustmentMode](self, "tintAdjustmentMode") == 2)
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C00]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", &unk_1E2245500, CFSTR("inputAmount"));
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = 0.3;
  }
  else
  {
    v4 = 0;
    v5 = 1.0;
  }
  -[UIButton layer](self->_firstExtensionButton, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFilters:", v4);

  -[UIButton layer](self->_secondExtensionButton, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFilters:", v4);

  -[UIButton setAlpha:](self->_firstExtensionButton, "setAlpha:", v5);
  -[UIButton setAlpha:](self->_secondExtensionButton, "setAlpha:", v5);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  _QWORD v10[5];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SFUnifiedTabBarItemView;
  -[SFUnifiedBarItemView layoutSubviews](&v11, sel_layoutSubviews);
  -[SFUnifiedBarItemView barMetrics](self, "barMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemCornerRadius");
  -[SFURLFieldOverlayView _setContinuousCornerRadius:](self->_overlayView, "_setContinuousCornerRadius:");

  -[SFUnifiedBarItemView squishedInset](self, "squishedInset");
  v5 = v4;
  -[SFUnifiedTabBarItemView _squishedInsetToHideTrailingButtons](self, "_squishedInsetToHideTrailingButtons");
  -[SFUnifiedTabBarItemView _setTrailingButtonsHidden:](self, "_setTrailingButtonsHidden:", v5 > v6);
  -[SFUnifiedTabBarItemView _updateAccessoryButtons](self, "_updateAccessoryButtons");
  v7 = 0.0;
  if (self->_showsCloseButton && !-[SFUnifiedTabBarItemView showsSearchField](self, "showsSearchField"))
  {
    -[SFUnifiedTabBarItemView _closeButtonAlphaForSquishedInset](self, "_closeButtonAlphaForSquishedInset");
    v7 = v8;
  }
  -[SFUnifiedTabBarItemViewCloseButton setAlpha:](self->_closeButton, "setAlpha:", v7);
  -[SFUnifiedTabBarItemViewCloseButton setUserInteractionEnabled:](self->_closeButton, "setUserInteractionEnabled:", v7 == 1.0);
  -[SFUnifiedTabBarItemViewCloseButton setAlpha:](self->_closeButtonForHover, "setAlpha:", (double)-[SFUnifiedTabBarItemView _showsCloseButtonOnHover](self, "_showsCloseButtonOnHover"));
  -[SFUnifiedTabBarItemView _updateCloseButtonForHoverPosition](self, "_updateCloseButtonForHoverPosition");
  -[_SFFluidProgressView setCornerRadius:](self->_progressView, "setCornerRadius:", 0.0);
  -[_SFFluidProgressView superview](self->_progressView, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  -[_SFFluidProgressView setFrame:](self->_progressView, "setFrame:");

  if (self->_needsAnimatedAccessoryButtonUpdate)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __41__SFUnifiedTabBarItemView_layoutSubviews__block_invoke;
    v10[3] = &unk_1E21E2050;
    v10[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v10, 0);
  }
  else
  {
    -[SFUnifiedTabBarItemView _layOutTitleContainer](self, "_layOutTitleContainer");
  }
  -[SFUnifiedTabBarItemView updateAccessibilityIdentifier](self, "updateAccessibilityIdentifier");
  self->_needsAnimatedAccessoryButtonUpdate = 0;
}

uint64_t __41__SFUnifiedTabBarItemView_layoutSubviews__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 904), "setAnimatingResize:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_layOutTitleContainer");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 904), "setAnimatingResize:", 0);
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFUnifiedTabBarItemView;
  -[SFUnifiedTabBarItemView didMoveToWindow](&v3, sel_didMoveToWindow);
  if (self->_needsVoiceSearchAvailabilityUpdate)
  {
    -[SFUnifiedTabBarItemView _voiceSearchAvailabilityDidChange:](self, "_voiceSearchAvailabilityDidChange:", 0);
    self->_needsVoiceSearchAvailabilityUpdate = 0;
  }
}

- (void)updateTitleWhenCollapsedWithItemTitles:(id)a3
{
  NSString *title;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  title = self->_title;
  v5 = (void *)MEMORY[0x1E0DC1350];
  v6 = a3;
  -[SFUnifiedTabBarItemView titleTextStyle](self, "titleTextStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredFontForTextStyle:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  -[NSString truncatedTitleWithFont:desiredWidth:tabBarItemTitles:](title, "truncatedTitleWithFont:desiredWidth:tabBarItemTitles:", v8, v6, self->_titleContainerWidthAccountingForInset);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[SFUnifiedTabBarItemTitleContainerView titleWhenCollapsed](self->_titleContainer, "titleWhenCollapsed");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = WBSIsEqual();

  if ((v8 & 1) == 0)
    -[SFUnifiedTabBarItemTitleContainerView setTitleWhenCollapsed:](self->_titleContainer, "setTitleWhenCollapsed:", v10);

}

- (void)_layOutTitleContainer
{
  double leadingButtonsWidth;
  double trailingButtonsWidth;
  int64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _BOOL4 v15;
  _BOOL4 active;
  int64_t v17;
  void *v19;
  double v20;
  double v21;
  char v22;
  _BOOL4 v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double height;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  int64_t v35;
  double v36;
  SFUnifiedTabBarItemTitleContainerView **p_titleContainer;
  double v39;
  double v40;
  double Width;
  double v42;
  double v43;
  double v44;
  SFUnifiedTabBarItemTitleContainerView *titleContainer;
  double v46;
  double v47;
  id v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  leadingButtonsWidth = self->_leadingButtonsWidth;
  trailingButtonsWidth = self->_trailingButtonsWidth;
  v5 = -[SFUnifiedTabBarItemView _iconVisibility](self, "_iconVisibility");
  -[SFUnifiedBarItemView squishedInset](self, "squishedInset");
  v7 = v6;
  -[SFUnifiedTabBarItemView _squishedInsetToHideCloseButton](self, "_squishedInsetToHideCloseButton");
  v9 = leadingButtonsWidth - v8;
  v10 = fmin(v7, v8);
  v11 = leadingButtonsWidth - v10;
  v12 = trailingButtonsWidth + v10;
  if (v5)
  {
    v12 = trailingButtonsWidth;
    v11 = leadingButtonsWidth;
  }
  if (v5 == 2)
    v12 = trailingButtonsWidth;
  else
    v9 = v11;
  if (self->_showsCloseButton)
    v13 = v12;
  else
    v13 = trailingButtonsWidth;
  if (self->_showsCloseButton)
    v14 = v9;
  else
    v14 = leadingButtonsWidth;
  v15 = -[SFUnifiedTabBarItemView _hasRoomForIconAndCloseButton](self, "_hasRoomForIconAndCloseButton", v12, v9);
  if (v15)
  {
    active = self->_active;
    v17 = -[SFUnifiedTabBarItemView contentAlignment](self, "contentAlignment");
    if (!active && v17 == 1)
    {
      -[SFUnifiedBarItemView barMetrics](self, "barMetrics");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "tabCloseButtonWidth");
      v21 = v20;

      v14 = fmax(v14, v21);
      v13 = fmax(v13, v21 - 9.5);
      v22 = 1;
      goto LABEL_21;
    }
  }
  else
  {
    -[SFUnifiedTabBarItemView contentAlignment](self, "contentAlignment");
  }
  v22 = 0;
LABEL_21:
  v23 = -[SFUnifiedTabBarItemView showsSearchField](self, "showsSearchField");
  -[SFUnifiedTabBarItemView layoutMargins](self, "layoutMargins");
  v25 = v24;
  if (v23)
    v14 = v24;
  -[SFUnifiedTabBarItemView frame](self, "frame");
  v27 = v26;
  -[SFUnifiedTabBarItemView frame](self, "frame");
  height = v49.size.height;
  v29 = 0.0;
  v49.origin.x = 0.0;
  v49.origin.y = 0.0;
  v49.size.width = v27;
  v46 = v7;
  v30 = v7 + CGRectGetWidth(v49) - v14 - v13;
  self->_titleContainerWidthAccountingForInset = v30;
  v50.origin.x = 0.0;
  v50.origin.y = 0.0;
  v50.size.width = v27;
  v50.size.height = height;
  v31 = CGRectGetHeight(v50);
  -[SFUnifiedBarItemView barMetrics](self, "barMetrics");
  v48 = (id)objc_claimAutoreleasedReturnValue();
  if ((v22 & 1) == 0 && self->_leadingButtonsWidth == 0.0 && !v23)
  {
    objc_msgSend(v48, "leadingTabIconInset");
    v33 = v32;
    -[SFUnifiedTabBarItemTitleContainerView leadingIconOffset](self->_titleContainer, "leadingIconOffset");
    v29 = v33 + v34;
  }
  v35 = -[SFUnifiedTabBarItemView contentAlignment](self, "contentAlignment", *(_QWORD *)&v46);
  if (v35 == 1)
  {
    p_titleContainer = &self->_titleContainer;
    -[SFUnifiedTabBarItemTitleContainerView setFrame:](self->_titleContainer, "setFrame:", 0.0, 0.0, v27, height);
    v36 = 0.0;
    v51.origin.y = 0.0;
    v51.origin.x = v14;
    v51.size.width = v30;
    v51.size.height = v31;
    v40 = v29 + CGRectGetMinX(v51);
    v52.origin.x = 0.0;
    v52.origin.y = 0.0;
    v52.size.width = v27;
    v52.size.height = height;
    Width = CGRectGetWidth(v52);
    v53.origin.y = 0.0;
    v53.origin.x = v14;
    v53.size.width = v30;
    v53.size.height = v31;
    -[SFUnifiedTabBarItemTitleContainerView setDirectionalLayoutMargins:](self->_titleContainer, "setDirectionalLayoutMargins:", 0.0, v40, 0.0, Width - CGRectGetMaxX(v53) + 3.0);
  }
  else
  {
    if (v35)
      goto LABEL_36;
    v36 = 0.0;
    p_titleContainer = &self->_titleContainer;
    -[SFUnifiedTabBarItemTitleContainerView setFrame:](self->_titleContainer, "setFrame:", _SFFlipRectInCoordinateSpace(!-[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout"), v14, 0.0, v30, v31, 0.0, 0.0, v27, height));
    -[SFUnifiedTabBarItemTitleContainerView setDirectionalLayoutMargins:](self->_titleContainer, "setDirectionalLayoutMargins:", 0.0, v29, 0.0, 3.0);
    if (self->_showsCloseButton && v23)
    {
      objc_msgSend(v48, "tabCloseButtonWidth");
      v36 = v39 - v25;
    }
  }
  -[SFUnifiedTabBarItemTitleContainerView setContentOffset:](*p_titleContainer, "setContentOffset:", v36);
LABEL_36:
  if (v5)
  {
    v42 = v47;
    if (v5 == 1)
    {
      -[SFUnifiedTabBarItemTitleContainerView setShowsIcon:](self->_titleContainer, "setShowsIcon:", 0);
      titleContainer = self->_titleContainer;
      v44 = 1.0;
      goto LABEL_42;
    }
    if (v5 == 2)
    {
      -[SFUnifiedTabBarItemTitleContainerView setShowsIcon:](self->_titleContainer, "setShowsIcon:", 1);
      -[SFUnifiedTabBarItemView _closeButtonAlphaForSquishedInset](self, "_closeButtonAlphaForSquishedInset");
      v44 = 1.0 - v43;
      titleContainer = self->_titleContainer;
LABEL_42:
      -[SFUnifiedTabBarItemTitleContainerView setIconAlpha:](titleContainer, "setIconAlpha:", v44);
    }
  }
  else
  {
    -[SFUnifiedTabBarItemTitleContainerView setShowsIcon:](self->_titleContainer, "setShowsIcon:", 1);
    -[SFUnifiedTabBarItemTitleContainerView setIconAlpha:](self->_titleContainer, "setIconAlpha:", 1.0);
    v42 = v47;
  }
  -[SFUnifiedTabBarItemTitleContainerView setLeadingAlignsIcon:](self->_titleContainer, "setLeadingAlignsIcon:", !v15);
  -[SFUnifiedTabBarItemView _setTitleContainerMasked:](self, "_setTitleContainerMasked:", v42 > self->_trailingButtonsWidth);
  -[SFUnifiedTabBarItemView _layOutTitleContainerMask](self, "_layOutTitleContainerMask");
  -[SFUnifiedTabBarItemTitleContainerView layoutIfNeeded](self->_titleContainer, "layoutIfNeeded");

}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SFUnifiedTabBarItemView frame](self, "frame");
  if (width != v9 || height != v8)
    -[SFUnifiedTabBarItemView setNeedsLayout](self, "setNeedsLayout");
  v11.receiver = self;
  v11.super_class = (Class)SFUnifiedTabBarItemView;
  -[SFUnifiedTabBarItemView setFrame:](&v11, sel_setFrame_, x, y, width, height);
}

- (void)updateCornerRadius
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFUnifiedTabBarItemView;
  -[SFUnifiedBarItemView updateCornerRadius](&v4, sel_updateCornerRadius);
  -[SFUnifiedBarItemView barMetrics](self, "barMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemCornerRadius");
  -[SFNavigationBarToggleButton setResizableBackgroundCornerRadius:](self->_formatMenuButton, "setResizableBackgroundCornerRadius:");

}

- (void)prepareForReuse
{
  NSDate *lastReloadDate;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFUnifiedTabBarItemView;
  -[SFUnifiedBarItemView prepareForReuse](&v4, sel_prepareForReuse);
  -[SFUnifiedTabBarItemView setSearchField:](self, "setSearchField:", 0);
  -[SFUnifiedTabBarItemView setShowsSearchField:](self, "setShowsSearchField:", 0);
  -[WBSContentAvailabilityDisplayController resetDisplay](self->_availabilityDisplayController, "resetDisplay");
  -[SFUnifiedTabBarItemView _stopAccessoryButtonUpdateTimer](self, "_stopAccessoryButtonUpdateTimer");
  -[SFUnifiedTabBarItemView _stopReloadButtonExpirationTimer](self, "_stopReloadButtonExpirationTimer");
  lastReloadDate = self->_lastReloadDate;
  self->_lastReloadDate = 0;

}

- (void)setTitle:(id)a3
{
  id WeakRetained;
  id v6;

  v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_title, a3);
    -[SFUnifiedTabBarItemTitleContainerView setTitleWhenCollapsed:](self->_titleContainer, "setTitleWhenCollapsed:", v6);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "tabBarItemViewTitleChanged:", self);

  }
}

- (UIImage)icon
{
  return -[SFUnifiedTabBarItemTitleContainerView icon](self->_titleContainer, "icon");
}

- (void)setIcon:(id)a3
{
  -[SFUnifiedTabBarItemTitleContainerView setIcon:](self->_titleContainer, "setIcon:", a3);
}

- (int64_t)_iconVisibility
{
  int64_t v4;

  if (-[SFUnifiedTabBarItemView accessoryButtonLayout](self, "accessoryButtonLayout"))
    return 1;
  v4 = -[SFUnifiedTabBarItemView contentAlignment](self, "contentAlignment");
  if (v4 == 1)
    return self->_showsCloseButton
        && !-[SFUnifiedTabBarItemView _hasRoomForIconAndCloseButton](self, "_hasRoomForIconAndCloseButton");
  if (v4)
    return 1;
  if (self->_active
    && !-[SFUnifiedTabBarItemTitleContainerView showsSearchIcon](self->_titleContainer, "showsSearchIcon"))
  {
    return 2 * self->_showsCloseButton;
  }
  return 0;
}

- (NSString)titleWhenActive
{
  return -[SFUnifiedTabBarItemTitleContainerView title](self->_titleContainer, "title");
}

- (void)setTitleWhenActive:(id)a3
{
  SFUnifiedTabBarItemTitleContainerView *titleContainer;
  id v5;
  id WeakRetained;

  titleContainer = self->_titleContainer;
  v5 = a3;
  -[SFUnifiedTabBarItemTitleContainerView setTitle:](titleContainer, "setTitle:", v5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_squishedTitleContainer);
  objc_msgSend(WeakRetained, "setTitle:", v5);

  -[SFUnifiedTabBarItemView applyTheme](self, "applyTheme");
  -[SFUnifiedTabBarItemView setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)textWhenExpanded
{
  return -[SFUnifiedTabBarItemTitleContainerView textWhenExpanded](self->_titleContainer, "textWhenExpanded");
}

- (void)setTextWhenExpanded:(id)a3
{
  -[SFUnifiedTabBarItemTitleContainerView setTextWhenExpanded:](self->_titleContainer, "setTextWhenExpanded:", a3);
}

- (unint64_t)startIndexOfTitleInTextWhenExpanded
{
  return -[SFUnifiedTabBarItemTitleContainerView startIndexOfTitleInTextWhenExpanded](self->_titleContainer, "startIndexOfTitleInTextWhenExpanded");
}

- (void)setStartIndexOfTitleInTextWhenExpanded:(unint64_t)a3
{
  -[SFUnifiedTabBarItemTitleContainerView setStartIndexOfTitleInTextWhenExpanded:](self->_titleContainer, "setStartIndexOfTitleInTextWhenExpanded:", a3);
}

- (NSString)titleTextStyle
{
  return -[SFUnifiedTabBarItemTitleContainerView titleTextStyle](self->_titleContainer, "titleTextStyle");
}

- (void)setTitleTextStyle:(id)a3
{
  -[SFUnifiedTabBarItemTitleContainerView setTitleTextStyle:](self->_titleContainer, "setTitleTextStyle:", a3);
}

- (BOOL)showsSearchIcon
{
  return -[SFUnifiedTabBarItemTitleContainerView showsSearchIcon](self->_titleContainer, "showsSearchIcon");
}

- (void)setShowsSearchIcon:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  char v8;
  _QWORD v9[5];

  v3 = a3;
  if (-[SFUnifiedTabBarItemTitleContainerView showsSearchIcon](self->_titleContainer, "showsSearchIcon") != a3)
  {
    -[SFUnifiedTabBarItemTitleContainerView setShowsSearchIcon:](self->_titleContainer, "setShowsSearchIcon:", v3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_squishedTitleContainer);
    objc_msgSend(WeakRetained, "setShowsSearchIcon:", v3);

    -[SFUnifiedTabBarItemView setNeedsLayout](self, "setNeedsLayout");
    -[SFUnifiedTabBarItemView superview](self, "superview");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = -[SFUnifiedTabBarItemView isHidden](self, "isHidden");

      if ((v8 & 1) == 0)
      {
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __46__SFUnifiedTabBarItemView_setShowsSearchIcon___block_invoke;
        v9[3] = &unk_1E21E2050;
        v9[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v9);
      }
    }
  }
}

uint64_t __46__SFUnifiedTabBarItemView_setShowsSearchIcon___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (BOOL)showsLockIcon
{
  return -[SFUnifiedTabBarItemTitleContainerView showsLockIcon](self->_titleContainer, "showsLockIcon");
}

- (void)setShowsLockIcon:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  -[SFUnifiedTabBarItemTitleContainerView setShowsLockIcon:](self->_titleContainer, "setShowsLockIcon:");
  WeakRetained = objc_loadWeakRetained((id *)&self->_squishedTitleContainer);
  objc_msgSend(WeakRetained, "setShowsLockIcon:", v3);

}

- (int64_t)lockIconEdge
{
  return -[SFUnifiedTabBarItemTitleContainerView lockIconEdge](self->_titleContainer, "lockIconEdge");
}

- (void)setLockIconEdge:(int64_t)a3
{
  id WeakRetained;

  -[SFUnifiedTabBarItemTitleContainerView setLockIconEdge:](self->_titleContainer, "setLockIconEdge:");
  WeakRetained = objc_loadWeakRetained((id *)&self->_squishedTitleContainer);
  objc_msgSend(WeakRetained, "setLockIconEdge:", a3);

}

- (void)setShowsVoiceSearchButton:(BOOL)a3
{
  if (self->_showsVoiceSearchButton != a3)
  {
    self->_showsVoiceSearchButton = a3;
    -[SFUnifiedTabBarItemView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)showsSecurityAnnotation
{
  return -[SFUnifiedTabBarItemTitleContainerView securityAnnotation](self->_titleContainer, "securityAnnotation") != 0;
}

- (void)setSecurityAnnotation:(int64_t)a3
{
  id WeakRetained;

  -[SFUnifiedTabBarItemTitleContainerView setSecurityAnnotation:](self->_titleContainer, "setSecurityAnnotation:");
  WeakRetained = objc_loadWeakRetained((id *)&self->_squishedTitleContainer);
  objc_msgSend(WeakRetained, "setSecurityAnnotation:", a3);

}

- (int64_t)securityAnnotation
{
  return -[SFUnifiedTabBarItemTitleContainerView securityAnnotation](self->_titleContainer, "securityAnnotation");
}

- (BOOL)hasFocusedSensitiveInputField
{
  return -[SFUnifiedTabBarItemTitleContainerView hasFocusedSensitiveInputField](self->_titleContainer, "hasFocusedSensitiveInputField");
}

- (void)setHasFocusedSensitiveInputField:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  -[SFUnifiedTabBarItemTitleContainerView setHasFocusedSensitiveInputField:](self->_titleContainer, "setHasFocusedSensitiveInputField:");
  WeakRetained = objc_loadWeakRetained((id *)&self->_squishedTitleContainer);
  objc_msgSend(WeakRetained, "setHasFocusedSensitiveInputField:", v3);

}

- (UIView)menuPopoverSourceView
{
  SFMoreMenuButton *v3;

  if (-[SFUnifiedTabBarItemAccessoryButtonArrangement containsButtonType:](self->_accessoryButtonArrangement, "containsButtonType:", 1))
  {
    v3 = self->_moreMenuButton;
  }
  else
  {
    -[SFNavigationBarToggleButton tiplessPopoverSourceView](self->_formatMenuButton, "tiplessPopoverSourceView");
    v3 = (SFMoreMenuButton *)objc_claimAutoreleasedReturnValue();
  }
  return (UIView *)v3;
}

- (BOOL)menuButtonSelected
{
  return -[SFMoreMenuButton isSelected](self->_moreMenuButton, "isSelected");
}

- (void)setMenuButtonSelected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[SFUnifiedTabBarItemView menuButtonSelected](self, "menuButtonSelected") != a3)
  {
    -[SFMoreMenuButton setSelected:](self->_moreMenuButton, "setSelected:", v3);
    -[SFNavigationBarToggleButton setSelected:](self->_formatMenuButton, "setSelected:", v3);
    -[SFNavigationBarToggleButton pointerInteraction](self->_formatMenuButton, "pointerInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", v3);

    -[SFUnifiedTabBarItemView _updateFormatMenuButtonAccessories](self, "_updateFormatMenuButtonAccessories");
    -[SFUnifiedTabBarItemView _updateMenuButtonColor](self, "_updateMenuButtonColor");
  }
}

- (void)setShowsReaderIcon:(BOOL)a3
{
  if (self->_showsReaderIcon != a3)
  {
    self->_showsReaderIcon = a3;
    -[SFUnifiedTabBarItemView _updateFormatMenuButtonImage](self, "_updateFormatMenuButtonImage");
  }
}

- (void)setShowsTranslationIcon:(BOOL)a3
{
  if (self->_showsTranslationIcon != a3)
  {
    self->_showsTranslationIcon = a3;
    -[SFUnifiedTabBarItemView _updateFormatMenuButtonImage](self, "_updateFormatMenuButtonImage");
  }
}

- (void)setShowsSiriReaderPlayingIcon:(BOOL)a3
{
  if (self->_showsSiriReaderPlayingIcon != a3)
  {
    self->_showsSiriReaderPlayingIcon = a3;
    -[SFUnifiedTabBarItemView _updateFormatMenuButtonImage](self, "_updateFormatMenuButtonImage");
  }
}

- (void)setContentOptions:(unint64_t)a3 resetDisplay:(BOOL)a4
{
  if (a4)
    -[WBSContentAvailabilityDisplayController resetDisplay](self->_availabilityDisplayController, "resetDisplay");
  -[WBSContentAvailabilityDisplayController updateToContentOptions:](self->_availabilityDisplayController, "updateToContentOptions:", a3);
  -[SFUnifiedTabBarItemView _updateFormatMenuButtonImage](self, "_updateFormatMenuButtonImage");
}

- (id)makeReaderAvailabilityAction
{
  void *v2;
  void *v3;
  SFUnifiedTabBarAvailabilityItem *v4;
  SFUnifiedTabBarAvailabilityItem *v5;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  _WBSLocalizedString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.plaintext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [SFUnifiedTabBarAvailabilityItem alloc];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__SFUnifiedTabBarItemView_makeReaderAvailabilityAction__block_invoke;
  v7[3] = &unk_1E21E2AE8;
  objc_copyWeak(&v8, &location);
  v5 = -[SFUnifiedTabBarAvailabilityItem initWithTitle:image:buttonType:action:](v4, "initWithTitle:image:buttonType:action:", v2, v3, 10, v7);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
  return v5;
}

void __55__SFUnifiedTabBarItemView_makeReaderAvailabilityAction__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_readerButtonTapped");

}

- (id)makeTranslationAvailabilityAction
{
  void *v2;
  void *v3;
  SFUnifiedTabBarAvailabilityItem *v4;
  SFUnifiedTabBarAvailabilityItem *v5;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  _WBSLocalizedString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("translate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [SFUnifiedTabBarAvailabilityItem alloc];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__SFUnifiedTabBarItemView_makeTranslationAvailabilityAction__block_invoke;
  v7[3] = &unk_1E21E2AE8;
  objc_copyWeak(&v8, &location);
  v5 = -[SFUnifiedTabBarAvailabilityItem initWithTitle:image:buttonType:action:](v4, "initWithTitle:image:buttonType:action:", v2, v3, 11, v7);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
  return v5;
}

void __60__SFUnifiedTabBarItemView_makeTranslationAvailabilityAction__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_translationButtonTapped");

}

- (BOOL)showsStopReloadButton
{
  BOOL v3;
  NSDate *lastReloadDate;
  double v5;
  BOOL v6;
  BOOL result;
  char v8;

  v3 = -[SFUnifiedTabBarItemView showsPersistentStopReloadButton](self, "showsPersistentStopReloadButton");
  lastReloadDate = self->_lastReloadDate;
  if (lastReloadDate)
  {
    -[NSDate safari_timeIntervalUntilNow](lastReloadDate, "safari_timeIntervalUntilNow");
    v6 = v5 < 480.0;
  }
  else
  {
    v6 = 0;
  }
  result = self->_showsStopReloadButton;
  v8 = !self->_showsStopReloadButton || v3;
  if ((v8 & 1) == 0 && !v6)
    return -[SFUnifiedBarItemView isHovering](self, "isHovering");
  return result;
}

- (void)setShowsStopReloadButton:(BOOL)a3
{
  if (self->_showsStopReloadButton != a3)
  {
    self->_showsStopReloadButton = a3;
    if (-[SFUnifiedBarItemView isHovering](self, "isHovering"))
      -[SFUnifiedTabBarItemView _setNeedsAnimatedAccessoryButtonUpdate](self, "_setNeedsAnimatedAccessoryButtonUpdate");
  }
}

- (BOOL)showsPersistentStopReloadButton
{
  return !-[SFUnifiedTabBarItemAccessoryButtonArrangement containsButtonType:](self->_accessoryButtonArrangement, "containsButtonType:", 1);
}

- (void)setStopReloadButtonShowsStop:(BOOL)a3
{
  if (self->_stopReloadButtonShowsStop != a3)
  {
    self->_stopReloadButtonShowsStop = a3;
    if (-[SFUnifiedTabBarItemView showsStopReloadButton](self, "showsStopReloadButton"))
      -[SFUnifiedTabBarItemView _setNeedsAnimatedAccessoryButtonUpdate](self, "_setNeedsAnimatedAccessoryButtonUpdate");
  }
}

- (void)setLastReloadDate:(id)a3
{
  _BOOL4 v5;
  id v6;

  v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    v5 = -[SFUnifiedTabBarItemView showsStopReloadButton](self, "showsStopReloadButton");
    objc_storeStrong((id *)&self->_lastReloadDate, a3);
    if (v5 != -[SFUnifiedTabBarItemView showsStopReloadButton](self, "showsStopReloadButton"))
      -[SFUnifiedTabBarItemView _setNeedsAnimatedAccessoryButtonUpdate](self, "_setNeedsAnimatedAccessoryButtonUpdate");
    if (v6)
      -[SFUnifiedTabBarItemView _startReloadButtonExpirationTimer](self, "_startReloadButtonExpirationTimer");
    else
      -[SFUnifiedTabBarItemView _stopReloadButtonExpirationTimer](self, "_stopReloadButtonExpirationTimer");
  }

}

- (void)setMediaStateIcon:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  if (self->_mediaStateIcon != a3)
  {
    self->_mediaStateIcon = a3;
    -[UIButton configuration](self->_mediaStateMuteButton, "configuration");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    _SFImageForMediaStateIcon(a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageWithRenderingMode:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v6);

    -[UIButton setConfiguration:](self->_mediaStateMuteButton, "setConfiguration:", v7);
    -[SFUnifiedTabBarItemView _updateMediaStateMuteButton](self, "_updateMediaStateMuteButton");
    -[SFUnifiedTabBarItemView _setNeedsAnimatedAccessoryButtonUpdate](self, "_setNeedsAnimatedAccessoryButtonUpdate");
    -[SFUnifiedTabBarItemView _updateFormatMenuButtonAccessories](self, "_updateFormatMenuButtonAccessories");

  }
}

- (void)setFluidProgressController:(id)a3 withCurrentState:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;
  id obj;

  obj = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_fluidProgressController);
  if (WeakRetained != obj)
  {
    objc_msgSend(WeakRetained, "unregisterObserver:", self->_progressView);
    v8 = objc_storeWeak((id *)&self->_fluidProgressController, obj);

    objc_msgSend(obj, "registerObserver:", self->_progressView);
    -[_SFFluidProgressView setProgressToCurrentPositionForState:](self->_progressView, "setProgressToCurrentPositionForState:", v6);
    -[SFUnifiedTabBarItemView _updateShowsProgressView](self, "_updateShowsProgressView");
  }

}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    -[SFUnifiedTabBarItemTitleContainerView setCollapsed:](self->_titleContainer, "setCollapsed:", !a3);
    -[SFUnifiedTabBarItemView _updateShowsProgressView](self, "_updateShowsProgressView");
    -[SFUnifiedTabBarItemView _updateMediaStateMuteButton](self, "_updateMediaStateMuteButton");
    -[SFUnifiedTabBarItemView setNeedsLayout](self, "setNeedsLayout");
    if (!self->_active)
      -[SFUnifiedTabBarItemView _stopAccessoryButtonUpdateTimer](self, "_stopAccessoryButtonUpdateTimer");
    -[SFUnifiedTabBarItemView updateEntityAnnotationWithUUID:](self, "updateEntityAnnotationWithUUID:", self->_cachedUUIDForAnnotation);
  }
}

- (void)setShowsCloseButton:(BOOL)a3
{
  if (self->_showsCloseButton != a3)
  {
    self->_showsCloseButton = a3;
    -[SFUnifiedTabBarItemView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)_hasRoomForIconAndCloseButton
{
  double Width;
  double v4;
  double v5;
  double v6;
  CGRect v8;

  if (self->_active || -[SFUnifiedTabBarItemView contentAlignment](self, "contentAlignment") != 1)
    return 1;
  -[SFUnifiedTabBarItemView bounds](self, "bounds");
  Width = CGRectGetWidth(v8);
  +[SFUnifiedTabBarMetrics minimumInactiveItemWidthForSizeClass:](SFUnifiedTabBarMetrics, "minimumInactiveItemWidthForSizeClass:", 0);
  v5 = v4;
  -[SFUnifiedTabBarItemTitleContainerView maximumIconWidth](self->_titleContainer, "maximumIconWidth");
  return Width > v5 + v6 * 2.0;
}

- (void)setFormatMenuButtonConfigurator:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_formatMenuButtonConfigurator);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_formatMenuButtonConfigurator, obj);
    objc_msgSend(obj, "configureMenuAndAdoptButton:", self->_formatMenuButton);
  }

}

- (UITextField)searchField
{
  return -[SFUnifiedTabBarItemTitleContainerView searchField](self->_titleContainer, "searchField");
}

- (void)setSearchField:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SFUnifiedTabBarItemView searchField](self, "searchField");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v6)
  {
    objc_msgSend(v4, "removeTarget:action:forControlEvents:", self, sel__searchFieldDidChange_, 0x20000);
    -[SFUnifiedTabBarItemTitleContainerView setSearchField:](self->_titleContainer, "setSearchField:", v6);
    -[SFUnifiedTabBarItemView setNeedsLayout](self, "setNeedsLayout");
    objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__searchFieldDidChange_, 0x20000);
    -[SFUnifiedTabBarItemView _searchFieldTintColor](self, "_searchFieldTintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTintColor:", v5);

  }
}

- (BOOL)showsSearchField
{
  return -[SFUnifiedTabBarItemTitleContainerView showsSearchField](self->_titleContainer, "showsSearchField");
}

- (void)setShowsSearchField:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[SFUnifiedTabBarItemTitleContainerView showsSearchField](self->_titleContainer, "showsSearchField") != a3)
  {
    -[SFUnifiedTabBarItemTitleContainerView setShowsSearchField:](self->_titleContainer, "setShowsSearchField:", v3);
    -[SFUnifiedTabBarItemView applyTheme](self, "applyTheme");
    -[SFUnifiedTabBarItemView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setAccessoryButtonLayout:(int64_t)a3
{
  SFMoreMenuButton *v4;
  SFMoreMenuButton *downloadProgressView;
  SFMoreMenuButton *v6;

  if (self->_accessoryButtonLayout != a3)
  {
    self->_accessoryButtonLayout = a3;
    if (-[SFUnifiedTabBarItemView _showsFormatMenuButtonAccessories](self, "_showsFormatMenuButtonAccessories"))
    {
      v4 = objc_alloc_init(SFMoreMenuButton);
      downloadProgressView = self->_downloadProgressView;
      self->_downloadProgressView = v4;

      -[SFMoreMenuButton setProgressStyle:](self->_downloadProgressView, "setProgressStyle:", 1);
      -[SFMoreMenuButton downloadProgress](self->_moreMenuButton, "downloadProgress");
      -[SFMoreMenuButton setDownloadProgress:](self->_downloadProgressView, "setDownloadProgress:");
      -[SFMoreMenuButton setUserInteractionEnabled:](self->_downloadProgressView, "setUserInteractionEnabled:", 0);
    }
    else
    {
      v6 = self->_downloadProgressView;
      self->_downloadProgressView = 0;

    }
    -[SFUnifiedTabBarItemView _updateFormatMenuButtonAccessories](self, "_updateFormatMenuButtonAccessories");
    -[SFUnifiedTabBarItemView _updateFormatMenuButtonStyle](self, "_updateFormatMenuButtonStyle");
    -[SFUnifiedTabBarItemView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (int64_t)contentAlignment
{
  return -[SFUnifiedTabBarItemTitleContainerView alignment](self->_titleContainer, "alignment");
}

- (void)setContentAlignment:(int64_t)a3
{
  if (-[SFUnifiedTabBarItemTitleContainerView alignment](self->_titleContainer, "alignment") != a3)
  {
    -[SFUnifiedTabBarItemTitleContainerView setAlignment:](self->_titleContainer, "setAlignment:", a3);
    -[SFUnifiedTabBarItemView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setDownloadProgress:(double)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[SFMoreMenuButton setDownloadProgress:animated:](self->_moreMenuButton, "setDownloadProgress:animated:");
  -[SFMoreMenuButton setDownloadProgress:animated:](self->_downloadProgressView, "setDownloadProgress:animated:", v4, a3);
  -[SFUnifiedTabBarItemView _updateFormatMenuButtonAccessories](self, "_updateFormatMenuButtonAccessories");
}

- (void)_updateExtensionButtonConfigurationShowingOverflow:(BOOL)a3 activeExtensionCount:(unint64_t)a4
{
  _BOOL4 v5;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0DC3520], "borderlessButtonConfiguration");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
    v7 = CFSTR("puzzlepiece.extension.fill");
  else
    v7 = CFSTR("puzzlepiece.extension");
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setImage:", v8);
  if (v5)
  {
    v9 = (void *)MEMORY[0x1E0CB37F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringFromNumber:numberStyle:", v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTitle:", v11);

  }
  else
  {
    objc_msgSend(v16, "setTitle:", 0);
  }
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPreferredSymbolConfigurationForImage:", v12);

  objc_msgSend(v16, "setImagePadding:", 2.0);
  objc_msgSend(v16, "setContentInsets:", 6.0, 6.0, 6.0, 6.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "background");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v13);

  -[UIButton setConfiguration:](self->_multipleExtensionsButton, "setConfiguration:", v16);
  _WBSLocalizedString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setLargeContentTitle:](self->_multipleExtensionsButton, "setLargeContentTitle:", v15);

  -[UIButton setLargeContentImage:](self->_multipleExtensionsButton, "setLargeContentImage:", v8);
  -[SFBadgeContainerView setPositionsBadgeRelativeToLayoutMargins:](self->_multipleExtensionsButtonContainer, "setPositionsBadgeRelativeToLayoutMargins:", !v5);

}

- (void)setExtensionButtonConfiguration:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  UIButton *firstExtensionButton;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  UIButton *secondExtensionButton;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  unint64_t v22;
  unint64_t v23;
  id v24;

  v24 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_extensionButtonConfiguration, a3);
    objc_msgSend(v24, "buttons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    firstExtensionButton = self->_firstExtensionButton;
    objc_msgSend(v7, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](firstExtensionButton, "setImage:forState:", v9, 0);

    objc_msgSend(v7, "extension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayShortName");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (void *)v11;
    else
      v13 = v6;
    -[UIButton setLargeContentTitle:](self->_firstExtensionButton, "setLargeContentTitle:", v13);

    -[SFBadgeContainerView setNeedsLayout](self->_firstExtensionButtonContainer, "setNeedsLayout");
    v14 = 0;
    if ((unint64_t)objc_msgSend(v5, "count") >= 2)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    secondExtensionButton = self->_secondExtensionButton;
    objc_msgSend(v14, "image");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](secondExtensionButton, "setImage:forState:", v16, 0);

    objc_msgSend(v14, "extension");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "displayShortName");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      v20 = (void *)v18;
    else
      v20 = v6;
    -[UIButton setLargeContentTitle:](self->_secondExtensionButton, "setLargeContentTitle:", v20);

    -[SFBadgeContainerView setNeedsLayout](self->_secondExtensionButtonContainer, "setNeedsLayout");
    -[SFBadgeContainerView setShowsBadge:](self->_firstExtensionButtonContainer, "setShowsBadge:", objc_msgSend(v7, "badged"));
    -[SFBadgeContainerView setShowsBadge:](self->_secondExtensionButtonContainer, "setShowsBadge:", objc_msgSend(v14, "badged"));
    v21 = objc_msgSend(v24, "alwaysShowMultipleExtensionsButton");
    v22 = objc_msgSend(v24, "activeExtensionCount");
    v23 = -[SFUnifiedTabBarItemView _individualExtensionButtonLimit](self, "_individualExtensionButtonLimit");
    if ((v21 & 1) != 0 || v22 > v23)
      -[SFUnifiedTabBarItemView _updateExtensionButtonConfigurationShowingOverflow:activeExtensionCount:](self, "_updateExtensionButtonConfigurationShowingOverflow:activeExtensionCount:", v22 > v23, v22);
    if (objc_msgSend(v5, "count"))
    {
      -[SFUnifiedTabBarItemView _setNeedsAnimatedAccessoryButtonUpdate](self, "_setNeedsAnimatedAccessoryButtonUpdate");
    }
    else if (-[SFUnifiedTabBarItemView showsStopReloadButton](self, "showsStopReloadButton"))
    {
      -[SFUnifiedTabBarItemView _temporarilyCoalesceAccessoryButtonUpdates](self, "_temporarilyCoalesceAccessoryButtonUpdates");
    }
    -[SFUnifiedTabBarItemView _updateBadges](self, "_updateBadges");
    -[SFUnifiedTabBarItemView _updateFormatMenuButtonAccessories](self, "_updateFormatMenuButtonAccessories");

  }
}

- (void)setMenuButtonBadges:(unint64_t)a3
{
  if (self->_menuButtonBadges != a3)
  {
    self->_menuButtonBadges = a3;
    -[SFUnifiedTabBarItemView _updateBadges](self, "_updateBadges");
    -[SFUnifiedTabBarItemView _updateFormatMenuButtonAccessories](self, "_updateFormatMenuButtonAccessories");
  }
}

- (void)setShowsBadgeOnExtensionsButton:(BOOL)a3
{
  if (self->_showsBadgeOnExtensionsButton != a3)
  {
    self->_showsBadgeOnExtensionsButton = a3;
    -[SFUnifiedTabBarItemView _updateBadges](self, "_updateBadges");
  }
}

- (void)setUnread:(BOOL)a3
{
  if (self->_unread != a3)
  {
    self->_unread = a3;
    -[SFUnifiedTabBarItemView _setNeedsAnimatedAccessoryButtonUpdate](self, "_setNeedsAnimatedAccessoryButtonUpdate");
  }
}

- (NSArray)shareParticipants
{
  return -[SFAvatarStackView shareParticipants](self->_participantsView, "shareParticipants");
}

- (void)setShareParticipants:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[SFUnifiedTabBarItemView shareParticipants](self, "shareParticipants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToArray:", v6);

  if ((v5 & 1) == 0)
  {
    -[SFAvatarStackView setShareParticipants:](self->_participantsView, "setShareParticipants:", v6);
    -[SFUnifiedTabBarItemView _setNeedsAnimatedAccessoryButtonUpdate](self, "_setNeedsAnimatedAccessoryButtonUpdate");
  }

}

- (void)setShowsPinnedIndicator:(BOOL)a3
{
  if (self->_showsPinnedIndicator != a3)
  {
    self->_showsPinnedIndicator = a3;
    -[SFUnifiedTabBarItemView _setNeedsAnimatedAccessoryButtonUpdate](self, "_setNeedsAnimatedAccessoryButtonUpdate");
  }
}

- (void)setHasHiddenElements:(BOOL)a3
{
  if (self->_hasHiddenElements != a3)
  {
    self->_hasHiddenElements = a3;
    -[SFUnifiedTabBarItemView _updateFormatMenuButtonAccessories](self, "_updateFormatMenuButtonAccessories");
  }
}

- (void)setOverlayConfiguration:(id)a3
{
  SFURLFieldOverlayConfiguration *v5;
  void *v6;
  void *v7;
  int v8;
  SFURLFieldOverlayView *overlayView;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  SFURLFieldOverlayView *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  SFURLFieldOverlayView *v25;
  SFURLFieldOverlayView *v26;
  void *v27;
  void *v28;
  SFURLFieldOverlayView *v29;
  id v30;

  v30 = a3;
  v5 = self->_overlayConfiguration;
  objc_storeStrong((id *)&self->_overlayConfiguration, a3);
  -[SFURLFieldOverlayConfiguration identifier](v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = WBSIsEqual();

  overlayView = self->_overlayView;
  if (v8)
  {
    -[SFURLFieldOverlayView setConfiguration:](overlayView, "setConfiguration:", v30);
  }
  else
  {
    -[SFURLFieldOverlayView dismissAndRemove](overlayView, "dismissAndRemove");
    if (v30)
    {
      -[SFUnifiedBarItemView contentView](self, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "presentationLayer");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v12)
        v14 = (void *)v12;
      else
        v14 = v11;
      v15 = v14;

      v16 = [SFURLFieldOverlayView alloc];
      objc_msgSend(v15, "bounds");
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;

      v25 = -[SFURLFieldOverlayView initWithFrame:configuration:](v16, "initWithFrame:configuration:", v30, v18, v20, v22, v24);
      v26 = self->_overlayView;
      self->_overlayView = v25;

      -[SFURLFieldOverlayView setAutoresizingMask:](self->_overlayView, "setAutoresizingMask:", 18);
      -[SFUnifiedBarItemView barMetrics](self, "barMetrics");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "itemCornerRadius");
      -[SFURLFieldOverlayView _setContinuousCornerRadius:](self->_overlayView, "_setContinuousCornerRadius:");

      -[SFUnifiedBarItemView contentView](self, "contentView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addSubview:", self->_overlayView);

      -[SFURLFieldOverlayView present](self->_overlayView, "present");
    }
    else
    {
      v29 = self->_overlayView;
      self->_overlayView = 0;

    }
  }

}

- (void)updateEntityAnnotationWithUUID:(id)a3
{
  id WeakRetained;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_cachedUUIDForAnnotation, a3);
  if (self->_cachedUUIDForAnnotation)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(WeakRetained, "tabBarItemViewShouldAnnotateWithTabEntity:", self))
    {
      -[UIView safari_annotateWithTabUUID:isActive:](self, "safari_annotateWithTabUUID:isActive:", self->_cachedUUIDForAnnotation, -[SFUnifiedTabBarItemView isActive](self, "isActive"));
    }

  }
}

- (void)applyTheme
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = -[SFUnifiedBarItemView platterStyle](self, "platterStyle");
  -[SFUnifiedTabBarItemView _controlsTintColor](self, "_controlsTintColor");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedBarItemView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v11);

  -[SFMoreMenuButton setProgressTintColor:](self->_moreMenuButton, "setProgressTintColor:", v11);
  -[SFUnifiedTabBarItemView _titleTheme](self, "_titleTheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBarItemTitleContainerView setTheme:](self->_titleContainer, "setTheme:", v5);

  -[SFUnifiedTabBarItemTitleContainerView setDimsText:](self->_titleContainer, "setDimsText:", v3 == 1);
  -[SFUnifiedTabBarItemView _accessoryButtonTintColor](self, "_accessoryButtonTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBarItemView _secondaryAccessoryButtonTintColor](self, "_secondaryAccessoryButtonTintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBarItemViewCloseButton setTintColor:](self->_closeButton, "setTintColor:", v6);
  -[SFUnifiedTabBarItemViewCloseButton setTintColor:](self->_closeButtonForHover, "setTintColor:", v6);
  if (-[UIButton isEnabled](self->_voiceSearchButton, "isEnabled"))
  {
    -[UIButton setTintColor:](self->_voiceSearchButton, "setTintColor:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](self->_voiceSearchButton, "setTintColor:", v8);

  }
  -[UIButton setTintColor:](self->_reloadButton, "setTintColor:", v6);
  -[UIButton setTintColor:](self->_stopButton, "setTintColor:", v6);
  -[UIButton setTintColor:](self->_multipleExtensionsButton, "setTintColor:", v7);
  -[SFUnifiedTabBarItemView _searchFieldTintColor](self, "_searchFieldTintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBarItemView searchField](self, "searchField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTintColor:", v9);

  -[SFUnifiedTabBarItemView _updateProgressViewColor](self, "_updateProgressViewColor");
  -[SFUnifiedTabBarItemView _updateMenuButtonColor](self, "_updateMenuButtonColor");
  -[SFUnifiedTabBarItemView _updateMediaStateMuteButton](self, "_updateMediaStateMuteButton");
  -[SFUnifiedTabBarItemView _updateFormatMenuButtonAccessories](self, "_updateFormatMenuButtonAccessories");
  -[SFUnifiedTabBarItemView _updateFormatMenuButtonStyle](self, "_updateFormatMenuButtonStyle");

}

- (void)setPlatterStyle:(int64_t)a3
{
  objc_super v5;

  if (-[SFUnifiedBarItemView platterStyle](self, "platterStyle") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)SFUnifiedTabBarItemView;
    -[SFUnifiedBarItemView setPlatterStyle:](&v5, sel_setPlatterStyle_, a3);
    -[SFUnifiedTabBarItemView applyTheme](self, "applyTheme");
  }
}

- (id)_titleTheme
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[SFUnifiedTabBarItemView _shouldUseActiveTheme](self, "_shouldUseActiveTheme");
  -[SFUnifiedBarItemView barTheme](self, "barTheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "activeTabTitleTheme");
  else
    objc_msgSend(v4, "tabTitleTheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_accessoryButtonTintColor
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;

  if (-[SFUnifiedBarItemView platterStyle](self, "platterStyle") == 4)
  {
    -[SFUnifiedBarItemView barTheme](self, "barTheme");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inputFieldAccessoryButtonTintColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = -[SFUnifiedTabBarItemView _shouldUseActiveTheme](self, "_shouldUseActiveTheme");
    -[SFUnifiedBarItemView barTheme](self, "barTheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v6;
    if (v5)
      objc_msgSend(v6, "activeTabAccessoryButtonTintColor");
    else
      objc_msgSend(v6, "tabAccessoryButtonTintColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v4;

  return v7;
}

- (id)_secondaryAccessoryButtonTintColor
{
  void *v2;
  int64_t v4;
  BOOL v5;
  void *v6;
  void *v8;

  v4 = -[SFUnifiedBarItemView platterStyle](self, "platterStyle");
  if (v4 == 4)
  {
    v5 = -[SFUnifiedTabBarItemView showsSearchField](self, "showsSearchField");
    if (v5
      || (-[SFUnifiedTabBarItemView titleWhenActive](self, "titleWhenActive"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          !objc_msgSend(v2, "length")))
    {
      -[SFUnifiedBarItemView barTheme](self, "barTheme");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "inputFieldSecondaryAccessoryButtonTintColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
        return v6;
      goto LABEL_5;
    }
  }
  -[SFUnifiedTabBarItemView _accessoryButtonTintColor](self, "_accessoryButtonTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == 4)
LABEL_5:

  return v6;
}

- (id)_controlsTintColor
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[SFUnifiedTabBarItemView _shouldUseActiveTheme](self, "_shouldUseActiveTheme");
  -[SFUnifiedBarItemView barTheme](self, "barTheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "activeTabControlsTintColor");
  else
    objc_msgSend(v4, "tabControlsTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_progressBarTintColor
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[SFUnifiedTabBarItemView _shouldUseActiveTheme](self, "_shouldUseActiveTheme");
  -[SFUnifiedBarItemView barTheme](self, "barTheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "activeTabProgressBarTintColor");
  else
    objc_msgSend(v4, "tabProgressBarTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_searchFieldTintColor
{
  void *v3;
  void *v4;

  if (-[SFUnifiedBarItemView platterStyle](self, "platterStyle") == 2)
  {
    -[SFUnifiedBarItemView barTheme](self, "barTheme");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activeTabFieldTintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)_shouldUseActiveTheme
{
  unint64_t v3;
  void *v5;
  char v6;

  v3 = -[SFUnifiedBarItemView platterStyle](self, "platterStyle");
  if (v3 > 7)
    return 1;
  if (((1 << v3) & 0xE3) != 0)
    return 0;
  -[SFUnifiedBarItemView barTheme](self, "barTheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPrivate");

  return v6;
}

- (void)setSquishedTitleContainer:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_squishedTitleContainer);
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_squishedTitleContainer, obj);
    objc_msgSend(WeakRetained, "dismissAvailabilityLabelAnimated:withCompletionHandler:", 0, 0);
    if (obj)
    {
      objc_msgSend(obj, "setShowsSearchIcon:", -[SFUnifiedTabBarItemTitleContainerView showsSearchIcon](self->_titleContainer, "showsSearchIcon"));
      objc_msgSend(obj, "setShowsLockIcon:", -[SFUnifiedTabBarItemTitleContainerView showsLockIcon](self->_titleContainer, "showsLockIcon"));
      objc_msgSend(obj, "setLockIconEdge:", -[SFUnifiedTabBarItemTitleContainerView lockIconEdge](self->_titleContainer, "lockIconEdge"));
      objc_msgSend(obj, "setSecurityAnnotation:", -[SFUnifiedTabBarItemTitleContainerView securityAnnotation](self->_titleContainer, "securityAnnotation"));
      -[SFUnifiedTabBarItemTitleContainerView title](self->_titleContainer, "title");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obj, "setTitle:", v5);

    }
  }

}

- (void)setShowsSquishedAccessoryViews:(BOOL)a3
{
  if (self->_showsSquishedAccessoryViews != a3)
  {
    self->_showsSquishedAccessoryViews = a3;
    -[SFUnifiedTabBarItemView _updateProgressViewColor](self, "_updateProgressViewColor");
    -[SFUnifiedTabBarItemView _updateShowsProgressView](self, "_updateShowsProgressView");
    -[SFUnifiedTabBarItemView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_closeButtonTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "tabBarItemViewCloseButtonTapped:", self);

}

- (void)_menuButtonTapped
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  id WeakRetained;

  -[SFUnifiedTabBarAvailabilityItem action](self->_currentAvailabilityItem, "action");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        v5 = -[SFUnifiedTabBarItemView _availabilityButtonsReplaceFormatMenuButton](self, "_availabilityButtonsReplaceFormatMenuButton"), v4, v5))
  {
    -[SFUnifiedTabBarAvailabilityItem performAction](self->_currentAvailabilityItem, "performAction");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "tabBarItemViewMenuButtonTapped:", self);

  }
}

- (void)_menuButtonReceivedTouchDown
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "tabBarItemViewMenuButtonReceivedTouchDown:", self);

}

- (void)_menuButtonClicked
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "tabBarItemViewMenuButtonClicked:", self);

}

- (void)_reloadButtonTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "tabBarItemViewReloadButtonTapped:", self);

}

- (void)_stopButtonTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "tabBarItemViewStopButtonTapped:", self);

}

- (void)_voiceSearchButtonTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "tabBarItemViewVoiceSearchButtonTapped:", self);

}

- (void)_readerButtonTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "tabBarItemViewReaderButtonTapped:", self);

}

- (void)_translationButtonTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "tabBarItemViewTranslationButtonTapped:", self);

}

- (void)_mediaStateMuteButtonTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "tabBarItemViewMediaStateMuteButtonTapped:", self);

}

- (void)_extensionButtonTapped:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  UIButton *v8;

  v8 = (UIButton *)a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (self->_multipleExtensionsButton == v8)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "tabBarItemView:multipleExtensionButtonTapped:", self, v8);
  }
  else
  {
    -[SFWebExtensionButtonConfiguration buttons](self->_extensionButtonConfiguration, "buttons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", self->_firstExtensionButton != v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "extension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "tabBarItemView:extensionButtonTapped:extension:", self, v8, v7);

  }
}

- (void)_updateShowsProgressView
{
  _BOOL8 v2;

  v2 = !self->_active || !self->_showingProgress;
  -[_SFFluidProgressView setHidden:](self->_progressView, "setHidden:", v2);
}

- (void)_updateProgressViewColor
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  -[SFUnifiedBarItemView barTheme](self, "barTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v3;
  if (self->_showsSquishedAccessoryViews)
    objc_msgSend(v3, "progressBarTintColor");
  else
    -[SFUnifiedTabBarItemView _progressBarTintColor](self, "_progressBarTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFFluidProgressView setProgressBarFillColor:](self->_progressView, "setProgressBarFillColor:", v4);

  if (self->_showsSquishedAccessoryViews || !_SFIsPrivateTintStyle(objc_msgSend(v8, "tintStyle")))
  {
    v6 = 0;
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C80]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 1;
  }
  -[_SFFluidProgressView layer](self->_progressView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCompositingFilter:", v5);

  if (v6)
}

- (void)_updateMenuButtonColor
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;

  if (-[SFUnifiedTabBarItemView menuButtonSelected](self, "menuButtonSelected"))
  {
    -[SFUnifiedBarItemView barTheme](self, "barTheme");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "selectedMenuButtonTintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMoreMenuButton setTintColor:](self->_moreMenuButton, "setTintColor:", v4);

    -[SFUnifiedTabBarItemView _titleTheme](self, "_titleTheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "primaryTextColor");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v6 = -[SFUnifiedBarItemView platterStyle](self, "platterStyle");
    v7 = v9;
    if (v6 != 4)
    {
      objc_msgSend(v9, "colorWithAlphaComponent:", 0.85);
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v8;
    }
  }
  else
  {
    -[SFUnifiedTabBarItemView _accessoryButtonTintColor](self, "_accessoryButtonTintColor");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[SFMoreMenuButton setTintColor:](self->_moreMenuButton, "setTintColor:", v10);
    v7 = v10;
  }
  v11 = v7;
  -[SFNavigationBarToggleButton setGlyphTintColor:](self->_formatMenuButton, "setGlyphTintColor:", v7);

}

- (void)_updateMediaStateMuteButton
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  if (self->_active)
  {
    -[SFUnifiedTabBarItemView _titleTheme](self, "_titleTheme");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "overrideTintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[UIButton setTintColor:](self->_mediaStateMuteButton, "setTintColor:", v4);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTintColor:](self->_mediaStateMuteButton, "setTintColor:", v5);

    }
  }
  else
  {
    -[SFUnifiedTabBarItemView _accessoryButtonTintColor](self, "_accessoryButtonTintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](self->_mediaStateMuteButton, "setTintColor:", v3);
  }

  v6 = self->_active || self->_mediaStateIcon != 4;
  -[UIButton setUserInteractionEnabled:](self->_mediaStateMuteButton, "setUserInteractionEnabled:", v6);
}

- (void)_updateFormatMenuButtonImage
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  -[SFUnifiedTabBarAvailabilityItem image](self->_currentAvailabilityItem, "image");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[SFUnifiedTabBarItemView _availabilityButtonsReplaceFormatMenuButton](self, "_availabilityButtonsReplaceFormatMenuButton");

    if (v5)
    {
      -[SFUnifiedTabBarAvailabilityItem image](self->_currentAvailabilityItem, "image");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v7 = (id)v6;
      goto LABEL_11;
    }
  }
  if (!self->_showsSiriReaderPlayingIcon)
  {
    if (self->_showsReaderIcon)
    {
      +[SFNavigationBarToggleButton readerImageWithSummary:](SFNavigationBarToggleButton, "readerImageWithSummary:", -[WBSContentAvailabilityDisplayController cumulativeOptions](self->_availabilityDisplayController, "cumulativeOptions") & 1);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!self->_showsTranslationIcon)
      {
        +[SFNavigationBarToggleButton pageMenuImageWithIntelligence:](SFNavigationBarToggleButton, "pageMenuImageWithIntelligence:", (-[WBSContentAvailabilityDisplayController cumulativeOptions](self->_availabilityDisplayController, "cumulativeOptions") & 0x1F) != 0);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        -[SFNavigationBarToggleButton setAccessibilityIdentifier:](self->_formatMenuButton, "setAccessibilityIdentifier:", CFSTR("PageFormatMenuButton"));
        -[SFNavigationBarToggleButton setImage:](self->_formatMenuButton, "setImage:", v10);
        -[SFNavigationBarToggleButton image](self->_formatMenuButton, "image");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFNavigationBarToggleButton setLargeContentImage:](self->_formatMenuButton, "setLargeContentImage:", v8);

        goto LABEL_12;
      }
      +[SFNavigationBarToggleButton translationImage](SFNavigationBarToggleButton, "translationImage");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_10;
  }
  +[SFNavigationBarToggleButton siriReaderPlayingImage](SFNavigationBarToggleButton, "siriReaderPlayingImage");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SFNavigationBarToggleButton setAccessibilityIdentifier:](self->_formatMenuButton, "setAccessibilityIdentifier:", CFSTR("SiriReaderButton"));
  v7 = v9;
LABEL_11:
  v10 = v7;
  -[SFNavigationBarToggleButton setImage:](self->_formatMenuButton, "setImage:", v7);
  -[UIView sf_configureLargeContentViewerForBarItem:](self->_formatMenuButton, "sf_configureLargeContentViewerForBarItem:", 13);
LABEL_12:

}

- (BOOL)_showsFormatMenuButtonAccessories
{
  return self->_accessoryButtonLayout == 2;
}

- (void)_updateFormatMenuButtonAccessories
{
  _BOOL4 v3;
  char v4;
  unint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t mediaStateIcon;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  _BOOL4 v25;
  SFMoreMenuButton *downloadProgressView;
  void *v27;
  id v28;

  v3 = -[SFUnifiedTabBarItemView _showsFormatMenuButtonAccessories](self, "_showsFormatMenuButtonAccessories");
  v4 = -[SFNavigationBarToggleButton isSelected](self->_formatMenuButton, "isSelected");
  v5 = -[SFWebExtensionButtonConfiguration activeExtensionCount](self->_extensionButtonConfiguration, "activeExtensionCount");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v7 = !v3;
  else
    v7 = 1;
  if (!v7)
  {
    +[SFNavigationBarToggleButton extensionsImage](SFNavigationBarToggleButton, "extensionsImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObject:", v8);

    if ((v4 & 1) != 0
      || (-[SFUnifiedBarItemView barTheme](self, "barTheme"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v9, "inputFieldSecondaryAccessoryButtonTintColor"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v9,
          !v10))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "addObject:", v10);

  }
  mediaStateIcon = self->_mediaStateIcon;
  if (mediaStateIcon)
    v12 = v3;
  else
    v12 = 0;
  if (v12)
  {
    _SFImageForMediaStateIcon(mediaStateIcon);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageWithRenderingMode:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObject:", v14);

    if ((v4 & 1) != 0
      || (-[SFUnifiedTabBarItemView _titleTheme](self, "_titleTheme"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v15, "overrideTintColor"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v15,
          !v16))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "addObject:", v16);

  }
  if (self->_hasHiddenElements)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("eye.slash"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObject:", v17);

    objc_msgSend(MEMORY[0x1E0DC3658], "safari_scribbleThemeColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v18);

  }
  v19 = objc_msgSend(v28, "count");
  if (v19)
  {
    objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFNavigationBarToggleButton setSecondaryImage:](self->_formatMenuButton, "setSecondaryImage:", v20);

    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFNavigationBarToggleButton setSecondaryImageColor:](self->_formatMenuButton, "setSecondaryImageColor:", v21);

    if (v19 != 1)
    {
      objc_msgSend(v28, "objectAtIndexedSubscript:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFNavigationBarToggleButton setTertiaryImage:](self->_formatMenuButton, "setTertiaryImage:", v22);

      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFNavigationBarToggleButton setTertiaryImageColor:](self->_formatMenuButton, "setTertiaryImageColor:", v23);

      goto LABEL_24;
    }
  }
  else
  {
    -[SFNavigationBarToggleButton setSecondaryImage:](self->_formatMenuButton, "setSecondaryImage:", 0);
  }
  -[SFNavigationBarToggleButton setTertiaryImage:](self->_formatMenuButton, "setTertiaryImage:", 0);
LABEL_24:
  -[SFMoreMenuButton downloadProgress](self->_downloadProgressView, "downloadProgress");
  v25 = v24 == -2.0 && (self->_menuButtonBadges & 1) == 0;
  if (v19 > 1)
    v25 = 1;
  if (v25 || !v3)
    downloadProgressView = 0;
  else
    downloadProgressView = self->_downloadProgressView;
  -[SFNavigationBarToggleButton setAccessoryView:](self->_formatMenuButton, "setAccessoryView:", downloadProgressView);
  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "sf_safariAccentColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMoreMenuButton setTintColor:](self->_downloadProgressView, "setTintColor:", v27);

  }
  else
  {
    -[SFMoreMenuButton setTintColor:](self->_downloadProgressView, "setTintColor:", 0);
  }
  -[SFUnifiedTabBarItemView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_updateFormatMenuButtonStyle
{
  unint64_t v3;
  double v4;
  void *v5;
  unint64_t v6;
  void *v7;
  int v8;
  unsigned int v9;
  uint64_t v10;

  v3 = self->_accessoryButtonLayout - 1;
  -[SFNavigationBarToggleButton setCornerRoundingMode:](self->_formatMenuButton, "setCornerRoundingMode:", v3 < 2);
  v4 = 2.0;
  if ((unint64_t)(self->_accessoryButtonLayout - 1) <= 1)
    v4 = _SFOnePixel();
  -[SFNavigationBarToggleButton setInsetFromBackground:](self->_formatMenuButton, "setInsetFromBackground:", v4);
  -[SFUnifiedBarItemView barTheme](self, "barTheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "tintStyle");
  objc_msgSend(v5, "themeColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (_SFIsPrivateTintStyle(v6))
  {
    if (v7)
      v8 = objc_msgSend(v7, "safari_meetsThresholdForDarkAppearance");
    else
      v8 = _SFIsDarkTintStyle(v6);
    v9 = v8 ^ 1;
  }
  else
  {
    v9 = 0;
  }
  if (v3 > 1)
    v10 = 1;
  else
    v10 = v9;

  -[SFNavigationBarToggleButton setUsesInsetFromBackground:](self->_formatMenuButton, "setUsesInsetFromBackground:", v10);
}

- (void)_updateBadges
{
  unint64_t menuButtonBadges;
  double v4;
  double v5;
  int64_t accessoryButtonLayout;
  uint64_t v7;
  void *v8;
  int v9;
  unint64_t v10;
  _BOOL4 v11;
  uint64_t v12;

  -[SFBadgeContainerView setShowsBadge:](self->_moreMenuButtonContainer, "setShowsBadge:", (self->_menuButtonBadges & 3) != 0);
  menuButtonBadges = self->_menuButtonBadges;
  if (-[SFUnifiedTabBarItemView _showsFormatMenuButtonAccessories](self, "_showsFormatMenuButtonAccessories"))
  {
    -[SFMoreMenuButton downloadProgress](self->_downloadProgressView, "downloadProgress");
    v5 = v4;
    if (-[SFWebExtensionButtonConfiguration activeExtensionCount](self->_extensionButtonConfiguration, "activeExtensionCount")&& self->_mediaStateIcon)
    {
      menuButtonBadges |= v5 != -2.0;
    }
    else
    {
      menuButtonBadges &= ~1uLL;
    }
  }
  accessoryButtonLayout = self->_accessoryButtonLayout;
  if (accessoryButtonLayout == 2)
    v7 = 1;
  else
    v7 = 2 * (accessoryButtonLayout != 1);
  -[SFNavigationBarToggleButton setShowsBadge:](self->_formatMenuButton, "setShowsBadge:", (v7 & menuButtonBadges) != 0);
  -[SFWebExtensionButtonConfiguration buttons](self->_extensionButtonConfiguration, "buttons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "safari_containsObjectPassingTest:", &__block_literal_global_11);

  if (v9)
  {
    v10 = -[SFWebExtensionButtonConfiguration activeExtensionCount](self->_extensionButtonConfiguration, "activeExtensionCount");
    v11 = v10 > -[SFUnifiedTabBarItemView _individualExtensionButtonLimit](self, "_individualExtensionButtonLimit");
  }
  else
  {
    v11 = 0;
  }
  v12 = self->_showsBadgeOnExtensionsButton || v11;
  -[SFBadgeContainerView setShowsBadge:](self->_multipleExtensionsButtonContainer, "setShowsBadge:", v12);
}

uint64_t __40__SFUnifiedTabBarItemView__updateBadges__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "badged");
}

- (void)_voiceSearchAvailabilityDidChange:(id)a3
{
  void *v4;

  +[SFVoiceSearchManager sharedManager](SFVoiceSearchManager, "sharedManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setEnabled:](self->_voiceSearchButton, "setEnabled:", objc_msgSend(v4, "availability") == 1);

  -[SFUnifiedTabBarItemView applyTheme](self, "applyTheme");
}

- (void)updateAccessibilityIdentifier
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  -[SFUnifiedBarItemView item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("UUID");
  objc_msgSend(v3, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_1E21FE780;
  if (v5)
    v7 = (const __CFString *)v5;
  v13[0] = v7;
  v12[1] = CFSTR("isSelected");
  if (-[SFUnifiedTabBarItemView isSelected](self, "isSelected"))
    v8 = CFSTR("true");
  else
    v8 = CFSTR("false");
  v13[1] = v8;
  v12[2] = CFSTR("isPinned");
  if (objc_msgSend(v3, "isPinned"))
    v9 = CFSTR("true");
  else
    v9 = CFSTR("false");
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WBSMakeAccessibilityIdentifier();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBarItemView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v11);

}

- (void)_setNeedsAnimatedAccessoryButtonUpdate
{
  char v3;

  if (!-[SFUnifiedTabBarItemView _coalescingAccessoryButtonUpdates](self, "_coalescingAccessoryButtonUpdates"))
  {
    if (self->_needsAnimatedAccessoryButtonUpdate)
      v3 = 1;
    else
      v3 = objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled");
    self->_needsAnimatedAccessoryButtonUpdate = v3;
    -[SFUnifiedTabBarItemView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateAccessoryButtons
{
  _BOOL8 v3;
  double v4;

  if (self->_needsAnimatedAccessoryButtonUpdate)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "inheritedAnimationDuration");
    v3 = v4 > 0.0;
  }
  -[SFUnifiedTabBarItemView _updateAccessoryButtonsAnimated:completion:](self, "_updateAccessoryButtonsAnimated:completion:", v3, 0);
}

- (void)_updateAccessoryButtonsAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  SFUnifiedTabBarItemAccessoryButtonArrangement *v7;
  int64_t accessoryButtonLayout;
  uint64_t v9;
  id v10;
  SFUnifiedTabBarItemAccessoryButtonArrangement *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  SFUnifiedTabBarItemAccessoryButtonArrangement **p_accessoryButtonArrangement;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  dispatch_time_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void (**v44)(_QWORD);
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[5];
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  _QWORD v57[5];
  id v58;
  id v59;
  id v60;
  id v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[5];
  _QWORD v65[6];

  v4 = a3;
  v6 = a4;
  if (!-[SFUnifiedTabBarItemView _coalescingAccessoryButtonUpdates](self, "_coalescingAccessoryButtonUpdates"))
  {
    v7 = [SFUnifiedTabBarItemAccessoryButtonArrangement alloc];
    accessoryButtonLayout = self->_accessoryButtonLayout;
    v9 = MEMORY[0x1E0C809B0];
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __70__SFUnifiedTabBarItemView__updateAccessoryButtonsAnimated_completion___block_invoke;
    v65[3] = &unk_1E21E3670;
    v65[4] = self;
    v10 = -[SFUnifiedTabBarItemAccessoryButtonArrangement initUsingButtonLayout:filteringButtonsUsingBlock:](v7, "initUsingButtonLayout:filteringButtonsUsingBlock:", accessoryButtonLayout, v65);
    if (self->_trailingButtonsHidden)
    {
      v11 = [SFUnifiedTabBarItemAccessoryButtonArrangement alloc];
      objc_msgSend(v10, "leadingButtonTypes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUnifiedTabBarItemAccessoryButtonArrangement trailingButtonTypes](self->_accessoryButtonArrangement, "trailingButtonTypes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[SFUnifiedTabBarItemAccessoryButtonArrangement initWithLeadingButtonTypes:trailingButtonTypes:](v11, "initWithLeadingButtonTypes:trailingButtonTypes:", v12, v13);

      v10 = (id)v14;
    }
    p_accessoryButtonArrangement = &self->_accessoryButtonArrangement;
    if (objc_msgSend(v10, "isEqualToArrangement:", self->_accessoryButtonArrangement))
    {
      v16 = (void *)MEMORY[0x1E0DC3F10];
      v64[0] = v9;
      v64[1] = 3221225472;
      v64[2] = __70__SFUnifiedTabBarItemView__updateAccessoryButtonsAnimated_completion___block_invoke_2;
      v64[3] = &unk_1E21E2050;
      v64[4] = self;
      v62[0] = v9;
      v62[1] = 3221225472;
      v62[2] = __70__SFUnifiedTabBarItemView__updateAccessoryButtonsAnimated_completion___block_invoke_3;
      v62[3] = &unk_1E21E2608;
      v63 = v6;
      objc_msgSend(v16, "sf_animate:usingDefaultTimingWithOptions:animations:completion:", v4, 2, v64, v62);

    }
    else
    {
      v44 = (void (**)(_QWORD))v6;
      -[SFUnifiedTabBarItemView _updateBadges](self, "_updateBadges");
      -[SFUnifiedTabBarItemView _updateExtensionButtonConfigurationShowingOverflow:activeExtensionCount:](self, "_updateExtensionButtonConfigurationShowingOverflow:activeExtensionCount:", -[SFWebExtensionButtonConfiguration activeExtensionCount](self->_extensionButtonConfiguration, "activeExtensionCount") > -[SFUnifiedTabBarItemView _individualExtensionButtonLimit](self, "_individualExtensionButtonLimit"), -[SFWebExtensionButtonConfiguration activeExtensionCount](self->_extensionButtonConfiguration, "activeExtensionCount"));
      -[SFUnifiedTabBarItemAccessoryButtonArrangement leadingButtonTypes](*p_accessoryButtonArrangement, "leadingButtonTypes");
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "leadingButtonTypes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUnifiedTabBarItemAccessoryButtonArrangement trailingButtonTypes](*p_accessoryButtonArrangement, "trailingButtonTypes");
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "trailingButtonTypes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)p_accessoryButtonArrangement, v10);
      v43 = (void *)v17;
      objc_msgSend(v18, "differenceFromArray:withOptions:", v17, 4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "safari_insertionIndexes");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "safari_removalIndexes");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)v19;
      objc_msgSend(v20, "differenceFromArray:withOptions:", v19, 4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "safari_insertionIndexes");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "safari_removalIndexes");
      v25 = objc_claimAutoreleasedReturnValue();
      v45 = v23;
      if (v4)
      {
        v40 = v21;
        v38 = (void *)MEMORY[0x1E0DC3F10];
        v57[0] = MEMORY[0x1E0C809B0];
        v57[1] = 3221225472;
        v57[2] = __70__SFUnifiedTabBarItemView__updateAccessoryButtonsAnimated_completion___block_invoke_4;
        v57[3] = &unk_1E21E3698;
        v57[4] = self;
        v26 = (void *)v25;
        v27 = v22;
        v58 = v27;
        v42 = v18;
        v28 = v18;
        v59 = v28;
        v39 = v24;
        v29 = v24;
        v60 = v29;
        v41 = v20;
        v30 = v20;
        v61 = v30;
        objc_msgSend(v38, "performWithoutAnimation:", v57);
        v31 = (void *)MEMORY[0x1E0DC3F10];
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __70__SFUnifiedTabBarItemView__updateAccessoryButtonsAnimated_completion___block_invoke_5;
        v48[3] = &unk_1E21E36C0;
        v48[4] = self;
        v49 = v46;
        v50 = v43;
        v32 = v26;
        v51 = v26;
        v52 = v47;
        v53 = v27;
        v54 = v28;
        v55 = v29;
        v56 = v30;
        objc_msgSend(v31, "sf_animate:usingDefaultMotionWithOptions:animations:completion:", 1, 98, v48, 0);
        v6 = v44;
        if (v44)
        {
          v33 = dispatch_time(0, 200000000);
          dispatch_after(v33, MEMORY[0x1E0C80D38], v44);
        }

        v34 = v43;
        v20 = v41;
        v18 = v42;
        v21 = v40;
        v35 = v46;
        v24 = v39;
      }
      else
      {
        v36 = v25;
        v37 = (void *)v25;
        v35 = v46;
        v34 = v43;
        -[SFUnifiedTabBarItemView _setIndexes:ofAccessoryButtonTypes:visible:animated:](self, "_setIndexes:ofAccessoryButtonTypes:visible:animated:", v46, v43, 0, 0);
        -[SFUnifiedTabBarItemView _setIndexes:ofAccessoryButtonTypes:visible:animated:](self, "_setIndexes:ofAccessoryButtonTypes:visible:animated:", v36, v47, 0, 0);
        -[SFUnifiedTabBarItemView _setIndexes:ofAccessoryButtonTypes:visible:animated:](self, "_setIndexes:ofAccessoryButtonTypes:visible:animated:", v22, v18, 1, 0);
        -[SFUnifiedTabBarItemView _setIndexes:ofAccessoryButtonTypes:visible:animated:](self, "_setIndexes:ofAccessoryButtonTypes:visible:animated:", v24, v20, !self->_trailingButtonsHidden, 0);
        -[SFUnifiedTabBarItemView _layOutAccessoryButtons](self, "_layOutAccessoryButtons");
        v6 = v44;
        v32 = v37;
        if (v44)
          v44[2](v44);
      }

    }
  }

}

uint64_t __70__SFUnifiedTabBarItemView__updateAccessoryButtonsAnimated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showsAccessoryButtonOfType:", a2);
}

uint64_t __70__SFUnifiedTabBarItemView__updateAccessoryButtonsAnimated_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layOutAccessoryButtons");
}

uint64_t __70__SFUnifiedTabBarItemView__updateAccessoryButtonsAnimated_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __70__SFUnifiedTabBarItemView__updateAccessoryButtonsAnimated_completion___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setIndexes:ofAccessoryButtonTypes:visible:animated:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "_layOutIndexes:ofAccessoryButtonTypes:alongEdge:usingPresentationSize:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, 1);
  objc_msgSend(*(id *)(a1 + 32), "_setIndexes:ofAccessoryButtonTypes:visible:animated:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 0, 0);
  return objc_msgSend(*(id *)(a1 + 32), "_layOutIndexes:ofAccessoryButtonTypes:alongEdge:usingPresentationSize:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 1, 1);
}

uint64_t __70__SFUnifiedTabBarItemView__updateAccessoryButtonsAnimated_completion___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setIndexes:ofAccessoryButtonTypes:visible:animated:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, 1);
  objc_msgSend(*(id *)(a1 + 32), "_layOutIndexes:ofAccessoryButtonTypes:alongEdge:usingPresentationSize:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "_setIndexes:ofAccessoryButtonTypes:visible:animated:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 0, 1);
  objc_msgSend(*(id *)(a1 + 32), "_layOutIndexes:ofAccessoryButtonTypes:alongEdge:usingPresentationSize:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 1, 0);
  objc_msgSend(*(id *)(a1 + 32), "_setIndexes:ofAccessoryButtonTypes:visible:animated:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), 1, 1);
  objc_msgSend(*(id *)(a1 + 32), "_setIndexes:ofAccessoryButtonTypes:visible:animated:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1048) == 0, 1);
  return objc_msgSend(*(id *)(a1 + 32), "_layOutAccessoryButtons");
}

- (void)_layOutAccessoryButtons
{
  void *v3;
  double v4;
  double v5;
  id v6;

  -[SFUnifiedTabBarItemAccessoryButtonArrangement leadingButtonTypes](self->_accessoryButtonArrangement, "leadingButtonTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBarItemView _layOutIndexes:ofAccessoryButtonTypes:alongEdge:usingPresentationSize:](self, "_layOutIndexes:ofAccessoryButtonTypes:alongEdge:usingPresentationSize:", 0, v3, 0, 0);
  self->_leadingButtonsWidth = v4;

  -[SFUnifiedTabBarItemAccessoryButtonArrangement trailingButtonTypes](self->_accessoryButtonArrangement, "trailingButtonTypes");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBarItemView _layOutIndexes:ofAccessoryButtonTypes:alongEdge:usingPresentationSize:](self, "_layOutIndexes:ofAccessoryButtonTypes:alongEdge:usingPresentationSize:", 0, v6, 1, 0);
  self->_trailingButtonsWidth = v5;

}

- (double)_layOutIndexes:(id)a3 ofAccessoryButtonTypes:(id)a4 alongEdge:(int64_t)a5 usingPresentationSize:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v22;
  BOOL v23;
  _BOOL4 v24;
  double v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v30[5];
  id v31;
  uint64_t *v32;
  _QWORD *v33;
  CGFloat v34;
  uint64_t v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  BOOL v40;
  uint64_t v41;
  double *v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[5];
  CGRect v46;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  if (objc_msgSend(v11, "count"))
  {
    -[SFUnifiedBarItemView contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v13, "presentationLayer");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if (v14)
        v16 = (void *)v14;
      else
        v16 = v13;
      v17 = v16;

      v13 = v17;
    }
    objc_msgSend(v13, "bounds");
    x = v46.origin.x;
    y = v46.origin.y;
    width = v46.size.width;
    height = v46.size.height;
    v22 = CGRectGetHeight(v46);
    v23 = -[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout") == a5;
    v24 = a5 == 1;
    if (a5 == 1)
      objc_msgSend(v11, "lastObject");
    else
      objc_msgSend(v11, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "integerValue");

    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x2020000000;
    v45[3] = v27;
    v41 = 0;
    v42 = (double *)&v41;
    v43 = 0x2020000000;
    v44 = 0;
    -[SFUnifiedTabBarItemView _insetForAccessoryButtonOfType:](self, "_insetForAccessoryButtonOfType:", v27);
    v44 = v28;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __97__SFUnifiedTabBarItemView__layOutIndexes_ofAccessoryButtonTypes_alongEdge_usingPresentationSize___block_invoke;
    v30[3] = &unk_1E21E36E8;
    v34 = v22;
    v35 = v27;
    v30[4] = self;
    v32 = &v41;
    v33 = v45;
    v36 = x;
    v37 = y;
    v38 = width;
    v39 = height;
    v31 = v10;
    v40 = v23;
    objc_msgSend(v11, "enumerateObjectsWithOptions:usingBlock:", 2 * v24, v30);
    v25 = v42[3];

    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(v45, 8);

  }
  else
  {
    v25 = 0.0;
  }

  return v25;
}

void __97__SFUnifiedTabBarItemView__layOutIndexes_ofAccessoryButtonTypes_alongEdge_usingPresentationSize___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  double v18;
  id v19;

  v5 = objc_msgSend(a2, "integerValue");
  objc_msgSend(*(id *)(a1 + 32), "_viewForAccessoryButtonOfType:", v5);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_widthForAccessoryButtonOfType:", v5);
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "_heightForAccessoryButtonOfType:withWidth:defaultHeight:", v5);
  if (v5 != *(_QWORD *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "_spacingBetweenAccessoryButtonOfType:andButtonOfType:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), v5);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
  }
  v9 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  CGRectGetHeight(*(CGRect *)(a1 + 80));
  v10 = _SFRoundRectToPixels(v9);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                          + 24);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v5;
  v17 = *(void **)(a1 + 40);
  if (!v17 || objc_msgSend(v17, "containsIndex:", a3))
  {
    v18 = _SFFlipRectInCoordinateSpace(*(_BYTE *)(a1 + 112), v10, v12, v14, v16, *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88), *(CGFloat *)(a1 + 96), *(CGFloat *)(a1 + 104));
    objc_msgSend(v19, "ss_setUntransformedFrame:", _SFRoundRectToPixels(v18));
    objc_msgSend(v19, "layoutIfNeeded");
  }

}

- (void)_setIndexes:(id)a3 ofAccessoryButtonTypes:(id)a4 visible:(BOOL)a5 animated:(BOOL)a6
{
  _QWORD v6[5];
  BOOL v7;
  BOOL v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__SFUnifiedTabBarItemView__setIndexes_ofAccessoryButtonTypes_visible_animated___block_invoke;
  v6[3] = &unk_1E21E3738;
  v6[4] = self;
  v7 = a5;
  v8 = a6;
  objc_msgSend(a4, "enumerateObjectsAtIndexes:options:usingBlock:", a3, 0, v6);
}

void __79__SFUnifiedTabBarItemView__setIndexes_ofAccessoryButtonTypes_visible_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned int v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  char v16;
  _QWORD v17[4];
  id v18;
  double v19;
  double v20;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_viewForAccessoryButtonOfType:", objc_msgSend(v3, "integerValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(unsigned __int8 *)(a1 + 40);
  if (*(_BYTE *)(a1 + 40))
  {
    v6 = *(unsigned __int8 *)(a1 + 41);
    v7 = 1.0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_scaleForTransitioningAccessoryButtonOfType:", objc_msgSend(v3, "integerValue"));
    v7 = v8;
    v6 = *(unsigned __int8 *)(a1 + 41);
    if (!*(_BYTE *)(a1 + 40))
    {
      v9 = 0.0;
      goto LABEL_7;
    }
  }
  objc_msgSend(v4, "setHidden:", 0);
  if (*(_BYTE *)(a1 + 40))
    v9 = 0.1;
  else
    v9 = 0.0;
LABEL_7:
  v10 = (double)v5;
  v11 = (void *)MEMORY[0x1E0DC3F10];
  v12 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __79__SFUnifiedTabBarItemView__setIndexes_ofAccessoryButtonTypes_visible_animated___block_invoke_2;
  v17[3] = &unk_1E21E3710;
  v18 = v4;
  v19 = v10;
  v20 = v7;
  v14[0] = v12;
  v14[1] = 3221225472;
  v14[2] = __79__SFUnifiedTabBarItemView__setIndexes_ofAccessoryButtonTypes_visible_animated___block_invoke_3;
  v14[3] = &unk_1E21E2B10;
  v16 = *(_BYTE *)(a1 + 40);
  v15 = v18;
  v13 = v18;
  objc_msgSend(v11, "sf_animate:withDuration:delay:options:animations:completion:", v6 != 0, 50331746, v17, v14, 0.2, v9);

}

uint64_t __79__SFUnifiedTabBarItemView__setIndexes_ofAccessoryButtonTypes_visible_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
  CGAffineTransformMakeScale(&v5, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 48));
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __79__SFUnifiedTabBarItemView__setIndexes_ofAccessoryButtonTypes_visible_animated___block_invoke_3(uint64_t result)
{
  uint64_t v1;
  double v2;

  if (!*(_BYTE *)(result + 40))
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 32), "alpha");
    if (v2 == 0.0)
      return objc_msgSend(*(id *)(v1 + 32), "setHidden:", 1);
  }
  return result;
}

- (void)_setTrailingButtonsHidden:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  if (self->_trailingButtonsHidden != a3)
  {
    v3 = a3;
    self->_trailingButtonsHidden = a3;
    -[SFUnifiedTabBarItemAccessoryButtonArrangement trailingButtonTypes](self->_accessoryButtonArrangement, "trailingButtonTypes");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v6, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedTabBarItemView _setIndexes:ofAccessoryButtonTypes:visible:animated:](self, "_setIndexes:ofAccessoryButtonTypes:visible:animated:", v5, v6, !v3, 1);

  }
}

- (BOOL)_showsAccessoryButtonOfType:(int64_t)a3
{
  char v5;
  void *v6;
  void *v7;
  int64_t v8;
  char showsPinnedIndicator;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  double Width;
  double v20;
  double v21;
  double v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  char v28;
  char v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  uint64_t v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  unint64_t v44;
  _QWORD v45[5];
  char v46;
  CGRect v47;
  CGRect v48;

  v5 = -[SFUnifiedTabBarItemView showsSearchField](self, "showsSearchField");
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __55__SFUnifiedTabBarItemView__showsAccessoryButtonOfType___block_invoke;
  v45[3] = &unk_1E21E3760;
  v45[4] = self;
  v46 = v5;
  v6 = _Block_copy(v45);
  v7 = v6;
  switch(a3)
  {
    case 0:
      v10 = 1166;
      goto LABEL_5;
    case 1:
      -[SFWebExtensionButtonConfiguration webExtensionsController](self->_extensionButtonConfiguration, "webExtensionsController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "extensions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (self->_active)
        v14 = v5;
      else
        v14 = 1;
      showsPinnedIndicator = v14 ^ 1;
      if ((v14 & 1) != 0 || v13)
        goto LABEL_70;
      goto LABEL_18;
    case 2:
      if (self->_active)
        v15 = v5;
      else
        v15 = 1;
      if ((v15 & 1) != 0)
        goto LABEL_69;
LABEL_18:
      -[SFUnifiedTabBarItemView titleWhenActive](self, "titleWhenActive");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      showsPinnedIndicator = objc_msgSend(v16, "length") != 0;

      goto LABEL_70;
    case 3:
      if (self->_mediaStateIcon)
        v17 = v5;
      else
        v17 = 1;
      if ((v17 & 1) != 0)
        goto LABEL_69;
      -[SFUnifiedBarItemView contentView](self, "contentView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bounds");
      Width = CGRectGetWidth(v47);
      -[SFUnifiedTabBarItemTitleContainerView minimumWidthToShowTitle](self->_titleContainer, "minimumWidthToShowTitle");
      v21 = v20;
      -[SFUnifiedTabBarItemView _widthForAccessoryButtonOfType:](self, "_widthForAccessoryButtonOfType:", 3);
      showsPinnedIndicator = Width >= v21 + v22;

      goto LABEL_70;
    case 4:
      showsPinnedIndicator = (*((uint64_t (**)(void *))v6 + 2))(v6);
      goto LABEL_70;
    case 5:
      if (!self->_active
        || ((*((uint64_t (**)(void *))v6 + 2))(v6) & 1) != 0
        || !-[SFUnifiedTabBarItemView showsStopReloadButton](self, "showsStopReloadButton"))
      {
        goto LABEL_69;
      }
      if (self->_stopReloadButtonShowsStop)
        showsPinnedIndicator = 0;
      else
        showsPinnedIndicator = v5 ^ 1;
      goto LABEL_70;
    case 6:
      if (!self->_active
        || ((*((uint64_t (**)(void *))v6 + 2))(v6) & 1) != 0
        || !-[SFUnifiedTabBarItemView showsStopReloadButton](self, "showsStopReloadButton"))
      {
        goto LABEL_69;
      }
      v10 = 1164;
LABEL_5:
      if (*((_BYTE *)&self->super.super.super.super.super.super.isa + v10))
        showsPinnedIndicator = v5 ^ 1;
      else
        showsPinnedIndicator = 0;
      goto LABEL_70;
    case 7:
      v23 = -[SFWebExtensionButtonConfiguration activeExtensionCount](self->_extensionButtonConfiguration, "activeExtensionCount");
      showsPinnedIndicator = 0;
      if (self->_active)
        v24 = v5;
      else
        v24 = 1;
      if ((v24 & 1) != 0)
        goto LABEL_70;
      v25 = v23;
      if (!v23)
        goto LABEL_70;
      goto LABEL_46;
    case 8:
      v26 = -[SFWebExtensionButtonConfiguration activeExtensionCount](self->_extensionButtonConfiguration, "activeExtensionCount");
      showsPinnedIndicator = 0;
      if (self->_active)
        v27 = v5;
      else
        v27 = 1;
      if ((v27 & 1) == 0)
      {
        v25 = v26;
        if (v26 >= 2)
LABEL_46:
          showsPinnedIndicator = v25 <= -[SFUnifiedTabBarItemView _individualExtensionButtonLimit](self, "_individualExtensionButtonLimit");
      }
      goto LABEL_70;
    case 9:
      if (self->_active)
        v28 = v5;
      else
        v28 = 1;
      if ((v28 & 1) != 0)
        goto LABEL_69;
      if (-[SFWebExtensionButtonConfiguration alwaysShowMultipleExtensionsButton](self->_extensionButtonConfiguration, "alwaysShowMultipleExtensionsButton"))
      {
        showsPinnedIndicator = 1;
      }
      else
      {
        v44 = -[SFWebExtensionButtonConfiguration activeExtensionCount](self->_extensionButtonConfiguration, "activeExtensionCount");
        showsPinnedIndicator = v44 > -[SFUnifiedTabBarItemView _individualExtensionButtonLimit](self, "_individualExtensionButtonLimit");
      }
      goto LABEL_70;
    case 10:
    case 11:
      v8 = -[SFUnifiedTabBarAvailabilityItem buttonType](self->_currentAvailabilityItem, "buttonType");
      if (!self->_active)
        goto LABEL_69;
      showsPinnedIndicator = (v8 == a3) & ~v5;
      goto LABEL_70;
    case 12:
      if (self->_unread)
        v29 = v5;
      else
        v29 = 1;
      if ((v29 & 1) != 0)
        goto LABEL_69;
      -[SFUnifiedTabBarItemTitleContainerView minimumWidthToShowTitle](self->_titleContainer, "minimumWidthToShowTitle");
      v31 = v30;
      -[SFUnifiedTabBarItemView _widthForAccessoryButtonOfType:](self, "_widthForAccessoryButtonOfType:", 12);
      v33 = v31 + v32;
      if (self->_mediaStateIcon)
      {
        -[SFUnifiedTabBarItemView _widthForAccessoryButtonOfType:](self, "_widthForAccessoryButtonOfType:", 3);
        v33 = v33 + v34;
      }
      -[SFUnifiedTabBarItemView shareParticipants](self, "shareParticipants");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "count");

      if (!v36)
        goto LABEL_67;
      -[SFUnifiedTabBarItemView _widthForAccessoryButtonOfType:](self, "_widthForAccessoryButtonOfType:", 13);
      v33 = v33 + v37;
      -[SFUnifiedTabBarItemView _spacingBetweenAccessoryButtonOfType:andButtonOfType:](self, "_spacingBetweenAccessoryButtonOfType:andButtonOfType:", 13, 12);
      break;
    case 13:
      -[SFUnifiedTabBarItemView shareParticipants](self, "shareParticipants");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v39, "count"))
        v5 = 1;

      if ((v5 & 1) != 0)
        goto LABEL_69;
      -[SFUnifiedTabBarItemTitleContainerView minimumWidthToShowTitle](self->_titleContainer, "minimumWidthToShowTitle");
      v41 = v40;
      -[SFUnifiedTabBarItemView _widthForAccessoryButtonOfType:](self, "_widthForAccessoryButtonOfType:", 13);
      v33 = v41 + v42;
      if (!self->_mediaStateIcon)
        goto LABEL_67;
      -[SFUnifiedTabBarItemView _widthForAccessoryButtonOfType:](self, "_widthForAccessoryButtonOfType:", 3);
      break;
    case 14:
      if (self->_active)
        goto LABEL_69;
      showsPinnedIndicator = self->_showsPinnedIndicator;
      goto LABEL_70;
    default:
LABEL_69:
      showsPinnedIndicator = 0;
      goto LABEL_70;
  }
  v33 = v33 + v38;
LABEL_67:
  -[SFUnifiedTabBarItemView bounds](self, "bounds");
  showsPinnedIndicator = CGRectGetWidth(v48) >= v33;
LABEL_70:

  return showsPinnedIndicator;
}

uint64_t __55__SFUnifiedTabBarItemView__showsAccessoryButtonOfType___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  _BOOL8 v3;
  void *v4;

  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[1160] || !v2[1165])
    return 0;
  if ((objc_msgSend(v2, "showsSearchIcon") & 1) != 0)
    return 1;
  objc_msgSend(*(id *)(a1 + 32), "titleWhenActive");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    v3 = *(_BYTE *)(a1 + 40) != 0;
  else
    v3 = 1;

  return v3;
}

- (id)_viewForAccessoryButtonOfType:(int64_t)a3
{
  id v3;

  if ((unint64_t)a3 <= 0xE && ((0x73FFu >> a3) & 1) != 0)
    v3 = *(id *)((char *)&self->super.super.super.super.super.super.isa + *off_1E21E3780[a3]);
  else
    v3 = 0;
  return v3;
}

- (double)_widthForAccessoryButtonOfType:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v8;
  void *v9;
  double v10;
  double v11;

  switch(a3)
  {
    case 0:
      -[SFUnifiedBarItemView barMetrics](self, "barMetrics");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "tabCloseButtonWidth");
      goto LABEL_7;
    case 2:
      -[SFNavigationBarToggleButton intrinsicContentSize](self->_formatMenuButton, "intrinsicContentSize");
      return v11;
    case 4:
    case 5:
    case 6:
      -[UIButton intrinsicContentSize](self->_stopButton, "intrinsicContentSize");
      v5 = v4;
      -[UIButton intrinsicContentSize](self->_reloadButton, "intrinsicContentSize");
      return fmax(v5, v6);
    case 7:
    case 8:
      return 19.0 + 6.0 + 6.0;
    default:
      -[SFUnifiedTabBarItemView _viewForAccessoryButtonOfType:](self, "_viewForAccessoryButtonOfType:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "intrinsicContentSize");
LABEL_7:
      v8 = v10;

      return v8;
  }
}

- (double)_heightForAccessoryButtonOfType:(int64_t)a3 withWidth:(double)a4 defaultHeight:(double)a5
{
  return a5;
}

- (double)_insetForAccessoryButtonOfType:(int64_t)a3
{
  double result;

  result = 3.5;
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    return 0.0;
  return result;
}

- (double)_scaleForTransitioningAccessoryButtonOfType:(int64_t)a3
{
  double result;

  result = 1.0;
  if (a3 && a3 != 13)
  {
    if (a3 == 12)
      return 0.5;
    else
      +[SFUnifiedBarMetrics transitioningItemScale](SFUnifiedBarMetrics, "transitioningItemScale", 1.0);
  }
  return result;
}

- (double)_spacingBetweenAccessoryButtonOfType:(int64_t)a3 andButtonOfType:(int64_t)a4
{
  BOOL v4;
  double result;

  v4 = a4 == 12 && a3 == 13;
  result = 0.0;
  if (v4)
    return 6.0;
  return result;
}

- (id)_makeAccessoryButtonWithImage:(id)a3 scale:(int64_t)a4 action:(SEL)a5
{
  void *v7;
  void *v8;
  void *v9;

  -[SFUnifiedTabBarItemView _accessoryButtonConfigurationWithImage:scale:](self, "_accessoryButtonConfigurationWithImage:scale:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sf_applyContentSizeCategoryLimitsForToolbarButton");
  if (a5)
    objc_msgSend(v8, "addTarget:action:forControlEvents:", self, a5, 0x2000);
  -[SFUnifiedBarItemView contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v8);

  return v8;
}

- (id)_makeAccessoryButtonWithImage:(id)a3 action:(SEL)a4
{
  return -[SFUnifiedTabBarItemView _makeAccessoryButtonWithImage:scale:action:](self, "_makeAccessoryButtonWithImage:scale:action:", a3, 2, a4);
}

- (id)_accessoryButtonConfigurationWithImage:(id)a3 scale:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0DC3520];
  v6 = a3;
  objc_msgSend(v5, "plainButtonConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "background");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

  objc_msgSend(v7, "setImage:", v6);
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreferredSymbolConfigurationForImage:", v10);

  objc_msgSend(v7, "setContentInsets:", 6.0, 6.0, 6.0, 6.0);
  return v7;
}

- (id)_makeMediaStateMuteButton
{
  void *v2;
  void *v3;

  -[SFUnifiedTabBarItemView _makeAccessoryButtonWithImage:action:](self, "_makeAccessoryButtonWithImage:action:", 0, sel__mediaStateMuteButtonTapped);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintColor:", v3);

  return v2;
}

- (id)_closeButtonConfiguration
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark.square.fill"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBarItemView _accessoryButtonConfigurationWithImage:scale:](self, "_accessoryButtonConfigurationWithImage:scale:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_temporarilyCoalesceAccessoryButtonUpdates
{
  void *v3;
  NSTimer *v4;
  NSTimer *accessoryButtonUpdateTimer;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  if (self->_active && !self->_accessoryButtonUpdateTimer)
  {
    objc_initWeak(&location, self);
    v3 = (void *)MEMORY[0x1E0C99E88];
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __69__SFUnifiedTabBarItemView__temporarilyCoalesceAccessoryButtonUpdates__block_invoke;
    v10 = &unk_1E21E2168;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v3, "timerWithTimeInterval:repeats:block:", 0, &v7, 0.2);
    v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    accessoryButtonUpdateTimer = self->_accessoryButtonUpdateTimer;
    self->_accessoryButtonUpdateTimer = v4;

    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop", v7, v8, v9, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addTimer:forMode:", self->_accessoryButtonUpdateTimer, *MEMORY[0x1E0C99860]);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __69__SFUnifiedTabBarItemView__temporarilyCoalesceAccessoryButtonUpdates__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_stopAccessoryButtonUpdateTimer");
    objc_msgSend(v2, "_setNeedsAnimatedAccessoryButtonUpdate");
    WeakRetained = v2;
  }

}

- (void)_stopAccessoryButtonUpdateTimer
{
  NSTimer *accessoryButtonUpdateTimer;

  -[NSTimer invalidate](self->_accessoryButtonUpdateTimer, "invalidate");
  accessoryButtonUpdateTimer = self->_accessoryButtonUpdateTimer;
  self->_accessoryButtonUpdateTimer = 0;

}

- (BOOL)_coalescingAccessoryButtonUpdates
{
  return self->_accessoryButtonUpdateTimer != 0;
}

- (void)_startReloadButtonExpirationTimer
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  NSTimer *v7;
  NSTimer *reloadButtonExpirationTimer;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  -[SFUnifiedTabBarItemView _stopReloadButtonExpirationTimer](self, "_stopReloadButtonExpirationTimer");
  -[NSDate dateByAddingTimeInterval:](self->_lastReloadDate, "dateByAddingTimeInterval:", 480.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceNow");
  if (v4 > 0.0)
  {
    v5 = v4;
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x1E0C99E88];
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __60__SFUnifiedTabBarItemView__startReloadButtonExpirationTimer__block_invoke;
    v13 = &unk_1E21E2168;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v6, "timerWithTimeInterval:repeats:block:", 0, &v10, v5);
    v7 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    reloadButtonExpirationTimer = self->_reloadButtonExpirationTimer;
    self->_reloadButtonExpirationTimer = v7;

    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop", v10, v11, v12, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addTimer:forMode:", self->_reloadButtonExpirationTimer, *MEMORY[0x1E0C99860]);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

void __60__SFUnifiedTabBarItemView__startReloadButtonExpirationTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_setNeedsAnimatedAccessoryButtonUpdate");
    objc_msgSend(v2, "_stopReloadButtonExpirationTimer");
    WeakRetained = v2;
  }

}

- (void)_stopReloadButtonExpirationTimer
{
  NSTimer *reloadButtonExpirationTimer;

  -[NSTimer invalidate](self->_reloadButtonExpirationTimer, "invalidate");
  reloadButtonExpirationTimer = self->_reloadButtonExpirationTimer;
  self->_reloadButtonExpirationTimer = 0;

}

- (id)test_reloadButtonExpirationTimer
{
  return self->_reloadButtonExpirationTimer;
}

- (unint64_t)_individualExtensionButtonLimit
{
  double Width;
  double v4;
  CGRect v6;

  -[SFUnifiedTabBarItemView bounds](self, "bounds");
  Width = CGRectGetWidth(v6);
  -[SFUnifiedBarItemView squishedInset](self, "squishedInset");
  if (Width + v4 < 330.0)
    return 1;
  else
    return 2;
}

- (BOOL)_availabilityButtonsReplaceFormatMenuButton
{
  return !-[SFUnifiedTabBarItemAccessoryButtonArrangement containsButtonType:](self->_accessoryButtonArrangement, "containsButtonType:", 1);
}

- (void)beginTransitioningSearchField
{
  -[SFUnifiedTabBarItemTitleContainerView beginTransitioningSearchField](self->_titleContainer, "beginTransitioningSearchField");
}

- (void)endTransitioningSearchField
{
  -[SFUnifiedTabBarItemTitleContainerView endTransitioningSearchField](self->_titleContainer, "endTransitioningSearchField");
}

- (void)setSquishedInset:(double)a3
{
  double v5;
  objc_super v6;

  -[SFUnifiedBarItemView squishedInset](self, "squishedInset");
  if (v5 != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)SFUnifiedTabBarItemView;
    -[SFUnifiedBarItemView setSquishedInset:](&v6, sel_setSquishedInset_, a3);
    -[SFUnifiedTabBarItemView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_setTitleContainerMasked:(BOOL)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[5];
  BOOL v12;
  _QWORD v13[4];
  id v14;
  SFUnifiedTabBarItemView *v15;

  if (self->_titleContainerMasked != a3)
  {
    self->_titleContainerMasked = a3;
    v5 = MEMORY[0x1E0C809B0];
    if (a3)
    {
      SFFadeOutImage(-[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout"), 9.5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v6);
      -[SFUnifiedTabBarItemTitleContainerView setMaskView:](self->_titleContainer, "setMaskView:", v7);
      v8 = (void *)MEMORY[0x1E0DC3F10];
      v13[0] = v5;
      v13[1] = 3221225472;
      v13[2] = __52__SFUnifiedTabBarItemView__setTitleContainerMasked___block_invoke;
      v13[3] = &unk_1E21E2258;
      v14 = v7;
      v15 = self;
      v9 = v7;
      objc_msgSend(v8, "performWithoutAnimation:", v13);

    }
    v10[4] = self;
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __52__SFUnifiedTabBarItemView__setTitleContainerMasked___block_invoke_2;
    v11[3] = &unk_1E21E2B38;
    v11[4] = self;
    v12 = a3;
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __52__SFUnifiedTabBarItemView__setTitleContainerMasked___block_invoke_3;
    v10[3] = &unk_1E21E2190;
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 50331648, v11, v10);
  }
}

uint64_t __52__SFUnifiedTabBarItemView__setTitleContainerMasked___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", v2);

  return objc_msgSend(*(id *)(a1 + 40), "_layOutTitleContainerMask");
}

void __52__SFUnifiedTabBarItemView__setTitleContainerMasked___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;

  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(_BYTE *)(a1 + 40))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 904), "maskView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  if (!v2)
}

uint64_t __52__SFUnifiedTabBarItemView__setTitleContainerMasked___block_invoke_3(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 1002))
    return objc_msgSend(*(id *)(v1 + 904), "setMaskView:", 0);
  return result;
}

- (void)_layOutTitleContainerMask
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double trailingButtonsWidth;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  id v20;

  -[SFUnifiedTabBarItemTitleContainerView maskView](self->_titleContainer, "maskView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v20 = v3;
    -[SFUnifiedTabBarItemTitleContainerView bounds](self->_titleContainer, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    trailingButtonsWidth = self->_trailingButtonsWidth;
    -[SFUnifiedBarItemView squishedInset](self, "squishedInset");
    v14 = v9 + trailingButtonsWidth - v13 + -3.0;
    if (!-[SFUnifiedTabBarItemView _iconVisibility](self, "_iconVisibility"))
    {
      -[SFUnifiedTabBarItemView _squishedInsetToHideCloseButton](self, "_squishedInsetToHideCloseButton");
      v14 = v14 + v15;
    }
    -[SFUnifiedTabBarItemTitleContainerView bounds](self->_titleContainer, "bounds");
    objc_msgSend(v20, "setFrame:", _SFFlipRectInCoordinateSpace(!-[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout"), v5, v7, v14, v11, v16, v17, v18, v19));
    v3 = v20;
  }

}

- (double)_squishedInsetToHideCloseButton
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  -[SFUnifiedBarItemView barMetrics](self, "barMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabCloseButtonWidth");
  v4 = v3;
  objc_msgSend(v2, "leadingTabIconInset");
  v6 = v4 - v5;

  return v6;
}

- (double)_closeButtonAlphaForSquishedInset
{
  double v3;
  double v4;
  double v5;

  -[SFUnifiedBarItemView squishedInset](self, "squishedInset");
  v4 = v3;
  -[SFUnifiedTabBarItemView _squishedInsetToHideCloseButton](self, "_squishedInsetToHideCloseButton");
  return fmax(fmin(_SFUninterpolate(v4, v5 * 0.5, 0.0), 1.0), 0.0);
}

- (double)_squishedInsetToHideTrailingButtons
{
  int64_t v3;
  double result;
  double v5;

  v3 = -[SFUnifiedTabBarItemView _iconVisibility](self, "_iconVisibility");
  result = 8.0;
  if (!v3)
  {
    -[SFUnifiedTabBarItemView _squishedInsetToHideCloseButton](self, "_squishedInsetToHideCloseButton", 8.0);
    return v5 + 8.0;
  }
  return result;
}

- (void)fluidProgressViewWillShowProgress:(id)a3
{
  self->_showingProgress = 1;
  -[SFUnifiedTabBarItemView _updateShowsProgressView](self, "_updateShowsProgressView", a3);
}

- (void)fluidProgressViewDidShowProgress:(id)a3
{
  self->_showingProgress = 0;
  -[SFUnifiedTabBarItemView _updateShowsProgressView](self, "_updateShowsProgressView", a3);
}

- (BOOL)_scribbleInteractionIsEnabled:(id)a3
{
  return self->_active;
}

- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  void *v7;
  NSObject *v8;
  char v9;
  CGPoint v11;
  CGRect v12;

  y = a4.y;
  x = a4.x;
  -[SFUnifiedBarItemView hitTest:withEvent:](self, "hitTest:withEvent:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = WBS_LOG_CHANNEL_PREFIXPencilInput();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SFUnifiedTabBarItemView _scribbleInteraction:shouldBeginAtLocation:].cold.1(v8);
  if (-[SFUnifiedTabBarItemView showsSearchField](self, "showsSearchField"))
  {
    objc_opt_class();
    v9 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    -[SFUnifiedTabBarItemTitleContainerView frame](self->_titleContainer, "frame");
    v11.x = x;
    v11.y = y;
    v9 = CGRectContainsPoint(v12, v11);
  }

  return v9 & 1;
}

- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4
{
  return 1;
}

- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4
{
  NSObject *v5;

  v5 = WBS_LOG_CHANNEL_PREFIXPencilInput();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SFUnifiedTabBarItemView _scribbleInteraction:willBeginWritingInElement:].cold.1();
  -[SFUnifiedTabBarItemTitleContainerView setSuppressesText:](self->_titleContainer, "setSuppressesText:", 1);
}

- (void)_scribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4
{
  NSObject *v5;

  v5 = WBS_LOG_CHANNEL_PREFIXPencilInput();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SFUnifiedTabBarItemView _scribbleInteraction:didFinishWritingInElement:].cold.1();
  -[SFUnifiedTabBarItemTitleContainerView setSuppressesText:](self->_titleContainer, "setSuppressesText:", 0);
}

- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
  void (**v6)(id, void *, uint64_t);
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *, uint64_t))a5;
  v7 = WBS_LOG_CHANNEL_PREFIXPencilInput();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[SFUnifiedTabBarItemView _scribbleInteraction:requestElementsInRect:completion:].cold.1();
  -[SFUnifiedTabBarItemView searchField](self, "searchField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isFirstResponder"))
    v9 = 0;
  else
    v9 = 0x7FFFFFFFFFFFFFFFLL;

  v11[0] = CFSTR("pencilTextInputElementIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v10, v9);

}

- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  id WeakRetained;
  _QWORD v12[5];
  id v13;

  v8 = a4;
  v9 = a6;
  v10 = WBS_LOG_CHANNEL_PREFIXPencilInput();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[SFUnifiedTabBarItemView _scribbleInteraction:focusElement:initialFocusSelectionReferencePoint:completion:].cold.1();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v8, "isEqual:", CFSTR("pencilTextInputElementIdentifier")) & 1) != 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __108__SFUnifiedTabBarItemView__scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke;
    v12[3] = &unk_1E21E2E28;
    v12[4] = self;
    v13 = v9;
    objc_msgSend(WeakRetained, "tabBarItemViewDidRequestFocusForPencilInput:completionHandler:", self, v12);

  }
  else
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

void __108__SFUnifiedTabBarItemView__scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  v2 = WBS_LOG_CHANNEL_PREFIXPencilInput();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __108__SFUnifiedTabBarItemView__scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke_cold_1();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "searchField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

}

- (void)availabilityDisplayController:(id)a3 didUpdateWithState:(int64_t)a4
{
  id WeakRetained;
  char v6;
  SFUnifiedTabBarAvailabilityItem *v7;
  void *v8;
  SFUnifiedTabBarAvailabilityItem *v9;
  SFUnifiedTabBarAvailabilityItem *v10;
  SFUnifiedTabBarAvailabilityItem *currentAvailabilityItem;
  SFUnifiedTabBarAvailabilityItem *v12;
  SFUnifiedTabBarAvailabilityItem *v13;
  SFUnifiedTabBarItemTitleContainerView *titleContainer;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _BOOL4 v19;
  id v20;

  v20 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_squishedTitleContainer);
  if (!objc_msgSend(v20, "isDisplaying"))
  {
    currentAvailabilityItem = self->_currentAvailabilityItem;
    self->_currentAvailabilityItem = 0;

    -[SFUnifiedTabBarItemTitleContainerView dismissAvailabilityLabelAnimated:withCompletionHandler:](self->_titleContainer, "dismissAvailabilityLabelAnimated:withCompletionHandler:", 1, 0);
    objc_msgSend(WeakRetained, "dismissAvailabilityLabelAnimated:withCompletionHandler:", 1, 0);
LABEL_11:
    -[SFUnifiedTabBarItemView _updateFormatMenuButtonImage](self, "_updateFormatMenuButtonImage");
    goto LABEL_12;
  }
  v6 = objc_msgSend(v20, "currentOptions");
  if ((v6 & 0x20) != 0)
  {
    -[SFUnifiedTabBarItemView makeReaderAvailabilityAction](self, "makeReaderAvailabilityAction");
    v12 = (SFUnifiedTabBarAvailabilityItem *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v13 = self->_currentAvailabilityItem;
    self->_currentAvailabilityItem = v12;

    objc_msgSend(v20, "currentLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedTabBarAvailabilityItem setTitle:](self->_currentAvailabilityItem, "setTitle:", v8);
    goto LABEL_9;
  }
  if ((v6 & 0x40) != 0)
  {
    -[SFUnifiedTabBarItemView makeTranslationAvailabilityAction](self, "makeTranslationAvailabilityAction");
    v12 = (SFUnifiedTabBarAvailabilityItem *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v7 = [SFUnifiedTabBarAvailabilityItem alloc];
  objc_msgSend(v20, "currentLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SFUnifiedTabBarAvailabilityItem initWithTitle:](v7, "initWithTitle:", v8);
  v10 = self->_currentAvailabilityItem;
  self->_currentAvailabilityItem = v9;

LABEL_9:
  titleContainer = self->_titleContainer;
  -[SFUnifiedTabBarAvailabilityItem title](self->_currentAvailabilityItem, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBarItemTitleContainerView presentAvailabilityLabelWithText:](titleContainer, "presentAvailabilityLabelWithText:", v15);

  -[SFUnifiedTabBarAvailabilityItem title](self->_currentAvailabilityItem, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "presentAvailabilityLabelWithText:", v16);

  -[SFUnifiedTabBarAvailabilityItem image](self->_currentAvailabilityItem, "image");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    v19 = -[SFUnifiedTabBarItemView _availabilityButtonsReplaceFormatMenuButton](self, "_availabilityButtonsReplaceFormatMenuButton");

    if (v19)
      goto LABEL_11;
  }
LABEL_12:

}

- (id)availabilityDisplayController:(id)a3 determineBestLabelsForPresentation:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  _QWORD v16[5];

  v5 = a4;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __92__SFUnifiedTabBarItemView_availabilityDisplayController_determineBestLabelsForPresentation___block_invoke;
  v16[3] = &unk_1E21E2050;
  v16[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v16);
  v6 = objc_msgSend(v5, "count");
  v7 = v6 - 1;
  if (v6 == 1)
  {
LABEL_9:
    objc_msgSend(v5, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");
      if (!v10)
        break;
      v11 = v10;
      v12 = 0;
      while (1)
      {
        objc_msgSend(v9, "textForOptionsAtIndex:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[SFUnifiedTabBarItemTitleContainerView requiresTruncationToDisplayAvailabilityLabel:](self->_titleContainer, "requiresTruncationToDisplayAvailabilityLabel:", v13);

        if (v14)
          break;
        if (v11 == ++v12)
          goto LABEL_10;
      }

      if (++v8 == v7)
        goto LABEL_9;
    }
  }
LABEL_10:

  return v9;
}

uint64_t __92__SFUnifiedTabBarItemView_availabilityDisplayController_determineBestLabelsForPresentation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_hover:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  _BOOL8 v15;
  uint64_t v16;
  _QWORD v17[5];
  BOOL v18;
  _QWORD v19[5];
  CGPoint v20;
  CGRect v21;

  v4 = a3;
  if ((unint64_t)(objc_msgSend(v4, "state") - 1) > 1)
  {
    v15 = 0;
  }
  else
  {
    -[SFUnifiedTabBarItemView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v4, "locationInView:", self);
    v20.x = v13;
    v20.y = v14;
    v21.origin.x = v6;
    v21.origin.y = v8;
    v21.size.width = v10;
    v21.size.height = v12;
    v15 = CGRectContainsPoint(v21, v20);
  }
  -[SFUnifiedTabBarItemView setHovering:](self, "setHovering:", v15);
  v16 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __34__SFUnifiedTabBarItemView__hover___block_invoke;
  v19[3] = &unk_1E21E2050;
  v19[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v19);
  v17[0] = v16;
  v17[1] = 3221225472;
  v17[2] = __34__SFUnifiedTabBarItemView__hover___block_invoke_2;
  v17[3] = &unk_1E21E2B38;
  v17[4] = self;
  v18 = -[SFUnifiedTabBarItemView _showsCloseButtonOnHover](self, "_showsCloseButtonOnHover");
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v17, 0, 0.2, 0.0);

}

uint64_t __34__SFUnifiedTabBarItemView__hover___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCloseButtonForHoverPosition");
}

uint64_t __34__SFUnifiedTabBarItemView__hover___block_invoke_2(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  _BOOL8 v16;
  CGRect v18;
  CGRect v19;

  objc_msgSend(*(id *)(a1 + 32), "_updatePlatterEffect");
  LOBYTE(v2) = *(_BYTE *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setAlpha:", (double)v2);
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 904), "iconFrame");
  objc_msgSend(v3, "convertRect:fromView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 904));
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "frame");
    v19.origin.x = v12;
    v19.origin.y = v13;
    v19.size.width = v14;
    v19.size.height = v15;
    v18.origin.x = v5;
    v18.origin.y = v7;
    v18.size.width = v9;
    v18.size.height = v11;
    v16 = CGRectIntersectsRect(v18, v19);
  }
  else
  {
    v16 = 0;
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 904), "setHidesIconForHover:", v16);
}

- (void)setHovering:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  id WeakRetained;
  objc_super v7;

  v3 = a3;
  if (-[SFUnifiedBarItemView isHovering](self, "isHovering") != a3)
  {
    v5 = -[SFUnifiedTabBarItemView showsStopReloadButton](self, "showsStopReloadButton");
    v7.receiver = self;
    v7.super_class = (Class)SFUnifiedTabBarItemView;
    -[SFUnifiedBarItemView setHovering:](&v7, sel_setHovering_, v3);
    if (v5 != -[SFUnifiedTabBarItemView showsStopReloadButton](self, "showsStopReloadButton"))
      -[SFUnifiedTabBarItemView _setNeedsAnimatedAccessoryButtonUpdate](self, "_setNeedsAnimatedAccessoryButtonUpdate");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "tabBarItemView:didUpdateHovering:", self, v3);

  }
}

- (BOOL)_showsCloseButtonOnHover
{
  int v3;
  double v4;
  double v5;
  double v6;

  v3 = -[SFUnifiedBarItemView isHovering](self, "isHovering");
  if (v3)
  {
    if (!-[SFUnifiedTabBarItemTitleContainerView isNarrow](self->_titleContainer, "isNarrow")
      || (v3 = -[SFUnifiedTabBarItemView _commandPressed](self, "_commandPressed")) != 0)
    {
      if (self->_active
        && (-[SFUnifiedBarItemView squishedInset](self, "squishedInset"),
            v5 = v4,
            -[SFUnifiedTabBarItemView _squishedInsetToHideCloseButton](self, "_squishedInsetToHideCloseButton"),
            v5 <= v6)
        || -[SFUnifiedBarItemView isOccluded](self, "isOccluded"))
      {
        LOBYTE(v3) = 0;
      }
      else
      {
        LOBYTE(v3) = -[SFUnifiedTabBarItemView isSelected](self, "isSelected") ^ 1;
      }
    }
  }
  return v3;
}

- (BOOL)_commandPressed
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "sf_currentKeyboardModifierFlags") >> 20) & 1;

  return v3;
}

- (void)_updateCloseButtonForHoverPosition
{
  void *v3;
  double v4;
  CGFloat v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat Height;
  CGRect v16;

  -[SFUnifiedBarItemView barMetrics](self, "barMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabCloseButtonWidth");
  v5 = v4;

  -[SFUnifiedBarItemView contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v16.origin.x = v8;
  v16.origin.y = v10;
  v16.size.width = v12;
  v16.size.height = v14;
  Height = CGRectGetHeight(v16);
  -[SFUnifiedTabBarItemViewCloseButton setFrame:](self->_closeButtonForHover, "setFrame:", _SFFlipRectInCoordinateSpace(!-[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout"), 0.0, 0.0, v5, Height, v8, v10, v12, v14));
}

- (id)pointerRegionIdentifierForInteractionLocation:(CGPoint)a3
{
  double y;
  double x;
  SFUnifiedTabBarItemViewCloseButton *v6;
  SFUnifiedTabBarItemViewCloseButton *v7;
  char isKindOfClass;
  SFUnifiedTabBarPointerRegionIdentifier *v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;

  y = a3.y;
  x = a3.x;
  -[SFUnifiedBarItemView hitTest:withEvent:](self, "hitTest:withEvent:", 0);
  v6 = (SFUnifiedTabBarItemViewCloseButton *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 == self->_closeButton
    && (-[SFUnifiedTabBarItemViewCloseButton convertPoint:fromView:](v6, "convertPoint:fromView:", self, x, y),
        !-[SFUnifiedTabBarItemViewCloseButton pointInsideForPointer:](v7, "pointInsideForPointer:"))
    || v7 == self->_closeButtonForHover
    && (-[SFUnifiedTabBarItemViewCloseButton convertPoint:fromView:](v7, "convertPoint:fromView:", self, x, y),
        !-[SFUnifiedTabBarItemViewCloseButton pointInsideForPointer:](v7, "pointInsideForPointer:")))
  {
    v9 = 0;
    goto LABEL_16;
  }
  if (v7 == self->_closeButton)
  {
    v13 = 1;
LABEL_15:
    v9 = objc_alloc_init(SFUnifiedTabBarPointerRegionIdentifier);
    -[SFUnifiedTabBarPointerRegionIdentifier setPointerStyle:](v9, "setPointerStyle:", v13);
    -[SFUnifiedTabBarPointerRegionIdentifier setViewForPreview:](v9, "setViewForPreview:", v7);
    goto LABEL_16;
  }
  if (v7 == self->_closeButtonForHover)
  {
    v13 = 2;
    goto LABEL_15;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v9 = 0;
  if (v7 != (SFUnifiedTabBarItemViewCloseButton *)self && (isKindOfClass & 1) != 0)
  {
    -[SFUnifiedTabBarItemViewCloseButton superview](v7, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v11 = objc_opt_isKindOfClass();

    if ((v11 & 1) != 0)
    {
      -[SFUnifiedTabBarItemViewCloseButton superview](v7, "superview");
      v12 = objc_claimAutoreleasedReturnValue();

      v13 = 0;
      v7 = (SFUnifiedTabBarItemViewCloseButton *)v12;
    }
    else
    {
      v13 = 0;
    }
    goto LABEL_15;
  }
LABEL_16:

  return v9;
}

- (BOOL)canBecomeFocused
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(WeakRetained, "tabBarItemViewCanBecomeFocused:", self);
  else
    v4 = 0;

  return v4;
}

- (SFUnifiedTabBarItemViewDelegate)delegate
{
  return (SFUnifiedTabBarItemViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)showsVoiceSearchButton
{
  return self->_showsVoiceSearchButton;
}

- (BOOL)showsReaderIcon
{
  return self->_showsReaderIcon;
}

- (BOOL)showsTranslationIcon
{
  return self->_showsTranslationIcon;
}

- (BOOL)showsSiriReaderPlayingIcon
{
  return self->_showsSiriReaderPlayingIcon;
}

- (BOOL)stopReloadButtonShowsStop
{
  return self->_stopReloadButtonShowsStop;
}

- (NSDate)lastReloadDate
{
  return self->_lastReloadDate;
}

- (unint64_t)mediaStateIcon
{
  return self->_mediaStateIcon;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)showsCloseButton
{
  return self->_showsCloseButton;
}

- (SFMenuConfiguring)formatMenuButtonConfigurator
{
  return (SFMenuConfiguring *)objc_loadWeakRetained((id *)&self->_formatMenuButtonConfigurator);
}

- (int64_t)accessoryButtonLayout
{
  return self->_accessoryButtonLayout;
}

- (SFUnifiedTabBarItemTitleContainerView)squishedTitleContainer
{
  return (SFUnifiedTabBarItemTitleContainerView *)objc_loadWeakRetained((id *)&self->_squishedTitleContainer);
}

- (BOOL)showsSquishedAccessoryViews
{
  return self->_showsSquishedAccessoryViews;
}

- (SFWebExtensionButtonConfiguration)extensionButtonConfiguration
{
  return self->_extensionButtonConfiguration;
}

- (unint64_t)menuButtonBadges
{
  return self->_menuButtonBadges;
}

- (BOOL)showsBadgeOnExtensionsButton
{
  return self->_showsBadgeOnExtensionsButton;
}

- (UIButton)multipleExtensionsButton
{
  return self->_multipleExtensionsButton;
}

- (UIButton)firstExtensionButton
{
  return self->_firstExtensionButton;
}

- (UIButton)secondExtensionButton
{
  return self->_secondExtensionButton;
}

- (BOOL)isUnread
{
  return self->_unread;
}

- (BOOL)showsPinnedIndicator
{
  return self->_showsPinnedIndicator;
}

- (BOOL)hasHiddenElements
{
  return self->_hasHiddenElements;
}

- (SFURLFieldOverlayConfiguration)overlayConfiguration
{
  return self->_overlayConfiguration;
}

- (SFURLFieldOverlayConfiguration)overlayNarrowConfiguration
{
  return self->_overlayNarrowConfiguration;
}

- (void)setOverlayNarrowConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_overlayNarrowConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayNarrowConfiguration, 0);
  objc_storeStrong((id *)&self->_overlayConfiguration, 0);
  objc_storeStrong((id *)&self->_secondExtensionButton, 0);
  objc_storeStrong((id *)&self->_firstExtensionButton, 0);
  objc_storeStrong((id *)&self->_multipleExtensionsButton, 0);
  objc_storeStrong((id *)&self->_extensionButtonConfiguration, 0);
  objc_destroyWeak((id *)&self->_squishedTitleContainer);
  objc_destroyWeak((id *)&self->_formatMenuButtonConfigurator);
  objc_storeStrong((id *)&self->_lastReloadDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedUUIDForAnnotation, 0);
  objc_storeStrong((id *)&self->_availabilityDisplayController, 0);
  objc_storeStrong((id *)&self->_currentAvailabilityItem, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_closeButtonForHover, 0);
  objc_destroyWeak((id *)&self->_fluidProgressController);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_participantsView, 0);
  objc_storeStrong((id *)&self->_unreadIndicator, 0);
  objc_storeStrong((id *)&self->_multipleExtensionsButtonContainer, 0);
  objc_storeStrong((id *)&self->_secondExtensionButtonContainer, 0);
  objc_storeStrong((id *)&self->_firstExtensionButtonContainer, 0);
  objc_storeStrong((id *)&self->_accessoryButtonUpdateTimer, 0);
  objc_storeStrong((id *)&self->_accessoryButtonArrangement, 0);
  objc_storeStrong((id *)&self->_pinnedIndicator, 0);
  objc_storeStrong((id *)&self->_stopButton, 0);
  objc_storeStrong((id *)&self->_reloadButtonExpirationTimer, 0);
  objc_storeStrong((id *)&self->_reloadButton, 0);
  objc_storeStrong((id *)&self->_voiceSearchButton, 0);
  objc_storeStrong((id *)&self->_mediaStateMuteButton, 0);
  objc_storeStrong((id *)&self->_downloadProgressView, 0);
  objc_storeStrong((id *)&self->_formatMenuButton, 0);
  objc_storeStrong((id *)&self->_menuButton, 0);
  objc_storeStrong((id *)&self->_moreMenuButton, 0);
  objc_storeStrong((id *)&self->_moreMenuButtonContainer, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_titleContainer, 0);
}

- (void)_scribbleInteraction:(void *)a1 shouldBeginAtLocation:.cold.1(void *a1)
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_debug_impl(&dword_18B7B2000, v1, OS_LOG_TYPE_DEBUG, "Should begin Scribble interaction in <%{public}@>", (uint8_t *)&v4, 0xCu);

}

- (void)_scribbleInteraction:willBeginWritingInElement:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_18B7B2000, v0, v1, "Will begin writing for Scribble interaction", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_scribbleInteraction:didFinishWritingInElement:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_18B7B2000, v0, v1, "Did finish writing for Scribble interaction", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_scribbleInteraction:requestElementsInRect:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_18B7B2000, v0, v1, "Requesting elements for Scribble interaction", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_scribbleInteraction:focusElement:initialFocusSelectionReferencePoint:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_18B7B2000, v0, v1, "Focusing element for Scribble interaction", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __108__SFUnifiedTabBarItemView__scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_18B7B2000, v0, v1, "Calling completionBlock for focusing Scribble element", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
