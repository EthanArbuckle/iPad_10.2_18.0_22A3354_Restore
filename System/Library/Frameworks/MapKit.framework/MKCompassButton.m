@implementation MKCompassButton

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKCompassButton;
  -[MKCompassButton layoutSubviews](&v3, sel_layoutSubviews);
  -[MKCompassButton bounds](self, "bounds");
  -[MKCompassView setFrame:](self->_compassView, "setFrame:");
}

- (void)mapViewDidUpdateYawNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MKMapViewDidUpdateYawDegreesKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  -[MKCompassView setMapHeading:](self->_compassView, "setMapHeading:");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MKMapViewDidUpdateYawVisibleKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_visible = objc_msgSend(v5, "BOOLValue");

  -[MKCompassButton _updateVisibility](self, "_updateVisibility");
}

- (void)_updateVisibility
{
  id WeakRetained;
  MKCompassView *compassView;
  int64_t compassVisibility;
  _BOOL4 visible;
  void *v7;
  _QWORD v8[5];
  BOOL v9;
  _QWORD v10[5];
  BOOL v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  compassView = self->_compassView;
  if (WeakRetained)
  {
    -[MKCompassView setAlpha:](compassView, "setAlpha:", 1.0);
    compassVisibility = self->_compassVisibility;
    if (compassVisibility == 2)
    {
      visible = 1;
    }
    else if (compassVisibility)
    {
      visible = 0;
    }
    else
    {
      visible = self->_visible;
    }
    -[MKCompassButton window](self, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __36__MKCompassButton__updateVisibility__block_invoke;
      v10[3] = &unk_1E20D8320;
      v11 = visible;
      v10[4] = self;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __36__MKCompassButton__updateVisibility__block_invoke_2;
      v8[3] = &unk_1E20D8348;
      v8[4] = self;
      v9 = visible;
      objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_animateFromCurrentStateWithDuration:animations:completion:", v10, v8, 0.5);
    }
    else
    {
      -[MKCompassButton setAlpha:](self, "setAlpha:", (double)visible);
      -[MKCompassButton setHidden:](self, "setHidden:", !visible);
    }
  }
  else
  {
    -[MKCompassView setAlpha:](compassView, "setAlpha:", 0.25);
  }
}

+ (MKCompassButton)compassButtonWithMapView:(MKMapView *)mapView
{
  MKMapView *v4;
  _BOOL4 v5;
  double v6;
  void *v7;

  v4 = mapView;
  v5 = _MKLinkedOnOrAfterReleaseSet(3081);
  v6 = MKCompassViewDiameterForSize(v5);
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFrame:mapView:", v4, 0.0, 0.0, v6, v6);

  return (MKCompassButton *)v7;
}

- (MKCompassButton)initWithFrame:(CGRect)a3 mapView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  MKCompassButton *v10;
  MKCompassView *v11;
  uint64_t v12;
  MKCompassView *compassView;
  void *v14;
  void *v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MKCompassButton;
  v10 = -[MKCompassButton initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = [MKCompassView alloc];
    -[MKCompassButton bounds](v10, "bounds");
    v12 = -[MKCompassView initWithFrame:](v11, "initWithFrame:");
    compassView = v10->_compassView;
    v10->_compassView = (MKCompassView *)v12;

    if (_MKLinkedOnOrAfterReleaseSet(3081))
      -[MKCompassView setCompassViewSize:style:](v10->_compassView, "setCompassViewSize:style:", 1, 1);
    -[MKCompassView setAutoresizingMask:](v10->_compassView, "setAutoresizingMask:", 18);
    -[MKCompassButton setAutoresizesSubviews:](v10, "setAutoresizesSubviews:", 1);
    -[MKCompassButton addSubview:](v10, "addSubview:", v10->_compassView);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v10, sel_didTapCompassGesture_);
    -[MKCompassButton addGestureRecognizer:](v10, "addGestureRecognizer:", v14);
    -[MKCompassButton setMapView:](v10, "setMapView:", v9);
    +[MKUsageCounter sharedCounter](MKUsageCounter, "sharedCounter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "count:", 2);

  }
  return v10;
}

