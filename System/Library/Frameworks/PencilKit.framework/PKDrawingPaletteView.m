@implementation PKDrawingPaletteView

- (PKDrawingPaletteView)init
{
  return -[PKDrawingPaletteView initWithTools:](self, "initWithTools:", MEMORY[0x1E0C9AA60]);
}

- (PKDrawingPaletteView)initWithTools:(id)a3
{
  id v4;
  PKDrawingPaletteView *v5;

  v4 = a3;
  v5 = -[PKDrawingPaletteView initWithTools:wantsEllipsisButtonVisibleInCompactSize:](self, "initWithTools:wantsEllipsisButtonVisibleInCompactSize:", v4, PKIsPadDevice());

  return v5;
}

- (PKDrawingPaletteView)initWithTools:(id)a3 wantsEllipsisButtonVisibleInCompactSize:(BOOL)a4
{
  id v6;
  PKDrawingPaletteView *v7;
  PKDrawingPaletteView *v8;
  PKPaletteToolViewFactory *v9;
  PKPaletteToolViewFactory *toolViewFactory;
  PKPaletteBackgroundColorFactory *v11;
  PKPaletteBackgroundColorFactory *backgroundColorFactory;
  uint64_t v13;
  NSArray *tools;
  uint64_t v15;
  double v16;
  PKTextInputWindowFirstResponderController *v17;
  PKTextInputWindowFirstResponderController *firstResponderController;
  PKPaletteFloatingKeyboardController *v19;
  PKPaletteFloatingKeyboardController *floatingKeyboardController;
  PKPaletteInputAssistantButtonProvider *v21;
  PKPaletteInputAssistantButtonProvider *inputAssistantButtonProvider;
  SEL v23;
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
  uint64_t v47;
  UIPencilInteraction *pencilInteraction;
  UIView *v49;
  UIView *bottomLineDividerView;
  void *v51;
  _QWORD v53[5];
  objc_super v54;

  v6 = a3;
  v54.receiver = self;
  v54.super_class = (Class)PKDrawingPaletteView;
  v7 = -[PKPaletteView initWithFrame:](&v54, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v8 = v7;
  if (v7)
  {
    -[PKDrawingPaletteView setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", CFSTR("Drawing-Palette"));
    v9 = objc_alloc_init(PKPaletteToolViewFactory);
    toolViewFactory = v8->_toolViewFactory;
    v8->_toolViewFactory = v9;

    v11 = objc_alloc_init(PKPaletteBackgroundColorFactory);
    backgroundColorFactory = v8->_backgroundColorFactory;
    v8->_backgroundColorFactory = v11;

    v8->_wantsClearBackgroundColorInCompactSize = 0;
    v8->_wantsEllipsisButtonVisibleInCompactSize = a4;
    v8->_wantsBottomLineDividerVisibleInCompactSize = 1;
    v8->_pencilInteractionEnabledWhenNotVisible = 0;
    v13 = objc_msgSend(v6, "copy");
    tools = v8->_tools;
    v8->_tools = (NSArray *)v13;

    v8->_indexOfSelectedTool = 0x7FFFFFFFFFFFFFFFLL;
    v15 = objc_msgSend(v6, "count");
    v16 = 7.0;
    if (v15 < 8)
      v16 = 5.0;
    v8->_interItemToolsSpacingInCompactSize = v16;
    v8->_interItemUndoRedoButtonsSpacing = 12.0;
    v8->_interItemUndoRedoButtonsSpacingInCompactSize = 12.0;
    v17 = objc_alloc_init(PKTextInputWindowFirstResponderController);
    firstResponderController = v8->_firstResponderController;
    v8->_firstResponderController = v17;

    -[PKTextInputWindowFirstResponderController setDelegate:](v8->_firstResponderController, "setDelegate:", v8);
    v19 = objc_alloc_init(PKPaletteFloatingKeyboardController);
    floatingKeyboardController = v8->_floatingKeyboardController;
    v8->_floatingKeyboardController = v19;

    -[PKPaletteFloatingKeyboardController setDelegate:]((uint64_t)v8->_floatingKeyboardController, v8);
    v21 = objc_alloc_init(PKPaletteInputAssistantButtonProvider);
    inputAssistantButtonProvider = v8->_inputAssistantButtonProvider;
    v8->_inputAssistantButtonProvider = v21;

    v23 = NSSelectorFromString(CFSTR("showInkPicker:"));
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __78__PKDrawingPaletteView_initWithTools_wantsEllipsisButtonVisibleInCompactSize___block_invoke;
    v53[3] = &__block_descriptor_40_e67_B24__0__PKPaletteInputAssistantButtonProvider_8__UIBarButtonItem_16l;
    v53[4] = v23;
    -[PKPaletteInputAssistantButtonProvider setInclusionFilter:](v8->_inputAssistantButtonProvider, "setInclusionFilter:", v53);
    -[PKPaletteView containerView](v8, "containerView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDrawingPaletteView _installPaletteContentViewInView:](v8, "_installPaletteContentViewInView:", v25);

    -[PKDrawingPaletteView contentView](v8, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setDelegate:", v8);

    -[PKDrawingPaletteView contentView](v8, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "undoRedoView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setDelegate:", v8);

    -[PKDrawingPaletteView contentView](v8, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "toolPickerView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setDelegate:", v8);

    -[PKDrawingPaletteView contentView](v8, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "colorPickerView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setDelegate:", v8);

    -[PKDrawingPaletteView contentView](v8, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "additionalOptionsView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setDelegate:", v8);

    -[PKDrawingPaletteView contentView](v8, "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "additionalOptionsView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setPalettePopoverPresenting:", v8);

    -[PKDrawingPaletteView contentView](v8, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "additionalOptionsView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "plusButton");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addTarget:action:forControlEvents:", v8, sel__didTapPlusButton_, 64);

    -[PKDrawingPaletteView contentView](v8, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "additionalOptionsView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "textButton");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addTarget:action:forControlEvents:", v8, sel__didTapTextButton_, 64);

    -[PKDrawingPaletteView contentView](v8, "contentView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "additionalOptionsView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "shapeButton");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addTarget:action:forControlEvents:", v8, sel__didTapShapeButton_, 64);

    -[PKPaletteView toolPreview](v8, "toolPreview");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setDelegate:", v8);

    -[PKDrawingPaletteView updateColorPickerSelectedColor](v8, "updateColorPickerSelectedColor");
    +[PKPencilInteraction fallbackPencilInteraction]();
    v47 = objc_claimAutoreleasedReturnValue();
    pencilInteraction = v8->_pencilInteraction;
    v8->_pencilInteraction = (UIPencilInteraction *)v47;

    -[UIPencilInteraction setDelegate:](v8->_pencilInteraction, "setDelegate:", v8);
    -[PKDrawingPaletteView addInteraction:](v8, "addInteraction:", v8->_pencilInteraction);
    v49 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    bottomLineDividerView = v8->_bottomLineDividerView;
    v8->_bottomLineDividerView = v49;

    -[PKDrawingPaletteView addSubview:](v8, "addSubview:", v8->_bottomLineDividerView);
    -[PKPaletteView setPalettePopoverLayoutSceneMargins:](v8, "setPalettePopoverLayoutSceneMargins:", 10.0, 10.0, 10.0, 10.0);
    -[PKDrawingPaletteView _updateUI](v8, "_updateUI");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "addObserver:selector:name:object:", v8, sel__dictationAvailabilityDidChange_, *MEMORY[0x1E0DC4E58], 0);

  }
  return v8;
}

BOOL __78__PKDrawingPaletteView_initWithTools_wantsEllipsisButtonVisibleInCompactSize___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "action") != *(_QWORD *)(a1 + 32);
}

- (void)_dictationAvailabilityDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.pencilkit", "PKPalette");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_INFO, "Dictation availability did change: %@. Update UI.", (uint8_t *)&v6, 0xCu);
  }

  -[PKDrawingPaletteView _updateUI](self, "_updateUI");
}

