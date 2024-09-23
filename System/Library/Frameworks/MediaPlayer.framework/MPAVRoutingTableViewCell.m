@implementation MPAVRoutingTableViewCell

- (MPAVRoutingTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MPAVRoutingTableViewCell *v4;
  id v5;
  void *v6;
  void *v7;
  UIImageView *v8;
  UIImageView *iconImageView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  UIImageView *chevronImageView;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UILabel *v20;
  UILabel *routeNameLabel;
  void *v22;
  void *v23;
  void *v24;
  UILabel *v25;
  UILabel *subtitleTextLabel;
  void *v27;
  void *v28;
  void *v29;
  MPAVRoutingTableViewCellSubtitleTextState *v30;
  MPAVRoutingTableViewCellSubtitleTextState *subtitleTextState;
  id v32;
  uint64_t v33;
  UIImageView *checkmarkImageView;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  UIView *expandTargetView;
  void *v43;
  objc_super v45;

  v45.receiver = self;
  v45.super_class = (Class)MPAVRoutingTableViewCell;
  v4 = -[MPAVClippingTableViewCell initWithStyle:reuseIdentifier:](&v45, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v6);

    -[MPAVRoutingTableViewCell setSelectedBackgroundView:](v4, "setSelectedBackgroundView:", v5);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAVRoutingTableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v7);

    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    iconImageView = v4->_iconImageView;
    v4->_iconImageView = v8;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v4->_iconImageView, "setBackgroundColor:", v10);

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 3, 17.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v4->_iconImageView, "setPreferredSymbolConfiguration:", v11);

    -[MPAVRoutingTableViewCell contentView](v4, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v4->_iconImageView);

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v4->_iconImageView, "setTintColor:", v13);

    v14 = objc_opt_new();
    chevronImageView = v4->_chevronImageView;
    v4->_chevronImageView = (UIImageView *)v14;

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("chevron.forward"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v4->_chevronImageView, "setImage:", v16);

    -[UIImageView setContentMode:](v4->_chevronImageView, "setContentMode:", 4);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v4->_chevronImageView, "setTintColor:", v17);

    -[UIImageView setAlpha:](v4->_chevronImageView, "setAlpha:", 0.7);
    -[MPAVRoutingTableViewCell contentView](v4, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v4->_chevronImageView);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v4, sel__handleContentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);
    v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    routeNameLabel = v4->_routeNameLabel;
    v4->_routeNameLabel = v20;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setHighlightedTextColor:](v4->_routeNameLabel, "setHighlightedTextColor:", v22);

    -[UILabel setTextAlignment:](v4->_routeNameLabel, "setTextAlignment:", 4);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_routeNameLabel, "setTextColor:", v23);

    -[UILabel _setWantsUnderlineForAccessibilityButtonShapesEnabled:](v4->_routeNameLabel, "_setWantsUnderlineForAccessibilityButtonShapesEnabled:", 1);
    -[MPAVRoutingTableViewCell contentView](v4, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v4->_routeNameLabel);

    v25 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subtitleTextLabel = v4->_subtitleTextLabel;
    v4->_subtitleTextLabel = v25;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setHighlightedTextColor:](v4->_subtitleTextLabel, "setHighlightedTextColor:", v27);

    -[UILabel setTextAlignment:](v4->_subtitleTextLabel, "setTextAlignment:", 4);
    objc_msgSend(MEMORY[0x1E0DC3658], "darkGrayColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_subtitleTextLabel, "setTextColor:", v28);

    -[MPAVRoutingTableViewCell contentView](v4, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSubview:", v4->_subtitleTextLabel);

    -[UILabel setHidden:](v4->_subtitleTextLabel, "setHidden:", 1);
    v30 = objc_alloc_init(MPAVRoutingTableViewCellSubtitleTextState);
    subtitleTextState = v4->_subtitleTextState;
    v4->_subtitleTextState = v30;

    v32 = objc_alloc(MEMORY[0x1E0DC3890]);
    v33 = objc_msgSend(v32, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    checkmarkImageView = v4->_checkmarkImageView;
    v4->_checkmarkImageView = (UIImageView *)v33;

    objc_msgSend(MEMORY[0x1E0DC37F0], "defaultFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A88]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "fontDescriptorWithSymbolicTraits:", 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC37E8], "fontWithDescriptor:size:", v36, 0.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v37, 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v4->_checkmarkImageView, "setPreferredSymbolConfiguration:", v38);

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v37, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v4->_chevronImageView, "setPreferredSymbolConfiguration:", v39);

    v4->_subtitleViewAlpha = 1.0;
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v4, sel_didTapToExpand);
    v41 = objc_opt_new();
    expandTargetView = v4->_expandTargetView;
    v4->_expandTargetView = (UIView *)v41;

    -[UIView addGestureRecognizer:](v4->_expandTargetView, "addGestureRecognizer:", v40);
    -[MPAVRoutingTableViewCell contentView](v4, "contentView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addSubview:", v4->_expandTargetView);

  }
  return v4;
}

