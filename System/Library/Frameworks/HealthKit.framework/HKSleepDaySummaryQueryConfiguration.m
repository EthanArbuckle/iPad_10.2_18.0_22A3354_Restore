@implementation HKSleepDaySummaryQueryConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HKSleepDaySummaryQueryConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[HKSleepDaySummaryQueryConfiguration morningIndexRange](self, "morningIndexRange");
  objc_msgSend(v4, "setMorningIndexRange:", v5, v6);
  objc_msgSend(v4, "setAscending:", -[HKSleepDaySummaryQueryConfiguration ascending](self, "ascending"));
  objc_msgSend(v4, "setLimit:", -[HKSleepDaySummaryQueryConfiguration limit](self, "limit"));
  objc_msgSend(v4, "setOptions:", -[HKSleepDaySummaryQueryConfiguration options](self, "options"));
  -[HKSleepDaySummaryQueryConfiguration cacheSettings](self, "cacheSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setCacheSettings:", v8);

  -[HKSleepDaySummaryQueryConfiguration calendarOverrides](self, "calendarOverrides");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setCalendarOverrides:", v10);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKSleepDaySummaryQueryConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKSleepDaySummaryQueryConfiguration *v5;
  uint64_t v6;
  HKSleepDaySummaryCacheSettings *cacheSettings;
  uint64_t v8;
  NSCalendar *calendarOverrides;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKSleepDaySummaryQueryConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_morningIndexRange.start = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MorningIndexRangeStart"));
    v5->_morningIndexRange.duration = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MorningIndexRangeDuration"));
    v5->_ascending = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Ascending"));
    v5->_limit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Limit"));
    v5->_options = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Options"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CacheSettings"));
    v6 = objc_claimAutoreleasedReturnValue();
    cacheSettings = v5->_cacheSettings;
    v5->_cacheSettings = (HKSleepDaySummaryCacheSettings *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CalendarOverrides"));
    v8 = objc_claimAutoreleasedReturnValue();
    calendarOverrides = v5->_calendarOverrides;
    v5->_calendarOverrides = (NSCalendar *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKSleepDaySummaryQueryConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_morningIndexRange.start, CFSTR("MorningIndexRangeStart"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_morningIndexRange.duration, CFSTR("MorningIndexRangeDuration"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_ascending, CFSTR("Ascending"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_limit, CFSTR("Limit"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_options, CFSTR("Options"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_cacheSettings, CFSTR("CacheSettings"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_calendarOverrides, CFSTR("CalendarOverrides"));

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t limit;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v13.receiver = self;
  v13.super_class = (Class)HKSleepDaySummaryQueryConfiguration;
  -[HKSleepDaySummaryQueryConfiguration description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromHKDayIndexRange(self->_morningIndexRange.start, self->_morningIndexRange.duration);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKStringFromBool(self->_ascending);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  limit = self->_limit;
  HKSleepDaySummaryQueryOptionsStringRepresentation(self->_options);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSleepDaySummaryQueryConfiguration cacheSettings](self, "cacheSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSleepDaySummaryQueryConfiguration calendarOverrides](self, "calendarOverrides");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ Configuration - morningIndexRange: %@, ascending: %@, limit: %ld, options: %@, cacheSettings: %@, calendarOverrides: %@>"), v4, v5, v6, limit, v8, v9, v10);

  return v11;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)morningIndexRange
{
  $BB81632A5F90EABF970498852D8C14B8 *p_morningIndexRange;
  int64_t start;
  int64_t duration;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  p_morningIndexRange = &self->_morningIndexRange;
  start = self->_morningIndexRange.start;
  duration = p_morningIndexRange->duration;
  result.var1 = duration;
  result.var0 = start;
  return result;
}

- (void)setMorningIndexRange:(id)a3
{
  self->_morningIndexRange = ($BB81632A5F90EABF970498852D8C14B8)a3;
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

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (HKSleepDaySummaryCacheSettings)cacheSettings
{
  return self->_cacheSettings;
}

- (void)setCacheSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSCalendar)calendarOverrides
{
  return self->_calendarOverrides;
}

- (void)setCalendarOverrides:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarOverrides, 0);
  objc_storeStrong((id *)&self->_cacheSettings, 0);
}

@end
