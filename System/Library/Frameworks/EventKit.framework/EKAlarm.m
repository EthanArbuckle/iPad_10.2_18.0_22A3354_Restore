@implementation EKAlarm

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)knownRelationshipSingleValueKeys
{
  if (knownRelationshipSingleValueKeys_onceToken_4 != -1)
    dispatch_once(&knownRelationshipSingleValueKeys_onceToken_4, &__block_literal_global_65);
  return (id)knownRelationshipSingleValueKeys_keys_4;
}

void __43__EKAlarm_knownRelationshipSingleValueKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0D0B1A0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)knownRelationshipSingleValueKeys_keys_4;
  knownRelationshipSingleValueKeys_keys_4 = v0;

}

+ (id)knownRelationshipMultiValueKeys
{
  if (knownRelationshipMultiValueKeys_onceToken_4 != -1)
    dispatch_once(&knownRelationshipMultiValueKeys_onceToken_4, &__block_literal_global_9_1);
  return (id)knownRelationshipMultiValueKeys_keys_4;
}

void __42__EKAlarm_knownRelationshipMultiValueKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0D0B198];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)knownRelationshipMultiValueKeys_keys_4;
  knownRelationshipMultiValueKeys_keys_4 = v0;

}

+ (id)knownIdentityKeysForComparison
{
  if (knownIdentityKeysForComparison_onceToken_8 != -1)
    dispatch_once(&knownIdentityKeysForComparison_onceToken_8, &__block_literal_global_10);
  return (id)knownIdentityKeysForComparison_keys_8;
}

void __41__EKAlarm_knownIdentityKeysForComparison__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0D0B820];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)knownIdentityKeysForComparison_keys_8;
  knownIdentityKeysForComparison_keys_8 = v0;

}

+ (id)knownSingleValueKeysForComparison
{
  if (knownSingleValueKeysForComparison_onceToken_7 != -1)
    dispatch_once(&knownSingleValueKeysForComparison_onceToken_7, &__block_literal_global_11_1);
  return (id)knownSingleValueKeysForComparison_keys_7;
}

void __44__EKAlarm_knownSingleValueKeysForComparison__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[9];

  v6[8] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B150];
  v6[0] = *MEMORY[0x1E0D0B148];
  v6[1] = v0;
  v1 = *MEMORY[0x1E0D0B178];
  v6[2] = *MEMORY[0x1E0D0B1A8];
  v6[3] = v1;
  v2 = *MEMORY[0x1E0D0B190];
  v6[4] = *MEMORY[0x1E0D0B188];
  v6[5] = v2;
  v3 = *MEMORY[0x1E0D0B1B0];
  v6[6] = *MEMORY[0x1E0D0B168];
  v6[7] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 8);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)knownSingleValueKeysForComparison_keys_7;
  knownSingleValueKeysForComparison_keys_7 = v4;

}

+ (id)knownRelationshipWeakKeys
{
  if (knownRelationshipWeakKeys_onceToken_5 != -1)
    dispatch_once(&knownRelationshipWeakKeys_onceToken_5, &__block_literal_global_12_1);
  return (id)knownRelationshipWeakKeys_keys_5;
}

void __36__EKAlarm_knownRelationshipWeakKeys__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B158];
  v3[0] = *MEMORY[0x1E0D0B160];
  v3[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)knownRelationshipWeakKeys_keys_5;
  knownRelationshipWeakKeys_keys_5 = v1;

}

+ (EKAlarm)alarmWithAbsoluteDate:(NSDate *)date
{
  NSDate *v4;
  void *v5;

  v4 = date;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAbsoluteDate:", v4);

  return (EKAlarm *)v5;
}

+ (EKAlarm)alarmWithRelativeOffset:(NSTimeInterval)offset
{
  return (EKAlarm *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithRelativeOffset:", offset);
}

+ (int64_t)maxPublicProximity
{
  return 2;
}

- (EKAlarm)init
{
  EKAlarm *v2;
  EKAlarm *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKAlarm;
  v2 = -[EKObject init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[EKAlarm setType:](v2, "setType:", 0);
    EKUUIDString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKAlarm setUUID:](v3, "setUUID:", v4);

    -[EKAlarm UUID](v3, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKAlarm setExternalID:](v3, "setExternalID:", v5);

    -[EKObject updatePersistentValueForKeyIfNeeded:](v3, "updatePersistentValueForKeyIfNeeded:", *MEMORY[0x1E0D0B820]);
  }
  return v3;
}

