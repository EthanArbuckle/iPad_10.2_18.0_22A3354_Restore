@implementation CKAppGrabberView

- (CKAppGrabberView)initWithFrame:(CGRect)a3
{
  CKAppGrabberView *v3;
  CKAppGrabberView *v4;
  UIView *v5;
  UIView *headerView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  UIView *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _UIGrabber *v24;
  _UIGrabber *chevronView;
  uint64_t v26;
  UIImageView *iconImageView;
  UIImageView *v28;
  UIImageView *iconOutlineView;
  UIImageView *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  UILabel *v39;
  UILabel *pluginTitleLabel;
  UILabel *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  UIButton *closeButton;
  void *v47;
  objc_super v49;

  v49.receiver = self;
  v49.super_class = (Class)CKAppGrabberView;
  v3 = -[CKAppGrabberView initWithFrame:](&v49, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKAppGrabberView setBackgroundColor:](v3, "setBackgroundColor:", 0);
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    headerView = v4->_headerView;
    v4->_headerView = v5;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "theme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "browserSwitcherBorderColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[UIView layer](v4->_headerView, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "theme");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "browserSwitcherBorderColor");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v10, "setBorderColor:", objc_msgSend(v13, "CGColor"));

      -[UIView layer](v4->_headerView, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v15) = 1041865114;
      objc_msgSend(v14, "setShadowOpacity:", v15);

      -[UIView layer](v4->_headerView, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setShadowRadius:", 1.0);

      -[UIView layer](v4->_headerView, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setShadowOffset:", 0.0, -1.0);

      -[UIView layer](v4->_headerView, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setShadowPathIsBounds:", 1);

    }
    -[CKAppGrabberView updateHeaderFrame:](v4, "updateHeaderFrame:", 1);
    v19 = v4->_headerView;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "theme");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "appGrabberBackgroundColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v19, "setBackgroundColor:", v22);

    -[UIView setAutoresizingMask:](v4->_headerView, "setAutoresizingMask:", 10);
    -[UIView setClipsToBounds:](v4->_headerView, "setClipsToBounds:", 1);
    -[UIView layer](v4->_headerView, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setMaskedCorners:", 3);

    -[CKAppGrabberView addSubview:](v4, "addSubview:", v4->_headerView);
    v24 = (_UIGrabber *)objc_alloc_init(MEMORY[0x1E0CEAD38]);
    chevronView = v4->_chevronView;
    v4->_chevronView = v24;

    -[_UIGrabber sizeToFit](v4->_chevronView, "sizeToFit");
    -[UIView addSubview:](v4->_headerView, "addSubview:", v4->_chevronView);
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", 0.0, 0.0, 40.0, 30.0);
    iconImageView = v4->_iconImageView;
    v4->_iconImageView = (UIImageView *)v26;

    -[UIView addSubview:](v4->_headerView, "addSubview:", v4->_iconImageView);
    v28 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
    iconOutlineView = v4->_iconOutlineView;
    v4->_iconOutlineView = v28;

    v30 = v4->_iconOutlineView;
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "colorWithAlphaComponent:", 0.25);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v30, "setTintColor:", v32);

    v33 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "imageNamed:inBundle:", CFSTR("BorderPath"), v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "imageWithRenderingMode:", 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIImageView setImage:](v4->_iconOutlineView, "setImage:", v36);
    -[UIView addSubview:](v4->_headerView, "addSubview:", v4->_iconOutlineView);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "appLabelFont");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    pluginTitleLabel = v4->_pluginTitleLabel;
    v4->_pluginTitleLabel = v39;

    -[UILabel setNumberOfLines:](v4->_pluginTitleLabel, "setNumberOfLines:", 1);
    -[UILabel setAutoresizingMask:](v4->_pluginTitleLabel, "setAutoresizingMask:", 34);
    -[UILabel setFont:](v4->_pluginTitleLabel, "setFont:", v38);
    v41 = v4->_pluginTitleLabel;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "theme");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "appGrabberTitleColor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v41, "setTextColor:", v44);

    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_pluginTitleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setBaselineAdjustment:](v4->_pluginTitleLabel, "setBaselineAdjustment:", 1);
    -[UIView addSubview:](v4->_headerView, "addSubview:", v4->_pluginTitleLabel);
    +[CKAppGrabberCloseButton buttonWithType:](CKAppGrabberCloseButton, "buttonWithType:", 7);
    v45 = objc_claimAutoreleasedReturnValue();
    closeButton = v4->_closeButton;
    v4->_closeButton = (UIButton *)v45;

    -[UIButton sizeToFit](v4->_closeButton, "sizeToFit");
    -[UIButton addTarget:action:forEvents:](v4->_closeButton, "addTarget:action:forEvents:", v4, sel_closeButtonTapped_, 64);
    -[UIView addSubview:](v4->_headerView, "addSubview:", v4->_closeButton);
    -[CKAppGrabberView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("collapseButtonIdentifier"));
    -[CKAppGrabberView setShowsAppTitle:](v4, "setShowsAppTitle:", 0);
    -[CKAppGrabberView setRoundsTopCorners:](v4, "setRoundsTopCorners:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObserver:selector:name:object:", v4, sel_updateIconImageView_, *MEMORY[0x1E0D352C0], 0);

  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat x;
  CGFloat width;
  void *v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  BOOL v28;
  double v29;
  double v30;
  double *v31;
  double v32;
  double v33;
  CGFloat v34;
  double MaxX;
  double v36;
  double v37;
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
  void *v48;
  CGFloat v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat rect;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat y;
  CGFloat v59;
  CGFloat v60;
  double MinX;
  double v62;
  objc_super v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  v63.receiver = self;
  v63.super_class = (Class)CKAppGrabberView;
  -[CKAppGrabberView layoutSubviews](&v63, sel_layoutSubviews);
  -[_UIGrabber frame](self->_chevronView, "frame");
  v4 = v3;
  v6 = v5;
  -[UIView bounds](self->_headerView, "bounds");
  v8 = v7;
  v10 = v9;
  if (CKMainScreenScale_once_81 != -1)
    dispatch_once(&CKMainScreenScale_once_81, &__block_literal_global_199);
  v11 = *(double *)&CKMainScreenScale_sMainScreenScale_81;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_81 == 0.0)
    v11 = 1.0;
  -[_UIGrabber setFrame:](self->_chevronView, "setFrame:", 1.0 / v11 * (v8 * v11 + floor((v10 * v11 - v4 * v11) * 0.5)), *MEMORY[0x1E0CEC1A8], v4 * v11 * (1.0 / v11), v6 * v11 * (1.0 / v11));
  -[UIView bounds](self->_headerView, "bounds");
  v65 = CGRectInset(v64, 16.0, 0.0);
  x = v65.origin.x;
  y = v65.origin.y;
  width = v65.size.width;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "browserSwitcherExpandedGrabberHeaderHeight");
  v16 = v15;

  -[UIButton frame](self->_closeButton, "frame");
  v18 = v17;
  v59 = v20;
  v60 = v19;
  v62 = v21;
  -[UIImageView image](self->_iconImageView, "image");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    -[UIImageView image](self->_iconImageView, "image");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "size");
    v25 = v24;
    v27 = v26;

  }
  else
  {
    v25 = 40.0;
    v27 = 30.0;
  }

  v28 = v25 == v27;
  if (v25 == v27)
    v29 = 36.0;
  else
    v29 = 30.0;
  if (v28)
    v30 = 36.0;
  else
    v30 = 40.0;
  v31 = (double *)MEMORY[0x1E0C9D538];
  v32 = *(double *)(MEMORY[0x1E0C9D538] + 8) + v29 * -0.5;
  -[UILabel frame](self->_pluginTitleLabel, "frame");
  v57 = v33;
  v56 = v30;
  rect = v32;
  if (-[CKAppGrabberView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    v34 = *v31 + v30 * -0.5;
    v66.origin.x = x;
    v66.origin.y = y;
    v66.size.width = width;
    v66.size.height = v16;
    MinX = CGRectGetMinX(v66);
    v67.origin.x = x;
    v67.origin.y = y;
    v67.size.width = width;
    v67.size.height = v16;
    MaxX = CGRectGetMaxX(v67);
    v68.origin.x = v34;
    v68.origin.y = v32;
    v68.size.width = v30;
    v68.size.height = v29;
    v36 = MaxX - CGRectGetWidth(v68);
    if (CKMainScreenScale_once_81 != -1)
      dispatch_once(&CKMainScreenScale_once_81, &__block_literal_global_199);
    v37 = *(double *)&CKMainScreenScale_sMainScreenScale_81;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_81 == 0.0)
      v37 = 1.0;
    v38 = floor(v36 * v37) / v37;
    v69.origin.x = MinX;
    v69.size.height = v62;
    v39 = v59;
    v69.origin.y = v60;
    v69.size.width = v59;
    v55 = CGRectGetMaxX(v69);
    v70.origin.x = x;
    v40 = y;
    v70.origin.y = y;
    v70.size.width = width;
    v70.size.height = v16;
    v41 = CGRectGetWidth(v70);
    -[UIImageView image](self->_iconImageView, "image");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      v71.origin.x = v38;
      v71.origin.y = rect;
      v43 = v56;
      v71.size.width = v56;
      v71.size.height = v29;
      v41 = v41 - (CGRectGetWidth(v71) + 8.0);
      goto LABEL_29;
    }
  }
  else
  {
    v72.origin.x = x;
    v40 = y;
    v72.origin.y = y;
    v72.size.width = width;
    v72.size.height = v16;
    v44 = CGRectGetMaxX(v72);
    v73.origin.x = v18;
    v73.size.width = v59;
    v73.origin.y = v60;
    v73.size.height = v62;
    v45 = v44 - CGRectGetWidth(v73);
    if (CKMainScreenScale_once_81 != -1)
      dispatch_once(&CKMainScreenScale_once_81, &__block_literal_global_199);
    v46 = *(double *)&CKMainScreenScale_sMainScreenScale_81;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_81 == 0.0)
      v46 = 1.0;
    MinX = floor(v45 * v46) / v46;
    v74.origin.x = x;
    v74.origin.y = y;
    v74.size.width = width;
    v74.size.height = v16;
    v38 = CGRectGetMinX(v74);
    v75.origin.x = x;
    v75.origin.y = y;
    v75.size.width = width;
    v75.size.height = v16;
    v47 = CGRectGetMinX(v75);
    v76.origin.x = x;
    v76.origin.y = y;
    v76.size.width = width;
    v76.size.height = v16;
    v41 = CGRectGetWidth(v76);
    -[UIImageView image](self->_iconImageView, "image");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      v77.origin.x = v38;
      v77.origin.y = rect;
      v43 = v56;
      v77.size.width = v56;
      v77.size.height = v29;
      v49 = CGRectGetWidth(v77) + 8.0;
      v55 = v47 + v49;
      v41 = v41 - v49;
      v39 = v59;
      goto LABEL_29;
    }
    v78.origin.x = x;
    v78.origin.y = y;
    v78.size.width = width;
    v78.size.height = v16;
    v55 = CGRectGetMinX(v78);
    v39 = v59;
  }
  v43 = v56;
