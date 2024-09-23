@implementation EKRecurrenceRule

id __33__EKRecurrenceRule_recurrenceEnd__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  EKRecurrenceEnd *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v2)
  {
    v4 = -[EKRecurrenceEnd initWithEndDate:]([EKRecurrenceEnd alloc], "initWithEndDate:", v2);
LABEL_5:
    v5 = v4;
    goto LABEL_6;
  }
  v5 = (void *)v3;
  if (v3)
  {
    v4 = -[EKRecurrenceEnd initWithOccurrenceCount:]([EKRecurrenceEnd alloc], "initWithOccurrenceCount:", v3);
    goto LABEL_5;
  }
LABEL_6:

  return v5;
}

- (id)endDate
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B8D0]);
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B8C8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (EKRecurrenceEnd)recurrenceEnd
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__EKRecurrenceRule_recurrenceEnd__block_invoke;
  v3[3] = &unk_1E4784B98;
  v3[4] = self;
  -[EKObject cachedValueForKey:populateBlock:](self, "cachedValueForKey:populateBlock:", CFSTR("recurrenceEnd"), v3);
  return (EKRecurrenceEnd *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)weeksOfTheYear
{
  void *v2;
  void *v3;

  -[EKRecurrenceRule _recurrenceHelper](self, "_recurrenceHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "weeksOfTheYear");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)setPositions
{
  void *v2;
  void *v3;

  -[EKRecurrenceRule _recurrenceHelper](self, "_recurrenceHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPositions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)_recurrenceHelper
{
  EKRecurrenceHelper *recurrenceHelper;
  EKRecurrenceHelper *v4;
  void *v5;
  EKRecurrenceHelper *v6;
  EKRecurrenceHelper *v7;

  recurrenceHelper = self->_recurrenceHelper;
  if (!recurrenceHelper)
  {
    v4 = [EKRecurrenceHelper alloc];
    -[EKRecurrenceRule specifier](self, "specifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[EKRecurrenceHelper initWithSpecifier:](v4, "initWithSpecifier:", v5);
    v7 = self->_recurrenceHelper;
    self->_recurrenceHelper = v6;

    recurrenceHelper = self->_recurrenceHelper;
  }
  return recurrenceHelper;
}

- (id)specifier
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B8F8]);
}

- (NSArray)monthsOfTheYear
{
  void *v2;
  void *v3;

  -[EKRecurrenceRule _recurrenceHelper](self, "_recurrenceHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "monthsOfTheYear");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSInteger)interval
{
  void *v2;
  NSInteger v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B8E8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (EKRecurrenceFrequency)frequency
{
  uint64_t v2;
  EKRecurrenceFrequency result;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = -[EKRecurrenceRule frequencyRaw](self, "frequencyRaw");
  result = (unint64_t)(v2 - 1);
  if (result >= 4)
  {
    v4 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKRecurrenceRule frequency].cold.1(v2, v4, v5, v6, v7, v8, v9, v10);
    return 0;
  }
  return result;
}

- (int)frequencyRaw
{
  void *v2;
  int v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B8E0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (NSInteger)firstDayOfTheWeek
{
  NSInteger result;

  result = objc_msgSend((id)objc_opt_class(), "_ekWeekdayFromCalDayOfWeek:", -[EKRecurrenceRule firstDayOfTheWeekRaw](self, "firstDayOfTheWeekRaw"));
  if (!result)
    return 2;
  return result;
}

- (int)firstDayOfTheWeekRaw
{
  void *v2;
  int v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B8D8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (NSArray)daysOfTheYear
{
  void *v2;
  void *v3;

  -[EKRecurrenceRule _recurrenceHelper](self, "_recurrenceHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "daysOfTheYear");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)daysOfTheWeek
{
  void *v2;
  void *v3;

  -[EKRecurrenceRule _recurrenceHelper](self, "_recurrenceHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "daysOfTheWeek");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)daysOfTheMonth
{
  void *v2;
  void *v3;

  -[EKRecurrenceRule _recurrenceHelper](self, "_recurrenceHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "daysOfTheMonth");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

+ (int64_t)_ekWeekdayFromCalDayOfWeek:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = *(_QWORD *)&a3;
  if (a3 < 8)
    return qword_1A244A208[a3];
  v5 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    +[EKRecurrenceRule _ekWeekdayFromCalDayOfWeek:].cold.1(v3, v5, v6, v7, v8, v9, v10, v11);
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recurrenceHelper, 0);
}

+ (id)knownSingleValueKeysForComparison
{
  if (knownSingleValueKeysForComparison_onceToken != -1)
    dispatch_once(&knownSingleValueKeysForComparison_onceToken, &__block_literal_global);
  return (id)knownSingleValueKeysForComparison_keys;
}

void __53__EKRecurrenceRule_knownSingleValueKeysForComparison__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B8E8];
  v5[0] = *MEMORY[0x1E0D0B8E0];
  v5[1] = v0;
  v1 = *MEMORY[0x1E0D0B8D0];
  v5[2] = *MEMORY[0x1E0D0B8D8];
  v5[3] = v1;
  v2 = *MEMORY[0x1E0D0B8F8];
  v5[4] = *MEMORY[0x1E0D0B8C8];
  v5[5] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)knownSingleValueKeysForComparison_keys;
  knownSingleValueKeysForComparison_keys = v3;

}

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)knownIdentityKeysForComparison
{
  if (knownIdentityKeysForComparison_onceToken != -1)
    dispatch_once(&knownIdentityKeysForComparison_onceToken, &__block_literal_global_5);
  return (id)knownIdentityKeysForComparison_keys;
}

void __50__EKRecurrenceRule_knownIdentityKeysForComparison__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0D0B820];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)knownIdentityKeysForComparison_keys;
  knownIdentityKeysForComparison_keys = v0;

}

+ (id)knownRelationshipWeakKeys
{
  if (knownRelationshipWeakKeys_onceToken != -1)
    dispatch_once(&knownRelationshipWeakKeys_onceToken, &__block_literal_global_6);
  return (id)knownRelationshipWeakKeys_keys;
}

void __45__EKRecurrenceRule_knownRelationshipWeakKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0D0B8F0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)knownRelationshipWeakKeys_keys;
  knownRelationshipWeakKeys_keys = v0;

}

+ (EKRecurrenceRule)recurrenceRuleWithType:(int64_t)a3 interval:(unint64_t)a4 end:(id)a5
{
  id v8;
  void *v9;

  v8 = a5;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initRecurrenceWithFrequency:interval:end:", a3, a4, v8);

  return (EKRecurrenceRule *)v9;
}

- (EKRecurrenceRule)init
{
  EKRecurrenceRule *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKRecurrenceRule;
  v2 = -[EKObject init](&v5, sel_init);
  if (v2)
  {
    EKUUIDString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKRecurrenceRule setUUID:](v2, "setUUID:", v3);

    -[EKRecurrenceRule setFrequency:](v2, "setFrequency:", 1);
    -[EKRecurrenceRule setInterval:](v2, "setInterval:", 1);
    -[EKRecurrenceRule setFirstDayOfTheWeek:](v2, "setFirstDayOfTheWeek:", 0);
    -[EKObject updatePersistentValueForKeyIfNeeded:](v2, "updatePersistentValueForKeyIfNeeded:", *MEMORY[0x1E0D0B820]);
  }
  return v2;
}

