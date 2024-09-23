@implementation EKEventMapDetailItem

- (void)updateViewColors
{
  void *v3;
  id v4;
  id v5;
  id v6;

  -[UIView layer](self->_loadingView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setBorderColor:", objc_msgSend(v4, "CGColor"));

  -[UIView layer](self->_loadingView, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "setBackgroundColor:", objc_msgSend(v5, "CGColor"));

}

- (void)reset
{
  EKEventMapCell *cell;

  objc_storeStrong((id *)&self->_oldCell, self->_cell);
  cell = self->_cell;
  self->_cell = 0;

}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5
{
  _BOOL4 v6;
  double result;
  double v8;

  v6 = -[EKEventMapDetailItem _shouldShowMapView](self, "_shouldShowMapView", a3, a5, a4);
  result = 0.0;
  if (v6)
  {
    -[EKEventMapDetailItem _mapHeight](self, "_mapHeight", 0.0);
    return v8 + 16.0 + 25.0;
  }
  return result;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  EKEventMapCell **p_cell;
  EKEventMapCell *oldCell;
  CLLocation *location;
  void *v7;
  void *v8;
  double v9;
  double v10;

  p_cell = &self->_cell;
  if (!self->_cell)
  {
    oldCell = self->_oldCell;
    if (!oldCell)
      goto LABEL_6;
    location = self->_location;
    if (!location)
      goto LABEL_6;
    -[EKEvent preferredLocation](self->super._event, "preferredLocation", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "geoLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLLocation distanceFromLocation:](location, "distanceFromLocation:", v8);
    v10 = v9;

    oldCell = self->_oldCell;
    if (v10 < 2.0)
    {
      objc_storeStrong((id *)p_cell, oldCell);
    }
    else
    {
LABEL_6:
      self->_oldCell = 0;

      -[EKEventMapDetailItem _setupCell](self, "_setupCell");
    }
  }
  return *p_cell;
}

- (BOOL)_shouldShowMapView
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[EKEvent preferredLocation](self->super._event, "preferredLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "geoLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[EKEvent preferredLocation](self->super._event, "preferredLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isPrediction") ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)_setupCell
{
  if (-[EKEventMapDetailItem _shouldShowMapView](self, "_shouldShowMapView"))
    -[EKEventMapDetailItem _setupCellWithMapView](self, "_setupCellWithMapView");
  else
    -[EKEventMapDetailItem _setupCellAsEmpty](self, "_setupCellAsEmpty");
}

- (void)_setupCellWithMapView
{
  EKEventMapCell *cell;
  EKEventMapCell *v4;
  EKEventMapCell *v5;
  void *v6;
  CLLocation *v7;
  CLLocation *location;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  MKMapItemView *v14;
  MKMapItemView *mapView;
  UIView *v16;
  UIView *loadingView;
  void *v18;
  void *v19;
  void *v20;
  NSArray *v21;
  NSArray *mapViewConstraints;
  NSArray *v23;
  NSArray *loadingViewConstraints;

  cell = self->_cell;
  if (!cell)
    goto LABEL_4;
  if (!-[EKEventMapCell setupAsEmptyView](cell, "setupAsEmptyView"))
    return;
  if (!self->_cell)
  {
LABEL_4:
    v4 = -[EKEventMapCell initWithStyle:reuseIdentifier:]([EKEventMapCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    v5 = self->_cell;
    self->_cell = v4;

    -[EKEventMapCell setDrawingEnabled:](self->_cell, "setDrawingEnabled:", 1);
    -[EKEventMapCell setSelectionStyle:](self->_cell, "setSelectionStyle:", 0);
    -[EKEventMapCell setDetailItem:](self->_cell, "setDetailItem:", self);
  }
  -[EKEvent preferredLocation](self->super._event, "preferredLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "geoLocation");
  v7 = (CLLocation *)objc_claimAutoreleasedReturnValue();
  location = self->_location;
  self->_location = v7;

  v9 = objc_alloc((Class)EKWeakLinkClass());
  v10 = *MEMORY[0x1E0C9D648];
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v14 = (MKMapItemView *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], v11, v12, v13);
  mapView = self->_mapView;
  self->_mapView = v14;

  -[MKMapItemView setTranslatesAutoresizingMaskIntoConstraints:](self->_mapView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKMapItemView setShouldShowBorders:](self->_mapView, "setShouldShowBorders:", 1);
  v16 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v10, v11, v12, v13);
  loadingView = self->_loadingView;
  self->_loadingView = v16;

  -[UIView layer](self->_loadingView, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setCornerRadius:", 8.0);

  -[UIView layer](self->_loadingView, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBorderWidth:", 1.0 / EKUIScaleFactor());

  -[UIView layer](self->_loadingView, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setMasksToBounds:", 1);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_loadingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[EKEventMapDetailItem updateViewColors](self, "updateViewColors");
  -[EKEventMapCell addSubview:](self->_cell, "addSubview:", self->_mapView);
  -[EKEventMapCell addSubview:](self->_cell, "addSubview:", self->_loadingView);
  -[MKMapItemView setAlpha:](self->_mapView, "setAlpha:", 0.0);
  -[EKEventMapDetailItem _mapRelatedViewConstraintsForMapRelatedView:inCell:](self, "_mapRelatedViewConstraintsForMapRelatedView:inCell:", self->_mapView, self->_cell);
  v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
  mapViewConstraints = self->_mapViewConstraints;
  self->_mapViewConstraints = v21;

  -[EKEventMapDetailItem _mapRelatedViewConstraintsForMapRelatedView:inCell:](self, "_mapRelatedViewConstraintsForMapRelatedView:inCell:", self->_loadingView, self->_cell);
  v23 = (NSArray *)objc_claimAutoreleasedReturnValue();
  loadingViewConstraints = self->_loadingViewConstraints;
  self->_loadingViewConstraints = v23;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_mapViewConstraints);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_loadingViewConstraints);
  -[EKEventMapCell setSetupAsEmptyView:](self->_cell, "setSetupAsEmptyView:", 0);
  self->_animationHasRan = 0;
  -[EKEventMapCell setMapViewSetup:](self->_cell, "setMapViewSetup:", 0);
}

- (void)_setupCellAsEmpty
{
  EKEventMapCell *cell;
  EKEventMapCell *v4;
  EKEventMapCell *v5;
  CLLocation *location;
  MKMapItemView *mapView;
  UIView *loadingView;
  NSArray *mapViewConstraints;
  NSArray *loadingViewConstraints;

  cell = self->_cell;
  if (!cell)
    goto LABEL_4;
  if (-[EKEventMapCell setupAsEmptyView](cell, "setupAsEmptyView"))
    return;
  if (!self->_cell)
  {
LABEL_4:
    v4 = -[EKEventMapCell initWithStyle:reuseIdentifier:]([EKEventMapCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    v5 = self->_cell;
    self->_cell = v4;

    -[EKEventMapCell setDrawingEnabled:](self->_cell, "setDrawingEnabled:", 1);
    -[EKEventMapCell setSelectionStyle:](self->_cell, "setSelectionStyle:", 0);
    -[EKEventMapCell setDetailItem:](self->_cell, "setDetailItem:", self);
  }
  location = self->_location;
  self->_location = 0;

  -[MKMapItemView removeFromSuperview](self->_mapView, "removeFromSuperview");
  mapView = self->_mapView;
  self->_mapView = 0;

  -[UIView removeFromSuperview](self->_loadingView, "removeFromSuperview");
  loadingView = self->_loadingView;
  self->_loadingView = 0;

  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_mapViewConstraints);
  mapViewConstraints = self->_mapViewConstraints;
  self->_mapViewConstraints = 0;

  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_loadingViewConstraints);
  loadingViewConstraints = self->_loadingViewConstraints;
  self->_loadingViewConstraints = 0;

  -[EKEventMapCell setSetupAsEmptyView:](self->_cell, "setSetupAsEmptyView:", 1);
  self->_animationHasRan = 0;
  -[EKEventMapCell setMapViewSetup:](self->_cell, "setMapViewSetup:", 0);
}

- (id)_mapRelatedViewConstraintsForMapRelatedView:(id)a3 inCell:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3718];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 3, 0, v7, 3, 1.0, 16.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 4, 0, v7, 4, 1.0, -25.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventMapDetailItem _mapHeight](self, "_mapHeight");
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 8, 0, 0, 0, 1.0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 5, 0, v7, 17, 1.0, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 6, 0, v7, 18, 1.0, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v9;
  v17[1] = v10;
  v17[2] = v12;
  v17[3] = v13;
  v17[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)setupMapView
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[MKMapItemView setAlpha:](self->_mapView, "setAlpha:", 0.0);
  -[UIView setAlpha:](self->_loadingView, "setAlpha:", 1.0);
  -[EKEvent preferredLocation](self->super._event, "preferredLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)EKWeakLinkClass();
  objc_msgSend(v3, "mapKitHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = kEKUILogHandle;
  v7 = os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      v8 = v6;
      objc_msgSend(v3, "mapKitHandle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v9;
      _os_log_impl(&dword_1AF84D000, v8, OS_LOG_TYPE_INFO, "Found mapKitHandle, loading MKMapItemView with mapKitHandle: %@", buf, 0xCu);

    }
    objc_msgSend(v3, "mapKitHandle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __36__EKEventMapDetailItem_setupMapView__block_invoke;
    v13[3] = &unk_1E601C378;
    v15 = v4;
    v13[4] = self;
    v14 = v3;
    objc_msgSend(v4, "_mapItemFromHandle:completionHandler:", v10, v13);

  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_INFO, "Did not find mapKitHandle, falling back to load MKMapItemView with geoLocation", buf, 2u);
    }
    v11 = (void *)objc_msgSend(objc_alloc((Class)v4), "initWithCLLocation:", self->_location);
    objc_msgSend(v3, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setName:", v12);

    -[EKEventMapDetailItem _loadMapItem:](self, "_loadMapItem:", v11);
  }

}

void __36__EKEventMapDetailItem_setupMapView__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      objc_msgSend(v6, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v9;
      v17 = 2048;
      v18 = objc_msgSend(v6, "code");
      _os_log_impl(&dword_1AF84D000, v8, OS_LOG_TYPE_ERROR, "Received error while recreating mapItem from mapKitHandle: %@ - %ld. Falling back to load MKMapItemView with geoLocation.", buf, 0x16u);

    }
    v10 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 48)), "initWithCLLocation:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));

    objc_msgSend(*(id *)(a1 + 40), "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setName:", v11);

    v5 = v10;
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __36__EKEventMapDetailItem_setupMapView__block_invoke_49;
  v13[3] = &unk_1E6018EC0;
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v5;
  v12 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

}

