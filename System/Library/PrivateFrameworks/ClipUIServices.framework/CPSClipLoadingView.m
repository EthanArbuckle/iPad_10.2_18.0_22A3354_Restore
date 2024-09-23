@implementation CPSClipLoadingView

- (CPSClipLoadingView)initWithFrame:(CGRect)a3
{
  CPSClipLoadingView *v3;
  CPSClipLoadingView *v4;
  NSString *name;
  NSString *provider;
  void *v7;
  uint64_t v8;
  UIImageView *heroImageView;
  UIView *v10;
  UIView *gradientView;
  void *v12;
  void *v13;
  uint64_t v14;
  CAGradientLayer *gradientLayer;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  UIView *v23;
  UIView *backdropView;
  void *v25;
  CABackdropLayer *v26;
  CABackdropLayer *backdropLayer;
  void *v28;
  UIView *v29;
  UIView *labelContainerView;
  UIView *v31;
  UIView *clipNameContainerView;
  void *v33;
  void *v34;
  uint64_t v35;
  UILabel *clipNameLabel;
  void *v37;
  void *v38;
  void *v39;
  UIView *v40;
  UIView *clipNameBackdropView;
  void *v42;
  void *v43;
  void *v44;
  UIView *v45;
  UIView *clipNameProgressView;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  UILabel *poweredByLabel;
  void *v52;
  double v53;
  UIView *v54;
  UIView *errorContainerView;
  CPSVibrantLabel *v56;
  uint64_t v57;
  CPSVibrantLabel *clipUnavailableLabel;
  void *v59;
  CPSButton *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  CPSButton *retryButton;
  void *v68;
  void *v69;
  CPSClipLoadingView *v70;
  void *v72;
  void *v73;
  void *v74;
  objc_super v75;
  _QWORD v76[2];

  v76[1] = *MEMORY[0x1E0C80C00];
  v75.receiver = self;
  v75.super_class = (Class)CPSClipLoadingView;
  v3 = -[CPSClipLoadingView initWithFrame:](&v75, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    name = v3->_name;
    v3->_name = (NSString *)&stru_1E8E8B5E8;

    provider = v4->_provider;
    v4->_provider = (NSString *)&stru_1E8E8B5E8;

    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSClipLoadingView setBackgroundColor:](v4, "setBackgroundColor:", v7);

    -[CPSClipLoadingView setAccessibilityIgnoresInvertColors:](v4, "setAccessibilityIgnoresInvertColors:", 1);
    objc_msgSend(MEMORY[0x1E0CEA658], "cps_imageViewWithImage:tintColor:backgroundColor:", 0, 0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    heroImageView = v4->_heroImageView;
    v4->_heroImageView = (UIImageView *)v8;

    -[UIImageView setContentMode:](v4->_heroImageView, "setContentMode:", 2);
    v10 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    gradientView = v4->_gradientView;
    v4->_gradientView = v10;

    if (UIAccessibilityIsReduceMotionEnabled())
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "colorWithAlphaComponent:", 0.3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v4->_gradientView, "setBackgroundColor:", v13);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD2790], "cps_grayscaleConicGradientLayer");
      v14 = objc_claimAutoreleasedReturnValue();
      gradientLayer = v4->_gradientLayer;
      v4->_gradientLayer = (CAGradientLayer *)v14;

      -[UIView layer](v4->_gradientView, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addSublayer:", v4->_gradientLayer);

      -[UIView layer](v4->_gradientView, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v17) = 1053609165;
      objc_msgSend(v12, "setOpacity:", v17);
    }

    -[UIView sizeToFit](v4->_gradientView, "sizeToFit");
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E98]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](v4->_gradientView, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCompositingFilter:", v18);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!UIAccessibilityIsReduceTransparencyEnabled())
    {
      objc_msgSend(MEMORY[0x1E0CD2780], "cps_filterWithType:value:forKey:", *MEMORY[0x1E0CD2E18], *MEMORY[0x1E0CD2CB8], 0.4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setValue:forKey:", &unk_1E8E91B28, *MEMORY[0x1E0CD2DD0]);
      objc_msgSend(v20, "addObject:", v21);

    }
    objc_msgSend(MEMORY[0x1E0CD2780], "cps_filterWithType:value:forKey:", *MEMORY[0x1E0CD2C88], *MEMORY[0x1E0CD2D90], 50.0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setValue:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CD2D28]);
    objc_msgSend(v74, "setValue:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD2D70]);
    objc_msgSend(v20, "addObject:", v74);
    v22 = *MEMORY[0x1E0CD2C00];
    objc_msgSend(MEMORY[0x1E0CD2780], "cps_filterWithType:value:forKey:", *MEMORY[0x1E0CD2C00], *MEMORY[0x1E0CD2C00], 1.6);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v73);
    v23 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    backdropView = v4->_backdropView;
    v4->_backdropView = v23;

    -[UIView layer](v4->_backdropView, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAllowsGroupBlending:", 0);

    -[UIView addSubview:](v4->_backdropView, "addSubview:", v4->_heroImageView);
    -[UIView addSubview:](v4->_backdropView, "addSubview:", v4->_gradientView);
    -[CPSClipLoadingView addSubview:](v4, "addSubview:", v4->_backdropView);
    v26 = (CABackdropLayer *)objc_alloc_init(MEMORY[0x1E0CD2708]);
    backdropLayer = v4->_backdropLayer;
    v4->_backdropLayer = v26;

    -[CABackdropLayer setFilters:](v4->_backdropLayer, "setFilters:", v20);
    -[CABackdropLayer setScale:](v4->_backdropLayer, "setScale:", 0.25);
    -[CPSClipLoadingView layer](v4, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSublayer:", v4->_backdropLayer);

    v29 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    labelContainerView = v4->_labelContainerView;
    v4->_labelContainerView = v29;

    v31 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    clipNameContainerView = v4->_clipNameContainerView;
    v4->_clipNameContainerView = v31;

    v33 = (void *)MEMORY[0x1E0CEA700];
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "cps_labelWithText:textColor:fontSize:fontWeight:", 0, v34, 35.0, *MEMORY[0x1E0CEB5D0]);
    v35 = objc_claimAutoreleasedReturnValue();
    clipNameLabel = v4->_clipNameLabel;
    v4->_clipNameLabel = (UILabel *)v35;

    -[UILabel setTextAlignment:](v4->_clipNameLabel, "setTextAlignment:", 1);
    -[UIView setMaskView:](v4->_clipNameContainerView, "setMaskView:", v4->_clipNameLabel);
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BD0]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](v4->_clipNameContainerView, "layer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "mask");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setCompositingFilter:", v37);

    objc_msgSend(MEMORY[0x1E0CD2780], "cps_filterWithType:value:forKey:", v22, v22, 2.0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    clipNameBackdropView = v4->_clipNameBackdropView;
    v4->_clipNameBackdropView = v40;

    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4->_clipNameBackdropView, "setBackgroundColor:", v42);

    -[UIView setAlpha:](v4->_clipNameBackdropView, "setAlpha:", 0.5);
    v76[0] = v72;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](v4->_clipNameBackdropView, "layer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setFilters:", v43);

    -[UIView addSubview:](v4->_clipNameContainerView, "addSubview:", v4->_clipNameBackdropView);
    v45 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    clipNameProgressView = v4->_clipNameProgressView;
    v4->_clipNameProgressView = v45;

    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4->_clipNameProgressView, "setBackgroundColor:", v47);

    -[UIView addSubview:](v4->_clipNameContainerView, "addSubview:", v4->_clipNameProgressView);
    v48 = (void *)MEMORY[0x1E0CEA700];
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "cps_labelWithText:textColor:fontSize:fontWeight:", 0, v49, 17.0, *MEMORY[0x1E0CEB5F0]);
    v50 = objc_claimAutoreleasedReturnValue();
    poweredByLabel = v4->_poweredByLabel;
    v4->_poweredByLabel = (UILabel *)v50;

    -[UILabel setTextAlignment:](v4->_poweredByLabel, "setTextAlignment:", 1);
    -[UILabel layer](v4->_poweredByLabel, "layer");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v53) = 0.75;
    objc_msgSend(v52, "setOpacity:", v53);

    -[UIView addSubview:](v4->_labelContainerView, "addSubview:", v4->_clipNameContainerView);
    -[UIView addSubview:](v4->_labelContainerView, "addSubview:", v4->_poweredByLabel);
    -[CPSClipLoadingView addSubview:](v4, "addSubview:", v4->_labelContainerView);
    v54 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    errorContainerView = v4->_errorContainerView;
    v4->_errorContainerView = v54;

    -[UIView setAlpha:](v4->_errorContainerView, "setAlpha:", 0.0);
    -[CPSClipLoadingView addSubview:](v4, "addSubview:", v4->_errorContainerView);
    v56 = [CPSVibrantLabel alloc];
    v57 = -[CPSVibrantLabel initWithTextStyle:textVariant:vibrancyEffectStyle:](v56, "initWithTextStyle:textVariant:vibrancyEffectStyle:", *MEMORY[0x1E0CEB5C0], 0, 1);
    clipUnavailableLabel = v4->_clipUnavailableLabel;
    v4->_clipUnavailableLabel = (CPSVibrantLabel *)v57;

    -[CPSVibrantLabel setOverrideUserInterfaceStyle:](v4->_clipUnavailableLabel, "setOverrideUserInterfaceStyle:", 2);
    -[CPSVibrantLabel setNumberOfLines:](v4->_clipUnavailableLabel, "setNumberOfLines:", 3);
    -[CPSVibrantLabel setTextAlignment:](v4->_clipUnavailableLabel, "setTextAlignment:", 1);
    _CPSLocalizedString();
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSVibrantLabel setText:](v4->_clipUnavailableLabel, "setText:", v59);

    -[UIView addSubview:](v4->_errorContainerView, "addSubview:", v4->_clipUnavailableLabel);
    v60 = [CPSButton alloc];
    _CPSLocalizedString();
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "colorWithAlphaComponent:", 0.15);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = *MEMORY[0x1E0CEB568];
    v66 = -[CPSButton initWithTitle:enabledTitleColor:disabledTitleColor:backgroundColor:textStyle:cornerRadius:animatesAlphaWhenHighlighted:](v60, "initWithTitle:enabledTitleColor:disabledTitleColor:backgroundColor:textStyle:cornerRadius:animatesAlphaWhenHighlighted:", v61, v62, 0, v64, *MEMORY[0x1E0CEB568], 1, 0.0);
    retryButton = v4->_retryButton;
    v4->_retryButton = (CPSButton *)v66;

    objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:variant:", v65, 8);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSButton titleLabel](v4->_retryButton, "titleLabel");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setFont:", v68);

    -[CPSButton setContentEdgeInsets:](v4->_retryButton, "setContentEdgeInsets:", 14.0, 27.0, 14.0, 27.0);
    -[CPSButton addTarget:action:forControlEvents:](v4->_retryButton, "addTarget:action:forControlEvents:", v4, sel__reloadTapped_, 64);
    -[UIView addSubview:](v4->_errorContainerView, "addSubview:", v4->_retryButton);
    v70 = v4;

  }
  return v4;
}

