@implementation GEOCelestialEphemeris

- (double)parallacticAngle
{
  return self->_parallacticAngle;
}

- (double)phaseAngle
{
  return self->_phaseAngle;
}

- (GEOCelestialEphemeris)initWithLocation:(id)a3 date:(id)a4 body:(int64_t)a5
{
  return -[GEOCelestialEphemeris initWithLocation:date:body:useHighPrecision:](self, "initWithLocation:date:body:useHighPrecision:", a4, a5, 0, a3.var0, a3.var1);
}

- (GEOHorizontalCelestialBodyData)horizontalCoord
{
  GEOHorizontalCelestialBodyData *horizontalCoord;
  GEOHorizontalCelestialBodyData *v4;
  GEOHorizontalCelestialBodyData *v5;

  horizontalCoord = self->_horizontalCoord;
  if (!horizontalCoord)
  {
    v4 = -[GEOHorizontalCelestialBodyData initWithLocation:julianDay:body:useHighPrecision:]([GEOHorizontalCelestialBodyData alloc], "initWithLocation:julianDay:body:useHighPrecision:", self->_body, self->_highPrecision, self->_coordinate.latitude, self->_coordinate.longitude, self->_julianDay);
    v5 = self->_horizontalCoord;
    self->_horizontalCoord = v4;

    horizontalCoord = self->_horizontalCoord;
  }
  return horizontalCoord;
}

- (GEOCelestialEphemeris)initWithLocation:(id)a3 date:(id)a4 body:(int64_t)a5 useHighPrecision:(BOOL)a6
{
  _BOOL8 v6;
  double var1;
  double var0;
  CAADynamicalTime *v11;
  double v12;
  double v13;
  double v14;
  CAAMoon *v15;
  double v16;
  double v17;

  v6 = a6;
  var1 = a3.var1;
  var0 = a3.var0;
  v11 = (CAADynamicalTime *)objc_msgSend(a4, "geo_julianDay");
  v13 = v12;
  if (a5)
  {
    if (a5 == 4)
    {
      v14 = CAADynamicalTime::UTC2TT(v11, v12);
      v16 = CAAMoon::RadiusVector(v15, v14);
      v17 = asin(6378.14 / v16) * 57.2957795 * 0.7275 + -0.5666;
    }
    else
    {
      v17 = -0.5667;
    }
  }
  else
  {
    v17 = -0.8333;
  }
  return -[GEOCelestialEphemeris initWithLocation:julianDay:body:altitude:useHighPrecision:](self, "initWithLocation:julianDay:body:altitude:useHighPrecision:", a5, v6, var0, var1, v13, v17);
}

