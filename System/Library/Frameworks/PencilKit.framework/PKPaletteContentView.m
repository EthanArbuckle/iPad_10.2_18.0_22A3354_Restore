@implementation PKPaletteContentView

- (PKPaletteContentView)initWithPaletteViewStateObservable:(id)a3
{
  id v4;
  PKPaletteContentView *v5;
  PKPaletteContentView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PKPaletteToolPickerAndColorPickerView *v11;
  PKPaletteToolPickerAndColorPickerView *toolAndColorPickerContainerView;
  id WeakRetained;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSLayoutConstraint *toolAndColorPickerContainerViewWidthConstraint;
  void *v20;
  void *v21;
  uint64_t v22;
  NSLayoutConstraint *toolAndColorPickerContainerViewHeightConstraint;
  double v24;
  double v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSLayoutConstraint *toolPickerViewWidthConstraint;
  void *v30;
  void *v31;
  uint64_t v32;
  NSLayoutConstraint *toolPickerViewHeightConstraint;
  UIView *v34;
  UIView *contextualEditingView;
  UITapGestureRecognizer *v36;
  UITapGestureRecognizer *lassoToolTapGestureRecognizerInCompact;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)PKPaletteContentView;
  v5 = -[PKPaletteContentView init](&v39, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_paletteViewState, v4);
    -[PKPaletteContentView _installStackView](v6, "_installStackView");
    -[PKPaletteContentView _installUndoRedoButtonsView](v6, "_installUndoRedoButtonsView");
    -[PKPaletteContentView undoRedoView](v6, "undoRedoView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "undoButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", v6);

    -[PKPaletteContentView undoRedoView](v6, "undoRedoView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "redoButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", v6);

    v11 = objc_alloc_init(PKPaletteToolPickerAndColorPickerView);
    toolAndColorPickerContainerView = v6->_toolAndColorPickerContainerView;
    v6->_toolAndColorPickerContainerView = v11;

    -[PKPaletteToolPickerAndColorPickerView setTranslatesAutoresizingMaskIntoConstraints:](v6->_toolAndColorPickerContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    WeakRetained = objc_loadWeakRetained((id *)&v6->_paletteViewState);
    -[PKPaletteToolPickerAndColorPickerView colorPickerContainerView](v6->_toolAndColorPickerContainerView, "colorPickerContainerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPaletteViewState:", WeakRetained);

    -[PKPaletteToolPickerAndColorPickerView colorPickerContainerView](v6->_toolAndColorPickerContainerView, "colorPickerContainerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDelegate:", v6);

    -[UIStackView addArrangedSubview:](v6->_stackView, "addArrangedSubview:", v6->_toolAndColorPickerContainerView);
    -[PKPaletteToolPickerAndColorPickerView widthAnchor](v6->_toolAndColorPickerContainerView, "widthAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView widthAnchor](v6->_stackView, "widthAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    toolAndColorPickerContainerViewWidthConstraint = v6->_toolAndColorPickerContainerViewWidthConstraint;
    v6->_toolAndColorPickerContainerViewWidthConstraint = (NSLayoutConstraint *)v18;

    -[PKPaletteToolPickerAndColorPickerView heightAnchor](v6->_toolAndColorPickerContainerView, "heightAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView heightAnchor](v6->_stackView, "heightAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    toolAndColorPickerContainerViewHeightConstraint = v6->_toolAndColorPickerContainerViewHeightConstraint;
    v6->_toolAndColorPickerContainerViewHeightConstraint = (NSLayoutConstraint *)v22;

    LODWORD(v24) = 1148829696;
    -[NSLayoutConstraint setPriority:](v6->_toolAndColorPickerContainerViewWidthConstraint, "setPriority:", v24);
    LODWORD(v25) = 1148829696;
    -[NSLayoutConstraint setPriority:](v6->_toolAndColorPickerContainerViewHeightConstraint, "setPriority:", v25);
    -[PKPaletteToolPickerAndColorPickerView toolPickerView](v6->_toolAndColorPickerContainerView, "toolPickerView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "widthAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToConstant:", 0.0);
    v28 = objc_claimAutoreleasedReturnValue();
    toolPickerViewWidthConstraint = v6->_toolPickerViewWidthConstraint;
    v6->_toolPickerViewWidthConstraint = (NSLayoutConstraint *)v28;

    -[PKPaletteToolPickerAndColorPickerView toolPickerView](v6->_toolAndColorPickerContainerView, "toolPickerView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "heightAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToConstant:", 0.0);
    v32 = objc_claimAutoreleasedReturnValue();
    toolPickerViewHeightConstraint = v6->_toolPickerViewHeightConstraint;
    v6->_toolPickerViewHeightConstraint = (NSLayoutConstraint *)v32;

    v34 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    contextualEditingView = v6->_contextualEditingView;
    v6->_contextualEditingView = v34;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v6->_contextualEditingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v36 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0DC3D80]);
    lassoToolTapGestureRecognizerInCompact = v6->_lassoToolTapGestureRecognizerInCompact;
    v6->_lassoToolTapGestureRecognizerInCompact = v36;

    -[UITapGestureRecognizer addTarget:action:](v6->_lassoToolTapGestureRecognizerInCompact, "addTarget:action:", v6, sel__didTapLassoToolInCompact);
    -[PKPaletteContentView _installAdditionalOptionsView](v6, "_installAdditionalOptionsView");
    -[PKPaletteContentView _updateUI](v6, "_updateUI");
  }

  return v6;
}

- (void)toggleColorSelectionPopover
{
  NSObject *v3;
  id v4;
  uint8_t buf[16];

  if (-[PKPaletteContentView _isHandwritingToolSelected](self, "_isHandwritingToolSelected"))
  {
    v3 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE213000, v3, OS_LOG_TYPE_INFO, "Can't present color picker popover when the handwriting tool is currently selected.", buf, 2u);
    }

  }
  else
  {
    -[PKPaletteContentView colorPickerView](self, "colorPickerView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toggleColorSelectionPopover");

  }
}

- (void)_installStackView
{
  UIStackView *v3;
  UIStackView *stackView;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *stackViewTopConstraint;
  void *v9;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *stackViewBottomConstraint;
  void *v13;
  void *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *stackViewLeftConstraint;
  void *v17;
  void *v18;
  NSLayoutConstraint *v19;
  NSLayoutConstraint *stackViewRightConstraint;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  NSLayoutConstraint *v27;
  NSLayoutConstraint *stackViewCenterXConstraint;
  void *v29;
  NSLayoutConstraint *v30;
  NSLayoutConstraint *v31;
  void *v32;
  _QWORD v33[5];

  v33[4] = *MEMORY[0x1E0C80C00];
  v3 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  stackView = self->_stackView;
  self->_stackView = v3;

  -[UIStackView setAlignment:](self->_stackView, "setAlignment:", 3);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAlignment:](self->_stackView, "setAlignment:", 3);
  -[PKPaletteContentView addSubview:](self, "addSubview:", self->_stackView);
  -[UIStackView topAnchor](self->_stackView, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteContentView topAnchor](self, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  stackViewTopConstraint = self->_stackViewTopConstraint;
  self->_stackViewTopConstraint = v7;

  -[PKPaletteContentView bottomAnchor](self, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView bottomAnchor](self->_stackView, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  stackViewBottomConstraint = self->_stackViewBottomConstraint;
  self->_stackViewBottomConstraint = v11;

  -[UIStackView leftAnchor](self->_stackView, "leftAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteContentView leftAnchor](self, "leftAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  stackViewLeftConstraint = self->_stackViewLeftConstraint;
  self->_stackViewLeftConstraint = v15;

  -[PKPaletteContentView rightAnchor](self, "rightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView rightAnchor](self->_stackView, "rightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  stackViewRightConstraint = self->_stackViewRightConstraint;
  self->_stackViewRightConstraint = v19;

  LODWORD(v21) = 1148829696;
  -[NSLayoutConstraint setPriority:](self->_stackViewLeftConstraint, "setPriority:", v21);
  LODWORD(v22) = 1148829696;
  -[NSLayoutConstraint setPriority:](self->_stackViewRightConstraint, "setPriority:", v22);
  LODWORD(v23) = 1148829696;
  -[NSLayoutConstraint setPriority:](self->_stackViewTopConstraint, "setPriority:", v23);
  LODWORD(v24) = 1148829696;
  -[NSLayoutConstraint setPriority:](self->_stackViewBottomConstraint, "setPriority:", v24);
  -[UIStackView centerXAnchor](self->_stackView, "centerXAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteContentView centerXAnchor](self, "centerXAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v27 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  stackViewCenterXConstraint = self->_stackViewCenterXConstraint;
  self->_stackViewCenterXConstraint = v27;

  v29 = (void *)MEMORY[0x1E0CB3718];
  v30 = self->_stackViewBottomConstraint;
  v33[0] = self->_stackViewTopConstraint;
  v33[1] = v30;
  v31 = self->_stackViewRightConstraint;
  v33[2] = self->_stackViewLeftConstraint;
  v33[3] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "activateConstraints:", v32);

}

- (void)_installUndoRedoButtonsView
{
  PKPaletteUndoRedoView *v3;
  PKPaletteUndoRedoView *undoRedoView;

  v3 = objc_alloc_init(PKPaletteUndoRedoView);
  undoRedoView = self->_undoRedoView;
  self->_undoRedoView = v3;

  -[PKPaletteUndoRedoView setTranslatesAutoresizingMaskIntoConstraints:](self->_undoRedoView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_undoRedoView);
}

- (PKPaletteToolPickerView)toolPickerView
{
  void *v2;
  void *v3;

  -[PKPaletteContentView toolAndColorPickerContainerView](self, "toolAndColorPickerContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toolPickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKPaletteToolPickerView *)v3;
}

- (PKPaletteColorPickerView)colorPickerView
{
  void *v2;
  void *v3;

  -[PKPaletteContentView toolAndColorPickerContainerView](self, "toolAndColorPickerContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorPickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKPaletteColorPickerView *)v3;
}

- (PKDrawingPaletteInputAssistantView)paletteInputAssistantView
{
  void *v2;
  void *v3;

  -[PKPaletteContentView toolAndColorPickerContainerView](self, "toolAndColorPickerContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paletteInputAssistantView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKDrawingPaletteInputAssistantView *)v3;
}

- (void)_installAdditionalOptionsView
{
  PKPaletteAdditionalOptionsView *v3;
  PKPaletteAdditionalOptionsView *additionalOptionsView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_alloc_init(PKPaletteAdditionalOptionsView);
  additionalOptionsView = self->_additionalOptionsView;
  self->_additionalOptionsView = v3;

  -[PKPaletteAdditionalOptionsView setTranslatesAutoresizingMaskIntoConstraints:](self->_additionalOptionsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_additionalOptionsView);
  -[PKPaletteAdditionalOptionsView widthAnchor](self->_additionalOptionsView, "widthAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToConstant:", 28.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteContentView setAdditionalOptionsViewCompactWidthConstraint:](self, "setAdditionalOptionsViewCompactWidthConstraint:", v6);

  -[PKPaletteAdditionalOptionsView heightAnchor](self->_additionalOptionsView, "heightAnchor");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaletteContentView stackView](self, "stackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "heightAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteContentView setAdditionalOptionsViewCompactHeightConstraint:](self, "setAdditionalOptionsViewCompactHeightConstraint:", v9);

}

- (UIView)lassoToolEditingView
{
  void *v2;
  void *v3;

  -[PKPaletteContentView toolAndColorPickerContainerView](self, "toolAndColorPickerContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lassoToolEditingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (NSString)lassoToolEditingViewIdentifier
{
  void *v2;
  void *v3;

  -[PKPaletteContentView toolAndColorPickerContainerView](self, "toolAndColorPickerContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lassoToolEditingViewIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setLassoToolEditingViewIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPaletteContentView toolAndColorPickerContainerView](self, "toolAndColorPickerContainerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLassoToolEditingViewIdentifier:", v4);

}

- (void)layoutSubviews
{
  _BOOL8 v3;
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)PKPaletteContentView;
  -[PKPaletteContentView layoutSubviews](&v4, sel_layoutSubviews);
  if (-[PKPaletteContentView _useCompactSize](self, "_useCompactSize"))
  {
    -[PKPaletteContentView bounds](self, "bounds");
    v3 = CGRectGetWidth(v5) <= 327.0;
  }
  else
  {
    v3 = 0;
  }
  -[PKPaletteContentView setUsingSmallestSupportedWidth:](self, "setUsingSmallestSupportedWidth:", v3);
}

- (void)setUsingSmallestSupportedWidth:(BOOL)a3
{
  if (self->_usingSmallestSupportedWidth != a3)
  {
    self->_usingSmallestSupportedWidth = a3;
    -[PKPaletteContentView _updateUI](self, "_updateUI");
  }
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaletteContentView;
  -[PKPaletteContentView safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  -[PKPaletteContentView _updateUI](self, "_updateUI");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  objc_super v22;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (!-[PKPaletteContentView contextEditingMode](self, "contextEditingMode"))
    goto LABEL_3;
  -[PKPaletteContentView contextualEditingView](self, "contextualEditingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteContentView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
  v10 = v9;
  v12 = v11;

  -[PKPaletteContentView contextualEditingView](self, "contextualEditingView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hitTest:withEvent:", v7, v10, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
LABEL_3:
    -[PKPaletteContentView toolAndColorPickerContainerView](self, "toolAndColorPickerContainerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteContentView convertPoint:toView:](self, "convertPoint:toView:", v15, x, y);
    v17 = v16;
    v19 = v18;

    -[PKPaletteContentView toolAndColorPickerContainerView](self, "toolAndColorPickerContainerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "hitTest:withEvent:", v7, v17, v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v22.receiver = self;
      v22.super_class = (Class)PKPaletteContentView;
      -[PKPaletteContentView hitTest:withEvent:](&v22, sel_hitTest_withEvent_, v7, x, y);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v14;
}

- (void)setContextEditingMode:(int64_t)a3
{
  if (self->_contextEditingMode != a3)
  {
    self->_contextEditingMode = a3;
    -[PKPaletteContentView _updateUI](self, "_updateUI");
  }
}

- (void)setEdgeLocation:(unint64_t)a3
{
  if (self->_edgeLocation != a3)
  {
    self->_edgeLocation = a3;
    -[PKPaletteContentView _updateUI](self, "_updateUI");
  }
}

- (void)setCornerLocation:(unint64_t)a3
{
  if (self->_cornerLocation != a3)
  {
    self->_cornerLocation = a3;
    -[PKPaletteContentView _updateUI](self, "_updateUI");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPaletteContentView;
  -[PKPaletteContentView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[PKPaletteContentView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "verticalSizeClass");
  if (v6 == objc_msgSend(v4, "verticalSizeClass"))
  {
    -[PKPaletteContentView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "horizontalSizeClass");
    v9 = objc_msgSend(v4, "horizontalSizeClass");

    if (v8 == v9)
      goto LABEL_6;
  }
  else
  {

  }
  -[PKPaletteContentView _updateUI](self, "_updateUI");
LABEL_6:

}

- (BOOL)_useCompactSize
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[PKPaletteContentView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteContentView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PKUseCompactSize(v3, v5);

  return v6;
}

- (void)_updateUI
{
  -[PKPaletteContentView _updateUIResetUnselectedToolsVisible:](self, "_updateUIResetUnselectedToolsVisible:", 0);
}

- (void)_updateUIResetUnselectedToolsVisible:(BOOL)a3
{
  void *v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  unint64_t v29;
  void *v30;
  unint64_t v31;
  void *v32;
  unint64_t v33;
  void *v34;
  unint64_t v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
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
  double v61;
  _BOOL4 v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  unint64_t v81;
  void *v82;
  double v83;
  double v84;
  void *v85;
  void *v86;
  void *v87;
  double v88;
  double v89;
  void *v90;
  void *v91;
  void *v92;
  double v93;
  double v94;
  void *v95;
  void *v96;
  double v97;
  void *v98;
  double v99;
  double v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  _BOOL8 v113;
  void *v114;
  _BOOL8 v115;
  _BOOL4 v116;
  void *v117;
  void *v118;
  double v119;
  double v120;
  void *v121;
  double v122;
  double v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  double v129;
  double v130;
  void *v131;
  void *v132;
  double v133;
  double v134;
  void *v135;
  void *v136;
  int64_t v137;
  void *v138;
  _BOOL8 v139;
  void *v140;
  void *v141;
  PKPaletteContentView *v142;
  void *v143;
  void *v144;
  PKPaletteContentView *v145;
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
  uint64_t v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  uint64_t v166;
  void *v167;
  void *v168;
  uint64_t v169;
  void *v170;
  void *v171;
  uint64_t v172;
  void *v173;
  _BOOL8 v174;
  void *v175;
  void *v176;
  uint64_t v177;
  void *v178;
  void *v179;
  int v180;
  uint64_t v181;
  _BOOL4 v182;
  void *v183;
  void *v184;
  _BOOL4 v185;
  _BOOL8 v186;
  void *v187;
  void *v188;
  uint64_t v189;
  void *v190;
  void *v191;
  void *v192;
  uint64_t v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  uint64_t v199;
  void *v200;
  void *v201;
  void *v202;
  uint64_t v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  char v210;
  void *v211;
  void *v212;
  void *v213;
  uint64_t v214;
  void *v215;
  _BOOL4 v216;
  _BOOL8 v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  int v222;
  uint64_t v223;
  _BOOL4 v224;
  void *v225;
  void *v226;
  uint64_t v227;
  void *v228;
  void *v229;
  uint64_t v230;
  void *v231;
  void *v232;
  uint64_t v233;
  void *v234;
  void *v235;
  uint64_t v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  _BOOL8 v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  uint64_t v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  _BOOL4 v256;
  BOOL v257;
  void *v258;
  uint64_t v259;
  void *v260;
  double v261;
  float v262;
  double v263;
  void *v264;
  id v265;
  uint64_t v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  double v276;
  double v277;
  double v278;
  void *v279;
  void *v280;
  void *v281;
  id v282;
  uint64_t v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  double v293;
  void *v294;
  void *v295;
  void *v296;
  id v297;
  uint64_t v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  double v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  int v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  _BOOL4 v323;
  _QWORD v324[5];
  _QWORD v325[3];
  _QWORD v326[4];
  _QWORD v327[5];
  _QWORD v328[11];

  v323 = a3;
  v328[9] = *MEMORY[0x1E0C80C00];
  -[PKPaletteContentView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PKIsQuickNoteWindowScene(v5);

  v317 = v6;
  -[PKPaletteContentView setClipsToBounds:](self, "setClipsToBounds:", -[PKPaletteContentView _useCompactSize](self, "_useCompactSize") & (v6 ^ 1));
  -[PKPaletteContentView _updateColorPickerContainerViewLocationInHierarchy](self, "_updateColorPickerContainerViewLocationInHierarchy");
  -[PKPaletteContentView _stackViewSpacing](self, "_stackViewSpacing");
  v8 = v7;
  -[PKPaletteContentView stackView](self, "stackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSpacing:", v8);

  v10 = 3.40282347e38;
  if (-[PKPaletteContentView _wantsUndoRedoButtonsVisible](self, "_wantsUndoRedoButtonsVisible")
    && !-[PKPaletteContentView _useCompactSize](self, "_useCompactSize"))
  {
    -[PKPaletteContentView paletteViewState](self, "paletteViewState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "paletteScaleFactor");
    v10 = v12 * 36.0;

  }
  -[PKPaletteContentView stackView](self, "stackView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteContentView undoRedoView](self, "undoRedoView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCustomSpacing:afterView:", v14, v10);

  v15 = -[PKPaletteContentView _stackViewDistribution](self, "_stackViewDistribution");
  -[PKPaletteContentView stackView](self, "stackView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDistribution:", v15);

  -[PKPaletteContentView paletteViewState](self, "paletteViewState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "paletteScaleFactor");
  v19 = v18;
  -[PKPaletteContentView undoRedoView](self, "undoRedoView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setScalingFactor:", v19);

  -[PKPaletteContentView paletteViewState](self, "paletteViewState");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "paletteScaleFactor");
  v23 = v22;
  -[PKPaletteContentView toolAndColorPickerContainerView](self, "toolAndColorPickerContainerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setScalingFactor:", v23);

  -[PKPaletteContentView paletteViewState](self, "paletteViewState");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "paletteScaleFactor");
  v27 = v26;
  -[PKPaletteContentView additionalOptionsView](self, "additionalOptionsView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setScalingFactor:", v27);

  v29 = -[PKPaletteContentView edgeLocation](self, "edgeLocation");
  -[PKPaletteContentView undoRedoView](self, "undoRedoView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setEdgeLocation:", v29);

  v31 = -[PKPaletteContentView edgeLocation](self, "edgeLocation");
  -[PKPaletteContentView toolAndColorPickerContainerView](self, "toolAndColorPickerContainerView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setEdgeLocation:", v31);

  v33 = -[PKPaletteContentView cornerLocation](self, "cornerLocation");
  -[PKPaletteContentView toolAndColorPickerContainerView](self, "toolAndColorPickerContainerView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setCornerLocation:", v33);

  v35 = -[PKPaletteContentView edgeLocation](self, "edgeLocation");
  -[PKPaletteContentView additionalOptionsView](self, "additionalOptionsView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setEdgeLocation:", v35);

  -[PKPaletteContentView _undoRedoButtonsInterItemSpacing](self, "_undoRedoButtonsInterItemSpacing");
  v38 = v37;
  -[PKPaletteContentView undoRedoView](self, "undoRedoView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setInterItemSpacing:", v38);

  v324[0] = MEMORY[0x1E0C809B0];
  v324[1] = 3221225472;
  v324[2] = __61__PKPaletteContentView__updateUIResetUnselectedToolsVisible___block_invoke;
  v324[3] = &unk_1E7778020;
  v324[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v324);
  -[PKPaletteContentView _interItemToolsSpacing](self, "_interItemToolsSpacing");
  v41 = v40;
  -[PKPaletteContentView toolPickerView](self, "toolPickerView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setInterItemToolsSpacing:", v41);

  -[PKPaletteContentView additionalOptionsView](self, "additionalOptionsView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "palettePopoverPresenting");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteContentView toolAndColorPickerContainerView](self, "toolAndColorPickerContainerView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "colorPickerContainerView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setPalettePopoverPresenting:", v44);

  v319 = (void *)MEMORY[0x1E0CB3718];
  -[PKPaletteContentView stackViewLeftConstraint](self, "stackViewLeftConstraint");
  v321 = (void *)objc_claimAutoreleasedReturnValue();
  v328[0] = v321;
  -[PKPaletteContentView stackViewRightConstraint](self, "stackViewRightConstraint");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v328[1] = v47;
  -[PKPaletteContentView stackViewCenterXConstraint](self, "stackViewCenterXConstraint");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v328[2] = v48;
  -[PKPaletteContentView toolAndColorPickerContainerViewWidthConstraint](self, "toolAndColorPickerContainerViewWidthConstraint");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v328[3] = v49;
  -[PKPaletteContentView toolAndColorPickerContainerViewHeightConstraint](self, "toolAndColorPickerContainerViewHeightConstraint");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v328[4] = v50;
  -[PKPaletteContentView toolPickerViewWidthConstraint](self, "toolPickerViewWidthConstraint");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v328[5] = v51;
  -[PKPaletteContentView toolPickerViewHeightConstraint](self, "toolPickerViewHeightConstraint");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v328[6] = v52;
  -[PKPaletteContentView additionalOptionsViewCompactWidthConstraint](self, "additionalOptionsViewCompactWidthConstraint");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v328[7] = v53;
  -[PKPaletteContentView additionalOptionsViewCompactHeightConstraint](self, "additionalOptionsViewCompactHeightConstraint");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v328[8] = v54;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v328, 9);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v319, "deactivateConstraints:", v55);

  -[PKPaletteContentView stackViewCompactLeftConstraint](self, "stackViewCompactLeftConstraint");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setActive:", 0);

  -[PKPaletteContentView stackViewCompactRightConstraint](self, "stackViewCompactRightConstraint");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setActive:", 0);

  if (-[PKPaletteContentView _useCompactSize](self, "_useCompactSize"))
  {
    -[PKPaletteContentView stackView](self, "stackView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setAxis:", 0);

    -[PKPaletteContentView stackViewTopConstraint](self, "stackViewTopConstraint");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setConstant:", 5.0);

    -[PKPaletteContentView stackViewBottomConstraint](self, "stackViewBottomConstraint");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0.0;
    objc_msgSend(v60, "setConstant:", 0.0);

    v62 = -[PKPaletteContentView _useEqualSpacingStackViewDistribution](self, "_useEqualSpacingStackViewDistribution");
    -[PKPaletteContentView stackView](self, "stackView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "leftAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteContentView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "leftAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62)
    {
      v67 = 16.0;
      if (v317)
        v67 = 0.0;
      else
        v61 = -16.0;
      objc_msgSend(v64, "constraintEqualToAnchor:constant:", v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteContentView setStackViewCompactLeftConstraint:](self, "setStackViewCompactLeftConstraint:", v68);

      -[PKPaletteContentView stackView](self, "stackView");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "rightAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteContentView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "rightAnchor");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "constraintEqualToAnchor:constant:", v72, v61);
      v73 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v64, "constraintGreaterThanOrEqualToAnchor:constant:", v66, 16.0);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteContentView setStackViewCompactLeftConstraint:](self, "setStackViewCompactLeftConstraint:", v105);

      -[PKPaletteContentView stackView](self, "stackView");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "rightAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteContentView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "rightAnchor");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "constraintLessThanOrEqualToAnchor:constant:", v72, 16.0);
      v73 = objc_claimAutoreleasedReturnValue();
    }
    v106 = (void *)v73;
    -[PKPaletteContentView setStackViewCompactRightConstraint:](self, "setStackViewCompactRightConstraint:", v73);

    v107 = (void *)MEMORY[0x1E0CB3718];
    -[PKPaletteContentView stackViewTopConstraint](self, "stackViewTopConstraint");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v327[0] = v108;
    -[PKPaletteContentView stackViewBottomConstraint](self, "stackViewBottomConstraint");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v327[1] = v109;
    -[PKPaletteContentView stackViewCenterXConstraint](self, "stackViewCenterXConstraint");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v327[2] = v101;
    -[PKPaletteContentView stackViewCompactLeftConstraint](self, "stackViewCompactLeftConstraint");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v327[3] = v110;
    -[PKPaletteContentView stackViewCompactRightConstraint](self, "stackViewCompactRightConstraint");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v327[4] = v111;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v327, 5);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "activateConstraints:", v112);

    v113 = -[PKPaletteContentView _wantsAdditionalOptionsViewVisible](self, "_wantsAdditionalOptionsViewVisible");
    -[PKPaletteContentView additionalOptionsViewCompactWidthConstraint](self, "additionalOptionsViewCompactWidthConstraint");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "setActive:", v113);

    v115 = -[PKPaletteContentView _wantsAdditionalOptionsViewVisible](self, "_wantsAdditionalOptionsViewVisible");
    -[PKPaletteContentView additionalOptionsViewCompactHeightConstraint](self, "additionalOptionsViewCompactHeightConstraint");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setActive:", v115);
    v116 = v323;
  }
  else
  {
    v74 = (void *)MEMORY[0x1E0C99DE8];
    -[PKPaletteContentView stackViewLeftConstraint](self, "stackViewLeftConstraint");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v326[0] = v75;
    -[PKPaletteContentView stackViewRightConstraint](self, "stackViewRightConstraint");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v326[1] = v76;
    -[PKPaletteContentView toolPickerViewWidthConstraint](self, "toolPickerViewWidthConstraint");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v326[2] = v77;
    -[PKPaletteContentView toolPickerViewHeightConstraint](self, "toolPickerViewHeightConstraint");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v326[3] = v78;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v326, 4);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "arrayWithArray:", v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    v81 = -[PKPaletteContentView edgeLocation](self, "edgeLocation");
    if (v81 == 8 || v81 == 2)
    {
      -[PKPaletteContentView paletteViewState](self, "paletteViewState");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "paletteScaleFactor");
      UIFloorToViewScale();
      v84 = v83;
      -[PKPaletteContentView toolPickerViewWidthConstraint](self, "toolPickerViewWidthConstraint");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "setConstant:", v84);

      -[PKPaletteContentView paletteViewState](self, "paletteViewState");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "_toolsContainerWidth");
      -[PKPaletteContentView paletteViewState](self, "paletteViewState");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "paletteScaleFactor");
      UIFloorToViewScale();
      v89 = v88;
      -[PKPaletteContentView toolPickerViewHeightConstraint](self, "toolPickerViewHeightConstraint");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "setConstant:", v89);

      -[PKPaletteContentView stackView](self, "stackView");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "setAxis:", 1);

      -[PKPaletteContentView paletteViewState](self, "paletteViewState");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "paletteScaleFactor");
      v94 = v93 * 48.0;
      -[PKPaletteContentView stackViewTopConstraint](self, "stackViewTopConstraint");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "setConstant:", v94);

      -[PKPaletteContentView paletteViewState](self, "paletteViewState");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v96, "showsPlusButton"))
        v97 = 48.0;
      else
        v97 = 26.0;
      -[PKPaletteContentView paletteViewState](self, "paletteViewState");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "paletteScaleFactor");
      v100 = v97 * v99;
      -[PKPaletteContentView stackViewBottomConstraint](self, "stackViewBottomConstraint");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "setConstant:", v100);

      -[PKPaletteContentView stackViewLeftConstraint](self, "stackViewLeftConstraint");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setConstant:", 0.0);

      -[PKPaletteContentView stackViewRightConstraint](self, "stackViewRightConstraint");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "setConstant:", 0.0);

      -[PKPaletteContentView toolAndColorPickerContainerViewWidthConstraint](self, "toolAndColorPickerContainerViewWidthConstraint");
      v104 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PKPaletteContentView paletteViewState](self, "paletteViewState");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "_toolsContainerWidth");
      -[PKPaletteContentView paletteViewState](self, "paletteViewState");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "paletteScaleFactor");
      UIFloorToViewScale();
      v120 = v119;
      -[PKPaletteContentView toolPickerViewWidthConstraint](self, "toolPickerViewWidthConstraint");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "setConstant:", v120);

      -[PKPaletteContentView paletteViewState](self, "paletteViewState");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "paletteScaleFactor");
      UIFloorToViewScale();
      v123 = v122;
      -[PKPaletteContentView toolPickerViewHeightConstraint](self, "toolPickerViewHeightConstraint");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "setConstant:", v123);

      -[PKPaletteContentView stackView](self, "stackView");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "setAxis:", 0);

      -[PKPaletteContentView stackViewTopConstraint](self, "stackViewTopConstraint");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "setConstant:", 0.0);

      -[PKPaletteContentView stackViewBottomConstraint](self, "stackViewBottomConstraint");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "setConstant:", 0.0);

      -[PKPaletteContentView paletteViewState](self, "paletteViewState");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "paletteScaleFactor");
      v130 = v129 * 26.0;
      -[PKPaletteContentView stackViewLeftConstraint](self, "stackViewLeftConstraint");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "setConstant:", v130);

      -[PKPaletteContentView paletteViewState](self, "paletteViewState");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "paletteScaleFactor");
      v134 = v133 * 26.0;
      -[PKPaletteContentView stackViewRightConstraint](self, "stackViewRightConstraint");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "setConstant:", v134);

      -[PKPaletteContentView toolAndColorPickerContainerViewHeightConstraint](self, "toolAndColorPickerContainerViewHeightConstraint");
      v104 = objc_claimAutoreleasedReturnValue();
    }
    v136 = (void *)v104;
    v116 = v323;
    objc_msgSend(v80, "addObject:", v104);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v80);
  }

  v137 = -[PKPaletteContentView contextEditingMode](self, "contextEditingMode");
  -[PKPaletteContentView toolAndColorPickerContainerView](self, "toolAndColorPickerContainerView");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "setContextEditingMode:", v137);

  v139 = -[PKPaletteContentView _contextEditingModeWantsContextualEditingViewVisible](self, "_contextEditingModeWantsContextualEditingViewVisible");
  -[PKPaletteContentView toolPickerView](self, "toolPickerView");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "setHidden:", v139);

  -[PKPaletteContentView paletteViewState](self, "paletteViewState");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v141, "prefersLargeContextualEditingUI"))
  {
    v142 = self;
  }
  else
  {
    -[PKPaletteContentView toolAndColorPickerContainerView](self, "toolAndColorPickerContainerView");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "toolPickerContainerView");
    v142 = (PKPaletteContentView *)objc_claimAutoreleasedReturnValue();

  }
  -[PKPaletteContentView contextualEditingView](self, "contextualEditingView");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "superview");
  v145 = (PKPaletteContentView *)objc_claimAutoreleasedReturnValue();

  if (v145 != v142)
  {
    -[PKPaletteContentView contextualEditingView](self, "contextualEditingView");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "removeFromSuperview");

    -[PKPaletteContentView contextualEditingView](self, "contextualEditingView");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteContentView addSubview:](v142, "addSubview:", v147);

    v314 = (void *)MEMORY[0x1E0CB3718];
    -[PKPaletteContentView contextualEditingView](self, "contextualEditingView");
    v322 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v322, "topAnchor");
    v320 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteContentView topAnchor](v142, "topAnchor");
    v318 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v320, "constraintEqualToAnchor:", v318);
    v316 = (void *)objc_claimAutoreleasedReturnValue();
    v325[0] = v316;
    -[PKPaletteContentView contextualEditingView](self, "contextualEditingView");
    v315 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v315, "bottomAnchor");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteContentView bottomAnchor](v142, "bottomAnchor");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "constraintEqualToAnchor:", v149);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v325[1] = v150;
    -[PKPaletteContentView contextualEditingView](self, "contextualEditingView");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "trailingAnchor");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteContentView trailingAnchor](v142, "trailingAnchor");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "constraintEqualToAnchor:", v153);
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    v325[2] = v154;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v325, 3);
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v314, "activateConstraints:", v155);

    if (-[PKPaletteContentView _useCompactSize](self, "_useCompactSize"))
    {
      -[PKPaletteContentView paletteViewState](self, "paletteViewState");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v156, "wantsUndoRedoButtonsVisibleInCompactSize") & 1) != 0)
      {
        -[PKPaletteContentView undoRedoView](self, "undoRedoView");
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v157, "trailingAnchor");
        v158 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[PKPaletteContentView leadingAnchor](v142, "leadingAnchor");
        v158 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v116 = v323;

    }
    else
    {
      -[PKPaletteContentView leadingAnchor](v142, "leadingAnchor");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = v323;
    }
    -[PKPaletteContentView contextualEditingView](self, "contextualEditingView");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "leadingAnchor");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "constraintEqualToAnchor:", v158);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "setActive:", 1);

  }
  v161 = -[PKPaletteContentView _contextEditingModeWantsContextualEditingViewVisible](self, "_contextEditingModeWantsContextualEditingViewVisible") ^ 1;
  -[PKPaletteContentView contextualEditingView](self, "contextualEditingView");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "setHidden:", v161);

  if (!-[PKPaletteContentView _contextEditingModeWantsContextualEditingViewVisible](self, "_contextEditingModeWantsContextualEditingViewVisible"))
  {
    -[PKPaletteContentView contextualEditingView](self, "contextualEditingView");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "subviews");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  }
  -[PKPaletteContentView paletteViewState](self, "paletteViewState");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = objc_msgSend(v165, "showsPlusButton");
  -[PKPaletteContentView additionalOptionsView](self, "additionalOptionsView");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "setShowsPlusButton:", v166);

  -[PKPaletteContentView paletteViewState](self, "paletteViewState");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v169 = objc_msgSend(v168, "showsTextButton");
  -[PKPaletteContentView additionalOptionsView](self, "additionalOptionsView");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "setShowsTextButton:", v169);

  -[PKPaletteContentView paletteViewState](self, "paletteViewState");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v172 = objc_msgSend(v171, "showsShapeButton");
  -[PKPaletteContentView additionalOptionsView](self, "additionalOptionsView");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "setShowsShapeButton:", v172);

  v174 = -[PKPaletteContentView isEllipsisButtonVisible](self, "isEllipsisButtonVisible");
  -[PKPaletteContentView additionalOptionsView](self, "additionalOptionsView");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "setWantsEllipsisButtonVisible:", v174);

  -[PKPaletteContentView paletteViewState](self, "paletteViewState");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v177 = objc_msgSend(v176, "shouldHideHoverPreviewToggle");
  -[PKPaletteContentView additionalOptionsView](self, "additionalOptionsView");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "setShouldHideHoverPreviewToggle:", v177);

  v179 = -[PKPaletteContentView contextEditingMode](self, "contextEditingMode");
  if (v116
    || (-[PKPaletteContentView paletteViewState](self, "paletteViewState"),
        v101 = (void *)objc_claimAutoreleasedReturnValue(),
        (objc_msgSend(v101, "showsLassoToolEditingView") & 1) == 0))
  {
    v180 = !v116;
    if (-[PKPaletteContentView _useCompactSize](self, "_useCompactSize"))
    {
      v181 = 0;
    }
    else
    {
      v182 = -[PKPaletteContentView _isHandwritingToolSelected](self, "_isHandwritingToolSelected");
      if (v179)
        v181 = 0;
      else
        v181 = v182;
    }
  }
  else
  {
    v180 = 1;
    v181 = 1;
  }
  -[PKPaletteContentView toolAndColorPickerContainerView](self, "toolAndColorPickerContainerView");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "colorPickerContainerView");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "setHidden:", v181);

  if (v180)
  if (!v179
    || (-[PKPaletteContentView paletteViewState](self, "paletteViewState"),
        v101 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v101, "colorSwatchesVisible")))
  {
    v185 = v179 != 0;
    if (-[PKPaletteContentView _useCompactSize](self, "_useCompactSize"))
      v186 = -[PKPaletteContentView _isHandwritingToolSelected](self, "_isHandwritingToolSelected");
    else
      v186 = 0;
  }
  else
  {
    v185 = 1;
    v186 = 1;
  }
  -[PKPaletteContentView toolAndColorPickerContainerView](self, "toolAndColorPickerContainerView");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "colorPickerView");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "setHidden:", v186);

  if (v185)
  if (v116)
  {
    v189 = 0;
  }
  else
  {
    -[PKPaletteContentView paletteViewState](self, "paletteViewState");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    v189 = objc_msgSend(v190, "showsLassoToolEditingView");

  }
  -[PKPaletteContentView toolAndColorPickerContainerView](self, "toolAndColorPickerContainerView");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "setLassoToolEditingViewVisible:", v189);

  -[PKPaletteContentView paletteViewState](self, "paletteViewState");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v192, "wantsScrollableTools"))
    v193 = -[PKPaletteContentView _useCompactSize](self, "_useCompactSize") & v189 ^ 1;
  else
    v193 = 0;
  -[PKPaletteContentView toolAndColorPickerContainerView](self, "toolAndColorPickerContainerView");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v194, "toolPickerView");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v195, "setScrollingEnabled:", v193);

  if (v116)
  {
    -[PKPaletteContentView toolPickerView](self, "toolPickerView");
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "setUnselectedToolsVisible:", 1);

    -[PKPaletteContentView additionalOptionsView](self, "additionalOptionsView");
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    v198 = v197;
    v199 = 0;
  }
  else
  {
    if (-[PKPaletteContentView _useCompactSize](self, "_useCompactSize"))
    {
      -[PKPaletteContentView paletteViewState](self, "paletteViewState");
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v200, "selectedTool");
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v201, "_isLassoTool"))
      {
        -[PKPaletteContentView paletteViewState](self, "paletteViewState");
        v202 = (void *)objc_claimAutoreleasedReturnValue();
        v203 = objc_msgSend(v202, "showsLassoToolEditingView");

      }
      else
      {
        v203 = 0;
      }

    }
    else
    {
      v203 = 0;
    }
    -[PKPaletteContentView toolPickerView](self, "toolPickerView");
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v204, "setUnselectedToolsVisible:", v203 ^ 1);

    -[PKPaletteContentView lassoToolTapGestureRecognizerInCompact](self, "lassoToolTapGestureRecognizerInCompact");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v205, "setEnabled:", v203);

    -[PKPaletteContentView toolPickerView](self, "toolPickerView");
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v206, "selectedToolView");
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v207, "gestureRecognizers");
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteContentView lassoToolTapGestureRecognizerInCompact](self, "lassoToolTapGestureRecognizerInCompact");
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    v210 = objc_msgSend(v208, "containsObject:", v209);

    if ((v210 & 1) == 0)
    {
      -[PKPaletteContentView toolPickerView](self, "toolPickerView");
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v211, "selectedToolView");
      v212 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteContentView lassoToolTapGestureRecognizerInCompact](self, "lassoToolTapGestureRecognizerInCompact");
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v212, "addGestureRecognizer:", v213);

    }
    -[PKPaletteContentView additionalOptionsView](self, "additionalOptionsView");
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    v198 = v197;
    v199 = v203;
  }
  objc_msgSend(v197, "setHidden:", v199);

  if (-[PKPaletteContentView _isHandwritingToolSelected](self, "_isHandwritingToolSelected"))
    v214 = (v179 == 0) & ~-[PKPaletteContentView _useCompactSize](self, "_useCompactSize");
  else
    v214 = 0;
  -[PKPaletteContentView toolAndColorPickerContainerView](self, "toolAndColorPickerContainerView");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v215, "setInputAssistantViewVisible:", v214);

  if (-[PKPaletteContentView _isHandwritingToolSelected](self, "_isHandwritingToolSelected"))
  {
    v216 = -[PKPaletteContentView _useCompactSize](self, "_useCompactSize");
    if (v179)
      v217 = 0;
    else
      v217 = v216;
  }
  else
  {
    v217 = 0;
  }
  -[PKPaletteContentView toolAndColorPickerContainerView](self, "toolAndColorPickerContainerView");
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v218, "colorPickerContainerView");
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v219, "setShouldShowInputAssistantView:", v217);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v220, "bundleIdentifier");
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  v222 = objc_msgSend(v221, "isEqualToString:", CFSTR("com.apple.mobilenotes"));

  if (v222)
  {
    -[PKPaletteContentView paletteViewState](self, "paletteViewState");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v179, "inputAssistantItems");
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v221, "count") <= 1)
      v223 = PKIsDeviceLocked()
          && -[PKPaletteContentView _isHandwritingToolSelected](self, "_isHandwritingToolSelected");
    else
      v223 = 1;
  }
  else
  {
    v224 = -[PKPaletteContentView _isHandwritingToolSelected](self, "_isHandwritingToolSelected");
    if (v179)
      v223 = 0;
    else
      v223 = v224;
  }
  -[PKPaletteContentView additionalOptionsView](self, "additionalOptionsView");
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v225, "setWantsInputAssistantViewVisible:", v223);

  if (v222)
  {

  }
  -[PKPaletteContentView paletteViewState](self, "paletteViewState");
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = objc_msgSend(v226, "enableKeyboardButtons");
  -[PKPaletteContentView additionalOptionsView](self, "additionalOptionsView");
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v228, "setEnableKeyboardButtons:", v227);

  -[PKPaletteContentView paletteViewState](self, "paletteViewState");
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  v230 = objc_msgSend(v229, "floatingKeyboardType");
  -[PKPaletteContentView additionalOptionsView](self, "additionalOptionsView");
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v231, "setFloatingKeyboardType:", v230);

  -[PKPaletteContentView paletteViewState](self, "paletteViewState");
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  v233 = objc_msgSend(v232, "hasHandwritingTool");
  -[PKPaletteContentView additionalOptionsView](self, "additionalOptionsView");
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v234, "setShouldShowTapToRadarOption:", v233);

  -[PKPaletteContentView paletteViewState](self, "paletteViewState");
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  v236 = objc_msgSend(v235, "canShowResetHandwritingEducationPane");
  -[PKPaletteContentView additionalOptionsView](self, "additionalOptionsView");
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v237, "setShouldShowResetHandwritingEducationPane:", v236);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v238, "bundleIdentifier");
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v237) = objc_msgSend(v239, "isEqualToString:", CFSTR("com.apple.mobilenotes"));

  if ((_DWORD)v237)
  {
    -[PKPaletteContentView paletteViewState](self, "paletteViewState");
    v240 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v240, "inputAssistantItems");
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    v242 = objc_msgSend(v241, "count") == 1;

  }
  else
  {
    v242 = 0;
  }
  -[PKPaletteContentView paletteInputAssistantView](self, "paletteInputAssistantView");
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v243, "setShouldShowKeyboardButton:", v242);

  -[PKPaletteContentView paletteInputAssistantView](self, "paletteInputAssistantView");
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v244, "setShouldShowReturnKeyButton:", v242);

  -[PKPaletteContentView paletteViewState](self, "paletteViewState");
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v245, "inputAssistantItems");
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteContentView paletteInputAssistantView](self, "paletteInputAssistantView");
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v247, "setButtons:", v246);

  -[PKPaletteContentView paletteViewState](self, "paletteViewState");
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  v249 = objc_msgSend(v248, "enableKeyboardButtons");
  -[PKPaletteContentView paletteInputAssistantView](self, "paletteInputAssistantView");
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v250, "setEnableKeyboardButtons:", v249);

  if (v242)
  {
    -[PKPaletteContentView paletteInputAssistantView](self, "paletteInputAssistantView");
    v251 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v251, "keyboardButton");
    v252 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteContentView _configureMenuForKeyboardButton:](self, "_configureMenuForKeyboardButton:", v252);

    -[PKPaletteContentView paletteInputAssistantView](self, "paletteInputAssistantView");
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v253, "returnKeyButton");
    v254 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteContentView _configureReturnKeyButton:](self, "_configureReturnKeyButton:", v254);

  }
  -[PKPaletteContentView paletteViewState](self, "paletteViewState");
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v255, "wantsMulticolorSwatchShadowInCompactSize"))
    v256 = -[PKPaletteContentView _useCompactSize](self, "_useCompactSize");
  else
    v256 = 0;

  v257 = -[PKPaletteContentView _wantsUndoRedoButtonsShadow](self, "_wantsUndoRedoButtonsShadow");
  -[PKPaletteContentView traitCollection](self, "traitCollection");
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  v259 = objc_msgSend(v258, "userInterfaceStyle");

  if (v257 || v256)
  {
    v263 = dbl_1BE4FC2B0[v259 == 2];
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v264 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v264, "colorWithAlphaComponent:", v263);
    v260 = (void *)objc_claimAutoreleasedReturnValue();

    v262 = v263;
    v261 = 10.0;
  }
  else
  {
    v260 = 0;
    v261 = 0.0;
    v262 = 0.0;
  }
  v265 = objc_retainAutorelease(v260);
  v266 = objc_msgSend(v265, "CGColor");
  -[PKPaletteContentView undoRedoView](self, "undoRedoView");
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v267, "undoButton");
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v268, "layer");
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v269, "setShadowColor:", v266);

  -[PKPaletteContentView undoRedoView](self, "undoRedoView");
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v270, "undoButton");
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v271, "layer");
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v272, "setShadowRadius:", v261);

  -[PKPaletteContentView undoRedoView](self, "undoRedoView");
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v273, "undoButton");
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v274, "layer");
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v276 = v262;
  objc_msgSend(v275, "setShadowOpacity:", v276);

  v277 = *MEMORY[0x1E0C9D820];
  v278 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[PKPaletteContentView undoRedoView](self, "undoRedoView");
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v279, "undoButton");
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v280, "layer");
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v281, "setShadowOffset:", v277, v278);

  v282 = objc_retainAutorelease(v265);
  v283 = objc_msgSend(v282, "CGColor");
  -[PKPaletteContentView undoRedoView](self, "undoRedoView");
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v284, "redoButton");
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v285, "layer");
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v286, "setShadowColor:", v283);

  -[PKPaletteContentView undoRedoView](self, "undoRedoView");
  v287 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v287, "redoButton");
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v288, "layer");
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v289, "setShadowRadius:", v261);

  -[PKPaletteContentView undoRedoView](self, "undoRedoView");
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v290, "redoButton");
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v291, "layer");
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v293 = v262;
  objc_msgSend(v292, "setShadowOpacity:", v293);

  -[PKPaletteContentView undoRedoView](self, "undoRedoView");
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v294, "redoButton");
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v295, "layer");
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v296, "setShadowOffset:", v277, v278);

  v297 = objc_retainAutorelease(v282);
  v298 = objc_msgSend(v297, "CGColor");
  -[PKPaletteContentView colorPickerView](self, "colorPickerView");
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v299, "multicolorSwatch");
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v300, "layer");
  v301 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v301, "setShadowColor:", v298);

  -[PKPaletteContentView colorPickerView](self, "colorPickerView");
  v302 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v302, "multicolorSwatch");
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v303, "layer");
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v304, "setShadowRadius:", v261);

  -[PKPaletteContentView colorPickerView](self, "colorPickerView");
  v305 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v305, "multicolorSwatch");
  v306 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v306, "layer");
  v307 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v308 = v262;
  objc_msgSend(v307, "setShadowOpacity:", v308);

  if (v256)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v309 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v309 = 0;
  }
  -[PKPaletteContentView colorPickerView](self, "colorPickerView");
  v310 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v310, "multicolorSwatch");
  v311 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v311, "setBackgroundColor:", v309);

  if (v256)
  -[PKPaletteContentView undoRedoView](self, "undoRedoView");
  v312 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v312, "updateUI");

  -[PKPaletteContentView toolAndColorPickerContainerView](self, "toolAndColorPickerContainerView");
  v313 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v313, "_updateUI");

}

