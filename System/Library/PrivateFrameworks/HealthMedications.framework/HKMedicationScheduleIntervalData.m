@implementation HKMedicationScheduleIntervalData

- (HKMedicationScheduleIntervalData)initWithStartTimeComponent:(id)a3 daysOfWeek:(unint64_t)a4 cycleIndex:(id)a5 cycleIntervalDays:(id)a6 dose:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HKMedicationScheduleIntervalData *v16;
  uint64_t v17;
  NSDateComponents *startTimeComponent;
  uint64_t v19;
  NSNumber *cycleIndex;
  uint64_t v21;
  NSNumber *cycleIntervalDays;
  uint64_t v23;
  NSNumber *dose;
  objc_super v26;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)HKMedicationScheduleIntervalData;
  v16 = -[HKMedicationScheduleIntervalData init](&v26, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    startTimeComponent = v16->_startTimeComponent;
    v16->_startTimeComponent = (NSDateComponents *)v17;

    v16->_daysOfWeek = a4;
    v19 = objc_msgSend(v13, "copy");
    cycleIndex = v16->_cycleIndex;
    v16->_cycleIndex = (NSNumber *)v19;

    v21 = objc_msgSend(v14, "copy");
    cycleIntervalDays = v16->_cycleIntervalDays;
    v16->_cycleIntervalDays = (NSNumber *)v21;

    v23 = objc_msgSend(v15, "copy");
    dose = v16->_dose;
    v16->_dose = (NSNumber *)v23;

  }
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  HKMedicationScheduleIntervalData *v4;
  HKMedicationScheduleIntervalData *v5;
  NSDateComponents *startTimeComponent;
  NSDateComponents *v7;
  NSNumber *cycleIndex;
  NSNumber *v9;
  NSNumber *cycleIntervalDays;
  NSNumber *v11;
  NSNumber *dose;
  NSNumber *v13;
  char v14;

  v4 = (HKMedicationScheduleIntervalData *)a3;
  if (v4 == self)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      startTimeComponent = self->_startTimeComponent;
      v7 = v5->_startTimeComponent;
      if (startTimeComponent != v7
        && (!v7 || !-[NSDateComponents isEqual:](startTimeComponent, "isEqual:")))
      {
        goto LABEL_18;
      }
      if (self->_daysOfWeek != v5->_daysOfWeek)
        goto LABEL_18;
      cycleIndex = self->_cycleIndex;
      v9 = v5->_cycleIndex;
      if (cycleIndex != v9 && (!v9 || !-[NSNumber isEqual:](cycleIndex, "isEqual:")))
        goto LABEL_18;
      cycleIntervalDays = self->_cycleIntervalDays;
      v11 = v5->_cycleIntervalDays;
      if (cycleIntervalDays != v11 && (!v11 || !-[NSNumber isEqual:](cycleIntervalDays, "isEqual:")))
        goto LABEL_18;
      dose = self->_dose;
      v13 = v5->_dose;
      if (dose == v13)
      {
        v14 = 1;
        goto LABEL_19;
      }
      if (v13)
        v14 = -[NSNumber isEqual:](dose, "isEqual:");
      else
LABEL_18:
        v14 = 0;
LABEL_19:

      goto LABEL_20;
    }
    v14 = 0;
  }
LABEL_20:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = self->_daysOfWeek ^ -[NSDateComponents hash](self->_startTimeComponent, "hash");
  v4 = -[NSNumber hash](self->_cycleIndex, "hash");
  v5 = v3 ^ v4 ^ -[NSNumber hash](self->_cycleIntervalDays, "hash");
  return v5 ^ -[NSNumber hash](self->_dose, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDateComponents *startTimeComponent;
  id v5;

  startTimeComponent = self->_startTimeComponent;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", startTimeComponent, CFSTR("startTimeComponent"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_daysOfWeek, CFSTR("daysOfWeek"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cycleIndex, CFSTR("cycleIndex"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cycleIntervalDays, CFSTR("cycleIntervalDays"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dose, CFSTR("dose"));

}

- (HKMedicationScheduleIntervalData)initWithCoder:(id)a3
{
  id v4;
  HKMedicationScheduleIntervalData *v5;
  uint64_t v6;
  NSDateComponents *startTimeComponent;
  uint64_t v8;
  NSNumber *cycleIndex;
  uint64_t v10;
  NSNumber *cycleIntervalDays;
  uint64_t v12;
  NSNumber *dose;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKMedicationScheduleIntervalData;
  v5 = -[HKMedicationScheduleIntervalData init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startTimeComponent"));
    v6 = objc_claimAutoreleasedReturnValue();
    startTimeComponent = v5->_startTimeComponent;
    v5->_startTimeComponent = (NSDateComponents *)v6;

    v5->_daysOfWeek = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("daysOfWeek"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cycleIndex"));
    v8 = objc_claimAutoreleasedReturnValue();
    cycleIndex = v5->_cycleIndex;
    v5->_cycleIndex = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cycleIntervalDays"));
    v10 = objc_claimAutoreleasedReturnValue();
    cycleIntervalDays = v5->_cycleIntervalDays;
    v5->_cycleIntervalDays = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dose"));
    v12 = objc_claimAutoreleasedReturnValue();
    dose = v5->_dose;
    v5->_dose = (NSNumber *)v12;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02d:%02d:%02d"), -[NSDateComponents hour](self->_startTimeComponent, "hour"), -[NSDateComponents minute](self->_startTimeComponent, "minute"), -[NSDateComponents second](self->_startTimeComponent, "second"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  HKStringFromReminderWeekdayOptions(self->_daysOfWeek);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p>: startTime: %@ daysOfWeek: %@ cycleIndex: %@ cycleIntervalDays: %@ dose: %@"), v5, self, v3, v6, self->_cycleIndex, self->_cycleIntervalDays, self->_dose);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDateComponents)startTimeComponent
{
  return self->_startTimeComponent;
}

- (unint64_t)daysOfWeek
{
  return self->_daysOfWeek;
}

- (NSNumber)cycleIndex
{
  return self->_cycleIndex;
}

- (NSNumber)cycleIntervalDays
{
  return self->_cycleIntervalDays;
}

- (NSNumber)dose
{
  return self->_dose;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dose, 0);
  objc_storeStrong((id *)&self->_cycleIntervalDays, 0);
  objc_storeStrong((id *)&self->_cycleIndex, 0);
  objc_storeStrong((id *)&self->_startTimeComponent, 0);
}

@end
