@implementation MapKitFacade

+ (id)setCustomFeatureAnnotationsForSnapshotOptions:(id)a3 coordinate:(CLLocationCoordinate2D)a4 title:(id)a5
{
  double longitude;
  double latitude;
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  longitude = a4.longitude;
  latitude = a4.latitude;
  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (objc_class *)MEMORY[0x1E0CC1858];
  v10 = a5;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithCoordinate:title:representation:", v10, 2, latitude, longitude);

  v14[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setCustomFeatureAnnotations:", v12);

  objc_msgSend(v8, "_setSearchResultsType:", 1);
  return v8;
}

@end