- (void)dealloc
{
  NSTimer *subtitleTextUpdateTimer;
  objc_super v4;

  -[NSTimer invalidate](self->_subtitleTextUpdateTimer, "invalidate");
  subtitleTextUpdateTimer = self->_subtitleTextUpdateTimer;
  self->_subtitleTextUpdateTimer = 0;

  v4.receiver = self;
  v4.super_class = (Class)MPAVRoutingTableViewCell;
  -[MPAVClippingTableViewCell dealloc](&v4, sel_dealloc);
}

- (void)prepareForReuse
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MPAVRoutingTableViewCell;
  -[MPAVClippingTableViewCell prepareForReuse](&v2, sel_prepareForReuse);
}

- (void)updateForEndpoint:(id)a3 routeItem:(id)a4 inferLocalizedModelName:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  int v21;
  MPAVRoutingTableViewCell *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v5 = a5;
  v25 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(v7, "leader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(v7, "routes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  v12 = os_log_create("com.apple.amp.mediaplayer", "Routing");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v21 = 134218242;
    v22 = self;
    v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_INFO, "routingTableView %p updateForEndpoint: routeUpdate: %@", (uint8_t *)&v21, 0x16u);
  }

  if (v5 && (objc_msgSend(v10, "routeSubtype") == 1 || objc_msgSend(v10, "routeSubtype") == 3))
  {
    v13 = MSVCopyLocalizedModelName();
  }
  else
  {
    objc_msgSend(v7, "localizedTitle");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;
  -[UILabel setText:](self->_routeNameLabel, "setText:", v13);
  objc_msgSend(v7, "image");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 || !v10)
  {
    objc_msgSend(v7, "image");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v7, "type") == 1)
    {
      objc_msgSend(v7, "routes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPAVRoutingTableViewCell _iconImageForRoutes:](self, "_iconImageForRoutes:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](self->_iconImageView, "setImage:", v17);

      goto LABEL_18;
    }
    -[MPAVRoutingTableViewCell _iconImageForRoute:](self, "_iconImageForRoute:", v10);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v18;
  -[UIImageView setImage:](self->_iconImageView, "setImage:", v18);
LABEL_18:

  -[UIImageView image](self->_iconImageView, "image");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "isSymbolImage"))
    v20 = 4;
  else
    v20 = 1;
  -[UIImageView setContentMode:](self->_iconImageView, "setContentMode:", v20);

  -[UIImageView setHidden:](self->_chevronImageView, "setHidden:", objc_msgSend(v7, "type") != 1);
  -[MPAVRoutingTableViewCell _updateSubtitleTextLabelForRouteItem:](self, "_updateSubtitleTextLabelForRouteItem:", v7);
  -[MPAVRoutingTableViewCell setEnabled:](self, "setEnabled:", objc_msgSend(v7, "enabled"));
  -[MPAVRoutingTableViewCell setNeedsLayout](self, "setNeedsLayout");

}

- (id)titleView
{
  return self->_routeNameLabel;
}

- (id)subtitleView
{
  return self->_subtitleTextLabel;
}

- (id)volumeView
{
  return self->_volumeSlider;
}

- (id)iconView
{
  return self->_iconImageView;
}

- (void)setMirroringStyle:(unint64_t)a3
{
  self->_mirroringStyle = a3;
}

- (void)setPendingSelection:(BOOL)a3
{
  UIActivityIndicatorView *spinnerView;
  UIActivityIndicatorView *v5;
  UIActivityIndicatorView *v6;

  if (self->_pendingSelection != a3)
  {
    self->_pendingSelection = a3;
    spinnerView = self->_spinnerView;
    if (spinnerView)
    {
      if (a3)
      {
LABEL_4:
        -[UIActivityIndicatorView startAnimating](spinnerView, "startAnimating");
LABEL_7:
        -[MPAVRoutingTableViewCell _updateAccessory](self, "_updateAccessory");
        return;
      }
    }
    else
    {
      v5 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      v6 = self->_spinnerView;
      self->_spinnerView = v5;

      -[MPAVRoutingTableViewCell _updateSpinnerColor](self, "_updateSpinnerColor");
      spinnerView = self->_spinnerView;
      if (self->_pendingSelection)
        goto LABEL_4;
    }
    -[UIActivityIndicatorView stopAnimating](spinnerView, "stopAnimating");
    goto LABEL_7;
  }
}

- (void)setUseSmartAudioCheckmarkStyle:(BOOL)a3
{
  id v4;
  UIImageView *v5;
  UIImageView *smartAudioImageView;
  void *v7;

  if (self->_useSmartAudioCheckmarkStyle != a3)
  {
    self->_useSmartAudioCheckmarkStyle = a3;
    if (a3 && !self->_smartAudioImageView)
    {
      v4 = objc_alloc(MEMORY[0x1E0DC3890]);
      v5 = (UIImageView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      smartAudioImageView = self->_smartAudioImageView;
      self->_smartAudioImageView = v5;

      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setPreferredSymbolConfiguration:](self->_smartAudioImageView, "setPreferredSymbolConfiguration:", v7);

    }
    -[MPAVRoutingTableViewCell _updateAccessory](self, "_updateAccessory");
  }
}

