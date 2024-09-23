@implementation HUQuickControlContainerView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUQuickControlContainerView)initWithFrame:(CGRect)a3 delegate:(id)a4 sourceRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  double v11;
  double v12;
  id v14;
  HUQuickControlContainerView *v15;
  HUQuickControlContainerView *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  UIImageView *disambiguationButtonLeadingImageView;
  uint64_t v23;
  PLPillControl *disambiguationButton;
  PLPillControl *v25;
  void *v26;
  PLPillControl *v27;
  HUControlHostView *v28;
  void *v29;
  HUControlHostView *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v53;
  objc_super v54;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a3.size.height;
  v10 = a3.size.width;
  v11 = a3.origin.y;
  v12 = a3.origin.x;
  v14 = a4;
  v54.receiver = self;
  v54.super_class = (Class)HUQuickControlContainerView;
  v15 = -[HUQuickControlContainerView initWithFrame:](&v54, sel_initWithFrame_, v12, v11, v10, v9);
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_delegate, v14);
    v16->_sourceRect.origin.x = x;
    v16->_sourceRect.origin.y = y;
    v16->_sourceRect.size.width = width;
    v16->_sourceRect.size.height = height;
    v16->_shouldShowDetailsButton = 1;
    v16->_shouldShowActiveControl = 1;
    if (objc_msgSend(MEMORY[0x1E0D319D0], "isProxHandOffV2Config"))
    {
      v16->_isExternallyAnimating = 1;
      objc_msgSend(MEMORY[0x1E0D316B8], "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObserver:", v16);
      v18 = objc_alloc(MEMORY[0x1E0CEA658]);
      objc_msgSend(v17, "lastDisambiguationContext");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "leadingImage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v18, "initWithImage:", v20);
      disambiguationButtonLeadingImageView = v16->_disambiguationButtonLeadingImageView;
      v16->_disambiguationButtonLeadingImageView = (UIImageView *)v21;

      -[UIImageView setFrame:](v16->_disambiguationButtonLeadingImageView, "setFrame:", 0.0, 0.0, 34.0, 34.0);
      -[UIImageView setContentMode:](v16->_disambiguationButtonLeadingImageView, "setContentMode:", 4);
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7D3D8]), "initWithLeadingAccessoryView:trailingAccessoryView:", v16->_disambiguationButtonLeadingImageView, 0);
      disambiguationButton = v16->_disambiguationButton;
      v16->_disambiguationButton = (PLPillControl *)v23;

      -[PLPillControl setTranslatesAutoresizingMaskIntoConstraints:](v16->_disambiguationButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v25 = v16->_disambiguationButton;
      objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPillControl setBackgroundColor:](v25, "setBackgroundColor:", v26);

      -[PLPillControl setAlpha:](v16->_disambiguationButton, "setAlpha:", 0.0);
      v27 = v16->_disambiguationButton;
      -[HUQuickControlContainerView _disambiguationButtonHiddenTransform](v16, "_disambiguationButtonHiddenTransform");
      -[PLPillControl setTransform:](v27, "setTransform:", &v53);
      -[PLPillControl setOpaque:](v16->_disambiguationButton, "setOpaque:", 1);
      -[PLPillControl addTarget:action:forControlEvents:](v16->_disambiguationButton, "addTarget:action:forControlEvents:", v16, sel__disambiguationButtonTapped_, 64);
      -[PLPillControl addTarget:action:forControlEvents:](v16->_disambiguationButton, "addTarget:action:forControlEvents:", v16, sel__disambiguationButtonTouchDown_, 1);
      -[PLPillControl addTarget:action:forControlEvents:](v16->_disambiguationButton, "addTarget:action:forControlEvents:", v16, sel__disambiguationButtonTouchUp_, 128);
      -[PLPillControl addTarget:action:forControlEvents:](v16->_disambiguationButton, "addTarget:action:forControlEvents:", v16, sel__disambiguationButtonTouchUp_, 256);
      -[PLPillControl addTarget:action:forControlEvents:](v16->_disambiguationButton, "addTarget:action:forControlEvents:", v16, sel__disambiguationButtonTouchUp_, 32);
      -[PLPillControl setOverrideUserInterfaceStyle:](v16->_disambiguationButton, "setOverrideUserInterfaceStyle:", 1);
      -[HUQuickControlContainerView addSubview:](v16, "addSubview:", v16->_disambiguationButton);

    }
    v28 = [HUControlHostView alloc];
    -[HUQuickControlContainerView activeControlView](v16, "activeControlView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[HUControlHostView initWithControlView:](v28, "initWithControlView:", v29);
    -[HUQuickControlContainerView setControlHostView:](v16, "setControlHostView:", v30);

    -[HUQuickControlContainerView controlHostView](v16, "controlHostView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUQuickControlContainerView controlHostView](v16, "controlHostView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlContainerView addSubview:](v16, "addSubview:", v32);

    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlContainerView setDetailsButton:](v16, "setDetailsButton:", v33);

    -[HUQuickControlContainerView detailsButton](v16, "detailsButton");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    HUImageNamed(CFSTR("card-settings"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setImage:forState:", v35, 0);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlContainerView detailsButton](v16, "detailsButton");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setTintColor:", v36);

    -[HUQuickControlContainerView detailsButton](v16, "detailsButton");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUQuickControlContainerView detailsButton](v16, "detailsButton");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setAlpha:", 1.0);

    -[HUQuickControlContainerView detailsButton](v16, "detailsButton");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addTarget:action:forControlEvents:", v16, sel__detailsButtonTapped_, 64);

    -[HUQuickControlContainerView detailsButton](v16, "detailsButton");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlContainerView addSubview:](v16, "addSubview:", v41);

    v42 = objc_alloc_init(MEMORY[0x1E0CEA710]);
    -[HUQuickControlContainerView setControlViewLayoutGuide:](v16, "setControlViewLayoutGuide:", v42);

    -[HUQuickControlContainerView controlViewLayoutGuide](v16, "controlViewLayoutGuide");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setIdentifier:", CFSTR("HUControlViewLayoutGuide"));

    -[HUQuickControlContainerView controlViewLayoutGuide](v16, "controlViewLayoutGuide");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlContainerView addLayoutGuide:](v16, "addLayoutGuide:", v44);

    v45 = objc_alloc_init(MEMORY[0x1E0CEA710]);
    -[HUQuickControlContainerView setCardViewLayoutGuide:](v16, "setCardViewLayoutGuide:", v45);

    -[HUQuickControlContainerView cardViewLayoutGuide](v16, "cardViewLayoutGuide");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setIdentifier:", CFSTR("HUCardViewLayoutGuide"));

    -[HUQuickControlContainerView cardViewLayoutGuide](v16, "cardViewLayoutGuide");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlContainerView addLayoutGuide:](v16, "addLayoutGuide:", v47);

    v48 = objc_alloc_init(MEMORY[0x1E0CEA710]);
    -[HUQuickControlContainerView setControlViewPreferredFrameLayoutGuide:](v16, "setControlViewPreferredFrameLayoutGuide:", v48);

    -[HUQuickControlContainerView controlViewPreferredFrameLayoutGuide](v16, "controlViewPreferredFrameLayoutGuide");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setIdentifier:", CFSTR("HUControlViewPreferredFrameLayoutGuide"));

    -[HUQuickControlContainerView controlViewPreferredFrameLayoutGuide](v16, "controlViewPreferredFrameLayoutGuide");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlContainerView addLayoutGuide:](v16, "addLayoutGuide:", v50);

    -[HUQuickControlContainerView layer](v16, "layer");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setAllowsGroupBlending:", 0);

    -[HUQuickControlContainerView _updateLayoutMargins](v16, "_updateLayoutMargins");
  }

  return v16;
}

