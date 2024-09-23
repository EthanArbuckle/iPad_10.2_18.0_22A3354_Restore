@implementation EKPersistentCalendar

- (int)entityType
{
  return 1;
}

+ (id)defaultPropertiesToLoad
{
  if (defaultPropertiesToLoad_onceToken_0 != -1)
    dispatch_once(&defaultPropertiesToLoad_onceToken_0, &__block_literal_global_2);
  return (id)defaultPropertiesToLoad_defaultPropertiesToLoad_0;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (int)flags
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B468]);
}

+ (id)relations
{
  if (relations_onceToken_0 != -1)
    dispatch_once(&relations_onceToken_0, &__block_literal_global_6_1);
  return (id)relations_relations_0;
}

- (NSString)symbolicColorName
{
  return (NSString *)-[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B598]);
}

- (EKPersistentSource)source
{
  return (EKPersistentSource *)-[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B578]);
}

- (int)allowedEntities
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B420]);
}

- (NSString)UUID
{
  return (NSString *)-[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B820]);
}

- (NSString)unlocalizedTitle
{
  return (NSString *)-[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B5B0]);
}

- (id)syncError
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B5A0]);
}

void __33__EKPersistentCalendar_relations__block_invoke()
{
  void *v0;
  void *v1;
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
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;

  v16 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B9F0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:ownsRelated:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:ownsRelated:", CFSTR("Source"), 0, v18, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0D0B578];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B830]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:", CFSTR("Sharee"), 1, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0D0B560];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B160]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:", CFSTR("Alarm"), 1, v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0D0B418];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B7B0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:", CFSTR("Notification"), 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D0B4B8];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B5D8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:", CFSTR("Error"), 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D0B5A0];
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:ownsRelated:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:ownsRelated:", CFSTR("Image"), 0, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v16, "initWithObjectsAndKeys:", v15, v14, v13, v12, v1, v2, v4, v5, v7, v8, v9, *MEMORY[0x1E0D0B470], 0);
  v11 = (void *)relations_relations_0;
  relations_relations_0 = v10;

}

void __47__EKPersistentCalendar_defaultPropertiesToLoad__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[15];

  v9[14] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B598];
  v9[0] = *MEMORY[0x1E0D0B438];
  v9[1] = v0;
  v1 = *MEMORY[0x1E0D0B578];
  v9[2] = *MEMORY[0x1E0D0B448];
  v9[3] = v1;
  v2 = *MEMORY[0x1E0D0B420];
  v9[4] = *MEMORY[0x1E0D0B468];
  v9[5] = v2;
  v3 = *MEMORY[0x1E0D0B570];
  v9[6] = *MEMORY[0x1E0D0B820];
  v9[7] = v3;
  v4 = *MEMORY[0x1E0D0B480];
  v9[8] = *MEMORY[0x1E0D0B558];
  v9[9] = v4;
  v5 = *MEMORY[0x1E0D0B5B0];
  v9[10] = *MEMORY[0x1E0D0B500];
  v9[11] = v5;
  v6 = *MEMORY[0x1E0D0B828];
  v9[12] = *MEMORY[0x1E0D0B5A0];
  v9[13] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 14);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_0;
  defaultPropertiesToLoad_defaultPropertiesToLoad_0 = v7;

}

+ (id)propertyKeyForUniqueIdentifier
{
  return (id)*MEMORY[0x1E0D0B820];
}

- (NSString)externalID
{
  return (NSString *)-[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B828]);
}

- (void)setExternalID:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B828]);
}

- (id)externalIDTag
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B450]);
}

- (void)setExternalIDTag:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B450]);
}

- (NSString)externalModificationTag
{
  return (NSString *)-[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B458]);
}

- (void)setExternalModificationTag:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B458]);
}

- (id)syncToken
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B5A8]);
}

- (void)setSyncToken:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B5A8]);
}

- (id)externalRepresentation
{
  return -[EKPersistentObject primitiveDataValueForKey:](self, "primitiveDataValueForKey:", *MEMORY[0x1E0D0B460]);
}

- (void)setExternalRepresentation:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[EKPersistentObject primitiveSetDataValue:forKey:](self, "primitiveSetDataValue:forKey:", v4, *MEMORY[0x1E0D0B460]);

}

- (void)setUnlocalizedTitle:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B5B0]);
}

- (id)lastSyncTitle
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B498]);
}

- (void)setLastSyncTitle:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B498]);
}

- (BOOL)isColorDisplayOnly
{
  return -[EKPersistentObject primitiveBoolValueForKey:](self, "primitiveBoolValueForKey:", *MEMORY[0x1E0D0B430]);
}

