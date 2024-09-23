@implementation MediaControlsHeaderView

- (MediaControlsHeaderView)initWithFrame:(CGRect)a3
{
  MediaControlsHeaderView *v3;
  uint64_t v4;
  MTMaterialView *artworkBackground;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  UIImageView *artworkView;
  uint64_t v13;
  UIView *shadow;
  uint64_t v15;
  MPRouteLabel *routeLabel;
  uint64_t v17;
  MPUMarqueeView *primaryMarqueeView;
  uint64_t v19;
  UILabel *primaryLabel;
  uint64_t v21;
  MPUMarqueeView *secondaryMarqueeView;
  uint64_t v23;
  UILabel *secondaryLabel;
  uint64_t v25;
  UILabel *placeholderLabel;
  MediaControlsRoutingButtonView *v27;
  MediaControlsRoutingButtonView *routingButton;
  uint64_t v29;
  UIButton *launchNowPlayingAppButton;
  uint64_t v31;
  UIImageView *placeholderArtworkView;
  uint64_t v33;
  UIView *artworkContentView;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  double v92;
  double v93;
  void *v94;
  void *v95;
  double v96;
  double v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  UIPointerInteraction *pointerInteraction;
  objc_super v108;

  v108.receiver = self;
  v108.super_class = (Class)MediaControlsHeaderView;
  v3 = -[MediaControlsHeaderView initWithFrame:](&v108, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:configuration:", 4, 4);
    v4 = objc_claimAutoreleasedReturnValue();
    artworkBackground = v3->_artworkBackground;
    v3->_artworkBackground = (MTMaterialView *)v4;

    v6 = objc_alloc(MEMORY[0x1E0DC3890]);
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
    artworkView = v3->_artworkView;
    v3->_artworkView = (UIImageView *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v7, v8, v9, v10);
    shadow = v3->_shadow;
    v3->_shadow = (UIView *)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC24F8]), "initWithFrame:", v7, v8, v9, v10);
    routeLabel = v3->_routeLabel;
    v3->_routeLabel = (MPRouteLabel *)v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4B3B0]), "initWithFrame:", v7, v8, v9, v10);
    primaryMarqueeView = v3->_primaryMarqueeView;
    v3->_primaryMarqueeView = (MPUMarqueeView *)v17;

    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
    primaryLabel = v3->_primaryLabel;
    v3->_primaryLabel = (UILabel *)v19;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4B3B0]), "initWithFrame:", v7, v8, v9, v10);
    secondaryMarqueeView = v3->_secondaryMarqueeView;
    v3->_secondaryMarqueeView = (MPUMarqueeView *)v21;

    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
    secondaryLabel = v3->_secondaryLabel;
    v3->_secondaryLabel = (UILabel *)v23;

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
    placeholderLabel = v3->_placeholderLabel;
    v3->_placeholderLabel = (UILabel *)v25;

    -[UILabel setHidden:](v3->_placeholderLabel, "setHidden:", 1);
    v27 = -[MediaControlsRoutingButtonView initWithFrame:]([MediaControlsRoutingButtonView alloc], "initWithFrame:", v7, v8, v9, v10);
    routingButton = v3->_routingButton;
    v3->_routingButton = v27;

    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3518]), "initWithFrame:", v7, v8, v9, v10);
    launchNowPlayingAppButton = v3->_launchNowPlayingAppButton;
    v3->_launchNowPlayingAppButton = (UIButton *)v29;

    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v7, v8, v9, v10);
    placeholderArtworkView = v3->_placeholderArtworkView;
    v3->_placeholderArtworkView = (UIImageView *)v31;

    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v7, v8, v9, v10);
    artworkContentView = v3->_artworkContentView;
    v3->_artworkContentView = (UIView *)v33;

    -[MediaControlsHeaderView routingButton](v3, "routingButton");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsHeaderView addSubview:](v3, "addSubview:", v35);

    -[MediaControlsHeaderView routeLabel](v3, "routeLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsHeaderView addSubview:](v3, "addSubview:", v36);

    -[MediaControlsHeaderView primaryMarqueeView](v3, "primaryMarqueeView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsHeaderView addSubview:](v3, "addSubview:", v37);

    -[MediaControlsHeaderView secondaryMarqueeView](v3, "secondaryMarqueeView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsHeaderView addSubview:](v3, "addSubview:", v38);

    -[MediaControlsHeaderView placeholderLabel](v3, "placeholderLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsHeaderView addSubview:](v3, "addSubview:", v39);

    -[MediaControlsHeaderView launchNowPlayingAppButton](v3, "launchNowPlayingAppButton");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsHeaderView addSubview:](v3, "addSubview:", v40);

    -[MediaControlsHeaderView artworkContentView](v3, "artworkContentView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsHeaderView addSubview:](v3, "addSubview:", v41);

    -[MediaControlsHeaderView artworkContentView](v3, "artworkContentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsHeaderView shadow](v3, "shadow");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addSubview:", v43);

    -[MediaControlsHeaderView artworkContentView](v3, "artworkContentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsHeaderView artworkBackground](v3, "artworkBackground");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addSubview:", v45);

    -[MediaControlsHeaderView artworkContentView](v3, "artworkContentView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsHeaderView artworkView](v3, "artworkView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addSubview:", v47);

    -[MediaControlsHeaderView artworkContentView](v3, "artworkContentView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsHeaderView placeholderArtworkView](v3, "placeholderArtworkView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addSubview:", v49);

    -[MediaControlsHeaderView routingButton](v3, "routingButton");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setHitRectInsets:", -24.0, -24.0, -24.0, -24.0);

    -[MediaControlsHeaderView traitCollection](v3, "traitCollection");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "displayScale");

    -[MediaControlsHeaderView artworkContentView](v3, "artworkContentView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setUserInteractionEnabled:", 0);

    -[MediaControlsHeaderView artworkBackground](v3, "artworkBackground");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setClipsToBounds:", 1);

    UIRoundToScale();
    v55 = v54;
    -[MediaControlsHeaderView artworkBackground](v3, "artworkBackground");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "_setContinuousCornerRadius:", v55);

    v57 = *MEMORY[0x1E0CD2EF8];
    -[MediaControlsHeaderView artworkView](v3, "artworkView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "layer");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setMinificationFilter:", v57);

    -[MediaControlsHeaderView artworkView](v3, "artworkView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setContentMode:", 1);

    -[MediaControlsHeaderView artworkView](v3, "artworkView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setClipsToBounds:", 1);

    UIRoundToScale();
    v63 = v62;
    -[MediaControlsHeaderView artworkView](v3, "artworkView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "_setContinuousCornerRadius:", v63);

    -[MediaControlsHeaderView placeholderArtworkView](v3, "placeholderArtworkView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "layer");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setMinificationFilter:", v57);

    -[MediaControlsHeaderView placeholderArtworkView](v3, "placeholderArtworkView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setContentMode:", 1);

    -[MediaControlsHeaderView placeholderArtworkView](v3, "placeholderArtworkView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setClipsToBounds:", 1);

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v69 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v70 = objc_msgSend(v69, "CGColor");
    -[MediaControlsHeaderView shadow](v3, "shadow");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "layer");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setShadowColor:", v70);

    -[MediaControlsHeaderView shadow](v3, "shadow");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "layer");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setShadowOffset:", 0.0, 1.0);

    -[MediaControlsHeaderView shadow](v3, "shadow");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "layer");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setShadowRadius:", 4.0);

    -[MediaControlsHeaderView shadow](v3, "shadow");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "layer");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v79) = 1042536202;
    objc_msgSend(v78, "setShadowOpacity:", v79);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "addObserver:selector:name:object:", v3, sel__handleContentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);
    -[MediaControlsHeaderView routeLabel](v3, "routeLabel");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setForcesUppercaseText:", 1);

    -[MediaControlsHeaderView primaryLabel](v3, "primaryLabel");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setNumberOfLines:", 1);

    -[MediaControlsHeaderView secondaryLabel](v3, "secondaryLabel");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setNumberOfLines:", 1);

    -[MediaControlsHeaderView placeholderLabel](v3, "placeholderLabel");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setNumberOfLines:", 0);

    -[MediaControlsHeaderView primaryMarqueeView](v3, "primaryMarqueeView");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "contentView");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsHeaderView primaryLabel](v3, "primaryLabel");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "addSubview:", v87);

    -[MediaControlsHeaderView secondaryMarqueeView](v3, "secondaryMarqueeView");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "contentView");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsHeaderView secondaryLabel](v3, "secondaryLabel");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "addSubview:", v90);

    -[MediaControlsHeaderView traitCollection](v3, "traitCollection");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "displayScale");
    UIRoundToScale();
    v93 = v92;
    -[MediaControlsHeaderView primaryMarqueeView](v3, "primaryMarqueeView");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setContentGap:", v93);

    -[MediaControlsHeaderView traitCollection](v3, "traitCollection");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "displayScale");
    UIRoundToScale();
    v97 = v96;
    -[MediaControlsHeaderView secondaryMarqueeView](v3, "secondaryMarqueeView");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "setContentGap:", v97);

    -[MediaControlsHeaderView primaryMarqueeView](v3, "primaryMarqueeView");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsHeaderView secondaryMarqueeView](v3, "secondaryMarqueeView");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "addCoordinatedMarqueeView:", v100);

    -[MediaControlsHeaderView launchNowPlayingAppButton](v3, "launchNowPlayingAppButton");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "setHidden:", 1);

    -[MediaControlsHeaderView launchNowPlayingAppButton](v3, "launchNowPlayingAppButton");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "addTarget:action:forControlEvents:", v3, sel_launchNowPlayingAppButtonPressed, 64);

    -[MediaControlsHeaderView _updateStyle](v3, "_updateStyle");
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = objc_msgSend(v103, "userInterfaceIdiom");

    if (v104 == 1)
    {
      v105 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v3);
      pointerInteraction = v3->_pointerInteraction;
      v3->_pointerInteraction = (UIPointerInteraction *)v105;

      -[MediaControlsHeaderView addInteraction:](v3, "addInteraction:", v3->_pointerInteraction);
    }

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)MediaControlsHeaderView;
  -[MediaControlsHeaderView dealloc](&v4, sel_dealloc);
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
  void *v12;
  void *v13;
  int64_t style;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  int64_t v24;
  int64_t v25;
  void *v26;
  char v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  void *v94;
  void *v95;
  const CGPath *v96;
  void *v97;
  void *v98;
  objc_super v99;
  CGRect v100;
  CGRect v101;

  v99.receiver = self;
  v99.super_class = (Class)MediaControlsHeaderView;
  -[MediaControlsHeaderView layoutSubviews](&v99, sel_layoutSubviews);
  -[MediaControlsHeaderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[MediaControlsHeaderView shouldUseOverrideSize](self, "shouldUseOverrideSize"))
  {
    -[MediaControlsHeaderView overrideSize](self, "overrideSize");
    v8 = v11;
  }
  -[MediaControlsHeaderView traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayScale");

  if (self->_style != 1)
  {
    v4 = v4 + 24.0;
    v6 = v6 + 0.0;
    v8 = v8 - (24.0 + 24.0);
  }
  UIRectIntegralWithScale();
  UIRectCenteredYInRect();
  -[MediaControlsHeaderView artworkView](self, "artworkView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContentMode:", 1);

  style = self->_style;
  v15 = 60.0 + 0.0;
  if (style == 1)
    v15 = 0.0;
  v16 = v8 - v15;
  if (style != 1)
    v6 = v6 + 0.0;
  v17 = -0.0;
  if (style != 1)
    v17 = 60.0;
  v18 = v4 + v17;
  -[MediaControlsHeaderView placeholderArtworkView](self, "placeholderArtworkView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "image");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "size");

  -[MediaControlsHeaderView placeholderArtworkView](self, "placeholderArtworkView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setContentMode:", 1);

  v100.origin.x = v18;
  v100.origin.y = v6;
  v100.size.width = v16;
  v100.size.height = v10;
  CGRectGetMaxX(v100);
  MPFloatRoundForScale();
  MPFloatRoundForScale();
  UIRoundToScale();
  UIRectInset();
  v23 = v22;
  v24 = -[MediaControlsHeaderView buttonType](self, "buttonType");
  v25 = self->_style;
  if (v24 && (v25 == 3 || !v25))
  {
    v18 = v18 + 0.0;
    v6 = v6 + 0.0;
    v16 = v16 - (v23 + 0.0);
  }
  if (v25 == 1)
  {
    UIRectInset();
    UIRectInset();
    UIRectInset();
  }
  -[MediaControlsHeaderView layoutTextInAvailableBounds:setFrames:](self, "layoutTextInAvailableBounds:setFrames:", 1, v18, v6, v16, v10);
  -[MediaControlsHeaderView launchNowPlayingAppButton](self, "launchNowPlayingAppButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isHidden");

  if ((v27 & 1) == 0)
  {
    -[MediaControlsHeaderView bounds](self, "bounds");
    UIRectInset();
  }
  UIRectIntegralWithScale();
  -[MediaControlsHeaderView bounds](self, "bounds");
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  -[MediaControlsHeaderView artworkContentView](self, "artworkContentView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setFrame:", v29, v31, v33, v35);

  -[MediaControlsHeaderView artworkContentView](self, "artworkContentView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bounds");
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;
  -[MediaControlsHeaderView artworkView](self, "artworkView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setFrame:", v39, v41, v43, v45);

  -[MediaControlsHeaderView artworkContentView](self, "artworkContentView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bounds");
  UIRectCenteredIntegralRect();
  v49 = v48;
  v51 = v50;
  v53 = v52;
  v55 = v54;
  -[MediaControlsHeaderView placeholderArtworkView](self, "placeholderArtworkView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setFrame:", v49, v51, v53, v55);

  -[MediaControlsHeaderView artworkContentView](self, "artworkContentView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "bounds");
  v59 = v58;
  v61 = v60;
  v63 = v62;
  v65 = v64;
  -[MediaControlsHeaderView artworkBackground](self, "artworkBackground");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setFrame:", v59, v61, v63, v65);

  -[MediaControlsHeaderView artworkContentView](self, "artworkContentView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "bounds");
  v69 = v68;
  v71 = v70;
  v73 = v72;
  v75 = v74;
  -[MediaControlsHeaderView shadow](self, "shadow");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setFrame:", v69, v71, v73, v75);

  UIRectIntegralWithScale();
  -[MediaControlsHeaderView bounds](self, "bounds");
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  v78 = v77;
  v80 = v79;
  v82 = v81;
  v84 = v83;
  -[MediaControlsHeaderView routingButton](self, "routingButton");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setFrame:", v78, v80, v82, v84);

  UIRectIntegralWithScale();
  -[MediaControlsHeaderView bounds](self, "bounds");
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  v87 = v86;
  v89 = v88;
  v91 = v90;
  v93 = v92;
  -[MediaControlsHeaderView launchNowPlayingAppButton](self, "launchNowPlayingAppButton");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "setFrame:", v87, v89, v91, v93);

  -[MediaControlsHeaderView artworkView](self, "artworkView");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "bounds");
  v96 = CGPathCreateWithRect(v101, MEMORY[0x1E0C9BAA8]);

  -[MediaControlsHeaderView shadow](self, "shadow");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "layer");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "setShadowPath:", v96);

  CGPathRelease(v96);
  -[MediaControlsHeaderView _updateStyle](self, "_updateStyle");
}

