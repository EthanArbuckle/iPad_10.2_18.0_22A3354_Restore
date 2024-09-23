@implementation FMFMapViewDelegateInternal

- (FMFMapViewDelegateInternal)initWithDelegate:(id)a3 mapView:(id)a4
{
  id v6;
  id v7;
  FMFMapViewDelegateInternal *v8;
  FMFWildcardGestureRecognizer *v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (FMFMapViewDelegateInternal *)objc_alloc_init((Class)objc_opt_class());

  -[FMFMapViewDelegateInternal setDelegate:](v8, "setDelegate:", v6);
  -[FMFMapViewDelegateInternal setMapView:](v8, "setMapView:", v7);
  objc_initWeak(&location, v8);
  v9 = objc_alloc_init(FMFWildcardGestureRecognizer);
  -[FMFMapViewDelegateInternal setGr:](v8, "setGr:", v9);

  -[FMFWildcardGestureRecognizer setDelegate:](v8->_gr, "setDelegate:", v8);
  v10 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __55__FMFMapViewDelegateInternal_initWithDelegate_mapView___block_invoke;
  v14[3] = &unk_24C8780B8;
  objc_copyWeak(&v15, &location);
  -[FMFWildcardGestureRecognizer setTouchesBeganCallback:](v8->_gr, "setTouchesBeganCallback:", v14);
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __55__FMFMapViewDelegateInternal_initWithDelegate_mapView___block_invoke_2;
  v12[3] = &unk_24C8780B8;
  objc_copyWeak(&v13, &location);
  -[FMFWildcardGestureRecognizer setTouchesEndedCallback:](v8->_gr, "setTouchesEndedCallback:", v12);
  objc_msgSend(v7, "addGestureRecognizer:", v8->_gr);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v8;
}

void __55__FMFMapViewDelegateInternal_initWithDelegate_mapView___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setRespondingToUserTouch:", 1);

}

void __55__FMFMapViewDelegateInternal_initWithDelegate_mapView___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "performSelector:withObject:afterDelay:", sel_endTouches, 0, 0.5);

}

- (void)endTouches
{
  -[FMFMapViewDelegateInternal setRespondingToUserTouch:](self, "setRespondingToUserTouch:", 0);
}

- (BOOL)canSelectAnnotation:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[FMFMapViewDelegateInternal delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "canSelectAnnotation:", v4);
  else
    v6 = 1;

  return v6;
}

- (void)selectAnnotation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMFMapViewDelegateInternal mapView](self, "mapView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectAnnotation:animated:", v4, 1);

}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v6;
  id v7;
  FMFAnnotationView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  FMFAnnotationView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "dequeueReusableAnnotationViewWithIdentifier:", CFSTR("fmfAnnotation"));
    v8 = (FMFAnnotationView *)objc_claimAutoreleasedReturnValue();
    -[FMFMapViewDelegateInternal delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_internalAnnotationTintColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v7, "setTintColor:", v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6950], "fmfOrangeColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTintColor:", v11);

    }
    objc_msgSend(v7, "handle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "annotationImageForAnnotation:andHandle:", v7, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSmallAnnotationIcon:", v13);
    objc_msgSend(v7, "setLargeAnnotationIcon:", v13);

    if (!v8)
    {
      v14 = [FMFAnnotationView alloc];
      objc_msgSend(v7, "tintColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[FMFAnnotationView initWithAnnotation:reuseIdentifier:tintColor:](v14, "initWithAnnotation:reuseIdentifier:tintColor:", v7, CFSTR("fmfAnnotation"), v15);

    }
    objc_msgSend(v7, "handle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cachedPrettyName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v7, "locationShortAddressWithAgeIncludeLocating");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@, %@"), v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFAnnotationView setAccessibilityLabel:](v8, "setAccessibilityLabel:", v20);

    -[FMAnnotationView setShouldPreventLargeAnnotationState:](v8, "setShouldPreventLargeAnnotationState:", -[FMFMapViewDelegateInternal canSelectAnnotation:](self, "canSelectAnnotation:", v7) ^ 1);
    if (!v17)
    {
      objc_msgSend(v7, "handle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __56__FMFMapViewDelegateInternal_mapView_viewForAnnotation___block_invoke;
      v23[3] = &unk_24C878090;
      v24 = v6;
      v25 = v7;
      objc_msgSend(v21, "prettyNameWithCompletion:", v23);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __56__FMFMapViewDelegateInternal_mapView_viewForAnnotation___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "annotations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeAnnotation:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "addAnnotation:", *(_QWORD *)(a1 + 40));
  }
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend(v6, "annotation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "annotation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFMapViewDelegateInternal delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "didSelectLocation:", v9);
    if (!-[FMFMapViewDelegateInternal isMapCenteringDisabled](self, "isMapCenteringDisabled"))
    {
      objc_msgSend(v6, "annotation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[FMFMapViewDelegateInternal slideAnnotation:intoViewIfNeededForMapView:](self, "slideAnnotation:intoViewIfNeededForMapView:", v11, v12);

    }
  }

}