- (void)setVolumeSlider:(id)a3
{
  MPVolumeSlider *v5;
  MPVolumeSlider **p_volumeSlider;
  MPVolumeSlider *volumeSlider;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MPVolumeSlider *v13;
  void *v14;
  MPVolumeSlider *v15;

  v5 = (MPVolumeSlider *)a3;
  p_volumeSlider = &self->_volumeSlider;
  volumeSlider = self->_volumeSlider;
  v15 = v5;
  if (volumeSlider != v5)
  {
    -[MPVolumeSlider superview](volumeSlider, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAVRoutingTableViewCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
      -[MPVolumeSlider removeFromSuperview](*p_volumeSlider, "removeFromSuperview");
    objc_storeStrong((id *)&self->_volumeSlider, a3);
    -[MPAVRoutingTableViewCell contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", *p_volumeSlider);

    -[MPVolumeSlider setHidden:](*p_volumeSlider, "setHidden:", !self->_showingVolumeSlider);
    -[MPAVRoutingTableViewCell setNeedsLayout](self, "setNeedsLayout");
    goto LABEL_7;
  }
  -[MPVolumeSlider superview](v5, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVRoutingTableViewCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v15;
  if (v11 != v12)
  {
    -[MPAVRoutingTableViewCell contentView](self, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v15);

LABEL_7:
    v13 = v15;
  }

}

- (void)setShowingVolumeSlider:(BOOL)a3
{
  if (self->_showingVolumeSlider != a3)
  {
    self->_showingVolumeSlider = a3;
    -[MPVolumeSlider setHidden:](self->_volumeSlider, "setHidden:", !a3);
    -[MPAVRoutingTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat Width;
  double v39;
  double v40;
  double v41;
  BOOL v42;
  double v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  uint64_t v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  double v79;
  double v80;
  void *v81;
  double v82;
  double v83;
  void *v84;
  double v85;
  CGFloat v86;
  double v87;
  CGFloat v88;
  double v89;
  CGFloat v90;
  double v91;
  CGFloat v92;
  double v93;
  CGFloat v94;
  double v95;
  CGFloat v96;
  double v97;
  CGFloat v98;
  double v99;
  CGFloat v100;
  CGFloat v101;
  CGFloat v102;
  CGFloat v103;
  CGFloat v104;
  CGFloat v105;
  CGFloat v106;
  double v107;
  double v108;
  double v109;
  double v110;
  CGFloat v111;
  CGFloat v112;
  CGFloat v113;
  CGFloat v114;
  CGFloat v115;
  CGFloat v116;
  CGFloat v117;
  double v118;
  CGFloat v119;
  CGFloat v120;
  CGFloat v121;
  CGFloat v122;
  double v123;
  CGFloat v124;
  CGFloat v125;
  double v126;
  CGFloat v127;
  objc_super v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;

  -[MPAVRoutingTableViewCell _updateAccessory](self, "_updateAccessory");
  v128.receiver = self;
  v128.super_class = (Class)MPAVRoutingTableViewCell;
  -[MPAVClippingTableViewCell layoutSubviews](&v128, sel_layoutSubviews);
  -[MPAVRoutingTableViewCell accessoryView](self, "accessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[MPAVRoutingTableViewCell _defaultAccessoryView](self, "_defaultAccessoryView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "setAlpha:", 1.0);
  -[MPAVRoutingTableViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v121 = v6;
  v122 = v5;
  v120 = v7;
  v119 = v8;

  -[MPAVRoutingTableViewCell traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayScale");

  UIRoundToScale();
  UIRoundToScale();
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v14 = v12;
  v127 = v13;
  v125 = *MEMORY[0x1E0C9D648];
  v126 = v11;
  v15 = *MEMORY[0x1E0C9D648];
  if (v3)
  {
    v16 = v10;
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    objc_msgSend(v3, "frame");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    -[MPAVRoutingTableViewCell bounds](self, "bounds");
    v30 = MPRectByRemovingUserInterfaceLayoutDirectionInRect(v19, v21, v23, v25, v26, v27, v28, v29);
    v32 = v31;
    v13 = v33;
    v14 = v34;
    -[MPAVRoutingTableViewCell bounds](self, "bounds");
    v37 = v35 + v36;
    v129.origin.x = v30;
    v11 = v32;
    v129.origin.y = v32;
    v129.size.width = v13;
    v129.size.height = v14;
    Width = CGRectGetWidth(v129);
    v12 = v17;
    v15 = v37 - Width - v16;
  }
  v124 = v12;
  if (self->_pendingSelection)
  {
    -[UIImageView frame](self->_smartAudioImageView, "frame");
    v39 = CGRectGetWidth(v130);
    -[UIImageView frame](self->_checkmarkImageView, "frame");
    v40 = CGRectGetWidth(v131);
    if (v39 < v40)
      v39 = v40;
    objc_msgSend(v3, "frame");
    v41 = v15 + (v39 - CGRectGetWidth(v132)) * -0.5;
    if (v41 >= 0.0)
      v15 = v41;
    else
      v15 = 0.0;
  }
  v116 = v13;
  v117 = v14;
  v115 = v11;
  if (-[MPAVRoutingTableViewCell accessoryType](self, "accessoryType") == 3)
  {
    v42 = -[MPAVRoutingTableViewCell useSmartAudioCheckmarkStyle](self, "useSmartAudioCheckmarkStyle");
    v43 = v15 + -3.0;
    if (v15 + -3.0 < 0.0)
      v43 = 0.0;
    if (v42)
      v44 = v15;
    else
      v44 = v43;
  }
  else
  {
    v44 = v15;
  }
  UIRoundToScale();
  UIRectInset();
  UIRectCenteredYInRect();
  v113 = v46;
  v114 = v45;
  v48 = v47;
  v112 = v49;
  UIRoundToScale();
  UIRoundToScale();
  v111 = v48;
  UIRectInset();
  v51 = v50;
  v53 = v52;
  v55 = v54;
  v118 = v56;
  if (-[MPAVRoutingTableViewCell isShowingVolumeSlider](self, "isShowingVolumeSlider"))
    v57 = 1;
  else
    v57 = -[MPAVRoutingTableViewCellSubtitleTextState hasVisibleTextTypeToShow](self->_subtitleTextState, "hasVisibleTextTypeToShow") ^ 1;
  -[UILabel setHidden:](self->_subtitleTextLabel, "setHidden:", v57);
  -[UILabel sizeThatFits:](self->_routeNameLabel, "sizeThatFits:", v53, v55);
  v123 = v58;
  -[MPAVRoutingTableViewCell traitCollection](self, "traitCollection");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4A88], v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_routeNameLabel, "setFont:", v60);

  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4A98], v59);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_subtitleTextLabel, "setFont:", v61);

  -[UILabel _baselineOffsetFromBottom](self->_routeNameLabel, "_baselineOffsetFromBottom");
  v63 = v62;
  v106 = v53;
  if ((-[UILabel isHidden](self->_subtitleTextLabel, "isHidden") & 1) != 0)
  {
    if (-[MPAVRoutingTableViewCell isShowingVolumeSlider](self, "isShowingVolumeSlider"))
    {
      v108 = v118 + -1.0;
      v109 = v53 + -3.0;
      v110 = v55 - (v123 + 0.0);
      -[MPAVRoutingTableViewCell traitCollection](self, "traitCollection");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "displayScale");
      UIRoundToScale();
      v66 = v123 + v65;

      v67 = (v55 - v66) * 0.5;
      if (v67 < 0.0)
        v67 = 0.0;
      v107 = v123 + v51 + v67 - v63;
      -[MPAVRoutingTableViewCell bounds](self, "bounds", v51 + v67);
    }
    else
    {
      v109 = v127;
      v110 = v124;
      v107 = v126;
      v108 = v125;
      v123 = v55;
      -[MPAVRoutingTableViewCell bounds](self, "bounds", *(_QWORD *)&v51);
    }
  }
  else
  {
    -[UILabel sizeThatFits:](self->_subtitleTextLabel, "sizeThatFits:", v53, v55);
    v109 = v127;
    v110 = v124;
    v73 = (v55 - (v123 + v72)) * 0.5;
    if (v73 < 0.0)
      v73 = 0.0;
    v107 = v126;
    v108 = v125;
    v124 = v72;
    v127 = v53;
    v125 = v118;
    v126 = v123 + v51 + v73 + 4.0 - v63;
    -[MPAVRoutingTableViewCell bounds](self, "bounds", v51 + v73);
  }
  objc_msgSend(v3, "setFrame:", MPRectByApplyingUserInterfaceLayoutDirectionInRect(v44, v115, v116, v117, v68, v69, v70, v71));
  objc_msgSend(v3, "center");
  v75 = v74;
  objc_msgSend(v3, "frame");
  -[MPAVRoutingTableViewCell bounds](self, "bounds");
  UIRectCenteredYInRect();
  objc_msgSend(v3, "setFrame:");
  objc_msgSend(v3, "center");
  v77 = v75 - v76;
  objc_msgSend(v3, "maskView");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "center");
  v80 = v79;
  objc_msgSend(v3, "maskView");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "center");
  v83 = v77 + v82;
  objc_msgSend(v3, "maskView");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setCenter:", v80, v83);

  UIRectInset();
  v86 = v85;
  v88 = v87;
  v90 = v89;
  v92 = v91;
  -[UIImageView setFrame:](self->_iconImageView, "setFrame:", MPRectByApplyingUserInterfaceLayoutDirectionInRect(v114, v113, v111, v112, v122, v121, v120, v119));
  -[UIImageView setFrame:](self->_chevronImageView, "setFrame:", MPRectByApplyingUserInterfaceLayoutDirectionInRect(v86, v88, v90, v92, v122, v121, v120, v119));
  -[UIImageView frame](self->_iconImageView, "frame");
  v94 = v93;
  v96 = v95;
  v98 = v97;
  v100 = v99;
  -[UIImageView frame](self->_chevronImageView, "frame");
  v135.origin.x = v101;
  v135.origin.y = v102;
  v135.size.width = v103;
  v135.size.height = v104;
  v133.origin.x = v94;
  v133.origin.y = v96;
  v133.size.width = v98;
  v133.size.height = v100;
  v134 = CGRectUnion(v133, v135);
  -[UIView setFrame:](self->_expandTargetView, "setFrame:", v134.origin.x, v134.origin.y, v134.size.width, v134.size.height);
  -[UILabel setFrame:](self->_routeNameLabel, "setFrame:", MPRectByApplyingUserInterfaceLayoutDirectionInRect(v118, v105, v106, v123, v122, v121, v120, v119));
  -[UILabel setFrame:](self->_subtitleTextLabel, "setFrame:", MPRectByApplyingUserInterfaceLayoutDirectionInRect(v125, v126, v127, v124, v122, v121, v120, v119));
  -[MPVolumeSlider setFrame:](self->_volumeSlider, "setFrame:", MPRectByApplyingUserInterfaceLayoutDirectionInRect(v108, v107, v109, v110, v122, v121, v120, v119));

}