- (EKRecurrenceRule)initRecurrenceWithFrequency:(EKRecurrenceFrequency)type interval:(NSInteger)interval daysOfTheWeek:(NSArray *)days daysOfTheMonth:(NSArray *)monthDays monthsOfTheYear:(NSArray *)months weeksOfTheYear:(NSArray *)weeksOfTheYear daysOfTheYear:(NSArray *)daysOfTheYear setPositions:(NSArray *)setPositions end:(EKRecurrenceEnd *)end
{
  NSArray *v17;
  NSArray *v18;
  NSArray *v19;
  NSArray *v20;
  NSArray *v21;
  NSArray *v22;
  EKRecurrenceEnd *v23;
  EKRecurrenceRule *v24;

  v17 = days;
  v18 = monthDays;
  v19 = months;
  v20 = weeksOfTheYear;
  v21 = daysOfTheYear;
  v22 = setPositions;
  v23 = end;
  v24 = -[EKRecurrenceRule init](self, "init");
  if (v24)
  {
    if (interval <= 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Interval must be greater than 0"));
    -[EKRecurrenceRule setFrequency:](v24, "setFrequency:", type);
    -[EKRecurrenceRule setInterval:](v24, "setInterval:", interval);
    -[EKRecurrenceRule setRecurrenceEnd:](v24, "setRecurrenceEnd:", v23);
    -[EKRecurrenceRule setDaysOfTheWeek:](v24, "setDaysOfTheWeek:", v17);
    -[EKRecurrenceRule setDaysOfTheMonth:](v24, "setDaysOfTheMonth:", v18);
    -[EKRecurrenceRule setSetPositions:](v24, "setSetPositions:", v22);
    -[EKRecurrenceRule setMonthsOfTheYear:](v24, "setMonthsOfTheYear:", v19);
    -[EKRecurrenceRule setDaysOfTheYear:](v24, "setDaysOfTheYear:", v21);
    -[EKRecurrenceRule setWeeksOfTheYear:](v24, "setWeeksOfTheYear:", v20);
  }

  return v24;
}

- (EKRecurrenceRule)initRecurrenceWithFrequency:(EKRecurrenceFrequency)type interval:(NSInteger)interval end:(EKRecurrenceEnd *)end
{
  return -[EKRecurrenceRule initRecurrenceWithFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:](self, "initRecurrenceWithFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:", type, interval, 0, 0, 0, 0, 0, 0, end);
}

- (NSString)UUID
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B820]);
}

- (void)setUUID:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B820]);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EKRecurrenceRule stringValueAsDateOnly:isFloating:](self, "stringValueAsDateOnly:isFloating:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%p> RRULE %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  EKRecurrenceRule *v5;
  void *v6;
  void *v7;
  objc_super v9;

  if (objc_msgSend(MEMORY[0x1E0D0C278], "isProgramSDKAtLeast:", 0x7E30901FFFFFFFFLL))
  {
    v9.receiver = self;
    v9.super_class = (Class)EKRecurrenceRule;
    return -[EKObject copyWithZone:](&v9, sel_copyWithZone_, a3);
  }
  else
  {
    v5 = objc_alloc_init(EKRecurrenceRule);
    -[EKRecurrenceRule setFrequency:](v5, "setFrequency:", -[EKRecurrenceRule frequency](self, "frequency"));
    -[EKRecurrenceRule setInterval:](v5, "setInterval:", -[EKRecurrenceRule interval](self, "interval"));
    -[EKRecurrenceRule recurrenceEnd](self, "recurrenceEnd");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKRecurrenceRule setRecurrenceEnd:](v5, "setRecurrenceEnd:", v6);

    -[EKRecurrenceRule specifier](self, "specifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKRecurrenceRule setSpecifier:](v5, "setSpecifier:", v7);

    -[EKRecurrenceRule setFirstDayOfTheWeekRaw:](v5, "setFirstDayOfTheWeekRaw:", -[EKRecurrenceRule firstDayOfTheWeekRaw](self, "firstDayOfTheWeekRaw"));
  }
  return v5;
}