- (void)didChangePaletteScaleFactor
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKDrawingPaletteView;
  -[PKPaletteView didChangePaletteScaleFactor](&v4, sel_didChangePaletteScaleFactor);
  -[PKDrawingPaletteView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paletteViewStateDidChangeScaleFactor:", self);

  -[PKDrawingPaletteView _updateUI](self, "_updateUI");
  -[PKDrawingPaletteView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)didMoveToWindow
{
  void *v3;
  PKTextInputWindowFirstResponderController *firstResponderController;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKDrawingPaletteView;
  -[PKDrawingPaletteView didMoveToWindow](&v7, sel_didMoveToWindow);
  -[PKDrawingPaletteView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    firstResponderController = self->_firstResponderController;
    -[PKDrawingPaletteView windowScene](self, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputWindowFirstResponderController updateFirstResponderFromWindowScene:sendDelegateCallback:](firstResponderController, "updateFirstResponderFromWindowScene:sendDelegateCallback:", v5, 0);
  }
  else
  {
    -[PKDrawingPaletteView floatingKeyboardController](self, "floatingKeyboardController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteFloatingKeyboardController dismissWithReason:]((uint64_t)v5, CFSTR("Palette UI moved to nil window."));
  }

  -[PKDrawingPaletteView windowScene](self, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDrawingPaletteView setIsQuickNoteUI:](self, "setIsQuickNoteUI:", PKIsQuickNoteWindowScene(v6));

}

- (id)contentScrollView
{
  void *v2;
  void *v3;
  void *v4;

  -[PKDrawingPaletteView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toolPickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[PKDrawingPaletteView _releaseUndoManager](self, "_releaseUndoManager");
  v3.receiver = self;
  v3.super_class = (Class)PKDrawingPaletteView;
  -[PKDrawingPaletteView dealloc](&v3, sel_dealloc);
}

- (double)responseForThrowingFromPosition:(int64_t)a3 toPosition:(int64_t)a4 withVelocity:(CGPoint)a5
{
  return 0.75;
}

- (double)dampingRatioForThrowingFromPosition:(int64_t)a3 toPosition:(int64_t)a4 withVelocity:(CGPoint)a5
{
  return 0.8;
}

- (void)_installPaletteContentViewInView:(id)a3
{
  id v4;
  PKPaletteContentView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *contentViewBottomConstraint;
  NSLayoutConstraint *v13;
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
  NSLayoutConstraint *v24;
  NSLayoutConstraint *compactContentViewHeightConstraint;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];

  v31[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PKPaletteContentView initWithPaletteViewStateObservable:]([PKPaletteContentView alloc], "initWithPaletteViewStateObservable:", self);
  -[PKDrawingPaletteView setContentView:](self, "setContentView:", v5);

  -[PKDrawingPaletteView contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PKDrawingPaletteView contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v7);

  -[PKDrawingPaletteView contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  contentViewBottomConstraint = self->_contentViewBottomConstraint;
  self->_contentViewBottomConstraint = v11;

  v26 = (void *)MEMORY[0x1E0CB3718];
  -[PKDrawingPaletteView contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = self->_contentViewBottomConstraint;
  v31[0] = v27;
  v31[1] = v13;
  -[PKDrawingPaletteView contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "leftAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v17;
  -[PKDrawingPaletteView contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "rightAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "activateConstraints:", v22);

  -[PKPaletteContentView heightAnchor](self->_contentView, "heightAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDrawingPaletteView compactPaletteHeight](self, "compactPaletteHeight");
  objc_msgSend(v23, "constraintEqualToConstant:");
  v24 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  compactContentViewHeightConstraint = self->_compactContentViewHeightConstraint;
  self->_compactContentViewHeightConstraint = v24;

}

- (id)borderColorForTraitCollection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!PKIsVisionDevice())
  {
    if (UIAccessibilityDarkerSystemColorsEnabled())
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v7 = v5;
      v5 = (void *)v6;
      goto LABEL_9;
    }
    -[PKDrawingPaletteView window](self, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "windowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (PKUseCompactSize(v4, v8))
    {

LABEL_9:
      goto LABEL_10;
    }
    v9 = objc_msgSend(v4, "userInterfaceStyle");

    if (v9 == 2)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.172549024, 0.172549024, 0.180392161, 1.0);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
LABEL_10:
  v10 = v5;

  return v10;
}

- (double)borderWidthForTraitCollection:(id)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  v5 = 0.0;
  if (!PKIsVisionDevice())
  {
    -[PKDrawingPaletteView window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "windowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = PKUseCompactSize(v4, v7);

    if (!v8)
    {
      v5 = 1.0;
      if (!UIAccessibilityDarkerSystemColorsEnabled())
      {
        if (objc_msgSend(v4, "userInterfaceStyle") == 2)
          v5 = 0.5;
        else
          v5 = 0.0;
      }
    }
  }

  return v5;
}

- (void)setShadowVisible:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKDrawingPaletteView;
  -[PKPaletteView setShadowVisible:](&v5, sel_setShadowVisible_, a3);
  -[PKPaletteView internalDelegate](self, "internalDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paletteViewStateDidChange:updatePaletteAppearance:", self, 1);

}

- (double)shadowOpacity
{
  _BOOL4 v2;
  double result;
  _BOOL4 v4;

  v2 = -[PKPaletteView shadowVisible](self, "shadowVisible");
  result = 0.0;
  if (v2)
  {
    v4 = UIAccessibilityDarkerSystemColorsEnabled();
    result = 0.25;
    if (v4)
      return 0.5;
  }
  return result;
}

- (double)shadowRadius
{
  _BOOL4 v2;
  double result;
  _BOOL4 v4;

  v2 = -[PKPaletteView shadowVisible](self, "shadowVisible");
  result = 0.0;
  if (v2)
  {
    v4 = UIAccessibilityDarkerSystemColorsEnabled();
    result = 38.0;
    if (v4)
      return 15.0;
  }
  return result;
}

- (BOOL)shouldAdjustShadowRadiusForMinimized
{
  return !UIAccessibilityDarkerSystemColorsEnabled();
}

- (void)setWantsUndoRedoButtonsShadowInCompactSize:(BOOL)a3
{
  id v4;

  if (self->_wantsUndoRedoButtonsShadowInCompactSize != a3)
  {
    self->_wantsUndoRedoButtonsShadowInCompactSize = a3;
    -[PKDrawingPaletteView contentView](self, "contentView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paletteViewStateDidChange:", self);

  }
}

- (void)setWantsMulticolorSwatchShadowInCompactSize:(BOOL)a3
{
  id v4;

  if (self->_wantsMulticolorSwatchShadowInCompactSize != a3)
  {
    self->_wantsMulticolorSwatchShadowInCompactSize = a3;
    -[PKDrawingPaletteView contentView](self, "contentView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paletteViewStateDidChange:", self);

  }
}

- (void)_updateUI
{
  -[PKDrawingPaletteView _updateUIReloadTools:](self, "_updateUIReloadTools:", 0);
}

- (void)_updateUIReloadTools:(BOOL)a3
{
  _BOOL4 v3;
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
  void **v16;
  void *v17;
  void *v18;
  void *v19;
  int64_t v20;
  void *v21;
  void *v22;
  int64_t v23;
  void *v24;
  void *v25;
  _BOOL8 v26;
  void *v27;
  void *v28;
  _BOOL8 v29;
  void *v30;
  void *v31;
  int64_t v32;
  void *v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  double v39;
  double v40;
  void *v41;
  unint64_t indexOfSelectedTool;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  char v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD v66[3];

  v3 = a3;
  v66[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[PKDrawingPaletteView contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "toolPickerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadToolViewsWithDataSource:", self);

  }
  v7 = (void *)MEMORY[0x1E0CB3718];
  -[PKDrawingPaletteView contentViewBottomConstraint](self, "contentViewBottomConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v8;
  -[PKDrawingPaletteView compactContentViewHeightConstraint](self, "compactContentViewHeightConstraint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deactivateConstraints:", v10);

  -[PKDrawingPaletteView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDrawingPaletteView window](self, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "windowScene");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = PKUseCompactSize(v11, v13);

  v14 = (void *)MEMORY[0x1E0CB3718];
  if ((_DWORD)v10)
  {
    -[PKDrawingPaletteView compactContentViewHeightConstraint](self, "compactContentViewHeightConstraint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v15;
    v16 = &v65;
  }
  else
  {
    -[PKDrawingPaletteView contentViewBottomConstraint](self, "contentViewBottomConstraint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v15;
    v16 = &v64;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activateConstraints:", v17);

  -[PKDrawingPaletteView contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "undoRedoView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "updateUI");

  v20 = -[PKDrawingPaletteView colorUserInterfaceStyle](self, "colorUserInterfaceStyle");
  -[PKDrawingPaletteView contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "colorPickerView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setColorUserInterfaceStyle:", v20);

  v23 = -[PKDrawingPaletteView colorUserInterfaceStyle](self, "colorUserInterfaceStyle");
  -[PKDrawingPaletteView contentView](self, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "toolPickerView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setColorUserInterfaceStyle:", v23);

  v26 = -[PKPaletteView isAutoHideEnabled](self, "isAutoHideEnabled");
  -[PKDrawingPaletteView contentView](self, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "additionalOptionsView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setAutoHideOn:", v26);

  v29 = -[PKDrawingPaletteView _shouldShowFingerDrawsOption](self, "_shouldShowFingerDrawsOption");
  -[PKDrawingPaletteView contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "additionalOptionsView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setShouldShowFingerDrawsOption:", v29);

  v32 = -[PKDrawingPaletteView colorUserInterfaceStyle](self, "colorUserInterfaceStyle");
  -[PKPaletteView toolPreview](self, "toolPreview");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setColorUserInterfaceStyle:", v32);

  -[PKDrawingPaletteView _updateToolsContainerScrollingEnabled](self, "_updateToolsContainerScrollingEnabled");
  if (-[PKPaletteView useCompactSize](self, "useCompactSize")
    || (unint64_t)(-[PKPaletteView palettePosition](self, "palettePosition") - 1) > 3)
  {
    if ((unint64_t)(-[PKPaletteView palettePosition](self, "palettePosition") - 5) <= 3)
    {
      v36 = -[PKPaletteView palettePosition](self, "palettePosition") - 5;
      if (v36 > 3)
        v37 = -1;
      else
        v37 = qword_1BE4FF150[v36];
      v38 = -[PKPaletteView edgeLocationToDockFromCorner:](self, "edgeLocationToDockFromCorner:", v37);
      -[PKPaletteView _updateContainerSizeConstraintsForEdge:](self, "_updateContainerSizeConstraintsForEdge:", v38);
      -[PKDrawingPaletteView _centerPaletteContainerSubviewToCurrentlySelectedToolForEdge:needsContainerViewLayout:](self, "_centerPaletteContainerSubviewToCurrentlySelectedToolForEdge:needsContainerViewLayout:", v38, 1);
      -[PKDrawingPaletteView _updateToolPreviewPositionForEdge:](self, "_updateToolPreviewPositionForEdge:", v38);
    }
  }
  else
  {
    v34 = -[PKPaletteView palettePosition](self, "palettePosition") - 1;
    if (v34 > 3)
      v35 = 0;
    else
      v35 = qword_1BE4FF1B0[v34];
    -[PKPaletteView _updateContainerSizeConstraintsForEdge:](self, "_updateContainerSizeConstraintsForEdge:", v35);
  }
  -[PKPaletteView paletteScaleFactor](self, "paletteScaleFactor");
  v40 = v39;
  -[PKPaletteView containerView](self, "containerView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setScalingFactor:", v40);

  indexOfSelectedTool = self->_indexOfSelectedTool;
  if (indexOfSelectedTool != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PKDrawingPaletteView contentView](self, "contentView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "toolPickerView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "selectToolViewAtIndex:", indexOfSelectedTool);

    -[PKDrawingPaletteView _selectedToolViewInToolPicker](self, "_selectedToolViewInToolPicker");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "tool");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v46, "isLassoTool"))
    {

    }
    else
    {
      -[PKDrawingPaletteView selectedTool](self, "selectedTool");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "_isLassoTool");

      if (!v48)
        goto LABEL_22;
    }
    -[PKDrawingPaletteView _selectedToolViewInToolPicker](self, "_selectedToolViewInToolPicker");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setSupportsDisplayingSelectedColor:", 0);

LABEL_22:
    -[PKDrawingPaletteView updateColorPickerSelectedColor](self, "updateColorPickerSelectedColor");
    -[PKPaletteView paletteViewHosting](self, "paletteViewHosting");
    v50 = objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      v51 = (void *)v50;
      -[PKPaletteView paletteViewHosting](self, "paletteViewHosting");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "isPaletteVisualStateMinimized");

      if ((v53 & 1) != 0)
      {
LABEL_24:
        v54 = 1;
LABEL_30:
        -[PKDrawingPaletteView _updateToolPreviewContentsAnimated:](self, "_updateToolPreviewContentsAnimated:", v54);
        -[PKPaletteView _updateToolPreviewVisibility](self, "_updateToolPreviewVisibility");
        goto LABEL_31;
      }
    }
    else if ((unint64_t)(-[PKPaletteView palettePosition](self, "palettePosition") - 5) < 4)
    {
      goto LABEL_24;
    }
    v55 = -[PKPaletteView palettePosition](self, "palettePosition") - 1;
    if (v55 > 3)
      v56 = 0;
    else
      v56 = qword_1BE4FF1B0[v55];
    -[PKDrawingPaletteView _updateToolPreviewPositionForEdge:](self, "_updateToolPreviewPositionForEdge:", v56);
    v54 = 0;
    goto LABEL_30;
  }
LABEL_31:
  -[PKDrawingPaletteView _updateKeyboardSceneDelegateInputAssistantSupressionState](self, "_updateKeyboardSceneDelegateInputAssistantSupressionState");
  if (-[PKDrawingPaletteView isHandwritingToolSelected](self, "isHandwritingToolSelected"))
  {
    -[PKDrawingPaletteView updateHandwritingAssistantItems](self, "updateHandwritingAssistantItems");
  }
  else
  {
    -[PKDrawingPaletteView floatingKeyboardController](self, "floatingKeyboardController");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteFloatingKeyboardController dismissWithReason:]((uint64_t)v57, CFSTR("Handwriting tool no longer selected"));

  }
  if (!-[PKDrawingPaletteView isAnnotationSupportEnabled](self, "isAnnotationSupportEnabled")
    && -[PKDrawingPaletteView selectedAnnotationType](self, "selectedAnnotationType"))
  {
    -[PKDrawingPaletteView setSelectedAnnotationType:](self, "setSelectedAnnotationType:", 0);
  }
  -[PKDrawingPaletteView bottomLineDividerView](self, "bottomLineDividerView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "isDescendantOfView:", self);

  if (-[PKDrawingPaletteView wantsBottomLineDividerVisibleInCompactSize](self, "wantsBottomLineDividerVisibleInCompactSize")|| !v59)
  {
    if (((!-[PKDrawingPaletteView wantsBottomLineDividerVisibleInCompactSize](self, "wantsBottomLineDividerVisibleInCompactSize") | v59) & 1) != 0)goto LABEL_43;
    -[PKDrawingPaletteView bottomLineDividerView](self, "bottomLineDividerView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDrawingPaletteView addSubview:](self, "addSubview:", v60);
  }
  else
  {
    -[PKDrawingPaletteView bottomLineDividerView](self, "bottomLineDividerView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "removeFromSuperview");
  }

LABEL_43:
  if (v3)
  {
    -[PKDrawingPaletteView contentView](self, "contentView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "paletteViewStateDidChange:", self);

    -[PKPaletteView internalDelegate](self, "internalDelegate");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "paletteViewStateDidChange:", self);

    -[PKPaletteView delegate](self, "delegate");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "paletteViewContentSizeDidChange:", self);

  }
}

- (BOOL)_canShowFingerDrawsOption
{
  void *v2;
  BOOL v3;

  -[PKDrawingPaletteView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") != 0;

  return v3;
}

- (BOOL)_shouldShowFingerDrawsOption
{
  _BOOL4 v3;

  v3 = -[PKDrawingPaletteView _canShowFingerDrawsOption](self, "_canShowFingerDrawsOption");
  if (v3)
    LOBYTE(v3) = -[PKDrawingPaletteView isFingerDrawsOptionEnabled](self, "isFingerDrawsOptionEnabled");
  return v3;
}

- (void)_updateToolsContainerScrollingEnabled
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  id v7;

  -[PKDrawingPaletteView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toolPickerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isScrollingEnabled");
  v6 = -[PKDrawingPaletteView wantsScrollableTools](self, "wantsScrollableTools");

  if (v5 != v6)
  {
    -[PKDrawingPaletteView contentView](self, "contentView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "paletteViewStateDidChange:", self);

  }
}

- (BOOL)wantsScrollableTools
{
  void *v3;
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  double v7;

  -[PKDrawingPaletteView tools](self, "tools");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 < 8)
    return 0;
  -[PKDrawingPaletteView windowScene](self, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PKIsSmallestQuickNoteWindowScene(v5);

  v7 = 7.0;
  if (v6)
    v7 = 6.0;
  return v7 < (double)v4;
}

- (BOOL)isExtendedColorPickerVisible
{
  void *v2;
  void *v3;
  char v4;

  -[PKDrawingPaletteView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorPickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isExtendedColorPickerVisible");

  return v4;
}

- (double)compactPaletteHeight
{
  return 75.0;
}

- (CGSize)paletteSizeForEdge:(unint64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  if (a3 == 8 || a3 == 2)
  {
    -[PKDrawingPaletteView _paletteHeightForVerticalOrientation](self, "_paletteHeightForVerticalOrientation");
    v5 = v4;
    v6 = 122.0;
  }
  else
  {
    -[PKDrawingPaletteView _paletteWidthForHorizontalOrientation](self, "_paletteWidthForHorizontalOrientation");
    v6 = v7;
    v5 = 122.0;
  }
  -[PKPaletteView paletteScaleFactor](self, "paletteScaleFactor");
  v9 = v5 * v8;
  v10 = v6 * v8;
  result.height = v9;
  result.width = v10;
  return result;
}

- (double)_paletteHeightForVerticalOrientation
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  double v12;

  PKPaletteButtonSize(0);
  v4 = v3;
  v5 = v3 + 48.0 + 36.0;
  -[PKDrawingPaletteView _toolsContainerWidth](self, "_toolsContainerWidth");
  v7 = v6 + v5 + 36.0;
  PKPaletteColorSwatchesSize(1);
  v9 = v8 + v7 + 26.0;
  if (-[PKDrawingPaletteView showsPlusButton](self, "showsPlusButton")
    || -[PKDrawingPaletteView showsTextButton](self, "showsTextButton")
    || -[PKDrawingPaletteView showsShapeButton](self, "showsShapeButton"))
  {
    v9 = v4 + 6.0 + v9;
  }
  v10 = v4 + v9;
  v11 = -[PKDrawingPaletteView showsPlusButton](self, "showsPlusButton");
  v12 = 48.0;
  if (!v11)
    v12 = 26.0;
  return v10 + v12;
}

- (double)_paletteWidthForHorizontalOrientation
{
  double v3;
  double v4;
  double v5;
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;

  v3 = PKPaletteButtonSize(0);
  -[PKDrawingPaletteView _toolsContainerWidth](self, "_toolsContainerWidth");
  v5 = PKPaletteColorSwatchesSize(0) + v4 + v3 * 2.0 + 12.0 + 26.0 + 36.0 + 36.0 + 26.0;
  if (-[PKDrawingPaletteView showsTextButton](self, "showsTextButton")
    || -[PKDrawingPaletteView showsShapeButton](self, "showsShapeButton"))
  {
    v5 = v3 + 6.0 + v5;
  }
  v6 = -[PKDrawingPaletteView showsPlusButton](self, "showsPlusButton");
  v7 = v3 + 12.0;
  if (!v6)
    v7 = -0.0;
  v8 = v5 + v7;
  if (-[PKDrawingPaletteView isEllipsisButtonVisible](self, "isEllipsisButtonVisible"))
    v9 = v3;
  else
    v9 = -0.0;
  return v9 + v8 + 26.0;
}

- (double)_toolsContainerWidth
{
  void *v2;
  unint64_t v3;
  uint64_t v4;
  double result;
  double v6;
  double v7;
  void *v8;
  void *v9;
  int v10;
  _BOOL4 v11;
  double v12;
  _BOOL4 v13;

  -[PKDrawingPaletteView tools](self, "tools");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  v4 = v3 - 1;
  if (v3 == 1)
    return 46.0;
  v6 = 15.0;
  if (v4 < 8)
    v6 = 12.0;
  v7 = (double)v3 * 46.0 + v6 * (double)(unint64_t)v4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.mobilenotes"));

  if (v10)
  {
    v11 = PKIsVisionDevice();
    v12 = 372.0;
    if (v11)
      v12 = 534.0;
    if (v12 >= v7)
      v7 = v12;
  }
  if (PKIsVisionDevice())
  {
    v13 = PKIsVisionDevice();
    result = 372.0;
    if (v13)
      result = 534.0;
  }
  else
  {
    result = 394.0;
  }
  if (result >= v7)
    return v7;
  return result;
}

- (void)updatePopoverUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PKDrawingPaletteView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toolPickerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updatePopoverUI");

  -[PKDrawingPaletteView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorPickerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updatePopoverUI");

  -[PKDrawingPaletteView contentView](self, "contentView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "additionalOptionsView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updatePopoverUI");

}

- (void)setWantsClearBackgroundColorInCompactSize:(BOOL)a3
{
  if (self->_wantsClearBackgroundColorInCompactSize != a3)
  {
    self->_wantsClearBackgroundColorInCompactSize = a3;
    -[PKDrawingPaletteView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double x;
  double v9;
  double y;
  double v11;
  double width;
  double v13;
  double height;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  uint64_t v26;
  void *v27;
  objc_super v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v28.receiver = self;
  v28.super_class = (Class)PKDrawingPaletteView;
  -[PKPaletteView layoutSubviews](&v28, sel_layoutSubviews);
  -[PKDrawingPaletteView updateUndoRedo](self, "updateUndoRedo");
  v3 = -[PKDrawingPaletteView _wantsClearBackgroundColor](self, "_wantsClearBackgroundColor");
  -[PKDrawingPaletteView _clippingViewBackgroundColor:](self, "_clippingViewBackgroundColor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteView clippingView](self, "clippingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[PKPaletteView clippingView](self, "clippingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  x = v7;
  y = v9;
  width = v11;
  height = v13;

  if (!-[PKPaletteView useCompactSize](self, "useCompactSize"))
  {
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    v30 = CGRectInset(v29, -6.0, -6.0);
    x = v30.origin.x;
    y = v30.origin.y;
    width = v30.size.width;
    height = v30.size.height;
  }
  -[PKPaletteView backgroundMaterialView](self, "backgroundMaterialView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", x, y, width, height);

  -[PKPaletteView backgroundMaterialView](self, "backgroundMaterialView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHidden:", v3);

  -[PKDrawingPaletteView compactPaletteHeight](self, "compactPaletteHeight");
  v18 = v17;
  -[PKDrawingPaletteView bounds](self, "bounds");
  v19 = CGRectGetWidth(v31);
  -[PKDrawingPaletteView bottomLineDividerView](self, "bottomLineDividerView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", 0.0, v18, v19, 1.0);

  if (-[PKPaletteView useCompactSize](self, "useCompactSize"))
    objc_msgSend(MEMORY[0x1E0DC3658], "pk_separatorLineColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDrawingPaletteView bottomLineDividerView](self, "bottomLineDividerView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBackgroundColor:", v21);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bundleIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("com.apple.ScreenshotServicesService"));

  if ((v25 & 1) != 0)
  {
    v26 = 2;
  }
  else
  {
    -[PKDrawingPaletteView traitCollection](self, "traitCollection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v23, "userInterfaceStyle");
  }
  -[PKDrawingPaletteView bottomLineDividerView](self, "bottomLineDividerView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setOverrideUserInterfaceStyle:", v26);

  if ((v25 & 1) == 0)
  if (-[PKDrawingPaletteView isQuickNoteUI](self, "isQuickNoteUI"))
    -[PKDrawingPaletteView _updateToolsContainerScrollingEnabled](self, "_updateToolsContainerScrollingEnabled");
}

- (BOOL)_wantsClearBackgroundColor
{
  _BOOL4 v3;

  if (PKIsVisionDevice())
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[PKPaletteView useCompactSize](self, "useCompactSize");
    if (v3)
      LOBYTE(v3) = -[PKDrawingPaletteView wantsClearBackgroundColorInCompactSize](self, "wantsClearBackgroundColorInCompactSize");
  }
  return v3;
}

- (id)_clippingViewBackgroundColor:(BOOL)a3
{
  if (a3)
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    -[PKPaletteBackgroundColorFactory makeBackgroundColor](self->_backgroundColorFactory);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setUseEqualSpacingLayoutInCompactSize:(BOOL)a3
{
  id v4;

  if (self->_useEqualSpacingLayoutInCompactSize != a3)
  {
    self->_useEqualSpacingLayoutInCompactSize = a3;
    -[PKDrawingPaletteView contentView](self, "contentView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paletteViewStateDidChange:", self);

  }
}

- (void)setAnnotationDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_annotationDelegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_annotationDelegate, obj);
    -[PKDrawingPaletteView setShowsPlusButton:](self, "setShowsPlusButton:", -[PKDrawingPaletteView isAnnotationSupportEnabled](self, "isAnnotationSupportEnabled"));
    v5 = obj;
  }

}

- (BOOL)isAnnotationSupportEnabled
{
  void *v2;
  BOOL v3;

  -[PKDrawingPaletteView annotationDelegate](self, "annotationDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)updateUndoRedo
{
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  -[PKPaletteView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PKPaletteView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "paletteViewUndoManager:", self);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  -[PKDrawingPaletteView setUndoManager:](self, "setUndoManager:", v12);
  v6 = objc_msgSend(v12, "canUndo");
  -[PKDrawingPaletteView contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "undoRedoView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUndoEnabled:", v6);

  v9 = objc_msgSend(v12, "canRedo");
  -[PKDrawingPaletteView contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "undoRedoView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRedoEnabled:", v9);

}

- (NSArray)inputAssistantItems
{
  void *v3;
  __CFString *v4;
  void *v5;
  _BOOL8 v6;
  _BOOL8 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD block[4];
  const __CFString *v20;
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[PKDrawingPaletteView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  -[__CFString keyboardSceneDelegate](v4, "keyboardSceneDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[PKPaletteView isVisible](self, "isVisible");
    v7 = -[PKDrawingPaletteView isHandwritingToolSelected](self, "isHandwritingToolSelected");
    v8 = objc_msgSend(v5, "shouldSuppressInputAssistantUpdates");
    v9 = (void *)MEMORY[0x1E0C9AA60];
    if (v7 && v6)
    {
      if ((_os_feature_enabled_impl() | v8) == 1)
      {
        -[PKDrawingPaletteView inputAssistantButtonProvider](self, "inputAssistantButtonProvider");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "buttonsForCurrentConfiguration");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v12 = os_log_create("com.apple.pencilkit", "PKPalette");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v22 = CFSTR("UIKeyboardSceneDelegate.shouldSuppressInputAssistantUpdates is 'NO' yet something requested inputAssistantItems");
          _os_log_error_impl(&dword_1BE213000, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __43__PKDrawingPaletteView_inputAssistantItems__block_invoke;
        block[3] = &unk_1E7778020;
        v20 = CFSTR("UIKeyboardSceneDelegate.shouldSuppressInputAssistantUpdates is 'NO' yet something requested inputAssistantItems");
        if (inputAssistantItems_onceToken == -1)
        {
          v13 = CFSTR("UIKeyboardSceneDelegate.shouldSuppressInputAssistantUpdates is 'NO' yet something requested inputAssistantItems");
        }
        else
        {
          dispatch_once(&inputAssistantItems_onceToken, block);
          v13 = (__CFString *)v20;
        }

        v9 = (void *)MEMORY[0x1E0C9AA60];
      }
    }
    v11 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v22 = v14;
      v23 = 2112;
      v24 = v15;
      v25 = 2112;
      v26 = v16;
      v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_1BE213000, v11, OS_LOG_TYPE_INFO, "Returning %@ input assistant item(s). isVisible = %@, isHandwritingToolSelected = %@, shouldSuppressInputAssistantUpdates = %@", buf, 0x2Au);

    }
  }
  else
  {
    v11 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v22 = v4;
      v23 = 2048;
      v24 = 0;
      _os_log_impl(&dword_1BE213000, v11, OS_LOG_TYPE_INFO, "No input assistant items. Either drawing palette is not in a scene (%p), or has not input responder controller (%p).", buf, 0x16u);
    }
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v9;
}

void __43__PKDrawingPaletteView_inputAssistantItems__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_fault_impl(&dword_1BE213000, v2, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v4, 0xCu);
  }

}

- (BOOL)enableKeyboardButtons
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;

  -[PKDrawingPaletteView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardSceneDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "hasNullInputView");
  else
    v6 = 0;
  -[PKDrawingPaletteView window](self, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "screen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_isEmbeddedScreen");

  if (v10)
  {
    -[PKDrawingPaletteView firstResponderController](self, "firstResponderController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstResponder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEditableTextInput");
    if (v6)
      v14 = 0;
    else
      v14 = v13;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (int64_t)floatingKeyboardType
{
  objc_opt_self();
  return __PKFloatingKeyboardType;
}

- (id)undoManager
{
  NSUndoManager *undoManager;
  NSUndoManager *v3;

  undoManager = self->_undoManager;
  if (undoManager)
  {
    v3 = undoManager;
  }
  else
  {
    v3 = (NSUndoManager *)objc_alloc_init(MEMORY[0x1E0CB3A48]);
    -[PKDrawingPaletteView setUndoManager:](self, "setUndoManager:", v3);
  }
  return v3;
}

- (void)setUndoManager:(id)a3
{
  NSUndoManager *v5;
  NSUndoManager **p_undoManager;
  NSUndoManager *undoManager;
  void *v8;
  NSUndoManager *v9;

  v5 = (NSUndoManager *)a3;
  p_undoManager = &self->_undoManager;
  undoManager = self->_undoManager;
  v9 = v5;
  if (undoManager != v5)
  {
    if (undoManager)
      -[PKDrawingPaletteView _releaseUndoManager](self, "_releaseUndoManager");
    objc_storeStrong((id *)&self->_undoManager, a3);
    if (*p_undoManager)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__changeWasUndone_, *MEMORY[0x1E0CB33B8], *p_undoManager);
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__changeWasRedone_, *MEMORY[0x1E0CB33B0], *p_undoManager);
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__changeWasDone_, *MEMORY[0x1E0CB33A0], *p_undoManager);

    }
  }

}

- (void)_releaseUndoManager
{
  NSUndoManager *undoManager;
  id v4;

  if (self->_undoManager)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0CB33B8], self->_undoManager);
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0CB33B0], self->_undoManager);
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0CB33A0], self->_undoManager);
    undoManager = self->_undoManager;
    self->_undoManager = 0;

  }
}