- (void)dealloc
{
  objc_super v3;

  if (objc_msgSend(MEMORY[0x1E0D319D0], "isProxHandOffV2Config"))
    -[HUQuickControlContainerView _invalidatePhoneCallStatusUpdateTimer](self, "_invalidatePhoneCallStatusUpdateTimer");
  v3.receiver = self;
  v3.super_class = (Class)HUQuickControlContainerView;
  -[HUQuickControlContainerView dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUQuickControlContainerView;
  -[HUQuickControlContainerView layoutSubviews](&v8, sel_layoutSubviews);
  -[HUQuickControlContainerView disambiguationButton](self, "disambiguationButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", 8.0);

  -[PLPillControl layer](self->_disambiguationButton, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 1036831949;
  objc_msgSend(v5, "setShadowOpacity:", v6);
  objc_msgSend(v5, "setShadowOffset:", 0.0, 10.0);
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "setShadowColor:", objc_msgSend(v7, "CGColor"));

  objc_msgSend(v5, "setShadowRadius:", 12.0);
  objc_msgSend(v5, "setShadowPathIsBounds:", 1);
  if (-[HUQuickControlContainerView isDisambiguationButtonAnimating](self, "isDisambiguationButtonAnimating"))
  {
    -[HUQuickControlContainerView frame](self, "frame");
    -[HUQuickControlContainerView setFrame:](self, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  }

}

- (void)setEdgesForExtendedLayout:(unint64_t)a3
{
  if (self->_edgesForExtendedLayout != a3)
  {
    self->_edgesForExtendedLayout = a3;
    -[HUQuickControlContainerView _updateLayoutMargins](self, "_updateLayoutMargins");
  }
}

- (void)setShouldShowActiveControl:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;

  if (self->_shouldShowActiveControl != a3)
  {
    self->_shouldShowActiveControl = a3;
    v4 = !a3;
    -[HUQuickControlContainerView controlHostView](self, "controlHostView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", v4);

    -[HUQuickControlContainerView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[HUQuickControlContainerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)_shouldShowControlView
{
  void *v3;
  BOOL v4;

  if (!-[HUQuickControlContainerView shouldShowActiveControl](self, "shouldShowActiveControl"))
    return 0;
  -[HUQuickControlContainerView activeControlView](self, "activeControlView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)setActiveControlView:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HUQuickControlContainerView activeControlView](self, "activeControlView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v7)
  {
    objc_storeStrong((id *)&self->_activeControlView, a3);
    -[HUQuickControlContainerView controlHostView](self, "controlHostView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setControlView:", v7);

    -[HUQuickControlContainerView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

}

- (void)setInitialSourceViewScale:(double)a3
{
  self->_initialSourceViewScale = a3;
  -[HUQuickControlContainerView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setShouldShowDetailsButton:(BOOL)a3
{
  if (self->_shouldShowDetailsButton != a3)
  {
    self->_shouldShowDetailsButton = a3;
    -[HUQuickControlContainerView _updateDetailsButtonVisibility](self, "_updateDetailsButtonVisibility");
  }
}

- (void)setControlTransitionProgress:(double)a3
{
  self->_controlTransitionProgress = a3;
}

- (void)setChromeTransitionProgress:(double)a3
{
  void *v5;
  void *v6;

  self->_chromeTransitionProgress = a3;
  -[HUQuickControlContainerView summaryView](self, "summaryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", a3);

  -[HUQuickControlContainerView auxiliaryHostView](self, "auxiliaryHostView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", a3);

  -[HUQuickControlContainerView setAlpha:](self, "setAlpha:", a3);
}

- (void)setStandardViewportFromParentGuide:(id)a3
{
  id v5;
  NSObject *v6;
  UILayoutGuide *standardViewportFromParentGuide;
  int v8;
  UILayoutGuide *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_standardViewportFromParentGuide, a3);
  -[HUQuickControlContainerView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    standardViewportFromParentGuide = self->_standardViewportFromParentGuide;
    v8 = 138412290;
    v9 = standardViewportFromParentGuide;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "Setting _standardViewportFromParentGuide = %@", (uint8_t *)&v8, 0xCu);
  }

}

- (void)_detailsButtonTapped:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  HUQuickControlContainerView *v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412546;
    v7 = self;
    v8 = 2080;
    v9 = "-[HUQuickControlContainerView _detailsButtonTapped:]";
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped details button", (uint8_t *)&v6, 0x16u);
  }

  -[HUQuickControlContainerView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "detailsButtonPressedInContainerView:", self);

}

- (void)showAuxiliaryView:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HUQuickControlContainerView auxiliaryHostView](self, "auxiliaryHostView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAuxiliaryView:", v4);

  -[HUQuickControlContainerView _updateCompactControlBottomConstraint](self, "_updateCompactControlBottomConstraint");
}

- (void)hideAuxiliaryView
{
  void *v3;
  void *v4;

  -[HUQuickControlContainerView buttonRowView](self, "buttonRowView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContainerView auxiliaryHostView](self, "auxiliaryHostView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAuxiliaryView:", v3);

  -[HUQuickControlContainerView _updateCompactControlBottomConstraint](self, "_updateCompactControlBottomConstraint");
}

- (void)externalAnimationsBegan
{
  self->_isExternallyAnimating = 1;
}

- (void)externalAnimationsEnded
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  uint8_t v9[16];

  if (-[HUQuickControlContainerView isExternallyAnimating](self, "isExternallyAnimating"))
  {
    self->_isExternallyAnimating = 0;
    if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) == 0)
    {
      if (objc_msgSend(MEMORY[0x1E0D319D0], "isProxHandOffV2Config"))
      {
        HFLogForCategory();
        v3 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "Disambiguation button external animations ended", v9, 2u);
        }

        -[HUQuickControlContainerView currentUserActivities](self, "currentUserActivities");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUQuickControlContainerView currentDisambiguationContext](self, "currentDisambiguationContext");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUQuickControlContainerView _configureDisambiguationForActivities:disambiguationContext:](self, "_configureDisambiguationForActivities:disambiguationContext:", v4, v5);

        -[HUQuickControlContainerView currentUserActivities](self, "currentUserActivities");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUQuickControlContainerView currentDisambiguationContext](self, "currentDisambiguationContext");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[HUQuickControlContainerView _shouldShowDisambiguationButtonForUserActivities:disambiguationContext:](self, "_shouldShowDisambiguationButtonForUserActivities:disambiguationContext:", v6, v7);

        -[HUQuickControlContainerView _updateDisambiguationButtonVisible:](self, "_updateDisambiguationButtonVisible:", v8);
        -[HUQuickControlContainerView setNeedsLayout](self, "setNeedsLayout");
      }
    }
  }
}

- (void)_updateDetailsButtonVisibility
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __61__HUQuickControlContainerView__updateDetailsButtonVisibility__block_invoke;
  v2[3] = &unk_1E6F4D988;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v2, 0.25);
}

void __61__HUQuickControlContainerView__updateDetailsButtonVisibility__block_invoke(uint64_t a1)
{
  double v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "shouldShowDetailsButton"))
    v2 = 1.0;
  else
    v2 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "detailsButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

}