- (void)mapView:(id)a3 didDeselectAnnotationView:(id)a4
{
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  objc_msgSend(v6, "annotation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "annotation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFMapViewDelegateInternal selectedAnnotationView](self, "selectedAnnotationView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "annotation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "annotation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (v13)
      -[FMFMapViewDelegateInternal setSelectedAnnotationView:](self, "setSelectedAnnotationView:", 0);
    -[FMFMapViewDelegateInternal delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "alwaysShowAccuracy") & 1) == 0)
    {
      objc_msgSend(v16, "overlays");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeOverlays:", v15);

    }
    objc_msgSend(v14, "didDeselectLocation:", v9);

  }
}

- (void)mapView:(id)a3 regionWillChangeAnimated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = a4;
  v11 = a3;
  if (-[FMFMapViewDelegateInternal respondingToUserTouch](self, "respondingToUserTouch"))
  {
    objc_msgSend(v11, "centerCoordinate");
    beforeCoordinate = v6;
    unk_2549E7570 = v7;
    objc_msgSend(v11, "region");
    beforeSpan = v8;
    unk_2549E7580 = v9;
  }
  -[FMFMapViewDelegateInternal delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "regionWillChangeAnimated:", v4);

}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id v21;

  v4 = a4;
  v21 = a3;
  if (-[FMFMapViewDelegateInternal respondingToUserTouch](self, "respondingToUserTouch"))
  {
    objc_msgSend(v21, "centerCoordinate");
    v7 = v6;
    v9 = v8;
    objc_msgSend(v21, "convertCoordinate:toPointToView:", 0, *(double *)&beforeCoordinate, unk_2549E7570);
    v11 = v10;
    v13 = v12;
    objc_msgSend(v21, "convertCoordinate:toPointToView:", 0, v7, v9);
    v15 = v14;
    v17 = v16;
    objc_msgSend(v21, "region");
    if (vabdd_f64(v18, *(double *)&beforeSpan) > 0.0001
      || sqrt((v17 - v13) * (v17 - v13) + (v15 - v11) * (v15 - v11)) > 20.0)
    {
      -[FMFMapViewDelegateInternal delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setShouldZoomToFitNewLocations:", 0);

    }
    -[FMFMapViewDelegateInternal setRespondingToUserTouch:](self, "setRespondingToUserTouch:", 0);
  }
  -[FMFMapViewDelegateInternal delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "regionDidChangeAnimated:", v4);

}

- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4
{
  double v5;
  double v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(v8, "coordinate");
  if (vabdd_f64(v5, self->_lastUserLocationCoordinate.latitude) >= 0.0001
    || (objc_msgSend(v8, "coordinate"), vabdd_f64(v6, self->_lastUserLocationCoordinate.longitude) >= 0.0001))
  {
    objc_msgSend(v8, "coordinate");
    -[FMFMapViewDelegateInternal setLastUserLocationCoordinate:](self, "setLastUserLocationCoordinate:");
    -[FMFMapViewDelegateInternal delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "shouldZoomToFitMeAndLocations"))
      objc_msgSend(v7, "reZoomToFit");
    objc_msgSend(v7, "didUpdateUserLocation:", v8);

  }
}

