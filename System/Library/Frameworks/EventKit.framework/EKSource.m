@implementation EKSource

- (BOOL)isDelegate
{
  void *v2;
  BOOL v3;

  -[EKSource delegatedAccountOwnerStoreID](self, "delegatedAccountOwnerStoreID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSString)delegatedAccountOwnerStoreID
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0BA20]);
}

- (unint64_t)lastSyncError
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[EKSource syncError](self, "syncError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "errorType"))
      v4 = 1;
    else
      v4 = objc_msgSend(v3, "errorCode");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (EKSyncError)syncError
{
  return (EKSyncError *)-[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", *MEMORY[0x1E0D0BAA8]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilityCache, 0);
}

- (NSSet)calendarsForEntityType:(EKEntityType)entityType
{
  void *v5;
  void *v6;

  -[EKObject eventStore](self, "eventStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calendarsForEntityType:inSource:", entityType, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v6;
}

- (BOOL)allowsEvents
{
  return !-[EKSource flag:](self, "flag:", 2);
}

- (BOOL)flag:(int)a3
{
  return (-[EKSource flags](self, "flags") & a3) != 0;
}

- (int)flags
{
  void *v2;
  int v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0BA40]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (id)UUID
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B820]);
}

- (int64_t)sourceTypeRaw
{
  void *v2;
  int64_t v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0BA98]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "intValue");

  return v3;
}

- (REMObjectID)remAccountObjectID
{
  void *v3;
  char isKindOfClass;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[EKObject backingObject](self, "backingObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = v3;
  v6 = v5;
  if ((isKindOfClass & 1) == 0)
  {
    -[EKObject eventStore](self, "eventStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reminderSourceForEventSource:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "backingObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "remObjectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (REMObjectID *)v9;
}

- (BOOL)isSyncing
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  -[EKSource lastSyncStartDate](self, "lastSyncStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKSource lastSyncEndDate](self, "lastSyncEndDate");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
  {
    if (!v4)
    {
      v6 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v3, "isEqualToDate:", v4) & 1) == 0)
    {
      objc_msgSend(v3, "laterDate:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "isEqualToDate:", v3);

      goto LABEL_7;
    }
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (NSDate)lastSyncStartDate
{
  return (NSDate *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0BA58]);
}

- (NSDate)lastSyncEndDate
{
  return (NSDate *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0BA50]);
}

- (BOOL)hasOwnerEmailAddress
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[EKSource ownerAddresses](self, "ownerAddresses", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v7, "hasMailto") & 1) != 0 || (objc_msgSend(v7, "resemblesEmailAddress") & 1) != 0)
        {
          v8 = 1;
          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v8 = 0;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_13:

  return v8;
}

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)isWeakRelationship
{
  return 1;
}

+ (id)knownRelationshipSingleValueKeys
{
  if (knownRelationshipSingleValueKeys_onceToken_5 != -1)
    dispatch_once(&knownRelationshipSingleValueKeys_onceToken_5, &__block_literal_global_68);
  return (id)knownRelationshipSingleValueKeys_keys_5;
}

void __44__EKSource_knownRelationshipSingleValueKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0D0BAA8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)knownRelationshipSingleValueKeys_keys_5;
  knownRelationshipSingleValueKeys_keys_5 = v0;

}

+ (id)knownIdentityKeysForComparison
{
  if (knownIdentityKeysForComparison_onceToken_10 != -1)
    dispatch_once(&knownIdentityKeysForComparison_onceToken_10, &__block_literal_global_9_2);
  return (id)knownIdentityKeysForComparison_keys_10;
}

void __42__EKSource_knownIdentityKeysForComparison__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0D0B820];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)knownIdentityKeysForComparison_keys_10;
  knownIdentityKeysForComparison_keys_10 = v0;

}

+ (id)knownSingleValueKeysForComparison
{
  if (knownSingleValueKeysForComparison_onceToken_9 != -1)
    dispatch_once(&knownSingleValueKeysForComparison_onceToken_9, &__block_literal_global_10_0);
  return (id)knownSingleValueKeysForComparison_keys_9;
}

void __45__EKSource_knownSingleValueKeysForComparison__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0BA68];
  v3[0] = *MEMORY[0x1E0D0BAB0];
  v3[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)knownSingleValueKeysForComparison_keys_9;
  knownSingleValueKeysForComparison_keys_9 = v1;

}

+ (EKSource)sourceWithEventStore:(id)a3
{
  id v4;
  NSObject *v5;
  EKPersistentSource *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (!v4)
  {
    v5 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      +[EKSource sourceWithEventStore:].cold.1(v5);
  }
  v6 = objc_alloc_init(EKPersistentSource);
  objc_msgSend(v4, "_registerObject:", v6);
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPersistentObject:", v6);
  EKUUIDString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSourceIdentifier:", v8);

  return (EKSource *)v7;
}

- (void)setSourceTypeRaw:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0BA98]);

}

+ (int)_ekPrivacyLevelToCalEventPrivacyLevel:(int64_t)a3
{
  int64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  if ((unint64_t)a3 >= 4)
  {
    v4 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      +[EKSource _ekPrivacyLevelToCalEventPrivacyLevel:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    LODWORD(v3) = 0;
  }
  return v3;
}

+ (int64_t)_calEventPrivacyLevelToEKPrivacyLevel:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = *(_QWORD *)&a3;
  if (a3 < 4)
    return a3;
  v5 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    +[EKSource _calEventPrivacyLevelToEKPrivacyLevel:].cold.1(v3, v5, v6, v7, v8, v9, v10, v11);
  return 0;
}

- (int)preferredEventPrivateValueRaw
{
  void *v2;
  int v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0BA88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (void)setPreferredEventPrivateValueRaw:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0BA88]);

}

- (int64_t)preferredEventPrivateValue
{
  return objc_msgSend((id)objc_opt_class(), "_calEventPrivacyLevelToEKPrivacyLevel:", -[EKSource preferredEventPrivateValueRaw](self, "preferredEventPrivateValueRaw"));
}

- (void)setPreferredEventPrivateValue:(int64_t)a3
{
  -[EKSource setPreferredEventPrivateValueRaw:](self, "setPreferredEventPrivateValueRaw:", objc_msgSend((id)objc_opt_class(), "_ekPrivacyLevelToCalEventPrivacyLevel:", a3));
}