- (void)setColorDisplayOnly:(BOOL)a3
{
  -[EKPersistentObject primitiveSetBoolValue:forKey:](self, "primitiveSetBoolValue:forKey:", a3, *MEMORY[0x1E0D0B430]);
}

- (void)setSymbolicColorName:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B598]);
}

- (NSString)colorStringRaw
{
  return (NSString *)-[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B438]);
}

- (void)setColorStringRaw:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B438]);
}

- (void)setUUID:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B820]);
}

- (int)displayOrder
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B448]);
}

- (void)setDisplayOrder:(int)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", *(_QWORD *)&a3, *MEMORY[0x1E0D0B448]);
}

- (id)description
{
  char v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = -[EKPersistentCalendar flags](self, "flags");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  -[EKPersistentCalendar unlocalizedTitle](self, "unlocalizedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3 & 1) != 0)
    v7 = "NO";
  else
    v7 = "YES";
  -[EKPersistentCalendar colorStringRaw](self, "colorStringRaw");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentCalendar source](self, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentCalendar sharees](self, "sharees");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ <%p> {title = %@; allowsModify = %s; color = %@; source = %@; sharees = %@}"),
    v5,
    self,
    v6,
    v7,
    v8,
    v9,
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setFlags:(int)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", *(_QWORD *)&a3, *MEMORY[0x1E0D0B468]);
}

- (unint64_t)sharingStatus
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B570]);
}

- (void)setSharingStatus:(unint64_t)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", a3, *MEMORY[0x1E0D0B570]);
}

- (NSString)sharedOwnerName
{
  return (NSString *)-[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B550]);
}

- (void)setSharedOwnerName:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B550]);
}

- (NSString)sharedOwnerURLString
{
  return (NSString *)-[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B558]);
}

- (void)setSharedOwnerURLString:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B558]);
}

- (id)cachedExternalInfoData
{
  return -[EKPersistentObject primitiveDataValueForKey:](self, "primitiveDataValueForKey:", *MEMORY[0x1E0D0B428]);
}

- (void)setCachedExternalInfoData:(id)a3
{
  -[EKPersistentObject primitiveSetDataValue:forKey:](self, "primitiveSetDataValue:forKey:", a3, *MEMORY[0x1E0D0B428]);
}

- (unint64_t)sharingInvitationResponse
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B568]);
}

- (void)setSharingInvitationResponse:(unint64_t)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", a3, *MEMORY[0x1E0D0B568]);
}

- (id)publishURLString
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B500]);
}

- (void)setPublishURLString:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B500]);
}

- (void)setIsPublished:(BOOL)a3
{
  -[EKPersistentObject primitiveSetBoolValue:forKey:](self, "primitiveSetBoolValue:forKey:", a3, *MEMORY[0x1E0D0B480]);
}

- (BOOL)isPublished
{
  return -[EKPersistentObject primitiveBoolValueForKey:](self, "primitiveBoolValueForKey:", *MEMORY[0x1E0D0B480]);
}

- (void)setPublished:(BOOL)a3
{
  -[EKPersistentObject primitiveSetBoolValue:forKey:](self, "primitiveSetBoolValue:forKey:", a3, *MEMORY[0x1E0D0B480]);
}

- (id)notifications
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B4B8]);
}

- (void)setNotifications:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B4B8]);
}

- (NSSet)sharees
{
  return (NSSet *)-[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B560]);
}

- (void)setSharees:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B560]);
}

- (void)setSource:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B578]);
}

- (unint64_t)invitationStatus
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B478]);
}

- (void)setInvitationStatus:(unint64_t)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", a3, *MEMORY[0x1E0D0B478]);
}

- (void)setAllowedEntities:(int)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", *(_QWORD *)&a3, *MEMORY[0x1E0D0B420]);
}

- (NSString)selfIdentityDisplayName
{
  return (NSString *)-[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B528]);
}

- (void)setSelfIdentityDisplayName:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B528]);
}

- (NSString)selfIdentityEmail
{
  return (NSString *)-[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B530]);
}

- (void)setSelfIdentityEmail:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B530]);
}

- (NSString)selfIdentityPhoneNumber
{
  return (NSString *)-[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B548]);
}

- (void)setSelfIdentityPhoneNumber:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B548]);
}

- (NSString)selfIdentityAddressString
{
  return (NSString *)-[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B520]);
}

- (void)setSelfIdentityAddressString:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B520]);
}

- (NSString)selfIdentityFirstName
{
  return (NSString *)-[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B538]);
}

- (void)setSelfIdentityFirstName:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B538]);
}

