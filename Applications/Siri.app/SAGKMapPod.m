@implementation SAGKMapPod

- (id)_convertedCardSections
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  CLLocationDegrees v10;
  void *v11;
  void *v12;
  CLLocationDegrees v13;
  CLLocationCoordinate2D v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v29;

  v3 = objc_alloc_init((Class)SFMapCardSection);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKMapPod location](self, "location"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_convertedLocation"));
  objc_msgSend(v3, "setLocation:", v5);

  v6 = objc_alloc_init((Class)SFColor);
  objc_msgSend(v6, "setRedComponent:", 1.0);
  objc_msgSend(v6, "setAlphaComponent:", 1.0);
  objc_msgSend(v3, "setPinColor:", v6);
  objc_msgSend(v3, "setInteractive:", 0);
  objc_msgSend(v3, "setSizeFormat:", 0);
  objc_msgSend(v3, "setPinBehavior:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKMapPod location](self, "location"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "latitude"));
  objc_msgSend(v8, "doubleValue");
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKMapPod location](self, "location"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "longitude"));
  objc_msgSend(v12, "doubleValue");
  v14 = CLLocationCoordinate2DMake(v10, v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKMapPod zoomLevel](self, "zoomLevel"));
  v16 = objc_msgSend(v15, "doubleValue");
  v18 = SiriUIMapRectMakeWithZoomLevel(v16, v14.latitude, v14.longitude, v17);
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v25 = SiriUIMapRegionFromMapRect(v18, v20, v22, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  objc_msgSend(v3, "setBoundingMapRegion:", v26);

  v29 = v3;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));

  return v27;
}

@end
