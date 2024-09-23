@implementation _MKBalloonLabelMarkerView

- (_MKBalloonLabelMarkerView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  _MKBalloonLabelMarkerView *v4;
  _MKBalloonLabelMarkerView *v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_MKBalloonLabelMarkerView;
  v4 = -[_MKLabelMarkerView initWithAnnotation:reuseIdentifier:](&v9, sel_initWithAnnotation_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_needsToResolveBalloonAttributes = 1;
    -[MKAnnotationView _setCalloutStyle:](v4, "_setCalloutStyle:", 1);
    objc_msgSend(MEMORY[0x1E0CEAB40], "systemTraitsAffectingColorAppearance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)-[_MKBalloonLabelMarkerView registerForTraitChanges:withAction:](v5, "registerForTraitChanges:withAction:", v6, sel_traitEnvironment_didChangeTraitCollection_);

  }
  return v5;
}

- (void)prepareForReuse
{
  UIColor *balloonFillColor;
  UIColor *balloonStrokeColor;
  UIImage *balloonImage;
  UIView *balloonContentView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MKBalloonLabelMarkerView;
  -[MKAnnotationView prepareForReuse](&v7, sel_prepareForReuse);
  self->_balloonCalloutStyle = 0;
  self->_balloonCalloutShouldOriginateFromSmallSize = 0;
  balloonFillColor = self->_balloonFillColor;
  self->_balloonFillColor = 0;

  balloonStrokeColor = self->_balloonStrokeColor;
  self->_balloonStrokeColor = 0;

  balloonImage = self->_balloonImage;
  self->_balloonImage = 0;

  balloonContentView = self->_balloonContentView;
  self->_balloonContentView = 0;

  self->_needsToResolveBalloonAttributes = 1;
  self->_smallBalloonScaleFactor = 1.0;
}

- (void)_resolveBalloonAttributesIfNecessary
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  UIColor *v21;
  UIColor *balloonFillColor;
  UIColor *v23;
  UIColor *balloonStrokeColor;
  id v25;
  void *v26;
  UIView *v27;
  _MKUILabel *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  UIImage *v33;
  UIImage *balloonImage;
  UIImage *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  UIView *balloonContentView;
  UIImage *v52;
  id v53;
  uint64_t v54;
  float v55;
  UIImage *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  float v63;
  void *v64;
  id v65;

  if (self->_needsToResolveBalloonAttributes
    && -[MKAnnotationView _shouldShowCalloutIfSelected](self, "_shouldShowCalloutIfSelected"))
  {
    self->_needsToResolveBalloonAttributes = 0;
    -[MKAnnotationView annotation](self, "annotation");
    v65 = (id)objc_claimAutoreleasedReturnValue();
    -[_MKBalloonLabelMarkerView _currentScreenScale](self, "_currentScreenScale");
    v4 = v3;
    objc_msgSend(v65, "styleAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
LABEL_10:
      objc_msgSend(MEMORY[0x1E0D270A8], "styleAttributesForUnpickedFeatureWithAttributes:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[_MKLabelMarkerView mapView](self, "mapView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_mapLayer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "iconForStyleAttributes:contentScale:size:transparent:", v9, 8, 1, v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v12 = 0;
      }
      v13 = 0;
LABEL_14:
      self->_balloonCalloutShouldOriginateFromSmallSize = objc_msgSend(v12, "isBalloonShape");
      if ((v13 & 1) != 0)
      {
        v14 = 0;
        v15 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D270A8], "styleAttributesForCalloutWithAttributes:", v5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          v14 = 0;
          v13 = 1;
LABEL_19:
          self->_balloonCalloutStyle = objc_msgSend(v14, "calloutShape", v12) == 1;
          objc_msgSend(v65, "dataIconImageKeys");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "count");

          v19 = objc_msgSend(v14, "calloutFillColor");
          v20 = objc_msgSend(v14, "calloutHaloColor");
          if (v19)
            objc_msgSend(MEMORY[0x1E0CEA478], "colorWithCGColor:", v19);
          else
            objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
          v21 = (UIColor *)objc_claimAutoreleasedReturnValue();
          balloonFillColor = self->_balloonFillColor;
          self->_balloonFillColor = v21;

          if (v20)
          {
            objc_msgSend(MEMORY[0x1E0CEA478], "colorWithCGColor:", v20);
            v23 = (UIColor *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v23 = self->_balloonFillColor;
          }
          balloonStrokeColor = self->_balloonStrokeColor;
          self->_balloonStrokeColor = v23;

          self->_smallBalloonScaleFactor = 26.0 / *(double *)&_MKBalloonCalloutInnerDiameter;
          if (!objc_msgSend(v65, "isCluster"))
          {
            if (objc_msgSend(v65, "isTrafficIncident"))
            {
              objc_msgSend(v65, "incident");
              v25 = (id)objc_claimAutoreleasedReturnValue();
              +[MKIconManager imageForTrafficIncidentType:size:forScale:](MKIconManager, "imageForTrafficIncidentType:size:forScale:", objc_msgSend(v25, "type"), 4, v4);
              v33 = (UIImage *)objc_claimAutoreleasedReturnValue();
              balloonImage = self->_balloonImage;
              self->_balloonImage = v33;

            }
            else if (objc_msgSend(v65, "isRouteAnnotation"))
            {
              +[MKIconManager imageForRouteAnnotationStyle:size:forScale:](MKIconManager, "imageForRouteAnnotationStyle:size:forScale:", v15, 4, v4);
              v35 = (UIImage *)objc_claimAutoreleasedReturnValue();
              v25 = self->_balloonImage;
              self->_balloonImage = v35;
            }
            else if (v18)
            {
              objc_msgSend(v65, "dataIconImageKeys");
              v25 = (id)objc_claimAutoreleasedReturnValue();
              -[_MKBalloonLabelMarkerView _configureBalloonForDataIconImageKeys:scale:](self, "_configureBalloonForDataIconImageKeys:scale:", v25, v4);
            }
            else
            {
              v52 = v14;
              v25 = v52;
              if (v52)
              {
                v52 = (UIImage *)-[UIImage image](v52, "image");
                if (v52)
                {
                  v53 = objc_alloc(MEMORY[0x1E0CEA638]);
                  v54 = objc_msgSend(v25, "image");
                  objc_msgSend(v25, "contentScale");
                  v52 = (UIImage *)objc_msgSend(v53, "initWithCGImage:scale:orientation:", v54, 0, v55);
                }
              }
              v56 = self->_balloonImage;
              self->_balloonImage = v52;

              if (self->_balloonCalloutShouldOriginateFromSmallSize)
              {
                if ((v13 & 1) != 0)
                {
                  v57 = 0;
                }
                else
                {
                  -[_MKLabelMarkerView mapView](self, "mapView");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v58, "_mapLayer");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v59, "iconForStyleAttributes:contentScale:size:transparent:", v15, 6, 1, v4);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();

                }
                objc_msgSend(v57, "imageSize");
                v62 = v61;
                if (v61 != *MEMORY[0x1E0C9D820] || v60 != *(double *)(MEMORY[0x1E0C9D820] + 8))
                {
                  objc_msgSend(v57, "contentScale");
                  self->_smallBalloonScaleFactor = v62 / v63 / *(double *)&_MKBalloonCalloutInnerDiameter;
                }

              }
            }
            goto LABEL_36;
          }
          v25 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
          objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setLocale:", v26);

          objc_msgSend(v25, "setNumberStyle:", 1);
          objc_msgSend(v25, "setRoundingMode:", 6);
          v27 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", 0.0, 0.0, *(double *)&_MKBalloonCalloutInnerDiameter, *(double *)&_MKBalloonCalloutInnerDiameter);
          v28 = objc_alloc_init(_MKUILabel);
          v29 = objc_msgSend(v14, "calloutTextColor");
          v30 = objc_msgSend(v14, "glyphColor");
          if (v29)
          {
            v31 = (void *)MEMORY[0x1E0CEA478];
            v32 = v29;
          }
          else
          {
            v32 = v30;
            v31 = (void *)MEMORY[0x1E0CEA478];
            if (!v32)
            {
              objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
              v36 = objc_claimAutoreleasedReturnValue();
              goto LABEL_35;
            }
          }
          objc_msgSend(v31, "colorWithCGColor:", v32);
          v36 = objc_claimAutoreleasedReturnValue();
LABEL_35:
          v37 = (void *)v36;
          -[_MKUILabel setTextColor:](v28, "setTextColor:", v36);

          -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v65, "clusterFeatureCount"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "stringFromNumber:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MKUILabel setText:](v28, "setText:", v39);

          objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 36.0);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MKUILabel setFont:](v28, "setFont:", v40);

          -[UIView addSubview:](v27, "addSubview:", v28);
          -[_MKUILabel centerXAnchor](v28, "centerXAnchor");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView centerXAnchor](v27, "centerXAnchor");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "constraintEqualToAnchor:", v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setActive:", 1);

          -[_MKUILabel centerYAnchor](v28, "centerYAnchor");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView centerYAnchor](v27, "centerYAnchor");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "constraintEqualToAnchor:", v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "setActive:", 1);

          -[UIView widthAnchor](v27, "widthAnchor");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "constraintEqualToConstant:", *(double *)&_MKBalloonCalloutInnerDiameter);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setActive:", 1);

          -[UIView heightAnchor](v27, "heightAnchor");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "constraintEqualToConstant:", *(double *)&_MKBalloonCalloutInnerDiameter);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "setActive:", 1);

          balloonContentView = self->_balloonContentView;
          self->_balloonContentView = v27;