- (NSDateComponents)dateComponents
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  id v7;

  v3 = (void *)objc_opt_new();
  v4 = -[EKRecurrenceRule interval](self, "interval");
  if ((int)v4 >= 1)
  {
    switch(-[EKRecurrenceRule frequency](self, "frequency"))
    {
      case EKRecurrenceFrequencyDaily:
        v5 = v4;
        goto LABEL_6;
      case EKRecurrenceFrequencyWeekly:
        v5 = (int)(7 * v4);
LABEL_6:
        objc_msgSend(v3, "setDay:", v5);
        break;
      case EKRecurrenceFrequencyMonthly:
        objc_msgSend(v3, "setMonth:", v4);
        break;
      case EKRecurrenceFrequencyYearly:
        objc_msgSend(v3, "setYear:", v4);
        break;
      default:
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Encountered illegal value for EKRecurrenceFrequency"), 0);
        v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v7);
    }
  }
  return (NSDateComponents *)v3;
}

- (NSString)calendarIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E0C996C8];
}

- (void)setFrequencyRaw:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B8E0]);

}

- (void)setFrequency:(int64_t)a3
{
  uint64_t v3;

  if ((unint64_t)a3 < 4)
    v3 = (a3 + 1);
  else
    v3 = 0;
  -[EKRecurrenceRule setFrequencyRaw:](self, "setFrequencyRaw:", v3);
}

- (void)setInterval:(unint64_t)a3
{
  void *v6;
  id v7;

  if ((int)a3 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKRecurrenceRule.m"), 276, CFSTR("Interval must be greater than or equal to 1"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v7, *MEMORY[0x1E0D0B8E8]);

}

- (void)setEndDate:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B8D0]);
}

- (void)setCount:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B8C8]);

}

- (void)setRecurrenceEnd:(EKRecurrenceEnd *)recurrenceEnd
{
  void *v4;
  BOOL v5;
  EKRecurrenceEnd *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  EKRecurrenceEnd *v10;

  v10 = recurrenceEnd;
  -[EKRecurrenceRule recurrenceEnd](self, "recurrenceEnd");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[EKRecurrenceEnd isEqual:](v10, "isEqual:", v4);

  v6 = v10;
  if (!v5)
  {
    v7 = (void *)-[EKRecurrenceEnd copy](v10, "copy");
    -[EKObject setCachedValue:forKey:](self, "setCachedValue:forKey:", v7, CFSTR("recurrenceEnd"));

    if (v10)
    {
      if (!-[EKRecurrenceEnd usesEndDate](v10, "usesEndDate"))
      {
        -[EKRecurrenceRule setEndDate:](self, "setEndDate:", 0);
        v9 = -[EKRecurrenceEnd occurrenceCount](v10, "occurrenceCount");
        goto LABEL_8;
      }
      -[EKRecurrenceEnd endDate](v10, "endDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKRecurrenceRule setEndDate:](self, "setEndDate:", v8);

    }
    else
    {
      -[EKRecurrenceRule setEndDate:](self, "setEndDate:", 0);
    }
    v9 = 0;
LABEL_8:
    -[EKRecurrenceRule setCount:](self, "setCount:", v9);
    v6 = v10;
  }

}

- (BOOL)recurrenceEndHasChanges
{
  return -[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B8D0])
      || -[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B8C8]);
}

- (NSDate)cachedEndDate
{
  return (NSDate *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B8B8]);
}

- (void)setCachedEndDate:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B8B8]);
}

- (id)cachedEndDateTimeZone
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B8C0]);
}

- (void)setCachedEndDateTimeZone:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B8C0]);
}

- (void)invalidateCachedEndDate
{
  -[EKRecurrenceRule setCachedEndDate:](self, "setCachedEndDate:", 0);
  -[EKRecurrenceRule setCachedEndDateTimeZone:](self, "setCachedEndDateTimeZone:", 0);
}

- (void)setFirstDayOfTheWeekRaw:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B8D8]);

}

+ (int)_calDayOfWeekFromEKWeekday:(int64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((unint64_t)a3 < 8)
    return dword_1A244A248[a3];
  v5 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    +[EKRecurrenceRule _calDayOfWeekFromEKWeekday:].cold.1(a3, v5, v6, v7, v8, v9, v10, v11);
  return 7;
}

- (void)setFirstDayOfTheWeek:(unint64_t)a3
{
  void *v6;

  if ((int)a3 >= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKRecurrenceRule.m"), 428, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(int)firstDay <= EKWeekdaySaturday"));

  }
  -[EKRecurrenceRule setFirstDayOfTheWeekRaw:](self, "setFirstDayOfTheWeekRaw:", objc_msgSend((id)objc_opt_class(), "_calDayOfWeekFromEKWeekday:", a3));
}

- (void)setSpecifier:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B8F8]);
}

- (void)setDaysOfTheWeek:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[EKRecurrenceRule _recurrenceHelper](self, "_recurrenceHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDaysOfTheWeek:", v4);

  -[EKRecurrenceRule _updateSpecifierIfNeeded](self, "_updateSpecifierIfNeeded");
}

- (void)setDaysOfTheMonth:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[EKRecurrenceRule _recurrenceHelper](self, "_recurrenceHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDaysOfTheMonth:", v4);

  -[EKRecurrenceRule _updateSpecifierIfNeeded](self, "_updateSpecifierIfNeeded");
}

- (void)setDaysOfTheYear:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[EKRecurrenceRule _recurrenceHelper](self, "_recurrenceHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDaysOfTheYear:", v4);

  -[EKRecurrenceRule _updateSpecifierIfNeeded](self, "_updateSpecifierIfNeeded");
}

- (void)setWeeksOfTheYear:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[EKRecurrenceRule _recurrenceHelper](self, "_recurrenceHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWeeksOfTheYear:", v4);

  -[EKRecurrenceRule _updateSpecifierIfNeeded](self, "_updateSpecifierIfNeeded");
}