- (void)mapViewDidFinishRenderingMap:(id)a3 fullyRendered:(BOOL)a4
{
  id v4;

  -[FMFMapViewDelegateInternal delegate](self, "delegate", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapViewDidFinishRenderingMap");

}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = (objc_class *)MEMORY[0x24BDDB038];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithCircle:", v7);

  v10 = objc_msgSend(v8, "mapType");
  if (v10)
    -[FMFMapViewDelegateInternal fmfOverlayColorSatellite](self, "fmfOverlayColorSatellite");
  else
    -[FMFMapViewDelegateInternal fmfOverlayColor](self, "fmfOverlayColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFillColor:", v11);

  return v9;
}

- (id)fmfOverlayColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[FMFMapViewDelegateInternal delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_internalAnnotationTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.100000001);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 0.156862751, 0.0, 0.0799999982);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v5 = v4;
  v7 = v5;

  return v7;
}

- (id)fmfOverlayColorSatellite
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[FMFMapViewDelegateInternal delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_internalAnnotationTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.200000003);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 0.156862751, 0.0, 0.200000003);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v5 = v4;
  v7 = v5;

  return v7;
}

- (id)accuracyCircleForLocation:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDDB030];
  v4 = a3;
  objc_msgSend(v4, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coordinate");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v4, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "horizontalAccuracy");
  objc_msgSend(v3, "circleWithCenterCoordinate:radius:", v7, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)slideAnnotation:(id)a3 intoViewIfNeededForMapView:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  v19 = a3;
  v6 = a4;
  objc_msgSend(v19, "coordinate");
  objc_msgSend(v6, "convertCoordinate:toPointToView:", v6);
  v8 = v7;
  v10 = 170.0 - v9;
  if (v7 < 52.0)
  {
    v11 = 52.0;
    goto LABEL_9;
  }
  objc_msgSend(v6, "frame");
  v13 = v12 + -52.0;
  if (v10 > 0.0 || v8 > v13)
  {
    v15 = 0.0;
    if (v8 <= v13)
    {
LABEL_10:
      objc_msgSend(v19, "coordinate");
      -[FMFMapViewDelegateInternal _moveCenterByOffset:from:mapView:](self, "_moveCenterByOffset:from:mapView:", v6, v15, fmax(v10, 0.0), v17, v18);
      goto LABEL_11;
    }
    objc_msgSend(v6, "frame");
    v11 = v16 + -52.0;
LABEL_9:
    v15 = v11 - v8;
    goto LABEL_10;
  }
LABEL_11:

}

- (void)_moveCenterByOffset:(CGPoint)a3 from:(CLLocationCoordinate2D)a4 mapView:(id)a5
{
  double y;
  double x;
  double v7;
  double v8;
  double latitude;
  double longitude;
  id v11;
  CLLocationCoordinate2D v12;

  y = a3.y;
  x = a3.x;
  v11 = a5;
  objc_msgSend(v11, "centerCoordinate");
  objc_msgSend(v11, "convertCoordinate:toPointToView:", v11);
  objc_msgSend(v11, "convertPoint:toCoordinateFromView:", v11, v7 - x, v8 - y);
  latitude = v12.latitude;
  longitude = v12.longitude;
  if (CLLocationCoordinate2DIsValid(v12))
    objc_msgSend(v11, "setCenterCoordinate:animated:", 1, latitude, longitude);

}