LABEL_36:
          return;
        }
        -[_MKLabelMarkerView mapView](self, "mapView");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_mapLayer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "iconForStyleAttributes:contentScale:size:transparent:", v15, 8, 1, v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_19;
    }
    if (objc_msgSend(v65, "isTrafficIncident"))
    {
      objc_msgSend(v65, "incident");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D270A8], "styleAttributesForTrafficIncidentType:", objc_msgSend(v6, "type"));
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v65, "isRouteAnnotation"))
      {
        v12 = 0;
        v9 = 0;
        v5 = 0;
        goto LABEL_41;
      }
      objc_msgSend(v65, "routeAnnotations");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "styleAttributes");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v7;

    if (v5)
      goto LABEL_10;
    v12 = 0;
    v9 = 0;
LABEL_41:
    v13 = 1;
    goto LABEL_14;
  }
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v5;
  void *v6;
  int v7;
  CGColor *v8;
  id v9;

  v5 = a4;
  -[_MKBalloonLabelMarkerView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasDifferentColorAppearanceComparedToTraitCollection:", v5);

  if (v7)
  {
    self->_needsToResolveBalloonAttributes = 1;
    if (self->_anchorDotView)
    {
      -[_MKBalloonLabelMarkerView _resolveBalloonAttributesIfNecessary](self, "_resolveBalloonAttributesIfNecessary");
      v8 = -[UIColor CGColor](self->_balloonStrokeColor, "CGColor");
      -[UIView layer](self->_anchorDotView, "layer");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBackgroundColor:", v8);

    }
  }
}

