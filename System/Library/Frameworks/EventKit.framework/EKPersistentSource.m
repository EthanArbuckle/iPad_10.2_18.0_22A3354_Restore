@implementation EKPersistentSource

- (int)entityType
{
  return 6;
}

+ (id)defaultPropertiesToLoad
{
  if (defaultPropertiesToLoad_onceToken_12 != -1)
    dispatch_once(&defaultPropertiesToLoad_onceToken_12, &__block_literal_global_81);
  return (id)defaultPropertiesToLoad_defaultPropertiesToLoad_11;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (int64_t)sourceTypeRaw
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0BA98]);
}

+ (id)relations
{
  if (relations_onceToken_19 != -1)
    dispatch_once(&relations_onceToken_19, &__block_literal_global_6_7);
  return (id)relations_relations_19;
}

- (int)flags
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0BA40]);
}

- (NSString)UUID
{
  return (NSString *)-[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B820]);
}

- (id)delegatedAccountOwnerStoreID
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0BA20]);
}

- (id)syncError
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0BAA8]);
}

- (id)lastSyncStartDate
{
  return -[EKPersistentObject primitiveDateValueForKey:](self, "primitiveDateValueForKey:", *MEMORY[0x1E0D0BA58]);
}

- (id)lastSyncEndDate
{
  return -[EKPersistentObject primitiveDateValueForKey:](self, "primitiveDateValueForKey:", *MEMORY[0x1E0D0BA50]);
}

void __31__EKPersistentSource_relations__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B578]);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:", CFSTR("Calendar"), 1, v7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0D0B9F0];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B5F0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:", CFSTR("Error"), 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, v2, v4, *MEMORY[0x1E0D0BAA8], 0);
  v6 = (void *)relations_relations_19;
  relations_relations_19 = v5;

}

void __45__EKPersistentSource_defaultPropertiesToLoad__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[14];

  v8[13] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0BAB0];
  v8[0] = *MEMORY[0x1E0D0BA98];
  v8[1] = v0;
  v1 = *MEMORY[0x1E0D0BA28];
  v8[2] = *MEMORY[0x1E0D0BA78];
  v8[3] = v1;
  v2 = *MEMORY[0x1E0D0B820];
  v8[4] = *MEMORY[0x1E0D0B828];
  v8[5] = v2;
  v3 = *MEMORY[0x1E0D0BA18];
  v8[6] = *MEMORY[0x1E0D0BA10];
  v8[7] = v3;
  v4 = *MEMORY[0x1E0D0BA40];
  v8[8] = *MEMORY[0x1E0D0BA20];
  v8[9] = v4;
  v5 = *MEMORY[0x1E0D0BAA8];
  v8[10] = *MEMORY[0x1E0D0BA48];
  v8[11] = v5;
  v8[12] = *MEMORY[0x1E0D0BA60];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 13);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_11;
  defaultPropertiesToLoad_defaultPropertiesToLoad_11 = v6;

}

- (id)constraints
{
  void *v3;
  void *v4;
  void *v5;

  -[EKPersistentObject eventStore](self, "eventStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentObject CADObjectID](self, "CADObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachedConstraintsForEventOrSourceWithCADObjectID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)propertyKeyForUniqueIdentifier
{
  return (id)*MEMORY[0x1E0D0B820];
}

- (void)setSourceTypeRaw:(int64_t)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", a3, *MEMORY[0x1E0D0BA98]);
}

- (int)preferredEventPrivateValueRaw
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0BA88]);
}

- (void)setPreferredEventPrivateValueRaw:(int)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", *(_QWORD *)&a3, *MEMORY[0x1E0D0BA88]);
}

- (int)strictestEventPrivateValueRaw
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0BAA0]);
}

- (void)setStrictestEventPrivateValueRaw:(int)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", *(_QWORD *)&a3, *MEMORY[0x1E0D0BAA0]);
}

- (NSString)title
{
  return (NSString *)-[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0BAB0]);
}

- (void)setTitle:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0BAB0]);
}

- (id)notes
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0BA68]);
}

- (void)setNotes:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0BA68]);
}

- (NSNumber)defaultAlarmOffset
{
  return (NSNumber *)-[EKPersistentObject primitiveNumberValueForKey:](self, "primitiveNumberValueForKey:", *MEMORY[0x1E0D0BA10]);
}

- (void)setDefaultAlarmOffset:(id)a3
{
  -[EKPersistentObject primitiveSetNumberValue:forKey:](self, "primitiveSetNumberValue:forKey:", a3, *MEMORY[0x1E0D0BA10]);
}

- (id)defaultAllDayAlarmOffset
{
  return -[EKPersistentObject primitiveNumberValueForKey:](self, "primitiveNumberValueForKey:", *MEMORY[0x1E0D0BA18]);
}