- (CPSClipLoadingView)initWithCoder:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("-initWithCoder: is not implemented."), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (void)layoutSubviews
{
  int *v3;
  id v4;
  NSString *provider;
  NSString *v6;
  uint64_t v7;
  UILabel *clipNameLabel;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  objc_super v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v53.receiver = self;
  v53.super_class = (Class)CPSClipLoadingView;
  -[CPSClipLoadingView layoutSubviews](&v53, sel_layoutSubviews);
  if (self->_labelsNeedUpdate)
  {
    self->_labelsNeedUpdate = 0;
    if (self->_poweredByThirdParty)
      v3 = &OBJC_IVAR___CPSClipLoadingView__name;
    else
      v3 = &OBJC_IVAR___CPSClipLoadingView__provider;
    v4 = *(id *)((char *)&self->super.super.super.isa + *v3);
    if (self->_poweredByThirdParty)
      provider = self->_provider;
    else
      provider = 0;
    v6 = provider;
    v7 = objc_msgSend(v4, "length");
    clipNameLabel = self->_clipNameLabel;
    if (v7)
    {
      -[UILabel setText:](clipNameLabel, "setText:", v4);
      if (-[NSString length](v6, "length"))
        objc_msgSend(MEMORY[0x1E0D10828], "poweredByCaptionForAppName:", self->_provider);
      else
        _CPSLocalizedString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](self->_poweredByLabel, "setText:", v9);

    }
    else
    {
      -[UILabel setText:](clipNameLabel, "setText:", 0);
      -[UILabel setText:](self->_poweredByLabel, "setText:", 0);
    }

  }
  -[CPSClipLoadingView bounds](self, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[CPSClipLoadingView center](self, "center");
  v19 = v18;
  v21 = v20;
  -[UIImageView setFrame:](self->_heroImageView, "setFrame:", 0.0, 0.0, v15 * 3.45, v17 * 1.74);
  -[UIImageView setCenter:](self->_heroImageView, "setCenter:", v19, v21);
  if (v15 >= v17)
    v22 = v15;
  else
    v22 = v17;
  -[UIView setFrame:](self->_gradientView, "setFrame:", 0.0, 0.0, v22 * 1.3, v22 * 1.3);
  v51 = v19;
  v52 = v21;
  -[UIView setCenter:](self->_gradientView, "setCenter:", v19, v21);
  -[UIView bounds](self->_gradientView, "bounds");
  -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:");
  v50 = v11;
  -[UIView setFrame:](self->_backdropView, "setFrame:", v11, v13, v15, v17);
  -[UIView setCenter:](self->_backdropView, "setCenter:", v19, v21);
  -[CABackdropLayer setFrame:](self->_backdropLayer, "setFrame:", v11, v13, v15, v17);
  if (objc_msgSend(MEMORY[0x1E0D10828], "deviceIsPad"))
    v23 = 55.0;
  else
    v23 = 30.0;
  if (v17 < 568.0)
    v24 = 1;
  else
    v24 = 3;
  -[UILabel setNumberOfLines:](self->_clipNameLabel, "setNumberOfLines:", v24);
  -[UILabel setNumberOfLines:](self->_poweredByLabel, "setNumberOfLines:", v24);
  -[UILabel cps_sizeToFitWithinSize:](self->_poweredByLabel, "cps_sizeToFitWithinSize:", v15 / 1.1 + v23 * -2.0, v17);
  -[UILabel cps_sizeToFitWithinSize:](self->_clipNameLabel, "cps_sizeToFitWithinSize:", v15 / 1.1 + v23 * -2.0, v17);
  -[UILabel frame](self->_clipNameLabel, "frame");
  -[UIView setFrame:](self->_clipNameContainerView, "setFrame:");
  -[UIView bounds](self->_clipNameContainerView, "bounds");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  -[UILabel setFrame:](self->_clipNameLabel, "setFrame:");
  -[UIView setFrame:](self->_clipNameBackdropView, "setFrame:", v26, v28, v30, v32);
  -[CPSClipLoadingView _updateLoadingProgress](self, "_updateLoadingProgress");
  -[UIView frame](self->_clipNameContainerView, "frame");
  v34 = v33;
  -[UILabel frame](self->_poweredByLabel, "frame");
  v36 = fmax(v34, v35);
  -[UIView frame](self->_clipNameContainerView, "frame");
  v38 = v37;
  -[UILabel frame](self->_poweredByLabel, "frame");
  v40 = v23 + v38 + v39;
  v54.origin.x = v50;
  v54.origin.y = v13;
  v54.size.width = v15;
  v54.size.height = v17;
  v41 = (CGRectGetWidth(v54) - v36) * 0.5;
  v55.origin.x = v50;
  v55.origin.y = v13;
  v55.size.width = v15;
  v55.size.height = v17;
  -[UIView setFrame:](self->_labelContainerView, "setFrame:", v41, -(v40 - CGRectGetHeight(v55) * 0.96615) * 0.5, v36, v40);
  if (self->_poweredByThirdParty)
    v42 = 440;
  else
    v42 = 536;
  if (self->_poweredByThirdParty)
    v43 = 536;
  else
    v43 = 440;
  -[UIView cps_verticallyAlignTopView:bottomView:margin:](self->_labelContainerView, "cps_verticallyAlignTopView:bottomView:margin:", *(Class *)((char *)&self->super.super.super.isa + v42), *(Class *)((char *)&self->super.super.super.isa + v43), v23);
  -[UIView setFrame:](self->_errorContainerView, "setFrame:", v50, v13, v15, v17);
  -[CPSButton sizeToFit](self->_retryButton, "sizeToFit");
  -[CPSButton bounds](self->_retryButton, "bounds");
  v44 = CGRectGetHeight(v56) * 0.5;
  -[CPSButton _setContinuousCornerRadius:](self->_retryButton, "_setContinuousCornerRadius:", ceil(v44));
  -[CPSButton setCenter:](self->_retryButton, "setCenter:", v51, v52);
  -[CPSButton frame](self->_retryButton, "frame");
  v46 = v45;
  v57.origin.x = v50;
  v57.origin.y = v13;
  v57.size.width = v15;
  v57.size.height = v17;
  -[CPSButton setOrigin:](self->_retryButton, "setOrigin:", v46, (CGRectGetHeight(v57) - v44) * 0.85);
  -[UIView cps_sizeToFitWithinSize:](self->_clipUnavailableLabel, "cps_sizeToFitWithinSize:", v15 / 1.1 + v23 * -2.0, v17);
  -[CPSVibrantLabel setCenter:](self->_clipUnavailableLabel, "setCenter:", v51, v52);
  -[CPSVibrantLabel bounds](self->_clipUnavailableLabel, "bounds");
  v47 = CGRectGetHeight(v58) * 0.5;
  -[CPSVibrantLabel frame](self->_clipUnavailableLabel, "frame");
  v49 = v48;
  v59.origin.x = v50;
  v59.origin.y = v13;
  v59.size.width = v15;
  v59.size.height = v17;
  -[CPSVibrantLabel setOrigin:](self->_clipUnavailableLabel, "setOrigin:", v49, (CGRectGetHeight(v59) - v47) * 0.45);
  -[CPSClipLoadingView _startAnimationIfNeeded](self, "_startAnimationIfNeeded");
}