- (int)strictestEventPrivateValueRaw
{
  void *v2;
  int v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0BAA0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (void)setStrictestEventPrivateValueRaw:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0BAA0]);

}

- (int64_t)strictestEventPrivateValue
{
  return objc_msgSend((id)objc_opt_class(), "_calEventPrivacyLevelToEKPrivacyLevel:", -[EKSource strictestEventPrivateValueRaw](self, "strictestEventPrivateValueRaw"));
}

- (void)setStrictestEventPrivateValue:(int64_t)a3
{
  -[EKSource setStrictestEventPrivateValueRaw:](self, "setStrictestEventPrivateValueRaw:", objc_msgSend((id)objc_opt_class(), "_ekPrivacyLevelToCalEventPrivacyLevel:", a3));
}

+ (id)_eventKitBundle
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__EKSource__eventKitBundle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_eventKitBundle_onceToken_0 != -1)
    dispatch_once(&_eventKitBundle_onceToken_0, block);
  return (id)_eventKitBundle_bundle_0;
}

void __27__EKSource__eventKitBundle__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", *(_QWORD *)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_eventKitBundle_bundle_0;
  _eventKitBundle_bundle_0 = v1;

}

- (NSString)title
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  uint64_t v6;

  if (-[EKSource isFacebookSource](self, "isFacebookSource"))
  {
    v3 = CFSTR("CalDAV");
  }
  else
  {
    -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0BAB0]);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v3 = v4;
    if (v4 && -[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("VIRTUAL_APP_SOURCE_NAME")))
    {
      objc_msgSend((id)objc_opt_class(), "_eventKitBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("virtual source name"), CFSTR("Account"), 0);
      v6 = objc_claimAutoreleasedReturnValue();

      v3 = (__CFString *)v6;
    }
  }
  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0BAB0]);
}

- (NSString)notes
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0BA68]);
}

- (void)setNotes:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0BA68]);
}

- (NSNumber)defaultAlarmOffset
{
  return (NSNumber *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0BA10]);
}

- (void)setDefaultAlarmOffset:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0BA10]);
}

- (NSNumber)defaultAllDayAlarmOffset
{
  return (NSNumber *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0BA18]);
}

- (void)setDefaultAllDayAlarmOffset:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0BA18]);
}

- (void)setUUID:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B820]);
}

- (NSString)externalID
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B828]);
}

- (void)setExternalID:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B828]);
}

- (NSString)constraintsDescriptionPath
{
  void *v2;
  void *v3;

  -[EKSource constraintsName](self, "constraintsName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D0C260], "backwardsCompatibleConstraintsPathForName:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)constraintsName
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B9F8]);
}

- (void)_setConstraintsNameWithoutValidation:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B9F8]);
}

- (void)setConstraintsName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "isAbsolutePath"))
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_FAULT))
      -[EKSource setConstraintsName:].cold.1();
  }
  else if (objc_msgSend(v4, "hasSuffix:", CFSTR(".plist")))
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_FAULT))
      -[EKSource setConstraintsName:].cold.2();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D0C260], "constraintsURLForName:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_FAULT))
      -[EKSource setConstraintsName:].cold.3();
  }
  -[EKSource _setConstraintsNameWithoutValidation:](self, "_setConstraintsNameWithoutValidation:", v4);

}

- (NSString)externalModificationTag
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0BA38]);
}

- (void)setExternalModificationTag:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0BA38]);
}

- (NSString)creatorBundleID
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0BA00]);
}

- (void)setCreatorBundleID:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0BA00]);
}

- (NSString)creatorCodeSigningIdentity
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0BA08]);
}

- (void)setCreatorCodeSigningIdentity:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0BA08]);
}

- (BOOL)onlyCreatorCanModify
{
  void *v2;
  char v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0BA70]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setOnlyCreatorCanModify:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0BA70]);

}

- (NSString)appGroupIdentifier
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B9E0]);
}

- (void)setAppGroupIdentifier:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B9E0]);
}

- (id)pendingPersonaIdentifierForNewSource
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0BA80]);
}

- (void)setPendingPersonaIdentifierForNewSource:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0BA80]);
}

- (void)setFlags:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0BA40]);

}

- (void)setFlag:(int)a3 value:(BOOL)a4
{
  uint64_t v5;

  if (a4)
    v5 = -[EKSource flags](self, "flags") | a3;
  else
    v5 = -[EKSource flags](self, "flags") & ~a3;
  -[EKSource setFlags:](self, "setFlags:", v5);
}

- (int)flags2
{
  void *v2;
  int v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0BA48]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (void)setFlags2:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0BA48]);

}

- (BOOL)flag2:(int)a3
{
  return (-[EKSource flags2](self, "flags2") & a3) != 0;
}

- (void)setFlag2:(int)a3 value:(BOOL)a4
{
  uint64_t v5;

  if (a4)
    v5 = -[EKSource flags2](self, "flags2") | a3;
  else
    v5 = -[EKSource flags2](self, "flags2") & ~a3;
  -[EKSource setFlags2:](self, "setFlags2:", v5);
}

- (BOOL)isInMainWindow
{
  return -[EKSource flag2:](self, "flag2:", 256);
}

- (void)setIsInMainWindow:(BOOL)a3
{
  -[EKSource setFlag2:value:](self, "setFlag2:value:", 256, a3);
}

- (BOOL)isInSeparateWindow
{
  return -[EKSource flag2:](self, "flag2:", 512);
}

- (void)setIsInSeparateWindow:(BOOL)a3
{
  -[EKSource setFlag2:value:](self, "setFlag2:value:", 512, a3);
}

- (BOOL)doesSyncDefaultAlarmsToServer
{
  return -[EKSource flag2:](self, "flag2:", 2048);
}

- (void)setDoesSyncDefaultAlarmsToServer:(BOOL)a3
{
  -[EKSource setFlag2:value:](self, "setFlag2:value:", 2048, a3);
}

- (BOOL)wasMigrated
{
  return -[EKSource flag:](self, "flag:", 8);
}

- (void)setWasMigrated:(BOOL)a3
{
  -[EKSource setFlag:value:](self, "setFlag:value:", 8, a3);
}

