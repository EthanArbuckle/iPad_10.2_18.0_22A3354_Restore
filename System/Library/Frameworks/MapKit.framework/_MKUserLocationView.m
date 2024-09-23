@implementation _MKUserLocationView

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_MKUserLocationView;
  -[MKAnnotationView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_MKUserLocationView _updateCalloutOffset](self, "_updateCalloutOffset");
}

- (unint64_t)_innerPulseFrameWhenDisabled:(unint64_t)a3
{
  return a3 >> 1;
}

- (void)_updateMaxRadiusToShowAccuracyRing
{
  double externalMaxAccuracyRadius;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _BOOL4 v16;
  _BOOL4 v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  objc_super v22;
  objc_super v23;

  externalMaxAccuracyRadius = self->_externalMaxAccuracyRadius;
  if (externalMaxAccuracyRadius <= 0.0)
  {
    if (self->_radiusBasedAccuracyOpacity)
    {
      -[MKAnnotationView _staticMapView](self, "_staticMapView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
      {
        v6 = v4;
      }
      else
      {
        -[MKAnnotationView _mapView](self, "_mapView");
        v6 = (id)objc_claimAutoreleasedReturnValue();
      }
      v7 = v6;

      objc_msgSend(v7, "bounds");
      v9 = v8;
      objc_msgSend(v7, "bounds");
      v11 = v10;
      objc_msgSend(v7, "bounds");
      if (v9 >= v11)
        v14 = v13;
      else
        v14 = v12;
      v15 = 940.0 / v14;
      v16 = 940.0 / v14 >= 2.5;
      v17 = 940.0 / v14 > 1.5 || 940.0 / v14 >= 2.5;
      if (v15 <= 1.5)
        v16 = 1;
      v18 = 0.75;
      if (v17)
        v18 = 1.25;
      v19 = v15 * 0.5;
      if (v16)
        v19 = v18;
      v20 = v14 * v19;
      v22.receiver = self;
      v22.super_class = (Class)_MKUserLocationView;
      -[_MKPuckAnnotationView setMaxRadiusToShowAccuracyRing:](&v22, sel_setMaxRadiusToShowAccuracyRing_, v14 * v19);
      -[_MKPuckAnnotationView _setAccuracyRingStrokeOpacityThreshold:](self, "_setAccuracyRingStrokeOpacityThreshold:", v20 * 0.800000012);

    }
    else
    {
      -[_MKPuckAnnotationView setMaxRadiusToShowAccuracyRing:](&v21, sel_setMaxRadiusToShowAccuracyRing_, 0.0, self, _MKUserLocationView);
    }
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)_MKUserLocationView;
    -[_MKPuckAnnotationView setMaxRadiusToShowAccuracyRing:](&v23, sel_setMaxRadiusToShowAccuracyRing_, externalMaxAccuracyRadius, v21.receiver, v21.super_class);
  }
}

- (void)setAnnotation:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[_MKUserLocationView _stopObservingAnnotation](self, "_stopObservingAnnotation");
  v5.receiver = self;
  v5.super_class = (Class)_MKUserLocationView;
  -[MKAnnotationView setAnnotation:](&v5, sel_setAnnotation_, v4);

  -[_MKUserLocationView _startObservingAnnotation](self, "_startObservingAnnotation");
}

- (void)_stopObservingAnnotation
{
  void *v3;
  void *v4;

  -[MKAnnotationView annotation](self, "annotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[_MKKVOProxy removeObserverForObject:forKeyPath:](self->_kvoProxy, "removeObserverForObject:forKeyPath:", v3, CFSTR("title"));
    -[_MKKVOProxy removeObserverForObject:forKeyPath:](self->_kvoProxy, "removeObserverForObject:forKeyPath:", v4, CFSTR("subtitle"));
    v3 = v4;
  }

}

- (void)_startObservingAnnotation
{
  void *v3;
  _MKKVOProxy *kvoProxy;
  _MKKVOProxy *v5;
  _MKKVOProxy *v6;
  void *v7;

  -[MKAnnotationView annotation](self, "annotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    kvoProxy = self->_kvoProxy;
    v7 = v3;
    if (!kvoProxy)
    {
      v5 = -[_MKKVOProxy initWithDelegate:]([_MKKVOProxy alloc], "initWithDelegate:", self);
      v6 = self->_kvoProxy;
      self->_kvoProxy = v5;

      kvoProxy = self->_kvoProxy;
    }
    -[_MKKVOProxy addObserverForObject:forKeyPath:options:context:](kvoProxy, "addObserverForObject:forKeyPath:options:context:", v7, CFSTR("title"), 0, 0);
    -[_MKKVOProxy addObserverForObject:forKeyPath:options:context:](self->_kvoProxy, "addObserverForObject:forKeyPath:options:context:", v7, CFSTR("subtitle"), 0, 0);
    v3 = v7;
  }

}

