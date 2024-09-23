@implementation GEOHorizontalCelestialBodyData

- (double)altitude
{
  return self->_altitude;
}

- (GEOHorizontalCelestialBodyData)initWithLocation:(id)a3 date:(id)a4 body:(int64_t)a5
{
  return -[GEOHorizontalCelestialBodyData initWithLocation:date:body:useHighPrecision:](self, "initWithLocation:date:body:useHighPrecision:", a4, a5, 0, a3.var0, a3.var1);
}

- (GEOHorizontalCelestialBodyData)initWithLocation:(id)a3 date:(id)a4 body:(int64_t)a5 useHighPrecision:(BOOL)a6
{
  _BOOL8 v6;
  double var1;
  double var0;
  id v11;
  double v12;
  GEOHorizontalCelestialBodyData *v13;

  v6 = a6;
  var1 = a3.var1;
  var0 = a3.var0;
  v11 = a4;
  objc_msgSend(v11, "geo_julianDay");
  v13 = -[GEOHorizontalCelestialBodyData initWithLocation:julianDay:body:useHighPrecision:](self, "initWithLocation:julianDay:body:useHighPrecision:", a5, v6, var0, var1, v12);

  return v13;
}

- (GEOHorizontalCelestialBodyData)initWithLocation:(id)a3 julianDay:(double)a4 body:(int64_t)a5 useHighPrecision:(BOOL)a6
{
  _BOOL8 v6;
  double var1;
  double var0;
  GEOHorizontalCelestialBodyData *v11;
  GEOHorizontalCelestialBodyData *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CAANutation *v19;
  double v20;
  CAACoordinateTransformation *v21;
  double v22;
  CAAParallax *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CAASidereal *v28;
  double v29;
  CAACoordinateTransformation *v30;
  double v31;
  double v32;
  double v33;
  objc_super v35;

  v6 = a6;
  var1 = a3.var1;
  var0 = a3.var0;
  v35.receiver = self;
  v35.super_class = (Class)GEOHorizontalCelestialBodyData;
  v11 = -[GEOHorizontalCelestialBodyData init](&v35, sel_init);
  v12 = v11;
  if (v11)
  {
    if (a5 == 3)
    {
      v11->_altitude = 0.0;
      v11->_azimuth = 0.0;
    }
    else
    {
      v13 = CAADynamicalTime::UTC2TT((CAADynamicalTime *)v11, a4);
      _GEOEclipticLongitude((CAAMoon *)a5, (CAASun *)v6, v13);
      v15 = v14;
      _GEOEclipticLatitude((CAAMoon *)a5, (CAASun *)v6, v13);
      v17 = v16;
      v18 = _GEORadiusVector((CAAMoon *)a5, (CAAUranus *)v6, v13);
      v20 = CAANutation::TrueObliquityOfEcliptic(v19, v13);
      v22 = CAACoordinateTransformation::Ecliptic2Equatorial(v21, v15, v17, v20);
      v25 = CAAParallax::Equatorial2Topocentric(v23, v22, v24, v18, -var1, var0, 20.0, v13);
      v27 = v26;
      CAASidereal::ApparentGreenwichSiderealTime(v28, v13);
      v31 = CAACoordinateTransformation::Equatorial2Horizontal(v30, var1 / 15.0 + v29 - v25, v27, var0) + 180.0;
      if (v31 > 360.0)
        v31 = v31 + -360.0;
      v12->_azimuth = v31;
      v33 = -1.9006387;
      if (v32 > -1.9006387)
        v33 = v32;
      v12->_altitude = v32 + (1.02 / tan((v33 + 10.3 / (v33 + 5.11)) * 0.0174532925) + 0.0019279) * 1.0029703 / 60.0;
    }
  }
  return v12;
}

- (double)azimuth
{
  return self->_azimuth;
}

@end