- (BOOL)showsNotifications
{
  void *v2;
  char v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0BA90]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setShowsNotifications:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0BA90]);

}

- (BOOL)usesSelfAttendee
{
  return !-[EKSource flag:](self, "flag:", 128);
}

- (void)setUsesSelfAttendee:(BOOL)a3
{
  -[EKSource setFlag:value:](self, "setFlag:value:", 128, !a3);
}

- (BOOL)disabled
{
  void *v2;
  char v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0BA28]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setDisabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0BA28]);

}

- (BOOL)isEnabled
{
  return !-[EKSource disabled](self, "disabled");
}

- (void)setEnabled:(BOOL)a3
{
  -[EKSource setDisabled:](self, "setDisabled:", !a3);
}

- (BOOL)allowsTasks
{
  char v3;
  void *v4;
  BOOL v5;

  if ((CalIsReminderBridgeEnabled() & 1) != 0 || (v3 = 1, -[EKSource flag:](self, "flag:", 1)))
  {
    -[EKSource remAccountObjectID](self, "remAccountObjectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

    v3 = 0;
  }
  else
  {
    v5 = 0;
  }
  if (-[EKSource sourceType](self, "sourceType") == EKSourceTypeMobileMe || -[EKSource isDelegate](self, "isDelegate"))
    return 0;
  else
    return v5 | v3;
}

- (void)setAllowsTasks:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (CalIsReminderBridgeEnabled())
    {
      v4 = (void *)EKLogHandle;
      v5 = 1;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
      {
        v6 = v4;
        -[EKSource externalID](self, "externalID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8[0] = 67109378;
        v8[1] = 1;
        v9 = 2114;
        v10 = v7;
        _os_log_impl(&dword_1A2318000, v6, OS_LOG_TYPE_INFO, "Ignoring attempt to set allowsTasks to %d on source %{public}@. Forcing to NO", (uint8_t *)v8, 0x12u);

      }
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 1;
  }
  -[EKSource setFlag:value:](self, "setFlag:value:", 1, v5);
}

- (void)setAllowsEvents:(BOOL)a3
{
  -[EKSource setFlag:value:](self, "setFlag:value:", 2, !a3);
}

- (BOOL)allowsCalendarAddDeleteModify
{
  return !-[EKSource flag:](self, "flag:", 4);
}

- (void)setAllowsCalendarAddDeleteModify:(BOOL)a3
{
  -[EKSource setFlag:value:](self, "setFlag:value:", 4, !a3);
}

- (BOOL)supportsSharedCalendars
{
  return -[EKSource flag:](self, "flag:", 32);
}

- (void)setSupportsSharedCalendars:(BOOL)a3
{
  -[EKSource setFlag:value:](self, "setFlag:value:", 32, a3);
}

- (BOOL)supportsAlarmAcknowledgedDate
{
  return -[EKSource flag:](self, "flag:", 512);
}

- (void)setSupportsAlarmAcknowledgedDate:(BOOL)a3
{
  -[EKSource setFlag:value:](self, "setFlag:value:", 512, a3);
}

- (BOOL)supportsPrivateEvents
{
  return -[EKSource flag:](self, "flag:", 1024);
}

- (void)setSupportsPrivateEvents:(BOOL)a3
{
  -[EKSource setFlag:value:](self, "setFlag:value:", 1024, a3);
}

- (BOOL)prohibitsPrivateEventsWithAttendees
{
  return -[EKSource flag:](self, "flag:", 2048);
}

- (void)setProhibitsPrivateEventsWithAttendees:(BOOL)a3
{
  -[EKSource setFlag:value:](self, "setFlag:value:", 2048, a3);
}

- (BOOL)requiresSamePrivacyLevelAcrossRecurrenceSeries
{
  return -[EKSource flag:](self, "flag:", 0x2000);
}

- (void)setRequiresSamePrivacyLevelAcrossRecurrenceSeries:(BOOL)a3
{
  -[EKSource setFlag:value:](self, "setFlag:value:", 0x2000, a3);
}

- (BOOL)supportsAvailabilityRequests
{
  return -[EKSource flag:](self, "flag:", 4096);
}

- (void)setSupportsAvailabilityRequests:(BOOL)a3
{
  -[EKSource setFlag:value:](self, "setFlag:value:", 4096, a3);
}

- (BOOL)supportsIgnoringEventsInAvailabilityRequests
{
  return -[EKSource flag:](self, "flag:", 0x80000);
}

- (void)setSupportsIgnoringEventsInAvailabilityRequests:(BOOL)a3
{
  -[EKSource setFlag:value:](self, "setFlag:value:", 0x80000, a3);
}

- (BOOL)supportsLocationDirectorySearches
{
  return -[EKSource flag:](self, "flag:", 0x20000);
}

- (void)setSupportsLocationDirectorySearches:(BOOL)a3
{
  -[EKSource setFlag:value:](self, "setFlag:value:", 0x20000, a3);
}

- (BOOL)allowsProposeNewTime
{
  return -[EKSource flag:](self, "flag:", 0x400000);
}

- (void)setAllowsProposeNewTime:(BOOL)a3
{
  -[EKSource setFlag:value:](self, "setFlag:value:", 0x400000, a3);
}

- (BOOL)prohibitsICSImport
{
  return -[EKSource flag:](self, "flag:", 0x800000);
}

- (void)setProhibitsICSImport:(BOOL)a3
{
  -[EKSource setFlag:value:](self, "setFlag:value:", 0x800000, a3);
}

- (BOOL)prohibitsDetachmentOnCommentChange
{
  return -[EKSource flag:](self, "flag:", 0x40000);
}

- (void)setProhibitsDetachmentOnCommentChange:(BOOL)a3
{
  -[EKSource setFlag:value:](self, "setFlag:value:", 0x40000, a3);
}

- (BOOL)prohibitsMultipleDaysInMonthlyRecurrence
{
  return -[EKSource flag:](self, "flag:", 0x8000);
}

- (void)setProhibitsMultipleDaysInMonthlyRecurrence:(BOOL)a3
{
  -[EKSource setFlag:value:](self, "setFlag:value:", 0x8000, a3);
}

- (BOOL)prohibitsMultipleMonthsInYearlyRecurrence
{
  return -[EKSource flag:](self, "flag:", 0x4000);
}

- (void)setProhibitsMultipleMonthsInYearlyRecurrence:(BOOL)a3
{
  -[EKSource setFlag:value:](self, "setFlag:value:", 0x4000, a3);
}

- (BOOL)prohibitsYearlyRecurrenceInterval
{
  return -[EKSource flag:](self, "flag:", 0x10000);
}

- (void)setProhibitsYearlyRecurrenceInterval:(BOOL)a3
{
  -[EKSource setFlag:value:](self, "setFlag:value:", 0x10000, a3);
}

- (BOOL)supportsDelegation
{
  return -[EKSource flag:](self, "flag:", 0x20000000);
}

- (void)setSupportsDelegation:(BOOL)a3
{
  -[EKSource setFlag:value:](self, "setFlag:value:", 0x20000000, a3);
}

- (BOOL)supportsDelegateEnumeration
{
  return -[EKSource flag:](self, "flag:", 0x40000000);
}

- (void)setSupportsDelegateEnumeration:(BOOL)a3
{
  -[EKSource setFlag:value:](self, "setFlag:value:", 0x40000000, a3);
}

- (BOOL)prohibitsSlicingEventsWithAttendees
{
  return -[EKSource flag:](self, "flag:", 0x8000000);
}

- (void)setProhibitsSlicingEventsWithAttendees:(BOOL)a3
{
  -[EKSource setFlag:value:](self, "setFlag:value:", 0x8000000, a3);
}

- (BOOL)supportsEventForwarding
{
  return -[EKSource flag:](self, "flag:", 0x200000);
}

- (void)setSupportsEventForwarding:(BOOL)a3
{
  -[EKSource setFlag:value:](self, "setFlag:value:", 0x200000, a3);
}

- (BOOL)requiresOccurrencesConformToRecurrenceRule
{
  return -[EKSource flag:](self, "flag:", 0x100000);
}

- (void)setRequiresOccurrencesConformToRecurrenceRule:(BOOL)a3
{
  -[EKSource setFlag:value:](self, "setFlag:value:", 0x100000, a3);
}

- (BOOL)supportsAttachments
{
  return -[EKSource flag:](self, "flag:", 0x10000000);
}

- (void)setSupportsAttachments:(BOOL)a3
{
  -[EKSource setFlag:value:](self, "setFlag:value:", 0x10000000, a3);
}

- (BOOL)supportsClearingPrivateComments
{
  return -[EKSource flag:](self, "flag:", 0x20000);
}

- (void)setSupportsClearingPrivateComments:(BOOL)a3
{
  -[EKSource setFlag:value:](self, "setFlag:value:", 0x20000, a3);
}

- (BOOL)supportsPush
{
  return -[EKSource flag2:](self, "flag2:", 0x4000);
}

- (void)setSupportsPush:(BOOL)a3
{
  -[EKSource setFlag2:value:](self, "setFlag2:value:", 0x4000, a3);
}

- (BOOL)supportsTravelTime
{
  return -[EKSource flag2:](self, "flag2:", 0x8000);
}

- (void)setSupportsTravelTime:(BOOL)a3
{
  -[EKSource setFlag2:value:](self, "setFlag2:value:", 0x8000, a3);
}

- (BOOL)allowsPrivateEventAccessByDelegate
{
  return -[EKSource flag2:](self, "flag2:", 0x10000);
}

- (void)setAllowsPrivateEventAccessByDelegate:(BOOL)a3
{
  -[EKSource setFlag2:value:](self, "setFlag2:value:", 0x10000, a3);
}

- (BOOL)supportsInvitationModificationsWithoutNotification
{
  return -[EKSource flag2:](self, "flag2:", 128);
}

- (void)setSupportsInvitationModificationsWithoutNotification:(BOOL)a3
{
  -[EKSource setFlag2:value:](self, "setFlag2:value:", 128, a3);
}

- (void)setDelegatedAccountOwnerStoreID:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0BA20]);
}

