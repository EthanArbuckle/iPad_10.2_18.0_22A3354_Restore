@implementation ATXTime

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  ATXTime *v4;
  ATXTime *v5;
  BOOL v6;

  v4 = (ATXTime *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXTime isEqualToATXTime:](self, "isEqualToATXTime:", v5);

  return v6;
}

- (ATXTime)initWithHour:(int64_t)a3 minute:(int64_t)a4
{
  ATXTime *v6;
  ATXTime *v7;
  ATXTime *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ATXTime;
  v6 = -[ATXTime init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_hour = a3;
    v6->_minute = a4;
    v8 = v6;
  }

  return v7;
}

- (ATXTime)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("hour"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minute"));

  return -[ATXTime initWithHour:minute:](self, "initWithHour:minute:", v5, v6);
}

- (void)encodeWithCoder:(id)a3
{
  int64_t hour;
  id v5;

  hour = self->_hour;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", hour, CFSTR("hour"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_minute, CFSTR("minute"));

}

- (BOOL)isEqualToATXTime:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  BOOL v7;

  v4 = a3;
  v5 = -[ATXTime hour](self, "hour");
  if (v5 == objc_msgSend(v4, "hour"))
  {
    v6 = -[ATXTime minute](self, "minute");
    v7 = v6 == objc_msgSend(v4, "minute");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return self->_minute ^ self->_hour;
}

- (int64_t)hour
{
  return self->_hour;
}

- (int64_t)minute
{
  return self->_minute;
}

@end