- (void)setTintColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  int v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPAVRoutingTableViewCell;
  -[MPAVRoutingTableViewCell setTintColor:](&v11, sel_setTintColor_, v4);
  if (v4)
  {
    -[UILabel setTextColor:](self->_routeNameLabel, "setTextColor:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_routeNameLabel, "setTextColor:", v5);

  }
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = 0;
LABEL_8:
    -[MPAVRoutingTableViewCell setIconStyle:](self, "setIconStyle:", v8);
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "isEqual:", v9);

  if (v10)
  {
    v8 = 1;
    goto LABEL_8;
  }
LABEL_9:

}

- (void)setIconStyle:(unint64_t)a3
{
  unint64_t iconStyle;
  uint64_t v5;
  void *v6;
  id v7;

  if (self->_iconStyle != a3)
  {
    self->_iconStyle = a3;
    -[MPAVRoutingTableViewCell _updateSpinnerColor](self, "_updateSpinnerColor");
    iconStyle = self->_iconStyle;
    if (iconStyle == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (iconStyle)
      {
        v6 = 0;
        goto LABEL_8;
      }
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v5;
LABEL_8:
    v7 = v6;
    -[UIImageView setTintColor:](self->_iconImageView, "setTintColor:", v6);
    -[UIImageView setTintColor:](self->_chevronImageView, "setTintColor:", v7);

  }
}

- (void)setAccessoryType:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPAVRoutingTableViewCell;
  -[MPAVRoutingTableViewCell setAccessoryType:](&v4, sel_setAccessoryType_, a3);
  -[MPAVRoutingTableViewCell _updateAccessory](self, "_updateAccessory");
}

