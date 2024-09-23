@implementation HKMCUnconfirmedDeviation

- (HKMCUnconfirmedDeviation)initWithType:(int64_t)a3 days:(id)a4 analyticsMetadata:(id)a5
{
  int64_t var1;
  int64_t var0;
  id v10;
  HKMCUnconfirmedDeviation *v11;
  HKMCUnconfirmedDeviation *v12;
  objc_super v14;

  var1 = a4.var1;
  var0 = a4.var0;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HKMCUnconfirmedDeviation;
  v11 = -[HKMCUnconfirmedDeviation init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    v11->_days.start = var0;
    v11->_days.duration = var1;
    objc_storeStrong((id *)&v11->_analyticsMetadata, a5);
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("Type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_days.start, CFSTR("DaysStart"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_days.duration, CFSTR("DaysDuration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_analyticsMetadata, CFSTR("AnalyticsMetadata"));

}

- (HKMCUnconfirmedDeviation)initWithCoder:(id)a3
{
  id v4;
  HKMCUnconfirmedDeviation *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSDictionary *analyticsMetadata;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKMCUnconfirmedDeviation;
  v5 = -[HKMCUnconfirmedDeviation init](&v16, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Type"));
    v5->_days.start = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("DaysStart"));
    v5->_days.duration = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("DaysDuration"));
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("AnalyticsMetadata"));
    v13 = objc_claimAutoreleasedReturnValue();
    analyticsMetadata = v5->_analyticsMetadata;
    v5->_analyticsMetadata = (NSDictionary *)v13;

  }
  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  NSStringFromDeviationType(self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromHKDayIndexRange();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p type:%@ days:%@ analytics:%@>"), v4, self, v5, v6, self->_analyticsMetadata);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)hk_redactedDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), self);
}

- (BOOL)isEqual:(id)a3
{
  HKMCUnconfirmedDeviation *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = (HKMCUnconfirmedDeviation *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v5 = -[HKMCUnconfirmedDeviation type](self, "type"), v5 == -[HKMCUnconfirmedDeviation type](v4, "type")))
    {
      v6 = -[HKMCUnconfirmedDeviation days](self, "days");
      v8 = v7;
      v10 = 0;
      if (v6 == -[HKMCUnconfirmedDeviation days](v4, "days") && v8 == v9)
      {
        -[HKMCUnconfirmedDeviation analyticsMetadata](self, "analyticsMetadata");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMCUnconfirmedDeviation analyticsMetadata](v4, "analyticsMetadata");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 == v12)
        {
          v10 = 1;
        }
        else
        {
          -[HKMCUnconfirmedDeviation analyticsMetadata](v4, "analyticsMetadata");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            -[HKMCUnconfirmedDeviation analyticsMetadata](self, "analyticsMetadata");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[HKMCUnconfirmedDeviation analyticsMetadata](v4, "analyticsMetadata");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v14, "isEqual:", v15);

          }
          else
          {
            v10 = 0;
          }

        }
      }
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  int64_t v2;

  v2 = self->_days.start ^ self->_type ^ self->_days.duration;
  return v2 ^ -[NSDictionary hash](self->_analyticsMetadata, "hash");
}

- (int64_t)type
{
  return self->_type;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)days
{
  int64_t duration;
  int64_t start;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  duration = self->_days.duration;
  start = self->_days.start;
  result.var1 = duration;
  result.var0 = start;
  return result;
}

- (NSDictionary)analyticsMetadata
{
  return self->_analyticsMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsMetadata, 0);
}

@end
