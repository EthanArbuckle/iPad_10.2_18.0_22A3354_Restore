@implementation MRUExpandableButtonSelectionView

- (void)updateVisibility
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (!self->_enabled)
  {
    v6 = (void *)MEMORY[0x1E0DC3658];
    goto LABEL_5;
  }
  if (-[MediaControlsExpandableButtonOption selectedBackground](self->_option, "selectedBackground") != 1)
  {
    if (-[MediaControlsExpandableButtonOption selectedBackground](self->_option, "selectedBackground") == 2)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    -[MediaControlsExpandableButtonOption selectedBackgroundColor](self->_option, "selectedBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[MediaControlsExpandableButtonOption selectedBackgroundColor](self->_option, "selectedBackgroundColor");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    v6 = (void *)MEMORY[0x1E0DC3658];
    if (self->_expanded)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "colorWithAlphaComponent:", 0.2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRUExpandableButtonSelectionView setBackgroundColor:](self, "setBackgroundColor:", v10);

      goto LABEL_11;
    }
LABEL_5:
    objc_msgSend(v6, "clearColor");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v9 = (void *)v7;
    -[MRUExpandableButtonSelectionView setBackgroundColor:](self, "setBackgroundColor:", v7);
LABEL_11:

    -[MRUExpandableButtonSelectionView packageView](self, "packageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v4;
    v5 = 0.0;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUExpandableButtonSelectionView setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[MRUExpandableButtonSelectionView packageView](self, "packageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v4;
  v5 = 1.0;
LABEL_12:
  objc_msgSend(v4, "setAlpha:", v5);

}

- (void)setOption:(id)a3
{
  objc_storeStrong((id *)&self->_option, a3);
  -[MRUExpandableButtonSelectionView updateVisibility](self, "updateVisibility");
}

- (MRUCAPackageView)packageView
{
  return self->_packageView;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[MRUExpandableButtonSelectionView updateVisibility](self, "updateVisibility");
  }
}

- (MRUExpandableButtonSelectionView)initWithFrame:(CGRect)a3
{
  MRUExpandableButtonSelectionView *v3;
  MRUExpandableButtonSelectionView *v4;
  MRUCAPackageView *v5;
  MRUCAPackageView *packageView;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MRUExpandableButtonSelectionView;
  v3 = -[MRUExpandableButtonSelectionView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MRUExpandableButtonSelectionView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[MRUExpandableButtonSelectionView setClipsToBounds:](v4, "setClipsToBounds:", 1);
    v4->_enabled = 1;
    v5 = objc_alloc_init(MRUCAPackageView);
    packageView = v4->_packageView;
    v4->_packageView = v5;

    +[MRUCAPackageAsset packageNamed:](MRUCAPackageAsset, "packageNamed:", CFSTR("RainbowSelection"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUCAPackageView setAsset:](v4->_packageView, "setAsset:", v7);

    -[MRUExpandableButtonSelectionView addSubview:](v4, "addSubview:", v4->_packageView);
  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v12;
  CGRect v13;

  v12.receiver = self;
  v12.super_class = (Class)MRUExpandableButtonSelectionView;
  -[MRUExpandableButtonSelectionView layoutSubviews](&v12, sel_layoutSubviews);
  -[MRUExpandableButtonSelectionView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MRUCAPackageView setFrame:](self->_packageView, "setFrame:");
  v13.origin.x = v4;
  v13.origin.y = v6;
  v13.size.width = v8;
  v13.size.height = v10;
  v11 = CGRectGetHeight(v13) * 0.5;
  -[MRUExpandableButtonSelectionView _setCornerRadius:](self, "_setCornerRadius:", v11);
  -[MRUCAPackageView _setCornerRadius:](self->_packageView, "_setCornerRadius:", v11);
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_expanded != a3)
  {
    self->_expanded = a3;
    -[MRUExpandableButtonSelectionView updateVisibility](self, "updateVisibility");
  }
}

- (MediaControlsExpandableButtonOption)option
{
  return self->_option;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (void)setPackageView:(id)a3
{
  objc_storeStrong((id *)&self->_packageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageView, 0);
  objc_storeStrong((id *)&self->_option, 0);
}

@end