- (EKAlarm)initWithAbsoluteDate:(id)a3
{
  id v5;
  EKAlarm *v6;
  EKAlarm *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKAlarm.m"), 138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date != nil"));

  }
  v6 = -[EKAlarm init](self, "init");
  v7 = v6;
  if (v6)
    -[EKAlarm setAbsoluteDate:](v6, "setAbsoluteDate:", v5);

  return v7;
}

- (EKAlarm)initWithRelativeOffset:(double)a3
{
  EKAlarm *v4;
  EKAlarm *v5;

  v4 = -[EKAlarm init](self, "init");
  v5 = v4;
  if (v4)
    -[EKAlarm setRelativeOffset:](v4, "setRelativeOffset:", a3);
  return v5;
}

- (EKObject)owner
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[EKAlarm calendarItemOwner](self, "calendarItemOwner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[EKAlarm calendarOwner](self, "calendarOwner");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (EKObject *)v6;
}

- (EKCalendarItem)calendarItemOwner
{
  return (EKCalendarItem *)-[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", *MEMORY[0x1E0D0B158]);
}

- (EKCalendar)calendarOwner
{
  return (EKCalendar *)-[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", *MEMORY[0x1E0D0B160]);
}

- (NSString)UUID
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B820]);
}

- (void)setUUID:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B820]);
}

- (void)rebaseForDetachment
{
  id v3;

  -[EKAlarm UUID](self, "UUID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject rebase](self, "rebase");
  -[EKAlarm setExternalID:](self, "setExternalID:", v3);
  -[EKAlarm setUUID:](self, "setUUID:", v3);
  -[EKObject updatePersistentValueForKeyIfNeeded:](self, "updatePersistentValueForKeyIfNeeded:", *MEMORY[0x1E0D0B820]);

}

- (EKAlarmType)type
{
  void *v2;
  EKAlarmType v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B1A8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)_setType:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B1A8]);

}

- (void)setType:(int64_t)a3
{
  if (a3 == 3 || (-[EKAlarm _setEmailAddress:](self, "_setEmailAddress:", 0), a3 != 2))
    -[EKAlarm _setUrlWrapper:](self, "_setUrlWrapper:", 0);
  -[EKAlarm _setType:](self, "_setType:", a3);
}

- (id)relativeOffsetRaw
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B190]);
}

- (void)setRelativeOffsetRaw:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = *MEMORY[0x1E0D0B148];
  v5 = a3;
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", 0, v4);
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v5, *MEMORY[0x1E0D0B190]);

}

- (NSTimeInterval)relativeOffset
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  if (!-[EKAlarm isDefaultAlarm](self, "isDefaultAlarm"))
    goto LABEL_7;
  -[EKAlarm calendarItemOwner](self, "calendarItemOwner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (objc_msgSend(v3, "defaultAlarms"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "anyObject"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {

LABEL_7:
    -[EKAlarm relativeOffsetRaw](self, "relativeOffsetRaw");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleValue");
    v7 = v8;
    goto LABEL_8;
  }
  objc_msgSend(v5, "relativeOffset");
  v7 = v6;

LABEL_8:
  return v7;
}

- (void)setRelativeOffset:(NSTimeInterval)relativeOffset
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", relativeOffset);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKAlarm setRelativeOffsetRaw:](self, "setRelativeOffsetRaw:", v4);

}

- (NSDate)absoluteDate
{
  return (NSDate *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B148]);
}

- (void)setAbsoluteDate:(NSDate *)absoluteDate
{
  NSDate *v4;
  NSDate *v5;
  void *v6;
  double v7;
  void *v8;
  NSDate *v9;

  v9 = absoluteDate;
  -[EKAlarm absoluteDate](self, "absoluteDate");
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue();

  v5 = v9;
  if (v4 != v9)
  {
    -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", 0, *MEMORY[0x1E0D0B190]);
    if (v9)
    {
      v6 = (void *)MEMORY[0x1E0C99D68];
      -[NSDate timeIntervalSinceReferenceDate](v9, "timeIntervalSinceReferenceDate");
      objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:", floor(v7));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v8, *MEMORY[0x1E0D0B148]);

    v5 = v9;
  }

}

- (id)acknowledgedDate
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B150]);
}