- (void)setLoadingHasFailed:(BOOL)a3 animated:(BOOL)a4 reason:(id)a5 reloadHandler:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  id reloadHandler;
  double v14;
  _QWORD v15[5];
  BOOL v16;
  _QWORD v17[5];
  BOOL v18;

  v7 = a4;
  v8 = a3;
  v10 = a5;
  if (self->_loadingHasFailed != v8)
  {
    self->_loadingHasFailed = v8;
    if (v8)
      v11 = a6;
    else
      v11 = 0;
    v12 = (void *)MEMORY[0x1D17E1B78](v11);
    reloadHandler = self->_reloadHandler;
    self->_reloadHandler = v12;

    if (v8 && objc_msgSend(v10, "length"))
      -[CPSVibrantLabel setText:](self->_clipUnavailableLabel, "setText:", v10);
    v14 = 0.3;
    if (!v7)
      v14 = 0.0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __72__CPSClipLoadingView_setLoadingHasFailed_animated_reason_reloadHandler___block_invoke;
    v17[3] = &unk_1E8E8B0B8;
    v17[4] = self;
    v18 = v8;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __72__CPSClipLoadingView_setLoadingHasFailed_animated_reason_reloadHandler___block_invoke_2;
    v15[3] = &unk_1E8E8B410;
    v16 = v8;
    v15[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v17, v15, v14);
    -[CPSClipLoadingView _updateConicGradientRotation](self, "_updateConicGradientRotation");
  }

}

