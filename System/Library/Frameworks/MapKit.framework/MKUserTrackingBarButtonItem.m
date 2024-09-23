@implementation MKUserTrackingBarButtonItem

- (MKUserTrackingBarButtonItem)initWithMapView:(MKMapView *)mapView
{
  MKMapView *v5;
  MKUserTrackingBarButtonItem *v6;
  MKUserTrackingBarButtonItem *v7;
  uint64_t v8;
  _MKUserTrackingButton *userTrackingButton;
  uint64_t v10;
  _MKUserTrackingButtonController *controller;
  _MKUserTrackingButton *v12;
  id v13;
  void *v14;
  MKUserTrackingBarButtonItem *v15;
  MKUserTrackingBarButtonItem *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v5 = mapView;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99778];
    v19 = (void *)MEMORY[0x1E0CB3940];
    v15 = self;
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ %@"), v15, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "raise:format:", v18, CFSTR("%@: mapView must be an MKMapView instance"), v21);
    v16 = 0;
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)MKUserTrackingBarButtonItem;
    v6 = -[UIBarItem init](&v23, sel_init);
    v7 = v6;
    if (v6)
    {
      -[MKUserTrackingBarButtonItem setStyle:](v6, "setStyle:", 0);
      -[MKUserTrackingBarButtonItem setTarget:](v7, "setTarget:", v7);
      -[MKUserTrackingBarButtonItem setAction:](v7, "setAction:", sel__goToNextMode_);
      -[MKUserTrackingBarButtonItem _setInternallyEnabled:](v7, "_setInternallyEnabled:", 1);
      +[_MKUserTrackingButton buttonWithUserTrackingView:](_MKUserTrackingButton, "buttonWithUserTrackingView:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
      userTrackingButton = v7->_userTrackingButton;
      v7->_userTrackingButton = (_MKUserTrackingButton *)v8;

      -[_MKUserTrackingButton controller](v7->_userTrackingButton, "controller");
      v10 = objc_claimAutoreleasedReturnValue();
      controller = v7->_controller;
      v7->_controller = (_MKUserTrackingButtonController *)v10;

      objc_storeStrong((id *)&v7->_customButton, v7->_userTrackingButton);
      -[MKUserTrackingBarButtonItem setCustomView:](v7, "setCustomView:", v7->_customButton);
      -[MKUserTrackingBarButtonItem set_associatedView:](v7, "set_associatedView:", v7->_customButton);
      v7->_hasCustomAssociatedView = 1;
      v12 = v7->_userTrackingButton;
      v13 = objc_alloc_init(MEMORY[0x1E0CEA860]);
      -[_MKUserTrackingButton addInteraction:](v12, "addInteraction:", v13);

      +[MKUsageCounter sharedCounter](MKUsageCounter, "sharedCounter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "count:", 5);

    }
    v15 = v7;
    v16 = v15;
  }

  return v16;
}

- (MKUserTrackingBarButtonItem)init
{
  return -[MKUserTrackingBarButtonItem initWithMapView:](self, "initWithMapView:", 0);
}

- (MKUserTrackingBarButtonItem)initWithCoder:(id)a3
{
  return -[MKUserTrackingBarButtonItem initWithMapView:](self, "initWithMapView:", 0);
}

- (void)dealloc
{
  void *v3;
  UIView *associatedView;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  associatedView = self->_associatedView;
  if (associatedView)
    -[UIView removeObserver:forKeyPath:](associatedView, "removeObserver:forKeyPath:", self, CFSTR("controlSize"));
  v5.receiver = self;
  v5.super_class = (Class)MKUserTrackingBarButtonItem;
  -[MKUserTrackingBarButtonItem dealloc](&v5, sel_dealloc);
}

- (BOOL)_selectsWhenTracking
{
  return -[_MKUserTrackingButton _selectsWhenTracking](self->_userTrackingButton, "_selectsWhenTracking");
}

