@implementation RTLocation

- (NSDate)date
{
  return self->_date;
}

- (int)referenceFrame
{
  return self->_referenceFrame;
}

- (double)horizontalUncertainty
{
  return self->_horizontalUncertainty;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

- (RTLocation)initWithLatitude:(double)a3 longitude:(double)a4 horizontalUncertainty:(double)a5 altitude:(double)a6 verticalUncertainty:(double)a7 date:(id)a8 referenceFrame:(int)a9 speed:(double)a10
{
  return -[RTLocation initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:](self, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", a8, *(_QWORD *)&a9, 0, a3, a4, a5, a6, a7, a10);
}

- (RTLocation)initWithLatitude:(double)a3 longitude:(double)a4 horizontalUncertainty:(double)a5 date:(id)a6 referenceFrame:(int)a7
{
  return -[RTLocation initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:](self, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:", a6, *(_QWORD *)&a7, a3, a4, a5, 0.0, -1.0, -1.0);
}

- (double)speed
{
  return self->_speed;
}

- (id)coordinateToString
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTLocation latitude](self, "latitude");
  v5 = v4;
  -[RTLocation longitude](self, "longitude");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%+.6f,%+.6f>"), v5, v6);
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (RTLocation)initWithLatitude:(double)a3 longitude:(double)a4 horizontalUncertainty:(double)a5 altitude:(double)a6 verticalUncertainty:(double)a7 date:(id)a8 referenceFrame:(int)a9 speed:(double)a10 sourceAccuracy:(unint64_t)a11
{
  id v20;
  RTLocation *v21;
  RTLocation *v22;
  uint64_t v23;
  NSDate *date;
  objc_super v26;

  v20 = a8;
  v26.receiver = self;
  v26.super_class = (Class)RTLocation;
  v21 = -[RTLocation init](&v26, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_latitude = a3;
    v21->_longitude = a4;
    v21->_horizontalUncertainty = a5;
    v21->_altitude = a6;
    v21->_verticalUncertainty = a7;
    v23 = objc_msgSend(v20, "copy");
    date = v22->_date;
    v22->_date = (NSDate *)v23;

    v22->_referenceFrame = a9;
    v22->_speed = a10;
    v22->_sourceAccuracy = a11;
  }

  return v22;
}

- (RTLocation)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t v19;
  RTLocation *v20;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("latitude"));
  v6 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("longitude"));
  v8 = v7;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("horizontalUncertainty"));
  v10 = v9;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("altitude"));
  v12 = v11;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("verticalUncertainty"));
  v14 = v13;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("referenceFrame"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("speed"));
  v18 = v17;
  v19 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sourceAccuracy"));

  v20 = -[RTLocation initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:](self, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", v15, v16, v19, v6, v8, v10, v12, v14, v18);
  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", self->_date, self->_referenceFrame, self->_sourceAccuracy, self->_latitude, self->_longitude, self->_horizontalUncertainty, self->_altitude, self->_verticalUncertainty, self->_speed);
}

- (RTLocation)initWithLatitude:(double)a3 longitude:(double)a4 horizontalUncertainty:(double)a5 date:(id)a6
{
  return -[RTLocation initWithLatitude:longitude:horizontalUncertainty:date:referenceFrame:](self, "initWithLatitude:longitude:horizontalUncertainty:date:referenceFrame:", a6, 0, a3, a4, a5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double latitude;
  id v5;

  latitude = self->_latitude;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("latitude"), latitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("longitude"), self->_longitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("horizontalUncertainty"), self->_horizontalUncertainty);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("altitude"), self->_altitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("verticalUncertainty"), self->_verticalUncertainty);
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("date"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_referenceFrame, CFSTR("referenceFrame"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("speed"), self->_speed);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sourceAccuracy, CFSTR("sourceAccuracy"));

}

- (RTLocation)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithLatitude_longitude_horizontalUncertainty_altitude_verticalUncertainty_date_referenceFrame_speed_sourceAccuracy_);
}

- (double)uncertainty
{
  return self->_horizontalUncertainty;
}

- (void)setUncertainty:(double)a3
{
  self->_horizontalUncertainty = a3;
}