- (int64_t)_balloonCalloutStyle
{
  -[_MKBalloonLabelMarkerView _resolveBalloonAttributesIfNecessary](self, "_resolveBalloonAttributesIfNecessary");
  return self->_balloonCalloutStyle;
}

- (BOOL)_balloonCalloutShouldOriginateFromSmallSize:(double *)a3
{
  _BOOL4 balloonCalloutShouldOriginateFromSmallSize;

  -[_MKBalloonLabelMarkerView _resolveBalloonAttributesIfNecessary](self, "_resolveBalloonAttributesIfNecessary");
  balloonCalloutShouldOriginateFromSmallSize = self->_balloonCalloutShouldOriginateFromSmallSize;
  if (a3 && self->_balloonCalloutShouldOriginateFromSmallSize)
    *a3 = self->_smallBalloonScaleFactor;
  return balloonCalloutShouldOriginateFromSmallSize;
}

- (UIColor)_balloonTintColor
{
  -[_MKBalloonLabelMarkerView _resolveBalloonAttributesIfNecessary](self, "_resolveBalloonAttributesIfNecessary");
  return self->_balloonFillColor;
}

- (UIColor)_balloonStrokeColor
{
  -[_MKBalloonLabelMarkerView _resolveBalloonAttributesIfNecessary](self, "_resolveBalloonAttributesIfNecessary");
  return self->_balloonStrokeColor;
}

