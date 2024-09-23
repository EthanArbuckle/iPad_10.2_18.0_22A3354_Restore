@implementation SLSheetPlaceViewController

- (SLSheetPlaceViewController)initWithPlaceDataSource:(id)a3 effectiveBundle:(id)a4
{
  id v7;
  id v8;
  SLSheetPlaceViewController *v9;
  SLSheetPlaceViewController *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SLSheetPlaceViewController;
  v9 = -[SLSheetPlaceViewController init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_placeDataSource, a3);
    objc_storeStrong((id *)&v10->_effectiveBundle, a4);
    -[SLPlaceDataSource setDelegate:](v10->_placeDataSource, "setDelegate:", v10);
    SLSocialFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CHOOSE_LOCATION"), &stru_1E7592238, CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLSheetPlaceViewController setTitle:](v10, "setTitle:", v12);

    v10->_searchEnabled = 1;
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[MKMapView setDelegate:](self->_mapView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SLSheetPlaceViewController;
  -[SLSheetPlaceViewController dealloc](&v3, sel_dealloc);
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SLSheetPlaceViewController;
  -[SLSheetPlaceViewController didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (void)setPlaces:(id)a3
{
  uint64_t v3;
  UITableView *tableView;
  void *v7;
  id v8;

  v8 = a3;
  _SLLog(v3, 7, CFSTR("SLPlaceViewController setPlaces"));
  if ((-[SLSheetPlaceViewController isViewLoaded](self, "isViewLoaded") & 1) != 0)
    -[MKMapView removeAnnotations:](self->_mapView, "removeAnnotations:", self->_places);
  objc_storeStrong((id *)&self->_places, a3);
  if (-[SLSheetPlaceViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[UITableView beginUpdates](self->_tableView, "beginUpdates");
    tableView = self->_tableView;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView reloadSections:withRowAnimation:](tableView, "reloadSections:withRowAnimation:", v7, 100);

    -[UITableView endUpdates](self->_tableView, "endUpdates");
    -[MKMapView addAnnotations:](self->_mapView, "addAnnotations:", self->_places);
    -[SLSheetPlaceViewController _centerMapWithSelectedPlace:](self, "_centerMapWithSelectedPlace:", self->_selectedPlace);
    -[SLSheetPlaceViewController _calculatePreferredContentSize](self, "_calculatePreferredContentSize");
  }

}

- ($C9F7C80BF4E7B2AB17F2625213B9A2DC)_regionForPlaces:(SEL)a3
{
  id v4;
  double MKMapRectNull;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  double v17;
  CLLocationDegrees v18;
  CLLocationDegrees v19;
  CLLocationCoordinate2D v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  $C9F7C80BF4E7B2AB17F2625213B9A2DC *result;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  MKMapRectNull = getMKMapRectNull();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v40 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v16, "latitude", (_QWORD)v39);
        v18 = v17;
        objc_msgSend(v16, "longitude");
        v20 = CLLocationCoordinate2DMake(v18, v19);
        v43 = 0;
        v44 = &v43;
        v45 = 0x2020000000;
        v21 = getMKMapPointForCoordinateSymbolLoc_ptr;
        v46 = getMKMapPointForCoordinateSymbolLoc_ptr;
        if (!getMKMapPointForCoordinateSymbolLoc_ptr)
        {
          v22 = (void *)MapKitLibrary();
          v21 = dlsym(v22, "MKMapPointForCoordinate");
          v44[3] = (uint64_t)v21;
          getMKMapPointForCoordinateSymbolLoc_ptr = v21;
        }
        _Block_object_dispose(&v43, 8);
        if (!v21)
          -[SLSheetPlaceViewController _regionForPlaces:].cold.2();
        v23 = ((double (*)(double, double))v21)(v20.latitude, v20.longitude);
        v25 = v24;
        v43 = 0;
        v44 = &v43;
        v45 = 0x2020000000;
        v26 = getMKMapRectUnionSymbolLoc_ptr;
        v46 = getMKMapRectUnionSymbolLoc_ptr;
        if (!getMKMapRectUnionSymbolLoc_ptr)
        {
          v27 = (void *)MapKitLibrary();
          v26 = dlsym(v27, "MKMapRectUnion");
          v44[3] = (uint64_t)v26;
          getMKMapRectUnionSymbolLoc_ptr = v26;
        }
        _Block_object_dispose(&v43, 8);
        if (!v26)
          -[SLSheetPlaceViewController _regionForPlaces:].cold.3();
        MKMapRectNull = ((double (*)(double, double, double, double, double, double, double, double))v26)(MKMapRectNull, v7, v9, v11, v23, v25, 0.0, 0.0);
        v7 = v28;
        v9 = v29;
        v11 = v30;
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v13);
  }

  v31 = getMKMapRectNull();
  if ((MKMapRectNull == v31 && (v31 = getMKMapRectNull(), v7 == v32) || v9 == 0.0 && v11 == 0.0)
    && objc_msgSend(v12, "count", v31, (_QWORD)v39))
  {
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "coordinate");
    __MKCoordinateRegionMakeWithDistance(v34, v35, 50000.0, 50000.0);

  }
  else
  {
    v43 = 0;
    v44 = &v43;
    v45 = 0x2020000000;
    v36 = getMKCoordinateRegionForMapRectSymbolLoc_ptr;
    v46 = getMKCoordinateRegionForMapRectSymbolLoc_ptr;
    if (!getMKCoordinateRegionForMapRectSymbolLoc_ptr)
    {
      v37 = (void *)MapKitLibrary();
      v36 = dlsym(v37, "MKCoordinateRegionForMapRect");
      v44[3] = (uint64_t)v36;
      getMKCoordinateRegionForMapRectSymbolLoc_ptr = v36;
    }
    _Block_object_dispose(&v43, 8);
    if (!v36)
      -[SLSheetPlaceViewController _regionForPlaces:].cold.1();
    ((void (*)(double, double, double, double))v36)(MKMapRectNull, v7, v9, v11);
  }

  return result;
}

