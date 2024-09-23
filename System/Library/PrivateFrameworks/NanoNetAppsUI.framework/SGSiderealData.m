@implementation SGSiderealData

+ ($F24F406B2B787EFB06265DBA3D28CBD5)_geoLocationForLocation:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v3 = a3;
  objc_msgSend(v3, "coordinate");
  v5 = v4;
  objc_msgSend(v3, "coordinate");
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

+ (double)_absoluteTimeToJulianDay:(double)a3
{
  return a3 / 86400.0 + 2440587.5;
}

- (SGSiderealData)initWithStartOfDay:(double)a3 location:(id)a4 useXR:(BOOL)a5
{
  id v9;
  SGSiderealData *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _BOOL4 v24;
  double v25;
  double v26;
  double v27;
  char v28;
  double v29;
  double v30;
  objc_super v32;

  v9 = a4;
  v32.receiver = self;
  v32.super_class = (Class)SGSiderealData;
  v10 = -[SGSiderealData init](&v32, sel_init);
  if (v10)
  {
    +[SGSiderealData _geoLocationForLocation:](SGSiderealData, "_geoLocationForLocation:", v9);
    v12 = v11;
    v14 = v13;
    v15 = objc_alloc(MEMORY[0x24BE3D060]);
    v16 = (void *)objc_msgSend(v15, "initWithLocation:time:altitudeInDegrees:accuracy:", v12, v14, a3, *MEMORY[0x24BE3C908], 60.0);
    objc_msgSend(v16, "nextEventOfType:", 8);
    v18 = v17;
    objc_msgSend(v16, "nextEventOfType:", 32);
    v20 = v19;
    objc_msgSend(v16, "nextEventOfType:", 16);
    v22 = v21;
    v10->_useXR = a5;
    objc_storeStrong((id *)&v10->_location, a4);
    v10->_startOfDay = a3;
    v10->_solarNoonTime = v22;
    v10->_sunriseTime = v18;
    v10->_sunsetTime = v20;
    v23 = v20 - v18;
    v10->_sunsetFollowsSunrise = v23 > 0.0;
    v24 = -[SGSiderealData sunsetFollowsSunrise](v10, "sunsetFollowsSunrise");
    v25 = 0.0;
    if (v24 && v23 >= 14400.0)
    {
      v26 = a3 + 86400.0 - v20;
      if (v23 < 28800.0)
      {
        if (v26 >= 7200.0)
          v27 = v20;
        else
          v27 = a3 + 79200.0;
        v28 = 1;
        v25 = v22;
        goto LABEL_15;
      }
      if (v23 < 72000.0)
      {
        v25 = v20 + -14400.0;
        if (v26 >= 7200.0)
          v27 = v20;
        else
          v27 = a3 + 79200.0;
        v28 = 1;
        goto LABEL_15;
      }
    }
    v28 = 0;
    v27 = 0.0;
LABEL_15:
    v10->_sunsetFilterEnabled = v28;
    -[SGSiderealData timeToProgress:](v10, "timeToProgress:", v25);
    v10->_sunsetFilterRampUpStartProgress = v29;
    -[SGSiderealData timeToProgress:](v10, "timeToProgress:", v27);
    v10->_sunsetFilterRampDownStartProgress = v30;

  }
  return v10;
}

- (double)timeToProgress:(double)a3
{
  double result;

  CLKMapFractionIntoRange();
  return result;
}

- (double)pseudoAltitudeForProgress:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;

  CLKMapFractionIntoRange();
  v5 = v4;
  +[SGSiderealData _geoLocationForLocation:](SGSiderealData, "_geoLocationForLocation:", self->_location);
  v7 = v6;
  v9 = v8;
  +[SGSiderealData _absoluteTimeToJulianDay:](SGSiderealData, "_absoluteTimeToJulianDay:", v5);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3CBF8]), "initWithLocation:julianDay:body:useHighPrecision:", 0, 0, v7, v9, v10);
  objc_msgSend(v11, "altitude");
  CLKMapFractionIntoRange();
  v13 = v12;

  return v13;
}

- (double)sunsetFilter:(double)a3
{
  double result;
  float v5;
  float sunsetFilterRampUpStartProgress;
  float v7;
  float v8;

  result = 0.0;
  if (self->_sunsetFilterEnabled && self->_useXR)
  {
    v5 = a3;
    sunsetFilterRampUpStartProgress = self->_sunsetFilterRampUpStartProgress;
    v7 = self->_sunsetFilterRampDownStartProgress - sunsetFilterRampUpStartProgress;
    v8 = (float)((float)((float)((float)(v7 + -0.083333) * 0.5) + 0.083333) / 0.083333)
       - fabsf((float)((float)((float)(v5 + -0.083333) - sunsetFilterRampUpStartProgress)- (float)((float)(v7 + -0.083333) * 0.5))/ 0.083333);
    if (v8 < 0.0)
      v8 = 0.0;
    return fminf(v8, 1.0);
  }
  return result;
}

- (id)_applySunsetFilter:(double)a3 toColor:
{
  __int128 v3;

  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", *(float *)&v3, *((float *)&v3 + 1) + a3 * -0.08 * 0.745, *((float *)&v3 + 2), *((float *)&v3 + 3));
}

- (id)gradientWithSunsetFilterForDayProgress:(double)a3
{
  double v5;
  double v6;
  _BOOL4 useXR;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v23;
  double v24;
  _QWORD v25[4];

  v25[3] = *MEMORY[0x24BDAC8D0];
  -[SGSiderealData pseudoAltitudeForProgress:](self, "pseudoAltitudeForProgress:");
  v6 = v5;
  useXR = self->_useXR;
  +[SGSiderealColorManager sharedInstance](SGSiderealColorManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (useXR)
    objc_msgSend(v8, "dayGradientCurveP3");
  else
    objc_msgSend(v8, "dayGradientColorCurves");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rgbfColorForFraction:", v6);
  CLKUIConvertToXRSRGBfFromRGBf();

  objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rgbfColorForFraction:", v6);
  CLKUIConvertToXRSRGBfFromRGBf();
  v24 = v13;

  objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rgbfColorForFraction:", v6);
  CLKUIConvertToXRSRGBfFromRGBf();
  v23 = v15;

  -[SGSiderealData sunsetFilter:](self, "sunsetFilter:", a3);
  v17 = v16;
  -[SGSiderealData _applySunsetFilter:toColor:](self, "_applySunsetFilter:toColor:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSiderealData _applySunsetFilter:toColor:](self, "_applySunsetFilter:toColor:", v17, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSiderealData _applySunsetFilter:toColor:](self, "_applySunsetFilter:toColor:", v17, v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v18;
  v25[1] = v19;
  v25[2] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (BOOL)useXR
{
  return self->_useXR;
}

- (BOOL)sunsetFollowsSunrise
{
  return self->_sunsetFollowsSunrise;
}

- (BOOL)sunsetFilterEnabled
{
  return self->_sunsetFilterEnabled;
}

- (CLLocation)location
{
  return self->_location;
}

- (double)startOfDay
{
  return self->_startOfDay;
}

- (double)solarNoonTime
{
  return self->_solarNoonTime;
}

- (double)sunsetTime
{
  return self->_sunsetTime;
}

- (double)sunriseTime
{
  return self->_sunriseTime;
}

- (double)sunsetFilterRampUpStartProgress
{
  return self->_sunsetFilterRampUpStartProgress;
}

- (double)sunsetFilterRampDownStartProgress
{
  return self->_sunsetFilterRampDownStartProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
}

@end
