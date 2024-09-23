@implementation ATXAggregatedAppLaunchData

- (ATXAggregatedAppLaunchData)initWithRawLaunchCount:(unint64_t)a3 uniqueDaysLaunched:(unint64_t)a4
{
  ATXAggregatedAppLaunchData *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXAggregatedAppLaunchData;
  result = -[ATXAggregatedAppLaunchData init](&v7, sel_init);
  if (result)
  {
    result->_rawLaunchCount = a3;
    result->_uniqueDaysLaunched = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t rawLaunchCount;
  id v5;

  rawLaunchCount = self->_rawLaunchCount;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", rawLaunchCount, CFSTR("rawLaunchCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_uniqueDaysLaunched, CFSTR("uniqueDaysLaunched"));

}

- (ATXAggregatedAppLaunchData)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  ATXAggregatedAppLaunchData *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rawLaunchCount"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("uniqueDaysLaunched"));

  v7 = (ATXAggregatedAppLaunchData *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRawLaunchCount:uniqueDaysLaunched:", v5, v6);
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithRawLaunchCount:uniqueDaysLaunched:", self->_rawLaunchCount, self->_uniqueDaysLaunched);
}

- (BOOL)isEqual:(id)a3
{
  ATXAggregatedAppLaunchData *v4;
  ATXAggregatedAppLaunchData *v5;
  BOOL v6;

  v4 = (ATXAggregatedAppLaunchData *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[ATXAggregatedAppLaunchData rawLaunchCount](v5, "rawLaunchCount") == self->_rawLaunchCount
        && -[ATXAggregatedAppLaunchData uniqueDaysLaunched](v5, "uniqueDaysLaunched") == self->_uniqueDaysLaunched;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)description
{
  return objc_autoreleaseReturnValue((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<ATXAggregatedAppLaunchData count=%ld; uniqueDays=%ld>"),
                                           -[ATXAggregatedAppLaunchData rawLaunchCount](self, "rawLaunchCount"),
                                           -[ATXAggregatedAppLaunchData uniqueDaysLaunched](self, "uniqueDaysLaunched")));
}

- (BOOL)isGreaterThanOrEqualToData:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;
  unint64_t v7;

  v4 = a3;
  v5 = -[ATXAggregatedAppLaunchData rawLaunchCount](self, "rawLaunchCount");
  if (v5 >= objc_msgSend(v4, "rawLaunchCount"))
  {
    v7 = -[ATXAggregatedAppLaunchData uniqueDaysLaunched](self, "uniqueDaysLaunched");
    v6 = v7 >= objc_msgSend(v4, "uniqueDaysLaunched");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)rawLaunchCount
{
  return self->_rawLaunchCount;
}

- (unint64_t)uniqueDaysLaunched
{
  return self->_uniqueDaysLaunched;
}

@end