- (void)setSelectedPlace:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_selectedPlace, a3);
  v5 = a3;
  -[UITableView reloadData](self->_tableView, "reloadData");

}

- (NSArray)places
{
  return self->_places;
}

- (id)_placeForRow:(int64_t)a3
{
  if (!a3)
    return 0;
  -[NSArray objectAtIndexedSubscript:](self->_places, "objectAtIndexedSubscript:", a3 - 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)cancelButtonTapped:(id)a3
{
  id v4;

  -[SLSheetPlaceViewController selectionDelegate](self, "selectionDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placeViewController:didSelectPlace:", self, self->_selectedPlace);

}

- (double)_preferredViewHeight
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[UITableView sizeThatFits:](self->_tableView, "sizeThatFits:", 0.0, 1100.0);
  v4 = v3;
  -[SLSheetPlaceViewController _mapHeightForInterfaceOrientation:](self, "_mapHeightForInterfaceOrientation:", -[SLSheetPlaceViewController interfaceOrientation](self, "interfaceOrientation"));
  v6 = v5;
  -[UISearchBar bounds](self->_searchBar, "bounds");
  return v4 + v6 + v7;
}

- (void)_calculatePreferredContentSize
{
  uint64_t v2;
  double v4;
  double v5;
  void *v6;
  CGSize v7;

  if (-[NSArray count](self->_places, "count"))
  {
    -[SLSheetPlaceViewController _preferredViewHeight](self, "_preferredViewHeight");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }
  v7.width = 320.0;
  v7.height = v5;
  NSStringFromCGSize(v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v2, 7, CFSTR("Place VC preferredContentSize=%@"));

  -[SLSheetPlaceViewController setPreferredContentSize:](self, "setPreferredContentSize:", 320.0, v5);
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  if (!self->_searchPresented)
    -[SLSheetPlaceViewController _layoutNormal](self, "_layoutNormal", a3, a4);
}

