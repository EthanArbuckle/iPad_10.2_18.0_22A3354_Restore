@implementation MPVolumeView

- (MPVolumeView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  MPVolumeView *v5;
  MPVolumeView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MPVolumeView;
  v5 = -[MPVolumeView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
    -[MPVolumeView _initWithStyle:](v5, "_initWithStyle:", a4);
  return v6;
}

- (void)_initWithStyle:(int64_t)a3
{
  MPAVLightweightRoutingController *v4;
  objc_class *v5;
  void *v6;
  MPAVLightweightRoutingController *v7;
  MPAVLightweightRoutingController *lightweightRoutingController;
  id v9;

  self->_style = a3;
  self->_showsVolumeSlider = 1;
  self->_showsRouteButton = dyld_program_sdk_at_least() ^ 1;
  v4 = [MPAVLightweightRoutingController alloc];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MPAVLightweightRoutingController initWithName:](v4, "initWithName:", v6);
  lightweightRoutingController = self->_lightweightRoutingController;
  self->_lightweightRoutingController = v7;

  -[MPAVLightweightRoutingController setDelegate:](self->_lightweightRoutingController, "setDelegate:", self);
  -[MPVolumeView _createSubviews](self, "_createSubviews");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__applicationDidEnterBackgroundNotification_, *MEMORY[0x1E0DC4768], 0);
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__applicationWillEnterForegroundNotification_, *MEMORY[0x1E0DC4860], 0);
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__volumeSliderVolumeControlAvailabilityDidChangeNotification_, CFSTR("MPVolumeSliderVolumeControlAvailabilityDidChangeNotification"), self->_volumeSlider);

}