- (unint64_t)paletteViewType
{
  return 1;
}

- (PKPaletteButton)_plusButton
{
  void *v2;
  void *v3;
  void *v4;

  -[PKDrawingPaletteView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "additionalOptionsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "plusButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKPaletteButton *)v4;
}

- (void)_setPlusButton:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PKDrawingPaletteView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "additionalOptionsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlusButton:", v6);

  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__didTapPlusButton_, 64);
}

- (void)setShowsPlusButton:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (self->_showsPlusButton != a3)
  {
    self->_showsPlusButton = a3;
    -[PKPaletteView internalDelegate](self, "internalDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paletteViewStateDidChange:", self);

    -[PKDrawingPaletteView contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "paletteViewStateDidChange:", self);

    -[PKPaletteView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "paletteViewContentSizeDidChange:", self);

    -[PKDrawingPaletteView _updateUI](self, "_updateUI");
  }
}

- (void)setPlusButtonViewController:(id)a3
{
  UIViewController *v5;
  void *v6;
  UIViewController *v7;

  v5 = (UIViewController *)a3;
  if (self->_plusButtonViewController != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_plusButtonViewController, a3);
    -[PKDrawingPaletteView contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "paletteViewStateDidChange:", self);

    v5 = v7;
  }

}

- (void)setShowsTextButton:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (self->_showsTextButton != a3)
  {
    self->_showsTextButton = a3;
    -[PKPaletteView internalDelegate](self, "internalDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paletteViewStateDidChange:", self);

    -[PKDrawingPaletteView contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "paletteViewStateDidChange:", self);

    -[PKPaletteView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "paletteViewContentSizeDidChange:", self);

    -[PKDrawingPaletteView _updateUI](self, "_updateUI");
  }
}

- (void)setShowsShapeButton:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (self->_showsShapeButton != a3)
  {
    self->_showsShapeButton = a3;
    -[PKPaletteView internalDelegate](self, "internalDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paletteViewStateDidChange:", self);

    -[PKDrawingPaletteView contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "paletteViewStateDidChange:", self);

    -[PKPaletteView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "paletteViewContentSizeDidChange:", self);

    -[PKDrawingPaletteView _updateUI](self, "_updateUI");
  }
}

- (void)setWantsUndoRedoButtonsVisibleInCompactSize:(BOOL)a3
{
  id v4;

  if (self->_wantsUndoRedoButtonsVisibleInCompactSize != a3)
  {
    self->_wantsUndoRedoButtonsVisibleInCompactSize = a3;
    -[PKDrawingPaletteView contentView](self, "contentView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paletteViewStateDidChange:", self);

  }
}

- (void)setWantsEllipsisButtonVisibleInCompactSize:(BOOL)a3
{
  id v4;

  if (self->_wantsEllipsisButtonVisibleInCompactSize != a3)
  {
    self->_wantsEllipsisButtonVisibleInCompactSize = a3;
    -[PKDrawingPaletteView contentView](self, "contentView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paletteViewStateDidChange:", self);

  }
}

- (void)setWantsBottomLineDividerVisibleInCompactSize:(BOOL)a3
{
  if (self->_wantsBottomLineDividerVisibleInCompactSize != a3)
  {
    self->_wantsBottomLineDividerVisibleInCompactSize = a3;
    -[PKDrawingPaletteView _updateUI](self, "_updateUI");
  }
}

- (BOOL)isEllipsisButtonVisible
{
  void *v2;
  char v3;

  -[PKDrawingPaletteView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEllipsisButtonVisible");

  return v3;
}

- (BOOL)isPalettePresentingPopover
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PKDrawingPaletteView;
  if (-[PKPaletteView isPalettePresentingPopover](&v16, sel_isPalettePresentingPopover))
    return 1;
  -[PKPaletteView palettePopoverPresentingController](self, "palettePopoverPresentingController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB34D0];
    -[PKDrawingPaletteView annotationDelegate](self, "annotationDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v6 == v9;

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v5, "popoverPresentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sourceView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDrawingPaletteView contextualEditingView](self, "contextualEditingView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isDescendantOfView:", v13);

  v3 = v14 | v10;
  return v3;
}

- (void)_setSelectedToolColor:(id)a3 ignoreColorOpacity:(BOOL)a4 isContinuousColorSelection:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v5 = a5;
  v22 = a3;
  -[PKDrawingPaletteView contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "toolPickerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectedToolView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tool");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inkingTool");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "ink");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v12, "ink");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "color");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "alphaComponent");
      v17 = v16;

      if (a4)
      {
        objc_msgSend(v22, "colorWithAlphaComponent:", v17);
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = v22;
      }
      v19 = v18;
      objc_msgSend(v12, "setInkColor:", v18);
      -[NSArray objectAtIndexedSubscript:](self->_tools, "objectAtIndexedSubscript:", self->_indexOfSelectedTool);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKToolFromPaletteTool toolByApplyingPropertiesFromPaletteTool:toTool:](PKToolFromPaletteTool, "toolByApplyingPropertiesFromPaletteTool:toTool:", v12, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKDrawingPaletteView _replaceToolAtIndex:withTool:notifyDelegate:](self, "_replaceToolAtIndex:withTool:notifyDelegate:", self->_indexOfSelectedTool, v21, !v5);
    }
  }

}

