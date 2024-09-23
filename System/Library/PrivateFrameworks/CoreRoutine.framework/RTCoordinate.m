@implementation RTCoordinate

- (RTCoordinate)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithLatitude_longitude_);
}

- (RTCoordinate)initWithLatitude:(double)a3 longitude:(double)a4
{
  RTCoordinate *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RTCoordinate;
  result = -[RTCoordinate init](&v7, sel_init);
  if (result)
  {
    result->_latitude = a3;
    result->_longitude = a4;
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTCoordinate latitude](self, "latitude");
  v5 = v4;
  -[RTCoordinate longitude](self, "longitude");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%.6f, %.6f>"), v5, v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTCoordinate)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("latitude"));
  v6 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("longitude"));
  v8 = v7;

  return -[RTCoordinate initWithLatitude:longitude:](self, "initWithLatitude:longitude:", v6, v8);
}

- (void)encodeWithCoder:(id)a3
{
  double latitude;
  id v5;

  latitude = self->_latitude;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("latitude"), latitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("longitude"), self->_longitude);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithLatitude:longitude:", self->_latitude, self->_longitude);
}

- (BOOL)isEqualToCoordinate:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;

  v4 = a3;
  v5 = round(self->_latitude * 1000000.0);
  objc_msgSend(v4, "latitude");
  if (v5 == round(v6 * 1000000.0))
  {
    v7 = round(self->_longitude * 1000000.0);
    objc_msgSend(v4, "longitude");
    v9 = v7 == round(v8 * 1000000.0);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  RTCoordinate *v4;
  RTCoordinate *v5;
  BOOL v6;

  v4 = (RTCoordinate *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[RTCoordinate isEqualToCoordinate:](self, "isEqualToCoordinate:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", round(self->_latitude * 1000000.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", round(self->_longitude * 1000000.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
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
