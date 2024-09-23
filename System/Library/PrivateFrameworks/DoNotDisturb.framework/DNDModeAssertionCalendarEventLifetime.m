@implementation DNDModeAssertionCalendarEventLifetime

- (DNDModeAssertionCalendarEventLifetime)initWithEventUniqueID:(id)a3 occurrenceDate:(id)a4 onlyDuringEvent:(BOOL)a5
{
  id v8;
  id v9;
  DNDModeAssertionCalendarEventLifetime *v10;
  uint64_t v11;
  NSString *eventUniqueID;
  uint64_t v13;
  NSDate *occurrenceDate;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DNDModeAssertionCalendarEventLifetime;
  v10 = -[DNDModeAssertionLifetime _init](&v16, sel__init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    eventUniqueID = v10->_eventUniqueID;
    v10->_eventUniqueID = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    occurrenceDate = v10->_occurrenceDate;
    v10->_occurrenceDate = (NSDate *)v13;

    v10->_onlyDuringEvent = a5;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[DNDModeAssertionCalendarEventLifetime eventUniqueID](self, "eventUniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDModeAssertionCalendarEventLifetime occurrenceDate](self, "occurrenceDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[DNDModeAssertionCalendarEventLifetime isOnlyDuringEvent](self, "isOnlyDuringEvent");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  DNDModeAssertionCalendarEventLifetime *v7;
  DNDModeAssertionCalendarEventLifetime *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _BOOL4 v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v7 = (DNDModeAssertionCalendarEventLifetime *)a3;
  if (self == v7)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      -[DNDModeAssertionCalendarEventLifetime eventUniqueID](self, "eventUniqueID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDModeAssertionCalendarEventLifetime eventUniqueID](v8, "eventUniqueID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 != v10)
      {
        -[DNDModeAssertionCalendarEventLifetime eventUniqueID](self, "eventUniqueID");
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          LOBYTE(v14) = 0;
          goto LABEL_28;
        }
        v3 = (void *)v11;
        -[DNDModeAssertionCalendarEventLifetime eventUniqueID](v8, "eventUniqueID");
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          LOBYTE(v14) = 0;
LABEL_27:

          goto LABEL_28;
        }
        v4 = (void *)v12;
        -[DNDModeAssertionCalendarEventLifetime eventUniqueID](self, "eventUniqueID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDModeAssertionCalendarEventLifetime eventUniqueID](v8, "eventUniqueID");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:", v5))
        {
          LOBYTE(v14) = 0;
LABEL_26:

          goto LABEL_27;
        }
        v26 = v5;
        v27 = v13;
        v28 = v4;
      }
      -[DNDModeAssertionCalendarEventLifetime occurrenceDate](self, "occurrenceDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDModeAssertionCalendarEventLifetime occurrenceDate](v8, "occurrenceDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15 == v16)
        goto LABEL_16;
      -[DNDModeAssertionCalendarEventLifetime occurrenceDate](self, "occurrenceDate");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
      {

        LOBYTE(v14) = 0;
        goto LABEL_25;
      }
      v5 = (void *)v17;
      -[DNDModeAssertionCalendarEventLifetime occurrenceDate](v8, "occurrenceDate");
      v18 = objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        LOBYTE(v14) = 0;
        goto LABEL_23;
      }
      v24 = (void *)v18;
      -[DNDModeAssertionCalendarEventLifetime occurrenceDate](self, "occurrenceDate");
      v19 = objc_claimAutoreleasedReturnValue();
      -[DNDModeAssertionCalendarEventLifetime occurrenceDate](v8, "occurrenceDate");
      v20 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v19;
      v21 = (void *)v19;
      v4 = (void *)v20;
      if (objc_msgSend(v21, "isEqual:", v20))
      {
LABEL_16:
        v22 = -[DNDModeAssertionCalendarEventLifetime isOnlyDuringEvent](self, "isOnlyDuringEvent");
        v14 = v22 ^ -[DNDModeAssertionCalendarEventLifetime isOnlyDuringEvent](v8, "isOnlyDuringEvent") ^ 1;
        if (v15 == v16)
        {

LABEL_24:
LABEL_25:
          v13 = v27;
          v4 = v28;
          v5 = v26;
          if (v9 != v10)
            goto LABEL_26;
LABEL_28:

          goto LABEL_29;
        }
      }
      else
      {
        LOBYTE(v14) = 0;
      }

LABEL_23:
      goto LABEL_24;
    }
    LOBYTE(v14) = 0;
  }
LABEL_29:

  return v14;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDModeAssertionCalendarEventLifetime eventUniqueID](self, "eventUniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDModeAssertionCalendarEventLifetime occurrenceDate](self, "occurrenceDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DNDModeAssertionCalendarEventLifetime isOnlyDuringEvent](self, "isOnlyDuringEvent");
  v8 = CFSTR("NO");
  if (v7)
    v8 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; eventUniqueID: '%@'; occurrenceDate: %@; onlyDuringEvent: %@>"),
    v4,
    self,
    v5,
    v6,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)lifetimeType
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDModeAssertionCalendarEventLifetime)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  DNDModeAssertionCalendarEventLifetime *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventUniqueID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("occurrenceDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("onlyDuringEvent"));

  v8 = -[DNDModeAssertionCalendarEventLifetime initWithEventUniqueID:occurrenceDate:onlyDuringEvent:](self, "initWithEventUniqueID:occurrenceDate:onlyDuringEvent:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[DNDModeAssertionCalendarEventLifetime eventUniqueID](self, "eventUniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("eventUniqueID"));

  -[DNDModeAssertionCalendarEventLifetime occurrenceDate](self, "occurrenceDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("occurrenceDate"));

  objc_msgSend(v6, "encodeBool:forKey:", -[DNDModeAssertionCalendarEventLifetime isOnlyDuringEvent](self, "isOnlyDuringEvent"), CFSTR("onlyDuringEvent"));
}

- (NSString)eventUniqueID
{
  return self->_eventUniqueID;
}

- (NSDate)occurrenceDate
{
  return self->_occurrenceDate;
}

- (BOOL)isOnlyDuringEvent
{
  return self->_onlyDuringEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_occurrenceDate, 0);
  objc_storeStrong((id *)&self->_eventUniqueID, 0);
}

@end