uint64_t __36__EKEventMapDetailItem_setupMapView__block_invoke_49(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadMapItem:", *(_QWORD *)(a1 + 40));
}

- (void)_loadMapItem:(id)a3
{
  MKMapItemView *mapView;
  _QWORD v4[5];

  mapView = self->_mapView;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__EKEventMapDetailItem__loadMapItem___block_invoke;
  v4[3] = &unk_1E601C3A0;
  v4[4] = self;
  -[MKMapItemView loadMapItem:completionHandler:](mapView, "loadMapItem:completionHandler:", a3, v4);
}

void __37__EKEventMapDetailItem__loadMapItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  double v8;
  _QWORD v9[5];
  _QWORD v10[4];
  uint64_t v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v3;
      _os_log_impl(&dword_1AF84D000, v4, OS_LOG_TYPE_ERROR, "Received error while loading MKMapItemView: %@", buf, 0xCu);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setCurrentlyLoading:", 0);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setNeedsLayout");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "layoutIfNeeded");
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "noninteractivePlatterMode");

      v8 = 0.3;
      if (v7)
        v8 = 0.0;
    }
    else
    {

      v8 = 0.3;
    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __37__EKEventMapDetailItem__loadMapItem___block_invoke_55;
    v10[3] = &unk_1E6018688;
    v11 = *(_QWORD *)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __37__EKEventMapDetailItem__loadMapItem___block_invoke_2;
    v9[3] = &unk_1E6018638;
    v9[4] = v11;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v10, v9, v8);
  }

}