- (UIColor)_balloonInnerStrokeColor
{
  return 0;
}

- (UIImage)_balloonImage
{
  -[_MKBalloonLabelMarkerView _resolveBalloonAttributesIfNecessary](self, "_resolveBalloonAttributesIfNecessary");
  return self->_balloonImage;
}

- (UIView)_balloonContentView
{
  -[_MKBalloonLabelMarkerView _resolveBalloonAttributesIfNecessary](self, "_resolveBalloonAttributesIfNecessary");
  return self->_balloonContentView;
}

- (BOOL)shouldShowCallout
{
  void *v2;
  unsigned int v3;
  void *v4;
  int v5;
  int v6;
  unsigned int v7;

  -[MKAnnotationView annotation](self, "annotation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "suppressCallout") & 1) == 0 && (objc_msgSend(v2, "isRouteEta") & 1) == 0)
  {
    objc_msgSend(v2, "featureAnnotation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE003938)
      && !objc_msgSend(v4, "showsBalloonCallout")
      || objc_msgSend(v2, "isTransit")
      && (objc_msgSend(v2, "isTransitLine") & 1) == 0
      && (objc_msgSend(v2, "isOnRoute") & 1) != 0)
    {
      goto LABEL_15;
    }
    v5 = objc_msgSend(v2, "featureType");
    LOBYTE(v3) = 0;
    if (v5 == 7 || v5 == 9)
      goto LABEL_16;
    v6 = objc_msgSend(v2, "pickedLabelBalloonBehavior");
    if (v6 == 2)
    {
      LOBYTE(v3) = 1;
      goto LABEL_16;
    }
    if (v6 || (v7 = objc_msgSend(v2, "featureType"), v7 >= 0x13))
LABEL_15:
      LOBYTE(v3) = 0;
    else
      v3 = (0x50668u >> v7) & 1;
LABEL_16:

    goto LABEL_17;
  }
  LOBYTE(v3) = 0;
LABEL_17:

  return v3;
}

- (void)_addAnchorDotViewIfNeeded
{
  UIView *anchorDotView;
  id v4;
  double v5;
  double v6;
  double v7;
  UIView *v8;
  UIView *v9;
  unint64_t balloonCalloutStyle;
  void *v11;
  void *v12;
  double v13;
  CGColor *v14;
  void *v15;
  void *v16;

  anchorDotView = self->_anchorDotView;
  if (!anchorDotView)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[_MKBalloonLabelMarkerView frame](self, "frame");
    v6 = v5 * 0.5 + -3.0;
    -[_MKBalloonLabelMarkerView frame](self, "frame");
    v8 = (UIView *)objc_msgSend(v4, "initWithFrame:", v6, v7 + -6.0, 6.0, 6.0);
    v9 = self->_anchorDotView;
    self->_anchorDotView = v8;

    balloonCalloutStyle = self->_balloonCalloutStyle;
    if (balloonCalloutStyle <= 4)
    {
      if (((1 << balloonCalloutStyle) & 0xD) != 0)
      {
        -[UIView layer](self->_anchorDotView, "layer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v13 = 3.0;
      }
      else
      {
        -[UIView layer](self->_anchorDotView, "layer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v13 = 1.80000007;
      }
      objc_msgSend(v11, "setCornerRadius:", v13);

    }
    v14 = -[UIColor CGColor](self->_balloonStrokeColor, "CGColor");
    -[UIView layer](self->_anchorDotView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v14);

    anchorDotView = self->_anchorDotView;
  }
  -[UIView superview](anchorDotView, "superview");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
    -[_MKBalloonLabelMarkerView addSubview:](self, "addSubview:", self->_anchorDotView);
}

- (BOOL)updateCalloutViewIfNeededAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  UIView *v11;
  __int128 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  __int128 v23;
  UIView *anchorDotView;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  objc_super v32;
  _QWORD v33[5];
  _OWORD v34[3];
  CATransform3D v35;
  CATransform3D v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CATransform3D v39;
  _QWORD v40[2];
  _QWORD v41[3];

  v3 = a3;
  v41[2] = *MEMORY[0x1E0C80C00];
  -[_MKBalloonLabelMarkerView _resolveBalloonAttributesIfNecessary](self, "_resolveBalloonAttributesIfNecessary");
  -[_MKLabelMarkerView _updateAnchorOffset](self, "_updateAnchorOffset");
  -[_MKBalloonLabelMarkerView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  memset(&v39, 0, sizeof(v39));
  if (v6 == 3)
  {
    CATransform3DMakeScale(&v39, 0.666666687, 0.666666687, 1.0);
  }
  else
  {
    v7 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    *(_OWORD *)&v39.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    *(_OWORD *)&v39.m33 = v7;
    v8 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    *(_OWORD *)&v39.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    *(_OWORD *)&v39.m43 = v8;
    v9 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    *(_OWORD *)&v39.m11 = *MEMORY[0x1E0CD2610];
    *(_OWORD *)&v39.m13 = v9;
    v10 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    *(_OWORD *)&v39.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    *(_OWORD *)&v39.m23 = v10;
  }
  if (-[MKAnnotationView isSelected](self, "isSelected")
    && -[MKAnnotationView _shouldShowCalloutIfSelected](self, "_shouldShowCalloutIfSelected"))
  {
    -[_MKBalloonLabelMarkerView _addAnchorDotViewIfNeeded](self, "_addAnchorDotViewIfNeeded");
    if (v6 == 3)
    {
      CGAffineTransformMakeScale(&v38, 0.666666687, 0.666666687);
    }
    else
    {
      v23 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v38.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v38.c = v23;
      *(_OWORD *)&v38.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    }
    anchorDotView = self->_anchorDotView;
    v37 = v38;
    -[UIView setTransform:](anchorDotView, "setTransform:", &v37);
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setMass:", 3.0);
      objc_msgSend(v13, "setStiffness:", 1940.0);
      objc_msgSend(v13, "setDamping:", 91.4000015);
      objc_msgSend(v13, "setInitialVelocity:", 0.0);
      memset(&v36, 0, sizeof(v36));
      CATransform3DMakeScale(&v36, 0.100000001, 0.100000001, 1.0);
      v35 = v36;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v35);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setFromValue:", v25);

      v35 = v39;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v35);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setToValue:", v26);

      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFromValue:", &unk_1E2158E18);
      objc_msgSend(v16, "setToValue:", &unk_1E2158E30);
      objc_msgSend(v16, "setDuration:", 0.239999995);
      objc_msgSend(MEMORY[0x1E0CD2700], "animation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setRemovedOnCompletion:", 1);
      objc_msgSend(v13, "settlingDuration");
      objc_msgSend(v17, "setDuration:");
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTimingFunction:", v27);

      v41[0] = v13;
      v41[1] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAnimations:", v28);

      -[UIView layer](self->_anchorDotView, "layer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v30) = 1.0;
      objc_msgSend(v29, "setOpacity:", v30);

      -[UIView layer](self->_anchorDotView, "layer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addAnimation:forKey:", v17, CFSTR("show"));
      goto LABEL_15;
    }
  }
  else
  {
    v11 = self->_anchorDotView;
    if (v11)
    {
      v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v34[0] = *MEMORY[0x1E0C9BAA8];
      v34[1] = v12;
      v34[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      -[UIView setTransform:](v11, "setTransform:", v34);
      if (v3)
      {
        objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        memset(&v36, 0, sizeof(v36));
        CATransform3DMakeScale(&v36, 0.100000001, 0.100000001, 1.0);
        v35 = v39;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v35);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setFromValue:", v14);

        v35 = v36;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v35);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setToValue:", v15);

        objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setFromValue:", &unk_1E2158E30);
        objc_msgSend(v16, "setToValue:", &unk_1E2158E18);
        objc_msgSend(MEMORY[0x1E0CD2700], "animation");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setTimingFunction:", v18);

        objc_msgSend(v17, "setDuration:", 0.133330002);
        v40[0] = v13;
        v40[1] = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setAnimations:", v19);

        objc_msgSend(v17, "setRemovedOnCompletion:", 1);
        -[UIView layer](self->_anchorDotView, "layer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v21) = 0;
        objc_msgSend(v20, "setOpacity:", v21);

        -[UIView layer](self->_anchorDotView, "layer");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __63___MKBalloonLabelMarkerView_updateCalloutViewIfNeededAnimated___block_invoke;
        v33[3] = &unk_1E20D82F8;
        v33[4] = self;
        objc_msgSend(v22, "_mapkit_addAnimation:forKey:completion:", v17, CFSTR("hide"), v33);
LABEL_15:

        goto LABEL_16;
      }
      -[UIView removeFromSuperview](self->_anchorDotView, "removeFromSuperview");
    }
  }
LABEL_16:
  v32.receiver = self;
  v32.super_class = (Class)_MKBalloonLabelMarkerView;
  return -[_MKLabelMarkerView updateCalloutViewIfNeededAnimated:](&v32, sel_updateCalloutViewIfNeededAnimated_, v3);
}

