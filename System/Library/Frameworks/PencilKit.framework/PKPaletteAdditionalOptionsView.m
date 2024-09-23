@implementation PKPaletteAdditionalOptionsView

- (PKPaletteAdditionalOptionsView)initWithFrame:(CGRect)a3
{
  PKPaletteAdditionalOptionsView *v3;
  PKPaletteAdditionalOptionsView *v4;
  void *v5;
  char v6;
  PKUIPencilInteractionObserver *v7;
  uint64_t v8;
  PKUIPencilInteractionObserver *v9;
  PKUIPencilInteractionObserver *pencilInteractionObserver;
  PKAutoRefineSettingsObserver *v11;
  PKAutoRefineSettingsObserver *v12;
  PKAutoRefineSettingsObserver *autoRefineSettingsObserver;
  UIStackView *v14;
  UIStackView *contentStackView;
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
  PKPaletteButtonGroupView *v29;
  PKPaletteButtonGroupView *keyboardButtonGroupView;
  void *v31;
  UIStackView *v32;
  UIStackView *textShapeStackView;
  uint64_t v34;
  PKPaletteButton *textButton;
  void *v36;
  uint64_t v37;
  NSLayoutConstraint *textButtonWidthConstraint;
  void *v39;
  uint64_t v40;
  NSLayoutConstraint *textButtonHeightConstraint;
  double v42;
  double v43;
  uint64_t v44;
  PKPaletteButton *shapeButton;
  void *v46;
  uint64_t v47;
  NSLayoutConstraint *shapeButtonWidthConstraint;
  void *v49;
  uint64_t v50;
  NSLayoutConstraint *shapeButtonHeightConstraint;
  double v52;
  double v53;
  uint64_t v54;
  PKPaletteButton *ellipsisButton;
  void *v56;
  uint64_t v57;
  NSLayoutConstraint *ellipsisButtonWidthConstraint;
  void *v59;
  uint64_t v60;
  NSLayoutConstraint *ellipsisButtonHeightConstraint;
  double v62;
  double v63;
  void *v64;
  void *v65;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[4];
  id v75;
  id location;
  objc_super v77;
  _QWORD v78[6];
  _QWORD v79[6];

  v79[4] = *MEMORY[0x1E0C80C00];
  v77.receiver = self;
  v77.super_class = (Class)PKPaletteAdditionalOptionsView;
  v3 = -[PKPaletteAdditionalOptionsView initWithFrame:](&v77, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_scalingFactor = 1.0;
    -[PKPaletteAdditionalOptionsView traitCollection](v3, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "userInterfaceIdiom"))
      v6 = objc_msgSend(MEMORY[0x1E0DC3AC8], "prefersPencilOnlyDrawing") ^ 1;
    else
      v6 = 1;
    v4->_isFingerDrawsOn = v6;

    objc_initWeak(&location, v4);
    v7 = [PKUIPencilInteractionObserver alloc];
    v8 = MEMORY[0x1E0C809B0];
    v74[0] = MEMORY[0x1E0C809B0];
    v74[1] = 3221225472;
    v74[2] = __48__PKPaletteAdditionalOptionsView_initWithFrame___block_invoke;
    v74[3] = &unk_1E7777588;
    objc_copyWeak(&v75, &location);
    v9 = (PKUIPencilInteractionObserver *)-[PKUIPencilInteractionObserver initWithPrefersPencilOnlyDrawsDidChangeHandler:](v7, v74);
    pencilInteractionObserver = v4->_pencilInteractionObserver;
    v4->_pencilInteractionObserver = v9;

    v11 = [PKAutoRefineSettingsObserver alloc];
    v72[0] = v8;
    v72[1] = 3221225472;
    v72[2] = __48__PKPaletteAdditionalOptionsView_initWithFrame___block_invoke_2;
    v72[3] = &unk_1E77785B0;
    objc_copyWeak(&v73, &location);
    v12 = (PKAutoRefineSettingsObserver *)-[PKAutoRefineSettingsObserver initWithHandler:](v11, v72);
    autoRefineSettingsObserver = v4->_autoRefineSettingsObserver;
    v4->_autoRefineSettingsObserver = v12;

    v14 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    contentStackView = v4->_contentStackView;
    v4->_contentStackView = v14;

    -[UIStackView setAlignment:](v4->_contentStackView, "setAlignment:", 3);
    -[UIStackView setAxis:](v4->_contentStackView, "setAxis:", 0);
    -[UIStackView setDistribution:](v4->_contentStackView, "setDistribution:", 0);
    -[UIStackView setSpacing:](v4->_contentStackView, "setSpacing:", 12.0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4->_contentStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKPaletteAdditionalOptionsView addSubview:](v4, "addSubview:", v4->_contentStackView);
    v67 = (void *)MEMORY[0x1E0CB3718];
    -[UIStackView topAnchor](v4->_contentStackView, "topAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteAdditionalOptionsView topAnchor](v4, "topAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:", v70);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = v69;
    -[UIStackView leadingAnchor](v4->_contentStackView, "leadingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteAdditionalOptionsView leadingAnchor](v4, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v79[1] = v17;
    -[UIStackView bottomAnchor](v4->_contentStackView, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteAdditionalOptionsView bottomAnchor](v4, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v79[2] = v20;
    -[UIStackView trailingAnchor](v4->_contentStackView, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteAdditionalOptionsView trailingAnchor](v4, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v79[3] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "activateConstraints:", v24);

    +[PKPaletteButton keyboardButton](PKPaletteButton, "keyboardButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteAdditionalOptionsView setKeyboardButton:](v4, "setKeyboardButton:", v25);

    -[PKPaletteAdditionalOptionsView keyboardButton](v4, "keyboardButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addTarget:action:forControlEvents:", v4, sel__handleKeyboardButton, 64);

    +[PKPaletteButton returnKeyButton](PKPaletteButton, "returnKeyButton");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteAdditionalOptionsView setReturnKeyButton:](v4, "setReturnKeyButton:", v27);

    -[PKPaletteAdditionalOptionsView returnKeyButton](v4, "returnKeyButton");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addTarget:action:forControlEvents:", v4, sel__handleReturnKeyButton, 64);

    v29 = objc_alloc_init(PKPaletteButtonGroupView);
    keyboardButtonGroupView = v4->_keyboardButtonGroupView;
    v4->_keyboardButtonGroupView = v29;

    -[PKPaletteButtonGroupView setTranslatesAutoresizingMaskIntoConstraints:](v4->_keyboardButtonGroupView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView addArrangedSubview:](v4->_contentStackView, "addArrangedSubview:", v4->_keyboardButtonGroupView);
    +[PKPaletteButton plusButton](PKPaletteButton, "plusButton");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteAdditionalOptionsView _setPlusButton:](v4, "_setPlusButton:", v31);

    v32 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    textShapeStackView = v4->_textShapeStackView;
    v4->_textShapeStackView = v32;

    -[UIStackView setAxis:](v4->_textShapeStackView, "setAxis:", 1);
    -[UIStackView setDistribution:](v4->_textShapeStackView, "setDistribution:", 0);
    -[UIStackView setAlignment:](v4->_textShapeStackView, "setAlignment:", 3);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4->_textShapeStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setSpacing:](v4->_textShapeStackView, "setSpacing:", 12.0);
    -[UIStackView addArrangedSubview:](v4->_contentStackView, "addArrangedSubview:", v4->_textShapeStackView);
    +[PKPaletteButton textButton](PKPaletteButton, "textButton");
    v34 = objc_claimAutoreleasedReturnValue();
    textButton = v4->_textButton;
    v4->_textButton = (PKPaletteButton *)v34;

    -[PKPaletteButton setAccessibilityIdentifier:](v4->_textButton, "setAccessibilityIdentifier:", CFSTR("Text Button"));
    -[UIStackView addArrangedSubview:](v4->_textShapeStackView, "addArrangedSubview:", v4->_textButton);
    -[PKPaletteButton widthAnchor](v4->_textButton, "widthAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToConstant:", 0.0);
    v37 = objc_claimAutoreleasedReturnValue();
    textButtonWidthConstraint = v4->_textButtonWidthConstraint;
    v4->_textButtonWidthConstraint = (NSLayoutConstraint *)v37;

    -[PKPaletteButton heightAnchor](v4->_textButton, "heightAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToConstant:", 0.0);
    v40 = objc_claimAutoreleasedReturnValue();
    textButtonHeightConstraint = v4->_textButtonHeightConstraint;
    v4->_textButtonHeightConstraint = (NSLayoutConstraint *)v40;

    LODWORD(v42) = 1148846080;
    -[PKPaletteButton setContentHuggingPriority:forAxis:](v4->_textButton, "setContentHuggingPriority:forAxis:", 0, v42);
    LODWORD(v43) = 1148846080;
    -[PKPaletteButton setContentHuggingPriority:forAxis:](v4->_textButton, "setContentHuggingPriority:forAxis:", 1, v43);
    +[PKPaletteButton shapeButton](PKPaletteButton, "shapeButton");
    v44 = objc_claimAutoreleasedReturnValue();
    shapeButton = v4->_shapeButton;
    v4->_shapeButton = (PKPaletteButton *)v44;

    -[PKPaletteButton setAccessibilityIdentifier:](v4->_shapeButton, "setAccessibilityIdentifier:", CFSTR("Shape Button"));
    -[UIStackView addArrangedSubview:](v4->_textShapeStackView, "addArrangedSubview:", v4->_shapeButton);
    -[PKPaletteButton widthAnchor](v4->_shapeButton, "widthAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToConstant:", 0.0);
    v47 = objc_claimAutoreleasedReturnValue();
    shapeButtonWidthConstraint = v4->_shapeButtonWidthConstraint;
    v4->_shapeButtonWidthConstraint = (NSLayoutConstraint *)v47;

    -[PKPaletteButton heightAnchor](v4->_shapeButton, "heightAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToConstant:", 0.0);
    v50 = objc_claimAutoreleasedReturnValue();
    shapeButtonHeightConstraint = v4->_shapeButtonHeightConstraint;
    v4->_shapeButtonHeightConstraint = (NSLayoutConstraint *)v50;

    LODWORD(v52) = 1148846080;
    -[PKPaletteButton setContentHuggingPriority:forAxis:](v4->_shapeButton, "setContentHuggingPriority:forAxis:", 0, v52);
    LODWORD(v53) = 1148846080;
    -[PKPaletteButton setContentHuggingPriority:forAxis:](v4->_shapeButton, "setContentHuggingPriority:forAxis:", 1, v53);
    v4->_wantsEllipsisButtonVisible = 1;
    +[PKPaletteButton ellipsisButton](PKPaletteButton, "ellipsisButton");
    v54 = objc_claimAutoreleasedReturnValue();
    ellipsisButton = v4->_ellipsisButton;
    v4->_ellipsisButton = (PKPaletteButton *)v54;

    -[PKPaletteButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_ellipsisButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKPaletteButton addTarget:action:forControlEvents:](v4->_ellipsisButton, "addTarget:action:forControlEvents:", v4, sel__didSelectEllipsisButton_, 64);
    -[UIStackView addArrangedSubview:](v4->_contentStackView, "addArrangedSubview:", v4->_ellipsisButton);
    -[PKPaletteButton widthAnchor](v4->_ellipsisButton, "widthAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToConstant:", 0.0);
    v57 = objc_claimAutoreleasedReturnValue();
    ellipsisButtonWidthConstraint = v4->_ellipsisButtonWidthConstraint;
    v4->_ellipsisButtonWidthConstraint = (NSLayoutConstraint *)v57;

    -[PKPaletteButton heightAnchor](v4->_ellipsisButton, "heightAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToConstant:", 0.0);
    v60 = objc_claimAutoreleasedReturnValue();
    ellipsisButtonHeightConstraint = v4->_ellipsisButtonHeightConstraint;
    v4->_ellipsisButtonHeightConstraint = (NSLayoutConstraint *)v60;

    LODWORD(v62) = 1148846080;
    -[PKPaletteButton setContentHuggingPriority:forAxis:](v4->_ellipsisButton, "setContentHuggingPriority:forAxis:", 0, v62);
    LODWORD(v63) = 1148846080;
    -[PKPaletteButton setContentHuggingPriority:forAxis:](v4->_ellipsisButton, "setContentHuggingPriority:forAxis:", 1, v63);
    v78[0] = v4->_textButtonWidthConstraint;
    v78[1] = v4->_textButtonHeightConstraint;
    v78[2] = v4->_shapeButtonWidthConstraint;
    v78[3] = v4->_shapeButtonHeightConstraint;
    v64 = (void *)MEMORY[0x1E0CB3718];
    v78[4] = v4->_ellipsisButtonWidthConstraint;
    v78[5] = v4->_ellipsisButtonHeightConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 6);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "activateConstraints:", v65);

    -[PKPaletteAdditionalOptionsView _updateUI](v4, "_updateUI");
    objc_destroyWeak(&v73);
    objc_destroyWeak(&v75);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __48__PKPaletteAdditionalOptionsView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_pencilInteractionPrefersPencilOnlyDrawsDidChange");

}

