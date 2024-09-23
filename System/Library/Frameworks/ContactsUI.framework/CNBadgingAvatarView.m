@implementation CNBadgingAvatarView

- (CNBadgingAvatarView)initWithAvatarViewController:(id)a3
{
  id v5;
  CNBadgingAvatarView *v6;
  CNBadgingAvatarView *v7;
  id *p_avatarViewController;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  CNBadgingAvatarView *v20;
  objc_super v22;

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CNBadgingAvatarView;
  v6 = -[CNBadgingAvatarView initWithFrame:](&v22, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    p_avatarViewController = (id *)&v6->_avatarViewController;
    objc_storeStrong((id *)&v6->_avatarViewController, a3);
    -[CNBadgingAvatarView frame](v7, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(*p_avatarViewController, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

    objc_msgSend(*p_avatarViewController, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAutoresizingMask:", 18);

    objc_msgSend(*p_avatarViewController, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNBadgingAvatarView addSubview:](v7, "addSubview:", v19);

    v20 = v7;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CNBadgingAvatarView likenessBadgeRendererToken](self, "likenessBadgeRendererToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)CNBadgingAvatarView;
  -[CNBadgingAvatarView dealloc](&v4, sel_dealloc);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNBadgingAvatarView;
  -[CNBadgingAvatarView layoutSubviews](&v3, sel_layoutSubviews);
  -[CNBadgingAvatarView updateBadgeImageViewFrame](self, "updateBadgeImageViewFrame");
  -[CNBadgingAvatarView updateBadgeCropStyle](self, "updateBadgeCropStyle");
}

- (void)setBadgeImage:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (a3)
  {
    -[CNBadgingAvatarView setImage:forAccessoryViewType:](self, "setImage:forAccessoryViewType:", a3, 0);
    -[CNBadgingAvatarView updateBadgeImageViewBackgroundColor](self, "updateBadgeImageViewBackgroundColor");
  }
  else
  {
    -[CNBadgingAvatarView badgeImageView](self, "badgeImageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImage:", 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CNBadgingAvatarView badgeImageView](self, "badgeImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v6);

  }
}

- (UIImage)badgeImage
{
  void *v2;
  void *v3;

  -[CNBadgingAvatarView badgeImageView](self, "badgeImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (id)currentLikenessScope
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_opt_class();
  -[CNBadgingAvatarView avatarViewController](self, "avatarViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "currentLikenessScope");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)imageRenderer
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_opt_class();
  -[CNBadgingAvatarView avatarViewController](self, "avatarViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "imageRenderer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)schedulerProvider
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_opt_class();
  -[CNBadgingAvatarView avatarViewController](self, "avatarViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "schedulerProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)updateBadgeImageViewFrame
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;

  v3 = -[CNBadgingAvatarView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1;
  v4 = (void *)MEMORY[0x1E0D13C80];
  -[CNBadgingAvatarView avatarViewController](self, "avatarViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v4, "avatarBadgeRectForAvatarInRect:badgeType:isRTL:", 0, v3);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[CNBadgingAvatarView badgeImageView](self, "badgeImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  -[CNBadgingAvatarView updateBadgeImageViewPosition](self, "updateBadgeImageViewPosition");
}

- (void)setImage:(id)a3 forAccessoryViewType:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;

  v32 = a3;
  if (a4 < 2)
  {
    -[CNBadgingAvatarView badgeImageView](self, "badgeImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0DC3890]);
      -[CNBadgingAvatarView setBadgeImageView:](self, "setBadgeImageView:", v7);

      -[CNBadgingAvatarView badgeImageView](self, "badgeImageView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setClipsToBounds:", 1);

    }
    -[CNBadgingAvatarView badgeImageView](self, "badgeImageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNBadgingAvatarView mediaContextBadgeView](self, "mediaContextBadgeView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNBadgingAvatarView badgeImageView](self, "badgeImageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[CNBadgingAvatarView mediaContextBadgeView](self, "mediaContextBadgeView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNBadgingAvatarView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v11, v12);
LABEL_13:

      goto LABEL_14;
    }
    goto LABEL_12;
  }
  if (a4 == 2)
  {
    -[CNBadgingAvatarView mediaContextBadgeView](self, "mediaContextBadgeView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0DC3890]);
      -[CNBadgingAvatarView setMediaContextBadgeView:](self, "setMediaContextBadgeView:", v14);

    }
    -[CNBadgingAvatarView mediaContextBadgeView](self, "mediaContextBadgeView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNBadgingAvatarView badgeImageView](self, "badgeImageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNBadgingAvatarView mediaContextBadgeView](self, "mediaContextBadgeView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[CNBadgingAvatarView badgeImageView](self, "badgeImageView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNBadgingAvatarView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v11, v12);
      goto LABEL_13;
    }
LABEL_12:
    -[CNBadgingAvatarView avatarViewController](self, "avatarViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNBadgingAvatarView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v11, v16);

    goto LABEL_13;
  }
  v9 = 0;
LABEL_14:
  v17 = -[CNBadgingAvatarView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1;
  v18 = (void *)MEMORY[0x1E0D13C80];
  -[CNBadgingAvatarView avatarViewController](self, "avatarViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  objc_msgSend(v18, "avatarBadgeRectForAvatarInRect:badgeType:isRTL:", a4, v17);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  objc_msgSend(v9, "setImage:", v32);
  objc_msgSend(v9, "setFrame:", v22, v24, v26, v28);
  -[CNBadgingAvatarView mediaContextBadge](self, "mediaContextBadge");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    -[CNBadgingAvatarView badgeImage](self, "badgeImage");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
      -[CNBadgingAvatarView updateBadgeImageViewPosition](self, "updateBadgeImageViewPosition");
  }

}

- (void)setBadgeStyleSettings:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (!-[CNBadgingAvatarBadgeStyleSettings isEqual:](self->_badgeStyleSettings, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_badgeStyleSettings, a3);
    -[CNBadgingAvatarView badgeImage](self, "badgeImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[CNBadgingAvatarView updateBadgeImageViewPosition](self, "updateBadgeImageViewPosition");
      -[CNBadgingAvatarView updateBadgeTintColor](self, "updateBadgeTintColor");
      -[CNBadgingAvatarView updateBadgeCropStyle](self, "updateBadgeCropStyle");
      -[CNBadgingAvatarView updateBadgeImageViewBackgroundColor](self, "updateBadgeImageViewBackgroundColor");
      -[CNBadgingAvatarView updateBadgeImageViewContentMode](self, "updateBadgeImageViewContentMode");
    }
  }

}

- (void)updateBadgeTintColor
{
  void *v3;
  void *v4;
  id v5;

  -[CNBadgingAvatarView badgeStyleSettings](self, "badgeStyleSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNBadgingAvatarView badgeImageView](self, "badgeImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v3);

}

- (void)updateBadgeCropStyle
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0D13C80];
  -[CNBadgingAvatarView badgeImageView](self, "badgeImageView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNBadgingAvatarView badgeStyleSettings](self, "badgeStyleSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cropAvatarBadgeLayer:withCropStyle:", v4, objc_msgSend(v5, "cropStyle"));

}

- (void)updateBadgeImageViewBackgroundColor
{
  void *v3;
  void *v4;
  id v5;

  -[CNBadgingAvatarView badgeStyleSettings](self, "badgeStyleSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNBadgingAvatarView badgeImageView](self, "badgeImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (void)updateBadgeImageViewContentMode
{
  uint64_t v3;
  void *v4;
  id v5;

  -[CNBadgingAvatarView badgeStyleSettings](self, "badgeStyleSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "contentMode");
  -[CNBadgingAvatarView badgeImageView](self, "badgeImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentMode:", v3);

}

- (void)updateBadgeImageViewPosition
{
  void *v2;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  uint64_t v44;
  id v45;

  v4 = -[CNBadgingAvatarView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v5 = (void *)MEMORY[0x1E0D13C80];
  -[CNBadgingAvatarView badgeImageView](self, "badgeImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[CNBadgingAvatarView avatarViewController](self, "avatarViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  -[CNBadgingAvatarView badgeStyleSettings](self, "badgeStyleSettings");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "cnuiBadgePosition");
  -[CNBadgingAvatarView mediaContextBadge](self, "mediaContextBadge");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    -[CNBadgingAvatarView mediaContextBadgeView](self, "mediaContextBadgeView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "frame");
  }
  else
  {
    v28 = *MEMORY[0x1E0C9D648];
    v29 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 8);
    v30 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 16);
    v31 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 24);
  }
  objc_msgSend(v5, "frameForBadgeWithFrame:onAvatarFrame:withPosition:mediaContextFrame:isRTL:", v26, v4 == 1, v8, v10, v12, v14, v18, v20, v22, v24, v28, v29, v30, v31);
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  -[CNBadgingAvatarView badgeImageView](self, "badgeImageView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);

  if (v27)
  -[CNBadgingAvatarView badgeImageView](self, "badgeImageView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setAutoresizingMask:", 18);

  -[CNBadgingAvatarView badgeStyleSettings](self, "badgeStyleSettings");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "position");

  if (v43 <= 3)
  {
    v44 = qword_18AF8BA90[v43];
    -[CNBadgingAvatarView badgeImageView](self, "badgeImageView");
    v45 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setAutoresizingMask:", objc_msgSend(v45, "autoresizingMask") | v44);

  }
}

- (void)setIsMarkedForSyndication:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_isMarkedForSyndication != a3)
  {
    self->_isMarkedForSyndication = a3;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("star.circle.fill"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNBadgingAvatarView setBadgeImage:](self, "setBadgeImage:", v4);

      +[CNBadgingAvatarBadgeStyleSettings markedForSyndicationBadgeSettings](CNBadgingAvatarBadgeStyleSettings, "markedForSyndicationBadgeSettings");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[CNBadgingAvatarView setBadgeStyleSettings:](self, "setBadgeStyleSettings:", v5);

    }
    else
    {
      -[CNBadgingAvatarView setBadgeImage:](self, "setBadgeImage:", 0);
    }
  }
}

- (void)setIsDoNotDisturb:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_isDoNotDisturb != a3)
  {
    self->_isDoNotDisturb = a3;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "cnui_symbolImageNamed:scale:withColor:useFixedSize:compatibleWithTextStyle:", CFSTR("moon.fill"), -1, 0, 1, *MEMORY[0x1E0DC4AB8]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNBadgingAvatarView setBadgeImage:](self, "setBadgeImage:", v4);

      +[CNBadgingAvatarBadgeStyleSettings doNotDisturbBadgeSettings](CNBadgingAvatarBadgeStyleSettings, "doNotDisturbBadgeSettings");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[CNBadgingAvatarView setBadgeStyleSettings:](self, "setBadgeStyleSettings:", v5);

    }
    else
    {
      -[CNBadgingAvatarView setBadgeImage:](self, "setBadgeImage:", 0);
    }
  }
}

