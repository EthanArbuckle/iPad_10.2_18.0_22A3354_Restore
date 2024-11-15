@implementation GEOSolarEclipticCelestialBodyData

- (GEOSolarEclipticCelestialBodyData)initWithDate:(id)a3 body:(int64_t)a4
{
  return -[GEOSolarEclipticCelestialBodyData initWithDate:body:useHighPrecision:](self, "initWithDate:body:useHighPrecision:", a3, a4, 0);
}

- (GEOSolarEclipticCelestialBodyData)initWithDate:(id)a3 body:(int64_t)a4 useHighPrecision:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  GEOSolarEclipticCelestialBodyData *v9;

  v5 = a5;
  v8 = a3;
  objc_msgSend(v8, "geo_julianDay");
  v9 = -[GEOSolarEclipticCelestialBodyData initWithJulianDay:body:useHighPrecision:](self, "initWithJulianDay:body:useHighPrecision:", a4, v5);

  return v9;
}

- (GEOSolarEclipticCelestialBodyData)initWithJulianDay:(double)a3 body:(int64_t)a4 useHighPrecision:(BOOL)a5
{
  _BOOL8 v5;
  GEOSolarEclipticCelestialBodyData *v8;
  GEOSolarEclipticCelestialBodyData *v9;
  double v10;
  double v11;
  double v12;
  objc_super v14;

  v5 = a5;
  v14.receiver = self;
  v14.super_class = (Class)GEOSolarEclipticCelestialBodyData;
  v8 = -[GEOSolarEclipticCelestialBodyData init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    if (a4)
    {
      v10 = CAADynamicalTime::UTC2TT((CAADynamicalTime *)v8, a3);
      _GEOEclipticLongitude((CAAMoon *)a4, (CAASun *)v5, v10);
      v9->_longitude = v11;
      _GEOEclipticLatitude((CAAMoon *)a4, (CAASun *)v5, v10);
      v9->_latitude = v12;
    }
    else
    {
      v8->_latitude = 0.0;
      v8->_longitude = 0.0;
    }
  }
  return v9;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

@end
