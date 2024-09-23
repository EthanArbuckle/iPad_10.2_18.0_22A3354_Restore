@implementation MKPitchButton

- (void)_updateButtonState
{
  id WeakRetained;
  id v4;
  int v5;
  int v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  id v12;
  uint64_t v13;
  _BOOL4 v14;
  int v15;
  unsigned int v16;
  uint64_t v17;
  id v18;
  int v19;
  UIButton *button;
  UIButton *v21;
  void *v22;
  UIButton *v23;
  void *v24;
  id v25;
  id v26;

  if (-[MKPitchButton visibility](self, "visibility") == 1)
  {
    -[MKPitchButton setHidden:](self, "setHidden:", 1);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    if (objc_msgSend(WeakRetained, "_isPitched"))
    {
      v4 = objc_loadWeakRetained((id *)&self->_mapView);
      v5 = objc_msgSend(v4, "_canEnter3DMode");

      v6 = v5 ^ 1;
    }
    else
    {
      v6 = 1;
    }

    GEOConfigGetDouble();
    v8 = v7;
    v9 = objc_loadWeakRetained((id *)&self->_mapView);
    objc_msgSend(v9, "_zoomLevel");
    v11 = v10;

    v12 = objc_loadWeakRetained((id *)&self->_mapView);
    v13 = objc_msgSend(v12, "mapType");
    v14 = (unint64_t)(v13 - 1) >= 4 && v13 != 107;

    if (v11 < v8)
      v15 = v6;
    else
      v15 = 0;
    v16 = v15 & v14;
    if (-[MKPitchButton visibility](self, "visibility"))
      v17 = 0;
    else
      v17 = v16;
    -[MKPitchButton setHidden:](self, "setHidden:", v17);
  }
  v18 = objc_loadWeakRetained((id *)&self->_mapView);
  v19 = objc_msgSend(v18, "_isPitched");

  button = self->_button;
  if (v19)
  {
    -[UIButton setAccessibilityIdentifier:](button, "setAccessibilityIdentifier:", CFSTR("ModeButton2D"));
    v21 = self->_button;
    _MKLocalizedStringFromThisBundle(CFSTR("2D mode"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setAccessibilityLabel:](v21, "setAccessibilityLabel:", v22);

    objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_systemImageNamed:", CFSTR("view.2d"));
    v26 = (id)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](self->_button, "setImage:forState:");
    -[UIButton setEnabled:](self->_button, "setEnabled:", 1);
  }
  else
  {
    -[UIButton setAccessibilityIdentifier:](button, "setAccessibilityIdentifier:", CFSTR("ModeButton3D"));
    v23 = self->_button;
    _MKLocalizedStringFromThisBundle(CFSTR("3D mode"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setAccessibilityLabel:](v23, "setAccessibilityLabel:", v24);

    objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_systemImageNamed:", CFSTR("view.3d"));
    v26 = (id)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](self->_button, "setImage:forState:");
    v25 = objc_loadWeakRetained((id *)&self->_mapView);
    -[UIButton setEnabled:](self->_button, "setEnabled:", objc_msgSend(v25, "_canEnter3DMode"));

  }
}

- (int64_t)visibility
{
  return self->_visibility;
}

- (void)setMapView:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  if (WeakRetained != obj)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_loadWeakRetained((id *)&self->_mapView);
    objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("MKMapViewPitchStateDidChangeNotification"), v6);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_loadWeakRetained((id *)&self->_mapView);
    objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("MKMapViewCanEnter3DDidChangeNotification"), v8);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_loadWeakRetained((id *)&self->_mapView);
    objc_msgSend(v9, "removeObserver:name:object:", self, 0x1E20E0AC0, v10);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_loadWeakRetained((id *)&self->_mapView);
    objc_msgSend(v11, "removeObserver:name:object:", self, CFSTR("MKMapViewDidChangeZoomNotification"), v12);

    v13 = objc_loadWeakRetained((id *)&self->_mapView);
    if (v13)
      --v13[170];

    objc_storeWeak((id *)&self->_mapView, obj);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__updateButtonState, CFSTR("MKMapViewPitchStateDidChangeNotification"), obj);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", self, sel__updateButtonState, CFSTR("MKMapViewCanEnter3DDidChangeNotification"), obj);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", self, sel__updateButtonState, 0x1E20E0AC0, obj);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", self, sel__updateButtonState, CFSTR("MKMapViewDidChangeZoomNotification"), obj);

    v18 = objc_loadWeakRetained((id *)&self->_mapView);
    if (v18)
      ++v18[170];

    -[MKPitchButton _updateButtonState](self, "_updateButtonState");
  }

}

