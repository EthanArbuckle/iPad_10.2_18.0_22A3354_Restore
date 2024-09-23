@implementation ICMapViewController

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);

  -[MKMapView setDelegate:](self->_mapView, "setDelegate:", 0);
  -[MKLocalSearch cancel](self->_localSearch, "cancel");

  v3.receiver = self;
  v3.super_class = (Class)ICMapViewController;
  -[ICMapViewController dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  MKMapView *mapView;
  objc_class *v4;
  MKMapView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  _Unwind_Exception *v14;
  uint64_t v15;
  uint64_t v16;
  Class (*v17)(uint64_t);
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;

  mapView = self->_mapView;
  if (!mapView)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3052000000;
    v23 = __Block_byref_object_copy__17;
    v24 = __Block_byref_object_dispose__17;
    v4 = (objc_class *)getMKMapViewClass_softClass;
    v25 = getMKMapViewClass_softClass;
    if (!getMKMapViewClass_softClass)
    {
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __getMKMapViewClass_block_invoke;
      v18 = &unk_1EA7DECF8;
      v19 = &v20;
      __getMKMapViewClass_block_invoke((uint64_t)&v15);
      v4 = (objc_class *)v21[5];
    }
    _Block_object_dispose(&v20, 8);
    v5 = (MKMapView *)objc_alloc_init(v4);
    self->_mapView = v5;
    -[MKMapView setMapType:](v5, "setMapType:", 0);
    -[MKMapView setDelegate:](self->_mapView, "setDelegate:", self);
    mapView = self->_mapView;
  }
  -[ICMapViewController setView:](self, "setView:", mapView);
  -[MKAnnotation coordinate](-[ICMapViewController annotation](self, "annotation"), "coordinate");
  v7 = v6;
  v9 = v8;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3052000000;
  v23 = __Block_byref_object_copy__17;
  v24 = __Block_byref_object_dispose__17;
  v10 = (objc_class *)getMKPointAnnotationClass_softClass;
  v25 = getMKPointAnnotationClass_softClass;
  if (!getMKPointAnnotationClass_softClass)
  {
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __getMKPointAnnotationClass_block_invoke;
    v18 = &unk_1EA7DECF8;
    v19 = &v20;
    __getMKPointAnnotationClass_block_invoke((uint64_t)&v15);
    v10 = (objc_class *)v21[5];
  }
  _Block_object_dispose(&v20, 8);
  v11 = objc_alloc_init(v10);
  objc_msgSend(v11, "setCoordinate:", v7, v9);
  objc_msgSend(v11, "setRepresentation:", 2);
  objc_msgSend(v11, "setTitle:", -[MKAnnotation title](-[ICMapViewController annotation](self, "annotation"), "title"));
  -[MKMapView addAnnotation:](self->_mapView, "addAnnotation:", v11);
  -[MKMapView setCenterCoordinate:](self->_mapView, "setCenterCoordinate:", v7, v9);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v12 = getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr;
  v23 = (void (*)(uint64_t, uint64_t))getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr;
  if (!getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr)
  {
    v13 = (void *)MapKitLibrary();
    v12 = dlsym(v13, "MKCoordinateRegionMakeWithDistance");
    v21[3] = (uint64_t)v12;
    getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr = v12;
  }
  _Block_object_dispose(&v20, 8);
  if (!v12)
  {
    v14 = (_Unwind_Exception *)__59__ICNoteEditorViewController_noteDecryptedStatusDidChange___block_invoke_cold_1();
    _Block_object_dispose(&v20, 8);
    _Unwind_Resume(v14);
  }
  ((void (*)(double, double, double, double))v12)(v7, v9, 600.0, 600.0);
  -[MKMapView setRegion:](self->_mapView, "setRegion:");
  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
    -[MKMapView setOverrideUserInterfaceStyle:](self->_mapView, "setOverrideUserInterfaceStyle:", 1);
  objc_msgSend((id)-[ICMapViewController navigationController](self, "navigationController"), "setToolbarHidden:", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICMapViewController;
  -[ICMapViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  getMKPlacemarkClass();
  if (objc_opt_class())
  {
    getMKMapItemClass();
    if (objc_opt_class())
    {
      v4 = objc_alloc((Class)getMKPlacemarkClass());
      -[MKAnnotation coordinate](-[ICMapViewController annotation](self, "annotation"), "coordinate");
      v5 = (void *)objc_msgSend(v4, "initWithCoordinate:");
      v6 = (void *)objc_msgSend(objc_alloc((Class)getMKMapItemClass()), "initWithPlacemark:", v5);
      objc_msgSend(v6, "setName:", -[MKAnnotation title](-[ICMapViewController annotation](self, "annotation"), "title"));
      -[ICMapViewController setMapItem:](self, "setMapItem:", v6);

    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_selectPin, 0);
  v5.receiver = self;
  v5.super_class = (Class)ICMapViewController;
  -[ICMapViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
  -[ICMapViewController setToolbarItems:](self, "setToolbarItems:", 0);
  objc_msgSend((id)-[ICMapViewController navigationController](self, "navigationController"), "setToolbarHidden:", 1);
}

- (BOOL)wantsFullScreenLayout
{
  return 1;
}

- (ICMapViewController)initWithAnnotation:(id)a3
{
  ICMapViewController *v4;
  ICMapViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICMapViewController;
  v4 = -[ICMapViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, 0, 0);
  v5 = v4;
  if (v4)
    -[ICMapViewController setAnnotation:](v4, "setAnnotation:", a3);
  return v5;
}

- (void)mapView:(id)a3 didAddAnnotationViews:(id)a4
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_selectPin, 0);
  -[ICMapViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_selectPin, 0, 0.7);
}

- (void)_toolbarItemPressed:(id)a3
{
  id v4;
  uint64_t *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  BOOL v10;
  _Unwind_Exception *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (!-[ICMapViewController mapItem](self, "mapItem", a3))
    return;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v5 = (uint64_t *)getMKLaunchOptionsDirectionsModeDrivingSymbolLoc_ptr;
  v15 = getMKLaunchOptionsDirectionsModeDrivingSymbolLoc_ptr;
  if (!getMKLaunchOptionsDirectionsModeDrivingSymbolLoc_ptr)
  {
    v6 = (void *)MapKitLibrary();
    v5 = (uint64_t *)dlsym(v6, "MKLaunchOptionsDirectionsModeDriving");
    v13[3] = (uint64_t)v5;
    getMKLaunchOptionsDirectionsModeDrivingSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v12, 8);
  if (!v5)
  {
    __59__ICNoteEditorViewController_noteDecryptedStatusDidChange___block_invoke_cold_1();
    goto LABEL_16;
  }
  v7 = *v5;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v8 = (_QWORD *)getMKLaunchOptionsDirectionsModeKeySymbolLoc_ptr;
  v15 = getMKLaunchOptionsDirectionsModeKeySymbolLoc_ptr;
  if (!getMKLaunchOptionsDirectionsModeKeySymbolLoc_ptr)
  {
    v9 = (void *)MapKitLibrary();
    v8 = dlsym(v9, "MKLaunchOptionsDirectionsModeKey");
    v13[3] = (uint64_t)v8;
    getMKLaunchOptionsDirectionsModeKeySymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v12, 8);
  if (!v8)
  {
LABEL_16:
    v11 = (_Unwind_Exception *)__59__ICNoteEditorViewController_noteDecryptedStatusDidChange___block_invoke_cold_1();
    _Block_object_dispose(&v12, 8);
    _Unwind_Resume(v11);
  }
  if (*v8)
    v10 = v7 == 0;
  else
    v10 = 1;
  if (!v10)
    objc_msgSend(v4, "setObject:forKey:", v7, v12);
  -[MKMapItem openInMapsWithLaunchOptions:](-[ICMapViewController mapItem](self, "mapItem", v12), "openInMapsWithLaunchOptions:", v4);

}

- (void)selectPin
{
  -[MKMapView selectAnnotation:animated:](-[ICMapViewController mapView](self, "mapView"), "selectAnnotation:animated:", -[ICMapViewController annotation](self, "annotation"), 1);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MKAnnotation)annotation
{
  return self->_annotation;
}

- (void)setAnnotation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 968);
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 976);
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 984);
}

- (MKLocalSearch)localSearch
{
  return self->_localSearch;
}

- (void)setLocalSearch:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 992);
}

@end