uint64_t __72__CPSClipLoadingView_setLoadingHasFailed_animated_reason_reloadHandler___block_invoke(uint64_t a1)
{
  double v2;
  unint64_t v3;

  v2 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v2 = 1.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "setAlpha:", v2);
  LOBYTE(v3) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", (double)v3);
}

uint64_t __72__CPSClipLoadingView_setLoadingHasFailed_animated_reason_reloadHandler___block_invoke_2(uint64_t result, double a2)
{
  if (*(_BYTE *)(result + 40))
  {
    LODWORD(a2) = 0;
    return objc_msgSend(*(id *)(result + 32), "setLoadingProgress:completion:", 0, a2);
  }
  return result;
}

- (void)setName:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  NSString *name;
  BOOL v7;
  NSString *v8;
  NSString *v9;
  __CFString *v10;

  v4 = &stru_1E8E8B5E8;
  if (a3)
    v4 = (__CFString *)a3;
  v5 = v4;
  name = self->_name;
  if (name != (NSString *)v5)
  {
    v10 = v5;
    v7 = -[NSString isEqualToString:](name, "isEqualToString:", v5);
    v5 = v10;
    if (!v7)
    {
      v8 = (NSString *)-[__CFString copy](v10, "copy");
      v9 = self->_name;
      self->_name = v8;

      self->_labelsNeedUpdate = 1;
      -[CPSClipLoadingView setNeedsLayout](self, "setNeedsLayout");
      v5 = v10;
    }
  }

}

