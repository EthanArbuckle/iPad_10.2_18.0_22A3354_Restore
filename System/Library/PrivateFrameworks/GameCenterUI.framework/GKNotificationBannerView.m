@implementation GKNotificationBannerView

- (void)awakeFromNib
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKNotificationBannerView;
  -[GKNotificationBannerView awakeFromNib](&v4, sel_awakeFromNib);
  -[GKNotificationBannerView bounds](self, "bounds");
  self->_preferredBannerWidth = v3;
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

- (void)createBackdropViewWithBlurStyle:(int64_t)a3
{
  void *v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v10);
  -[GKNotificationBannerView addSubview:](self, "addSubview:", v4);
  if (-[GKNotificationBannerView useShortBanner](self, "useShortBanner"))
    v5 = 13.0;
  else
    v5 = 24.0;
  objc_msgSend(v4, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", v5);

  v7 = *MEMORY[0x1E0CD2A68];
  objc_msgSend(v4, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerCurve:", v7);

  objc_msgSend(v4, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMasksToBounds:", 1);

  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CB3718], "_gkInstallEdgeConstraintsForView:containedWithinParentView:", v4, self);

}

- (void)createTitleLabel:(id)a3 withTextStyle:(id)a4
{
  id v6;
  id v7;
  GKLabel *v8;
  UILabel *v9;
  UILabel *titleLabel;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  v8 = [GKLabel alloc];
  v9 = -[GKLabel initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  titleLabel = self->_titleLabel;
  self->_titleLabel = v9;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v11);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 1);
  if (-[GKNotificationBannerView useShortBanner](self, "useShortBanner"))
    objc_msgSend(v6, "bannerShortTitle");
  else
    objc_msgSend(v6, "bannerTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_gkAttributedStringByApplyingStyle:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", v13);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setMinimumScaleFactor:](self->_titleLabel, "setMinimumScaleFactor:", 0.6);
  -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", CFSTR("GameCenter.notificationBanner.title"));
  -[GKNotificationBannerView addSubview:](self, "addSubview:", self->_titleLabel);
}

