@implementation MKPlaceInlineMapViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (id)inlineMapWithMapItem:(id)a3 configuration:(id)a4
{
  id v5;
  id v6;
  MKPlaceInlineMapViewController *v7;
  double v8;
  double v9;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "_isMapItemTypeBrand") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "_coordinate");
    v7 = 0;
    if (v9 >= -180.0 && v9 <= 180.0 && v8 >= -90.0 && v8 <= 90.0)
      v7 = -[MKPlaceInlineMapViewController initWithMKMapItem:configuration:]([MKPlaceInlineMapViewController alloc], "initWithMKMapItem:configuration:", v5, v6);
  }

  return v7;
}

- (MKPlaceInlineMapViewController)initWithMKMapItem:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  MKPlaceInlineMapViewController *v9;
  MKPlaceInlineMapViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MKPlaceInlineMapViewController;
  v9 = -[MKPlaceInlineMapViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a4);
    objc_storeStrong((id *)&v10->_mapItem, a3);
    v10->_currentSize = (CGSize)*MEMORY[0x1E0C9D820];
  }

  return v10;
}

- (void)loadView
{
  _MKPlaceInlineMapContentView *v3;
  _BOOL8 v4;
  _BOOL8 v5;
  _MKPlaceInlineMapContentView *v6;
  id v7;

  v3 = [_MKPlaceInlineMapContentView alloc];
  v4 = -[MKPlaceInlineMapViewControllerConfiguration suppressLookAround](self->_configuration, "suppressLookAround");
  v5 = -[MKPlaceInlineMapViewControllerConfiguration showMapAttribution](self->_configuration, "showMapAttribution");
  -[MKPlaceInlineMapViewControllerConfiguration mapSnapshotAuditToken](self->_configuration, "mapSnapshotAuditToken");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[_MKPlaceInlineMapContentView initWithFrame:hideLookAroundView:showMapAttribution:mapSnapshotAuditToken:](v3, "initWithFrame:hideLookAroundView:showMapAttribution:mapSnapshotAuditToken:", v4, v5, v7, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MKPlaceInlineMapViewController setView:](self, "setView:", v6);

}

- (void)viewDidLoad
{
  _MKPlaceInlineMapContentView *v3;
  _MKPlaceInlineMapContentView *contentView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKPlaceInlineMapViewController;
  -[MKPlaceInlineMapViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[MKPlaceInlineMapViewController view](self, "view");
  v3 = (_MKPlaceInlineMapContentView *)objc_claimAutoreleasedReturnValue();
  contentView = self->_contentView;
  self->_contentView = v3;

  -[_MKUIViewControllerClickableRootView setTarget:action:](self->_contentView, "setTarget:action:", self, sel__handleTapOnMap);
  -[_MKPlaceInlineMapContentView setBottomHairlineHidden:](self->_contentView, "setBottomHairlineHidden:", self->_bottomHairlineHidden);
  if (self->_mapItem)
    -[MKPlaceInlineMapViewController _updateMap](self, "_updateMap");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKPlaceInlineMapViewController;
  -[MKPlaceInlineMapViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[MKPlaceInlineMapViewController _updateMapIfNeeded](self, "_updateMapIfNeeded");
}

- (void)setBottomHairlineHidden:(BOOL)a3
{
  _MKPlaceInlineMapContentView *contentView;

  self->_bottomHairlineHidden = a3;
  contentView = self->_contentView;
  if (contentView)
    -[_MKPlaceInlineMapContentView setBottomHairlineHidden:](contentView, "setBottomHairlineHidden:");
}

- (void)setMapItem:(id)a3
{
  MKMapItem *v5;
  int v6;
  MKMapItem *v7;

  v5 = (MKMapItem *)a3;
  if (self->_mapItem != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_mapItem, a3);
    v6 = -[MKPlaceInlineMapViewController isViewLoaded](self, "isViewLoaded");
    v5 = v7;
    if (v6)
    {
      -[_MKPlaceInlineMapContentView setMap:](self->_contentView, "setMap:", 0);
      -[MKPlaceInlineMapViewController _updateMap](self, "_updateMap");
      v5 = v7;
    }
  }

}

- (NSArray)visibleMapItems
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_mapItem;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)snapshot
{
  return -[_MKPlaceInlineMapContentView map](self->_contentView, "map");
}

