@implementation DNDScheduleTime

+ (id)defaultStartTime
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithHour:minute:", 9, 0);
}

+ (id)defaultEndTime
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithHour:minute:", 17, 0);
}

- (DNDScheduleTime)init
{
  return (DNDScheduleTime *)-[DNDScheduleTime _initWithTime:](self, "_initWithTime:", 0);
}

- (id)_initWithTime:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "hour");
  v6 = objc_msgSend(v4, "minute");

  return -[DNDScheduleTime _initWithHour:minute:](self, "_initWithHour:minute:", v5, v6);
}

- (id)_initWithHour:(unint64_t)a3 minute:(unint64_t)a4
{
  id result;
  __int128 v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DNDScheduleTime;
  result = -[DNDScheduleTime init](&v8, sel_init);
  if (result)
  {
    *(_QWORD *)&v7 = a3 % 0x18;
    *((_QWORD *)&v7 + 1) = a4 % 0x3C;
    *(_OWORD *)((char *)result + 8) = v7;
  }
  return result;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[DNDScheduleTime hour](self, "hour");
  return -[DNDScheduleTime minute](self, "minute") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  DNDScheduleTime *v4;
  DNDScheduleTime *v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;

  v4 = (DNDScheduleTime *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[DNDScheduleTime hour](self, "hour");
      if (v6 == -[DNDScheduleTime hour](v5, "hour"))
      {
        v7 = -[DNDScheduleTime minute](self, "minute");
        v8 = v7 == -[DNDScheduleTime minute](v5, "minute");
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<h: %lu; m: %lu>"),
               -[DNDScheduleTime hour](self, "hour"),
               -[DNDScheduleTime minute](self, "minute"));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDScheduleTime _initWithTime:]([DNDMutableScheduleTime alloc], "_initWithTime:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDScheduleTime)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("hour"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minute"));

  return (DNDScheduleTime *)-[DNDScheduleTime _initWithHour:minute:](self, "_initWithHour:minute:", v5, v6);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDScheduleTime hour](self, "hour"), CFSTR("hour"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDScheduleTime minute](self, "minute"), CFSTR("minute"));

}

- (unint64_t)hour
{
  return self->_hour;
}

- (unint64_t)minute
{
  return self->_minute;
}

- (id)dateComponents
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v3, "setHour:", -[DNDScheduleTime hour](self, "hour"));
  objc_msgSend(v3, "setMinute:", -[DNDScheduleTime minute](self, "minute"));
  objc_msgSend(v3, "setSecond:", 0);
  return v3;
}

@end