- (double)_mapHeightForInterfaceOrientation:(int64_t)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  if ((unint64_t)(a3 - 3) > 1)
    return 125.0;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

  }
  else
  {
    v5 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

  }
  else
  {
    v8 = 0;
  }

  if (v5 == v8)
    return 80.0;
  else
    return 125.0;
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  _BOOL4 searchAnimationComplete;
  _QWORD v5[5];
  _QWORD v6[5];

  searchAnimationComplete = self->_searchAnimationComplete;
  if (!self->_searchAnimationComplete)
  {
    v5[4] = self;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __58__SLSheetPlaceViewController_searchBarShouldBeginEditing___block_invoke;
    v6[3] = &unk_1E7590248;
    v6[4] = self;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __58__SLSheetPlaceViewController_searchBarShouldBeginEditing___block_invoke_2;
    v5[3] = &unk_1E7590968;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v6, v5, 0.1);
  }
  return searchAnimationComplete;
}

uint64_t __58__SLSheetPlaceViewController_searchBarShouldBeginEditing___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1033) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_layoutForSearch");
  return objc_msgSend(*(id *)(a1 + 32), "_presentSearch");
}

uint64_t __58__SLSheetPlaceViewController_searchBarShouldBeginEditing___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "set_activationGapHeight:", 0.0);
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  -[UISearchBar setShowsCancelButton:](self->_searchBar, "setShowsCancelButton:", 1);
}

- (void)_presentSearch
{
  self->_searchAnimationComplete = 1;
  self->_searchPresented = 1;
  -[UISearchBar becomeFirstResponder](self->_searchBar, "becomeFirstResponder");
}

- (void)_restoreFromSearch
{
  void *v3;
  _QWORD v4[5];
  _QWORD v5[5];

  -[SLSheetPlaceSearchController placeDataSource](self->_placeSearchController, "placeDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopUpdatingLocation");

  v4[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__SLSheetPlaceViewController__restoreFromSearch__block_invoke;
  v5[3] = &unk_1E7590248;
  v5[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__SLSheetPlaceViewController__restoreFromSearch__block_invoke_2;
  v4[3] = &unk_1E7590968;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v5, v4, 0.1);
}

uint64_t __48__SLSheetPlaceViewController__restoreFromSearch__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutNormal");
}

uint64_t __48__SLSheetPlaceViewController__restoreFromSearch__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1033) = 0;
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1032) = 0;
  return result;
}