- (void)_disambiguationButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  objc_msgSend(MEMORY[0x1E0D316B8], "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContainerView currentDisambiguationContext](self, "currentDisambiguationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userTappedDisambiguationButtonForContext:", v5);

  -[HUQuickControlContainerView disambiguationButton](self, "disambiguationButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHighlighted:", 1);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__HUQuickControlContainerView__disambiguationButtonTapped___block_invoke;
  v7[3] = &unk_1E6F4D988;
  v7[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v7, 0.25);

}

void __59__HUQuickControlContainerView__disambiguationButtonTapped___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "disambiguationButton");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHighlighted:", 0);

}

- (void)_disambiguationButtonTouchDown:(id)a3
{
  id v3;

  -[HUQuickControlContainerView disambiguationButton](self, "disambiguationButton", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHighlighted:", 1);

}

- (void)_disambiguationButtonTouchUp:(id)a3
{
  id v3;

  -[HUQuickControlContainerView disambiguationButton](self, "disambiguationButton", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHighlighted:", 0);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUQuickControlContainerView;
  v4 = a3;
  -[HUQuickControlContainerView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[HUQuickControlContainerView traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "verticalSizeClass");
  v7 = objc_msgSend(v4, "verticalSizeClass");

  if (v6 != v7)
  {
    -[HUQuickControlContainerView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[HUQuickControlContainerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)_useCompactHeightLayout
{
  void *v2;
  BOOL v3;

  -[HUQuickControlContainerView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "verticalSizeClass") == 1;

  return v3;
}

- (void)layoutMarginsDidChange
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUQuickControlContainerView;
  -[HUQuickControlContainerView layoutMarginsDidChange](&v8, sel_layoutMarginsDidChange);
  -[HUQuickControlContainerView layoutMargins](self, "layoutMargins");
  v4 = v3;
  -[HUQuickControlContainerView layoutMargins](self, "layoutMargins");
  v6 = v5;
  -[HUQuickControlContainerView controlHostView](self, "controlHostView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLayoutMargins:", 0.0, v4, 0.0, v6);

}

- (void)_updateLayoutMargins
{
  double (**v3)(void *, uint64_t);
  double v4;
  double v5;
  double v6;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__HUQuickControlContainerView__updateLayoutMargins__block_invoke;
  aBlock[3] = &unk_1E6F52598;
  aBlock[4] = self;
  v3 = (double (**)(void *, uint64_t))_Block_copy(aBlock);
  v4 = v3[2](v3, 1);
  v5 = v3[2](v3, 2);
  v6 = v3[2](v3, 4);
  -[HUQuickControlContainerView setLayoutMargins:](self, "setLayoutMargins:", v4, v5, v6, v3[2](v3, 8));
  -[HUQuickControlContainerView setEdgesInsettingLayoutMarginsFromSafeArea:](self, "setEdgesInsettingLayoutMarginsFromSafeArea:", ~-[HUQuickControlContainerView edgesForExtendedLayout](self, "edgesForExtendedLayout") & 0xF);

}

double __51__HUQuickControlContainerView__updateLayoutMargins__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  double result;

  v3 = objc_msgSend(*(id *)(a1 + 32), "edgesForExtendedLayout");
  result = 34.0;
  if ((a2 & ~v3) != 0)
    return 20.0;
  return result;
}

- (CGAffineTransform)_controlHostTransformForPresentationProgress:(SEL)a3
{
  CGAffineTransform *result;
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double (**v21)(double);
  CGFloat v22;
  CGFloat v23;
  uint64_t v24;
  __int128 v25;
  _QWORD aBlock[5];

  result = (CGAffineTransform *)-[HUQuickControlContainerView _presentedControlHostSize](self, "_presentedControlHostSize");
  v10 = v9;
  v11 = v8;
  if (v9 == *MEMORY[0x1E0C9D820] && v8 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v24 = MEMORY[0x1E0C9BAA8];
    v25 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v25;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v24 + 32);
  }
  else
  {
    -[HUQuickControlContainerView sourceRect](self, "sourceRect");
    v14 = v13;
    -[HUQuickControlContainerView initialSourceViewScale](self, "initialSourceViewScale");
    v16 = v15 * v14 / v10;
    -[HUQuickControlContainerView sourceRect](self, "sourceRect");
    v18 = v17;
    -[HUQuickControlContainerView initialSourceViewScale](self, "initialSourceViewScale");
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __76__HUQuickControlContainerView__controlHostTransformForPresentationProgress___block_invoke;
    aBlock[3] = &__block_descriptor_40_e8_d16__0d8l;
    *(double *)&aBlock[4] = a4;
    v20 = v19 * v18 / v11;
    v21 = (double (**)(double))_Block_copy(aBlock);
    v22 = v21[2](v16);
    v23 = ((double (*)(double (**)(double), double))v21[2])(v21, v20);
    CGAffineTransformMakeScale(retstr, v22, v23);

  }
  return result;
}

double __76__HUQuickControlContainerView__controlHostTransformForPresentationProgress___block_invoke(uint64_t a1, double a2)
{
  return 1.0 - (1.0 - a2) * (1.0 - *(double *)(a1 + 32));
}

- (CGAffineTransform)_controlHostTransform
{
  -[HUQuickControlContainerView controlTransitionProgress](self, "controlTransitionProgress");
  return -[HUQuickControlContainerView _controlHostTransformForPresentationProgress:](self, "_controlHostTransformForPresentationProgress:");
}

- (CGPoint)_controlHostCenter
{
  double v3;
  double v4;
  CGPoint result;

  -[HUQuickControlContainerView controlTransitionProgress](self, "controlTransitionProgress");
  -[HUQuickControlContainerView _controlHostCenterForPresentationProgress:](self, "_controlHostCenterForPresentationProgress:");
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)_controlHostCenterForPresentationProgress:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGPoint result;

  -[HUQuickControlContainerView sourceRect](self, "sourceRect");
  UIRectGetCenter();
  v6 = v5;
  v8 = v7;
  -[HUQuickControlContainerView sourceRect](self, "sourceRect");
  UIRectGetCenter();
  v10 = v9;
  v12 = v11;
  -[HUQuickControlContainerView superview](self, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v30 = v17;

  -[HUQuickControlContainerView _presentedControlHostSize](self, "_presentedControlHostSize");
  v19 = v18;
  v21 = v20;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "userInterfaceIdiom");

  v24 = v19 * 0.5;
  if (v23)
  {
    if (v10 - v24 >= 0.0)
    {
      if (v10 + v24 <= v16)
        goto LABEL_8;
      v24 = v16 - v24;
      v25 = -20.0;
    }
    else
    {
      v25 = 20.0;
    }
    v10 = v24 + v25;
LABEL_8:
    v26 = v21 * 0.5;
    if (v12 - v21 * 0.5 >= 0.0)
    {
      if (v12 + v26 <= v30)
      {
LABEL_13:
        v24 = v10;
        goto LABEL_14;
      }
      v26 = v30 - v26;
      v27 = -60.0;
    }
    else
    {
      v27 = 60.0;
    }
    v12 = v26 + v27;
    goto LABEL_13;
  }
  v12 = v21 * 0.5;
LABEL_14:
  v28 = v6 + (v24 - v6) * a3;
  v29 = v8 + (v12 - v8) * a3;
  result.y = v29;
  result.x = v28;
  return result;
}

- (void)willMoveToWindow:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  id v16;
  _QWORD v17[5];

  objc_msgSend(a3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = HURoundToScreenScale(v5 * 0.78);

  -[HUQuickControlContainerView maxHeightConstraints](self, "maxHeightConstraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HUQuickControlContainerView maxHeightConstraints](self, "maxHeightConstraints");
    v17[1] = 3221225472;
    v17[2] = __48__HUQuickControlContainerView_willMoveToWindow___block_invoke;
    v17[3] = &__block_descriptor_40_e35_v32__0__NSLayoutConstraint_8Q16_B24l;
    *(double *)&v17[4] = v6;
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v17);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlContainerView controlViewPreferredFrameLayoutGuide](self, "controlViewPreferredFrameLayoutGuide");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "heightAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintLessThanOrEqualToConstant:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v11) = 1144750080;
    objc_msgSend(v10, "setPriority:", v11);
    objc_msgSend(v16, "addObject:", v10);
    -[HUQuickControlContainerView controlHostView](self, "controlHostView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "heightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintLessThanOrEqualToConstant:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v15) = 1144750080;
    objc_msgSend(v14, "setPriority:", v15);
    objc_msgSend(v16, "addObject:", v14);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v16);
    -[HUQuickControlContainerView setMaxHeightConstraints:](self, "setMaxHeightConstraints:", v16);

  }
}