- (_MKUserLocationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _MKUserLocationView *v9;
  void *v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  MKGetUserLocationViewLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Initialization", (const char *)&unk_18B2CC343, buf, 2u);
  }

  v13.receiver = self;
  v13.super_class = (Class)_MKUserLocationView;
  v9 = -[_MKPuckAnnotationView initWithAnnotation:reuseIdentifier:](&v13, sel_initWithAnnotation_reuseIdentifier_, v6, v7);

  if (v9)
  {
    v9->_showingPreciseAuthorizedLocation = 1;
    -[_MKPuckAnnotationView setShouldDisplayInaccurateHeading:](v9, "setShouldDisplayInaccurateHeading:", 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "location");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKPuckAnnotationView updateStateFromLocation:duration:](v9, "updateStateFromLocation:duration:", v10, 0.0);

    }
    -[_MKUserLocationView _updateCalloutOffset](v9, "_updateCalloutOffset");
  }
  MKGetUserLocationViewLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Initialization", (const char *)&unk_18B2CC343, buf, 2u);
  }

  return v9;
}

- (void)_updateCalloutStyle
{
  int64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  _MKUserLocationViewImageProvider *v10;
  _MKUserLocationViewImageProvider *imageProvider;
  void *v12;
  objc_super v13;
  objc_super v14;

  if (!self->_hasExplicitCalloutStyle)
  {
    if ((_MKModernPuckDesignEnabled() & 1) != 0)
    {
      v3 = -[MKAnnotationView _calloutStyle](self, "_calloutStyle");
      -[MKAnnotationView leftCalloutAccessoryView](self, "leftCalloutAccessoryView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = 1;
      }
      else
      {
        -[MKAnnotationView rightCalloutAccessoryView](self, "rightCalloutAccessoryView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          v5 = 1;
        }
        else
        {
          -[MKAnnotationView detailCalloutAccessoryView](self, "detailCalloutAccessoryView");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v7 != 0;

        }
      }

      v8 = -[MKAnnotationView canShowCallout](self, "canShowCallout");
      v9 = !v8 || !v5;
      if ((!v8 || !v5) && !self->_imageProvider)
      {
        v10 = -[_MKUserLocationViewImageProvider initWithUserLocationView:]([_MKUserLocationViewImageProvider alloc], "initWithUserLocationView:", self);
        imageProvider = self->_imageProvider;
        self->_imageProvider = v10;

      }
      v13.receiver = self;
      v13.super_class = (Class)_MKUserLocationView;
      -[MKAnnotationView _setCalloutStyle:](&v13, sel__setCalloutStyle_, v9);
      -[_MKUserLocationView _updateCalloutOffset](self, "_updateCalloutOffset");
      if (v3 != v9)
      {
        -[MKAnnotationView _calloutView](self, "_calloutView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          -[_MKUserLocationView _dismissCallout:](self, "_dismissCallout:", 1);
          -[MKAnnotationView updateCalloutViewIfNeededAnimated:](self, "updateCalloutViewIfNeededAnimated:", 1);
        }
      }
    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)_MKUserLocationView;
      -[MKAnnotationView _setCalloutStyle:](&v14, sel__setCalloutStyle_, 0);
    }
  }
}

- (void)_updateCalloutOffset
{
  _BOOL4 showingPreciseAuthorizedLocation;
  double MidY;
  double v5;
  double v6;
  double v7;
  _MKUserLocationView *v8;
  CGRect v9;

  if (-[MKAnnotationView _calloutStyle](self, "_calloutStyle") == 1)
  {
    showingPreciseAuthorizedLocation = self->_showingPreciseAuthorizedLocation;
    -[_MKUserLocationView bounds](self, "bounds");
    MidY = CGRectGetMidY(v9);
    if (!showingPreciseAuthorizedLocation)
    {
      v7 = 0.0;
      v8 = self;
      v6 = MidY;
      goto LABEL_7;
    }
    objc_msgSend((id)objc_opt_class(), "baseDiameter");
    v6 = MidY + v5 * -0.5 * 0.5;
    v7 = 0.0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_calloutOffset");
  }
  v8 = self;
LABEL_7:
  -[MKAnnotationView setCalloutOffset:](v8, "setCalloutOffset:", v7, v6);
}