- (void)_updateMapIfNeeded
{
  CGSize *p_currentSize;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double width;
  double height;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  CGFloat v19;
  CGFloat v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (self->_mapItem)
  {
    p_currentSize = &self->_currentSize;
    -[MKPlaceInlineMapViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v6 = v5;
    v8 = v7;
    width = p_currentSize->width;
    height = p_currentSize->height;

    if (width != v6 || height != v8)
    {
      MKGetMKPlaceInlineMapVCLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        -[MKPlaceInlineMapViewController view](self, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "frame");
        v15 = v14;
        -[MKPlaceInlineMapViewController view](self, "view");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "frame");
        v21 = 134218240;
        v22 = v15;
        v23 = 2048;
        v24 = v17;
        _os_log_impl(&dword_18B0B0000, v12, OS_LOG_TYPE_INFO, "Size Changed: %f x %f", (uint8_t *)&v21, 0x16u);

      }
      -[MKPlaceInlineMapViewController view](self, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "frame");
      p_currentSize->width = v19;
      p_currentSize->height = v20;

      -[MKPlaceInlineMapViewController _updateMap](self, "_updateMap");
    }
  }
}

- (void)_updateMap
{
  void *v3;
  char v4;

  -[MKPlaceInlineMapViewController mapItem](self, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_hasResolvablePartialInformation");

  if ((v4 & 1) == 0)
    -[MKPlaceInlineMapViewController updateInlineMapWithRefinedMapItems](self, "updateInlineMapWithRefinedMapItems");
}

- (void)updateInlineMapWithRefinedMapItems
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 1000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__MKPlaceInlineMapViewController_updateInlineMapWithRefinedMapItems__block_invoke;
  block[3] = &unk_1E20D7D98;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
}

uint64_t __68__MKPlaceInlineMapViewController_updateInlineMapWithRefinedMapItems__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateInlineMapWithRefinedMapItems");
}