LABEL_29:
  v79.origin.y = v60;
  v79.origin.x = MinX;
  v79.size.width = v39;
  v79.size.height = v62;
  v50 = CGRectGetWidth(v79);
  if (CKMainScreenScale_once_81 != -1)
    dispatch_once(&CKMainScreenScale_once_81, &__block_literal_global_199);
  v51 = *(double *)&CKMainScreenScale_sMainScreenScale_81;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_81 == 0.0)
    v51 = 1.0;
  -[UIImageView setFrame:](self->_iconImageView, "setFrame:", v38 * v51 * (1.0 / v51), 1.0 / v51 * (v40 * v51 + floor((v16 * v51 - v29 * v51) * 0.5)), v43 * v51 * (1.0 / v51), v29 * v51 * (1.0 / v51));
  -[UIImageView frame](self->_iconImageView, "frame");
  -[UIImageView setFrame:](self->_iconOutlineView, "setFrame:");
  if (CKMainScreenScale_once_81 != -1)
    dispatch_once(&CKMainScreenScale_once_81, &__block_literal_global_199);
  v52 = *(double *)&CKMainScreenScale_sMainScreenScale_81;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_81 == 0.0)
    v52 = 1.0;
  -[UIButton setFrame:](self->_closeButton, "setFrame:", MinX * v52 * (1.0 / v52), 1.0 / v52 * (v40 * v52 + floor((v16 * v52 - v62 * v52) * 0.5)), v39 * v52 * (1.0 / v52), v62 * v52 * (1.0 / v52));
  if (CKMainScreenScale_once_81 != -1)
    dispatch_once(&CKMainScreenScale_once_81, &__block_literal_global_199);
  v53 = *(double *)&CKMainScreenScale_sMainScreenScale_81;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_81 == 0.0)
    v53 = 1.0;
  -[UILabel setFrame:](self->_pluginTitleLabel, "setFrame:", v55 * v53 * (1.0 / v53), 1.0 / v53 * (v40 * v53 + floor((v16 * v53 - v57 * v53) * 0.5)), (v41 - (v50 + 8.0)) * v53 * (1.0 / v53), v57 * v53 * (1.0 / v53));
}