- (void)setColorUserInterfaceStyle:(int64_t)a3
{
  if (self->_colorUserInterfaceStyle != a3)
  {
    self->_colorUserInterfaceStyle = a3;
    -[PKDrawingPaletteView _updateUI](self, "_updateUI");
  }
}

- (void)setFingerDrawsOptionEnabled:(BOOL)a3
{
  if (self->_fingerDrawsOptionEnabled != a3)
  {
    self->_fingerDrawsOptionEnabled = a3;
    -[PKDrawingPaletteView _updateUI](self, "_updateUI");
  }
}

- (void)setEditingStrokeSelection:(BOOL)a3
{
  if (self->_editingStrokeSelection != a3)
  {
    self->_editingStrokeSelection = a3;
    -[PKDrawingPaletteView updateColorPickerSelectedColor](self, "updateColorPickerSelectedColor");
  }
}

- (void)setEditingTextSelection:(BOOL)a3
{
  if (self->_editingTextSelection != a3)
  {
    self->_editingTextSelection = a3;
    -[PKDrawingPaletteView setContextEditingMode:](self, "setContextEditingMode:", -[PKDrawingPaletteView isEditingTextSelection](self, "isEditingTextSelection"));
  }
}

- (void)setEditingExternalElementsSelection:(BOOL)a3
{
  uint64_t v4;

  if (self->_editingExternalElementsSelection != a3)
  {
    self->_editingExternalElementsSelection = a3;
    if (-[PKDrawingPaletteView isEditingExternalElementsSelection](self, "isEditingExternalElementsSelection"))
      v4 = 4;
    else
      v4 = 0;
    -[PKDrawingPaletteView setContextEditingMode:](self, "setContextEditingMode:", v4);
    -[PKDrawingPaletteView updateColorPickerSelectedColor](self, "updateColorPickerSelectedColor");
  }
}

- (void)setShowsLassoToolEditingView:(BOOL)a3
{
  id v4;

  if (self->_showsLassoToolEditingView != a3)
  {
    self->_showsLassoToolEditingView = a3;
    -[PKDrawingPaletteView contentView](self, "contentView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paletteViewStateDidChange:", self);

  }
}

- (void)setLassoToolEditingViewIdentifier:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  void *v9;
  NSString *v10;
  NSString *lassoToolEditingViewIdentifier;
  NSString *v12;

  v4 = a3;
  v5 = self->_lassoToolEditingViewIdentifier;
  v6 = (NSString *)v4;
  v12 = v6;
  if (v5 == v6)
  {

    v9 = v12;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      v8 = v12;
      if (v7)
        goto LABEL_10;
    }
    else
    {

      v8 = v12;
    }
    v10 = (NSString *)-[NSString copy](v8, "copy");
    lassoToolEditingViewIdentifier = self->_lassoToolEditingViewIdentifier;
    self->_lassoToolEditingViewIdentifier = v10;

    -[PKDrawingPaletteView contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLassoToolEditingViewIdentifier:", self->_lassoToolEditingViewIdentifier);
  }

  v8 = v12;
LABEL_10:

}

- (void)setColorSwatchesVisible:(BOOL)a3
{
  id v4;

  if (self->_colorSwatchesVisible != a3)
  {
    self->_colorSwatchesVisible = a3;
    -[PKDrawingPaletteView contentView](self, "contentView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paletteViewStateDidChange:", self);

  }
}

- (void)setPrefersLargeContextualEditingUI:(BOOL)a3
{
  id v4;

  if (self->_prefersLargeContextualEditingUI != a3)
  {
    self->_prefersLargeContextualEditingUI = a3;
    -[PKDrawingPaletteView contentView](self, "contentView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paletteViewStateDidChange:", self);

  }
}

- (void)setSelectedAnnotationType:(int64_t)a3
{
  uint64_t v5;

  if (self->_selectedAnnotationType != a3)
  {
    v5 = 0;
    self->_selectedAnnotationType = a3;
    if (a3 > 10)
    {
      if (a3 == 11)
      {
        v5 = 3;
        goto LABEL_10;
      }
      if (a3 != 12)
        goto LABEL_8;
    }
    else if (a3)
    {
      if (a3 == 10)
      {
        v5 = 1;
        goto LABEL_10;
      }
LABEL_8:
      v5 = 2;
    }
LABEL_10:
    -[PKDrawingPaletteView setContextEditingMode:](self, "setContextEditingMode:", v5);
    -[PKDrawingPaletteView updateColorPickerSelectedColor](self, "updateColorPickerSelectedColor");
  }
}

- (void)updateColorPickerSelectedColor
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _BOOL8 v22;
  void *v23;
  void *v24;
  id v25;

  v3 = -[PKDrawingPaletteView contextEditingMode](self, "contextEditingMode");
  if ((unint64_t)(v3 - 1) < 3)
  {
    -[PKDrawingPaletteView annotationDelegate](self, "annotationDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paletteViewSelectedAnnotationColor:", self);
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v25 = (id)v5;
LABEL_4:

    goto LABEL_17;
  }
  if (v3 == 4)
  {
    -[PKPaletteView delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[PKPaletteView delegate](self, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "paletteViewCurrentSelectionColor:", self);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
  }
  else if (!v3)
  {
    v6 = -[PKDrawingPaletteView isEditingStrokeSelection](self, "isEditingStrokeSelection");
    -[PKDrawingPaletteView _selectedToolViewInToolPicker](self, "_selectedToolViewInToolPicker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7;
    if (v6)
    {
      objc_msgSend(v7, "tool");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "isLassoTool"))
      {
        v25 = 0;
LABEL_25:

        goto LABEL_4;
      }
      -[PKDrawingPaletteView _selectedToolViewInToolPicker](self, "_selectedToolViewInToolPicker");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "supportsDisplayingSelectedColor"))
      {
        v25 = 0;
        goto LABEL_24;
      }
      -[PKDrawingPaletteView _selectedToolViewInToolPicker](self, "_selectedToolViewInToolPicker");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "tool");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "inkingTool");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "ink");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "color");
      v25 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
LABEL_24:

      goto LABEL_25;
    }
    v16 = objc_msgSend(v7, "supportsDisplayingSelectedColor");

    if (v16)
    {
      -[PKDrawingPaletteView _selectedToolViewInToolPicker](self, "_selectedToolViewInToolPicker");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "tool");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "inkingTool");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ink");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "color");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
  }
  v25 = 0;
LABEL_17:
  -[PKDrawingPaletteView contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "colorPickerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSelectedColor:", v25);

  -[PKDrawingPaletteView _selectedToolViewInToolPicker](self, "_selectedToolViewInToolPicker");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "configuration");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
  {
    if (*(_BYTE *)(v20 + 16))
      v22 = *(_BYTE *)(v20 + 17) != 0;
    else
      v22 = 1;
  }
  else
  {
    v22 = 0;
  }
  -[PKDrawingPaletteView contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "colorPickerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setSupportsAlpha:", v22);

}

- (id)_selectedToolViewInToolPicker
{
  void *v2;
  void *v3;
  void *v4;

  -[PKDrawingPaletteView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toolPickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedToolView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_isPaletteContentViewHidden
{
  void *v2;
  void *v3;
  char v4;

  -[PKDrawingPaletteView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toolPickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");

  return v4;
}

- (void)_updateToolPreviewPositionForEdge:(unint64_t)a3
{
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
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  -[PKDrawingPaletteView _selectedToolViewInToolPicker](self, "_selectedToolViewInToolPicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && -[PKPaletteView isToolPreviewInstalled](self, "isToolPreviewInstalled"))
  {
    v6 = (void *)MEMORY[0x1E0CB3718];
    -[PKPaletteView toolPreviewCenterXConstraint](self, "toolPreviewCenterXConstraint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v7;
    -[PKPaletteView toolPreviewCenterYConstraint](self, "toolPreviewCenterYConstraint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deactivateConstraints:", v9);

    if (a3 == 8 || a3 == 2)
    {
      -[PKPaletteView toolPreview](self, "toolPreview");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "centerXAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteView containerView](self, "containerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "centerXAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteView setToolPreviewCenterXConstraint:](self, "setToolPreviewCenterXConstraint:", v14);

      -[PKPaletteView toolPreview](self, "toolPreview");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "centerYAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "centerYAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToAnchor:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteView setToolPreviewCenterYConstraint:](self, "setToolPreviewCenterYConstraint:", v18);
    }
    else
    {
      -[PKPaletteView toolPreview](self, "toolPreview");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "centerXAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "centerXAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteView setToolPreviewCenterXConstraint:](self, "setToolPreviewCenterXConstraint:", v22);

      -[PKPaletteView toolPreview](self, "toolPreview");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "centerYAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteView containerView](self, "containerView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "centerYAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToAnchor:", v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteView setToolPreviewCenterYConstraint:](self, "setToolPreviewCenterYConstraint:", v23);

    }
    v24 = (void *)MEMORY[0x1E0CB3718];
    -[PKPaletteView toolPreviewCenterXConstraint](self, "toolPreviewCenterXConstraint");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v25;
    -[PKPaletteView toolPreviewCenterYConstraint](self, "toolPreviewCenterYConstraint");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v27);

  }
}

- (void)_updateToolPreviewContentsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PKDrawingPaletteView _selectedToolViewInToolPicker](self, "_selectedToolViewInToolPicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tool");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[PKPaletteView toolPreview](self, "toolPreview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showPreviewForTool:animated:", v8, v3);

  -[PKPaletteView toolPreview](self, "toolPreview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEdgeLocation:", 4);

}

- (void)undoRedoViewDidTapUndo:(id)a3
{
  void *v4;

  -[PKDrawingPaletteView undoManager](self, "undoManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "undo");

  -[PKDrawingPaletteView setNeedsLayout](self, "setNeedsLayout");
  +[PKTextInputUtilities markAnalyticsForUndo](PKTextInputUtilities, "markAnalyticsForUndo");
}

- (void)undoRedoViewDidTapRedo:(id)a3
{
  void *v4;

  -[PKDrawingPaletteView undoManager](self, "undoManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "redo");

  -[PKDrawingPaletteView setNeedsLayout](self, "setNeedsLayout");
  +[PKTextInputUtilities markAnalyticsForRedo](PKTextInputUtilities, "markAnalyticsForRedo");
}

- (UIWindowScene)windowScene
{
  void *v2;
  void *v3;

  -[PKDrawingPaletteView window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIWindowScene *)v3;
}

- (void)windowFirstResponderController:(id)a3 didChangeFirstResponder:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  id v21;

  v21 = a3;
  v6 = a4;
  objc_msgSend(v6, "_responderWindow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDrawingPaletteView window](self, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != v10)
    goto LABEL_9;
  objc_msgSend(v21, "firstResponder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isNotesHandwritingResponder");

  if (v12)
  {
    -[PKDrawingPaletteView _updateHandwritingAssistantItemsFromResponder:](self, "_updateHandwritingAssistantItemsFromResponder:", v6);
    -[PKDrawingPaletteView contentView](self, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "paletteViewStateDidChangeEnableKeyboardButtons:", self);

    -[PKPaletteView internalDelegate](self, "internalDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "paletteViewStateDidChangeEnableKeyboardButtons:", self);
  }
  else
  {
    -[PKDrawingPaletteView selectedTool](self, "selectedTool");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ink");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "_isHandwritingInk");

    if ((v17 & 1) != 0)
      goto LABEL_7;
    -[PKDrawingPaletteView floatingKeyboardController](self, "floatingKeyboardController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteFloatingKeyboardController dismissWithReason:]((uint64_t)v14, CFSTR("First Responder is not for the handwriting tool"));
  }

LABEL_7:
  -[PKPaletteView delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    -[PKPaletteView delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "paletteViewFirstResponderDidUpdate:", self);

  }
LABEL_9:

}

- (PKTextInputWindowFirstResponder)windowFirstResponder
{
  void *v2;
  void *v3;

  -[PKDrawingPaletteView firstResponderController](self, "firstResponderController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKTextInputWindowFirstResponder *)v3;
}

- (void)floatingKeyboardControllerWillShow:(id)a3
{
  id v3;

  -[PKDrawingPaletteView firstResponderController](self, "firstResponderController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPaletteFloatingMode:", 1);

}

- (void)floatingKeyboardControllerWillHide:(id)a3
{
  id v3;

  -[PKDrawingPaletteView firstResponderController](self, "firstResponderController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPaletteFloatingMode:", 0);

}

- (void)floatingKeyboardController:(id)a3 didChangeKeyboardType:(int64_t)a4
{
  void *v5;
  char v6;
  id v7;

  -[PKDrawingPaletteView contentView](self, "contentView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[PKDrawingPaletteView contentView](self, "contentView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "paletteViewStateDidChangeFloatingKeyboardType:", self);

  }
}

- (void)toolPicker:(id)a3 didSelectTool:(id)a4 atIndex:(unint64_t)a5
{
  void *v7;
  void *v8;

  -[PKDrawingPaletteView contentView](self, "contentView", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorPickerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadColorsForCurrentColorPickerMode");

  -[PKDrawingPaletteView _selectToolAtIndex:updateUI:notifyDelegate:](self, "_selectToolAtIndex:updateUI:notifyDelegate:", a5, 1, 1);
}

- (void)toolPickerDidToggleRulerTool:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[PKPaletteView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[PKPaletteView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "paletteViewDidToggleRuler:", self);

  }
}

- (double)toolPickerView:(id)a3 widthForToolAtIndex:(int64_t)a4 isCompactSize:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  double v10;
  double v11;

  v5 = a5;
  v8 = a3;
  -[PKDrawingPaletteView contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "toolPickerView:widthForToolAtIndex:isCompactSize:", v8, a4, v5);
  v11 = v10;

  return v11;
}

- (CGRect)toolPickerViewSourceRectForPopoverPresentation:(id)a3 fromCorner:(unint64_t)a4
{
  CGRect v4;

  -[PKDrawingPaletteView bounds](self, "bounds", a3, a4);
  return CGRectInset(v4, 0.0, -5.0);
}

- (void)colorPickerDidChangeSelectedColor:(id)a3 isFromExtendedColorPicker:(BOOL)a4 isContinuousColorSelection:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  void *v9;

  v5 = a5;
  v6 = a4;
  objc_msgSend(a3, "selectedColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    -[PKDrawingPaletteView _setSelectedColor:isFromExtendedColorPicker:isContinuousColorSelection:](self, "_setSelectedColor:isFromExtendedColorPicker:isContinuousColorSelection:", v8, v6, v5);
    v8 = v9;
  }

}

- (void)_setSelectedColor:(id)a3 isFromExtendedColorPicker:(BOOL)a4 isContinuousColorSelection:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  int v13;
  _BOOL8 editingStrokeSelection;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  int v21;
  id v22;

  v5 = a5;
  v6 = a4;
  v22 = a3;
  -[PKPaletteView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PKPaletteView delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "paletteView:shouldChangeSelectedToolColor:", self, v22);

    if (!v10)
    {
      v11 = 1;
      goto LABEL_10;
    }
  }
  else
  {

  }
  if (!-[PKDrawingPaletteView isEditingStrokeSelection](self, "isEditingStrokeSelection"))
    -[PKDrawingPaletteView _setSelectedToolColor:ignoreColorOpacity:isContinuousColorSelection:](self, "_setSelectedToolColor:ignoreColorOpacity:isContinuousColorSelection:", v22, !v6, v5);
  -[PKDrawingPaletteView selectedTool](self, "selectedTool");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "_isLassoTool");

  if (v13)
  {
    editingStrokeSelection = self->_editingStrokeSelection;
    -[PKDrawingPaletteView _selectedToolViewInToolPicker](self, "_selectedToolViewInToolPicker");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSupportsDisplayingSelectedColor:", editingStrokeSelection);

    -[PKDrawingPaletteView _setSelectedToolColor:ignoreColorOpacity:isContinuousColorSelection:](self, "_setSelectedToolColor:ignoreColorOpacity:isContinuousColorSelection:", v22, !v6, v5);
  }
  v11 = 0;
