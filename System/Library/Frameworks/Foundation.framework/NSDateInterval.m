@implementation NSDateInterval

- (NSDateInterval)initWithCoder:(NSCoder *)coder
{
  id v5;
  id v6;
  double v7;
  double v8;
  id v10;

  if (!-[NSCoder allowsKeyedCoding](coder, "allowsKeyedCoding"))
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSDateInterval cannot be decoded by non-keyed archivers"), 0));
  }
  v5 = -[NSCoder decodeObjectOfClass:forKey:](coder, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.startDate"));
  if (!v5)
    goto LABEL_6;
  v6 = v5;
  -[NSCoder decodeDoubleForKey:](coder, "decodeDoubleForKey:", CFSTR("NS.duration"));
  v8 = v7;
  if (-[NSCoder containsValueForKey:](coder, "containsValueForKey:", CFSTR("NS.duration")))
    return -[NSDateInterval initWithStartDate:duration:](self, "initWithStartDate:duration:", v6, v8);
  v10 = -[NSCoder decodeObjectOfClass:forKey:](coder, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.endDate"));
  if (!-[NSCoder error](coder, "error"))
  {
    if (!v10)
      return -[NSDateInterval initWithStartDate:duration:](self, "initWithStartDate:duration:", v6, v8);
    return -[NSDateInterval initWithStartDate:endDate:](self, "initWithStartDate:endDate:", v6, v10);
  }
  else
  {
LABEL_6:

    -[NSCoder failWithError:](coder, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4865, 0));
    return 0;
  }
}

- (void)encodeWithCoder:(id)a3
{
  if (!objc_msgSend(a3, "allowsKeyedCoding"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Encoder does not allow keyed coding!"), 0));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSDateInterval startDate](self, "startDate"), CFSTR("NS.startDate"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSDateInterval endDate](self, "endDate"), CFSTR("NS.endDate"));
  -[NSDateInterval duration](self, "duration");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NS.duration"));
}

- (BOOL)containsDate:(NSDate *)date
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  if (!date)
    return 0;
  -[NSDate timeIntervalSinceReferenceDate](date, "timeIntervalSinceReferenceDate");
  v5 = v4;
  -[NSDate timeIntervalSinceReferenceDate](-[NSDateInterval startDate](self, "startDate"), "timeIntervalSinceReferenceDate");
  v7 = v6;
  -[NSDateInterval duration](self, "duration");
  return v5 <= v7 + v8 && v5 >= v7;
}

+ (NSDateInterval)allocWithZone:(_NSZone *)a3
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (NSDateInterval == a1)
    return (NSDateInterval *)+[NSDateInterval allocWithZone:](_NSConcreteDateInterval, "allocWithZone:", a3);
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSDateInterval;
  return (NSDateInterval *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

- (NSDateInterval)init
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSDateInterval;
  return -[NSDateInterval init](&v3, sel_init);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return -[NSDateInterval isEqualToDateInterval:](self, "isEqualToDateInterval:", a3);
  }
  return 0;
}

