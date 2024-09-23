@implementation HKMCDaySummaryQueryConfiguration

- (HKMCDaySummaryQueryConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKMCDaySummaryQueryConfiguration *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKMCDaySummaryQueryConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_dayIndexRange.start = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("DayIndexRangeStart"));
    v5->_dayIndexRange.duration = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("DayIndexRangeDuration"));
    v5->_ascending = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Ascending"));
    v5->_limit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Limit"));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKMCDaySummaryQueryConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[HKMCDaySummaryQueryConfiguration dayIndexRange](self, "dayIndexRange");
  objc_msgSend(v4, "setDayIndexRange:", v5, v6);
  objc_msgSend(v4, "setAscending:", -[HKMCDaySummaryQueryConfiguration ascending](self, "ascending"));
  objc_msgSend(v4, "setLimit:", -[HKMCDaySummaryQueryConfiguration limit](self, "limit"));
  return v4;
}

- (void)setLimit:(int64_t)a3
{
  self->_limit = a3;
}

- (void)setDayIndexRange:(id)a3
{
  self->_dayIndexRange = ($BB81632A5F90EABF970498852D8C14B8)a3;
}

- (void)setAscending:(BOOL)a3
{
  self->_ascending = a3;
}

- (int64_t)limit
{
  return self->_limit;
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

- (BOOL)ascending
{
  return self->_ascending;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKMCDaySummaryQueryConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_dayIndexRange.start, CFSTR("DayIndexRangeStart"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_dayIndexRange.duration, CFSTR("DayIndexRangeDuration"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_ascending, CFSTR("Ascending"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_limit, CFSTR("Limit"));

}

@end
