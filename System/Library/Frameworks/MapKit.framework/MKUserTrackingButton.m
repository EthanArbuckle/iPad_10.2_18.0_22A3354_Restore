@implementation MKUserTrackingButton

- (MKMapView)mapView
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_button);
  objc_msgSend(WeakRetained, "mapView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MKMapView *)v3;
}

- (void)setMapView:(MKMapView *)mapView
{
  _MKUserTrackingButton **p_button;
  MKMapView *v4;
  id WeakRetained;

  p_button = &self->_button;
  v4 = mapView;
  WeakRetained = objc_loadWeakRetained((id *)p_button);
  objc_msgSend(WeakRetained, "setMapView:", v4);

}

+ (MKUserTrackingButton)userTrackingButtonWithMapView:(MKMapView *)mapView
{
  MKMapView *v4;
  id v5;

  v4 = mapView;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setMapView:", v4);

  return (MKUserTrackingButton *)v5;
}

- (MKUserTrackingButton)initWithFrame:(CGRect)a3 button:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  MKUserTrackingButton *v10;
  MKUserTrackingButton *v11;
  id v12;
  id WeakRetained;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  objc_super v26;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)MKUserTrackingButton;
  v10 = -[MKUserTrackingButton initWithFrame:](&v26, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    v10->_controlSize = 1;
    v12 = objc_storeWeak((id *)&v10->_button, v9);
    objc_msgSend(v9, "setControlSize:", 1);

    WeakRetained = objc_loadWeakRetained((id *)&v11->_button);
    -[MKUserTrackingButton addSubview:](v11, "addSubview:", WeakRetained);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKUserTrackingButton setBackgroundColor:](v11, "setBackgroundColor:", v14);

    -[MKUserTrackingButton setNeedsLayout](v11, "setNeedsLayout");
    +[MKUsageCounter sharedCounter](MKUsageCounter, "sharedCounter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "count:", 4);

    -[MKUserTrackingButton layer](v11, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setShadowRadius:", 8.0);

    -[MKUserTrackingButton layer](v11, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setShadowOffset:", 0.0, 2.0);

    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "colorWithAlphaComponent:", 0.0799999982);
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = objc_msgSend(v19, "CGColor");
    -[MKUserTrackingButton layer](v11, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setShadowColor:", v20);

    -[MKUserTrackingButton layer](v11, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v23) = 0;
    objc_msgSend(v22, "setShadowOpacity:", v23);

    -[MKUserTrackingButton layer](v11, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setMasksToBounds:", 0);

  }
  return v11;
}

- (MKUserTrackingButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  MKUserTrackingButton *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[_MKUserTrackingButton buttonWithMapView:](_MKUserTrackingButton, "buttonWithMapView:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MKUserTrackingButton initWithFrame:button:](self, "initWithFrame:button:", v8, x, y, width, height);

  return v9;
}

- (MKUserTrackingButton)init
{
  void *v3;
  MKUserTrackingButton *v4;

  +[_MKUserTrackingButton buttonWithMapView:](_MKUserTrackingButton, "buttonWithMapView:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeToFit");
  objc_msgSend(v3, "frame");
  v4 = -[MKUserTrackingButton initWithFrame:button:](self, "initWithFrame:button:", v3);

  return v4;
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
  v8 = -[MKUserTrackingButton backgroundStyle](self, "backgroundStyle", v5);
  v9 = v7;
  if (v8 != 2)
  {
    v10 = self->_controlSize;
    if (MapKitIdiomIsMacCatalyst() && v10 < 3)
    {
      v9 = dbl_18B2AA0F8[v10];
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
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id WeakRetained;
  CGFloat v12;
  void *v13;
  CGFloat v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t controlSize;
  double v19;
  double v20;
  void *v21;
  unint64_t v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  objc_super v30;
  CGRect v31;
  CGRect v32;

  v30.receiver = self;
  v30.super_class = (Class)MKUserTrackingButton;
  -[MKUserTrackingButton layoutSubviews](&v30, sel_layoutSubviews);
  -[MKUserTrackingButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  WeakRetained = objc_loadWeakRetained((id *)&self->_button);
  objc_msgSend(WeakRetained, "setFrame:", v4, v6, v8, v10);

  -[MKUserTrackingButton bounds](self, "bounds");
  -[UIVisualEffectView setFrame:](self->_effectView, "setFrame:");
  if (-[MKUserTrackingButton backgroundStyle](self, "backgroundStyle") == 2)
  {
    -[MKUserTrackingButton bounds](self, "bounds");
    v12 = CGRectGetWidth(v31) * 0.5;
    -[MKUserTrackingButton layer](self, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCornerRadius:", v12);

    -[MKUserTrackingButton bounds](self, "bounds");
    v14 = CGRectGetWidth(v32) * 0.5;
    -[UIVisualEffectView layer](self->_effectView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCornerRadius:", v14);

    v16 = (void *)MEMORY[0x1E0CEA390];
    -[MKUserTrackingButton bounds](self, "bounds");
    objc_msgSend(v16, "bezierPathWithOvalInRect:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    controlSize = self->_controlSize;
    if (controlSize == 1)
      v19 = 8.0;
    else
      v19 = 6.0;
    if (controlSize == 2)
      v20 = 11.0;
    else
      v20 = v19;
    -[MKUserTrackingButton layer](self, "layer", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setCornerRadius:", v20);

    v22 = self->_controlSize;
    if (v22 == 1)
      v23 = 8.0;
    else
      v23 = 6.0;
    if (v22 == 2)
      v24 = 11.0;
    else
      v24 = v23;
    -[UIVisualEffectView layer](self->_effectView, "layer", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setCornerRadius:", v24);

    v26 = (void *)MEMORY[0x1E0CEA390];
    -[MKUserTrackingButton bounds](self, "bounds");
    objc_msgSend(v26, "bezierPathWithRoundedRect:cornerRadius:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27 = objc_retainAutorelease(v17);
  v28 = objc_msgSend(v27, "CGPath");
  -[MKUserTrackingButton layer](self, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setShadowPath:", v28);

}

- (void)_setControlSize:(unint64_t)a3
{
  id WeakRetained;

  if (self->_controlSize != a3)
  {
    self->_controlSize = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_button);
    objc_msgSend(WeakRetained, "setControlSize:", a3);

    -[MKUserTrackingButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  void *v4;
  double v5;
  id WeakRetained;
  id v7;
  UIVisualEffectView *v8;
  UIVisualEffectView *effectView;
  void *v10;
  void *v11;
  id v12;
  double v13;
  id v14;

  if (self->_backgroundStyle != a3)
  {
    self->_backgroundStyle = a3;
    if (a3)
    {
      -[MKUserTrackingButton layer](self, "layer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v5) = 1.0;
      objc_msgSend(v4, "setShadowOpacity:", v5);

      WeakRetained = objc_loadWeakRetained((id *)&self->_button);
      objc_msgSend(WeakRetained, "_setSelectsWhenTracking:", 0);

      if (!self->_effectView)
      {
        v7 = objc_alloc(MEMORY[0x1E0CEABE8]);
        v8 = (UIVisualEffectView *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        effectView = self->_effectView;
        self->_effectView = v8;

        objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIVisualEffectView setEffect:](self->_effectView, "setEffect:", v10);

        -[UIVisualEffectView setUserInteractionEnabled:](self->_effectView, "setUserInteractionEnabled:", 0);
        -[UIVisualEffectView layer](self->_effectView, "layer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setMasksToBounds:", 1);

      }
      -[MKUserTrackingButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
      -[MKUserTrackingButton insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_effectView, 0);
      -[MKUserTrackingButton setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      v12 = objc_loadWeakRetained((id *)&self->_button);
      objc_msgSend(v12, "_setSelectsWhenTracking:", 1);

      -[UIVisualEffectView removeFromSuperview](self->_effectView, "removeFromSuperview");
      -[MKUserTrackingButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
      -[MKUserTrackingButton layer](self, "layer");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v13) = 0;
      objc_msgSend(v14, "setShadowOpacity:", v13);

    }
  }
}

- (void)addInteraction:(id)a3
{
  id v4;
  id WeakRetained;
  objc_super v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_button);
    objc_msgSend(WeakRetained, "addInteraction:", v4);

  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MKUserTrackingButton;
    -[MKUserTrackingButton addInteraction:](&v6, sel_addInteraction_, v4);
  }

}

- (void)removeInteraction:(id)a3
{
  id v4;
  id WeakRetained;
  objc_super v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_button);
    objc_msgSend(WeakRetained, "removeInteraction:", v4);

  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MKUserTrackingButton;
    -[MKUserTrackingButton removeInteraction:](&v6, sel_removeInteraction_, v4);
  }

}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (unint64_t)_controlSize
{
  return self->_controlSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_destroyWeak((id *)&self->_button);
}

@end