uint64_t __61__PKPaletteContentView__updateUIResetUnselectedToolsVisible___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_wantsUndoRedoButtonsVisible") ^ 1;
  objc_msgSend(*(id *)(a1 + 32), "undoRedoView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", v2);

  return objc_msgSend(*(id *)(a1 + 32), "_updateAdditionalOptionsViewVisibility");
}

- (void)_didTapLassoToolInCompact
{
  void *v3;
  char v4;
  void *v5;
  int v6;

  if (-[PKPaletteContentView _useCompactSize](self, "_useCompactSize"))
  {
    -[PKPaletteContentView toolPickerView](self, "toolPickerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "unselectedToolsVisible");

    if ((v4 & 1) != 0)
    {
      -[PKPaletteContentView paletteViewState](self, "paletteViewState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "showsLassoToolEditingView");

      if (v6)
        -[PKPaletteContentView _updateUI](self, "_updateUI");
    }
    else
    {
      -[PKPaletteContentView _updateUIResetUnselectedToolsVisible:](self, "_updateUIResetUnselectedToolsVisible:", 1);
    }
  }
}

- (BOOL)_wantsUndoRedoButtonsShadow
{
  void *v3;
  void *v4;
  char v5;

  if (!-[PKPaletteContentView _useCompactSize](self, "_useCompactSize"))
    return 0;
  -[PKPaletteContentView paletteViewState](self, "paletteViewState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "wantsUndoRedoButtonsVisibleInCompactSize"))
  {
    -[PKPaletteContentView paletteViewState](self, "paletteViewState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "wantsUndoRedoButtonsShadowInCompactSize");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_updateAdditionalOptionsViewVisibility
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v3 = -[PKPaletteContentView _wantsAdditionalOptionsViewVisible](self, "_wantsAdditionalOptionsViewVisible");
  -[PKPaletteContentView stackView](self, "stackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrangedSubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteContentView additionalOptionsView](self, "additionalOptionsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (!v3 || (v7 & 1) != 0)
  {
    if (((v3 | v7 ^ 1) & 1) != 0)
      return;
    -[PKPaletteContentView additionalOptionsView](self, "additionalOptionsView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");
  }
  else
  {
    -[PKPaletteContentView stackView](self, "stackView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPaletteContentView additionalOptionsView](self, "additionalOptionsView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addArrangedSubview:", v8);

  }
}

- (BOOL)_wantsAdditionalOptionsViewVisible
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  -[PKPaletteContentView paletteViewState](self, "paletteViewState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasHandwritingTool")
    && -[PKPaletteContentView isUsingSmallestSupportedWidth](self, "isUsingSmallestSupportedWidth"))
  {
    v4 = 1;
  }
  else
  {
    -[PKPaletteContentView paletteViewState](self, "paletteViewState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "showsPlusButton") & 1) != 0
      || -[PKPaletteContentView isEllipsisButtonVisible](self, "isEllipsisButtonVisible"))
    {
      v4 = 1;
    }
    else
    {
      -[PKPaletteContentView paletteViewState](self, "paletteViewState");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "showsTextButton") & 1) != 0)
      {
        v4 = 1;
      }
      else
      {
        -[PKPaletteContentView paletteViewState](self, "paletteViewState");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v7, "showsShapeButton");

      }
    }

  }
  return v4;
}

- (void)_updateColorPickerContainerViewLocationInHierarchy
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (-[PKPaletteContentView _useCompactSize](self, "_useCompactSize"))
  {
    -[PKPaletteContentView paletteViewState](self, "paletteViewState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "useEqualSpacingLayoutInCompactSize");

  }
  else
  {
    v4 = 0;
  }
  -[PKPaletteContentView stackView](self, "stackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrangedSubviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteContentView toolAndColorPickerContainerView](self, "toolAndColorPickerContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorPickerContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "containsObject:", v8);

  -[PKPaletteContentView toolAndColorPickerContainerView](self, "toolAndColorPickerContainerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWantsColorPickerContainerViewInHierarchy:", v4 ^ 1u);

  if (((v4 ^ 1) & 1) != 0 || (v9 & 1) != 0)
  {
    if (((v4 | v9 ^ 1) & 1) != 0)
      return;
    -[PKPaletteContentView toolAndColorPickerContainerView](self, "toolAndColorPickerContainerView");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "colorPickerContainerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeFromSuperview");
  }
  else
  {
    -[PKPaletteContentView stackView](self, "stackView");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPaletteContentView toolAndColorPickerContainerView](self, "toolAndColorPickerContainerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "colorPickerContainerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addArrangedSubview:", v12);

  }
}