- (BOOL)isFacebookSource
{
  return -[EKSource flag:](self, "flag:", 64);
}

- (NSSet)calendars
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[EKObject eventStore](self, "eventStore", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendars");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "source");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", self);

        if (v12)
          objc_msgSend(v3, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return (NSSet *)v3;
}

- (NSSet)allCalendars
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[EKObject eventStore](self, "eventStore", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_allCalendars");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "source");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", self);

        if (v12)
          objc_msgSend(v3, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return (NSSet *)v3;
}

- (id)calendarWithExternalIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[EKSource allCalendars](self, "allCalendars", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "externalID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  if ((unint64_t)objc_msgSend(v5, "count") >= 2 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    -[EKSource calendarWithExternalIdentifier:].cold.1();
  objc_msgSend(v5, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)removeCalendarItemsOlderThanDate:(id)a3 entityTypeMask:(unint64_t)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  if (a4 - 1 >= 3)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", 1001);
      v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v9 = dword_1A244A700[a4 - 1];
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__21;
    v22 = __Block_byref_object_dispose__21;
    v23 = 0;
    -[EKObject eventStore](self, "eventStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "CADOperationProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKObject CADObjectID](self, "CADObjectID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __66__EKSource_removeCalendarItemsOlderThanDate_entityTypeMask_error___block_invoke;
    v17[3] = &unk_1E4784F70;
    v17[4] = &v18;
    objc_msgSend(v12, "CADRemoveCalendarItemsOlderThanDate:ofType:inSource:reply:", v8, v9, v13, v17);

    v14 = (void *)v19[5];
    v15 = v14 == 0;
    if (a5 && v14)
      *a5 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v18, 8);

  }
  return v15;
}

void __66__EKSource_removeCalendarItemsOlderThanDate_entityTypeMask_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if ((_DWORD)a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", a2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (id)readWriteCalendarsForEntityType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[EKObject eventStore](self, "eventStore", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "calendarsForEntityType:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "source");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqual:", self))
        {
          v14 = objc_msgSend(v12, "allowsContentModifications");

          if (v14)
            objc_msgSend(v5, "addObject:", v12);
        }
        else
        {

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v5;
}

