@implementation NTKSwissWorldClockComplicationGraphicRectangularView

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0C94130], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKSwissWorldClockComplicationGraphicRectangularView timeUpdateToken](self, "timeUpdateToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopUpdatesForToken:", v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKSwissWorldClockComplicationGraphicRectangularView significantTimeChangeObserver](self, "significantTimeChangeObserver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v6);

  v7.receiver = self;
  v7.super_class = (Class)NTKSwissWorldClockComplicationGraphicRectangularView;
  -[NTKSwissWorldClockComplicationGraphicRectangularView dealloc](&v7, sel_dealloc);
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
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  NTKWorldClockMapLocationView *v26;
  void *v27;
  float v28;
  double v29;
  float v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  objc_super v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v59.receiver = self;
  v59.super_class = (Class)NTKSwissWorldClockComplicationGraphicRectangularView;
  -[NTKSwissWorldClockComplicationGraphicRectangularView layoutSubviews](&v59, sel_layoutSubviews);
  -[NTKSwissWorldClockComplicationGraphicRectangularView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NTKSwissWorldClockComplicationGraphicRectangularView locationViews](self, "locationViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  if (!-[NTKSwissWorldClockComplicationGraphicRectangularView isPrivacy](self, "isPrivacy"))
  {
    -[NTKSwissWorldClockComplicationGraphicRectangularView cities](self, "cities");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      -[NTKSwissWorldClockComplicationGraphicRectangularView device](self, "device");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      _LayoutConstants_18(v14);
      v16 = v15;

      v17 = (void *)MEMORY[0x1E0C99DE8];
      -[NTKSwissWorldClockComplicationGraphicRectangularView cities](self, "cities");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "arrayWithCapacity:", objc_msgSend(v18, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      -[NTKSwissWorldClockComplicationGraphicRectangularView cities](self, "cities", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v56;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v56 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
            v26 = -[NTKWorldClockMapLocationView initWithFrame:]([NTKWorldClockMapLocationView alloc], "initWithFrame:", 0.0, 0.0, v16, v16);
            objc_msgSend(v19, "addObject:", v26);
            -[NTKSwissWorldClockComplicationGraphicRectangularView addSubview:](self, "addSubview:", v26);
            objc_msgSend(v25, "alCity");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "latitude");
            v29 = v28;
            objc_msgSend(v27, "longitude");
            v31 = v30;

            -[NTKSwissWorldClockComplicationGraphicRectangularView _locationMarkerOffsetForCoordinate:](self, "_locationMarkerOffsetForCoordinate:", v29, v31);
            -[NTKWorldClockMapLocationView positionAtPoint:withinBounds:](v26, "positionAtPoint:withinBounds:", NTKWorldClock_MapPointForLocationOnMap(v29, v31, v8, v10, v32));

          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
        }
        while (v22);
      }

      v33 = (void *)objc_msgSend(v19, "copy");
      -[NTKSwissWorldClockComplicationGraphicRectangularView setLocationViews:](self, "setLocationViews:", v33);

    }
  }
  if (!-[NTKSwissWorldClockComplicationGraphicRectangularView isPrivacy](self, "isPrivacy")
    && (-[NTKSwissWorldClockComplicationGraphicRectangularView cityLatitude](self, "cityLatitude"),
        (v34 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v35 = (void *)v34,
        -[NTKSwissWorldClockComplicationGraphicRectangularView cityLongitude](self, "cityLongitude"),
        v36 = (void *)objc_claimAutoreleasedReturnValue(),
        v36,
        v35,
        v36))
  {
    -[NTKSwissWorldClockComplicationGraphicRectangularView cityLatitude](self, "cityLatitude");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "doubleValue");
    v39 = v38;

    -[NTKSwissWorldClockComplicationGraphicRectangularView cityLongitude](self, "cityLongitude");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "doubleValue");
    v42 = v41;

    -[NTKSwissWorldClockComplicationGraphicRectangularView _locationMarkerOffsetForCoordinate:](self, "_locationMarkerOffsetForCoordinate:", v39, v42);
    v44 = NTKWorldClock_MapPointForLocationOnMap(v39, v42, v8, v10, v43);
    v46 = v45;
    -[NTKSwissWorldClockComplicationGraphicRectangularView highlightedLocationView](self, "highlightedLocationView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "positionAtPoint:withinBounds:", v44, v46, v4, v6, v8, v10);

    -[NTKSwissWorldClockComplicationGraphicRectangularView highlightedLocationView](self, "highlightedLocationView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKSwissWorldClockComplicationGraphicRectangularView bringSubviewToFront:](self, "bringSubviewToFront:", v48);

    -[NTKSwissWorldClockComplicationGraphicRectangularView highlightedLocationView](self, "highlightedLocationView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v49;
    v51 = 0;
  }
  else
  {
    -[NTKSwissWorldClockComplicationGraphicRectangularView highlightedLocationView](self, "highlightedLocationView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v49;
    v51 = 1;
  }
  objc_msgSend(v49, "setHidden:", v51);

  -[NTKSwissWorldClockComplicationGraphicRectangularView mapView](self, "mapView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setFrame:", v4, v6, v8, v10);

  -[NTKSwissWorldClockComplicationGraphicRectangularView nightMaskView](self, "nightMaskView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setFrame:", v4, v6, v8, v10);

  if (self->_showGossamerUI)
  {
    -[NTKSwissWorldClockComplicationGraphicRectangularView terminatorView](self, "terminatorView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setFrame:", v4, v6, v8, v10);

  }
  -[NTKSwissWorldClockComplicationGraphicRectangularView _updateNightMaskImage](self, "_updateNightMaskImage");
}

- (CGPoint)_locationMarkerOffsetForCoordinate:(id)a3
{
  double var1;
  double var0;
  double v5;
  double v6;
  CGPoint result;

  var1 = a3.var1;
  var0 = a3.var0;
  v5 = -1.5;
  v6 = 0.5;
  if (var1 > 0.0)
  {
    v6 = var1 * -10.0 / 180.0;
    if (var0 < 0.0)
      v5 = var0 * -10.0 / 90.0;
  }
  result.y = v5;
  result.x = v6;
  return result;
}

- (void)_reloadCities
{
  void *v3;
  void *v4;
  id v5;

  +[NTKWorldClockManager sharedManager](NTKWorldClockManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadCities");

  +[NTKWorldClockManager sharedManager](NTKWorldClockManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cities");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[NTKSwissWorldClockComplicationGraphicRectangularView setCities:](self, "setCities:", v5);
}

- (void)_updateNightMaskImage
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _BOOL4 showGossamerUI;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;

  if (-[NTKSwissWorldClockComplicationGraphicRectangularView isPrivacy](self, "isPrivacy")
    || (-[NTKSwissWorldClockComplicationGraphicRectangularView overrideDate](self, "overrideDate"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[NTKSwissWorldClockComplicationGraphicRectangularView overrideDate](self, "overrideDate");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[NTKSwissWorldClockComplicationGraphicRectangularView shouldShowIdealizedTime](self, "shouldShowIdealizedTime"))
    {
      NTKIdealizedDate();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C944A0], "complicationDate");
    }
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (id)v4;
  -[NTKSwissWorldClockComplicationGraphicRectangularView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  showGossamerUI = self->_showGossamerUI;
  -[NTKSwissWorldClockComplicationGraphicRectangularView nightMask](self, "nightMask");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NTKSwissWorldClockComplicationGraphicRectangularView _shouldGenerate:date:](self, "_shouldGenerate:date:", v10, v28);

  if (showGossamerUI)
  {
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "ntk_gossamer_nightMaskForDate:size:", v28, v6, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKSwissWorldClockComplicationGraphicRectangularView setNightMask:](self, "setNightMask:", v12);
      -[NTKSwissWorldClockComplicationGraphicRectangularView terminatorView](self, "terminatorView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "subviews");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "makeObjectsPerformSelector:", sel_removeFromSuperview);

      objc_msgSend(MEMORY[0x1E0DC3F10], "ntk_gossamer_terminatorViewForDate:size:", v28, v6, v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKSwissWorldClockComplicationGraphicRectangularView terminatorView](self, "terminatorView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addSubview:", v15);

      -[NTKSwissWorldClockComplicationGraphicRectangularView nightMask](self, "nightMask");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKSwissWorldClockComplicationGraphicRectangularView nightMaskView](self, "nightMaskView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setImage:", v17);

      -[NTKSwissWorldClockComplicationGraphicRectangularView setGeneratedDate:](self, "setGeneratedDate:", v28);
      goto LABEL_10;
    }
  }
  else if (v11)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "ntk_pregossamer_nightMaskForDate:size:", v28, v6, v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKSwissWorldClockComplicationGraphicRectangularView setNightMask:](self, "setNightMask:", v19);

    -[NTKSwissWorldClockComplicationGraphicRectangularView setGeneratedDate:](self, "setGeneratedDate:", v28);
  }
  -[NTKSwissWorldClockComplicationGraphicRectangularView nightMask](self, "nightMask");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKSwissWorldClockComplicationGraphicRectangularView nightMaskView](self, "nightMaskView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setImage:", v20);