- (void)_updateInlineMapWithRefinedMapItems
{
  NSObject *v3;
  MKMapItem *WeakRetained;
  BOOL v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  double v17;
  double v18;
  double latitudeDelta;
  double longitudeDelta;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  MKMapItem *mapItem;
  MKAnnotatedMapSnapshotter *v33;
  void *v34;
  MKAnnotatedMapSnapshotter *v35;
  MKAnnotatedMapSnapshotter *collectionSnapshotter;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  MKAnnotatedMapSnapshotter *v42;
  _QWORD v43[4];
  id v44;
  id location;
  _QWORD v46[4];
  id v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;
  MKMapRect v53;
  MKCoordinateRegion v54;

  v52 = *MEMORY[0x1E0C80C00];
  MKGetMKPlaceInlineMapVCLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_INFO, "Updating inline map.", buf, 2u);
  }

  if (self->_collectionSnapshotter)
    -[MKPlaceInlineMapViewController cancelSnapshotRequestIfNeeded](self, "cancelSnapshotRequestIfNeeded");
  WeakRetained = (MKMapItem *)objc_loadWeakRetained((id *)&self->_updatingInlineMapItem);
  v5 = WeakRetained == self->_mapItem;

  if (!v5)
  {
    -[MKPlaceInlineMapViewController visibleMapItems](self, "visibleMapItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") == 0;

    if (!v7)
    {
      -[MKPlaceInlineMapViewController visibleMapItems](self, "visibleMapItems");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_coordinate");
      v11 = v10;
      v13 = v12;

      if (v13 >= -180.0 && v13 <= 180.0 && v11 >= -90.0 && v11 <= 90.0)
      {
        objc_storeWeak((id *)&self->_updatingInlineMapItem, self->_mapItem);
        -[MKPlaceInlineMapViewController visibleMapItems](self, "visibleMapItems");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count") == 1;

        if (v15)
        {
          -[MKPlaceInlineMapViewController visibleMapItems](self, "visibleMapItems");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKPlaceInlineMapViewController _mapSize](self, "_mapSize");
          v53.origin.x = mapRectContainingMapItems(v16, v17, v18);
          v54 = MKCoordinateRegionForMapRect(v53);
          latitudeDelta = v54.span.latitudeDelta;
          longitudeDelta = v54.span.longitudeDelta;

          -[MKPlaceInlineMapViewController view](self, "view");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "layoutMargins");
          v23 = v22;
          v25 = v24;

          -[_MKPlaceInlineMapContentView bounds](self->_contentView, "bounds");
          v27 = v26;
          -[_MKPlaceInlineMapContentView mapViewHeight](self->_contentView, "mapViewHeight");
          v29 = v28;
          -[_MKPlaceInlineMapContentView mapItemView](self->_contentView, "mapItemView");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setFrame:", 0.0, 0.0, v27 - v23 - v25, v29);

          objc_initWeak((id *)buf, self);
          -[_MKPlaceInlineMapContentView mapItemView](self->_contentView, "mapItemView");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          mapItem = self->_mapItem;
          v46[0] = MEMORY[0x1E0C809B0];
          v46[1] = 3221225472;
          v46[2] = __69__MKPlaceInlineMapViewController__updateInlineMapWithRefinedMapItems__block_invoke;
          v46[3] = &unk_1E20D8D18;
          objc_copyWeak(&v47, (id *)buf);
          objc_msgSend(v31, "loadMapItem:coordinateSpan:completionHandler:", mapItem, v46, latitudeDelta, longitudeDelta);

          objc_destroyWeak(&v47);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          v33 = [MKAnnotatedMapSnapshotter alloc];
          -[MKPlaceInlineMapViewController visibleMapItems](self, "visibleMapItems");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKPlaceInlineMapViewController _mapSize](self, "_mapSize");
          v35 = -[MKAnnotatedMapSnapshotter initWithMapItems:mapSize:useSnapshotService:](v33, "initWithMapItems:mapSize:useSnapshotService:", v34, 1);
          collectionSnapshotter = self->_collectionSnapshotter;
          self->_collectionSnapshotter = v35;

          -[MKPlaceInlineMapViewController traitCollectionForSnapshot](self, "traitCollectionForSnapshot");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKAnnotatedMapSnapshotter setTraitCollection:](self->_collectionSnapshotter, "setTraitCollection:", v37);

          objc_initWeak(&location, self);
          MKGetMKPlaceInlineMapVCLog();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            -[MKPlaceInlineMapViewController _mapSize](self, "_mapSize");
            v40 = v39;
            -[MKPlaceInlineMapViewController _mapSize](self, "_mapSize");
            *(_DWORD *)buf = 134218240;
            v49 = v40;
            v50 = 2048;
            v51 = v41;
            _os_log_impl(&dword_18B0B0000, v38, OS_LOG_TYPE_INFO, "Proceeding for snapshot. Size: %f x %f", buf, 0x16u);
          }

          v42 = self->_collectionSnapshotter;
          v43[0] = MEMORY[0x1E0C809B0];
          v43[1] = 3221225472;
          v43[2] = __69__MKPlaceInlineMapViewController__updateInlineMapWithRefinedMapItems__block_invoke_11;
          v43[3] = &unk_1E20D8D40;
          objc_copyWeak(&v44, &location);
          -[MKAnnotatedMapSnapshotter startWithCompletionHandler:](v42, "startWithCompletionHandler:", v43);
          objc_destroyWeak(&v44);
          objc_destroyWeak(&location);
        }
      }
    }
  }
}

void __69__MKPlaceInlineMapViewController__updateInlineMapWithRefinedMapItems__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_storeWeak(WeakRetained + 122, 0);
    objc_msgSend(v3[121], "mapItemView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "triggerAnimation");

    WeakRetained = v3;
  }

}

void __69__MKPlaceInlineMapViewController__updateInlineMapWithRefinedMapItems__block_invoke_11(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id *WeakRetained;
  id *v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeWeak(WeakRetained + 122, 0);
    if (v5)
    {
      if (!a3)
      {
        MKGetMKPlaceInlineMapVCLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v10 = 138412290;
          v11 = 0;
          _os_log_impl(&dword_18B0B0000, v8, OS_LOG_TYPE_ERROR, "Snapshot Error: %@", (uint8_t *)&v10, 0xCu);
        }

        objc_msgSend(v5, "image");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_updateSnapshotImage:", v9);

      }
    }
  }

}