- (void)setAcknowledgedDate:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B150]);
}

- (NSString)externalID
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B820]);
}

- (void)setExternalID:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B820]);
}

- (BOOL)isAbsolute
{
  void *v2;
  BOOL v3;

  -[EKAlarm absoluteDate](self, "absoluteDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setProximity:(EKAlarmProximity)proximity
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", proximity);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B188]);

}

- (EKAlarmProximity)proximity
{
  void *v2;
  EKAlarmProximity v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B188]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setStructuredLocation:(EKStructuredLocation *)structuredLocation
{
  uint64_t v4;
  EKStructuredLocation *v5;

  v4 = *MEMORY[0x1E0D0B1A0];
  v5 = structuredLocation;
  -[EKObject updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:](self, "updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:", v5, v4, +[EKStructuredLocation frozenClass](EKStructuredLocation, "frozenClass"));

}

- (EKStructuredLocation)structuredLocation
{
  return (EKStructuredLocation *)-[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", *MEMORY[0x1E0D0B1A0]);
}

- (id)ownerUUID
{
  void *v2;
  void *v3;

  -[EKAlarm calendarItemOwner](self, "calendarItemOwner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calendarItemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isDefaultAlarm
{
  void *v2;
  char v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B178]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setDefaultAlarm:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B178]);

}

- (EKAlarm)originalAlarm
{
  return (EKAlarm *)-[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", *MEMORY[0x1E0D0B180]);
}

- (void)setOriginalAlarm:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = *MEMORY[0x1E0D0B180];
  v5 = a3;
  -[EKObject updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:](self, "updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:", v5, v4, +[EKAlarm frozenClass](EKAlarm, "frozenClass"));

}

- (id)snoozedAlarmsSet
{
  return -[EKObject cachedMeltedObjectsForMultiValueKey:](self, "cachedMeltedObjectsForMultiValueKey:", *MEMORY[0x1E0D0B198]);
}

- (void)setSnoozedAlarmsSet:(id)a3
{
  -[EKObject updateMeltedAndCachedMultiRelationObjects:forKey:](self, "updateMeltedAndCachedMultiRelationObjects:forKey:", a3, *MEMORY[0x1E0D0B198]);
}

- (NSArray)snoozedAlarms
{
  void *v2;
  void *v3;

  -[EKAlarm snoozedAlarmsSet](self, "snoozedAlarmsSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setSnoozedAlarms:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKAlarm setSnoozedAlarmsSet:](self, "setSnoozedAlarmsSet:", v4);

}

- (void)addSnoozedAlarm:(id)a3
{
  -[EKObject addCachedMeltedObject:forMultiValueKey:](self, "addCachedMeltedObject:forMultiValueKey:", a3, *MEMORY[0x1E0D0B198]);
}

- (void)removeSnoozedAlarm:(id)a3
{
  -[EKObject removeCachedMeltedObject:forMultiValueKey:](self, "removeCachedMeltedObject:forMultiValueKey:", a3, *MEMORY[0x1E0D0B198]);
}

- (BOOL)isSnoozed
{
  void *v2;
  BOOL v3;

  -[EKAlarm originalAlarm](self, "originalAlarm");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_setEmailAddress:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B168]);
}

- (void)setEmailAddress:(NSString *)emailAddress
{
  uint64_t v5;
  NSString *v6;

  v6 = emailAddress;
  if (emailAddress)
    v5 = 3;
  else
    v5 = 0;
  -[EKAlarm setType:](self, "setType:", v5);
  -[EKAlarm _setEmailAddress:](self, "_setEmailAddress:", v6);

}

- (NSString)emailAddress
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B168]);
}

- (id)urlWrapper
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B1B0]);
}

- (void)_setUrlWrapper:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B1B0]);
}

- (void)setUrlWrapper:(id)a3
{
  _BOOL4 v4;
  id v5;

  v4 = a3 != 0;
  v5 = a3;
  -[EKAlarm setType:](self, "setType:", 2 * v4);
  -[EKAlarm _setUrlWrapper:](self, "_setUrlWrapper:", v5);

}