LABEL_10:
  if (-[NTKSwissWorldClockComplicationGraphicRectangularView isPrivacy](self, "isPrivacy"))
  {
    -[NTKSwissWorldClockComplicationGraphicRectangularView mapView](self, "mapView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setMaskView:", 0);

    -[NTKSwissWorldClockComplicationGraphicRectangularView terminatorView](self, "terminatorView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = 1;
  }
  else
  {
    -[NTKSwissWorldClockComplicationGraphicRectangularView nightMaskView](self, "nightMaskView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKSwissWorldClockComplicationGraphicRectangularView mapView](self, "mapView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setMaskView:", v26);

    -[NTKSwissWorldClockComplicationGraphicRectangularView terminatorView](self, "terminatorView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = 0;
  }
  objc_msgSend(v23, "setHidden:", v25);

}

- (BOOL)_shouldGenerate:(id)a3 date:(id)a4
{
  id v5;
  BOOL v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;

  v5 = a3;
  if (-[NTKSwissWorldClockComplicationGraphicRectangularView isPrivacy](self, "isPrivacy"))
  {
    v6 = 0;
  }
  else
  {
    -[NTKSwissWorldClockComplicationGraphicRectangularView bounds](self, "bounds");
    v8 = v7;
    v10 = v9;
    -[NTKSwissWorldClockComplicationGraphicRectangularView generatedDate](self, "generatedDate");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v6 = 1;
    if (v5)
    {
      if (v11)
      {
        objc_msgSend(v5, "size");
        if (v8 == v14 && v10 == v13)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "timeIntervalSinceDate:", v12);
          v6 = v16 > 86400.0 / v8;

        }
      }
    }

  }
  return v6;
}