- (RTLocation)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  RTLocation *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  RTLocation *v29;

  v4 = a3;
  objc_msgSend(v4, "valueForKey:", CFSTR("latitude"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("longitude"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("horizontalUncertainty"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("altitude"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("verticalUncertainty"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("referenceFrame"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("speed"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  if (v5 && v6 && v7 && v8 && v9 && v10 && v11 && v12)
  {
    v29 = self;
    v14 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v10, "doubleValue");
    objc_msgSend(v14, "dateWithTimeIntervalSince1970:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v17 = v16;
    objc_msgSend(v6, "doubleValue");
    v19 = v18;
    objc_msgSend(v7, "doubleValue");
    v21 = v20;
    objc_msgSend(v8, "doubleValue");
    v23 = v22;
    objc_msgSend(v9, "doubleValue");
    v25 = v24;
    v26 = objc_msgSend(v11, "intValue");
    objc_msgSend(v12, "doubleValue");
    v13 = -[RTLocation initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:](v29, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:", v15, v26, v17, v19, v21, v23, v25, v27);

    self = v13;
  }

  return v13;
}

- (id)outputToDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocation latitude](self, "latitude");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("latitude"));

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocation longitude](self, "longitude");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("longitude"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocation horizontalUncertainty](self, "horizontalUncertainty");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("horizontalUncertainty"));

  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocation altitude](self, "altitude");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("altitude"));

  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocation verticalUncertainty](self, "verticalUncertainty");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("verticalUncertainty"));

  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocation date](self, "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSince1970");
  objc_msgSend(v14, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("date"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[RTLocation referenceFrame](self, "referenceFrame"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("referenceFrame"));

  v18 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLocation speed](self, "speed");
  objc_msgSend(v18, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("speed"));

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTLocation latitude](self, "latitude");
  v5 = v4;
  -[RTLocation longitude](self, "longitude");
  v7 = v6;
  -[RTLocation horizontalUncertainty](self, "horizontalUncertainty");
  v9 = v8;
  -[RTLocation altitude](self, "altitude");
  v11 = v10;
  -[RTLocation verticalUncertainty](self, "verticalUncertainty");
  v13 = v12;
  -[RTLocation date](self, "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringFromDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[RTLocation referenceFrame](self, "referenceFrame");
  objc_msgSend((id)objc_opt_class(), "sourceAccuracyToString:", self->_sourceAccuracy);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%f, %f> +/- %f, alt, %f +/- %f, date, %@, referenceFrame, %d, sourceAccuracy, %@"), v5, v7, v9, v11, v13, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)sourceAccuracyToString:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 2)
    v3 = CFSTR("High");
  if (a3 == 1)
    return CFSTR("Low");
  else
    return (id)v3;
}

- (BOOL)isEqualToLocation:(id)a3
{
  void *v3;
  id v5;
  double latitude;
  double v7;
  double longitude;
  double v9;
  double horizontalUncertainty;
  double v11;
  double altitude;
  double v13;
  double verticalUncertainty;
  double v15;
  NSDate *date;
  NSDate *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  int referenceFrame;
  double speed;
  double v24;
  BOOL v25;
  BOOL v26;

  v5 = a3;
  latitude = self->_latitude;
  objc_msgSend(v5, "latitude");
  if (latitude != v7)
    goto LABEL_15;
  longitude = self->_longitude;
  objc_msgSend(v5, "longitude");
  if (longitude != v9
    || (horizontalUncertainty = self->_horizontalUncertainty,
        objc_msgSend(v5, "horizontalUncertainty"),
        horizontalUncertainty != v11)
    || (altitude = self->_altitude, objc_msgSend(v5, "altitude"), altitude != v13)
    || (verticalUncertainty = self->_verticalUncertainty,
        objc_msgSend(v5, "verticalUncertainty"),
        verticalUncertainty != v15))
  {
LABEL_15:
    v26 = 0;
    goto LABEL_16;
  }
  date = self->_date;
  v17 = date;
  if (date)
  {
LABEL_9:
    objc_msgSend(v5, "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDate timeIntervalSinceDate:](v17, "timeIntervalSinceDate:", v18);
    v20 = v19;

    v21 = -v20;
    if (v20 >= 0.0)
      v21 = v20;
    if (v21 >= 0.01)
      goto LABEL_17;
    goto LABEL_12;
  }
  objc_msgSend(v5, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v17 = self->_date;
    goto LABEL_9;
  }
LABEL_12:
  referenceFrame = self->_referenceFrame;
  if (referenceFrame == objc_msgSend(v5, "referenceFrame"))
  {
    speed = self->_speed;
    objc_msgSend(v5, "speed");
    v25 = speed == v24;
    v26 = speed == v24;
    if (!date)
      goto LABEL_18;
    goto LABEL_16;
  }
LABEL_17:
  v25 = 0;
  v26 = 0;
  if (!date)
  {
LABEL_18:

    v26 = v25;
  }
LABEL_16:

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  RTLocation *v4;
  RTLocation *v5;
  BOOL v6;

  v4 = (RTLocation *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[RTLocation isEqualToLocation:](self, "isEqualToLocation:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_latitude);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v20, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_longitude);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_horizontalUncertainty);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_altitude);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_verticalUncertainty);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_referenceFrame);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");
  v14 = v9 ^ v13 ^ -[NSDate hash](self->_date, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_speed);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_sourceAccuracy);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v14 ^ v16 ^ objc_msgSend(v17, "hash");

  return v18;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (void)setHorizontalUncertainty:(double)a3
{
  self->_horizontalUncertainty = a3;
}

- (double)altitude
{
  return self->_altitude;
}

- (double)verticalUncertainty
{
  return self->_verticalUncertainty;
}

- (unint64_t)sourceAccuracy
{
  return self->_sourceAccuracy;
}

@end
