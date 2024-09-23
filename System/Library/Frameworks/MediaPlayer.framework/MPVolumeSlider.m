@implementation MPVolumeSlider

- (void)didMoveToSuperview
{
  void *v3;
  id v4;

  -[MPVolumeSlider superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[MPVolumeController updateVolumeValue](self->_volumeController, "updateVolumeValue");
  +[MPVolumeHUDController sharedInstance](MPVolumeHUDController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsUpdate");

}

- (MPVolumeSlider)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  MPVolumeSlider *v5;
  MPVolumeSlider *v6;
  int v7;
  uint64_t v8;
  _UISliderFluidConfiguration *v9;
  _UISliderFluidConfiguration *configuration;
  MPVolumeController *v11;
  MPVolumeController *volumeController;
  UILayoutGuide *v13;
  UILayoutGuide *trackLayoutGuide;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  objc_super v21;

  if (a3.size.height < 34.0)
    a3.size.height = 34.0;
  v21.receiver = self;
  v21.super_class = (Class)MPVolumeSlider;
  v5 = -[MPVolumeSlider initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_style = a4;
    v7 = _os_feature_enabled_impl();
    if (a4 == 1)
    {
      if (v7)
        v8 = 111;
      else
        v8 = 110;
      -[MPVolumeSlider _setSliderStyle:](v6, "_setSliderStyle:", v8);
      v9 = (_UISliderFluidConfiguration *)objc_alloc_init(MEMORY[0x1E0DC4348]);
      configuration = v6->_configuration;
      v6->_configuration = v9;

      -[_UISliderFluidConfiguration setStretchLimit:](v6->_configuration, "setStretchLimit:", 12.0);
      -[_UISliderFluidConfiguration setDelegate:](v6->_configuration, "setDelegate:", v6);
      -[MPVolumeSlider _setSliderConfiguration:](v6, "_setSliderConfiguration:", v6->_configuration);
    }
    else if (v7)
    {
      -[MPVolumeSlider _setSliderStyle:](v6, "_setSliderStyle:", 101);
    }
    v11 = objc_alloc_init(MPVolumeController);
    volumeController = v6->_volumeController;
    v6->_volumeController = v11;

    -[MPVolumeController setDelegate:](v6->_volumeController, "setDelegate:", v6);
    v13 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
    trackLayoutGuide = v6->_trackLayoutGuide;
    v6->_trackLayoutGuide = v13;

    -[MPVolumeSlider addLayoutGuide:](v6, "addLayoutGuide:", v6->_trackLayoutGuide);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "userInterfaceIdiom");
    UIEdgeInsetsMakeWithEdges();
    v6->_hitRectInsets.top = v16;
    v6->_hitRectInsets.left = v17;
    v6->_hitRectInsets.bottom = v18;
    v6->_hitRectInsets.right = v19;

    v6->_isOffScreen = 1;
  }
  return v6;
}

- (void)_updateVolumeAnimated:(BOOL)a3 silenceVolumeHUD:(BOOL)a4
{
  _BOOL8 v5;
  _BOOL8 v7;
  float v8;
  float v9;
  double v10;
  objc_super v11;

  v5 = a3;
  v7 = -[MPVolumeController isVolumeControlAvailable](self->_volumeController, "isVolumeControlAvailable");
  -[MPVolumeController volumeValue](self->_volumeController, "volumeValue");
  v9 = v8;
  -[MPVolumeSlider setEnabled:](self, "setEnabled:", v7);
  -[MPVolumeSlider value](self, "value");
  *(float *)&v10 = *(float *)&v10 - v9;
  if (*(float *)&v10 < 0.0)
    *(float *)&v10 = -*(float *)&v10;
  if (*(float *)&v10 > 0.00000011921)
  {
    v11.receiver = self;
    v11.super_class = (Class)MPVolumeSlider;
    *(float *)&v10 = v9;
    -[MPVolumeSlider setValue:animated:](&v11, sel_setValue_animated_, v5, v10);
    if (!a4)
      -[MPVolumeSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD v5[5];
  BOOL v6;
  objc_super v7;

  v3 = a3;
  if (-[MPVolumeSlider isEnabled](self, "isEnabled") != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)MPVolumeSlider;
    -[MPVolumeSlider setEnabled:](&v7, sel_setEnabled_, v3);
    -[MPVolumeSlider _setMinimumTrackVisible:withDuration:](self, "_setMinimumTrackVisible:withDuration:", v3, 0.0);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __29__MPVolumeSlider_setEnabled___block_invoke;
    v5[3] = &unk_1E3163468;
    v5[4] = self;
    v6 = v3;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v5);
  }
}

- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4 silenceVolumeHUD:(BOOL)a5
{
  _BOOL8 v5;

  v5 = a5;
  if (!-[MPVolumeSlider isTracking](self, "isTracking", a3))
    -[MPVolumeSlider _updateVolumeAnimated:silenceVolumeHUD:](self, "_updateVolumeAnimated:silenceVolumeHUD:", 1, v5);
}

- (void)volumeController:(id)a3 volumeControlCapabilitiesDidChange:(unsigned int)a4
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3, *(_QWORD *)&a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("MPVolumeSliderVolumeControlCapabilitiesDidChangeNotification"), self);

}

- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4
{
  id v5;

  -[MPVolumeSlider _updateVolumeAnimated:silenceVolumeHUD:](self, "_updateVolumeAnimated:silenceVolumeHUD:", 1, 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("MPVolumeSliderVolumeControlAvailabilityDidChangeNotification"), self);

}

- (BOOL)isTracking
{
  objc_super v3;

  if (self->_isFluidTracking)
    return 1;
  v3.receiver = self;
  v3.super_class = (Class)MPVolumeSlider;
  return -[MPVolumeSlider isTracking](&v3, sel_isTracking);
}

- (MPVolumeSlider)initWithFrame:(CGRect)a3
{
  return -[MPVolumeSlider initWithFrame:style:](self, "initWithFrame:style:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MPVolumeSlider)initWithFrame:(CGRect)a3 style:(int64_t)a4 endpointRoute:(id)a5 outputDeviceRoute:(id)a6
{
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  id v14;
  MPVolumeSlider *v15;
  MPVolumeController *v16;
  MPVolumeControllerRouteDataSource *v17;
  MPVolumeController *v18;
  void *v19;

  v9 = *MEMORY[0x1E0C9D648];
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v13 = a6;
  v14 = a5;
  v15 = -[MPVolumeSlider initWithFrame:style:](self, "initWithFrame:style:", a4, v9, v10, v11, v12);
  v16 = [MPVolumeController alloc];
  v17 = -[MPVolumeControllerRouteDataSource initWithGroupRoute:outputDeviceRoute:]([MPVolumeControllerRouteDataSource alloc], "initWithGroupRoute:outputDeviceRoute:", v14, v13);

  v18 = -[MPVolumeController initWithDataSource:](v16, "initWithDataSource:", v17);
  -[MPVolumeSlider setVolumeController:](v15, "setVolumeController:", v18);

  -[MPVolumeSlider volumeController](v15, "volumeController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDelegate:", v15);

  return v15;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  float v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MPVolumeSlider value](self, "value");
  v6 = v5;
  -[MPVolumeSlider volumeController](self, "volumeController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p value: %f dataSource: %@"), v4, self, *(_QWORD *)&v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)dealloc
{
  objc_super v3;

  -[MPVolumeController setDelegate:](self->_volumeController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MPVolumeSlider;
  -[MPVolumeSlider dealloc](&v3, sel_dealloc);
}

- (id)createThumbView
{
  UIImageView *v3;
  UIImageView *thumbImageView;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPVolumeSlider;
  v3 = -[MPVolumeSlider createThumbView](&v6, sel_createThumbView);
  thumbImageView = self->_thumbImageView;
  self->_thumbImageView = v3;

  return self->_thumbImageView;
}

- (float)maximumValue
{
  return 1.0;
}

- (float)minimumValue
{
  return 0.0;
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v7;
  double v8;
  objc_super v9;

  v4 = a4;
  if (!-[MPVolumeSlider isTracking](self, "isTracking"))
  {
    LODWORD(v8) = 1.0;
    *(float *)&v7 = a3;
    -[MPVolumeController setVolume:withNotificationDelay:](self->_volumeController, "setVolume:withNotificationDelay:", v7, v8);
  }
  v9.receiver = self;
  v9.super_class = (Class)MPVolumeSlider;
  *(float *)&v7 = a3;
  -[MPVolumeSlider setValue:animated:](&v9, sel_setValue_animated_, v4, v7);
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  char v8;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  v8 = -[MPVolumeSlider isEnabled](self, "isEnabled");
  if (-[MPVolumeSlider isEnabled](self, "isEnabled"))
  {
    -[MPVolumeController setMuted:](self->_volumeController, "setMuted:", 0);
    v10.receiver = self;
    v10.super_class = (Class)MPVolumeSlider;
    -[MPVolumeSlider beginTrackingWithTouch:withEvent:](&v10, sel_beginTrackingWithTouch_withEvent_, v6, v7);
  }

  return v8;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  BOOL v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPVolumeSlider;
  v5 = -[MPVolumeSlider continueTrackingWithTouch:withEvent:](&v7, sel_continueTrackingWithTouch_withEvent_, a3, a4);
  if (!self->_configuration)
    -[MPVolumeSlider _commitVolumeChange](self, "_commitVolumeChange");
  return v5;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPVolumeSlider;
  -[MPVolumeSlider endTrackingWithTouch:withEvent:](&v5, sel_endTrackingWithTouch_withEvent_, a3, a4);
  if (!self->_configuration)
    -[MPVolumeSlider _commitVolumeChange](self, "_commitVolumeChange");
}

- (void)cancelTrackingWithEvent:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPVolumeSlider;
  -[MPVolumeSlider cancelTrackingWithEvent:](&v4, sel_cancelTrackingWithEvent_, a3);
  if (!self->_configuration)
    -[MPVolumeSlider _commitVolumeChange](self, "_commitVolumeChange");
}

- (void)updateConstraints
{
  MPVolumeSlider *v3;
  MPVolumeSlider *v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)MPVolumeSlider;
  -[MPVolumeSlider updateConstraints](&v20, sel_updateConstraints);
  if (self->_style)
  {
    v3 = self;
  }
  else
  {
    -[MPVolumeSlider _maxTrackView](self, "_maxTrackView");
    v3 = (MPVolumeSlider *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  if (!self->_configuredLayoutGuide && v3 != 0)
  {
    self->_configuredLayoutGuide = 1;
    v15 = (void *)MEMORY[0x1E0CB3718];
    -[UILayoutGuide topAnchor](self->_trackLayoutGuide, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPVolumeSlider topAnchor](v4, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v17;
    -[UILayoutGuide bottomAnchor](self->_trackLayoutGuide, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPVolumeSlider bottomAnchor](v4, "bottomAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v7;
    -[UILayoutGuide leadingAnchor](self->_trackLayoutGuide, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPVolumeSlider leadingAnchor](v4, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v10;
    -[UILayoutGuide trailingAnchor](self->_trackLayoutGuide, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPVolumeSlider trailingAnchor](v4, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activateConstraints:", v14);

  }
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  id v5;

  -[MPVolumeSlider window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[MPVolumeHUDController sharedInstance](MPVolumeHUDController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "addVolumeDisplay:", self);
  else
    objc_msgSend(v4, "removeVolumeDisplay:", self);

}

- (CGRect)hitRect
{
  double top;
  double left;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGRect result;

  v13.receiver = self;
  v13.super_class = (Class)MPVolumeSlider;
  -[MPVolumeSlider hitRect](&v13, sel_hitRect);
  top = self->_hitRectInsets.top;
  left = self->_hitRectInsets.left;
  v6 = v5 + left;
  v8 = v7 + top;
  v10 = v9 - (left + self->_hitRectInsets.right);
  v12 = v11 - (top + self->_hitRectInsets.bottom);
  result.size.height = v12;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v6;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[MPVolumeSlider hitRect](self, "hitRect", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (void)setAlpha:(double)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPVolumeSlider;
  -[MPVolumeSlider setAlpha:](&v4, sel_setAlpha_, a3);
  +[MPVolumeHUDController sharedInstance](MPVolumeHUDController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdate");

}

- (void)setHidden:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPVolumeSlider;
  -[MPVolumeSlider setHidden:](&v4, sel_setHidden_, a3);
  +[MPVolumeHUDController sharedInstance](MPVolumeHUDController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdate");

}

- (NSString)volumeControlLabel
{
  return -[MPVolumeController volumeControlLabel](self->_volumeController, "volumeControlLabel");
}

- (MPAVRoute)route
{
  return (MPAVRoute *)self->_groupRoute;
}

- (void)setVolumeController:(id)a3
{
  MPVolumeController *v5;
  MPVolumeController **p_volumeController;
  MPVolumeController *v7;

  v5 = (MPVolumeController *)a3;
  p_volumeController = &self->_volumeController;
  if (self->_volumeController != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_volumeController, a3);
    -[MPVolumeController setDelegate:](*p_volumeController, "setDelegate:", self);
    -[MPVolumeController updateVolumeValue](*p_volumeController, "updateVolumeValue");
    v5 = v7;
  }

}

- (void)setRoute:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPVolumeSlider.m"), 248, CFSTR("MPVolumeSlider.route must be an MPAVEndpointRoute"));

  }
  -[MPVolumeSlider setGroupRoute:](self, "setGroupRoute:", v6);

}

- (void)setGroupRoute:(id)a3
{
  MPAVEndpointRoute *v5;
  MPVolumeControllerRouteDataSource *v6;
  MPVolumeControllerRouteDataSource *v7;
  MPAVEndpointRoute *v8;

  v5 = (MPAVEndpointRoute *)a3;
  if (self->_groupRoute != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_groupRoute, a3);
    if (self->_outputDeviceRoute || !-[MPAVEndpointRoute isDeviceRoute](v8, "isDeviceRoute"))
      v6 = -[MPVolumeControllerRouteDataSource initWithGroupRoute:outputDeviceRoute:]([MPVolumeControllerRouteDataSource alloc], "initWithGroupRoute:outputDeviceRoute:", v8, self->_outputDeviceRoute);
    else
      v6 = objc_alloc_init(MPVolumeControllerSystemDataSource);
    v7 = v6;
    -[MPVolumeSlider setVolumeDataSource:](self, "setVolumeDataSource:", v6);

    v5 = v8;
  }

}

- (void)setOutputDeviceRoute:(id)a3
{
  MPAVOutputDeviceRoute **p_outputDeviceRoute;
  MPVolumeControllerRouteDataSource *v6;
  MPAVOutputDeviceRoute *v7;

  p_outputDeviceRoute = &self->_outputDeviceRoute;
  v7 = (MPAVOutputDeviceRoute *)a3;
  if (*p_outputDeviceRoute != v7)
  {
    objc_storeStrong((id *)&self->_outputDeviceRoute, a3);
    if (self->_groupRoute)
    {
      v6 = -[MPVolumeControllerRouteDataSource initWithGroupRoute:outputDeviceRoute:]([MPVolumeControllerRouteDataSource alloc], "initWithGroupRoute:outputDeviceRoute:", self->_groupRoute, *p_outputDeviceRoute);
      -[MPVolumeSlider setVolumeDataSource:](self, "setVolumeDataSource:", v6);

    }
  }

}

- (void)setVolumeDataSource:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  MPVolumeSlider *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "Volume");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412802;
    v8 = objc_opt_class();
    v9 = 2048;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "[MPVolumeSlider] <%@: %p> setVolumeDataSource: %@", (uint8_t *)&v7, 0x20u);
  }

  -[MPVolumeController setDataSource:](self->_volumeController, "setDataSource:", v4);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("MPVolumeSliderVolumeControlLabelDidChangeNotification"), self);

}

