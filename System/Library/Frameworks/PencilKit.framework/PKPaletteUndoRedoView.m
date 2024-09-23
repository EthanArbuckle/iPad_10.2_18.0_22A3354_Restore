@implementation PKPaletteUndoRedoView

- (PKPaletteUndoRedoView)initWithFrame:(CGRect)a3
{
  PKPaletteUndoRedoView *v3;
  PKPaletteUndoRedoView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaletteUndoRedoView;
  v3 = -[PKPaletteUndoRedoView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_scalingFactor = 1.0;
    v3->_interItemSpacing = 0.0;
    -[PKPaletteUndoRedoView _installStackView](v3, "_installStackView");
    if (-[PKPaletteUndoRedoView effectiveUserInterfaceLayoutDirection](v4, "effectiveUserInterfaceLayoutDirection"))
    {
      -[PKPaletteUndoRedoView _installRedoButton](v4, "_installRedoButton");
      -[PKPaletteUndoRedoView _installUndoButton](v4, "_installUndoButton");
    }
    else
    {
      -[PKPaletteUndoRedoView _installUndoButton](v4, "_installUndoButton");
      -[PKPaletteUndoRedoView _installRedoButton](v4, "_installRedoButton");
    }
    -[PKPaletteUndoRedoView _updateUI](v4, "_updateUI");
  }
  return v4;
}