- (void)setBookmarkURL:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0CB3910];
    v5 = a3;
    v6 = (id)objc_msgSend([v4 alloc], "initWithURL:readonly:", v5, 1);

  }
  else
  {
    v6 = 0;
  }
  -[EKAlarm setUrlWrapper:](self, "setUrlWrapper:", v6);

}

- (id)bookmarkURL
{
  void *v2;
  void *v3;

  -[EKAlarm urlWrapper](self, "urlWrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setUrl:(NSURL *)url
{
  objc_class *v4;
  NSURL *v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0CB3910];
  v5 = url;
  v6 = (id)objc_msgSend([v4 alloc], "initWithURL:readonly:", v5, 1);

  -[EKAlarm setUrlWrapper:](self, "setUrlWrapper:", v6);
}

- (NSURL)url
{
  void *v2;
  void *v3;

  -[EKAlarm urlWrapper](self, "urlWrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  EKAlarm *v5;
  _BOOL4 v6;
  EKAlarm *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  if (objc_msgSend(MEMORY[0x1E0D0C278], "isProgramSDKAtLeast:", 0x7E30901FFFFFFFFLL))
  {
    v12.receiver = self;
    v12.super_class = (Class)EKAlarm;
    return -[EKObject copyWithZone:](&v12, sel_copyWithZone_, a3);
  }
  else
  {
    v6 = -[EKAlarm isAbsolute](self, "isAbsolute");
    v7 = [EKAlarm alloc];
    if (v6)
    {
      -[EKAlarm absoluteDate](self, "absoluteDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[EKAlarm initWithAbsoluteDate:](v7, "initWithAbsoluteDate:", v8);

    }
    else
    {
      -[EKAlarm relativeOffset](self, "relativeOffset");
      v5 = -[EKAlarm initWithRelativeOffset:](v7, "initWithRelativeOffset:");
    }
    -[EKAlarm structuredLocation](self, "structuredLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    -[EKAlarm setStructuredLocation:](v5, "setStructuredLocation:", v10);

    -[EKAlarm setProximity:](v5, "setProximity:", -[EKAlarm proximity](self, "proximity"));
    -[EKAlarm setType:](v5, "setType:", -[EKAlarm type](self, "type"));
  }
  return v5;
}

- (id)description
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = -[EKAlarm isAbsolute](self, "isAbsolute");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  if (v3)
  {
    -[EKAlarm absoluteDate](self, "absoluteDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ <%p> {triggerDate = %@}"), v5, self, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[EKAlarm relativeOffset](self, "relativeOffset");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ <%p> {triggerInterval = %lf}"), v5, self, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (BOOL)validateWithOwner:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)EKAlarm;
  if (!-[EKObject validateWithOwner:error:](&v19, sel_validateWithOwner_error_, v6, a4))
    goto LABEL_22;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "constraints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "supportsAlarmProximity");

    if ((v8 & 1) != 0)
      goto LABEL_18;
LABEL_11:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v6, "_hasChangesForKey:", *MEMORY[0x1E0D0B280]))
      {
        objc_msgSend(v6, "committedConstraints");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "supportsAlarmProximity");

        if ((v14 & 1) != 0)
          goto LABEL_18;
      }
    }
    if (-[EKAlarm proximity](self, "proximity") == EKAlarmProximityNone)
    {
      -[EKAlarm structuredLocation](self, "structuredLocation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        goto LABEL_18;
    }
    if (a4)
    {
      v16 = 21;
LABEL_21:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", v16);
      v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "calendar");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_19;
    v9 = v6;
  }
  v10 = v9;
  if (!v9)
  {
LABEL_19:
    if (a4)
    {
      v16 = 1;
      goto LABEL_21;
    }
LABEL_22:
    v17 = 0;
    goto LABEL_23;
  }
  objc_msgSend(v9, "constraints");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "supportsAlarmProximity");

  if ((v12 & 1) == 0)
    goto LABEL_11;
LABEL_18:
  v17 = 1;
LABEL_23:

  return v17;
}

