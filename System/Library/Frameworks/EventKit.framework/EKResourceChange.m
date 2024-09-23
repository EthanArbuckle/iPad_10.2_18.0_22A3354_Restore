@implementation EKResourceChange

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)knownRelationshipSingleValueKeys
{
  if (knownRelationshipSingleValueKeys_onceToken_6 != -1)
    dispatch_once(&knownRelationshipSingleValueKeys_onceToken_6, &__block_literal_global_78);
  return (id)knownRelationshipSingleValueKeys_keys_6;
}

void __52__EKResourceChange_knownRelationshipSingleValueKeys__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B910];
  v3[0] = *MEMORY[0x1E0D0B908];
  v3[1] = v0;
  v3[2] = *MEMORY[0x1E0D0B958];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)knownRelationshipSingleValueKeys_keys_6;
  knownRelationshipSingleValueKeys_keys_6 = v1;

}

+ (id)knownRelationshipWeakKeys
{
  if (knownRelationshipWeakKeys_onceToken_8 != -1)
    dispatch_once(&knownRelationshipWeakKeys_onceToken_8, &__block_literal_global_3_3);
  return (id)knownRelationshipWeakKeys_keys_8;
}

void __45__EKResourceChange_knownRelationshipWeakKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0D0B958];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)knownRelationshipWeakKeys_keys_8;
  knownRelationshipWeakKeys_keys_8 = v0;

}

- (NSString)changedByDisplayName
{
  void *v3;
  void *v4;
  void *v5;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B928]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[EKResourceChange changedByFirstName](self, "changedByFirstName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKResourceChange changedByLastName](self, "changedByLastName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    DisplayNameStringForIdentityWithProperties();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v3;
}

- (NSURL)changedByAddress
{
  void *v2;
  void *v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B920]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (NSString)changedByFirstName
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B930]);
}

- (NSString)changedByLastName
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B938]);
}

- (id)emailAddress
{
  void *v2;
  void *v3;

  -[EKResourceChange changedByAddress](self, "changedByAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cal_emailAddressString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)phoneNumber
{
  void *v2;
  void *v3;

  -[EKResourceChange changedByAddress](self, "changedByAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cal_phoneNumberString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (EKCalendar)calendar
{
  return (EKCalendar *)-[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", *MEMORY[0x1E0D0B908]);
}

- (EKCalendarItem)calendarItem
{
  return (EKCalendarItem *)-[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", *MEMORY[0x1E0D0B910]);
}

- (id)notification
{
  return -[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", *MEMORY[0x1E0D0B958]);
}

- (unsigned)changeType
{
  void *v2;
  unsigned int v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B918]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (NSDate)timestamp
{
  return (NSDate *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B968]);
}

- (unsigned)changedProperties
{
  void *v2;
  unsigned int v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B940]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (BOOL)_propertyWithFlagDidChange:(unsigned int)a3
{
  return (-[EKResourceChange changedProperties](self, "changedProperties") & a3) != 0;
}

- (BOOL)dateChanged
{
  return -[EKResourceChange _propertyWithFlagDidChange:](self, "_propertyWithFlagDidChange:", 1);
}

- (BOOL)timeChanged
{
  return -[EKResourceChange _propertyWithFlagDidChange:](self, "_propertyWithFlagDidChange:", 2);
}

- (BOOL)titleChanged
{
  return -[EKResourceChange _propertyWithFlagDidChange:](self, "_propertyWithFlagDidChange:", 4);
}

- (BOOL)locationChanged
{
  return -[EKResourceChange _propertyWithFlagDidChange:](self, "_propertyWithFlagDidChange:", 8);
}

- (NSNumber)createCount
{
  return (NSNumber *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B948]);
}

- (NSNumber)updateCount
{
  return (NSNumber *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B970]);
}

- (NSNumber)deleteCount
{
  return (NSNumber *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B948]);
}

- (NSString)deletedTitle
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B950]);
}

- (BOOL)alerted
{
  void *v2;
  char v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B900]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (unsigned)publicStatus
{
  void *v2;
  unsigned int v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B960]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (void)clearAlertedStatus
{
  id v2;

  -[EKObject persistentObject](self, "persistentObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unloadPropertyForKey:", *MEMORY[0x1E0D0B900]);

}

+ (id)calendarItemPropertyName
{
  return (id)*MEMORY[0x1E0D0B910];
}

@end
