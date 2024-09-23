@implementation MRUMediaControlsModuleCollectionViewCell

- (MRUMediaControlsModuleCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  MRUMediaControlsModuleCollectionViewCell *v7;
  uint64_t v8;
  UIView *transformView;
  void *v10;
  MRUMediaControlsModuleBackgroundView *v11;
  MRUMediaControlsModuleBackgroundView *materialView;
  uint64_t v13;
  UIView *highlightView;
  void *v15;
  MRUNowPlayingCellContentView *v16;
  MRUNowPlayingCellContentView *cellContentView;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v26.receiver = self;
  v26.super_class = (Class)MRUMediaControlsModuleCollectionViewCell;
  v7 = -[MRUMediaControlsModuleCollectionViewCell initWithFrame:](&v26, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", x, y, width, height);
    transformView = v7->_transformView;
    v7->_transformView = (UIView *)v8;

    -[UIView setClipsToBounds:](v7->_transformView, "setClipsToBounds:", 1);
    -[MRUMediaControlsModuleCollectionViewCell contentView](v7, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v7->_transformView);

    v11 = -[MRUMediaControlsModuleBackgroundView initWithFrame:]([MRUMediaControlsModuleBackgroundView alloc], "initWithFrame:", x, y, width, height);
    materialView = v7->_materialView;
    v7->_materialView = v11;

    -[MRUMediaControlsModuleBackgroundView setLayout:](v7->_materialView, "setLayout:", 1);
    -[UIView addSubview:](v7->_transformView, "addSubview:", v7->_materialView);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", x, y, width, height);
    highlightView = v7->_highlightView;
    v7->_highlightView = (UIView *)v13;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v7->_highlightView, "setBackgroundColor:", v15);

    -[UIView setHidden:](v7->_highlightView, "setHidden:", 1);
    -[UIView addSubview:](v7->_transformView, "addSubview:", v7->_highlightView);
    v16 = -[MRUNowPlayingCellContentView initWithFrame:]([MRUNowPlayingCellContentView alloc], "initWithFrame:", x, y, width, height);
    cellContentView = v7->_cellContentView;
    v7->_cellContentView = v16;

    -[MRUNowPlayingCellContentView artworkView](v7->_cellContentView, "artworkView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setStyle:", 11);

    -[MRUNowPlayingCellContentView headerView](v7->_cellContentView, "headerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setLayout:", 3);

    -[MRUNowPlayingCellContentView headerView](v7->_cellContentView, "headerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "labelView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setLayout:", 5);

    -[MRUNowPlayingCellContentView artworkView](v7->_cellContentView, "artworkView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:", v7);

    -[UIView addSubview:](v7->_transformView, "addSubview:", v7->_cellContentView);
    v7->_contentScale = 1.0;
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v7);
    -[MRUMediaControlsModuleCollectionViewCell contentView](v7, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addInteraction:", v23);

    -[MRUMediaControlsModuleCollectionViewCell updateVisibility](v7, "updateVisibility");
  }
  return v7;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MRUMediaControlsModuleCollectionViewCell;
  -[MRUMediaControlsModuleCollectionViewCell layoutSubviews](&v9, sel_layoutSubviews);
  -[MRUMediaControlsModuleCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[UIView setBounds:](self->_transformView, "setBounds:");

  -[MRUMediaControlsModuleCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  UIRectGetCenter();
  -[UIView setCenter:](self->_transformView, "setCenter:");

  -[UIView bounds](self->_transformView, "bounds");
  -[MRUMediaControlsModuleBackgroundView setFrame:](self->_materialView, "setFrame:");
  -[UIView bounds](self->_transformView, "bounds");
  -[UIView setFrame:](self->_highlightView, "setFrame:");
  -[UIView bounds](self->_transformView, "bounds");
  -[MRUNowPlayingCellContentView setFrame:](self->_cellContentView, "setFrame:", v5 + self->_contentEdgeInsets.left, v6 + self->_contentEdgeInsets.top, v7 - (self->_contentEdgeInsets.left + self->_contentEdgeInsets.right), v8 - (self->_contentEdgeInsets.top + self->_contentEdgeInsets.bottom));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  CGSize result;

  width = a3.width;
  v4 = MEMORY[0x1AF423F90](self, a2, (__n128)a3, *(__n128 *)&a3.height);
  v5 = width;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  __int128 v6;
  _OWORD v7[3];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MRUMediaControlsModuleCollectionViewCell;
  -[MRUMediaControlsModuleCollectionViewCell prepareForReuse](&v8, sel_prepareForReuse);
  -[MRUMediaControlsModuleCollectionViewCell cellContentView](self, "cellContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "artworkView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepareForReuse");

  -[MRUMediaControlsModuleCollectionViewCell materialView](self, "materialView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prepareForReuse");

  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v7[0] = *MEMORY[0x1E0C9BAA8];
  v7[1] = v6;
  v7[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[MRUMediaControlsModuleCollectionViewCell setTransitionTransform:isVisible:](self, "setTransitionTransform:isVisible:", v7, 1);
  -[MRUMediaControlsModuleCollectionViewCell updateVisibility](self, "updateVisibility");
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_contentEdgeInsets.left != a3.left
    || self->_contentEdgeInsets.top != a3.top
    || self->_contentEdgeInsets.right != a3.right
    || self->_contentEdgeInsets.bottom != a3.bottom)
  {
    self->_contentEdgeInsets = a3;
    -[MRUMediaControlsModuleBackgroundView setContentEdgeInsets:](self->_materialView, "setContentEdgeInsets:");
    -[MRUMediaControlsModuleCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[UIView _setContinuousCornerRadius:](self->_transformView, "_setContinuousCornerRadius:");
  }
}

- (void)setContentMetrics:(id)a3
{
  double v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_contentMetrics, a3);
  if (v6)
    objc_msgSend(v6, "symbolScaleFactor");
  else
    v5 = 1.0;
  -[MRUMediaControlsModuleCollectionViewCell setContentScale:](self, "setContentScale:", v5);

}

- (void)setContentScale:(double)a3
{
  id v4;

  if (vabdd_f64(self->_contentScale, a3) > 2.22044605e-16)
  {
    self->_contentScale = a3;
    -[MRUMediaControlsModuleCollectionViewCell cellContentView](self, "cellContentView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setContentScale:", a3);

  }
}

- (void)setHighlighted:(BOOL)a3
{
  -[UIView setHidden:](self->_highlightView, "setHidden:", !a3);
}

- (void)setTransitionTransform:(CGAffineTransform *)a3 isVisible:(BOOL)a4
{
  _BOOL4 v4;
  __int128 v6;
  _OWORD v7[3];

  v4 = a4;
  v6 = *(_OWORD *)&a3->c;
  v7[0] = *(_OWORD *)&a3->a;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a3->tx;
  -[UIView setTransform:](self->_transformView, "setTransform:", v7);
  -[UIView setAlpha:](self->_transformView, "setAlpha:", (double)v4);
}

- (void)artworkView:(id)a3 didChangeArtworkImage:(id)a4
{
  -[MRUMediaControlsModuleBackgroundView setBackdropImage:](self->_materialView, "setBackdropImage:", a4);
  -[MRUMediaControlsModuleCollectionViewCell updateVisibility](self, "updateVisibility");
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

  v5 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", self->_transformView, v5);
  objc_msgSend(MEMORY[0x1E0DC3B10], "effectWithPreview:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPrefersScaledContent:", 0);
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)updateVisibility
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[MRUNowPlayingCellContentView artworkView](self->_cellContentView, "artworkView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MRUNowPlayingCellContentView headerView](self->_cellContentView, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "labelView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "artworkImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowDevice:", v5 != 0);

}

- (MRUNowPlayingCellContentView)cellContentView
{
  return self->_cellContentView;
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

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (CCUIModuleContentMetrics)contentMetrics
{
  return self->_contentMetrics;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (MRUMediaControlsModuleBackgroundView)materialView
{
  return self->_materialView;
}

- (void)setMaterialView:(id)a3
{
  objc_storeStrong((id *)&self->_materialView, a3);
}

- (UIView)transformView
{
  return self->_transformView;
}

- (void)setTransformView:(id)a3
{
  objc_storeStrong((id *)&self->_transformView, a3);
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_transformView, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_contentMetrics, 0);
  objc_storeStrong((id *)&self->_cellContentView, 0);
}

@end