LABEL_10:
  -[PKDrawingPaletteView _selectedToolViewInToolPicker](self, "_selectedToolViewInToolPicker");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "tool");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "isLassoTool") & 1) != 0
    || -[PKDrawingPaletteView isEditingStrokeSelection](self, "isEditingStrokeSelection"))
  {

  }
  else
  {
    v21 = v11 | -[PKDrawingPaletteView isEditingExternalElementsSelection](self, "isEditingExternalElementsSelection");

    if (v21 != 1)
      goto LABEL_16;
  }
  -[PKPaletteView delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    -[PKPaletteView delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "paletteView:didChangeColor:", self, v22);

  }
LABEL_16:
  -[PKDrawingPaletteView updateColorPickerSelectedColor](self, "updateColorPickerSelectedColor");
  -[PKDrawingPaletteView _updateToolPreviewContentsAnimated:](self, "_updateToolPreviewContentsAnimated:", 0);

}

- (BOOL)colorPickerShouldDisplayColorSelection:(id)a3
{
  void *v3;
  char v4;

  -[PKDrawingPaletteView _selectedToolViewInToolPicker](self, "_selectedToolViewInToolPicker", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsDisplayingSelectedColor");

  return v4;
}

- (void)_reloadImageForToolItem:(id)a3
{
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = -[NSArray count](self->_tools, "count");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    while (1)
    {
      -[NSArray objectAtIndexedSubscript:](self->_tools, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_toolPickerItemIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

      if (v10)
        break;

      if (v5 == ++v6)
        goto LABEL_7;
    }
    -[PKDrawingPaletteView contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "toolPickerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "toolViews");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setToolImageNeedsReload");

  }
LABEL_7:

}

- (void)hostView:(id)a3 willDockPaletteToPosition:(int64_t)a4 prepareForExpansion:(BOOL)a5
{
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKDrawingPaletteView;
  -[PKPaletteView hostView:willDockPaletteToPosition:prepareForExpansion:](&v8, sel_hostView_willDockPaletteToPosition_prepareForExpansion_, a3, a4, a5);
  -[PKDrawingPaletteView contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "toolPickerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateClippingViewEdgesVisibility");

}

- (void)hostView:(id)a3 didDockPaletteToPosition:(int64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKDrawingPaletteView;
  -[PKPaletteView hostView:didDockPaletteToPosition:](&v5, sel_hostView_didDockPaletteToPosition_, a3, a4);
  -[PKPaletteView _saveOptions](self, "_saveOptions");
}

- (void)_willDockPaletteToEdge:(unint64_t)a3 prepareForExpansion:(BOOL)a4 isPaletteChangingOrientation:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v9;
  void *v10;
  _QWORD v11[6];
  objc_super v12;

  v5 = a5;
  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKDrawingPaletteView;
  -[PKPaletteView _willDockPaletteToEdge:prepareForExpansion:isPaletteChangingOrientation:](&v12, sel__willDockPaletteToEdge_prepareForExpansion_isPaletteChangingOrientation_);
  -[PKDrawingPaletteView contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEdgeLocation:", a3);

  -[PKDrawingPaletteView contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCornerLocation:", -1);

  -[PKDrawingPaletteView setNeedsLayout](self, "setNeedsLayout");
  -[PKDrawingPaletteView layoutIfNeeded](self, "layoutIfNeeded");
  if (v6)
  {
    if (v5)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __96__PKDrawingPaletteView__willDockPaletteToEdge_prepareForExpansion_isPaletteChangingOrientation___block_invoke;
      v11[3] = &unk_1E7778048;
      v11[4] = self;
      v11[5] = a3;
      objc_msgSend(MEMORY[0x1E0DC3F10], "_performWithoutRetargetingAnimations:", v11);
    }
    else
    {
      -[PKDrawingPaletteView _centerPaletteContainerSubviewToCurrentlySelectedToolForEdge:needsContainerViewLayout:](self, "_centerPaletteContainerSubviewToCurrentlySelectedToolForEdge:needsContainerViewLayout:", a3, 0);
      -[PKDrawingPaletteView _updateToolPreviewPositionForEdge:](self, "_updateToolPreviewPositionForEdge:", a3);
      -[PKDrawingPaletteView _updateToolPreviewContentsAnimated:](self, "_updateToolPreviewContentsAnimated:", 0);
    }
  }
}

uint64_t __96__PKDrawingPaletteView__willDockPaletteToEdge_prepareForExpansion_isPaletteChangingOrientation___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_centerPaletteContainerSubviewToCurrentlySelectedToolForEdge:needsContainerViewLayout:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 32), "_updateToolPreviewPositionForEdge:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateToolPreviewContentsAnimated:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_willDockPaletteToCorner:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKDrawingPaletteView;
  -[PKPaletteView _willDockPaletteToCorner:](&v8, sel__willDockPaletteToCorner_);
  -[PKDrawingPaletteView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissPalettePopoverWithCompletion:", 0);

  -[PKDrawingPaletteView _updateToolPreviewPositionForEdge:](self, "_updateToolPreviewPositionForEdge:", -[PKPaletteView lastPaletteEdgePositionWhileDragging](self, "lastPaletteEdgePositionWhileDragging"));
  -[PKDrawingPaletteView _updateToolPreviewContentsAnimated:](self, "_updateToolPreviewContentsAnimated:", 0);
  -[PKDrawingPaletteView contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerLocation:", a3);

  -[PKDrawingPaletteView contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEdgeLocation:", 15);

}

- (void)_centerPaletteContainerSubviewToCurrentlySelectedToolForEdge:(unint64_t)a3 needsContainerViewLayout:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  id v28;

  v4 = a4;
  -[PKDrawingPaletteView _selectedToolViewInToolPicker](self, "_selectedToolViewInToolPicker");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (v28 && v4)
  {
    -[PKPaletteView containerView](self, "containerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutIfNeeded");

  }
  else if (!v28)
  {
    goto LABEL_10;
  }
  -[PKDrawingPaletteView contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "toolPickerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scrollSelectedToolViewToVisibleAnimated:", 0);

  -[PKPaletteView containerView](self, "containerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "center");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v28, "superview");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertPoint:fromView:", v15, v12, v14);
  v17 = v16;
  v19 = v18;

  -[PKDrawingPaletteView paletteSizeForEdge:](self, "paletteSizeForEdge:", a3);
  if (a3 == 8 || a3 == 2)
  {
    v22 = v21 * 0.5 - v19;
    -[PKPaletteView paletteContainerCenterYConstraint](self, "paletteContainerCenterYConstraint");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setConstant:", v22);

    -[PKPaletteView paletteContainerCenterXConstraint](self, "paletteContainerCenterXConstraint");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = v20 * 0.5 - v17;
    -[PKPaletteView paletteContainerCenterXConstraint](self, "paletteContainerCenterXConstraint");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setConstant:", v25);

    -[PKPaletteView paletteContainerCenterYConstraint](self, "paletteContainerCenterYConstraint");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27 = v24;
  objc_msgSend(v24, "setConstant:", 0.0);

LABEL_10:
}

- (void)toolPreviewDidChangeToolColor:(id)a3 isContinuousColorSelection:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  objc_msgSend(a3, "toolColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    -[PKDrawingPaletteView _setSelectedToolColor:ignoreColorOpacity:isContinuousColorSelection:](self, "_setSelectedToolColor:ignoreColorOpacity:isContinuousColorSelection:", v6, 0, v4);
    -[PKDrawingPaletteView updateColorPickerSelectedColor](self, "updateColorPickerSelectedColor");
    v6 = v7;
  }

}

- (void)_didTapPlusButton:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PKDrawingPaletteView plusButtonViewController](self, "plusButtonViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PKDrawingPaletteView plusButtonViewController](self, "plusButtonViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDrawingPaletteView _presentViewController:asPopoverFromView:](self, "_presentViewController:asPopoverFromView:", v5, v6);
  }
  else
  {
    -[PKDrawingPaletteView annotationDelegate](self, "annotationDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "paletteViewDidSelectPlusButton:", self);
  }

}

- (void)_didTapTextButton:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKDrawingPaletteView textButtonViewController](self, "textButtonViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKDrawingPaletteView _presentViewController:asPopoverFromView:](self, "_presentViewController:asPopoverFromView:", v5, v4);

}

- (void)_didTapShapeButton:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKDrawingPaletteView shapeButtonViewController](self, "shapeButtonViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKDrawingPaletteView _presentViewController:asPopoverFromView:](self, "_presentViewController:asPopoverFromView:", v5, v4);

}

- (void)_presentViewController:(id)a3 asPopoverFromView:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  double x;
  double y;
  double width;
  double height;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;
  CGRect v35;
  CGRect v36;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
    goto LABEL_6;
  -[PKPaletteView palettePopoverPresentingController](self, "palettePopoverPresentingController");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_6;
  v9 = (void *)v8;
  v10 = v6;
  if (objc_msgSend(v10, "isBeingPresented"))
  {

    goto LABEL_6;
  }
  v11 = objc_msgSend(v10, "isBeingDismissed");

  if (v11)
  {
LABEL_6:
    v12 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 138412546;
      v31 = v6;
      v32 = 2112;
      v33 = v7;
      _os_log_impl(&dword_1BE213000, v12, OS_LOG_TYPE_DEFAULT, "Can't present view controller: %@, as popover from view: %@", (uint8_t *)&v30, 0x16u);
    }
    goto LABEL_8;
  }
  objc_msgSend(v10, "setModalPresentationStyle:", 7);
  objc_msgSend(v10, "popoverPresentationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDelegate:", self);

  -[PKDrawingPaletteView traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDrawingPaletteView window](self, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "windowScene");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (PKUseCompactSize(v14, v16))
  {
    v17 = 2;
  }
  else
  {
    v18 = -[PKPaletteView palettePosition](self, "palettePosition") - 1;
    if (v18 > 7)
      v17 = 15;
    else
      v17 = qword_1BE4FF170[v18];
  }
  objc_msgSend(v10, "popoverPresentationController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPermittedArrowDirections:", v17);

  objc_msgSend(v7, "bounds");
  v36 = CGRectInset(v35, -5.0, -5.0);
  x = v36.origin.x;
  y = v36.origin.y;
  width = v36.size.width;
  height = v36.size.height;
  objc_msgSend(v10, "popoverPresentationController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setSourceRect:", x, y, width, height);

  objc_msgSend(v10, "popoverPresentationController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setSourceView:", v7);

  objc_msgSend(v10, "popoverPresentationController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_setShouldDisableInteractionDuringTransitions:", 0);

  -[PKPaletteView palettePopoverPassthroughViews](self, "palettePopoverPassthroughViews");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "popoverPresentationController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setPassthroughViews:", v27);

  objc_msgSend(v10, "popoverPresentationController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_setIgnoresKeyboardNotifications:", 1);

  -[PKPaletteView updatePalettePopover:](self, "updatePalettePopover:", v10);
  if (-[PKPaletteView shouldPalettePresentPopover](self, "shouldPalettePresentPopover")
    && !-[PKDrawingPaletteView isPalettePresentingPopover](self, "isPalettePresentingPopover"))
  {
    -[PKDrawingPaletteView setPresentedPopoverViewController:](self, "setPresentedPopoverViewController:", v10);
    -[PKPaletteView palettePopoverPresentingController](self, "palettePopoverPresentingController");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject presentViewController:animated:completion:](v12, "presentViewController:animated:completion:", v10, 1, 0);
LABEL_8:

  }
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)additionalOptionsView:(id)a3 didToggleAutoHideOption:(BOOL)a4
{
  -[PKPaletteView setAutoHideEnabled:](self, "setAutoHideEnabled:", a4);
}

- (void)additionalOptionsViewDidPressReturnKeyButton:(id)a3
{
  +[PKPaletteKeyboardUtilities performReturn](PKPaletteKeyboardUtilities, "performReturn", a3);
}

- (void)additionalOptionsViewDidPressTapToRadarButton:(id)a3
{
  id v3;

  -[PKDrawingPaletteView tapToRadarCommand](self, "tapToRadarCommand", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "execute");

}

