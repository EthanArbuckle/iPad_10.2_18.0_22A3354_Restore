@implementation PKPaletteController

- (PKPaletteController)init
{
  id v2;
  void *v3;
  PKPaletteFloatingKeyboardController *v4;
  void *v5;
  PKPaletteInputAssistantButtonProvider *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  objc_super v25;
  _QWORD v26[2];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)PKPaletteController;
  v2 = -[PKPaletteController init](&v25, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handleTextInputResponderCapabilitiesChanged_, *MEMORY[0x1E0DC5548], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handleTextInputReturnKeyStateChanged_, *MEMORY[0x1E0DC5560], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__recognitionLocaleIdentifierDidChange_, CFSTR("PKTextInputSettingsRecognitionLocaleIdentifierDidChangeNotification"), 0);
    v4 = objc_alloc_init(PKPaletteFloatingKeyboardController);
    v5 = (void *)*((_QWORD *)v2 + 14);
    *((_QWORD *)v2 + 14) = v4;

    -[PKPaletteFloatingKeyboardController setDelegate:](*((_QWORD *)v2 + 14), v2);
    v6 = objc_alloc_init(PKPaletteInputAssistantButtonProvider);
    v7 = (void *)*((_QWORD *)v2 + 15);
    *((_QWORD *)v2 + 15) = v6;

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    *((_QWORD *)v2 + 16) = v9;
    *((_QWORD *)v2 + 17) = v10;
    *((_QWORD *)v2 + 18) = v11;
    *((_QWORD *)v2 + 19) = v12;

    +[PKPaletteButton keyboardButton](PKPaletteButton, "keyboardButton");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v2 + 11);
    *((_QWORD *)v2 + 11) = v13;

    -[PKPaletteFloatingKeyboardController keyboardSelectionMenu](*((id **)v2 + 14));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v2 + 11), "setKeyboardSelectionMenu:", v15);

    objc_msgSend(*((id *)v2 + 11), "addTarget:action:forControlEvents:", v2, sel__handleKeyboard, 64);
    +[PKPaletteButton returnKeyButton](PKPaletteButton, "returnKeyButton");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)*((_QWORD *)v2 + 10);
    *((_QWORD *)v2 + 10) = v16;

    objc_msgSend(*((id *)v2 + 10), "addTarget:action:forControlEvents:", v2, sel__handleReturn, 64);
    +[PKPaletteButton ellipsisButton](PKPaletteButton, "ellipsisButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addTarget:action:forControlEvents:", v2, sel__handleMoreButton_, 64);
    v19 = *((_QWORD *)v2 + 10);
    v27[0] = *((_QWORD *)v2 + 11);
    v27[1] = v19;
    v27[2] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)*((_QWORD *)v2 + 12);
    *((_QWORD *)v2 + 12) = v20;

    v26[0] = *((_QWORD *)v2 + 11);
    v26[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)*((_QWORD *)v2 + 13);
    *((_QWORD *)v2 + 13) = v22;

  }
  return (PKPaletteController *)v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5548], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5560], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("PKTextInputSettingsRecognitionLocaleIdentifierDidChangeNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)PKPaletteController;
  -[PKPaletteController dealloc](&v4, sel_dealloc);
}

- (void)setAdjustedWindowSceneBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(self->_adjustedWindowSceneBounds, a3))
  {
    self->_adjustedWindowSceneBounds.origin.x = x;
    self->_adjustedWindowSceneBounds.origin.y = y;
    self->_adjustedWindowSceneBounds.size.width = width;
    self->_adjustedWindowSceneBounds.size.height = height;
    -[PKPaletteController _paletteView](self, "_paletteView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "paletteHostingWindowSceneDidChangeBounds:", self);

    -[PKPaletteController _updatePaletteUI](self, "_updatePaletteUI");
  }
}

