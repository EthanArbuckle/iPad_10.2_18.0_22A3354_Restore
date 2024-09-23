@implementation CLSPublicEvent

- (CLSPublicEvent)init
{
  CLSPublicEvent *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSPublicEvent;
  result = -[CLSPublicEvent init](&v3, sel_init);
  if (result)
  {
    result->_businessItemCoordinates = (CLLocationCoordinate2D)*MEMORY[0x1E0C9E500];
    *(_OWORD *)&result->_businessItemMuid = xmmword_1CABE90C0;
  }
  return result;
}

- (BOOL)isEnriched
{
  return self->_businessItemMuid != -1;
}

- (id)description
{
  double localEndTime;
  double v4;
  void *v5;
  double v6;
  void *v7;
  NSDateInterval *localDateInterval;
  void *v9;
  void *v10;
  __int128 v12;
  objc_super v13;

  localEndTime = self->_localEndTime;
  v4 = self->_localStartTime / 3600.0;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)CLSPublicEvent;
  v6 = localEndTime / 3600.0;
  -[CLSPublicEvent description](&v13, sel_description);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_OWORD *)&self->_muid;
  localDateInterval = self->_localDateInterval;
  -[CLSPublicEvent isEnriched](self, "isEnriched");
  NSStringFromBOOL();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ muid: %lu, name: %@, dateInterval: %@, startTime: %.2f, endTime: %.2f, isEnriched: %@"), v7, v12, localDateInterval, *(_QWORD *)&v4, *(_QWORD *)&v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[NSArray componentsJoinedByString:](self->_performers, "componentsJoinedByString:", CFSTR(", "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray componentsJoinedByString:](self->_categories, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[CLSPublicEvent description](self, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@\n\tbusinessItemMuid: %lu, businessItemCoordinates: {%f, %f}, expectedAttendance %ld,\n\tcategories: %@,\n\tperformers: %@"), v6, self->_businessItemMuid, *(_QWORD *)&self->_businessItemCoordinates.latitude, *(_QWORD *)&self->_businessItemCoordinates.longitude, self->_expectedAttendance, v4, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDateInterval)universalDateIntervalIncludingTime
{
  void *v3;
  void *v4;
  double localEndTime;
  double localStartTime;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  -[NSDateInterval startDate](self->_localDateInterval, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval endDate](self->_localDateInterval, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  localStartTime = self->_localStartTime;
  localEndTime = self->_localEndTime;
  if (localEndTime < localStartTime && objc_msgSend(v3, "compare:", v4) != -1)
  {
    +[CLSCalendar dateByAddingDays:toDate:](CLSCalendar, "dateByAddingDays:toDate:", 1, v3);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  -[CLSPublicEvent _calculateUniversalDateFromLocalDate:includingTimeZone:localStartTime:](self, "_calculateUniversalDateFromLocalDate:includingTimeZone:localStartTime:", v3, self->_timeZone, localStartTime);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSPublicEvent _calculateUniversalDateFromLocalDate:includingTimeZone:localStartTime:](self, "_calculateUniversalDateFromLocalDate:includingTimeZone:localStartTime:", v4, self->_timeZone, localEndTime);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v8, v9);

  return (NSDateInterval *)v10;
}