- (void)setMonthsOfTheYear:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[EKRecurrenceRule _recurrenceHelper](self, "_recurrenceHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMonthsOfTheYear:", v4);

  -[EKRecurrenceRule _updateSpecifierIfNeeded](self, "_updateSpecifierIfNeeded");
}

- (void)setSetPositions:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[EKRecurrenceRule _recurrenceHelper](self, "_recurrenceHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetPositions:", v4);

  -[EKRecurrenceRule _updateSpecifierIfNeeded](self, "_updateSpecifierIfNeeded");
}

- (void)_updateSpecifierIfNeeded
{
  id v3;

  if (-[EKRecurrenceHelper isDirty](self->_recurrenceHelper, "isDirty"))
  {
    -[EKRecurrenceHelper specifier](self->_recurrenceHelper, "specifier");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[EKRecurrenceRule setSpecifier:](self, "setSpecifier:", v3);

  }
}

- (void)_resetInternalStateWithForce:(BOOL)a3
{
  EKRecurrenceHelper *recurrenceHelper;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKRecurrenceRule;
  -[EKObject _resetInternalStateWithForce:](&v5, sel__resetInternalStateWithForce_, a3);
  -[EKObject clearCachedValueForKey:](self, "clearCachedValueForKey:", CFSTR("recurrenceEnd"));
  recurrenceHelper = self->_recurrenceHelper;
  self->_recurrenceHelper = 0;

}

- (void)rollback
{
  EKRecurrenceHelper *recurrenceHelper;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKRecurrenceRule;
  -[EKObject rollback](&v4, sel_rollback);
  recurrenceHelper = self->_recurrenceHelper;
  self->_recurrenceHelper = 0;

}

- (BOOL)dirtyStateMayAffectExceptionDates
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[EKObject changeSet](self, "changeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changedKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = *MEMORY[0x1E0D0B8C8];
    v9 = *MEMORY[0x1E0D0B8D0];
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isEqualToString:", v8, (_QWORD)v14) & 1) == 0
          && !objc_msgSend(v11, "isEqualToString:", v9))
        {
          v12 = 1;
          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (BOOL)mayOccurAfterDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  -[EKRecurrenceRule recurrenceEnd](self, "recurrenceEnd");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v6, "compare:", v4) == -1)
  {
    v11 = 0;
  }
  else
  {
    -[EKRecurrenceRule recurrenceEnd](self, "recurrenceEnd");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "occurrenceCount");

    if (v8)
    {
      -[EKRecurrenceRule cachedEndDate](self, "cachedEndDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
        v11 = objc_msgSend(v9, "compare:", v4) != -1;
      else
        v11 = 1;

    }
    else
    {
      v11 = 1;
    }
  }

  return v11;
}

- (BOOL)isPinnedToEndOfFrequency
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[EKRecurrenceRule frequency](self, "frequency") != EKRecurrenceFrequencyMonthly)
    goto LABEL_18;
  -[EKRecurrenceRule setPositions](self, "setPositions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") != 1)
  {
LABEL_17:

    goto LABEL_18;
  }
  -[EKRecurrenceRule setPositions](self, "setPositions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "integerValue") != -1)
  {
LABEL_16:

    goto LABEL_17;
  }
  -[EKRecurrenceRule daysOfTheMonth](self, "daysOfTheMonth");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {

    goto LABEL_16;
  }
  -[EKRecurrenceRule daysOfTheMonth](self, "daysOfTheMonth");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= 4)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = objc_msgSend(&unk_1E47B5AD0, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
LABEL_8:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(&unk_1E47B5AD0);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v12);
        -[EKRecurrenceRule daysOfTheMonth](self, "daysOfTheMonth");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v13) = objc_msgSend(v13, "isEqualToArray:", v14);

        if ((v13 & 1) != 0)
          return 1;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(&unk_1E47B5AD0, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v10)
            goto LABEL_8;
          break;
        }
      }
    }
  }
LABEL_18:
  if (-[EKRecurrenceRule frequency](self, "frequency") != EKRecurrenceFrequencyYearly)
    return 0;
  -[EKRecurrenceRule setPositions](self, "setPositions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count") != 1)
  {
LABEL_22:

    return 0;
  }
  -[EKRecurrenceRule setPositions](self, "setPositions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "integerValue") != -1)
  {

    goto LABEL_22;
  }
  -[EKRecurrenceRule daysOfTheMonth](self, "daysOfTheMonth");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(&unk_1E47B5B00, "isEqualToArray:", v19);

  return (v20 & 1) != 0;
}

