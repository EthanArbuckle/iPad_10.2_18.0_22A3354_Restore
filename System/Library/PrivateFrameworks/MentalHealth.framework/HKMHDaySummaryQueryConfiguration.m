@implementation HKMHDaySummaryQueryConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKMHDaySummaryQueryConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v9, sel_copyWithZone_, a3);
  v5 = -[HKMHDaySummaryQueryConfiguration dayIndexRange](self, "dayIndexRange");
  objc_msgSend(v4, "setDayIndexRange:", v5, v6);
  -[HKMHDaySummaryQueryConfiguration gregorianCalendar](self, "gregorianCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGregorianCalendar:", v7);

  objc_msgSend(v4, "setAscending:", -[HKMHDaySummaryQueryConfiguration ascending](self, "ascending"));
  objc_msgSend(v4, "setLimit:", -[HKMHDaySummaryQueryConfiguration limit](self, "limit"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMHDaySummaryQueryConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKMHDaySummaryQueryConfiguration *v5;
  uint64_t v6;
  NSCalendar *gregorianCalendar;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMHDaySummaryQueryConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_dayIndexRange.start = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("DayIndexRangeStart"));
    v5->_dayIndexRange.duration = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("DayIndexRangeDuration"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GregorianCalendar"));
    v6 = objc_claimAutoreleasedReturnValue();
    gregorianCalendar = v5->_gregorianCalendar;
    v5->_gregorianCalendar = (NSCalendar *)v6;

    v5->_ascending = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Ascending"));
    v5->_limit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Limit"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKMHDaySummaryQueryConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_dayIndexRange.start, CFSTR("DayIndexRangeStart"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_dayIndexRange.duration, CFSTR("DayIndexRangeDuration"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_gregorianCalendar, CFSTR("GregorianCalendar"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_ascending, CFSTR("Ascending"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_limit, CFSTR("Limit"));

}

- ($0AC6E346AE4835514AAA8AC86D8F4844)dayIndexRange
{
  $BB81632A5F90EABF970498852D8C14B8 *p_dayIndexRange;
  int64_t start;
  int64_t duration;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  p_dayIndexRange = &self->_dayIndexRange;
  start = self->_dayIndexRange.start;
  duration = p_dayIndexRange->duration;
  result.var1 = duration;
  result.var0 = start;
  return result;
}

- (void)setDayIndexRange:(id)a3
{
  self->_dayIndexRange = ($BB81632A5F90EABF970498852D8C14B8)a3;
}

- (NSCalendar)gregorianCalendar
{
  return self->_gregorianCalendar;
}

- (void)setGregorianCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_gregorianCalendar, a3);
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (void)setAscending:(BOOL)a3
{
  self->_ascending = a3;
}

- (int64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(int64_t)a3
{
  self->_limit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
}

@end