- (id)initFullColorImageViewWithDevice:(id)a3
{
  id v5;
  NTKSwissWorldClockComplicationGraphicRectangularView *v6;
  NTKSwissWorldClockComplicationGraphicRectangularView *v7;
  uint64_t v8;
  UIColor *tintColor;
  uint64_t v10;
  UIColor *strokeColor;
  id v12;
  void *v13;
  uint64_t v14;
  UIImageView *mapView;
  uint64_t v16;
  UIImageView *nightMaskView;
  int v18;
  uint64_t v19;
  UIView *terminatorView;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  CLKClockTimerToken *timeUpdateToken;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *significantTimeChangeObserver;
  UIColor *v34;
  UIColor *v35;
  NTKWorldClockHighlightedMapLocationView *v36;
  NTKWorldClockHighlightedMapLocationView *highlightedLocationView;
  _QWORD v39[4];
  id v40;
  _QWORD aBlock[4];
  id v42;
  id location;
  objc_super v44;

  v5 = a3;
  v44.receiver = self;
  v44.super_class = (Class)NTKSwissWorldClockComplicationGraphicRectangularView;
  v6 = -[NTKSwissWorldClockComplicationGraphicRectangularView initWithFrame:](&v44, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    objc_msgSend(MEMORY[0x1E0DC3658], "ntk_wc_sunYellowColor");
    v8 = objc_claimAutoreleasedReturnValue();
    tintColor = v7->_tintColor;
    v7->_tintColor = (UIColor *)v8;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v10 = objc_claimAutoreleasedReturnValue();
    strokeColor = v7->_strokeColor;
    v7->_strokeColor = (UIColor *)v10;

    v12 = objc_alloc(MEMORY[0x1E0DC3890]);
    NTKImageNamed(CFSTR("WCGraphicRectangularMap"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "initWithImage:", v13);
    mapView = v7->_mapView;
    v7->_mapView = (UIImageView *)v14;

    -[NTKSwissWorldClockComplicationGraphicRectangularView addSubview:](v7, "addSubview:", v7->_mapView);
    v16 = objc_opt_new();
    nightMaskView = v7->_nightMaskView;
    v7->_nightMaskView = (UIImageView *)v16;

    v18 = NTKShowGossamerUI(v5);
    v7->_showGossamerUI = v18;
    if (v18)
    {
      v19 = objc_opt_new();
      terminatorView = v7->_terminatorView;
      v7->_terminatorView = (UIView *)v19;

      -[NTKSwissWorldClockComplicationGraphicRectangularView addSubview:](v7, "addSubview:", v7->_terminatorView);
      -[UIImageView setMaskView:](v7->_mapView, "setMaskView:", v7->_nightMaskView);
    }
    else
    {
      -[NTKSwissWorldClockComplicationGraphicRectangularView addSubview:](v7, "addSubview:", v7->_nightMaskView);
    }
    v21 = _LayoutConstants_18(v5);
    v23 = v22;
    -[NTKSwissWorldClockComplicationGraphicRectangularView _reloadCities](v7, "_reloadCities");
    objc_initWeak(&location, v7);
    v24 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __89__NTKSwissWorldClockComplicationGraphicRectangularView_initFullColorImageViewWithDevice___block_invoke;
    aBlock[3] = &unk_1E6BCED08;
    objc_copyWeak(&v42, &location);
    v25 = _Block_copy(aBlock);
    objc_msgSend(MEMORY[0x1E0C94130], "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "startUpdatesWithUpdateFrequency:withHandler:identificationLog:", 0, v25, &__block_literal_global_75);
    v27 = objc_claimAutoreleasedReturnValue();
    timeUpdateToken = v7->_timeUpdateToken;
    v7->_timeUpdateToken = (CLKClockTimerToken *)v27;

    v39[0] = v24;
    v39[1] = 3221225472;
    v39[2] = __89__NTKSwissWorldClockComplicationGraphicRectangularView_initFullColorImageViewWithDevice___block_invoke_2;
    v39[3] = &unk_1E6BD35C0;
    objc_copyWeak(&v40, &location);
    v29 = _Block_copy(v39);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0DC4838], 0, v31, v29);
    v32 = objc_claimAutoreleasedReturnValue();
    significantTimeChangeObserver = v7->_significantTimeChangeObserver;
    v7->_significantTimeChangeObserver = v32;

    v34 = v7->_tintColor;
    v35 = v7->_strokeColor;
    v36 = -[NTKWorldClockHighlightedMapLocationView initWithFrame:fillColor:strokeColor:strokeWidth:]([NTKWorldClockHighlightedMapLocationView alloc], "initWithFrame:fillColor:strokeColor:strokeWidth:", v34, v35, 0.0, 0.0, v21, v21, v23);

    highlightedLocationView = v7->_highlightedLocationView;
    v7->_highlightedLocationView = v36;

    -[NTKSwissWorldClockComplicationGraphicRectangularView addSubview:](v7, "addSubview:", v7->_highlightedLocationView);
    objc_destroyWeak(&v40);

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __89__NTKSwissWorldClockComplicationGraphicRectangularView_initFullColorImageViewWithDevice___block_invoke(uint64_t a1, void *a2, id *a3)
{
  id WeakRetained;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateNightMaskImage");

}

const __CFString *__89__NTKSwissWorldClockComplicationGraphicRectangularView_initFullColorImageViewWithDevice___block_invoke_64()
{
  return CFSTR("NTKCityListManager");
}

void __89__NTKSwissWorldClockComplicationGraphicRectangularView_initFullColorImageViewWithDevice___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateNightMaskImage");

}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "metadata");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Latitude"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKSwissWorldClockComplicationGraphicRectangularView setCityLatitude:](self, "setCityLatitude:", v5);

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Longitude"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKSwissWorldClockComplicationGraphicRectangularView setCityLongitude:](self, "setCityLongitude:", v6);

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("OverrideDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKSwissWorldClockComplicationGraphicRectangularView setOverrideDate:](self, "setOverrideDate:", v7);

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ShowIdealizedTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKSwissWorldClockComplicationGraphicRectangularView setShowIdealizedTime:](self, "setShowIdealizedTime:", objc_msgSend(v8, "BOOLValue"));

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("IsPrivacy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKSwissWorldClockComplicationGraphicRectangularView setIsPrivacy:](self, "setIsPrivacy:", objc_msgSend(v9, "BOOLValue"));

  -[NTKSwissWorldClockComplicationGraphicRectangularView _updateNightMaskImage](self, "_updateNightMaskImage");
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[NTKSwissWorldClockComplicationGraphicRectangularView filterProvider](self, "filterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKSwissWorldClockComplicationGraphicRectangularView tintColor](self, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorForView:accented:", self, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CLKUIInterpolateBetweenColors();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKSwissWorldClockComplicationGraphicRectangularView highlightedLocationView](self, "highlightedLocationView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFillColor:", v8);

  objc_msgSend(v5, "colorForView:accented:", self, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CLKUIInterpolateBetweenColors();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKSwissWorldClockComplicationGraphicRectangularView highlightedLocationView](self, "highlightedLocationView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setStrokeColor:", v12);

  if (self->_showGossamerUI)
  {
    objc_msgSend(v5, "filtersForView:style:fraction:", self, 2, a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKSwissWorldClockComplicationGraphicRectangularView terminatorView](self, "terminatorView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFilters:", v14);

    objc_msgSend(v5, "filtersForView:style:fraction:", self, 0, a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKSwissWorldClockComplicationGraphicRectangularView mapView](self, "mapView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFilters:", v17);

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[NTKSwissWorldClockComplicationGraphicRectangularView locationViews](self, "locationViews", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v27 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "layer");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setFilters:", v17);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v22);
    }

  }
}