void __48__PKPaletteAdditionalOptionsView_initWithFrame___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;

  v3 = a2;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__PKPaletteAdditionalOptionsView_initWithFrame___block_invoke_3;
  v4[3] = &unk_1E7777588;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  PKPerformOnMainThread(v4);
  objc_destroyWeak(&v5);

}

void __48__PKPaletteAdditionalOptionsView_initWithFrame___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleAutoRefineSettingsDidChange");

}

- (void)willMoveToSuperview:(id)a3
{
  void *v5;

  -[PKPaletteAdditionalOptionsView superview](self, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a3)
  {
    if (v5)
      -[PKPaletteAdditionalOptionsView dismissPalettePopoverWithCompletion:](self, "dismissPalettePopoverWithCompletion:", 0);
  }
}

- (void)didMoveToWindow
{
  void *v3;
  NSObject *v4;
  _BOOL4 didTapOnPencilSettings;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[PKPaletteAdditionalOptionsView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = os_log_create("com.apple.pencilkit", "AdditionalOptions");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      didTapOnPencilSettings = self->_didTapOnPencilSettings;
      v10[0] = 67174657;
      v10[1] = didTapOnPencilSettings;
      _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "didMoveToWindow, didTapOnPencilSettings: %{private}d", (uint8_t *)v10, 8u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0DC5330];
    -[PKPaletteAdditionalOptionsView window](self, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "windowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__handleSceneWillDeactivateNotification_, v7, v9);

  }
}

