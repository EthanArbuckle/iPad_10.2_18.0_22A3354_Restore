@implementation HKMedicationScheduleItem

- (HKMedicationScheduleItem)initWithScheduledDateTime:(id)a3 notificationSent:(BOOL)a4 doses:(id)a5
{
  id v8;
  id v9;
  HKMedicationScheduleItem *v10;
  uint64_t v11;
  NSString *identifier;
  uint64_t v13;
  NSDate *scheduledDateTime;
  uint64_t v15;
  NSArray *doses;
  objc_super v18;

  v8 = a3;
  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HKMedicationScheduleItem;
  v10 = -[HKMedicationScheduleItem init](&v18, sel_init);
  if (v10)
  {
    +[HKMedicationScheduleItem makeStableIdentifierFromScheduledDateTime:](HKMedicationScheduleItem, "makeStableIdentifierFromScheduledDateTime:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    v13 = objc_msgSend(v8, "copy");
    scheduledDateTime = v10->_scheduledDateTime;
    v10->_scheduledDateTime = (NSDate *)v13;

    v10->_notificationSent = a4;
    v15 = objc_msgSend(v9, "copy");
    doses = v10->_doses;
    v10->_doses = (NSArray *)v15;

  }
  return v10;
}

+ (BOOL)isScheduleItemIdentifier:(id)a3 matchingDateTime:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a3;
  +[HKMedicationScheduleItem makeStableIdentifierFromScheduledDateTime:](HKMedicationScheduleItem, "makeStableIdentifierFromScheduledDateTime:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  HKMedicationScheduleItem *v4;
  char v5;

  v4 = (HKMedicationScheduleItem *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = -[NSString isEqual:](v4->_identifier, "isEqual:", self->_identifier);
    else
      v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

+ (id)makeStableIdentifierFromScheduledDateTime:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%f"), v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scheduledDateTime, CFSTR("scheduledDateTime"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_notificationSent, CFSTR("notificationSent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_doses, CFSTR("doses"));

}

- (HKMedicationScheduleItem)initWithCoder:(id)a3
{
  id v4;
  HKMedicationScheduleItem *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSDate *scheduledDateTime;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *doses;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKMedicationScheduleItem;
  v5 = -[HKMedicationScheduleItem init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scheduledDateTime"));
    v8 = objc_claimAutoreleasedReturnValue();
    scheduledDateTime = v5->_scheduledDateTime;
    v5->_scheduledDateTime = (NSDate *)v8;

    v5->_notificationSent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("notificationSent"));
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("doses"));
    v13 = objc_claimAutoreleasedReturnValue();
    doses = v5->_doses;
    v5->_doses = (NSArray *)v13;

  }
  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HKMedicationScheduleItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicationScheduleItem scheduledDateTime](self, "scheduledDateTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKMedicationScheduleItem notificationSent](self, "notificationSent");
  -[HKMedicationScheduleItem _dosesDescription](self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>: identifier: %@ scheduledDateTime: %@ notificationSent: %i doses:\n%@"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dosesDescription
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v1 = a1;
  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v1, "doses");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v8 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7), "description");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "stringWithFormat:", CFSTR("%@\n"), v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "appendString:", v10);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v2);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)scheduledDateTime
{
  return self->_scheduledDateTime;
}

- (BOOL)notificationSent
{
  return self->_notificationSent;
}

- (NSArray)doses
{
  return self->_doses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doses, 0);
  objc_storeStrong((id *)&self->_scheduledDateTime, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