- (void)updateMonochromeColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[NTKSwissWorldClockComplicationGraphicRectangularView filterProvider](self, "filterProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorForView:accented:", self, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKSwissWorldClockComplicationGraphicRectangularView highlightedLocationView](self, "highlightedLocationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFillColor:", v4);

  objc_msgSend(v3, "colorForView:accented:", self, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKSwissWorldClockComplicationGraphicRectangularView highlightedLocationView](self, "highlightedLocationView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStrokeColor:", v6);

  if (self->_showGossamerUI)
  {
    objc_msgSend(v3, "filtersForView:style:", self, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKSwissWorldClockComplicationGraphicRectangularView terminatorView](self, "terminatorView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFilters:", v8);

    objc_msgSend(v3, "filtersForView:style:", self, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKSwissWorldClockComplicationGraphicRectangularView mapView](self, "mapView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFilters:", v11);

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[NTKSwissWorldClockComplicationGraphicRectangularView locationViews](self, "locationViews", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "layer");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setFilters:", v11);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v16);
    }

  }
}

- (CLKMonochromeFilterProvider)filterProvider
{
  return (CLKMonochromeFilterProvider *)objc_loadWeakRetained((id *)&self->_filterProvider);
}

- (void)setFilterProvider:(id)a3
{
  objc_storeWeak((id *)&self->_filterProvider, a3);
}