- (void)setProvider:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  NSString *provider;
  BOOL v7;
  NSString *v8;
  NSString *v9;
  __CFString *v10;

  v4 = &stru_1E8E8B5E8;
  if (a3)
    v4 = (__CFString *)a3;
  v5 = v4;
  provider = self->_provider;
  if (provider != (NSString *)v5)
  {
    v10 = v5;
    v7 = -[NSString isEqualToString:](provider, "isEqualToString:", v5);
    v5 = v10;
    if (!v7)
    {
      v8 = (NSString *)-[__CFString copy](v10, "copy");
      v9 = self->_provider;
      self->_provider = v8;

      self->_labelsNeedUpdate = 1;
      -[CPSClipLoadingView setNeedsLayout](self, "setNeedsLayout");
      v5 = v10;
    }
  }

}

- (UIImage)backgroundImage
{
  return -[UIImageView image](self->_heroImageView, "image");
}

- (void)setBackgroundImage:(id)a3 animated:(BOOL)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  UIImageView *heroImageView;
  _QWORD v13[4];
  id v14;
  void (**v15)(_QWORD, _QWORD);
  _QWORD v16[5];
  id v17;

  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__CPSClipLoadingView_setBackgroundImage_animated___block_invoke;
  v16[3] = &unk_1E8E8B438;
  v16[4] = self;
  v8 = v6;
  v17 = v8;
  v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E1B78](v16);
  v10 = v9;
  if (a4)
  {
    v11 = (void *)MEMORY[0x1E0CEABB0];
    heroImageView = self->_heroImageView;
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __50__CPSClipLoadingView_setBackgroundImage_animated___block_invoke_2;
    v13[3] = &unk_1E8E8B460;
    v15 = v9;
    v14 = v8;
    objc_msgSend(v11, "transitionWithView:duration:options:animations:completion:", heroImageView, 5242880, v13, 0, 0.7);

  }
  else
  {
    ((void (**)(_QWORD, id))v9)[2](v9, v8);
  }

}