uint64_t __37__EKEventMapDetailItem__loadMapItem___block_invoke_55(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setAlpha:", 1.0);
}

void __37__EKEventMapDetailItem__loadMapItem___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setCurrentlyLoading:", 0);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) == 0)
      return;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventDetailsScrollView");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventDetailsViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_animateMapIfNeededWithPresentingController:presentingView:", v6, v7);
  }

}

- (double)_mapHeight
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  double Width;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double result;
  int v15;
  void *v16;
  uint64_t v17;
  CGRect v18;

  v17 = *MEMORY[0x1E0C80C00];
  -[EKEventDetailItem delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[EKEventDetailItem delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventDetailsScrollView");
    v6 = objc_claimAutoreleasedReturnValue();

    -[NSObject bounds](v6, "bounds");
    Width = CGRectGetWidth(v18);
    -[NSObject layoutMargins](v6, "layoutMargins");
    v9 = Width - v8;
    -[NSObject layoutMargins](v6, "layoutMargins");
    v11 = (v9 - v10) * 0.4;
LABEL_5:

    goto LABEL_6;
  }
  v12 = (void *)kEKUILogHandle;
  v11 = 0.0;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    v6 = v12;
    -[EKEventDetailItem delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v13;
    _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_ERROR, "Delegate [%@] does not respond to eventDetailsScrollView, so setting map height to 0.", (uint8_t *)&v15, 0xCu);

    goto LABEL_5;
  }