- (void)_createSubviews
{
  MPVolumeSlider *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  UIButton *v11;
  UIButton *routeButton;
  void *v13;
  void *v14;
  uint64_t v15;
  UIButton *v16;
  void *v17;
  double v18;
  double v19;
  MPVolumeSlider *v20;

  -[MPVolumeView setOpaque:](self, "setOpaque:", 0);
  -[MPVolumeView setClipsToBounds:](self, "setClipsToBounds:", 0);
  v3 = [MPVolumeSlider alloc];
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v20 = -[MPVolumeSlider initWithFrame:style:](v3, "initWithFrame:style:", self->_style, *MEMORY[0x1E0C9D648], v5, v6, v7);
  objc_storeStrong((id *)&self->_volumeSlider, v20);
  -[MPVolumeSlider setAutoresizingMask:](v20, "setAutoresizingMask:", 34);
  -[MPVolumeView addSubview:](self, "addSubview:", v20);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
  objc_storeStrong((id *)&self->_routeLabel, v8);
  objc_msgSend(v8, "setAutoresizingMask:", 34);
  objc_msgSend(MEMORY[0x1E0DC37E8], "boldSystemFontOfSize:", 13.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v9);

  objc_msgSend(v8, "setTextAlignment:", 1);
  objc_msgSend(v8, "setBackgroundColor:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v10);

  objc_msgSend(v8, "setOpaque:", 0);
  -[MPVolumeView addSubview:](self, "addSubview:", v8);
  +[MPButton easyTouchButtonWithType:](MPButton, "easyTouchButtonWithType:", 0);
  v11 = (UIButton *)objc_claimAutoreleasedReturnValue();
  routeButton = self->_routeButton;
  self->_routeButton = v11;

  -[UIButton setSelected:](self->_routeButton, "setSelected:", 0);
  -[UIButton setAlpha:](self->_routeButton, "setAlpha:", 0.0);
  -[MPVolumeView _defaultRouteButtonImageAsSelected:](self, "_defaultRouteButtonImageAsSelected:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_style == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_flatImageWithColor:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v15;
  }
  -[UIButton setImage:forState:](self->_routeButton, "setImage:forState:", v13, 0);
  v16 = self->_routeButton;
  -[MPVolumeView _defaultRouteButtonImageAsSelected:](self, "_defaultRouteButtonImageAsSelected:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setImage:forState:](v16, "setImage:forState:", v17, 4);

  -[UIButton setShowsTouchWhenHighlighted:](self->_routeButton, "setShowsTouchWhenHighlighted:", 1);
  -[UIButton setAutoresizingMask:](self->_routeButton, "setAutoresizingMask:", 33);
  objc_msgSend(v13, "size");
  -[UIButton setFrame:](self->_routeButton, "setFrame:", v4, v5, v18, v19);
  -[UIButton addTarget:action:forControlEvents:](self->_routeButton, "addTarget:action:forControlEvents:", self, sel__displayAudioRoutePicker, 64);
  -[UIButton addTarget:action:forControlEvents:](self->_routeButton, "addTarget:action:forControlEvents:", self, sel__startPrewarmingAudioRoutePicker, 1);
  -[UIButton addTarget:action:forControlEvents:](self->_routeButton, "addTarget:action:forControlEvents:", self, sel__stopPrewarmingAudioRoutePicker, 128);
  -[MPVolumeView addSubview:](self, "addSubview:", self->_routeButton);

}

- (id)_defaultRouteButtonImageAsSelected:(BOOL)a3
{
  __CFString *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  v3 = CFSTR("airplay");
  if (a3)
    v3 = CFSTR("airplay_on");
  v4 = (void *)MEMORY[0x1E0DC3870];
  v5 = (void *)MEMORY[0x1E0CB34D0];
  v6 = v3;
  objc_msgSend(v5, "mediaPlayerBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageNamed:inBundle:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (MPVolumeView)initWithFrame:(CGRect)a3
{
  return -[MPVolumeView initWithFrame:style:](self, "initWithFrame:style:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[MPAVLightweightRoutingController setDelegate:](self->_lightweightRoutingController, "setDelegate:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4768], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4860], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("MPVolumeSliderVolumeControlAvailabilityDidChangeNotification"), self->_volumeSlider);

  v4.receiver = self;
  v4.super_class = (Class)MPVolumeView;
  -[MPVolumeView dealloc](&v4, sel_dealloc);
}

- (MPVolumeView)initWithCoder:(id)a3
{
  id v4;
  MPVolumeView *v5;
  MPVolumeView *v6;
  MPVolumeView *v7;
  objc_super v9;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) != 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)MPVolumeView;
    v5 = -[MPVolumeView initWithCoder:](&v9, sel_initWithCoder_, v4);
    v6 = v5;
    if (v5)
    {
      -[MPVolumeView _initWithStyle:](v5, "_initWithStyle:", 0);
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("MPVolumeViewShowsVolumeSlider")))
        v6->_showsVolumeSlider = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MPVolumeViewShowsVolumeSlider"));
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("MPVolumeViewShowsRouteButton")))
        v6->_showsRouteButton = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MPVolumeViewShowsRouteButton"));
      -[MPVolumeView setNeedsLayout](v6, "setNeedsLayout");
    }
    self = v6;
    v7 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("only keyed archiving is supported"));
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) != 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)MPVolumeView;
    -[MPVolumeView encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
    objc_msgSend(v4, "encodeBool:forKey:", self->_showsVolumeSlider, CFSTR("MPVolumeViewShowsVolumeSlider"));
    objc_msgSend(v4, "encodeBool:forKey:", self->_showsRouteButton, CFSTR("MPVolumeViewShowsRouteButton"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("only keyed archiving is supported"));
  }

}

