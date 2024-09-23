@implementation AVTAvatarListCell

+ (id)reuseIdentifier
{
  return CFSTR("listCell");
}

- (AVTAvatarListCell)initWithFrame:(CGRect)a3
{
  AVTAvatarListCell *v3;
  AVTAvatarListCell *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  AVTImageTransitioningContainerView *v14;
  AVTImageTransitioningContainerView *containerView;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)AVTAvatarListCell;
  v3 = -[AVTAvatarListCell initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[AVTAvatarListCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    v14 = -[AVTImageTransitioningContainerView initWithFrame:]([AVTImageTransitioningContainerView alloc], "initWithFrame:", v7, v9, v11, v13);
    containerView = v4->_containerView;
    v4->_containerView = v14;

    -[AVTAvatarListCell contentView](v4, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v4->_containerView);

  }
  return v4;
}

- (id)snapshotViewAfterScreenUpdates:(BOOL)a3
{
  return 0;
}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[AVTAvatarListCell containerView](self, "containerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "staticImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVTAvatarListCell containerView](self, "containerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStaticImage:", v4);

}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[AVTAvatarListCell containerView](self, "containerView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStaticImage:animated:", v6, v4);

}

- (UIView)avtViewContainer
{
  void *v2;
  void *v3;

  -[AVTAvatarListCell containerView](self, "containerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "liveView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (void)setAspectRatio:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  void *v9;

  height = a3.height;
  width = a3.width;
  -[AVTAvatarListCell aspectRatio](self, "aspectRatio");
  if (v7 != width || v6 != height)
  {
    -[AVTAvatarListCell containerView](self, "containerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAspectRatio:", width, height);

    -[AVTAvatarListCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)aspectRatio
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[AVTAvatarListCell containerView](self, "containerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aspectRatio");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)beginUsingAVTViewFromSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "avtView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarListCell setAvtView:](self, "setAvtView:", v5);

  -[AVTAvatarListCell containerView](self, "containerView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avtViewContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setLiveView:", v6);
}

- (void)endUsingAVTView
{
  void *v3;

  -[AVTAvatarListCell containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLiveView:", 0);

  -[AVTAvatarListCell setAvtView:](self, "setAvtView:", 0);
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
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  BOOL v17;
  void *v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  v19.receiver = self;
  v19.super_class = (Class)AVTAvatarListCell;
  -[AVTAvatarListCell layoutSubviews](&v19, sel_layoutSubviews);
  -[AVTAvatarListCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[AVTAvatarListCell containerView](self, "containerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v21.origin.x = v13;
  v21.origin.y = v14;
  v21.size.width = v15;
  v21.size.height = v16;
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  v17 = CGRectEqualToRect(v20, v21);

  if (!v17)
  {
    -[AVTAvatarListCell containerView](self, "containerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFrame:", v5, v7, v9, v11);

  }
}

- (void)prepareForReuse
{
  objc_super v3;

  -[AVTAvatarListCell transitionStaticViewToFront](self, "transitionStaticViewToFront");
  -[AVTAvatarListCell setImage:](self, "setImage:", 0);
  -[AVTAvatarListCell setImageViewVisible:](self, "setImageViewVisible:", 1);
  v3.receiver = self;
  v3.super_class = (Class)AVTAvatarListCell;
  -[AVTAvatarListCell prepareForReuse](&v3, sel_prepareForReuse);
}

- (void)setImageViewVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AVTAvatarListCell containerView](self, "containerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStaticViewVisible:", v3);

}

- (void)transitionStaticViewToFront
{
  id v2;

  -[AVTAvatarListCell containerView](self, "containerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitionStaticViewToFront");

}

- (void)transitionLiveViewToFront
{
  id v2;

  -[AVTAvatarListCell containerView](self, "containerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitionLiveViewToFront");

}

- (void)applyFullAlpha
{
  id v2;

  -[AVTAvatarListCell containerView](self, "containerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

}

- (AVTView)avtView
{
  return self->_avtView;
}

- (void)setAvtView:(id)a3
{
  objc_storeStrong((id *)&self->_avtView, a3);
}

- (AVTAvatarRecord)avatar
{
  return self->_avatar;
}

- (void)setAvatar:(id)a3
{
  objc_storeStrong((id *)&self->_avatar, a3);
}

- (AVTStickerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (AVTImageTransitioningContainerView)containerView
{
  return self->_containerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_avatar, 0);
  objc_storeStrong((id *)&self->_avtView, 0);
}

- (void)downcastWithCellHandler:(id)a3 listCellHandler:(id)a4
{
  objc_super v4;

  if (a4)
  {
    (*((void (**)(id, AVTAvatarListCell *))a4 + 2))(a4, self);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)AVTAvatarListCell;
    -[UICollectionViewCell downcastWithCellHandler:listCellHandler:](&v4, sel_downcastWithCellHandler_listCellHandler_, a3);
  }
}

@end