- (NSString)selfIdentityLastName
{
  return (NSString *)-[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B540]);
}

- (void)setSelfIdentityLastName:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B540]);
}

- (NSString)ownerIdentityDisplayName
{
  return (NSString *)-[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B4C8]);
}

- (int)ownerIdentityId
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B4E0]);
}

- (void)setOwnerIdentityId:(int)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", *(_QWORD *)&a3, *MEMORY[0x1E0D0B4E0]);
}

- (void)setOwnerIdentityDisplayName:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B4C8]);
}

- (NSString)ownerIdentityEmail
{
  return (NSString *)-[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B4D0]);
}

- (void)setOwnerIdentityEmail:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B4D0]);
}

- (NSString)ownerIdentityPhoneNumber
{
  return (NSString *)-[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B4F0]);
}

- (void)setOwnerIdentityPhoneNumber:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B4F0]);
}

- (id)ownerIdentityAddressString
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B4C0]);
}

- (void)setOwnerIdentityAddressString:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B4C0]);
}

- (NSString)ownerIdentityFirstName
{
  return (NSString *)-[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B4D8]);
}

- (void)setOwnerIdentityFirstName:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B4D8]);
}

- (NSString)ownerIdentityLastName
{
  return (NSString *)-[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B4E8]);
}

- (void)setOwnerIdentityLastName:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B4E8]);
}

- (id)notes
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B4B0]);
}

- (void)setNotes:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B4B0]);
}

- (id)pubcalAccountID
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B4F8]);
}

- (void)setPubcalAccountID:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B4F8]);
}

- (NSString)subcalAccountID
{
  return (NSString *)-[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B580]);
}

- (void)setSubcalAccountID:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B580]);
}

- (id)subcalURL
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B588]);
}

- (void)setSubcalURL:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B588]);
}

- (NSString)pushKey
{
  return (NSString *)-[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B508]);
}

- (void)setPushKey:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B508]);
}

- (id)digest
{
  return -[EKPersistentObject primitiveDataValueForKey:](self, "primitiveDataValueForKey:", *MEMORY[0x1E0D0B440]);
}

- (void)setDigest:(id)a3
{
  -[EKPersistentObject primitiveSetDataValue:forKey:](self, "primitiveSetDataValue:forKey:", a3, *MEMORY[0x1E0D0B440]);
}

- (void)setAllAlarms:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B418]);
}

- (id)allAlarms
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B418]);
}

- (id)refreshDate
{
  return -[EKPersistentObject primitiveDateValueForKey:](self, "primitiveDateValueForKey:", *MEMORY[0x1E0D0B510]);
}

- (void)setRefreshDate:(id)a3
{
  -[EKPersistentObject primitiveSetDateValue:forKey:](self, "primitiveSetDateValue:forKey:", a3, *MEMORY[0x1E0D0B510]);
}

- (int)refreshInterval
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B518]);
}

- (void)setRefreshInterval:(int)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", *(_QWORD *)&a3, *MEMORY[0x1E0D0B518]);
}

- (id)subscriptionID
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B590]);
}

- (void)setSubscriptionID:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B590]);
}

- (id)lastSyncStartDate
{
  return -[EKPersistentObject primitiveDateValueForKey:](self, "primitiveDateValueForKey:", *MEMORY[0x1E0D0B490]);
}

- (void)setLastSyncStartDate:(id)a3
{
  -[EKPersistentObject primitiveSetDateValue:forKey:](self, "primitiveSetDateValue:forKey:", a3, *MEMORY[0x1E0D0B490]);
}

- (id)lastSyncEndDate
{
  return -[EKPersistentObject primitiveDateValueForKey:](self, "primitiveDateValueForKey:", *MEMORY[0x1E0D0B488]);
}

- (void)setLastSyncEndDate:(id)a3
{
  -[EKPersistentObject primitiveSetDateValue:forKey:](self, "primitiveSetDateValue:forKey:", a3, *MEMORY[0x1E0D0B488]);
}

- (void)setSyncError:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B5A0]);
}

- (int64_t)maxAttendees
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B4A8]);
}

- (void)setMaxAttendees:(int64_t)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", a3, *MEMORY[0x1E0D0B4A8]);
}

- (id)locale
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B4A0]);
}

- (void)setLocale:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B4A0]);
}

- (id)image
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B470]);
}

- (void)setImage:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B470]);
}

+ (id)calendarWithRandomUUID
{
  EKPersistentCalendar *v2;
  void *v3;

  v2 = objc_alloc_init(EKPersistentCalendar);
  EKUUIDString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentCalendar setUUID:](v2, "setUUID:", v3);

  return v2;
}

@end