- (void)_setSelectsWhenTracking:(BOOL)a3
{
  -[_MKUserTrackingButton _setSelectsWhenTracking:](self->_userTrackingButton, "_setSelectsWhenTracking:", a3);
}

- (id)_imageForState:(int64_t)a3 controlState:(unint64_t)a4
{
  void *v4;
  id result;

  if (self->_userTrackingButton)
  {
    -[_MKUserTrackingButton _imageForState:controlState:](self->_userTrackingButton, "_imageForState:controlState:", a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  else
  {
    switch(a3)
    {
      case -1:
      case 1:
        -[MKUserTrackingBarButtonItem _trackingEmptyImage](self, "_trackingEmptyImage");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        return v4;
      case 0:
        -[MKUserTrackingBarButtonItem _trackingNoneImage](self, "_trackingNoneImage");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        return v4;
      case 2:
        -[MKUserTrackingBarButtonItem _trackingFollowImage](self, "_trackingFollowImage");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        return v4;
      case 3:
        -[MKUserTrackingBarButtonItem _trackingFollowWithHeadingImage](self, "_trackingFollowWithHeadingImage");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        return v4;
      default:
        result = 0;
        break;
    }
  }
  return result;
}

- (id)_imageForUserTrackingMode:(int64_t)a3
{
  return -[_MKUserTrackingButton _imageForUserTrackingMode:controlState:](self->_userTrackingButton, "_imageForUserTrackingMode:controlState:", a3, 0);
}

- (void)_setImage:(id)a3 forUserTrackingMode:(int64_t)a4
{
  -[_MKUserTrackingButton _setImage:forUserTrackingMode:controlState:](self->_userTrackingButton, "_setImage:forUserTrackingMode:controlState:", a3, a4, 0);
}

- (id)_landscapeImagePhoneForUserTrackingMode:(int64_t)a3
{
  return -[_MKUserTrackingButton _landscapeImagePhoneForUserTrackingMode:controlState:](self->_userTrackingButton, "_landscapeImagePhoneForUserTrackingMode:controlState:", a3, 0);
}

- (void)_setLandscapeImagePhone:(id)a3 forUserTrackingMode:(int64_t)a4
{
  -[_MKUserTrackingButton _setLandscapeImagePhone:forUserTrackingMode:controlState:](self->_userTrackingButton, "_setLandscapeImagePhone:forUserTrackingMode:controlState:", a3, a4, 0);
}

- (id)_trackingEmptyImage
{
  UIImage *trackingEmptyImage;
  UIImage *v4;
  UIImage *v5;

  trackingEmptyImage = self->_trackingEmptyImage;
  if (!trackingEmptyImage)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_imageNamed:", CFSTR("TrackingEmpty.png"));
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v5 = self->_trackingEmptyImage;
    self->_trackingEmptyImage = v4;

    trackingEmptyImage = self->_trackingEmptyImage;
  }
  return trackingEmptyImage;
}

- (id)_trackingNoneImage
{
  UIImage *trackingNoneImage;
  UIImage *v4;
  UIImage *v5;

  trackingNoneImage = self->_trackingNoneImage;
  if (!trackingNoneImage)
  {
    if (_MKLinkedOnOrAfterReleaseSet(2310))
      objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("location"));
    else
      objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_imageNamed:", CFSTR("TrackingLocationMask"));
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v5 = self->_trackingNoneImage;
    self->_trackingNoneImage = v4;

    trackingNoneImage = self->_trackingNoneImage;
  }
  return trackingNoneImage;
}

- (id)_trackingFollowImage
{
  UIImage *trackingFollowImage;
  UIImage *v4;
  UIImage *v5;

  trackingFollowImage = self->_trackingFollowImage;
  if (!trackingFollowImage)
  {
    if (_MKLinkedOnOrAfterReleaseSet(2310))
      objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("location.fill"));
    else
      objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_imageNamed:", CFSTR("TrackingLocationMask"));
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v5 = self->_trackingFollowImage;
    self->_trackingFollowImage = v4;

    trackingFollowImage = self->_trackingFollowImage;
  }
  return trackingFollowImage;
}

