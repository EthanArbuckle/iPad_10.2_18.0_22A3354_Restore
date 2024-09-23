@implementation EKPersistentAlarm

+ (id)relations
{
  if (relations_onceToken_8 != -1)
    dispatch_once(&relations_onceToken_8, &__block_literal_global_39);
  return (id)relations_relations_8;
}

void __30__EKPersistentAlarm_relations__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v15 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B268]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:ownsRelated:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:ownsRelated:", CFSTR("CalendarItem"), 0, v17, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0D0B158];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B418]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:ownsRelated:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:ownsRelated:", CFSTR("Calendar"), 0, v16, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0D0B160];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B750]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:ownsRelated:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:ownsRelated:", CFSTR("Location"), 0, v12, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x1E0D0B1A0];
  v2 = *MEMORY[0x1E0D0B198];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B198]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:ownsRelated:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:ownsRelated:", CFSTR("Alarm"), 0, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D0B180];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B180]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:ownsRelated:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:ownsRelated:", CFSTR("Alarm"), 1, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v15, "initWithObjectsAndKeys:", v14, v13, v11, v10, v0, v1, v4, v5, v7, v2, 0);
  v9 = (void *)relations_relations_8;
  relations_relations_8 = v8;

}

+ (id)defaultPropertiesToLoad
{
  if (defaultPropertiesToLoad_onceToken_5 != -1)
    dispatch_once(&defaultPropertiesToLoad_onceToken_5, &__block_literal_global_16_0);
  return (id)defaultPropertiesToLoad_defaultProperties;
}

void __44__EKPersistentAlarm_defaultPropertiesToLoad__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B1A0];
  v3[0] = *MEMORY[0x1E0D0B188];
  v3[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)defaultPropertiesToLoad_defaultProperties;
  defaultPropertiesToLoad_defaultProperties = v1;

}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

+ (Class)alternateUniverseClass
{
  return (Class)objc_opt_class();
}

- (int)entityType
{
  return 4;
}

- (id)UUID
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B820]);
}

- (void)setUUID:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B820]);
}

- (id)relativeOffset
{
  return -[EKPersistentObject primitiveNumberValueForKey:](self, "primitiveNumberValueForKey:", *MEMORY[0x1E0D0B190]);
}

- (void)setRelativeOffset:(id)a3
{
  -[EKPersistentObject primitiveSetNumberValue:forKey:](self, "primitiveSetNumberValue:forKey:", a3, *MEMORY[0x1E0D0B190]);
}

- (id)absoluteDate
{
  return -[EKPersistentObject primitiveDateValueForKey:](self, "primitiveDateValueForKey:", *MEMORY[0x1E0D0B148]);
}

- (void)setAbsoluteDate:(id)a3
{
  -[EKPersistentObject primitiveSetDateValue:forKey:](self, "primitiveSetDateValue:forKey:", a3, *MEMORY[0x1E0D0B148]);
}

- (int64_t)type
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B1A8]);
}

- (void)setType:(int64_t)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", a3, *MEMORY[0x1E0D0B1A8]);
}

- (id)externalData
{
  return -[EKPersistentObject primitiveDataValueForKey:](self, "primitiveDataValueForKey:", *MEMORY[0x1E0D0B170]);
}

- (void)setExternalData:(id)a3
{
  -[EKPersistentObject primitiveSetDataValue:forKey:](self, "primitiveSetDataValue:forKey:", a3, *MEMORY[0x1E0D0B170]);
}

- (id)calendarItemOwner
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B158]);
}

- (void)setCalendarItemOwner:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B158]);
}

- (id)calendarOwner
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B160]);
}

- (void)setCalendarOwner:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B160]);
}

- (void)setProximity:(int64_t)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", a3, *MEMORY[0x1E0D0B188]);
}

- (int64_t)proximity
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B188]);
}

- (void)setStructuredLocation:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B1A0]);
}

- (id)structuredLocation
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B1A0]);
}

- (void)setAcknowledgedDate:(id)a3
{
  -[EKPersistentObject primitiveSetDateValue:forKey:](self, "primitiveSetDateValue:forKey:", a3, *MEMORY[0x1E0D0B150]);
}

- (id)acknowledgedDate
{
  return -[EKPersistentObject primitiveDateValueForKey:](self, "primitiveDateValueForKey:", *MEMORY[0x1E0D0B150]);
}

- (BOOL)isDefaultAlarm
{
  return -[EKPersistentObject primitiveBoolValueForKey:](self, "primitiveBoolValueForKey:", *MEMORY[0x1E0D0B178]);
}