- (double)_interItemToolsSpacing
{
  double v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  double v9;

  if (!-[PKPaletteContentView _useCompactSize](self, "_useCompactSize"))
  {
    -[PKPaletteContentView toolPickerView](self, "toolPickerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toolViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") >= 8)
      v7 = 15.0;
    else
      v7 = 12.0;
    -[PKPaletteContentView paletteViewState](self, "paletteViewState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "paletteScaleFactor");
    v3 = v7 * v9;

    goto LABEL_8;
  }
  v3 = 0.0;
  if (!-[PKPaletteContentView isUsingSmallestSupportedWidth](self, "isUsingSmallestSupportedWidth"))
  {
    -[PKPaletteContentView paletteViewState](self, "paletteViewState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interItemToolsSpacingInCompactSize");
    v3 = v5;
LABEL_8:

  }
  return v3;
}

- (double)_undoRedoButtonsInterItemSpacing
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  int v7;
  void *v8;
  double v9;

  -[PKPaletteContentView paletteViewState](self, "paletteViewState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interItemUndoRedoButtonsSpacing");
  v5 = v4;

  if (-[PKPaletteContentView _useCompactSize](self, "_useCompactSize"))
  {
    -[PKPaletteContentView paletteViewState](self, "paletteViewState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "wantsUndoRedoButtonsShadowInCompactSize");

    if (v7)
    {
      -[PKPaletteContentView paletteViewState](self, "paletteViewState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "interItemUndoRedoButtonsSpacingInCompactSize");
      v5 = v9;

    }
  }
  return v5;
}

- (BOOL)_contextEditingModeWantsContextualEditingViewVisible
{
  int64_t v3;

  v3 = -[PKPaletteContentView contextEditingMode](self, "contextEditingMode");
  if (v3)
    LOBYTE(v3) = -[PKPaletteContentView contextEditingMode](self, "contextEditingMode") != 3;
  return v3;
}

- (BOOL)_wantsUndoRedoButtonsVisible
{
  void *v3;
  char v4;

  if (!-[PKPaletteContentView _useCompactSize](self, "_useCompactSize"))
    return 1;
  -[PKPaletteContentView paletteViewState](self, "paletteViewState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wantsUndoRedoButtonsVisibleInCompactSize");

  return v4;
}

- (BOOL)isEllipsisButtonVisible
{
  void *v4;
  char v5;

  if (PKIsVisionDevice())
    return 0;
  if (!-[PKPaletteContentView _useCompactSize](self, "_useCompactSize"))
    return 1;
  -[PKPaletteContentView paletteViewState](self, "paletteViewState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "wantsEllipsisButtonVisibleInCompactSize");

  return v5;
}

- (BOOL)_isHandwritingToolSelected
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[PKPaletteContentView paletteViewState](self, "paletteViewState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedTool");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ink");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isHandwritingInk");

  return v5;
}