- (GEOCelestialEphemeris)initWithLocation:(id)a3 julianDay:(double)a4 body:(int64_t)a5 altitude:(double)a6 useHighPrecision:(BOOL)a7
{
  _BOOL8 v7;
  double var1;
  double var0;
  GEOCelestialEphemeris *v13;
  GEOCelestialEphemeris *v14;
  GEOCelestialRiseTransitSet *v15;
  double v16;
  double v17;
  double v18;
  CAARiseTransitSet *v19;
  GEOCelestialRiseTransitSet *v20;
  GEOCelestialRiseTransitSet *v21;
  int v22;
  double v23;
  GEOCelestialRiseTransitSet *v24;
  int v25;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  __double2 v32;
  __double2 v33;
  long double v34;
  long double v35;
  CAAMoonIlluminatedFraction *v36;
  double v37;
  __double2 v38;
  long double v39;
  double v40;
  double v42;
  double v43;
  _OWORD v44[3];
  _OWORD v45[3];
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  objc_super v52;

  v7 = a7;
  var1 = a3.var1;
  var0 = a3.var0;
  v52.receiver = self;
  v52.super_class = (Class)GEOCelestialEphemeris;
  v13 = -[GEOCelestialEphemeris init](&v52, sel_init);
  v14 = v13;
  if (v13)
  {
    v15 = 0;
    v13->_julianDay = a4;
    v13->_coordinate.latitude = var0;
    v13->_coordinate.longitude = var1;
    v13->_body = a5;
    v13->_highPrecision = v7;
    v16 = floor(a4 * 1440.0);
    v17 = a4 + -0.014;
    v18 = -var1;
    do
    {
      v51 = 0.0;
      v49 = 0.0;
      v50 = 0.0;
      v47 = 0.0;
      v48 = 0.0;
      v46 = 0.0;
      getRightAscension((CAADynamicalTime *)&v51, &v50, a5, v7, v17 + -1.0);
      getRightAscension((CAADynamicalTime *)&v49, &v48, a5, v7, v17);
      getRightAscension((CAADynamicalTime *)&v47, &v46, a5, v7, v17 + 1.0);
      CAARiseTransitSet::Calculate(v19, v17, v51, v50, v49, v48, v47, v46, v18, (uint64_t)v45, var0, a6);
      v20 = [GEOCelestialRiseTransitSet alloc];
      v44[0] = v45[0];
      v44[1] = v45[1];
      v44[2] = v45[2];
      v21 = -[GEOCelestialRiseTransitSet initWithJulianDay:riseTransitSet:](v20, "initWithJulianDay:riseTransitSet:", v44, v17);
      v22 = -[GEOCelestialRiseTransitSet _numberOfEvents](v21, "_numberOfEvents");
      if (v22 >= 1)
      {
        -[GEOCelestialRiseTransitSet _oldestEventInJulianDay](v21, "_oldestEventInJulianDay");
        if (ceil(v23 * 1440.0) >= v16)
        {
          if (v15)
          {
            if (-[GEOCelestialRiseTransitSet _numberOfEvents](v15, "_numberOfEvents") < v22)
            {
              v24 = v21;

              v15 = v24;
            }
          }
          else
          {
            v15 = v21;
          }
        }
      }

      v25 = -[GEOCelestialRiseTransitSet _numberOfEvents](v15, "_numberOfEvents");
      v17 = v17 + 0.014;
    }
    while (v17 < a4 + -0.014 + 0.25 && v25 != 3);
    objc_storeStrong((id *)&v14->_riseTransitSet, v15);
    if (a5 == 4)
    {
      *(_QWORD *)&v45[0] = 0;
      v51 = 0.0;
      getRightAscension((CAADynamicalTime *)v45, &v51, 4, v7, a4);
      v49 = 0.0;
      v50 = 0.0;
      getRightAscension((CAADynamicalTime *)&v50, &v49, 0, v7, a4);
      v42 = v51;
      v43 = *(double *)v45;
      v28 = v49;
      v27 = v50;
      v29 = *(double *)v45 * 15.0 * 0.0174532925;
      v30 = v50 * 15.0 * 0.0174532925;
      v31 = v51 * 0.0174532925;
      v32 = __sincos_stret(v49 * 0.0174532925);
      v33 = __sincos_stret(v31);
      v34 = cos(v30 - v29);
      v35 = acos(v33.__cosval * v32.__cosval * v34 + v32.__sinval * v33.__sinval) * 57.2957795;
      v14->_elongation = v35;
      CAAMoonIlluminatedFraction::PositionAngle(v36, v27, v28, v43, v42);
      v14->_parallacticAngle = v37;
      v38 = __sincos_stret(v35 * 0.0174532925);
      v39 = atan2(v38.__sinval * 149971520.0, v38.__cosval * -149971520.0 + 368410.0);
      v40 = fmod(v39 * 57.2957795, 360.0);
      if (v40 < 0.0)
        v40 = v40 + 360.0;
      v14->_phaseAngle = v40;
      v14->_illuminatedFraction = (cos(v40 * 0.0174532925) + 1.0) * 0.5;
    }

  }
  return v14;
}

- (double)illuminatedFraction
{
  return self->_illuminatedFraction;
}

- (double)librationPositionAngle
{
  NSNumber *librationPositionAngle;
  double v4;
  id v5;
  NSNumber *v6;
  NSNumber *v7;
  double result;
  double v9[7];

  if (self->_body != 4)
    return 0.0;
  librationPositionAngle = self->_librationPositionAngle;
  if (!librationPositionAngle)
  {
    v4 = CAADynamicalTime::UTC2TT(0, self->_julianDay);
    CAAPhysicalMoon::CalculateTopocentric(v4, -self->_coordinate.longitude, self->_coordinate.latitude, v9);
    v5 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v6 = (NSNumber *)objc_msgSend(v5, "initWithDouble:", v9[6]);
    v7 = self->_librationPositionAngle;
    self->_librationPositionAngle = v6;

    librationPositionAngle = self->_librationPositionAngle;
  }
  -[NSNumber doubleValue](librationPositionAngle, "doubleValue");
  return result;
}

