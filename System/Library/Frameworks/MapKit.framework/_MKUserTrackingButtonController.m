@implementation _MKUserTrackingButtonController

- (void)_reloadState
{
  id WeakRetained;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  -[_MKUserTrackingButtonController _updatePreferredSymbolConfiguration](self, "_updatePreferredSymbolConfiguration");
  -[_MKUserTrackingButtonController _imageForState:controlState:](self, "_imageForState:controlState:", self->_state, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_imageView, "setImage:", v11);
  WeakRetained = objc_loadWeakRetained((id *)&self->_button);
  objc_msgSend(WeakRetained, "setImage:forState:", v11, 0);

  v4 = objc_loadWeakRetained((id *)&self->_button);
  -[_MKUserTrackingButtonController _imageForState:controlState:](self, "_imageForState:controlState:", self->_state, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:forState:", v5, 1);

  v6 = objc_loadWeakRetained((id *)&self->_button);
  -[_MKUserTrackingButtonController _imageForState:controlState:](self, "_imageForState:controlState:", self->_state, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:forState:", v7, 2);

  v8 = objc_loadWeakRetained((id *)&self->_button);
  -[_MKUserTrackingButtonController _imageForState:controlState:](self, "_imageForState:controlState:", self->_state, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:forState:", v9, 4);

  v10 = objc_loadWeakRetained((id *)&self->_target);
  objc_msgSend(v10, "_repositionViews");

}

- (id)_imageForState:(int64_t)a3 controlState:(unint64_t)a4
{
  id WeakRetained;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  objc_msgSend(WeakRetained, "_imageForState:controlState:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_updatePreferredSymbolConfiguration
{
  void *v3;
  _MKUserTrackingButton **p_button;
  id WeakRetained;
  char v6;
  double v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = (void *)MEMORY[0x1E0CEA650];
  p_button = &self->_button;
  WeakRetained = objc_loadWeakRetained((id *)&self->_button);
  v6 = objc_msgSend(WeakRetained, "inMiniBar");
  v7 = 15.0;
  if ((v6 & 1) == 0)
    -[_MKUserTrackingButtonController _symbolPointSize](self, "_symbolPointSize", 15.0);
  objc_msgSend(v3, "configurationWithPointSize:", v7);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v8 = objc_loadWeakRetained((id *)p_button);
  objc_msgSend(v8, "setPreferredSymbolConfiguration:forImageInState:", v12, 0);

  v9 = objc_loadWeakRetained((id *)p_button);
  objc_msgSend(v9, "setPreferredSymbolConfiguration:forImageInState:", v12, 1);

  v10 = objc_loadWeakRetained((id *)p_button);
  objc_msgSend(v10, "setPreferredSymbolConfiguration:forImageInState:", v12, 2);

  v11 = objc_loadWeakRetained((id *)p_button);
  objc_msgSend(v11, "setPreferredSymbolConfiguration:forImageInState:", v12, 4);

}

- (double)_symbolPointSize
{
  _BOOL4 v3;
  double result;
  unint64_t controlSize;
  _BOOL4 IsMacCatalyst;
  unint64_t v7;
  uint64_t v8;

  v3 = _MKLinkedOnOrAfterReleaseSet(3081);
  result = 22.0;
  if (v3)
  {
    controlSize = self->_controlSize;
    IsMacCatalyst = MapKitIdiomIsMacCatalyst();
    v7 = 12;
    if (controlSize == 2)
      v7 = 16;
    v8 = 18;
    if (controlSize == 2)
      v8 = 22;
    if (!IsMacCatalyst)
      return (double)(unint64_t)v8;
    return (double)v7;
  }
  return result;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setButtonBehavior:(unint64_t)a3
{
  self->_buttonBehavior = a3;
}

- (_MKUserTrackingButtonController)initWithTarget:(id)a3 userTrackingView:(id)a4 imageView:(id)a5 button:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _MKUserTrackingButtonController *v14;
  _MKUserTrackingButtonController *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _MKUserTrackingButtonController *v19;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)_MKUserTrackingButtonController;
  v14 = -[_MKUserTrackingButtonController init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_state = -1;
    objc_storeWeak((id *)&v14->_target, v10);
    objc_storeStrong((id *)&v15->_imageView, a5);
    v16 = *MEMORY[0x1E0CD2F78];
    -[UIImageView layer](v15->_imageView, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setContentsGravity:", v16);

    objc_storeWeak((id *)&v15->_button, v13);
    v15->_controlSize = 1;
    -[_MKUserTrackingButtonController _updatePreferredSymbolConfiguration](v15, "_updatePreferredSymbolConfiguration");
    -[_MKUserTrackingButtonController setUserTrackingView:](v15, "setUserTrackingView:", v11);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v15, sel__authorizationStatusChanged_, MKLocationManagerApprovalDidChangeNotification, 0);

    v19 = v15;
  }

  return v15;
}

- (void)setUserTrackingView:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  int v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  int v25;
  id v26;
  void *v27;
  NSObject *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _MKUserTrackingButtonController *v32;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_userTrackingView);

  if (WeakRetained != v4)
  {
    v6 = objc_loadWeakRetained((id *)&self->_userTrackingView);

    if (!v6)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_loadWeakRetained((id *)&self->_userTrackingView);
    objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("MKUserTrackingViewModeDidChangeNotification"), v8);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_loadWeakRetained((id *)&self->_userTrackingView);
    objc_msgSend(v9, "removeObserver:name:object:", self, CFSTR("MKUserTrackingViewDidUpdateUserLocationNotification"), v10);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_loadWeakRetained((id *)&self->_userTrackingView);
    objc_msgSend(v11, "removeObserver:name:object:", self, CFSTR("MKUserTrackingViewDidResetUserLocationNotification"), v12);

    v13 = objc_loadWeakRetained((id *)&self->_userTrackingView);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v14 = objc_loadWeakRetained((id *)&self->_userTrackingView);
      v15 = objc_msgSend(v14, "postsMapViewInitialRenderingNotification");

      if (!v15)
      {
LABEL_7:
        objc_storeWeak((id *)&self->_userTrackingView, 0);
LABEL_8:
        if (!v4)
        {
          v29 = objc_loadWeakRetained((id *)&self->_target);
          objc_msgSend(v29, "_setInternallyEnabled:", 0);
          goto LABEL_15;
        }
        objc_storeWeak((id *)&self->_userTrackingView, v4);
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_loadWeakRetained((id *)&self->_userTrackingView);
        objc_msgSend(v17, "addObserver:selector:name:object:", self, sel__updateState, CFSTR("MKUserTrackingViewModeDidChangeNotification"), v18);

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_loadWeakRetained((id *)&self->_userTrackingView);
        objc_msgSend(v19, "addObserver:selector:name:object:", self, sel__updateState, CFSTR("MKUserTrackingViewDidUpdateUserLocationNotification"), v20);

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_loadWeakRetained((id *)&self->_userTrackingView);
        objc_msgSend(v21, "addObserver:selector:name:object:", self, sel__updateState, CFSTR("MKUserTrackingViewDidResetUserLocationNotification"), v22);

        v23 = objc_loadWeakRetained((id *)&self->_userTrackingView);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v24 = objc_loadWeakRetained((id *)&self->_userTrackingView);
          v25 = objc_msgSend(v24, "postsMapViewInitialRenderingNotification");

          if (!v25)
          {
LABEL_13:
            +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            dispatch_get_global_queue(0, 0);
            v28 = objc_claimAutoreleasedReturnValue();
            v30[0] = MEMORY[0x1E0C809B0];
            v30[1] = 3221225472;
            v30[2] = __55___MKUserTrackingButtonController_setUserTrackingView___block_invoke;
            v30[3] = &unk_1E20D7E58;
            v31 = v27;
            v32 = self;
            v29 = v27;
            dispatch_async(v28, v30);

LABEL_15:
            -[_MKUserTrackingButtonController _updateState](self, "_updateState");
            goto LABEL_16;
          }
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_loadWeakRetained((id *)&self->_userTrackingView);
          objc_msgSend(v23, "addObserver:selector:name:object:", self, sel__updateState, CFSTR("MKMapViewDidFinishInitialRenderNotification"), v26);

        }
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_loadWeakRetained((id *)&self->_userTrackingView);
      objc_msgSend(v13, "removeObserver:name:object:", self, CFSTR("MKMapViewDidFinishInitialRenderNotification"), v16);

    }
    goto LABEL_7;
  }
LABEL_16:

}

