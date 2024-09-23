@implementation MKScaleView

+ (MKScaleView)scaleViewWithMapView:(MKMapView *)mapView
{
  MKMapView *v4;
  void *v5;

  v4 = mapView;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMapView:", v4);

  return (MKScaleView *)v5;
}

- (MKScaleView)initWithMapView:(id)a3
{
  id v4;
  MKScaleView *v5;
  MKScaleView *v6;

  v4 = a3;
  v5 = -[MKScaleView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 170.0, 20.0);
  v6 = v5;
  if (v5)
  {
    -[MKScaleView setAlpha:](v5, "setAlpha:", 0.0);
    -[MKScaleView setHidden:](v6, "setHidden:", 1);
    v6->_isVisible = 0;
    -[MKScaleView setMapView:](v6, "setMapView:", v4);
  }

  return v6;
}

- (CGSize)intrinsicContentSize
{
  unint64_t v3;
  uint64_t *v4;
  double *v5;
  double v6;
  double v7;
  _QWORD block[5];
  CGSize result;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__MKScaleView_intrinsicContentSize__block_invoke;
  block[3] = &unk_1E20D7D98;
  block[4] = self;
  if (qword_1ECE2D720 != -1)
    dispatch_once(&qword_1ECE2D720, block);
  v3 = -[MKScaleView _controlSize](self, "_controlSize");
  v4 = &_MergedGlobals_3_4;
  v5 = (double *)algn_1ECE2D718;
  if (v3 != 2)
    v5 = (double *)&qword_1ECE2D708;
  v6 = *v5;
  if (v3 == 2)
    v4 = &qword_1ECE2D710;
  v7 = *(double *)v4;
  result.height = v6;
  result.width = v7;
  return result;
}

double __35__MKScaleView_intrinsicContentSize__block_invoke(uint64_t a1)
{
  BOOL v2;
  uint64_t v3;
  double v4;
  double v5;
  double result;

  _MergedGlobals_3_4 = 0x4065400000000000;
  qword_1ECE2D708 = 0x4034000000000000;
  v2 = _MKLinkedOnOrAfterReleaseSet(2824);
  v3 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v4 = *(double *)(v3 + 640) + *(double *)(v3 + 640);
    *(double *)&_MergedGlobals_3_4 = *(double *)&_MergedGlobals_3_4 - v4;
    v5 = *(double *)(v3 + 648);
    *(double *)&qword_1ECE2D708 = *(double *)&qword_1ECE2D708 - v5;
  }
  else
  {
    v5 = *(double *)(v3 + 648);
    v4 = *(double *)(v3 + 640) + *(double *)(v3 + 640);
  }
  result = 212.5 - v4;
  qword_1ECE2D710 = *(_QWORD *)&result;
  *(double *)algn_1ECE2D718 = 25.0 - v5;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double legendMarginLeft;
  double legendMarginBottom;
  double v4;
  double v5;
  UIEdgeInsets result;

  legendMarginLeft = self->_legendMarginLeft;
  legendMarginBottom = self->_legendMarginBottom;
  v4 = 0.0;
  v5 = legendMarginLeft;
  result.right = v5;
  result.bottom = legendMarginBottom;
  result.left = legendMarginLeft;
  result.top = v4;
  return result;
}

