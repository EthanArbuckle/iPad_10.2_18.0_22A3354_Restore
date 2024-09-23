@implementation HKRouteView

- (HKRouteView)init
{
  HKRouteView *v2;
  HKRouteView *v3;
  uint64_t v4;
  UIButton *toggleMapTypeButton;
  UIButton *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKRouteView;
  v2 = -[HKRouteView init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    -[HKRouteView _clearMapViewIfNeeded](v2, "_clearMapViewIfNeeded");
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
    v4 = objc_claimAutoreleasedReturnValue();
    toggleMapTypeButton = v3->_toggleMapTypeButton;
    v3->_toggleMapTypeButton = (UIButton *)v4;

    v6 = v3->_toggleMapTypeButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colorWithAlphaComponent:", 0.8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v6, "setBackgroundColor:", v8);

    -[UIButton _setCornerRadius:](v3->_toggleMapTypeButton, "_setCornerRadius:", 9.0);
    -[HKRouteView _setRouteMapType:](v3, "_setRouteMapType:", 5);
    -[HKRouteView addSubview:](v3, "addSubview:", v3->_toggleMapTypeButton);
  }
  return v3;
}

- (void)_clearMapViewIfNeeded
{
  MKMapView *mapView;
  MKMapView *v4;
  MKMapView *v5;

  mapView = self->_mapView;
  if (mapView)
    -[MKMapView removeFromSuperview](mapView, "removeFromSuperview");
  v4 = (MKMapView *)objc_alloc_init(MEMORY[0x1E0CC1870]);
  v5 = self->_mapView;
  self->_mapView = v4;

  -[MKMapView setShowsScale:](self->_mapView, "setShowsScale:", 1);
  -[MKMapView setShowsCompass:](self->_mapView, "setShowsCompass:", 1);
  -[MKMapView setMapType:](self->_mapView, "setMapType:", 5);
  -[MKMapView setDelegate:](self->_mapView, "setDelegate:", self);
  -[HKRouteView addSubview:](self, "addSubview:", self->_mapView);
  -[MKMapView hk_alignConstraintsWithView:](self->_mapView, "hk_alignConstraintsWithView:", self);
  -[MKMapView _compassInsets](self->_mapView, "_compassInsets");
  -[MKMapView _setCompassInsets:](self->_mapView, "_setCompassInsets:", 59.0);
  -[MKMapView _setCompassViewSize:style:](self->_mapView, "_setCompassViewSize:style:", 1, 0);
}

- (void)_setRouteMapType:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  UIButton *toggleMapTypeButton;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[MKMapView setMapType:](self->_mapView, "setMapType:");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("WORKOUT_ROUTE_MAP_ACCESSIBILITY_LABEL_MAP_VIEW"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (a3 == 5)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("WORKOUT_ROUTE_MAP_ACCESSIBILITY_LABEL_SATELLITE_VIEW"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = CFSTR("Activity-satellite-view");
    v13 = (id)v7;
  }
  else
  {
    v8 = CFSTR("Activity-map-view");
  }
  toggleMapTypeButton = self->_toggleMapTypeButton;
  v10 = (void *)MEMORY[0x1E0DC3870];
  HKHealthUIFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageNamed:inBundle:", v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setImage:forState:](toggleMapTypeButton, "setImage:forState:", v12, 0);

  -[UIButton setAccessibilityLabel:](self->_toggleMapTypeButton, "setAccessibilityLabel:", v13);
}

- (id)routeImageForSharing
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  void *v7;
  double v8;
  CGFloat v9;
  void *v10;
  void *v11;
  CGSize v13;

  -[HKRouteView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;
  v13.width = v4;
  v13.height = v6;
  UIGraphicsBeginImageContextWithOptions(v13, 0, v9);

  -[MKMapView layer](self->_mapView, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "renderInContext:", UIGraphicsGetCurrentContext());

  UIGraphicsGetImageFromCurrentImageContext();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v11;
}

- (void)_toggleMapType
{
  uint64_t v3;

  if (-[MKMapView mapType](self->_mapView, "mapType") == MKMapTypeMutedStandard)
    v3 = 1;
  else
    v3 = 5;
  -[HKRouteView _setRouteMapType:](self, "_setRouteMapType:", v3);
}