- (void)_configureLabel:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0DC3658];
  v6 = a3;
  objc_msgSend(v3, "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHighlightedTextColor:", v4);

  objc_msgSend(v6, "setTextAlignment:", 4);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v5);

  objc_msgSend(v6, "_setWantsUnderlineForAccessibilityButtonShapesEnabled:", 1);
}

- (void)_configureDetailLabel:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0DC3658];
  v4 = a3;
  objc_msgSend(v3, "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHighlightedTextColor:", v5);

  objc_msgSend(v4, "setTextAlignment:", 4);
  objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v6);

}

- (BOOL)_shouldShowSeparateBatteryPercentagesForBatteryLevel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  float v10;
  BOOL v11;

  v3 = a3;
  objc_msgSend(v3, "leftPercentage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "rightPercentage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "leftPercentage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "floatValue");
      v8 = v7;
      objc_msgSend(v3, "rightPercentage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "floatValue");
      v11 = vabds_f32(v8, v10) >= 0.1;

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_batteryTextForRoute:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
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
  uint64_t v19;
  void *v20;
  void *v21;
  float v22;
  float v23;
  void *v24;
  float v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;

  objc_msgSend(a3, "batteryLevel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v5, "setNumberStyle:", 3);
  objc_msgSend(v5, "setUsesSignificantDigits:", 0);
  objc_msgSend(v5, "setUsesGroupingSeparator:", 0);
  objc_msgSend(v4, "leftPercentage");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = (void *)v6,
        objc_msgSend(v4, "rightPercentage"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    objc_msgSend(v4, "leftPercentage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("AIRPLAY_DEVICE_BATTERY_LEVEL_LEFT_FORMAT_%@"), &stru_1E3163D10, CFSTR("MediaPlayer"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "leftPercentage");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "rightPercentage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v18 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("AIRPLAY_DEVICE_BATTERY_LEVEL_RIGHT_FORMAT_%@"), &stru_1E3163D10, CFSTR("MediaPlayer"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "rightPercentage");
        v19 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v4, "singlePercentage");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v27)
        {
          v16 = 0;
          goto LABEL_18;
        }
        v18 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("AIRPLAY_DEVICE_BATTERY_LEVEL_SINGLE_FORMAT_%@"), &stru_1E3163D10, CFSTR("MediaPlayer"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "singlePercentage");
        v19 = objc_claimAutoreleasedReturnValue();
      }
    }
    v12 = (void *)v19;
    objc_msgSend(v5, "stringFromNumber:", v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v11, v13);
    goto LABEL_16;
  }
  if (!-[MPAVRoutingTableViewCell _shouldShowSeparateBatteryPercentagesForBatteryLevel:](self, "_shouldShowSeparateBatteryPercentagesForBatteryLevel:", v4))
  {
    objc_msgSend(v4, "leftPercentage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "floatValue");
    v23 = v22;
    objc_msgSend(v4, "rightPercentage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "floatValue");
    if (v23 < v25)
      objc_msgSend(v4, "leftPercentage");
    else
      objc_msgSend(v4, "rightPercentage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("AIRPLAY_DEVICE_BATTERY_LEVEL_SINGLE_FORMAT_%@"), &stru_1E3163D10, CFSTR("MediaPlayer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromNumber:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", v12, v13);
LABEL_16:
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("AIRPLAY_DEVICE_BATTERY_LEVEL_COMBINED_FORMAT_%@_%@"), &stru_1E3163D10, CFSTR("MediaPlayer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftPercentage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromNumber:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightPercentage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromNumber:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v11, v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
LABEL_18:
  objc_msgSend(v4, "casePercentage");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
    goto LABEL_22;
  v29 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("AIRPLAY_DEVICE_BATTERY_LEVEL_CASE_%@"), &stru_1E3163D10, CFSTR("MediaPlayer"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "casePercentage");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromNumber:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringWithFormat:", v31, v33);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
    goto LABEL_22;
  if (v28)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@  %@"), v16, v28);
    v34 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_22:
    v34 = v16;
  }
  v35 = v34;

  return v35;
}

- (id)_pairedDeviceTextForRoute:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "isPickedOnPairedDevice"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v3, "auxiliaryDevices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v18;
LABEL_4:
      v9 = 0;
      v10 = v7;
      while (1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        v7 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * v9);

        if ((objc_msgSend(v7, "isPlaying") & 1) != 0)
          break;
        ++v9;
        v10 = v7;
        if (v6 == v9)
        {
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v6)
            goto LABEL_4;
          break;
        }
      }

      if (v7)
      {
        objc_msgSend(v7, "deviceName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
LABEL_12:
          v12 = 0;
LABEL_17:

          goto LABEL_18;
        }
LABEL_16:
        v13 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("AIRPLAY_IN_USE_ON_PAIRED_DEVICE_%@"), &stru_1E3163D10, CFSTR("MediaPlayer"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", v15, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_17;
      }
    }
    else
    {

    }
    objc_msgSend(v3, "playingPairedDeviceName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_12;
    goto LABEL_16;
  }
  v12 = 0;
LABEL_18:

  return v12;
}