- (MKScaleView)initWithFrame:(CGRect)a3
{
  MKScaleView *v3;
  MKScaleView *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UIColor *borderColorRegular;
  uint64_t v10;
  UIColor *borderColorSatellite;
  void *v12;
  NSMutableArray *v13;
  NSMutableArray *segments;
  _MKScaleUnitsView *v15;
  _MKScaleUnitsView *unitsView;
  uint64_t v17;
  UIView *displayedOutline;
  uint64_t v19;
  UIView *displayedWhiteOutline;
  id v21;
  uint64_t v22;
  void *v23;
  NSMutableDictionary *v24;
  NSMutableDictionary *formattedNumberCache;
  void *v26;
  NSNumberFormatter *v27;
  NSNumberFormatter *floatNumberFormatter;
  NSNumberFormatter *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  objc_super v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)MKScaleView;
  v3 = -[MKScaleView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_isVisible = 1;
    v3->_controlSize = 1;
    -[MKScaleView updateMetrics](v3, "updateMetrics");
    -[MKScaleView updateLocale:](v4, "updateLocale:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MNLocaleDidChangeNotification();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel_updateLocale_, v6, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, sel_memoryWarning_, *MEMORY[0x1E0CEB298], 0);

    *(_OWORD *)v4->_magicNumbers = xmmword_18B2AF080;
    v4->_magicNumbers[2] = 5.0;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA478]), "initWithWhite:alpha:", 0.0, 0.730000019);
    borderColorRegular = v4->_borderColorRegular;
    v4->_borderColorRegular = (UIColor *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA478]), "initWithWhite:alpha:", 0.0, 1.0);
    borderColorSatellite = v4->_borderColorSatellite;
    v4->_borderColorSatellite = (UIColor *)v10;

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKScaleView setBackgroundColor:](v4, "setBackgroundColor:", v12);

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    segments = v4->_segments;
    v4->_segments = v13;

    v15 = objc_alloc_init(_MKScaleUnitsView);
    unitsView = v4->_unitsView;
    v4->_unitsView = v15;

    -[_MKScaleUnitsView setFontSize:](v4->_unitsView, "setFontSize:", v4->_fontSize);
    -[_MKScaleUnitsView setLegendMarginLeft:](v4->_unitsView, "setLegendMarginLeft:", v4->_legendMarginLeft);
    -[MKScaleView addSubview:](v4, "addSubview:", v4->_unitsView);
    -[MKScaleView _setupOutlineView](v4, "_setupOutlineView");
    v17 = objc_claimAutoreleasedReturnValue();
    displayedOutline = v4->_displayedOutline;
    v4->_displayedOutline = (UIView *)v17;

    -[MKScaleView addSubview:](v4, "addSubview:", v4->_displayedOutline);
    -[MKScaleView _setupOutlineView](v4, "_setupOutlineView");
    v19 = objc_claimAutoreleasedReturnValue();
    displayedWhiteOutline = v4->_displayedWhiteOutline;
    v4->_displayedWhiteOutline = (UIView *)v19;

    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = objc_msgSend(v21, "CGColor");
    -[UIView layer](v4->_displayedWhiteOutline, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBorderColor:", v22);

    -[MKScaleView addSubview:](v4, "addSubview:", v4->_displayedWhiteOutline);
    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    formattedNumberCache = v4->_formattedNumberCache;
    v4->_formattedNumberCache = v24;

    -[MKScaleView setUseLightText:](v4, "setUseLightText:", 0);
    -[MKScaleView _updateStrings](v4, "_updateStrings");
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_grQuality = objc_msgSend(v26, "_graphicsQuality");

    v4->_layoutCounter = -1;
    v27 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    floatNumberFormatter = v4->_floatNumberFormatter;
    v4->_floatNumberFormatter = v27;

    v29 = v4->_floatNumberFormatter;
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter setLocale:](v29, "setLocale:", v30);

    -[NSNumberFormatter setNumberStyle:](v4->_floatNumberFormatter, "setNumberStyle:", 1);
    -[NSNumberFormatter setRoundingMode:](v4->_floatNumberFormatter, "setRoundingMode:", 6);
    -[NSNumberFormatter setUsesSignificantDigits:](v4->_floatNumberFormatter, "setUsesSignificantDigits:", 0);
    -[NSNumberFormatter setMaximumSignificantDigits:](v4->_floatNumberFormatter, "setMaximumSignificantDigits:", 3);
    -[NSNumberFormatter setMaximumFractionDigits:](v4->_floatNumberFormatter, "setMaximumFractionDigits:", 3);
    -[_MKScaleUnitsView setFloatNumberFormatter:](v4->_unitsView, "setFloatNumberFormatter:", v4->_floatNumberFormatter);
    v36[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (id)-[MKScaleView registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v31, sel__traitEnvironment_didChangeTraitCollection_);

    +[MKUsageCounter sharedCounter](MKUsageCounter, "sharedCounter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "count:", 3);

  }
  return v4;
}

- (void)updateMetrics
{
  self->_segmentThickness = 4.0;
  self->_segmentBorderWidth = 1.0;
  self->_legendMarginLeft = 6.0;
  self->_legendMarginBottom = 6.0;
  self->_legendUnitsSpacing = 1.0;
  self->_fontSize = 11.0;
  self->_unitsFrameHeight = 20.0;
  if (-[MKScaleView _controlSize](self, "_controlSize") == 2)
  {
    self->_segmentThickness = self->_segmentThickness * 1.25;
    self->_segmentBorderWidth = self->_segmentBorderWidth * 1.25;
    self->_legendMarginLeft = self->_legendMarginLeft * 1.25;
    self->_legendMarginBottom = self->_legendMarginBottom * 1.25;
    self->_legendUnitsSpacing = self->_legendUnitsSpacing * 1.25;
    self->_fontSize = self->_fontSize * 1.25;
    self->_unitsFrameHeight = self->_unitsFrameHeight * 1.25;
  }
  -[_MKScaleUnitsView setFontSize:](self->_unitsView, "setFontSize:", self->_fontSize);
  -[_MKScaleUnitsView setLegendMarginLeft:](self->_unitsView, "setLegendMarginLeft:", self->_legendMarginLeft);
}