- (BOOL)supportsCalendarCreation
{
  void *v3;
  char v4;
  BOOL v5;

  if (-[EKSource sourceType](self, "sourceType") == (EKSourceTypeSubscribed|EKSourceTypeCalDAV))
  {
    -[EKObject eventStore](self, "eventStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "allowsIntegrationModifications");
  }
  else
  {
    -[EKSource _constraintsInternal](self, "_constraintsInternal");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "allowsCalendarAddDeleteModify");
  }
  v5 = v4;

  return v5;
}

- (BOOL)constraintSupportsAvailabilityRequests
{
  void *v2;
  char v3;

  -[EKSource _constraintsInternal](self, "_constraintsInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsAvailabilityRequests");

  return v3;
}

- (BOOL)supportsCalendarTaskCreation
{
  _BOOL4 v3;

  v3 = -[EKSource allowsTasks](self, "allowsTasks");
  if (v3)
    LOBYTE(v3) = -[EKSource supportsCalendarCreation](self, "supportsCalendarCreation");
  return v3;
}

- (void)countCalendarItemsWithResultHandler:(id)a3
{
  -[EKSource _countCalendarItemsOfCalType:resultHandler:](self, "_countCalendarItemsOfCalType:resultHandler:", 101, a3);
}

- (void)countCalendarItemsOfType:(unint64_t)a3 resultHandler:(id)a4
{
  unsigned int v4;
  uint64_t v5;

  if (a3 == 1)
    v4 = 3;
  else
    v4 = 0;
  if (a3)
    v5 = v4;
  else
    v5 = 2;
  -[EKSource _countCalendarItemsOfCalType:resultHandler:](self, "_countCalendarItemsOfCalType:resultHandler:", v5, a4);
}

- (void)_countCalendarItemsOfCalType:(int)a3 resultHandler:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[EKObject eventStore](self, "eventStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "CADOperationProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKObject CADObjectID](self, "CADObjectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__EKSource__countCalendarItemsOfCalType_resultHandler___block_invoke;
  v12[3] = &unk_1E4787C00;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v9, "CADCountCalendarItemsOfType:inSource:reply:", v4, v10, v12);

}

void __55__EKSource__countCalendarItemsOfCalType_resultHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  if ((_DWORD)a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (BOOL)supportsReminderActions
{
  void *v2;
  char v3;

  -[EKSource _constraintsInternal](self, "_constraintsInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsReminderActions");

  return v3;
}

- (id)_constraintsInternal
{
  void *v3;
  void *v4;

  -[EKObject eventStore](self, "eventStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachedConstraintsForSource:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (EKSourceConstraints)constraints
{
  void *v3;
  void *v4;

  -[EKObject eventStore](self, "eventStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachedConstraintsForSource:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (EKSourceConstraints *)v4;
}

- (int)displayOrderForNewCalendar
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[EKSource allCalendars](self, "allCalendars");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = -1;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((int)objc_msgSend(v8, "displayOrder") > v6)
          v6 = objc_msgSend(v8, "displayOrder");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v6 = -1;
  }

  return v6 + 1;
}

- (NSString)symbolicColorForNewCalendar
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[EKSource allCalendars](self, "allCalendars", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "symbolicColorName");
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          v12 = objc_msgSend(v9, "type");

          if (v12 != 4)
          {
            objc_msgSend(v9, "symbolicColorName");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v13);

          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0D0C410], "symbolicColorForNewCalendarWithExistingSymbolicNames:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
}

- (NSString)personaIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[EKObject objectID](self, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isTemporary") & 1) == 0)
  {
    -[EKObject eventStore](self, "eventStore");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "personaIdentifierForDatabaseID:", objc_msgSend(v3, "databaseID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

    goto LABEL_7;
  }
  -[EKSource pendingPersonaIdentifierForNewSource](self, "pendingPersonaIdentifierForNewSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if ((unint64_t)(-[EKSource sourceTypeRaw](self, "sourceTypeRaw") - 1) > 1)
    {
      v4 = 0;
      goto LABEL_7;
    }
    -[EKSource externalID](self, "externalID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D0C240], "personaIdentifierForAccountIdentifier:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v6;
    goto LABEL_6;
  }
LABEL_7:

  return (NSString *)v4;
}

- (void)fetchOfficeHoursWithCompletion:(id)a3 onQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  v7 = a4;
  -[EKSource externalID](self, "externalID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__EKSource_fetchOfficeHoursWithCompletion_onQueue___block_invoke;
  v11[3] = &unk_1E4787C28;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "fetchOfficeHoursForAccountWithID:queue:completionBlock:", v8, v7, v11);

}

void __51__EKSource_fetchOfficeHoursWithCompletion_onQueue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;
  id v8;

  v6 = *(void **)(a1 + 32);
  v7 = a4;
  objc_msgSend(v6, "_ekOfficeHoursFromCalDAVOfficeHours:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)_ekOfficeHoursFromCalDAVOfficeHours:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__EKSource__ekOfficeHoursFromCalDAVOfficeHours___block_invoke;
  v12[3] = &unk_1E4787C50;
  v13 = v5;
  v7 = v6;
  v14 = v7;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v12);

  v9 = v14;
  v10 = v7;

  return v10;
}

void __48__EKSource__ekOfficeHoursFromCalDAVOfficeHours___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  EKOfficeHour *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "endDate");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v5)
  {
    v9 = 0;
    v8 = 0;
    if (v6)
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "dateFromComponents:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(*(id *)(a1 + 32), "dateFromComponents:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v11 = -[EKOfficeHour initWithEnabled:weekday:startTime:endTime:timeZone:]([EKOfficeHour alloc], "initWithEnabled:weekday:startTime:endTime:timeZone:", objc_msgSend(v12, "enabled"), a3, v8, v10, v9);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);

}

- (void)setOfficeHours:(id)a3 withCompletion:(id)a4 onQueue:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a4;
  v9 = a5;
  -[EKSource _calDAVOfficeHoursFromEKOfficeHours:](self, "_calDAVOfficeHoursFromEKOfficeHours:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKSource externalID](self, "externalID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__EKSource_setOfficeHours_withCompletion_onQueue___block_invoke;
  v14[3] = &unk_1E4787C78;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v12, "setOfficeHours:forAccountWithID:queue:completionBlock:", v10, v11, v9, v14);

}

