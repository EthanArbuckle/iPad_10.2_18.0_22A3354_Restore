@implementation MRUViewServiceEndpointTableViewCell

- (MRUViewServiceEndpointTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MRUViewServiceEndpointTableViewCell *v4;
  void *v5;
  MRUNowPlayingCellContentView *v6;
  MRUNowPlayingCellContentView *cellContentView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  UIView *separatorView;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)MRUViewServiceEndpointTableViewCell;
  v4 = -[MRUViewServiceEndpointTableViewCell initWithStyle:reuseIdentifier:](&v24, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUViewServiceEndpointTableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = objc_alloc_init(MRUNowPlayingCellContentView);
    cellContentView = v4->_cellContentView;
    v4->_cellContentView = v6;

    -[MRUNowPlayingCellContentView artworkView](v4->_cellContentView, "artworkView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setStyle:", 0);

    -[MRUNowPlayingCellContentView headerView](v4->_cellContentView, "headerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLayout:", 3);

    -[MRUNowPlayingCellContentView headerView](v4->_cellContentView, "headerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "labelView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLayout:", 1);

    -[MRUViewServiceEndpointTableViewCell contentView](v4, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v4->_cellContentView);

    v13 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v14 = objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    separatorView = v4->_separatorView;
    v4->_separatorView = (UIView *)v14;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4->_separatorView, "setBackgroundColor:", v16);

    -[MRUViewServiceEndpointTableViewCell contentView](v4, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v4->_separatorView);

    v18 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[MRUViewServiceEndpointTableViewCell setSelectedBackgroundView:](v4, "setSelectedBackgroundView:", v18);

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUViewServiceEndpointTableViewCell selectedBackgroundView](v4, "selectedBackgroundView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setBackgroundColor:", v19);

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v4);
    -[MRUViewServiceEndpointTableViewCell contentView](v4, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addInteraction:", v21);

  }
  return v4;
}

- (void)layoutSubviews
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
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  objc_super v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v21.receiver = self;
  v21.super_class = (Class)MRUViewServiceEndpointTableViewCell;
  -[MRUViewServiceEndpointTableViewCell layoutSubviews](&v21, sel_layoutSubviews);
  -[MRUViewServiceEndpointTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[MRUNowPlayingCellContentView setFrame:](self->_cellContentView, "setFrame:", v5 + self->_contentEdgeInsets.left, v7 + self->_contentEdgeInsets.top, v9 - (self->_contentEdgeInsets.left + self->_contentEdgeInsets.right), v11 - (self->_contentEdgeInsets.top + self->_contentEdgeInsets.bottom));
  -[MRUNowPlayingCellContentView textInset](self->_cellContentView, "textInset");
  UIRectInset();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[MRUViewServiceEndpointTableViewCell traitCollection](self, "traitCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "displayScale");

  v22.origin.x = v13;
  v22.origin.y = v15;
  v22.size.width = v17;
  v22.size.height = v19;
  CGRectGetMinX(v22);
  v23.origin.x = v13;
  v23.origin.y = v15;
  v23.size.width = v17;
  v23.size.height = v19;
  CGRectGetMaxY(v23);
  v24.origin.x = v13;
  v24.origin.y = v15;
  v24.size.width = v17;
  v24.size.height = v19;
  CGRectGetWidth(v24);
  -[MRUViewServiceEndpointTableViewCell bounds](self, "bounds");
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UIView setFrame:](self->_separatorView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[MRUNowPlayingCellContentView sizeThatFits:](self->_cellContentView, "sizeThatFits:", a3.width, a3.height);
  v6 = v5 + self->_contentEdgeInsets.top + self->_contentEdgeInsets.bottom;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MRUViewServiceEndpointTableViewCell;
  -[MRUViewServiceEndpointTableViewCell prepareForReuse](&v5, sel_prepareForReuse);
  -[MRUViewServiceEndpointTableViewCell cellContentView](self, "cellContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "artworkView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepareForReuse");

}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_contentEdgeInsets.left != a3.left
    || self->_contentEdgeInsets.top != a3.top
    || self->_contentEdgeInsets.right != a3.right
    || self->_contentEdgeInsets.bottom != a3.bottom)
  {
    self->_contentEdgeInsets = a3;
    -[MRUViewServiceEndpointTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_setShouldHaveFullLengthBottomSeparator:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MRUViewServiceEndpointTableViewCell;
  -[MRUViewServiceEndpointTableViewCell _setShouldHaveFullLengthBottomSeparator:](&v5, sel__setShouldHaveFullLengthBottomSeparator_);
  -[UIView setHidden:](self->_separatorView, "setHidden:", v3);
}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider *v5;
  MRUVisualStylingProvider *stylingProvider;
  MRUVisualStylingProvider *v7;

  v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  v7 = v5;
  if (stylingProvider != v5)
  {
    -[MRUVisualStylingProvider removeObserver:](stylingProvider, "removeObserver:", self);
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUVisualStylingProvider addObserver:](self->_stylingProvider, "addObserver:", self);
    -[MRUViewServiceEndpointTableViewCell updateVisualStyling](self, "updateVisualStyling");
    -[MRUNowPlayingCellContentView setStylingProvider:](self->_cellContentView, "setStylingProvider:", v7);
  }

}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = objc_alloc(MEMORY[0x1E0DC3D90]);
  -[MRUViewServiceEndpointTableViewCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithView:", v6);

  objc_msgSend(MEMORY[0x1E0DC3B10], "effectWithPreview:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPrefersScaledContent:", 0);
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)updateVisualStyling
{
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 4, self->_separatorView);
}

- (MRUNowPlayingCellContentView)cellContentView
{
  return self->_cellContentView;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentEdgeInsets.top;
  left = self->_contentEdgeInsets.left;
  bottom = self->_contentEdgeInsets.bottom;
  right = self->_contentEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_cellContentView, 0);
}

@end
