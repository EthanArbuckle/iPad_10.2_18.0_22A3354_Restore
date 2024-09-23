@implementation SFAccountIconSharingBadgeImageCoordinator

- (SFAccountIconSharingBadgeImageCoordinator)initWithIconImageView:(id)a3 iconDiameter:(double)a4 parentView:(id)a5
{
  id v9;
  id v10;
  SFAccountIconSharingBadgeImageCoordinator *v11;
  SFAccountIconSharingBadgeImageCoordinator *v12;
  float v13;
  void *v14;
  SFAccountIconSharingBadgeImageCoordinator *v15;
  objc_super v17;

  v9 = a3;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SFAccountIconSharingBadgeImageCoordinator;
  v11 = -[SFAccountIconSharingBadgeImageCoordinator init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_iconImageView, a3);
    objc_storeStrong((id *)&v12->_parentView, a5);
    v13 = dbl_1A3CB2370[a4 > 40.0] * a4;
    v12->_badgeDiameter = ceilf(v13) + -2.0;
    +[SFAccountIconSharingBadgeImageProvider sharedProvider](SFAccountIconSharingBadgeImageProvider, "sharedProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addCoordinatorAsSubscriber:", v12);

    v15 = v12;
  }

  return v12;
}

- (void)setShowsBadge:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  _QWORD v6[5];

  v3 = a3;
  self->_showsBadge = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__SFAccountIconSharingBadgeImageCoordinator_setShowsBadge___block_invoke;
  v6[3] = &unk_1E4ABFE00;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v6);
  v5 = !v3;
  -[UIImageView setHidden:](self->_badgeImageView, "setHidden:", v5);
  -[UIView setHidden:](self->_badgeMaskView, "setHidden:", v5);
}

uint64_t __59__SFAccountIconSharingBadgeImageCoordinator_setShowsBadge___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_createBadgeImageViewIfNecessary");
  return objc_msgSend(*(id *)(a1 + 32), "_layOutBadgeImageViewIfNecessary");
}

- (void)_createBadgeImageViewIfNecessary
{
  UIView *v3;
  UIView *badgeMaskView;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  UIImageView *v11;
  UIImageView *badgeImageView;

  if (!self->_badgeImageView)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    badgeMaskView = self->_badgeMaskView;
    self->_badgeMaskView = v3;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_badgeMaskView, "setBackgroundColor:", v5);

    -[SFAccountIconSharingBadgeImageCoordinator _badgeMaskDiameter](self, "_badgeMaskDiameter");
    -[UIView _setCornerRadius:](self->_badgeMaskView, "_setCornerRadius:", v6 * 0.5);
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C50]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](self->_badgeMaskView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCompositingFilter:", v7);

    -[UIView addSubview:](self->_parentView, "addSubview:", self->_badgeMaskView);
    v9 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[SFAccountIconSharingBadgeImageCoordinator _badgeImage](self, "_badgeImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (UIImageView *)objc_msgSend(v9, "initWithImage:", v10);
    badgeImageView = self->_badgeImageView;
    self->_badgeImageView = v11;

    -[UIView addSubview:](self->_parentView, "addSubview:", self->_badgeImageView);
  }
}

- (void)_layOutBadgeImageViewIfNecessary
{
  double badgeDiameter;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGRect v14;
  CGRect v15;

  if (self->_badgeImageView)
  {
    -[SFAccountIconSharingBadgeImageCoordinator _iconImageViewHeight](self, "_iconImageViewHeight");
    badgeDiameter = self->_badgeDiameter;
    *(float *)&v4 = badgeDiameter * -0.5 + v4 * 0.9;
    v5 = floorf(*(float *)&v4);
    -[UIView convertRect:fromView:](self->_parentView, "convertRect:fromView:", self->_iconImageView, v5, v5, badgeDiameter, badgeDiameter);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[UIImageView setFrame:](self->_badgeImageView, "setFrame:");
    v14.origin.x = v7;
    v14.origin.y = v9;
    v14.size.width = v11;
    v14.size.height = v13;
    v15 = CGRectInset(v14, -1.0, -1.0);
    -[UIView setFrame:](self->_badgeMaskView, "setFrame:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
    -[UIView bringSubviewToFront:](self->_parentView, "bringSubviewToFront:", self->_badgeImageView);
    -[UIView insertSubview:belowSubview:](self->_parentView, "insertSubview:belowSubview:", self->_badgeMaskView, self->_badgeImageView);
  }
}

- (double)_iconImageViewHeight
{
  double v2;

  -[UIImageView frame](self->_iconImageView, "frame");
  return v2;
}

- (void)reset
{
  UIImageView *badgeImageView;
  UIView *badgeMaskView;

  -[UIImageView removeFromSuperview](self->_badgeImageView, "removeFromSuperview");
  badgeImageView = self->_badgeImageView;
  self->_badgeImageView = 0;

  -[UIView removeFromSuperview](self->_badgeMaskView, "removeFromSuperview");
  badgeMaskView = self->_badgeMaskView;
  self->_badgeMaskView = 0;

  -[SFAccountIconSharingBadgeImageCoordinator setShowsBadge:](self, "setShowsBadge:", self->_showsBadge);
}

- (id)_badgeImage
{
  void *v3;
  void *v4;

  +[SFAccountIconSharingBadgeImageProvider sharedProvider](SFAccountIconSharingBadgeImageProvider, "sharedProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "badgeImageForDiameter:", (unint64_t)self->_badgeDiameter);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)_badgeMaskDiameter
{
  return self->_badgeDiameter + 2.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeMaskView, 0);
  objc_storeStrong((id *)&self->_badgeImageView, 0);
  objc_storeStrong((id *)&self->_parentView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end