- (double)_stackViewSpacing
{
  double v3;
  void *v4;
  int v5;
  void *v6;
  double v7;

  if (-[PKPaletteContentView _useCompactSize](self, "_useCompactSize"))
  {
    v3 = 10.0;
    if (-[PKPaletteContentView isUsingSmallestSupportedWidth](self, "isUsingSmallestSupportedWidth"))
    {
      v3 = 0.0;
      if (!-[PKPaletteContentView _wantsUndoRedoButtonsVisible](self, "_wantsUndoRedoButtonsVisible"))
      {
        -[PKPaletteContentView paletteViewState](self, "paletteViewState");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "hasHandwritingTool");

        if (v5)
          return 5.0;
        else
          return 10.0;
      }
    }
  }
  else
  {
    -[PKPaletteContentView edgeLocation](self, "edgeLocation");
    -[PKPaletteContentView paletteViewState](self, "paletteViewState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "paletteScaleFactor");
    v3 = v7 * 26.0;

  }
  return v3;
}

- (int64_t)_stackViewDistribution
{
  if (-[PKPaletteContentView _useEqualSpacingStackViewDistribution](self, "_useEqualSpacingStackViewDistribution"))
    return 3;
  else
    return 0;
}

- (BOOL)_useEqualSpacingStackViewDistribution
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[PKPaletteContentView _useCompactSize](self, "_useCompactSize");
  if (v3)
  {
    -[PKPaletteContentView paletteViewState](self, "paletteViewState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "useEqualSpacingLayoutInCompactSize");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (double)toolPickerView:(id)a3 widthForToolAtIndex:(int64_t)a4 isCompactSize:(BOOL)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  double v9;

  v6 = a3;
  if (-[PKPaletteContentView isUsingSmallestSupportedWidth](self, "isUsingSmallestSupportedWidth")
    && (-[PKPaletteContentView _wantsUndoRedoButtonsVisible](self, "_wantsUndoRedoButtonsVisible")
     || (objc_msgSend(v6, "toolViews"),
         v7 = (void *)objc_claimAutoreleasedReturnValue(),
         v8 = objc_msgSend(v7, "count"),
         v7,
         v8 == 7)))
  {
    v9 = 31.0;
  }
  else
  {
    v9 = 34.0;
  }

  return v9;
}

- (void)_configureMenuForKeyboardButton:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PKPaletteContentView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardSelectionMenuForContentView:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setKeyboardSelectionMenu:", v5);

  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__handleKeyboardButtonPressed, 64);
}