- (void)_handleSceneWillDeactivateNotification:(id)a3
{
  NSObject *v4;
  _BOOL4 didTapOnPencilSettings;
  NSObject *v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.pencilkit", "AdditionalOptions");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    didTapOnPencilSettings = self->_didTapOnPencilSettings;
    v8[0] = 67174657;
    v8[1] = didTapOnPencilSettings;
    _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "scene will deactivate, didTapOnPencilSettings: %{private}d", (uint8_t *)v8, 8u);
  }

  if (self->_didTapOnPencilSettings)
  {
    self->_didTapOnPencilSettings = 0;
    v6 = os_log_create("com.apple.pencilkit", "AdditionalOptions");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl(&dword_1BE213000, v6, OS_LOG_TYPE_DEFAULT, "dismissis More Options popover", (uint8_t *)v8, 2u);
    }

    -[PKPaletteAdditionalOptionsView moreOptionsViewController](self, "moreOptionsViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 0, 0);

  }
}

- (void)_pencilInteractionPrefersPencilOnlyDrawsDidChange
{
  _BOOL8 v3;
  id v4;

  self->_isFingerDrawsOn = objc_msgSend(MEMORY[0x1E0DC3AC8], "prefersPencilOnlyDrawing") ^ 1;
  v3 = -[PKPaletteAdditionalOptionsView isFingerDrawsOn](self, "isFingerDrawsOn");
  -[PKPaletteAdditionalOptionsView moreOptionsViewController](self, "moreOptionsViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsFingerDrawsOn:", v3);

}

- (void)_handleAutoRefineSettingsDidChange
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = os_log_create("com.apple.pencilkit", "PKPaletteAdditionalOptionsView");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BE213000, v3, OS_LOG_TYPE_DEFAULT, "Handle AutoRefine settings did change", v4, 2u);
  }

  -[PKPaletteAdditionalOptionsView _updateMoreOptionsViewControllerAutoRefineState](self, "_updateMoreOptionsViewControllerAutoRefineState");
}

- (void)setPlusButton:(id)a3
{
  if (self->_plusButton != a3)
  {
    -[PKPaletteAdditionalOptionsView _setPlusButton:](self, "_setPlusButton:");
    -[PKPaletteAdditionalOptionsView _updateUI](self, "_updateUI");
  }
}

- (void)_setPlusButton:(id)a3
{
  PKPaletteButton *v4;
  PKPaletteButton *plusButton;
  PKPaletteButton *v6;
  void *v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *plusButtonWidthConstraint;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *plusButtonHeightConstraint;
  void *v13;
  NSLayoutConstraint *v14;
  void *v15;
  double v16;
  double v17;
  _QWORD v18[5];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = (PKPaletteButton *)a3;
  if (self->_plusButton)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __49__PKPaletteAdditionalOptionsView__setPlusButton___block_invoke;
    v18[3] = &unk_1E7778020;
    v18[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v18);
    plusButton = self->_plusButton;
  }
  else
  {
    plusButton = 0;
  }
  self->_plusButton = v4;
  v6 = v4;

  -[PKPaletteButton setTranslatesAutoresizingMaskIntoConstraints:](self->_plusButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView addArrangedSubview:](self->_contentStackView, "addArrangedSubview:", self->_plusButton);
  -[PKPaletteButton widthAnchor](self->_plusButton, "widthAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToConstant:", 0.0);
  v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  plusButtonWidthConstraint = self->_plusButtonWidthConstraint;
  self->_plusButtonWidthConstraint = v8;

  -[PKPaletteButton heightAnchor](self->_plusButton, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToConstant:", 0.0);
  v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  plusButtonHeightConstraint = self->_plusButtonHeightConstraint;
  self->_plusButtonHeightConstraint = v11;

  v13 = (void *)MEMORY[0x1E0CB3718];
  v14 = self->_plusButtonHeightConstraint;
  v19[0] = self->_plusButtonWidthConstraint;
  v19[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activateConstraints:", v15);

  LODWORD(v16) = 1148846080;
  -[PKPaletteButton setContentHuggingPriority:forAxis:](self->_plusButton, "setContentHuggingPriority:forAxis:", 0, v16);
  LODWORD(v17) = 1148846080;
  -[PKPaletteButton setContentHuggingPriority:forAxis:](self->_plusButton, "setContentHuggingPriority:forAxis:", 1, v17);

}

uint64_t __49__PKPaletteAdditionalOptionsView__setPlusButton___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "removeFromSuperview");
}

- (void)setShowsPlusButton:(BOOL)a3
{
  if (self->_showsPlusButton != a3)
  {
    self->_showsPlusButton = a3;
    -[PKPaletteAdditionalOptionsView _updateUI](self, "_updateUI");
  }
}

- (void)setShowsTextButton:(BOOL)a3
{
  if (self->_showsTextButton != a3)
  {
    self->_showsTextButton = a3;
    -[PKPaletteAdditionalOptionsView _updateUI](self, "_updateUI");
  }
}

- (void)setShowsShapeButton:(BOOL)a3
{
  if (self->_showsShapeButton != a3)
  {
    self->_showsShapeButton = a3;
    -[PKPaletteAdditionalOptionsView _updateUI](self, "_updateUI");
  }
}

- (void)setWantsEllipsisButtonVisible:(BOOL)a3
{
  if (self->_wantsEllipsisButtonVisible != a3)
  {
    self->_wantsEllipsisButtonVisible = a3;
    -[PKPaletteAdditionalOptionsView _updateUI](self, "_updateUI");
  }
}

- (void)setWantsInputAssistantViewVisible:(BOOL)a3
{
  if (self->_wantsInputAssistantViewVisible != a3)
  {
    self->_wantsInputAssistantViewVisible = a3;
    -[PKPaletteAdditionalOptionsView _updateUI](self, "_updateUI");
  }
}

- (void)setEnableKeyboardButtons:(BOOL)a3
{
  if (self->_enableKeyboardButtons != a3)
  {
    self->_enableKeyboardButtons = a3;
    -[PKPaletteAdditionalOptionsView _updateUI](self, "_updateUI");
  }
}

- (void)setFloatingKeyboardType:(int64_t)a3
{
  if (self->_floatingKeyboardType != a3)
  {
    self->_floatingKeyboardType = a3;
    -[PKPaletteAdditionalOptionsView _updateUI](self, "_updateUI");
  }
}

- (void)setShouldShowFingerDrawsOption:(BOOL)a3
{
  if (self->_shouldShowFingerDrawsOption != a3)
  {
    self->_shouldShowFingerDrawsOption = a3;
    -[PKPaletteAdditionalOptionsView _updateUI](self, "_updateUI");
  }
}

