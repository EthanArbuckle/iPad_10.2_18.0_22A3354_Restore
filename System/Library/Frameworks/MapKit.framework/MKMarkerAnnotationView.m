@implementation MKMarkerAnnotationView

+ (Class)_mapkitLeafClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_hasDataRequiringCallout
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[MKAnnotationView rightCalloutAccessoryView](self, "rightCalloutAccessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[MKAnnotationView leftCalloutAccessoryView](self, "leftCalloutAccessoryView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 1;
    }
    else
    {
      -[MKAnnotationView detailCalloutAccessoryView](self, "detailCalloutAccessoryView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6 != 0;

    }
  }

  return v4;
}

- (BOOL)canShowCallout
{
  unsigned __int8 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKMarkerAnnotationView;
  v3 = -[MKAnnotationView canShowCallout](&v5, sel_canShowCallout);
  return v3 & -[MKMarkerAnnotationView _hasDataRequiringCallout](self, "_hasDataRequiringCallout");
}

- (void)setMarkerTintColor:(UIColor *)markerTintColor
{
  objc_storeStrong((id *)&self->_markerTintColor, markerTintColor);
  -[MKMarkerAnnotationView _updateContentForState:](self, "_updateContentForState:", -[MKMarkerAnnotationView _currentMarkerState](self, "_currentMarkerState"));
}

- (void)_setStyleAttributes:(id)a3
{
  GEOFeatureStyleAttributes *v5;
  GEOFeatureStyleAttributes *v6;

  v5 = (GEOFeatureStyleAttributes *)a3;
  if (self->_customStyleAttributes != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_customStyleAttributes, a3);
    -[MKMarkerAnnotationView _updateContentForState:](self, "_updateContentForState:", -[MKMarkerAnnotationView _currentMarkerState](self, "_currentMarkerState"));
    v5 = v6;
  }

}

- (id)_effectiveMarkerTintColorForState:(int64_t)a3
{
  UIColor *markerTintColor;
  UIColor *v4;
  void *v7;
  GEOFeatureStyleAttributes *customStyleAttributes;
  void *v9;

  markerTintColor = self->_markerTintColor;
  if (markerTintColor)
  {
    v4 = markerTintColor;
  }
  else
  {
    -[MKMarkerAnnotationView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    customStyleAttributes = self->_customStyleAttributes;
    -[MKAnnotationView coordinate](self, "coordinate");
    +[_MKMarkerStyle markerStyleForTraitCollection:state:styleAttributes:coordinate:](_MKMarkerStyle, "markerStyleForTraitCollection:state:styleAttributes:coordinate:", v7, a3, customStyleAttributes);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "markerColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (double)_effectiveShadowAlphaForState:(int64_t)a3
{
  id v3;
  double Alpha;

  -[MKMarkerAnnotationView _effectiveMarkerTintColorForState:](self, "_effectiveMarkerTintColorForState:", a3);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  Alpha = CGColorGetAlpha((CGColorRef)objc_msgSend(v3, "CGColor"));

  return Alpha;
}

- (void)setMarkerStrokeTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_markerStrokeTintColor, a3);
  -[MKMarkerAnnotationView _updateContentForState:](self, "_updateContentForState:", -[MKMarkerAnnotationView _currentMarkerState](self, "_currentMarkerState"));
}

- (void)setMarkerStrokeWidth:(double)a3
{
  self->_markerStrokeWidth = a3;
  -[MKMarkerAnnotationView _updateContentForState:](self, "_updateContentForState:", -[MKMarkerAnnotationView _currentMarkerState](self, "_currentMarkerState"));
}

- (void)setSelectedContentView:(id)a3
{
  id v4;
  id v5;
  UIView *contentMaskView;
  void *v7;
  void *v8;
  UIView *v9;
  UIView *v10;
  UIView *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  UIView *v16;
  CGAffineTransform v17;
  CGAffineTransform v18;

  v4 = a3;
  -[MKMarkerAnnotationView selectedContentView](self, "selectedContentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    contentMaskView = self->_contentMaskView;
    if (v4)
    {
      if (contentMaskView)
      {
        -[UIView subviews](contentMaskView, "subviews");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "firstObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeFromSuperview");

      }
      else
      {
        v10 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", 0.0, 0.0, 56.0, 56.0);
        v11 = self->_contentMaskView;
        self->_contentMaskView = v10;

        -[UIView _setHostsLayoutEngine:](self->_contentMaskView, "_setHostsLayoutEngine:", 1);
        -[UIView layer](self->_contentMaskView, "layer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setAnchorPoint:", 0.5, 1.0);

        -[UIView layer](self->_contentMaskView, "layer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setMasksToBounds:", 1);

        -[UIView layer](self->_contentMaskView, "layer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setCornerRadius:", 28.0);

        if (-[MKAnnotationView isSelected](self, "isSelected"))
          v15 = 1.0;
        else
          v15 = 0.5;
        CGAffineTransformMakeScale(&v18, v15, v15);
        v16 = self->_contentMaskView;
        v17 = v18;
        -[UIView setTransform:](v16, "setTransform:", &v17);
        -[MKMarkerAnnotationView addSubview:](self, "addSubview:", self->_contentMaskView);
        -[UIView _mapkit_setNeedsLayout](self, "_mapkit_setNeedsLayout");
      }
      -[UIView bounds](self->_contentMaskView, "bounds");
      objc_msgSend(v4, "setFrame:");
      -[UIView addSubview:](self->_contentMaskView, "addSubview:", v4);
    }
    else
    {
      -[UIView removeFromSuperview](contentMaskView, "removeFromSuperview");
      v9 = self->_contentMaskView;
      self->_contentMaskView = 0;

    }
  }

}