- (void)setMediaContextBadge:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_mediaContextBadge) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_mediaContextBadge, a3);
    -[CNBadgingAvatarView renderMediaContextBadgeImage](self, "renderMediaContextBadgeImage");
  }

}

- (void)renderMediaContextBadgeImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CNBadgingAvatarView likenessBadgeRendererToken](self, "likenessBadgeRendererToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[CNBadgingAvatarView setLikenessBadgeRendererToken:](self, "setLikenessBadgeRendererToken:", 0);
  -[CNBadgingAvatarView mediaContextBadge](self, "mediaContextBadge");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNBadgingAvatarView mediaContextBadge](self, "mediaContextBadge");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[CNBadgingAvatarView renderLikenessBadge:](self, "renderLikenessBadge:", v7);

  }
  else
  {
    -[CNBadgingAvatarView mediaContextBadgeView](self, "mediaContextBadgeView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    -[CNBadgingAvatarView badgeImage](self, "badgeImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      -[CNBadgingAvatarView updateBadgeImageViewPosition](self, "updateBadgeImageViewPosition");
  }
}

- (void)renderLikenessBadge:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  id v21;
  id location;
  uint64_t v23;
  id *v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v4 = a3;
  -[CNBadgingAvatarView currentLikenessScope](self, "currentLikenessScope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CNBadgingAvatarView imageRenderer](self, "imageRenderer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNBadgingAvatarView schedulerProvider](self, "schedulerProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backgroundScheduler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "renderedLikenessForBadge:scope:workScheduler:", v4, v5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0;
    v24 = (id *)&v23;
    v25 = 0x3042000000;
    v26 = __Block_byref_object_copy__45809;
    v27 = __Block_byref_object_dispose__45810;
    v28 = 0;
    objc_initWeak(&location, self);
    -[CNBadgingAvatarView schedulerProvider](self, "schedulerProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mainThreadScheduler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0D13AF0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __43__CNBadgingAvatarView_renderLikenessBadge___block_invoke;
    v17[3] = &unk_1E204DA60;
    objc_copyWeak(&v21, &location);
    v13 = v11;
    v18 = v13;
    v20 = &v23;
    v19 = v4;
    objc_msgSend(v12, "observerWithResultBlock:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subscribe:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNBadgingAvatarView setLikenessBadgeRendererToken:](self, "setLikenessBadgeRendererToken:", v15);

    -[CNBadgingAvatarView likenessBadgeRendererToken](self, "likenessBadgeRendererToken");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(v24 + 5, v16);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v23, 8);
    objc_destroyWeak(&v28);

  }
}

