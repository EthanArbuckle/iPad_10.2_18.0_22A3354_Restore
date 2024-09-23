@implementation _MKPointOfInterestAnnotationView

- (_MKPointOfInterestAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  _MKPointOfInterestAnnotationView *v4;
  _MKPointOfInterestAnnotationView *v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_MKPointOfInterestAnnotationView;
  v4 = -[_MKMapFeatureAnnotationView initWithAnnotation:reuseIdentifier:](&v9, sel_initWithAnnotation_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[MKAnnotationView setBounds:](v4, "setBounds:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[MKAnnotationView setCanShowCallout:](v5, "setCanShowCallout:", 1);
    -[MKAnnotationView _setCalloutStyle:](v5, "_setCalloutStyle:", 1);
    -[MKAnnotationView setCollisionMode:](v5, "setCollisionMode:", 1);
    objc_msgSend(MEMORY[0x1E0CEAB40], "systemTraitsAffectingColorAppearance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)-[_MKPointOfInterestAnnotationView registerForTraitChanges:withAction:](v5, "registerForTraitChanges:withAction:", v6, sel_traitEnvironment_didChangeTraitCollection_);

  }
  return v5;
}

- (BOOL)shouldShowCallout
{
  void *v2;
  BOOL v3;

  -[MKAnnotationView annotation](self, "annotation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "featureType") == 0;

  return v3;
}

- (void)setAnnotation:(id)a3
{
  objc_super v3;

  if (self->super.super._annotation != a3)
  {
    v3.receiver = self;
    v3.super_class = (Class)_MKPointOfInterestAnnotationView;
    -[MKAnnotationView setAnnotation:](&v3, sel_setAnnotation_);
  }
}

- (void)_updateFromMap
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MKPointOfInterestAnnotationView;
  -[MKAnnotationView _updateFromMap](&v5, sel__updateFromMap);
  -[MKAnnotationView annotation](self, "annotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "marker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "calloutAnchorPointWithSnapToPixels:", 1);
  -[_MKPointOfInterestAnnotationView setCenter:](self, "setCenter:");

}

- (void)_updateAnchorOffset
{
  void *v3;
  id v4;
  CGRect v5;

  -[MKAnnotationView annotation](self, "annotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "marker");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "calloutAnchorRect");
  -[MKAnnotationView setCalloutOffset:](self, "setCalloutOffset:", CGRectGetMidX(v5), -8.0);

}

- (void)_resolveBalloonAttributes
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  UIColor *v17;
  UIColor *balloonFillColor;
  UIColor *v19;
  UIColor *balloonStrokeColor;
  id WeakRetained;
  int v22;
  UIColor *v23;
  UIColor *v24;
  UIImage *v25;
  UIImage *v26;
  id v27;
  uint64_t v28;
  float v29;
  UIImage *balloonImage;
  id v31;

  -[MKAnnotationView annotation](self, "annotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "marker");
  v31 = (id)objc_claimAutoreleasedReturnValue();

  -[MKAnnotationView annotation](self, "annotation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "featureType"))
  {
    -[_MKPointOfInterestAnnotationView _currentScreenScale](self, "_currentScreenScale");
    v6 = v5;
    objc_msgSend(v31, "styleAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D270A8], "styleAttributesForCalloutWithAttributes:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[_MKPointOfInterestAnnotationView mapView](self, "mapView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_mapLayer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "iconForStyleAttributes:contentScale:size:transparent:", v8, 8, 1, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
    if (objc_msgSend(v11, "calloutShape") == 1)
    {
      -[MKAnnotationView setCollisionMode:](self, "setCollisionMode:", 0);
      if (-[_MKPointOfInterestAnnotationView _isMetroArea](self, "_isMetroArea"))
      {
        v12 = objc_msgSend(v8, "isSystemTransit");
        v13 = 4;
        if (v12)
          v13 = 1;
      }
      else
      {
        v13 = 1;
      }
    }
    else if (-[_MKPointOfInterestAnnotationView _isMetroArea](self, "_isMetroArea"))
    {
      v14 = objc_msgSend(v8, "isLandmarkPOI");
      v13 = 3;
      if (v14)
        v13 = 0;
    }
    else
    {
      v13 = 0;
    }
    self->_balloonCalloutStyle = v13;
    v15 = objc_msgSend(v11, "calloutFillColor");
    v16 = objc_msgSend(v11, "calloutHaloColor");
    if (v15)
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithCGColor:", v15);
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v17 = (UIColor *)objc_claimAutoreleasedReturnValue();
    balloonFillColor = self->_balloonFillColor;
    self->_balloonFillColor = v17;

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithCGColor:", v16);
      v19 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = self->_balloonFillColor;
    }
    balloonStrokeColor = self->_balloonStrokeColor;
    self->_balloonStrokeColor = v19;

    if (objc_msgSend(v8, "isLandmarkPOI"))
    {
      if (!-[_MKPointOfInterestAnnotationView _isMetroArea](self, "_isMetroArea")
        || (WeakRetained = objc_loadWeakRetained((id *)&self->_mapView),
            v22 = objc_msgSend(WeakRetained, "_isHybridMap"),
            WeakRetained,
            v22))
      {
        objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
        v23 = (UIColor *)objc_claimAutoreleasedReturnValue();
        v24 = self->_balloonFillColor;
        self->_balloonFillColor = v23;

      }
    }
    v25 = v11;
    v26 = v25;
    if (v25)
    {
      v25 = (UIImage *)-[UIImage image](v25, "image");
      if (v25)
      {
        v27 = objc_alloc(MEMORY[0x1E0CEA638]);
        v28 = -[UIImage image](v26, "image");
        -[UIImage contentScale](v26, "contentScale");
        v25 = (UIImage *)objc_msgSend(v27, "initWithCGImage:scale:orientation:", v28, 0, v29);
      }
    }
    balloonImage = self->_balloonImage;
    self->_balloonImage = v25;

  }
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v5;
  void *v6;
  int v7;
  _MKMarkerAnnotationBaseImageView *anchorDotView;
  _MKMarkerAnnotationBaseImageContent *v9;

  v5 = a4;
  -[_MKPointOfInterestAnnotationView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasDifferentColorAppearanceComparedToTraitCollection:", v5);

  if (v7)
  {
    if (self->_anchorDotView)
    {
      -[_MKPointOfInterestAnnotationView _resolveBalloonAttributes](self, "_resolveBalloonAttributes");
      anchorDotView = self->_anchorDotView;
      v9 = -[_MKMarkerAnnotationBaseImageContent initWithFillColor:strokeColor:strokeWidth:blendMode:baseImageType:]([_MKMarkerAnnotationBaseImageContent alloc], "initWithFillColor:strokeColor:strokeWidth:blendMode:baseImageType:", self->_balloonStrokeColor, 0, 3, -[_MKPointOfInterestAnnotationView _baseImageType](self, "_baseImageType"), 0.0);
      -[_MKMarkerAnnotationBaseImageView _setBaseImageContent:](anchorDotView, "_setBaseImageContent:", v9);

    }
  }
}

- (BOOL)_isMetroArea
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
  v3 = objc_msgSend(WeakRetained, "_isShowingCuratedElevatedGround");

  return v3;
}

- (int64_t)_balloonCalloutStyle
{
  return self->_balloonCalloutStyle;
}

- (UIColor)_balloonTintColor
{
  return self->_balloonFillColor;
}

- (UIColor)_balloonStrokeColor
{
  return self->_balloonStrokeColor;
}

- (UIImage)_balloonImage
{
  return self->_balloonImage;
}

- (void)_addAnchorDotView
{
  _MKMarkerAnnotationBaseImageView *v3;
  double v4;
  double v5;
  double v6;
  _MKMarkerAnnotationBaseImageView *v7;
  _MKMarkerAnnotationBaseImageView *anchorDotView;
  void *v9;
  _MKMarkerAnnotationBaseImageView *v10;
  _MKMarkerAnnotationBaseImageContent *v11;

  v3 = [_MKMarkerAnnotationBaseImageView alloc];
  -[_MKPointOfInterestAnnotationView frame](self, "frame");
  v5 = v4 * 0.5 + -3.0;
  -[_MKPointOfInterestAnnotationView frame](self, "frame");
  v7 = -[_MKMarkerAnnotationBaseImageView initWithFrame:](v3, "initWithFrame:", v5, v6 + -6.0, 6.0, 6.0);
  anchorDotView = self->_anchorDotView;
  self->_anchorDotView = v7;

  -[_MKMarkerAnnotationBaseImageView layer](self->_anchorDotView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerRadius:", 3.0);

  v10 = self->_anchorDotView;
  v11 = -[_MKMarkerAnnotationBaseImageContent initWithFillColor:strokeColor:strokeWidth:blendMode:baseImageType:]([_MKMarkerAnnotationBaseImageContent alloc], "initWithFillColor:strokeColor:strokeWidth:blendMode:baseImageType:", self->_balloonStrokeColor, 0, 3, -[_MKPointOfInterestAnnotationView _baseImageType](self, "_baseImageType"), 0.0);
  -[_MKMarkerAnnotationBaseImageView _setBaseImageContent:](v10, "_setBaseImageContent:", v11);

  -[_MKPointOfInterestAnnotationView addSubview:](self, "addSubview:", self->_anchorDotView);
}

- (int64_t)_baseImageType
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  -[MKAnnotationView annotation](self, "annotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "marker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "styleAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_MKPointOfInterestAnnotationView _isMetroArea](self, "_isMetroArea")
    && (objc_msgSend(v5, "isLandmarkPOI") & 1) == 0)
  {
    v6 = objc_msgSend(v5, "isSystemTransit") ^ 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)updateCalloutViewIfNeededAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _MKMarkerAnnotationBaseImageView *anchorDotView;
  __int128 v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  _MKMarkerAnnotationBaseImageView *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  objc_super v34;
  _QWORD v35[5];
  _OWORD v36[3];
  CATransform3D v37;
  CATransform3D v38;
  _OWORD v39[3];
  _QWORD v40[2];
  _QWORD v41[3];

  v3 = a3;
  v41[2] = *MEMORY[0x1E0C80C00];
  -[_MKPointOfInterestAnnotationView _resolveBalloonAttributes](self, "_resolveBalloonAttributes");
  -[_MKPointOfInterestAnnotationView _updateAnchorOffset](self, "_updateAnchorOffset");
  if (-[MKAnnotationView isSelected](self, "isSelected"))
  {
    -[_MKPointOfInterestAnnotationView _addAnchorDotView](self, "_addAnchorDotView");
    anchorDotView = self->_anchorDotView;
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v39[0] = *MEMORY[0x1E0C9BAA8];
    v39[1] = v6;
    v39[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[_MKMarkerAnnotationBaseImageView setTransform:](anchorDotView, "setTransform:", v39);
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setMass:", 3.0);
      objc_msgSend(v7, "setStiffness:", 1940.0);
      objc_msgSend(v7, "setDamping:", 91.4000015);
      objc_msgSend(v7, "setInitialVelocity:", 0.0);
      memset(&v38, 0, sizeof(v38));
      CATransform3DMakeScale(&v38, 0.100000001, 0.100000001, 1.0);
      v37 = v38;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v37);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFromValue:", v8);

      v9 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
      *(_OWORD *)&v37.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
      *(_OWORD *)&v37.m33 = v9;
      v10 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
      *(_OWORD *)&v37.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
      *(_OWORD *)&v37.m43 = v10;
      v11 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
      *(_OWORD *)&v37.m11 = *MEMORY[0x1E0CD2610];
      *(_OWORD *)&v37.m13 = v11;
      v12 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
      *(_OWORD *)&v37.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
      *(_OWORD *)&v37.m23 = v12;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v37);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setToValue:", v13);

      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFromValue:", &unk_1E21590D0);
      objc_msgSend(v14, "setToValue:", &unk_1E21590E8);
      objc_msgSend(v14, "setDuration:", 0.239999995);
      objc_msgSend(MEMORY[0x1E0CD2700], "animation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setRemovedOnCompletion:", 1);
      objc_msgSend(v7, "settlingDuration");
      objc_msgSend(v15, "setDuration:");
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTimingFunction:", v16);

      v41[0] = v7;
      v41[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAnimations:", v17);

      -[_MKMarkerAnnotationBaseImageView layer](self->_anchorDotView, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v19) = 1.0;
      objc_msgSend(v18, "setOpacity:", v19);

      -[_MKMarkerAnnotationBaseImageView layer](self->_anchorDotView, "layer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addAnimation:forKey:", v15, CFSTR("show"));
LABEL_7:

    }
  }
  else
  {
    v21 = self->_anchorDotView;
    if (v21)
    {
      v22 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v36[0] = *MEMORY[0x1E0C9BAA8];
      v36[1] = v22;
      v36[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      -[_MKMarkerAnnotationBaseImageView setTransform:](v21, "setTransform:", v36);
      if (!v3)
      {
        -[_MKMarkerAnnotationBaseImageView removeFromSuperview](self->_anchorDotView, "removeFromSuperview");
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      memset(&v38, 0, sizeof(v38));
      CATransform3DMakeScale(&v38, 0.100000001, 0.100000001, 1.0);
      v23 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
      *(_OWORD *)&v37.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
      *(_OWORD *)&v37.m33 = v23;
      v24 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
      *(_OWORD *)&v37.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
      *(_OWORD *)&v37.m43 = v24;
      v25 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
      *(_OWORD *)&v37.m11 = *MEMORY[0x1E0CD2610];
      *(_OWORD *)&v37.m13 = v25;
      v26 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
      *(_OWORD *)&v37.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
      *(_OWORD *)&v37.m23 = v26;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v37);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFromValue:", v27);

      v37 = v38;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v37);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setToValue:", v28);

      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFromValue:", &unk_1E21590E8);
      objc_msgSend(v14, "setToValue:", &unk_1E21590D0);
      objc_msgSend(MEMORY[0x1E0CD2700], "animation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTimingFunction:", v29);

      objc_msgSend(v15, "setDuration:", 0.133330002);
      v40[0] = v7;
      v40[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAnimations:", v30);

      objc_msgSend(v15, "setRemovedOnCompletion:", 1);
      -[_MKMarkerAnnotationBaseImageView layer](self->_anchorDotView, "layer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v32) = 0;
      objc_msgSend(v31, "setOpacity:", v32);

      -[_MKMarkerAnnotationBaseImageView layer](self->_anchorDotView, "layer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __70___MKPointOfInterestAnnotationView_updateCalloutViewIfNeededAnimated___block_invoke;
      v35[3] = &unk_1E20D82F8;
      v35[4] = self;
      objc_msgSend(v20, "_mapkit_addAnimation:forKey:completion:", v15, CFSTR("hide"), v35);
      goto LABEL_7;
    }
  }
LABEL_9:
  v34.receiver = self;
  v34.super_class = (Class)_MKPointOfInterestAnnotationView;
  return -[MKAnnotationView updateCalloutViewIfNeededAnimated:](&v34, sel_updateCalloutViewIfNeededAnimated_, v3);
}

- (MKMapView)mapView
{
  return (MKMapView *)objc_loadWeakRetained((id *)&self->_mapView);
}

- (void)setMapView:(id)a3
{
  objc_storeWeak((id *)&self->_mapView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);
  objc_storeStrong((id *)&self->_balloonImage, 0);
  objc_storeStrong((id *)&self->_balloonStrokeColor, 0);
  objc_storeStrong((id *)&self->_balloonFillColor, 0);
  objc_storeStrong((id *)&self->_anchorDotView, 0);
}

@end
