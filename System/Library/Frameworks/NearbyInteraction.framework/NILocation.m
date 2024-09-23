@implementation NILocation

- (NILocation)initWithTimestamp:(id)a3 latitude:(double)a4 longitude:(double)a5 altitude:(double)a6 ellipsoidalAltitude:(double)a7 horizontalAccuracy:(double)a8 verticalAccuracy:(double)a9 speed:(double)a10 speedAccuracy:(double)a11 course:(double)a12 courseAccuracy:(double)a13 floor:(int64_t)a14 locationType:(int64_t)a15 signalEnvironment:(int64_t)a16
{
  id v28;
  NILocation *v29;
  uint64_t v30;
  NSDate *timestamp;
  objc_super v33;

  v28 = a3;
  if (!v28)
    __assert_rtn("-[NILocation initWithTimestamp:latitude:longitude:altitude:ellipsoidalAltitude:horizontalAccuracy:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:floor:locationType:signalEnvironment:]", "NILocation.mm", 37, "timestamp");
  v33.receiver = self;
  v33.super_class = (Class)NILocation;
  v29 = -[NILocation init](&v33, sel_init);
  if (v29)
  {
    v30 = objc_msgSend(v28, "copy");
    timestamp = v29->_timestamp;
    v29->_timestamp = (NSDate *)v30;

    v29->_latitude = a4;
    v29->_longitude = a5;
    v29->_altitude = a6;
    v29->_ellipsoidalAltitude = a7;
    v29->_horizontalAccuracy = a8;
    v29->_verticalAccuracy = a9;
    v29->_speed = a10;
    v29->_speedAccuracy = a11;
    v29->_course = a12;
    v29->_courseAccuracy = a13;
    v29->_floor = a14;
    v29->_locationType = a15;
    v29->_signalEnvironment = a16;
  }

  return v29;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NILocation initWithTimestamp:latitude:longitude:altitude:ellipsoidalAltitude:horizontalAccuracy:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:floor:locationType:signalEnvironment:](+[NILocation allocWithZone:](NILocation, "allocWithZone:", a3), "initWithTimestamp:latitude:longitude:altitude:ellipsoidalAltitude:horizontalAccuracy:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:floor:locationType:signalEnvironment:", self->_timestamp, self->_floor, self->_locationType, self->_signalEnvironment, self->_latitude, self->_longitude, self->_altitude, self->_ellipsoidalAltitude, self->_horizontalAccuracy, self->_verticalAccuracy, self->_speed, self->_speedAccuracy, *(_QWORD *)&self->_course, *(_QWORD *)&self->_courseAccuracy);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_timestamp, CFSTR("timestamp"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("latitude"), self->_latitude);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("longitude"), self->_longitude);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("altitude"), self->_altitude);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("ellipsoidalAltitude"), self->_ellipsoidalAltitude);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("horizontalAccuracy"), self->_horizontalAccuracy);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("verticalAccuracy"), self->_verticalAccuracy);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("speed"), self->_speed);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("speedAccuracy"), self->_speedAccuracy);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("course"), self->_course);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("courseAccuracy"), self->_courseAccuracy);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_floor, CFSTR("floor"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_locationType, CFSTR("locationType"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_signalEnvironment, CFSTR("signalEnvironment"));

}

- (NILocation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NILocation *v23;
  double v25;
  double v26;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("latitude"));
    v26 = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("longitude"));
    v25 = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("altitude"));
    v9 = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("ellipsoidalAltitude"));
    v11 = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("horizontalAccuracy"));
    v13 = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("verticalAccuracy"));
    v15 = v14;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("speed"));
    v17 = v16;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("speedAccuracy"));
    v19 = v18;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("course"));
    v21 = v20;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("courseAccuracy"));
    v23 = -[NILocation initWithTimestamp:latitude:longitude:altitude:ellipsoidalAltitude:horizontalAccuracy:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:floor:locationType:signalEnvironment:]([NILocation alloc], "initWithTimestamp:latitude:longitude:altitude:ellipsoidalAltitude:horizontalAccuracy:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:floor:locationType:signalEnvironment:", v5, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("floor")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("locationType")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("signalEnvironment")), v26, v25, v9, v11, v13, v15, v17, v19, v21, v22);
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NILocation *v5;
  NILocation *v6;
  NSDate *timestamp;
  void *v8;
  void *v9;
  int v10;
  double latitude;
  double v12;
  double v13;
  double longitude;
  double v15;
  double v16;
  double altitude;
  double v18;
  double v19;
  double ellipsoidalAltitude;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  int64_t floor;
  uint64_t v30;
  int64_t locationType;
  uint64_t v32;
  int64_t signalEnvironment;
  uint64_t v34;
  BOOL v35;
  double v38;
  double courseAccuracy;
  double v40;
  double course;
  double v42;
  double speedAccuracy;
  double v44;
  double speed;
  double v46;
  double verticalAccuracy;
  double v48;
  double horizontalAccuracy;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (NILocation *)v4;
    v6 = v5;
    if (v5 == self)
    {
      v35 = 1;
LABEL_27:

      goto LABEL_28;
    }
    timestamp = self->_timestamp;
    if (!timestamp)
    {
      -[NILocation timestamp](v5, "timestamp");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v10 = 1;
        goto LABEL_7;
      }
      timestamp = self->_timestamp;
    }
    -[NILocation timestamp](v6, "timestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NSDate isEqual:](timestamp, "isEqual:", v9);

LABEL_7:
    latitude = self->_latitude;
    -[NILocation latitude](v6, "latitude");
    v13 = v12;
    longitude = self->_longitude;
    -[NILocation longitude](v6, "longitude");
    v16 = v15;
    altitude = self->_altitude;
    -[NILocation altitude](v6, "altitude");
    v19 = v18;
    ellipsoidalAltitude = self->_ellipsoidalAltitude;
    -[NILocation ellipsoidalAltitude](v6, "ellipsoidalAltitude");
    v22 = v21;
    horizontalAccuracy = self->_horizontalAccuracy;
    -[NILocation horizontalAccuracy](v6, "horizontalAccuracy");
    v48 = v23;
    verticalAccuracy = self->_verticalAccuracy;
    -[NILocation verticalAccuracy](v6, "verticalAccuracy");
    v46 = v24;
    speed = self->_speed;
    -[NILocation speed](v6, "speed");
    v44 = v25;
    speedAccuracy = self->_speedAccuracy;
    -[NILocation speedAccuracy](v6, "speedAccuracy");
    v42 = v26;
    course = self->_course;
    -[NILocation course](v6, "course");
    v40 = v27;
    courseAccuracy = self->_courseAccuracy;
    -[NILocation courseAccuracy](v6, "courseAccuracy");
    v38 = v28;
    floor = self->_floor;
    v30 = -[NILocation floor](v6, "floor");
    locationType = self->_locationType;
    v32 = -[NILocation locationType](v6, "locationType");
    signalEnvironment = self->_signalEnvironment;
    v34 = -[NILocation signalEnvironment](v6, "signalEnvironment");
    v35 = 0;
    if (v10
      && latitude == v13
      && longitude == v16
      && altitude == v19
      && ellipsoidalAltitude == v22
      && horizontalAccuracy == v48
      && verticalAccuracy == v46
      && speed == v44
      && speedAccuracy == v42
      && course == v40
      && courseAccuracy == v38
      && floor == v30)
    {
      v35 = locationType == v32 && signalEnvironment == v34;
    }
    goto LABEL_27;
  }
  v35 = 0;
