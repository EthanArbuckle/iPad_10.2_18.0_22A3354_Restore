@implementation CADNaturalLanguageSuggestedEventsSearchPredicate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CADNaturalLanguageSuggestedEventsSearchPredicate)initWithSearchString:(id)a3 timeZone:(id)a4
{
  return -[CADNaturalLanguageSuggestedEventsSearchPredicate initWithSearchString:allNLEvents:startDate:timeZone:](self, "initWithSearchString:allNLEvents:startDate:timeZone:", a3, 0, 0, a4);
}

- (CADNaturalLanguageSuggestedEventsSearchPredicate)initWithSearchString:(id)a3 startDate:(id)a4 timeZone:(id)a5
{
  return -[CADNaturalLanguageSuggestedEventsSearchPredicate initWithSearchString:allNLEvents:startDate:timeZone:](self, "initWithSearchString:allNLEvents:startDate:timeZone:", a3, 1, a4, a5);
}

- (CADNaturalLanguageSuggestedEventsSearchPredicate)initWithSearchString:(id)a3 allNLEvents:(BOOL)a4 startDate:(id)a5 timeZone:(id)a6
{
  id v11;
  id v12;
  id v13;
  CADNaturalLanguageSuggestedEventsSearchPredicate *v14;
  CADNaturalLanguageSuggestedEventsSearchPredicate *v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CADNaturalLanguageSuggestedEventsSearchPredicate;
  v14 = -[CADNaturalLanguageSuggestedEventsSearchPredicate init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_searchString, a3);
    v15->_allNLEvents = a4;
    objc_storeStrong((id *)&v15->_startDate, a5);
    objc_storeStrong((id *)&v15->super._timeZone, a6);
  }

  return v15;
}

- (CADNaturalLanguageSuggestedEventsSearchPredicate)initWithCoder:(id)a3
{
  id v4;
  CADNaturalLanguageSuggestedEventsSearchPredicate *v5;
  uint64_t v6;
  NSString *searchString;
  uint64_t v8;
  NSDate *startDate;
  uint64_t v10;
  NSTimeZone *timeZone;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CADNaturalLanguageSuggestedEventsSearchPredicate;
  v5 = -[EKPredicate initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchString"));
    v6 = objc_claimAutoreleasedReturnValue();
    searchString = v5->_searchString;
    v5->_searchString = (NSString *)v6;

    v5->_allNLEvents = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allNLEvents"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeZone"));
    v10 = objc_claimAutoreleasedReturnValue();
    timeZone = v5->super._timeZone;
    v5->super._timeZone = (NSTimeZone *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CADNaturalLanguageSuggestedEventsSearchPredicate;
  v4 = a3;
  -[EKPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_searchString, CFSTR("searchString"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_allNLEvents, CFSTR("allNLEvents"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->super._timeZone, CFSTR("timeZone"));

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x1E0D0C2D0]);
  v8.receiver = self;
  v8.super_class = (Class)CADNaturalLanguageSuggestedEventsSearchPredicate;
  -[CADNaturalLanguageSuggestedEventsSearchPredicate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSuperclassDescription:", v4);

  objc_msgSend(v5, "setKey:withObject:", CFSTR("searchString"), self->_searchString);
  objc_msgSend(v5, "setKey:withBoolean:", CFSTR("allNLEvents"), self->_allNLEvents);
  objc_msgSend(v5, "setKey:withObject:", CFSTR("startDate"), self->_startDate);
  objc_msgSend(v5, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)defaultPropertiesToLoad
{
  uint64_t v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D0B410];
  v4[0] = *MEMORY[0x1E0D0B408];
  v4[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)predicateFormat
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3
{
  NSTimeZone *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const void *v14;
  double v15;
  const void *NaturalLanguageSuggestedEventMatchingSummary;
  const void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = self->super._timeZone;
  if (self->_allNLEvents)
  {
    v5 = (void *)CalDatabaseCopyAllNaturalLanguageSuggestedEventsMatchingSummary();
    if (objc_msgSend(v5, "count"))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
      -[NSDate timeIntervalSinceReferenceDate](self->_startDate, "timeIntervalSinceReferenceDate");
      v8 = v7;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v9 = v5;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v20;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v20 != v12)
              objc_enumerationMutation(v9);
            v14 = (const void *)CalEventOccurrenceCreateForInitialOccurrenceWithTimeZone();
            if (!self->_startDate
              || (CalEventOccurrenceGetDate(), v15 + (double)CalEventGetDuration() > v8))
            {
              objc_msgSend(v6, "addObject:", v14, v19);
            }
            CFRelease(v14);
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v11);
      }

    }
    else
    {
      v6 = v5;
    }
  }
  else
  {
    NaturalLanguageSuggestedEventMatchingSummary = (const void *)CalDatabaseCopyFirstNaturalLanguageSuggestedEventMatchingSummary();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    if (NaturalLanguageSuggestedEventMatchingSummary)
    {
      v17 = (const void *)CalEventOccurrenceCreateForInitialOccurrenceWithTimeZone();
      objc_msgSend(v6, "addObject:", v17);
      CFRelease(v17);
      CFRelease(NaturalLanguageSuggestedEventMatchingSummary);
    }
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

@end