uint64_t __48__HUQuickControlContainerView_willMoveToWindow___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setConstant:", *(double *)(a1 + 32));
}

- (void)updateConstraints
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HUQuickControlContainerView contentConstraints](self, "contentConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3718];
    -[HUQuickControlContainerView contentConstraints](self, "contentConstraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deactivateConstraints:", v6);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContainerView _configureRegularHeightConstraints:](self, "_configureRegularHeightConstraints:", v7);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v7);
  -[HUQuickControlContainerView setContentConstraints:](self, "setContentConstraints:", v7);
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v12 = v9;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@ Added and activated constraints = %@", buf, 0x16u);

  }
  v10.receiver = self;
  v10.super_class = (Class)HUQuickControlContainerView;
  -[HUQuickControlContainerView updateConstraints](&v10, sel_updateConstraints);

}

- (void)_configureRegularHeightConstraints:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
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
  void *v32;
  void *v33;
  void *v34;
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
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HUQuickControlContainerView controlViewPreferredFrameLayoutGuide](self, "controlViewPreferredFrameLayoutGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "centerYAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContainerView controlHostView](self, "controlHostView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerYAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v10);

  -[HUQuickControlContainerView controlHostView](self, "controlHostView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRequiresWellDefinedSize:", 1);

  -[HUQuickControlContainerView heightAnchor](self, "heightAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContainerView standardViewportFromParentGuide](self, "standardViewportFromParentGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "heightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintGreaterThanOrEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObject:", v15);
  HFLogForCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlContainerView standardViewportFromParentGuide](self, "standardViewportFromParentGuide");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "heightAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 138412802;
    v61 = v17;
    v62 = 2112;
    v63 = v15;
    v64 = 2112;
    v65 = v19;
    _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "%@ totalHeightFromParent = %@, self.standardViewportFromParentGuide.heightAnchor = %@", (uint8_t *)&v60, 0x20u);

  }
  -[HUQuickControlContainerView controlHostView](self, "controlHostView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContainerView detailsButton](self, "detailsButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23, -5.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v24);

  -[HUQuickControlContainerView detailsButton](self, "detailsButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContainerView bottomAnchor](self, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, -20.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v28);

  -[HUQuickControlContainerView controlHostView](self, "controlHostView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "widthAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContainerView widthAnchor](self, "widthAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v32);

  -[HUQuickControlContainerView controlHostView](self, "controlHostView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "centerXAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContainerView centerXAnchor](self, "centerXAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v36);

  -[HUQuickControlContainerView controlViewPreferredFrameLayoutGuide](self, "controlViewPreferredFrameLayoutGuide");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "widthAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContainerView layoutMarginsGuide](self, "layoutMarginsGuide");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "widthAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v41);

  -[HUQuickControlContainerView controlViewPreferredFrameLayoutGuide](self, "controlViewPreferredFrameLayoutGuide");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "centerXAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContainerView centerXAnchor](self, "centerXAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v45);

  -[HUQuickControlContainerView detailsButton](self, "detailsButton");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "trailingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContainerView trailingAnchor](self, "trailingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:constant:", v48, -25.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v49);

  -[HUQuickControlContainerView detailsButton](self, "detailsButton");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "widthAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToConstant:", 40.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v52);

  -[HUQuickControlContainerView detailsButton](self, "detailsButton");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "heightAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToConstant:", 40.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v55);

  -[HUQuickControlContainerView _configureControlViewLayoutGuideConstraints:](self, "_configureControlViewLayoutGuideConstraints:", v5);
  -[HUQuickControlContainerView _configureCardViewLayoutGuideConstraints:](self, "_configureCardViewLayoutGuideConstraints:", v5);
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) != 0
    || !objc_msgSend(MEMORY[0x1E0D319D0], "isProxHandOffV2Config"))
  {
    -[HUQuickControlContainerView controlHostView](self, "controlHostView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "topAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlContainerView topAnchor](self, "topAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v59);

  }
  else
  {
    -[HUQuickControlContainerView _configureDisambiguationButtonConstraints:](self, "_configureDisambiguationButtonConstraints:", v5);
  }

}

- (void)_configureControlViewLayoutGuideConstraints:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB3718];
  v5 = a3;
  -[HUQuickControlContainerView controlViewLayoutGuide](self, "controlViewLayoutGuide");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContainerView controlHostView](self, "controlHostView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hu_constraintsSizingAnchorProvider:toAnchorProvider:", v8, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v7);

}

- (void)_configureCardViewLayoutGuideConstraints:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB3718];
  v5 = a3;
  -[HUQuickControlContainerView cardViewLayoutGuide](self, "cardViewLayoutGuide");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hu_constraintsSizingAnchorProvider:toAnchorProvider:", v7, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

}

- (void)_updateCompactControlBottomConstraint
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[HUQuickControlContainerView compactControlBottomConstraint](self, "compactControlBottomConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActive:", 0);

  if (-[HUQuickControlContainerView _useCompactHeightLayout](self, "_useCompactHeightLayout")
    && -[HUQuickControlContainerView _shouldShowControlView](self, "_shouldShowControlView"))
  {
    -[HUQuickControlContainerView auxiliaryHostView](self, "auxiliaryHostView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "auxiliaryView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasCenteredContent");

    -[HUQuickControlContainerView controlHostView](self, "controlHostView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bottomAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[HUQuickControlContainerView auxiliaryHostView](self, "auxiliaryHostView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "topAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, -20.0);
    }
    else
    {
      -[HUQuickControlContainerView layoutMarginsGuide](self, "layoutMarginsGuide");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bottomAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "constraintEqualToAnchor:", v10);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlContainerView setCompactControlBottomConstraint:](self, "setCompactControlBottomConstraint:", v11);

    -[HUQuickControlContainerView compactControlBottomConstraint](self, "compactControlBottomConstraint");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setActive:", 1);

  }
  else
  {
    -[HUQuickControlContainerView setCompactControlBottomConstraint:](self, "setCompactControlBottomConstraint:", 0);
  }
}

