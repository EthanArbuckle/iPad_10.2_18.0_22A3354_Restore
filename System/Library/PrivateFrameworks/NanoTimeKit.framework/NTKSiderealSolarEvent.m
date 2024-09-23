@implementation NTKSiderealSolarEvent

+ (id)eventWithType:(int64_t)a3 time:(id)a4 degree:(double)a5
{
  NSDate *v7;
  NTKSiderealSolarEvent *v8;
  NSDate *time;

  v7 = (NSDate *)a4;
  v8 = objc_alloc_init(NTKSiderealSolarEvent);
  time = v8->_time;
  v8->_time = v7;
  v8->_type = a3;

  v8->_degree = a5;
  return v8;
}

+ (id)eventWithType:(int64_t)a3 degree:(double)a4
{
  NTKSiderealSolarEvent *v6;

  v6 = objc_alloc_init(NTKSiderealSolarEvent);
  v6->_type = a3;
  v6->_degree = a4;
  return v6;
}

- (NTKSiderealSolarEvent)initWithCoder:(id)a3
{
  id v4;
  NTKSiderealSolarEvent *v5;
  uint64_t v6;
  NSDate *time;
  void *v8;
  void *v9;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NTKSiderealSolarEvent;
  v5 = -[NTKSiderealSolarEvent init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("time"));
    v6 = objc_claimAutoreleasedReturnValue();
    time = v5->_time;
    v5->_time = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v8, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("degree"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v5->_degree = v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *time;
  id v5;
  void *v6;
  id v7;

  time = self->_time;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", time, CFSTR("time"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_degree);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("degree"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)angle
{
  double result;

  -[NTKSiderealSolarEvent degree](self, "degree");
  CLKDegreesToRadians();
  return result;
}

- (double)degree
{
  return self->_degree;
}

- (id)description
{
  void *v3;
  void *v4;
  NSDate *time;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NTKSiderealSolarEvent debugNameForType:](self, "debugNameForType:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  time = self->_time;
  -[NTKSiderealSolarEvent angle](self, "angle");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("type: %@, time: %@, angle: %f"), v4, time, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)debugNameForType:(int64_t)a3
{
  if ((unint64_t)a3 > 9)
    return CFSTR("Day");
  else
    return off_1E6BD9B20[a3];
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t type;
  void *v7;
  void *v8;
  NSDate *time;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    type = self->_type;
    if (type == objc_msgSend(v5, "type")
      && self->_time
      && (objc_msgSend(v5, "time"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      time = self->_time;
      objc_msgSend(v5, "time");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v8, "isDate:equalToDate:toUnitGranularity:", time, v10, 64);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  return self->_type;
}

- (NSDate)time
{
  return self->_time;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_time, 0);
}

@end
