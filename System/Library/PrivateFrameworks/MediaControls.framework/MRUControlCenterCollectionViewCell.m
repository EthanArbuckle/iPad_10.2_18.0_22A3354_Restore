@implementation MRUControlCenterCollectionViewCell

- (MRUControlCenterCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  MRUControlCenterCollectionViewCell *v7;
  uint64_t v8;
  UIView *transformView;
  void *v10;
  MediaControlsMaterialView *v11;
  MediaControlsMaterialView *materialView;
  MRUNowPlayingCellContentView *v13;
  MRUNowPlayingCellContentView *cellContentView;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v22.receiver = self;
  v22.super_class = (Class)MRUControlCenterCollectionViewCell;
  v7 = -[MRUControlCenterCollectionViewCell initWithFrame:](&v22, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", x, y, width, height);
    transformView = v7->_transformView;
    v7->_transformView = (UIView *)v8;

    -[UIView setClipsToBounds:](v7->_transformView, "setClipsToBounds:", 1);
    -[MRUControlCenterCollectionViewCell contentView](v7, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v7->_transformView);

    v11 = -[MediaControlsMaterialView initWithFrame:]([MediaControlsMaterialView alloc], "initWithFrame:", x, y, width, height);
    materialView = v7->_materialView;
    v7->_materialView = v11;

    -[UIView addSubview:](v7->_transformView, "addSubview:", v7->_materialView);
    v13 = -[MRUNowPlayingCellContentView initWithFrame:]([MRUNowPlayingCellContentView alloc], "initWithFrame:", x, y, width, height);
    cellContentView = v7->_cellContentView;
    v7->_cellContentView = v13;

    -[MRUNowPlayingCellContentView artworkView](v7->_cellContentView, "artworkView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setStyle:", 0);

    -[MRUNowPlayingCellContentView headerView](v7->_cellContentView, "headerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLayout:", 3);

    -[MRUNowPlayingCellContentView headerView](v7->_cellContentView, "headerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "labelView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLayout:", 1);

    -[UIView addSubview:](v7->_transformView, "addSubview:", v7->_cellContentView);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v7);
    -[MRUControlCenterCollectionViewCell contentView](v7, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addInteraction:", v19);

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
  v9.super_class = (Class)MRUControlCenterCollectionViewCell;
  -[MRUControlCenterCollectionViewCell layoutSubviews](&v9, sel_layoutSubviews);
  -[MRUControlCenterCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[UIView setBounds:](self->_transformView, "setBounds:");

  -[MRUControlCenterCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  UIRectGetCenter();
  -[UIView setCenter:](self->_transformView, "setCenter:");

  -[UIView bounds](self->_transformView, "bounds");
  -[MediaControlsMaterialView setFrame:](self->_materialView, "setFrame:");
  -[UIView bounds](self->_transformView, "bounds");
  -[MRUNowPlayingCellContentView setFrame:](self->_cellContentView, "setFrame:", v5 + self->_contentEdgeInsets.left, v6 + self->_contentEdgeInsets.top, v7 - (self->_contentEdgeInsets.left + self->_contentEdgeInsets.right), v8 - (self->_contentEdgeInsets.top + self->_contentEdgeInsets.bottom));
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
  __int128 v5;
  _OWORD v6[3];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MRUControlCenterCollectionViewCell;
  -[MRUControlCenterCollectionViewCell prepareForReuse](&v7, sel_prepareForReuse);
  -[MRUControlCenterCollectionViewCell cellContentView](self, "cellContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "artworkView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepareForReuse");

  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v6[0] = *MEMORY[0x1E0C9BAA8];
  v6[1] = v5;
  v6[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[MRUControlCenterCollectionViewCell setTransitionTransform:isVisible:](self, "setTransitionTransform:isVisible:", v6, 1);
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_contentEdgeInsets.left != a3.left
    || self->_contentEdgeInsets.top != a3.top
    || self->_contentEdgeInsets.right != a3.right
    || self->_contentEdgeInsets.bottom != a3.bottom)
  {
    self->_contentEdgeInsets = a3;
    -[MRUControlCenterCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
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

- (void)setHighlighted:(BOOL)a3
{
  -[MediaControlsMaterialView setHighlighted:](self->_materialView, "setHighlighted:", a3);
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

- (MediaControlsMaterialView)materialView
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformView, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_cellContentView, 0);
}

@end