- (void)zoomToFitLocation:(id)a3 forMapView:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  _QWORD v47[5];
  id v48;
  uint8_t buf[4];
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a3, "coordinate");
  v8 = v7;
  v10 = v9;
  if (-[FMFMapViewDelegateInternal regionIsValid:](self, "regionIsValid:"))
  {
    +[FMFMapUtilities mapRectForCoordinateRegion:](FMFMapUtilities, "mapRectForCoordinateRegion:", v8, v10, 0.003, 0.003);
    v45 = v12;
    v46 = v11;
    v43 = v14;
    v44 = v13;
    -[FMFMapViewDelegateInternal delegate](self, "delegate");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject edgeInsets](v15, "edgeInsets");
    -[FMFMapViewDelegateInternal edgeInsetsWithMinApplied:](self, "edgeInsetsWithMinApplied:");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    -[FMFMapViewDelegateInternal mapView](self, "mapView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bounds");
    v26 = v25;
    v28 = v27;

    -[FMFMapViewDelegateInternal mapView](self, "mapView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "mapRectThatFits:edgePadding:", v46, v45, v44, v43, v17, v19, v21, v23);
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;

    objc_msgSend(MEMORY[0x24BDDB0D0], "_cameraLookingAtMapRect:forViewSize:", v31, v33, v35, v37, v26, v28);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    LogCategory_Daemon();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v38, "debugDescription");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v50 = v40;
      _os_log_impl(&dword_20DD58000, v39, OS_LOG_TYPE_DEFAULT, "FMMapViewDelegateInternal: camera updated %@", buf, 0xCu);

    }
    if (+[FMFMapUtilities doNotAnimateToNewLocation:forMapView:](FMFMapUtilities, "doNotAnimateToNewLocation:forMapView:", v6, v8, v10))
    {
      -[FMFMapViewDelegateInternal mapView](self, "mapView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setCamera:animated:", v38, 0);

    }
    else
    {
      v42 = (void *)MEMORY[0x24BDF6F90];
      v47[0] = MEMORY[0x24BDAC760];
      v47[1] = 3221225472;
      v47[2] = __59__FMFMapViewDelegateInternal_zoomToFitLocation_forMapView___block_invoke;
      v47[3] = &unk_24C877D90;
      v47[4] = self;
      v48 = v38;
      objc_msgSend(v42, "animateWithDuration:animations:", v47, 0.200000003);

    }
  }
  else
  {
    LogCategory_Daemon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DD58000, v15, OS_LOG_TYPE_DEFAULT, "Not zooming due to invalid region (0,0).", buf, 2u);
    }
  }

}

void __59__FMFMapViewDelegateInternal_zoomToFitLocation_forMapView___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "mapView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCamera:animated:", *(_QWORD *)(a1 + 40), 1);

}

- (void)zoomToFitAnnotationsForMapView:(id)a3 includeMe:(BOOL)a4 duration:(double)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  double v30;
  double latitude;
  double v32;
  double longitude;
  double v34;
  double latitudeDelta;
  double v36;
  double longitudeDelta;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  NSObject *v81;
  NSObject *v82;
  void *v83;
  void *v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  void *v89;
  double v90;
  void *v91;
  double v92;
  _QWORD v93[5];
  NSObject *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  uint8_t buf[4];
  void *v104;
  _BYTE v105[128];
  _BYTE v106[128];
  uint64_t v107;
  MKMapRect v108;
  MKCoordinateRegion v109;

  v107 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (objc_msgSend(v8, "userTrackingMode") != 2)
  {
    LogCategory_Daemon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DD58000, v9, OS_LOG_TYPE_DEFAULT, "zoomToFitAnnotationsForMapView", buf, 2u);
    }

    -[FMFMapViewDelegateInternal delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "viewWillAppearCalled"))
      goto LABEL_46;
    objc_msgSend(v8, "annotations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      -[FMFMapViewDelegateInternal mapView](self, "mapView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "selectedAnnotations");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (!v14)
        goto LABEL_29;
      -[FMFMapViewDelegateInternal mapView](self, "mapView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "selectedAnnotations");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "mutableCopy");

      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      -[FMFMapViewDelegateInternal mapView](self, "mapView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "annotations");
      v19 = (id)objc_claimAutoreleasedReturnValue();

      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
      if (v20)
      {
        v21 = v20;
        v89 = v11;
        v91 = v10;
        v22 = *(_QWORD *)v96;
        while (2)
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v96 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v17, "addObject:", v24);
              goto LABEL_27;
            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
          if (v21)
            continue;
          goto LABEL_27;
        }
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = 0u;
      v100 = 0u;
      v101 = 0u;
      v102 = 0u;
      v19 = v11;
      v25 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v99, v106, 16);
      if (v25)
      {
        v26 = v25;
        v89 = v11;
        v91 = v10;
        v27 = *(_QWORD *)v100;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v100 != v27)
              objc_enumerationMutation(v19);
            v29 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              objc_msgSend(v17, "addObject:", v29);
          }
          v26 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v99, v106, 16);
        }
        while (v26);
LABEL_27:
        v11 = v89;
        v10 = v91;
      }
    }

    v11 = v17;
