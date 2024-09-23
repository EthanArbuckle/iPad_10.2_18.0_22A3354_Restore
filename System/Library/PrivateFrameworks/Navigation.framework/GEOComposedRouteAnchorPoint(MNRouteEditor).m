@implementation GEOComposedRouteAnchorPoint(MNRouteEditor)

- (id)geoLocation
{
  id v2;
  double v3;
  double v4;
  void *v5;
  double v6;

  v2 = objc_alloc(MEMORY[0x1E0D27168]);
  objc_msgSend(a1, "coordinate");
  v5 = (void *)objc_msgSend(v2, "initWithGEOCoordinate:isUserLocation:", objc_msgSend(a1, "isCurrentLocation"), v3, v4);
  objc_msgSend(a1, "coordinate");
  objc_msgSend(v5, "setAltitude:", (int)v6);
  return v5;
}

- (id)loggingDescription
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "locationCoordinate");
  v5 = v4;
  objc_msgSend(a1, "locationCoordinate");
  objc_msgSend(v2, "stringWithFormat:", CFSTR("\"%@\" at %f, %f"), v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