- (id)_setupOutlineView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double segmentBorderWidth;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = objc_alloc(MEMORY[0x1E0CEABB0]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", 0);

  objc_msgSend(v4, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBorderWidth:", 1.0);

  segmentBorderWidth = self->_segmentBorderWidth;
  objc_msgSend(v4, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBorderWidth:", segmentBorderWidth);

  v9 = *MEMORY[0x1E0CD2A68];
  objc_msgSend(v4, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCornerCurve:", v9);

  objc_msgSend(v4, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMaskedCorners:", 15);

  return v4;
}

- (void)setLegendAlignment:(MKScaleViewAlignment)legendAlignment
{
  if (self->_legendAlignment != legendAlignment)
  {
    self->_legendAlignment = legendAlignment;
    -[MKScaleView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMapView:(MKMapView *)mapView
{
  MKMapView *WeakRetained;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  MKMapView *obj;

  obj = mapView;
  WeakRetained = (MKMapView *)objc_loadWeakRetained((id *)&self->_mapView);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_mapView);

    if (v5)
    {
      v6 = objc_loadWeakRetained((id *)&self->_mapView);
      -[MKMapView _stopPostingScaleUpdateNotifications]((uint64_t)v6);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_loadWeakRetained((id *)&self->_mapView);
      objc_msgSend(v7, "removeObserver:name:object:", self, 0, v8);

    }
    v9 = objc_storeWeak((id *)&self->_mapView, obj);

    if (obj)
    {
      v10 = objc_loadWeakRetained((id *)&self->_mapView);
      if (v10)
        ++v10[168];

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_loadWeakRetained((id *)&self->_mapView);
      objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_shouldUpdateScaleNotification_, CFSTR("MKMapViewShouldUpdateScaleNotification"), v12);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_loadWeakRetained((id *)&self->_mapView);
      objc_msgSend(v13, "addObserver:selector:name:object:", self, sel_shouldUpdateScaleNotification_, 0x1E20E0AC0, v14);

    }
    -[MKScaleView _updateVisibility](self, "_updateVisibility");
  }

}

- (void)setScaleVisibility:(MKFeatureVisibility)scaleVisibility
{
  if (self->_scaleVisibility != scaleVisibility)
  {
    self->_scaleVisibility = scaleVisibility;
    -[MKScaleView _updateVisibility](self, "_updateVisibility");
  }
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  objc_super v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
  -[MKMapView _stopPostingScaleUpdateNotifications]((uint64_t)WeakRetained);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)MKScaleView;
  -[MKScaleView dealloc](&v5, sel_dealloc);
}

- (void)_updateVisibility
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t scaleVisibility;
  _BOOL4 v8;
  double v9;
  _QWORD v10[5];
  BOOL v11;
  _QWORD v12[5];
  BOOL v13;
  CGRect v14;

  -[MKScaleView mapView](self, "mapView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    goto LABEL_13;
  v5 = objc_msgSend(v3, "mapType");
  if ((objc_msgSend(v4, "_showsNightMode") & 1) == 0 && (unint64_t)(v5 - 1) >= 4 && v5 != 107)
  {
    if (!-[MKScaleView useLightText](self, "useLightText"))
      goto LABEL_8;
    v6 = 0;
    goto LABEL_7;
  }
  if (!-[MKScaleView useLightText](self, "useLightText"))
  {
    v6 = 1;
LABEL_7:
    -[MKScaleView setUseLightText:](self, "setUseLightText:", v6);
  }
LABEL_8:
  scaleVisibility = self->_scaleVisibility;
  if (scaleVisibility == 2
    || !scaleVisibility
    && objc_msgSend(v4, "_isZooming")
    && objc_msgSend(v4, "_shouldDisplayScaleForCurrentRegion"))
  {
    objc_msgSend(v4, "bounds");
    v8 = 1;
    objc_msgSend(v4, "_distanceFromPoint:toPoint:fromView:withPrecision:", v4, 1, 1.0, 1.0, CGRectGetMaxX(v14) + -1.0, 1.0);
    -[MKScaleView setDistanceInMeters:](self, "setDistanceInMeters:");
    goto LABEL_14;
  }
LABEL_13:
  v8 = 0;
LABEL_14:
  if (self->_isVisible != v8)
  {
    self->_isVisible = v8;
    v9 = 0.7;
    if (v8)
      v9 = 0.1;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __32__MKScaleView__updateVisibility__block_invoke;
    v12[3] = &unk_1E20D8320;
    v13 = v8;
    v12[4] = self;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __32__MKScaleView__updateVisibility__block_invoke_2;
    v10[3] = &unk_1E20D8348;
    v10[4] = self;
    v11 = v8;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 4, v12, v10, v9, 0.0);
  }

}

uint64_t __32__MKScaleView__updateVisibility__block_invoke(uint64_t a1)
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

uint64_t __32__MKScaleView__updateVisibility__block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "setHidden:", *(_BYTE *)(result + 40) == 0);
  return result;
}