LABEL_29:
    +[FMFMapUtilities regionForAnnotations:](FMFMapUtilities, "regionForAnnotations:", v11);
    latitude = v30;
    longitude = v32;
    latitudeDelta = v34;
    longitudeDelta = v36;
    objc_msgSend(v11, "firstObject");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "alwaysShowAccuracy") && !a4)
    {
      objc_msgSend(v38, "coordinate");
      v40 = v39;
      v42 = v41;
      objc_msgSend(v38, "location");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "horizontalAccuracy");
      -[FMFMapViewDelegateInternal mapRectMakeWithRadialDistanceForCoordinate:andRadius:](self, "mapRectMakeWithRadialDistanceForCoordinate:andRadius:", v40, v42, v44);
      v46 = v45;
      v48 = v47;
      v50 = v49;
      v52 = v51;

      v108.origin.x = v46;
      v108.origin.y = v48;
      v108.size.width = v50;
      v108.size.height = v52;
      v109 = MKCoordinateRegionForMapRect(v108);
      latitude = v109.center.latitude;
      longitude = v109.center.longitude;
      latitudeDelta = v109.span.latitudeDelta;
      longitudeDelta = v109.span.longitudeDelta;
    }
    if (latitudeDelta < 0.003)
      latitudeDelta = 0.003;
    if (longitudeDelta < 0.003)
      longitudeDelta = 0.003;
    if (-[FMFMapViewDelegateInternal regionIsValid:](self, "regionIsValid:", latitude, longitude, latitudeDelta, longitudeDelta))
    {
      v92 = a5;
      v86 = longitude;
      v87 = latitude;
      +[FMFMapUtilities mapRectForCoordinateRegion:](FMFMapUtilities, "mapRectForCoordinateRegion:", latitude, longitude, latitudeDelta, longitudeDelta);
      v88 = v54;
      v90 = v53;
      v56 = v55;
      v58 = v57;
      objc_msgSend(v10, "edgeInsets");
      -[FMFMapViewDelegateInternal edgeInsetsWithMinApplied:](self, "edgeInsetsWithMinApplied:");
      v60 = v59;
      v62 = v61;
      v64 = v63;
      v66 = v65;
      -[FMFMapViewDelegateInternal mapView](self, "mapView");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "bounds");
      v69 = v68;
      v71 = v70;

      -[FMFMapViewDelegateInternal mapView](self, "mapView");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "mapRectThatFits:edgePadding:", v90, v88, v56, v58, v60, v62, v64, v66);
      v74 = v73;
      v76 = v75;
      v78 = v77;
      v80 = v79;

      objc_msgSend(MEMORY[0x24BDDB0D0], "_cameraLookingAtMapRect:forViewSize:", v74, v76, v78, v80, v69, v71);
      v81 = objc_claimAutoreleasedReturnValue();
      LogCategory_Daemon();
      v82 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject debugDescription](v81, "debugDescription");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v104 = v83;
        _os_log_impl(&dword_20DD58000, v82, OS_LOG_TYPE_DEFAULT, "FMFMapViewDelegateInternal: zoomToFitAnnotationsForMapView new camera %@", buf, 0xCu);

      }
      if (v92 <= 0.0
        || +[FMFMapUtilities doNotAnimateToNewLocation:forMapView:](FMFMapUtilities, "doNotAnimateToNewLocation:forMapView:", v8, v87, v86))
      {
        -[FMFMapViewDelegateInternal mapView](self, "mapView");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "setCamera:animated:", v81, 0);

      }
      else
      {
        v85 = (void *)MEMORY[0x24BDF6F90];
        v93[0] = MEMORY[0x24BDAC760];
        v93[1] = 3221225472;
        v93[2] = __80__FMFMapViewDelegateInternal_zoomToFitAnnotationsForMapView_includeMe_duration___block_invoke;
        v93[3] = &unk_24C877D90;
        v93[4] = self;
        v81 = v81;
        v94 = v81;
        objc_msgSend(v85, "animateWithDuration:delay:options:animations:completion:", 196614, v93, &__block_literal_global_2, v92, 0.0);

      }
    }
    else
    {
      LogCategory_Daemon();
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DD58000, v81, OS_LOG_TYPE_DEFAULT, "Not zooming due to invalid region (0,0).", buf, 2u);
      }
    }