- (void)_configureDisambiguationButtonConstraints:(id)a3
{
  id v4;
  NSLayoutConstraint *controlHostViewTopConstraintToView;
  void *v6;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *disambiguationButtonTopConstraint;
  void *v12;
  void *v13;
  void *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *disambiguationButtonHeightConstraint;
  void *v18;
  void *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v4 = a3;
  controlHostViewTopConstraintToView = self->_controlHostViewTopConstraintToView;
  v30 = v4;
  if (!controlHostViewTopConstraintToView)
  {
    -[HUQuickControlContainerView controlHostView](self, "controlHostView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlContainerView topAnchor](self, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, 0.0);
    v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v10 = self->_controlHostViewTopConstraintToView;
    self->_controlHostViewTopConstraintToView = v9;

    v4 = v30;
    controlHostViewTopConstraintToView = self->_controlHostViewTopConstraintToView;
  }
  objc_msgSend(v4, "addObject:", controlHostViewTopConstraintToView);
  disambiguationButtonTopConstraint = self->_disambiguationButtonTopConstraint;
  if (!disambiguationButtonTopConstraint)
  {
    -[HUQuickControlContainerView disambiguationButton](self, "disambiguationButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlContainerView topAnchor](self, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, 12.0);
    v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v16 = self->_disambiguationButtonTopConstraint;
    self->_disambiguationButtonTopConstraint = v15;

    disambiguationButtonTopConstraint = self->_disambiguationButtonTopConstraint;
  }
  objc_msgSend(v30, "addObject:", disambiguationButtonTopConstraint);
  disambiguationButtonHeightConstraint = self->_disambiguationButtonHeightConstraint;
  if (!disambiguationButtonHeightConstraint)
  {
    -[HUQuickControlContainerView disambiguationButton](self, "disambiguationButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "heightAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintGreaterThanOrEqualToConstant:", 50.0);
    v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v21 = self->_disambiguationButtonHeightConstraint;
    self->_disambiguationButtonHeightConstraint = v20;

    disambiguationButtonHeightConstraint = self->_disambiguationButtonHeightConstraint;
  }
  objc_msgSend(v30, "addObject:", disambiguationButtonHeightConstraint);
  -[HUQuickControlContainerView disambiguationButton](self, "disambiguationButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContainerView leadingAnchor](self, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, 40.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v25);

  -[HUQuickControlContainerView disambiguationButton](self, "disambiguationButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContainerView trailingAnchor](self, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, -40.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v29);

}

- (CGRect)presentedControlFrame
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
  double v12;
  CGRect result;

  -[HUQuickControlContainerView _controlHostCenterForPresentationProgress:](self, "_controlHostCenterForPresentationProgress:", 1.0);
  v4 = v3;
  v6 = v5;
  -[HUQuickControlContainerView _presentedControlHostSize](self, "_presentedControlHostSize");
  v8 = v7;
  v10 = v9;
  v11 = v4;
  v12 = v6;
  result.size.height = v10;
  result.size.width = v8;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGSize)_presentedControlHostSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[HUQuickControlContainerView cardViewLayoutGuide](self, "cardViewLayoutGuide");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutFrame");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGAffineTransform)sourceViewTransformForPresentationProgress:(SEL)a3
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGAffineTransform v20;
  _QWORD v21[5];
  CGAffineTransform v22;

  -[HUQuickControlContainerView updateConstraintsIfNeeded](self, "updateConstraintsIfNeeded");
  -[HUQuickControlContainerView layoutIfNeeded](self, "layoutIfNeeded");
  -[HUQuickControlContainerView _controlHostCenterForPresentationProgress:](self, "_controlHostCenterForPresentationProgress:", a4);
  v8 = v7;
  v10 = v9;
  -[HUQuickControlContainerView sourceRect](self, "sourceRect");
  UIRectGetCenter();
  memset(&v22, 0, sizeof(v22));
  CGAffineTransformMakeTranslation(&v22, v8 - v11, v10 - v12);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __74__HUQuickControlContainerView_sourceViewTransformForPresentationProgress___block_invoke;
  v21[3] = &unk_1E6F52600;
  v21[4] = self;
  v13 = __74__HUQuickControlContainerView_sourceViewTransformForPresentationProgress___block_invoke((uint64_t)v21);
  -[HUQuickControlContainerView sourceRect](self, "sourceRect");
  v15 = v13 / v14;
  -[HUQuickControlContainerView initialSourceViewScale](self, "initialSourceViewScale");
  v17 = v16;
  -[HUQuickControlContainerView initialSourceViewScale](self, "initialSourceViewScale");
  v20 = v22;
  return CGAffineTransformScale(retstr, &v20, v17 + (v15 - v18) * a4, v17 + (v15 - v18) * a4);
}

double __74__HUQuickControlContainerView_sourceViewTransformForPresentationProgress___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;

  if (objc_msgSend(*(id *)(a1 + 32), "_shouldShowControlView")
    && objc_msgSend(*(id *)(a1 + 32), "controlViewSupportsTransformTransition"))
  {
    objc_msgSend(*(id *)(a1 + 32), "activeControlView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_presentedControlHostSize");
    objc_msgSend(v2, "systemLayoutSizeFittingSize:");
    v4 = v3;

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "sourceRect");
    v4 = v5 + v5;
    objc_msgSend(*(id *)(a1 + 32), "sourceRect");
  }
  return v4;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR("fillColor")) & 1) != 0
    || (objc_msgSend(v4, "hasPrefix:", CFSTR("compositingFilter")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HUQuickControlContainerView;
    v5 = -[HUQuickControlContainerView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (void)_configureDisambiguationForActivities:(id)a3 disambiguationContext:(id)a4
{
  void *v4;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (-[HUQuickControlContainerView _shouldShowDisambiguationButtonForUserActivities:disambiguationContext:](self, "_shouldShowDisambiguationButtonForUserActivities:disambiguationContext:", a3, v8))
  {
    objc_msgSend(v8, "titleText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subtitleText");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9)
    {
      -[HUQuickControlContainerView disambiguationButtonPrimaryText](self, "disambiguationButtonPrimaryText");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isEqualToAttributedString:", v4) & 1) == 0)
      {

LABEL_15:
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D3D0]), "initWithAttributedText:style:", v9, 5);
        objc_msgSend(v4, "addObject:", v16);
        if (v11)
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D3D0]), "initWithText:style:", v11, 2);
        else
          v17 = 0;
        objc_msgSend(v4, "na_safeAddObject:", v17);
        -[HUQuickControlContainerView setDisambiguationButtonPrimaryText:](self, "setDisambiguationButtonPrimaryText:", v9);
        -[HUQuickControlContainerView setDisambiguationButtonSecondaryText:](self, "setDisambiguationButtonSecondaryText:", v11);
        -[HUQuickControlContainerView disambiguationButton](self, "disambiguationButton");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v4, "copy");
        objc_msgSend(v18, "setCenterContentItems:animated:", v19, 1);

        goto LABEL_19;
      }
      if (!v11)
      {
LABEL_19:

        goto LABEL_20;
      }
    }
    else if (!v10)
    {
LABEL_20:
      HFLogForCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUQuickControlContainerView disambiguationButton](self, "disambiguationButton");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "centerContentItems");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138412546;
        v30 = v21;
        v31 = 2112;
        v32 = v23;
        _os_log_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_DEFAULT, "%@  self.disambiguationButton.CenterContentItems = %@", (uint8_t *)&v29, 0x16u);

      }
      -[HUQuickControlContainerView disambiguationButtonLeadingImageView](self, "disambiguationButtonLeadingImageView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "leadingImage");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setImage:", v25);

      HFLogForCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUQuickControlContainerView disambiguationButtonLeadingImageView](self, "disambiguationButtonLeadingImageView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138412546;
        v30 = v27;
        v31 = 2112;
        v32 = v28;
        _os_log_impl(&dword_1B8E1E000, v26, OS_LOG_TYPE_DEFAULT, "%@  self.disambiguationButtonLeadingImageView = %@", (uint8_t *)&v29, 0x16u);

      }
      if (-[HUQuickControlContainerView _isPhoneCallStatusUpdateTimerActive](self, "_isPhoneCallStatusUpdateTimerActive")&& !-[HUQuickControlContainerView hasActivePhoneCall](self, "hasActivePhoneCall"))
      {
        -[HUQuickControlContainerView _invalidatePhoneCallStatusUpdateTimer](self, "_invalidatePhoneCallStatusUpdateTimer");
      }
      else if (!-[HUQuickControlContainerView _isPhoneCallStatusUpdateTimerActive](self, "_isPhoneCallStatusUpdateTimerActive")&& -[HUQuickControlContainerView hasActivePhoneCall](self, "hasActivePhoneCall"))
      {
        -[HUQuickControlContainerView _startPhoneCallStatusUpdateTimer](self, "_startPhoneCallStatusUpdateTimer");
      }

      goto LABEL_31;
    }
    -[HUQuickControlContainerView disambiguationButtonSecondaryText](self, "disambiguationButtonSecondaryText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v11, "isEqualToString:", v14);

    if (v9)
    if ((v15 & 1) != 0)
      goto LABEL_20;
    goto LABEL_15;
  }
  -[HUQuickControlContainerView disambiguationButton](self, "disambiguationButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCenterContentItems:", MEMORY[0x1E0C9AA60]);

  -[HUQuickControlContainerView disambiguationButtonLeadingImageView](self, "disambiguationButtonLeadingImageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setImage:", 0);

  if (-[HUQuickControlContainerView _isPhoneCallStatusUpdateTimerActive](self, "_isPhoneCallStatusUpdateTimerActive")
    && !-[HUQuickControlContainerView hasActivePhoneCall](self, "hasActivePhoneCall"))
  {
    -[HUQuickControlContainerView _invalidatePhoneCallStatusUpdateTimer](self, "_invalidatePhoneCallStatusUpdateTimer");
  }