LABEL_6:
  CalRoundToScreenScale(v11);
  return result;
}

- (void)_animateMapIfNeededWithPresentingController:(id)a3 presentingView:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  MKMapItemView *mapView;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  double Height;
  double v33;
  NSObject *v34;
  int v35;
  double v36;
  uint64_t v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!self->_animationHasRan && !-[EKEventMapCell currentlyLoading](self->_cell, "currentlyLoading"))
  {
    objc_msgSend(v7, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    mapView = self->_mapView;
    -[MKMapItemView bounds](mapView, "bounds");
    -[MKMapItemView convertRect:toView:](mapView, "convertRect:toView:", v7);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    objc_msgSend(v6, "navigationController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "toolbar");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "bounds");
    objc_msgSend(v26, "convertRect:toView:", v7);
    v27 = CGRectGetMinY(v38) - v11;
    if (v27 >= v15)
      v28 = v15;
    else
      v28 = v27;
    v29 = v9;
    v30 = v11;
    v31 = v13;
    v41.origin.x = v18;
    v41.origin.y = v20;
    v41.size.width = v22;
    v41.size.height = v24;
    v39 = CGRectIntersection(*(CGRect *)(&v28 - 3), v41);
    Height = CGRectGetHeight(v39);
    v40.origin.x = v18;
    v40.origin.y = v20;
    v40.size.width = v22;
    v40.size.height = v24;
    v33 = Height / CGRectGetHeight(v40);
    if (v33 >= 0.75)
    {
      v34 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
      {
        v35 = 134217984;
        v36 = v33;
        _os_log_impl(&dword_1AF84D000, v34, OS_LOG_TYPE_DEBUG, "Triggering MapItemView animation with cell percent visible: %f", (uint8_t *)&v35, 0xCu);
      }
      self->_animationHasRan = 1;
      -[MKMapItemView triggerAnimation](self->_mapView, "triggerAnimation");
    }

  }
}

- (BOOL)hasMapItemLaunchOptionFromTimeToLeaveNotification
{
  return self->_hasMapItemLaunchOptionFromTimeToLeaveNotification;
}

- (void)setHasMapItemLaunchOptionFromTimeToLeaveNotification:(BOOL)a3
{
  self->_hasMapItemLaunchOptionFromTimeToLeaveNotification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_loadingViewConstraints, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_mapViewConstraints, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_oldCell, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