- (void)updateIconImageView:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CKAppGrabberView *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__CKAppGrabberView_updateIconImageView___block_invoke;
  v6[3] = &unk_1E274A108;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __40__CKAppGrabberView_updateIconImageView___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("IMBalloonPluginIdentifierKey"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("UpdatedIMBalloonPluginIconKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 472)))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 416), "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 != v5)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 416), "setImage:", v4);
      objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
    }
  }

}

- (BOOL)showsGrabberPill
{
  double v2;

  -[_UIGrabber alpha](self->_chevronView, "alpha");
  return v2 == 1.0;
}

- (void)setShowsGrabberPill:(BOOL)a3
{
  double v3;

  v3 = 0.0;
  if (a3)
    v3 = 1.0;
  -[_UIGrabber setAlpha:](self->_chevronView, "setAlpha:", v3);
}

- (double)visualOriginYOffset
{
  CGRect v3;

  -[UIView frame](self->_headerView, "frame");
  return CGRectGetMinY(v3);
}

- (double)chevronMaxYOffset
{
  CGRect v4;

  -[_UIGrabber frame](self->_chevronView, "frame");
  -[CKAppGrabberView convertRect:fromView:](self, "convertRect:fromView:", self->_headerView);
  return CGRectGetMaxY(v4);
}