LABEL_46:
  }

}

void __80__FMFMapViewDelegateInternal_zoomToFitAnnotationsForMapView_includeMe_duration___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "mapView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCamera:animated:", *(_QWORD *)(a1 + 40), 1);

}

- ($7A2C3A43EE5A76686BB0A44688CCB5FC)mapRectMakeWithRadialDistanceForCoordinate:(CLLocationCoordinate2D)a3 andRadius:(double)a4
{
  double latitude;
  MKMapPoint v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  $7A2C3A43EE5A76686BB0A44688CCB5FC result;

  latitude = a3.latitude;
  v6 = MKMapPointForCoordinate(a3);
  v7 = MEMORY[0x212BB4504](latitude) * a4;
  v8 = v6.x - v7;
  v9 = v6.y - v7;
  v10 = v7 + v7;
  v11 = v10;
  result.var1.var1 = v11;
  result.var1.var0 = v10;
  result.var0.var1 = v9;
  result.var0.var0 = v8;
  return result;
}

- (UIEdgeInsets)edgeInsetsWithMinApplied:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  NSObject *v7;
  NSObject *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int v13;
  double v14;
  __int16 v15;
  double v16;
  __int16 v17;
  double v18;
  __int16 v19;
  double v20;
  uint64_t v21;
  UIEdgeInsets result;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v21 = *MEMORY[0x24BDAC8D0];
  LogCategory_Daemon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134218752;
    v14 = top;
    v15 = 2048;
    v16 = left;
    v17 = 2048;
    v18 = right;
    v19 = 2048;
    v20 = bottom;
    _os_log_impl(&dword_20DD58000, v7, OS_LOG_TYPE_DEFAULT, "FMMapViewDelegateInternal: before top: %f, left: %f, right: %f, bottom: %f", (uint8_t *)&v13, 0x2Au);
  }

  if (top < 48.0)
    top = 48.0;
  if (left < 38.0)
    left = 38.0;
  if (right < 38.0)
    right = 38.0;
  if (bottom < 48.0)
    bottom = 48.0;
  LogCategory_Daemon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134218752;
    v14 = top;
    v15 = 2048;
    v16 = left;
    v17 = 2048;
    v18 = right;
    v19 = 2048;
    v20 = bottom;
    _os_log_impl(&dword_20DD58000, v8, OS_LOG_TYPE_DEFAULT, "FMMapViewDelegateInternal: after top: %f, left: %f, right: %f, bottom: %f", (uint8_t *)&v13, 0x2Au);
  }

  v9 = top;
  v10 = left;
  v11 = bottom;
  v12 = right;
  result.right = v12;
  result.bottom = v11;
  result.left = v10;
  result.top = v9;
  return result;
}

- (BOOL)regionIsValid:(id *)a3
{
  double v3;
  double v4;

  return v4 != 0.0 && v3 != 0.0;
}

- (BOOL)isMapCenteringDisabled
{
  return self->_isMapCenteringDisabled;
}

- (void)setIsMapCenteringDisabled:(BOOL)a3
{
  self->_isMapCenteringDisabled = a3;
}

- (FMFMapViewDelegateInternalDelegate)delegate
{
  return (FMFMapViewDelegateInternalDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)respondingToUserTouch
{
  return self->_respondingToUserTouch;
}

- (void)setRespondingToUserTouch:(BOOL)a3
{
  self->_respondingToUserTouch = a3;
}

- (FMFWildcardGestureRecognizer)gr
{
  return self->_gr;
}

- (void)setGr:(id)a3
{
  objc_storeStrong((id *)&self->_gr, a3);
}

- (FMFAnnotationView)selectedAnnotationView
{
  return self->_selectedAnnotationView;
}

- (void)setSelectedAnnotationView:(id)a3
{
  self->_selectedAnnotationView = (FMFAnnotationView *)a3;
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
  self->_mapView = (MKMapView *)a3;
}

- (CLLocationCoordinate2D)lastUserLocationCoordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_lastUserLocationCoordinate.latitude;
  longitude = self->_lastUserLocationCoordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setLastUserLocationCoordinate:(CLLocationCoordinate2D)a3
{
  self->_lastUserLocationCoordinate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gr, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