- (id)_calculateUniversalDateFromLocalDate:(id)a3 includingTimeZone:(id)a4 localStartTime:(double)a5
{
  id v7;
  void *v8;

  v7 = a3;
  objc_msgSend(v7, "dateByAddingTimeInterval:", a5 - (double)objc_msgSend(a4, "secondsFromGMTForDate:", v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)hasExpectedAttendance
{
  return self->_expectedAttendance != 0x7FFFFFFFFFFFFFFFLL;
}

- (CLSPublicEvent)initWithCoder:(id)a3
{
  id v4;
  CLSPublicEvent *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSDateInterval *localDateInterval;
  double v10;
  double v11;
  uint64_t v12;
  NSTimeZone *timeZone;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *performers;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSArray *categories;
  double v24;
  CLLocationDegrees v25;
  CLLocationDegrees v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CLSPublicEvent;
  v5 = -[CLSPublicEvent init](&v28, sel_init);
  if (v5)
  {
    v5->_muid = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("muid"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("universalDateInterval"));
    v8 = objc_claimAutoreleasedReturnValue();
    localDateInterval = v5->_localDateInterval;
    v5->_localDateInterval = (NSDateInterval *)v8;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("localStartTime"));
    v5->_localStartTime = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("localEndTime"));
    v5->_localEndTime = v11;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeZone"));
    v12 = objc_claimAutoreleasedReturnValue();
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("performers"));
    v17 = objc_claimAutoreleasedReturnValue();
    performers = v5->_performers;
    v5->_performers = (NSArray *)v17;

    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("categories"));
    v22 = objc_claimAutoreleasedReturnValue();
    categories = v5->_categories;
    v5->_categories = (NSArray *)v22;

    v5->_businessItemMuid = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("businessItemMuid"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("businessItemCoordinatesLatitude"));
    v25 = v24;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("businessItemCoordinatesLongitude"));
    v5->_businessItemCoordinates = CLLocationCoordinate2DMake(v25, v26);
    v5->_expectedAttendance = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("epxectedAttendance"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t muid;
  id v5;

  muid = self->_muid;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", muid, CFSTR("muid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localDateInterval, CFSTR("universalDateInterval"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("localStartTime"), self->_localStartTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("localEndTime"), self->_localEndTime);
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeZone, CFSTR("timeZone"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_performers, CFSTR("performers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_categories, CFSTR("categories"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_businessItemMuid, CFSTR("businessItemMuid"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("businessItemCoordinatesLatitude"), self->_businessItemCoordinates.latitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("businessItemCoordinatesLongitude"), self->_businessItemCoordinates.longitude);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_expectedAttendance, CFSTR("epxectedAttendance"));

}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  self->_muid = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSDateInterval)localDateInterval
{
  return self->_localDateInterval;
}

- (void)setLocalDateInterval:(id)a3
{
  objc_storeStrong((id *)&self->_localDateInterval, a3);
}

- (double)localStartTime
{
  return self->_localStartTime;
}

- (void)setLocalStartTime:(double)a3
{
  self->_localStartTime = a3;
}

- (double)localEndTime
{
  return self->_localEndTime;
}

- (void)setLocalEndTime:(double)a3
{
  self->_localEndTime = a3;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
}

- (NSArray)performers
{
  return self->_performers;
}

- (void)setPerformers:(id)a3
{
  objc_storeStrong((id *)&self->_performers, a3);
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
  objc_storeStrong((id *)&self->_categories, a3);
}

- (unint64_t)businessItemMuid
{
  return self->_businessItemMuid;
}

- (void)setBusinessItemMuid:(unint64_t)a3
{
  self->_businessItemMuid = a3;
}

- (CLLocationCoordinate2D)businessItemCoordinates
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_businessItemCoordinates.latitude;
  longitude = self->_businessItemCoordinates.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setBusinessItemCoordinates:(CLLocationCoordinate2D)a3
{
  self->_businessItemCoordinates = a3;
}

- (int64_t)expectedAttendance
{
  return self->_expectedAttendance;
}

- (void)setExpectedAttendance:(int64_t)a3
{
  self->_expectedAttendance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_performers, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_localDateInterval, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (NSSet)supportedCategories
{
  if (supportedCategories_onceToken != -1)
    dispatch_once(&supportedCategories_onceToken, &__block_literal_global_7332);
  return (NSSet *)(id)supportedCategories_allowedCategories;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __37__CLSPublicEvent_supportedCategories__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v0 = (void *)MEMORY[0x1E0C99E60];
  +[CLSPublicEventCategory musicConcerts](CLSPublicEventCategory, "musicConcerts");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  +[CLSPublicEventCategory theater](CLSPublicEventCategory, "theater");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLSPublicEventCategory sports](CLSPublicEventCategory, "sports");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLSPublicEventCategory nightLife](CLSPublicEventCategory, "nightLife");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLSPublicEventCategory festivalsAndFairs](CLSPublicEventCategory, "festivalsAndFairs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLSPublicEventCategory dance](CLSPublicEventCategory, "dance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLSPublicEventCategory artsAndMuseums](CLSPublicEventCategory, "artsAndMuseums");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLSPublicEventCategory appleEvents](CLSPublicEventCategory, "appleEvents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithObjects:", v10, v1, v2, v3, v4, v5, v6, v7, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)supportedCategories_allowedCategories;
  supportedCategories_allowedCategories = v8;

}

@end