- (id)keyboardSelectionMenuForAdditionalOptionsView:(id)a3
{
  id *v3;
  void *v4;

  -[PKDrawingPaletteView floatingKeyboardController](self, "floatingKeyboardController", a3);
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteFloatingKeyboardController keyboardSelectionMenu](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_presentOrDismissFloatingKeyboard
{
  id v2;

  -[PKDrawingPaletteView floatingKeyboardController](self, "floatingKeyboardController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaletteFloatingKeyboardController presentOrDismissIfPresented]((uint64_t)v2);

}

- (void)contentViewDidSelectInputAssistantReturnKeyItem:(id)a3
{
  +[PKPaletteKeyboardUtilities performReturn](PKPaletteKeyboardUtilities, "performReturn", a3);
}

- (id)keyboardSelectionMenuForContentView:(id)a3
{
  id *v3;
  void *v4;

  -[PKDrawingPaletteView floatingKeyboardController](self, "floatingKeyboardController", a3);
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteFloatingKeyboardController keyboardSelectionMenu](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)contentViewDidResize:(id)a3
{
  void *v4;
  id v5;

  -[PKPaletteView internalDelegate](self, "internalDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paletteViewStateDidChange:", self);

  -[PKPaletteView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "paletteViewContentSizeDidChange:", self);

}

- (void)_performPencilInteraction:(id)a3 preferredAction:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  char v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  int64_t v37;
  uint64_t v38;
  NSObject *v39;
  int v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  uint8_t v52[16];
  uint8_t v53[16];
  uint8_t buf[16];

  -[PKDrawingPaletteView windowScene](self, "windowScene", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (-[PKDrawingPaletteView windowScene](self, "windowScene"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        +[PKPencilSqueezeInteraction _existingInteractionForWindowScene:](PKPencilSqueezeInteraction, "_existingInteractionForWindowScene:", v7), v8 = (void *)objc_claimAutoreleasedReturnValue(), v9 = objc_msgSend(v8, "_paletteViewVisible"), v8, v7, v9))
  {
    v10 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE213000, v10, OS_LOG_TYPE_DEFAULT, "Ignore pencil interaction", buf, 2u);
    }
  }
  else
  {
    v11 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v53 = 0;
      _os_log_impl(&dword_1BE213000, v11, OS_LOG_TYPE_DEFAULT, "Received pencil interaction", v53, 2u);
    }

    -[PKPaletteView hoverDelegate](self, "hoverDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "paletteViewPencilDidTap:", self);

    if (-[PKPaletteView isVisible](self, "isVisible")
      && (unint64_t)(-[PKPaletteView palettePosition](self, "palettePosition") - 1) <= 3)
    {
      -[PKPaletteView paletteViewHosting](self, "paletteViewHosting");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "tooltipPresentationHandle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 1;
    }
    else
    {
      v14 = 0;
      v13 = 0;
    }
    -[PKDrawingPaletteView contentView](self, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "toolPickerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTooltipPresentationHandle:", v13);

    if (v14)
    {

    }
    switch(a4)
    {
      case 1:
        -[PKDrawingPaletteView _performPencilPreferredActionSwitchEraser](self, "_performPencilPreferredActionSwitchEraser");
        goto LABEL_16;
      case 2:
        -[PKDrawingPaletteView _performPencilPreferredActionSwitchPrevious](self, "_performPencilPreferredActionSwitchPrevious");
LABEL_16:
        -[PKPaletteView paletteViewHosting](self, "paletteViewHosting");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "hostingView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKDrawingPaletteView selectedToolView](self, "selectedToolView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "toolName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKPaletteView hoverDelegate](self, "hoverDelegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "paletteViewPencilDidTap:", self);

        -[PKPaletteView _paletteViewHoverView](self, "_paletteViewHoverView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
          v23 = v18 == 0;
        else
          v23 = 1;
        v24 = !v23;
        if (!v23)
        {
          -[PKPaletteView _paletteViewHoverLocation](self, "_paletteViewHoverLocation");
          v25 = *MEMORY[0x1E0C9D820];
          v26 = *(double *)(MEMORY[0x1E0C9D820] + 8);
          v29 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v22, v18, v27, v28, *MEMORY[0x1E0C9D820], v26);
          v31 = v30;
          -[PKPaletteView paletteViewHosting](self, "paletteViewHosting");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "tooltipPresentationHandle");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDrawingPaletteView traitCollection](self, "traitCollection");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "showWithText:fromView:rect:atEdge:offset:traitCollection:", v20, v18, 4, v34, v29, v31, v25, v26, 28.0);

        }
        -[PKPaletteView hoverDelegate](self, "hoverDelegate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "paletteViewHoverDidSwitchToolsViaPencilInteraction:", self);

        if ((v24 & 1) == 0
          && v18
          && -[PKPaletteView isVisible](self, "isVisible")
          && (unint64_t)(-[PKPaletteView palettePosition](self, "palettePosition") - 5) <= 3)
        {
          v36 = -[PKPaletteView palettePosition](self, "palettePosition") - 1;
          v37 = -[PKPaletteView palettePosition](self, "palettePosition");
          if (v36 > 3)
          {
            if ((unint64_t)(v37 - 5) >= 2)
            {
              -[PKPaletteView palettePosition](self, "palettePosition");
              v38 = 4;
            }
            else
            {
              v38 = 1;
            }
          }
          else if ((unint64_t)(v37 - 1) >= 4)
          {
            v38 = 0;
          }
          else
          {
            v38 = qword_1BE4FF1B0[v37 - 1];
          }
          -[PKPaletteView paletteViewHosting](self, "paletteViewHosting");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "tooltipPresentationHandle");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDrawingPaletteView bounds](self, "bounds");
          v44 = v43;
          v46 = v45;
          v48 = v47;
          v50 = v49;
          -[PKDrawingPaletteView traitCollection](self, "traitCollection");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "showWithText:fromView:rect:atEdge:offset:traitCollection:", v20, self, v38, v51, v44, v46, v48, v50, 10.0);

        }
        v40 = 0;
        goto LABEL_43;
      case 3:
        -[PKDrawingPaletteView _performPencilPreferredActionShowColorPalette](self, "_performPencilPreferredActionShowColorPalette");
        goto LABEL_36;
      case 4:
        -[PKDrawingPaletteView _performPencilPreferredActionShowInkAttributes](self, "_performPencilPreferredActionShowInkAttributes");
        goto LABEL_36;
      default:
        v39 = os_log_create("com.apple.pencilkit", "PKPalette");
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v52 = 0;
          _os_log_impl(&dword_1BE213000, v39, OS_LOG_TYPE_DEFAULT, "Ignore Pencil interaction", v52, 2u);
        }

LABEL_36:
        v40 = 1;
LABEL_43:
        if (-[PKPaletteView isVisible](self, "isVisible")
          || ((v40 | !-[PKDrawingPaletteView isPencilInteractionEnabledWhenNotVisible](self, "isPencilInteractionEnabledWhenNotVisible")) & 1) != 0)
        {
          return;
        }
        -[PKPaletteView internalDelegate](self, "internalDelegate");
        v10 = objc_claimAutoreleasedReturnValue();
        -[NSObject paletteViewShowFeedbackForToolChange:](v10, "paletteViewShowFeedbackForToolChange:", self);
        break;
    }
  }

}

- (void)pencilInteractionDidTap:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  +[PKStatisticsManager sharedStatisticsManager]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3AC8], "preferredTapAction");
  -[PKStatisticsManager recordPencilAction:doubleTap:]((uint64_t)v4);

  -[PKPaletteView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[PKPaletteView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "paletteView:didReceivePencilInteractionDidTap:", self, v8);

  }
  -[PKDrawingPaletteView _performPencilInteraction:preferredAction:](self, "_performPencilInteraction:preferredAction:", v8, objc_msgSend(MEMORY[0x1E0DC3AC8], "preferredTapAction"));

}

- (void)_pencilInteraction:(id)a3 didReceiveSqueeze:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (_os_feature_enabled_impl() && !objc_msgSend(v6, "_phase"))
  {
    +[PKStatisticsManager sharedStatisticsManager]();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3AC8], "preferredSqueezeAction");
    -[PKStatisticsManager recordPencilAction:doubleTap:]((uint64_t)v7);

    -[PKDrawingPaletteView _performPencilInteraction:preferredAction:](self, "_performPencilInteraction:preferredAction:", v8, objc_msgSend(MEMORY[0x1E0DC3AC8], "preferredSqueezeAction"));
  }

}

- (void)_performPencilPreferredActionSwitchEraser
{
  BOOL v3;
  NSObject *v4;
  _BOOL4 v5;
  _BOOL8 v6;
  void *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v3 = -[PKDrawingPaletteView _canHandlePencilInteraction](self, "_canHandlePencilInteraction");
  v4 = os_log_create("com.apple.pencilkit", "PKPalette");
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Switch to or from eraser tool", v8, 2u);
    }

    -[PKDrawingPaletteView dismissPalettePopoverWithCompletion:](self, "dismissPalettePopoverWithCompletion:", 0);
    v6 = (unint64_t)(-[PKPaletteView palettePosition](self, "palettePosition") - 9) < 0xFFFFFFFFFFFFFFFCLL;
    -[PKDrawingPaletteView contentView](self, "contentView");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject toolPickerView](v4, "toolPickerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "toggleSelectedToolAndEraserAnimated:", v6);

  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Can't handle pencil interaction.", buf, 2u);
  }

}

- (void)_performPencilPreferredActionSwitchPrevious
{
  BOOL v3;
  NSObject *v4;
  _BOOL4 v5;
  _BOOL8 v6;
  void *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v3 = -[PKDrawingPaletteView _canHandlePencilInteraction](self, "_canHandlePencilInteraction");
  v4 = os_log_create("com.apple.pencilkit", "PKPalette");
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Switch to previous tool", v8, 2u);
    }

    -[PKDrawingPaletteView dismissPalettePopoverWithCompletion:](self, "dismissPalettePopoverWithCompletion:", 0);
    v6 = (unint64_t)(-[PKPaletteView palettePosition](self, "palettePosition") - 9) < 0xFFFFFFFFFFFFFFFCLL;
    -[PKDrawingPaletteView contentView](self, "contentView");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject toolPickerView](v4, "toolPickerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "toggleSelectedToolAndLastSelectedToolAnimated:", v6);

  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Can't handle pencil interaction.", buf, 2u);
  }

}

- (void)_performPencilPreferredActionShowColorPalette
{
  BOOL v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  uint8_t buf[16];

  v3 = -[PKDrawingPaletteView _canHandlePencilInteraction](self, "_canHandlePencilInteraction");
  v4 = os_log_create("com.apple.pencilkit", "PKPalette");
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Show color palette", buf, 2u);
    }

    if ((unint64_t)(-[PKPaletteView palettePosition](self, "palettePosition") - 5) <= 3)
    {
      -[PKPaletteView toolPreview](self, "toolPreview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "toggleColorSelectionPopover");

      return;
    }
    -[PKDrawingPaletteView contentView](self, "contentView");
    v4 = objc_claimAutoreleasedReturnValue();
    v7[4] = self;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69__PKDrawingPaletteView__performPencilPreferredActionShowColorPalette__block_invoke;
    v8[3] = &unk_1E777DA50;
    v8[4] = self;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__PKDrawingPaletteView__performPencilPreferredActionShowColorPalette__block_invoke_2;
    v7[3] = &unk_1E7778020;
    -[NSObject _dismissPalettePopoverUsingConfirmationBlock:completion:](v4, "_dismissPalettePopoverUsingConfirmationBlock:completion:", v8, v7);
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Can't handle pencil interaction.", buf, 2u);
  }

}

BOOL __69__PKDrawingPaletteView__performPencilPreferredActionShowColorPalette__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorPickerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 != v3;
}

void __69__PKDrawingPaletteView__performPencilPreferredActionShowColorPalette__block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  char v5;
  id v6;

  if (!objc_msgSend(*(id *)(a1 + 32), "showsLassoToolEditingView"))
    goto LABEL_4;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0
    || (objc_msgSend(*(id *)(a1 + 32), "delegate"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "toggleLassoToolEditingViewColorPickerForPaletteView:", *(_QWORD *)(a1 + 32)),
        v4,
        (v5 & 1) == 0))
  {
LABEL_4:
    objc_msgSend(*(id *)(a1 + 32), "contentView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "toggleColorSelectionPopover");

  }
}

- (void)_performPencilPreferredActionShowInkAttributes
{
  BOOL v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  v3 = -[PKDrawingPaletteView _canHandlePencilInteraction](self, "_canHandlePencilInteraction");
  v4 = os_log_create("com.apple.pencilkit", "PKPalette");
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Show ink attributes", buf, 2u);
    }

    -[PKDrawingPaletteView contentView](self, "contentView");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject colorPickerView](v4, "colorPickerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __70__PKDrawingPaletteView__performPencilPreferredActionShowInkAttributes__block_invoke;
    v7[3] = &unk_1E7778020;
    v7[4] = self;
    objc_msgSend(v6, "dismissPalettePopoverWithCompletion:", v7);

  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Can't handle pencil interaction.", buf, 2u);
  }

}

void __70__PKDrawingPaletteView__performPencilPreferredActionShowInkAttributes__block_invoke(uint64_t a1)
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
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "_paletteViewHoverView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "palettePopoverSourceRectToPresentViewController:", 0);
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    objc_msgSend(*(id *)(a1 + 32), "palettePopoverSourceView");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
    v4 = *MEMORY[0x1E0C9D628];
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "toolPickerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "toggleSelectedToolAttributesPopoverFromRect:inView:", v13, v4, v6, v8, v10);

}

- (BOOL)_canHandlePencilInteraction
{
  PKDrawingPaletteView *v2;
  void *v3;
  void *v4;
  char v5;

  v2 = self;
  if (-[PKPaletteView isVisible](self, "isVisible"))
  {
    -[PKPaletteView paletteViewHosting](v2, "paletteViewHosting");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v2) = objc_msgSend(v3, "isPaletteDragging") ^ 1;
  }
  else
  {
    if (!-[PKDrawingPaletteView isPencilInteractionEnabledWhenNotVisible](v2, "isPencilInteractionEnabledWhenNotVisible")|| (-[PKPaletteView delegate](v2, "delegate"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v5 = objc_opt_respondsToSelector(), v4, (v5 & 1) == 0))
    {
      LOBYTE(v2) = 0;
      return (char)v2;
    }
    -[PKPaletteView delegate](v2, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v2) = objc_msgSend(v3, "shouldHandlePencilInteractionWhenNotVisible:", v2);
  }

  return (char)v2;
}

- (void)configureForDockedAtCorner
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKDrawingPaletteView;
  -[PKPaletteView configureForDockedAtCorner](&v3, sel_configureForDockedAtCorner);
  -[PKDrawingPaletteView _centerPaletteContainerSubviewToCurrentlySelectedToolForEdge:needsContainerViewLayout:](self, "_centerPaletteContainerSubviewToCurrentlySelectedToolForEdge:needsContainerViewLayout:", -[PKPaletteView lastPaletteEdgePositionWhileDragging](self, "lastPaletteEdgePositionWhileDragging"), 0);
  -[PKDrawingPaletteView _updateToolPreviewPositionForEdge:](self, "_updateToolPreviewPositionForEdge:", -[PKPaletteView lastPaletteEdgePositionWhileDragging](self, "lastPaletteEdgePositionWhileDragging"));
  -[PKDrawingPaletteView _updateToolPreviewContentsAnimated:](self, "_updateToolPreviewContentsAnimated:", 0);
}