- (void)setIsDefaultAlarm:(BOOL)a3
{
  -[EKPersistentObject primitiveSetBoolValue:forKey:](self, "primitiveSetBoolValue:forKey:", a3, *MEMORY[0x1E0D0B178]);
}

- (void)setOriginalAlarm:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B180]);
}

- (id)originalAlarm
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B180]);
}

- (void)setSnoozedAlarmsSet:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B198]);
}

- (id)snoozedAlarmsSet
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B198]);
}

- (void)setEmailAddress:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B168]);
}

- (id)emailAddress
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B168]);
}

- (void)setUrlWrapper:(id)a3
{
  -[EKPersistentObject primitiveSetSecurityScopedURLWrapperValue:forKey:](self, "primitiveSetSecurityScopedURLWrapperValue:forKey:", a3, *MEMORY[0x1E0D0B1B0]);
}

- (id)urlWrapper
{
  return -[EKPersistentObject primitiveSecurityScopedURLWrapperValueForKey:](self, "primitiveSecurityScopedURLWrapperValueForKey:", *MEMORY[0x1E0D0B1B0]);
}

- (id)semanticIdentifier
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[EKPersistentAlarm isDefaultAlarm](self, "isDefaultAlarm");
  -[EKPersistentAlarm absoluteDate](self, "absoluteDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentAlarm relativeOffset](self, "relativeOffset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKAlarmSemanticIdentifierGenerator semanticIdentifierForAlarmIsDefault:absoluteDate:relativeOffset:emailAddress:url:](EKAlarmSemanticIdentifierGenerator, "semanticIdentifierForAlarmIsDefault:absoluteDate:relativeOffset:emailAddress:url:", v3, v4, v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  EKPersistentAlarm *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;

  v4 = objc_alloc_init(EKPersistentAlarm);
  -[EKPersistentAlarm absoluteDate](self, "absoluteDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[EKPersistentAlarm absoluteDate](self, "absoluteDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPersistentAlarm setAbsoluteDate:](v4, "setAbsoluteDate:", v6);
  }
  else
  {
    -[EKPersistentAlarm relativeOffset](self, "relativeOffset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPersistentAlarm setRelativeOffset:](v4, "setRelativeOffset:", v6);
  }

  -[EKPersistentAlarm setProximity:](v4, "setProximity:", -[EKPersistentAlarm proximity](self, "proximity"));
  -[EKPersistentAlarm setType:](v4, "setType:", -[EKPersistentAlarm type](self, "type"));
  -[EKPersistentAlarm emailAddress](self, "emailAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentAlarm setEmailAddress:](v4, "setEmailAddress:", v7);

  -[EKPersistentAlarm urlWrapper](self, "urlWrapper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentAlarm setUrlWrapper:](v4, "setUrlWrapper:", v8);

  EKUUIDString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentAlarm setUUID:](v4, "setUUID:", v9);

  -[EKPersistentAlarm setIsDefaultAlarm:](v4, "setIsDefaultAlarm:", -[EKPersistentAlarm isDefaultAlarm](self, "isDefaultAlarm"));
  -[EKPersistentObject eventStore](self, "eventStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "eventAccessLevel");

  if (v11 == 2)
  {
    -[EKPersistentAlarm externalData](self, "externalData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    -[EKPersistentAlarm setExternalData:](v4, "setExternalData:", v13);

  }
  return v4;
}

+ (id)propertyKeyForUniqueIdentifier
{
  return (id)*MEMORY[0x1E0D0B820];
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  void *v12;

  -[EKPersistentAlarm absoluteDate](self, "absoluteDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  if (v3)
  {
    -[EKPersistentAlarm absoluteDate](self, "absoluteDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[EKPersistentAlarm proximity](self, "proximity");
    -[EKPersistentAlarm structuredLocation](self, "structuredLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ <%p> {triggerDate = %@; proximity = %ld; location = %@, type = %ld}"),
      v5,
      self,
      v6,
      v7,
      v8,
      -[EKPersistentAlarm type](self, "type"));
  }
  else
  {
    -[EKPersistentAlarm relativeOffset](self, "relativeOffset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v10 = v9;
    v11 = -[EKPersistentAlarm proximity](self, "proximity");
    -[EKPersistentAlarm structuredLocation](self, "structuredLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ <%p> {triggerInterval = %lf; proximity = %ld; location = %@, type = %ld}"),
      v5,
      self,
      v10,
      v11,
      v8,
      -[EKPersistentAlarm type](self, "type"));
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
