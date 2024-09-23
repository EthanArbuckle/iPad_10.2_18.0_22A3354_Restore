@implementation CADEventsForConferenceURLPredicate

- (CADEventsForConferenceURLPredicate)initWithURL:(id)a3 limit:(int64_t)a4
{
  id v6;
  CADEventsForConferenceURLPredicate *v7;
  void *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CADEventsForConferenceURLPredicate;
  v7 = -[EKPredicate initWithCalendars:](&v10, sel_initWithCalendars_, 0);
  if (v7)
  {
    objc_msgSend(v6, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADEventsForConferenceURLPredicate setUrlString:](v7, "setUrlString:", v8);

    -[CADEventsForConferenceURLPredicate setLimit:](v7, "setLimit:", a4);
  }

  return v7;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc(MEMORY[0x1E0D0C2D0]);
  v9.receiver = self;
  v9.super_class = (Class)CADEventsForConferenceURLPredicate;
  -[CADEventsForConferenceURLPredicate description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSuperclassDescription:", v4);

  -[CADEventsForConferenceURLPredicate urlString](self, "urlString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withObject:", CFSTR("URL"), v6);

  objc_msgSend(v5, "setKey:withInteger:", CFSTR("limit"), -[CADEventsForConferenceURLPredicate limit](self, "limit"));
  objc_msgSend(v5, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CADEventsForConferenceURLPredicate)initWithCoder:(id)a3
{
  id v4;
  CADEventsForConferenceURLPredicate *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADEventsForConferenceURLPredicate;
  v5 = -[EKPredicate initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("urlString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADEventsForConferenceURLPredicate setUrlString:](v5, "setUrlString:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("limit"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADEventsForConferenceURLPredicate setLimit:](v5, "setLimit:", objc_msgSend(v7, "integerValue"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CADEventsForConferenceURLPredicate;
  v4 = a3;
  -[EKPredicate encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[CADEventsForConferenceURLPredicate urlString](self, "urlString", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("urlString"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CADEventsForConferenceURLPredicate limit](self, "limit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("limit"));

}

- (id)predicateFormat
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ <%p>"), objc_opt_class(), self);
}

- (id)defaultPropertiesToLoad
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DE8];
  CADEKPersistentEventMinimumDefaultPropertiesToLoad();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObject:", *MEMORY[0x1E0D0B328]);
  return v4;
}

- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3
{
  uint64_t AuxilliaryDatabaseID;
  void *v5;
  void *v6;
  const void *FilterFromRowIDs;
  id v8;
  void *v9;
  uint64_t v10;
  const void *v11;
  uint64_t v12;
  const void *v13;
  const void *v14;

  AuxilliaryDatabaseID = CalDatabaseGetAuxilliaryDatabaseID();
  -[EKPredicate calendarRowIDsForDatabaseID:](self, "calendarRowIDsForDatabaseID:", AuxilliaryDatabaseID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPredicate restrictedCalendarRowIDsForDatabaseID:](self, "restrictedCalendarRowIDsForDatabaseID:", AuxilliaryDatabaseID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FilterFromRowIDs = (const void *)CreateFilterFromRowIDs(v5, v6);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[CADEventsForConferenceURLPredicate urlString](self, "urlString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CADEventsForConferenceURLPredicate limit](self, "limit");
  v10 = CalDatabaseCopyEventOccurrenceCache();
  if (v10)
  {
    v11 = (const void *)v10;
    if (v9)
    {
      v12 = CalDatabaseCopyEventIDsOfEventsMatching();
      if (v12)
      {
        v13 = (const void *)v12;
        CFAbsoluteTimeGetCurrent();
        v14 = (const void *)CalEventOccurrenceCacheCopyEventOccurrencesWithIDsAfterDate();
        CFRelease(v13);
        if (v14)
        {
          objc_msgSend(v8, "addObjectsFromArray:", v14);
          CFRelease(v14);
        }
      }
    }
    CFRelease(v11);
  }
  CFRelease(FilterFromRowIDs);

  return v8;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(int64_t)a3
{
  self->_limit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlString, 0);
}

@end