- (void)_updatePaletteUI
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;

  +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recognitionLocaleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteController _paletteView](self, "_paletteView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocaleIdentifier:", v4);

  -[PKPaletteController adjustedWindowSceneBounds](self, "adjustedWindowSceneBounds");
  v7 = v6;
  -[PKPaletteController paletteHostViewWidthConstraint](self, "paletteHostViewWidthConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstant:", v7);

  -[PKPaletteController adjustedWindowSceneBounds](self, "adjustedWindowSceneBounds");
  v10 = v9;
  -[PKPaletteController paletteHostViewHeightConstraint](self, "paletteHostViewHeightConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConstant:", v10);

  -[PKPaletteController _updatePaletteViewTraitCollection](self, "_updatePaletteViewTraitCollection");
}

- (void)_updatePaletteViewTraitCollection
{
  void *v3;
  id v4;

  -[PKPaletteController _adjustedHorizontalSizeClassTraitCollection](self, "_adjustedHorizontalSizeClassTraitCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PKPaletteController _shouldOverridePaletteViewTraitCollectionTo:](self, "_shouldOverridePaletteViewTraitCollectionTo:"))
  {
    -[PKPaletteController _hostView](self, "_hostView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setLocalOverrideTraitCollection:", v4);

  }
}

- (BOOL)_shouldOverridePaletteViewTraitCollectionTo:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;

  v4 = a3;
  -[PKPaletteController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[PKPaletteController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "paletteController:shouldOverridePaletteViewTraitCollectionTo:", self, v4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_adjustedHorizontalSizeClassTraitCollection
{
  int64_t v2;

  v2 = -[PKPaletteController _adjustedUserInterfaceSizeClass](self, "_adjustedUserInterfaceSizeClass");
  return (id)objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithHorizontalSizeClass:", v2);
}

- (int64_t)_adjustedUserInterfaceSizeClass
{
  if (-[PKPaletteController _shouldPaletteUseCompactHorizontalSizeClass](self, "_shouldPaletteUseCompactHorizontalSizeClass"))
  {
    return 1;
  }
  else
  {
    return 2;
  }
}

- (BOOL)_shouldPaletteUseCompactHorizontalSizeClass
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;

  -[PKPaletteController _paletteView](self, "_paletteView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v5, "interfaceOrientation") - 3) >= 2)
  {

  }
  else
  {
    -[PKPaletteController adjustedWindowSceneBounds](self, "adjustedWindowSceneBounds");
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = v9 / 3.0;

    if (v7 <= v10)
      return 1;
  }
  -[PKPaletteController _paletteView](self, "_paletteView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "windowScene");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v14, "interfaceOrientation") - 1) > 1)
  {
    v11 = 0;
  }
  else
  {
    -[PKPaletteController adjustedWindowSceneBounds](self, "adjustedWindowSceneBounds");
    v16 = v15;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    v11 = v16 < v18;

  }
  return v11;
}

- (void)installInView:(id)a3
{
  NSObject *v4;
  PKUCBPaletteView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PKPaletteHostView *v12;
  void *v13;
  PKPaletteHostView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *paletteHostViewWidthConstraint;
  void *v22;
  void *v23;
  double v24;
  NSLayoutConstraint *v25;
  NSLayoutConstraint *paletteHostViewHeightConstraint;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSLayoutConstraint *v35;
  NSLayoutConstraint *v36;
  void *v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v39 = a3;
  v4 = os_log_create("com.apple.pencilkit", "PKPalette");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = v39;
    _os_log_debug_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEBUG, "Installing palette UI in view: %@", (uint8_t *)location, 0xCu);
  }

  v5 = objc_alloc_init(PKUCBPaletteView);
  -[PKPaletteController set_paletteView:](self, "set_paletteView:", v5);

  objc_msgSend(v39, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rootViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "childViewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteController _paletteView](self, "_paletteView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPalettePopoverPresentingController:", v9);

  objc_initWeak(location, self);
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __37__PKPaletteController_installInView___block_invoke;
  v40[3] = &unk_1E777BF00;
  objc_copyWeak(&v41, location);
  -[PKPaletteController _paletteView](self, "_paletteView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setReturnKeyHandler:", v40);

  v12 = [PKPaletteHostView alloc];
  -[PKPaletteController _paletteView](self, "_paletteView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PKPaletteHostView initWithPaletteView:](v12, "initWithPaletteView:", v13);
  -[PKPaletteController set_hostView:](self, "set_hostView:", v14);

  -[PKPaletteController _hostView](self, "_hostView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PKPaletteController _hostView](self, "_hostView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addSubview:", v16);

  -[PKPaletteController _hostView](self, "_hostView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "widthAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteController adjustedWindowSceneBounds](self, "adjustedWindowSceneBounds");
  objc_msgSend(v18, "constraintEqualToConstant:", v19);
  v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  paletteHostViewWidthConstraint = self->_paletteHostViewWidthConstraint;
  self->_paletteHostViewWidthConstraint = v20;

  -[PKPaletteController _hostView](self, "_hostView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "heightAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteController adjustedWindowSceneBounds](self, "adjustedWindowSceneBounds");
  objc_msgSend(v23, "constraintEqualToConstant:", v24);
  v25 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  paletteHostViewHeightConstraint = self->_paletteHostViewHeightConstraint;
  self->_paletteHostViewHeightConstraint = v25;

  v27 = (void *)MEMORY[0x1E0CB3718];
  -[PKPaletteController _hostView](self, "_hostView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v30;
  -[PKPaletteController _hostView](self, "_hostView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "leftAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "leftAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = self->_paletteHostViewWidthConstraint;
  v36 = self->_paletteHostViewHeightConstraint;
  v42[1] = v34;
  v42[2] = v35;
  v42[3] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "activateConstraints:", v37);

  -[PKPaletteController _updatePaletteWithDefaultItems](self, "_updatePaletteWithDefaultItems");
  -[PKPaletteController _updatePaletteUI](self, "_updatePaletteUI");
  objc_destroyWeak(&v41);
  objc_destroyWeak(location);

}

void __37__PKPaletteController_installInView___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleReturn");

}

- (void)tearDown
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v3 = os_log_create("com.apple.pencilkit", "PKPalette");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_debug_impl(&dword_1BE213000, v3, OS_LOG_TYPE_DEBUG, "Tearing down palette UI", v6, 2u);
  }

  -[PKPaletteController floatingKeyboardController](self, "floatingKeyboardController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteFloatingKeyboardController dismissWithReason:]((uint64_t)v4, CFSTR("Tearing down palette UI"));

  -[PKPaletteController _hostView](self, "_hostView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

}

- (BOOL)isPaletteVisible
{
  void *v2;
  char v3;

  -[PKPaletteController _hostView](self, "_hostView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPaletteVisible");

  return v3;
}

- (void)setPaletteVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  _BOOL4 v9;
  _BOOL4 v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = -[PKPaletteController isPaletteVisible](self, "isPaletteVisible");
  v10 = v9 ^ v6;
  if (v9 && !v6)
  {
    -[PKPaletteController floatingKeyboardController](self, "floatingKeyboardController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteFloatingKeyboardController dismissWithReason:]((uint64_t)v11, CFSTR("Palette Visibility"));

  }
  -[PKPaletteController _hostView](self, "_hostView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPaletteVisible:animated:completion:", v6, v5, v8);

  if (v10)
    -[PKPaletteController _updatePaletteWithApplicationSpecificItems](self, "_updatePaletteWithApplicationSpecificItems");
}

- (int64_t)palettePosition
{
  void *v2;
  int64_t v3;

  -[PKPaletteController _paletteView](self, "_paletteView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "palettePosition");

  return v3;
}

- (void)setFirstResponder:(id)a3
{
  PKTextInputWindowFirstResponder **p_firstResponder;
  PKTextInputWindowFirstResponder *v6;

  p_firstResponder = &self->_firstResponder;
  v6 = (PKTextInputWindowFirstResponder *)a3;
  if (*p_firstResponder != v6)
  {
    objc_storeStrong((id *)&self->_firstResponder, a3);
    if (*p_firstResponder)
    {
      -[PKPaletteController _updatePaletteWithApplicationSpecificItems](self, "_updatePaletteWithApplicationSpecificItems");
      -[PKPaletteController _updateUndoRedoEnabledState](self, "_updateUndoRedoEnabledState");
      -[PKPaletteController _updateReturnKey](self, "_updateReturnKey");
      -[PKPaletteController _updateTrailingBarButtons](self, "_updateTrailingBarButtons");
      -[PKPaletteController _updatePaletteUI](self, "_updatePaletteUI");
    }
  }

}

- (void)_updatePaletteWithDefaultItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  +[PKPaletteButton undoButton](PKPaletteButton, "undoButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteController setUndoButton:](self, "setUndoButton:", v3);

  -[PKPaletteController undoButton](self, "undoButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__handleUndo, 64);

  +[PKPaletteButton redoButton](PKPaletteButton, "redoButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteController setRedoButton:](self, "setRedoButton:", v5);

  -[PKPaletteController redoButton](self, "redoButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__handleRedo, 64);

  -[PKPaletteController undoButton](self, "undoButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  -[PKPaletteController redoButton](self, "redoButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteController _paletteView](self, "_paletteView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLeadingBarButtons:", v9);

  -[PKPaletteController _updateTrailingBarButtons](self, "_updateTrailingBarButtons");
  -[PKPaletteController _updateUndoRedoEnabledState](self, "_updateUndoRedoEnabledState");
}

- (void)_updateTrailingBarButtons
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (+[PKPaletteKeyboardUtilities textInputReturnKeyTypeForEditing](PKPaletteKeyboardUtilities, "textInputReturnKeyTypeForEditing")&& (+[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v4 = objc_msgSend(v3, "hideDefaultReturnKeyWhenSpecialReturnKeyIsPresent"), v3, v4))
  {
    -[PKPaletteController trailingButtonsWithoutReturnKey](self, "trailingButtonsWithoutReturnKey");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKPaletteController trailingButtonsWithReturnKey](self, "trailingButtonsWithReturnKey");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (id)v5;
  -[PKPaletteController _paletteView](self, "_paletteView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTrailingBarButtons:", v7);

}

- (void)_updateUndoRedoEnabledState
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  +[PKPaletteKeyboardUtilities textInputUndoManagerForEditing](PKPaletteKeyboardUtilities, "textInputUndoManagerForEditing");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v7, "canUndo");
  -[PKPaletteController undoButton](self, "undoButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

  v5 = objc_msgSend(v7, "canRedo");
  -[PKPaletteController redoButton](self, "redoButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v5);

}

- (void)_updatePaletteWithApplicationSpecificItems
{
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
  id v13;

  -[PKPaletteController _paletteView](self, "_paletteView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyboardSceneDelegate");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (-[PKPaletteController isPaletteVisible](self, "isPaletteVisible")
    && (-[PKPaletteController firstResponder](self, "firstResponder"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    objc_msgSend(v13, "setShouldSuppressInputAssistantUpdates:", 1);
    -[PKPaletteController firstResponder](self, "firstResponder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inputAssistantItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteController inputAssistantButtonProvider](self, "inputAssistantButtonProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setInputAssistantItem:", v8);

    -[PKPaletteController inputAssistantButtonProvider](self, "inputAssistantButtonProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "buttonsForCurrentConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteController _paletteView](self, "_paletteView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCenteredBarButtons:", v11);

  }
  else
  {
    objc_msgSend(v13, "setShouldSuppressInputAssistantUpdates:", 0);
    -[PKPaletteController inputAssistantButtonProvider](self, "inputAssistantButtonProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setInputAssistantItem:", 0);
  }

}

- (void)_updateReturnKey
{
  int64_t v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  id v7;

  v3 = +[PKPaletteKeyboardUtilities textInputReturnKeyTypeForEditing](PKPaletteKeyboardUtilities, "textInputReturnKeyTypeForEditing");
  -[PKPaletteController _paletteView](self, "_paletteView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnKeyType:", v3);

  v5 = +[PKPaletteKeyboardUtilities isReturnKeyEnabled](PKPaletteKeyboardUtilities, "isReturnKeyEnabled");
  -[PKPaletteController returnKeyButton](self, "returnKeyButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v5);

  -[PKPaletteController _paletteView](self, "_paletteView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setReturnKeyEnabled:", v5);

}

- (void)_handleTextInputReturnKeyStateChanged:(id)a3
{
  -[PKPaletteController _updateReturnKey](self, "_updateReturnKey", a3);
  -[PKPaletteController _updateTrailingBarButtons](self, "_updateTrailingBarButtons");
}

- (void)_handleUndo
{
  id v3;

  +[PKPaletteKeyboardUtilities textInputUndoManagerForEditing](PKPaletteKeyboardUtilities, "textInputUndoManagerForEditing");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "undo");
  -[PKPaletteController _updateUndoRedoEnabledState](self, "_updateUndoRedoEnabledState");
  +[PKTextInputUtilities markAnalyticsForUndo](PKTextInputUtilities, "markAnalyticsForUndo");

}

- (void)_handleRedo
{
  id v3;

  +[PKPaletteKeyboardUtilities textInputUndoManagerForEditing](PKPaletteKeyboardUtilities, "textInputUndoManagerForEditing");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "redo");
  -[PKPaletteController _updateUndoRedoEnabledState](self, "_updateUndoRedoEnabledState");
  +[PKTextInputUtilities markAnalyticsForRedo](PKTextInputUtilities, "markAnalyticsForRedo");

}

- (void)_handleReturn
{
  +[PKPaletteKeyboardUtilities performReturn](PKPaletteKeyboardUtilities, "performReturn");
}

- (void)_handleKeyboard
{
  id v2;

  -[PKPaletteController floatingKeyboardController](self, "floatingKeyboardController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaletteFloatingKeyboardController presentOrDismissIfPresented]((uint64_t)v2);

}

- (void)_handleMoreButton:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PKPaletteController _paletteView](self, "_paletteView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPalettePresentingPopover");

  if ((v5 & 1) != 0)
  {
    -[PKPaletteController _paletteView](self, "_paletteView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissPalettePopoverWithCompletion:", 0);

  }
  else
  {
    -[PKPaletteController _presentMoreOptionsPopoverFromButton:](self, "_presentMoreOptionsPopoverFromButton:", v7);
  }

}

- (void)_presentMoreOptionsPopoverFromButton:(id)a3
{
  id v4;
  PKPaletteMoreOptionsViewController *v5;
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
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double x;
  double y;
  double width;
  double height;
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
  void *v40;
  _QWORD v41[2];
  CGRect v42;
  CGRect v43;

  v41[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(PKPaletteMoreOptionsViewController);
  -[PKPaletteMoreOptionsViewController setShouldShowFingerDrawsOption:](v5, "setShouldShowFingerDrawsOption:", 0);
  -[PKPaletteController _hostView](self, "_hostView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteController _hostView](self, "_hostView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteMoreOptionsViewController setShouldShowAutoMinimizeOption:](v5, "setShouldShowAutoMinimizeOption:", !PKUseCompactSize(v7, v10));

  -[PKPaletteMoreOptionsViewController setShouldShowTapToRadarOption:](v5, "setShouldShowTapToRadarOption:", 1);
  +[PKHandwritingEducationPaneSettings sharedInstance]();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteMoreOptionsViewController setShouldShowResetHandwritingEducationPane:](v5, "setShouldShowResetHandwritingEducationPane:", -[PKHandwritingEducationPaneSettings canShowResetPaneInPalette]((uint64_t)v11));

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteMoreOptionsViewController setShouldShowOpenPencilSettingsOption:](v5, "setShouldShowOpenPencilSettingsOption:", objc_msgSend(v12, "_supportsPencil"));

  -[PKPaletteController _paletteView](self, "_paletteView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteMoreOptionsViewController setAutoHideOn:](v5, "setAutoHideOn:", objc_msgSend(v13, "isAutoHideEnabled"));

  -[PKPaletteMoreOptionsViewController setDelegate:](v5, "setDelegate:", self);
  -[PKPaletteMoreOptionsViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 7);
  -[PKPaletteMoreOptionsViewController popoverPresentationController](v5, "popoverPresentationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegate:", self);

  -[PKPaletteMoreOptionsViewController popoverPresentationController](v5, "popoverPresentationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_setIgnoresKeyboardNotifications:", 1);

  -[PKPaletteMoreOptionsViewController popoverPresentationController](v5, "popoverPresentationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_setShouldDisableInteractionDuringTransitions:", 0);

  -[PKPaletteMoreOptionsViewController popoverPresentationController](v5, "popoverPresentationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSourceView:", v4);

  objc_msgSend(v4, "bounds");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v42.origin.x = v19;
  v42.origin.y = v21;
  v42.size.width = v23;
  v42.size.height = v25;
  v43 = CGRectInset(v42, -5.0, -5.0);
  x = v43.origin.x;
  y = v43.origin.y;
  width = v43.size.width;
  height = v43.size.height;
  -[PKPaletteMoreOptionsViewController popoverPresentationController](v5, "popoverPresentationController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setSourceRect:", x, y, width, height);

  -[PKPaletteController _paletteView](self, "_paletteView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "paletteViewHosting");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "hostingView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteMoreOptionsViewController popoverPresentationController](v5, "popoverPresentationController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setPassthroughViews:", v34);

  -[PKPaletteController _paletteView](self, "_paletteView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "palettePopoverPermittedArrowDirections");
  -[PKPaletteMoreOptionsViewController popoverPresentationController](v5, "popoverPresentationController");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setPermittedArrowDirections:", v37);

  -[PKPaletteController _paletteView](self, "_paletteView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "palettePopoverPresentingController");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "presentViewController:animated:completion:", v5, 1, 0);

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (id)responderForFloatingKeyboardController:(id)a3
{
  return +[PKPaletteKeyboardUtilities textInputResponderForEditing](PKPaletteKeyboardUtilities, "textInputResponderForEditing", a3);
}

- (void)floatingKeyboardControllerWillShow:(id)a3
{
  id v4;

  -[PKPaletteController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paletteControllerFloatingKeyboardWillShow:", self);

}

- (void)floatingKeyboardControllerWillHide:(id)a3
{
  id v4;

  -[PKPaletteController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paletteControllerFloatingKeyboardWillHide:", self);

}

- (void)floatingKeyboardController:(id)a3 didChangeKeyboardType:(int64_t)a4
{
  -[PKPaletteKeyboardButton setFloatingKeyboardType:](self->_keyboardButton, "setFloatingKeyboardType:", a4);
}

- (void)moreOptionsViewControllerDidToggleAutoHide:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];

  v4 = a3;
  v5 = objc_msgSend(v4, "isAutoHideOn");
  -[PKPaletteController _paletteView](self, "_paletteView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAutoHideEnabled:", v5);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__PKPaletteController_moreOptionsViewControllerDidToggleAutoHide___block_invoke;
  v11[3] = &unk_1E7778020;
  v11[4] = self;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v11);

  +[PKStatisticsManager sharedStatisticsManager]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteController _paletteView](self, "_paletteView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAutoHideEnabled");
  -[PKPaletteController _paletteView](self, "_paletteView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKStatisticsManager recordAutoMinimizeEnabledDidChange:type:]((uint64_t)v7, v9, objc_msgSend(v10, "paletteViewType"));

}

void __66__PKPaletteController_moreOptionsViewControllerDidToggleAutoHide___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_paletteView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_paletteView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paletteViewStateDidChangeAutoHide:", v3);

}

- (void)moreOptionsViewControllerDidSelectTapToRadar:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__PKPaletteController_moreOptionsViewControllerDidSelectTapToRadar___block_invoke;
  v3[3] = &unk_1E7778020;
  v3[4] = self;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, v3);
}

void __68__PKPaletteController_moreOptionsViewControllerDidSelectTapToRadar___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tapToRadarCommand");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "execute");

}

- (void)moreOptionsViewControllerDidSelectOpenPencilSettings:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __76__PKPaletteController_moreOptionsViewControllerDidSelectOpenPencilSettings___block_invoke;
  v3[3] = &unk_1E7778020;
  v3[4] = self;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, v3);
}

uint64_t __76__PKPaletteController_moreOptionsViewControllerDidSelectOpenPencilSettings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_openPencilSettings");
}

- (void)_openPencilSettings
{
  +[PKSettingsDaemon openPencilPreferences](PKSettingsDaemon, "openPencilPreferences");
}

- (CGRect)adjustedWindowSceneBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_adjustedWindowSceneBounds.origin.x;
  y = self->_adjustedWindowSceneBounds.origin.y;
  width = self->_adjustedWindowSceneBounds.size.width;
  height = self->_adjustedWindowSceneBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (PKPaletteControllerDelegate)delegate
{
  return (PKPaletteControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKTextInputWindowFirstResponder)firstResponder
{
  return self->_firstResponder;
}

- (PKPaletteTapToRadarCommand)tapToRadarCommand
{
  return self->_tapToRadarCommand;
}

- (void)setTapToRadarCommand:(id)a3
{
  objc_storeStrong((id *)&self->_tapToRadarCommand, a3);
}

- (PKPaletteHostView)_hostView
{
  return self->__hostView;
}

- (void)set_hostView:(id)a3
{
  objc_storeStrong((id *)&self->__hostView, a3);
}

- (PKUCBPaletteView)_paletteView
{
  return self->__paletteView;
}

- (void)set_paletteView:(id)a3
{
  objc_storeStrong((id *)&self->__paletteView, a3);
}

- (NSLayoutConstraint)paletteHostViewWidthConstraint
{
  return self->_paletteHostViewWidthConstraint;
}

- (void)setPaletteHostViewWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_paletteHostViewWidthConstraint, a3);
}

- (NSLayoutConstraint)paletteHostViewHeightConstraint
{
  return self->_paletteHostViewHeightConstraint;
}

- (void)setPaletteHostViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_paletteHostViewHeightConstraint, a3);
}

- (PKPaletteButton)undoButton
{
  return self->_undoButton;
}

- (void)setUndoButton:(id)a3
{
  objc_storeStrong((id *)&self->_undoButton, a3);
}

- (PKPaletteButton)redoButton
{
  return self->_redoButton;
}

- (void)setRedoButton:(id)a3
{
  objc_storeStrong((id *)&self->_redoButton, a3);
}

- (PKPaletteButton)returnKeyButton
{
  return self->_returnKeyButton;
}

- (void)setReturnKeyButton:(id)a3
{
  objc_storeStrong((id *)&self->_returnKeyButton, a3);
}

- (PKPaletteKeyboardButton)keyboardButton
{
  return self->_keyboardButton;
}

- (void)setKeyboardButton:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardButton, a3);
}

