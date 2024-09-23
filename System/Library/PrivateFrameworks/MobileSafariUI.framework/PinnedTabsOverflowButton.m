@implementation PinnedTabsOverflowButton

- (void)setShowsTrailingSeparator:(BOOL)a3
{
  -[UIVisualEffectView setHidden:](self->_trailingSeparator, "setHidden:", !a3);
}

- (void)setTintStyle:(int64_t)a3
{
  id v4;

  if (self->_tintStyle != a3)
  {
    self->_tintStyle = a3;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0DC3F08], "_sf_effectWithStyle:forBarTintStyle:", 6, a3);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView setEffect:](self->_trailingSeparator, "setEffect:", v4);

    }
  }
}

- (PinnedTabsOverflowButton)initWithFrame:(CGRect)a3
{
  PinnedTabsOverflowButton *v3;
  void *v4;
  void *v5;
  void *v6;
  UIVisualEffectView *v7;
  UIVisualEffectView *trailingSeparator;
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
  uint64_t v20;
  void *v21;
  void *v22;
  PinnedTabsOverflowButton *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;
  _QWORD v31[5];

  v31[4] = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)PinnedTabsOverflowButton;
  v3 = -[PinnedTabsOverflowButton initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3520], "borderlessButtonConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("chevron.forward.2"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v4;
    objc_msgSend(v4, "setImage:", v5);

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPreferredSymbolConfigurationForImage:", v6);

    -[PinnedTabsOverflowButton setConfiguration:](v3, "setConfiguration:", v4);
    v7 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E0DC3F58]);
    trailingSeparator = v3->_trailingSeparator;
    v3->_trailingSeparator = v7;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](v3->_trailingSeparator, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v9);

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v3->_trailingSeparator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PinnedTabsOverflowButton addSubview:](v3, "addSubview:", v3->_trailingSeparator);
    v25 = (void *)MEMORY[0x1E0CB3718];
    -[UIVisualEffectView trailingAnchor](v3->_trailingSeparator, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PinnedTabsOverflowButton trailingAnchor](v3, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v26;
    -[UIVisualEffectView topAnchor](v3->_trailingSeparator, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PinnedTabsOverflowButton topAnchor](v3, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v13;
    -[UIVisualEffectView widthAnchor](v3->_trailingSeparator, "widthAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _SFOnePixel();
    objc_msgSend(v14, "constraintEqualToConstant:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v15;
    -[UIVisualEffectView heightAnchor](v3->_trailingSeparator, "heightAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PinnedTabsOverflowButton heightAnchor](v3, "heightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "activateConstraints:", v19);

    v20 = *MEMORY[0x1E0DC4918];
    -[PinnedTabsOverflowButton setMinimumContentSizeCategory:](v3, "setMinimumContentSizeCategory:", *MEMORY[0x1E0DC4918]);
    -[PinnedTabsOverflowButton setMaximumContentSizeCategory:](v3, "setMaximumContentSizeCategory:", v20);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PinnedTabsOverflowButton setTintColor:](v3, "setTintColor:", v21);

    -[PinnedTabsOverflowButton setShowsMenuAsPrimaryAction:](v3, "setShowsMenuAsPrimaryAction:", 1);
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3858]), "initWithTarget:action:", v3, sel__hover_);
    -[PinnedTabsOverflowButton addGestureRecognizer:](v3, "addGestureRecognizer:", v22);

    v23 = v3;
  }

  return v3;
}

- (BOOL)showsTrailingSeparator
{
  return -[UIVisualEffectView isHidden](self->_trailingSeparator, "isHidden") ^ 1;
}

- (void)_hover:(id)a3
{
  -[PinnedTabsOverflowButton _setHovering:](self, "_setHovering:", (unint64_t)(objc_msgSend(a3, "state") - 1) < 2);
}

- (void)_setHovering:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_hovering != a3)
  {
    self->_hovering = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __41__PinnedTabsOverflowButton__setHovering___block_invoke;
    v3[3] = &unk_1E9CF1EE8;
    v3[4] = self;
    v4 = a3;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v3, 0, 0.2, 0.0);
  }
}

void __41__PinnedTabsOverflowButton__setHovering___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(MEMORY[0x1E0DC3658], "sf_separateTabBarHighlightColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", v2);

}

- (int64_t)tintStyle
{
  return self->_tintStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingSeparator, 0);
}

@end