- (double)expansionFactor
{
  void *v2;
  double v3;
  double v4;

  -[MPVolumeSlider configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "expansionFactor");
  v4 = v3;

  return v4;
}

- (void)setExpansionFactor:(double)a3
{
  id v5;

  -[MPVolumeSlider configuration](self, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExpansionFactor:", a3);
  -[MPVolumeSlider _setSliderConfiguration:](self, "_setSliderConfiguration:", v5);

}

- (void)updateVolume
{
  void *v3;

  -[MPVolumeSlider volumeController](self, "volumeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[MPVolumeSlider _updateVolumeAnimated:silenceVolumeHUD:](self, "_updateVolumeAnimated:silenceVolumeHUD:", 0, 0);
}

- (UIWindowScene)windowSceneForVolumeDisplay
{
  void *v2;
  void *v3;

  -[MPVolumeSlider window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIWindowScene *)v3;
}

- (BOOL)isOnScreenForVolumeDisplay
{
  return !-[MPVolumeSlider _isOffScreen](self, "_isOffScreen");
}

- (NSString)volumeAudioCategory
{
  return -[MPVolumeController volumeAudioCategory](self->_volumeController, "volumeAudioCategory");
}

- (void)volumeController:(id)a3 volumeControlLabelDidChange:(id)a4
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("MPVolumeSliderVolumeControlLabelDidChangeNotification"), self);

}