- (CGSize)layoutTextInAvailableBounds:(CGRect)a3 setFrames:(BOOL)a4
{
  double height;
  double width;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  NSString *v13;
  uint64_t v14;
  NSComparisonResult v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  int64_t style;
  void *v45;
  void *v46;
  uint64_t v47;
  double v48;
  void *v49;
  void *v50;
  uint64_t v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  int64_t v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  uint64_t v68;
  double v69;
  double v70;
  double v71;
  double v72;
  int64_t v73;
  double v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  void *v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  void *v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  void *v119;
  void *v120;
  void *v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  void *v137;
  void *v138;
  void *v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  _BOOL4 v150;
  double v151;
  double v152;
  double v153;
  void *v154;
  void *v155;
  void *v156;
  double v157;
  double v158;
  double v159;
  double v160;
  uint64_t v161;
  void *v162;
  uint64_t v163;
  _QWORD v164[3];
  CGSize result;

  v150 = a4;
  height = a3.size.height;
  width = a3.size.width;
  v164[1] = *MEMORY[0x1E0C80C00];
  -[MediaControlsHeaderView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");

  -[MediaControlsHeaderView routeLabel](self, "routeLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeThatFits:", width, height);
  v10 = v9;
  v157 = v11;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferredContentSizeCategory");
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0DC48F8];
  v15 = UIContentSizeCategoryCompareToCategory(v13, (UIContentSizeCategory)*MEMORY[0x1E0DC48F8]);

  -[MediaControlsHeaderView traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 == NSOrderedDescending)
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v14);
    v17 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v17;
  }
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4AA0], v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "fontDescriptorWithSymbolicTraits:", 2);
  v19 = objc_claimAutoreleasedReturnValue();

  v156 = (void *)v19;
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v19, 0.0);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4A88], v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "fontDescriptorWithSymbolicTraits:", 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v23, 0.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v21, v16);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", 0.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", v21);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "scaledValueForValue:compatibleWithTraitCollection:", v16, 6.0);

  -[MediaControlsHeaderView routeLabel](self, "routeLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = (void *)v20;
  objc_msgSend(v27, "setFont:", v20);

  -[MediaControlsHeaderView primaryLabel](self, "primaryLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFont:", v24);

  -[MediaControlsHeaderView placeholderLabel](self, "placeholderLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFont:", v24);

  -[MediaControlsHeaderView secondaryLabel](self, "secondaryLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setFont:", v25);

  -[MediaControlsHeaderView primaryString](self, "primaryString");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v163 = *MEMORY[0x1E0DC1138];
  v32 = v163;
  v164[0] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v164, &v163, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "boundingRectWithSize:options:attributes:context:", 1, v33, 0, 1.79769313e308, 1.79769313e308);
  v160 = v34;
  v149 = v35;

  -[MediaControlsHeaderView secondaryString](self, "secondaryString");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = v32;
  v162 = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v162, &v161, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "boundingRectWithSize:options:attributes:context:", 1, v37, 0, 1.79769313e308, 1.79769313e308);
  v39 = v38;
  v148 = v40;

  objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", v21);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "scaledValueForValue:compatibleWithTraitCollection:", v16, 20.0);
  v43 = v42;

  style = self->_style;
  if (style != 1)
  {
    -[MediaControlsHeaderView primaryString](self, "primaryString");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v49, "length"))
    {
      -[MediaControlsHeaderView secondaryString](self, "secondaryString");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "length");

      if (v51)
      {
        v48 = v157 + v43;
LABEL_11:
        v52 = v43 + v48;
LABEL_12:
        v159 = v52;
        goto LABEL_14;
      }
    }
    else
    {

    }
    -[MediaControlsHeaderView primaryString](self, "primaryString");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v66, "length"))
    {
      -[MediaControlsHeaderView secondaryString](self, "secondaryString");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v67, "length");

      if (!v68)
      {
        v52 = v157 + v43;
        goto LABEL_12;
      }
    }
    else
    {

    }
  }
  -[MediaControlsHeaderView primaryString](self, "primaryString");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v45, "length"))
  {
    -[MediaControlsHeaderView secondaryString](self, "secondaryString");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "length");

    v48 = -0.0;
    if (v47)
      v48 = v43;
    goto LABEL_11;
  }

  v159 = v43;
