@implementation EKPersistentRecurrenceRule

- (int)entityType
{
  return 5;
}

+ (id)defaultPropertiesToLoad
{
  if (defaultPropertiesToLoad_onceToken_1 != -1)
    dispatch_once(&defaultPropertiesToLoad_onceToken_1, &__block_literal_global_7);
  return (id)defaultPropertiesToLoad_defaultPropertiesToLoad_1;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (int64_t)interval
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B8E8]);
}

- (int64_t)firstDayOfTheWeekRaw
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B8D8]);
}

- (unint64_t)count
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B8C8]);
}

- (id)endDate
{
  return -[EKPersistentObject primitiveDateValueForKey:](self, "primitiveDateValueForKey:", *MEMORY[0x1E0D0B8D0]);
}

- (id)specifier
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B8F8]);
}

- (int)frequencyRaw
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B8E0]);
}

void __53__EKPersistentRecurrenceRule_defaultPropertiesToLoad__block_invoke()
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
  v1 = *MEMORY[0x1E0D0B8C8];
  v5[2] = *MEMORY[0x1E0D0B8D0];
  v5[3] = v1;
  v2 = *MEMORY[0x1E0D0B8F8];
  v5[4] = *MEMORY[0x1E0D0B8D8];
  v5[5] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_1;
  defaultPropertiesToLoad_defaultPropertiesToLoad_1 = v3;

}

+ (id)relations
{
  if (relations_onceToken_3 != -1)
    dispatch_once(&relations_onceToken_3, &__block_literal_global_6_2);
  return (id)relations_relations_3;
}

void __39__EKPersistentRecurrenceRule_relations__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B350]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:ownsRelated:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:ownsRelated:", CFSTR("CalendarItem"), 0, v4, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, *MEMORY[0x1E0D0B8F0], 0);
  v3 = (void *)relations_relations_3;
  relations_relations_3 = v2;

}

+ (Class)alternateUniverseClass
{
  return (Class)objc_opt_class();
}

- (id)UUID
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B820]);
}

- (void)setUUID:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B820]);
}

- (id)owner
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B8F0]);
}

- (void)setOwner:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B8F0]);
}

+ (id)propertyKeyForUniqueIdentifier
{
  return (id)*MEMORY[0x1E0D0B820];
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[EKPersistentRecurrenceRule frequencyRaw](self, "frequencyRaw");
  v6 = -[EKPersistentRecurrenceRule interval](self, "interval");
  v7 = -[EKPersistentRecurrenceRule firstDayOfTheWeekRaw](self, "firstDayOfTheWeekRaw");
  -[EKPersistentRecurrenceRule endDate](self, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[EKPersistentRecurrenceRule count](self, "count");
  -[EKPersistentRecurrenceRule specifier](self, "specifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%p> {frequency = %ld; interval = %ld; firstDayOfWeek = %ld; enddate = %@; count = %lu; specifier = %@}"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  EKPersistentRecurrenceRule *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(EKPersistentRecurrenceRule);
  -[EKPersistentRecurrenceRule UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[EKPersistentRecurrenceRule setUUID:](v4, "setUUID:", v6);

  -[EKPersistentRecurrenceRule setFrequencyRaw:](v4, "setFrequencyRaw:", -[EKPersistentRecurrenceRule frequencyRaw](self, "frequencyRaw"));
  -[EKPersistentRecurrenceRule setInterval:](v4, "setInterval:", -[EKPersistentRecurrenceRule interval](self, "interval"));
  -[EKPersistentRecurrenceRule setFirstDayOfTheWeekRaw:](v4, "setFirstDayOfTheWeekRaw:", -[EKPersistentRecurrenceRule firstDayOfTheWeekRaw](self, "firstDayOfTheWeekRaw"));
  -[EKPersistentRecurrenceRule specifier](self, "specifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentRecurrenceRule setSpecifier:](v4, "setSpecifier:", v7);

  -[EKPersistentRecurrenceRule endDate](self, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentRecurrenceRule setEndDate:](v4, "setEndDate:", v8);

  -[EKPersistentRecurrenceRule setCount:](v4, "setCount:", -[EKPersistentRecurrenceRule count](self, "count"));
  return v4;
}

- (void)setFrequencyRaw:(int)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", *(_QWORD *)&a3, *MEMORY[0x1E0D0B8E0]);
}

- (void)setInterval:(int64_t)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", a3, *MEMORY[0x1E0D0B8E8]);
}

- (void)setEndDate:(id)a3
{
  -[EKPersistentObject primitiveSetDateValue:forKey:](self, "primitiveSetDateValue:forKey:", a3, *MEMORY[0x1E0D0B8D0]);
}

- (void)setCount:(unint64_t)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", a3, *MEMORY[0x1E0D0B8C8]);
}

- (id)cachedEndDate
{
  return -[EKPersistentObject primitiveDateValueForKey:](self, "primitiveDateValueForKey:", *MEMORY[0x1E0D0B8B8]);
}

- (void)setCachedEndDate:(id)a3
{
  -[EKPersistentObject primitiveSetDateValue:forKey:](self, "primitiveSetDateValue:forKey:", a3, *MEMORY[0x1E0D0B8B8]);
}

- (id)cachedEndDateTimeZone
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B8C0]);
}

- (void)setCachedEndDateTimeZone:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B8C0]);
}

- (void)setFirstDayOfTheWeekRaw:(int64_t)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", a3, *MEMORY[0x1E0D0B8D8]);
}

- (void)setSpecifier:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B8F8]);
}

@end