void __50__CPSClipLoadingView_setBackgroundImage_animated___block_invoke(uint64_t a1)
{
  _BOOL4 IsReduceTransparencyEnabled;
  void *v3;
  float v4;
  double v5;
  id v6;

  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  v3 = *(void **)(a1 + 40);
  if (IsReduceTransparencyEnabled)
  {
    objc_msgSend(*(id *)(a1 + 40), "cps_averageColorImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setImage:", v3);
  if (IsReduceTransparencyEnabled)

  if (*(_QWORD *)(a1 + 40))
    v4 = 0.25;
  else
    v4 = 0.4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = v4;
  objc_msgSend(v6, "setOpacity:", v5);

}

uint64_t __50__CPSClipLoadingView_setBackgroundImage_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)setLoadingProgress:(float)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  uint64_t v8;
  void *v9;
  _BOOL4 v10;
  _BOOL4 v11;
  void *v12;
  double v13;
  id v14;
  _QWORD v15[4];
  id v16;
  BOOL v17;
  _QWORD v18[5];
  _QWORD v19[5];
  void (**v20)(_QWORD);

  v6 = (void (**)(_QWORD))a4;
  v7 = v6;
  if (self->_loadingProgress == a3)
  {
    if (v6)
      v6[2](v6);
  }
  else
  {
    ++self->_progressChangeAnimationCount;
    v8 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __52__CPSClipLoadingView_setLoadingProgress_completion___block_invoke;
    v19[3] = &unk_1E8E8B488;
    v19[4] = self;
    v20 = v6;
    v9 = (void *)MEMORY[0x1D17E1B78](v19);
    self->_loadingProgress = a3;
    v10 = -[CPSClipLoadingView _loadingIsComplete](self, "_loadingIsComplete");
    v11 = v10;
    v12 = (void *)MEMORY[0x1E0CEABB0];
    if (v10)
      v13 = 0.2;
    else
      v13 = 0.1;
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __52__CPSClipLoadingView_setLoadingProgress_completion___block_invoke_2;
    v18[3] = &unk_1E8E8AE88;
    v18[4] = self;
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __52__CPSClipLoadingView_setLoadingProgress_completion___block_invoke_3;
    v15[3] = &unk_1E8E8B4B0;
    v17 = v10;
    v14 = v9;
    v16 = v14;
    objc_msgSend(v12, "animateWithDuration:animations:completion:", v18, v15, v13);
    if (v11)
      -[CPSClipLoadingView _showCompletionAnimation:](self, "_showCompletionAnimation:", v14);

  }
}

uint64_t __52__CPSClipLoadingView_setLoadingProgress_completion___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 528);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    result = (*(uint64_t (**)(void))(result + 16))();
  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v3 + 528))
  {
    result = *(_QWORD *)(v3 + 496);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __52__CPSClipLoadingView_setLoadingProgress_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLoadingProgress");
}

uint64_t __52__CPSClipLoadingView_setLoadingProgress_completion___block_invoke_3(uint64_t result)
{
  if (!*(_BYTE *)(result + 40))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)finishLoadingWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  double loadingProgress;
  int64_t progressChangeAnimationCount;
  double v8;
  void *v9;
  id deferredActions;
  NSObject *v11;
  CABackdropLayer *backdropLayer;
  void *v13;
  CABackdropLayer *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint8_t buf[4];
  double v31;
  __int16 v32;
  int64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    loadingProgress = self->_loadingProgress;
    progressChangeAnimationCount = self->_progressChangeAnimationCount;
    *(_DWORD *)buf = 134218240;
    v31 = loadingProgress;
    v32 = 2048;
    v33 = progressChangeAnimationCount;
    _os_log_impl(&dword_1D0512000, v5, OS_LOG_TYPE_DEFAULT, "Requested to finish the loading animation with current progress %f and animation count %ld.", buf, 0x16u);
  }
  if (self->_loadingProgress >= 1.0)
  {
    if (self->_progressChangeAnimationCount)
    {
      if (!self->_deferredActions)
      {
        objc_initWeak((id *)buf, self);
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __50__CPSClipLoadingView_finishLoadingWithCompletion___block_invoke_2;
        v24[3] = &unk_1E8E8B4D8;
        objc_copyWeak(&v26, (id *)buf);
        v25 = v4;
        v9 = (void *)MEMORY[0x1D17E1B78](v24);
        deferredActions = self->_deferredActions;
        self->_deferredActions = v9;

        objc_destroyWeak(&v26);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      v11 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0512000, v11, OS_LOG_TYPE_DEFAULT, "Animating out the loading view.", buf, 2u);
      }
      backdropLayer = self->_backdropLayer;
      -[CPSClipLoadingView _backdropEffectRemovalAnimationForKeyPath:](self, "_backdropEffectRemovalAnimationForKeyPath:", CFSTR("filters.luminanceCurveMap.inputAmount"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CABackdropLayer addAnimation:forKey:](backdropLayer, "addAnimation:forKey:", v13, 0);

      v14 = self->_backdropLayer;
      -[CPSClipLoadingView _backdropEffectRemovalAnimationForKeyPath:](self, "_backdropEffectRemovalAnimationForKeyPath:", CFSTR("filters.colorSaturate.inputAmount"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CABackdropLayer addAnimation:forKey:](v14, "addAnimation:forKey:", v15, 0);

      -[UIView layer](self->_labelContainerView, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPSClipLoadingView _basicAnimationToDecreaseOpacity](self, "_basicAnimationToDecreaseOpacity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addAnimation:forKey:", v17, 0);

      -[CPSClipLoadingView layer](self, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPSClipLoadingView _springAnimationToDecreaseOpacity](self, "_springAnimationToDecreaseOpacity");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addAnimation:forKey:", v19, 0);

      -[CPSClipLoadingView _textScaleUpSpringAnimation](self, "_textScaleUpSpringAnimation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __50__CPSClipLoadingView_finishLoadingWithCompletion___block_invoke_54;
      v22[3] = &unk_1E8E8B500;
      v23 = v4;
      objc_msgSend(v20, "cps_setDelegateWithDidStartHandler:didStopHandler:", 0, v22);
      -[UIView layer](self->_clipNameContainerView, "layer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addAnimation:forKey:", v20, 0);

    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __50__CPSClipLoadingView_finishLoadingWithCompletion___block_invoke;
    v27[3] = &unk_1E8E8B4D8;
    objc_copyWeak(&v29, (id *)buf);
    v28 = v4;
    LODWORD(v8) = 1.0;
    -[CPSClipLoadingView setLoadingProgress:completion:](self, "setLoadingProgress:completion:", v27, v8);

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);
  }

}

void __50__CPSClipLoadingView_finishLoadingWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "finishLoadingWithCompletion:", *(_QWORD *)(a1 + 32));

}