- (double)radiusVector
{
  NSNumber *radiusVector;
  NSNumber *v4;
  NSNumber *v5;
  double result;

  radiusVector = self->_radiusVector;
  if (!radiusVector)
  {
    v4 = (NSNumber *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", _GEORadiusVector((CAAMoon *)self->_body, (CAAUranus *)self->_highPrecision, self->_julianDay));
    v5 = self->_radiusVector;
    self->_radiusVector = v4;

    radiusVector = self->_radiusVector;
  }
  -[NSNumber doubleValue](radiusVector, "doubleValue");
  return result;
}

- (double)topocentricParallacticAngle
{
  NSNumber *topocentricParallacticAngle;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  CAAParallax *v10;
  double v11;
  double v12;
  CAASidereal *v13;
  double v14;
  double v15;
  double latitude;
  double longitude;
  double v18;
  double v19;
  id v20;
  NSNumber *v21;
  NSNumber *v22;
  double result;

  if (self->_body != 4)
    return 0.0;
  topocentricParallacticAngle = self->_topocentricParallacticAngle;
  if (!topocentricParallacticAngle)
  {
    v4 = CAADynamicalTime::UTC2TT(0, self->_julianDay);
    -[GEOCelestialEphemeris radiusVector](self, "radiusVector");
    v6 = v5;
    -[GEOCelestialEphemeris equatorialCoord](self, "equatorialCoord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rightAscension");
    v9 = v8;
    v10 = (CAAParallax *)objc_msgSend(v7, "declination");
    v12 = CAAParallax::Equatorial2Topocentric(v10, v9, v11, v6 / 149597871.0, -self->_coordinate.longitude, self->_coordinate.latitude, 0.0, v4);
    CAASidereal::ApparentGreenwichSiderealTime(v13, self->_julianDay);
    v15 = v14;
    latitude = self->_coordinate.latitude;
    longitude = self->_coordinate.longitude;
    objc_msgSend(v7, "declination");
    v19 = v18;
    v20 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v21 = (NSNumber *)objc_msgSend(v20, "initWithDouble:", (double)CAAParallactic::ParallacticAngle((CAAParallactic *)v20, v15 + longitude / 15.0 - v12, latitude, v19));
    v22 = self->_topocentricParallacticAngle;
    self->_topocentricParallacticAngle = v21;

    topocentricParallacticAngle = self->_topocentricParallacticAngle;
  }
  -[NSNumber doubleValue](topocentricParallacticAngle, "doubleValue");
  return result;
}

- (GEOEquatorialCelestialBodyData)equatorialCoord
{
  GEOEquatorialCelestialBodyData *equatorialCoord;
  GEOEquatorialCelestialBodyData *v4;
  GEOEquatorialCelestialBodyData *v5;

  equatorialCoord = self->_equatorialCoord;
  if (!equatorialCoord)
  {
    v4 = -[GEOEquatorialCelestialBodyData initWithJulianDay:body:useHighPrecision:]([GEOEquatorialCelestialBodyData alloc], "initWithJulianDay:body:useHighPrecision:", self->_body, self->_highPrecision, self->_julianDay);
    v5 = self->_equatorialCoord;
    self->_equatorialCoord = v4;

    equatorialCoord = self->_equatorialCoord;
  }
  return equatorialCoord;
}

- (double)elongation
{
  return self->_elongation;
}

- (NSDate)rise
{
  return -[GEOCelestialRiseTransitSet rise](self->_riseTransitSet, "rise");
}

- (NSDate)transit
{
  return -[GEOCelestialRiseTransitSet transit](self->_riseTransitSet, "transit");
}

- (BOOL)isTransitAboveHorizon
{
  return -[GEOCelestialRiseTransitSet isTransitAboveHorizon](self->_riseTransitSet, "isTransitAboveHorizon");
}

- (NSDate)set
{
  return -[GEOCelestialRiseTransitSet set](self->_riseTransitSet, "set");
}

- (GEOSolarEclipticCelestialBodyData)eclipticCoord
{
  GEOSolarEclipticCelestialBodyData *eclipticCoord;
  GEOSolarEclipticCelestialBodyData *v4;
  GEOSolarEclipticCelestialBodyData *v5;

  eclipticCoord = self->_eclipticCoord;
  if (!eclipticCoord)
  {
    v4 = -[GEOSolarEclipticCelestialBodyData initWithJulianDay:body:useHighPrecision:]([GEOSolarEclipticCelestialBodyData alloc], "initWithJulianDay:body:useHighPrecision:", self->_body, self->_highPrecision, self->_julianDay);
    v5 = self->_eclipticCoord;
    self->_eclipticCoord = v4;

    eclipticCoord = self->_eclipticCoord;
  }
  return eclipticCoord;
}

- (double)topocentricRadiusVector
{
  NSNumber *topocentricRadiusVector;
  double v4;
  CAASidereal *v5;
  double v6;
  void *v7;
  double v8;
  __double2 v9;
  double v10;
  long double v11;
  double v12;
  __double2 v13;
  __double2 v14;
  double v15;
  double v16;
  double longitude;
  double v18;
  double v19;
  id v20;
  long double v21;
  double v22;
  __double2 v23;
  NSNumber *v24;
  NSNumber *v25;
  double result;
  double v27;

  if (self->_body == 4)
  {
    topocentricRadiusVector = self->_topocentricRadiusVector;
    if (!topocentricRadiusVector)
    {
      v4 = CAADynamicalTime::UTC2TT(0, self->_julianDay);
      CAASidereal::ApparentGreenwichSiderealTime(v5, v4);
      v27 = v6;
      -[GEOCelestialEphemeris equatorialCoord](self, "equatorialCoord");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "declination");
      v9 = __sincos_stret(v8 * 0.0174532925);
      v10 = self->_coordinate.latitude * 0.0174532925;
      v11 = tan(v10);
      v12 = atan(v11 * 0.99664719);
      v13 = __sincos_stret(v12);
      v14 = __sincos_stret(v10);
      -[GEOCelestialEphemeris radiusVector](self, "radiusVector");
      v16 = v15;
      longitude = self->_coordinate.longitude;
      objc_msgSend(v7, "rightAscension");
      v19 = v18;
      v20 = objc_alloc(MEMORY[0x1E0CB37E8]);
      v21 = asin(0.0000426345151 / (v16 / 149597871.0));
      v22 = sin(v21);
      v23 = __sincos_stret((v27 + longitude / 15.0 - v19) * 0.261799388);
      v24 = (NSNumber *)objc_msgSend(v20, "initWithDouble:", v16* sqrt((v9.__cosval * v23.__cosval - (v13.__cosval + v14.__cosval * 0.0) * v22)* (v9.__cosval * v23.__cosval - (v13.__cosval + v14.__cosval * 0.0) * v22)+ v9.__cosval * v23.__sinval * (v9.__cosval * v23.__sinval)+ (v9.__sinval - (v14.__sinval * 0.0 + v13.__sinval * 0.99664719) * v22)* (v9.__sinval - (v14.__sinval * 0.0 + v13.__sinval * 0.99664719) * v22)));
      v25 = self->_topocentricRadiusVector;
      self->_topocentricRadiusVector = v24;

      topocentricRadiusVector = self->_topocentricRadiusVector;
    }
    -[NSNumber doubleValue](topocentricRadiusVector, "doubleValue");
  }
  else
  {
    -[GEOCelestialEphemeris radiusVector](self, "radiusVector");
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCelestialEphemeris rise](self, "rise");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCelestialEphemeris transit](self, "transit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCelestialEphemeris set](self, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p rise / transit / set:  %@ / %@ / %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topocentricRadiusVector, 0);
  objc_storeStrong((id *)&self->_radiusVector, 0);
  objc_storeStrong((id *)&self->_librationPositionAngle, 0);
  objc_storeStrong((id *)&self->_topocentricParallacticAngle, 0);
  objc_storeStrong((id *)&self->_horizontalCoord, 0);
  objc_storeStrong((id *)&self->_equatorialCoord, 0);
  objc_storeStrong((id *)&self->_eclipticCoord, 0);
  objc_storeStrong((id *)&self->_riseTransitSet, 0);
}

@end
