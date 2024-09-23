@implementation SFTabOverviewSearchBar

- (BOOL)embeddedInToolbar
{
  return self->_embeddedInToolbar;
}

- (SFTabOverviewSearchBar)initWithFrame:(CGRect)a3
{
  SFTabOverviewSearchBar *v3;
  SFTabOverviewSearchBar *v4;
  void *v5;
  void *v6;
  void *v7;
  SFTabOverviewSearchBar *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFTabOverviewSearchBar;
  v3 = -[SFTabOverviewSearchBar initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFTabOverviewSearchBar searchField](v3, "searchField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("TabOverviewSearchField"));

    -[SFTabOverviewSearchBar setDrawsBackground:](v4, "setDrawsBackground:", 0);
    -[SFTabOverviewSearchBar setExclusiveTouch:](v4, "setExclusiveTouch:", 1);
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTabOverviewSearchBar setPlaceholder:](v4, "setPlaceholder:", v6);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTabOverviewSearchBar setTintColor:](v4, "setTintColor:", v7);

    -[SFTabOverviewSearchBar _setAutoDisableCancelButton:](v4, "_setAutoDisableCancelButton:", 0);
    v8 = v4;
  }

  return v4;
}

- (void)setEmbeddedInToolbar:(BOOL)a3
{
  uint64_t v3;

  if (self->_embeddedInToolbar != a3)
  {
    self->_embeddedInToolbar = a3;
    if (a3)
      v3 = 10;
    else
      v3 = 0;
    -[SFTabOverviewSearchBar _setOverrideContentInsets:forRectEdges:](self, "_setOverrideContentInsets:forRectEdges:", v3, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  }
}

- (double)minimumWidth
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[SFTabOverviewSearchBar text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFTabOverviewSearchBar setText:](self, "setText:", &stru_1E9CFDBB0);
  -[SFTabOverviewSearchBar searchField](self, "searchField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v6 = v5;

  -[SFTabOverviewSearchBar setText:](self, "setText:", v3);
  return v6;
}

- (double)searchFieldHorizontalMargin
{
  void *v3;
  double MinX;
  double Width;
  CGRect v7;
  CGRect v8;
  CGRect v9;

  if ((-[SFTabOverviewSearchBar _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout") & 1) != 0)
  {
    -[SFTabOverviewSearchBar searchField](self, "searchField");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    MinX = CGRectGetMinX(v7);
  }
  else
  {
    -[SFTabOverviewSearchBar bounds](self, "bounds");
    Width = CGRectGetWidth(v8);
    -[SFTabOverviewSearchBar searchField](self, "searchField");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    MinX = Width - CGRectGetMaxX(v9);
  }

  return MinX;
}

- (void)setCancelButtonMenu:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SFTabOverviewSearchBar cancelButton](self, "cancelButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMenu:", v4);

}

- (UIMenu)cancelButtonMenu
{
  void *v2;
  void *v3;

  -[SFTabOverviewSearchBar cancelButton](self, "cancelButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "menu");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIMenu *)v3;
}

@end
