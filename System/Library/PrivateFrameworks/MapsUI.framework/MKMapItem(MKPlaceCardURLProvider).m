@implementation MKMapItem(MKPlaceCardURLProvider)

- (id)sharingURL
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CC19D0]);
  v6[0] = a1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "urlForOpeningMapItems:options:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)thumbnailWithSize:()MKPlaceCardURLProvider annotationView:
{
  id v8;
  void *v9;
  void *v10;
  double v11;
  double latitude;
  double v13;
  double longitude;
  double v15;
  CLLocationDegrees v16;
  CLLocationDegrees v17;
  CLLocationCoordinate2D v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;

  v8 = a5;
  objc_msgSend(a1, "placemark");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(a1, "placemark");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "coordinate");
    latitude = v11;
    longitude = v13;

  }
  else
  {
    objc_msgSend(a1, "_coordinate");
    v16 = v15;
    objc_msgSend(a1, "_coordinate");
    v18 = CLLocationCoordinate2DMake(v16, v17);
    latitude = v18.latitude;
    longitude = v18.longitude;
  }
  v19 = objc_alloc_init(MEMORY[0x1E0CC1860]);
  objc_msgSend(v19, "setSize:", a2, a3);
  objc_msgSend(v19, "size");
  MKCoordinateRegionMakeWithZoomLevel();
  objc_msgSend(v19, "setRegion:");
  objc_msgSend(v19, "_setShowsAppleLogo:", 0);
  objc_msgSend(MEMORY[0x1E0CC1850], "createSnapshotWithOptions:timeoutInSeconds:", v19, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    if (v8)
      objc_msgSend(v20, "snapshotWithAnnotationView:atCoordinate:", v8, latitude, longitude);
    else
      objc_msgSend(v20, "image");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

@end