uint64_t __50__EKSource_setOfficeHours_withCompletion_onQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_calDAVOfficeHoursFromEKOfficeHours:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  id obj;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v19 = v3;
    obj = v3;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v5)
    {
      v6 = v5;
      v21 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v24 != v21)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          v9 = objc_alloc_init(MEMORY[0x1E0D1C3D8]);
          objc_msgSend(v9, "setEnabled:", objc_msgSend(v8, "enabled"));
          objc_msgSend(v8, "startTime");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v8, "startTime");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "components:fromDate:", 608, v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v8, "timeZone");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setTimeZone:", v13);

          }
          else
          {
            v12 = 0;
          }
          objc_msgSend(v8, "endTime", v19);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v8, "endTime");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "components:fromDate:", 608, v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v8, "timeZone");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setTimeZone:", v17);

          }
          else
          {
            v16 = 0;
          }
          objc_msgSend(v9, "setStartDate:", v12);
          objc_msgSend(v9, "setEndDate:", v16);
          objc_msgSend(v22, "addObject:", v9);

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v6);
    }

    v3 = v19;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)_nsErrorFromSyncError:(id)a3 event:(id)a4
{
  id v6;
  EKSource *v7;
  uint64_t v8;
  __CFString **v9;
  __CFString *v10;
  EKSource *v11;
  EKSource *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = (EKSource *)a4;
  if (v6
    && (objc_msgSend(v6, "errorType") || objc_msgSend(v6, "errorCode"))
    && (objc_msgSend(v6, "errorType") != 1 || objc_msgSend(v6, "errorCode")))
  {
    v8 = objc_msgSend(v6, "errorType");
    v9 = kEKCalendarItemErrorDomain;
    if (!v8)
      v9 = kEKAccountErrorDomain;
    v10 = *v9;
    if (v7)
      v11 = v7;
    else
      v11 = self;
    v12 = v11;
    objc_msgSend(v6, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[EKSyncError augmentSyncErrorUserInfo:for:](EKSyncError, "augmentSyncErrorUserInfo:for:", v13, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v10, objc_msgSend(v6, "errorCode"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NSError)sourceError
{
  void *v3;
  void *v4;

  -[EKSource syncError](self, "syncError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKSource _nsErrorFromSyncError:event:](self, "_nsErrorFromSyncError:event:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSError *)v4;
}

- (NSError)sourceOrEventError
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[EKSource sourceError](self, "sourceError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[EKObject eventStore](self, "eventStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "eventsWithErrorsPerSourceID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKObject objectID](self, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "syncError");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKSource _nsErrorFromSyncError:event:](self, "_nsErrorFromSyncError:event:", v10, v9);
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

  }
  return (NSError *)v5;
}

- (void)setLastSyncError:(unint64_t)a3 userInfo:(id)a4
{
  id v6;
  EKSyncError *v7;
  id v8;

  v6 = a4;
  v8 = v6;
  if (a3 || v6)
  {
    v7 = -[EKSyncError initWithAccountError:userInfo:]([EKSyncError alloc], "initWithAccountError:userInfo:", a3, v6);
    -[EKSource setSyncError:](self, "setSyncError:", v7);

  }
  else
  {
    -[EKSource setSyncError:](self, "setSyncError:", 0);
  }

}

- (NSDictionary)lastSyncErrorUserInfo
{
  void *v2;
  void *v3;

  -[EKSource syncError](self, "syncError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)setSyncError:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = *MEMORY[0x1E0D0BAA8];
  v5 = a3;
  -[EKObject updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:](self, "updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:", v5, v4, +[EKSyncError frozenClass](EKSyncError, "frozenClass"));

}

- (void)setLastSyncStartDate:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0BA58]);
}

- (void)setLastSyncEndDate:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0BA50]);
}

- (BOOL)syncs
{
  return (unint64_t)(-[EKSource sourceType](self, "sourceType") - 1) < 4;
}

- (int)displayOrder
{
  void *v2;
  int v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0BA30]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (void)setDisplayOrder:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0BA30]);

}

- (NSString)ownerName
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0BA78]);
}

- (void)setOwnerName:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0BA78]);
}

+ (id)primaryLocalSourceID
{
  return +[EKObjectID objectIDWithEntityType:rowID:databaseID:](EKObjectID, "objectIDWithEntityType:rowID:databaseID:", 6, 1, *MEMORY[0x1E0D0BE78]);
}