- (double)visualOriginYInView:(id)a3
{
  UIView *headerView;
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGRect v15;

  headerView = self->_headerView;
  v5 = a3;
  -[UIView frame](headerView, "frame");
  objc_msgSend(v5, "convertRect:fromView:", self);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v15.origin.x = v7;
  v15.origin.y = v9;
  v15.size.width = v11;
  v15.size.height = v13;
  return CGRectGetMinY(v15);
}

- (double)chevronMaxYInView:(id)a3
{
  _UIGrabber *chevronView;
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGRect v15;

  chevronView = self->_chevronView;
  v5 = a3;
  -[_UIGrabber frame](chevronView, "frame");
  objc_msgSend(v5, "convertRect:fromView:", self->_headerView);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v15.origin.x = v7;
  v15.origin.y = v9;
  v15.size.width = v11;
  v15.size.height = v13;
  return CGRectGetMaxY(v15);
}

- (void)updateAppTitle:(id)a3 icon:(id)a4 appIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  -[UILabel text](self->_pluginTitleLabel, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", v12) & 1) != 0)
  {
    -[UIImageView image](self->_iconImageView, "image");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11 == v8)
      goto LABEL_6;
  }
  else
  {

  }
  -[UILabel setText:](self->_pluginTitleLabel, "setText:", v12);
  -[UILabel sizeToFit](self->_pluginTitleLabel, "sizeToFit");
  objc_storeStrong((id *)&self->_appIdentifier, a5);
  -[UIImageView setImage:](self->_iconImageView, "setImage:", v8);
  -[CKAppGrabberView setNeedsLayout](self, "setNeedsLayout");