- (id)_trackingFollowWithHeadingImage
{
  UIImage *trackingFollowWithHeadingImage;
  UIImage *v4;
  UIImage *v5;

  trackingFollowWithHeadingImage = self->_trackingFollowWithHeadingImage;
  if (!trackingFollowWithHeadingImage)
  {
    if (_MKLinkedOnOrAfterReleaseSet(2310))
      objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("location.north.line.fill"));
    else
      objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_imageNamed:", CFSTR("TrackingHeadingMask"));
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v5 = self->_trackingFollowWithHeadingImage;
    self->_trackingFollowWithHeadingImage = v4;

    trackingFollowWithHeadingImage = self->_trackingFollowWithHeadingImage;
  }
  return trackingFollowWithHeadingImage;
}

+ (Class)_activityIndicatorClass
{
  return (Class)objc_opt_class();
}

- (int64_t)_activityIndicatorStyle
{
  if (-[MKUserTrackingBarButtonItem _isInMiniBar](self, "_isInMiniBar"))
    return 4;
  else
    return 100;
}

- (BOOL)_isInMiniBar
{
  void *toolbar;

  toolbar = self->_toolbar;
  if (toolbar || (toolbar = self->_navigationBar) != 0)
    LOBYTE(toolbar) = objc_msgSend(toolbar, "isMinibar");
  return (char)toolbar;
}

- (MKUserTrackingView)_userTrackingView
{
  return -[_MKUserTrackingButtonController userTrackingView](self->_controller, "userTrackingView");
}

- (void)_setUserTrackingView:(id)a3
{
  MKMapView *v4;
  MKMapView *mapView;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = (MKMapView *)v6;
  else
    v4 = 0;
  mapView = self->_mapView;
  self->_mapView = v4;

  -[_MKUserTrackingButtonController setUserTrackingView:](self->_controller, "setUserTrackingView:", v6);
}

- (MKMapView)mapView
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[MKUserTrackingBarButtonItem _userTrackingView](self, "_userTrackingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[MKUserTrackingBarButtonItem _userTrackingView](self, "_userTrackingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (MKMapView *)v5;
}

- (void)setMapView:(MKMapView *)mapView
{
  MKMapView *v5;
  char isKindOfClass;
  void *v7;
  uint64_t v8;
  void *v9;
  MKUserTrackingBarButtonItem *v10;
  void *v11;
  void *v12;
  MKMapView *v13;

  v5 = mapView;
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
    -[MKUserTrackingBarButtonItem _setUserTrackingView:](self, "_setUserTrackingView:", v5);
  }

}

- (BOOL)isEnabled
{
  return self->_explicitlyEnabled;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v4;
  objc_super v5;

  self->_explicitlyEnabled = a3;
  v4 = a3 && self->_internallyEnabled;
  v5.receiver = self;
  v5.super_class = (Class)MKUserTrackingBarButtonItem;
  -[MKUserTrackingBarButtonItem setEnabled:](&v5, sel_setEnabled_, v4);
  -[UIButton setEnabled:](self->_customButton, "setEnabled:", v4);
}

- (void)_setInternallyEnabled:(BOOL)a3
{
  _BOOL8 v4;
  objc_super v5;

  self->_internallyEnabled = a3;
  v4 = self->_explicitlyEnabled && a3;
  v5.receiver = self;
  v5.super_class = (Class)MKUserTrackingBarButtonItem;
  -[MKUserTrackingBarButtonItem setEnabled:](&v5, sel_setEnabled_, v4);
  -[UIButton setEnabled:](self->_customButton, "setEnabled:", v4);
}