- (void)cancelSnapshotRequestIfNeeded
{
  MKAnnotatedMapSnapshotter *collectionSnapshotter;
  NSObject *v4;
  uint8_t v5[16];

  collectionSnapshotter = self->_collectionSnapshotter;
  if (collectionSnapshotter && -[MKAnnotatedMapSnapshotter isLoading](collectionSnapshotter, "isLoading"))
  {
    MKGetMKPlaceInlineMapVCLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18B0B0000, v4, OS_LOG_TYPE_INFO, "Cancelling snapshot request.", v5, 2u);
    }

    -[MKAnnotatedMapSnapshotter cancel](self->_collectionSnapshotter, "cancel");
    objc_storeWeak((id *)&self->_updatingInlineMapItem, 0);
  }
}

- (CGSize)_mapSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  if (v7 <= v5)
    v8 = v5;
  else
    v8 = v7;
  -[MKPlaceInlineMapViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutMargins");
  v11 = v10;
  v13 = v12;

  -[_MKPlaceInlineMapContentView mapViewHeight](self->_contentView, "mapViewHeight");
  v15 = v14;
  v16 = v8 - v11 - v13;
  result.height = v15;
  result.width = v16;
  return result;
}

- (void)_updateSnapshotImage:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__MKPlaceInlineMapViewController__updateSnapshotImage___block_invoke;
  v6[3] = &unk_1E20D7E58;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __55__MKPlaceInlineMapViewController__updateSnapshotImage___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[5];
  id v4;

  v1 = (void *)MEMORY[0x1E0CEABB0];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__MKPlaceInlineMapViewController__updateSnapshotImage___block_invoke_2;
  v3[3] = &unk_1E20D7E58;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  objc_msgSend(v1, "_mapkit_animateWithDuration:animations:completion:", v3, 0, 0.200000003);

}

uint64_t __55__MKPlaceInlineMapViewController__updateSnapshotImage___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setMap:", *(_QWORD *)(a1 + 40));
}

- (void)_handleTapOnMap
{
  void *v3;
  char v4;

  -[MKPlaceInlineMapViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "inlineMapViewControllerDidSelectMap:", self);

  if ((v4 & 1) == 0)
    -[MKPlaceInlineMapViewController _launchMaps](self, "_launchMaps");
}

- (void)_launchMaps
{
  id v2;

  -[MKPlaceInlineMapViewController mapItem](self, "mapItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openInMapsWithLaunchOptions:completionHandler:", 0, &__block_literal_global_9);

}

void __45__MKPlaceInlineMapViewController__launchMaps__block_invoke(uint64_t a1, char a2)
{
  void *v2;
  id v3;

  if ((a2 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Couldn't launch Maps from Place Card in %@"), v2);

  }
}

- (id)traitCollectionForSnapshot
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[MKPlaceInlineMapViewControllerConfiguration useWindowTraitCollectionForUserInterfaceStyle](self->_configuration, "useWindowTraitCollectionForUserInterfaceStyle");
  -[MKPlaceInlineMapViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "window");
  else
    objc_msgSend(v4, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)preferredUserInterfaceStyle
{
  void *v2;
  int64_t v3;

  -[MKPlaceInlineMapViewController traitCollectionForSnapshot](self, "traitCollectionForSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  return v3;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (BOOL)isBottomHairlineHidden
{
  return self->_bottomHairlineHidden;
}

- (MKPlaceInlineMapViewControllerDelegate)delegate
{
  return (MKPlaceInlineMapViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MKPlaceInlineMapViewControllerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (MKMapCamera)mapCamera
{
  return self->_mapCamera;
}

- (void)setMapCamera:(id)a3
{
  objc_storeStrong((id *)&self->_mapCamera, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapCamera, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_collectionSnapshotter, 0);
  objc_destroyWeak((id *)&self->_updatingInlineMapItem);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
