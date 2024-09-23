@implementation CTStewieDeviceOrientationData

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  const char *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTStewieDeviceOrientationData timestamp](self, "timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", timestamp=%@"), v4);

  if (-[CTStewieDeviceOrientationData targetLocked](self, "targetLocked"))
    v5 = "YES";
  else
    v5 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR(", targetLocked=%s"), v5);
  if (-[CTStewieDeviceOrientationData isDeviceStationary](self, "isDeviceStationary"))
    v6 = "YES";
  else
    v6 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR(", isDeviceStationary=%s"), v6);
  objc_msgSend(v3, "appendFormat:", CFSTR(", x=%ld"), -[CTStewieDeviceOrientationData x](self, "x"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CTStewieDeviceOrientationData *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  BOOL v9;
  int64_t v11;

  v4 = (CTStewieDeviceOrientationData *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTStewieDeviceOrientationData timestamp](self, "timestamp");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTStewieDeviceOrientationData timestamp](v4, "timestamp");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqual:", v6)
        && (v7 = -[CTStewieDeviceOrientationData targetLocked](self, "targetLocked"),
            v7 == -[CTStewieDeviceOrientationData targetLocked](v4, "targetLocked"))
        && (v8 = -[CTStewieDeviceOrientationData isDeviceStationary](self, "isDeviceStationary"),
            v8 == -[CTStewieDeviceOrientationData isDeviceStationary](v4, "isDeviceStationary")))
      {
        v11 = -[CTStewieDeviceOrientationData x](self, "x");
        v9 = v11 == -[CTStewieDeviceOrientationData x](v4, "x");
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTStewieDeviceOrientationData timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimestamp:", v5);

  objc_msgSend(v4, "setTargetLocked:", -[CTStewieDeviceOrientationData targetLocked](self, "targetLocked"));
  objc_msgSend(v4, "setIsDeviceStationary:", -[CTStewieDeviceOrientationData isDeviceStationary](self, "isDeviceStationary"));
  objc_msgSend(v4, "setX:", -[CTStewieDeviceOrientationData x](self, "x"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CTStewieDeviceOrientationData timestamp](self, "timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("timestamp"));

  objc_msgSend(v5, "encodeBool:forKey:", -[CTStewieDeviceOrientationData targetLocked](self, "targetLocked"), CFSTR("targetLocked"));
  objc_msgSend(v5, "encodeBool:forKey:", -[CTStewieDeviceOrientationData isDeviceStationary](self, "isDeviceStationary"), CFSTR("isDeviceStationary"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[CTStewieDeviceOrientationData x](self, "x"), CFSTR("x"));

}

- (CTStewieDeviceOrientationData)initWithCoder:(id)a3
{
  id v4;
  CTStewieDeviceOrientationData *v5;
  uint64_t v6;
  NSDate *timestamp;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTStewieDeviceOrientationData;
  v5 = -[CTStewieDeviceOrientationData init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
    v6 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v6;

    v5->_targetLocked = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("targetLocked"));
    v5->_isDeviceStationary = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDeviceStationary"));
    v5->_x = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("x"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (BOOL)targetLocked
{
  return self->_targetLocked;
}

- (void)setTargetLocked:(BOOL)a3
{
  self->_targetLocked = a3;
}

- (BOOL)isDeviceStationary
{
  return self->_isDeviceStationary;
}

- (void)setIsDeviceStationary:(BOOL)a3
{
  self->_isDeviceStationary = a3;
}

- (int64_t)x
{
  return self->_x;
}

- (void)setX:(int64_t)a3
{
  self->_x = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