- (void)configureForDockedAtEdge:(unint64_t)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKDrawingPaletteView;
  -[PKPaletteView configureForDockedAtEdge:](&v6, sel_configureForDockedAtEdge_, a3);
  -[PKPaletteView paletteContainerCenterXConstraint](self, "paletteContainerCenterXConstraint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstant:", 0.0);

  -[PKPaletteView paletteContainerCenterYConstraint](self, "paletteContainerCenterYConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", 0.0);

}

- (void)willStartAppearanceAnimation:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKDrawingPaletteView;
  -[PKPaletteView willStartAppearanceAnimation:](&v14, sel_willStartAppearanceAnimation_, a3);
  -[PKDrawingPaletteView _updateKeyboardSceneDelegateInputAssistantSupressionState](self, "_updateKeyboardSceneDelegateInputAssistantSupressionState");
  -[PKDrawingPaletteView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paletteViewStateDidChangeIsVisible:", self);

  if ((unint64_t)(-[PKPaletteView palettePosition](self, "palettePosition") - 5) <= 3)
    -[PKDrawingPaletteView configureForDockedAtCorner](self, "configureForDockedAtCorner");
  -[PKDrawingPaletteView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShouldRasterize:", 1);

  -[PKDrawingPaletteView contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPreloadsCache:", 1);

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  v11 = v10;
  -[PKDrawingPaletteView contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRasterizationScale:", v11);

}

- (void)didEndAppearanceAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD block[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKDrawingPaletteView;
  -[PKPaletteView didEndAppearanceAnimation](&v9, sel_didEndAppearanceAnimation);
  -[PKDrawingPaletteView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldRasterize:", 0);

  -[PKDrawingPaletteView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreloadsCache:", 0);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PKDrawingPaletteView_didEndAppearanceAnimation__block_invoke;
  block[3] = &unk_1E7778020;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  if (!-[PKPaletteView isVisible](self, "isVisible"))
  {
    -[PKDrawingPaletteView floatingKeyboardController](self, "floatingKeyboardController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteFloatingKeyboardController dismissWithReason:]((uint64_t)v7, CFSTR("Cleaning up keyboard state as palette isn't visible"));

    -[PKDrawingPaletteView setSelectedAnnotationType:](self, "setSelectedAnnotationType:", 0);
  }
}

uint64_t __49__PKDrawingPaletteView_didEndAppearanceAnimation__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateKeyboardSceneDelegateInputAssistantSupressionState");
  return objc_msgSend(*(id *)(a1 + 32), "updateHandwritingAssistantItems");
}

- (void)startOpacityEditing
{
  void *v3;
  UIView *v4;
  UIView *opacityEditingView;
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
  uint64_t v19;
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
  _QWORD v33[5];
  _QWORD v34[4];
  id v35;
  id location;
  _QWORD v37[6];

  v37[4] = *MEMORY[0x1E0C80C00];
  if (!-[PKDrawingPaletteView isEditingOpacity](self, "isEditingOpacity"))
  {
    -[PKDrawingPaletteView opacityEditingView](self, "opacityEditingView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      opacityEditingView = self->_opacityEditingView;
      self->_opacityEditingView = v4;

      -[PKDrawingPaletteView opacityEditingView](self, "opacityEditingView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[PKDrawingPaletteView opacityEditingView](self, "opacityEditingView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDrawingPaletteView addSubview:](self, "addSubview:", v7);

      -[PKDrawingPaletteView opacityEditingView](self, "opacityEditingView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAlpha:", 0.0);

      v20 = (void *)MEMORY[0x1E0CB3718];
      -[PKDrawingPaletteView opacityEditingView](self, "opacityEditingView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "bottomAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteView containerView](self, "containerView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "bottomAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintEqualToAnchor:", v29);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v28;
      -[PKDrawingPaletteView opacityEditingView](self, "opacityEditingView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "leftAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteView containerView](self, "containerView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "leftAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:", v24);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = v23;
      -[PKDrawingPaletteView opacityEditingView](self, "opacityEditingView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "rightAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteView containerView](self, "containerView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "rightAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintEqualToAnchor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v37[2] = v11;
      -[PKDrawingPaletteView opacityEditingView](self, "opacityEditingView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "topAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteView containerView](self, "containerView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "topAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v37[3] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "activateConstraints:", v17);

    }
    objc_initWeak(&location, self);
    v18 = (void *)MEMORY[0x1E0DC3F10];
    v19 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __43__PKDrawingPaletteView_startOpacityEditing__block_invoke;
    v34[3] = &unk_1E7777588;
    objc_copyWeak(&v35, &location);
    v33[0] = v19;
    v33[1] = 3221225472;
    v33[2] = __43__PKDrawingPaletteView_startOpacityEditing__block_invoke_2;
    v33[3] = &unk_1E7778650;
    v33[4] = self;
    objc_msgSend(v18, "animateWithDuration:delay:options:animations:completion:", 6, v34, v33, 0.5, 0.0);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }
}

void __43__PKDrawingPaletteView_startOpacityEditing__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "opacityEditingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

}

uint64_t __43__PKDrawingPaletteView_startOpacityEditing__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsEditingOpacity:", 1);
}

- (void)endOpacityEditing
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0DC3F10];
  v4 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__PKDrawingPaletteView_endOpacityEditing__block_invoke;
  v6[3] = &unk_1E7777588;
  objc_copyWeak(&v7, &location);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __41__PKDrawingPaletteView_endOpacityEditing__block_invoke_2;
  v5[3] = &unk_1E7778650;
  v5[4] = self;
  objc_msgSend(v3, "animateWithDuration:delay:options:animations:completion:", 6, v6, v5, 0.5, 0.0);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __41__PKDrawingPaletteView_endOpacityEditing__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "opacityEditingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

}

uint64_t __41__PKDrawingPaletteView_endOpacityEditing__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsEditingOpacity:", 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKDrawingPaletteView;
  -[PKPaletteView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "horizontalSizeClass");
  -[PKDrawingPaletteView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == objc_msgSend(v6, "horizontalSizeClass"))
  {
    v7 = objc_msgSend(v4, "verticalSizeClass");
    -[PKDrawingPaletteView traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "verticalSizeClass");

    if (v7 == v9)
      goto LABEL_6;
  }
  else
  {

  }
  -[PKDrawingPaletteView dismissPalettePopoverWithCompletion:](self, "dismissPalettePopoverWithCompletion:", 0);
  -[PKDrawingPaletteView _updateUI](self, "_updateUI");
  -[PKDrawingPaletteView setNeedsLayout](self, "setNeedsLayout");
  -[PKDrawingPaletteView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
LABEL_6:

}

- (void)dismissPalettePopoverWithCompletion:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  PKDrawingPaletteView *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __60__PKDrawingPaletteView_dismissPalettePopoverWithCompletion___block_invoke;
  v5[3] = &unk_1E7778AA0;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)PKDrawingPaletteView;
  v5[0] = MEMORY[0x1E0C809B0];
  v3 = v7;
  -[PKPaletteView dismissPalettePopoverWithCompletion:](&v4, sel_dismissPalettePopoverWithCompletion_, v5);

}

void __60__PKDrawingPaletteView_dismissPalettePopoverWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  NSObject *v20;
  _QWORD v21[4];
  NSObject *v22;
  _QWORD v23[4];
  NSObject *v24;
  id v25;
  id location;

  if (!objc_msgSend(*(id *)(a1 + 32), "isPalettePresentingPopover"))
    goto LABEL_5;
  objc_msgSend(*(id *)(a1 + 32), "palettePopoverPresentingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBeingDismissed");

  if ((v4 & 1) != 0)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x1E0DC3958], "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0DC3958], "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isDictationPopoverPresented");

  if ((v8 & 1) != 0)
  {
LABEL_5:
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      (*(void (**)(void))(v9 + 16))();
  }
  else
  {
LABEL_7:
    v10 = dispatch_group_create();
    objc_msgSend(*(id *)(a1 + 32), "presentedPopoverViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = MEMORY[0x1E0C809B0];
    if (v11)
    {
      dispatch_group_enter(v10);
      objc_initWeak(&location, *(id *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "presentedPopoverViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v12;
      v23[1] = 3221225472;
      v23[2] = __60__PKDrawingPaletteView_dismissPalettePopoverWithCompletion___block_invoke_2;
      v23[3] = &unk_1E777DA78;
      v24 = v10;
      objc_copyWeak(&v25, &location);
      objc_msgSend(v13, "dismissViewControllerAnimated:completion:", 1, v23);

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
    dispatch_group_enter(v10);
    objc_msgSend(*(id *)(a1 + 32), "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v12;
    v21[1] = 3221225472;
    v21[2] = __60__PKDrawingPaletteView_dismissPalettePopoverWithCompletion___block_invoke_3;
    v21[3] = &unk_1E7778020;
    v15 = v10;
    v22 = v15;
    objc_msgSend(v14, "dismissPalettePopoverWithCompletion:", v21);

    objc_msgSend(*(id *)(a1 + 32), "annotationDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      dispatch_group_enter(v15);
      objc_msgSend(*(id *)(a1 + 32), "annotationDelegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v12;
      v19[1] = 3221225472;
      v19[2] = __60__PKDrawingPaletteView_dismissPalettePopoverWithCompletion___block_invoke_4;
      v19[3] = &unk_1E7778020;
      v20 = v15;
      objc_msgSend(v17, "dismissPalettePopoverWithCompletion:", v19);

    }
    v18 = *(void **)(a1 + 40);
    if (v18)
      dispatch_group_notify(v15, MEMORY[0x1E0C80D38], v18);

  }
}

void __60__PKDrawingPaletteView_dismissPalettePopoverWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setPresentedPopoverViewController:", 0);

}

void __60__PKDrawingPaletteView_dismissPalettePopoverWithCompletion___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __60__PKDrawingPaletteView_dismissPalettePopoverWithCompletion___block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (CGRect)plusButtonFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  -[PKDrawingPaletteView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "plusButtonFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PKDrawingPaletteView contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDrawingPaletteView convertRect:fromView:](self, "convertRect:fromView:", v12, v5, v7, v9, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)setContextEditingMode:(int64_t)a3
{
  id v4;

  if (self->_contextEditingMode != a3)
  {
    self->_contextEditingMode = a3;
    -[PKDrawingPaletteView contentView](self, "contentView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setContextEditingMode:", self->_contextEditingMode);

  }
}

- (UIView)contextualEditingView
{
  void *v2;
  void *v3;

  -[PKDrawingPaletteView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contextualEditingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (UIView)lassoToolEditingView
{
  void *v2;
  void *v3;

  -[PKDrawingPaletteView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lassoToolEditingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (BOOL)hasHandwritingTool
{
  return -[PKDrawingPaletteView _hasToolWithIdentifier:](self, "_hasToolWithIdentifier:", CFSTR("com.apple.ink.handwriting"));
}

- (BOOL)_hasToolWithIdentifier:(id)a3
{
  id v4;
  NSArray *tools;
  id v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  tools = self->_tools;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__PKDrawingPaletteView__hasToolWithIdentifier___block_invoke;
  v8[3] = &unk_1E777DAA0;
  v9 = v4;
  v6 = v4;
  LOBYTE(tools) = -[NSArray indexOfObjectPassingTest:](tools, "indexOfObjectPassingTest:", v8) != 0x7FFFFFFFFFFFFFFFLL;

  return (char)tools;
}

uint64_t __47__PKDrawingPaletteView__hasToolWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "ink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (BOOL)isHandwritingToolSelected
{
  void *v2;
  void *v3;
  char v4;

  -[PKDrawingPaletteView selectedTool](self, "selectedTool");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isHandwritingInk");

  return v4;
}

- (void)handwritingEducationPaneSettingsDidChange
{
  id v3;

  -[PKDrawingPaletteView contentView](self, "contentView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paletteViewStateDidChange:", self);

}

- (BOOL)canShowResetHandwritingEducationPane
{
  void *v2;
  char v3;

  +[PKHandwritingEducationPaneSettings sharedInstance]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PKHandwritingEducationPaneSettings canShowResetPaneInPalette]((uint64_t)v2);

  return v3;
}

- (void)_updateKeyboardSceneDelegateInputAssistantSupressionState
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  if (-[PKDrawingPaletteView isHandwritingToolSelected](self, "isHandwritingToolSelected"))
    v3 = -[PKPaletteView isVisible](self, "isVisible");
  else
    v3 = 0;
  -[PKDrawingPaletteView window](self, "window");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardSceneDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShouldSuppressInputAssistantUpdates:", v3);

}

- (void)updateHandwritingAssistantItems
{
  id v3;

  -[PKDrawingPaletteView _currentFirstResponder](self, "_currentFirstResponder");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PKDrawingPaletteView _updateHandwritingAssistantItemsFromResponder:](self, "_updateHandwritingAssistantItemsFromResponder:", v3);

}

- (void)_updateHandwritingAssistantItemsFromResponder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKDrawingPaletteView inputAssistantButtonProvider](self, "inputAssistantButtonProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputAssistantItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputAssistantItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "inputAssistantItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDrawingPaletteView inputAssistantButtonProvider](self, "inputAssistantButtonProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInputAssistantItem:", v8);

  if (v6 != v7)
  {
    v10 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138477827;
      v14 = v4;
      _os_log_impl(&dword_1BE213000, v10, OS_LOG_TYPE_DEFAULT, "Input assistant items did change from responder: %{private}@", (uint8_t *)&v13, 0xCu);
    }

    -[PKDrawingPaletteView contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "paletteViewStateDidChangeInputAssistantItems:", self);

    -[PKPaletteView internalDelegate](self, "internalDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "paletteViewStateDidChangeInputAssistantItems:", self);

  }
}

- (id)_currentFirstResponder
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[PKPaletteView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PKPaletteView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "paletteViewCurrentFirstResponder:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)setTools:(id)a3
{
  -[PKDrawingPaletteView _setTools:resetSelectedTool:updateUI:notifyDelegate:](self, "_setTools:resetSelectedTool:updateUI:notifyDelegate:", a3, 1, 1, 0);
}

- (void)_setTools:(id)a3 resetSelectedTool:(BOOL)a4 updateUI:(BOOL)a5 notifyDelegate:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  NSArray *v10;
  NSArray *tools;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  BOOL v15;
  NSArray *v16;
  NSArray *toolsWhenLastNotifyingDelegate;
  void *v18;
  char v19;
  void *v20;
  id v21;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v21 = a3;
  if ((-[NSArray isEqual:](self->_tools, "isEqual:") & 1) == 0)
  {
    v10 = (NSArray *)objc_msgSend(v21, "copy");
    tools = self->_tools;
    self->_tools = v10;

    if (v8)
      self->_indexOfSelectedTool = 0x7FFFFFFFFFFFFFFFLL;
    if (v7)
      -[PKDrawingPaletteView _updateUIReloadTools:](self, "_updateUIReloadTools:", 1);
  }
  if (v6)
  {
    v12 = self->_toolsWhenLastNotifyingDelegate;
    v13 = (unint64_t)v21;
    if (v13 | v12)
    {
      v14 = (void *)v13;
      if (v13 && v12)
      {
        v15 = objc_msgSend((id)v12, "isEqualToArray:", v13);

        if (v15)
          goto LABEL_15;
      }
      else
      {

      }
      v16 = (NSArray *)objc_msgSend(v14, "copy");
      toolsWhenLastNotifyingDelegate = self->_toolsWhenLastNotifyingDelegate;
      self->_toolsWhenLastNotifyingDelegate = v16;

      -[PKPaletteView delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_opt_respondsToSelector();

      if ((v19 & 1) != 0)
      {
        -[PKPaletteView delegate](self, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "paletteViewToolsDidChange:", self);

      }
    }
  }
LABEL_15:

}

- (void)_replaceToolAtIndex:(unint64_t)a3 withTool:(id)a4 notifyDelegate:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  unint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v5 = a5;
  v16 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (-[PKDrawingPaletteView _canReplaceToolAtIndex:withTool:](self, "_canReplaceToolAtIndex:withTool:", a3, v8))
  {
    v9 = (void *)-[NSArray mutableCopy](self->_tools, "mutableCopy");
    objc_msgSend(v9, "replaceObjectAtIndex:withObject:", a3, v8);
    v10 = (void *)objc_msgSend(v9, "copy");
    -[PKDrawingPaletteView _setTools:resetSelectedTool:updateUI:notifyDelegate:](self, "_setTools:resetSelectedTool:updateUI:notifyDelegate:", v10, 0, 0, v5);

  }
  else
  {
    v11 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134218242;
      v13 = a3;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_1BE213000, v11, OS_LOG_TYPE_DEFAULT, "Can't replace tool at index: %lu with tool: %@", (uint8_t *)&v12, 0x16u);
    }

  }
}

- (BOOL)_canReplaceToolAtIndex:(unint64_t)a3 withTool:(id)a4
{
  return a3 != 0x7FFFFFFFFFFFFFFFLL
      && -[NSArray indexOfObjectIdenticalTo:](self->_tools, "indexOfObjectIdenticalTo:", a4) != a3;
}

- (void)selectToolAtIndex:(unint64_t)a3
{
  -[PKDrawingPaletteView _selectToolAtIndex:updateUI:notifyDelegate:](self, "_selectToolAtIndex:updateUI:notifyDelegate:", a3, 1, 0);
}

- (void)_selectToolAtIndex:(unint64_t)a3 updateUI:(BOOL)a4 notifyDelegate:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_indexOfSelectedTool != a3)
  {
    v5 = a5;
    v6 = a4;
    if (-[PKDrawingPaletteView _canSelectToolAtIndex:](self, "_canSelectToolAtIndex:"))
    {
      self->_indexOfSelectedTool = a3;
      if (v6)
      {
        -[PKDrawingPaletteView _updateUI](self, "_updateUI");
        -[PKDrawingPaletteView contentView](self, "contentView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "paletteViewStateDidChangeSelectedTool:", self);

      }
      if (v5)
      {
        -[PKPaletteView delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_opt_respondsToSelector();

        if ((v11 & 1) != 0)
        {
          -[NSArray objectAtIndex:](self->_tools, "objectAtIndex:", self->_indexOfSelectedTool);
          v14 = (id)objc_claimAutoreleasedReturnValue();
          -[PKPaletteView delegate](self, "delegate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "paletteView:didSelectTool:atIndex:", self, v14, self->_indexOfSelectedTool);

        }
      }
    }
    else
    {
      v13 = os_log_create("com.apple.pencilkit", "PKPalette");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v16 = a3;
        _os_log_impl(&dword_1BE213000, v13, OS_LOG_TYPE_DEFAULT, "Can't select tool at index: %lu", buf, 0xCu);
      }

    }
  }
}

- (BOOL)_canSelectToolAtIndex:(unint64_t)a3
{
  return -[NSArray count](self->_tools, "count") > a3;
}

- (PKTool)selectedTool
{
  if (self->_indexOfSelectedTool == 0x7FFFFFFFFFFFFFFFLL)
    return (PKTool *)0;
  -[NSArray objectAtIndex:](self->_tools, "objectAtIndex:");
  return (PKTool *)(id)objc_claimAutoreleasedReturnValue();
}

- (PKPaletteToolView)selectedToolView
{
  void *v3;
  void *v4;

  -[PKDrawingPaletteView selectedTool](self, "selectedTool");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PKDrawingPaletteView _selectedToolViewInToolPicker](self, "_selectedToolViewInToolPicker");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (PKPaletteToolView *)v4;
}

- (void)setInterItemToolsSpacingInCompactSize:(double)a3
{
  id v4;

  if (vabdd_f64(self->_interItemToolsSpacingInCompactSize, a3) >= 0.00999999978)
  {
    self->_interItemToolsSpacingInCompactSize = a3;
    -[PKDrawingPaletteView contentView](self, "contentView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paletteViewStateDidChange:", self);

  }
}

- (void)setInterItemUndoRedoButtonsSpacingInCompactSize:(double)a3
{
  id v4;

  if (vabdd_f64(self->_interItemUndoRedoButtonsSpacingInCompactSize, a3) >= 0.00999999978)
  {
    self->_interItemUndoRedoButtonsSpacingInCompactSize = a3;
    -[PKDrawingPaletteView contentView](self, "contentView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paletteViewStateDidChange:", self);

  }
}

- (int64_t)numberOfToolsInToolPickerView:(id)a3
{
  return -[NSArray count](self->_tools, "count", a3);
}

- (id)toolPickerView:(id)a3 viewForToolAtIndex:(int64_t)a4
{
  void *v5;
  void *v6;

  -[NSArray objectAtIndex:](self->_tools, "objectAtIndex:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolViewFactory makePaletteToolViewForTool:]((uint64_t)self->_toolViewFactory, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__toolViewStateDidChange_, 4096);

  return v6;
}

- (void)_toolViewStateDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "tool");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](self->_tools, "objectAtIndexedSubscript:", -[PKDrawingPaletteView indexOfSelectedTool](self, "indexOfSelectedTool"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKToolFromPaletteTool toolByApplyingPropertiesFromPaletteTool:toTool:](PKToolFromPaletteTool, "toolByApplyingPropertiesFromPaletteTool:toTool:", v4, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[PKDrawingPaletteView _replaceToolAtIndex:withTool:notifyDelegate:](self, "_replaceToolAtIndex:withTool:notifyDelegate:", -[PKDrawingPaletteView indexOfSelectedTool](self, "indexOfSelectedTool"), v6, 1);
  -[PKDrawingPaletteView updateColorPickerSelectedColor](self, "updateColorPickerSelectedColor");

}

- (int64_t)colorUserInterfaceStyle
{
  return self->_colorUserInterfaceStyle;
}

- (BOOL)isFingerDrawsOptionEnabled
{
  return self->_fingerDrawsOptionEnabled;
}

- (BOOL)shouldHideHoverPreviewToggle
{
  return self->_shouldHideHoverPreviewToggle;
}

- (void)setShouldHideHoverPreviewToggle:(BOOL)a3
{
  self->_shouldHideHoverPreviewToggle = a3;
}

- (BOOL)showsPlusButton
{
  return self->_showsPlusButton;
}

- (UIViewController)plusButtonViewController
{
  return self->_plusButtonViewController;
}

- (BOOL)showsTextButton
{
  return self->_showsTextButton;
}

- (UIViewController)textButtonViewController
{
  return self->_textButtonViewController;
}

- (void)setTextButtonViewController:(id)a3
{
  objc_storeStrong((id *)&self->_textButtonViewController, a3);
}

- (BOOL)showsShapeButton
{
  return self->_showsShapeButton;
}

- (UIViewController)shapeButtonViewController
{
  return self->_shapeButtonViewController;
}

- (void)setShapeButtonViewController:(id)a3
{
  objc_storeStrong((id *)&self->_shapeButtonViewController, a3);
}

- (NSArray)tools
{
  return self->_tools;
}

- (unint64_t)indexOfSelectedTool
{
  return self->_indexOfSelectedTool;
}

- (double)interItemToolsSpacingInCompactSize
{
  return self->_interItemToolsSpacingInCompactSize;
}

- (double)interItemUndoRedoButtonsSpacingInCompactSize
{
  return self->_interItemUndoRedoButtonsSpacingInCompactSize;
}

- (BOOL)isPencilInteractionEnabledWhenNotVisible
{
  return self->_pencilInteractionEnabledWhenNotVisible;
}

- (void)setPencilInteractionEnabledWhenNotVisible:(BOOL)a3
{
  self->_pencilInteractionEnabledWhenNotVisible = a3;
}

- (BOOL)wantsClearBackgroundColorInCompactSize
{
  return self->_wantsClearBackgroundColorInCompactSize;
}

- (BOOL)wantsUndoRedoButtonsVisibleInCompactSize
{
  return self->_wantsUndoRedoButtonsVisibleInCompactSize;
}

- (BOOL)wantsEllipsisButtonVisibleInCompactSize
{
  return self->_wantsEllipsisButtonVisibleInCompactSize;
}

- (BOOL)wantsBottomLineDividerVisibleInCompactSize
{
  return self->_wantsBottomLineDividerVisibleInCompactSize;
}

- (BOOL)useEqualSpacingLayoutInCompactSize
{
  return self->_useEqualSpacingLayoutInCompactSize;
}

- (BOOL)wantsMulticolorSwatchShadowInCompactSize
{
  return self->_wantsMulticolorSwatchShadowInCompactSize;
}

- (BOOL)wantsUndoRedoButtonsShadowInCompactSize
{
  return self->_wantsUndoRedoButtonsShadowInCompactSize;
}

- (PKPaletteContentView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (NSLayoutConstraint)contentViewBottomConstraint
{
  return self->_contentViewBottomConstraint;
}

- (void)setContentViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, a3);
}

- (NSLayoutConstraint)compactContentViewHeightConstraint
{
  return self->_compactContentViewHeightConstraint;
}

- (void)setCompactContentViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_compactContentViewHeightConstraint, a3);
}