- (void)_configureReturnKeyButton:(id)a3
{
  objc_msgSend(a3, "addTarget:action:forControlEvents:", self, sel__handleReturnKeyButtonPressed, 64);
}

- (void)colorPickerContainerView:(id)a3 willPresentInputAssistantView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  -[PKPaletteContentView paletteViewState](self, "paletteViewState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inputAssistantItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setButtons:", v7);

  objc_msgSend(v5, "setUseCompactLayout:", 1);
  objc_msgSend(v5, "setShouldShowKeyboardButton:", 1);
  objc_msgSend(v5, "setShouldShowReturnKeyButton:", 1);
  -[PKPaletteContentView paletteViewState](self, "paletteViewState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnableKeyboardButtons:", objc_msgSend(v8, "enableKeyboardButtons"));

  objc_msgSend(v5, "keyboardButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteContentView _configureMenuForKeyboardButton:](self, "_configureMenuForKeyboardButton:", v9);

  objc_msgSend(v5, "returnKeyButton");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[PKPaletteContentView _configureReturnKeyButton:](self, "_configureReturnKeyButton:", v10);
}

- (void)colorPickerContainerView:(id)a3 willDismissInputAssistantView:(id)a4
{
  id v5;

  -[PKPaletteContentView delegate](self, "delegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentViewDidDismissInputAssistantView:", self);

}

