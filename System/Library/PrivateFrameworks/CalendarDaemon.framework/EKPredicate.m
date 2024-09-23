@implementation EKPredicate

- (id)databasesToQuery
{
  -[EKPredicate createCalendarMaps](self, "createCalendarMaps");
  return self->_databaseToCalendarRowIDs;
}

- (void)createCalendarMaps
{
  NSArray *v3;
  NSArray *v4;
  NSDictionary *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSDictionary *databaseToCalendarRowIDs;
  EKPredicate *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = self->_calendars;
  v4 = v3;
  if (!self->_databaseToCalendarRowIDs && -[NSArray count](v3, "count"))
  {
    v16 = self;
    v5 = (NSDictionary *)objc_opt_new();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v4;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "databaseID"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v12);
          v13 = (id)objc_claimAutoreleasedReturnValue();
          if (!v13)
          {
            v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            -[NSDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v13, v12);
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "entityID"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v14);

        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    databaseToCalendarRowIDs = v16->_databaseToCalendarRowIDs;
    v16->_databaseToCalendarRowIDs = v5;

  }
}

- (void)setRestrictedCalendarRowIDs:(id)a3 forDatabaseID:(int)a4
{
  uint64_t v4;
  NSMutableDictionary *databaseToRestrictedCalendarRowIDs;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v4 = *(_QWORD *)&a4;
  v10 = a3;
  databaseToRestrictedCalendarRowIDs = self->_databaseToRestrictedCalendarRowIDs;
  if (!databaseToRestrictedCalendarRowIDs)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = self->_databaseToRestrictedCalendarRowIDs;
    self->_databaseToRestrictedCalendarRowIDs = v7;

    databaseToRestrictedCalendarRowIDs = self->_databaseToRestrictedCalendarRowIDs;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](databaseToRestrictedCalendarRowIDs, "setObject:forKeyedSubscript:", v10, v9);

}

- (id)restrictedCalendarRowIDsForDatabaseID:(int)a3
{
  NSMutableDictionary *databaseToRestrictedCalendarRowIDs;
  void *v4;
  void *v5;

  databaseToRestrictedCalendarRowIDs = self->_databaseToRestrictedCalendarRowIDs;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](databaseToRestrictedCalendarRowIDs, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)calendarRowIDsForDatabaseID:(int)a3
{
  uint64_t v3;
  NSDictionary *databaseToCalendarRowIDs;
  void *v6;
  void *v7;

  v3 = *(_QWORD *)&a3;
  -[EKPredicate createCalendarMaps](self, "createCalendarMaps");
  databaseToCalendarRowIDs = self->_databaseToCalendarRowIDs;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](databaseToCalendarRowIDs, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (EKPredicate)initWithCalendars:(id)a3
{
  id v4;
  EKPredicate *v5;
  uint64_t v6;
  NSArray *calendars;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKPredicate;
  v5 = -[EKPredicate init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "CalFilter:", &__block_literal_global_22);
    v6 = objc_claimAutoreleasedReturnValue();
    calendars = v5->_calendars;
    v5->_calendars = (NSArray *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKPredicate;
  v4 = a3;
  -[EKPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_calendars, CFSTR("calendars"), v5.receiver, v5.super_class);

}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSArray)calendars
{
  return self->_calendars;
}

uint64_t __33__EKPredicate_initWithCalendars___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isVirtual") ^ 1;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (EKPredicate)initWithCoder:(id)a3
{
  id v4;
  EKPredicate *v5;
  uint64_t v6;
  NSArray *calendars;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKPredicate;
  v5 = -[EKPredicate initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    if (initWithCoder__onceToken_0 != -1)
      dispatch_once(&initWithCoder__onceToken_0, &__block_literal_global_4);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder____whitelistedClasses_0, CFSTR("calendars"));
    v6 = objc_claimAutoreleasedReturnValue();
    calendars = v5->_calendars;
    v5->_calendars = (NSArray *)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_calendars, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_databaseToRestrictedCalendarRowIDs, 0);
  objc_storeStrong((id *)&self->_databaseToCalendarRowIDs, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __29__EKPredicate_initWithCoder___block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_msgSend(v0, "initWithObjects:", v1, v2, objc_opt_class(), 0);
  v4 = (void *)initWithCoder____whitelistedClasses_0;
  initWithCoder____whitelistedClasses_0 = v3;

}

- (id)predicateFormat
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v3, "setDateStyle:", 1);
  objc_msgSend(v3, "setTimeStyle:", 1);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", self->_startDate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", self->_endDate);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPredicate calendars](self, "calendars");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CADPredicate conciseCalendarList:](CADPredicate, "conciseCalendarList:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ start:%@; end:%@; cals:%@"), v6, v7, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setCalendars:(id)a3
{
  objc_storeStrong((id *)&self->_calendars, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

@end
