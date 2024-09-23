@implementation INRecurrenceRule

- (INRecurrenceRule)initWithInterval:(NSUInteger)interval frequency:(INRecurrenceFrequency)frequency
{
  return -[INRecurrenceRule initWithInterval:frequency:weeklyRecurrenceDays:](self, "initWithInterval:frequency:weeklyRecurrenceDays:", interval, frequency, 0);
}

- (INRecurrenceRule)initWithInterval:(NSUInteger)interval frequency:(INRecurrenceFrequency)frequency weeklyRecurrenceDays:(INDayOfWeekOptions)weeklyRecurrenceDays
{
  INRecurrenceRule *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)INRecurrenceRule;
  result = -[INRecurrenceRule init](&v9, sel_init);
  if (result)
  {
    result->_interval = interval;
    result->_frequency = frequency;
    result->_weeklyRecurrenceDays = weeklyRecurrenceDays;
  }
  return result;
}

- (unint64_t)hash
{
  return self->_frequency ^ (8 * self->_interval);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = self->_interval == v5[1] && self->_frequency == v5[2] && self->_weeklyRecurrenceDays == v5[3];

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (INRecurrenceRule)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("interval"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("frequency"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("weeklyRecurrenceDays"));

  return -[INRecurrenceRule initWithInterval:frequency:weeklyRecurrenceDays:](self, "initWithInterval:frequency:weeklyRecurrenceDays:", v5, v6, v7);
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t interval;
  id v5;

  interval = self->_interval;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", interval, CFSTR("interval"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_frequency, CFSTR("frequency"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_weeklyRecurrenceDays, CFSTR("weeklyRecurrenceDays"));

}

- (id)description
{
  return -[INRecurrenceRule descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INRecurrenceRule;
  -[INRecurrenceRule description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INRecurrenceRule _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("interval");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_interval);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("frequency");
  v4 = self->_frequency - 1;
  if (v4 > 5)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E228AFB0[v4];
  v6 = v5;
  v11[1] = v6;
  v10[2] = CFSTR("weeklyRecurrenceDays");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_weeklyRecurrenceDays);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSUInteger)interval
{
  return self->_interval;
}

- (INRecurrenceFrequency)frequency
{
  return self->_frequency;
}

- (INDayOfWeekOptions)weeklyRecurrenceDays
{
  return self->_weeklyRecurrenceDays;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