- (BOOL)isPrimaryLocalSource
{
  void *v2;
  void *v3;
  char v4;

  -[EKObject objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "primaryLocalSourceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

- (BOOL)isNestedLocalSource
{
  if (-[EKSource sourceType](self, "sourceType"))
    return 0;
  else
    return !-[EKSource isPrimaryLocalSource](self, "isPrimaryLocalSource");
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
  -[EKSource sourceIdentifier](self, "sourceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = description_kTypeStrings[-[EKSource sourceType](self, "sourceType")];
  -[EKSource title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKSource externalID](self, "externalID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%p> {UUID = %@; type = %@; title = %@; externalID = %@}"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_validateClientCanModifySources:(id *)a3
{
  void *v4;
  char v5;

  -[EKObject eventStore](self, "eventStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "clientCanModifySources");

  if (a3 && (v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 58);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)validate:(id *)a3
{
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  if (!-[EKObject isNew](self, "isNew"))
  {
    v5 = *MEMORY[0x1E0D0BA18];
    v13[0] = *MEMORY[0x1E0D0BA10];
    v13[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[EKObject hasUnsavedChangesIgnoreKeys:](self, "hasUnsavedChangesIgnoreKeys:", v6);

    if (!v7)
      goto LABEL_5;
  }
  v8 = -[EKSource _validateClientCanModifySources:](self, "_validateClientCanModifySources:", a3);
  if (v8)
  {
    -[EKSource sourceIdentifier](self, "sourceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
LABEL_5:
      LOBYTE(v8) = 1;
      return v8;
    }
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 65);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v8) = 0;
      *a3 = v11;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  return v8;
}

- (BOOL)_shouldCopyDefaultAlarmsFromLocalSource
{
  return 0;
}

- (void)_copyInitialDefaultAlarmSettingsIfNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  if (-[EKSource _shouldCopyDefaultAlarmsFromLocalSource](self, "_shouldCopyDefaultAlarmsFromLocalSource"))
  {
    -[EKSource defaultAlarmOffset](self, "defaultAlarmOffset");
    v8 = objc_claimAutoreleasedReturnValue();
    -[EKSource defaultAllDayAlarmOffset](self, "defaultAllDayAlarmOffset");
    v3 = objc_claimAutoreleasedReturnValue();
    if (!(v8 | v3))
    {
      -[EKObject eventStore](self, "eventStore");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "defaultTimedAlarmOffset");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKSource setDefaultAlarmOffset:](self, "setDefaultAlarmOffset:", v5);

      -[EKObject eventStore](self, "eventStore");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "defaultAllDayAlarmOffset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKSource setDefaultAllDayAlarmOffset:](self, "setDefaultAllDayAlarmOffset:", v7);

    }
  }
}

- (BOOL)save:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL4 v8;
  void *v9;
  __int16 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  int v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    *a3 = 0;
  v4 = *MEMORY[0x1E0D0BA48];
  v15[0] = *MEMORY[0x1E0D0BA48];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[EKObject hasUnsavedChangesInKeys:](self, "hasUnsavedChangesInKeys:", v5))
    goto LABEL_6;
  v14 = *MEMORY[0x1E0D0BA28];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[EKObject hasUnsavedChangesInKeys:](self, "hasUnsavedChangesInKeys:", v6))
  {

LABEL_6:
    goto LABEL_7;
  }
  v8 = -[EKSource isDelegate](self, "isDelegate");

  if (v8)
  {
    -[EKObject _previousValueForKey:](self, "_previousValueForKey:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "intValue");

    v11 = -[EKSource isInMainWindow](self, "isInMainWindow");
    v12 = -[EKSource isInSeparateWindow](self, "isInSeparateWindow");
    if (((v10 & 0x100) == 0) == v11 || ((((v10 & 0x200) == 0) ^ v12) & 1) == 0)
    {
      v13 = v11 || v12;
      if ((v11 || v12) == -[EKSource disabled](self, "disabled"))
        -[EKSource setDisabled:](self, "setDisabled:", v13 ^ 1u);
    }
  }
LABEL_7:
  -[EKSource _copyInitialDefaultAlarmSettingsIfNeeded](self, "_copyInitialDefaultAlarmSettingsIfNeeded");
  -[EKObject insertPersistentObjectIfNeeded](self, "insertPersistentObjectIfNeeded");
  -[EKObject updatePersistentObject](self, "updatePersistentObject");
  return 1;
}

- (BOOL)remove:(id *)a3
{
  char v5;
  void *v6;
  char isKindOfClass;

  if (!-[EKSource _validateClientCanModifySources:](self, "_validateClientCanModifySources:"))
    goto LABEL_5;
  if (-[EKSource isPrimaryLocalSource](self, "isPrimaryLocalSource"))
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 59);
      v5 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return v5 & 1;
    }
LABEL_5:
    v5 = 0;
    return v5 & 1;
  }
  -[EKObject backingObject](self, "backingObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 68);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (a3)
      *a3 = 0;
    -[EKObject deletePersistentObject](self, "deletePersistentObject");
  }
  v5 = isKindOfClass ^ 1;

  return v5 & 1;
}

- (BOOL)wantsCommentPromptWhenDeclining
{
  return -[EKSource sourceType](self, "sourceType") == EKSourceTypeExchange;
}

- (id)availabilityCache
{
  EKSource *v2;
  EKAvailabilityCache *v3;
  EKAvailabilityCache *availabilityCache;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_availabilityCache)
  {
    v3 = -[EKAvailabilityCache initWithSource:]([EKAvailabilityCache alloc], "initWithSource:", v2);
    availabilityCache = v2->_availabilityCache;
    v2->_availabilityCache = v3;

  }
  objc_sync_exit(v2);

  return v2->_availabilityCache;
}

- (id)cachedExternalInfoData
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B9E8]);
}

- (void)setCachedExternalInfoData:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B9E8]);
}

- (NSDictionary)cachedExternalInfo
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __30__EKSource_cachedExternalInfo__block_invoke;
  v3[3] = &unk_1E4784B98;
  v3[4] = self;
  -[EKObject cachedValueForKey:populateBlock:](self, "cachedValueForKey:populateBlock:", CFSTR("cachedExternalInfoDictionary"), v3);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

id __30__EKSource_cachedExternalInfo__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "cachedExternalInfoData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v2, 0, 0, &v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v8;
    if (v3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "_convertTypeOfOwnerAddresses:toSet:", v3, 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

        goto LABEL_12;
      }
      v6 = (void *)EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        __30__EKSource_cachedExternalInfo__block_invoke_cold_2(v6);
    }
    else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    {
      __32__EKCalendar_cachedExternalInfo__block_invoke_cold_1();
    }
    v5 = 0;
    goto LABEL_11;
  }
  v5 = 0;
LABEL_12:

  return v5;
}

- (void)setCachedExternalInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;

  v4 = a3;
  if (!v4)
  {
    v8 = 0;
    goto LABEL_5;
  }
  v5 = (void *)MEMORY[0x1E0CB38B0];
  -[EKSource _convertTypeOfOwnerAddresses:toSet:](self, "_convertTypeOfOwnerAddresses:toSet:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v5, "dataWithPropertyList:format:options:error:", v6, 200, 0, &v10);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v10;

  if (v7)
  {

    v8 = (id)v7;
LABEL_5:
    -[EKSource _convertTypeOfOwnerAddresses:toSet:](self, "_convertTypeOfOwnerAddresses:toSet:", v4, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKObject setCachedValue:forKey:](self, "setCachedValue:forKey:", v9, CFSTR("cachedExternalInfoDictionary"));

    -[EKSource setCachedExternalInfoData:](self, "setCachedExternalInfoData:", v8);
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    -[EKCalendar setCachedExternalInfo:].cold.1();
LABEL_8:

}

- (id)_convertTypeOfOwnerAddresses:(id)a3 toSet:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v5 = a3;
  v6 = *MEMORY[0x1E0D0B9C0];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D0B9C0]);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_opt_class();
    if (((objc_opt_isKindOfClass() ^ v4) & 1) != 0)
    {
      if (v4)
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
      else
        objc_msgSend(v8, "allObjects");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)objc_msgSend(v5, "mutableCopy");
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, v6);

    }
    else
    {
      v9 = (void *)objc_msgSend(v5, "copy");

    }
  }
  else
  {
    v9 = (void *)objc_msgSend(v5, "copy");
  }

  return v9;
}