- (CLKDevice)device
{
  return self->_device;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (CLKClockTimerToken)timeUpdateToken
{
  return self->_timeUpdateToken;
}

- (void)setTimeUpdateToken:(id)a3
{
  objc_storeStrong((id *)&self->_timeUpdateToken, a3);
}

- (NSObject)significantTimeChangeObserver
{
  return self->_significantTimeChangeObserver;
}

- (void)setSignificantTimeChangeObserver:(id)a3
{
  objc_storeStrong((id *)&self->_significantTimeChangeObserver, a3);
}

- (UIImageView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
  objc_storeStrong((id *)&self->_mapView, a3);
}

- (UIImageView)nightMaskView
{
  return self->_nightMaskView;
}

- (void)setNightMaskView:(id)a3
{
  objc_storeStrong((id *)&self->_nightMaskView, a3);
}

- (UIView)terminatorView
{
  return self->_terminatorView;
}

- (void)setTerminatorView:(id)a3
{
  objc_storeStrong((id *)&self->_terminatorView, a3);
}

- (NTKWorldClockHighlightedMapLocationView)highlightedLocationView
{
  return self->_highlightedLocationView;
}

- (void)setHighlightedLocationView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedLocationView, a3);
}

- (NSArray)locationViews
{
  return self->_locationViews;
}