- (id)_iconImageForRoutes:(id)a3
{
  return +[MPAVRoutingController _iconImageForRoutes:](MPAVRoutingController, "_iconImageForRoutes:", a3);
}

- (id)_iconImageForRoute:(id)a3
{
  return +[MPAVRoutingController _iconImageForRoute:](MPAVRoutingController, "_iconImageForRoute:", a3);
}

- (id)_checkmarkImageNameForSmartAudio
{
  uint64_t v2;
  const __CFString *v3;

  v2 = -[MPAVRoutingTableViewCell accessoryType](self, "accessoryType");
  v3 = CFSTR("circle");
  if (v2)
    v3 = 0;
  if (v2 == 3)
    return CFSTR("checkmark.circle.fill");
  else
    return (id)v3;
}

- (id)_checkmarkAccessibilityLabelForSmartAudio
{
  uint64_t v2;
  const __CFString *v3;

  v2 = -[MPAVRoutingTableViewCell accessoryType](self, "accessoryType");
  v3 = CFSTR("circle");
  if (v2)
    v3 = 0;
  if (v2 == 3)
    return CFSTR("checkmark.circle.fill");
  else
    return (id)v3;
}

- (id)_checkmarkImageForSmartAudio
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3870];
  -[MPAVRoutingTableViewCell _checkmarkImageNameForSmartAudio](self, "_checkmarkImageNameForSmartAudio");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemImageNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_updateAccessory
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  MPAVRoutingTableViewCell *v7;

  if (self->_pendingSelection)
  {
    -[MPAVClippingTableViewCell setAccessoryView:](self, "setAccessoryView:", self->_spinnerView);
    -[UIActivityIndicatorView startAnimating](self->_spinnerView, "startAnimating");
    return;
  }
  if (-[MPAVRoutingTableViewCell useSmartAudioCheckmarkStyle](self, "useSmartAudioCheckmarkStyle"))
  {
    -[MPAVRoutingTableViewCell _checkmarkImageForSmartAudio](self, "_checkmarkImageForSmartAudio");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 1136;
    -[UIImageView setImage:](self->_smartAudioImageView, "setImage:", v3);

    -[MPAVRoutingTableViewCell _checkmarkAccessibilityLabelForSmartAudio](self, "_checkmarkAccessibilityLabelForSmartAudio");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setAccessibilityLabel:](self->_smartAudioImageView, "setAccessibilityLabel:", v5);
  }
  else
  {
    if (-[MPAVRoutingTableViewCell accessoryType](self, "accessoryType") != 3)
    {
      v7 = self;
      v6 = 0;
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 1144;
    -[UIImageView setImage:](self->_checkmarkImageView, "setImage:", v5);
  }

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v4), "sizeToFit");
  v6 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + v4);
  v7 = self;