- (void)_setShowingPreciseAuthorizedLocation:(BOOL)a3
{
  double v4;
  double v5;
  void *v6;

  if (self->_showingPreciseAuthorizedLocation != a3)
  {
    self->_showingPreciseAuthorizedLocation = a3;
    if (_MKModernPuckDesignEnabled())
    {
      -[_MKPuckAnnotationView _setShouldShowDynamicLocationAnimations:](self, "_setShouldShowDynamicLocationAnimations:", self->_showingPreciseAuthorizedLocation);
      -[_MKPuckAnnotationView _setDisplaysPuckAsAccuracy:](self, "_setDisplaysPuckAsAccuracy:", !self->_showingPreciseAuthorizedLocation);
      if (self->_showingPreciseAuthorizedLocation)
      {
        GEOConfigGetDouble();
        -[_MKPuckAnnotationView _setMinimumAccuracyRadius:](self, "_setMinimumAccuracyRadius:");
        GEOConfigGetDouble();
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "baseDiameter");
        -[_MKPuckAnnotationView _setMinimumAccuracyRadius:](self, "_setMinimumAccuracyRadius:", v5 * 0.5 + 1.0);
        v4 = 0.0;
      }
      -[_MKPuckAnnotationView _setMinimumAccuracyUncertainty:](self, "_setMinimumAccuracyUncertainty:", v4);
      -[_MKUserLocationView _updateCalloutOffset](self, "_updateCalloutOffset");
      -[MKAnnotationView _calloutView](self, "_calloutView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[_MKUserLocationView _dismissCallout:](self, "_dismissCallout:", 1);
        -[MKAnnotationView updateCalloutViewIfNeededAnimated:](self, "updateCalloutViewIfNeededAnimated:", 1);
      }
    }
  }
}

- (void)_updateLegacyConfiguration
{
  uint64_t v3;
  objc_super v4;

  v3 = _MKModernPuckDesignEnabled();
  self->_radiusBasedAccuracyOpacity = v3;
  -[_MKPuckAnnotationView _setShouldHidePuckWhenAccuracyVisible:](self, "_setShouldHidePuckWhenAccuracyVisible:", v3);
  -[_MKUserLocationView _updateMaxRadiusToShowAccuracyRing](self, "_updateMaxRadiusToShowAccuracyRing");
  -[_MKUserLocationView _updateCalloutStyle](self, "_updateCalloutStyle");
  v4.receiver = self;
  v4.super_class = (Class)_MKUserLocationView;
  -[_MKPuckAnnotationView _updateLegacyConfiguration](&v4, sel__updateLegacyConfiguration);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MKUserLocationView;
  -[_MKPuckAnnotationView layoutSubviews](&v3, sel_layoutSubviews);
  -[_MKUserLocationView _updateMaxRadiusToShowAccuracyRing](self, "_updateMaxRadiusToShowAccuracyRing");
}

- (void)_setBalloonImageTintColor:(id)a3
{
  UIColor *v4;
  UIColor *balloonImageTintColor;

  v4 = (UIColor *)a3;
  -[_MKUserLocationView willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("balloonImageTintColor"));
  balloonImageTintColor = self->_balloonImageTintColor;
  self->_balloonImageTintColor = v4;

  -[_MKUserLocationView didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("balloonImageTintColor"));
}

- (void)_setBalloonImage:(id)a3
{
  UIImage *v4;
  UIImage *balloonImage;

  v4 = (UIImage *)a3;
  -[_MKUserLocationView willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("balloonImage"));
  balloonImage = self->_balloonImage;
  self->_balloonImage = v4;

  -[_MKUserLocationView didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("balloonImage"));
}

- (void)dealloc
{
  objc_super v3;

  -[_MKUserLocationView _stopObservingAnnotation](self, "_stopObservingAnnotation");
  v3.receiver = self;
  v3.super_class = (Class)_MKUserLocationView;
  -[_MKPuckAnnotationView dealloc](&v3, sel_dealloc);
}

- (void)setMaxRadiusToShowAccuracyRing:(double)a3
{
  self->_externalMaxAccuracyRadius = a3;
  -[_MKUserLocationView _updateMaxRadiusToShowAccuracyRing](self, "_updateMaxRadiusToShowAccuracyRing");
}

- (void)_setCalloutStyle:(int64_t)a3
{
  objc_super v3;

  self->_hasExplicitCalloutStyle = 1;
  v3.receiver = self;
  v3.super_class = (Class)_MKUserLocationView;
  -[MKAnnotationView _setCalloutStyle:](&v3, sel__setCalloutStyle_, a3);
}