- (void)layoutSubviews
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPVolumeView;
  -[MPVolumeView layoutSubviews](&v6, sel_layoutSubviews);
  v3 = self->_showsRouteButton
    && -[MPAVLightweightRoutingController isDevicePresenceDetected](self->_lightweightRoutingController, "isDevicePresenceDetected");
  if (self->_showsVolumeSlider)
  {
    -[MPVolumeSlider volumeController](self->_volumeSlider, "volumeController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isVolumeControlAvailable");

  }
  else
  {
    v5 = 0;
  }
  -[MPVolumeView _setShowsVolumeSlider:](self, "_setShowsVolumeSlider:", v5);
  -[MPVolumeView _setShowsRouteButton:animated:](self, "_setShowsRouteButton:animated:", v3, 0);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  UIButton *routeButton;
  BOOL v9;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  routeButton = self->_routeButton;
  if (routeButton
    && (-[UIButton convertPoint:fromView:](self->_routeButton, "convertPoint:fromView:", self, x, y),
        (-[UIButton pointInside:withEvent:](routeButton, "pointInside:withEvent:", v7) & 1) != 0))
  {
    v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)MPVolumeView;
    v9 = -[MPVolumeView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y);
  }

  return v9;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[MPVolumeSlider sizeThatFits:](self->_volumeSlider, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v7 = v6;
  -[MPVolumeSlider sizeThatFits:](self->_volumeSlider, "sizeThatFits:", width, height);
  v9 = v8;
  v11 = v10;
  -[UIButton frame](self->_routeButton, "frame");
  v14 = v7 + 14.0 + v13;
  if (v9 >= v14)
    v14 = v9;
  v15 = v12 + 4.0;
  if (v11 >= v12 + 4.0)
    v15 = v11;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)didMoveToSuperview
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPVolumeView;
  -[MPVolumeView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  +[MPVolumeHUDController sharedInstance](MPVolumeHUDController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdate");

}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MPVolumeView;
  -[MPVolumeView didMoveToWindow](&v10, sel_didMoveToWindow);
  +[MPVolumeHUDController sharedInstance](MPVolumeHUDController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdate");

  if (!self->_routeDiscoveryEnabled)
  {
    -[MPVolumeView window](self, "window");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      MPUIApplication();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "applicationState");

      if (v9 != 2)
      {
        v5 = 1;
        goto LABEL_9;
      }
    }
    if (!self->_routeDiscoveryEnabled)
      goto LABEL_10;
  }
  -[MPVolumeView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = 0;
LABEL_9:
    -[MPVolumeView _setRouteDiscoveryEnabled:](self, "_setRouteDiscoveryEnabled:", v5);
  }
LABEL_10:
  -[MPVolumeView _loadAudioRoutePickerIfNeeded](self, "_loadAudioRoutePickerIfNeeded");
}

- (void)setAlpha:(double)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPVolumeView;
  -[MPVolumeView setAlpha:](&v4, sel_setAlpha_, a3);
  +[MPVolumeHUDController sharedInstance](MPVolumeHUDController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdate");

}

- (void)setHidden:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPVolumeView;
  -[MPVolumeView setHidden:](&v4, sel_setHidden_, a3);
  +[MPVolumeHUDController sharedInstance](MPVolumeHUDController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdate");

}

- (void)lightweightRoutingController:(id)a3 didChangeDevicePresenceDetected:(BOOL)a4
{
  _BOOL8 v5;
  NSObject *v6;
  _QWORD block[5];

  v5 = self->_showsRouteButton && a4;
  -[MPVolumeView _setShowsRouteButton:animated:](self, "_setShowsRouteButton:animated:", v5, 1);
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__MPVolumeView_lightweightRoutingController_didChangeDevicePresenceDetected___block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(v6, block);

}

- (void)lightweightRoutingController:(id)a3 didChangePickedRoutes:(id)a4
{
  NSObject *v5;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__MPVolumeView_lightweightRoutingController_didChangePickedRoutes___block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(v5, block);

}