- (void)setState:(int64_t)a3
{
  int64_t state;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  uint64_t v11;
  id v12;
  id v13;

  state = self->_state;
  if (state != a3)
  {
    v6 = -[_MKUserTrackingButtonController _shouldAnimateFromState:toState:](self, "_shouldAnimateFromState:toState:", state, a3);
    self->_state = a3;
    if (v6)
    {
      -[UIImageView layer](self->_imageView, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKUserTrackingButtonController _shrinkAnimation](self, "_shrinkAnimation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "set_mapkit_ID:", 7);
      objc_msgSend(v8, "setDelegate:", self);
      -[_MKUserTrackingButtonController _contentAnimation](self, "_contentAnimation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "duration");
      objc_msgSend(v9, "setDuration:");
      objc_msgSend(v7, "addAnimation:forKey:", v8, CFSTR("shrink"));
      if (v9)
        objc_msgSend(v7, "addAnimation:forKey:", v9, CFSTR("contents"));

    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_target);
      objc_msgSend(WeakRetained, "_updateForState:", a3);

      -[_MKUserTrackingButtonController _reloadState](self, "_reloadState");
      -[_MKUserTrackingButtonController _updateLoading](self, "_updateLoading");
    }
    v13 = objc_loadWeakRetained((id *)&self->_target);
    v11 = objc_msgSend(v13, "_isHighlightedForState:", a3);
    v12 = objc_loadWeakRetained((id *)&self->_button);
    objc_msgSend(v12, "setSelected:", v11);

  }
}

- (void)_updateState
{
  MKUserTrackingView **p_userTrackingView;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  _BOOL4 v8;
  uint64_t v9;
  id v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  p_userTrackingView = &self->_userTrackingView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_userTrackingView);
  v5 = objc_msgSend(WeakRetained, "userTrackingMode");

  v6 = 2;
  if (v5 != 1)
    v6 = 0;
  v7 = v5 == 2;
  v8 = v5 != 2 && v5 != 1;
  if (v7)
    v9 = 3;
  else
    v9 = v6;
  v10 = objc_loadWeakRetained((id *)p_userTrackingView);
  v11 = objc_msgSend(v10, "hasUserLocation");

  if (v11)
    v12 = v9;
  else
    v12 = 1;
  if (v8)
    v13 = 0;
  else
    v13 = v12;
  -[_MKUserTrackingButtonController setState:](self, "setState:", v13);
}