- (CNAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (void)setAvatarViewController:(id)a3
{
  objc_storeStrong((id *)&self->_avatarViewController, a3);
}

- (CNBadgingAvatarBadgeStyleSettings)badgeStyleSettings
{
  return self->_badgeStyleSettings;
}

- (UIImageView)badgeImageView
{
  return self->_badgeImageView;
}

- (void)setBadgeImageView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeImageView, a3);
}

- (CNCancelable)likenessBadgeRendererToken
{
  return self->_likenessBadgeRendererToken;
}

- (void)setLikenessBadgeRendererToken:(id)a3
{
  objc_storeStrong((id *)&self->_likenessBadgeRendererToken, a3);
}

- (CNAvatarAccessoryView)mediaContextBadge
{
  return self->_mediaContextBadge;
}

- (UIImageView)mediaContextBadgeView
{
  return self->_mediaContextBadgeView;
}

- (void)setMediaContextBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_mediaContextBadgeView, a3);
}

- (BOOL)isMarkedForSyndication
{
  return self->_isMarkedForSyndication;
}

- (BOOL)isDoNotDisturb
{
  return self->_isDoNotDisturb;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaContextBadgeView, 0);
  objc_storeStrong((id *)&self->_mediaContextBadge, 0);
  objc_storeStrong((id *)&self->_likenessBadgeRendererToken, 0);
  objc_storeStrong((id *)&self->_badgeImageView, 0);
  objc_storeStrong((id *)&self->_badgeStyleSettings, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);
}

void __43__CNBadgingAvatarView_renderLikenessBadge___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  __int128 v8;
  _QWORD v9[5];
  id v10;
  __int128 v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__CNBadgingAvatarView_renderLikenessBadge___block_invoke_2;
  v9[3] = &unk_1E204DA38;
  v9[4] = WeakRetained;
  v10 = v3;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v7 = v3;
  objc_msgSend(v5, "performBlock:", v9);

}

void __43__CNBadgingAvatarView_renderLikenessBadge___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id WeakRetained;
  BOOL v5;

  objc_msgSend(*(id *)(a1 + 32), "likenessBadgeRendererToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "likenessBadgeRendererToken");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

  if (v2)
    v5 = v3 == WeakRetained;
  else
    v5 = 1;
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setImage:forAccessoryViewType:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "badgeType"));
}

@end