- (void)_configureBalloonForDataIconImageKeys:(id)a3 scale:(double)a4
{
  id v6;
  MKVKImageSourceCalculationParameters *v7;
  void *v8;
  void *v9;
  UIColor *v10;
  UIColor *balloonStrokeColor;
  UIColor *v12;
  UIColor *balloonFillColor;
  UIColor *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  UIImage *v23;
  UIImage *balloonImage;
  double v25;
  size_t v26;
  double v27;
  size_t v28;
  CGColorSpace *DeviceRGB;
  size_t AlignedBytesPerRow;
  CGContext *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  CGImage *v41;
  CGFloat Width;
  CGFloat Height;
  CGFloat v44;
  id v45;
  CGImage *Image;
  void *v47;
  uint64_t v48;
  UIView *balloonContentView;
  CGColorSpace *space;
  void *v51;
  void *v52;
  void *v53;
  _MKBalloonLabelMarkerView *v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[MKVKImageSourceCalculationParameters initWithImageSourceKeys:scale:]([MKVKImageSourceCalculationParameters alloc], "initWithImageSourceKeys:scale:", v6, a4);
  +[MKVKImageSourceKeyImageBuilder calculateImagesForParameters:](MKVKImageSourceKeyImageBuilder, "calculateImagesForParameters:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "fullBleedColors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "hasSameFullBleedColors"))
  {
    objc_msgSend(v9, "firstObject");
    v10 = (UIColor *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_balloonFillColor, v10);
    balloonStrokeColor = self->_balloonStrokeColor;
    self->_balloonStrokeColor = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.305999994, 0.361000001, 0.455000013, 1.0);
    v12 = (UIColor *)objc_claimAutoreleasedReturnValue();
    balloonFillColor = self->_balloonFillColor;
    self->_balloonFillColor = v12;

    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.305999994, 0.361000001, 0.455000013, 1.0);
    v14 = (UIColor *)objc_claimAutoreleasedReturnValue();
    balloonStrokeColor = self->_balloonStrokeColor;
    self->_balloonStrokeColor = v14;
  }

  objc_msgSend(v8, "images");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count") == 1 || self->_balloonCalloutStyle != 1)
  {
    objc_msgSend(v15, "firstObject");
    v23 = (UIImage *)objc_claimAutoreleasedReturnValue();
    balloonImage = self->_balloonImage;
    self->_balloonImage = v23;

  }
  else if ((unint64_t)objc_msgSend(v15, "count") >= 2)
  {
    v54 = self;
    v51 = v15;
    v16 = v15;
    v52 = v9;
    v17 = v9;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
    v55 = v6;
    v53 = v8;
    if (v18)
    {
      v19 = v18;
      v20 = 0;
      v21 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v61 != v21)
            objc_enumerationMutation(v16);
          v20 += CGImageGetWidth((CGImageRef)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v60 + 1) + 8 * i)), "CGImage"));
        }
        v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
      }
      while (v19);
    }
    else
    {
      v20 = 0;
    }
    v25 = a4 + a4;
    v26 = v20 - (unint64_t)(v25 + v25);
    v27 = ceil(*(double *)&_MKBalloonCalloutInnerDiameter * a4);
    v28 = vcvtpd_u64_f64(*(double *)&_MKBalloonCalloutInnerDiameter * a4);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
    space = DeviceRGB;
    v31 = CGBitmapContextCreate(0, v26, v28, 8uLL, AlignedBytesPerRow, DeviceRGB, 0x2002u);
    v67.size.width = (double)v26;
    v67.size.height = (double)(unint64_t)v27;
    v67.origin.x = 0.0;
    v67.origin.y = 0.0;
    CGContextClearRect(v31, v67);
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v32 = v16;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    if (v33)
    {
      v34 = v33;
      v35 = 0;
      v36 = -v25;
      v37 = *(_QWORD *)v57;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v57 != v37)
            objc_enumerationMutation(v32);
          v39 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
          if (v35 + j >= (unint64_t)objc_msgSend(v17, "count", space))
            objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
          else
            objc_msgSend(v17, "objectAtIndexedSubscript:", v35 + j);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (CGImage *)objc_msgSend(objc_retainAutorelease(v39), "CGImage");
          Width = (double)CGImageGetWidth(v41);
          Height = (double)CGImageGetHeight(v41);
          v44 = -(Height - *(double *)&_MKBalloonCalloutInnerDiameter * a4) * 0.5;
          CGContextSaveGState(v31);
          v45 = objc_retainAutorelease(v40);
          CGContextSetFillColorWithColor(v31, (CGColorRef)objc_msgSend(v45, "CGColor"));
          v68.origin.x = v36;
          v68.origin.y = v44;
          v68.size.width = Width;
          v68.size.height = Height;
          CGContextFillRect(v31, v68);
          v69.origin.x = v36;
          v69.origin.y = v44;
          v69.size.width = Width;
          v69.size.height = Height;
          CGContextDrawImage(v31, v69, v41);
          CGContextRestoreGState(v31);
          v36 = v36 + Width;

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
        v35 += j;
      }
      while (v34);
    }

    Image = CGBitmapContextCreateImage(v31);
    v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:scale:orientation:", Image, 0, a4);
    CGContextRelease(v31);
    CGColorSpaceRelease(space);
    CGImageRelease(Image);

    v48 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v47);
    balloonContentView = v54->_balloonContentView;
    v54->_balloonContentView = (UIView *)v48;

    v6 = v55;
    v9 = v52;
    v8 = v53;
    v15 = v51;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_balloonContentView, 0);
  objc_storeStrong((id *)&self->_balloonImage, 0);
  objc_storeStrong((id *)&self->_balloonStrokeColor, 0);
  objc_storeStrong((id *)&self->_balloonFillColor, 0);
  objc_storeStrong((id *)&self->_anchorDotView, 0);
}

@end