- (void)createMessageLabel:(id)a3 withTextStyle:(id)a4
{
  id v6;
  id v7;
  GKLabel *v8;
  UILabel *v9;
  UILabel *messageLabel;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  v8 = [GKLabel alloc];
  v9 = -[GKLabel initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  messageLabel = self->_messageLabel;
  self->_messageLabel = v9;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](self->_messageLabel, "setBackgroundColor:", v11);

  -[UILabel setNumberOfLines:](self->_messageLabel, "setNumberOfLines:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_messageLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setMinimumScaleFactor:](self->_messageLabel, "setMinimumScaleFactor:", 0.6);
  objc_msgSend(v6, "bannerMessage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_gkAttributedStringByApplyingStyle:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel setAttributedText:](self->_messageLabel, "setAttributedText:", v13);
  -[UILabel setAccessibilityIdentifier:](self->_messageLabel, "setAccessibilityIdentifier:", CFSTR("GameCenter.notificationBanner.message"));
  -[GKNotificationBannerView addSubview:](self, "addSubview:", self->_messageLabel);
}

- (GKNotificationBannerView)initWithTitle:(id)a3 player:(id)a4 leadingAccessoryView:(id)a5 message:(id)a6 useShortBanner:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  GKNotificationBannerView *v16;
  GKNotificationBannerView *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  GKDashboardPlayerPhotoView *v31;
  GKDashboardPlayerPhotoView *playerAvatarView;
  UILabel *titleLabel;
  double v34;
  double v35;
  UILabel *messageLabel;
  double v37;
  double v38;
  _BOOL4 v39;
  double v40;
  double v41;
  _BOOL4 v42;
  double v43;
  double v44;
  double v45;
  double v46;
  _BOOL4 v47;
  double v48;
  id v50;
  id v51;
  objc_super v52;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v52.receiver = self;
  v52.super_class = (Class)GKNotificationBannerView;
  v16 = -[GKNotificationBannerView initWithFrame:](&v52, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v17 = v16;
  if (!v16)
    goto LABEL_37;
  v16->_useShortBanner = a7;
  -[GKNotificationBannerView setDuration:](v16, "setDuration:", 3.0);
  objc_msgSend(MEMORY[0x1E0D25B28], "textStyle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (GKIsXRUIIdiom())
  {
    v51 = v14;
    v19 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v50 = a5;
    v20 = v15;
    v21 = v13;
    v22 = v12;
    v23 = v18;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "colorWithAlphaComponent:", 0.5);
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v26 = objc_msgSend(v25, "CGColor");
    objc_msgSend(v19, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setBackgroundColor:", v26);

    v18 = v23;
    v12 = v22;
    v13 = v21;
    v15 = v20;
    a5 = v50;
    if (-[GKNotificationBannerView useShortBanner](v17, "useShortBanner"))
      v28 = 13.0;
    else
      v28 = 24.0;
    objc_msgSend(v19, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setCornerRadius:", v28);

    objc_msgSend(v19, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setContinuousCorners:", 1);

    -[GKNotificationBannerView insertSubview:atIndex:](v17, "insertSubview:atIndex:", v19, 0);
    objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CB3718], "_gkInstallEdgeConstraintsForView:containedWithinParentView:", v19, v17);

    v14 = v51;
    if (!v13)
      goto LABEL_10;
    goto LABEL_9;
  }
  -[GKNotificationBannerView createBackdropViewWithBlurStyle:](v17, "createBackdropViewWithBlurStyle:", 17);
  if (v13)
  {
LABEL_9:
    v31 = objc_alloc_init(GKDashboardPlayerPhotoView);
    playerAvatarView = v17->_playerAvatarView;
    v17->_playerAvatarView = v31;

    -[GKDashboardPlayerPhotoView setPlayer:](v17->_playerAvatarView, "setPlayer:", v13);
    -[GKNotificationBannerView addSubview:](v17, "addSubview:", v17->_playerAvatarView);
  }
LABEL_10:
  if (v14)
  {
    objc_storeStrong((id *)&v17->_leadingAccessoryView, a5);
    -[UIView setAccessibilityIdentifier:](v17->_leadingAccessoryView, "setAccessibilityIdentifier:", CFSTR("GameCenter.notificationBanner.image"));
    -[GKNotificationBannerView addSubview:](v17, "addSubview:", v17->_leadingAccessoryView);
  }
  if (v12)
    -[GKNotificationBannerView createTitleLabel:withTextStyle:](v17, "createTitleLabel:withTextStyle:", v12, v18);
  if (v15)
    -[GKNotificationBannerView createMessageLabel:withTextStyle:](v17, "createMessageLabel:withTextStyle:", v15, v18);
  -[GKNotificationBannerView setAccessibilityIdentifier:](v17, "setAccessibilityIdentifier:", CFSTR("UIA.GameCenter.GKNotificationBannerView"));
  -[UILabel sizeToFit](v17->_titleLabel, "sizeToFit");
  -[UILabel sizeToFit](v17->_messageLabel, "sizeToFit");
  titleLabel = v17->_titleLabel;
  if (titleLabel)
  {
    -[UILabel frame](titleLabel, "frame");
    v35 = v34;
  }
  else
  {
    v35 = 0.0;
  }
  messageLabel = v17->_messageLabel;
  if (messageLabel)
  {
    -[UILabel frame](messageLabel, "frame");
    if (v35 < v37)
      v35 = v37;
  }
  if (-[GKNotificationBannerView useShortBanner](v17, "useShortBanner"))
    v38 = 15.0;
  else
    v38 = 30.0;
  v39 = -[GKNotificationBannerView useShortBanner](v17, "useShortBanner");
  v40 = 42.0;
  if (v39)
    v40 = 24.0;
  v41 = v38 + v40;
  v42 = -[GKNotificationBannerView useShortBanner](v17, "useShortBanner");
  v43 = 20.0;
  if (v42)
    v43 = 8.0;
  v44 = v35 + v41 + v43;
  if (-[GKNotificationBannerView useShortBanner](v17, "useShortBanner"))
    v45 = 15.0;
  else
    v45 = 30.0;
  v46 = v45 + v44;
  v17->_preferredBannerWidth = v46;
  v47 = -[GKNotificationBannerView useShortBanner](v17, "useShortBanner");
  v48 = 282.0;
  if (v47)
    v48 = 260.0;
  if (v46 >= v48)
    v48 = v46;
  v17->_preferredBannerWidth = v48;

LABEL_37:
  return v17;
}

- (GKNotificationBannerView)initWithTitle:(id)a3 image:(id)a4 message:(id)a5 useShortBanner:(BOOL)a6
{
  _BOOL8 v6;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  GKNotificationBannerView *v16;

  v6 = a6;
  v10 = (objc_class *)MEMORY[0x1E0DC3890];
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend([v10 alloc], "initWithImage:", v12);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v15);

  objc_msgSend(v14, "setContentMode:", 1);
  objc_msgSend(v14, "setClipsToBounds:", 1);
  v16 = -[GKNotificationBannerView initWithTitle:player:leadingAccessoryView:message:useShortBanner:](self, "initWithTitle:player:leadingAccessoryView:message:useShortBanner:", v13, 0, v14, v11, v6);

  return v16;
}

- (void)startLoadingPlayerAvatar
{
  GKDashboardPlayerPhotoView *v3;
  GKDashboardPlayerPhotoView *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = [GKDashboardPlayerPhotoView alloc];
  v4 = -[GKDashboardPlayerPhotoView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[GKNotificationBannerView setPlayerAvatarView:](self, "setPlayerAvatarView:", v4);

  objc_initWeak(&location, self);
  -[GKNotificationBannerView playerAvatarView](self, "playerAvatarView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__GKNotificationBannerView_startLoadingPlayerAvatar__block_invoke;
  v7[3] = &unk_1E59C48A0;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v5, "setPlayer:completionHandler:", v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __52__GKNotificationBannerView_startLoadingPlayerAvatar__block_invoke(uint64_t a1)
{
  id v1;
  int v2;
  id v3;
  void *v4;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 32));
  v1 = objc_loadWeakRetained(&to);
  v2 = objc_msgSend(v1, "canTransitionToPlayerAvatar");

  v3 = objc_loadWeakRetained(&to);
  v4 = v3;
  if (v2)
    objc_msgSend(v3, "transitionToPlayerAvatar");
  else
    objc_msgSend(v3, "setCanTransitionToPlayerAvatar:", 1);

  objc_destroyWeak(&to);
}

- (void)transitionToPlayerAvatar
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t);
  void *v40;
  id v41;
  GKNotificationBannerView *v42;
  CATransform3D v43;
  _OWORD v44[8];

  -[GKNotificationBannerView playerAvatarView](self, "playerAvatarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[GKNotificationBannerView playerAvatarView](self, "playerAvatarView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 0;
  objc_msgSend(v5, "setOpacity:", v6);

  -[GKNotificationBannerView playerAvatarView](self, "playerAvatarView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKNotificationBannerView addSubview:](self, "addSubview:", v7);

  -[GKNotificationBannerView leadingAccessoryView](self, "leadingAccessoryView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKNotificationBannerView playerAvatarView](self, "playerAvatarView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "centerXAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerXAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  -[GKNotificationBannerView playerAvatarView](self, "playerAvatarView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "centerYAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerYAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 0.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[GKNotificationBannerView playerAvatarView](self, "playerAvatarView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "widthAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "widthAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, 0.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setActive:", 1);

  -[GKNotificationBannerView playerAvatarView](self, "playerAvatarView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "heightAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "widthAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, 0.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setActive:", 1);

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setRemovedOnCompletion:", 0);
  v26 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v44[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v44[5] = v26;
  v27 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v44[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v44[7] = v27;
  v28 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v44[0] = *MEMORY[0x1E0CD2610];
  v44[1] = v28;
  v29 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v44[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v44[3] = v29;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", v44);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFromValue:", v30);

  v31 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v43, 0.01, 0.01, 1.0);
  objc_msgSend(v31, "valueWithCATransform3D:", &v43);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setToValue:", v32);

  objc_msgSend(v25, "setDuration:", 0.12);
  LODWORD(v33) = 0;
  objc_msgSend(v25, "setRepeatCount:", v33);
  objc_msgSend(v25, "setAutoreverses:", 0);
  objc_msgSend(v25, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  v34 = (void *)MEMORY[0x1E0CD28B0];
  v37 = MEMORY[0x1E0C809B0];
  v38 = 3221225472;
  v39 = __52__GKNotificationBannerView_transitionToPlayerAvatar__block_invoke;
  v40 = &unk_1E59C4708;
  v41 = v8;
  v42 = self;
  v35 = v8;
  objc_msgSend(v34, "setCompletionBlock:", &v37);
  objc_msgSend(v35, "layer", v37, v38, v39, v40);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addAnimation:forKey:", v25, CFSTR("transform"));

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

void __52__GKNotificationBannerView_transitionToPlayerAvatar__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  _OWORD v20[8];
  _OWORD v21[8];
  CATransform3D v22;
  CATransform3D v23;

  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  CATransform3DMakeScale(&v23, 0.01, 0.01, 1.0);
  objc_msgSend(*(id *)(a1 + 40), "playerAvatarView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v23;
  objc_msgSend(v3, "setTransform:", &v22);

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(*(id *)(a1 + 40), "playerAvatarView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "transform");
  else
    memset(v21, 0, sizeof(v21));
  objc_msgSend(v5, "valueWithCATransform3D:", v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFromValue:", v9);

  v10 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v20[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v20[5] = v10;
  v11 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v20[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v20[7] = v11;
  v12 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v20[0] = *MEMORY[0x1E0CD2610];
  v20[1] = v12;
  v13 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v20[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v20[3] = v13;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToValue:", v14);

  objc_msgSend(v4, "setMass:", 1.0);
  objc_msgSend(v4, "setStiffness:", 800.0);
  objc_msgSend(v4, "setDamping:", 20.0);
  objc_msgSend(v4, "setBeginTime:", CACurrentMediaTime());
  objc_msgSend(v4, "settlingDuration");
  objc_msgSend(v4, "setDuration:");
  objc_msgSend(v4, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v4, "setRemovedOnCompletion:", 0);
  objc_msgSend(*(id *)(a1 + 40), "playerAvatarView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAnimation:forKey:", v4, CFSTR("transform"));

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_msgSend(*(id *)(a1 + 40), "playerAvatarView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = 1.0;
  objc_msgSend(v18, "setOpacity:", v19);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)GKNotificationBannerView;
  -[GKNotificationBannerView dealloc](&v4, sel_dealloc);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  double MidY;
  _BOOL4 v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double MaxX;
  _BOOL4 v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  double v51;
  double x;
  double y;
  double width;
  double height;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  BOOL v64;
  double v65;
  void *v66;
  uint64_t v67;
  double v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  void *v78;
  double v79;
  BOOL v80;
  double v81;
  void *v82;
  uint64_t v83;
  double v84;
  double v85;
  void *v86;
  void *v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  void *v96;
  void *v97;
  void *v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  void *v107;
  CGFloat v108;
  double v109;
  double v110;
  CGRect v111;
  CGRect slice;
  CGRect remainder;
  objc_super v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;

  v114.receiver = self;
  v114.super_class = (Class)GKNotificationBannerView;
  -[GKNotificationBannerView layoutSubviews](&v114, sel_layoutSubviews);
  -[GKNotificationBannerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[GKNotificationBannerView leadingAccessoryView](self, "leadingAccessoryView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    -[GKNotificationBannerView leadingAccessoryView](self, "leadingAccessoryView");
  else
    -[GKNotificationBannerView playerAvatarView](self, "playerAvatarView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 8.0;
  v14 = 8.0;
  if (!-[GKNotificationBannerView useShortBanner](self, "useShortBanner"))
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "userInterfaceIdiom");

    if (v16 != 1 || (v14 = 12.0, *MEMORY[0x1E0D253F8]) && !*MEMORY[0x1E0D25B68])
      v14 = 11.0;
  }
  v115.origin.x = v4;
  v108 = v6;
  v110 = v8;
  v115.origin.y = v6;
  v115.size.width = v8;
  v115.size.height = v10;
  MidY = CGRectGetMidY(v115);
  v18 = -[GKNotificationBannerView useShortBanner](self, "useShortBanner");
  v19 = 21.0;
  if (v18)
    v19 = 12.0;
  v20 = MidY - v19;
  if (-[GKNotificationBannerView useShortBanner](self, "useShortBanner", *(_QWORD *)&v108))
    v21 = 24.0;
  else
    v21 = 42.0;
  if (-[GKNotificationBannerView useShortBanner](self, "useShortBanner"))
    v22 = 24.0;
  else
    v22 = 42.0;
  objc_msgSend(v12, "setFrame:", v14, v20, v21, v22);
  objc_msgSend(v12, "frame");
  MaxX = CGRectGetMaxX(v116);
  v24 = -[GKNotificationBannerView useShortBanner](self, "useShortBanner");
  v25 = 20.0;
  if (v24)
    v25 = 8.0;
  v26 = MaxX + v25;
  if (!-[GKNotificationBannerView useShortBanner](self, "useShortBanner"))
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "userInterfaceIdiom");

    if (v28 != 1 || (v13 = 12.0, *MEMORY[0x1E0D253F8]) && !*MEMORY[0x1E0D25B68])
      v13 = 11.0;
  }
  v29 = v4 + v26;
  v30 = v109 + 0.0;
  v31 = v26 + v13;
  remainder.origin.x = v29;
  remainder.origin.y = v109 + 0.0;
  v32 = v8;
  v33 = v8 - v31;
  remainder.size.width = v110 - v31;
  remainder.size.height = v10;
  -[GKNotificationBannerView titleLabel](self, "titleLabel");
  v34 = objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = (void *)v34;
    -[GKNotificationBannerView messageLabel](self, "messageLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      -[GKNotificationBannerView titleLabel](self, "titleLabel");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "sizeThatFits:", v33, v10);
      v39 = v38;
      v41 = v40;

      -[GKNotificationBannerView messageLabel](self, "messageLabel");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "sizeThatFits:", v33, v10);
      v44 = v43;
      v46 = v45;

      v48 = v30 + floor((v10 - (v41 + v46)) * 0.5);
      if (v39 >= v44)
        v49 = v39;
      else
        v49 = v44;
      if (v33 <= v49)
        v50 = v33;
      else
        v50 = v49;
      remainder.origin.y = v48;
      remainder.size.width = v50;
      remainder.size.height = v41 + v46;
      memset(&slice, 0, sizeof(slice));
      memset(&v111, 0, sizeof(v111));
      v51 = v29;
      v47 = v41 + v46;
      CGRectDivide(*(CGRect *)(&v48 - 1), &slice, &remainder, v41, CGRectMinYEdge);
      CGRectDivide(remainder, &v111, &remainder, v46, CGRectMaxYEdge);
      x = slice.origin.x;
      y = slice.origin.y;
      width = slice.size.width;
      height = slice.size.height;
      -[GKNotificationBannerView titleLabel](self, "titleLabel");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setFrame:", x, y, width, height);

      v57 = v111.origin.x;
      v58 = v111.origin.y;
      v59 = v111.size.width;
      v60 = v111.size.height;
      -[GKNotificationBannerView messageLabel](self, "messageLabel");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setFrame:", v57, v58, v59, v60);

      v62 = CGRectGetMaxX(slice);
      v63 = CGRectGetMaxX(v111);
      if (v62 < v63)
        v62 = v63;
      v64 = -[GKNotificationBannerView useShortBanner](self, "useShortBanner");
      v65 = 8.0;
      if (!v64)
      {
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", 8.0);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v66, "userInterfaceIdiom");

        if (v67 != 1 || (v65 = 12.0, *MEMORY[0x1E0D253F8]) && !*MEMORY[0x1E0D25B68])
          v65 = 11.0;
      }
      v68 = v62 + v65;
      v32 = v110;
      goto LABEL_55;
    }
  }
  -[GKNotificationBannerView titleLabel](self, "titleLabel");
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  if (v69)
  {
    -[GKNotificationBannerView titleLabel](self, "titleLabel");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "sizeThatFits:", v33, v10);
    v72 = v71;

    if (v33 > v72)
      v33 = v72;
    remainder.size.width = v33;
    -[GKNotificationBannerView titleLabel](self, "titleLabel");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[GKNotificationBannerView messageLabel](self, "messageLabel");
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v74)
      goto LABEL_49;
    -[GKNotificationBannerView messageLabel](self, "messageLabel");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "sizeThatFits:", v33, v10);
    v77 = v76;

    if (v33 > v77)
      v33 = v77;
    remainder.size.width = v33;
    -[GKNotificationBannerView messageLabel](self, "messageLabel");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v78 = v73;
  objc_msgSend(v73, "setFrame:", v29, v30, v33, v10);

LABEL_49:
  v117.origin.x = v29;
  v117.origin.y = v109 + 0.0;
  v117.size.width = v33;
  v117.size.height = v10;
  v79 = CGRectGetMaxX(v117);
  v80 = -[GKNotificationBannerView useShortBanner](self, "useShortBanner");
  v81 = 8.0;
  if (!v80)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", 8.0);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v82, "userInterfaceIdiom");

    if (v83 != 1 || (v81 = 12.0, *MEMORY[0x1E0D253F8]) && !*MEMORY[0x1E0D25B68])
      v81 = 11.0;
  }
  v68 = v79 + v81;
LABEL_55:
  if (v68 != 0.0)
  {
    v84 = (v32 - v68) * 0.5;
    objc_msgSend(v12, "frame");
    objc_msgSend(v12, "setFrame:", v84 + v85);
    -[GKNotificationBannerView titleLabel](self, "titleLabel");
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    if (v86)
    {
      -[GKNotificationBannerView titleLabel](self, "titleLabel");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "frame");
      v89 = v88;
      v91 = v90;
      v93 = v92;
      v95 = v94;

      -[GKNotificationBannerView titleLabel](self, "titleLabel");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "setFrame:", v84 + v89, v91, v93, v95);

    }
    -[GKNotificationBannerView messageLabel](self, "messageLabel");
    v97 = (void *)objc_claimAutoreleasedReturnValue();

    if (v97)
    {
      -[GKNotificationBannerView messageLabel](self, "messageLabel");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "frame");
      v100 = v99;
      v102 = v101;
      v104 = v103;
      v106 = v105;

      -[GKNotificationBannerView messageLabel](self, "messageLabel");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "setFrame:", v84 + v100, v102, v104, v106);

    }
  }

}

- (void)showPlayerAvatarAnimationWithCompletionHandler:(id)a3
{
  id v4;

  v4 = a3;
  -[GKNotificationBannerView startLoadingPlayerAvatar](self, "startLoadingPlayerAvatar");
  -[GKNotificationBannerView setCompletionHandler:](self, "setCompletionHandler:", v4);

  +[GKNotificationBannerWindow enqueBanner:](GKNotificationBannerWindow, "enqueBanner:", self);
}

- (void)showWithCompletionHandler:(id)a3
{
  -[GKNotificationBannerView setCompletionHandler:](self, "setCompletionHandler:", a3);
  +[GKNotificationBannerWindow enqueBanner:](GKNotificationBannerWindow, "enqueBanner:", self);
}

- (void)showWithTouchHandler:(id)a3
{
  -[GKNotificationBannerView setTouchHandler:](self, "setTouchHandler:", a3);
  +[GKNotificationBannerWindow enqueBanner:](GKNotificationBannerWindow, "enqueBanner:", self);
}

- (void)hideBanner
{
  id v3;

  -[GKNotificationBannerView superview](self, "superview");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_hideBanner:quickly:", self, 1);

}

- (void)_wasTouched:(id)a3
{
  void (**v4)(void);
  void (**v5)(void);

  -[GKNotificationBannerView touchHandler](self, "touchHandler", a3);
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    v4[2]();
    -[GKNotificationBannerView setTouchHandler:](self, "setTouchHandler:", 0);
    v4 = v5;
  }

}

- (void)callCompletionHandler
{
  void (**v3)(void);

  -[GKNotificationBannerView completionHandler](self, "completionHandler");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v3)
    v3[2]();
  -[GKNotificationBannerView setCompletionHandler:](self, "setCompletionHandler:", 0);
  -[GKNotificationBannerView setTouchHandler:](self, "setTouchHandler:", 0);

}