- (UIView)selectedContentView
{
  void *v2;
  void *v3;

  -[UIView subviews](self->_contentMaskView, "subviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (double)_effectiveMarkerStrokeWidthForState:(int64_t)a3
{
  double result;
  void *v6;
  GEOFeatureStyleAttributes *customStyleAttributes;
  void *v8;
  double v9;
  double v10;

  result = self->_markerStrokeWidth;
  if (result < 0.0)
  {
    -[MKMarkerAnnotationView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    customStyleAttributes = self->_customStyleAttributes;
    -[MKAnnotationView coordinate](self, "coordinate");
    +[_MKMarkerStyle markerStyleForTraitCollection:state:styleAttributes:coordinate:](_MKMarkerStyle, "markerStyleForTraitCollection:state:styleAttributes:coordinate:", v6, a3, customStyleAttributes);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "strokeWidth");
    v10 = v9;

    return v10;
  }
  return result;
}

- (id)_effectiveMarkerStrokeTintColorForState:(int64_t)a3
{
  UIColor *markerStrokeTintColor;
  UIColor *v5;
  void *v8;
  GEOFeatureStyleAttributes *customStyleAttributes;
  void *v10;

  markerStrokeTintColor = self->_markerStrokeTintColor;
  if (markerStrokeTintColor || self->_markerTintColor)
  {
    v5 = markerStrokeTintColor;
  }
  else
  {
    -[MKMarkerAnnotationView traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    customStyleAttributes = self->_customStyleAttributes;
    -[MKAnnotationView coordinate](self, "coordinate");
    +[_MKMarkerStyle markerStyleForTraitCollection:state:styleAttributes:coordinate:](_MKMarkerStyle, "markerStyleForTraitCollection:state:styleAttributes:coordinate:", v8, a3, customStyleAttributes);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "strokeColor");
    v5 = (UIColor *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)setGlyphTintColor:(UIColor *)glyphTintColor
{
  objc_storeStrong((id *)&self->_glyphTintColor, glyphTintColor);
  -[MKMarkerAnnotationView _updateContentForState:](self, "_updateContentForState:", -[MKMarkerAnnotationView _currentMarkerState](self, "_currentMarkerState"));
}

- (id)_effectiveGlyphTintColorForState:(int64_t)a3
{
  UIColor *glyphTintColor;
  UIColor *v4;
  UIColor *markerTintColor;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  GEOFeatureStyleAttributes *customStyleAttributes;
  void *v13;

  glyphTintColor = self->_glyphTintColor;
  if (glyphTintColor)
  {
    v4 = glyphTintColor;
  }
  else if (self->_markerTintColor && _MKLinkedOnOrAfterReleaseSet(2310))
  {
    markerTintColor = self->_markerTintColor;
    -[MKMarkerAnnotationView traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIColor resolvedColorWithTraitCollection:](markerTintColor, "resolvedColorWithTraitCollection:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEADE8]), "initWithContentColor:", v9);
    objc_msgSend(v10, "primaryColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MKMarkerAnnotationView traitCollection](self, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    customStyleAttributes = self->_customStyleAttributes;
    -[MKAnnotationView coordinate](self, "coordinate");
    +[_MKMarkerStyle markerStyleForTraitCollection:state:styleAttributes:coordinate:](_MKMarkerStyle, "markerStyleForTraitCollection:state:styleAttributes:coordinate:", v11, a3, customStyleAttributes);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "glyphColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)setGlyphImage:(UIImage *)glyphImage
{
  UIImage *v4;
  void *v5;
  char isKindOfClass;
  uint64_t v7;
  UIImage *v8;
  UIImage *v9;

  v4 = glyphImage;
  -[MKAnnotationView annotation](self, "annotation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    v7 = 0;
  else
    v7 = 2;
  -[UIImage imageWithRenderingMode:](v4, "imageWithRenderingMode:", v7);
  v8 = (UIImage *)objc_claimAutoreleasedReturnValue();

  v9 = self->_glyphImage;
  self->_glyphImage = v8;

  -[MKMarkerAnnotationView _updateContentForState:](self, "_updateContentForState:", -[MKMarkerAnnotationView _currentMarkerState](self, "_currentMarkerState"));
}

- (void)setSelectedGlyphImage:(UIImage *)selectedGlyphImage
{
  UIImage *v4;
  void *v5;
  char isKindOfClass;
  uint64_t v7;
  UIImage *v8;
  UIImage *v9;

  v4 = selectedGlyphImage;
  -[MKAnnotationView annotation](self, "annotation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    v7 = 0;
  else
    v7 = 2;
  -[UIImage imageWithRenderingMode:](v4, "imageWithRenderingMode:", v7);
  v8 = (UIImage *)objc_claimAutoreleasedReturnValue();

  v9 = self->_selectedGlyphImage;
  self->_selectedGlyphImage = v8;

  -[MKMarkerAnnotationView _updateContentForState:](self, "_updateContentForState:", -[MKMarkerAnnotationView _currentMarkerState](self, "_currentMarkerState"));
}

- (id)_effectiveGlyphImageForState:(int64_t)a3 isSystemProvided:(BOOL *)a4
{
  UIImage *selectedGlyphImage;
  UIImage *v7;
  void *v8;
  GEOFeatureStyleAttributes *customStyleAttributes;
  void *v10;

  if (a3 && (selectedGlyphImage = self->_selectedGlyphImage) != 0 || (selectedGlyphImage = self->_glyphImage) != 0)
  {
    v7 = selectedGlyphImage;
  }
  else
  {
    *a4 = 1;
    -[MKMarkerAnnotationView traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    customStyleAttributes = self->_customStyleAttributes;
    -[MKAnnotationView coordinate](self, "coordinate");
    +[_MKMarkerStyle markerStyleForTraitCollection:state:styleAttributes:coordinate:](_MKMarkerStyle, "markerStyleForTraitCollection:state:styleAttributes:coordinate:", v8, a3, customStyleAttributes);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "glyphImage");
    v7 = (UIImage *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)setGlyphText:(NSString *)glyphText
{
  NSString *v4;
  NSString *v5;

  v4 = (NSString *)-[NSString copy](glyphText, "copy");
  v5 = self->_glyphText;
  self->_glyphText = v4;

  -[MKMarkerAnnotationView _updateContentForState:](self, "_updateContentForState:", -[MKMarkerAnnotationView _currentMarkerState](self, "_currentMarkerState"));
}

- (id)_effectiveGlyphText
{
  NSString *glyphText;
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  glyphText = self->_glyphText;
  if (glyphText)
  {
    v3 = glyphText;
  }
  else
  {
    -[MKAnnotationView annotation](self, "annotation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "_isMKClusterAnnotation"))
    {
      if (qword_1ECE2D7D0 != -1)
        dispatch_once(&qword_1ECE2D7D0, &__block_literal_global_46);
      v5 = (void *)qword_1ECE2D7C8;
      v6 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "memberAnnotations");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringFromNumber:", v8);
      v3 = (NSString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

void __45__MKMarkerAnnotationView__effectiveGlyphText__block_invoke()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)qword_1ECE2D7C8;
  qword_1ECE2D7C8 = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECE2D7C8, "setLocale:", v2);

}

+ (float)_defaultDisplayPriority
{
  return 250.0;
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (!_MKLinkedOnOrAfterReleaseSet(1796))
    -[MKMarkerAnnotationView prepareForDisplay](self, "prepareForDisplay");
  v5.receiver = self;
  v5.super_class = (Class)MKMarkerAnnotationView;
  -[MKMarkerAnnotationView layoutSublayersOfLayer:](&v5, sel_layoutSublayersOfLayer_, v4);

}

- (void)_updateFromMap
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)MKMarkerAnnotationView;
    -[MKAnnotationView _updateFromMap](&v5, sel__updateFromMap);
    self->super._titleVisibility = 1;
    self->super._subtitleVisibility = 1;
    -[MKAnnotationView annotation](self, "annotation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "marker");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "calloutAnchorPointWithSnapToPixels:", 1);
    -[MKMarkerAnnotationView setCenter:](self, "setCenter:");

  }
}

- (MKMarkerAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  MKMarkerAnnotationView *v4;
  MKMarkerAnnotationView *v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MKMarkerAnnotationView;
  v4 = -[MKAnnotationView initWithAnnotation:reuseIdentifier:](&v9, sel_initWithAnnotation_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[MKAnnotationView setCollisionMode:](v4, "setCollisionMode:", 1);
    -[MKAnnotationView setBounds:](v5, "setBounds:", 0.0, 0.0, 28.0, 28.0);
    -[MKAnnotationView setCenterOffset:](v5, "setCenterOffset:", 0.0, -14.0);
    -[MKAnnotationView setCalloutOffset:](v5, "setCalloutOffset:", 0.0, 19.5);
    v5->_markerStrokeWidth = -1.0;
    v5->super._titleVisibility = 0;
    v5->super._subtitleVisibility = 0;
    objc_msgSend(MEMORY[0x1E0CEAB40], "systemTraitsAffectingColorAppearance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)-[MKMarkerAnnotationView registerForTraitChanges:withAction:](v5, "registerForTraitChanges:withAction:", v6, sel_traitEnvironment_didChangeTraitCollection_);

  }
  return v5;
}

- (void)setFrame:(CGRect)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKMarkerAnnotationView;
  -[MKMarkerAnnotationView setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, 28.0, 28.0);
}

- (void)setAnnotation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[MKAnnotationView annotation](self, "annotation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 != v4)
  {
    if (v5)
    {
      self->_isObserving = 0;
      objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("title"));
      objc_msgSend(v6, "removeObserver:forKeyPath:", self, CFSTR("subtitle"));
    }
    v7.receiver = self;
    v7.super_class = (Class)MKMarkerAnnotationView;
    -[MKAnnotationView setAnnotation:](&v7, sel_setAnnotation_, v4);
    if (v4)
    {
      self->_isObserving = 1;
      objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("title"), 0, 0);
      objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("subtitle"), 0, 0);
    }
  }

}

- (void)setTitleVisibility:(MKFeatureVisibility)titleVisibility
{
  if (self->super._titleVisibility != titleVisibility)
  {
    self->super._titleVisibility = titleVisibility;
    -[MKAnnotationView invalidateCustomFeatureForced:](self, "invalidateCustomFeatureForced:", 0);
  }
}

- (void)setSubtitleVisibility:(MKFeatureVisibility)subtitleVisibility
{
  if (self->super._subtitleVisibility != subtitleVisibility)
  {
    self->super._subtitleVisibility = subtitleVisibility;
    -[MKAnnotationView invalidateCustomFeatureForced:](self, "invalidateCustomFeatureForced:", 0);
  }
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
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("title")) & 1) != 0
    || objc_msgSend(v10, "isEqualToString:", CFSTR("subtitle")))
  {
    -[MKAnnotationView invalidateCustomFeatureForced:](self, "invalidateCustomFeatureForced:", 0);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)MKMarkerAnnotationView;
    -[MKMarkerAnnotationView observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (CGPoint)_anchorPointForCalloutAnchorPosition:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat MidX;
  double MinY;
  double MinX;
  double v25;
  double v26;
  objc_super v27;
  CGPoint result;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  -[MKMarkerAnnotationView _frameForSelectionAdjustment](self, "_frameForSelectionAdjustment");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[MKMarkerAnnotationView superview](self, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMarkerAnnotationView convertRect:fromView:](self, "convertRect:fromView:", v13, v6, v8, v10, v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  switch(a3)
  {
    case 4:
      v31.origin.x = v15;
      v31.origin.y = v17;
      v31.size.width = v19;
      v31.size.height = v21;
      MinX = CGRectGetMinX(v31);
LABEL_7:
      MidX = MinX;
      v33.origin.x = v15;
      v33.origin.y = v17;
      v33.size.width = v19;
      v33.size.height = v21;
      MinY = CGRectGetMinY(v33) + 28.0;
      break;
    case 3:
      v32.origin.x = v15;
      v32.origin.y = v17;
      v32.size.width = v19;
      v32.size.height = v21;
      MinX = CGRectGetMaxX(v32);
      goto LABEL_7;
    case 2:
      v29.origin.x = v15;
      v29.origin.y = v17;
      v29.size.width = v19;
      v29.size.height = v21;
      MidX = CGRectGetMidX(v29);
      v30.origin.x = v15;
      v30.origin.y = v17;
      v30.size.width = v19;
      v30.size.height = v21;
      MinY = CGRectGetMinY(v30);
      break;
    default:
      v27.receiver = self;
      v27.super_class = (Class)MKMarkerAnnotationView;
      -[MKAnnotationView _anchorPointForCalloutAnchorPosition:](&v27, sel__anchorPointForCalloutAnchorPosition_, a3);
      MidX = v25;
      break;
  }
  v26 = MidX;
  result.y = MinY;
  result.x = v26;
  return result;
}

- (CGRect)_frameForSelectionAdjustment
{
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect v10;
  CGRect v11;
  CGRect result;

  -[MKMarkerAnnotationView frame](self, "frame");
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  v5 = CGRectGetMidX(v10) + -28.0;
  v11.origin.x = v5;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  v6 = CGRectGetMaxY(v11) + -69.0;
  v7 = 56.0;
  v8 = 69.0;
  v9 = v5;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v9;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[MKMarkerAnnotationView bounds](self, "bounds", a3.width, a3.height);
  v4 = v3;
  v6 = v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MaxY;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  CGRect v14;
  CGRect v15;

  v13.receiver = self;
  v13.super_class = (Class)MKMarkerAnnotationView;
  -[MKAnnotationView layoutSubviews](&v13, sel_layoutSubviews);
  -[MKMarkerAnnotationView bounds](self, "bounds");
  x = v14.origin.x;
  y = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;
  MidX = CGRectGetMidX(v14);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  MaxY = CGRectGetMaxY(v15);
  -[UIView layer](self->_contentMaskView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPosition:", MidX, MaxY);

  -[UIImageView setCenter:](self->_shadow, "setCenter:", MidX, MaxY);
  -[_MKMarkerAnnotationBaseImageView layer](self->_markerView, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPosition:", MidX, MaxY);

  -[_MKMarkerAnnotationBaseImageView layer](self->_selectedDotView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPosition:", MidX, MaxY);

  -[_MKMarkerAnnotationBaseImageView layer](self->_selectedMarkerView, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPosition:", MidX, MaxY + -8.5);

}

- (void)_updateContentForState:(int64_t)a3
{
  -[MKMarkerAnnotationView _updateContentForState:forceUpdate:](self, "_updateContentForState:forceUpdate:", a3, 0);
}

- (void)_updateContentForState:(int64_t)a3 forceUpdate:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  _MKMarkerAnnotationBaseImageView *selectedMarkerView;
  _MKMarkerAnnotationBaseImageContent *v14;
  uint64_t v15;
  uint64_t v16;
  _MKMarkerAnnotationBaseImageContent *v17;
  _MKMarkerAnnotationBaseImageView *selectedDotView;
  _MKMarkerAnnotationBaseImageContent *v19;
  _MKMarkerAnnotationBaseImageView *markerView;
  _MKMarkerAnnotationBaseImageContent *v21;
  uint64_t v22;
  uint64_t v23;
  _MKMarkerAnnotationBaseImageContent *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v31;
  char v32;

  if (a4
    || (-[MKMarkerAnnotationView window](self, "window"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    -[MKMarkerAnnotationView _effectiveMarkerTintColorForState:](self, "_effectiveMarkerTintColorForState:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMarkerAnnotationView _effectiveMarkerStrokeTintColorForState:](self, "_effectiveMarkerStrokeTintColorForState:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMarkerAnnotationView _effectiveGlyphTintColorForState:](self, "_effectiveGlyphTintColorForState:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMarkerAnnotationView _effectiveMarkerStrokeWidthForState:](self, "_effectiveMarkerStrokeWidthForState:", a3);
    v11 = v10;
    -[MKMarkerAnnotationView _effectiveGlyphText](self, "_effectiveGlyphText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      v11 = 0.0;
    if (a3)
    {
      v29 = v9;
      selectedMarkerView = self->_selectedMarkerView;
      v14 = [_MKMarkerAnnotationBaseImageContent alloc];
      v15 = -[MKMarkerAnnotationView _blendMode](self, "_blendMode");
      if (-[MKMarkerAnnotationView _shouldRenderGradient](self, "_shouldRenderGradient"))
        v16 = 5;
      else
        v16 = 4;
      v17 = -[_MKMarkerAnnotationBaseImageContent initWithFillColor:strokeColor:strokeWidth:blendMode:baseImageType:](v14, "initWithFillColor:strokeColor:strokeWidth:blendMode:baseImageType:", v7, v8, v15, v16, v11, v29);
      -[_MKMarkerAnnotationBaseImageView _setBaseImageContent:](selectedMarkerView, "_setBaseImageContent:", v17);

      selectedDotView = self->_selectedDotView;
      v19 = -[_MKMarkerAnnotationBaseImageContent initWithFillColor:strokeColor:strokeWidth:blendMode:baseImageType:]([_MKMarkerAnnotationBaseImageContent alloc], "initWithFillColor:strokeColor:strokeWidth:blendMode:baseImageType:", v7, v8, -[MKMarkerAnnotationView _blendMode](self, "_blendMode"), -[MKMarkerAnnotationView _shouldRenderGradient](self, "_shouldRenderGradient"), v11);
      -[_MKMarkerAnnotationBaseImageView _setBaseImageContent:](selectedDotView, "_setBaseImageContent:", v19);

      if (v12)
      {
        -[_MKUILabel setHidden:](self->_selectedGlyphLabel, "setHidden:", 0);
        v9 = v30;
        -[_MKUILabel setTextColor:](self->_selectedGlyphLabel, "setTextColor:", v30);
        -[_MKUILabel setText:](self->_selectedGlyphLabel, "setText:", v12);
        -[UIImageView setHidden:](self->_selectedGlyphImageView, "setHidden:", 1);
        -[UIImageView setImage:](self->_selectedGlyphImageView, "setImage:", 0);
      }
      else
      {
        -[UIImageView setHidden:](self->_selectedGlyphImageView, "setHidden:", 0);
        v9 = v30;
        -[UIImageView setTintColor:](self->_selectedGlyphImageView, "setTintColor:", v30);
        v31 = 0;
        -[MKMarkerAnnotationView _effectiveGlyphImageForState:isSystemProvided:](self, "_effectiveGlyphImageForState:isSystemProvided:", a3, &v31);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setImage:](self->_selectedGlyphImageView, "setImage:", v25);

        if (v31)
          v26 = 4;
        else
          v26 = 1;
        -[UIImageView setContentMode:](self->_selectedGlyphImageView, "setContentMode:", v26);
        -[_MKUILabel setHidden:](self->_selectedGlyphLabel, "setHidden:", 1);
        -[_MKUILabel setText:](self->_selectedGlyphLabel, "setText:", 0);
      }
    }
    else
    {
      markerView = self->_markerView;
      v21 = [_MKMarkerAnnotationBaseImageContent alloc];
      v22 = -[MKMarkerAnnotationView _blendMode](self, "_blendMode");
      if (-[MKMarkerAnnotationView _shouldRenderGradient](self, "_shouldRenderGradient"))
        v23 = 3;
      else
        v23 = 2;
      v24 = -[_MKMarkerAnnotationBaseImageContent initWithFillColor:strokeColor:strokeWidth:blendMode:baseImageType:](v21, "initWithFillColor:strokeColor:strokeWidth:blendMode:baseImageType:", v7, v8, v22, v23, v11);
      -[_MKMarkerAnnotationBaseImageView _setBaseImageContent:](markerView, "_setBaseImageContent:", v24);

      if (v12)
      {
        -[_MKUILabel setHidden:](self->_glyphLabel, "setHidden:", 0);
        -[_MKUILabel setTextColor:](self->_glyphLabel, "setTextColor:", v9);
        -[_MKUILabel setText:](self->_glyphLabel, "setText:", v12);
        -[UIImageView setHidden:](self->_glyphImageView, "setHidden:", 1);
        -[UIImageView setImage:](self->_glyphImageView, "setImage:", 0);
      }
      else
      {
        -[UIImageView setHidden:](self->_glyphImageView, "setHidden:", 0);
        -[UIImageView setTintColor:](self->_glyphImageView, "setTintColor:", v9);
        v32 = 0;
        -[MKMarkerAnnotationView _effectiveGlyphImageForState:isSystemProvided:](self, "_effectiveGlyphImageForState:isSystemProvided:", 0, &v32);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setImage:](self->_glyphImageView, "setImage:", v27);

        if (v32)
          v28 = 4;
        else
          v28 = 1;
        -[UIImageView setContentMode:](self->_glyphImageView, "setContentMode:", v28);
        -[_MKUILabel setHidden:](self->_glyphLabel, "setHidden:", 1);
        -[_MKUILabel setText:](self->_glyphLabel, "setText:", 0);
      }
    }

  }
}

- (int64_t)_currentMarkerState
{
  if (!-[MKAnnotationView isSelected](self, "isSelected"))
    return 0;
  if (-[MKAnnotationView dragState](self, "dragState"))
    return 2;
  return 1;
}

- (void)prepareForReuse
{
  GEOFeatureStyleAttributes *customStyleAttributes;
  UIColor *markerTintColor;
  UIColor *markerStrokeTintColor;
  UIImage *glyphImage;
  UIImage *selectedGlyphImage;
  NSString *glyphText;
  UIColor *glyphTintColor;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MKMarkerAnnotationView;
  -[MKAnnotationView prepareForReuse](&v10, sel_prepareForReuse);
  customStyleAttributes = self->_customStyleAttributes;
  self->_customStyleAttributes = 0;

  markerTintColor = self->_markerTintColor;
  self->_markerTintColor = 0;

  markerStrokeTintColor = self->_markerStrokeTintColor;
  self->_markerStrokeTintColor = 0;

  self->_markerStrokeWidth = 0.0;
  glyphImage = self->_glyphImage;
  self->_glyphImage = 0;

  selectedGlyphImage = self->_selectedGlyphImage;
  self->_selectedGlyphImage = 0;

  glyphText = self->_glyphText;
  self->_glyphText = 0;

  glyphTintColor = self->_glyphTintColor;
  self->_glyphTintColor = 0;

  -[MKMarkerAnnotationView setSelectedContentView:](self, "setSelectedContentView:", 0);
}

- (void)prepareForDisplay
{
  _BOOL8 v3;
  int64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKMarkerAnnotationView;
  -[MKAnnotationView prepareForDisplay](&v5, sel_prepareForDisplay);
  -[MKMarkerAnnotationView _setupNormalViewsIfNeeded](self, "_setupNormalViewsIfNeeded");
  v3 = -[MKAnnotationView _shouldShowCalloutIfSelected](self, "_shouldShowCalloutIfSelected");
  if (-[MKAnnotationView isSelected](self, "isSelected"))
    -[MKMarkerAnnotationView _setupSelectedViewsIfNeededUsesCallout:](self, "_setupSelectedViewsIfNeededUsesCallout:", v3);
  v4 = -[MKMarkerAnnotationView _currentMarkerState](self, "_currentMarkerState");
  -[MKMarkerAnnotationView _configureViewsForState:usesCallout:animated:](self, "_configureViewsForState:usesCallout:animated:", v4, v3, 0);
  -[MKMarkerAnnotationView _updateContentForState:forceUpdate:](self, "_updateContentForState:forceUpdate:", v4, 1);
}

- (void)_unhideForDisplay
{
  __int128 v3;
  objc_super v4;
  _QWORD v5[5];
  CGAffineTransform v6;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGAffineTransform v9;

  if (self->_animatesWhenAdded)
  {
    -[MKAnnotationView _setHidden:forReason:animated:](self, "_setHidden:forReason:animated:", 0, 1, 1);
    v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v7.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v7.c = v3;
    *(_OWORD *)&v7.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    *(_OWORD *)&v9.a = *(_OWORD *)&v7.a;
    *(_OWORD *)&v9.c = v3;
    *(_OWORD *)&v9.tx = *(_OWORD *)&v7.tx;
    CGAffineTransformTranslate(&v7, &v9, 0.0, 56.0);
    v8 = v7;
    CGAffineTransformScale(&v9, &v8, 0.25, 0.25);
    v7 = v9;
    v6 = v9;
    -[MKMarkerAnnotationView setTransform:](self, "setTransform:", &v6);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __43__MKMarkerAnnotationView__unhideForDisplay__block_invoke;
    v5[3] = &unk_1E20D7D98;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v5, 0, 0.4, 0.0, 0.666666687, 0.0);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)MKMarkerAnnotationView;
    -[MKAnnotationView _unhideForDisplay](&v4, sel__unhideForDisplay);
  }
}

uint64_t __43__MKMarkerAnnotationView__unhideForDisplay__block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

- (void)prepareForSnapshotting
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKMarkerAnnotationView;
  -[MKAnnotationView prepareForSnapshotting](&v3, sel_prepareForSnapshotting);
  -[MKAnnotationView _updateAnchorPosition:alignToPixels:](self, "_updateAnchorPosition:alignToPixels:", 1, 0.0, 0.0);
  -[UIView _mapkit_setNeedsLayout](self, "_mapkit_setNeedsLayout");
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v5;
  void *v6;
  int v7;

  v5 = a4;
  -[MKMarkerAnnotationView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasDifferentColorAppearanceComparedToTraitCollection:", v5);

  if (v7)
    -[MKMarkerAnnotationView _updateStyle](self, "_updateStyle");
}

- (void)_updateStyle
{
  -[MKMarkerAnnotationView _updateContentForState:](self, "_updateContentForState:", -[MKMarkerAnnotationView _currentMarkerState](self, "_currentMarkerState"));
}

- ($6B7908791D228771F6825F21952C9673)_metricsForState:(SEL)a3
{
  double v7;
  double v8;
  double v9;
  double v10;
  $6B7908791D228771F6825F21952C9673 *result;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;

  -[_MKMarkerAnnotationBaseImageView bounds](self->_markerView, "bounds");
  v8 = v7;
  v10 = v9;
  result = ($6B7908791D228771F6825F21952C9673 *)-[_MKMarkerAnnotationBaseImageView bounds](self->_selectedMarkerView, "bounds");
  if (a4)
  {
    v14 = v12 / v8;
    v15 = 1.0;
    __asm { FMOV            V1.2D, #1.0 }
    v21 = -8.5;
    v22 = 0.0;
    v23 = 1.0;
    v24 = v13 / v10;
  }
  else
  {
    v15 = v8 / v12;
    _Q1 = xmmword_18B2A94D0;
    v14 = 1.0;
    v21 = 0.0;
    v22 = 7.5;
    v24 = 1.0;
    v23 = v10 / v13;
  }
  retstr->var0.width = v14;
  retstr->var0.height = v24;
  retstr->var1.width = v15;
  retstr->var1.height = v23;
  *(_OWORD *)&retstr->var2 = _Q1;
  retstr->var4.width = 0.0;
  retstr->var4.height = v21;
  retstr->var5.width = 0.0;
  retstr->var5.height = v22;
  v25 = 0.0;
  if (a4 == 2)
    v25 = -20.0;
  retstr->var6.width = 0.0;
  retstr->var6.height = v25;
  return result;
}

- (void)_configureViewsForState:(int64_t)a3 usesCallout:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  __int128 v24;
  double v25;
  UIView *contentMaskView;
  _BOOL8 v27;
  __int128 v28;
  __int128 v29;
  char v30;
  __int128 v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  CGFloat sx[2];
  CGFloat ty[2];
  CGFloat tx[2];
  CGFloat v48[2];
  CGAffineTransform v49;
  CGAffineTransform v50;
  _BYTE v51[128];
  _MKMarkerAnnotationBaseImageView *v52;
  _MKMarkerAnnotationBaseImageView *markerView;
  _QWORD v54[3];

  v5 = a5;
  v54[1] = *MEMORY[0x1E0C80C00];
  *(_OWORD *)tx = 0u;
  *(_OWORD *)v48 = 0u;
  if (a3)
    LODWORD(v8) = a4;
  else
    LODWORD(v8) = 0;
  *(_OWORD *)sx = 0uLL;
  *(_OWORD *)ty = 0uLL;
  v43 = 0uLL;
  v44 = 0uLL;
  -[MKMarkerAnnotationView _metricsForState:](self, "_metricsForState:");
  if (v5)
    v9 = 0.5;
  else
    v9 = 0.0;
  if ((_DWORD)v8 != 1)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", self->_selectedDotView, self->_selectedMarkerView, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      markerView = self->_markerView;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &markerView, 1);
    }
    else
    {
      v52 = self->_markerView;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", self->_selectedDotView, self->_selectedMarkerView, 0);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_9;
LABEL_21:
    if (a3)
      v18 = 0.0;
    else
      v18 = 0.0833333333;
    v19 = dbl_18B2A94E0[a3 != 0];
    _setAlphaForViews(v10, 1, 1.0, 0.0833333333, v18);
    _setAlphaForViews(v11, 1, 0.0, 0.0833333333, v19);
    goto LABEL_25;
  }
  v54[0] = self->_selectedDotView;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", self->_markerView, self->_selectedMarkerView, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_21;
LABEL_9:
  v30 = (char)v8;
  v8 = v10;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v12 = v11;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v40 != v16)
          objc_enumerationMutation(v13);
        -[UIView _mapkit_bringSubviewToFront:](self, "_mapkit_bringSubviewToFront:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    }
    while (v15);
  }

  v10 = v8;
  _setAlphaForViews(v8, 0, 1.0, 0.0, 0.0);
  _setAlphaForViews(v13, 0, 0.0, 0.0, 0.0);
  v11 = v12;
  LOBYTE(v8) = v30;
LABEL_25:
  v21 = *((double *)&v43 + 1);
  v20 = *(double *)&v43;
  v29 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v31 = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v38.a = v31;
  *(_OWORD *)&v38.c = v29;
  v28 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v38.tx = v28;
  *(_OWORD *)&v50.a = v31;
  *(_OWORD *)&v50.c = v29;
  *(_OWORD *)&v50.tx = v28;
  CGAffineTransformTranslate(&v38, &v50, ty[0], ty[1]);
  v49 = v38;
  CGAffineTransformScale(&v50, &v49, v20, v21);
  v38 = v50;
  _setViewTransform(self->_markerView, &v50, v9);
  v22 = sx[0];
  *(_OWORD *)&v37.a = v31;
  *(_OWORD *)&v37.c = v29;
  *(_OWORD *)&v37.tx = v28;
  *(_OWORD *)&v50.a = v31;
  *(_OWORD *)&v50.c = v29;
  *(_OWORD *)&v50.tx = v28;
  v23 = 0.0;
  CGAffineTransformTranslate(&v37, &v50, 0.0, 0.0);
  v49 = v37;
  CGAffineTransformScale(&v50, &v49, v22, v22);
  v37 = v50;
  _setViewTransform(self->_selectedDotView, &v50, v9);
  v24 = v44;
  *(_OWORD *)&v36.a = v31;
  *(_OWORD *)&v36.c = v29;
  *(_OWORD *)&v36.tx = v28;
  *(_OWORD *)&v50.a = v31;
  *(_OWORD *)&v50.c = v29;
  *(_OWORD *)&v50.tx = v28;
  CGAffineTransformTranslate(&v36, &v50, tx[0], tx[1]);
  v49 = v36;
  CGAffineTransformScale(&v50, &v49, *(CGFloat *)&v24, *((CGFloat *)&v24 + 1));
  v36 = v50;
  _setViewTransform(self->_selectedMarkerView, &v50, v9);
  if ((v8 & 1) == 0)
  {
    -[MKMarkerAnnotationView _effectiveShadowAlphaForState:](self, "_effectiveShadowAlphaForState:", a3);
    v23 = v25;
  }
  memset(&v35, 0, sizeof(v35));
  CGAffineTransformMakeScale(&v35, sx[1], sx[1]);
  if (a3 == 2)
  {
    v49 = v35;
    CGAffineTransformTranslate(&v50, &v49, 0.0, 20.0);
    v35 = v50;
  }
  v50 = v35;
  -[MKMarkerAnnotationView _setShadowAlpha:transform:duration:](self, "_setShadowAlpha:transform:duration:", &v50, v23, v9);
  contentMaskView = self->_contentMaskView;
  if (contentMaskView)
  {
    CGAffineTransformMakeScale(&v34, sx[1], sx[1]);
    v33 = v34;
    -[UIView setTransform:](contentMaskView, "setTransform:", &v33);
    -[UIView _mapkit_bringSubviewToFront:](self, "_mapkit_bringSubviewToFront:", self->_contentMaskView);
  }
  v27 = contentMaskView != 0;
  -[UIImageView setHidden:](self->_selectedGlyphImageView, "setHidden:", v27);
  -[_MKUILabel setHidden:](self->_selectedGlyphLabel, "setHidden:", v27);
  *(_OWORD *)&v32.a = v31;
  *(_OWORD *)&v32.c = v29;
  *(_OWORD *)&v32.tx = v28;
  *(_OWORD *)&v50.a = v31;
  *(_OWORD *)&v50.c = v29;
  *(_OWORD *)&v50.tx = v28;
  CGAffineTransformTranslate(&v32, &v50, v48[0], v48[1]);
  v49 = v32;
  CGAffineTransformScale(&v50, &v49, 1.0, 1.0);
  v32 = v50;
  _setViewTransform(self, &v50, v9);

}

- (void)_setShadowAlpha:(double)a3 transform:(CGAffineTransform *)a4 duration:(double)a5
{
  __int128 v8;
  __int128 v9;
  float v10;
  _OWORD v11[3];
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  double v16;

  if (a5 <= 0.0)
  {
    v9 = *(_OWORD *)&a4->c;
    v11[0] = *(_OWORD *)&a4->a;
    v11[1] = v9;
    v11[2] = *(_OWORD *)&a4->tx;
    -[UIImageView setTransform:](self->_shadow, "setTransform:", v11);
    v10 = a3;
    -[UIImageView setAlpha:](self->_shadow, "setAlpha:", v10);
  }
  else
  {
    v12[1] = 3221225472;
    v8 = *(_OWORD *)&a4->c;
    v13 = *(_OWORD *)&a4->a;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[2] = __61__MKMarkerAnnotationView__setShadowAlpha_transform_duration___block_invoke;
    v12[3] = &unk_1E20D8B00;
    v12[4] = self;
    v14 = v8;
    v15 = *(_OWORD *)&a4->tx;
    v16 = a3;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v12, 0, a5, 0.0, 0.666666687, 0.0);
  }
}

uint64_t __61__MKMarkerAnnotationView__setShadowAlpha_transform_duration___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  float v4;
  _OWORD v6[3];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1032);
  v3 = *(_OWORD *)(a1 + 56);
  v6[0] = *(_OWORD *)(a1 + 40);
  v6[1] = v3;
  v6[2] = *(_OWORD *)(a1 + 72);
  objc_msgSend(v2, "setTransform:", v6);
  v4 = *(double *)(a1 + 88);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "setAlpha:", v4);
}

- (int64_t)_stateForIsSelected:(BOOL)a3
{
  return a3;
}

- (void)_didDragWithVelocity:(CGPoint)a3
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  double v7;
  double v8;
  _BOOL4 v9;
  double v10;
  _QWORD v11[5];
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform v17;

  v4 = *MEMORY[0x1E0C9BAA8];
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v17.c = v5;
  *(_OWORD *)&v17.tx = v6;
  v7 = a3.x / 1000.0;
  v8 = 1.0;
  v9 = v7 <= -1.0 || v7 > 1.0;
  if (v7 <= -1.0 || v7 <= 1.0)
    v8 = -1.0;
  if (v9)
    v10 = v8;
  else
    v10 = v7;
  *(_OWORD *)&v16.a = v4;
  *(_OWORD *)&v16.c = v5;
  *(_OWORD *)&v16.tx = v6;
  *(_OWORD *)&v17.a = v4;
  CGAffineTransformRotate(&v17, &v16, -v10);
  memset(&v16, 0, sizeof(v16));
  CGAffineTransformMakeTranslation(&v16, 0.0, 10.0);
  v14 = v16;
  CGAffineTransformRotate(&v15, &v14, v10 * -0.5);
  v16 = v15;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__MKMarkerAnnotationView__didDragWithVelocity___block_invoke;
  v11[3] = &unk_1E20D8B28;
  v11[4] = self;
  v12 = v17;
  v13 = v15;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 4, v11, 0, 0.2, 0.0);
}

uint64_t __47__MKMarkerAnnotationView__didDragWithVelocity___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  __int128 v5;
  _OWORD v7[3];
  _OWORD v8[3];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1056);
  v3 = *(_OWORD *)(a1 + 56);
  v8[0] = *(_OWORD *)(a1 + 40);
  v8[1] = v3;
  v8[2] = *(_OWORD *)(a1 + 72);
  objc_msgSend(v2, "setTransform:", v8);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 1032);
  v5 = *(_OWORD *)(a1 + 104);
  v7[0] = *(_OWORD *)(a1 + 88);
  v7[1] = v5;
  v7[2] = *(_OWORD *)(a1 + 120);
  return objc_msgSend(v4, "setTransform:", v7);
}

