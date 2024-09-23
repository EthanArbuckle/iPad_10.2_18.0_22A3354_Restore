@implementation GKDashboardPlayerShadowView

- (GKDashboardPlayerShadowView)initWithFrame:(CGRect)a3
{
  GKDashboardPlayerShadowView *v3;
  GKDashboardPlayerShadowView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKDashboardPlayerShadowView;
  v3 = -[GKDashboardPlayerShadowView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[GKDashboardPlayerShadowView setupPhoto](v3, "setupPhoto");
  return v4;
}

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKDashboardPlayerShadowView;
  -[GKDashboardPlayerShadowView awakeFromNib](&v3, sel_awakeFromNib);
  -[GKDashboardPlayerShadowView setupPhoto](self, "setupPhoto");
}

- (void)setupPhoto
{
  GKDashboardPlayerPhotoView *v3;
  GKDashboardPlayerPhotoView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = [GKDashboardPlayerPhotoView alloc];
  -[GKDashboardPlayerShadowView bounds](self, "bounds");
  v4 = -[GKDashboardPlayerPhotoView initWithFrame:](v3, "initWithFrame:");
  -[GKDashboardPlayerShadowView setPhotoView:](self, "setPhotoView:", v4);

  -[GKDashboardPlayerShadowView photoView](self, "photoView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[GKDashboardPlayerShadowView photoView](self, "photoView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardPlayerShadowView addSubview:](self, "addSubview:", v6);

  v7 = (void *)MEMORY[0x1E0CB3718];
  -[GKDashboardPlayerShadowView photoView](self, "photoView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_gkConstraintsForView:withinView:insets:", v9, self, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardPlayerShadowView addConstraints:](self, "addConstraints:", v8);

}

- (void)setPlayer:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[GKDashboardPlayerShadowView photoView](self, "photoView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlayer:", v4);

  -[GKDashboardPlayerShadowView parentView](self, "parentView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsDisplay");

}

- (GKPlayer)player
{
  void *v2;
  void *v3;

  -[GKDashboardPlayerShadowView photoView](self, "photoView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GKPlayer *)v3;
}

- (void)invalidatePhoto
{
  id v2;

  -[GKDashboardPlayerShadowView photoView](self, "photoView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidatePhoto");

}

- (UIView)parentView
{
  UICollectionViewCell *parentCell;

  parentCell = self->_parentCell;
  if (parentCell)
    return (UIView *)parentCell;
  -[GKDashboardPlayerShadowView superview](self, "superview");
  return (UIView *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isUsingPlaceholder
{
  void *v2;
  char v3;

  -[GKDashboardPlayerShadowView photoView](self, "photoView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUsingPlaceholder");

  return v3;
}

- (BOOL)dimmed
{
  void *v2;
  char v3;

  -[GKDashboardPlayerShadowView photoView](self, "photoView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dimmed");

  return v3;
}

- (void)setDimmed:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[GKDashboardPlayerShadowView photoView](self, "photoView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDimmed:", v3);

}

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)GKDashboardPlayerShadowView;
  -[GKDashboardPlayerShadowView layoutSubviews](&v2, sel_layoutSubviews);
}

- (UICollectionViewCell)parentCell
{
  return self->_parentCell;
}

- (void)setParentCell:(id)a3
{
  self->_parentCell = (UICollectionViewCell *)a3;
}

- (GKDashboardPlayerPhotoView)photoView
{
  return self->_photoView;
}

- (void)setPhotoView:(id)a3
{
  objc_storeStrong((id *)&self->_photoView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoView, 0);
}

@end
