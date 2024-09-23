@implementation CADUpcomingEventsPredicate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CADUpcomingEventsPredicate)initWithLimit:(int)a3
{
  CADUpcomingEventsPredicate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CADUpcomingEventsPredicate;
  result = -[CADUpcomingEventsPredicate init](&v5, sel_init);
  if (result)
    result->_limit = a3;
  return result;
}

+ (id)predicateWithLimit:(int)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithLimit:", *(_QWORD *)&a3);
}

- (CADUpcomingEventsPredicate)initWithCoder:(id)a3
{
  id v4;
  CADUpcomingEventsPredicate *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CADUpcomingEventsPredicate;
  v5 = -[CADUpcomingEventsPredicate initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_limit = objc_msgSend(v4, "decodeIntForKey:", CFSTR("limit"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CADUpcomingEventsPredicate;
  v4 = a3;
  -[CADUpcomingEventsPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt:forKey:", self->_limit, CFSTR("limit"), v5.receiver, v5.super_class);

}

- (id)predicateFormat
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(limit: %d)"), v5, self->_limit);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3
{
  uint64_t v4;
  const void *v5;
  uint64_t v6;
  const void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = CalFilterCreateWithDatabaseShowingAll();
  if (!v4)
    return 0;
  v5 = (const void *)v4;
  v6 = CalDatabaseCopyEventOccurrenceCache();
  if (v6)
  {
    v7 = (const void *)v6;
    objc_msgSend(MEMORY[0x1E0C99D68], "CalSimulatedDateForNow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    -[CADUpcomingEventsPredicate limit](self, "limit");
    v9 = (void *)CalEventOccurrenceCacheCopyEventOccurrencesAfterDate();
    v10 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      v11 = (void *)MEMORY[0x1E0CB37E8];
      v12 = v10;
      objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CADUpcomingEventsPredicate limit](self, "limit"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412802;
      v17 = v13;
      v18 = 2112;
      v19 = v8;
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_1B6A18000, v12, OS_LOG_TYPE_DEBUG, "Gathered [%@] upcoming event occurrences after date [%@] and up to limit [%@]", (uint8_t *)&v16, 0x20u);

    }
    CFRelease(v7);

  }
  else
  {
    v9 = 0;
  }
  CFRelease(v5);
  return v9;
}

- (int)limit
{
  return self->_limit;
}

@end