- (void)setLocationViews:(id)a3
{
  objc_storeStrong((id *)&self->_locationViews, a3);
}

- (NSDate)generatedDate
{
  return self->_generatedDate;
}

- (void)setGeneratedDate:(id)a3
{
  objc_storeStrong((id *)&self->_generatedDate, a3);
}

- (UIImage)nightMask
{
  return self->_nightMask;
}

- (void)setNightMask:(id)a3
{
  objc_storeStrong((id *)&self->_nightMask, a3);
}

- (NSNumber)cityLatitude
{
  return self->_cityLatitude;
}

- (void)setCityLatitude:(id)a3
{
  objc_storeStrong((id *)&self->_cityLatitude, a3);
}

- (NSNumber)cityLongitude
{
  return self->_cityLongitude;
}

- (void)setCityLongitude:(id)a3
{
  objc_storeStrong((id *)&self->_cityLongitude, a3);
}

- (NSArray)cities
{
  return self->_cities;
}

- (void)setCities:(id)a3
{
  objc_storeStrong((id *)&self->_cities, a3);
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (void)setOverrideDate:(id)a3
{
  objc_storeStrong((id *)&self->_overrideDate, a3);
}

- (BOOL)shouldShowIdealizedTime
{
  return self->_showIdealizedTime;
}

- (void)setShowIdealizedTime:(BOOL)a3
{
  self->_showIdealizedTime = a3;
}

- (BOOL)isPrivacy
{
  return self->_isPrivacy;
}

- (void)setIsPrivacy:(BOOL)a3
{
  self->_isPrivacy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_cities, 0);
  objc_storeStrong((id *)&self->_cityLongitude, 0);
  objc_storeStrong((id *)&self->_cityLatitude, 0);
  objc_storeStrong((id *)&self->_nightMask, 0);
  objc_storeStrong((id *)&self->_generatedDate, 0);
  objc_storeStrong((id *)&self->_locationViews, 0);
  objc_storeStrong((id *)&self->_highlightedLocationView, 0);
  objc_storeStrong((id *)&self->_terminatorView, 0);
  objc_storeStrong((id *)&self->_nightMaskView, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_significantTimeChangeObserver, 0);
  objc_storeStrong((id *)&self->_timeUpdateToken, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_filterProvider);
}

@end