void __50__CPSClipLoadingView_finishLoadingWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "finishLoadingWithCompletion:", *(_QWORD *)(a1 + 32));

}

uint64_t __50__CPSClipLoadingView_finishLoadingWithCompletion___block_invoke_54(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  v2 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0512000, v2, OS_LOG_TYPE_DEFAULT, "The loading view has been animated out.", v4, 2u);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)_loadingIsComplete
{
  return self->_loadingProgress >= 1.0;
}

- (void)_updateLoadingProgress
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect v12;

  -[UIView bounds](self->_clipNameContainerView, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[CPSClipLoadingView _loadingIsComplete](self, "_loadingIsComplete"))
    v11 = 1.0;
  else
    v11 = 0.7;
  v12.origin.x = v4;
  v12.origin.y = v6;
  v12.size.width = v8;
  v12.size.height = v10;
  -[UIView setFrame:](self->_clipNameProgressView, "setFrame:", v4, CGRectGetHeight(v12) * (1.0 - self->_loadingProgress * v11), v8, v10);
}

- (void)_startAnimationIfNeeded
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSUInteger v6;
  id v7;

  if (!self->_animationHasStarted && !self->_loadingHasFailed)
  {
    -[CPSClipLoadingView superview](self, "superview");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v7 = (id)v3;
      -[CPSClipLoadingView window](self, "window");
      v4 = objc_claimAutoreleasedReturnValue();
      if (!v4)
      {

        return;
      }
      v5 = (void *)v4;
      if (-[NSString length](self->_name, "length"))
      {

LABEL_10:
        -[CPSClipLoadingView _revealBackgroundAndLabels](self, "_revealBackgroundAndLabels");
        -[CPSClipLoadingView _updateConicGradientRotation](self, "_updateConicGradientRotation");
        self->_animationHasStarted = 1;
        return;
      }
      v6 = -[NSString length](self->_provider, "length");

      if (v6)
        goto LABEL_10;
    }
  }
}

