@implementation CLKUIAlmanacTransitInfo

- (CLKUIAlmanacTransitInfo)initWithCoder:(id)a3
{
  id v4;
  CLKUIAlmanacTransitInfo *v5;
  uint64_t v6;
  NSDate *day;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  uint64_t v13;
  NSDate *rise;
  uint64_t v15;
  NSDate *solarNoon;
  uint64_t v17;
  NSDate *set;
  uint64_t v19;
  NSDate *solarMidnight;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CLKUIAlmanacTransitInfo;
  v5 = -[CLKUIAlmanacTransitInfo init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("day"));
    v6 = objc_claimAutoreleasedReturnValue();
    day = v5->_day;
    v5->_day = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lat"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v5->_location.latitude = v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lon"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v5->_location.longitude = v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("constantSun"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_constantSun = objc_msgSend(v12, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rise"));
    v13 = objc_claimAutoreleasedReturnValue();
    rise = v5->_rise;
    v5->_rise = (NSDate *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("solarNoon"));
    v15 = objc_claimAutoreleasedReturnValue();
    solarNoon = v5->_solarNoon;
    v5->_solarNoon = (NSDate *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("set"));
    v17 = objc_claimAutoreleasedReturnValue();
    set = v5->_set;
    v5->_set = (NSDate *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("solarMidnight"));
    v19 = objc_claimAutoreleasedReturnValue();
    solarMidnight = v5->_solarMidnight;
    v5->_solarMidnight = (NSDate *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *day;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  day = self->_day;
  v8 = a3;
  objc_msgSend(v8, "encodeObject:forKey:", day, CFSTR("day"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_location.latitude);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("lat"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_location.longitude);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("lon"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_constantSun);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("constantSun"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_rise, CFSTR("rise"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_solarNoon, CFSTR("solarNoon"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_set, CFSTR("set"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_solarMidnight, CFSTR("solarMidnight"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)transitInfoForDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDate:", v4);

  return v5;
}

+ (id)transitInfoForDate:(id)a3 location:(id)a4
{
  double var1;
  double var0;
  id v7;
  void *v8;

  var1 = a4.var1;
  var0 = a4.var0;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDate:location:", v7, var0, var1);

  return v8;
}

+ (id)transitInfoForDate:(id)a3 city:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDate:city:", v7, v6);

  return v8;
}

+ (id)transitInfoForDate:(id)a3 location:(id)a4 sunAltitude:(double)a5
{
  double var1;
  double var0;
  id v9;
  void *v10;

  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDate:location:sunAltitude:", v9, var0, var1, a5);

  return v10;
}

+ (id)transitInfoForDate:(id)a3 city:(id)a4 sunAltitude:(double)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDate:city:sunAltitude:", v9, v8, a5);

  return v10;
}

- (CLKUIAlmanacTransitInfo)initWithDate:(id)a3
{
  return -[CLKUIAlmanacTransitInfo initWithDate:location:](self, "initWithDate:location:", a3, -180.0, -180.0);
}

- (CLKUIAlmanacTransitInfo)initWithDate:(id)a3 location:(id)a4
{
  return -[CLKUIAlmanacTransitInfo initWithDate:location:sunAltitude:](self, "initWithDate:location:sunAltitude:", a3, a4.var0, a4.var1, *MEMORY[0x1E0D26430]);
}

- (CLKUIAlmanacTransitInfo)initWithDate:(id)a3 city:(id)a4
{
  return -[CLKUIAlmanacTransitInfo initWithDate:city:sunAltitude:](self, "initWithDate:city:sunAltitude:", a3, a4, *MEMORY[0x1E0D26430]);
}

- (CLKUIAlmanacTransitInfo)initWithDate:(id)a3 location:(id)a4 sunAltitude:(double)a5
{
  double var1;
  double var0;
  id v9;
  void *v10;
  double v11;
  double v12;
  CLKUIAlmanacTransitInfo *v13;

  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  *(float *)&v11 = var0;
  objc_msgSend(v10, "setLatitude:", v11);
  *(float *)&v12 = var1;
  objc_msgSend(v10, "setLongitude:", v12);
  v13 = -[CLKUIAlmanacTransitInfo initWithDate:city:sunAltitude:](self, "initWithDate:city:sunAltitude:", v9, v10, a5);

  return v13;
}

- (id)_dateOrNil:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a3 == 0.0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (CLKUIAlmanacTransitInfo)initWithDate:(id)a3 city:(id)a4 sunAltitude:(double)a5
{
  id v8;
  id v9;
  float v10;
  double v11;
  double v12;
  CLKUIAlmanacTransitInfo *v13;
  float v14;
  double v15;
  float v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v35;
  id v36[3];
  objc_super v37;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "latitude");
  if (v10 == -180.0)
  {
    objc_msgSend(v9, "longitude");
    if (*(float *)&v11 == -180.0)
    {
      LODWORD(v11) = 1108698724;
      objc_msgSend(v9, "setLatitude:", v11);
      LODWORD(v12) = -1024203161;
      objc_msgSend(v9, "setLongitude:", v12);
    }
  }
  v37.receiver = self;
  v37.super_class = (Class)CLKUIAlmanacTransitInfo;
  v13 = -[CLKUIAlmanacTransitInfo init](&v37, sel_init);
  if (v13)
  {
    objc_msgSend(v9, "latitude");
    v15 = v14;
    *(double *)&v36[1] = v14;
    objc_msgSend(v9, "longitude");
    v17 = v16;
    *(double *)&v36[2] = v16;
    objc_msgSend(v9, "timeZone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length");

    if (v19)
    {
      v20 = (void *)MEMORY[0x1E0C99E80];
      objc_msgSend(v9, "timeZone");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timeZoneWithName:", v21);
    }
    else
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", v15, v17);
      objc_msgSend(MEMORY[0x1E0C9E390], "_timeZoneAtLocation:", v21);
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0;
    v36[0] = 0;
    startAndEndOfDayForDateInTimeZone(v36, &v35, v8, v22);
    v23 = v36[0];
    v24 = v35;
    -[CLKUIAlmanacTransitInfo setDay:](v13, "setDay:", v23);
    -[CLKUIAlmanacTransitInfo setTomorrow:](v13, "setTomorrow:", v24);
    -[CLKUIAlmanacTransitInfo setLocation:](v13, "setLocation:", v15, v17);
    v25 = objc_alloc(MEMORY[0x1E0D27558]);
    objc_msgSend(v23, "timeIntervalSinceReferenceDate");
    v27 = v26;

    v28 = (void *)objc_msgSend(v25, "initWithLocation:time:altitudeInDegrees:accuracy:", v15, v17, v27, a5, 60.0);
    objc_msgSend(v28, "nextEventOfType:", 16);
    -[CLKUIAlmanacTransitInfo _dateOrNil:](v13, "_dateOrNil:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIAlmanacTransitInfo setSolarNoon:](v13, "setSolarNoon:", v29);

    objc_msgSend(v28, "nextEventOfType:", 512);
    -[CLKUIAlmanacTransitInfo _dateOrNil:](v13, "_dateOrNil:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIAlmanacTransitInfo setSolarMidnight:](v13, "setSolarMidnight:", v30);

    objc_msgSend(v28, "nextEventOfType:", 8);
    -[CLKUIAlmanacTransitInfo _dateOrNil:](v13, "_dateOrNil:");
    v31 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "nextEventOfType:", 32);
    -[CLKUIAlmanacTransitInfo _dateOrNil:](v13, "_dateOrNil:");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 | v32)
    {
      -[CLKUIAlmanacTransitInfo setRise:](v13, "setRise:", v31);
      -[CLKUIAlmanacTransitInfo setSet:](v13, "setSet:", v32);
    }
    else
    {
      objc_msgSend(v8, "timeIntervalSinceReferenceDate");
      if (geo_isDayLightForLocation())
        v33 = 2;
      else
        v33 = 1;
      -[CLKUIAlmanacTransitInfo setConstantSun:](v13, "setConstantSun:", v33);
    }

  }
  return v13;
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
  -[CLKUIAlmanacTransitInfo rise](self, "rise");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIAlmanacTransitInfo solarNoon](self, "solarNoon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIAlmanacTransitInfo set](self, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p rise: %@ solarNoon: %@ set: %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isDateWithinTransitInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[CLKUIAlmanacTransitInfo day](self, "day");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIAlmanacTransitInfo tomorrow](self, "tomorrow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = isDateBetweenDates(v4, v5, v6);

  return v7;
}

- (NSDate)day
{
  return self->_day;
}

- (void)setDay:(id)a3
{
  objc_storeStrong((id *)&self->_day, a3);
}

- (NSDate)tomorrow
{
  return self->_tomorrow;
}

- (void)setTomorrow:(id)a3
{
  objc_storeStrong((id *)&self->_tomorrow, a3);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)location
{
  double latitude;
  double longitude;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitude = self->_location.latitude;
  longitude = self->_location.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setLocation:(id)a3
{
  self->_location = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (int64_t)constantSun
{
  return self->_constantSun;
}

- (void)setConstantSun:(int64_t)a3
{
  self->_constantSun = a3;
}

- (NSDate)rise
{
  return self->_rise;
}

- (void)setRise:(id)a3
{
  objc_storeStrong((id *)&self->_rise, a3);
}

- (NSDate)solarNoon
{
  return self->_solarNoon;
}

- (void)setSolarNoon:(id)a3
{
  objc_storeStrong((id *)&self->_solarNoon, a3);
}

- (NSDate)set
{
  return self->_set;
}

- (void)setSet:(id)a3
{
  objc_storeStrong((id *)&self->_set, a3);
}

- (NSDate)solarMidnight
{
  return self->_solarMidnight;
}

- (void)setSolarMidnight:(id)a3
{
  objc_storeStrong((id *)&self->_solarMidnight, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_solarMidnight, 0);
  objc_storeStrong((id *)&self->_set, 0);
  objc_storeStrong((id *)&self->_solarNoon, 0);
  objc_storeStrong((id *)&self->_rise, 0);
  objc_storeStrong((id *)&self->_tomorrow, 0);
  objc_storeStrong((id *)&self->_day, 0);
}

@end