- (void)fadeInWithCompletionHandler:(id)a3
{
  id v4;
  __int128 v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;

  v4 = a3;
  -[GKNotificationBannerView setAlpha:](self, "setAlpha:", 0.0);
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v13.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v13.c = v5;
  *(_OWORD *)&v13.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  CGAffineTransformScale(&v14, &v13, 0.93, 0.93);
  v12 = v14;
  -[GKNotificationBannerView setTransform:](self, "setTransform:", &v12);
  -[GKNotificationBannerView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsGroupOpacity:", 0);

  v7 = (void *)MEMORY[0x1E0DC3F10];
  v10 = v4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__GKNotificationBannerView_fadeInWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E59C4148;
  v11[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__GKNotificationBannerView_fadeInWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E59C5BA0;
  v9[4] = self;
  v8 = v4;
  objc_msgSend(v7, "animateWithDuration:delay:options:animations:completion:", 38, v11, v9, 0.5, 0.0);

}

uint64_t __56__GKNotificationBannerView_fadeInWithCompletionHandler___block_invoke(uint64_t a1)
{
  __int128 v2;
  void *v3;
  CGAffineTransform v5;
  CGAffineTransform v6;
  CGAffineTransform v7;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v6.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v6.c = v2;
  *(_OWORD *)&v6.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  CGAffineTransformScale(&v7, &v6, 1.0, 1.0);
  v3 = *(void **)(a1 + 32);
  v5 = v7;
  return objc_msgSend(v3, "setTransform:", &v5);
}

uint64_t __56__GKNotificationBannerView_fadeInWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllowsGroupOpacity:", 1);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fadeOutQuickly:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  double v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];

  v4 = a3;
  v6 = a4;
  -[GKNotificationBannerView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsGroupOpacity:", 0);

  v8 = (void *)MEMORY[0x1E0DC3F10];
  if (v4)
    v9 = 0.1;
  else
    v9 = 0.5;
  v12 = v6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__GKNotificationBannerView_fadeOutQuickly_withCompletionHandler___block_invoke;
  v13[3] = &unk_1E59C4148;
  v13[4] = self;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__GKNotificationBannerView_fadeOutQuickly_withCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E59C5BA0;
  v11[4] = self;
  v10 = v6;
  objc_msgSend(v8, "animateWithDuration:delay:options:animations:completion:", 38, v13, v11, v9, 0.0);

}

uint64_t __65__GKNotificationBannerView_fadeOutQuickly_withCompletionHandler___block_invoke(uint64_t a1)
{
  __int128 v2;
  void *v3;
  CGAffineTransform v5;
  CGAffineTransform v6;
  CGAffineTransform v7;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v6.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v6.c = v2;
  *(_OWORD *)&v6.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  CGAffineTransformScale(&v7, &v6, 0.93, 0.93);
  v3 = *(void **)(a1 + 32);
  v5 = v7;
  return objc_msgSend(v3, "setTransform:", &v5);
}

uint64_t __65__GKNotificationBannerView_fadeOutQuickly_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllowsGroupOpacity:", 1);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (UIView)leadingAccessoryView
{
  return self->_leadingAccessoryView;
}

- (void)setLeadingAccessoryView:(id)a3
{
  objc_storeStrong((id *)&self->_leadingAccessoryView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_messageLabel, a3);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (id)touchHandler
{
  return self->_touchHandler;
}

- (void)setTouchHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (GKDashboardPlayerPhotoView)playerAvatarView
{
  return self->_playerAvatarView;
}

- (void)setPlayerAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_playerAvatarView, a3);
}

- (BOOL)canTransitionToPlayerAvatar
{
  return self->_canTransitionToPlayerAvatar;
}

- (void)setCanTransitionToPlayerAvatar:(BOOL)a3
{
  self->_canTransitionToPlayerAvatar = a3;
}

- (UILabel)actionLabel
{
  return self->_actionLabel;
}

- (void)setActionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_actionLabel, a3);
}

- (double)preferredBannerWidth
{
  return self->_preferredBannerWidth;
}

- (BOOL)useShortBanner
{
  return self->_useShortBanner;
}

- (void)setUseShortBanner:(BOOL)a3
{
  self->_useShortBanner = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionLabel, 0);
  objc_storeStrong((id *)&self->_playerAvatarView, 0);
  objc_storeStrong(&self->_touchHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_leadingAccessoryView, 0);
}

@end