LABEL_9:
  -[MPAVClippingTableViewCell setAccessoryView:](v7, "setAccessoryView:", v6);
}

- (void)_updateSubtitleTextLabelForRouteItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSTimer *subtitleTextUpdateTimer;
  void *v18;
  void *v19;
  NSTimer *v20;
  NSTimer *v21;
  _QWORD v22[4];
  id v23;
  id location;

  v4 = a3;
  objc_msgSend(v4, "leader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v4, "routes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[MPAVRoutingTableViewCell _batteryTextForRoute:](self, "_batteryTextForRoute:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVRoutingTableViewCellSubtitleTextState setBatteryText:](self->_subtitleTextState, "setBatteryText:", v9);

  -[MPAVRoutingTableViewCell _pairedDeviceTextForRoute:](self, "_pairedDeviceTextForRoute:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVRoutingTableViewCellSubtitleTextState setPairedDeviceText:](self->_subtitleTextState, "setPairedDeviceText:", v10);

  objc_msgSend(v4, "localizedSubtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVRoutingTableViewCellSubtitleTextState setLocalizedSubtitle:](self->_subtitleTextState, "setLocalizedSubtitle:", v11);

  objc_msgSend(v7, "routeUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVRoutingTableViewCellSubtitleTextState routeUID](self->_subtitleTextState, "routeUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 == v13)
  {
    v14 = objc_msgSend(v4, "type");

    if (v14 != 2)
      goto LABEL_10;
  }
  else
  {

  }
  objc_msgSend(v7, "routeUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVRoutingTableViewCellSubtitleTextState setRouteUID:](self->_subtitleTextState, "setRouteUID:", v15);

  -[MPAVRoutingTableViewCellSubtitleTextState resetForNewRoute](self->_subtitleTextState, "resetForNewRoute");
  if (-[MPAVRoutingTableViewCellSubtitleTextState isAnimating](self->_subtitleTextState, "isAnimating"))
  {
    -[UILabel layer](self->_subtitleTextLabel, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeAllAnimations");

    -[UILabel setAlpha:](self->_subtitleTextLabel, "setAlpha:", self->_subtitleViewAlpha);
  }
  -[NSTimer invalidate](self->_subtitleTextUpdateTimer, "invalidate");
  subtitleTextUpdateTimer = self->_subtitleTextUpdateTimer;
  self->_subtitleTextUpdateTimer = 0;

LABEL_10:
  -[MPAVRoutingTableViewCellSubtitleTextState stringForCurrentVisibleTextType](self->_subtitleTextState, "stringForCurrentVisibleTextType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_subtitleTextLabel, "setText:", v18);

  if (!self->_subtitleTextUpdateTimer
    && -[MPAVRoutingTableViewCellSubtitleTextState hasVisibleTextTypeToShow](self->_subtitleTextState, "hasVisibleTextTypeToShow")&& -[MPAVRoutingTableViewCellSubtitleTextState hasVisibleTextTypeToTransitionTo](self->_subtitleTextState, "hasVisibleTextTypeToTransitionTo"))
  {
    objc_initWeak(&location, self);
    v19 = (void *)MEMORY[0x1E0C99E88];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __65__MPAVRoutingTableViewCell__updateSubtitleTextLabelForRouteItem___block_invoke;
    v22[3] = &unk_1E3153828;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v19, "scheduledTimerWithTimeInterval:repeats:block:", 1, v22, 4.48);
    v20 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    v21 = self->_subtitleTextUpdateTimer;
    self->_subtitleTextUpdateTimer = v20;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

}

- (void)_updateSpinnerColor
{
  uint64_t v3;
  id v4;

  if (self->_iconStyle == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v4 = (id)v3;
  -[UIActivityIndicatorView setColor:](self->_spinnerView, "setColor:", v3);

}

- (void)_animateSubtitleLabelToNextAvailableText
{
  NSTimer *subtitleTextUpdateTimer;
  _QWORD v4[5];
  _QWORD v5[5];

  if (-[MPAVRoutingTableViewCellSubtitleTextState hasVisibleTextTypeToShow](self->_subtitleTextState, "hasVisibleTextTypeToShow")&& -[MPAVRoutingTableViewCellSubtitleTextState hasVisibleTextTypeToTransitionTo](self->_subtitleTextState, "hasVisibleTextTypeToTransitionTo"))
  {
    -[MPAVRoutingTableViewCellSubtitleTextState setAnimating:](self->_subtitleTextState, "setAnimating:", 1);
    v4[4] = self;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __68__MPAVRoutingTableViewCell__animateSubtitleLabelToNextAvailableText__block_invoke;
    v5[3] = &unk_1E3163508;
    v5[4] = self;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __68__MPAVRoutingTableViewCell__animateSubtitleLabelToNextAvailableText__block_invoke_2;
    v4[3] = &unk_1E31631D8;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v5, v4, 0.24);
  }
  else
  {
    -[NSTimer invalidate](self->_subtitleTextUpdateTimer, "invalidate");
    subtitleTextUpdateTimer = self->_subtitleTextUpdateTimer;
    self->_subtitleTextUpdateTimer = 0;

  }
}

- (void)didTapToExpand
{
  id v3;

  -[MPAVRoutingTableViewCell delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "routingCellDidTapToExpand:", self);

}

- (MPAVRoutingTableViewCellDelegate)delegate
{
  return (MPAVRoutingTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)mirroringSwitchVisible
{
  return self->_mirroringSwitchVisible;
}

- (void)setMirroringSwitchVisible:(BOOL)a3
{
  self->_mirroringSwitchVisible = a3;
}

- (unint64_t)mirroringStyle
{
  return self->_mirroringStyle;
}

- (unint64_t)iconStyle
{
  return self->_iconStyle;
}

- (BOOL)isPendingSelection
{
  return self->_pendingSelection;
}

- (BOOL)isDisplayedAsPicked
{
  return self->_isDisplayedAsPicked;
}

- (void)setIsDisplayedAsPicked:(BOOL)a3
{
  self->_isDisplayedAsPicked = a3;
}

- (BOOL)useSmartAudioCheckmarkStyle
{
  return self->_useSmartAudioCheckmarkStyle;
}

- (BOOL)provideOwnSeparator
{
  return self->_provideOwnSeparator;
}

- (void)setProvideOwnSeparator:(BOOL)a3
{
  self->_provideOwnSeparator = a3;
}

- (double)subtitleViewAlpha
{
  return self->_subtitleViewAlpha;
}

- (void)setSubtitleViewAlpha:(double)a3
{
  self->_subtitleViewAlpha = a3;
}

- (MPVolumeSlider)volumeSlider
{
  return self->_volumeSlider;
}

- (BOOL)isShowingVolumeSlider
{
  return self->_showingVolumeSlider;
}

- (MPAVRoutingTableViewCellSubtitleTextState)subtitleTextState
{
  return self->_subtitleTextState;
}

- (void)setSubtitleTextState:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleTextState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleTextState, 0);
  objc_storeStrong((id *)&self->_volumeSlider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_expandTargetView, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_checkmarkImageView, 0);
  objc_storeStrong((id *)&self->_smartAudioImageView, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_subtitleTextUpdateTimer, 0);
  objc_storeStrong((id *)&self->_subtitleTextLabel, 0);
  objc_storeStrong((id *)&self->_routeNameLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

uint64_t __68__MPAVRoutingTableViewCell__animateSubtitleLabelToNextAvailableText__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setAlpha:", 0.0);
}

uint64_t __68__MPAVRoutingTableViewCell__animateSubtitleLabelToNextAvailableText__block_invoke_2(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  _QWORD v6[5];
  _QWORD v7[4];
  uint64_t v8;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1216);
  if ((a2 & 1) == 0)
    return objc_msgSend(v3, "setAnimating:", 0);
  objc_msgSend(v3, "transitionToNextAvailableVisibleTextType");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1216), "stringForCurrentVisibleTextType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setText:", v4);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__MPAVRoutingTableViewCell__animateSubtitleLabelToNextAvailableText__block_invoke_3;
  v7[3] = &unk_1E3163508;
  v8 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__MPAVRoutingTableViewCell__animateSubtitleLabelToNextAvailableText__block_invoke_4;
  v6[3] = &unk_1E31631D8;
  v6[4] = v8;
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v7, v6, 0.24);
}

uint64_t __68__MPAVRoutingTableViewCell__animateSubtitleLabelToNextAvailableText__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setAlpha:", *(double *)(*(_QWORD *)(a1 + 32) + 1200));
}

uint64_t __68__MPAVRoutingTableViewCell__animateSubtitleLabelToNextAvailableText__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1216), "setAnimating:", 0);
}

void __65__MPAVRoutingTableViewCell__updateSubtitleTextLabelForRouteItem___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_animateSubtitleLabelToNextAvailableText");
    WeakRetained = v2;
  }

}

@end