- (void)_updateLoading
{
  id WeakRetained;
  _MKUserTrackingButton **p_button;
  id v5;
  void *v6;
  id v7;
  double MidX;
  id v9;
  id v10;
  UIActivityIndicatorView *activityIndicatorView;
  UIActivityIndicatorView *v12;
  CGRect v13;
  CGRect v14;

  if (self->_state == 1)
  {
    -[_MKUserTrackingButtonController _activityIndicatorView](self, "_activityIndicatorView");
    v12 = (UIActivityIndicatorView *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_target);
    -[UIActivityIndicatorView setActivityIndicatorViewStyle:](v12, "setActivityIndicatorViewStyle:", objc_msgSend(WeakRetained, "_activityIndicatorStyle"));

    p_button = &self->_button;
    v5 = objc_loadWeakRetained((id *)p_button);
    objc_msgSend(v5, "addSubview:", v12);

    -[UIActivityIndicatorView superview](v12, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClipsToBounds:", 0);

    -[UIActivityIndicatorView startAnimating](v12, "startAnimating");
    v7 = objc_loadWeakRetained((id *)p_button);
    objc_msgSend(v7, "bounds");
    MidX = CGRectGetMidX(v13);
    v9 = objc_loadWeakRetained((id *)p_button);
    objc_msgSend(v9, "bounds");
    -[UIActivityIndicatorView setCenter:](v12, "setCenter:", MidX, CGRectGetMidY(v14));

    v10 = objc_loadWeakRetained((id *)p_button);
    objc_msgSend(v10, "layoutIfNeeded");

    activityIndicatorView = v12;
  }
  else
  {
    -[UIActivityIndicatorView stopAnimating](self->_activityIndicatorView, "stopAnimating");
    -[UIActivityIndicatorView removeFromSuperview](self->_activityIndicatorView, "removeFromSuperview");
    activityIndicatorView = self->_activityIndicatorView;
    self->_activityIndicatorView = 0;
  }

}

- (BOOL)_shouldAnimateFromState:(int64_t)a3 toState:(int64_t)a4
{
  if (!a3 && a4 == 2)
    return 0;
  return (a3 != 2 || a4 != 0) && a3 != -1 && a4 != -1;
}

- (void)_authorizationStatusChanged:(id)a3
{
  void *v4;
  id v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isLocationServicesRestricted"))
  {
    objc_msgSend(WeakRetained, "_setInternallyEnabled:", 0);
  }
  else
  {
    v5 = objc_loadWeakRetained((id *)&self->_userTrackingView);
    objc_msgSend(WeakRetained, "_setInternallyEnabled:", v5 != 0);

  }
}

- (void)setControlSize:(unint64_t)a3
{
  if (self->_controlSize != a3)
  {
    self->_controlSize = a3;
    -[_MKUserTrackingButtonController _updatePreferredSymbolConfiguration](self, "_updatePreferredSymbolConfiguration");
  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_MKUserTrackingButtonController;
  -[_MKUserTrackingButtonController dealloc](&v4, sel_dealloc);
}

- (id)_activityIndicatorView
{
  UIActivityIndicatorView *activityIndicatorView;
  id WeakRetained;
  UIActivityIndicatorView *v5;
  UIActivityIndicatorView *v6;

  activityIndicatorView = self->_activityIndicatorView;
  if (!activityIndicatorView)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_target);
    v5 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_activityIndicatorClass")), "initWithActivityIndicatorStyle:", 100);
    v6 = self->_activityIndicatorView;
    self->_activityIndicatorView = v5;

    -[UIActivityIndicatorView setUserInteractionEnabled:](self->_activityIndicatorView, "setUserInteractionEnabled:", 0);
    -[UIActivityIndicatorView setAutoresizingMask:](self->_activityIndicatorView, "setAutoresizingMask:", 45);
    activityIndicatorView = self->_activityIndicatorView;
  }
  return activityIndicatorView;
}