- (void)setLeftCalloutAccessoryView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_MKUserLocationView;
  -[MKAnnotationView setLeftCalloutAccessoryView:](&v4, sel_setLeftCalloutAccessoryView_, a3);
  -[_MKUserLocationView _updateCalloutStyle](self, "_updateCalloutStyle");
}

- (void)setRightCalloutAccessoryView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_MKUserLocationView;
  -[MKAnnotationView setRightCalloutAccessoryView:](&v4, sel_setRightCalloutAccessoryView_, a3);
  -[_MKUserLocationView _updateCalloutStyle](self, "_updateCalloutStyle");
}

- (void)setDetailCalloutAccessoryView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_MKUserLocationView;
  -[MKAnnotationView setDetailCalloutAccessoryView:](&v4, sel_setDetailCalloutAccessoryView_, a3);
  -[_MKUserLocationView _updateCalloutStyle](self, "_updateCalloutStyle");
}

- (BOOL)_allowedToShowCallout
{
  objc_super v4;

  if ((-[MKAnnotationView _calloutStyle](self, "_calloutStyle") | 2) != 2)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)_MKUserLocationView;
  return -[MKAnnotationView _allowedToShowCallout](&v4, sel__allowedToShowCallout);
}

- (BOOL)shouldShowCallout
{
  int64_t v3;
  objc_super v5;

  v3 = -[MKAnnotationView _calloutStyle](self, "_calloutStyle");
  if (v3 != 1)
  {
    v5.receiver = self;
    v5.super_class = (Class)_MKUserLocationView;
    LOBYTE(v3) = -[MKAnnotationView shouldShowCallout](&v5, sel_shouldShowCallout);
  }
  return v3;
}

- (void)_showCallout:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[MKAnnotationView _calloutStyle](self, "_calloutStyle") == 1)
  {
    -[_MKPuckAnnotationView setShouldInnerPulse:](self, "setShouldInnerPulse:", 0);
    -[_MKPuckAnnotationView setCanShowHeadingIndicator:](self, "setCanShowHeadingIndicator:", 0);
    if (self->_showingPreciseAuthorizedLocation)
      -[_MKPuckAnnotationView setPuckScale:](self, "setPuckScale:", 0.5);
  }
  else
  {
    -[_MKPuckAnnotationView setPuckScale:](self, "setPuckScale:", 1.0);
    -[_MKPuckAnnotationView setShouldInnerPulse:](self, "setShouldInnerPulse:", 1);
    -[_MKPuckAnnotationView setCanShowHeadingIndicator:](self, "setCanShowHeadingIndicator:", 1);
  }
  v5.receiver = self;
  v5.super_class = (Class)_MKUserLocationView;
  -[MKAnnotationView _showCallout:](&v5, sel__showCallout_, v3);
}

- (void)_dismissCallout:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[_MKPuckAnnotationView setPuckScale:](self, "setPuckScale:", 1.0);
  -[_MKPuckAnnotationView setShouldInnerPulse:](self, "setShouldInnerPulse:", 1);
  -[_MKPuckAnnotationView setCanShowHeadingIndicator:](self, "setCanShowHeadingIndicator:", 1);
  v5.receiver = self;
  v5.super_class = (Class)_MKUserLocationView;
  -[MKAnnotationView _dismissCallout:](&v5, sel__dismissCallout_, v3);
}

- (BOOL)_balloonCalloutShouldCenterWhenOffscreen
{
  return 1;
}

- (int64_t)_balloonCalloutStyle
{
  return 2;
}

- (UIImage)_balloonImage
{
  return self->_balloonImage;
}

- (UIColor)_balloonTintColor
{
  return (UIColor *)_MKPuckAnnotationViewBaseColor(-[MKAnnotationView _mapType](self, "_mapType"), 0);
}

- (UIColor)_balloonStrokeColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.333299994);
}

- (UIColor)_balloonInnerStrokeColor
{
  return (UIColor *)_MKPuckAnnotationViewBaseColor(-[MKAnnotationView _mapType](self, "_mapType"), 0);
}

- (UIColor)_balloonImageTintColor
{
  return self->_balloonImageTintColor;
}

- (void)_mkObserveValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("title")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("subtitle")))
  {
    -[_MKUserLocationView _updateCalloutStyle](self, "_updateCalloutStyle");
  }

}

- (BOOL)_showingPreciseAuthorizedLocation
{
  return self->_showingPreciseAuthorizedLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kvoProxy, 0);
  objc_storeStrong((id *)&self->_balloonImageTintColor, 0);
  objc_storeStrong((id *)&self->_balloonImage, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
}

@end