LABEL_28:

  return v35;
}

- (unint64_t)hash
{
  NSDate *timestamp;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  timestamp = self->_timestamp;
  if (timestamp)
    v24 = -[NSDate hash](timestamp, "hash");
  else
    v24 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_latitude);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v31, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_longitude);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v30, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_altitude);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v29, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_ellipsoidalAltitude);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v28, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_horizontalAccuracy);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v27, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_verticalAccuracy);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v26, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_speed);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v25, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_speedAccuracy);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v21, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_course);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_courseAccuracy);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_floor);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_locationType);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_signalEnvironment);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v23 ^ v24 ^ v22 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v5 ^ v7 ^ v9 ^ v11 ^ objc_msgSend(v12, "hash");

  return v13;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NILocation descriptionInternal](self, "descriptionInternal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@>"), v5, v6);

  return v7;
}

- (id)descriptionInternal
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.7fdeg"), *(_QWORD *)&self->_latitude);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.7fdeg"), *(_QWORD *)&self->_longitude);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.1fm"), *(_QWORD *)&self->_altitude);
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.1fm"), *(_QWORD *)&self->_ellipsoidalAltitude);
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.1fm"), *(_QWORD *)&self->_horizontalAccuracy);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.1fm"), *(_QWORD *)&self->_verticalAccuracy);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.1fm/s"), *(_QWORD *)&self->_speed);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.1fm/s"), *(_QWORD *)&self->_speedAccuracy);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.1fdeg"), *(_QWORD *)&self->_course);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.1fdeg"), *(_QWORD *)&self->_courseAccuracy);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)v4;
    if (self->_floor == NILocationFloorNotAvailable)
    {
      v7 = (void *)v3;
      v8 = CFSTR("-");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), self->_floor);
      v7 = (void *)v3;
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), self->_locationType);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), self->_signalEnvironment);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Time: %@. Pos: [%@, %@, %@ (sea) %@ (ell)] +/- [%@, %@]. Spd: %@ +/- %@. Crs: %@ +/- %@. Flr: %@. LocType: %@. SigEnv: %@."), self->_timestamp, v17, v16, v7, v6, v19, v18, v15, v5, v14, v13, v8, v10, v11);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = CFSTR("***");
  }
  return v9;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (double)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(double)a3
{
  self->_altitude = a3;
}

- (double)ellipsoidalAltitude
{
  return self->_ellipsoidalAltitude;
}

- (void)setEllipsoidalAltitude:(double)a3
{
  self->_ellipsoidalAltitude = a3;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (void)setHorizontalAccuracy:(double)a3
{
  self->_horizontalAccuracy = a3;
}

- (double)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (void)setVerticalAccuracy:(double)a3
{
  self->_verticalAccuracy = a3;
}

- (double)speed
{
  return self->_speed;
}

- (void)setSpeed:(double)a3
{
  self->_speed = a3;
}

- (double)speedAccuracy
{
  return self->_speedAccuracy;
}

- (void)setSpeedAccuracy:(double)a3
{
  self->_speedAccuracy = a3;
}

- (double)course
{
  return self->_course;
}

- (void)setCourse:(double)a3
{
  self->_course = a3;
}

- (double)courseAccuracy
{
  return self->_courseAccuracy;
}

- (void)setCourseAccuracy:(double)a3
{
  self->_courseAccuracy = a3;
}

- (int64_t)floor
{
  return self->_floor;
}

- (void)setFloor:(int64_t)a3
{
  self->_floor = a3;
}

- (int64_t)locationType
{
  return self->_locationType;
}

- (void)setLocationType:(int64_t)a3
{
  self->_locationType = a3;
}

- (int64_t)signalEnvironment
{
  return self->_signalEnvironment;
}

- (void)setSignalEnvironment:(int64_t)a3
{
  self->_signalEnvironment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