- (void)_addAnnotation:(id)a3 isStartPoint:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  HKMapPointAnnotation *v11;

  v4 = a4;
  v6 = a3;
  v11 = objc_alloc_init(HKMapPointAnnotation);
  objc_msgSend(v6, "coordinate");
  v8 = v7;
  v10 = v9;

  -[MKPointAnnotation setCoordinate:](v11, "setCoordinate:", v8, v10);
  -[HKMapPointAnnotation setIsStartPoint:](v11, "setIsStartPoint:", v4);
  -[MKMapView addAnnotation:](self->_mapView, "addAnnotation:", v11);

}

- (void)_displayMapRouteForLocationReadings
{
  int64_t v3;
  HKLocationReadings *locationReadings;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MKMapPoint v9;
  MKMapView *mapView;
  void *v11;
  uint64_t v12;
  char *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char *v17;
  void *v18;
  void *v19;
  id v20;
  CLLocationCoordinate2D v21;
  CLLocationCoordinate2D v22;

  v3 = -[HKLocationReadings count](self->_locationReadings, "count");
  locationReadings = self->_locationReadings;
  if (v3 == 1)
  {
    -[HKLocationReadings allValidLocations](locationReadings, "allValidLocations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKRouteView _addAnnotation:isStartPoint:](self, "_addAnnotation:isStartPoint:", v6, 1);

    -[HKLocationReadings allValidLocations](self->_locationReadings, "allValidLocations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "coordinate");
    v9 = MKMapPointForCoordinate(v21);

    -[MKMapView setVisibleMapRect:animated:](self->_mapView, "setVisibleMapRect:animated:", 0, v9.x, v9.y, 1500.0, 1500.0);
    mapView = self->_mapView;
    -[HKLocationReadings allValidLocations](self->_locationReadings, "allValidLocations");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "coordinate");
    -[MKMapView setCenterCoordinate:](mapView, "setCenterCoordinate:");

  }
  else
  {
    v12 = -[HKLocationReadings count](locationReadings, "count");
    v13 = (char *)malloc_type_malloc(16 * v12, 0x1000040451B5BE8uLL);
    -[HKLocationReadings firstObject](self->_locationReadings, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKRouteView _addAnnotation:isStartPoint:](self, "_addAnnotation:isStartPoint:", v14, 1);

    -[HKLocationReadings lastObject](self->_locationReadings, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKRouteView _addAnnotation:isStartPoint:](self, "_addAnnotation:isStartPoint:", v15, 0);

    if (v12)
    {
      v16 = 0;
      v17 = v13 + 8;
      do
      {
        -[HKLocationReadings allValidLocations](self->_locationReadings, "allValidLocations");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "coordinate");
        *(MKMapPoint *)(v17 - 8) = MKMapPointForCoordinate(v22);

        ++v16;
        v17 += 16;
      }
      while (v12 != v16);
    }
    objc_msgSend(MEMORY[0x1E0CC1928], "polylineWithPoints:count:", v13, v12);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    -[MKMapView addOverlay:level:](self->_mapView, "addOverlay:level:", v20, 0);
    free(v13);
    objc_msgSend(v20, "boundingMapRect");
    -[MKMapView setVisibleMapRect:edgePadding:animated:](self->_mapView, "setVisibleMapRect:edgePadding:animated:", 0);
  }

}

- (void)setLocationReadings:(id)a3
{
  objc_storeStrong((id *)&self->_locationReadings, a3);
  -[HKRouteView _clearMapViewIfNeeded](self, "_clearMapViewIfNeeded");
  -[HKRouteView _displayMapRouteForLocationReadings](self, "_displayMapRouteForLocationReadings");
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1878]), "initWithAnnotation:reuseIdentifier:", v4, 0);
    if (objc_msgSend(v4, "isStartPoint"))
      HKUIStandardMapGreenColor();
    else
      HKUIStandardMapRedColor();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMarkerTintColor:", v6);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v5;
  _GradientPolylineRenderer *v6;

  v5 = a4;
  v6 = -[_GradientPolylineRenderer initWithOverlay:locationReadings:]([_GradientPolylineRenderer alloc], "initWithOverlay:locationReadings:", v5, self->_locationReadings);

  -[MKOverlayPathRenderer setLineWidth:](v6, "setLineWidth:", 15.0);
  return v6;
}

- (UIButton)toggleMapTypeButton
{
  return self->_toggleMapTypeButton;
}

- (void)setToggleMapTypeButton:(id)a3
{
  objc_storeStrong((id *)&self->_toggleMapTypeButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleMapTypeButton, 0);
  objc_storeStrong((id *)&self->_locationReadings, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
}

@end
