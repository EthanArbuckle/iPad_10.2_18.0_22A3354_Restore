@implementation CADEventEntityWrapper

- (id)occurrenceDate
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_occurrenceDate);
}

- (CADEventEntityWrapper)initWithCalEntity:(void *)a3 loadedValues:(id)a4 occurrenceDate:(double)a5
{
  CADEventEntityWrapper *v6;
  CADEventEntityWrapper *v7;
  double v8;
  uint64_t v9;
  NSDate *nextReminderOccurrenceDate;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CADEventEntityWrapper;
  v6 = -[CADEntityWrapper initWithCalEntity:loadedValues:](&v12, sel_initWithCalEntity_loadedValues_);
  v7 = v6;
  if (v6)
  {
    v6->_occurrenceDate = a5;
    CalEventNextReminderOccurrenceDateIfEventKitIsLikelyToWantIt();
    if (v8 != *MEMORY[0x1E0D0C490])
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v9 = objc_claimAutoreleasedReturnValue();
      nextReminderOccurrenceDate = v7->_nextReminderOccurrenceDate;
      v7->_nextReminderOccurrenceDate = (NSDate *)v9;

    }
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDate *nextReminderOccurrenceDate;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CADEventEntityWrapper;
  -[CADEntityWrapper encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("occurrenceDate"), self->_occurrenceDate);
  nextReminderOccurrenceDate = self->_nextReminderOccurrenceDate;
  if (nextReminderOccurrenceDate)
    objc_msgSend(v4, "encodeObject:forKey:", nextReminderOccurrenceDate, CFSTR("next"));

}

- (CADEventEntityWrapper)initWithCoder:(id)a3
{
  id v4;
  CADEventEntityWrapper *v5;
  double v6;
  uint64_t v7;
  NSDate *nextReminderOccurrenceDate;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CADEventEntityWrapper;
  v5 = -[CADEntityWrapper initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("occurrenceDate"));
    v5->_occurrenceDate = v6;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("next"));
    v7 = objc_claimAutoreleasedReturnValue();
    nextReminderOccurrenceDate = v5->_nextReminderOccurrenceDate;
    v5->_nextReminderOccurrenceDate = (NSDate *)v7;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)nextReminderOccurrenceDate
{
  return self->_nextReminderOccurrenceDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextReminderOccurrenceDate, 0);
}

@end
