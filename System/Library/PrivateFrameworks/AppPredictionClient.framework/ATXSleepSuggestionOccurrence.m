@implementation ATXSleepSuggestionOccurrence

- (ATXSleepSuggestionOccurrence)initWithBedtimeComponents:(id)a3 wakeupComponents:(id)a4 weekdays:(unint64_t)a5
{
  id v9;
  id v10;
  ATXSleepSuggestionOccurrence *v11;
  ATXSleepSuggestionOccurrence *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXSleepSuggestionOccurrence;
  v11 = -[ATXSleepSuggestionOccurrence init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_bedtimeComponents, a3);
    objc_storeStrong((id *)&v12->_wakeUpComponents, a4);
    v12->_weekdays = a5;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSDateComponents *bedtimeComponents;
  id v5;

  bedtimeComponents = self->_bedtimeComponents;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bedtimeComponents, CFSTR("bedtimeComponents"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_wakeUpComponents, CFSTR("wakeUpComponents"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_weekdays, CFSTR("weekdays"));

}

- (ATXSleepSuggestionOccurrence)initWithCoder:(id)a3
{
  id v4;
  ATXSleepSuggestionOccurrence *v5;
  uint64_t v6;
  NSDateComponents *bedtimeComponents;
  uint64_t v8;
  NSDateComponents *wakeUpComponents;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXSleepSuggestionOccurrence;
  v5 = -[ATXSleepSuggestionOccurrence init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bedtimeComponents"));
    v6 = objc_claimAutoreleasedReturnValue();
    bedtimeComponents = v5->_bedtimeComponents;
    v5->_bedtimeComponents = (NSDateComponents *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wakeUpComponents"));
    v8 = objc_claimAutoreleasedReturnValue();
    wakeUpComponents = v5->_wakeUpComponents;
    v5->_wakeUpComponents = (NSDateComponents *)v8;

    v5->_weekdays = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("weekdays"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDateComponents)bedtimeComponents
{
  return self->_bedtimeComponents;
}

- (void)setBedtimeComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDateComponents)wakeUpComponents
{
  return self->_wakeUpComponents;
}

- (void)setWakeUpComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)weekdays
{
  return self->_weekdays;
}

- (void)setWeekdays:(unint64_t)a3
{
  self->_weekdays = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wakeUpComponents, 0);
  objc_storeStrong((id *)&self->_bedtimeComponents, 0);
}

@end