- (NSDateInterval)initWithStartDate:(NSDate *)startDate duration:(NSTimeInterval)duration
{
  objc_class *v6;

  v6 = NSClassFromString((NSString *)CFSTR("NSDateInterval"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (NSDateInterval)initWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
  objc_class *v6;

  v6 = NSClassFromString((NSString *)CFSTR("NSDateInterval"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (NSDate)startDate
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSDateInterval"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSDate)endDate
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSDateInterval"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSTimeInterval)duration
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSDateInterval"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSComparisonResult)compare:(NSDateInterval *)dateInterval
{
  NSComparisonResult result;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (self == dateInterval)
    return 0;
  if (!dateInterval)
    return 1;
  result = -[NSDate compare:](-[NSDateInterval startDate](self, "startDate"), "compare:", -[NSDateInterval startDate](dateInterval, "startDate"));
  if (result == NSOrderedSame)
  {
    -[NSDateInterval duration](self, "duration");
    v7 = v6;
    -[NSDateInterval duration](dateInterval, "duration");
    if (v7 >= v8)
    {
      -[NSDateInterval duration](self, "duration");
      v10 = v9;
      -[NSDateInterval duration](dateInterval, "duration");
      return (unint64_t)(v10 > v11);
    }
    else
    {
      return -1;
    }
  }
  return result;
}

- (id)description
{
  id v3;
  NSDate *v4;
  uint64_t v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)NSDateInterval;
  v3 = -[NSDateInterval description](&v7, sel_description);
  v4 = -[NSDateInterval startDate](self, "startDate");
  -[NSDateInterval duration](self, "duration");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (Start Date) %@ + (Duration) %f seconds = (End Date) %@"), v3, v4, v5, -[NSDateInterval endDate](self, "endDate"));
}

- (unint64_t)hash
{
  -[NSDate timeIntervalSinceReferenceDate](-[NSDateInterval startDate](self, "startDate"), "timeIntervalSinceReferenceDate");
  -[NSDateInterval duration](self, "duration");
  return CFHashBytes();
}

- (BOOL)isEqualToDateInterval:(NSDateInterval *)dateInterval
{
  double v5;
  double v6;
  double v7;

  if (!dateInterval)
    return 0;
  if (-[NSDate isEqualToDate:](-[NSDateInterval startDate](self, "startDate"), "isEqualToDate:", -[NSDateInterval startDate](dateInterval, "startDate")))
  {
    -[NSDateInterval duration](self, "duration");
    v6 = v5;
    -[NSDateInterval duration](dateInterval, "duration");
    if (v6 == v7)
      return 1;
  }
  return 0;
}

- (BOOL)intersectsDateInterval:(NSDateInterval *)dateInterval
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  if (!dateInterval)
    return 0;
  if (-[NSDateInterval containsDate:](self, "containsDate:", -[NSDateInterval startDate](dateInterval, "startDate"))
    || -[NSDateInterval containsDate:](dateInterval, "containsDate:", -[NSDateInterval startDate](self, "startDate")))
  {
    return 1;
  }
  -[NSDate timeIntervalSinceReferenceDate](-[NSDateInterval startDate](dateInterval, "startDate"), "timeIntervalSinceReferenceDate");
  v6 = v5;
  -[NSDateInterval duration](dateInterval, "duration");
  v8 = v6 + v7;
  -[NSDate timeIntervalSinceReferenceDate](-[NSDateInterval startDate](self, "startDate"), "timeIntervalSinceReferenceDate");
  v10 = v9;
  -[NSDateInterval duration](self, "duration");
  v12 = v10 + v11;
  if (v8 >= v10 && v8 <= v12)
    return 1;
  if (v12 <= v8)
    return v12 >= v6;
  return 0;
}

- (NSDateInterval)intersectionWithDateInterval:(NSDateInterval *)dateInterval
{
  NSDateInterval *v5;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSDate *v15;
  double v16;

  if (!dateInterval || !-[NSDateInterval intersectsDateInterval:](self, "intersectsDateInterval:"))
    return 0;
  if (-[NSDateInterval isEqualToDateInterval:](self, "isEqualToDateInterval:", dateInterval))
  {
    v5 = (NSDateInterval *)-[NSDateInterval copy](self, "copy");
  }
  else
  {
    -[NSDate timeIntervalSinceReferenceDate](-[NSDateInterval startDate](self, "startDate"), "timeIntervalSinceReferenceDate");
    v8 = v7;
    -[NSDateInterval duration](self, "duration");
    v10 = v8 + v9;
    -[NSDate timeIntervalSinceReferenceDate](-[NSDateInterval startDate](dateInterval, "startDate"), "timeIntervalSinceReferenceDate");
    v12 = v11;
    -[NSDateInterval duration](dateInterval, "duration");
    v14 = v12 + v13;
    if (v12 >= v8)
    {
      v15 = -[NSDateInterval startDate](dateInterval, "startDate");
    }
    else
    {
      v15 = -[NSDateInterval startDate](self, "startDate");
      v12 = v8;
    }
    if (v14 < v10)
      v16 = v14;
    else
      v16 = v10;
    v5 = -[NSDateInterval initWithStartDate:duration:]([NSDateInterval alloc], "initWithStartDate:duration:", v15, v16 - v12);
  }
  return v5;
}

@end
