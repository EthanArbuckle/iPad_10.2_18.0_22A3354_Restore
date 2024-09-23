@implementation NPLocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPLocation)initWithLatitude:(double)a3 longtitude:(double)a4 timestamp:(id)a5
{
  id v9;
  NPLocation *v10;
  NPLocation *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)NPLocation;
  v10 = -[NPLocation init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_latitude = a3;
    v10->_longtitude = a4;
    objc_storeStrong((id *)&v10->_timestamp, a5);
  }

  return v11;
}

- (NPLocation)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  NPLocation *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Latitude"));
  v6 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Longtitude"));
  v8 = v7;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Timestamp"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[NPLocation initWithLatitude:longtitude:timestamp:](self, "initWithLatitude:longtitude:timestamp:", v9, v6, v8);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NPLocation latitude](self, "latitude");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("Latitude"));
  -[NPLocation longtitude](self, "longtitude");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("Longtitude"));
  -[NPLocation timestamp](self, "timestamp");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("Timestamp"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NPLocation *v4;
  void *v5;

  v4 = -[NPLocation init](+[NPLocation allocWithZone:](NPLocation, "allocWithZone:", a3), "init");
  -[NPLocation latitude](self, "latitude");
  -[NPLocation setLatitude:](v4, "setLatitude:");
  -[NPLocation longtitude](self, "longtitude");
  -[NPLocation setLongtitude:](v4, "setLongtitude:");
  -[NPLocation timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPLocation setTimestamp:](v4, "setTimestamp:", v5);

  return v4;
}

- (id)description
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[NPLocation latitude](self, "latitude");
  v5 = v4;
  -[NPLocation longtitude](self, "longtitude");
  v7 = v6;
  -[NPLocation timestamp](self, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%f, %f> %@"), v5, v7, v8);

  return v3;
}

- (BOOL)isValid
{
  double v3;
  double v4;

  -[NPLocation latitude](self, "latitude");
  if (v3 == 0.0)
    return 0;
  -[NPLocation longtitude](self, "longtitude");
  return v4 != 0.0;
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)longtitude
{
  return self->_longtitude;
}

- (void)setLongtitude:(double)a3
{
  self->_longtitude = a3;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
