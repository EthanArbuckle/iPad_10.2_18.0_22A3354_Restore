@implementation _MKUserTrackingButton

- (id)_imageForState:(int64_t)a3 controlState:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  switch(a3)
  {
    case -1:
    case 1:
      objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_imageNamed:", CFSTR("TrackingEmpty.png"), a4, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    case 0:
      if (self->_inMiniBar)
      {
        v7 = 0;
        goto LABEL_11;
      }
      v8 = 0;
      goto LABEL_15;
    case 2:
      if (self->_inMiniBar)
      {
        v7 = 1;
        goto LABEL_11;
      }
      v8 = 1;
      goto LABEL_15;
    case 3:
      if (self->_inMiniBar)
      {
        v7 = 2;
LABEL_11:
        -[_MKUserTrackingButton _landscapeImagePhoneForUserTrackingMode:controlState:](self, "_landscapeImagePhoneForUserTrackingMode:controlState:", v7, a4, v4, v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 2;
LABEL_15:
        -[_MKUserTrackingButton _imageForUserTrackingMode:controlState:](self, "_imageForUserTrackingMode:controlState:", v8, a4, v4, v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      return v6;
    default:
      v6 = 0;
      return v6;
  }
}

- (id)_imageForUserTrackingMode:(int64_t)a3 controlState:(unint64_t)a4
{
  NSMutableDictionary *customImages;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  customImages = self->_customImages;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](customImages, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9
    || (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "objectForKeyedSubscript:", v10),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        !v11))
  {
    if (self->_applyDefaultImageIfNeeded)
    {
      -[_MKUserTrackingButton _defaultImageForUserTrackingMode:controlState:](self, "_defaultImageForUserTrackingMode:controlState:", a3, a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)_defaultImageForUserTrackingMode:(int64_t)a3 controlState:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v15;

  if (a4)
  {
    v8 = 0;
  }
  else
  {
    v15 = v4;
    v8 = _MKLinkedOnOrAfterReleaseSet(2310);
    if (!(_DWORD)v8)
    {
      if (a3 == 2)
      {
        v12 = (void *)MEMORY[0x1E0CEA638];
        v13 = CFSTR("TrackingHeadingMask.png");
      }
      else if (a3 == 1)
      {
        v12 = (void *)MEMORY[0x1E0CEA638];
        v13 = CFSTR("TrackingLocationMask.png");
      }
      else
      {
        if (a3)
          return (id)v8;
        v12 = (void *)MEMORY[0x1E0CEA638];
        v13 = CFSTR("TrackingLocationOffMask.png");
      }
      objc_msgSend(v12, "_mapkit_imageNamed:", v13, v5, v15, v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      return (id)v8;
    }
    v10 = CFSTR("location");
    if (a3 == 1)
      v10 = CFSTR("location.fill");
    if (a3 == 2)
      v11 = CFSTR("location.north.line.fill");
    else
      v11 = v10;
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", v11, v5, v15, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  return (id)v8;
}

- (BOOL)inMiniBar
{
  return self->_inMiniBar;
}

- (void)_repositionViews
{
  int64_t v3;
  _MKUserTrackingButton *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = -[_MKUserTrackingButtonController state](self->_controller, "state");
  if (v3 == 3)
  {
    v4 = self;
    v5 = 2;
  }
  else if (v3 == 2)
  {
    v4 = self;
    v5 = 1;
  }
  else
  {
    if (v3)
    {
      v6 = *MEMORY[0x1E0CEB4B0];
      v7 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
      v8 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
      v9 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
      goto LABEL_9;
    }
    v4 = self;
    v5 = 0;
  }
  -[_MKUserTrackingButton _imageEdgeInsetsForUserTrackingMode:](v4, "_imageEdgeInsetsForUserTrackingMode:", v5);
LABEL_9:
  -[_MKUserTrackingButton setImageEdgeInsets:](self, "setImageEdgeInsets:", v6, v7, v8, v9);
}

- (UIEdgeInsets)_imageEdgeInsetsForUserTrackingMode:(int64_t)a3
{
  NSMutableDictionary *customImageEdgeInsets;
  void *v6;
  void *v7;
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
  double v19;
  UIEdgeInsets result;

  customImageEdgeInsets = self->_customImageEdgeInsets;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](customImageEdgeInsets, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "UIEdgeInsetsValue");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    goto LABEL_15;
  }
  v13 = 0.0;
  if ((unint64_t)a3 > 1)
  {
    v15 = 0.0;
    v11 = 0.0;
    v9 = 0.0;
    goto LABEL_15;
  }
  if (self->_inMiniBar)
  {
    if (_MKLinkedOnOrAfterReleaseSet(2310))
    {
LABEL_10:
      v9 = 1.0;
      v15 = 2.0;
      v11 = 2.0;
      goto LABEL_15;
    }
    v15 = 2.0;
    if (self->_inMiniBar)
    {
      v11 = 0.0;
      v9 = 2.0;
      goto LABEL_15;
    }
  }
  if (_MKLinkedOnOrAfterReleaseSet(2310))
    goto LABEL_10;
  v15 = 2.0;
  if (self->_inMiniBar)
    v9 = 2.0;
  else
    v9 = 3.0;
  v11 = 0.0;
LABEL_15:

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

+ (_MKUserTrackingButton)buttonWithUserTrackingView:(id)a3 withType:(int64_t)a4
{
  return (_MKUserTrackingButton *)objc_msgSend(a1, "buttonWithUserTrackingView:withType:applyDefaultImageIfNeeded:", a3, a4, 1);
}

+ (_MKUserTrackingButton)buttonWithUserTrackingView:(id)a3
{
  return (_MKUserTrackingButton *)objc_msgSend(a1, "buttonWithUserTrackingView:withType:", a3, 1);
}

- (void)_setSelectsWhenTracking:(BOOL)a3
{
  self->_selectsWhenTracking = a3;
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v3;

  self->_explicitlyEnabled = a3;
  v3.receiver = self;
  v3.super_class = (Class)_MKUserTrackingButton;
  -[_MKUserTrackingButton setEnabled:](&v3, sel_setEnabled_);
}

+ (_MKUserTrackingButton)buttonWithUserTrackingView:(id)a3 withType:(int64_t)a4 applyDefaultImageIfNeeded:(BOOL)a5
{
  id v8;
  uint64_t v9;
  _MKUserTrackingButtonController *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(a1, "buttonWithType:", a4);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v9, "sizeToFit");
  *(_BYTE *)(v9 + 785) = 1;
  *(_BYTE *)(v9 + 786) = 1;
  *(_BYTE *)(v9 + 787) = a5;
  v10 = [_MKUserTrackingButtonController alloc];
  objc_msgSend((id)v9, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_MKUserTrackingButtonController initWithTarget:userTrackingView:imageView:button:](v10, "initWithTarget:userTrackingView:imageView:button:", v9, v8, v11, v9);

  v13 = *(void **)(v9 + 752);
  *(_QWORD *)(v9 + 752) = v12;

  objc_msgSend((id)v9, "addTarget:action:forControlEvents:", *(_QWORD *)(v9 + 752), sel__goToNextMode_, 0x2000);
  *(_BYTE *)(v9 + 784) = 1;
  objc_msgSend(*(id *)(v9 + 752), "setButtonBehavior:", objc_msgSend((id)v9, "behavior"));
  objc_msgSend(*(id *)(v9 + 752), "_reloadState");
  v17[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend((id)v9, "registerForTraitChanges:withAction:", v14, sel_traitEnvironment_didChangeTraitCollection_);

  return (_MKUserTrackingButton *)(id)v9;
}

- (unint64_t)behavior
{
  return 0;
}

- (BOOL)_isHighlightedForState:(int64_t)a3
{
  return a3 > 1 && self->_selectsWhenTracking;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 36.0;
  if (self->_inMiniBar)
    v3 = 25.0;
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_setInternallyEnabled:(BOOL)a3
{
  objc_super v3;

  self->_internallyEnabled = a3;
  *(_QWORD *)&a3 = self->_explicitlyEnabled && a3;
  v3.receiver = self;
  v3.super_class = (Class)_MKUserTrackingButton;
  -[_MKUserTrackingButton setEnabled:](&v3, sel_setEnabled_, a3);
}

+ (_MKUserTrackingButton)buttonWithMapView:(id)a3 applyDefaultImageIfNeeded:(BOOL)a4
{
  return (_MKUserTrackingButton *)objc_msgSend(a1, "buttonWithUserTrackingView:withType:applyDefaultImageIfNeeded:", a3, 1, a4);
}

- (MKMapView)mapView
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[_MKUserTrackingButtonController userTrackingView](self->_controller, "userTrackingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[_MKUserTrackingButtonController userTrackingView](self->_controller, "userTrackingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (MKMapView *)v5;
}

- (void)setMapView:(id)a3
{
  id v5;
  char isKindOfClass;
  void *v7;
  uint64_t v8;
  void *v9;
  _MKUserTrackingButton *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a3;
  v13 = v5;
  if (v5 && (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v5 = v13, (isKindOfClass & 1) == 0))
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = self;
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ %@"), v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "raise:format:", v8, CFSTR("%@: mapView must be an MKMapView instance"), v12);
  }
  else
  {
    -[_MKUserTrackingButtonController setUserTrackingView:](self->_controller, "setUserTrackingView:", v5);
  }

}

- (void)setControlSize:(unint64_t)a3
{
  if (self->_controlSize != a3)
  {
    self->_controlSize = a3;
    -[_MKUserTrackingButtonController setControlSize:](self->_controller, "setControlSize:");
  }
}

- (MKUserTrackingView)userTrackingView
{
  return -[_MKUserTrackingButtonController userTrackingView](self->_controller, "userTrackingView");
}

- (void)setUserTrackingView:(id)a3
{
  -[_MKUserTrackingButtonController setUserTrackingView:](self->_controller, "setUserTrackingView:", a3);
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v5 = objc_msgSend(a4, "userInterfaceStyle", a3);
  -[_MKUserTrackingButton traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
    -[_MKUserTrackingButtonController _updateLoading](self->_controller, "_updateLoading");
}

- (void)_setImage:(id)a3 forUserTrackingMode:(int64_t)a4 controlState:(unint64_t)a5
{
  NSMutableDictionary *customImages;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;
  id v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  customImages = self->_customImages;
  if (!customImages)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = self->_customImages;
    self->_customImages = v9;

    customImages = self->_customImages;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](customImages, "objectForKeyedSubscript:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = self->_customImages;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v12, v14);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, v15);
  else
    objc_msgSend(v12, "removeObjectForKey:", v15);

  -[_MKUserTrackingButtonController _reloadState](self->_controller, "_reloadState");
}

- (id)_defaultLandscapeImagePhoneForUserTrackingMode:(int64_t)a3 controlState:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v15;

  if (a4)
  {
    v8 = 0;
  }
  else
  {
    v15 = v4;
    v8 = _MKLinkedOnOrAfterReleaseSet(2310);
    if (!(_DWORD)v8)
    {
      if (a3 == 2)
      {
        v12 = (void *)MEMORY[0x1E0CEA638];
        v13 = CFSTR("TrackingHeadingMaskLandscape.png");
      }
      else if (a3 == 1)
      {
        v12 = (void *)MEMORY[0x1E0CEA638];
        v13 = CFSTR("TrackingLocationMaskLandscape.png");
      }
      else
      {
        if (a3)
          return (id)v8;
        v12 = (void *)MEMORY[0x1E0CEA638];
        v13 = CFSTR("TrackingLocationOffMaskLandscape.png");
      }
      objc_msgSend(v12, "_mapkit_imageNamed:", v13, v5, v15, v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      return (id)v8;
    }
    v10 = CFSTR("location");
    if (a3 == 1)
      v10 = CFSTR("location.fill");
    if (a3 == 2)
      v11 = CFSTR("location.north.line.fill");
    else
      v11 = v10;
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", v11, v5, v15, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  return (id)v8;
}

- (id)_landscapeImagePhoneForUserTrackingMode:(int64_t)a3 controlState:(unint64_t)a4
{
  NSMutableDictionary *customLandscapeImagePhones;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  customLandscapeImagePhones = self->_customLandscapeImagePhones;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](customLandscapeImagePhones, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9
    || (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "objectForKeyedSubscript:", v10),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        !v11))
  {
    -[_MKUserTrackingButton _defaultLandscapeImagePhoneForUserTrackingMode:controlState:](self, "_defaultLandscapeImagePhoneForUserTrackingMode:controlState:", a3, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (void)_setLandscapeImagePhone:(id)a3 forUserTrackingMode:(int64_t)a4 controlState:(unint64_t)a5
{
  NSMutableDictionary *customLandscapeImagePhones;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;
  id v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  customLandscapeImagePhones = self->_customLandscapeImagePhones;
  if (!customLandscapeImagePhones)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = self->_customLandscapeImagePhones;
    self->_customLandscapeImagePhones = v9;

    customLandscapeImagePhones = self->_customLandscapeImagePhones;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](customLandscapeImagePhones, "objectForKeyedSubscript:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = self->_customLandscapeImagePhones;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v12, v14);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, v15);
  else
    objc_msgSend(v12, "removeObjectForKey:", v15);

  -[_MKUserTrackingButtonController _reloadState](self->_controller, "_reloadState");
}

- (void)_setImageEdgeInsets:(UIEdgeInsets)a3 forUserTrackingMode:(int64_t)a4
{
  double right;
  double bottom;
  double left;
  double top;
  NSMutableDictionary *v10;
  NSMutableDictionary *customImageEdgeInsets;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (!self->_customImageEdgeInsets)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    customImageEdgeInsets = self->_customImageEdgeInsets;
    self->_customImageEdgeInsets = v10;

  }
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithUIEdgeInsets:", top, left, bottom, right);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = self->_customImageEdgeInsets;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v12, v14);

  -[_MKUserTrackingButtonController _reloadState](self->_controller, "_reloadState");
}

+ (Class)_activityIndicatorClass
{
  return (Class)objc_opt_class();
}

- (int64_t)_activityIndicatorStyle
{
  return 100;
}

- (int64_t)_state
{
  return -[_MKUserTrackingButtonController state](self->_controller, "state");
}

- (void)_setState:(int64_t)a3
{
  -[_MKUserTrackingButtonController setState:](self->_controller, "setState:", a3);
}

- (void)updateForMiniBarState:(BOOL)a3
{
  if (self->_inMiniBar != a3)
  {
    self->_inMiniBar = a3;
    -[_MKUserTrackingButtonController _reloadState](self->_controller, "_reloadState");
    -[_MKUserTrackingButton sizeToFit](self, "sizeToFit");
  }
}

- (_MKUserTrackingButtonController)controller
{
  return self->_controller;
}

- (BOOL)_selectsWhenTracking
{
  return self->_selectsWhenTracking;
}

- (unint64_t)controlSize
{
  return self->_controlSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customImageEdgeInsets, 0);
  objc_storeStrong((id *)&self->_customLandscapeImagePhones, 0);
  objc_storeStrong((id *)&self->_customImages, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
