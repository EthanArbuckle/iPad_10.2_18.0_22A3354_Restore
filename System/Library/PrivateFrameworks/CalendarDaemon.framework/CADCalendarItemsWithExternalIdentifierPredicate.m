@implementation CADCalendarItemsWithExternalIdentifierPredicate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CADCalendarItemsWithExternalIdentifierPredicate)initWithExternalIdentifier:(id)a3 entityType:(int)a4
{
  id v6;
  CADCalendarItemsWithExternalIdentifierPredicate *v7;
  uint64_t v8;
  NSString *externalIdentifier;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CADCalendarItemsWithExternalIdentifierPredicate;
  v7 = -[CADCalendarItemsWithExternalIdentifierPredicate init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    externalIdentifier = v7->_externalIdentifier;
    v7->_externalIdentifier = (NSString *)v8;

    v7->_entityType = a4;
    -[CADEventPredicate setExcludeSkippedReminders:](v7, "setExcludeSkippedReminders:", 0);
  }

  return v7;
}

- (CADCalendarItemsWithExternalIdentifierPredicate)initWithExternalIdentifier:(id)a3
{
  return -[CADCalendarItemsWithExternalIdentifierPredicate initWithExternalIdentifier:entityType:](self, "initWithExternalIdentifier:entityType:", a3, 101);
}

- (CADCalendarItemsWithExternalIdentifierPredicate)initWithCoder:(id)a3
{
  id v4;
  CADCalendarItemsWithExternalIdentifierPredicate *v5;
  void *v6;
  uint64_t v7;
  NSString *externalIdentifier;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CADCalendarItemsWithExternalIdentifierPredicate;
  v5 = -[CADEventPredicate initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    externalIdentifier = v5->_externalIdentifier;
    v5->_externalIdentifier = (NSString *)v7;

    v5->_entityType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("entityType"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CADCalendarItemsWithExternalIdentifierPredicate;
  v4 = a3;
  -[CADEventPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_externalIdentifier, CFSTR("externalIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_entityType, CFSTR("entityType"));

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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(externalIdentifier: %@, entityType: %d)"), v5, self->_externalIdentifier, self->_entityType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3
{
  void *v4;
  const __CFArray *v5;
  CFIndex Count;
  uint64_t AuxilliaryDatabaseID;
  void *v8;
  void *v9;
  CFIndex i;
  const void *ValueAtIndex;
  void *v12;
  uint64_t v13;
  const void *v14;
  void *v15;
  const void *v16;
  void *v18;

  -[CADCalendarItemsWithExternalIdentifierPredicate externalIdentifier](self, "externalIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (const __CFArray *)CalDatabaseCopyCalendarItemsWithUniqueIdentifier();

  if (v5)
    Count = CFArrayGetCount(v5);
  else
    Count = 0;
  AuxilliaryDatabaseID = CalDatabaseGetAuxilliaryDatabaseID();
  -[EKPredicate calendarRowIDsForDatabaseID:](self, "calendarRowIDsForDatabaseID:", AuxilliaryDatabaseID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPredicate restrictedCalendarRowIDsForDatabaseID:](self, "restrictedCalendarRowIDsForDatabaseID:", AuxilliaryDatabaseID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", Count);
  if (Count >= 1)
  {
    for (i = 0; Count != i; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v5, i);
      if (!objc_msgSend(v9, "count"))
      {
        -[EKPredicate calendars](self, "calendars");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
          goto LABEL_15;
      }
      v13 = CalCalendarItemCopyCalendar();
      if (v13)
      {
        v14 = (const void *)v13;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", CalCalendarGetUID());
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        CFRelease(v14);
        if ((objc_msgSend(v9, "containsObject:", v15) & 1) == 0
          && (!v8 || (objc_msgSend(v8, "containsObject:", v15) & 1) != 0))
        {

LABEL_15:
          if (CalEntityIsOfType())
          {
            if (CalEntityIsOfType())
            {
              v16 = (const void *)CalEventOccurrenceCreateForInitialOccurrence();
              objc_msgSend(v18, "addObject:", v16);
              CFRelease(v16);
            }
            else if (CalEntityIsOfType())
            {
              objc_msgSend(v18, "addObject:", ValueAtIndex);
            }
          }
          continue;
        }

      }
      else if (!v8)
      {
        goto LABEL_15;
      }
    }
  }
  if (v5)
    CFRelease(v5);

  return v18;
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (int)entityType
{
  return self->_entityType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalIdentifier, 0);
}

@end