- (void)_setupNormalViewsIfNeeded
{
  id v3;
  UIImageView *v4;
  UIImageView *shadow;
  double v6;
  double v7;
  void *v8;
  UIImageView *v9;
  _MKMarkerAnnotationBaseImageView *v10;
  _MKMarkerAnnotationBaseImageView *markerView;
  void *v12;
  UIImageView *v13;
  UIImageView *glyphImageView;
  _MKUILabel *v15;
  _MKUILabel *glyphLabel;
  void *v17;
  UIView *contentMaskView;
  double v19;
  double v20;
  void *v21;
  CGAffineTransform v22;
  CGAffineTransform v23;

  if (!self->_shadow)
  {
    if (qword_1ECE2D7E0 != -1)
      dispatch_once(&qword_1ECE2D7E0, &__block_literal_global_82);
    v3 = objc_alloc(MEMORY[0x1E0CEA658]);
    v4 = (UIImageView *)objc_msgSend(v3, "initWithImage:", qword_1ECE2D7D8);
    shadow = self->_shadow;
    self->_shadow = v4;

    objc_msgSend((id)qword_1ECE2D7D8, "size");
    v7 = -11.0 / v6 + 1.0;
    -[UIImageView layer](self->_shadow, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAnchorPoint:", 0.5, v7);

    CGAffineTransformMakeScale(&v23, 0.5, 0.5);
    v9 = self->_shadow;
    v22 = v23;
    -[UIImageView setTransform:](v9, "setTransform:", &v22);
    -[MKMarkerAnnotationView addSubview:](self, "addSubview:", self->_shadow);
    v10 = -[_MKMarkerAnnotationBaseImageView initWithBalloonRadius:tailLength:]([_MKMarkerAnnotationBaseImageView alloc], "initWithBalloonRadius:tailLength:", 14.0, 5.0);
    markerView = self->_markerView;
    self->_markerView = v10;

    -[_MKMarkerAnnotationBaseImageView layer](self->_markerView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAnchorPoint:", 0.5, 1.0);

    v13 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", 4.0, 4.0, 20.0, 20.0);
    glyphImageView = self->_glyphImageView;
    self->_glyphImageView = v13;

    -[UIImageView setContentMode:](self->_glyphImageView, "setContentMode:", 1);
    v15 = -[_MKUILabel initWithFrame:]([_MKUILabel alloc], "initWithFrame:", 4.0, 4.0, 20.0, 20.0);
    glyphLabel = self->_glyphLabel;
    self->_glyphLabel = v15;

    -[_MKUILabel setTextAlignment:](self->_glyphLabel, "setTextAlignment:", 1);
    -[_MKUILabel setAdjustsFontSizeToFitWidth:](self->_glyphLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[_MKUILabel setBaselineAdjustment:](self->_glyphLabel, "setBaselineAdjustment:", 1);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 16.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel setFont:](self->_glyphLabel, "setFont:", v17);

    -[_MKMarkerAnnotationBaseImageView addSubview:](self->_markerView, "addSubview:", self->_glyphImageView);
    -[_MKMarkerAnnotationBaseImageView addSubview:](self->_markerView, "addSubview:", self->_glyphLabel);
    contentMaskView = self->_contentMaskView;
    if (contentMaskView)
    {
      -[UIView bounds](contentMaskView, "bounds");
      v20 = 5.0 / v19 + 1.0;
      -[UIView layer](self->_contentMaskView, "layer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setAnchorPoint:", 0.5, v20);

    }
    -[MKMarkerAnnotationView addSubview:](self, "addSubview:", self->_markerView);
  }
}

void __51__MKMarkerAnnotationView__setupNormalViewsIfNeeded__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_imageNamed:", CFSTR("balloon_shadow"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECE2D7D8;
  qword_1ECE2D7D8 = v0;

}

- (void)_setupSelectedViewsIfNeededUsesCallout:(BOOL)a3
{
  _MKMarkerAnnotationBaseImageView *selectedDotView;
  _BOOL4 v6;
  _MKMarkerAnnotationBaseImageView *v7;
  _MKMarkerAnnotationBaseImageView *v8;
  void *v9;
  void *v10;
  _MKMarkerAnnotationBaseImageView *v11;
  _MKMarkerAnnotationBaseImageView *selectedMarkerView;
  void *v13;
  UIImageView *v14;
  UIImageView *selectedGlyphImageView;
  _MKUILabel *v16;
  _MKUILabel *selectedGlyphLabel;
  void *v18;
  UIView *contentMaskView;
  double v20;
  double v21;
  void *v22;

  selectedDotView = self->_selectedDotView;
  v6 = selectedDotView == 0;
  if (selectedDotView)
  {
    if (a3)
      goto LABEL_7;
  }
  else
  {
    v7 = -[_MKMarkerAnnotationBaseImageView initWithOvalInSize:]([_MKMarkerAnnotationBaseImageView alloc], "initWithOvalInSize:", 7.0, 7.0);
    v8 = self->_selectedDotView;
    self->_selectedDotView = v7;

    -[_MKMarkerAnnotationBaseImageView layer](self->_selectedDotView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCornerRadius:", 3.0);

    -[_MKMarkerAnnotationBaseImageView layer](self->_selectedDotView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAnchorPoint:", 0.5, 1.0);

    -[MKMarkerAnnotationView addSubview:](self, "addSubview:", self->_selectedDotView);
    if (a3)
      goto LABEL_7;
  }
  if (!self->_selectedMarkerView)
  {
    v11 = -[_MKMarkerAnnotationBaseImageView initWithBalloonRadius:tailLength:]([_MKMarkerAnnotationBaseImageView alloc], "initWithBalloonRadius:tailLength:", 28.0, 6.0);
    selectedMarkerView = self->_selectedMarkerView;
    self->_selectedMarkerView = v11;

    -[_MKMarkerAnnotationBaseImageView layer](self->_selectedMarkerView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAnchorPoint:", 0.5, 1.0);

    v14 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", 8.0, 8.0, 40.0, 40.0);
    selectedGlyphImageView = self->_selectedGlyphImageView;
    self->_selectedGlyphImageView = v14;

    v6 = 1;
    -[UIImageView setContentMode:](self->_selectedGlyphImageView, "setContentMode:", 1);
    v16 = -[_MKUILabel initWithFrame:]([_MKUILabel alloc], "initWithFrame:", 8.0, 8.0, 40.0, 40.0);
    selectedGlyphLabel = self->_selectedGlyphLabel;
    self->_selectedGlyphLabel = v16;

    -[_MKUILabel setTextAlignment:](self->_selectedGlyphLabel, "setTextAlignment:", 1);
    -[_MKUILabel setAdjustsFontSizeToFitWidth:](self->_selectedGlyphLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[_MKUILabel setBaselineAdjustment:](self->_selectedGlyphLabel, "setBaselineAdjustment:", 1);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 32.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel setFont:](self->_selectedGlyphLabel, "setFont:", v18);

    -[_MKMarkerAnnotationBaseImageView addSubview:](self->_selectedMarkerView, "addSubview:", self->_selectedGlyphImageView);
    -[_MKMarkerAnnotationBaseImageView addSubview:](self->_selectedMarkerView, "addSubview:", self->_selectedGlyphLabel);
    -[MKMarkerAnnotationView addSubview:](self, "addSubview:", self->_selectedMarkerView);
  }
LABEL_7:
  contentMaskView = self->_contentMaskView;
  if (contentMaskView)
  {
    -[UIView bounds](contentMaskView, "bounds");
    v21 = 14.5 / v20 + 1.0;
    -[UIView layer](self->_contentMaskView, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAnchorPoint:", 0.5, v21);

  }
  if (v6)
  {
    -[MKMarkerAnnotationView _updateContentForState:forceUpdate:](self, "_updateContentForState:forceUpdate:", 1, 1);
    -[UIView _mapkit_setNeedsLayout](self, "_mapkit_setNeedsLayout");
  }
}

- (void)_configureAnimated:(BOOL)a3 fromState:(int64_t)a4 toState:(int64_t)a5
{
  _BOOL8 v7;
  _BOOL8 v9;
  char v11;

  v7 = a3;
  v9 = -[MKAnnotationView _shouldShowCalloutIfSelected](self, "_shouldShowCalloutIfSelected");
  -[MKMarkerAnnotationView _setupNormalViewsIfNeeded](self, "_setupNormalViewsIfNeeded");
  if (v7)
  {
    -[MKMarkerAnnotationView _updateContentForState:](self, "_updateContentForState:", a4);
    -[MKMarkerAnnotationView _setupSelectedViewsIfNeededUsesCallout:](self, "_setupSelectedViewsIfNeededUsesCallout:", v9);
    -[MKMarkerAnnotationView _updateContentForState:](self, "_updateContentForState:", a5);
    -[MKMarkerAnnotationView _configureViewsForState:usesCallout:animated:](self, "_configureViewsForState:usesCallout:animated:", a4, v9, 0);
  }
  else
  {
    -[MKMarkerAnnotationView _setupSelectedViewsIfNeededUsesCallout:](self, "_setupSelectedViewsIfNeededUsesCallout:", v9);
    -[MKMarkerAnnotationView _updateContentForState:](self, "_updateContentForState:", a5);
  }
  -[MKMarkerAnnotationView _configureViewsForState:usesCallout:animated:](self, "_configureViewsForState:usesCallout:animated:", a5, v9, v7);
  -[MKAnnotationView _updateEffectiveZPriority](self, "_updateEffectiveZPriority");
  v11 = a5 != 1 || (unint64_t)(a4 - 1) < 2 || v9;
  if ((v11 & 1) == 0 && v7)
  {
    if (_MKMarkerAnnotationViewSelectionShouldSway())
      -[MKMarkerAnnotationView _swayAnimation](self, "_swayAnimation");
  }
}

- (void)setDragState:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  int64_t v7;
  int64_t v8;
  objc_super v9;

  v4 = a4;
  if (-[MKAnnotationView dragState](self, "dragState") != a3)
  {
    v9.receiver = self;
    v9.super_class = (Class)MKMarkerAnnotationView;
    -[MKAnnotationView setDragState:animated:](&v9, sel_setDragState_animated_, a3, v4);
    if (a3 == 1)
    {
      v7 = 2;
      -[MKMarkerAnnotationView setDragState:animated:](self, "setDragState:animated:", 2, v4);
      v8 = -[MKMarkerAnnotationView _stateForIsSelected:](self, "_stateForIsSelected:", -[MKAnnotationView isSelected](self, "isSelected"));
    }
    else
    {
      if (a3 - 3 > 1)
        return;
      if (!_MKLinkedOnOrAfterReleaseSet(2053) || _MKLinkedOnOrAfterReleaseSet(2310))
        -[MKMarkerAnnotationView setDragState:animated:](self, "setDragState:animated:", 0, v4);
      v7 = -[MKMarkerAnnotationView _stateForIsSelected:](self, "_stateForIsSelected:", -[MKAnnotationView isSelected](self, "isSelected"));
      v8 = 2;
    }
    -[MKMarkerAnnotationView _configureAnimated:fromState:toState:](self, "_configureAnimated:fromState:toState:", 1, v8, v7);
    -[MKAnnotationView invalidateCustomFeatureForced:](self, "invalidateCustomFeatureForced:", a3 != 1);
  }
}

- (void)_setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  _BOOL4 v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  v7 = -[MKAnnotationView isSelected](self, "isSelected");
  v8.receiver = self;
  v8.super_class = (Class)MKMarkerAnnotationView;
  -[MKAnnotationView _setSelected:animated:](&v8, sel__setSelected_animated_, v5, v4);
  if (v7 != v5)
  {
    -[MKMarkerAnnotationView _configureAnimated:fromState:toState:](self, "_configureAnimated:fromState:toState:", v4, -[MKMarkerAnnotationView _stateForIsSelected:](self, "_stateForIsSelected:", v5 ^ 1), -[MKMarkerAnnotationView _stateForIsSelected:](self, "_stateForIsSelected:", v5));
    -[MKAnnotationView invalidateCustomFeatureForced:](self, "invalidateCustomFeatureForced:", 0);
  }
}

- (BOOL)updateCalloutViewIfNeededAnimated:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v6;

  v3 = a3;
  if (-[MKAnnotationView isSelected](self, "isSelected"))
    -[MKMarkerAnnotationView _configureAnimated:fromState:toState:](self, "_configureAnimated:fromState:toState:", v3, 1, 1);
  v6.receiver = self;
  v6.super_class = (Class)MKMarkerAnnotationView;
  return -[MKAnnotationView updateCalloutViewIfNeededAnimated:](&v6, sel_updateCalloutViewIfNeededAnimated_, v3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_isObserving)
  {
    -[MKAnnotationView annotation](self, "annotation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("title"));
    objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("subtitle"));
    self->_isObserving = 0;

  }
  v4.receiver = self;
  v4.super_class = (Class)MKMarkerAnnotationView;
  -[MKAnnotationView dealloc](&v4, sel_dealloc);
}

- (void)_swayAnimation
{
  void *v3;
  id v4;

  _MKMarkerAnnotationViewSelectionSwayAnimation();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_MKMarkerAnnotationBaseImageView layer](self->_selectedMarkerView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAnimation:forKey:", v4, CFSTR("rotate"));

}

- (BOOL)_shouldRenderGradient
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "supportsAdvancedMap"))
  {
    -[MKMarkerAnnotationView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom") != 3;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int)_blendMode
{
  if (self->_customStyleAttributes)
    return 3;
  else
    return 0;
}

- (BOOL)_shouldDeselectWhenDragged
{
  return 0;
}

- (BOOL)isProvidingCustomFeature
{
  if (-[MKAnnotationView dragState](self, "dragState"))
    return 0;
  else
    return !-[MKAnnotationView isHidden](self, "isHidden");
}

- (UIEdgeInsets)_defaultCollisionAlignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = -0.0;
  v3 = -10.0;
  v4 = -5.0;
  v5 = -5.0;
  result.right = v5;
  result.bottom = v2;
  result.left = v4;
  result.top = v3;
  return result;
}

- (GEOFeatureStyleAttributes)_styleAttributes
{
  return self->_customStyleAttributes;
}

- (UIColor)markerTintColor
{
  return self->_markerTintColor;
}

- (UIColor)glyphTintColor
{
  return self->_glyphTintColor;
}

- (NSString)glyphText
{
  return self->_glyphText;
}

- (UIImage)glyphImage
{
  return self->_glyphImage;
}

- (UIImage)selectedGlyphImage
{
  return self->_selectedGlyphImage;
}

- (BOOL)animatesWhenAdded
{
  return self->_animatesWhenAdded;
}

- (void)setAnimatesWhenAdded:(BOOL)animatesWhenAdded
{
  self->_animatesWhenAdded = animatesWhenAdded;
}

- (UIColor)markerStrokeTintColor
{
  return self->_markerStrokeTintColor;
}

- (double)markerStrokeWidth
{
  return self->_markerStrokeWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markerStrokeTintColor, 0);
  objc_storeStrong((id *)&self->_selectedGlyphImage, 0);
  objc_storeStrong((id *)&self->_glyphImage, 0);
  objc_storeStrong((id *)&self->_glyphText, 0);
  objc_storeStrong((id *)&self->_glyphTintColor, 0);
  objc_storeStrong((id *)&self->_markerTintColor, 0);
  objc_storeStrong((id *)&self->_walletMerchantStylingInfo, 0);
  objc_storeStrong((id *)&self->_customStyleAttributes, 0);
  objc_storeStrong((id *)&self->_contentMaskView, 0);
  objc_storeStrong((id *)&self->_selectedGlyphLabel, 0);
  objc_storeStrong((id *)&self->_selectedGlyphImageView, 0);
  objc_storeStrong((id *)&self->_glyphLabel, 0);
  objc_storeStrong((id *)&self->_glyphImageView, 0);
  objc_storeStrong((id *)&self->_selectedMarkerView, 0);
  objc_storeStrong((id *)&self->_selectedDotView, 0);
  objc_storeStrong((id *)&self->_markerView, 0);
  objc_storeStrong((id *)&self->_shadow, 0);
}

- (MKWalletMerchantStylingInfo)_walletMerchantStylingInfo
{
  return self->_walletMerchantStylingInfo;
}

- (void)_setWalletMerchantStylingInfo:(id)a3
{
  void *v5;
  MKWalletMerchantStylingInfo *v6;

  v6 = (MKWalletMerchantStylingInfo *)a3;
  if (self->_walletMerchantStylingInfo != v6)
  {
    objc_storeStrong((id *)&self->_walletMerchantStylingInfo, a3);
    -[MKWalletMerchantStylingInfo _featureStyleAttributes](v6, "_featureStyleAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMarkerAnnotationView _setStyleAttributes:](self, "_setStyleAttributes:", v5);

  }
}

@end