- (UIView)bottomLineDividerView
{
  return self->_bottomLineDividerView;
}

- (void)setBottomLineDividerView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomLineDividerView, a3);
}

- (BOOL)isEditingOpacity
{
  return self->_isEditingOpacity;
}

- (void)setIsEditingOpacity:(BOOL)a3
{
  self->_isEditingOpacity = a3;
}

- (double)interItemUndoRedoButtonsSpacing
{
  return self->_interItemUndoRedoButtonsSpacing;
}

- (void)setInterItemUndoRedoButtonsSpacing:(double)a3
{
  self->_interItemUndoRedoButtonsSpacing = a3;
}

- (PKTextInputWindowFirstResponderController)firstResponderController
{
  return self->_firstResponderController;
}

- (void)setFirstResponderController:(id)a3
{
  objc_storeStrong((id *)&self->_firstResponderController, a3);
}

- (PKPaletteInputAssistantButtonProvider)inputAssistantButtonProvider
{
  return self->_inputAssistantButtonProvider;
}

- (void)setInputAssistantButtonProvider:(id)a3
{
  objc_storeStrong((id *)&self->_inputAssistantButtonProvider, a3);
}

- (UIViewController)presentedPopoverViewController
{
  return self->_presentedPopoverViewController;
}

- (void)setPresentedPopoverViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentedPopoverViewController, a3);
}

- (BOOL)isQuickNoteUI
{
  return self->_isQuickNoteUI;
}

- (void)setIsQuickNoteUI:(BOOL)a3
{
  self->_isQuickNoteUI = a3;
}

- (UIPencilInteraction)pencilInteraction
{
  return self->_pencilInteraction;
}

- (int64_t)contextEditingMode
{
  return self->_contextEditingMode;
}

- (PKPaletteTapToRadarCommand)tapToRadarCommand
{
  return self->_tapToRadarCommand;
}

- (void)setTapToRadarCommand:(id)a3
{
  objc_storeStrong((id *)&self->_tapToRadarCommand, a3);
}

- (PKPaletteFloatingKeyboardController)floatingKeyboardController
{
  return self->_floatingKeyboardController;
}

- (void)setFloatingKeyboardController:(id)a3
{
  objc_storeStrong((id *)&self->_floatingKeyboardController, a3);
}

- (PKPaletteViewAnnotationDelegate)annotationDelegate
{
  return (PKPaletteViewAnnotationDelegate *)objc_loadWeakRetained((id *)&self->_annotationDelegate);
}

- (int64_t)selectedAnnotationType
{
  return self->_selectedAnnotationType;
}

- (UIView)opacityEditingView
{
  return self->_opacityEditingView;
}

- (BOOL)showsLassoToolEditingView
{
  return self->_showsLassoToolEditingView;
}

- (NSString)lassoToolEditingViewIdentifier
{
  return self->_lassoToolEditingViewIdentifier;
}

- (BOOL)isEditingStrokeSelection
{
  return self->_editingStrokeSelection;
}

- (BOOL)isEditingTextSelection
{
  return self->_editingTextSelection;
}

- (BOOL)isEditingExternalElementsSelection
{
  return self->_editingExternalElementsSelection;
}

- (BOOL)colorSwatchesVisible
{
  return self->_colorSwatchesVisible;
}

- (BOOL)prefersLargeContextualEditingUI
{
  return self->_prefersLargeContextualEditingUI;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lassoToolEditingViewIdentifier, 0);
  objc_storeStrong((id *)&self->_opacityEditingView, 0);
  objc_destroyWeak((id *)&self->_annotationDelegate);
  objc_storeStrong((id *)&self->_floatingKeyboardController, 0);
  objc_storeStrong((id *)&self->_tapToRadarCommand, 0);
  objc_storeStrong((id *)&self->_pencilInteraction, 0);
  objc_storeStrong((id *)&self->_presentedPopoverViewController, 0);
  objc_storeStrong((id *)&self->_inputAssistantButtonProvider, 0);
  objc_storeStrong((id *)&self->_firstResponderController, 0);
  objc_storeStrong((id *)&self->_bottomLineDividerView, 0);
  objc_storeStrong((id *)&self->_compactContentViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_tools, 0);
  objc_storeStrong((id *)&self->_shapeButtonViewController, 0);
  objc_storeStrong((id *)&self->_textButtonViewController, 0);
  objc_storeStrong((id *)&self->_plusButtonViewController, 0);
  objc_storeStrong((id *)&self->_toolsWhenLastNotifyingDelegate, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_backgroundColorFactory, 0);
  objc_storeStrong((id *)&self->_toolViewFactory, 0);
}

@end
