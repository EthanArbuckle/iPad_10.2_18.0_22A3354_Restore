@implementation MediaControlsRelativeVolumeStepper

- (MediaControlsRelativeVolumeStepper)initWithFrame:(CGRect)a3
{
  MediaControlsRelativeVolumeStepper *v3;
  uint64_t v4;
  NSBundle *mediaControlsBundle;
  uint64_t v6;
  MTMaterialView *decreaseBackground;
  uint64_t v8;
  MPButton *decreaseButton;
  MPButton *v10;
  void *v11;
  uint64_t v12;
  MTMaterialView *increaseBackground;
  uint64_t v14;
  MPButton *increaseButton;
  MPButton *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
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
  objc_super v44;
  _QWORD v45[10];

  v45[8] = *MEMORY[0x1E0C80C00];
  v44.receiver = self;
  v44.super_class = (Class)MediaControlsRelativeVolumeStepper;
  v3 = -[MediaControlsRelativeVolumeStepper initWithFrame:](&v44, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mediaControlsBundle");
    v4 = objc_claimAutoreleasedReturnValue();
    mediaControlsBundle = v3->_mediaControlsBundle;
    v3->_mediaControlsBundle = (NSBundle *)v4;

    objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:configuration:", 4, 4);
    v6 = objc_claimAutoreleasedReturnValue();
    decreaseBackground = v3->_decreaseBackground;
    v3->_decreaseBackground = (MTMaterialView *)v6;

    -[MTMaterialView setClipsToBounds:](v3->_decreaseBackground, "setClipsToBounds:", 1);
    -[MediaControlsRelativeVolumeStepper addSubview:](v3, "addSubview:", v3->_decreaseBackground);
    objc_msgSend(MEMORY[0x1E0CC2340], "easyTouchButtonWithType:", 0);
    v8 = objc_claimAutoreleasedReturnValue();
    decreaseButton = v3->_decreaseButton;
    v3->_decreaseButton = (MPButton *)v8;

    -[MPButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_decreaseButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = v3->_decreaseButton;
    +[MediaControlsTheme volumeMinImage](MediaControlsTheme, "volumeMinImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPButton setImage:forState:](v10, "setImage:forState:", v11, 0);

    -[MediaControlsRelativeVolumeStepper addSubview:](v3, "addSubview:", v3->_decreaseButton);
    objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:configuration:", 4, 4);
    v12 = objc_claimAutoreleasedReturnValue();
    increaseBackground = v3->_increaseBackground;
    v3->_increaseBackground = (MTMaterialView *)v12;

    -[MTMaterialView setClipsToBounds:](v3->_increaseBackground, "setClipsToBounds:", 1);
    -[MediaControlsRelativeVolumeStepper addSubview:](v3, "addSubview:", v3->_increaseBackground);
    objc_msgSend(MEMORY[0x1E0CC2340], "easyTouchButtonWithType:", 0);
    v14 = objc_claimAutoreleasedReturnValue();
    increaseButton = v3->_increaseButton;
    v3->_increaseButton = (MPButton *)v14;

    -[MPButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_increaseButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v16 = v3->_increaseButton;
    +[MediaControlsTheme volumeMaxImage](MediaControlsTheme, "volumeMaxImage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPButton setImage:forState:](v16, "setImage:forState:", v17, 0);

    -[MediaControlsRelativeVolumeStepper addSubview:](v3, "addSubview:", v3->_increaseButton);
    -[MPButton addTarget:action:forControlEvents:](v3->_decreaseButton, "addTarget:action:forControlEvents:", v3, sel_decreaseTouchUpInside_, 64);
    -[MPButton addTarget:action:forControlEvents:](v3->_decreaseButton, "addTarget:action:forControlEvents:", v3, sel_decreaseButtonHoldBegan_, 0x1000000);
    -[MPButton addTarget:action:forControlEvents:](v3->_decreaseButton, "addTarget:action:forControlEvents:", v3, sel_decreaseButtonHoldReleased_, 0x2000000);
    -[MPButton addTarget:action:forControlEvents:](v3->_increaseButton, "addTarget:action:forControlEvents:", v3, sel_increaseTouchUpInside_, 64);
    -[MPButton addTarget:action:forControlEvents:](v3->_increaseButton, "addTarget:action:forControlEvents:", v3, sel_increaseButtonHoldBegan_, 0x1000000);
    -[MPButton addTarget:action:forControlEvents:](v3->_increaseButton, "addTarget:action:forControlEvents:", v3, sel_increaseButtonHoldReleased_, 0x2000000);
    -[MPButton trailingAnchor](v3->_increaseButton, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsRelativeVolumeStepper trailingAnchor](v3, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v20) = 1148829696;
    objc_msgSend(v43, "setPriority:", v20);
    v34 = (void *)MEMORY[0x1E0CB3718];
    -[MPButton leadingAnchor](v3->_decreaseButton, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsRelativeVolumeStepper leadingAnchor](v3, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v40;
    -[MPButton heightAnchor](v3->_decreaseButton, "heightAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToConstant:", 28.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v38;
    -[MPButton centerYAnchor](v3->_decreaseButton, "centerYAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsRelativeVolumeStepper centerYAnchor](v3, "centerYAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2] = v35;
    -[MPButton widthAnchor](v3->_decreaseButton, "widthAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPButton widthAnchor](v3->_increaseButton, "widthAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v45[3] = v31;
    -[MPButton leadingAnchor](v3->_increaseButton, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPButton trailingAnchor](v3->_decreaseButton, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, 7.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v45[4] = v23;
    -[MPButton heightAnchor](v3->_increaseButton, "heightAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToConstant:", 28.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v45[5] = v25;
    -[MPButton centerYAnchor](v3->_increaseButton, "centerYAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsRelativeVolumeStepper centerYAnchor](v3, "centerYAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v45[6] = v28;
    v45[7] = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "activateConstraints:", v29);

  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;
  CGRect v5;

  v3.receiver = self;
  v3.super_class = (Class)MediaControlsRelativeVolumeStepper;
  -[MediaControlsRelativeVolumeStepper layoutSubviews](&v3, sel_layoutSubviews);
  -[MPButton frame](self->_decreaseButton, "frame");
  -[MTMaterialView setFrame:](self->_decreaseBackground, "setFrame:");
  -[MPButton frame](self->_decreaseButton, "frame");
  -[MTMaterialView _setContinuousCornerRadius:](self->_decreaseBackground, "_setContinuousCornerRadius:", CGRectGetHeight(v4) * 0.5);
  -[MPButton frame](self->_increaseButton, "frame");
  -[MTMaterialView setFrame:](self->_increaseBackground, "setFrame:");
  -[MPButton frame](self->_increaseButton, "frame");
  -[MTMaterialView _setContinuousCornerRadius:](self->_increaseBackground, "_setContinuousCornerRadius:", CGRectGetHeight(v5) * 0.5);
}

- (void)decreaseTouchUpInside:(id)a3
{
  -[MPVolumeController decreaseVolume](self->_volumeController, "decreaseVolume", a3);
}

- (void)decreaseButtonHoldBegan:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[MPVolumeController beginDecreasingRelativeVolume](self->_volumeController, "beginDecreasingRelativeVolume");
}

- (void)decreaseButtonHoldReleased:(id)a3
{
  if (-[MPButton isHolding](self->_decreaseButton, "isHolding", a3))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[MPVolumeController endDecreasingRelativeVolume](self->_volumeController, "endDecreasingRelativeVolume");
  }
}

- (void)increaseTouchUpInside:(id)a3
{
  -[MPVolumeController increaseVolume](self->_volumeController, "increaseVolume", a3);
}

- (void)increaseButtonHoldBegan:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[MPVolumeController beginIncreasingRelativeVolume](self->_volumeController, "beginIncreasingRelativeVolume");
}

- (void)increaseButtonHoldReleased:(id)a3
{
  if (-[MPButton isHolding](self->_increaseButton, "isHolding", a3))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[MPVolumeController endIncreasingRelativeVolume](self->_volumeController, "endIncreasingRelativeVolume");
  }
}

- (void)setVisualStylingProvider:(id)a3
{
  MTVisualStylingProvider *v5;
  MTVisualStylingProvider **p_visualStylingProvider;
  MTVisualStylingProvider *visualStylingProvider;
  void *v8;
  MTVisualStylingProvider *v9;
  void *v10;
  MTVisualStylingProvider *v11;
  void *v12;
  MTVisualStylingProvider *v13;
  void *v14;
  MTVisualStylingProvider *v15;

  v5 = (MTVisualStylingProvider *)a3;
  p_visualStylingProvider = &self->_visualStylingProvider;
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider != v5)
  {
    v15 = v5;
    -[MPButton imageView](self->_decreaseButton, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](visualStylingProvider, "stopAutomaticallyUpdatingView:", v8);

    v9 = *p_visualStylingProvider;
    -[MPButton imageView](self->_increaseButton, "imageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](v9, "stopAutomaticallyUpdatingView:", v10);

    objc_storeStrong((id *)&self->_visualStylingProvider, a3);
    v11 = *p_visualStylingProvider;
    -[MPButton imageView](self->_decreaseButton, "imageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](v11, "automaticallyUpdateView:withStyle:", v12, 0);

    v13 = *p_visualStylingProvider;
    -[MPButton imageView](self->_increaseButton, "imageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](v13, "automaticallyUpdateView:withStyle:", v14, 0);

    v5 = v15;
  }

}

- (MPVolumeController)volumeController
{
  return self->_volumeController;
}

- (void)setVolumeController:(id)a3
{
  objc_storeStrong((id *)&self->_volumeController, a3);
}

- (MTVisualStylingProvider)visualStylingProvider
{
  return self->_visualStylingProvider;
}

- (MTMaterialView)increaseBackground
{
  return self->_increaseBackground;
}

- (void)setIncreaseBackground:(id)a3
{
  objc_storeStrong((id *)&self->_increaseBackground, a3);
}

- (MTMaterialView)decreaseBackground
{
  return self->_decreaseBackground;
}

- (void)setDecreaseBackground:(id)a3
{
  objc_storeStrong((id *)&self->_decreaseBackground, a3);
}

- (MPButton)increaseButton
{
  return self->_increaseButton;
}

- (void)setIncreaseButton:(id)a3
{
  objc_storeStrong((id *)&self->_increaseButton, a3);
}

- (MPButton)decreaseButton
{
  return self->_decreaseButton;
}

- (void)setDecreaseButton:(id)a3
{
  objc_storeStrong((id *)&self->_decreaseButton, a3);
}

- (NSBundle)mediaControlsBundle
{
  return self->_mediaControlsBundle;
}

- (void)setMediaControlsBundle:(id)a3
{
  objc_storeStrong((id *)&self->_mediaControlsBundle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaControlsBundle, 0);
  objc_storeStrong((id *)&self->_decreaseButton, 0);
  objc_storeStrong((id *)&self->_increaseButton, 0);
  objc_storeStrong((id *)&self->_decreaseBackground, 0);
  objc_storeStrong((id *)&self->_increaseBackground, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);
}

@end