- (BOOL)isWeekdayRule
{
  void *v2;
  void *v3;

  -[EKRecurrenceRule daysOfTheWeek](self, "daysOfTheWeek");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("dayOfTheWeek"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isEqualToArray:", &unk_1E47B5B18);
  return (char)v2;
}

- (BOOL)isWeekendRule
{
  void *v2;
  void *v3;

  -[EKRecurrenceRule daysOfTheWeek](self, "daysOfTheWeek");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("dayOfTheWeek"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isEqualToArray:", &unk_1E47B5B30);
  return (char)v2;
}

- (BOOL)isAnyDayRule
{
  void *v2;
  void *v3;

  -[EKRecurrenceRule daysOfTheWeek](self, "daysOfTheWeek");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("dayOfTheWeek"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isEqualToArray:", &unk_1E47B5B48);
  return (char)v2;
}

- (BOOL)isSimpleRule
{
  void *v2;
  void *v3;
  void *v4;
  EKRecurrenceFrequency v6;
  BOOL v7;
  EKRecurrenceFrequency v8;
  int v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  if (-[EKRecurrenceRule frequency](self, "frequency") == EKRecurrenceFrequencyDaily)
    return 1;
  v6 = -[EKRecurrenceRule frequency](self, "frequency");
  if (v6 == EKRecurrenceFrequencyWeekly)
  {
    -[EKRecurrenceRule daysOfTheWeek](self, "daysOfTheWeek");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v2, "count") < 2)
    {
      v7 = 1;
LABEL_14:

      return v7;
    }
  }
  v8 = -[EKRecurrenceRule frequency](self, "frequency");
  if (v8 != EKRecurrenceFrequencyMonthly
    || (-[EKRecurrenceRule daysOfTheWeek](self, "daysOfTheWeek"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "count")))
  {
    v9 = 0;
    v7 = 0;
    if (-[EKRecurrenceRule frequency](self, "frequency") != EKRecurrenceFrequencyYearly)
      goto LABEL_11;
LABEL_8:
    -[EKRecurrenceRule daysOfTheWeek](self, "daysOfTheWeek");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {

      v7 = 0;
      if (!v9)
        goto LABEL_11;
      goto LABEL_10;
    }
    -[EKRecurrenceRule monthsOfTheYear](self, "monthsOfTheYear");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "count"))
    {
      -[EKRecurrenceRule weeksOfTheYear](self, "weeksOfTheYear");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v13, "count"))
      {
        -[EKRecurrenceRule daysOfTheYear](self, "daysOfTheYear");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v13;
        v7 = (unint64_t)objc_msgSend(v14, "count") < 2;

        if ((v9 & 1) == 0)
        {
LABEL_11:
          if (v8 != EKRecurrenceFrequencyMonthly)
            goto LABEL_13;
          goto LABEL_12;
        }
LABEL_10:

        goto LABEL_11;
      }

    }
    v7 = 0;
    if ((v9 & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  -[EKRecurrenceRule daysOfTheMonth](self, "daysOfTheMonth");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") > 1)
  {
    if (-[EKRecurrenceRule frequency](self, "frequency") != EKRecurrenceFrequencyYearly)
    {

      v7 = 0;
LABEL_12:

      goto LABEL_13;
    }
    v9 = 1;
    goto LABEL_8;
  }

  v7 = 1;
LABEL_13:
  if (v6 == EKRecurrenceFrequencyWeekly)
    goto LABEL_14;
  return v7;
}

+ (id)iCalendarValueFromRecurrenceType:(int64_t)a3
{
  id v4;

  if ((unint64_t)a3 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Encountered illegal value for  EKRecurrenceFrequency"), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  return off_1E4784BB8[a3];
}

+ (id)iCalendarValueFromDayOfTheWeek:(unint64_t)a3
{
  if (a3 - 1 > 6)
    return &stru_1E4789A58;
  else
    return off_1E4784BD8[a3 - 1];
}

+ (id)iCalendarValueFromDate:(id)a3 isDateOnly:(BOOL)a4 isFloating:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;

  v5 = a5;
  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0CB3578];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  objc_msgSend(v9, "setFormatterBehavior:", 1040);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimeZone:", v10);

  v11 = CFSTR("yyyyMMdd'T'HHmmss'Z'");
  if (v5)
    v11 = CFSTR("yyyyMMdd'T'HHmmss");
  if (v6)
    v12 = CFSTR("yyyyMMdd");
  else
    v12 = v11;
  objc_msgSend(v9, "setDateFormat:", v12);
  objc_msgSend(v9, "stringFromDate:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)adjustDateIntoUTC:(id)a3 dateOnly:(BOOL)a4 floating:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = a5;
  v7 = a3;
  if (a4 || v5)
  {
    v8 = (void *)MEMORY[0x1E0D0C2F0];
    objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateInFloatingTimeZoneFromDate:inTimeZone:", v7, v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v10;
  }
  return v7;
}

- (id)stringValueAsDateOnly:(BOOL)a3 isFloating:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  unsigned int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  unsigned int v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  void *v44;
  void *v45;
  unsigned int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  unint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  unsigned int v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  unint64_t v61;
  void *v62;
  void *v63;
  unsigned int v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRecurrenceRule iCalendarValueFromRecurrenceType:](EKRecurrenceRule, "iCalendarValueFromRecurrenceType:", -[EKRecurrenceRule frequency](self, "frequency"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("FREQ=%@"), v8);

  objc_msgSend(v7, "appendFormat:", CFSTR(";INTERVAL=%lu"), -[EKRecurrenceRule interval](self, "interval"));
  -[EKRecurrenceRule recurrenceEnd](self, "recurrenceEnd");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[EKRecurrenceRule recurrenceEnd](self, "recurrenceEnd");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "usesEndDate");

    -[EKRecurrenceRule recurrenceEnd](self, "recurrenceEnd");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
    {
      objc_msgSend(v12, "endDate");
      v14 = objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "adjustDateIntoUTC:dateOnly:floating:", v14, v5, v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[EKRecurrenceRule iCalendarValueFromDate:isDateOnly:isFloating:](EKRecurrenceRule, "iCalendarValueFromDate:isDateOnly:isFloating:", v15, v5, v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendFormat:", CFSTR(";UNTIL=%@"), v16);

      v13 = (void *)v14;
    }
    else
    {
      objc_msgSend(v7, "appendFormat:", CFSTR(";COUNT=%lu"), objc_msgSend(v12, "occurrenceCount"));
    }

  }
  -[EKRecurrenceRule monthsOfTheYear](self, "monthsOfTheYear");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    -[EKRecurrenceRule monthsOfTheYear](self, "monthsOfTheYear");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndex:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR(";BYMONTH=%@"), v20);

    if (v18 != 1)
    {
      v21 = 2;
      v22 = 1;
      do
      {
        -[EKRecurrenceRule monthsOfTheYear](self, "monthsOfTheYear");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectAtIndex:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendFormat:", CFSTR(",%@"), v24);

        v22 = v21;
        v25 = v18 > v21++;
      }
      while (v25);
    }
  }
  -[EKRecurrenceRule daysOfTheMonth](self, "daysOfTheMonth");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");

  if (v27)
  {
    -[EKRecurrenceRule daysOfTheMonth](self, "daysOfTheMonth");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectAtIndex:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR(";BYMONTHDAY=%@"), v29);

    if (v27 != 1)
    {
      v30 = 2;
      v31 = 1;
      do
      {
        -[EKRecurrenceRule daysOfTheMonth](self, "daysOfTheMonth");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectAtIndex:", v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendFormat:", CFSTR(",%@"), v33);

        v31 = v30;
        v25 = v27 > v30++;
      }
      while (v25);
    }
  }
  -[EKRecurrenceRule daysOfTheYear](self, "daysOfTheYear");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "count");

  if (v35)
  {
    -[EKRecurrenceRule daysOfTheYear](self, "daysOfTheYear");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectAtIndex:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR(";BYYEARDAY=%@"), v37);

    if (v35 != 1)
    {
      v38 = 2;
      v39 = 1;
      do
      {
        -[EKRecurrenceRule daysOfTheYear](self, "daysOfTheYear");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectAtIndex:", v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendFormat:", CFSTR(",%@"), v41);

        v39 = v38;
        v25 = v35 > v38++;
      }
      while (v25);
    }
  }
  -[EKRecurrenceRule weeksOfTheYear](self, "weeksOfTheYear");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "count");

  if (v43)
  {
    -[EKRecurrenceRule weeksOfTheYear](self, "weeksOfTheYear");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectAtIndex:", 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR(";BYWEEKNO=%@"), v45);

    if (v43 != 1)
    {
      v46 = 2;
      v47 = 1;
      do
      {
        -[EKRecurrenceRule weeksOfTheYear](self, "weeksOfTheYear");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "objectAtIndex:", v47);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendFormat:", CFSTR(",%@"), v49);

        v47 = v46;
        v25 = v43 > v46++;
      }
      while (v25);
    }
  }
  -[EKRecurrenceRule daysOfTheWeek](self, "daysOfTheWeek");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "count");

  if (v51)
  {
    -[EKRecurrenceRule daysOfTheWeek](self, "daysOfTheWeek");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "objectAtIndex:", 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v53, "iCalendarDescription");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR(";BYDAY=%@"), v54);

    if (v51 != 1)
    {
      v55 = 2;
      v56 = 1;
      do
      {
        -[EKRecurrenceRule daysOfTheWeek](self, "daysOfTheWeek");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "objectAtIndex:", v56);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v58, "iCalendarDescription");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendFormat:", CFSTR(",%@"), v59);

        v56 = v55;
        v25 = v51 > v55++;
      }
      while (v25);
    }

  }
  -[EKRecurrenceRule setPositions](self, "setPositions");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "count");

  if (v61)
  {
    -[EKRecurrenceRule setPositions](self, "setPositions");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "objectAtIndex:", 0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR(";BYSETPOS=%@"), v63);

    if (v61 != 1)
    {
      v64 = 2;
      v65 = 1;
      do
      {
        -[EKRecurrenceRule setPositions](self, "setPositions");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "objectAtIndex:", v65);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendFormat:", CFSTR(",%@"), v67);

        v65 = v64;
        v25 = v61 > v64++;
      }
      while (v25);
    }
  }
  if (-[EKRecurrenceRule frequency](self, "frequency") == EKRecurrenceFrequencyWeekly
    && -[EKRecurrenceRule interval](self, "interval") >= 2)
  {
    -[EKRecurrenceRule daysOfTheWeek](self, "daysOfTheWeek");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "count");

    if (v69)
    {
      objc_msgSend(&unk_1E47B5B60, "objectAtIndexedSubscript:", -[EKRecurrenceRule firstDayOfTheWeek](self, "firstDayOfTheWeek") - 1);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendFormat:", CFSTR(";WKST=%@"), v70);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v7);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  return v71;
}