- (BOOL)isWirelessRouteActive
{
  void *v2;
  void *v3;
  BOOL v4;

  -[MPAVLightweightRoutingController pickedRoutes](self->_lightweightRoutingController, "pickedRoutes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "pickableRouteType") == 1;
  else
    v4 = 0;

  return v4;
}

- (BOOL)areWirelessRoutesAvailable
{
  return self->_wirelessRoutesAvailable;
}

- (UIImage)minimumVolumeSliderImageForState:(UIControlState)state
{
  void *v3;

  if (self->_hasNonDefaultMinVolumeSliderImage)
  {
    -[MPVolumeSlider minimumTrackImageForState:](self->_volumeSlider, "minimumTrackImageForState:", state);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (UIImage *)v3;
}

- (UIImage)maximumVolumeSliderImageForState:(UIControlState)state
{
  void *v3;

  if (self->_hasNonDefaultMaxVolumeSliderImage)
  {
    -[MPVolumeSlider maximumTrackImageForState:](self->_volumeSlider, "maximumTrackImageForState:", state);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (UIImage *)v3;
}

- (UIImage)routeButtonImageForState:(UIControlState)state
{
  void *v3;

  if (self->_hasNonDefaultRouteButtonImages)
  {
    -[UIButton imageForState:](self->_routeButton, "imageForState:", state);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (UIImage *)v3;
}

- (CGRect)routeButtonRectForBounds:(CGRect)bounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  __int128 v7;
  __int128 v8;
  CGRect result;

  v7 = 0u;
  v8 = 0u;
  -[MPVolumeView _getDefaultVolumeSliderFrame:routeButtonFrame:forBounds:](self, "_getDefaultVolumeSliderFrame:routeButtonFrame:forBounds:", 0, &v7, bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
  v4 = *((double *)&v7 + 1);
  v3 = *(double *)&v7;
  v6 = *((double *)&v8 + 1);
  v5 = *(double *)&v8;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setMinimumVolumeSliderImage:(UIImage *)image forState:(UIControlState)state
{
  if (!self->_hasNonDefaultMinVolumeSliderImage)
    self->_hasNonDefaultMinVolumeSliderImage = 1;
  -[MPVolumeSlider setMinimumTrackImage:forState:](self->_volumeSlider, "setMinimumTrackImage:forState:", image, state);
}

- (void)setMaximumVolumeSliderImage:(UIImage *)image forState:(UIControlState)state
{
  if (!self->_hasNonDefaultMaxVolumeSliderImage)
    self->_hasNonDefaultMaxVolumeSliderImage = 1;
  -[MPVolumeSlider setMaximumTrackImage:forState:](self->_volumeSlider, "setMaximumTrackImage:forState:", image, state);
}

- (void)setRouteButtonImage:(UIImage *)image forState:(UIControlState)state
{
  UIImage *v6;
  double v7;
  UIImage *v8;

  v6 = image;
  v8 = v6;
  if (!self->_hasNonDefaultRouteButtonImages)
  {
    -[UIButton setImage:forState:](self->_routeButton, "setImage:forState:", 0, 0);
    -[UIButton setImage:forState:](self->_routeButton, "setImage:forState:", 0, 4);
    v6 = v8;
    self->_hasNonDefaultRouteButtonImages = 1;
  }
  -[UIButton setImage:forState:](self->_routeButton, "setImage:forState:", v6, state);
  -[UIButton sizeToFit](self->_routeButton, "sizeToFit");
  -[UIButton _setChargeEnabled:](self->_routeButton, "_setChargeEnabled:", 1);
  LODWORD(v7) = -1102263091;
  -[UIButton setCharge:](self->_routeButton, "setCharge:", v7);
  -[MPVolumeView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setShowsRouteButton:(BOOL)showsRouteButton
{
  if (self->_showsRouteButton != showsRouteButton)
  {
    self->_showsRouteButton = showsRouteButton;
    -[MPVolumeView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowsVolumeSlider:(BOOL)showsVolumeSlider
{
  if (self->_showsVolumeSlider != showsVolumeSlider)
  {
    self->_showsVolumeSlider = showsVolumeSlider;
    -[MPVolumeView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setVolumeThumbImage:(UIImage *)image forState:(UIControlState)state
{
  -[MPVolumeSlider setThumbImage:forState:](self->_volumeSlider, "setThumbImage:forState:", image, state);
}

- (BOOL)showsRouteButton
{
  return self->_showsRouteButton;
}

- (BOOL)showsVolumeSlider
{
  return self->_showsVolumeSlider;
}

- (CGRect)volumeSliderRectForBounds:(CGRect)bounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  __int128 v7;
  __int128 v8;
  CGRect result;

  v7 = 0u;
  v8 = 0u;
  -[MPVolumeView _getDefaultVolumeSliderFrame:routeButtonFrame:forBounds:](self, "_getDefaultVolumeSliderFrame:routeButtonFrame:forBounds:", &v7, 0, bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
  v4 = *((double *)&v7 + 1);
  v3 = *(double *)&v7;
  v6 = *((double *)&v8 + 1);
  v5 = *(double *)&v8;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (UIImage)volumeThumbImageForState:(UIControlState)state
{
  return (UIImage *)-[MPVolumeSlider thumbImageForState:](self->_volumeSlider, "thumbImageForState:", state);
}

- (CGRect)volumeThumbRectForBounds:(CGRect)bounds volumeSliderRect:(CGRect)rect value:(float)value
{
  double height;
  double width;
  double y;
  double x;
  MPVolumeSlider *volumeSlider;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  CGRect result;

  height = bounds.size.height;
  width = bounds.size.width;
  y = bounds.origin.y;
  x = bounds.origin.x;
  volumeSlider = self->_volumeSlider;
  -[MPVolumeView convertRect:toView:](self, "convertRect:toView:", volumeSlider, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
  *(float *)&v19 = value;
  -[MPVolumeSlider thumbRectForBounds:trackRect:value:](volumeSlider, "thumbRectForBounds:trackRect:value:", x, y, width, height, v11, v12, v13, v14, v19);
  -[MPVolumeView convertRect:fromView:](self, "convertRect:fromView:", self->_volumeSlider);
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (int64_t)style
{
  return self->_style;
}

- (MPVolumeSlider)volumeSlider
{
  return self->_volumeSlider;
}

- (BOOL)hidesRouteLabelWhenNoRouteChoice
{
  return self->_hidesRouteLabelWhenNoRouteChoice;
}

- (BOOL)volumeSliderShrinksFromBothEnds
{
  return self->_volumeSliderShrinksFromBothEnds;
}

- (void)setHidesRouteLabelWhenNoRouteChoice:(BOOL)a3
{
  if (self->_hidesRouteLabelWhenNoRouteChoice != a3)
  {
    self->_hidesRouteLabelWhenNoRouteChoice = a3;
    -[MPVolumeView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setVolumeSliderShrinksFromBothEnds:(BOOL)a3
{
  if (self->_volumeSliderShrinksFromBothEnds != a3)
  {
    self->_volumeSliderShrinksFromBothEnds = a3;
    -[MPVolumeView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)isVisible
{
  return self->_showingButton || self->_showingSlider || self->_showingLabel;
}

- (BOOL)isShowingRouteButton
{
  return self->_showingButton;
}

- (id)_routeButton
{
  return self->_routeButton;
}

- (void)_loadAudioRoutePickerIfNeeded
{
  void *v3;
  void *v4;
  MPMediaControls *v5;
  MPMediaControls *mediaControls;

  if (!self->_mediaControls)
  {
    -[MPVolumeView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = objc_alloc_init(MPMediaControls);
LABEL_7:
      mediaControls = self->_mediaControls;
      self->_mediaControls = v5;

      return;
    }
  }
  -[MPVolumeView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v5 = 0;
    goto LABEL_7;
  }
}

- (void)_displayAudioRoutePicker
{
  id v3;

  -[MPVolumeView _loadAudioRoutePickerIfNeeded](self, "_loadAudioRoutePickerIfNeeded");
  -[MPMediaControls present](self->_mediaControls, "present");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("MPVolumeViewRoutePickerPresentedNotification"), self);

}

- (void)_startPrewarmingAudioRoutePicker
{
  -[MPVolumeView _loadAudioRoutePickerIfNeeded](self, "_loadAudioRoutePickerIfNeeded");
  -[MPMediaControls startPrewarming](self->_mediaControls, "startPrewarming");
}

- (void)_stopPrewarmingAudioRoutePicker
{
  -[MPMediaControls stopPrewarming](self->_mediaControls, "stopPrewarming");
}

- (void)_getDefaultVolumeSliderFrame:(CGRect *)a3 routeButtonFrame:(CGRect *)a4 forBounds:(CGRect)a5
{
  double width;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  _BOOL4 showingSlider;
  double v14;
  double v15;
  double v16;
  double v18;
  float v19;
  double v20;
  CGFloat v21;
  double v22;
  float v23;
  double v24;
  double v25;
  double v26;
  double height;
  CGRect v28;
  CGRect v29;

  height = a5.size.height;
  width = a5.size.width;
  -[UIButton frame](self->_routeButton, "frame", a5.origin.x, a5.origin.y);
  v11 = v9;
  v12 = v10;
  showingSlider = self->_showingSlider;
  if (self->_showingSlider)
  {
    v14 = 2.0;
    if (!self->_volumeSliderShrinksFromBothEnds)
      v14 = 1.0;
    v15 = width - (v9 + 7.0) * v14;
    if (self->_showingButton)
      v16 = v15;
    else
      v16 = width;
    if (!self->_showingButton || !self->_volumeSliderShrinksFromBothEnds)
      v18 = 0.0;
    else
      v18 = v9 + 7.0;
    v19 = (v10 + -28.0) * 0.5;
    v20 = rintf(v19);
    v21 = 28.0;
  }
  else
  {
    v18 = *MEMORY[0x1E0C9D648];
    v20 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  if (self->_style)
    v22 = 0.0;
  else
    v22 = 2.0;
  if (self->_hasNonDefaultRouteButtonImages)
  {
    -[UIButton frame](self->_routeButton, "frame");
    v23 = (height - CGRectGetHeight(v28)) * 0.5;
    v22 = floorf(v23);
    showingSlider = self->_showingSlider;
  }
  if (showingSlider)
  {
    v29.origin.x = v18;
    v29.origin.y = v20;
    v29.size.width = v16;
    v29.size.height = v21;
    v24 = CGRectGetMaxX(v29) + 7.0;
    if (!a3)
      goto LABEL_23;
    goto LABEL_22;
  }
  UIRoundToViewScale();
  v24 = v25;
  UIRoundToViewScale();
  v22 = v26;
  if (a3)
  {
LABEL_22:
    a3->origin.x = v18;
    a3->origin.y = v20;
    a3->size.width = v16;
    a3->size.height = v21;
  }
LABEL_23:
  if (a4)
  {
    a4->origin.x = v24;
    a4->origin.y = v22;
    a4->size.width = v11;
    a4->size.height = v12;
  }
}

- (void)_setShowsRouteButton:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v7;
  _BOOL4 showingButton;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  UILabel *routeLabel;
  UIButton *routeButton;
  double v27;
  void *v28;
  void *v29;
  _QWORD v30[9];
  BOOL v31;
  BOOL v32;

  v4 = a4;
  v7 = -[MPVolumeView isVisible](self, "isVisible");
  showingButton = self->_showingButton;
  self->_showingButton = a3;
  -[MPVolumeView bounds](self, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[MPVolumeView volumeSliderRectForBounds:](self, "volumeSliderRectForBounds:");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  routeLabel = self->_routeLabel;
  -[MPVolumeView volumeSliderRectForBounds:](self, "volumeSliderRectForBounds:", v10, v12, v14, v16);
  -[UILabel setFrame:](routeLabel, "setFrame:");
  routeButton = self->_routeButton;
  -[MPVolumeView routeButtonRectForBounds:](self, "routeButtonRectForBounds:", v10, v12, v14, v16);
  -[UIButton setFrame:](routeButton, "setFrame:");
  v27 = 0.3;
  if (!v4)
    v27 = 0.0;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __46__MPVolumeView__setShowsRouteButton_animated___block_invoke;
  v30[3] = &unk_1E31544F8;
  v31 = v4;
  v30[4] = self;
  v32 = a3;
  v30[5] = v18;
  v30[6] = v20;
  v30[7] = v22;
  v30[8] = v24;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v30, 0, v27, 0.0);
  if (v7 != -[MPVolumeView isVisible](self, "isVisible"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "postNotificationName:object:", CFSTR("MPVolumeViewVisibilityChangedNotification"), self);

  }
  if (showingButton != -[MPVolumeView isShowingRouteButton](self, "isShowingRouteButton"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "postNotificationName:object:", CFSTR("MPVolumeViewRouteButtonChangedNotification"), self);

  }
}

- (void)_setShowsVolumeSlider:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  void *v6;
  _BOOL4 v7;
  char v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  UILabel *routeLabel;
  void *v14;
  void *v15;
  UILabel *v16;
  void *v17;
  id v18;

  v3 = a3;
  v5 = -[MPVolumeView isVisible](self, "isVisible");
  if (-[MPAVLightweightRoutingController isDevicePresenceDetected](self->_lightweightRoutingController, "isDevicePresenceDetected"))
  {
    -[MPAVLightweightRoutingController pickedRoutes](self->_lightweightRoutingController, "pickedRoutes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") != 0;

  }
  else
  {
    v7 = 0;
  }
  v8 = !self->_showsVolumeSlider || v3;
  if (self->_style || (v8 & 1) != 0 || v7)
  {
    if ((v8 & 1) != 0)
      goto LABEL_11;
  }
  else if (self->_hidesRouteLabelWhenNoRouteChoice)
  {
LABEL_11:
    v9 = 0;
    goto LABEL_17;
  }
  if (v7)
  {
    -[MPAVLightweightRoutingController pickedRoutes](self->_lightweightRoutingController, "pickedRoutes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "routeName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setText:](self->_routeLabel, "setText:", v12);
  }
  else
  {
    routeLabel = self->_routeLabel;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("NO_VOLUME_AVAILABLE"), &stru_1E3163D10, CFSTR("MediaPlayer"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](routeLabel, "setText:", v14);

  }
  v9 = 1;
LABEL_17:
  -[MPVolumeSlider superview](self->_volumeSlider, "superview");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!v15)
      -[MPVolumeView addSubview:](self, "addSubview:", self->_volumeSlider);
  }
  else if (v15)
  {
    -[MPVolumeSlider removeFromSuperview](self->_volumeSlider, "removeFromSuperview");
  }
  v16 = self->_routeLabel;
  if (v9)
  {
    if (!v16)
      -[MPVolumeView addSubview:](self, "addSubview:", 0);
  }
  else
  {
    -[UILabel superview](v16, "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      -[UILabel removeFromSuperview](self->_routeLabel, "removeFromSuperview");
  }
  self->_showingSlider = v3;
  self->_showingLabel = v9;
  if (v5 != -[MPVolumeView isVisible](self, "isVisible"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "postNotificationName:object:", CFSTR("MPVolumeViewVisibilityChangedNotification"), self);

  }
}

- (void)_setRouteDiscoveryEnabled:(BOOL)a3
{
  _BOOL4 pushedRouteDiscoveryModeState;
  BOOL v5;

  if (self->_routeDiscoveryEnabled != a3)
  {
    self->_routeDiscoveryEnabled = a3;
    pushedRouteDiscoveryModeState = self->_pushedRouteDiscoveryModeState;
    if (a3)
    {
      v5 = 1;
      -[MPAVLightweightRoutingController setDiscoveryMode:](self->_lightweightRoutingController, "setDiscoveryMode:", 1);
      if (pushedRouteDiscoveryModeState)
        return;
    }
    else
    {
      if (!self->_pushedRouteDiscoveryModeState)
        return;
      -[MPAVLightweightRoutingController setDiscoveryMode:](self->_lightweightRoutingController, "setDiscoveryMode:", 0);
      v5 = 0;
    }
    self->_pushedRouteDiscoveryModeState = v5;
  }
}

- (void)_updateWirelessRouteStatus
{
  BOOL v3;
  void *v4;
  void *v5;
  BOOL v6;
  _QWORD v7[5];
  BOOL v8;
  BOOL v9;

  v3 = -[MPAVLightweightRoutingController isDevicePresenceDetected](self->_lightweightRoutingController, "isDevicePresenceDetected");
  -[MPAVLightweightRoutingController pickedRoutes](self->_lightweightRoutingController, "pickedRoutes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "pickableRouteType") == 1;
  else
    v6 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__MPVolumeView__updateWirelessRouteStatus__block_invoke;
  v7[3] = &unk_1E3154520;
  v7[4] = self;
  v8 = v3;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

- (void)_applicationDidEnterBackgroundNotification:(id)a3
{
  -[MPVolumeView _setRouteDiscoveryEnabled:](self, "_setRouteDiscoveryEnabled:", 0);
}

- (void)_applicationWillEnterForegroundNotification:(id)a3
{
  void *v4;

  -[MPVolumeView window](self, "window", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[MPVolumeView _setRouteDiscoveryEnabled:](self, "_setRouteDiscoveryEnabled:", 1);
}

- (UIImage)volumeWarningSliderImage
{
  return self->_volumeWarningSliderImage;
}

- (void)setVolumeWarningSliderImage:(UIImage *)volumeWarningSliderImage
{
  objc_storeStrong((id *)&self->_volumeWarningSliderImage, volumeWarningSliderImage);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeWarningSliderImage, 0);
  objc_storeStrong((id *)&self->_volumeSlider, 0);
  objc_storeStrong((id *)&self->_mediaControls, 0);
  objc_storeStrong((id *)&self->_routeLabel, 0);
  objc_storeStrong((id *)&self->_routeButton, 0);
  objc_storeStrong((id *)&self->_lightweightRoutingController, 0);
}

void __42__MPVolumeView__updateWirelessRouteStatus__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  int v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v2 + 490) != v3)
  {
    *(_BYTE *)(v2 + 490) = v3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("MPVolumeViewWirelessRoutesAvailableDidChangeNotification"), *(_QWORD *)(a1 + 32));

    v2 = *(_QWORD *)(a1 + 32);
  }
  v5 = *(unsigned __int8 *)(a1 + 41);
  if (*(unsigned __int8 *)(v2 + 489) != v5)
  {
    *(_BYTE *)(v2 + 489) = v5;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setSelected:", *(unsigned __int8 *)(a1 + 41));
    objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("MPVolumeViewWirelessRouteActiveDidChangeNotification"), *(_QWORD *)(a1 + 32));

  }
}

uint64_t __46__MPVolumeView__setShowsRouteButton_animated___block_invoke(uint64_t a1)
{
  double v2;
  _QWORD v4[5];
  char v5;

  v2 = 0.2;
  if (!*(_BYTE *)(a1 + 72))
    v2 = 0.0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__MPVolumeView__setShowsRouteButton_animated___block_invoke_2;
  v4[3] = &unk_1E3163468;
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = *(_BYTE *)(a1 + 73);
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v4, v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "layoutBelowIfNeeded");
}

uint64_t __46__MPVolumeView__setShowsRouteButton_animated___block_invoke_2(uint64_t a1)
{
  double v1;

  v1 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", v1);
}

uint64_t __67__MPVolumeView_lightweightRoutingController_didChangePickedRoutes___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateWirelessRouteStatus");
}

uint64_t __77__MPVolumeView_lightweightRoutingController_didChangeDevicePresenceDetected___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateWirelessRouteStatus");
}

@end