LABEL_14:
  if (v150)
  {
    v151 = v39;
    -[MediaControlsHeaderView traitCollection](self, "traitCollection");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "displayScale");
    UIRoundToScale();
    v143 = v54;

    v55 = width + -12.0;
    v146 = v10;
    if (style != 1)
    {
      -[MediaControlsHeaderView routeLabel](self, "routeLabel");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "_baselineOffsetFromBottom");

    }
    v57 = self->_style;
    if (v160 <= v55)
    {
      if (v57 == 1)
      {
        v63 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
        v147 = *MEMORY[0x1E0DC49E8];
        v65 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
        v64 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
        -[MediaControlsHeaderView primaryMarqueeView](self, "primaryMarqueeView", *(_QWORD *)&v143);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "setFadeEdgeInsets:", v147, v63, v65, v64);
      }
      else
      {
        v69 = *MEMORY[0x1E0DC49E8];
        v70 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
        v71 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
        v72 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
        -[MediaControlsHeaderView primaryMarqueeView](self, "primaryMarqueeView");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "setFadeEdgeInsets:", v69, v70, v71, v72);
      }
    }
    else if (v57 == 1)
    {
      UIRoundToScale();
      v58 = *MEMORY[0x1E0DC49E8];
      v59 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
      v60 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
      v61 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
      -[MediaControlsHeaderView primaryMarqueeView](self, "primaryMarqueeView");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setFadeEdgeInsets:", v58, v59, v60, v61);
    }
    else
    {
      -[MediaControlsHeaderView primaryMarqueeView](self, "primaryMarqueeView");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setFadeEdgeInsets:", 0.0, v143, 0.0, v143);
    }

    v73 = self->_style;
    if (v151 <= v55)
    {
      v84 = *MEMORY[0x1E0DC49E8];
      v85 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
      v86 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
      v87 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
      if (v73 == 1)
        -[MediaControlsHeaderView secondaryMarqueeView](self, "secondaryMarqueeView", *(_QWORD *)&v143);
      else
        -[MediaControlsHeaderView secondaryMarqueeView](self, "secondaryMarqueeView");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "setFadeEdgeInsets:", v84, v85, v86, v87);
      v88 = v151;
    }
    else
    {
      if (v73 == 1)
      {
        UIRoundToScale();
        v74 = *MEMORY[0x1E0DC49E8];
        v75 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
        v77 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
        v76 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
        -[MediaControlsHeaderView secondaryMarqueeView](self, "secondaryMarqueeView");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v78;
        v80 = v74;
        v81 = v75;
        v82 = v77;
        v83 = v76;
      }
      else
      {
        -[MediaControlsHeaderView secondaryMarqueeView](self, "secondaryMarqueeView");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v78;
        v80 = 0.0;
        v82 = 0.0;
        v81 = v143;
        v83 = v143;
      }
      objc_msgSend(v78, "setFadeEdgeInsets:", v80, v81, v82, v83, *(_QWORD *)&v143);
      v88 = v151;
    }

    -[MediaControlsHeaderView bounds](self, "bounds");
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    UIRectIntegralWithScale();
    v158 = v89;
    v152 = v90;
    v144 = v92;
    v145 = v91;
    -[MediaControlsHeaderView bounds](self, "bounds");
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    v94 = v93;
    v96 = v95;
    v98 = v97;
    v100 = v99;
    -[MediaControlsHeaderView primaryMarqueeView](self, "primaryMarqueeView");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "setFrame:", v94, v96, v98, v100);

    -[MediaControlsHeaderView bounds](self, "bounds");
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    v103 = v102;
    v105 = v104;
    v107 = v106;
    v109 = v108;
    -[MediaControlsHeaderView secondaryMarqueeView](self, "secondaryMarqueeView");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setFrame:", v103, v105, v107, v109);

    -[MediaControlsHeaderView bounds](self, "bounds");
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    v112 = v111;
    v114 = v113;
    v116 = v115;
    v118 = v117;
    -[MediaControlsHeaderView placeholderLabel](self, "placeholderLabel");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "setFrame:", v112, v114, v116, v118);

    -[MediaControlsHeaderView primaryMarqueeView](self, "primaryMarqueeView");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "setContentSize:", v160, v149);

    -[MediaControlsHeaderView secondaryMarqueeView](self, "secondaryMarqueeView");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "setContentSize:", v88, v148);

    -[MediaControlsHeaderView style](self, "style");
    UIRectIntegralWithScale();
    v123 = v122;
    v125 = v124;
    v127 = v126;
    v129 = v128;
    UIRectIntegralWithScale();
    v131 = v130;
    v133 = v132;
    v153 = v134;
    v136 = v135;
    -[MediaControlsHeaderView routeLabel](self, "routeLabel");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "setFrame:", v158, v152, v145, v144);

    -[MediaControlsHeaderView primaryLabel](self, "primaryLabel");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "setFrame:", v123, v125, v127, v129);

    -[MediaControlsHeaderView secondaryLabel](self, "secondaryLabel");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "setFrame:", v131, v133, v153, v136);

    v10 = v146;
    v39 = v88;
  }
  v140 = v160;
  if (v10 >= v160)
    v140 = v10;
  if (v140 >= v39)
    v39 = v140;

  v141 = v39;
  v142 = v159;
  result.height = v142;
  result.width = v141;
  return result;
}