- (void)_sliderFluidInteractionWillBegin:(id)a3 withLocation:(CGPoint)a4
{
  self->_isFluidTracking = 1;
  -[MPVolumeSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 1, a4.x, a4.y);
}

- (void)_sliderFluidInteractionWillEnd:(id)a3
{
  self->_isFluidTracking = 0;
  -[MPVolumeSlider _commitVolumeChange](self, "_commitVolumeChange", a3);
  -[MPVolumeSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
}

- (BOOL)_isOffScreen
{
  void *v3;
  uint64_t v4;
  MPVolumeSlider *v5;
  double v6;

  -[MPVolumeSlider window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (self->_forcingOffscreenVisibility)
    {
      LOBYTE(v4) = self->_isOffScreen;
    }
    else
    {
      v5 = self;
      while ((-[MPVolumeSlider isHidden](v5, "isHidden") & 1) == 0)
      {
        -[MPVolumeSlider alpha](v5, "alpha");
        if (v6 < 0.00000011920929)
          break;
        -[MPVolumeSlider superview](v5, "superview");
        v4 = objc_claimAutoreleasedReturnValue();

        v5 = (MPVolumeSlider *)v4;
        if (!v4)
          goto LABEL_11;
      }
      LOBYTE(v4) = 1;
LABEL_11:

    }
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (void)_setIsOffScreen:(BOOL)a3
{
  void *v5;
  void *v6;
  id v7;

  self->_forcingOffscreenVisibility = 1;
  if (self->_isOffScreen != a3)
  {
    self->_isOffScreen = a3;
    +[MPVolumeHUDController sharedInstance](MPVolumeHUDController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsUpdate");

    if (!a3)
    {
      -[MPVolumeSlider superview](self, "superview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[MPVolumeSlider volumeController](self, "volumeController");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "updateVolumeValue");

      }
    }
  }
}

- (UIView)thumbView
{
  return (UIView *)self->_thumbImageView;
}

- (void)_commitVolumeChange
{
  MPVolumeController *volumeController;

  volumeController = self->_volumeController;
  -[MPVolumeSlider value](self, "value");
  -[MPVolumeController setVolumeValue:](volumeController, "setVolumeValue:");
  -[MPVolumeSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (id)_routeName
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  -[MPVolumeSlider volumeController](self, "volumeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[MPVolumeSlider volumeController](self, "volumeController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "outputDeviceRoute");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "routeName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      -[MPVolumeSlider groupRoute](self, "groupRoute");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "routeName");
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    MRAVEndpointGetLocalEndpoint();
    v11 = (id)MRAVEndpointCopyLocalizedName();
  }
  return v11;
}

- (int64_t)style
{
  return self->_style;
}

- (UIImage)volumeWarningTrackImage
{
  return self->_volumeWarningTrackImage;
}

- (void)setVolumeWarningTrackImage:(id)a3
{
  objc_storeStrong((id *)&self->_volumeWarningTrackImage, a3);
}

- (_UISliderFluidConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (UIEdgeInsets)hitRectInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_hitRectInsets.top;
  left = self->_hitRectInsets.left;
  bottom = self->_hitRectInsets.bottom;
  right = self->_hitRectInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setHitRectInsets:(UIEdgeInsets)a3
{
  self->_hitRectInsets = a3;
}

- (UILayoutGuide)trackLayoutGuide
{
  return self->_trackLayoutGuide;
}

- (MPVolumeController)volumeController
{
  return self->_volumeController;
}

- (MPAVEndpointRoute)groupRoute
{
  return self->_groupRoute;
}

- (MPAVOutputDeviceRoute)outputDeviceRoute
{
  return self->_outputDeviceRoute;
}

- (BOOL)isInOptimisticState
{
  return self->_optimisticState;
}

- (void)setOptimisticState:(BOOL)a3
{
  self->_optimisticState = a3;
}

- (float)optimisticValue
{
  return self->_optimisticValue;
}

- (void)setOptimisticValue:(float)a3
{
  self->_optimisticValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDeviceRoute, 0);
  objc_storeStrong((id *)&self->_groupRoute, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);
  objc_storeStrong((id *)&self->_trackLayoutGuide, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_volumeWarningTrackImage, 0);
  objc_storeStrong((id *)&self->_thumbImageView, 0);
}

void __29__MPVolumeSlider_setEnabled___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  if (*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  else
    v1 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "thumbView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

@end