- (void)setShouldShowTapToRadarOption:(BOOL)a3
{
  if (self->_shouldShowTapToRadarOption != a3)
  {
    self->_shouldShowTapToRadarOption = a3;
    -[PKPaletteAdditionalOptionsView _updateUI](self, "_updateUI");
  }
}

- (void)setShouldShowResetHandwritingEducationPane:(BOOL)a3
{
  if (self->_shouldShowResetHandwritingEducationPane != a3)
  {
    self->_shouldShowResetHandwritingEducationPane = a3;
    -[PKPaletteAdditionalOptionsView _updateUI](self, "_updateUI");
  }
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PKPaletteAdditionalOptionsView contentStackView](self, "contentStackView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)_updateUI
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  unint64_t v12;
  _BOOL8 v14;
  void *v15;
  unint64_t v16;
  _BOOL8 v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  unint64_t v43;
  _BOOL8 v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  unint64_t v54;
  BOOL v55;
  unint64_t v56;
  void *v58;
  int64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _BOOL8 v64;
  void *v65;
  _BOOL8 v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  void *v72;
  void *v73;
  void *v74;
  _BOOL8 v75;
  void *v76;
  _BOOL8 v77;
  void *v78;
  _BOOL8 v79;
  void *v80;
  _QWORD v81[5];
  BOOL v82;

  -[PKPaletteAdditionalOptionsView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[PKPaletteAdditionalOptionsView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteAdditionalOptionsView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PKUseCompactSize(v3, v5);

  v81[0] = MEMORY[0x1E0C809B0];
  v81[1] = 3221225472;
  v81[2] = __43__PKPaletteAdditionalOptionsView__updateUI__block_invoke;
  v81[3] = &unk_1E777A028;
  v81[4] = self;
  v82 = v6;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v81);
  v7 = 6.0;
  v8 = 6.0;
  if (!-[PKPaletteAdditionalOptionsView showsShapeButton](self, "showsShapeButton"))
  {
    if (-[PKPaletteAdditionalOptionsView showsTextButton](self, "showsTextButton"))
      v8 = 6.0;
    else
      v8 = 12.0;
  }
  v9 = 28.0;
  if (!v6)
  {
    -[PKPaletteAdditionalOptionsView scalingFactor](self, "scalingFactor");
    v7 = v8 * v10;
    v9 = 36.0;
  }
  -[PKPaletteAdditionalOptionsView contentStackView](self, "contentStackView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSpacing:", v7);

  v12 = -[PKPaletteAdditionalOptionsView edgeLocation](self, "edgeLocation");
  v14 = v12 == 2 || v12 == 8;
  -[PKPaletteAdditionalOptionsView contentStackView](self, "contentStackView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAxis:", v14);

  v16 = -[PKPaletteAdditionalOptionsView edgeLocation](self, "edgeLocation");
  v18 = v16 != 2 && v16 != 8;
  -[PKPaletteAdditionalOptionsView textShapeStackView](self, "textShapeStackView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAxis:", v18);

  -[PKPaletteAdditionalOptionsView scalingFactor](self, "scalingFactor");
  v21 = v20 * 12.0;
  -[PKPaletteAdditionalOptionsView textShapeStackView](self, "textShapeStackView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setSpacing:", v21);

  -[PKPaletteAdditionalOptionsView scalingFactor](self, "scalingFactor");
  v24 = v9 * v23;
  v25 = v9 * v23;
  -[PKPaletteAdditionalOptionsView plusButtonWidthConstraint](self, "plusButtonWidthConstraint");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setConstant:", v24);

  -[PKPaletteAdditionalOptionsView plusButtonHeightConstraint](self, "plusButtonHeightConstraint");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setConstant:", v25);

  -[PKPaletteAdditionalOptionsView ellipsisButtonWidthConstraint](self, "ellipsisButtonWidthConstraint");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setConstant:", v24);

  -[PKPaletteAdditionalOptionsView ellipsisButtonHeightConstraint](self, "ellipsisButtonHeightConstraint");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setConstant:", v25);

  -[PKPaletteAdditionalOptionsView textButtonWidthConstraint](self, "textButtonWidthConstraint");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setConstant:", v24);

  -[PKPaletteAdditionalOptionsView textButtonHeightConstraint](self, "textButtonHeightConstraint");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setConstant:", v25);

  -[PKPaletteAdditionalOptionsView shapeButtonWidthConstraint](self, "shapeButtonWidthConstraint");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setConstant:", v24);

  -[PKPaletteAdditionalOptionsView shapeButtonHeightConstraint](self, "shapeButtonHeightConstraint");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setConstant:", v25);

  -[PKPaletteAdditionalOptionsView scalingFactor](self, "scalingFactor");
  v35 = v34;
  -[PKPaletteAdditionalOptionsView textButton](self, "textButton");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setScalingFactor:", v35);

  -[PKPaletteAdditionalOptionsView scalingFactor](self, "scalingFactor");
  v38 = v37;
  -[PKPaletteAdditionalOptionsView shapeButton](self, "shapeButton");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setScalingFactor:", v38);

  -[PKPaletteAdditionalOptionsView scalingFactor](self, "scalingFactor");
  v41 = v40;
  -[PKPaletteAdditionalOptionsView keyboardButtonGroupView](self, "keyboardButtonGroupView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setScalingFactor:", v41);

  v43 = -[PKPaletteAdditionalOptionsView edgeLocation](self, "edgeLocation");
  v45 = v43 != 2 && v43 != 8;
  -[PKPaletteAdditionalOptionsView keyboardButtonGroupView](self, "keyboardButtonGroupView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setAxis:", v45);

  -[PKPaletteAdditionalOptionsView keyboardButtonGroupView](self, "keyboardButtonGroupView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "removeAllButtons");

  -[PKPaletteAdditionalOptionsView keyboardButtonGroupView](self, "keyboardButtonGroupView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteAdditionalOptionsView _keyboardButtonGroupViewButtons](self, "_keyboardButtonGroupViewButtons");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addButtonsFromArray:", v49);

  v51 = *MEMORY[0x1E0DC3298];
  v50 = *(double *)(MEMORY[0x1E0DC3298] + 8);
  v52 = *(double *)(MEMORY[0x1E0DC3298] + 16);
  v53 = *(double *)(MEMORY[0x1E0DC3298] + 24);
  if (!v6
    && (-[PKPaletteAdditionalOptionsView showsShapeButton](self, "showsShapeButton")
     || -[PKPaletteAdditionalOptionsView showsTextButton](self, "showsTextButton")))
  {
    v54 = -[PKPaletteAdditionalOptionsView edgeLocation](self, "edgeLocation");
    v55 = v54 == 8 || v54 == 2;
    v50 = 0.0;
    v53 = 6.0;
    if (v55)
      v52 = 6.0;
    else
      v52 = 0.0;
    v56 = -[PKPaletteAdditionalOptionsView edgeLocation](self, "edgeLocation");
    if (v56 != 4 && v56 != 1)
      v53 = 0.0;
    v51 = 0.0;
  }
  -[PKPaletteAdditionalOptionsView keyboardButtonGroupView](self, "keyboardButtonGroupView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setAdditionalContentMargins:", v51, v50, v52, v53);

  v59 = -[PKPaletteAdditionalOptionsView floatingKeyboardType](self, "floatingKeyboardType");
  -[PKPaletteAdditionalOptionsView keyboardButton](self, "keyboardButton");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setFloatingKeyboardType:", v59);

  -[PKPaletteAdditionalOptionsView delegate](self, "delegate");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "keyboardSelectionMenuForAdditionalOptionsView:", self);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteAdditionalOptionsView keyboardButton](self, "keyboardButton");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setKeyboardSelectionMenu:", v62);

  v64 = -[PKPaletteAdditionalOptionsView enableKeyboardButtons](self, "enableKeyboardButtons");
  -[PKPaletteAdditionalOptionsView keyboardButton](self, "keyboardButton");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setEnableKeyboardToggle:", v64);

  v66 = -[PKPaletteAdditionalOptionsView enableKeyboardButtons](self, "enableKeyboardButtons");
  -[PKPaletteAdditionalOptionsView returnKeyButton](self, "returnKeyButton");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setEnabled:", v66);

  -[PKPaletteAdditionalOptionsView traitCollection](self, "traitCollection");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v68, "userInterfaceIdiom"))
    goto LABEL_43;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "bundleIdentifier");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "isEqualToString:", CFSTR("com.apple.ScreenshotServicesService"));

  if (v71)
  {
    -[PKPaletteAdditionalOptionsView plusButton](self, "plusButton");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setOverrideUserInterfaceStyle:", 2);

    -[PKPaletteAdditionalOptionsView ellipsisButton](self, "ellipsisButton");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setOverrideUserInterfaceStyle:", 2);

    -[PKPaletteAdditionalOptionsView textButton](self, "textButton");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setOverrideUserInterfaceStyle:", 2);

    -[PKPaletteAdditionalOptionsView shapeButton](self, "shapeButton");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setOverrideUserInterfaceStyle:", 2);
LABEL_43:

  }
  v75 = -[PKPaletteAdditionalOptionsView shouldShowFingerDrawsOption](self, "shouldShowFingerDrawsOption");
  -[PKPaletteAdditionalOptionsView moreOptionsViewController](self, "moreOptionsViewController");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setShouldShowFingerDrawsOption:", v75);

  v77 = -[PKPaletteAdditionalOptionsView shouldShowTapToRadarOption](self, "shouldShowTapToRadarOption");
  -[PKPaletteAdditionalOptionsView moreOptionsViewController](self, "moreOptionsViewController");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setShouldShowTapToRadarOption:", v77);

  v79 = -[PKPaletteAdditionalOptionsView shouldShowResetHandwritingEducationPane](self, "shouldShowResetHandwritingEducationPane");
  -[PKPaletteAdditionalOptionsView moreOptionsViewController](self, "moreOptionsViewController");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setShouldShowResetHandwritingEducationPane:", v79);

}