- (NSArray)trailingButtonsWithReturnKey
{
  return self->_trailingButtonsWithReturnKey;
}

- (NSArray)trailingButtonsWithoutReturnKey
{
  return self->_trailingButtonsWithoutReturnKey;
}

- (PKPaletteFloatingKeyboardController)floatingKeyboardController
{
  return self->_floatingKeyboardController;
}

- (void)setFloatingKeyboardController:(id)a3
{
  objc_storeStrong((id *)&self->_floatingKeyboardController, a3);
}

- (PKPaletteInputAssistantButtonProvider)inputAssistantButtonProvider
{
  return self->_inputAssistantButtonProvider;
}

- (void)setInputAssistantButtonProvider:(id)a3
{
  objc_storeStrong((id *)&self->_inputAssistantButtonProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputAssistantButtonProvider, 0);
  objc_storeStrong((id *)&self->_floatingKeyboardController, 0);
  objc_storeStrong((id *)&self->_trailingButtonsWithoutReturnKey, 0);
  objc_storeStrong((id *)&self->_trailingButtonsWithReturnKey, 0);
  objc_storeStrong((id *)&self->_keyboardButton, 0);
  objc_storeStrong((id *)&self->_returnKeyButton, 0);
  objc_storeStrong((id *)&self->_redoButton, 0);
  objc_storeStrong((id *)&self->_undoButton, 0);
  objc_storeStrong((id *)&self->_paletteHostViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_paletteHostViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->__paletteView, 0);
  objc_storeStrong((id *)&self->__hostView, 0);
  objc_storeStrong((id *)&self->_tapToRadarCommand, 0);
  objc_storeStrong((id *)&self->_firstResponder, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