LABEL_31:

}

- (BOOL)_shouldShowDisambiguationButtonForUserActivities:(id)a3 disambiguationContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  void *v10;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "activity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = objc_msgSend(v6, "interactionDirection") != 0;
  else
    v8 = 0;

  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "activity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v5;
    v14 = 2112;
    v15 = v10;
    v16 = 2048;
    v17 = objc_msgSend(v6, "interactionDirection");
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Activities = %@, disambiguationContext.activity = [%@] interactionDirection = [%ld]", (uint8_t *)&v12, 0x20u);

  }
  return v8;
}

- (BOOL)_isDisambiguationButtonVisible
{
  void *v2;
  double v3;
  BOOL v4;

  -[HUQuickControlContainerView disambiguationButton](self, "disambiguationButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alpha");
  v4 = v3 > 0.0;

  return v4;
}

- (void)_updateDisambiguationButtonVisible:(BOOL)a3
{
  int v3;
  int v5;
  NSObject *v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  char v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v5 = -[HUQuickControlContainerView _isDisambiguationButtonVisible](self, "_isDisambiguationButtonVisible");
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[HUQuickControlContainerView disambiguationButton](self, "disambiguationButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v20 = v7;
    v21 = 1024;
    v22 = v5;
    v23 = 1024;
    v24 = v3;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "Disambiguation button %@ current display mode %{BOOL}d, requested display mode %{BOOL}d", buf, 0x18u);

  }
  if (v5 != v3)
  {
    v8 = -[HUQuickControlContainerView isExternallyAnimating](self, "isExternallyAnimating");
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        -[HUQuickControlContainerView disambiguationButton](self, "disambiguationButton");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v20 = v11;
        v21 = 1024;
        v22 = v5;
        _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Disambiguation button %@ display updates paused for external animation (current display mode %{BOOL}d)", buf, 0x12u);

      }
    }
    else
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Calling layoutIfNeeded", buf, 2u);
      }

      -[HUQuickControlContainerView layoutIfNeeded](self, "layoutIfNeeded");
      -[HUQuickControlContainerView setIsDisambiguationButtonAnimating:](self, "setIsDisambiguationButtonAnimating:", 1);
      objc_initWeak((id *)buf, self);
      v12 = (void *)MEMORY[0x1E0CEABB0];
      v13 = MEMORY[0x1E0C809B0];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __66__HUQuickControlContainerView__updateDisambiguationButtonVisible___block_invoke;
      v16[3] = &unk_1E6F52628;
      objc_copyWeak(&v17, (id *)buf);
      v18 = v3;
      v14[0] = v13;
      v14[1] = 3221225472;
      v14[2] = __66__HUQuickControlContainerView__updateDisambiguationButtonVisible___block_invoke_59;
      v14[3] = &unk_1E6F4CB50;
      objc_copyWeak(&v15, (id *)buf);
      objc_msgSend(v12, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v16, v14, 0.75, 0.0, 0.73333, 0.0);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&v17);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __66__HUQuickControlContainerView__updateDisambiguationButtonVisible___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  double v4;
  double v5;
  void *v6;
  __int128 v7;
  void *v8;
  double v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];
  _OWORD v13[3];
  __int128 v14;
  __int128 v15;
  __int128 v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(WeakRetained, "_disambiguationButtonPreferredHeight");
    v5 = v4 + 12.0;
  }
  else
  {
    v5 = 0.0;
  }
  objc_msgSend(v3, "controlHostViewTopConstraintToView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", v5);

  if (*(_BYTE *)(a1 + 40))
  {
    v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v14 = *MEMORY[0x1E0C9BAA8];
    v15 = v7;
    v16 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  else if (v3)
  {
    objc_msgSend(v3, "_disambiguationButtonHiddenTransform");
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v14 = 0u;
  }
  objc_msgSend(v3, "disambiguationButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v14;
  v13[1] = v15;
  v13[2] = v16;
  objc_msgSend(v8, "setTransform:", v13);

  if (*(_BYTE *)(a1 + 40))
    v9 = 1.0;
  else
    v9 = 0.0;
  objc_msgSend(v3, "disambiguationButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", v9);

  HFLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "Calling layoutIfNeeded inside animateWithDuration", v12, 2u);
  }

  objc_msgSend(v3, "layoutIfNeeded");
}

void __66__HUQuickControlContainerView__updateDisambiguationButtonVisible___block_invoke_59(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setIsDisambiguationButtonAnimating:", 0);
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "disambiguationButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412546;
    v6 = v3;
    v7 = 1024;
    v8 = objc_msgSend(WeakRetained, "_isDisambiguationButtonVisible");
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "Disambiguation button %@ updated to display mode %{BOOL}d", (uint8_t *)&v5, 0x12u);

  }
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentDidUpdateInContainerView:", WeakRetained);

}

