@implementation HUClipScrubberAccessoryToggleView

- (HUClipScrubberAccessoryToggleView)initWithFrame:(CGRect)a3
{
  HUClipScrubberAccessoryToggleView *v3;
  HUClipScrubberAccessoryToggleView *v4;
  UIView *v5;
  UIView *backgroundView;
  UIView *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUClipScrubberAccessoryToggleView;
  v3 = -[HUClipScrubberAccessoryToggleView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[HUClipScrubberAccessoryToggleView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0C8B3F8]);
    -[UIView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
    -[HUClipScrubberAccessoryToggleView bounds](v4, "bounds");
    -[UIView setFrame:](v5, "setFrame:");
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = v5;
    v7 = v5;

    -[HUClipScrubberAccessoryToggleView addSubview:](v4, "addSubview:", v7);
    -[HUClipScrubberAccessoryToggleView liveButton](v4, "liveButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUClipScrubberAccessoryToggleView addSubview:](v4, "addSubview:", v8);

    -[HUClipScrubberAccessoryToggleView accessoryButton](v4, "accessoryButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUClipScrubberAccessoryToggleView addSubview:](v4, "addSubview:", v9);

    -[HUClipScrubberAccessoryToggleView layer](v4, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCornerRadius:", 16.0);

    -[HUClipScrubberAccessoryToggleView setClipsToBounds:](v4, "setClipsToBounds:", 1);
  }
  return v4;
}

- (void)displayForTimelineState:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  -[HUClipScrubberAccessoryToggleView liveButton](self, "liveButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 == 1)
  {
    objc_msgSend(v5, "setHidden:", 1);

    -[HUClipScrubberAccessoryToggleView accessoryButton](self, "accessoryButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v8 = 0;
  }
  else
  {
    objc_msgSend(v5, "setHidden:", 0);

    -[HUClipScrubberAccessoryToggleView accessoryButton](self, "accessoryButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v8 = 1;
  }
  objc_msgSend(v7, "setHidden:", v8);

}

- (UIButton)accessoryButton
{
  UIButton *accessoryButton;
  UIButton *v4;
  void *v5;
  UIButton *v6;

  accessoryButton = self->_accessoryButton;
  if (!accessoryButton)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "hu_clipScrubberNearbyAccessoryButton");
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    -[HUClipScrubberAccessoryToggleView bounds](self, "bounds");
    -[UIButton setFrame:](v4, "setFrame:");
    -[UIButton layer](v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerRadius:", 16.0);

    -[UIButton setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
    v6 = self->_accessoryButton;
    self->_accessoryButton = v4;

    accessoryButton = self->_accessoryButton;
  }
  return accessoryButton;
}

- (UIButton)liveButton
{
  UIButton *liveButton;
  UIButton *v4;
  UIButton *v5;

  liveButton = self->_liveButton;
  if (!liveButton)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "hu_clipScrubberLiveButton");
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    -[HUClipScrubberAccessoryToggleView bounds](self, "bounds");
    -[UIButton setFrame:](v4, "setFrame:");
    -[UIButton setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
    -[UIButton setHidden:](v4, "setHidden:", 1);
    v5 = self->_liveButton;
    self->_liveButton = v4;

    liveButton = self->_liveButton;
  }
  return liveButton;
}

- (void)displayWithoutBackgroundVisualEffects
{
  id v2;

  -[HUClipScrubberAccessoryToggleView backgroundView](self, "backgroundView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 1);

}

- (void)setAccessoryButton:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryButton, a3);
}

- (void)setLiveButton:(id)a3
{
  objc_storeStrong((id *)&self->_liveButton, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_liveButton, 0);
  objc_storeStrong((id *)&self->_accessoryButton, 0);
}

@end