- (void)_handleKeyboardButtonPressed
{
  id v3;

  -[PKPaletteContentView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentViewDidSelectInputAssistantKeyboardItem:", self);

}

- (void)_handleReturnKeyButtonPressed
{
  id v3;

  -[PKPaletteContentView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentViewDidSelectInputAssistantReturnKeyItem:", self);

}

- (void)dismissPalettePopoverWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;
  _QWORD v13[4];
  NSObject *v14;

  v4 = a3;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  -[PKPaletteContentView toolAndColorPickerContainerView](self, "toolAndColorPickerContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__PKPaletteContentView_dismissPalettePopoverWithCompletion___block_invoke;
  v13[3] = &unk_1E7778020;
  v8 = v5;
  v14 = v8;
  objc_msgSend(v6, "dismissPalettePopoverWithCompletion:", v13);

  dispatch_group_enter(v8);
  -[PKPaletteContentView additionalOptionsView](self, "additionalOptionsView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __60__PKPaletteContentView_dismissPalettePopoverWithCompletion___block_invoke_2;
  v11[3] = &unk_1E7778020;
  v10 = v8;
  v12 = v10;
  objc_msgSend(v9, "dismissPalettePopoverWithCompletion:", v11);

  if (v4)
    dispatch_group_notify(v10, MEMORY[0x1E0C80D38], v4);

}

void __60__PKPaletteContentView_dismissPalettePopoverWithCompletion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __60__PKPaletteContentView_dismissPalettePopoverWithCompletion___block_invoke_2(uint64_t a1)
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

  -[PKPaletteContentView additionalOptionsView](self, "additionalOptionsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "plusButtonFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PKPaletteContentView additionalOptionsView](self, "additionalOptionsView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteContentView convertRect:fromView:](self, "convertRect:fromView:", v12, v5, v7, v9, v11);
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

- (void)_dismissPalettePopoverUsingConfirmationBlock:(id)a3 completion:(id)a4
{
  unsigned int (**v6)(id, void *);
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void (**block)(_QWORD);
  _QWORD v21[4];
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _QWORD v28[5];

  v28[3] = *MEMORY[0x1E0C80C00];
  v6 = (unsigned int (**)(id, void *))a3;
  block = (void (**)(_QWORD))a4;
  v7 = dispatch_group_create();
  -[PKPaletteContentView toolPickerView](self, "toolPickerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v8;
  -[PKPaletteContentView colorPickerView](self, "colorPickerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v9;
  -[PKPaletteContentView additionalOptionsView](self, "additionalOptionsView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    v16 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (v6[2](v6, v18))
        {
          dispatch_group_enter(v7);
          v21[0] = v16;
          v21[1] = 3221225472;
          v21[2] = __80__PKPaletteContentView__dismissPalettePopoverUsingConfirmationBlock_completion___block_invoke;
          v21[3] = &unk_1E7778020;
          v22 = v7;
          objc_msgSend(v18, "dismissPalettePopoverWithCompletion:", v21);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v14);
  }

  if (dispatch_group_wait(v7, 0))
  {
    v19 = block;
    dispatch_group_notify(v7, MEMORY[0x1E0C80D38], block);
  }
  else
  {
    v19 = block;
    if (block)
      block[2](block);
  }

}

void __80__PKPaletteContentView__dismissPalettePopoverUsingConfirmationBlock_completion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)paletteButton:(id)a3 tintColorForState:(unint64_t)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isHighlighted"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorWithAlphaComponent:", 0.5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if ((objc_msgSend(v4, "isEnabled") & 1) != 0)
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)paletteButton:(id)a3 backgroundColorForState:(unint64_t)a4
{
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = objc_msgSend(a3, "isHighlighted");
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "colorWithAlphaComponent:", 0.5);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  return v6;
}

- (void)paletteViewStateDidChange:(id)a3
{
  -[PKPaletteContentView paletteViewStateDidChange:updatePaletteAppearance:](self, "paletteViewStateDidChange:updatePaletteAppearance:", a3, 0);
}

- (void)paletteViewStateDidChangeIsVisible:(id)a3
{
  id v4;
  int v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PKPaletteContentView _updateUI](self, "_updateUI");
  v5 = objc_msgSend(v4, "isVisible");

  if (v5)
  {
    -[PKPaletteContentView toolAndColorPickerContainerView](self, "toolAndColorPickerContainerView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "toolPickerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrollSelectedToolViewToVisibleAnimated:", 0);

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

- (PKPaletteContentViewDelegate)delegate
{
  return (PKPaletteContentViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKPaletteUndoRedoView)undoRedoView
{
  return self->_undoRedoView;
}

- (PKPaletteAdditionalOptionsView)additionalOptionsView
{
  return self->_additionalOptionsView;
}

- (UIView)contextualEditingView
{
  return self->_contextualEditingView;
}

- (void)setContextualEditingView:(id)a3
{
  objc_storeStrong((id *)&self->_contextualEditingView, a3);
}

- (int64_t)contextEditingMode
{
  return self->_contextEditingMode;
}

- (PKDrawingPaletteViewStateSubject)paletteViewState
{
  return (PKDrawingPaletteViewStateSubject *)objc_loadWeakRetained((id *)&self->_paletteViewState);
}

- (void)setPaletteViewState:(id)a3
{
  objc_storeWeak((id *)&self->_paletteViewState, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (NSLayoutConstraint)stackViewTopConstraint
{
  return self->_stackViewTopConstraint;
}

- (void)setStackViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stackViewTopConstraint, a3);
}

- (NSLayoutConstraint)stackViewBottomConstraint
{
  return self->_stackViewBottomConstraint;
}

- (void)setStackViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stackViewBottomConstraint, a3);
}

- (NSLayoutConstraint)stackViewLeftConstraint
{
  return self->_stackViewLeftConstraint;
}

- (void)setStackViewLeftConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stackViewLeftConstraint, a3);
}

- (NSLayoutConstraint)stackViewRightConstraint
{
  return self->_stackViewRightConstraint;
}

- (void)setStackViewRightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stackViewRightConstraint, a3);
}