- (void)_traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a4;
  if (!-[MKScaleView usedInternallyByMapView](self, "usedInternallyByMapView"))
  {
    -[MKScaleView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceStyle");
    v7 = objc_msgSend(v9, "userInterfaceStyle");

    if (v6 != v7)
    {
      -[MKScaleView traitCollection](self, "traitCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKScaleView setUseLightText:](self, "setUseLightText:", objc_msgSend(v8, "userInterfaceStyle") == 2);

    }
  }

}

- (void)_updateStrings
{
  NSString *v3;
  NSString *feetAbbreviation;
  NSString *v5;
  NSString *yardAbbreviation;
  NSString *v7;
  NSString *milesAbbreviation;
  NSString *v9;
  NSString *metersAbbreviation;
  NSString *v11;
  NSString *kilometersAbbreviation;

  _MKLocalizedStringFromThisBundle(CFSTR("Scale distance feet"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  feetAbbreviation = self->_feetAbbreviation;
  self->_feetAbbreviation = v3;

  _MKLocalizedStringFromThisBundle(CFSTR("Scale distance yards"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  yardAbbreviation = self->_yardAbbreviation;
  self->_yardAbbreviation = v5;

  _MKLocalizedStringFromThisBundle(CFSTR("Scale distance miles"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  milesAbbreviation = self->_milesAbbreviation;
  self->_milesAbbreviation = v7;

  _MKLocalizedStringFromThisBundle(CFSTR("Scale distance meters"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  metersAbbreviation = self->_metersAbbreviation;
  self->_metersAbbreviation = v9;

  _MKLocalizedStringFromThisBundle(CFSTR("Scale distance kilometers"));
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  kilometersAbbreviation = self->_kilometersAbbreviation;
  self->_kilometersAbbreviation = v11;

}

- (void)updateLocale:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99DC8];
  v5 = a3;
  objc_msgSend(v4, "currentLocale");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  self->_useMetric = objc_msgSend(v6, "_navigation_distanceUsesMetricSystem");
  self->_useYardsForShortDistances = objc_msgSend(v6, "_navigation_useYardsForShortDistances");
  -[MKScaleView _updateStrings](self, "_updateStrings");
  -[MKScaleView memoryWarning:](self, "memoryWarning:", v5);

}

- (void)memoryWarning:(id)a3
{
  -[_MKScaleUnitsView clearCaches:](self->_unitsView, "clearCaches:", a3);
  -[NSMutableDictionary removeAllObjects](self->_formattedNumberCache, "removeAllObjects");
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKScaleView;
  -[MKScaleView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[MKScaleView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setDistanceInMeters:(double)a3
{
  int v4;

  if (self->_distanceInMeters != a3)
  {
    self->_distanceInMeters = a3;
    v4 = self->_layoutCounter + 1;
    self->_layoutCounter = v4;
    if ((-1431655765 * v4 + 715827882) <= 0x55555554)
    {
      -[MKScaleView setNeedsLayout](self, "setNeedsLayout");
      self->_layoutCounter = 0;
    }
  }
}

- (BOOL)useLightText
{
  return -[NSNumber BOOLValue](self->_useLightText, "BOOLValue");
}

- (id)_setupSegmentView:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 1200);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEABA8], "effectForBlurEffect:style:", v4, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0CEABE8]);
  v7 = v6;
  if (v3)
  {
    objc_msgSend(v6, "setEffect:", v5);
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v8);

  }
  return v7;
}

- (void)_setControlSize:(unint64_t)a3
{
  id v4;

  if (self->_controlSize != a3)
  {
    self->_controlSize = a3;
    -[MKScaleView updateMetrics](self, "updateMetrics");
    -[MKScaleView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[MKScaleView mapView](self, "mapView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_updateScalePosition");

  }
}

- (void)setUseLightText:(BOOL)a3
{
  _BOOL8 v3;
  NSNumber *useLightText;
  NSNumber *v6;
  NSNumber *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSMutableArray *v13;
  NSMutableArray *segments;
  void *v15;
  UIVisualEffectView *v16;
  UIVisualEffectView *blurredSegment;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  CGColor *v24;
  void *v25;
  uint64_t v26;
  CGColor *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v3 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  useLightText = self->_useLightText;
  if (!useLightText || -[NSNumber BOOLValue](useLightText, "BOOLValue") != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v7 = self->_useLightText;
    self->_useLightText = v6;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v8 = self->_segments;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "removeFromSuperview", (_QWORD)v28);
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v10);
    }

    -[UIVisualEffectView removeFromSuperview](self->_blurredSegment, "removeFromSuperview");
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    segments = self->_segments;
    self->_segments = v13;

    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 1200);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v15);
    blurredSegment = self->_blurredSegment;
    self->_blurredSegment = v16;

    v18 = 1;
    -[UIVisualEffectView setHidden:](self->_blurredSegment, "setHidden:", 1);
    -[UIVisualEffectView _setCornerRadius:](self->_blurredSegment, "_setCornerRadius:", self->_segmentThickness * 0.5);
    -[MKScaleView addSubview:](self, "addSubview:", self->_blurredSegment);
    v19 = 4;
    do
    {
      -[MKScaleView _setupSegmentView:](self, "_setupSegmentView:", v18 & 1, (_QWORD)v28);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_setGroupName:", CFSTR("com.apple.MapKit.Scale.Segments"));
      -[NSMutableArray addObject:](self->_segments, "addObject:", v20);
      -[MKScaleView addSubview:](self, "addSubview:", v20);
      objc_msgSend(v20, "setHidden:", 1);
      v18 ^= 1u;

      --v19;
    }
    while (v19);
    -[MKScaleView mapView](self, "mapView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "mapType");
    if ((unint64_t)(v22 - 1) < 4
      || v22 == 107
      || (v23 = -[MKScaleView mapType](self, "mapType"), v23 - 1 < 4)
      || v23 == 107)
    {

      v24 = -[UIColor CGColor](self->_borderColorSatellite, "CGColor");
      -[UIView layer](self->_displayedOutline, "layer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setBorderColor:", v24);
      v26 = 0;
    }
    else
    {

      v27 = -[UIColor CGColor](self->_borderColorRegular, "CGColor");
      -[UIView layer](self->_displayedOutline, "layer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setBorderColor:", v27);
      v26 = 1;
    }

    -[UIView setHidden:](self->_displayedWhiteOutline, "setHidden:", v26);
    -[MKScaleView setNeedsLayout](self, "setNeedsLayout");
    -[_MKScaleUnitsView setUseLightText:](self->_unitsView, "setUseLightText:", v3);
    -[_MKScaleUnitsView setNeedsLayout](self->_unitsView, "setNeedsLayout");

  }
}

- (void)_calculateSegments
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v19;
  double resultSegmentLength;
  id v21;

  if (self->_distanceInMeters > 0.0)
  {
    -[MKScaleView bounds](self, "bounds");
    v4 = v3;
    -[MKScaleView mapView](self, "mapView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "bounds");
      v8 = v7;
    }
    else
    {
      -[MKScaleView superview](self, "superview");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bounds");
      v8 = v10;

    }
    v11 = self->_distanceInMeters * (v4 / v8);
    if (self->_useMetric || (v11 = v11 * 0.000621371192, v11 >= 0.25))
    {
      v12 = 0;
    }
    else
    {
      v11 = v11 * 5280.0;
      v12 = 1;
    }
    v13 = -3;
LABEL_11:
    v14 = 0;
    while (1)
    {
      v15 = self->_magicNumbers[v14];
      v16 = v15 * __exp10((double)v13);
      self->_resultSegmentLength = v16;
      v17 = v11 / v16;
      if (v17 >= 2.0 && v17 < 5.0)
        break;
      if (++v14 == 3)
      {
        if (++v13 != 7)
          goto LABEL_11;
        break;
      }
    }
    UIRoundToViewScale();
    self->_segmentLengthInPixels = v19;
    resultSegmentLength = self->_resultSegmentLength;
    self->_resultSegmentLengthInMeters = resultSegmentLength;
    if (!self->_useMetric)
    {
      if ((_DWORD)v12)
        resultSegmentLength = resultSegmentLength / 5280.0;
      self->_resultSegmentLengthInMeters = resultSegmentLength * 1609.344;
    }
    -[_MKScaleUnitsView setSegmentLengthInPixels:](self->_unitsView, "setSegmentLengthInPixels:", self->_segmentLengthInPixels);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    -[MKScaleView _localizedDistanceStringsWithMeters:imperial:useFeet:inMetric:displaysYardsForShortDistances:strings:](self, "_localizedDistanceStringsWithMeters:imperial:useFeet:inMetric:displaysYardsForShortDistances:strings:", self->_resultSegmentLengthInMeters, v12, self->_useMetric, self->_useYardsForShortDistances, v21, self->_resultSegmentLength);
    -[_MKScaleUnitsView setUnits:](self->_unitsView, "setUnits:", v21);

  }
}