void __43__PKPaletteAdditionalOptionsView__updateUI__block_invoke(uint64_t a1)
{
  void *v2;
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
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
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
  _QWORD v49[3];

  v49[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "plusButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "contentStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "plusButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "insertArrangedSubview:atIndex:", v4, 0);

  objc_msgSend(*(id *)(a1 + 32), "ellipsisButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "contentStackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "ellipsisButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertArrangedSubview:atIndex:", v7, 1);

  if ((objc_msgSend(*(id *)(a1 + 32), "showsTextButton") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "showsShapeButton"))
  {
    objc_msgSend(*(id *)(a1 + 32), "textShapeStackView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    objc_msgSend(*(id *)(a1 + 32), "contentStackView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "textShapeStackView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "insertArrangedSubview:atIndex:", v10, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "keyboardButtonGroupView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "contentStackView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "keyboardButtonGroupView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "insertArrangedSubview:atIndex:", v13, 0);

  v14 = objc_msgSend(*(id *)(a1 + 32), "showsPlusButton") ^ 1;
  objc_msgSend(*(id *)(a1 + 32), "plusButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHidden:", v14);

  v16 = objc_msgSend(*(id *)(a1 + 32), "showsTextButton") ^ 1;
  objc_msgSend(*(id *)(a1 + 32), "textButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHidden:", v16);

  v18 = objc_msgSend(*(id *)(a1 + 32), "showsShapeButton") ^ 1;
  objc_msgSend(*(id *)(a1 + 32), "shapeButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHidden:", v18);

  v20 = objc_msgSend(*(id *)(a1 + 32), "wantsEllipsisButtonVisible") ^ 1;
  objc_msgSend(*(id *)(a1 + 32), "ellipsisButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setHidden:", v20);

  if (*(_BYTE *)(a1 + 40))
    v22 = 1;
  else
    v22 = objc_msgSend(*(id *)(a1 + 32), "wantsInputAssistantViewVisible") ^ 1;
  objc_msgSend(*(id *)(a1 + 32), "keyboardButtonGroupView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setHidden:", v22);

  if ((objc_msgSend(*(id *)(a1 + 32), "showsTextButton") & 1) != 0)
    v24 = 0;
  else
    v24 = objc_msgSend(*(id *)(a1 + 32), "showsShapeButton") ^ 1;
  objc_msgSend(*(id *)(a1 + 32), "textShapeStackView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setHidden:", v24);

  objc_msgSend(*(id *)(a1 + 32), "textButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "shapeButton");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "removeFromSuperview");

  v28 = objc_msgSend(*(id *)(a1 + 32), "edgeLocation");
  objc_msgSend(*(id *)(a1 + 32), "textShapeStackView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = *(void **)(a1 + 32);
  if (v28 == 2)
  {
    objc_msgSend(v30, "shapeButton");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addArrangedSubview:", v31);

    objc_msgSend(*(id *)(a1 + 32), "textShapeStackView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "textButton");
  }
  else
  {
    objc_msgSend(v30, "textButton");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addArrangedSubview:", v33);

    objc_msgSend(*(id *)(a1 + 32), "textShapeStackView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "shapeButton");
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addArrangedSubview:", v34);

  objc_msgSend(*(id *)(a1 + 32), "plusEllipsisStackView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "removeFromSuperview");

  if (*(_BYTE *)(a1 + 40) && objc_msgSend(*(id *)(a1 + 32), "showsPlusButton"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "wantsEllipsisButtonVisible"))
    {
      objc_msgSend(*(id *)(a1 + 32), "plusButton");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "removeFromSuperview");

      objc_msgSend(*(id *)(a1 + 32), "ellipsisButton");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "removeFromSuperview");

      v38 = objc_alloc(MEMORY[0x1E0DC3CA8]);
      objc_msgSend(*(id *)(a1 + 32), "plusButton");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = v39;
      objc_msgSend(*(id *)(a1 + 32), "ellipsisButton");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v49[1] = v40;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)objc_msgSend(v38, "initWithArrangedSubviews:", v41);
      objc_msgSend(*(id *)(a1 + 32), "setPlusEllipsisStackView:", v42);

      objc_msgSend(*(id *)(a1 + 32), "plusEllipsisStackView");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setAxis:", 1);

      objc_msgSend(*(id *)(a1 + 32), "plusEllipsisStackView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setDistribution:", 1);

      objc_msgSend(*(id *)(a1 + 32), "plusEllipsisStackView");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setAlignment:", 3);

      objc_msgSend(*(id *)(a1 + 32), "plusEllipsisStackView");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setSpacing:", 12.0);

      objc_msgSend(*(id *)(a1 + 32), "contentStackView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "plusEllipsisStackView");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "addArrangedSubview:", v48);

    }
  }
}

- (id)_keyboardButtonGroupViewButtons
{
  unint64_t v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = -[PKPaletteAdditionalOptionsView edgeLocation](self, "edgeLocation");
  if (v3 == 2 || v3 == 8)
  {
    -[PKPaletteAdditionalOptionsView returnKeyButton](self, "returnKeyButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    -[PKPaletteAdditionalOptionsView keyboardButton](self, "keyboardButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v5;
    v6 = v10;
  }
  else
  {
    -[PKPaletteAdditionalOptionsView keyboardButton](self, "keyboardButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    -[PKPaletteAdditionalOptionsView returnKeyButton](self, "returnKeyButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v5;
    v6 = v9;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setEdgeLocation:(unint64_t)a3
{
  if (self->_edgeLocation != a3)
  {
    self->_edgeLocation = a3;
    -[PKPaletteAdditionalOptionsView _updateUI](self, "_updateUI");
  }
}

- (void)setScalingFactor:(double)a3
{
  double scalingFactor;

  scalingFactor = self->_scalingFactor;
  if (scalingFactor != a3 && vabdd_f64(scalingFactor, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_scalingFactor = a3;
    -[PKPaletteAdditionalOptionsView _updateUI](self, "_updateUI");
  }
}

- (void)_didSelectEllipsisButton:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  PKPaletteMoreOptionsViewController *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL8 v24;
  void *v25;
  void *v26;
  _BOOL8 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  double x;
  double y;
  double width;
  double height;
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
  id v57;
  CGRect v58;
  CGRect v59;

  v57 = a3;
  -[PKPaletteAdditionalOptionsView palettePopoverPresenting](self, "palettePopoverPresenting");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "palettePopoverPresentingController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PKPaletteAdditionalOptionsView presentedPopoverViewController](self, "presentedPopoverViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_6;
    v7 = v6;
    if (objc_msgSend(v6, "isBeingPresented"))
    {

LABEL_11:
      goto LABEL_12;
    }
    v8 = objc_msgSend(v7, "isBeingDismissed");

    if ((v8 & 1) == 0)
    {
LABEL_6:
      v9 = objc_alloc_init(PKPaletteMoreOptionsViewController);
      -[PKPaletteAdditionalOptionsView setMoreOptionsViewController:](self, "setMoreOptionsViewController:", v9);

      -[PKPaletteAdditionalOptionsView moreOptionsViewController](self, "moreOptionsViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteAdditionalOptionsView setPresentedPopoverViewController:](self, "setPresentedPopoverViewController:", v10);

      v11 = -[PKPaletteAdditionalOptionsView shouldShowTapToRadarOption](self, "shouldShowTapToRadarOption");
      -[PKPaletteAdditionalOptionsView moreOptionsViewController](self, "moreOptionsViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setShouldShowTapToRadarOption:", v11);

      v13 = -[PKPaletteAdditionalOptionsView shouldShowResetHandwritingEducationPane](self, "shouldShowResetHandwritingEducationPane");
      -[PKPaletteAdditionalOptionsView moreOptionsViewController](self, "moreOptionsViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setShouldShowResetHandwritingEducationPane:", v13);

      v15 = PKCurrentDeviceSupportsPencil();
      -[PKPaletteAdditionalOptionsView moreOptionsViewController](self, "moreOptionsViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setShouldShowOpenPencilSettingsOption:", v15);

      v17 = -[PKPaletteAdditionalOptionsView isAutoHideOn](self, "isAutoHideOn");
      -[PKPaletteAdditionalOptionsView moreOptionsViewController](self, "moreOptionsViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAutoHideOn:", v17);

      v19 = -[PKPaletteAdditionalOptionsView isFingerDrawsOn](self, "isFingerDrawsOn");
      -[PKPaletteAdditionalOptionsView moreOptionsViewController](self, "moreOptionsViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setIsFingerDrawsOn:", v19);

      -[PKPaletteAdditionalOptionsView _updateMoreOptionsViewControllerAutoRefineState](self, "_updateMoreOptionsViewControllerAutoRefineState");
      -[PKPaletteAdditionalOptionsView traitCollection](self, "traitCollection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteAdditionalOptionsView window](self, "window");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "windowScene");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = !PKUseCompactSize(v21, v23);
      -[PKPaletteAdditionalOptionsView moreOptionsViewController](self, "moreOptionsViewController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setShouldShowAutoMinimizeOption:", v24);

      -[PKPaletteAdditionalOptionsView moreOptionsViewController](self, "moreOptionsViewController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setDelegate:", self);

      v27 = -[PKPaletteAdditionalOptionsView shouldShowFingerDrawsOption](self, "shouldShowFingerDrawsOption");
      -[PKPaletteAdditionalOptionsView moreOptionsViewController](self, "moreOptionsViewController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setShouldShowFingerDrawsOption:", v27);

      -[PKPaletteAdditionalOptionsView moreOptionsViewController](self, "moreOptionsViewController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteAdditionalOptionsView traitCollection](self, "traitCollection");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "updateUIForTraitCollection:", v30);

      -[PKPaletteAdditionalOptionsView presentedPopoverViewController](self, "presentedPopoverViewController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setModalPresentationStyle:", 7);

      -[PKPaletteAdditionalOptionsView presentedPopoverViewController](self, "presentedPopoverViewController");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "popoverPresentationController");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setDelegate:", self);

      -[PKPaletteAdditionalOptionsView traitCollection](self, "traitCollection");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteAdditionalOptionsView window](self, "window");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "windowScene");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (PKUseCompactSize(v34, v36))
        v37 = 2;
      else
        v37 = PKUIPopoverPermittedArrowDirectionsForEdge(-[PKPaletteAdditionalOptionsView edgeLocation](self, "edgeLocation"));
      -[PKPaletteAdditionalOptionsView presentedPopoverViewController](self, "presentedPopoverViewController");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "popoverPresentationController");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setPermittedArrowDirections:", v37);

      objc_msgSend(v57, "bounds");
      v59 = CGRectInset(v58, -5.0, -5.0);
      x = v59.origin.x;
      y = v59.origin.y;
      width = v59.size.width;
      height = v59.size.height;
      -[PKPaletteAdditionalOptionsView presentedPopoverViewController](self, "presentedPopoverViewController");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "popoverPresentationController");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setSourceRect:", x, y, width, height);

      -[PKPaletteAdditionalOptionsView presentedPopoverViewController](self, "presentedPopoverViewController");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "popoverPresentationController");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setSourceView:", v57);

      -[PKPaletteAdditionalOptionsView presentedPopoverViewController](self, "presentedPopoverViewController");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "popoverPresentationController");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "_setShouldDisableInteractionDuringTransitions:", 0);

      -[PKPaletteAdditionalOptionsView palettePopoverPresenting](self, "palettePopoverPresenting");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "palettePopoverPassthroughViews");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteAdditionalOptionsView presentedPopoverViewController](self, "presentedPopoverViewController");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "popoverPresentationController");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setPassthroughViews:", v51);

      -[PKPaletteAdditionalOptionsView presentedPopoverViewController](self, "presentedPopoverViewController");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "popoverPresentationController");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "_setIgnoresKeyboardNotifications:", 1);

      -[PKPaletteAdditionalOptionsView updatePopoverUI](self, "updatePopoverUI");
      -[PKPaletteAdditionalOptionsView palettePopoverPresenting](self, "palettePopoverPresenting");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v55) = objc_msgSend(v56, "shouldPalettePresentPopover");

      if ((_DWORD)v55)
      {
        -[PKPaletteAdditionalOptionsView presentedPopoverViewController](self, "presentedPopoverViewController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "presentViewController:animated:completion:", v7, 1, 0);
        goto LABEL_11;
      }
    }
  }