- (void)set_associatedView:(id)a3
{
  UIView **p_associatedView;
  UIView *associatedView;
  id v7;

  v7 = a3;
  p_associatedView = &self->_associatedView;
  associatedView = self->_associatedView;
  if (associatedView)
    -[UIView removeObserver:forKeyPath:](associatedView, "removeObserver:forKeyPath:", self, CFSTR("controlSize"));
  objc_storeStrong((id *)&self->_associatedView, a3);
  if (*p_associatedView)
    -[UIView addObserver:forKeyPath:options:context:](*p_associatedView, "addObserver:forKeyPath:options:context:", self, CFSTR("controlSize"), 0, 0);

}

- (id)createViewForToolbar:(id)a3
{
  id v4;
  UIView *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  if (self->_hasCustomAssociatedView)
  {
    -[MKUserTrackingBarButtonItem _associatedView](self, "_associatedView");
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MKUserTrackingBarButtonItem;
    -[MKUserTrackingBarButtonItem createViewForToolbar:](&v9, sel_createViewForToolbar_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKUserTrackingBarButtonItem set_associatedView:](self, "set_associatedView:", v6);

    -[MKUserTrackingBarButtonItem set_toolbar:](self, "set_toolbar:", v4);
    -[_MKUserTrackingButtonController imageView](self->_controller, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");
    -[UIView addSubview:](self->_associatedView, "addSubview:", v7);
    -[MKUserTrackingBarButtonItem _repositionViews](self, "_repositionViews");
    v5 = self->_associatedView;

  }
  return v5;
}

- (id)createViewForNavigationItem:(id)a3
{
  id v4;
  UIView *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  if (self->_hasCustomAssociatedView)
  {
    -[MKUserTrackingBarButtonItem _associatedView](self, "_associatedView");
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MKUserTrackingBarButtonItem;
    -[MKUserTrackingBarButtonItem createViewForNavigationItem:](&v10, sel_createViewForNavigationItem_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKUserTrackingBarButtonItem set_associatedView:](self, "set_associatedView:", v6);

    objc_msgSend(v4, "navigationBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKUserTrackingBarButtonItem set_navigationBar:](self, "set_navigationBar:", v7);

    -[_MKUserTrackingButtonController imageView](self->_controller, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");
    -[UIView addSubview:](self->_associatedView, "addSubview:", v8);
    -[MKUserTrackingBarButtonItem _repositionViews](self, "_repositionViews");
    v5 = self->_associatedView;

  }
  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("controlSize")))
  {
    -[MKUserTrackingBarButtonItem _repositionViews](self, "_repositionViews");
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)MKUserTrackingBarButtonItem;
    -[MKUserTrackingBarButtonItem observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (BOOL)_isHighlightedForState:(int64_t)a3
{
  return a3 > 1;
}

- (void)_updateForState:(int64_t)a3
{
  -[MKUserTrackingBarButtonItem setStyle:](self, "setStyle:", 0);
}

- (int64_t)_state
{
  return -[_MKUserTrackingButtonController state](self->_controller, "state");
}

- (void)_setState:(int64_t)a3
{
  -[_MKUserTrackingButtonController setState:](self->_controller, "setState:", a3);
}

- (void)_goToNextMode:(id)a3
{
  -[_MKUserTrackingButtonController _goToNextMode:](self->_controller, "_goToNextMode:", a3);
}

- (UIToolbar)_toolbar
{
  return self->_toolbar;
}

- (void)set_toolbar:(id)a3
{
  objc_storeStrong((id *)&self->_toolbar, a3);
}

- (UINavigationBar)_navigationBar
{
  return self->_navigationBar;
}

- (void)set_navigationBar:(id)a3
{
  objc_storeStrong((id *)&self->_navigationBar, a3);
}

- (UIView)_associatedView
{
  return self->_associatedView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedView, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_trackingFollowWithHeadingImage, 0);
  objc_storeStrong((id *)&self->_trackingFollowImage, 0);
  objc_storeStrong((id *)&self->_trackingNoneImage, 0);
  objc_storeStrong((id *)&self->_trackingEmptyImage, 0);
  objc_storeStrong((id *)&self->_userTrackingButton, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_customButton, 0);
}

@end