- (void)_layoutForSearch
{
  double MaxY;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect v12;

  -[MKMapView frame](self->_mapView, "frame");
  -[MKMapView setFrame:](self->_mapView, "setFrame:");
  -[UISearchBar frame](self->_searchBar, "frame");
  -[UISearchBar setFrame:](self->_searchBar, "setFrame:");
  -[UISearchBar frame](self->_searchBar, "frame");
  MaxY = CGRectGetMaxY(v12);
  -[SLSheetPlaceViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  -[SLSheetPlaceViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  -[UISearchBar frame](self->_searchBar, "frame");
  v11 = v9 - v10;

  -[UITableView setFrame:](self->_tableView, "setFrame:", 0.0, MaxY, v6, v11);
}

- (void)_layoutNormal
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double MaxY;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  -[SLSheetPlaceViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  -[SLSheetPlaceViewController _mapHeightForInterfaceOrientation:](self, "_mapHeightForInterfaceOrientation:", -[SLSheetPlaceViewController interfaceOrientation](self, "interfaceOrientation"));
  -[MKMapView setFrame:](self->_mapView, "setFrame:", 0.0, 0.0, v5, v6);

  -[MKMapView frame](self->_mapView, "frame");
  MaxY = CGRectGetMaxY(v16);
  if (-[SLSheetPlaceViewController searchEnabled](self, "searchEnabled"))
  {
    -[SLSheetPlaceViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    -[UISearchBar setFrame:](self->_searchBar, "setFrame:", 0.0, MaxY);

  }
  else
  {
    -[UISearchBar setFrame:](self->_searchBar, "setFrame:", 0.0, MaxY, 0.0, 0.0);
  }
  -[UISearchDisplayController set_activationGapHeight:](self->_searchDisplayController, "set_activationGapHeight:", MaxY);
  -[UISearchBar frame](self->_searchBar, "frame");
  v9 = CGRectGetMaxY(v17);
  -[SLSheetPlaceViewController view](self, "view");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  v11 = v10;
  -[SLSheetPlaceViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;
  -[UISearchBar frame](self->_searchBar, "frame");
  -[UITableView setFrame:](self->_tableView, "setFrame:", 0.0, v9, v11, v14 - CGRectGetMaxY(v18));

}

- (void)_centerMapWithSelectedPlace:(id)a3
{
  SLPlace *selectedPlace;
  id v5;

  v5 = a3;
  selectedPlace = self->_selectedPlace;
  if (!selectedPlace
    || !-[SLSheetPlaceViewController _forceSelectPlace:setMapAnnotation:](self, "_forceSelectPlace:setMapAnnotation:", selectedPlace, 1))
  {
    -[SLSheetPlaceViewController _centerMapForPlaces](self, "_centerMapForPlaces");
  }

}

- (void)_centerMapForPlaces
{
  void *v3;
  uint64_t v4;
  MKMapView *mapView;
  id v6;

  -[SLSheetPlaceViewController places](self, "places");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    mapView = self->_mapView;
    -[SLSheetPlaceViewController places](self, "places");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[SLSheetPlaceViewController _regionForPlaces:](self, "_regionForPlaces:", v6);
    -[MKMapView setRegion:](mapView, "setRegion:");

  }
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  void *v5;
  char isKindOfClass;
  SLPlace *v7;
  SLPlace *selectedPlace;
  SLPlace *v9;
  id v10;

  v10 = a4;
  objc_msgSend(v10, "annotation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v10, "annotation");
    v7 = (SLPlace *)objc_claimAutoreleasedReturnValue();
    selectedPlace = self->_selectedPlace;
    self->_selectedPlace = v7;
    v9 = v7;

    -[SLSheetPlaceViewController _forceSelectPlace:setMapAnnotation:](self, "_forceSelectPlace:setMapAnnotation:", v9, 0);
  }

}

- (BOOL)_forceSelectPlace:(id)a3 setMapAnnotation:(BOOL)a4
{
  id v6;
  NSArray *places;
  char v8;
  _QWORD v10[6];
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v6 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  places = self->_places;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__SLSheetPlaceViewController__forceSelectPlace_setMapAnnotation___block_invoke;
  v10[3] = &unk_1E7590990;
  v11 = a4;
  v10[4] = self;
  v10[5] = &v12;
  -[NSArray enumerateObjectsUsingBlock:](places, "enumerateObjectsUsingBlock:", v10);
  v8 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __65__SLSheetPlaceViewController__forceSelectPlace_setMapAnnotation___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    if (*(_BYTE *)(a1 + 48))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "selectAnnotation:animated:", v7, 1);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "visibleCells", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v15++), "setAccessoryType:", 0);
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v13);
    }

    v16 = *(void **)(*(_QWORD *)(a1 + 32) + 992);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cellForRowAtIndexPath:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setAccessoryType:", 3);
    v19 = *(void **)(*(_QWORD *)(a1 + 32) + 992);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "scrollToRowAtIndexPath:atScrollPosition:animated:", v20, (uint64_t)*MEMORY[0x1E0CEBBA0], 1);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;

  }
}

- (void)placeManager:(id)a3 updatedPlaces:(id)a4
{
  void *v5;
  id v6;

  v5 = (void *)MEMORY[0x1E0CEA2F8];
  v6 = a4;
  objc_msgSend(v5, "shouldShowNetworkActivityIndicatorInRemoteApplication:", 0);
  -[SLSheetPlaceViewController setPlaces:](self, "setPlaces:", v6);

}