- (int64_t)compare:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;

  v4 = a3;
  if (-[EKObject isEqual:](self, "isEqual:", v4))
  {
    v5 = 0;
    goto LABEL_17;
  }
  -[EKAlarm absoluteDate](self, "absoluteDate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v4, "absoluteDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[EKAlarm absoluteDate](self, "absoluteDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "absoluteDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v9, "compare:", v10);
LABEL_10:

      goto LABEL_17;
    }
  }
  -[EKAlarm relativeOffset](self, "relativeOffset");
  v12 = v11;
  objc_msgSend(v4, "relativeOffset");
  if (vabdd_f64(v12, v13) >= 2.22044605e-16)
  {
    -[EKAlarm relativeOffset](self, "relativeOffset");
    v20 = v19;
    objc_msgSend(v4, "relativeOffset");
    if (v20 <= v21)
      v5 = 1;
    else
      v5 = -1;
  }
  else
  {
    -[EKAlarm structuredLocation](self, "structuredLocation");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      objc_msgSend(v4, "structuredLocation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[EKAlarm structuredLocation](self, "structuredLocation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "title");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "structuredLocation");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "title");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v10, "compare:", v18);

        goto LABEL_10;
      }
    }
    -[EKAlarm structuredLocation](self, "structuredLocation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v5 = -1;
    }
    else
    {
      objc_msgSend(v4, "structuredLocation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v23 != 0;
    }
  }
LABEL_17:

  return v5;
}

- (BOOL)isTopographicallyEqualToAlarm:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;

  v4 = a3;
  if (v4)
  {
    -[EKAlarm absoluteDate](self, "absoluteDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "absoluteDate");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v5)
      v8 = objc_msgSend(v5, "isEqualToDate:", v6);
    else
      v8 = v6 == 0;
    -[EKAlarm relativeOffset](self, "relativeOffset");
    v11 = v10;
    objc_msgSend(v4, "relativeOffset");
    v13 = vabdd_f64(v11, v12);
    -[EKAlarm structuredLocation](self, "structuredLocation");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "structuredLocation");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 | v15)
      v16 = objc_msgSend((id)v14, "isEqual:", v15);
    else
      v16 = 1;
    if (v13 < 2.22044605e-16)
      v17 = v16;
    else
      v17 = 0;
    if (v8)
      v9 = v17;
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_reset
{
  _BOOL4 v3;
  uint64_t v4;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKAlarm;
  v3 = -[EKObject _reset](&v7, sel__reset);
  if (v3)
  {
    v4 = objc_opt_class();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __17__EKAlarm__reset__block_invoke;
    v6[3] = &unk_1E47864F0;
    v6[4] = self;
    LOBYTE(v3) = -[EKObject _resetIfBackingObjectIsOfClass:fetchResetFrozenObjectBlock:](self, "_resetIfBackingObjectIsOfClass:fetchResetFrozenObjectBlock:", v4, v6);
  }
  return v3;
}

id __17__EKAlarm__reset__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "eventStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reminderStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetBackingAlarmWithBackingAlarm:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)areLocationsAvailable
{
  return MGGetBoolAnswer();
}

+ (int)_currentAuthorizationStatus
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1E0D0C330];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/LocationBundles/RemindersAlerts.bundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "authorizationStatusForBundle:", v3);

  return (int)v2;
}

+ (BOOL)areLocationsAllowed
{
  return objc_msgSend(a1, "areLocationsAllowedWithAuthorizationStatus:", objc_msgSend(a1, "_currentAuthorizationStatus"));
}

+ (BOOL)areLocationsAllowedWithAuthorizationStatus:(int)a3
{
  BOOL result;

  result = objc_msgSend(a1, "areLocationsAvailable");
  if (a3 == 2)
    return 0;
  return result;
}

+ (BOOL)areLocationsCurrentlyEnabled
{
  int v3;

  v3 = objc_msgSend(a1, "areLocationsAvailable");
  if (v3)
    LOBYTE(v3) = objc_msgSend(a1, "_currentAuthorizationStatus") != 2;
  return v3;
}

+ (double)defaultGeofencedReminderRadius
{
  return 100.0;
}

- (id)semanticIdentifier
{
  return +[EKAlarmSemanticIdentifierGenerator semanticIdentifierForAlarm:](EKAlarmSemanticIdentifierGenerator, "semanticIdentifierForAlarm:", self);
}

- (NSString)soundName
{
  return self->_soundName;
}

- (void)setSoundName:(NSString *)soundName
{
  objc_setProperty_nonatomic_copy(self, a2, soundName, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundName, 0);
}

@end
