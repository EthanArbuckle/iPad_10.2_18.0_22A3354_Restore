@implementation SFDownloadsUnifiedBarItemView

- (SFDownloadsUnifiedBarItemView)init
{
  SFDownloadsUnifiedBarItemView *v2;
  uint64_t v3;
  SFDownloadsBarButtonItemView *buttonView;
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
  SFDownloadsUnifiedBarItemView *v15;
  objc_super v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)SFDownloadsUnifiedBarItemView;
  v2 = -[SFDownloadsUnifiedBarItemView init](&v17, sel_init);
  if (v2)
  {
    +[SFDownloadsBarButtonItemView buttonWithType:](SFDownloadsBarButtonItemView, "buttonWithType:", 1);
    v3 = objc_claimAutoreleasedReturnValue();
    buttonView = v2->_buttonView;
    v2->_buttonView = (SFDownloadsBarButtonItemView *)v3;

    -[SFDownloadsBarButtonItemView setProgress:](v2->_buttonView, "setProgress:", -2.0);
    -[SFDownloadsBarButtonItemView setUserInteractionEnabled:](v2->_buttonView, "setUserInteractionEnabled:", 0);
    -[SFUnifiedBarItemView contentView](v2, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v2->_buttonView);
    v6 = (void *)MEMORY[0x1E0CB3718];
    -[SFDownloadsBarButtonItemView centerXAnchor](v2->_buttonView, "centerXAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centerXAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v9;
    -[SFDownloadsBarButtonItemView centerYAnchor](v2->_buttonView, "centerYAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centerYAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activateConstraints:", v13);

    -[SFDownloadsUnifiedBarItemView sf_applyContentSizeCategoryLimitsForToolbarButton](v2, "sf_applyContentSizeCategoryLimitsForToolbarButton");
    _SFAccessibilityIdentifierForBarItem();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDownloadsUnifiedBarItemView setAccessibilityIdentifier:](v2, "setAccessibilityIdentifier:", v14);

    -[SFDownloadsUnifiedBarItemView setPointerStyleProvider:](v2, "setPointerStyleProvider:", &__block_literal_global_76);
    v15 = v2;

  }
  return v2;
}

id __37__SFDownloadsUnifiedBarItemView_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0DC3B38];
  v5 = (void *)MEMORY[0x1E0DC3B30];
  v6 = a3;
  objc_msgSend(v5, "sf_shapeForToolbarButton:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "styleWithEffect:shape:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (double)preferredWidth
{
  double result;

  -[SFDownloadsBarButtonItemView intrinsicContentSize](self->_buttonView, "intrinsicContentSize");
  return result;
}

- (double)progress
{
  double result;

  -[SFDownloadsBarButtonItemView progress](self->_buttonView, "progress");
  return result;
}

- (void)setProgress:(double)a3
{
  -[SFDownloadsBarButtonItemView setProgress:](self->_buttonView, "setProgress:", a3);
}

- (void)pulse
{
  -[SFDownloadsBarButtonItemView pulse](self->_buttonView, "pulse");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonView, 0);
}

@end