- (CGAffineTransform)_disambiguationButtonHiddenTransform
{
  double v5;
  __int128 v6;
  CGAffineTransform *result;
  __int128 v8;
  CGAffineTransform v9;
  CGAffineTransform v10;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransformMakeScale(retstr, 0.6, 0.6);
  -[HUQuickControlContainerView _disambiguationButtonPreferredHeight](self, "_disambiguationButtonPreferredHeight");
  v6 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v9.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v9.c = v6;
  *(_OWORD *)&v9.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformTranslate(&v10, &v9, 0.0, v5 * -0.6 * 0.5);
  v8 = *(_OWORD *)&v10.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v10.a;
  *(_OWORD *)&retstr->c = v8;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v10.tx;
  return result;
}

- (double)_disambiguationButtonPreferredHeight
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double result;

  -[HUQuickControlContainerView disambiguationButton](self, "disambiguationButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContainerView disambiguationButton](self, "disambiguationButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "sizeThatFits:", v5, 1.79769313e308);
  v7 = v6;

  result = 50.0;
  if (v7 >= 50.0)
    return v7;
  return result;
}

- (void)_startPhoneCallStatusUpdateTimer
{
  dispatch_source_t v4;
  dispatch_time_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD handler[4];
  id v12[2];
  id location;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
  -[HUQuickControlContainerView setPhoneCallStatusUpdateTimer:](self, "setPhoneCallStatusUpdateTimer:", v4);

  v5 = dispatch_time(0, 0);
  objc_initWeak(&location, self);
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v7;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@ Starting Phone Call Status Update Timer", buf, 0xCu);

  }
  -[HUQuickControlContainerView phoneCallStatusUpdateTimer](self, "phoneCallStatusUpdateTimer");
  v8 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __63__HUQuickControlContainerView__startPhoneCallStatusUpdateTimer__block_invoke;
  handler[3] = &unk_1E6F4E870;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a2;
  dispatch_source_set_event_handler(v8, handler);

  -[HUQuickControlContainerView phoneCallStatusUpdateTimer](self, "phoneCallStatusUpdateTimer");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_source_set_timer(v9, v5, 0x3B9ACA00uLL, 0);

  -[HUQuickControlContainerView phoneCallStatusUpdateTimer](self, "phoneCallStatusUpdateTimer");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v10);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __63__HUQuickControlContainerView__startPhoneCallStatusUpdateTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "%@ Now Updating Phone Call Status...", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(WeakRetained, "currentUserActivities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "currentDisambiguationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_configureDisambiguationForActivities:disambiguationContext:", v5, v6);

}

- (void)_invalidatePhoneCallStatusUpdateTimer
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@ Cancelling Phone Call Status Update Timer", (uint8_t *)&v7, 0xCu);

  }
  if (-[HUQuickControlContainerView _isPhoneCallStatusUpdateTimerActive](self, "_isPhoneCallStatusUpdateTimerActive"))
  {
    -[HUQuickControlContainerView phoneCallStatusUpdateTimer](self, "phoneCallStatusUpdateTimer");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v6);

  }
  -[HUQuickControlContainerView setPhoneCallStatusUpdateTimer:](self, "setPhoneCallStatusUpdateTimer:", 0);
}

- (BOOL)_isPhoneCallStatusUpdateTimerActive
{
  void *v3;
  NSObject *v4;
  BOOL v5;

  -[HUQuickControlContainerView phoneCallStatusUpdateTimer](self, "phoneCallStatusUpdateTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HUQuickControlContainerView phoneCallStatusUpdateTimer](self, "phoneCallStatusUpdateTimer");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_source_testcancel(v4) == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)didUpdateActivities:(id)a3 forProxControlID:(id)a4 disambiguationContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[HUQuickControlContainerView currentDisambiguationContext](self, "currentDisambiguationContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqual:", v14);

  HFLogForCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v17)
    {
      objc_msgSend(v11, "activity");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412290;
      v24 = v18;
      _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "NOT Updating summary view for PCActivity = [%@]", (uint8_t *)&v23, 0xCu);

    }
  }
  else
  {
    if (v17)
    {
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138413058;
      v24 = v19;
      v25 = 2112;
      v26 = v9;
      v27 = 2112;
      v28 = v10;
      v29 = 2112;
      v30 = v11;
      _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "%@ didUpdateActivities = %@ forProxControlID = %@ disambiguationContext = %@", (uint8_t *)&v23, 0x2Au);

    }
    objc_msgSend(v11, "activity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v11, "activity");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlContainerView setHasActivePhoneCall:](self, "setHasActivePhoneCall:", objc_msgSend(v21, "pcactivityType") == 0);

    }
    else
    {
      -[HUQuickControlContainerView setHasActivePhoneCall:](self, "setHasActivePhoneCall:", 0);
    }

    -[HUQuickControlContainerView setCurrentDisambiguationContext:](self, "setCurrentDisambiguationContext:", v11);
    -[HUQuickControlContainerView setCurrentUserActivities:](self, "setCurrentUserActivities:", v9);
    -[HUQuickControlContainerView _configureDisambiguationForActivities:disambiguationContext:](self, "_configureDisambiguationForActivities:disambiguationContext:", v9, v11);
    -[HUQuickControlContainerView _updateDisambiguationButtonVisible:](self, "_updateDisambiguationButtonVisible:", -[HUQuickControlContainerView _shouldShowDisambiguationButtonForUserActivities:disambiguationContext:](self, "_shouldShowDisambiguationButtonForUserActivities:disambiguationContext:", v9, v11));
    HFLogForCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1B8E1E000, v22, OS_LOG_TYPE_DEFAULT, "Calling setNeedsLayout inside didUpdateActivities", (uint8_t *)&v23, 2u);
    }

    -[HUQuickControlContainerView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (double)controlTransitionProgress
{
  return self->_controlTransitionProgress;
}

- (double)chromeTransitionProgress
{
  return self->_chromeTransitionProgress;
}

- (double)initialSourceViewScale
{
  return self->_initialSourceViewScale;
}

- (BOOL)shouldShowActiveControl
{
  return self->_shouldShowActiveControl;
}

- (BOOL)shouldShowDetailsButton
{
  return self->_shouldShowDetailsButton;
}

- (unint64_t)edgesForExtendedLayout
{
  return self->_edgesForExtendedLayout;
}

- (UIView)activeControlView
{
  return self->_activeControlView;
}

- (UILayoutGuide)controlViewPreferredFrameLayoutGuide
{
  return self->_controlViewPreferredFrameLayoutGuide;
}

- (void)setControlViewPreferredFrameLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_controlViewPreferredFrameLayoutGuide, a3);
}

- (UILayoutGuide)standardViewportFromParentGuide
{
  return self->_standardViewportFromParentGuide;
}

- (BOOL)controlViewSupportsTransformTransition
{
  return self->_controlViewSupportsTransformTransition;
}

- (void)setControlViewSupportsTransformTransition:(BOOL)a3
{
  self->_controlViewSupportsTransformTransition = a3;
}

- (CGRect)sourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (HUQuickControlSummaryView)summaryView
{
  return self->_summaryView;
}

- (void)setSummaryView:(id)a3
{
  objc_storeStrong((id *)&self->_summaryView, a3);
}