LABEL_12:

}

- (void)updatePopoverUI
{
  void *v3;
  id v4;

  -[PKPaletteAdditionalOptionsView palettePopoverPresenting](self, "palettePopoverPresenting");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaletteAdditionalOptionsView presentedPopoverViewController](self, "presentedPopoverViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updatePalettePopover:", v3);

}

- (void)_updateMoreOptionsViewControllerAutoRefineState
{
  _BOOL8 v3;
  id v4;

  v3 = +[PKSettingsDaemon autoRefineEnabled](PKSettingsDaemon, "autoRefineEnabled");
  -[PKPaletteAdditionalOptionsView moreOptionsViewController](self, "moreOptionsViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAutoRefineOn:", v3);

}

- (void)moreOptionsViewControllerDidToggleAutoHide:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[PKPaletteAdditionalOptionsView setAutoHideOn:](self, "setAutoHideOn:", objc_msgSend(a3, "isAutoHideOn"));
  -[PKPaletteAdditionalOptionsView moreOptionsViewController](self, "moreOptionsViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__PKPaletteAdditionalOptionsView_moreOptionsViewControllerDidToggleAutoHide___block_invoke;
  v5[3] = &unk_1E7778020;
  v5[4] = self;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v5);

}

void __77__PKPaletteAdditionalOptionsView_moreOptionsViewControllerDidToggleAutoHide___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "additionalOptionsView:didToggleAutoHideOption:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "isAutoHideOn"));

}

