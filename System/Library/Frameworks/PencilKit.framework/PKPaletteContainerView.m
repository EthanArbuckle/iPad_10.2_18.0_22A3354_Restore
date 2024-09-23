@implementation PKPaletteContainerView

- (PKPaletteContainerView)initWithFrame:(CGRect)a3
{
  PKPaletteContainerView *v3;
  PKPaletteContainerView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaletteContainerView;
  v3 = -[PKPaletteContainerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_scalingFactor = 1.0;
    -[PKPaletteContainerView _installAccessoryView](v3, "_installAccessoryView");
    -[PKPaletteContainerView _installContentView](v4, "_installContentView");
    -[PKPaletteContainerView _updateUI](v4, "_updateUI");
  }
  return v4;
}

- (void)_installAccessoryView
{
  PKAccessoryView *v3;
  PKAccessoryView *accessoryView;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *accessoryViewTopConstraint;
  void *v9;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *accessoryViewBottomConstraint;
  void *v13;
  void *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *accessoryViewLeftConstraint;
  void *v17;
  void *v18;
  NSLayoutConstraint *v19;
  NSLayoutConstraint *accessoryViewRightConstraint;
  void *v21;
  NSLayoutConstraint *v22;
  NSLayoutConstraint *accessoryViewWidthConstraint;
  void *v24;
  NSLayoutConstraint *v25;
  NSLayoutConstraint *accessoryViewHeightConstraint;
  void *v27;
  NSLayoutConstraint *v28;
  NSLayoutConstraint *v29;
  void *v30;
  _QWORD v31[5];

  v31[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(PKAccessoryView);
  accessoryView = self->_accessoryView;
  self->_accessoryView = v3;

  -[PKAccessoryView setTranslatesAutoresizingMaskIntoConstraints:](self->_accessoryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PKAccessoryView setUserInteractionEnabled:](self->_accessoryView, "setUserInteractionEnabled:", 0);
  -[PKPaletteContainerView addSubview:](self, "addSubview:", self->_accessoryView);
  -[PKAccessoryView topAnchor](self->_accessoryView, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteContainerView topAnchor](self, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  accessoryViewTopConstraint = self->_accessoryViewTopConstraint;
  self->_accessoryViewTopConstraint = v7;

  -[PKAccessoryView bottomAnchor](self->_accessoryView, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteContainerView bottomAnchor](self, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  accessoryViewBottomConstraint = self->_accessoryViewBottomConstraint;
  self->_accessoryViewBottomConstraint = v11;

  -[PKAccessoryView leftAnchor](self->_accessoryView, "leftAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteContainerView leftAnchor](self, "leftAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  accessoryViewLeftConstraint = self->_accessoryViewLeftConstraint;
  self->_accessoryViewLeftConstraint = v15;

  -[PKAccessoryView rightAnchor](self->_accessoryView, "rightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteContainerView rightAnchor](self, "rightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  accessoryViewRightConstraint = self->_accessoryViewRightConstraint;
  self->_accessoryViewRightConstraint = v19;

  -[PKAccessoryView widthAnchor](self->_accessoryView, "widthAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToConstant:", 19.0);
  v22 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  accessoryViewWidthConstraint = self->_accessoryViewWidthConstraint;
  self->_accessoryViewWidthConstraint = v22;

  -[PKAccessoryView heightAnchor](self->_accessoryView, "heightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToConstant:", 19.0);
  v25 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  accessoryViewHeightConstraint = self->_accessoryViewHeightConstraint;
  self->_accessoryViewHeightConstraint = v25;

  v27 = (void *)MEMORY[0x1E0CB3718];
  v28 = self->_accessoryViewLeftConstraint;
  v31[0] = self->_accessoryViewTopConstraint;
  v31[1] = v28;
  v29 = self->_accessoryViewHeightConstraint;
  v31[2] = self->_accessoryViewRightConstraint;
  v31[3] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "activateConstraints:", v30);

}

- (void)_installContentView
{
  UIView *v3;
  UIView *contentView;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *contentViewTopConstraint;
  void *v9;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *contentViewBottomConstraint;
  void *v13;
  void *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *contentViewLeftConstraint;
  void *v17;
  void *v18;
  NSLayoutConstraint *v19;
  NSLayoutConstraint *contentViewRightConstraint;
  void *v21;
  NSLayoutConstraint *v22;
  NSLayoutConstraint *v23;
  void *v24;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  contentView = self->_contentView;
  self->_contentView = v3;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PKPaletteContainerView addSubview:](self, "addSubview:", self->_contentView);
  -[UIView topAnchor](self->_contentView, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteContainerView topAnchor](self, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  contentViewTopConstraint = self->_contentViewTopConstraint;
  self->_contentViewTopConstraint = v7;

  -[UIView bottomAnchor](self->_contentView, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteContainerView bottomAnchor](self, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  contentViewBottomConstraint = self->_contentViewBottomConstraint;
  self->_contentViewBottomConstraint = v11;

  -[UIView leftAnchor](self->_contentView, "leftAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteContainerView leftAnchor](self, "leftAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  contentViewLeftConstraint = self->_contentViewLeftConstraint;
  self->_contentViewLeftConstraint = v15;

  -[UIView rightAnchor](self->_contentView, "rightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteContainerView rightAnchor](self, "rightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  contentViewRightConstraint = self->_contentViewRightConstraint;
  self->_contentViewRightConstraint = v19;

  v21 = (void *)MEMORY[0x1E0CB3718];
  v22 = self->_contentViewBottomConstraint;
  v25[0] = self->_contentViewTopConstraint;
  v25[1] = v22;
  v23 = self->_contentViewRightConstraint;
  v25[2] = self->_contentViewLeftConstraint;
  v25[3] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v24);

}

- (void)updateConstraints
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
  BOOL v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  -[PKPaletteContainerView accessoryViewHeightConstraint](self, "accessoryViewHeightConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConstant:", 0.0);

  -[PKPaletteContainerView accessoryViewWidthConstraint](self, "accessoryViewWidthConstraint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstant:", 0.0);

  -[PKPaletteContainerView contentViewTopConstraint](self, "contentViewTopConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", 0.0);

  -[PKPaletteContainerView contentViewBottomConstraint](self, "contentViewBottomConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", 0.0);

  -[PKPaletteContainerView contentViewLeftConstraint](self, "contentViewLeftConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConstant:", 0.0);

  -[PKPaletteContainerView contentViewRightConstraint](self, "contentViewRightConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstant:", 0.0);

  -[PKPaletteContainerView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteContainerView window](self, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "windowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = PKUseCompactSize(v9, v11);

  if (!v12)
  {
    -[PKPaletteContainerView scalingFactor](self, "scalingFactor");
    v14 = v13;
    -[PKPaletteContainerView scalingFactor](self, "scalingFactor");
    v16 = v15;
    v17 = -[PKPaletteContainerView edgeLocation](self, "edgeLocation");
    if (v17 <= 0xF)
    {
      v18 = v14 * 19.0;
      v19 = v16 * 19.0;
      if (((1 << v17) & 0x8013) != 0)
      {
        -[PKPaletteContainerView contentViewTopConstraint](self, "contentViewTopConstraint");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setConstant:", v19);

        -[PKPaletteContainerView contentViewBottomConstraint](self, "contentViewBottomConstraint");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setConstant:", -v19);

        -[PKPaletteContainerView accessoryViewHeightConstraint](self, "accessoryViewHeightConstraint");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
        v25 = v22;
        objc_msgSend(v22, "setConstant:", v18);

        goto LABEL_8;
      }
      if (((1 << v17) & 0x104) != 0)
      {
        -[PKPaletteContainerView accessoryViewWidthConstraint](self, "accessoryViewWidthConstraint");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setConstant:", v18);

        -[PKPaletteContainerView contentViewLeftConstraint](self, "contentViewLeftConstraint");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setConstant:", v19);

        v18 = -v19;
        -[PKPaletteContainerView contentViewRightConstraint](self, "contentViewRightConstraint");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      }
    }
  }
LABEL_8:
  v26.receiver = self;
  v26.super_class = (Class)PKPaletteContainerView;
  -[PKPaletteContainerView updateConstraints](&v26, sel_updateConstraints);
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  objc_super v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  y = a3.y;
  x = a3.x;
  v35 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[PKPaletteContainerView contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteContainerView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
  v10 = v9;
  v12 = v11;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[PKPaletteContainerView contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "subviews");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reverseObjectEnumerator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v31;
    while (2)
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v31 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v19);
        -[PKPaletteContainerView contentView](self, "contentView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "convertPoint:toView:", v20, v10, v12);
        v23 = v22;
        v25 = v24;

        objc_msgSend(v20, "hitTest:withEvent:", v7, v23, v25);
        v26 = objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          v27 = (void *)v26;

          goto LABEL_11;
        }
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v17)
        continue;
      break;
    }
  }

  v29.receiver = self;
  v29.super_class = (Class)PKPaletteContainerView;
  -[PKPaletteContainerView hitTest:withEvent:](&v29, sel_hitTest_withEvent_, v7, x, y);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v27;
}

- (void)setEdgeLocation:(unint64_t)a3
{
  if (self->_edgeLocation != a3)
  {
    self->_edgeLocation = a3;
    -[PKPaletteContainerView _updateUI](self, "_updateUI");
    -[PKPaletteContainerView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setScalingFactor:(double)a3
{
  double scalingFactor;

  scalingFactor = self->_scalingFactor;
  if (scalingFactor != a3 && vabdd_f64(scalingFactor, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_scalingFactor = a3;
    -[PKPaletteContainerView _updateUI](self, "_updateUI");
    -[PKPaletteContainerView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
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
  v10.super_class = (Class)PKPaletteContainerView;
  -[PKPaletteContainerView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[PKPaletteContainerView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "verticalSizeClass");
  if (v6 == objc_msgSend(v4, "verticalSizeClass"))
  {
    -[PKPaletteContainerView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "horizontalSizeClass");
    v9 = objc_msgSend(v4, "horizontalSizeClass");

    if (v8 == v9)
      goto LABEL_6;
  }
  else
  {

  }
  -[PKPaletteContainerView _updateUI](self, "_updateUI");
  -[PKPaletteContainerView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
LABEL_6:

}

- (void)_updateUI
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
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
  void *v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[4];
  _QWORD v32[4];
  _QWORD v33[4];
  _QWORD v34[8];

  v34[6] = *MEMORY[0x1E0C80C00];
  -[PKPaletteContainerView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteContainerView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PKUseCompactSize(v3, v5);

  if (!v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3718];
    -[PKPaletteContainerView accessoryViewTopConstraint](self, "accessoryViewTopConstraint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v8;
    -[PKPaletteContainerView accessoryViewLeftConstraint](self, "accessoryViewLeftConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v9;
    -[PKPaletteContainerView accessoryViewRightConstraint](self, "accessoryViewRightConstraint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v10;
    -[PKPaletteContainerView accessoryViewBottomConstraint](self, "accessoryViewBottomConstraint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v11;
    -[PKPaletteContainerView accessoryViewHeightConstraint](self, "accessoryViewHeightConstraint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34[4] = v12;
    -[PKPaletteContainerView accessoryViewWidthConstraint](self, "accessoryViewWidthConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v34[5] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deactivateConstraints:", v14);

    v15 = -[PKPaletteContainerView edgeLocation](self, "edgeLocation");
    switch(v15)
    {
      case 0uLL:
      case 1uLL:
      case 4uLL:
        goto LABEL_3;
      case 2uLL:
        v16 = (void *)MEMORY[0x1E0CB3718];
        -[PKPaletteContainerView accessoryViewTopConstraint](self, "accessoryViewTopConstraint");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = v17;
        -[PKPaletteContainerView accessoryViewRightConstraint](self, "accessoryViewRightConstraint");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v32[1] = v18;
        -[PKPaletteContainerView accessoryViewBottomConstraint](self, "accessoryViewBottomConstraint");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v32[2] = v19;
        -[PKPaletteContainerView accessoryViewWidthConstraint](self, "accessoryViewWidthConstraint");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v32[3] = v20;
        v21 = (void *)MEMORY[0x1E0C99D20];
        v22 = v32;
        goto LABEL_8;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        break;
      case 8uLL:
        v16 = (void *)MEMORY[0x1E0CB3718];
        -[PKPaletteContainerView accessoryViewTopConstraint](self, "accessoryViewTopConstraint");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaletteContainerView accessoryViewLeftConstraint](self, "accessoryViewLeftConstraint", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v31[1] = v18;
        -[PKPaletteContainerView accessoryViewBottomConstraint](self, "accessoryViewBottomConstraint");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v31[2] = v19;
        -[PKPaletteContainerView accessoryViewWidthConstraint](self, "accessoryViewWidthConstraint");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v31[3] = v20;
        v21 = (void *)MEMORY[0x1E0C99D20];
        v22 = v31;
        goto LABEL_8;
      default:
        if (v15 != 15)
          break;
LABEL_3:
        v16 = (void *)MEMORY[0x1E0CB3718];
        -[PKPaletteContainerView accessoryViewTopConstraint](self, "accessoryViewTopConstraint");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = v17;
        -[PKPaletteContainerView accessoryViewLeftConstraint](self, "accessoryViewLeftConstraint");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v33[1] = v18;
        -[PKPaletteContainerView accessoryViewRightConstraint](self, "accessoryViewRightConstraint");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v33[2] = v19;
        -[PKPaletteContainerView accessoryViewHeightConstraint](self, "accessoryViewHeightConstraint");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v33[3] = v20;
        v21 = (void *)MEMORY[0x1E0C99D20];
        v22 = v33;
LABEL_8:
        objc_msgSend(v21, "arrayWithObjects:count:", v22, 4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "activateConstraints:", v23);

        break;
    }
  }
  v24 = -[PKPaletteContainerView edgeLocation](self, "edgeLocation");
  -[PKPaletteContainerView accessoryView](self, "accessoryView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setEdgeLocation:", v24);

  -[PKPaletteContainerView scalingFactor](self, "scalingFactor");
  v27 = v26;
  -[PKPaletteContainerView accessoryView](self, "accessoryView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setScalingFactor:", v27);

  v29 = PKIsVisionDevice() | v6;
  -[PKPaletteContainerView accessoryView](self, "accessoryView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setHidden:", v29);

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

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (NSLayoutConstraint)contentViewTopConstraint
{
  return self->_contentViewTopConstraint;
}

- (void)setContentViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewTopConstraint, a3);
}

- (NSLayoutConstraint)contentViewBottomConstraint
{
  return self->_contentViewBottomConstraint;
}

- (void)setContentViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, a3);
}

- (NSLayoutConstraint)contentViewLeftConstraint
{
  return self->_contentViewLeftConstraint;
}

- (void)setContentViewLeftConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewLeftConstraint, a3);
}

- (NSLayoutConstraint)contentViewRightConstraint
{
  return self->_contentViewRightConstraint;
}

- (void)setContentViewRightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewRightConstraint, a3);
}

- (PKAccessoryView)accessoryView
{
  return self->_accessoryView;
}

- (void)setAccessoryView:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryView, a3);
}

- (NSLayoutConstraint)accessoryViewTopConstraint
{
  return self->_accessoryViewTopConstraint;
}

- (void)setAccessoryViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryViewTopConstraint, a3);
}

- (NSLayoutConstraint)accessoryViewBottomConstraint
{
  return self->_accessoryViewBottomConstraint;
}

- (void)setAccessoryViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryViewBottomConstraint, a3);
}

- (NSLayoutConstraint)accessoryViewLeftConstraint
{
  return self->_accessoryViewLeftConstraint;
}

- (void)setAccessoryViewLeftConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryViewLeftConstraint, a3);
}

- (NSLayoutConstraint)accessoryViewRightConstraint
{
  return self->_accessoryViewRightConstraint;
}

- (void)setAccessoryViewRightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryViewRightConstraint, a3);
}

- (NSLayoutConstraint)accessoryViewWidthConstraint
{
  return self->_accessoryViewWidthConstraint;
}

- (void)setAccessoryViewWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryViewWidthConstraint, a3);
}

- (NSLayoutConstraint)accessoryViewHeightConstraint
{
  return self->_accessoryViewHeightConstraint;
}

- (void)setAccessoryViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryViewHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_accessoryViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_accessoryViewRightConstraint, 0);
  objc_storeStrong((id *)&self->_accessoryViewLeftConstraint, 0);
  objc_storeStrong((id *)&self->_accessoryViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_accessoryViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_contentViewRightConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewLeftConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