- (void)setDefaultAllDayAlarmOffset:(id)a3
{
  -[EKPersistentObject primitiveSetNumberValue:forKey:](self, "primitiveSetNumberValue:forKey:", a3, *MEMORY[0x1E0D0BA18]);
}

- (void)setUUID:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B820]);
}

- (NSString)externalID
{
  return (NSString *)-[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B828]);
}

- (void)setExternalID:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B828]);
}

- (id)constraintsName
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B9F8]);
}

- (void)setConstraintsName:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B9F8]);
}

- (NSString)externalModificationTag
{
  return (NSString *)-[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0BA38]);
}

- (void)setExternalModificationTag:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0BA38]);
}

- (BOOL)disabled
{
  return -[EKPersistentObject primitiveBoolValueForKey:](self, "primitiveBoolValueForKey:", *MEMORY[0x1E0D0BA28]);
}

- (void)setDisabled:(BOOL)a3
{
  -[EKPersistentObject primitiveSetBoolValue:forKey:](self, "primitiveSetBoolValue:forKey:", a3, *MEMORY[0x1E0D0BA28]);
}

- (id)creatorBundleID
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0BA00]);
}

- (void)setCreatorBundleID:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0BA00]);
}

- (id)creatorCodeSigningIdentity
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0BA08]);
}

- (void)setCreatorCodeSigningIdentity:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0BA08]);
}

- (BOOL)onlyCreatorCanModify
{
  return -[EKPersistentObject primitiveBoolValueForKey:](self, "primitiveBoolValueForKey:", *MEMORY[0x1E0D0BA70]);
}

- (void)setOnlyCreatorCanModify:(BOOL)a3
{
  -[EKPersistentObject primitiveSetBoolValue:forKey:](self, "primitiveSetBoolValue:forKey:", a3, *MEMORY[0x1E0D0BA70]);
}

- (BOOL)showsNotifications
{
  return -[EKPersistentObject primitiveBoolValueForKey:](self, "primitiveBoolValueForKey:", *MEMORY[0x1E0D0BA90]);
}

- (void)setShowsNotifications:(BOOL)a3
{
  -[EKPersistentObject primitiveSetBoolValue:forKey:](self, "primitiveSetBoolValue:forKey:", a3, *MEMORY[0x1E0D0BA90]);
}

- (void)setFlags:(int)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", *(_QWORD *)&a3, *MEMORY[0x1E0D0BA40]);
}

- (int)flags2
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0BA48]);
}

- (void)setFlags2:(int)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", *(_QWORD *)&a3, *MEMORY[0x1E0D0BA48]);
}

- (void)setLastSyncStartDate:(id)a3
{
  -[EKPersistentObject primitiveSetDateValue:forKey:](self, "primitiveSetDateValue:forKey:", a3, *MEMORY[0x1E0D0BA58]);
}

- (void)setLastSyncEndDate:(id)a3
{
  -[EKPersistentObject primitiveSetDateValue:forKey:](self, "primitiveSetDateValue:forKey:", a3, *MEMORY[0x1E0D0BA50]);
}

- (void)setDelegatedAccountOwnerStoreID:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0BA20]);
}

- (int)displayOrder
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0BA30]);
}

- (void)setDisplayOrder:(int)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", *(_QWORD *)&a3, *MEMORY[0x1E0D0BA30]);
}

- (id)ownerName
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0BA78]);
}

- (void)setOwnerName:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0BA78]);
}

- (void)setSyncError:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0BAA8]);
}

- (id)cachedExternalInfoData
{
  return -[EKPersistentObject primitiveDataValueForKey:](self, "primitiveDataValueForKey:", *MEMORY[0x1E0D0B9E8]);
}

- (void)setCachedExternalInfoData:(id)a3
{
  -[EKPersistentObject primitiveSetDataValue:forKey:](self, "primitiveSetDataValue:forKey:", a3, *MEMORY[0x1E0D0B9E8]);
}

- (int)managedConfigurationAccountAccess
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0BA60]);
}

- (id)appGroupIdentifier
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B9E0]);
}

- (void)setAppGroupIdentifier:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B9E0]);
}

- (id)pendingPersonaIdentifierForNewSource
{
  return -[EKPersistentObject loadedOrUpdatedPropertyValue:wasAvailable:](self, "loadedOrUpdatedPropertyValue:wasAvailable:", *MEMORY[0x1E0D0BA80], 0);
}

- (void)setPendingPersonaIdentifierForNewSource:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0BA80]);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EKPersistentSource UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = description_kTypeStrings_0[-[EKPersistentSource sourceTypeRaw](self, "sourceTypeRaw")];
  -[EKPersistentSource title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentSource externalID](self, "externalID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%p> {UUID = %@; type = %@; title = %@; externalId = %@}"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (EKFrozenReminderSource)reminderSource
{
  return (EKFrozenReminderSource *)objc_getProperty(self, a2, 120, 1);
}

- (void)setReminderSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reminderSource, 0);
}

@end