- (void)moreOptionsViewControllerDidToggleFingerDraws:(id)a3
{
  uint64_t v4;
  int v5;
  id v6;

  v4 = objc_msgSend(a3, "isFingerDrawsOn");
  v5 = v4;
  -[PKPaletteAdditionalOptionsView setIsFingerDrawsOn:](self, "setIsFingerDrawsOn:", v4);
  +[PKSettingsDaemon setPrefersPencilOnlyDrawing:](PKSettingsDaemon, "setPrefersPencilOnlyDrawing:", v5 ^ 1u);
  +[PKStatisticsManager sharedStatisticsManager]();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKStatisticsManager recordDrawWithFingerToggle:]((uint64_t)v6);

}

- (void)moreOptionsViewControllerDidSelectOpenPencilSettings:(id)a3
{
  id v3;

  self->_didTapOnPencilSettings = 1;
  +[PKSettingsDaemon openPencilPreferences](PKSettingsDaemon, "openPencilPreferences", a3);
  +[PKStatisticsManager sharedStatisticsManager]();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PKStatisticsManager recordJumpToSettings]((uint64_t)v3);

}

- (void)moreOptionsViewControllerDidSelectTapToRadar:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[PKPaletteAdditionalOptionsView moreOptionsViewController](self, "moreOptionsViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79__PKPaletteAdditionalOptionsView_moreOptionsViewControllerDidSelectTapToRadar___block_invoke;
  v5[3] = &unk_1E7778020;
  v5[4] = self;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v5);

}

void __79__PKPaletteAdditionalOptionsView_moreOptionsViewControllerDidSelectTapToRadar___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "additionalOptionsViewDidPressTapToRadarButton:", *(_QWORD *)(a1 + 32));

}

- (void)moreOptionsViewControllerDidToggleAutoRefine:(id)a3
{
  id v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = os_log_create("com.apple.pencilkit", "PKPaletteAdditionalOptionsView");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = objc_msgSend(v3, "isAutoRefineOn");
    _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Did toggle AutoRefine to %{BOOL}d", (uint8_t *)v5, 8u);
  }

  +[PKSettingsDaemon setAutoRefineEnabled:](PKSettingsDaemon, "setAutoRefineEnabled:", objc_msgSend(v3, "isAutoRefineOn"));
}

- (void)moreOptionsViewControllerDidSelectResetHandwritingEducationPane:(id)a3
{
  id v4;

  +[PKWelcomeController resetEducationPane](PKWelcomeController, "resetEducationPane", a3);
  -[PKPaletteAdditionalOptionsView moreOptionsViewController](self, "moreOptionsViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaletteAdditionalOptionsView;
  -[PKPaletteAdditionalOptionsView traitCollectionDidChange:](&v13, sel_traitCollectionDidChange_, v4);
  -[PKPaletteAdditionalOptionsView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "horizontalSizeClass");
  v7 = objc_msgSend(v4, "horizontalSizeClass");

  if (v6 != v7)
  {
    -[PKPaletteAdditionalOptionsView moreOptionsViewController](self, "moreOptionsViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteAdditionalOptionsView traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateUIForTraitCollection:", v9);

    -[PKPaletteAdditionalOptionsView _updateUI](self, "_updateUI");
  }
  -[PKPaletteAdditionalOptionsView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceStyle");
  v12 = objc_msgSend(v4, "userInterfaceStyle");

  if (v11 != v12)
    -[PKPaletteAdditionalOptionsView updatePopoverUI](self, "updatePopoverUI");

}

- (void)dismissPalettePopoverWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  -[PKPaletteAdditionalOptionsView presentedPopoverViewController](self, "presentedPopoverViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PKPaletteAdditionalOptionsView presentedPopoverViewController](self, "presentedPopoverViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v6);

  }
  else if (v6)
  {
    v6[2]();
  }

}

- (CGRect)plusButtonFrame
{
  void *v2;
  double v3;
  double v4;
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
  CGRect result;

  -[PKPaletteAdditionalOptionsView plusButton](self, "plusButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)_handleKeyboardButton
{
  void *v3;
  char v4;
  id v5;

  -[PKPaletteAdditionalOptionsView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PKPaletteAdditionalOptionsView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "additionalOptionsViewDidPressKeyboardButton:", self);

  }
}

- (void)_handleReturnKeyButton
{
  void *v3;
  char v4;
  id v5;

  -[PKPaletteAdditionalOptionsView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PKPaletteAdditionalOptionsView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "additionalOptionsViewDidPressReturnKeyButton:", self);

  }
}

- (unint64_t)edgeLocation
{
  return self->_edgeLocation;
}

- (unint64_t)cornerLocation
{
  return self->_cornerLocation;
}