- (void)_installStackView
{
  id v3;
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
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  -[PKPaletteUndoRedoView setStackView:](self, "setStackView:", v3);

  -[PKPaletteUndoRedoView stackView](self, "stackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PKPaletteUndoRedoView stackView](self, "stackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlignment:", 3);

  -[PKPaletteUndoRedoView stackView](self, "stackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSemanticContentAttribute:", 2);

  -[PKPaletteUndoRedoView stackView](self, "stackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteUndoRedoView addSubview:](self, "addSubview:", v7);

  v18 = (void *)MEMORY[0x1E0CB3718];
  -[PKPaletteUndoRedoView stackView](self, "stackView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteUndoRedoView topAnchor](self, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v22;
  -[PKPaletteUndoRedoView stackView](self, "stackView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteUndoRedoView bottomAnchor](self, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v8;
  -[PKPaletteUndoRedoView stackView](self, "stackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteUndoRedoView leadingAnchor](self, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v12;
  -[PKPaletteUndoRedoView stackView](self, "stackView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteUndoRedoView trailingAnchor](self, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activateConstraints:", v17);

}

- (void)_installUndoButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *undoButtonWidthConstraint;
  void *v12;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *undoButtonHeightConstraint;
  void *v16;
  NSLayoutConstraint *v17;
  void *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  +[PKPaletteButton undoButton](PKPaletteButton, "undoButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteUndoRedoView setUndoButton:](self, "setUndoButton:", v3);

  -[PKPaletteUndoRedoView undoButton](self, "undoButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PKPaletteUndoRedoView undoButton](self, "undoButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel_handleUndo_, 64);

  -[PKPaletteUndoRedoView stackView](self, "stackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteUndoRedoView undoButton](self, "undoButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addArrangedSubview:", v7);

  -[PKPaletteUndoRedoView undoButton](self, "undoButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "widthAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToConstant:", 0.0);
  v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  undoButtonWidthConstraint = self->_undoButtonWidthConstraint;
  self->_undoButtonWidthConstraint = v10;

  -[PKPaletteUndoRedoView undoButton](self, "undoButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "heightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToConstant:", 0.0);
  v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  undoButtonHeightConstraint = self->_undoButtonHeightConstraint;
  self->_undoButtonHeightConstraint = v14;

  v16 = (void *)MEMORY[0x1E0CB3718];
  v17 = self->_undoButtonHeightConstraint;
  v19[0] = self->_undoButtonWidthConstraint;
  v19[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activateConstraints:", v18);

}

- (void)_installRedoButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *redoButtonWidthConstraint;
  void *v12;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *redoButtonHeightConstraint;
  void *v16;
  NSLayoutConstraint *v17;
  void *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  +[PKPaletteButton redoButton](PKPaletteButton, "redoButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteUndoRedoView setRedoButton:](self, "setRedoButton:", v3);

  -[PKPaletteUndoRedoView redoButton](self, "redoButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PKPaletteUndoRedoView redoButton](self, "redoButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel_handleRedo_, 64);

  -[PKPaletteUndoRedoView stackView](self, "stackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteUndoRedoView redoButton](self, "redoButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addArrangedSubview:", v7);

  -[PKPaletteUndoRedoView redoButton](self, "redoButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "widthAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToConstant:", 0.0);
  v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  redoButtonWidthConstraint = self->_redoButtonWidthConstraint;
  self->_redoButtonWidthConstraint = v10;

  -[PKPaletteUndoRedoView redoButton](self, "redoButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "heightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToConstant:", 0.0);
  v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  redoButtonHeightConstraint = self->_redoButtonHeightConstraint;
  self->_redoButtonHeightConstraint = v14;

  v16 = (void *)MEMORY[0x1E0CB3718];
  v17 = self->_redoButtonHeightConstraint;
  v19[0] = self->_redoButtonWidthConstraint;
  v19[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activateConstraints:", v18);

}

- (CGSize)_buttonSize
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[PKPaletteUndoRedoView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteUndoRedoView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PKUseCompactSize(v3, v5);

  if (v6)
    v7 = 28.0;
  else
    v7 = 36.0;
  -[PKPaletteUndoRedoView scalingFactor](self, "scalingFactor");
  v9 = v7 * v8;
  v10 = v9;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)setInterItemSpacing:(double)a3
{
  double interItemSpacing;

  interItemSpacing = self->_interItemSpacing;
  if (interItemSpacing != a3 && vabdd_f64(interItemSpacing, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_interItemSpacing = a3;
    -[PKPaletteUndoRedoView _updateUI](self, "_updateUI");
    -[PKPaletteUndoRedoView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)_updateUI
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  _BOOL8 v18;
  id v19;

  -[PKPaletteUndoRedoView interItemSpacing](self, "interItemSpacing");
  v4 = v3;
  -[PKPaletteUndoRedoView scalingFactor](self, "scalingFactor");
  v6 = v4 * v5;
  -[PKPaletteUndoRedoView stackView](self, "stackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSpacing:", v6);

  -[PKPaletteUndoRedoView _buttonSize](self, "_buttonSize");
  v9 = v8;
  v11 = v10;
  -[PKPaletteUndoRedoView undoButtonWidthConstraint](self, "undoButtonWidthConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setConstant:", v9);

  -[PKPaletteUndoRedoView undoButtonHeightConstraint](self, "undoButtonHeightConstraint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setConstant:", v11);

  -[PKPaletteUndoRedoView redoButtonWidthConstraint](self, "redoButtonWidthConstraint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setConstant:", v9);

  -[PKPaletteUndoRedoView redoButtonHeightConstraint](self, "redoButtonHeightConstraint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setConstant:", v11);

  v16 = -[PKPaletteUndoRedoView isUndoEnabled](self, "isUndoEnabled");
  -[PKPaletteUndoRedoView undoButton](self, "undoButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setEnabled:", v16);

  v18 = -[PKPaletteUndoRedoView isRedoEnabled](self, "isRedoEnabled");
  -[PKPaletteUndoRedoView redoButton](self, "redoButton");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setEnabled:", v18);

}

- (void)setScalingFactor:(double)a3
{
  double scalingFactor;

  scalingFactor = self->_scalingFactor;
  if (scalingFactor != a3 && vabdd_f64(scalingFactor, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_scalingFactor = a3;
    -[PKPaletteUndoRedoView _updateUI](self, "_updateUI");
    -[PKPaletteUndoRedoView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)handleUndo:(id)a3
{
  id v4;

  -[PKPaletteUndoRedoView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "undoRedoViewDidTapUndo:", self);

}

- (void)handleRedo:(id)a3
{
  id v4;

  -[PKPaletteUndoRedoView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "undoRedoViewDidTapRedo:", self);

}

- (void)setUndoEnabled:(BOOL)a3
{
  self->_undoEnabled = a3;
  -[PKPaletteUndoRedoView _updateUI](self, "_updateUI");
}

- (void)setRedoEnabled:(BOOL)a3
{
  self->_redoEnabled = a3;
  -[PKPaletteUndoRedoView _updateUI](self, "_updateUI");
}

- (void)setEdgeLocation:(unint64_t)a3
{
  if (self->_edgeLocation != a3)
  {
    self->_edgeLocation = a3;
    -[PKPaletteUndoRedoView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (CGSize)intrinsicContentSize
{
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
  CGSize result;

  -[PKPaletteUndoRedoView _buttonSize](self, "_buttonSize");
  v4 = v3;
  v6 = v5;
  -[PKPaletteUndoRedoView interItemSpacing](self, "interItemSpacing");
  v8 = v7 + v4 * 2.0;
  -[PKPaletteUndoRedoView scalingFactor](self, "scalingFactor");
  v10 = v8 * v9;
  -[PKPaletteUndoRedoView scalingFactor](self, "scalingFactor");
  v12 = v6 * v11;
  v13 = v10;
  result.height = v12;
  result.width = v13;
  return result;
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

- (PKPaletteUndoRedoViewDelegate)delegate
{
  return (PKPaletteUndoRedoViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
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

- (BOOL)isUndoEnabled
{
  return self->_undoEnabled;
}

- (BOOL)isRedoEnabled
{
  return self->_redoEnabled;
}

- (double)interItemSpacing
{
  return self->_interItemSpacing;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (NSLayoutConstraint)undoButtonWidthConstraint
{
  return self->_undoButtonWidthConstraint;
}

- (void)setUndoButtonWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_undoButtonWidthConstraint, a3);
}

- (NSLayoutConstraint)undoButtonHeightConstraint
{
  return self->_undoButtonHeightConstraint;
}

- (void)setUndoButtonHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_undoButtonHeightConstraint, a3);
}

- (NSLayoutConstraint)redoButtonWidthConstraint
{
  return self->_redoButtonWidthConstraint;
}

- (void)setRedoButtonWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_redoButtonWidthConstraint, a3);
}

- (NSLayoutConstraint)redoButtonHeightConstraint
{
  return self->_redoButtonHeightConstraint;
}

- (void)setRedoButtonHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_redoButtonHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redoButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_redoButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_undoButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_undoButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_redoButton, 0);
  objc_storeStrong((id *)&self->_undoButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