- (NSLayoutConstraint)stackViewCenterXConstraint
{
  return self->_stackViewCenterXConstraint;
}

- (void)setStackViewCenterXConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stackViewCenterXConstraint, a3);
}

- (NSLayoutConstraint)stackViewCompactLeftConstraint
{
  return self->_stackViewCompactLeftConstraint;
}

- (void)setStackViewCompactLeftConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stackViewCompactLeftConstraint, a3);
}

- (NSLayoutConstraint)stackViewCompactRightConstraint
{
  return self->_stackViewCompactRightConstraint;
}

- (void)setStackViewCompactRightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stackViewCompactRightConstraint, a3);
}

- (PKPaletteToolPickerAndColorPickerView)toolAndColorPickerContainerView
{
  return self->_toolAndColorPickerContainerView;
}

- (void)setToolAndColorPickerContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_toolAndColorPickerContainerView, a3);
}

- (NSLayoutConstraint)toolAndColorPickerContainerViewHeightConstraint
{
  return self->_toolAndColorPickerContainerViewHeightConstraint;
}

- (void)setToolAndColorPickerContainerViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_toolAndColorPickerContainerViewHeightConstraint, a3);
}

- (NSLayoutConstraint)toolAndColorPickerContainerViewWidthConstraint
{
  return self->_toolAndColorPickerContainerViewWidthConstraint;
}

- (void)setToolAndColorPickerContainerViewWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_toolAndColorPickerContainerViewWidthConstraint, a3);
}

- (NSLayoutConstraint)toolPickerViewWidthConstraint
{
  return self->_toolPickerViewWidthConstraint;
}

- (void)setToolPickerViewWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_toolPickerViewWidthConstraint, a3);
}

- (NSLayoutConstraint)toolPickerViewHeightConstraint
{
  return self->_toolPickerViewHeightConstraint;
}

- (void)setToolPickerViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_toolPickerViewHeightConstraint, a3);
}

- (BOOL)isUsingSmallestSupportedWidth
{
  return self->_usingSmallestSupportedWidth;
}

- (UITapGestureRecognizer)lassoToolTapGestureRecognizerInCompact
{
  return self->_lassoToolTapGestureRecognizerInCompact;
}

- (void)setLassoToolTapGestureRecognizerInCompact:(id)a3
{
  objc_storeStrong((id *)&self->_lassoToolTapGestureRecognizerInCompact, a3);
}

- (NSLayoutConstraint)additionalOptionsViewCompactWidthConstraint
{
  return self->_additionalOptionsViewCompactWidthConstraint;
}

- (void)setAdditionalOptionsViewCompactWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_additionalOptionsViewCompactWidthConstraint, a3);
}

- (NSLayoutConstraint)additionalOptionsViewCompactHeightConstraint
{
  return self->_additionalOptionsViewCompactHeightConstraint;
}

- (void)setAdditionalOptionsViewCompactHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_additionalOptionsViewCompactHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalOptionsViewCompactHeightConstraint, 0);
  objc_storeStrong((id *)&self->_additionalOptionsViewCompactWidthConstraint, 0);
  objc_storeStrong((id *)&self->_lassoToolTapGestureRecognizerInCompact, 0);
  objc_storeStrong((id *)&self->_toolPickerViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_toolPickerViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_toolAndColorPickerContainerViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_toolAndColorPickerContainerViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_toolAndColorPickerContainerView, 0);
  objc_storeStrong((id *)&self->_stackViewCompactRightConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewCompactLeftConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewRightConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewLeftConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_destroyWeak((id *)&self->_paletteViewState);
  objc_storeStrong((id *)&self->_contextualEditingView, 0);
  objc_storeStrong((id *)&self->_additionalOptionsView, 0);
  objc_storeStrong((id *)&self->_undoRedoView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