- (void)setCornerLocation:(unint64_t)a3
{
  self->_cornerLocation = a3;
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (PKPalettePopoverPresenting)palettePopoverPresenting
{
  return (PKPalettePopoverPresenting *)objc_loadWeakRetained((id *)&self->_palettePopoverPresenting);
}

- (void)setPalettePopoverPresenting:(id)a3
{
  objc_storeWeak((id *)&self->_palettePopoverPresenting, a3);
}

- (PKPaletteAdditionalOptionsViewDelegate)delegate
{
  return (PKPaletteAdditionalOptionsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKPaletteButton)plusButton
{
  return self->_plusButton;
}

- (PKPaletteButton)textButton
{
  return self->_textButton;
}

- (void)setTextButton:(id)a3
{
  objc_storeStrong((id *)&self->_textButton, a3);
}

- (PKPaletteButton)shapeButton
{
  return self->_shapeButton;
}

- (BOOL)showsPlusButton
{
  return self->_showsPlusButton;
}

- (BOOL)showsTextButton
{
  return self->_showsTextButton;
}

- (BOOL)showsShapeButton
{
  return self->_showsShapeButton;
}

- (BOOL)isAutoHideOn
{
  return self->_autoHideOn;
}

- (void)setAutoHideOn:(BOOL)a3
{
  self->_autoHideOn = a3;
}

- (BOOL)isFingerDrawsOn
{
  return self->_isFingerDrawsOn;
}

- (void)setIsFingerDrawsOn:(BOOL)a3
{
  self->_isFingerDrawsOn = a3;
}

- (BOOL)shouldShowFingerDrawsOption
{
  return self->_shouldShowFingerDrawsOption;
}

- (BOOL)shouldShowTapToRadarOption
{
  return self->_shouldShowTapToRadarOption;
}

- (BOOL)shouldShowResetHandwritingEducationPane
{
  return self->_shouldShowResetHandwritingEducationPane;
}

- (BOOL)wantsEllipsisButtonVisible
{
  return self->_wantsEllipsisButtonVisible;
}

- (BOOL)wantsInputAssistantViewVisible
{
  return self->_wantsInputAssistantViewVisible;
}

- (BOOL)enableKeyboardButtons
{
  return self->_enableKeyboardButtons;
}

- (int64_t)floatingKeyboardType
{
  return self->_floatingKeyboardType;
}

- (BOOL)shouldHideHoverPreviewToggle
{
  return self->_shouldHideHoverPreviewToggle;
}

- (void)setShouldHideHoverPreviewToggle:(BOOL)a3
{
  self->_shouldHideHoverPreviewToggle = a3;
}

- (UIStackView)contentStackView
{
  return self->_contentStackView;
}

- (void)setContentStackView:(id)a3
{
  objc_storeStrong((id *)&self->_contentStackView, a3);
}

- (UIStackView)textShapeStackView
{
  return self->_textShapeStackView;
}

- (void)setTextShapeStackView:(id)a3
{
  objc_storeStrong((id *)&self->_textShapeStackView, a3);
}

- (UIStackView)plusEllipsisStackView
{
  return self->_plusEllipsisStackView;
}

- (void)setPlusEllipsisStackView:(id)a3
{
  objc_storeStrong((id *)&self->_plusEllipsisStackView, a3);
}

- (PKPaletteButton)ellipsisButton
{
  return self->_ellipsisButton;
}

- (void)setEllipsisButton:(id)a3
{
  objc_storeStrong((id *)&self->_ellipsisButton, a3);
}

- (PKPaletteButtonGroupView)keyboardButtonGroupView
{
  return self->_keyboardButtonGroupView;
}

- (void)setKeyboardButtonGroupView:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardButtonGroupView, a3);
}

- (PKPaletteKeyboardButton)keyboardButton
{
  return self->_keyboardButton;
}

- (void)setKeyboardButton:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardButton, a3);
}

- (PKPaletteButton)returnKeyButton
{
  return self->_returnKeyButton;
}

- (void)setReturnKeyButton:(id)a3
{
  objc_storeStrong((id *)&self->_returnKeyButton, a3);
}

- (PKPaletteMoreOptionsViewController)moreOptionsViewController
{
  return self->_moreOptionsViewController;
}

- (void)setMoreOptionsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_moreOptionsViewController, a3);
}

- (UIViewController)presentedPopoverViewController
{
  return self->_presentedPopoverViewController;
}

- (void)setPresentedPopoverViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentedPopoverViewController, a3);
}

- (NSLayoutConstraint)plusButtonWidthConstraint
{
  return self->_plusButtonWidthConstraint;
}

- (void)setPlusButtonWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_plusButtonWidthConstraint, a3);
}

- (NSLayoutConstraint)plusButtonHeightConstraint
{
  return self->_plusButtonHeightConstraint;
}

- (void)setPlusButtonHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_plusButtonHeightConstraint, a3);
}

- (NSLayoutConstraint)ellipsisButtonWidthConstraint
{
  return self->_ellipsisButtonWidthConstraint;
}

- (void)setEllipsisButtonWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_ellipsisButtonWidthConstraint, a3);
}

- (NSLayoutConstraint)ellipsisButtonHeightConstraint
{
  return self->_ellipsisButtonHeightConstraint;
}

- (void)setEllipsisButtonHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_ellipsisButtonHeightConstraint, a3);
}

- (NSLayoutConstraint)textButtonWidthConstraint
{
  return self->_textButtonWidthConstraint;
}

- (void)setTextButtonWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textButtonWidthConstraint, a3);
}

- (NSLayoutConstraint)textButtonHeightConstraint
{
  return self->_textButtonHeightConstraint;
}

- (void)setTextButtonHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textButtonHeightConstraint, a3);
}

- (NSLayoutConstraint)shapeButtonWidthConstraint
{
  return self->_shapeButtonWidthConstraint;
}

- (void)setShapeButtonWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_shapeButtonWidthConstraint, a3);
}

- (NSLayoutConstraint)shapeButtonHeightConstraint
{
  return self->_shapeButtonHeightConstraint;
}

- (void)setShapeButtonHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_shapeButtonHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_shapeButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_textButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_textButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_ellipsisButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_ellipsisButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_plusButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_plusButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_presentedPopoverViewController, 0);
  objc_storeStrong((id *)&self->_moreOptionsViewController, 0);
  objc_storeStrong((id *)&self->_returnKeyButton, 0);
  objc_storeStrong((id *)&self->_keyboardButton, 0);
  objc_storeStrong((id *)&self->_keyboardButtonGroupView, 0);
  objc_storeStrong((id *)&self->_ellipsisButton, 0);
  objc_storeStrong((id *)&self->_plusEllipsisStackView, 0);
  objc_storeStrong((id *)&self->_textShapeStackView, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_shapeButton, 0);
  objc_storeStrong((id *)&self->_textButton, 0);
  objc_storeStrong((id *)&self->_plusButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_palettePopoverPresenting);
  objc_storeStrong((id *)&self->_autoRefineSettingsObserver, 0);
  objc_storeStrong((id *)&self->_pencilInteractionObserver, 0);
}

@end