- (void)placeManager:(id)a3 failedWithError:(id)a4
{
  uint64_t v4;
  void *v5;
  id v6;

  v5 = (void *)MEMORY[0x1E0CEA2F8];
  v6 = a4;
  objc_msgSend(v5, "shouldShowNetworkActivityIndicatorInRemoteApplication:", 0);
  _SLLog(v4, 3, CFSTR("Base place manager failed to fetch places with error %{public}@"));

}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  NSBundle *effectiveBundle;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  objc_class *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  MKMapView *v17;
  MKMapView *mapView;
  void *v19;
  void *v20;
  MKMapView *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  UISearchBar *v26;
  UISearchBar *searchBar;
  UITableView *v28;
  UITableView *tableView;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  objc_super v39;
  uint64_t v40;
  uint64_t v41;
  Class (*v42)(uint64_t);
  void *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;

  v39.receiver = self;
  v39.super_class = (Class)SLSheetPlaceViewController;
  -[SLSheetPlaceViewController loadView](&v39, sel_loadView);
  -[SLSheetPlaceViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOpaque:", 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLSheetPlaceViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  effectiveBundle = self->_effectiveBundle;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2050000000;
  v7 = (void *)getMKLocationManagerClass_softClass;
  v48 = getMKLocationManagerClass_softClass;
  if (!getMKLocationManagerClass_softClass)
  {
    v40 = MEMORY[0x1E0C809B0];
    v41 = 3221225472;
    v42 = __getMKLocationManagerClass_block_invoke;
    v43 = &unk_1E7590808;
    v44 = &v45;
    __getMKLocationManagerClass_block_invoke((uint64_t)&v40);
    v7 = (void *)v46[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v45, 8);
  objc_msgSend(v8, "sharedLocationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEffectiveBundle:", effectiveBundle);

  v45 = 0;
  v46 = &v45;
  v47 = 0x2050000000;
  v10 = (void *)getMKMapViewClass_softClass;
  v48 = getMKMapViewClass_softClass;
  if (!getMKMapViewClass_softClass)
  {
    v40 = MEMORY[0x1E0C809B0];
    v41 = 3221225472;
    v42 = __getMKMapViewClass_block_invoke;
    v43 = &unk_1E7590808;
    v44 = &v45;
    __getMKMapViewClass_block_invoke((uint64_t)&v40);
    v10 = (void *)v46[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v45, 8);
  v12 = [v11 alloc];
  v13 = *MEMORY[0x1E0C9D648];
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v17 = (MKMapView *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E0C9D648], v14, v15, v16);
  mapView = self->_mapView;
  self->_mapView = v17;

  -[MKMapView setAutoresizingMask:](self->_mapView, "setAutoresizingMask:", 2);
  -[MKMapView setRendersInBackground:](self->_mapView, "setRendersInBackground:", 1);
  -[MKMapView setShowsUserLocation:](self->_mapView, "setShowsUserLocation:", 1);
  -[MKMapView setUserTrackingMode:animated:](self->_mapView, "setUserTrackingMode:animated:", 0, 0);
  -[MKMapView setDelegate:](self->_mapView, "setDelegate:", self);
  if (!-[NSArray count](self->_places, "count"))
  {
    -[SLSheetPlaceViewController placeDataSource](self, "placeDataSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "currentLocation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = self->_mapView;
      -[SLSheetPlaceViewController placeDataSource](self, "placeDataSource");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "currentLocation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "coordinate");
      __MKCoordinateRegionMakeWithDistance(v24, v25, 3000.0, 3000.0);
      -[MKMapView setRegion:](v21, "setRegion:");

    }
  }
  v26 = (UISearchBar *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA978]), "initWithFrame:", v13, v14, v15, v16);
  searchBar = self->_searchBar;
  self->_searchBar = v26;

  -[UISearchBar setAutoresizingMask:](self->_searchBar, "setAutoresizingMask:", 2);
  -[UISearchBar setDelegate:](self->_searchBar, "setDelegate:", self);
  v28 = (UITableView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA58]), "initWithFrame:style:", 0, v13, v14, v15, v16);
  tableView = self->_tableView;
  self->_tableView = v28;

  -[UITableView setAutoresizingMask:](self->_tableView, "setAutoresizingMask:", 18);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setOpaque:](self->_tableView, "setOpaque:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v30);

  -[UITableView backgroundView](self->_tableView, "backgroundView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setOpaque:", 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView backgroundView](self->_tableView, "backgroundView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setBackgroundColor:", v32);

  -[UITableView setRowHeight:](self->_tableView, "setRowHeight:", *MEMORY[0x1E0CEBC10]);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "lineHeight");
  -[UITableView setEstimatedRowHeight:](self->_tableView, "setEstimatedRowHeight:", v35 + v35);

  -[SLSheetPlaceViewController _layoutNormal](self, "_layoutNormal");
  -[SLSheetPlaceViewController view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addSubview:", self->_mapView);

  if (-[SLSheetPlaceViewController searchEnabled](self, "searchEnabled"))
  {
    -[SLSheetPlaceViewController view](self, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addSubview:", self->_searchBar);

  }
  -[SLSheetPlaceViewController view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addSubview:", self->_tableView);

}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SLSheetPlaceViewController;
  -[SLSheetPlaceViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[SLSheetPlaceViewController places](self, "places");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[SLSheetPlaceViewController _centerMapForPlaces](self, "_centerMapForPlaces");
    -[SLSheetPlaceViewController _centerMapWithSelectedPlace:](self, "_centerMapWithSelectedPlace:", self->_selectedPlace);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SLSheetPlaceViewController;
  -[SLSheetPlaceViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x1E0CEA2F8], "shouldShowNetworkActivityIndicatorInRemoteApplication:", 1);
  -[SLPlaceDataSource fetchPlaces](self->_placeDataSource, "fetchPlaces");
  -[UITableView reloadData](self->_tableView, "reloadData");
  -[SLSheetPlaceViewController _calculatePreferredContentSize](self, "_calculatePreferredContentSize");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SLSheetPlaceViewController;
  -[SLSheetPlaceViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[UITableView flashScrollIndicators](self->_tableView, "flashScrollIndicators");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  -[SLSheetPlaceViewController placeDataSource](self, "placeDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelPlaceFetch");

  -[SLSheetPlaceViewController placeDataSource](self, "placeDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopUpdatingLocation");

  v10.receiver = self;
  v10.super_class = (Class)SLSheetPlaceViewController;
  -[SLSheetPlaceViewController viewWillDisappear:](&v10, sel_viewWillDisappear_, v3);
  -[SLSheetPlaceViewController selectionDelegate](self, "selectionDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SLSheetPlaceViewController selectionDelegate](self, "selectionDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "placeViewController:willDisappear:", self, v3);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SLSheetPlaceViewController;
  -[SLSheetPlaceViewController viewDidDisappear:](&v3, sel_viewDidDisappear_, a3);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return a3 == 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[SLSheetPlaceViewController places](self, "places", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") + 1;

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("SLFacebookPlaceCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA60]), "initWithStyle:reuseIdentifier:", 3, CFSTR("SLFacebookPlaceCell"));
  objc_msgSend(v7, "setOpaque:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  if (objc_msgSend(v6, "row"))
  {
    -[SLSheetPlaceViewController _placeForRow:](self, "_placeForRow:", objc_msgSend(v6, "row"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v10);

    objc_msgSend(v9, "category");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "detailTextLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);

    if (self->_selectedPlace
      && (objc_msgSend(v9, "identifier"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          -[SLPlace identifier](self->_selectedPlace, "identifier"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v14, "isEqualToString:", v15),
          v15,
          v14,
          (v16 & 1) != 0))
    {
      v17 = 3;
    }
    else
    {
      v17 = 0;
    }
    objc_msgSend(v7, "setAccessoryType:", v17);

  }
  else
  {
    SLSocialFrameworkBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("SHEET_LOCATION_NO_VALUE"), &stru_1E7592238, CFSTR("Localizable"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setText:", v19);

    objc_msgSend(v7, "detailTextLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setText:", &stru_1E7592238);

    if (self->_selectedPlace)
      v22 = 0;
    else
      v22 = 3;
    objc_msgSend(v7, "setAccessoryType:", v22);
  }

  return v7;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(v5, "setOpaque:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v4;
  UITableView *v7;
  id v8;
  UITableView *tableView;
  UITableView *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  dispatch_time_t v20;
  uint64_t v21;
  _QWORD block[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = (UITableView *)a3;
  v8 = a4;
  tableView = self->_tableView;
  if (tableView == v7)
  {
    _SLLog(v4, 6, CFSTR("Selection from standard place results"));
    v10 = self->_tableView;
    -[SLSheetPlaceViewController _placeForRow:](self, "_placeForRow:", objc_msgSend(v8, "row", v4));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapView selectAnnotation:animated:](self->_mapView, "selectAnnotation:animated:", v12, 1);
  }
  else
  {
    _SLLog(v4, 6, CFSTR("Selection from search results"));
    -[UISearchDisplayController searchResultsTableView](self->_searchDisplayController, "searchResultsTableView", v4);
    v10 = (UITableView *)objc_claimAutoreleasedReturnValue();
    -[SLSheetPlaceSearchController searchResults](self->_placeSearchController, "searchResults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_storeStrong((id *)&self->_selectedPlace, v12);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[UITableView visibleCells](v10, "visibleCells");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "setAccessoryType:", 0);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v15);
  }

  -[UITableView cellForRowAtIndexPath:](v10, "cellForRowAtIndexPath:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAccessoryType:", 3);
  -[UITableView deselectRowAtIndexPath:animated:](v10, "deselectRowAtIndexPath:animated:", v8, 1);
  -[SLSheetPlaceViewController selectionDelegate](self, "selectionDelegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "placeViewController:didSelectPlace:", self, v12);

  if (tableView != v7)
  {
    _SLLog(v21, 7, CFSTR("Popping after delay"));
    v20 = dispatch_time(0, 400000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__SLSheetPlaceViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    block[3] = &unk_1E7590248;
    block[4] = self;
    dispatch_after(v20, MEMORY[0x1E0C80D38], block);
  }

}

void __64__SLSheetPlaceViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "popToRootViewControllerAnimated:", 1);

}

- (void)searchDisplayControllerWillEndSearch:(id)a3
{
  -[SLSheetPlaceSearchController cancelSearch](self->_placeSearchController, "cancelSearch", a3);
}

- (BOOL)searchDisplayController:(id)a3 shouldReloadTableForSearchString:(id)a4
{
  uint64_t v4;
  id v7;
  id v8;

  v7 = a4;
  v8 = a3;
  _SLLog(v4, 6, CFSTR("User started place search with search string %@"));
  -[SLSheetPlaceSearchController searchWithSearchString:](self->_placeSearchController, "searchWithSearchString:", v7, v7);

  objc_msgSend(v8, "setNoResultsMessage:", &stru_1E7592238);
  return 0;
}

- (SLSheetPlaceViewControllerDelegate)selectionDelegate
{
  return (SLSheetPlaceViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_selectionDelegate);
}

- (void)setSelectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_selectionDelegate, a3);
}

- (BOOL)searchEnabled
{
  return self->_searchEnabled;
}

- (void)setSearchEnabled:(BOOL)a3
{
  self->_searchEnabled = a3;
}

- (ACAccount)account
{
  return (ACAccount *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setAccount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1064);
}

- (SLPlaceDataSource)placeDataSource
{
  return (SLPlaceDataSource *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setPlaceDataSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1072);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeDataSource, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_destroyWeak((id *)&self->_selectionDelegate);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_placeSearchController, 0);
  objc_storeStrong((id *)&self->_searchDisplayController, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_effectiveBundle, 0);
  objc_storeStrong((id *)&self->_selectedPlace, 0);
  objc_storeStrong((id *)&self->_places, 0);
}

- (void)_regionForPlaces:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MKCoordinateRegion __MKCoordinateRegionForMapRect(MKMapRect)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SLSheetPlaceViewController.m"), 44, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

- (void)_regionForPlaces:.cold.2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MKMapPoint __MKMapPointForCoordinate(CLLocationCoordinate2D)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SLSheetPlaceViewController.m"), 46, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

- (void)_regionForPlaces:.cold.3()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MKMapRect __MKMapRectUnion(MKMapRect, MKMapRect)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SLSheetPlaceViewController.m"), 47, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

@end