- (void)_revealBackgroundAndLabels
{
  void *v3;
  void *v4;
  int *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (!UIAccessibilityIsReduceMotionEnabled())
  {
    -[CPSClipLoadingView _animationForTranslationY:](self, "_animationForTranslationY:", 150.0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView layer](self->_labelContainerView, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addAnimation:forKey:", v11, CFSTR("labelContainerTranslationAnimation"));

    -[CPSClipLoadingView _animationForTranslationY:](self, "_animationForTranslationY:", 80.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_poweredByThirdParty)
      v5 = &OBJC_IVAR___CPSClipLoadingView__poweredByLabel;
    else
      v5 = &OBJC_IVAR___CPSClipLoadingView__clipNameContainerView;
    v6 = *(id *)((char *)&self->super.super.super.isa + *v5);
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAnimation:forKey:", v4, CFSTR("poweredByLabelTranslationAnimation"));

    objc_msgSend(MEMORY[0x1E0CD2848], "cps_animationForKeyPath:from:to:beginAfter:duration:mass:stiffness:damping:keepFinalFrame:", CFSTR("transform.scale.xy"), &unk_1E8E91AD8, &unk_1E8E91AA0, 0, 0.015, 0.8, 2.0, 300.0, 50.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView layer](self->_heroImageView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", &unk_1E8E91AD8, CFSTR("transform.scale.xy"));

    -[UIImageView layer](self->_heroImageView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addAnimation:forKey:", v8, CFSTR("heroImageScaleUpAnimation"));
  }
}

- (void)_updateConicGradientRotation
{
  uint64_t v3;
  void *v4;
  double v5;
  void *v6;
  id v7;

  if (!UIAccessibilityIsReduceMotionEnabled())
  {
    -[UIView layer](self->_gradientView, "layer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "animationForKey:", CFSTR("conicGradientRotationAnimation"));
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      if (self->_loadingHasFailed)
        objc_msgSend(v7, "cps_pauseAnimations");
      else
        objc_msgSend(v7, "cps_resumeAnimations");
    }
    else
    {
      if (self->_loadingHasFailed)
      {
LABEL_9:

        return;
      }
      objc_msgSend(MEMORY[0x1E0CD2710], "cps_animationForKeyPath:from:to:beginAfter:duration:keepFinalFrame:", CFSTR("transform.rotation.z"), 0, &unk_1E8E91AE8, 0, 0.0, 5.0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v5) = 2139095040;
      objc_msgSend(v4, "setRepeatCount:", v5);
      -[UIView layer](self->_gradientView, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addAnimation:forKey:", v4, CFSTR("conicGradientRotationAnimation"));

    }
    goto LABEL_9;
  }
}

- (void)_showCompletionAnimation:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  void (**v12)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[UIView layer](self->_clipNameContainerView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "animationForKey:", CFSTR("progressCompletionAnimation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (v4)
      v4[2](v4);
  }
  else
  {
    if (UIAccessibilityIsReduceMotionEnabled())
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "cps_nullAnimationWithDuration:", 1.19);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0CD2848];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cps_animationForKeyPath:from:to:beginAfter:duration:mass:stiffness:damping:keepFinalFrame:", CFSTR("transform.scale.xy"), 0, v9, 1, 0.0, 1.19, 2.0, 1000.0, 24.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __47__CPSClipLoadingView__showCompletionAnimation___block_invoke;
    v11[3] = &unk_1E8E8B500;
    v12 = v4;
    objc_msgSend(v7, "cps_setDelegateWithDidStartHandler:didStopHandler:", 0, v11);
    -[UIView layer](self->_clipNameContainerView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAnimation:forKey:", v7, CFSTR("progressCompletionAnimation"));

  }
}

uint64_t __47__CPSClipLoadingView__showCompletionAnimation___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_reloadTapped:(id)a3
{
  void (**reloadHandler)(void);

  reloadHandler = (void (**)(void))self->_reloadHandler;
  if (reloadHandler)
    reloadHandler[2]();
}

- (id)_animationForTranslationY:(double)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CD2848];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cps_animationForKeyPath:from:to:beginAfter:duration:mass:stiffness:damping:keepFinalFrame:", CFSTR("transform.translation.y"), v4, &unk_1E8E91A88, 0, 0.0, 1.2, 3.0, 200.0, 300.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_springAnimationToDecreaseOpacity
{
  return (id)objc_msgSend(MEMORY[0x1E0CD2848], "cps_animationForKeyPath:from:to:beginAfter:duration:mass:stiffness:damping:keepFinalFrame:", CFSTR("opacity"), 0, &unk_1E8E91A88, 1, 0.0, 0.6, 3.0, 1000.0, 500.0);
}

- (id)_basicAnimationToDecreaseOpacity
{
  return (id)objc_msgSend(MEMORY[0x1E0CD2710], "cps_animationForKeyPath:from:to:beginAfter:duration:keepFinalFrame:", CFSTR("opacity"), 0, &unk_1E8E91A88, 1, 0.0, 0.6);
}

- (id)_backdropEffectRemovalAnimationForKeyPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CD2848], "cps_animationForKeyPath:from:to:beginAfter:duration:mass:stiffness:damping:keepFinalFrame:", a3, 0, &unk_1E8E91A88, 1, 0.0, 0.6, 3.0, 1000.0, 500.0);
}

- (id)_textScaleUpSpringAnimation
{
  if (UIAccessibilityIsReduceMotionEnabled())
    objc_msgSend(MEMORY[0x1E0CD2710], "cps_nullAnimationWithDuration:", 0.8);
  else
    objc_msgSend(MEMORY[0x1E0CD2848], "cps_animationForKeyPath:from:to:beginAfter:duration:mass:stiffness:damping:keepFinalFrame:", CFSTR("transform.scale.xy"), 0, &unk_1E8E91AF8, 1, 0.0, 0.8, 2.0, 300.0, 50.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)name
{
  return self->_name;
}

- (NSString)provider
{
  return self->_provider;
}

- (BOOL)isPoweredByThirdParty
{
  return self->_poweredByThirdParty;
}

- (void)setPoweredByThirdParty:(BOOL)a3
{
  self->_poweredByThirdParty = a3;
}

- (float)loadingProgress
{
  return self->_loadingProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_poweredByLabel, 0);
  objc_storeStrong((id *)&self->_labelContainerView, 0);
  objc_storeStrong((id *)&self->_heroImageView, 0);
  objc_storeStrong(&self->_deferredActions, 0);
  objc_storeStrong(&self->_reloadHandler, 0);
  objc_storeStrong((id *)&self->_retryButton, 0);
  objc_storeStrong((id *)&self->_clipUnavailableLabel, 0);
  objc_storeStrong((id *)&self->_errorContainerView, 0);
  objc_storeStrong((id *)&self->_clipNameProgressView, 0);
  objc_storeStrong((id *)&self->_clipNameLabel, 0);
  objc_storeStrong((id *)&self->_clipNameContainerView, 0);
  objc_storeStrong((id *)&self->_clipNameBackdropView, 0);
  objc_storeStrong((id *)&self->_backdropLayer, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end