- (void)setMapView:(MKMapView *)mapView
{
  MKMapView *WeakRetained;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD *v12;
  id v13;
  MKMapView *obj;

  obj = mapView;
  WeakRetained = (MKMapView *)objc_loadWeakRetained((id *)&self->_mapView);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_mapView);

    if (v5)
    {
      v6 = objc_loadWeakRetained((id *)&self->_mapView);
      -[MKMapView _stopPostingCompassUpdateNotifications]((uint64_t)v6);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_loadWeakRetained((id *)&self->_mapView);
      objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("MKMapViewDidUpdateYawNotification"), v8);

    }
    self->_visible = 0;
    -[MKCompassView setMapHeading:](self->_compassView, "setMapHeading:", 0.0);
    v9 = objc_storeWeak((id *)&self->_mapView, obj);

    if (obj)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_loadWeakRetained((id *)&self->_mapView);
      objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_mapViewDidUpdateYawNotification_, CFSTR("MKMapViewDidUpdateYawNotification"), v11);

      v12 = objc_loadWeakRetained((id *)&self->_mapView);
      if (v12)
        ++v12[167];

      v13 = objc_loadWeakRetained((id *)&self->_mapView);
      objc_msgSend(v13, "_postDidUpdateYawNotification");

    }
    -[MKCompassButton _updateVisibility](self, "_updateVisibility");
  }

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[MKCompassView intrinsicContentSize](self->_compassView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setCompassVisibility:(MKFeatureVisibility)compassVisibility
{
  if (self->_compassVisibility != compassVisibility)
  {
    self->_compassVisibility = compassVisibility;
    -[MKCompassButton _updateVisibility](self, "_updateVisibility");
  }
}

- (MKCompassButton)initWithFrame:(CGRect)a3
{
  return -[MKCompassButton initWithFrame:mapView:](self, "initWithFrame:mapView:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
  -[MKMapView _stopPostingCompassUpdateNotifications]((uint64_t)WeakRetained);

  v4.receiver = self;
  v4.super_class = (Class)MKCompassButton;
  -[MKCompassButton dealloc](&v4, sel_dealloc);
}

- (void)setCompassSize:(int64_t)a3
{
  MKCompassView *compassView;
  void *v6;

  if (self->_compassSize != a3)
  {
    self->_compassSize = a3;
    compassView = self->_compassView;
    -[MKCompassButton traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKCompassView setCompassViewSize:style:](compassView, "setCompassViewSize:style:", a3, objc_msgSend(v6, "userInterfaceStyle") != 2);

    -[MKCompassButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)didTapCompassGesture:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "state") == 3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    objc_msgSend(WeakRetained, "_handleCompassTap:", v5);

  }
}

uint64_t __36__MKCompassButton__updateVisibility__block_invoke(uint64_t a1)
{
  unint64_t v2;
  double v3;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "setHidden:", 0);
    LOBYTE(v2) = *(_BYTE *)(a1 + 40);
    v3 = (double)v2;
  }
  else
  {
    v3 = 0.0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v3);
}

uint64_t __36__MKCompassButton__updateVisibility__block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "setHidden:", *(_BYTE *)(result + 40) == 0);
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double v5;
  double v6;
  CGSize result;

  -[MKCompassView intrinsicContentSize](self->_compassView, "intrinsicContentSize", a3.width, a3.height);
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[MKCompassView intrinsicContentSize](self->_compassView, "intrinsicContentSize", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)addInteraction:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MKCompassView addInteraction:](self->_compassView, "addInteraction:", v4);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MKCompassButton;
    -[MKCompassButton addInteraction:](&v5, sel_addInteraction_, v4);
  }

}

- (void)removeInteraction:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MKCompassView removeInteraction:](self->_compassView, "removeInteraction:", v4);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MKCompassButton;
    -[MKCompassButton removeInteraction:](&v5, sel_removeInteraction_, v4);
  }

}

- (MKMapView)mapView
{
  return (MKMapView *)objc_loadWeakRetained((id *)&self->_mapView);
}

- (MKFeatureVisibility)compassVisibility
{
  return self->_compassVisibility;
}

- (int64_t)compassSize
{
  return self->_compassSize;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);
  objc_storeStrong((id *)&self->_compassView, 0);
}

@end