- (void)_goToNextMode:(id)a3
{
  MKUserTrackingView **p_userTrackingView;
  id WeakRetained;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  id v11;
  char v12;
  _BOOL8 v13;
  id v14;
  int v15;
  id v16;

  p_userTrackingView = &self->_userTrackingView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_userTrackingView);
  v6 = objc_msgSend(WeakRetained, "userTrackingMode");

  v7 = -[_MKUserTrackingButtonController buttonBehavior](self, "buttonBehavior");
  v8 = -[_MKUserTrackingButtonController buttonBehavior](self, "buttonBehavior");
  if (self->_state == 1 && v7 != 1)
  {
    v10 = 0;
    goto LABEL_18;
  }
  if (!v6 && v8 != 1)
  {
    v10 = 1;
    goto LABEL_18;
  }
  if (!v6 && v8 == 1)
  {
    v11 = objc_loadWeakRetained((id *)p_userTrackingView);
    v12 = objc_msgSend(v11, "isCurrentlyRotated");

    if ((v12 & 1) != 0)
    {
      v10 = 2;
      goto LABEL_18;
    }
LABEL_17:
    v10 = v7 == 1;
    goto LABEL_18;
  }
  if (v6 != 1)
    goto LABEL_17;
  v13 = v7 == 1;
  v14 = objc_loadWeakRetained((id *)p_userTrackingView);
  v15 = objc_msgSend(v14, "canRotateForHeading");

  if (v15)
    v10 = 2;
  else
    v10 = v13;
LABEL_18:
  v16 = objc_loadWeakRetained((id *)p_userTrackingView);
  objc_msgSend(v16, "_setUserTrackingMode:animated:fromTrackingButton:", v10, 1, 1);

}

- (id)_shrinkAnimation
{
  void *v2;
  double v3;
  void *v4;
  double v5;
  void *v6;
  float v7;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", 0x1E20DFB80);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFromValue:", v4);

  LODWORD(v5) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setToValue:", v6);

  UIAnimationDragCoefficient();
  objc_msgSend(v2, "setDuration:", v7 * 0.2);
  objc_msgSend(v2, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v2, "setRemovedOnCompletion:", 0);
  return v2;
}

- (id)_expandAnimation
{
  void *v2;
  double v3;
  void *v4;
  double v5;
  void *v6;
  float v7;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", 0x1E20DFB80);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFromValue:", v4);

  LODWORD(v5) = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setToValue:", v6);

  UIAnimationDragCoefficient();
  objc_msgSend(v2, "setDuration:", v7 * 0.2);
  return v2;
}

- (id)_contentAnimation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[UIImageView layer](self->_imageView, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationForKey:", CFSTR("contents"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v2, "contents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("contents"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0C99D20];
      objc_msgSend(v2, "contents");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "arrayWithObject:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValues:", v7);

      objc_msgSend(v4, "setCalculationMode:", *MEMORY[0x1E0CD2930]);
    }
  }

  return v4;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void *v5;
  id WeakRetained;
  id v7;

  if (objc_msgSend(a3, "_mapkit_ID") == 7)
  {
    -[UIImageView layer](self->_imageView, "layer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeAnimationForKey:", CFSTR("contents"));
    -[_MKUserTrackingButtonController _expandAnimation](self, "_expandAnimation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeAnimationForKey:", CFSTR("shrink"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_target);
    objc_msgSend(WeakRetained, "_updateForState:", self->_state);

    -[_MKUserTrackingButtonController _reloadState](self, "_reloadState");
    -[_MKUserTrackingButtonController _updateLoading](self, "_updateLoading");
    objc_msgSend(v7, "addAnimation:forKey:", v5, CFSTR("expand"));

  }
}

- (MKUserTrackingView)userTrackingView
{
  return (MKUserTrackingView *)objc_loadWeakRetained((id *)&self->_userTrackingView);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (unint64_t)buttonBehavior
{
  return self->_buttonBehavior;
}

- (unint64_t)controlSize
{
  return self->_controlSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_destroyWeak((id *)&self->_button);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_destroyWeak((id *)&self->_userTrackingView);
  objc_destroyWeak((id *)&self->_target);
}

@end