- (void)_resetInternalStateWithForce:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[EKObject clearCachedValueForKey:](self, "clearCachedValueForKey:", CFSTR("cachedExternalInfoDictionary"));
  v5.receiver = self;
  v5.super_class = (Class)EKSource;
  -[EKObject _resetInternalStateWithForce:](&v5, sel__resetInternalStateWithForce_, v3);
}

- (NSURL)serverURL
{
  void *v3;
  int64_t v4;
  _BOOL4 v5;
  id v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  -[EKSource serverHost](self, "serverHost");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[EKSource serverPort](self, "serverPort");
    v5 = -[EKSource serverUsesSSL](self, "serverUsesSSL");
    v6 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v6, "setHost:", v3);
    v7 = 80;
    if (v5)
      v7 = 443;
    if (v4 != v7)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPort:", v8);

    }
    if (v5)
      v9 = CFSTR("https");
    else
      v9 = CFSTR("http");
    objc_msgSend(v6, "setScheme:", v9);
    objc_msgSend(v6, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return (NSURL *)v10;
}

- (id)externalInfoForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[EKSource cachedExternalInfo](self, "cachedExternalInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)serverHost
{
  return (NSString *)-[EKSource externalInfoForKey:](self, "externalInfoForKey:", *MEMORY[0x1E0D0B9B0]);
}

- (int64_t)serverPort
{
  void *v2;
  int64_t v3;

  -[EKSource externalInfoForKey:](self, "externalInfoForKey:", *MEMORY[0x1E0D0B9C8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (BOOL)serverUsesSSL
{
  void *v2;
  char v3;

  -[EKSource externalInfoForKey:](self, "externalInfoForKey:", *MEMORY[0x1E0D0B9D8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSSet)ownerAddresses
{
  return (NSSet *)-[EKSource externalInfoForKey:](self, "externalInfoForKey:", *MEMORY[0x1E0D0B9C0]);
}

- (NSString)preferredOwnerAddress
{
  return (NSString *)-[EKSource externalInfoForKey:](self, "externalInfoForKey:", *MEMORY[0x1E0D0B9D0]);
}

- (BOOL)isPrimaryAppleAccount
{
  void *v2;
  char v3;

  -[EKSource externalInfoForKey:](self, "externalInfoForKey:", *MEMORY[0x1E0D0B9B8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isWritable
{
  return !-[EKSource readOnly](self, "readOnly")
      && (-[EKSource managedConfigurationAccountAccess](self, "managedConfigurationAccountAccess") & 0xFFFFFFFD) != 1;
}

- (BOOL)isReadable
{
  return (-[EKSource managedConfigurationAccountAccess](self, "managedConfigurationAccountAccess") & 0xFFFFFFFE) != 2;
}

- (BOOL)readOnly
{
  return -[EKSource flag:](self, "flag:", 0x80000000);
}

- (void)setReadOnly:(BOOL)a3
{
  -[EKSource setFlag:value:](self, "setFlag:value:", 0x80000000, a3);
}

- (int)managedConfigurationAccountAccess
{
  void *v2;
  int v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0BA60]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (BOOL)supportsEventCalendarCreation
{
  _BOOL4 v3;

  v3 = -[EKSource supportsCalendarCreation](self, "supportsCalendarCreation");
  if (v3)
    LOBYTE(v3) = -[EKSource allowsEvents](self, "allowsEvents");
  return v3;
}

- (BOOL)refresh
{
  return -[EKObject isNew](self, "isNew") || -[EKObject _refreshCommon](self, "_refreshCommon");
}

- (BOOL)_reset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[EKObject eventStore](self, "eventStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKSource sourceIdentifier](self, "sourceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "backingObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKObject _resetWithFrozenObject:](self, "_resetWithFrozenObject:", v6);

  }
  return v5 != 0;
}

- (BOOL)supportsTaskCalendarCreation
{
  return self->_supportsTaskCalendarCreation;
}

- (BOOL)isFacebook
{
  return self->_isFacebook;
}

- (void)setIsFacebook:(BOOL)a3
{
  self->_isFacebook = a3;
}

- (BOOL)snoozeAlarmRequiresDetach
{
  return self->_snoozeAlarmRequiresDetach;
}

- (void)setSnoozeAlarmRequiresDetach:(BOOL)a3
{
  self->_snoozeAlarmRequiresDetach = a3;
}

- (BOOL)supportsAvailability
{
  return self->_supportsAvailability;
}

+ (void)sourceWithEventStore:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A2318000, log, OS_LOG_TYPE_ERROR, "API MISUSE: nil event store used in initialization of EKSource instance", v1, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)_ekPrivacyLevelToCalEventPrivacyLevel:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A2318000, a2, a3, "Unexpected EKPrivacyLevel: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

+ (void)_calEventPrivacyLevelToEKPrivacyLevel:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A2318000, a2, a3, "Unexpected CalEventPrivacyLevel: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)setConstraintsName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_6(&dword_1A2318000, v0, v1, "Attempting to set a path (%{public}@) with -[EKSource setConstraintsName:]. Only the name should be supplied without an extension.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setConstraintsName:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_6(&dword_1A2318000, v0, v1, "Attempting to set a file name with .plist extension (%{public}@) with -[EKSource setConstraintsName:]. Only the name should be supplied without an extension.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setConstraintsName:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_6(&dword_1A2318000, v0, v1, "Attempting to set an unrecognized constraints name (%{public}@) with -[EKSource setConstraintsName:]. The given name should be a valid .plist resource in CalendarFoundation.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)calendarWithExternalIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Source has more than one calendar with the same external Id: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __30__EKSource_cachedExternalInfo__block_invoke_cold_2(void *a1)
{
  NSObject *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  OUTLINED_FUNCTION_3();
  v3 = v2;
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v1, v4, "Unexpected type for external info: %{public}@", v5);

}

@end