LABEL_6:

}

- (void)closeButtonTapped:(id)a3
{
  id v4;

  -[CKAppGrabberView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appGrabberViewCloseButtonTapped:", self);

}

+ (double)roundedCornerRadius
{
  return *MEMORY[0x1E0CEC198];
}

+ (double)compactRoundedCornerRadius
{
  void *v2;
  uint64_t v3;
  double result;

  if (!CKIsRunningInMessages())
    return *MEMORY[0x1E0CEC198];
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  result = 0.0;
  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    return *MEMORY[0x1E0CEC198];
  return result;
}

- (void)setRoundsTopCorners:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  id v8;

  v3 = a3;
  self->_roundsTopCorners = a3;
  v5 = (void *)objc_opt_class();
  if (v3)
    objc_msgSend(v5, "roundedCornerRadius");
  else
    objc_msgSend(v5, "compactRoundedCornerRadius");
  v7 = v6;
  -[UIView layer](self->_headerView, "layer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", v7);

}

- (void)setShowsAppTitle:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  _BOOL4 v13;
  double v14;

  v3 = a3;
  self->_showsAppTitle = a3;
  -[CKAppGrabberView updateHeaderFrame:](self, "updateHeaderFrame:", !a3);
  if (v3)
    v5 = 1.0;
  else
    v5 = 0.0;
  -[UIImageView setAlpha:](self->_iconImageView, "setAlpha:", v5);
  -[UILabel setAlpha:](self->_pluginTitleLabel, "setAlpha:", v5);
  -[UIButton setAlpha:](self->_closeButton, "setAlpha:", v5);
  -[CKAppGrabberView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  -[UIImageView image](self->_iconImageView, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  v10 = v9;
  v12 = v11 == 30.0;

  v13 = v7 == 2 && v3;
  if (v10 != 40.0)
    v13 = 0;
  if (v13 && v12)
    v14 = v5;
  else
    v14 = 0.0;
  -[UIImageView setAlpha:](self->_iconOutlineView, "setAlpha:", v14);
}

- (void)updateHeaderFrame:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v13;
  CGRect v14;
  CGRect v15;

  v3 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "browserSwitcherCompactGrabberVisibleHeight");
  else
    objc_msgSend(v5, "browserSwitcherExpandedGrabberHeaderHeight");
  v8 = v7;

  -[CKAppGrabberView bounds](self, "bounds");
  x = v14.origin.x;
  y = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;
  v13 = CGRectGetHeight(v14);
  if (CKPixelWidth_once_14 != -1)
    dispatch_once(&CKPixelWidth_once_14, &__block_literal_global_109_2);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  -[UIView setFrame:](self->_headerView, "setFrame:", 0.0, v13 - v8 + *(double *)&CKPixelWidth_sPixel_14, CGRectGetWidth(v15), v8);
}

- (id)headerView
{
  return self->_headerView;
}

- (id)iconImageView
{
  return self->_iconImageView;
}

- (CKAppGrabberViewDelegate)delegate
{
  return (CKAppGrabberViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)showsAppTitle
{
  return self->_showsAppTitle;
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (BOOL)roundsTopCorners
{
  return self->_roundsTopCorners;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_chevronView, 0);
  objc_storeStrong((id *)&self->_grayLine, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_pluginTitleLabel, 0);
  objc_storeStrong((id *)&self->_iconOutlineView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end