- (id)humanReadableDescriptionWithStartDate:(id)a3
{
  return -[EKRecurrenceRule humanReadableDescriptionWithStartDate:isConcise:](self, "humanReadableDescriptionWithStartDate:isConcise:", a3, 1);
}

+ (int64_t)daysTypeForDayArray:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int64_t v10;
  id v11;
  void *v12;
  void *v13;
  int64_t v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v10 = +[EKRecurrenceDayOfWeek icsWeekDayFromDayOfTheWeek:](EKRecurrenceDayOfWeek, "icsWeekDayFromDayOfTheWeek:", objc_msgSend(v9, "dayOfTheWeek"));
        v11 = objc_alloc(MEMORY[0x1E0DDB7D0]);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "weekNumber"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithWeekday:number:", v10, v12);
        objc_msgSend(v4, "addObject:", v13);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  v14 = objc_msgSend(MEMORY[0x1E0D0C388], "daysTypeForDayArray:", v4);
  return v14;
}

- (id)humanReadableDescriptionWithStartDate:(id)a3 isConcise:(BOOL)a4
{
  _BOOL8 v4;
  EKRecurrenceRule *v6;
  id v7;
  EKRecurrenceRule *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a4;
  v6 = self;
  v7 = a3;
  if (-[EKRecurrenceRule isPinnedToEndOfFrequency](v6, "isPinnedToEndOfFrequency"))
  {
    v8 = [EKRecurrenceRule alloc];
    v9 = -[EKRecurrenceRule frequency](v6, "frequency");
    v10 = -[EKRecurrenceRule interval](v6, "interval");
    -[EKRecurrenceRule recurrenceEnd](v6, "recurrenceEnd");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[EKRecurrenceRule initRecurrenceWithFrequency:interval:end:](v8, "initRecurrenceWithFrequency:interval:end:", v9, v10, v11);

    v6 = (EKRecurrenceRule *)v12;
  }
  v13 = (void *)MEMORY[0x1E0D0C388];
  -[EKRecurrenceRule stringValueAsDateOnly:isFloating:](v6, "stringValueAsDateOnly:isFloating:", 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "humanReadableDescriptionWithStartDate:ofRecurrenceRuleICSString:isConcise:", v7, v14, v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)hasDuplicateMonthsOfYear
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(&unk_1E47B5B78, "mutableCopy");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[EKRecurrenceRule monthsOfTheYear](self, "monthsOfTheYear", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = MEMORY[0x1E0C9AAB0];
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v3, "objectAtIndexedSubscript:", (int)(objc_msgSend(v10, "intValue") - 1));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "BOOLValue");

        if ((v12 & 1) != 0)
        {
          v13 = 1;
          goto LABEL_11;
        }
        objc_msgSend(v3, "setObject:atIndexedSubscript:", v8, (int)(objc_msgSend(v10, "intValue") - 1));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)newStartDateIsValid:(id)a3 currentStartDate:(id)a4 calendar:(id)a5
{
  id v8;
  void *v9;

  v8 = a3;
  -[EKRecurrenceRule _acceptableStartDateRangeWithCurrentStartDate:calendar:](self, "_acceptableStartDateRangeWithCurrentStartDate:calendar:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v9, "containsDate:", v8);

  return (char)a4;
}

- (BOOL)newStartDateIsInvalid:(id)a3 currentStartDate:(id)a4 calendar:(id)a5
{
  return !-[EKRecurrenceRule newStartDateIsValid:currentStartDate:calendar:](self, "newStartDateIsValid:currentStartDate:calendar:", a3, a4, a5);
}

+ (id)_acceptableStartDateRangeForDailyRecurrenceWithCurrentStartDate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D0C2B8];
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rangeWithStartDate:endDate:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_acceptableStartDateRangeForWeeklyRecurrenceWithCurrentStartDate:(id)a3 calendar:(id)a4
{
  int v4;
  id v5;
  void *v6;
  id v8;
  double v9;

  v8 = 0;
  v9 = 0.0;
  v4 = objc_msgSend(a4, "rangeOfUnit:startDate:interval:forDate:", 0x2000, &v8, &v9, a3);
  v5 = v8;
  v6 = 0;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D0C2B8], "rangeWithStartDate:duration:", v5, v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)_acceptableStartDateRangeForMonthlyRecurrenceWithCurrentStartDate:(id)a3 calendar:(id)a4
{
  int v4;
  id v5;
  void *v6;
  id v8;
  double v9;

  v8 = 0;
  v9 = 0.0;
  v4 = objc_msgSend(a4, "rangeOfUnit:startDate:interval:forDate:", 8, &v8, &v9, a3);
  v5 = v8;
  v6 = 0;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D0C2B8], "rangeWithStartDate:duration:", v5, v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)_acceptableStartDateRangeForYearlyRecurrenceWithCurrentStartDate:(id)a3 calendar:(id)a4
{
  int v4;
  id v5;
  void *v6;
  id v8;
  double v9;

  v8 = 0;
  v9 = 0.0;
  v4 = objc_msgSend(a4, "rangeOfUnit:startDate:interval:forDate:", 4, &v8, &v9, a3);
  v5 = v8;
  v6 = 0;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D0C2B8], "rangeWithStartDate:duration:", v5, v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)_acceptableStartDateRangeWithCurrentStartDate:(id)a3 calendar:(id)a4
{
  id v6;
  id v7;
  EKRecurrenceRule *v8;

  v6 = a3;
  v7 = a4;
  switch(-[EKRecurrenceRule frequency](self, "frequency"))
  {
    case EKRecurrenceFrequencyDaily:
      objc_msgSend((id)objc_opt_class(), "_acceptableStartDateRangeForDailyRecurrenceWithCurrentStartDate:", v6);
      v8 = (EKRecurrenceRule *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case EKRecurrenceFrequencyWeekly:
      objc_msgSend((id)objc_opt_class(), "_acceptableStartDateRangeForWeeklyRecurrenceWithCurrentStartDate:calendar:", v6, v7);
      v8 = (EKRecurrenceRule *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case EKRecurrenceFrequencyMonthly:
      objc_msgSend((id)objc_opt_class(), "_acceptableStartDateRangeForMonthlyRecurrenceWithCurrentStartDate:calendar:", v6, v7);
      v8 = (EKRecurrenceRule *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case EKRecurrenceFrequencyYearly:
      objc_msgSend((id)objc_opt_class(), "_acceptableStartDateRangeForYearlyRecurrenceWithCurrentStartDate:calendar:", v6, v7);
      v8 = (EKRecurrenceRule *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      self = v8;
      break;
    default:
      break;
  }

  return self;
}

- (BOOL)isEqualToRecurrenceRule:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  EKRecurrenceFrequency v9;
  NSInteger v10;
  NSInteger v11;
  void *v12;
  int v13;
  char v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  int v58;
  int v59;
  void *v60;

  v8 = a3;
  v9 = -[EKRecurrenceRule frequency](self, "frequency");
  if (v9 != objc_msgSend(v8, "frequency")
    || (v10 = -[EKRecurrenceRule interval](self, "interval"), v10 != objc_msgSend(v8, "interval"))
    || (v11 = -[EKRecurrenceRule firstDayOfTheWeek](self, "firstDayOfTheWeek"),
        v11 != objc_msgSend(v8, "firstDayOfTheWeek")))
  {
    v14 = 0;
    goto LABEL_9;
  }
  -[EKRecurrenceRule recurrenceEnd](self, "recurrenceEnd");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 || (objc_msgSend(v8, "recurrenceEnd"), (v60 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[EKRecurrenceRule recurrenceEnd](self, "recurrenceEnd");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recurrenceEnd");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqual:", v4))
    {
      v14 = 0;
LABEL_76:

      goto LABEL_77;
    }
    v13 = 1;
  }
  else
  {
    v60 = 0;
    v13 = 0;
  }
  -[EKRecurrenceRule monthsOfTheYear](self, "monthsOfTheYear");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 || (objc_msgSend(v8, "monthsOfTheYear"), (v54 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[EKRecurrenceRule monthsOfTheYear](self, "monthsOfTheYear");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "monthsOfTheYear");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "isEqual:", v6))
    {
      v14 = 0;
      goto LABEL_73;
    }
    v58 = 1;
    v59 = v13;
  }
  else
  {
    v58 = 0;
    v59 = v13;
    v54 = 0;
  }
  -[EKRecurrenceRule daysOfTheMonth](self, "daysOfTheMonth");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 || (objc_msgSend(v8, "daysOfTheMonth"), (v50 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[EKRecurrenceRule daysOfTheMonth](self, "daysOfTheMonth");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "daysOfTheMonth");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v18;
    if (!objc_msgSend(v18, "isEqual:"))
    {
      v14 = 0;
LABEL_68:

      goto LABEL_69;
    }
    v53 = 1;
  }
  else
  {
    v50 = 0;
    v53 = 0;
  }
  -[EKRecurrenceRule daysOfTheYear](self, "daysOfTheYear");
  v57 = objc_claimAutoreleasedReturnValue();
  if (v57 || (objc_msgSend(v8, "daysOfTheYear"), (v45 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[EKRecurrenceRule daysOfTheYear](self, "daysOfTheYear");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "daysOfTheYear");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v19;
    if (!objc_msgSend(v19, "isEqual:", v51))
    {
      v14 = 0;
LABEL_64:

      goto LABEL_65;
    }
    v48 = 1;
  }
  else
  {
    v45 = 0;
    v48 = 0;
  }
  -[EKRecurrenceRule weeksOfTheYear](self, "weeksOfTheYear");
  v49 = objc_claimAutoreleasedReturnValue();
  if (v49 || (objc_msgSend(v8, "weeksOfTheYear"), (v40 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[EKRecurrenceRule weeksOfTheYear](self, "weeksOfTheYear");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "weeksOfTheYear");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v20;
    if (!objc_msgSend(v20, "isEqual:", v46))
    {
      v14 = 0;
LABEL_60:

      goto LABEL_61;
    }
    v43 = 1;
  }
  else
  {
    v40 = 0;
    v43 = 0;
  }
  -[EKRecurrenceRule daysOfTheWeek](self, "daysOfTheWeek");
  v44 = objc_claimAutoreleasedReturnValue();
  if (v44 || (objc_msgSend(v8, "daysOfTheWeek"), (v35 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[EKRecurrenceRule daysOfTheWeek](self, "daysOfTheWeek");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "daysOfTheWeek");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v21;
    if (!objc_msgSend(v21, "isEqual:", v41))
    {
      v14 = 0;
LABEL_56:

      goto LABEL_57;
    }
    v38 = 1;
  }
  else
  {
    v35 = 0;
    v38 = 0;
  }
  -[EKRecurrenceRule setPositions](self, "setPositions");
  v39 = objc_claimAutoreleasedReturnValue();
  if (v39 || (objc_msgSend(v8, "setPositions"), (v31 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[EKRecurrenceRule setPositions](self, "setPositions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPositions");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v22;
    if (!objc_msgSend(v22, "isEqual:", v36))
    {
      v14 = 0;
      goto LABEL_52;
    }
    v34 = 1;
  }
  else
  {
    v31 = 0;
    v34 = 0;
  }
  -[EKRecurrenceRule calendarIdentifier](self, "calendarIdentifier");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23 || (objc_msgSend(v8, "calendarIdentifier"), (v30 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[EKRecurrenceRule calendarIdentifier](self, "calendarIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "calendarIdentifier");
    v33 = (void *)v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v32, "isEqual:");

    if (v33)
    {

      if (!v34)
        goto LABEL_53;
      goto LABEL_52;
    }
    v29 = (void *)v30;
  }
  else
  {
    v29 = 0;
    v14 = 1;
  }

  if ((v34 & 1) != 0)
  {
LABEL_52:

  }
LABEL_53:
  v25 = (void *)v39;
  if (!v39)
  {

    v25 = 0;
  }

  if (v38)
    goto LABEL_56;
LABEL_57:
  v26 = (void *)v44;
  if (!v44)
  {

    v26 = 0;
  }

  if (v43)
    goto LABEL_60;
LABEL_61:
  v27 = (void *)v49;
  if (!v49)
  {

    v27 = 0;
  }

  if (v48)
    goto LABEL_64;
LABEL_65:
  v28 = (void *)v57;
  if (!v57)
  {

    v28 = 0;
  }

  if (v53)
    goto LABEL_68;
LABEL_69:
  if (!v17)

  if (v58)
  {
    v13 = v59;
LABEL_73:

    if (v16)
      goto LABEL_75;
    goto LABEL_74;
  }
  v13 = v59;
  if (!v16)
LABEL_74:

LABEL_75:
  if (v13)
    goto LABEL_76;
LABEL_77:
  if (!v12)

LABEL_9:
  return v14;
}

- (BOOL)shouldPinMonthDays
{
  return self->_shouldPinMonthDays;
}

- (BOOL)usesEndDate
{
  return self->_usesEndDate;
}

- (void)frequency
{
  OUTLINED_FUNCTION_0(&dword_1A2318000, a2, a3, "Unexpected frequency value loaded from database: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

+ (void)_ekWeekdayFromCalDayOfWeek:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A2318000, a2, a3, "Unexpected CalDayOfWeek: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

+ (void)_calDayOfWeekFromEKWeekday:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A2318000, a2, a3, "Unexpected EKWeekday: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