- (void)_updateStyle
{
  MTVisualStylingProvider *visualStylingProvider;
  void *v4;
  MTVisualStylingProvider *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  int64_t style;
  double v17;
  double v18;
  int64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;

  visualStylingProvider = self->_visualStylingProvider;
  -[MediaControlsHeaderView secondaryLabel](self, "secondaryLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](visualStylingProvider, "stopAutomaticallyUpdatingView:", v4);

  v5 = self->_visualStylingProvider;
  -[MediaControlsHeaderView secondaryLabel](self, "secondaryLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](v5, "automaticallyUpdateView:withStyle:", v6, self->_style == 1);

  if (-[MediaControlsHeaderView marqueeEnabled](self, "marqueeEnabled"))
    v7 = (unint64_t)(self->_style - 3) < 0xFFFFFFFFFFFFFFFELL;
  else
    v7 = 0;
  -[MediaControlsHeaderView primaryMarqueeView](self, "primaryMarqueeView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMarqueeEnabled:", v7);

  -[MediaControlsHeaderView secondaryMarqueeView](self, "secondaryMarqueeView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMarqueeEnabled:", v7);

  switch(self->_style)
  {
    case 0:
    case 3:
    case 4:
    case 5:
      goto LABEL_7;
    case 1:
      -[MediaControlsHeaderView routingButton](self, "routingButton");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAlpha:", 0.0);

      -[MediaControlsHeaderView routeLabel](self, "routeLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAlpha:", 0.0);

      -[MediaControlsHeaderView placeholderArtworkView](self, "placeholderArtworkView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = 0.0;
      goto LABEL_8;
    case 2:
      -[MediaControlsHeaderView routingButton](self, "routingButton");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAlpha:", 0.0);

LABEL_7:
      -[MediaControlsHeaderView routeLabel](self, "routeLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = 1.0;
LABEL_8:
      objc_msgSend(v12, "setAlpha:", v14);

      break;
    default:
      break;
  }
  style = self->_style;
  v17 = 0.0;
  if (style == 3)
    v17 = 1.0;
  if (style)
    v18 = v17;
  else
    v18 = 1.0;
  v19 = -[MediaControlsHeaderView buttonType](self, "buttonType", v17);
  switch(v19)
  {
    case 2:
      -[MediaControlsHeaderView routingButton](self, "routingButton");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setAlpha:", v18);

      -[MediaControlsHeaderView routingButton](self, "routingButton");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setUserInteractionEnabled:", 1);

      v27 = -[MediaControlsHeaderView isRouting](self, "isRouting");
      -[MediaControlsHeaderView routingButton](self, "routingButton");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      v24 = v27;
      goto LABEL_20;
    case 1:
      -[MediaControlsHeaderView routingButton](self, "routingButton");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setAlpha:", v18);

      -[MediaControlsHeaderView routingButton](self, "routingButton");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setUserInteractionEnabled:", 1);

      -[MediaControlsHeaderView routingButton](self, "routingButton");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      v24 = 2;
      goto LABEL_20;
    case 0:
      -[MediaControlsHeaderView routingButton](self, "routingButton");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAlpha:", 0.0);

      -[MediaControlsHeaderView routingButton](self, "routingButton");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setUserInteractionEnabled:", 0);

      -[MediaControlsHeaderView routingButton](self, "routingButton");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      v24 = 0;
LABEL_20:
      objc_msgSend(v22, "setCurrentMode:", v24);

      break;
  }
  -[MediaControlsHeaderView updateArtworkStyle](self, "updateArtworkStyle");
}

- (void)updateArtworkStyle
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  id v29;

  switch(self->_style)
  {
    case 0:
    case 2:
    case 3:
    case 4:
      -[MediaControlsHeaderView artworkView](self, "artworkView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "image");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
        v5 = 1.0;
      else
        v5 = 0.0;
      -[MediaControlsHeaderView shadow](self, "shadow");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAlpha:", v5);

      -[MediaControlsHeaderView artworkView](self, "artworkView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAlpha:", 1.0);

      -[MediaControlsHeaderView placeholderArtworkView](self, "placeholderArtworkView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = 1.0;
      goto LABEL_7;
    case 1:
    case 5:
      -[MediaControlsHeaderView shadow](self, "shadow");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAlpha:", 0.0);

      -[MediaControlsHeaderView artworkView](self, "artworkView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = 0.0;
LABEL_7:
      objc_msgSend(v8, "setAlpha:", v10);

      break;
    default:
      break;
  }
  -[MediaControlsHeaderView artworkView](self, "artworkView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "size");
  v15 = v14;
  -[MediaControlsHeaderView artworkView](self, "artworkView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "image");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "size");
  v19 = v15 - v18;

  v20 = -v19;
  if (v19 >= 0.0)
    v20 = v19;
  if (v20 <= 0.00000011920929)
  {
    -[MediaControlsHeaderView artworkView](self, "artworkView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "alpha");
    v24 = v23;
    -[MediaControlsHeaderView artworkBackground](self, "artworkBackground");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setWeighting:", v24);

    -[MediaControlsHeaderView artworkView](self, "artworkView");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "alpha");
    v27 = v26;
    -[MediaControlsHeaderView shadow](self, "shadow");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAlpha:", v27);

  }
  else
  {
    -[MediaControlsHeaderView artworkBackground](self, "artworkBackground");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWeighting:", 0.0);

    -[MediaControlsHeaderView shadow](self, "shadow");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setAlpha:", 0.0);
  }

}

- (void)setTransitioning:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  if (self->_transitioning != a3)
  {
    self->_transitioning = a3;
    if (self->_style == 1)
    {
      v4 = !a3;
      -[MediaControlsHeaderView shadow](self, "shadow");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setHidden:", v4);

      v6 = !self->_transitioning;
      -[MediaControlsHeaderView artworkView](self, "artworkView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHidden:", v6);

      v8 = !self->_transitioning;
      -[MediaControlsHeaderView placeholderArtworkView](self, "placeholderArtworkView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHidden:", v8);

      v10 = !self->_transitioning;
      -[MediaControlsHeaderView routingButton](self, "routingButton");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v11;
      v12 = v10;
    }
    else
    {
      -[MediaControlsHeaderView shadow](self, "shadow");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHidden:", 0);

      -[MediaControlsHeaderView artworkView](self, "artworkView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setHidden:", 0);

      -[MediaControlsHeaderView placeholderArtworkView](self, "placeholderArtworkView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setHidden:", 0);

      -[MediaControlsHeaderView routingButton](self, "routingButton");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v11;
      v12 = 0;
    }
    objc_msgSend(v11, "setHidden:", v12);

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  CGSize result;

  width = a3.width;
  -[MediaControlsHeaderView layoutTextInAvailableBounds:setFrames:](self, "layoutTextInAvailableBounds:setFrames:", 0, 0.0, 0.0, a3.width, a3.height);
  if (v4 < 60.0)
    v4 = 60.0;
  v5 = width;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MediaControlsHeaderView;
  -[MediaControlsHeaderView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[MediaControlsHeaderView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsHeaderView setMarqueeEnabled:](self, "setMarqueeEnabled:", v3 != 0);

  -[MediaControlsHeaderView _updateStyle](self, "_updateStyle");
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MediaControlsHeaderView;
  -[MediaControlsHeaderView tintColorDidChange](&v7, sel_tintColorDidChange);
  if (!self->_visualStylingProvider)
  {
    -[MediaControlsHeaderView tintColor](self, "tintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsHeaderView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "secondaryColorForInterfaceStyle:", objc_msgSend(v4, "userInterfaceStyle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsHeaderView routeLabel](self, "routeLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v5);

  }
  -[MediaControlsHeaderView _updateStyle](self, "_updateStyle");
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[MediaControlsHeaderView _updateStyle](self, "_updateStyle");
    -[MediaControlsHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setButtonType:(int64_t)a3
{
  if (self->_buttonType != a3)
  {
    self->_buttonType = a3;
    -[MediaControlsHeaderView _updateStyle](self, "_updateStyle");
    -[MediaControlsHeaderView setNeedsLayout](self, "setNeedsLayout");
    -[MediaControlsHeaderView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setPrimaryString:(id)a3
{
  NSString *v5;
  NSString *primaryString;
  void *v7;
  NSString *v8;

  v5 = (NSString *)a3;
  if (self->_primaryString != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_primaryString, a3);
    primaryString = self->_primaryString;
    -[MediaControlsHeaderView primaryLabel](self, "primaryLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", primaryString);

    -[MediaControlsHeaderView _updateRTL](self, "_updateRTL");
    -[MediaControlsHeaderView setNeedsLayout](self, "setNeedsLayout");
    v5 = v8;
  }

}

- (void)setSecondaryString:(id)a3
{
  NSString *v5;
  NSString *secondaryString;
  void *v7;
  NSString *v8;

  v5 = (NSString *)a3;
  if (self->_secondaryString != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_secondaryString, a3);
    secondaryString = self->_secondaryString;
    -[MediaControlsHeaderView secondaryLabel](self, "secondaryLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", secondaryString);

    -[MediaControlsHeaderView _updateRTL](self, "_updateRTL");
    -[MediaControlsHeaderView setNeedsLayout](self, "setNeedsLayout");
    v5 = v8;
  }

}

- (void)setPlaceholderString:(id)a3
{
  NSString *v5;
  NSString *placeholderString;
  void *v7;
  NSString *v8;

  v5 = (NSString *)a3;
  if (self->_placeholderString != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_placeholderString, a3);
    placeholderString = self->_placeholderString;
    -[MediaControlsHeaderView placeholderLabel](self, "placeholderLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", placeholderString);

    -[MediaControlsHeaderView setNeedsLayout](self, "setNeedsLayout");
    v5 = v8;
  }

}

- (void)setShowPlaceholderString:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  _BOOL8 showPlaceholderString;
  void *v7;
  _BOOL8 v8;
  void *v9;
  _BOOL8 v10;
  id v11;

  if (self->_showPlaceholderString != a3)
  {
    self->_showPlaceholderString = a3;
    v4 = !a3;
    -[MediaControlsHeaderView placeholderLabel](self, "placeholderLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", v4);

    showPlaceholderString = self->_showPlaceholderString;
    -[MediaControlsHeaderView primaryLabel](self, "primaryLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", showPlaceholderString);

    v8 = self->_showPlaceholderString;
    -[MediaControlsHeaderView secondaryLabel](self, "secondaryLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", v8);

    v10 = self->_showPlaceholderString;
    -[MediaControlsHeaderView routeLabel](self, "routeLabel");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", v10);

  }
}

- (void)setMarqueeEnabled:(BOOL)a3
{
  _QWORD v3[5];

  if (self->_marqueeEnabled != a3)
  {
    self->_marqueeEnabled = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __45__MediaControlsHeaderView_setMarqueeEnabled___block_invoke;
    v3[3] = &unk_1E5818C88;
    v3[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
  }
}

uint64_t __45__MediaControlsHeaderView_setMarqueeEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStyle");
}

- (void)setOverrideSize:(CGSize)a3
{
  double width;
  double v5;

  width = a3.width;
  self->_overrideSize = a3;
  -[MediaControlsHeaderView layoutTextInAvailableBounds:setFrames:](self, "layoutTextInAvailableBounds:setFrames:", 0, 0.0, 0.0, a3.width, a3.height);
  if (v5 <= width + -12.0)
  {
    -[MediaControlsHeaderView setShouldUseOverrideSize:](self, "setShouldUseOverrideSize:", 0);
  }
  else
  {
    -[MediaControlsHeaderView setShouldUseOverrideSize:](self, "setShouldUseOverrideSize:", 1);
    -[MediaControlsHeaderView setNeedsLayout](self, "setNeedsLayout");
    -[MediaControlsHeaderView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)clearOverrideSize
{
  self->_overrideSize = (CGSize)*MEMORY[0x1E0C9D820];
  -[MediaControlsHeaderView setShouldUseOverrideSize:](self, "setShouldUseOverrideSize:", 0);
}

- (void)setRouting:(BOOL)a3
{
  if (self->_routing != a3)
  {
    self->_routing = a3;
    -[MediaControlsHeaderView _updateStyle](self, "_updateStyle");
  }
}

- (void)setVisualStylingProvider:(id)a3
{
  MTVisualStylingProvider *v5;
  MTVisualStylingProvider **p_visualStylingProvider;
  MTVisualStylingProvider *visualStylingProvider;
  void *v8;
  void *v9;
  MTVisualStylingProvider *v10;
  void *v11;
  MTVisualStylingProvider *v12;
  void *v13;
  MTVisualStylingProvider *v14;
  void *v15;
  MTVisualStylingProvider *v16;
  void *v17;
  MTVisualStylingProvider *v18;
  void *v19;
  void *v20;
  MTVisualStylingProvider *v21;
  void *v22;
  MTVisualStylingProvider *v23;
  void *v24;
  MTVisualStylingProvider *v25;
  void *v26;
  MTVisualStylingProvider *v27;
  void *v28;
  MTVisualStylingProvider *v29;

  v5 = (MTVisualStylingProvider *)a3;
  p_visualStylingProvider = &self->_visualStylingProvider;
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider != v5)
  {
    v29 = v5;
    -[MediaControlsHeaderView routeLabel](self, "routeLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](visualStylingProvider, "stopAutomaticallyUpdatingView:", v9);

    v10 = *p_visualStylingProvider;
    -[MediaControlsHeaderView primaryLabel](self, "primaryLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](v10, "stopAutomaticallyUpdatingView:", v11);

    v12 = *p_visualStylingProvider;
    -[MediaControlsHeaderView secondaryLabel](self, "secondaryLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](v12, "stopAutomaticallyUpdatingView:", v13);

    v14 = *p_visualStylingProvider;
    -[MediaControlsHeaderView placeholderLabel](self, "placeholderLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](v14, "stopAutomaticallyUpdatingView:", v15);

    v16 = *p_visualStylingProvider;
    -[MediaControlsHeaderView placeholderArtworkView](self, "placeholderArtworkView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](v16, "stopAutomaticallyUpdatingView:", v17);

    objc_storeStrong((id *)&self->_visualStylingProvider, a3);
    v18 = *p_visualStylingProvider;
    -[MediaControlsHeaderView routeLabel](self, "routeLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "titleLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](v18, "automaticallyUpdateView:withStyle:", v20, 1);

    v21 = *p_visualStylingProvider;
    -[MediaControlsHeaderView primaryLabel](self, "primaryLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](v21, "automaticallyUpdateView:withStyle:", v22, 0);

    v23 = *p_visualStylingProvider;
    -[MediaControlsHeaderView secondaryLabel](self, "secondaryLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](v23, "automaticallyUpdateView:withStyle:", v24, 1);

    v25 = *p_visualStylingProvider;
    -[MediaControlsHeaderView placeholderLabel](self, "placeholderLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](v25, "automaticallyUpdateView:withStyle:", v26, 0);

    v27 = *p_visualStylingProvider;
    -[MediaControlsHeaderView placeholderArtworkView](self, "placeholderArtworkView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](v27, "automaticallyUpdateView:withStyle:", v28, 0);

    v5 = v29;
  }

}

- (void)_updateRTL
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  -[MediaControlsHeaderView primaryLabel](self, "primaryLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isNaturallyRTL");

  -[MediaControlsHeaderView primaryMarqueeView](self, "primaryMarqueeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAnimationDirection:", v5);

  -[MediaControlsHeaderView primaryMarqueeView](self, "primaryMarqueeView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
    v9 = 4;
  else
    v9 = 3;
  objc_msgSend(v7, "setSemanticContentAttribute:", v9);

  -[MediaControlsHeaderView secondaryLabel](self, "secondaryLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "_isNaturallyRTL");

  -[MediaControlsHeaderView secondaryMarqueeView](self, "secondaryMarqueeView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAnimationDirection:", v12);

  -[MediaControlsHeaderView secondaryMarqueeView](self, "secondaryMarqueeView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14;
  if (v12)
    v15 = 4;
  else
    v15 = 3;
  objc_msgSend(v14, "setSemanticContentAttribute:", v15);

}

- (void)launchNowPlayingAppButtonPressed
{
  -[UIPointerInteraction invalidate](self->_pointerInteraction, "invalidate");
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  _BOOL4 v20;
  void *v21;
  CGPoint v23;
  CGRect v24;

  v6 = a4;
  -[MediaControlsHeaderView launchNowPlayingAppButton](self, "launchNowPlayingAppButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isHidden") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[MediaControlsHeaderView artworkContentView](self, "artworkContentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v6, "location");
    v23.x = v18;
    v23.y = v19;
    v24.origin.x = v11;
    v24.origin.y = v13;
    v24.size.width = v15;
    v24.size.height = v17;
    v20 = CGRectContainsPoint(v24, v23);

    if (!v20)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v21 = (void *)MEMORY[0x1E0DC3B28];
    -[MediaControlsHeaderView artworkContentView](self, "artworkContentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    objc_msgSend(v21, "regionWithRect:identifier:", CFSTR("Artwork"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  return v8;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = objc_alloc(MEMORY[0x1E0DC3D90]);
  -[MediaControlsHeaderView artworkContentView](self, "artworkContentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithView:", v6);

  objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (MPCPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (UIImageView)artworkView
{
  return self->_artworkView;
}

- (void)setArtworkView:(id)a3
{
  objc_storeStrong((id *)&self->_artworkView, a3);
}

- (UIImageView)placeholderArtworkView
{
  return self->_placeholderArtworkView;
}

- (void)setPlaceholderArtworkView:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderArtworkView, a3);
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (int64_t)style
{
  return self->_style;
}

- (MPRouteLabel)routeLabel
{
  return self->_routeLabel;
}

- (void)setRouteLabel:(id)a3
{
  objc_storeStrong((id *)&self->_routeLabel, a3);
}

- (NSString)primaryString
{
  return self->_primaryString;
}

- (NSString)secondaryString
{
  return self->_secondaryString;
}

- (NSString)placeholderString
{
  return self->_placeholderString;
}

- (BOOL)showPlaceholderString
{
  return self->_showPlaceholderString;
}

- (MediaControlsRoutingButtonView)routingButton
{
  return self->_routingButton;
}

- (void)setRoutingButton:(id)a3
{
  objc_storeStrong((id *)&self->_routingButton, a3);
}

- (MPButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
  objc_storeStrong((id *)&self->_doneButton, a3);
}

- (UIButton)launchNowPlayingAppButton
{
  return self->_launchNowPlayingAppButton;
}

- (void)setLaunchNowPlayingAppButton:(id)a3
{
  objc_storeStrong((id *)&self->_launchNowPlayingAppButton, a3);
}

- (BOOL)marqueeEnabled
{
  return self->_marqueeEnabled;
}

- (int64_t)buttonType
{
  return self->_buttonType;
}

- (BOOL)isRouting
{
  return self->_routing;
}

- (BOOL)scalePlaceholderImage
{
  return self->_scalePlaceholderImage;
}

- (void)setScalePlaceholderImage:(BOOL)a3
{
  self->_scalePlaceholderImage = a3;
}

- (MTVisualStylingProvider)visualStylingProvider
{
  return self->_visualStylingProvider;
}

- (CGSize)overrideSize
{
  double width;
  double height;
  CGSize result;

  width = self->_overrideSize.width;
  height = self->_overrideSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_pointerInteraction, a3);
}

- (MTMaterialView)artworkBackground
{
  return self->_artworkBackground;
}

- (void)setArtworkBackground:(id)a3
{
  objc_storeStrong((id *)&self->_artworkBackground, a3);
}

- (UIView)shadow
{
  return self->_shadow;
}

- (void)setShadow:(id)a3
{
  objc_storeStrong((id *)&self->_shadow, a3);
}

- (MPUMarqueeView)primaryMarqueeView
{
  return self->_primaryMarqueeView;
}

- (void)setPrimaryMarqueeView:(id)a3
{
  objc_storeStrong((id *)&self->_primaryMarqueeView, a3);
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLabel, a3);
}

- (MPUMarqueeView)secondaryMarqueeView
{
  return self->_secondaryMarqueeView;
}

- (void)setSecondaryMarqueeView:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryMarqueeView, a3);
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabel, a3);
}

- (UILabel)placeholderLabel
{
  return self->_placeholderLabel;
}

- (void)setPlaceholderLabel:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderLabel, a3);
}

- (BOOL)shouldUseOverrideSize
{
  return self->_shouldUseOverrideSize;
}

- (void)setShouldUseOverrideSize:(BOOL)a3
{
  self->_shouldUseOverrideSize = a3;
}

- (UIView)artworkContentView
{
  return self->_artworkContentView;
}

- (void)setArtworkContentView:(id)a3
{
  objc_storeStrong((id *)&self->_artworkContentView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkContentView, 0);
  objc_storeStrong((id *)&self->_placeholderLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryMarqueeView, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryMarqueeView, 0);
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_artworkBackground, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_launchNowPlayingAppButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_routingButton, 0);
  objc_storeStrong((id *)&self->_placeholderString, 0);
  objc_storeStrong((id *)&self->_secondaryString, 0);
  objc_storeStrong((id *)&self->_primaryString, 0);
  objc_storeStrong((id *)&self->_routeLabel, 0);
  objc_storeStrong((id *)&self->_placeholderArtworkView, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
}

@end