- (HUQuickControlContainerViewDelegate)delegate
{
  return (HUQuickControlContainerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (HUControlHostView)controlHostView
{
  return self->_controlHostView;
}

- (void)setControlHostView:(id)a3
{
  objc_storeStrong((id *)&self->_controlHostView, a3);
}

- (UILayoutGuide)controlViewLayoutGuide
{
  return self->_controlViewLayoutGuide;
}

- (void)setControlViewLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_controlViewLayoutGuide, a3);
}

- (UILayoutGuide)cardViewLayoutGuide
{
  return self->_cardViewLayoutGuide;
}

- (void)setCardViewLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_cardViewLayoutGuide, a3);
}

- (NSArray)contentConstraints
{
  return self->_contentConstraints;
}

- (void)setContentConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_contentConstraints, a3);
}

- (NSArray)maxHeightConstraints
{
  return self->_maxHeightConstraints;
}

- (void)setMaxHeightConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_maxHeightConstraints, a3);
}

- (NSLayoutConstraint)compactControlBottomConstraint
{
  return self->_compactControlBottomConstraint;
}

- (void)setCompactControlBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_compactControlBottomConstraint, a3);
}

- (HUQuickControlAuxiliaryHostView)auxiliaryHostView
{
  return self->_auxiliaryHostView;
}

- (void)setAuxiliaryHostView:(id)a3
{
  objc_storeStrong((id *)&self->_auxiliaryHostView, a3);
}

- (HUQuickControlButtonRowView)buttonRowView
{
  return self->_buttonRowView;
}

- (void)setButtonRowView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonRowView, a3);
}

- (UIButton)detailsButton
{
  return self->_detailsButton;
}

- (void)setDetailsButton:(id)a3
{
  objc_storeStrong((id *)&self->_detailsButton, a3);
}

- (UILayoutGuide)contentToAuxiliarySpacingLayoutGuide
{
  return self->_contentToAuxiliarySpacingLayoutGuide;
}

- (void)setContentToAuxiliarySpacingLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_contentToAuxiliarySpacingLayoutGuide, a3);
}

- (UILayoutGuide)topToSummarySpacingLayoutGuide
{
  return self->_topToSummarySpacingLayoutGuide;
}

- (void)setTopToSummarySpacingLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_topToSummarySpacingLayoutGuide, a3);
}

- (BOOL)isExternallyAnimating
{
  return self->_isExternallyAnimating;
}

- (PLPillControl)disambiguationButton
{
  return self->_disambiguationButton;
}

- (void)setDisambiguationButton:(id)a3
{
  objc_storeStrong((id *)&self->_disambiguationButton, a3);
}

- (BOOL)isDisambiguationButtonAnimating
{
  return self->_isDisambiguationButtonAnimating;
}

- (void)setIsDisambiguationButtonAnimating:(BOOL)a3
{
  self->_isDisambiguationButtonAnimating = a3;
}

- (NSAttributedString)disambiguationButtonPrimaryText
{
  return self->_disambiguationButtonPrimaryText;
}

- (void)setDisambiguationButtonPrimaryText:(id)a3
{
  objc_storeStrong((id *)&self->_disambiguationButtonPrimaryText, a3);
}

- (NSString)disambiguationButtonSecondaryText
{
  return self->_disambiguationButtonSecondaryText;
}

- (void)setDisambiguationButtonSecondaryText:(id)a3
{
  objc_storeStrong((id *)&self->_disambiguationButtonSecondaryText, a3);
}

- (UIImageView)disambiguationButtonLeadingImageView
{
  return self->_disambiguationButtonLeadingImageView;
}

- (void)setDisambiguationButtonLeadingImageView:(id)a3
{
  objc_storeStrong((id *)&self->_disambiguationButtonLeadingImageView, a3);
}

- (NSLayoutConstraint)disambiguationButtonHeightConstraint
{
  return self->_disambiguationButtonHeightConstraint;
}

- (void)setDisambiguationButtonHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_disambiguationButtonHeightConstraint, a3);
}

- (NSLayoutConstraint)disambiguationButtonTopConstraint
{
  return self->_disambiguationButtonTopConstraint;
}

- (void)setDisambiguationButtonTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_disambiguationButtonTopConstraint, a3);
}

- (NSLayoutConstraint)controlHostViewTopConstraintToView
{
  return self->_controlHostViewTopConstraintToView;
}

- (void)setControlHostViewTopConstraintToView:(id)a3
{
  objc_storeStrong((id *)&self->_controlHostViewTopConstraintToView, a3);
}

- (PCDisambiguationContext)currentDisambiguationContext
{
  return self->_currentDisambiguationContext;
}

- (void)setCurrentDisambiguationContext:(id)a3
{
  objc_storeStrong((id *)&self->_currentDisambiguationContext, a3);
}

- (NSOrderedSet)currentUserActivities
{
  return self->_currentUserActivities;
}

- (void)setCurrentUserActivities:(id)a3
{
  objc_storeStrong((id *)&self->_currentUserActivities, a3);
}

- (BOOL)hasActivePhoneCall
{
  return self->_hasActivePhoneCall;
}

- (void)setHasActivePhoneCall:(BOOL)a3
{
  self->_hasActivePhoneCall = a3;
}

- (OS_dispatch_source)phoneCallStatusUpdateTimer
{
  return self->_phoneCallStatusUpdateTimer;
}

- (void)setPhoneCallStatusUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_phoneCallStatusUpdateTimer, a3);
}

- (PCActivity)lastActivity
{
  return self->_lastActivity;
}

- (void)setLastActivity:(id)a3
{
  objc_storeStrong((id *)&self->_lastActivity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActivity, 0);
  objc_storeStrong((id *)&self->_phoneCallStatusUpdateTimer, 0);
  objc_storeStrong((id *)&self->_currentUserActivities, 0);
  objc_storeStrong((id *)&self->_currentDisambiguationContext, 0);
  objc_storeStrong((id *)&self->_controlHostViewTopConstraintToView, 0);
  objc_storeStrong((id *)&self->_disambiguationButtonTopConstraint, 0);
  objc_storeStrong((id *)&self->_disambiguationButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_disambiguationButtonLeadingImageView, 0);
  objc_storeStrong((id *)&self->_disambiguationButtonSecondaryText, 0);
  objc_storeStrong((id *)&self->_disambiguationButtonPrimaryText, 0);
  objc_storeStrong((id *)&self->_disambiguationButton, 0);
  objc_storeStrong((id *)&self->_topToSummarySpacingLayoutGuide, 0);
  objc_storeStrong((id *)&self->_contentToAuxiliarySpacingLayoutGuide, 0);
  objc_storeStrong((id *)&self->_detailsButton, 0);
  objc_storeStrong((id *)&self->_buttonRowView, 0);
  objc_storeStrong((id *)&self->_auxiliaryHostView, 0);
  objc_storeStrong((id *)&self->_compactControlBottomConstraint, 0);
  objc_storeStrong((id *)&self->_maxHeightConstraints, 0);
  objc_storeStrong((id *)&self->_contentConstraints, 0);
  objc_storeStrong((id *)&self->_cardViewLayoutGuide, 0);
  objc_storeStrong((id *)&self->_controlViewLayoutGuide, 0);
  objc_storeStrong((id *)&self->_controlHostView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_summaryView, 0);
  objc_storeStrong((id *)&self->_standardViewportFromParentGuide, 0);
  objc_storeStrong((id *)&self->_controlViewPreferredFrameLayoutGuide, 0);
  objc_storeStrong((id *)&self->_activeControlView, 0);
}

@end