- (void)layoutSubviews
{
  int v3;
  unsigned int v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double unitsFrameHeight;
  double v20;
  double v21;
  double segmentLengthInPixels;
  id v23;
  id v24;
  unint64_t v25;
  double segmentThickness;
  double v27;
  double v28;
  void *v29;
  UIVisualEffectView *blurredSegment;
  unint64_t i;
  void *v32;
  double x;
  double y;
  double width;
  double height;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  uint64_t v42;
  int64_t oldNumberOfSegments;
  double v44;
  void *v45;
  unint64_t v46;
  uint64_t j;
  void *v48;
  void *v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  NSMutableArray *segments;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t k;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t m;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  CATransform3D v76;
  CATransform3D v77;
  CATransform3D v78;
  CATransform3D v79;
  CATransform3D v80;
  objc_super v81;
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;

  v84 = *MEMORY[0x1E0C80C00];
  v81.receiver = self;
  v81.super_class = (Class)MKScaleView;
  -[MKScaleView layoutSubviews](&v81, sel_layoutSubviews);
  v3 = -[MKScaleView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1;
  v4 = self->_legendAlignment == 1;
  -[_MKScaleUnitsView setRTL:](self->_unitsView, "setRTL:", v3 ^ v4);
  v5 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)&v80.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  *(_OWORD *)&v80.m33 = v5;
  v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  *(_OWORD *)&v80.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  *(_OWORD *)&v80.m43 = v6;
  v7 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  *(_OWORD *)&v80.m11 = *MEMORY[0x1E0CD2610];
  *(_OWORD *)&v80.m13 = v7;
  v8 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  *(_OWORD *)&v80.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  *(_OWORD *)&v80.m23 = v8;
  if (v3 != v4)
    CATransform3DMakeScale(&v80, -1.0, 1.0, 1.0);
  v79 = v80;
  -[MKScaleView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v79;
  objc_msgSend(v9, "setTransform:", &v78);

  v77 = v80;
  -[_MKScaleUnitsView layer](self->_unitsView, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v77;
  objc_msgSend(v10, "setTransform:", &v76);

  -[MKScaleView _calculateSegments](self, "_calculateSegments");
  -[MKScaleView bounds](self, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  unitsFrameHeight = self->_unitsFrameHeight;
  -[MKScaleView bounds](self, "bounds");
  -[_MKScaleUnitsView setFrame:](self->_unitsView, "setFrame:", v12, CGRectGetMaxY(v85)- unitsFrameHeight- self->_legendMarginBottom- self->_segmentThickness- self->_legendUnitsSpacing, v16, unitsFrameHeight);
  v86.origin.x = v12;
  v86.origin.y = v14;
  v86.size.width = v16;
  v86.size.height = v18;
  v20 = CGRectGetMinX(v86) + self->_legendMarginLeft;
  v87.origin.x = v12;
  v87.origin.y = v14;
  v87.size.width = v16;
  v87.size.height = v18;
  v21 = CGRectGetMaxY(v87) - self->_legendMarginBottom;
  segmentLengthInPixels = self->_segmentLengthInPixels;
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0;
  segmentThickness = self->_segmentThickness;
  v27 = v20;
  while (1)
  {
    v28 = self->_segmentThickness;
    -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[_MKScaleUnitsView canDisplaySegment:](self->_unitsView, "canDisplaySegment:", v25))
      break;
    objc_msgSend(v29, "setFrame:", v27, v21, segmentLengthInPixels, v28);
    if (objc_msgSend(v29, "isHidden"))
      objc_msgSend(v23, "addObject:", v29);
    ++v25;
    v27 = segmentLengthInPixels + v27;

    if (v25 == 3)
      goto LABEL_10;
  }

LABEL_10:
  -[UIVisualEffectView setFrame:](self->_blurredSegment, "setFrame:", v20, v21, segmentLengthInPixels * (double)v25, segmentThickness);
  blurredSegment = self->_blurredSegment;
  if (v25)
  {
    objc_msgSend(v23, "addObject:", blurredSegment);
    if (v25 > 2)
      goto LABEL_18;
  }
  else
  {
    objc_msgSend(v24, "addObject:", blurredSegment);
  }
  for (i = v25; i != 3; ++i)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", i);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v32, "isHidden") & 1) == 0)
      objc_msgSend(v24, "addObject:", v32);

  }
LABEL_18:
  v88.size.width = v27 - v20;
  v88.size.height = self->_segmentThickness;
  v88.origin.x = v20;
  v88.origin.y = v21;
  v89 = CGRectInset(v88, -self->_segmentBorderWidth, -self->_segmentBorderWidth);
  x = v89.origin.x;
  y = v89.origin.y;
  width = v89.size.width;
  height = v89.size.height;
  v90 = CGRectInset(v89, -self->_segmentBorderWidth, -self->_segmentBorderWidth);
  v37 = v90.origin.x;
  v38 = v90.origin.y;
  v39 = v90.size.width;
  v40 = v90.size.height;
  -[UIView setFrame:](self->_displayedOutline, "setFrame:", x, y, width, height);
  -[UIView setFrame:](self->_displayedWhiteOutline, "setFrame:", v37, v38, v39, v40);
  -[MKScaleView mapView](self, "mapView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "mapType");
  if ((unint64_t)(v42 - 1) < 4
    || v42 == 107
    || (v46 = -[MKScaleView mapType](self, "mapType"), v46 - 1 < 4)
    || v46 == 107)
  {

    objc_msgSend(v23, "addObject:", self->_displayedWhiteOutline);
    -[UIView layer](self->_displayedWhiteOutline, "layer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setCornerRadius:", v40 * 0.5);
  }

  oldNumberOfSegments = self->_oldNumberOfSegments;
  if (!oldNumberOfSegments)
  {
    self->_oldNumberOfSegments = v25;
    oldNumberOfSegments = v25;
  }
  if (v25 != oldNumberOfSegments)
  {
    objc_msgSend(v23, "addObject:", self->_displayedOutline);
    self->_oldNumberOfSegments = v25;
  }
  if (v25)
  {
    v44 = self->_segmentThickness * 0.5;
    if (v25 == 1)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "_setCornerRadius:continuous:maskedCorners:", 1, 15, v44);

    }
    else
    {
      for (j = 0; j != v25; ++j)
      {
        if (v25 - 1 == j)
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", v25 - 1);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = v48;
          v50 = v44;
          v51 = 1;
          v52 = 10;
        }
        else
        {
          segments = self->_segments;
          if (j)
          {
            -[NSMutableArray objectAtIndexedSubscript:](segments, "objectAtIndexedSubscript:", j);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = v48;
            v50 = 0.0;
            v51 = 0;
            v52 = 0;
          }
          else
          {
            -[NSMutableArray objectAtIndexedSubscript:](segments, "objectAtIndexedSubscript:", 0);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = v48;
            v50 = v44;
            v51 = 1;
            v52 = 5;
          }
        }
        objc_msgSend(v48, "_setCornerRadius:continuous:maskedCorners:", v51, v52, v50);

      }
    }
  }
  -[UIView layer](self->_displayedOutline, "layer");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setCornerRadius:", height * 0.5);

  -[UIView layer](self->_displayedWhiteOutline, "layer");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setCornerRadius:", v40 * 0.5);

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v56 = v23;
  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
  if (v57)
  {
    v58 = v57;
    v59 = *(_QWORD *)v73;
    do
    {
      for (k = 0; k != v58; ++k)
      {
        if (*(_QWORD *)v73 != v59)
          objc_enumerationMutation(v56);
        v61 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * k);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v61, "setHidden:", 0);
      }
      v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
    }
    while (v58);
  }

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v62 = v24;
  v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
  if (v63)
  {
    v64 = v63;
    v65 = *(_QWORD *)v69;
    do
    {
      for (m = 0; m != v64; ++m)
      {
        if (*(_QWORD *)v69 != v65)
          objc_enumerationMutation(v62);
        v67 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * m);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v67, "setHidden:", 1, (_QWORD)v68);
      }
      v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
    }
    while (v64);
  }

}