- (void)_setBackgroundStyle:(unint64_t)a3
{
  void *v5;
  double v6;
  void *v7;
  id v8;
  UIVisualEffectView *v9;
  UIVisualEffectView *effectView;
  void *v11;
  void *v12;

  if (self->_backgroundStyle != a3)
  {
    self->_backgroundStyle = a3;
    -[MKPitchButton layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    if (a3)
    {
      LODWORD(v6) = 1.0;
      objc_msgSend(v5, "setShadowOpacity:", v6);

      if (!self->_effectView)
      {
        v8 = objc_alloc(MEMORY[0x1E0CEABE8]);
        v9 = (UIVisualEffectView *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        effectView = self->_effectView;
        self->_effectView = v9;

        objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIVisualEffectView setEffect:](self->_effectView, "setEffect:", v11);

        -[UIVisualEffectView setUserInteractionEnabled:](self->_effectView, "setUserInteractionEnabled:", 0);
        -[UIVisualEffectView layer](self->_effectView, "layer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setMasksToBounds:", 1);

      }
      -[MKPitchButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
      -[MKPitchButton insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_effectView, 0);
      -[MKPitchButton setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      LODWORD(v6) = 0;
      objc_msgSend(v5, "setShadowOpacity:", v6);

      -[UIVisualEffectView removeFromSuperview](self->_effectView, "removeFromSuperview");
      -[MKPitchButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    }
  }
}

- (void)setVisibility:(int64_t)a3
{
  if (self->_visibility != a3)
  {
    self->_visibility = a3;
    -[MKPitchButton _updateButtonState](self, "_updateButtonState");
  }
}

+ (MKPitchButton)pitchButtonWithMapView:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMapView:", v4);

  return (MKPitchButton *)v5;
}

- (MKPitchButton)initWithMapView:(id)a3
{
  id v4;
  MKPitchButton *v5;
  MKPitchButton *v6;
  uint64_t v7;
  UIButton *button;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MKPitchButton;
  v5 = -[MKPitchButton initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    v5->_backgroundStyle = 0;
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v7 = objc_claimAutoreleasedReturnValue();
    button = v6->_button;
    v6->_button = (UIButton *)v7;

    -[UIButton addTarget:action:forControlEvents:](v6->_button, "addTarget:action:forControlEvents:", v6, sel__performPitchAction_, 0x2000);
    v6->_controlSize = 1;
    -[MKPitchButton _updateControlSize](v6, "_updateControlSize");
    -[MKPitchButton addSubview:](v6, "addSubview:", v6->_button);
    -[MKPitchButton layer](v6, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShadowRadius:", 8.0);

    -[MKPitchButton layer](v6, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShadowOffset:", 0.0, 2.0);

    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "colorWithAlphaComponent:", 0.0799999982);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = objc_msgSend(v12, "CGColor");
    -[MKPitchButton layer](v6, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setShadowColor:", v13);

    -[MKPitchButton layer](v6, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = 0;
    objc_msgSend(v15, "setShadowOpacity:", v16);

    -[MKPitchButton layer](v6, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setMasksToBounds:", 0);

    -[MKPitchButton setMapView:](v6, "setMapView:", v4);
  }

  return v6;
}

- (void)_updateControlSize
{
  void *v3;
  unint64_t controlSize;
  _BOOL4 IsMacCatalyst;
  unint64_t v6;
  uint64_t v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0CEA650];
  controlSize = self->_controlSize;
  IsMacCatalyst = MapKitIdiomIsMacCatalyst();
  v6 = 12;
  if (controlSize == 2)
    v6 = 16;
  v7 = 18;
  if (controlSize == 2)
    v7 = 22;
  if (!IsMacCatalyst)
    v6 = v7;
  objc_msgSend(v3, "_mapkit_configurationWithPointSize:weight:", (double)v6, *MEMORY[0x1E0CEB5E8]);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UIButton setPreferredSymbolConfiguration:forImageInState:](self->_button, "setPreferredSymbolConfiguration:forImageInState:", v8, 0);

}

- (MKPitchButton)initWithFrame:(CGRect)a3
{
  return -[MKPitchButton initWithMapView:](self, "initWithMapView:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGSize)intrinsicContentSize
{
  unint64_t controlSize;
  BOOL v4;
  double v5;
  double v6;
  double v7;
  unint64_t v8;
  double v9;
  unint64_t v10;
  BOOL v11;
  double v12;
  double v13;
  CGSize result;

  controlSize = self->_controlSize;
  if (MapKitIdiomIsMacCatalyst())
  {
    v4 = controlSize == 2;
    v5 = 36.0;
    v6 = 49.0;
  }
  else
  {
    v5 = 36.0;
    if (controlSize == 1)
      v5 = 44.0;
    v4 = controlSize == 2;
    v6 = 60.0;
  }
  if (v4)
    v7 = v6;
  else
    v7 = v5;
  v8 = -[MKPitchButton _backgroundStyle](self, "_backgroundStyle", v5);
  v9 = v7;
  if (v8 != 2)
  {
    v10 = self->_controlSize;
    if (MapKitIdiomIsMacCatalyst() && v10 < 3)
    {
      v9 = dbl_18B2AF160[v10];
    }
    else
    {
      if (MapKitIdiomIsMacCatalyst())
      {
        v11 = v10 == 2;
        v12 = 36.0;
        v9 = 49.0;
      }
      else
      {
        v12 = 36.0;
        if (v10 == 1)
          v12 = 44.0;
        v11 = v10 == 2;
        v9 = 60.0;
      }
      if (!v11)
        v9 = v12;
    }
  }
  v13 = v7;
  result.height = v9;
  result.width = v13;
  return result;
}

- (void)layoutSubviews
{
  CGFloat v3;
  void *v4;
  CGFloat v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t controlSize;
  double v10;
  double v11;
  void *v12;
  unint64_t v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  objc_super v21;
  CGRect v22;
  CGRect v23;

  v21.receiver = self;
  v21.super_class = (Class)MKPitchButton;
  -[MKPitchButton layoutSubviews](&v21, sel_layoutSubviews);
  -[MKPitchButton bounds](self, "bounds");
  -[UIButton setFrame:](self->_button, "setFrame:");
  -[MKPitchButton bounds](self, "bounds");
  -[UIVisualEffectView setFrame:](self->_effectView, "setFrame:");
  if (-[MKPitchButton _backgroundStyle](self, "_backgroundStyle") == 2)
  {
    -[MKPitchButton bounds](self, "bounds");
    v3 = CGRectGetWidth(v22) * 0.5;
    -[MKPitchButton layer](self, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCornerRadius:", v3);

    -[MKPitchButton bounds](self, "bounds");
    v5 = CGRectGetWidth(v23) * 0.5;
    -[UIVisualEffectView layer](self->_effectView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCornerRadius:", v5);

    v7 = (void *)MEMORY[0x1E0CEA390];
    -[MKPitchButton bounds](self, "bounds");
    objc_msgSend(v7, "bezierPathWithOvalInRect:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    controlSize = self->_controlSize;
    if (controlSize == 1)
      v10 = 8.0;
    else
      v10 = 6.0;
    if (controlSize == 2)
      v11 = 11.0;
    else
      v11 = v10;
    -[MKPitchButton layer](self, "layer", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCornerRadius:", v11);

    v13 = self->_controlSize;
    if (v13 == 1)
      v14 = 8.0;
    else
      v14 = 6.0;
    if (v13 == 2)
      v15 = 11.0;
    else
      v15 = v14;
    -[UIVisualEffectView layer](self->_effectView, "layer", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCornerRadius:", v15);

    v17 = (void *)MEMORY[0x1E0CEA390];
    -[MKPitchButton bounds](self, "bounds");
    objc_msgSend(v17, "bezierPathWithRoundedRect:cornerRadius:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = objc_retainAutorelease(v8);
  v19 = objc_msgSend(v18, "CGPath");
  -[MKPitchButton layer](self, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setShadowPath:", v19);

}

- (void)_setControlSize:(unint64_t)a3
{
  if (self->_controlSize != a3)
  {
    self->_controlSize = a3;
    -[MKPitchButton _updateControlSize](self, "_updateControlSize");
    -[MKPitchButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)_performPitchAction:(id)a3
{
  MKMapView **p_mapView;
  id WeakRetained;
  int v5;
  id v6;
  int v7;
  id v8;

  p_mapView = &self->_mapView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
  v5 = objc_msgSend(WeakRetained, "_isPitched");

  v6 = objc_loadWeakRetained((id *)p_mapView);
  v8 = v6;
  if (v5)
  {
    objc_msgSend(v6, "_exit3DMode");
  }
  else
  {
    v7 = objc_msgSend(v6, "_canEnter3DMode");

    if (!v7)
      return;
    v8 = objc_loadWeakRetained((id *)p_mapView);
    objc_msgSend(v8, "_enter3DMode");
  }

}

- (void)addInteraction:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIButton addInteraction:](self->_button, "addInteraction:", v4);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MKPitchButton;
    -[MKPitchButton addInteraction:](&v5, sel_addInteraction_, v4);
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
    -[UIButton removeInteraction:](self->_button, "removeInteraction:", v4);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MKPitchButton;
    -[MKPitchButton removeInteraction:](&v5, sel_removeInteraction_, v4);
  }

}

- (MKMapView)mapView
{
  return (MKMapView *)objc_loadWeakRetained((id *)&self->_mapView);
}

- (unint64_t)_backgroundStyle
{
  return self->_backgroundStyle;
}

- (unint64_t)_controlSize
{
  return self->_controlSize;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
