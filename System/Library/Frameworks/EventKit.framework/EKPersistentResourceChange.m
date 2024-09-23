@implementation EKPersistentResourceChange

+ (id)defaultPropertiesToLoad
{
  if (defaultPropertiesToLoad_onceToken_6 != -1)
    dispatch_once(&defaultPropertiesToLoad_onceToken_6, &__block_literal_global_40);
  return (id)defaultPropertiesToLoad_defaultPropertiesToLoad_5;
}

void __53__EKPersistentResourceChange_defaultPropertiesToLoad__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B910];
  v8[0] = *MEMORY[0x1E0D0B908];
  v8[1] = v0;
  v1 = *MEMORY[0x1E0D0B930];
  v8[2] = *MEMORY[0x1E0D0B928];
  v8[3] = v1;
  v2 = *MEMORY[0x1E0D0B918];
  v8[4] = *MEMORY[0x1E0D0B938];
  v8[5] = v2;
  v3 = *MEMORY[0x1E0D0B940];
  v8[6] = *MEMORY[0x1E0D0B968];
  v8[7] = v3;
  v4 = *MEMORY[0x1E0D0B970];
  v9 = *MEMORY[0x1E0D0B948];
  v10 = v4;
  v5 = *MEMORY[0x1E0D0B950];
  v11 = v9;
  v12 = v5;
  v13 = *MEMORY[0x1E0D0B7A8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 13);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_5;
  defaultPropertiesToLoad_defaultPropertiesToLoad_5 = v6;

}

+ (id)relations
{
  if (relations_onceToken_9 != -1)
    dispatch_once(&relations_onceToken_9, &__block_literal_global_12_0);
  return (id)relations_relations_9;
}

void __39__EKPersistentResourceChange_relations__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B7E8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = *MEMORY[0x1E0D0B908];
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:ownsRelated:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:ownsRelated:", CFSTR("Calendar"), 0, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v1;
  v6[1] = *MEMORY[0x1E0D0B910];
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:ownsRelated:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:ownsRelated:", CFSTR("CalendarItem"), 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v2;
  v6[2] = *MEMORY[0x1E0D0B958];
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:ownsRelated:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:ownsRelated:", CFSTR("Notification"), 0, v0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)relations_relations_9;
  relations_relations_9 = v4;

}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (int)entityType
{
  return 18;
}

- (id)calendar
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B908]);
}

- (id)calendarItem
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B910]);
}

- (id)notification
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B958]);
}

- (id)changedByDisplayName
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B928]);
}

- (id)changedByAddress
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B920]);
}

- (id)changedByFirstName
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B930]);
}

- (id)changedByLastName
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B938]);
}

- (unsigned)changeType
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B918]);
}

- (id)timestamp
{
  return -[EKPersistentObject primitiveDateValueForKey:](self, "primitiveDateValueForKey:", *MEMORY[0x1E0D0B968]);
}

- (id)createCount
{
  return -[EKPersistentObject primitiveNumberValueForKey:](self, "primitiveNumberValueForKey:", *MEMORY[0x1E0D0B948]);
}

- (id)updateCount
{
  return -[EKPersistentObject primitiveNumberValueForKey:](self, "primitiveNumberValueForKey:", *MEMORY[0x1E0D0B970]);
}

- (id)deleteCount
{
  return -[EKPersistentObject primitiveNumberValueForKey:](self, "primitiveNumberValueForKey:", *MEMORY[0x1E0D0B948]);
}

- (unsigned)changedProperties
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B940]);
}

- (id)deletedTitle
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B950]);
}

- (BOOL)alerted
{
  return -[EKPersistentObject primitiveBoolValueForKey:](self, "primitiveBoolValueForKey:", *MEMORY[0x1E0D0B900]);
}

- (unsigned)publicStatus
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B960]);
}

@end