- (id)_formattedStringForFloat:(double)a3
{
  NSNumberFormatter *floatNumberFormatter;
  void *v4;
  void *v5;

  floatNumberFormatter = self->_floatNumberFormatter;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumberFormatter stringFromNumber:](floatNumberFormatter, "stringFromNumber:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_scaleViewFormattedStringForFloat:(double)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_formattedNumberCache, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[MKScaleView _formattedStringForFloat:](self, "_formattedStringForFloat:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_formattedNumberCache, "setObject:forKeyedSubscript:", v6, v5);
  }

  return v6;
}

- (id)_scaleViewFormattedStringForInteger:(int64_t)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_formattedNumberCache, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_formattedStringForInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_formattedNumberCache, "setObject:forKeyedSubscript:", v6, v5);
  }

  return v6;
}

- (void)_localizedDistanceStringsWithMeters:(unsigned int)a3 imperial:(double)a4 useFeet:(BOOL)a5 inMetric:(BOOL)a6 displaysYardsForShortDistances:(BOOL)a7 strings:(id)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  double v14;
  void *v15;
  int *v16;
  id v17;

  v8 = a7;
  v9 = a6;
  v14 = (double)a3;
  v17 = a8;
  objc_msgSend(v17, "removeAllObjects");
  if (v9)
  {
    if (a3 < 0x1F5)
    {
      -[MKScaleView _scaleViewFormattedStringForInteger:](self, "_scaleViewFormattedStringForInteger:", a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = &OBJC_IVAR___MKScaleView__metersAbbreviation;
    }
    else
    {
      -[MKScaleView _scaleViewFormattedStringForFloat:](self, "_scaleViewFormattedStringForFloat:", v14 / 1000.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = &OBJC_IVAR___MKScaleView__kilometersAbbreviation;
    }
  }
  else if ((a4 <= 0.95 || a4 > 1.05 || a5) && (a4 < 0.1 || a5))
  {
    if (v8)
    {
      -[MKScaleView _scaleViewFormattedStringForInteger:](self, "_scaleViewFormattedStringForInteger:", llround(v14 * 1.0936133));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = &OBJC_IVAR___MKScaleView__yardAbbreviation;
    }
    else
    {
      -[MKScaleView _scaleViewFormattedStringForInteger:](self, "_scaleViewFormattedStringForInteger:", llround(a4));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = &OBJC_IVAR___MKScaleView__feetAbbreviation;
    }
  }
  else
  {
    -[MKScaleView _scaleViewFormattedStringForFloat:](self, "_scaleViewFormattedStringForFloat:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = &OBJC_IVAR___MKScaleView__milesAbbreviation;
  }
  objc_msgSend(v17, "addObject:", v15);

  objc_msgSend(v17, "addObject:", *(Class *)((char *)&self->super.super.super.isa + *v16));
}

- (MKMapView)mapView
{
  return (MKMapView *)objc_loadWeakRetained((id *)&self->_mapView);
}

- (MKFeatureVisibility)scaleVisibility
{
  return self->_scaleVisibility;
}

- (MKScaleViewAlignment)legendAlignment
{
  return self->_legendAlignment;
}

- (BOOL)usedInternallyByMapView
{
  return self->_usedInternallyByMapView;
}

- (void)setUsedInternallyByMapView:(BOOL)a3
{
  self->_usedInternallyByMapView = a3;
}

- (unint64_t)mapType
{
  return self->_mapType;
}

- (void)setMapType:(unint64_t)a3
{
  self->_mapType = a3;
}

- (unint64_t)_controlSize
{
  return self->_controlSize;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);
  objc_storeStrong((id *)&self->_useLightText, 0);
  objc_storeStrong((id *)&self->_kilometersAbbreviation, 0);
  objc_storeStrong((id *)&self->_metersAbbreviation, 0);
  objc_storeStrong((id *)&self->_milesAbbreviation, 0);
  objc_storeStrong((id *)&self->_yardAbbreviation, 0);
  objc_storeStrong((id *)&self->_feetAbbreviation, 0);
  objc_storeStrong((id *)&self->_formattedNumberCache, 0);
  objc_storeStrong((id *)&self->_displayedWhiteOutline, 0);
  objc_storeStrong((id *)&self->_displayedOutline, 0);
  objc_storeStrong((id *)&self->_unitsView, 0);
  objc_storeStrong((id *)&self->_blurredSegment, 0);
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_borderColorSatellite, 0);
  objc_storeStrong((id *)&self->_borderColorRegular, 0);
  objc_storeStrong((id *)&self->_floatNumberFormatter, 0);
}

@end
