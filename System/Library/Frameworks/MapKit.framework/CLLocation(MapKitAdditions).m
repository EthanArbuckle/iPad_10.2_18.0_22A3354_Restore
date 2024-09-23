@implementation CLLocation(MapKitAdditions)

+ (double)_mapkit_timeToExpire
{
  void *v0;
  double v1;
  double v2;

  +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "timeScale");
  v2 = 5.0 / v1;

  return v2;
}

@end
