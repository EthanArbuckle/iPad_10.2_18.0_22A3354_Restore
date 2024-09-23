@implementation CPUITransportControlView

- (CPUITransportControlView)initWithFrame:(CGRect)a3
{
  CPUITransportControlView *v3;
  uint64_t v4;
  CPUIModernButton *playPauseButton;
  void *v6;
  uint64_t v7;
  CPUIModernButton *leftButton;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  CPUIModernButton *fastForwardButton;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  UIImage *pauseImage;
  void *v27;
  uint64_t v28;
  UIImage *defaultLeftButtonImage;
  void *v30;
  uint64_t v31;
  UIImage *defaultFastForwardButtonImage;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  CPUIModernButton *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  objc_super v46;
  _QWORD v47[5];
  _QWORD v48[5];

  v48[4] = *MEMORY[0x24BDAC8D0];
  v46.receiver = self;
  v46.super_class = (Class)CPUITransportControlView;
  v3 = -[CPUITransportControlView initWithFrame:](&v46, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    playPauseButton = v3->_playPauseButton;
    v3->_playPauseButton = (CPUIModernButton *)v4;

    -[CPUIModernButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_playPauseButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPUIModernButton setContentMode:](v3->_playPauseButton, "setContentMode:", 1);
    -[CPUIModernButton imageView](v3->_playPauseButton, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentMode:", 1);

    -[CPUIModernButton _setContinuousCornerRadius:](v3->_playPauseButton, "_setContinuousCornerRadius:", 10.0);
    -[CPUIModernButton setPrefersWhiteInDefaultState:](v3->_playPauseButton, "setPrefersWhiteInDefaultState:", 1);
    -[CPUIModernButton setAccessibilityIdentifier:](v3->_playPauseButton, "setAccessibilityIdentifier:", CFSTR("CPNowPlayingPlayPauseStopButton"));
    -[CPUITransportControlView addSubview:](v3, "addSubview:", v3->_playPauseButton);
    v7 = objc_opt_new();
    leftButton = v3->_leftButton;
    v3->_leftButton = (CPUIModernButton *)v7;

    -[CPUIModernButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_leftButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPUIModernButton setContentMode:](v3->_leftButton, "setContentMode:", 1);
    -[CPUIModernButton imageView](v3->_leftButton, "imageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContentMode:", 1);

    -[CPUIModernButton _setContinuousCornerRadius:](v3->_leftButton, "_setContinuousCornerRadius:", 10.0);
    -[CPUIModernButton setPrefersWhiteInDefaultState:](v3->_leftButton, "setPrefersWhiteInDefaultState:", 1);
    -[CPUIModernButton setAccessibilityIdentifier:](v3->_leftButton, "setAccessibilityIdentifier:", CFSTR("CPNowPlayingTransportLeftButton"));
    CPUILocalizedStringForKey(CFSTR("REWIND"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v10;
    CPUILocalizedStringForKey(CFSTR("JUMP_BACK"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v11;
    CPUILocalizedStringForKey(CFSTR("PREVIOUS_SONG"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v48[2] = v12;
    CPUILocalizedStringForKey(CFSTR("PREVIOUS_TRACK"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v48[3] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIModernButton setAccessibilityUserInputLabels:](v3->_leftButton, "setAccessibilityUserInputLabels:", v14);

    -[CPUITransportControlView addSubview:](v3, "addSubview:", v3->_leftButton);
    v15 = objc_opt_new();
    fastForwardButton = v3->_fastForwardButton;
    v3->_fastForwardButton = (CPUIModernButton *)v15;

    -[CPUIModernButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_fastForwardButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPUIModernButton setContentMode:](v3->_fastForwardButton, "setContentMode:", 1);
    -[CPUIModernButton imageView](v3->_fastForwardButton, "imageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setContentMode:", 1);

    -[CPUIModernButton _setContinuousCornerRadius:](v3->_fastForwardButton, "_setContinuousCornerRadius:", 10.0);
    -[CPUIModernButton setPrefersWhiteInDefaultState:](v3->_fastForwardButton, "setPrefersWhiteInDefaultState:", 1);
    -[CPUIModernButton setAccessibilityIdentifier:](v3->_fastForwardButton, "setAccessibilityIdentifier:", CFSTR("CPNowPlayingTransportRightButton"));
    CPUILocalizedStringForKey(CFSTR("FAST_FORWARD"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v18;
    CPUILocalizedStringForKey(CFSTR("SKIP_AHEAD"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v19;
    CPUILocalizedStringForKey(CFSTR("JUMP_FORWARD"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v20;
    CPUILocalizedStringForKey(CFSTR("NEXT_SONG"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v47[3] = v21;
    CPUILocalizedStringForKey(CFSTR("NEXT_TRACK"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v47[4] = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIModernButton setAccessibilityUserInputLabels:](v3->_fastForwardButton, "setAccessibilityUserInputLabels:", v23);

    -[CPUITransportControlView addSubview:](v3, "addSubview:", v3->_fastForwardButton);
    -[CPUITransportControlView traitCollection](v3, "traitCollection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    CPUIPauseGlyph(v24);
    v25 = objc_claimAutoreleasedReturnValue();
    pauseImage = v3->_pauseImage;
    v3->_pauseImage = (UIImage *)v25;

    -[CPUITransportControlView traitCollection](v3, "traitCollection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    CPUIBackGlyph(v27);
    v28 = objc_claimAutoreleasedReturnValue();
    defaultLeftButtonImage = v3->_defaultLeftButtonImage;
    v3->_defaultLeftButtonImage = (UIImage *)v28;

    -[CPUITransportControlView traitCollection](v3, "traitCollection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    CPUIForwardGlyph(v30);
    v31 = objc_claimAutoreleasedReturnValue();
    defaultFastForwardButtonImage = v3->_defaultFastForwardButtonImage;
    v3->_defaultFastForwardButtonImage = (UIImage *)v31;

    -[CPUITransportControlView defaultLeftButtonImage](v3, "defaultLeftButtonImage");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "imageWithRenderingMode:", 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "colorWithAlphaComponent:", 0.2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "imageWithTintColor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    -[CPUIModernButton setImage:forState:](v3->_leftButton, "setImage:forState:", v34, 0);
    -[CPUIModernButton setImage:forState:](v3->_leftButton, "setImage:forState:", v37, 1);
    -[CPUITransportControlView defaultFastForwardButtonImage](v3, "defaultFastForwardButtonImage");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "imageWithRenderingMode:", 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    -[CPUIModernButton setImage:forState:](v3->_fastForwardButton, "setImage:forState:", v39, 0);
    v40 = v3->_fastForwardButton;
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "colorWithAlphaComponent:", 0.2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "imageWithTintColor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIModernButton setImage:forState:](v40, "setImage:forState:", v43, 1);

    -[CPUITransportControlView setupConstraints](v3, "setupConstraints");
    -[CPUITransportControlView layer](v3, "layer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setAllowsGroupBlending:", 0);

  }
  return v3;
}

- (void)setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *containerHeightConstraint;
  double Width;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSLayoutConstraint *v22;
  NSArray *v23;
  NSArray *constraints;
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
  _QWORD v53[15];
  CGRect v54;

  v53[13] = *MEMORY[0x24BDAC8D0];
  -[CPUITransportControlView constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD1628];
    -[CPUITransportControlView constraints](self, "constraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v5);

  }
  -[CPUITransportControlView heightAnchor](self, "heightAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUITransportControlView buttonHeight](self, "buttonHeight");
  objc_msgSend(v6, "constraintEqualToConstant:");
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  containerHeightConstraint = self->_containerHeightConstraint;
  self->_containerHeightConstraint = v7;

  -[CPUITransportControlView bounds](self, "bounds");
  Width = CGRectGetWidth(v54);
  -[CPUITransportControlView buttonSpacing](self, "buttonSpacing");
  v11 = (Width + v10 * -2.0) / 3.0;
  -[CPUIModernButton heightAnchor](self->_playPauseButton, "heightAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUITransportControlView heightAnchor](self, "heightAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v51);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v50;
  -[CPUIModernButton heightAnchor](self->_leftButton, "heightAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUITransportControlView heightAnchor](self, "heightAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v47;
  -[CPUIModernButton heightAnchor](self->_fastForwardButton, "heightAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUITransportControlView heightAnchor](self, "heightAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v44;
  -[CPUIModernButton centerYAnchor](self->_playPauseButton, "centerYAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUITransportControlView centerYAnchor](self, "centerYAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v53[3] = v41;
  -[CPUIModernButton centerYAnchor](self->_leftButton, "centerYAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUITransportControlView centerYAnchor](self, "centerYAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v53[4] = v38;
  -[CPUIModernButton centerYAnchor](self->_fastForwardButton, "centerYAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUITransportControlView centerYAnchor](self, "centerYAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v53[5] = v35;
  -[CPUIModernButton centerXAnchor](self->_playPauseButton, "centerXAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUITransportControlView centerXAnchor](self, "centerXAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v53[6] = v32;
  -[CPUIModernButton rightAnchor](self->_leftButton, "rightAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIModernButton leftAnchor](self->_playPauseButton, "leftAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUITransportControlView buttonSpacing](self, "buttonSpacing");
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, -v12);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v53[7] = v29;
  -[CPUIModernButton leftAnchor](self->_fastForwardButton, "leftAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIModernButton rightAnchor](self->_playPauseButton, "rightAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUITransportControlView buttonSpacing](self, "buttonSpacing");
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v27);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v53[8] = v13;
  -[CPUIModernButton widthAnchor](self->_playPauseButton, "widthAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToConstant:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v53[9] = v15;
  -[CPUIModernButton widthAnchor](self->_leftButton, "widthAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIModernButton widthAnchor](self->_playPauseButton, "widthAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v53[10] = v18;
  -[CPUIModernButton widthAnchor](self->_fastForwardButton, "widthAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIModernButton widthAnchor](self->_playPauseButton, "widthAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = self->_containerHeightConstraint;
  v53[11] = v21;
  v53[12] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 13);
  v23 = (NSArray *)objc_claimAutoreleasedReturnValue();
  constraints = self->_constraints;
  self->_constraints = v23;

  v25 = (void *)MEMORY[0x24BDD1628];
  -[CPUITransportControlView constraints](self, "constraints");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "activateConstraints:", v26);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPUITransportControlView;
  -[CPUITransportControlView layoutSubviews](&v3, sel_layoutSubviews);
  -[CPUITransportControlView setupConstraints](self, "setupConstraints");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPUITransportControlView;
  -[CPUITransportControlView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[CPUITransportControlView _updatePlayPauseButton](self, "_updatePlayPauseButton");
}

- (void)updateConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPUITransportControlView;
  -[CPUITransportControlView updateConstraints](&v3, sel_updateConstraints);
  -[CPUITransportControlView setupConstraints](self, "setupConstraints");
}

- (void)setButtonHeight:(double)a3
{
  self->_buttonHeight = a3;
  -[CPUITransportControlView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setButtonSpacing:(double)a3
{
  self->_buttonSpacing = a3;
  -[CPUITransportControlView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)_updatePlayPauseButton
{
  _BOOL4 progressActive;
  CPUIModernButton *playPauseButton;
  uint64_t v5;
  CPUIModernButton *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  progressActive = self->_progressActive;
  playPauseButton = self->_playPauseButton;
  if (progressActive)
    v5 = 504;
  else
    v5 = 496;
  -[CPUIModernButton setImage:forState:](playPauseButton, "setImage:forState:", *(Class *)((char *)&self->super.super.super.isa + v5), 0);
  v6 = self->_playPauseButton;
  v7 = *(Class *)((char *)&self->super.super.super.isa + v5);
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "colorWithAlphaComponent:", 0.2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithTintColor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIModernButton setImage:forState:](v6, "setImage:forState:", v10, 1);

  -[CPUITransportControlView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setProgressActive:(BOOL)a3
{
  if (self->_progressActive != a3)
  {
    self->_progressActive = a3;
    -[CPUITransportControlView _updatePlayPauseButton](self, "_updatePlayPauseButton");
  }
}

- (void)setPlayButtonImageName:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_playButtonImageName, a3);
  v5 = a3;
  -[CPUITransportControlView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _CPUIGlyphFactoryWithTraitCollection(v5, 7, v6, 26.0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CPUITransportControlView setPlayImage:](self, "setPlayImage:", v7);
  -[CPUITransportControlView _updatePlayPauseButton](self, "_updatePlayPauseButton");

}

- (void)setPauseButtonImageName:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_pauseButtonImageName, a3);
  v5 = a3;
  -[CPUITransportControlView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _CPUIGlyphFactoryWithTraitCollection(v5, 7, v6, 26.0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CPUITransportControlView setPauseImage:](self, "setPauseImage:", v7);
  -[CPUITransportControlView _updatePlayPauseButton](self, "_updatePlayPauseButton");

}

- (double)buttonHeight
{
  return self->_buttonHeight;
}

- (double)buttonSpacing
{
  return self->_buttonSpacing;
}

- (CPUIModernButton)leftButton
{
  return self->_leftButton;
}

- (CPUIModernButton)playPauseButton
{
  return self->_playPauseButton;
}

- (CPUIModernButton)fastForwardButton
{
  return self->_fastForwardButton;
}

- (BOOL)progressActive
{
  return self->_progressActive;
}

- (NSString)playButtonImageName
{
  return self->_playButtonImageName;
}

- (NSString)pauseButtonImageName
{
  return self->_pauseButtonImageName;
}

- (UIImage)defaultLeftButtonImage
{
  return self->_defaultLeftButtonImage;
}

- (void)setDefaultLeftButtonImage:(id)a3
{
  objc_storeStrong((id *)&self->_defaultLeftButtonImage, a3);
}

- (UIImage)defaultFastForwardButtonImage
{
  return self->_defaultFastForwardButtonImage;
}

- (void)setDefaultFastForwardButtonImage:(id)a3
{
  objc_storeStrong((id *)&self->_defaultFastForwardButtonImage, a3);
}

- (UIImage)playImage
{
  return self->_playImage;
}

- (void)setPlayImage:(id)a3
{
  objc_storeStrong((id *)&self->_playImage, a3);
}

- (UIImage)pauseImage
{
  return self->_pauseImage;
}

- (void)setPauseImage:(id)a3
{
  objc_storeStrong((id *)&self->_pauseImage, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (NSLayoutConstraint)containerHeightConstraint
{
  return self->_containerHeightConstraint;
}

- (void)setContainerHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_containerHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_pauseImage, 0);
  objc_storeStrong((id *)&self->_playImage, 0);
  objc_storeStrong((id *)&self->_defaultFastForwardButtonImage, 0);
  objc_storeStrong((id *)&self->_defaultLeftButtonImage, 0);
  objc_storeStrong((id *)&self->_pauseButtonImageName, 0);
  objc_storeStrong((id *)&self->_playButtonImageName, 0);
  objc_storeStrong((id *)&self->_fastForwardButton, 0);
  objc_storeStrong((id *)&self->_playPauseButton, 0);
  objc_storeStrong((id *)&self->_leftButton, 0);
}

@end
