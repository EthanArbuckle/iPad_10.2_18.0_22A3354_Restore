@implementation SALocation

- (id)_convertedLocation
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init((Class)SFLatLng);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SALocation latitude](self, "latitude"));
  objc_msgSend(v4, "doubleValue");
  objc_msgSend(v3, "setLat:");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SALocation longitude](self, "longitude"));
  objc_msgSend(v5, "doubleValue");
  objc_msgSend(v3, "setLng:");

  return v3;
}

@end
