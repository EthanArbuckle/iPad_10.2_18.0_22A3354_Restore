@implementation ARSkipTileBounds

+ (double)_normalizeLongitude:(double)result
{
  if (result == 180.0)
    return -180.0;
  return result;
}

- (ARSkipTileBounds)initWithCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  ARSkipTileBounds *v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v10.receiver = self;
  v10.super_class = (Class)ARSkipTileBounds;
  v5 = -[ARSkipTileBounds init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "_normalizeLongitude:", longitude);
    *(float *)&v6 = v6 * 10.0;
    v7 = floorf(*(float *)&v6) / 10.0;
    v5->_minLongitude = v7;
    v5->_maxLongitude = v7 + 0.1;
    *(float *)&v7 = latitude * 10.0;
    v8 = floorf(*(float *)&v7) / 10.0;
    v5->_minLatitude = v8;
    v5->_maxLatitude = v8 + 0.1;
  }
  return v5;
}

- (BOOL)isInside:(CLLocationCoordinate2D)a3
{
  double latitude;
  double v5;

  latitude = a3.latitude;
  objc_msgSend((id)objc_opt_class(), "_normalizeLongitude:", a3.longitude);
  return self->_minLatitude <= latitude
      && latitude < self->_maxLatitude
      && self->_minLongitude <= v5
      && v5 < self->_maxLongitude;
}

@end
