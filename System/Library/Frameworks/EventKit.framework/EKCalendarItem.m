@implementation EKCalendarItem

- (id)travelStartLocation
{
  return -[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", *MEMORY[0x1E0D0B400]);
}

- (NSString)notes
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B328]);
}

- (id)startTimeZone
{
  void *v2;
  void *v3;

  -[EKCalendarItem startTimeZoneName](self, "startTimeZoneName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "timeZoneFromTimeZoneName:withFloatingTimeZone:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)startTimeZoneName
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B3D8]);
}

+ (id)timeZoneFromTimeZoneName:(id)a3 withFloatingTimeZone:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (v5 && !objc_msgSend(v5, "isEqualToString:", CFSTR("_float")))
  {
    EKCachedTimeZoneWithName();
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v6;
  }
  v8 = v7;

  return v8;
}

- (BOOL)hasRecurrenceRules
{
  void *v3;
  char v4;

  if (-[EKObject isNew](self, "isNew")
    || !-[EKObject isPropertyUnavailable:](self, "isPropertyUnavailable:", *MEMORY[0x1E0D0B350]))
  {
    -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count") != 0;
  }
  else
  {
    -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B300]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLValue");
  }

  return v4;
}

- (BOOL)hasAttendees
{
  void *v3;
  char v4;

  if (-[EKObject isNew](self, "isNew")
    || !-[EKObject isPropertyUnavailable:](self, "isPropertyUnavailable:", *MEMORY[0x1E0D0B278]))
  {
    -[EKCalendarItem attendees](self, "attendees");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count") != 0;
  }
  else
  {
    -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B2F0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLValue");
  }

  return v4;
}

- (NSArray)attendees
{
  void *v3;
  void *v4;

  -[EKCalendarItem attendeesRaw](self, "attendeesRaw");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem filterAttendeesPendingDeletion:](self, "filterAttendeesPendingDeletion:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)filterAttendeesPendingDeletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v10, "participantStatus", (_QWORD)v12) != -1)
            objc_msgSend(v4, "addObject:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)attendeesRaw
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = *MEMORY[0x1E0D0B278];
  -[EKObject cachedMeltedObjectsForMultiValueKey:](self, "cachedMeltedObjectsForMultiValueKey:", *MEMORY[0x1E0D0B278]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[EKObject cachedMeltedObjectForSingleValueKey:](self, "cachedMeltedObjectForSingleValueKey:", *MEMORY[0x1E0D0B358]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKObject meltedAndCachedMultiRelationObjectsForKey:](self, "meltedAndCachedMultiRelationObjectsForKey:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      v9 = (void *)objc_msgSend(v7, "mutableCopy");
      objc_msgSend(v9, "removeObject:", v6);
      objc_msgSend(v9, "addObject:", v6);
      v10 = objc_msgSend(v9, "copy");

      -[EKObject setCachedMeltedObjects:forMultiValueKey:](self, "setCachedMeltedObjects:forMultiValueKey:", v10, v3);
      v8 = (void *)v10;
    }
    v5 = v8;

  }
  return v5;
}

- (EKCalendarItem)originalItem
{
  return (EKCalendarItem *)-[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", *MEMORY[0x1E0D0B338]);
}

- (id)unlocalizedTitle
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B410]);
}

- (NSArray)recurrenceRules
{
  void *v2;
  void *v3;

  -[EKCalendarItem recurrenceRulesSet](self, "recurrenceRulesSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)recurrenceRulesSet
{
  return -[EKObject meltedAndCachedMultiRelationObjectsForKey:](self, "meltedAndCachedMultiRelationObjectsForKey:", *MEMORY[0x1E0D0B350]);
}

- (id)uniqueID
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B408]);
}

- (EKCalendar)calendar
{
  return (EKCalendar *)-[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", *MEMORY[0x1E0D0B280]);
}

- (NSString)location
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[EKCalendarItem preferredLocation](self, "preferredLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[EKCalendarItem preferredLocation](self, "preferredLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKCalendarItem preferredLocation](self, "preferredLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D0C328], "fullDisplayStringWithTitle:address:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return (NSString *)v8;
}

- (id)preferredLocation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class();
  -[EKCalendarItem clientLocation](self, "clientLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem structuredLocation](self, "structuredLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredLocationWithClientLocation:structuredLocation:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)clientLocation
{
  return -[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", *MEMORY[0x1E0D0B290]);
}

- (id)structuredLocationWithoutPrediction
{
  return -[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", *MEMORY[0x1E0D0B3E0]);
}

- (id)selfAttendee
{
  void *v2;
  id v3;
  void *v4;

  -[EKCalendarItem _selfAttendee](self, "_selfAttendee");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v4 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKCalendarItem selfAttendee].cold.1(v4);
    v3 = 0;
  }
  else
  {
    v3 = v2;
  }

  return v3;
}

- (id)_selfAttendee
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D0B358];
  -[EKObject frozenOrMeltedCachedSingleRelationObjectForKey:](self, "frozenOrMeltedCachedSingleRelationObjectForKey:", *MEMORY[0x1E0D0B358]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isFrozen") & 1) != 0)
  {
    -[EKObject cachedMeltedObjectsForMultiValueKey:](self, "cachedMeltedObjectsForMultiValueKey:", *MEMORY[0x1E0D0B278]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v18 = v6;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v20;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v20 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            objc_msgSend(v13, "backingObject");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEqual:", v5);

            if ((v15 & 1) != 0)
            {
              v16 = v13;
              -[EKObject setCachedMeltedObject:forSingleValueKey:](self, "setCachedMeltedObject:forSingleValueKey:", v16, v3);

              v7 = v18;
              goto LABEL_16;
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v10)
            continue;
          break;
        }
      }

      v7 = v18;
    }
    -[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", v3);
    v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

  }
  else
  {
    v16 = v5;
  }

  return v16;
}

- (id)organizer
{
  return -[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", *MEMORY[0x1E0D0B330]);
}

- (BOOL)isSelfOrganizedInvitation
{
  _BOOL4 v3;

  v3 = -[EKCalendarItem hasAttendees](self, "hasAttendees");
  if (v3)
    LOBYTE(v3) = -[EKCalendarItem isSelfOrganized](self, "isSelfOrganized");
  return v3;
}

- (id)exceptionDates
{
  void *v2;
  void *v3;

  -[EKCalendarItem ekExceptionDates](self, "ekExceptionDates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("date"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ekExceptionDates
{
  return -[EKObject meltedAndCachedMultiRelationObjectsForKey:](self, "meltedAndCachedMultiRelationObjectsForKey:", *MEMORY[0x1E0D0B2B0]);
}

- (id)detachedItems
{
  return -[EKObject meltedAndCachedMultiRelationObjectsForKey:](self, "meltedAndCachedMultiRelationObjectsForKey:", *MEMORY[0x1E0D0B2A8]);
}

- (BOOL)isSelfOrganized
{
  void *v2;
  void *v3;
  char v4;

  -[EKCalendarItem organizer](self, "organizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isCurrentUser");
  else
    v4 = 1;

  return v4;
}

void __49__EKCalendarItem_knownRelationshipMultiValueKeys__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B350];
  v5[0] = *MEMORY[0x1E0D0B268];
  v5[1] = v0;
  v1 = *MEMORY[0x1E0D0B270];
  v5[2] = *MEMORY[0x1E0D0B278];
  v5[3] = v1;
  v2 = *MEMORY[0x1E0D0B2B0];
  v5[4] = *MEMORY[0x1E0D0B2A8];
  v5[5] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)knownRelationshipMultiValueKeys_keys;
  knownRelationshipMultiValueKeys_keys = v3;

}

void __50__EKCalendarItem_knownRelationshipSingleValueKeys__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[9];

  v6[8] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B290];
  v6[0] = *MEMORY[0x1E0D0B3E0];
  v6[1] = v0;
  v1 = *MEMORY[0x1E0D0B358];
  v6[2] = *MEMORY[0x1E0D0B330];
  v6[3] = v1;
  v2 = *MEMORY[0x1E0D0B280];
  v6[4] = *MEMORY[0x1E0D0B338];
  v6[5] = v2;
  v3 = *MEMORY[0x1E0D0B3F8];
  v6[6] = *MEMORY[0x1E0D0B400];
  v6[7] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 8);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)knownRelationshipSingleValueKeys_keys;
  knownRelationshipSingleValueKeys_keys = v4;

}

+ (id)knownRelationshipSingleValueKeys
{
  if (knownRelationshipSingleValueKeys_onceToken != -1)
    dispatch_once(&knownRelationshipSingleValueKeys_onceToken, &__block_literal_global_24);
  return (id)knownRelationshipSingleValueKeys_keys;
}

+ (id)knownRelationshipMultiValueKeys
{
  if (knownRelationshipMultiValueKeys_onceToken != -1)
    dispatch_once(&knownRelationshipMultiValueKeys_onceToken, &__block_literal_global_12);
  return (id)knownRelationshipMultiValueKeys_keys;
}

- (NSData)structuredData
{
  return (NSData *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B3E8]);
}

- (void)setStructuredData:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B3E8]);
}

- (NSData)localStructuredData
{
  return (NSData *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B318]);
}

- (void)setLocalStructuredData:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B318]);
}

- (id)_structuredDataDictionaryFromData:(id)a3 local:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v13;

  v4 = a4;
  v5 = (void *)MEMORY[0x1E0D0C3B8];
  v6 = a3;
  objc_msgSend(v5, "defaultPermittedClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v5, "unarchiveDictionaryFromData:permittedClasses:strict:error:", v6, v7, !v4, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v13;
  if (v9)
  {
    v10 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKCalendarItem(Shared) _structuredDataDictionaryFromData:local:].cold.1((uint64_t)v9, v10);
    v11 = 0;
  }
  else
  {
    v11 = v8;
  }

  return v11;
}

- (id)_dataFromStructuredDataDictionary:(id)a3 local:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v13;

  v4 = a4;
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0D0C3B8];
  objc_msgSend(MEMORY[0x1E0D0C3B8], "defaultPermittedClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v6, "archiveDictionary:permittedClasses:strict:error:", v5, v7, !v4, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;

  if (v9)
  {
    v10 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKCalendarItem(Shared) _dataFromStructuredDataDictionary:local:].cold.1((uint64_t)v5, (uint64_t)v9, v10);
    v11 = 0;
  }
  else
  {
    v11 = v8;
  }

  return v11;
}

- (id)_customObjectForKey:(id)a3 local:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  if (v4)
    -[EKCalendarItem localStructuredData](self, "localStructuredData");
  else
    -[EKCalendarItem structuredData](self, "structuredData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem _structuredDataDictionaryFromData:local:](self, "_structuredDataDictionaryFromData:local:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_setCustomObject:(id)a3 forKey:(id)a4 local:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a5;
  v13 = a3;
  v8 = a4;
  if (v5)
    -[EKCalendarItem localStructuredData](self, "localStructuredData");
  else
    -[EKCalendarItem structuredData](self, "structuredData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem _structuredDataDictionaryFromData:local:](self, "_structuredDataDictionaryFromData:local:", v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if (!v11)
    v11 = (void *)objc_opt_new();
  if (v13)
    objc_msgSend(v11, "setObject:forKey:", v13, v8);
  else
    objc_msgSend(v11, "removeObjectForKey:", v8);
  if (v5)
  {
    -[EKCalendarItem _dataFromStructuredDataDictionary:local:](self, "_dataFromStructuredDataDictionary:local:", v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarItem setLocalStructuredData:](self, "setLocalStructuredData:", v12);
  }
  else
  {
    -[EKCalendarItem _dataFromStructuredDataDictionary:local:](self, "_dataFromStructuredDataDictionary:local:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarItem setStructuredData:](self, "setStructuredData:", v12);
  }

}

- (id)customObjectForKey:(id)a3
{
  return -[EKCalendarItem _customObjectForKey:local:](self, "_customObjectForKey:local:", a3, 0);
}

- (void)setCustomObject:(id)a3 forKey:(id)a4
{
  -[EKCalendarItem _setCustomObject:forKey:local:](self, "_setCustomObject:forKey:local:", a3, a4, 0);
}

- (id)localCustomObjectForKey:(id)a3
{
  return -[EKCalendarItem _customObjectForKey:local:](self, "_customObjectForKey:local:", a3, 1);
}

- (void)setLocalCustomObject:(id)a3 forKey:(id)a4
{
  -[EKCalendarItem _setCustomObject:forKey:local:](self, "_setCustomObject:forKey:local:", a3, a4, 1);
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v14 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  -[EKCalendarItem title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem calendar](self, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem alarms](self, "alarms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem URL](self, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem lastModifiedDate](self, "lastModifiedDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem startTimeZone](self, "startTimeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem endTimeZone](self, "endTimeZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ <%p>\n{\t title = \t\t%@; \n\t location = \t%@; \n\t calendar = \t%@; \n\t alarms = \t\t%@; \n\t URL = \t\t\t%@; \n\t lastModified = %@; \n\t startTimeZone = \t%@; \n\t endTimeZone = \t%@ \n}"),
    v3,
    self,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)knownRelationshipSingleValueKeysForValidation
{
  if (knownRelationshipSingleValueKeysForValidation_onceToken != -1)
    dispatch_once(&knownRelationshipSingleValueKeysForValidation_onceToken, &__block_literal_global_11);
  return (id)knownRelationshipSingleValueKeysForValidation_keys;
}

void __63__EKCalendarItem_knownRelationshipSingleValueKeysForValidation__block_invoke()
{
  void *v0;

  v0 = (void *)knownRelationshipSingleValueKeysForValidation_keys;
  knownRelationshipSingleValueKeysForValidation_keys = MEMORY[0x1E0C9AA60];

}

+ (id)knownRelationshipMultiValueKeysForValidation
{
  if (knownRelationshipMultiValueKeysForValidation_onceToken != -1)
    dispatch_once(&knownRelationshipMultiValueKeysForValidation_onceToken, &__block_literal_global_13);
  return (id)knownRelationshipMultiValueKeysForValidation_keys;
}

void __62__EKCalendarItem_knownRelationshipMultiValueKeysForValidation__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0D0B268];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)knownRelationshipMultiValueKeysForValidation_keys;
  knownRelationshipMultiValueKeysForValidation_keys = v0;

}

- (BOOL)shouldLoadRelationshipForValidation:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D0B268]) ^ 1;
}

+ (id)knownRelationshipWeakKeys
{
  if (knownRelationshipWeakKeys_onceToken_0 != -1)
    dispatch_once(&knownRelationshipWeakKeys_onceToken_0, &__block_literal_global_14);
  return (id)knownRelationshipWeakKeys_keys_0;
}

void __43__EKCalendarItem_knownRelationshipWeakKeys__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B280];
  v3[0] = *MEMORY[0x1E0D0B338];
  v3[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)knownRelationshipWeakKeys_keys_0;
  knownRelationshipWeakKeys_keys_0 = v1;

}

+ (id)knownIdentityKeysForComparison
{
  if (knownIdentityKeysForComparison_onceToken_3 != -1)
    dispatch_once(&knownIdentityKeysForComparison_onceToken_3, &__block_literal_global_15);
  return (id)knownIdentityKeysForComparison_keys_3;
}

void __48__EKCalendarItem_knownIdentityKeysForComparison__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0D0B820];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)knownIdentityKeysForComparison_keys_3;
  knownIdentityKeysForComparison_keys_3 = v0;

}

+ (id)knownSingleValueKeysForComparison
{
  if (knownSingleValueKeysForComparison_onceToken_1 != -1)
    dispatch_once(&knownSingleValueKeysForComparison_onceToken_1, &__block_literal_global_16);
  return (id)knownSingleValueKeysForComparison_keys_1;
}

void __51__EKCalendarItem_knownSingleValueKeysForComparison__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[34];

  v18[33] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B260];
  v18[0] = *MEMORY[0x1E0D0B258];
  v18[1] = v0;
  v1 = *MEMORY[0x1E0D0B288];
  v18[2] = *MEMORY[0x1E0D0B308];
  v18[3] = v1;
  v2 = *MEMORY[0x1E0D0B2A0];
  v18[4] = *MEMORY[0x1E0D0B298];
  v18[5] = v2;
  v3 = *MEMORY[0x1E0D0B2C8];
  v18[6] = *MEMORY[0x1E0D0B2C0];
  v18[7] = v3;
  v4 = *MEMORY[0x1E0D0B2F8];
  v18[8] = *MEMORY[0x1E0D0B2F0];
  v18[9] = v4;
  v5 = *MEMORY[0x1E0D0B310];
  v18[10] = *MEMORY[0x1E0D0B300];
  v18[11] = v5;
  v6 = *MEMORY[0x1E0D0B328];
  v18[12] = *MEMORY[0x1E0D0B320];
  v18[13] = v6;
  v7 = *MEMORY[0x1E0D0B360];
  v18[14] = *MEMORY[0x1E0D0B348];
  v18[15] = v7;
  v8 = *MEMORY[0x1E0D0B370];
  v18[16] = *MEMORY[0x1E0D0B368];
  v18[17] = v8;
  v9 = *MEMORY[0x1E0D0B380];
  v18[18] = *MEMORY[0x1E0D0B378];
  v18[19] = v9;
  v10 = *MEMORY[0x1E0D0B390];
  v18[20] = *MEMORY[0x1E0D0B388];
  v18[21] = v10;
  v11 = *MEMORY[0x1E0D0B3A0];
  v18[22] = *MEMORY[0x1E0D0B398];
  v18[23] = v11;
  v12 = *MEMORY[0x1E0D0B3B0];
  v18[24] = *MEMORY[0x1E0D0B3A8];
  v18[25] = v12;
  v13 = *MEMORY[0x1E0D0B3C0];
  v18[26] = *MEMORY[0x1E0D0B3B8];
  v18[27] = v13;
  v14 = *MEMORY[0x1E0D0B3D8];
  v18[28] = *MEMORY[0x1E0D0B3C8];
  v18[29] = v14;
  v15 = *MEMORY[0x1E0D0B408];
  v18[30] = *MEMORY[0x1E0D0B410];
  v18[31] = v15;
  v18[32] = *MEMORY[0x1E0D0B2E8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 33);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)knownSingleValueKeysForComparison_keys_1;
  knownSingleValueKeysForComparison_keys_1 = v16;

}

+ (id)specialComparisonBlocks
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", &__block_literal_global_18_1, *MEMORY[0x1E0D0B360]);
}

uint64_t __41__EKCalendarItem_specialComparisonBlocks__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "selfParticipantStatus");
  if (v6 == objc_msgSend(v5, "selfParticipantStatus"))
  {
    v7 = 1;
  }
  else if (objc_msgSend(v4, "needsResponse"))
  {
    v7 = objc_msgSend(v5, "needsResponse");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)defaultPropertyKeysToSkipForRecursiveSnapshotCopies
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__EKCalendarItem_defaultPropertyKeysToSkipForRecursiveSnapshotCopies__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultPropertyKeysToSkipForRecursiveSnapshotCopies_onceToken != -1)
    dispatch_once(&defaultPropertyKeysToSkipForRecursiveSnapshotCopies_onceToken, block);
  return (id)defaultPropertyKeysToSkipForRecursiveSnapshotCopies_keys;
}

void __69__EKCalendarItem_defaultPropertyKeysToSkipForRecursiveSnapshotCopies__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_METACLASS___EKCalendarItem;
  objc_msgSendSuper2(&v8, sel_defaultPropertyKeysToSkipForRecursiveSnapshotCopies);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)defaultPropertyKeysToSkipForRecursiveSnapshotCopies_keys;
  defaultPropertyKeysToSkipForRecursiveSnapshotCopies_keys = v1;

  v3 = (void *)defaultPropertyKeysToSkipForRecursiveSnapshotCopies_keys;
  v4 = *MEMORY[0x1E0D0B338];
  v9[0] = *MEMORY[0x1E0D0B2A8];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromArray:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)defaultPropertyKeysToSkipForRecursiveSnapshotCopies_keys;
  defaultPropertyKeysToSkipForRecursiveSnapshotCopies_keys = v6;

}

+ (id)knownDerivedRelationshipKeys
{
  if (knownDerivedRelationshipKeys_onceToken != -1)
    dispatch_once(&knownDerivedRelationshipKeys_onceToken, &__block_literal_global_20);
  return (id)knownDerivedRelationshipKeys_keys;
}

void __46__EKCalendarItem_knownDerivedRelationshipKeys__block_invoke()
{
  void *v0;

  v0 = (void *)knownDerivedRelationshipKeys_keys;
  knownDerivedRelationshipKeys_keys = (uint64_t)&unk_1E47B5BA8;

}

- (unint64_t)entityType
{
  -[EKCalendarItem doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return -1;
}

- (id)startDateRaw
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B3D0]);
}

- (void)setStartDateRaw:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B3D0]);
}

- (NSString)calendarItemIdentifier
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B820]);
}

- (void)setCalendarItemIdentifier:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B820]);
}

- (NSString)calendarItemExternalIdentifier
{
  void *v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B408]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[EKCalendarItem calendarItemIdentifier](self, "calendarItemIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (id)uniqueId
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B408]);
}

- (void)setUniqueId:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B408]);
}

- (void)setUniqueID:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B408]);
}

- (id)localUID
{
  uint64_t v3;
  void *v4;
  EKCalendarItem *v5;
  EKCalendarItem *v6;
  void *v7;

  -[EKCalendarItem originalItem](self, "originalItem");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (EKCalendarItem *)v3;
  else
    v5 = self;
  v6 = v5;

  -[EKCalendarItem calendarItemIdentifier](v6, "calendarItemIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setNotes:(NSString *)notes
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", notes, *MEMORY[0x1E0D0B328]);
}

- (BOOL)hasNotes
{
  void *v3;
  char v4;

  if (-[EKObject isNew](self, "isNew")
    || !-[EKObject isPropertyUnavailable:](self, "isPropertyUnavailable:", *MEMORY[0x1E0D0B328]))
  {
    -[EKCalendarItem notes](self, "notes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length") != 0;
  }
  else
  {
    -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B2F8]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLValue");
  }

  return v4;
}

- (void)setUnlocalizedTitle:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B410]);
}

- (void)setLocation:(NSString *)location
{
  void *v4;
  char v5;
  NSString *v6;
  void *v7;
  NSString *v8;

  v8 = location;
  -[EKCalendarItem location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v8);

  v6 = v8;
  if ((v5 & 1) == 0)
  {
    if (v8)
    {
      +[EKStructuredLocation locationWithTitle:](EKStructuredLocation, "locationWithTitle:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    -[EKCalendarItem setStructuredLocation:](self, "setStructuredLocation:", v7);

    v6 = v8;
  }

}

- (void)setStructuredLocationWithoutPrediction:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = *MEMORY[0x1E0D0B3E0];
  v5 = a3;
  -[EKObject updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:](self, "updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:", v5, v4, +[EKStructuredLocation frozenClass](EKStructuredLocation, "frozenClass"));

}

- (void)setClientLocation:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = *MEMORY[0x1E0D0B290];
  v5 = a3;
  -[EKObject updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:](self, "updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:", v5, v4, +[EKStructuredLocation frozenClass](EKStructuredLocation, "frozenClass"));

}

+ (id)preferredLocationWithClientLocation:(id)a3 structuredLocation:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
    v5 = v6;

  return v5;
}

- (void)setTravelStartLocation:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = *MEMORY[0x1E0D0B400];
  v5 = a3;
  -[EKObject updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:](self, "updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:", v5, v4, +[EKStructuredLocation frozenClass](EKStructuredLocation, "frozenClass"));

}

- (NSDate)lastModifiedDate
{
  return (NSDate *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B310]);
}

- (void)setLastModifiedDate:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B310]);
}

- (NSDate)creationDate
{
  return (NSDate *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B298]);
}

- (void)setCreationDate:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B298]);
}

- (BOOL)isAllDay
{
  void *v2;
  char v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B308]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setAllDay:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B308]);

}

- (id)calendarScale
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B288]);
}

- (void)setCalendarScale:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B288]);
}

- (unint64_t)priority
{
  void *v2;
  unint64_t v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B348]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setPriority:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B348]);

}

- (id)actionString
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B260]);
}

- (void)setActionString:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B260]);
}

- (id)action
{
  void *v2;
  void *v3;

  -[EKCalendarItem actionString](self, "actionString");
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

  return v3;
}

- (void)setAction:(id)a3
{
  id v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem setActionString:](self, "setActionString:", v4);

}

- (id)appLink
{
  return 0;
}

- (id)URLString
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B258]);
}

- (void)setURLString:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B258]);
}

- (NSURL)URL
{
  void *v2;
  void *v3;

  -[EKCalendarItem URLString](self, "URLString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "_lp_URLWithUserTypedString:relativeToURL:", v2, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (void)setURL:(NSURL *)URL
{
  id v4;

  -[NSURL absoluteString](URL, "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem setURLString:](self, "setURLString:", v4);

}

- (void)setCalendar:(EKCalendar *)calendar
{
  uint64_t v4;
  EKCalendar *v5;

  v4 = *MEMORY[0x1E0D0B280];
  v5 = calendar;
  -[EKObject updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:](self, "updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:", v5, v4, +[EKCalendar frozenClass](EKCalendar, "frozenClass"));

}

- (void)setTimeZone:(NSTimeZone *)timeZone
{
  NSTimeZone *v4;

  v4 = timeZone;
  -[EKCalendarItem setStartTimeZone:](self, "setStartTimeZone:", v4);
  -[EKCalendarItem setEndTimeZone:](self, "setEndTimeZone:", v4);

}

- (void)setStartTimeZoneName:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B3D8]);
}

- (void)setStartTimeZone:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "timeZoneNameFromTimeZone:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[EKCalendarItem setStartTimeZoneName:](self, "setStartTimeZoneName:", v5);
}

- (id)endTimeZoneName
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B2C0]);
}

- (void)setEndTimeZoneName:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B2C0]);
}

- (id)endTimeZone
{
  void *v2;
  void *v3;

  -[EKCalendarItem endTimeZoneName](self, "endTimeZoneName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "timeZoneFromTimeZoneName:withFloatingTimeZone:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setEndTimeZone:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "timeZoneNameFromTimeZone:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[EKCalendarItem setEndTimeZoneName:](self, "setEndTimeZoneName:", v5);
}

- (BOOL)defaultAlarmWasDeleted
{
  void *v2;
  char v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B2A0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setDefaultAlarmWasDeleted:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B2A0]);

}

- (id)externalID
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B2D0]);
}

- (void)setExternalID:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B2D0]);
}

- (id)externalScheduleID
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B2E0]);
}

- (void)setExternalScheduleID:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B2E0]);
}

- (id)externalModificationTag
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B2D8]);
}

- (void)setExternalModificationTag:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B2D8]);
}

- (id)externalData
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B2C8]);
}

- (void)setExternalData:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B2C8]);
}

- (unsigned)modifiedProperties
{
  void *v2;
  unsigned int v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B320]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (void)setModifiedProperties:(unsigned int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B320]);

}

- (int)sequenceNumber
{
  void *v2;
  int v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B368]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (void)setSequenceNumber:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B368]);

}

- (id)syncError
{
  return -[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", *MEMORY[0x1E0D0B3F8]);
}

- (void)setSyncError:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = *MEMORY[0x1E0D0B3F8];
  v5 = a3;
  -[EKObject updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:](self, "updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:", v5, v4, +[EKSyncError frozenClass](EKSyncError, "frozenClass"));

}

- (BOOL)isNewItemThatFailedToPut
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[EKCalendarItem syncError](self, "syncError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "errorType") == 1 && objc_msgSend(v4, "errorCode") == 3)
  {
    -[EKCalendarItem externalModificationTag](self, "externalModificationTag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length") == 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)exportToICS
{
  return -[EKCalendarItem exportToICSWithOptions:](self, "exportToICSWithOptions:", 0x40000);
}

- (id)exportToICSWithOptions:(unint64_t)a3
{
  void *v5;
  EKCalendarItem *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  v21 = 0;
  -[EKObject objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = self;
      -[EKCalendarItem startDate](v6, "startDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKCalendarItem adjustedPersistedDateForDate:withAdjustmentMode:pinMode:clientCalendarDate:](v6, "adjustedPersistedDateForDate:withAdjustmentMode:pinMode:clientCalendarDate:", v7, 0, 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }
    -[EKObject eventStore](self, "eventStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "CADOperationProxySync");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKObject CADObjectID](self, "CADObjectID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __41__EKCalendarItem_exportToICSWithOptions___block_invoke;
    v15[3] = &unk_1E4785988;
    v15[4] = &v16;
    objc_msgSend(v11, "CADDatabaseExportICSForCalendarItemWithID:occurrenceDate:options:reply:", v12, v8, a3, v15);

  }
  v13 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v13;
}

void __41__EKCalendarItem_exportToICSWithOptions___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if ((_DWORD)a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Error exporting event to ICS: %@"), v6, v9);
  }
  else
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = v5;
    v6 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v8;
  }

}

- (BOOL)suppressNotificationForChanges
{
  void *v2;
  char v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B3F0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setSuppressNotificationForChanges:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B3F0]);

}

- (id)externalURI
{
  return 0;
}

- (id)committedConstraints
{
  return 0;
}

- (BOOL)requiresDetach
{
  return 0;
}

- (BOOL)allowsSpansOtherThanThisEvent
{
  return 1;
}

- (BOOL)isEditable
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  if (-[EKObject isNew](self, "isNew"))
    return 1;
  -[EKCalendarItem calendar](self, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4
    && ((objc_msgSend(v4, "allowsContentModifications") & 1) != 0
     || (objc_msgSend(v5, "isMutableSuggestionsCalendar") & 1) != 0
     || objc_msgSend(v5, "isMutableNaturalLanguageSuggestionsCalendar")))
  {
    if (-[EKCalendarItem hasAttendees](self, "hasAttendees"))
    {
      objc_msgSend(v5, "source");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((!v6
         || (-[EKCalendarItem constraints](self, "constraints"),
             v7 = (void *)objc_claimAutoreleasedReturnValue(),
             v8 = objc_msgSend(v7, "supportsInvitationModifications"),
             v7,
             v8))
        && objc_msgSend(v5, "allowsScheduling"))
      {
        v3 = -[EKCalendarItem isSelfOrganized](self, "isSelfOrganized")
          || -[EKCalendarItem isOrganizedBySharedCalendarOwner](self, "isOrganizedBySharedCalendarOwner");
      }
      else
      {
        v3 = 0;
      }

    }
    else
    {
      v3 = 1;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)isDeletable
{
  return -[EKCalendarItem _validateDeletable:](self, "_validateDeletable:", 0);
}

- (BOOL)_validateDeletable:(id *)a3
{
  return -[EKCalendarItem _validateDeletableDueToAccessConsent:](self, "_validateDeletableDueToAccessConsent:")
      && -[EKCalendarItem _validateDeletableInCalendarWithError:](self, "_validateDeletableInCalendarWithError:", a3)
      && -[EKCalendarItem _validateDeletableBySharedCalendarShareeWithError:](self, "_validateDeletableBySharedCalendarShareeWithError:", a3);
}

- (BOOL)_validateDeletableDueToAccessConsent:(id *)a3
{
  uint64_t v5;
  void *v6;
  NSObject *v7;
  unint64_t v8;
  const __CFString *v9;
  int v11;
  EKCalendarItem *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = +[EKEventStore realAuthorizationStatusForEntityType:](EKEventStore, "realAuthorizationStatusForEntityType:", -[EKCalendarItem entityType](self, "entityType"));
  if (v5 <= 2)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 29);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      v8 = -[EKCalendarItem entityType](self, "entityType");
      v9 = CFSTR("reminders");
      if (!v8)
        v9 = CFSTR("events");
      v11 = 138412546;
      v12 = self;
      v13 = 2114;
      v14 = v9;
      _os_log_impl(&dword_1A2318000, v7, OS_LOG_TYPE_INFO, "Validation is failing for %@ because access has not been granted for %{public}@.", (uint8_t *)&v11, 0x16u);

    }
  }
  return v5 > 2;
}

- (BOOL)_validateDeletableInCalendarWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  BOOL v9;
  NSObject *v10;
  int v12;
  EKCalendarItem *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[EKCalendarItem calendar](self, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "allowsContentModifications"))
    goto LABEL_6;
  -[EKCalendarItem calendar](self, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isSuggestedEventCalendar"))
  {
LABEL_5:

LABEL_6:
LABEL_7:
    LOBYTE(v8) = 1;
    return v8;
  }
  -[EKCalendarItem calendar](self, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isNaturalLanguageSuggestedEventCalendar"))
  {

    goto LABEL_5;
  }
  v9 = -[EKCalendarItem isNewItemThatFailedToPut](self, "isNewItemThatFailedToPut");

  if (v9)
    goto LABEL_7;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 6);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = EKLogHandle;
  v8 = os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO);
  if (v8)
  {
    v12 = 138412290;
    v13 = self;
    _os_log_impl(&dword_1A2318000, v10, OS_LOG_TYPE_INFO, "Validation is failing for %@ because readonly items can't be removed.", (uint8_t *)&v12, 0xCu);
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (BOOL)_isInSharedToMeCalendarWithNoSharingScheduling
{
  void *v3;
  void *v4;
  int v5;

  -[EKCalendarItem calendar](self, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "sharingStatus") == 2)
  {
    -[EKCalendarItem calendar](self, "calendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "allowsScheduling") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)_validateDeletableBySharedCalendarShareeWithError:(id *)a3
{
  NSObject *v5;
  _BOOL4 v6;
  int v8;
  EKCalendarItem *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[EKCalendarItem _isInSharedToMeCalendarWithNoSharingScheduling](self, "_isInSharedToMeCalendarWithNoSharingScheduling")&& -[EKCalendarItem hasAttendees](self, "hasAttendees"))
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = EKLogHandle;
    v6 = os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO);
    if (v6)
    {
      v8 = 138412290;
      v9 = self;
      _os_log_impl(&dword_1A2318000, v5, OS_LOG_TYPE_INFO, "Validation is failing for %@ because it's not deletable by shared calendar sharees.", (uint8_t *)&v8, 0xCu);
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (BOOL)isFloating
{
  void *v2;
  BOOL v3;

  -[EKCalendarItem timeZone](self, "timeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (BOOL)isExternallyOrganizedInvitation
{
  _BOOL4 v3;

  v3 = -[EKCalendarItem hasAttendees](self, "hasAttendees");
  if (v3)
    LOBYTE(v3) = !-[EKCalendarItem isSelfOrganized](self, "isSelfOrganized");
  return v3;
}

- (BOOL)isOrganizedBySharedCalendarOwner
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  BOOL v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[EKCalendarItem calendar](self, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharedOwnerAddresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_14;
  -[EKCalendarItem organizer](self, "organizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "stringRemovingMailto");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringRemovingTel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = v4;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      v21 = v4;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if ((objc_msgSend(v15, "isEqualToString:", v7) & 1) != 0)
            goto LABEL_16;
          objc_msgSend(v15, "stringRemovingMailto");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v16, "isEqualToString:", v8) & 1) != 0
            || (objc_msgSend(v15, "stringRemovingTel"),
                v17 = (void *)objc_claimAutoreleasedReturnValue(),
                v18 = objc_msgSend(v17, "isEqualToString:", v9),
                v17,
                v18))
          {

LABEL_16:
            v19 = 1;
            v4 = v21;
            goto LABEL_18;
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        v19 = 0;
        v4 = v21;
        if (v12)
          continue;
        break;
      }
    }
    else
    {
      v19 = 0;
    }
LABEL_18:

  }
  else
  {
LABEL_14:
    v19 = 0;
  }

  return v19;
}

- (BOOL)needsResponse
{
  BOOL v3;

  v3 = -[EKCalendarItem isExternallyOrganizedInvitation](self, "isExternallyOrganizedInvitation");
  return v3 & +[EKParticipant needsResponseForParticipantStatus:](EKParticipant, "needsResponseForParticipantStatus:", -[EKCalendarItem selfParticipantStatus](self, "selfParticipantStatus"));
}

- (id)constraints
{
  return 0;
}

- (BOOL)allowsCalendarModifications
{
  void *v4;
  char v5;

  if (-[EKObject isNew](self, "isNew"))
    return 1;
  -[EKCalendarItem calendar](self, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allowsContentModifications");

  return v5;
}

- (BOOL)allowsAlarmModifications
{
  void *v3;
  char v4;

  -[EKCalendarItem constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (((objc_msgSend(v3, "supportsAlarmTriggerIntervals") & 1) != 0
     || objc_msgSend(v3, "supportsAlarmTriggerDates"))
    && objc_msgSend(v3, "maxAlarmsAllowed"))
  {
    if (-[EKCalendarItem isExternallyOrganizedInvitation](self, "isExternallyOrganizedInvitation"))
      v4 = objc_msgSend(v3, "supportsInvitationModifications");
    else
      v4 = 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)allowsAttendeesModifications
{
  return 0;
}

- (unint64_t)actionsState
{
  void *v2;
  unint64_t v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__EKCalendarItem_actionsState__block_invoke;
  v5[3] = &unk_1E4784B98;
  v5[4] = self;
  -[EKObject cachedValueForKey:populateBlock:](self, "cachedValueForKey:populateBlock:", CFSTR("actionsState"), v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

id __30__EKCalendarItem_actionsState__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(*(id *)(a1 + 32), "externalData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D0BB40], "metadataWithData:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unrecognizedProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("X-APPLE-NO-ACTION"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_opt_class();
  if (objc_msgSend(v5, "isSubclassOfClass:", objc_opt_class()))
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_class();
    v8 = 0;
    if (objc_msgSend(v7, "isSubclassOfClass:", objc_opt_class()))
    {
      objc_msgSend(v6, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_opt_class();
      LODWORD(v10) = objc_msgSend(v10, "isSubclassOfClass:", objc_opt_class());

      if ((_DWORD)v10)
      {
        objc_msgSend(v6, "value");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("OUT-OF-DATE")) & 1) != 0)
        {
          v8 = 2;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("DELEGATORS-COPY")) & 1) != 0)
        {
          v8 = 3;
        }
        else if (objc_msgSend(v11, "isEqualToString:", CFSTR("DELEGATEES-COPY")))
        {
          v8 = 4;
        }
        else
        {
          v8 = 0;
        }

      }
      else
      {
        v8 = 0;
      }
    }

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)adjustDateFromUTC:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  v6 = -[EKCalendarItem isAllDay](self, "isAllDay");
  -[EKCalendarItem timeZone](self, "timeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "adjustDateFromUTC:allDay:timeZone:", v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)adjustDateFromUTC:(id)a3 allDay:(BOOL)a4 timeZone:(id)a5
{
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v6 = a4;
  v7 = a3;
  if (!a5 || v6)
  {
    v8 = (void *)MEMORY[0x1E0D0C2F0];
    objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateInTimeZone:fromFloatingDateInGMT:", v9, v7);
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v10;
  }
  return v7;
}

+ (id)keysToIgnoreForApplyingChanges
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__EKCalendarItem_keysToIgnoreForApplyingChanges__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (keysToIgnoreForApplyingChanges_onceToken != -1)
    dispatch_once(&keysToIgnoreForApplyingChanges_onceToken, block);
  return (id)keysToIgnoreForApplyingChanges_keysToIgnore;
}

void __48__EKCalendarItem_keysToIgnoreForApplyingChanges__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___EKCalendarItem;
  objc_msgSendSuper2(&v7, sel_keysToIgnoreForApplyingChanges);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0D0B2F8];
  v8[0] = *MEMORY[0x1E0D0B2F0];
  v8[1] = v2;
  v3 = *MEMORY[0x1E0D0B360];
  v8[2] = *MEMORY[0x1E0D0B300];
  v8[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setByAddingObjectsFromArray:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)keysToIgnoreForApplyingChanges_keysToIgnore;
  keysToIgnoreForApplyingChanges_keysToIgnore = v5;

}

- (BOOL)hasAlarms
{
  void *v2;
  BOOL v3;

  -[EKCalendarItem alarms](self, "alarms");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)shouldHaveDefaultAlarms
{
  return 0;
}

- (id)defaultAlarms
{
  return 0;
}

- (id)defaultAlarm
{
  return 0;
}

- (void)setAlarms:(NSArray *)alarms
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  void *v30;
  void *v31;
  void *v32;
  EKCalendarItem *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t n;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  EKCalendarItem *v46;
  id obj;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = (void *)-[NSArray mutableCopy](alarms, "mutableCopy");
  if (!-[EKCalendarItem shouldHaveDefaultAlarms](self, "shouldHaveDefaultAlarms"))
  {
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    -[EKCalendarItem allAlarms](self, "allAlarms");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v66;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v66 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
          if (objc_msgSend(v10, "isDefaultAlarm"))
          {
            objc_msgSend(v4, "addObject:", v10);
            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

  }
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v4, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v13 = v4;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v62;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v62 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * j);
        if ((objc_msgSend(v18, "isSnoozed") & 1) == 0)
        {
          objc_msgSend(v11, "addObject:", v18);
          objc_msgSend(v18, "UUID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v18, "UUID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v20);

          }
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
    }
    while (v15);
  }
  v46 = self;

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v13;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
  if (v21)
  {
    v22 = v21;
    v48 = *(_QWORD *)v58;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v58 != v48)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * k);
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        objc_msgSend(v24, "snoozedAlarms");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v54;
          do
          {
            for (m = 0; m != v27; ++m)
            {
              if (*(_QWORD *)v54 != v28)
                objc_enumerationMutation(v25);
              v30 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * m);
              objc_msgSend(v11, "addObject:", v30);
              objc_msgSend(v30, "UUID");
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              if (v31)
              {
                objc_msgSend(v30, "UUID");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "addObject:", v32);

              }
            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
          }
          while (v27);
        }

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
    }
    while (v22);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v33 = v46;
  -[EKCalendarItem allAlarms](v46, "allAlarms");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v50;
    do
    {
      for (n = 0; n != v36; ++n)
      {
        if (*(_QWORD *)v50 != v37)
          objc_enumerationMutation(v34);
        v39 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * n);
        if (-[EKCalendarItem _excludeAlarmDueToConnectionTrigger:](v33, "_excludeAlarmDueToConnectionTrigger:", v39))
        {
          objc_msgSend(v39, "UUID");
          v40 = objc_claimAutoreleasedReturnValue();
          if (v40)
          {
            v41 = (void *)v40;
            objc_msgSend(v39, "UUID");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v12, "containsObject:", v42);

            v33 = v46;
            if ((v43 & 1) == 0)
            {
              objc_msgSend(v11, "addObject:", v39);
              objc_msgSend(v39, "UUID");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "addObject:", v44);

            }
          }
        }
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
    }
    while (v36);
  }

  objc_msgSend(v11, "set");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem setAllAlarmsSet:](v33, "setAllAlarmsSet:", v45);

}

- (NSArray)alarms
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[EKCalendarItem allAlarms](self, "allAlarms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          v12 = -[EKCalendarItem _excludeAlarmDueToConnectionTrigger:](self, "_excludeAlarmDueToConnectionTrigger:", v11, (_QWORD)v14);
          if ((objc_msgSend(v11, "isSnoozed") & 1) == 0
            && !v12
            && (-[EKCalendarItem shouldHaveDefaultAlarms](self, "shouldHaveDefaultAlarms")
             || (objc_msgSend(v11, "isDefaultAlarm") & 1) == 0))
          {
            objc_msgSend(v5, "addObject:", v11);
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (id)sortedAlarms
{
  void *v2;
  void *v3;

  -[EKCalendarItem alarms](self, "alarms");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingSelector:", sel_compare_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)indexForAlarm:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0x7FFFFFFFFFFFFFFFLL;
    -[EKCalendarItem sortedAlarms](self, "sortedAlarms");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __32__EKCalendarItem_indexForAlarm___block_invoke;
    v8[3] = &unk_1E47859B0;
    v9 = v4;
    v10 = &v11;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);
    v5 = v12[3];

    _Block_object_dispose(&v11, 8);
  }

  return v5;
}

void __32__EKCalendarItem_indexForAlarm___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqual:") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "UUID"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "UUID"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v7, "isEqualToString:", v8),
        v8,
        v7,
        v9))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }

}

- (BOOL)_excludeAlarmDueToConnectionTrigger:(id)a3
{
  id v3;
  uint64_t v4;
  BOOL v5;

  v3 = a3;
  v5 = 1;
  if ((objc_msgSend(v3, "proximity") & 0x8000000000000000) == 0)
  {
    v4 = objc_msgSend(v3, "proximity");
    if (v4 <= +[EKAlarm maxPublicProximity](EKAlarm, "maxPublicProximity"))
      v5 = 0;
  }

  return v5;
}

- (id)allAlarmsSet
{
  void *v2;
  void *v3;

  -[EKObject meltedAndCachedMultiRelationObjectsForKey:](self, "meltedAndCachedMultiRelationObjectsForKey:", *MEMORY[0x1E0D0B268]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  return v3;
}

- (void)setAllAlarmsSet:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "isDefaultAlarm", (_QWORD)v10) & 1) != 0)
        {
          v9 = 0;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  -[EKCalendarItem setDefaultAlarmWasDeleted:](self, "setDefaultAlarmWasDeleted:", v9);
  -[EKObject updateMeltedAndCachedMultiRelationObjects:forKey:](self, "updateMeltedAndCachedMultiRelationObjects:forKey:", v4, *MEMORY[0x1E0D0B268]);

}

- (void)setAllAlarms:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem setAllAlarmsSet:](self, "setAllAlarmsSet:", v4);

}

- (id)allAlarms
{
  void *v2;
  void *v3;

  -[EKCalendarItem allAlarmsSet](self, "allAlarmsSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)addAlarm:(EKAlarm *)alarm
{
  EKAlarm *v4;
  EKAlarm *v5;

  v4 = alarm;
  if (v4)
  {
    v5 = v4;
    if (-[EKAlarm isDefaultAlarm](v4, "isDefaultAlarm"))
      -[EKCalendarItem setDefaultAlarmWasDeleted:](self, "setDefaultAlarmWasDeleted:", 0);
    -[EKObject addCachedMeltedObject:forMultiValueKey:](self, "addCachedMeltedObject:forMultiValueKey:", v5, *MEMORY[0x1E0D0B268]);
    v4 = v5;
  }

}

- (void)removeAlarm:(EKAlarm *)alarm
{
  EKAlarm *v4;
  EKAlarm *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  EKAlarm *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = alarm;
  v5 = v4;
  if (v4)
  {
    -[EKAlarm snoozedAlarms](v4, "snoozedAlarms");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[EKAlarm isDefaultAlarm](v5, "isDefaultAlarm"))
    {
      -[EKCalendarItem allAlarmsSet](self, "allAlarmsSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "containsObject:", v5);

      if (v8)
        -[EKCalendarItem setDefaultAlarmWasDeleted:](self, "setDefaultAlarmWasDeleted:", 1);
    }
    v19 = v5;
    -[EKObject removeCachedMeltedObject:forMultiValueKey:](self, "removeCachedMeltedObject:forMultiValueKey:", v5, *MEMORY[0x1E0D0B268]);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v14, "calendarItemOwner");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "calendarItemIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKCalendarItem calendarItemIdentifier](self, "calendarItemIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqualToString:", v17);

          if (v18)
            -[EKCalendarItem removeAlarm:](self, "removeAlarm:", v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    v5 = v19;
  }

}

- (id)findOriginalAlarmStartingWith:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "originalAlarm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "originalAlarm");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v3;
  }
  v6 = v5;

  objc_msgSend(v6, "originalAlarm");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    while (1)
    {
      objc_msgSend(v6, "externalID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "externalID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if ((v11 & 1) != 0)
        break;
      objc_msgSend(v6, "originalAlarm");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "originalAlarm");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v12;
      if (!v8)
        goto LABEL_10;
    }
  }
  v12 = v6;
LABEL_10:

  return v12;
}

- (void)snoozeAlarm:(id)a3 withTimeIntervalFromNow:(double)a4
{
  -[EKCalendarItem snoozeAlarm:withTimeIntervalFromNow:pinsTriggerToStartDate:](self, "snoozeAlarm:withTimeIntervalFromNow:pinsTriggerToStartDate:", a3, 1, a4);
}

- (void)snoozeAlarm:(id)a3 withLocation:(id)a4 proximity:(int64_t)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v9 = a4;
  if (!a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKCalendarItem.m"), 1144, CFSTR("Can't snooze an alarm with location but no proximity."));

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAcknowledgedDate:", v10);

  objc_msgSend(v14, "duplicate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setStructuredLocation:", v9);
  objc_msgSend(v11, "setProximity:", a5);
  -[EKCalendarItem findOriginalAlarmStartingWith:](self, "findOriginalAlarmStartingWith:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOriginalAlarm:", v12);
  -[EKCalendarItem addAlarm:](self, "addAlarm:", v11);

}

- (BOOL)isAlarmAcknowledgedPropertyDirty
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B268]))
    return 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[EKCalendarItem allAlarms](self, "allAlarms", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = *MEMORY[0x1E0D0B150];
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "_hasChangesForKey:", v7) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (BOOL)isOnlyAlarmAcknowledgedPropertyDirty
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[EKObject hasChanges](self, "hasChanges")
    || !-[EKObject _isOnlyChangedKey:](self, "_isOnlyChangedKey:", *MEMORY[0x1E0D0B268]))
  {
    return 0;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[EKCalendarItem allAlarms](self, "allAlarms", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    v8 = *MEMORY[0x1E0D0B150];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasChanges"))
        {
          if (!objc_msgSend(v10, "_isOnlyChangedKey:", v8))
            goto LABEL_15;
          v6 = 1;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
LABEL_15:
    v6 = 0;
  }

  return v6;
}

- (void)removeAcknowledgedSnoozedAlarms
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[EKCalendarItem allAlarms](self, "allAlarms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v9, "isSnoozed"))
        {
          objc_msgSend(v9, "acknowledgedDate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
            objc_msgSend(v3, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = v3;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[EKCalendarItem removeAlarm:](self, "removeAlarm:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j), (_QWORD)v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (void)removeAllSnoozedAlarms
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[EKCalendarItem allAlarms](self, "allAlarms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v9, "isSnoozed"))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v6);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v3;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[EKCalendarItem removeAlarm:](self, "removeAlarm:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j), (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (id)recurrenceRuleString
{
  void *v3;
  void *v4;

  -[EKCalendarItem singleRecurrenceRule](self, "singleRecurrenceRule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValueAsDateOnly:isFloating:", -[EKCalendarItem isAllDay](self, "isAllDay"), -[EKCalendarItem isFloating](self, "isFloating"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)singleRecurrenceRule
{
  void *v2;
  void *v3;

  -[EKCalendarItem recurrenceRules](self, "recurrenceRules");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_hadRecurrenceRules
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  char v7;

  if (-[EKObject isNew](self, "isNew"))
  {
    v3 = *MEMORY[0x1E0D0B350];
LABEL_5:
    -[EKObject _previousValueForKey:](self, "_previousValueForKey:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") != 0;
    goto LABEL_6;
  }
  -[EKObject persistentObject](self, "persistentObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D0B350];
  v5 = objc_msgSend(v4, "isPropertyUnavailable:", *MEMORY[0x1E0D0B350]);

  if (!v5)
    goto LABEL_5;
  -[EKObject _previousValueForKey:](self, "_previousValueForKey:", *MEMORY[0x1E0D0B300]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");
LABEL_6:

  return v7;
}

- (void)setRecurrenceRules:(NSArray *)recurrenceRules
{
  void *v4;
  NSArray *v5;

  v5 = recurrenceRules;
  if (v5)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v5);
    -[EKCalendarItem setRecurrenceRulesSet:](self, "setRecurrenceRulesSet:", v4);

  }
  else
  {
    -[EKCalendarItem setRecurrenceRulesSet:](self, "setRecurrenceRulesSet:", 0);
  }

}

- (BOOL)hasComplexRecurrence
{
  void *v2;
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[EKCalendarItem singleRecurrenceRule](self, "singleRecurrenceRule");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isPinnedToEndOfFrequency") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "daysOfTheWeek");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      v3 = 1;
    }
    else
    {
      objc_msgSend(v2, "daysOfTheMonth");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "count"))
      {
        v3 = 1;
      }
      else
      {
        objc_msgSend(v2, "daysOfTheYear");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "count"))
        {
          v3 = 1;
        }
        else
        {
          objc_msgSend(v2, "weeksOfTheYear");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v7, "count"))
          {
            v3 = 1;
          }
          else
          {
            objc_msgSend(v2, "monthsOfTheYear");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v8, "count"))
            {
              v3 = 1;
            }
            else
            {
              objc_msgSend(v2, "setPositions");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              v3 = objc_msgSend(v9, "count") != 0;

            }
          }

        }
      }

    }
  }

  return v3;
}

- (void)pinRecurrenceRuleToEndsOfFreqency
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void *v31;
  _BYTE v32[128];
  _QWORD v33[3];

  v33[1] = *MEMORY[0x1E0C80C00];
  if (!-[EKCalendarItem hasComplexRecurrence](self, "hasComplexRecurrence"))
  {
    -[EKCalendarItem singleRecurrenceRule](self, "singleRecurrenceRule");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "frequency") != 2 && objc_msgSend(v3, "frequency") != 3)
      goto LABEL_28;
    -[EKCalendarItem timeZone](self, "timeZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0C99D48];
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "CalGregorianCalendarForTimeZone:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[EKObject eventStore](self, "eventStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeZone");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "CalGregorianCalendarForTimeZone:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[EKCalendarItem startDateForRecurrence](self, "startDateForRecurrence");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "components:fromDate:", 24, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (objc_msgSend(v3, "frequency") == 2 && (v11 = objc_msgSend(v10, "day"), (unint64_t)(v11 - 29) <= 2))
      {
        v12 = v11;
        v26 = v6;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setSetPositions:", v14);

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v16 = objc_msgSend(&unk_1E47B5BC0, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v28;
LABEL_12:
          v19 = 0;
          while (1)
          {
            if (*(_QWORD *)v28 != v18)
              objc_enumerationMutation(&unk_1E47B5BC0);
            v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v19);
            if (v12 < objc_msgSend(v20, "integerValue"))
              break;
            objc_msgSend(v15, "addObject:", v20);
            if (v17 == ++v19)
            {
              v17 = objc_msgSend(&unk_1E47B5BC0, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
              if (v17)
                goto LABEL_12;
              break;
            }
          }
        }
        objc_msgSend(v3, "setDaysOfTheMonth:", v15);

        v21 = 0;
        v6 = v26;
      }
      else
      {
        v21 = 1;
      }
      if (objc_msgSend(v3, "frequency") == 3 && objc_msgSend(v10, "month") == 2 && objc_msgSend(v10, "day") == 29)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v22;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setSetPositions:", v23);

        v24 = &unk_1E47B5BD8;
        v25 = v3;
LABEL_26:
        objc_msgSend(v25, "setDaysOfTheMonth:", v24);
        goto LABEL_27;
      }
      if (!v21)
      {
LABEL_27:

LABEL_28:
        return;
      }
    }
    objc_msgSend(v3, "setSetPositions:", 0);
    v25 = v3;
    v24 = 0;
    goto LABEL_26;
  }
}

- (void)setRecurrenceRulesSet:(id)a3
{
  -[EKObject updateMeltedAndCachedMultiRelationObjects:forKey:](self, "updateMeltedAndCachedMultiRelationObjects:forKey:", a3, *MEMORY[0x1E0D0B350]);
  -[EKCalendarItem pinRecurrenceRuleToEndsOfFreqency](self, "pinRecurrenceRuleToEndsOfFreqency");
}

- (void)addRecurrenceRule:(EKRecurrenceRule *)rule
{
  -[EKObject addCachedMeltedObject:forMultiValueKey:](self, "addCachedMeltedObject:forMultiValueKey:", rule, *MEMORY[0x1E0D0B350]);
  -[EKCalendarItem pinRecurrenceRuleToEndsOfFreqency](self, "pinRecurrenceRuleToEndsOfFreqency");
}

- (void)removeRecurrenceRule:(EKRecurrenceRule *)rule
{
  -[EKObject removeCachedMeltedObject:forMultiValueKey:](self, "removeCachedMeltedObject:forMultiValueKey:", rule, *MEMORY[0x1E0D0B350]);
}

- (id)startDateForRecurrence
{
  return 0;
}

- (BOOL)_hadAttendees
{
  void *v2;
  char v3;

  -[EKObject _previousValueForKey:](self, "_previousValueForKey:", *MEMORY[0x1E0D0B2F0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setAttendeesRaw:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject updateMeltedAndCachedMultiRelationObjects:forKey:](self, "updateMeltedAndCachedMultiRelationObjects:forKey:", v4, *MEMORY[0x1E0D0B278]);

}

- (void)setAttendees:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EKCalendarItem setAttendeesRaw:](self, "setAttendeesRaw:");
  -[EKCalendarItem selfAttendee](self, "selfAttendee");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_msgSend(v5, "containsObject:", v4) & 1) == 0)
    -[EKCalendarItem _setSelfAttendee:](self, "_setSelfAttendee:", 0);

}

- (void)addAttendee:(id)a3
{
  if (a3)
    -[EKObject addCachedMeltedObject:forMultiValueKey:](self, "addCachedMeltedObject:forMultiValueKey:", a3, *MEMORY[0x1E0D0B278]);
}

- (void)removeAttendee:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    -[EKCalendarItem selfAttendee](self, "selfAttendee");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 == v6)
      -[EKCalendarItem _setSelfAttendee:](self, "_setSelfAttendee:", 0);
    -[EKCalendarItem _removeAttendee:](self, "_removeAttendee:", v6);
    v4 = v6;
  }

}

- (void)_removeAttendee:(id)a3
{
  -[EKObject removeCachedMeltedObject:forMultiValueKey:](self, "removeCachedMeltedObject:forMultiValueKey:", a3, *MEMORY[0x1E0D0B278]);
}

- (void)setSelfAttendee:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v9 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_FAULT))
      -[EKCalendarItem setSelfAttendee:].cold.2(v9);
  }
  else
  {
    -[EKCalendarItem selfAttendee](self, "selfAttendee");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqual:", v5))
    {
      if (v5 != v4)
      {
        v6 = EKLogHandle;
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
          -[EKCalendarItem setSelfAttendee:].cold.1(v6);
      }
    }
    else
    {
      -[EKCalendarItem attendees](self, "attendees");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v4 && (objc_msgSend(v7, "containsObject:", v4) & 1) == 0)
        -[EKCalendarItem addAttendee:](self, "addAttendee:", v4);
      if (v5 && objc_msgSend(v8, "containsObject:", v5))
        -[EKCalendarItem _removeAttendee:](self, "_removeAttendee:", v5);
      -[EKCalendarItem _setSelfAttendee:](self, "_setSelfAttendee:", v4);

    }
  }

}

- (void)_setSelfAttendee:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = *MEMORY[0x1E0D0B358];
  v5 = a3;
  -[EKObject updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:](self, "updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:", v5, v4, +[EKAttendee frozenClass](EKAttendee, "frozenClass"));

}

- (int)selfParticipantStatusRaw
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  int v7;

  if (!-[EKObject isNew](self, "isNew")
    && (-[EKObject isPropertyUnavailable:](self, "isPropertyUnavailable:", *MEMORY[0x1E0D0B358])
     || (-[EKCalendarItem selfAttendee](self, "selfAttendee"),
         v3 = (void *)objc_claimAutoreleasedReturnValue(),
         v4 = objc_msgSend(v3, "isPropertyUnavailable:", *MEMORY[0x1E0D0B248]),
         v3,
         v4)))
  {
    -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B360]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");
  }
  else
  {
    -[EKCalendarItem selfAttendee](self, "selfAttendee");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = EKParticipantStatusToCalAttendeeStatus(objc_msgSend(v5, "participantStatus"));
  }
  v7 = v6;

  return v7;
}

- (int64_t)selfParticipantStatus
{
  return CalAttendeeStatusToEKParticipantStatus(-[EKCalendarItem selfParticipantStatusRaw](self, "selfParticipantStatusRaw"));
}

- (id)participantMatchingContact:(id)a3
{
  id v4;
  EKParticipantToContactMatcher *v5;
  void *v6;
  EKParticipantToContactMatcher *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v4 = a3;
  v5 = [EKParticipantToContactMatcher alloc];
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[EKParticipantToContactMatcher initWithContacts:](v5, "initWithContacts:", v6);
  -[EKParticipantToContactMatcher matchingParticipantsFromItem:](v7, "matchingParticipantsFromItem:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)attendeeMatchingEmailAddress:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[EKCalendarItem attendees](self, "attendees", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "emailAddress");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)setOrganizer:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = *MEMORY[0x1E0D0B330];
  v5 = a3;
  -[EKObject updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:](self, "updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:", v5, v4, +[EKOrganizer frozenClass](EKOrganizer, "frozenClass"));

}

- (void)addOrganizerAndSelfAttendeeForNewInvitation
{
  id v3;

  -[EKCalendarItem calendar](self, "calendar");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem _addOrganizerAndSelfAttendeeForNewInvitationInCalendar:](self, "_addOrganizerAndSelfAttendeeForNewInvitationInCalendar:", v3);

}

- (void)_addOrganizerAndSelfAttendeeForNewInvitationInCalendar:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  id v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[EKCalendarItem hasAttendees](self, "hasAttendees")
    && (!-[EKCalendarItem hasAttendees](self, "hasAttendees") || !-[EKCalendarItem _hadAttendees](self, "_hadAttendees")))
  {
    -[EKCalendarItem organizer](self, "organizer");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5
      || (v6 = (void *)v5,
          -[EKCalendarItem organizer](self, "organizer"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "scheduleAgent"),
          v7,
          v6,
          v8))
    {
      -[EKCalendarItem organizer](self, "organizer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        objc_msgSend(v4, "ownerIdentityOrganizer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setCurrentUser:", 1);
        if (v9)
        {
          objc_msgSend(v4, "source");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "sourceType");

          if (v11 > 3)
            v12 = 0;
          else
            v12 = qword_1A244A368[v11];
          objc_msgSend(v9, "setScheduleAgent:", v12);
          -[EKCalendarItem setOrganizer:](self, "setOrganizer:", v9);
        }
      }
      objc_msgSend(v4, "source");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "usesSelfAttendee") & 1) != 0)
      {
        -[EKCalendarItem selfAttendee](self, "selfAttendee");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          -[EKCalendarItem attendeesRaw](self, "attendeesRaw");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "emailAddress");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "phoneNumber");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "URL");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[EKAttendee attendeeWithName:emailAddress:phoneNumber:url:](EKAttendee, "attendeeWithName:emailAddress:phoneNumber:url:", v16, v17, v18, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v31 = 0u;
          v32 = 0u;
          v29 = 0u;
          v30 = 0u;
          v21 = v15;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v30;
            while (2)
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v30 != v24)
                  objc_enumerationMutation(v21);
                v26 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
                if (objc_msgSend(v26, "isEqualToParticipant:", v20, (_QWORD)v29))
                {
                  v27 = v26;

                  v20 = v27;
                  goto LABEL_25;
                }
              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
              if (v23)
                continue;
              break;
            }
          }
LABEL_25:

          -[EKCalendarItem setSelfAttendee:](self, "setSelfAttendee:", v20);
          -[EKCalendarItem selfAttendee](self, "selfAttendee");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setParticipantStatus:", 2);

        }
      }
      else
      {

      }
    }
  }

}

- (void)removeLastExtraneousOrganizerAndSelfAttendee
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  -[EKCalendarItem attendees](self, "attendees");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") == 1)
  {
    -[EKCalendarItem selfAttendee](self, "selfAttendee");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarItem organizer](self, "organizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isEqualToParticipant:", v4);

    if (v5)
    {
      -[EKCalendarItem setSelfAttendee:](self, "setSelfAttendee:", 0);
      -[EKCalendarItem setOrganizer:](self, "setOrganizer:", 0);
    }
  }
  else
  {

  }
}

- (id)sharedItemCreatedByDisplayName
{
  void *v3;
  void *v4;
  void *v5;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B378]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[EKCalendarItem sharedItemCreatedByFirstName](self, "sharedItemCreatedByFirstName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarItem sharedItemCreatedByLastName](self, "sharedItemCreatedByLastName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    DisplayNameStringForIdentityWithProperties();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setSharedItemCreatedByDisplayName:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B378]);
}

- (id)sharedItemCreatedByAddressString
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B370]);
}

- (void)setSharedItemCreatedByAddressString:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B370]);
}

- (id)sharedItemCreatedByAddress
{
  void *v2;
  void *v3;

  -[EKCalendarItem sharedItemCreatedByAddressString](self, "sharedItemCreatedByAddressString");
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

  return v3;
}

- (void)setSharedItemCreatedByAddress:(id)a3
{
  id v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem setSharedItemCreatedByAddressString:](self, "setSharedItemCreatedByAddressString:", v4);

}

- (id)sharedItemCreatedByFirstName
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B380]);
}

- (void)setSharedItemCreatedByFirstName:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B380]);
}

- (id)sharedItemCreatedByLastName
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B388]);
}

- (void)setSharedItemCreatedByLastName:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B388]);
}

- (id)sharedItemCreatedDate
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B390]);
}

- (void)setSharedItemCreatedDate:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B390]);
}

- (id)sharedItemCreatedTimeZoneName
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B398]);
}

- (void)setSharedItemCreatedTimeZoneName:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B398]);
}

- (id)sharedItemCreatedTimeZone
{
  void *v2;
  void *v3;

  -[EKCalendarItem sharedItemCreatedTimeZoneName](self, "sharedItemCreatedTimeZoneName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKCalendarItem timeZoneFromTimeZoneName:withFloatingTimeZone:](EKCalendarItem, "timeZoneFromTimeZoneName:withFloatingTimeZone:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setSharedItemCreatedTimeZone:(id)a3
{
  id v4;

  +[EKCalendarItem timeZoneNameFromTimeZone:](EKCalendarItem, "timeZoneNameFromTimeZone:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem setSharedItemCreatedTimeZoneName:](self, "setSharedItemCreatedTimeZoneName:", v4);

}

- (id)sharedItemModifiedByDisplayName
{
  void *v3;
  void *v4;
  void *v5;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B3A8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[EKCalendarItem sharedItemModifiedByFirstName](self, "sharedItemModifiedByFirstName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarItem sharedItemModifiedByLastName](self, "sharedItemModifiedByLastName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    DisplayNameStringForIdentityWithProperties();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setSharedItemModifiedByDisplayName:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B3A8]);
}

- (id)sharedItemModifiedByAddressString
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B3A0]);
}

- (void)setSharedItemModifiedByAddressString:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B3A0]);
}

- (id)sharedItemModifiedByAddress
{
  void *v2;
  void *v3;

  -[EKCalendarItem sharedItemModifiedByAddressString](self, "sharedItemModifiedByAddressString");
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

  return v3;
}

- (void)setSharedItemModifiedByAddress:(id)a3
{
  id v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem setSharedItemModifiedByAddressString:](self, "setSharedItemModifiedByAddressString:", v4);

}

- (id)sharedItemModifiedByFirstName
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B3B0]);
}

- (void)setSharedItemModifiedByFirstName:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B3B0]);
}

- (id)sharedItemModifiedByLastName
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B3B8]);
}

- (void)setSharedItemModifiedByLastName:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B3B8]);
}

- (id)sharedItemModifiedDate
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B3C0]);
}

- (void)setSharedItemModifiedDate:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B3C0]);
}

- (id)sharedItemModifiedTimeZoneName
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B3C8]);
}

- (void)setSharedItemModifiedTimeZoneName:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B3C8]);
}

- (id)sharedItemModifiedTimeZone
{
  void *v2;
  void *v3;

  -[EKCalendarItem sharedItemModifiedTimeZoneName](self, "sharedItemModifiedTimeZoneName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKCalendarItem timeZoneFromTimeZoneName:withFloatingTimeZone:](EKCalendarItem, "timeZoneFromTimeZoneName:withFloatingTimeZone:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setSharedItemModifiedTimeZone:(id)a3
{
  id v4;

  +[EKCalendarItem timeZoneNameFromTimeZone:](EKCalendarItem, "timeZoneNameFromTimeZone:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem setSharedItemModifiedTimeZoneName:](self, "setSharedItemModifiedTimeZoneName:", v4);

}

- (id)attachmentsSet
{
  return -[EKObject meltedAndCachedMultiRelationObjectsForKey:](self, "meltedAndCachedMultiRelationObjectsForKey:", *MEMORY[0x1E0D0B270]);
}

- (void)setAttachmentsSet:(id)a3
{
  -[EKObject updateMeltedAndCachedMultiRelationObjects:forKey:](self, "updateMeltedAndCachedMultiRelationObjects:forKey:", a3, *MEMORY[0x1E0D0B270]);
}

- (NSArray)attachments
{
  void *v2;
  void *v3;

  -[EKCalendarItem attachmentsSet](self, "attachmentsSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSArray *)v3;
}

- (void)setAttachments:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem setAttachmentsSet:](self, "setAttachmentsSet:", v4);

}

- (void)addAttachment:(id)a3
{
  -[EKObject addCachedMeltedObject:forMultiValueKey:](self, "addCachedMeltedObject:forMultiValueKey:", a3, *MEMORY[0x1E0D0B270]);
}

- (void)removeAttachment:(id)a3
{
  -[EKObject removeCachedMeltedObject:forMultiValueKey:](self, "removeCachedMeltedObject:forMultiValueKey:", a3, *MEMORY[0x1E0D0B270]);
}

- (BOOL)hasAttachment
{
  void *v2;
  BOOL v3;

  -[EKCalendarItem attachments](self, "attachments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)canMoveToCalendar:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[EKCalendarItem calendar](self, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[EKCalendarItem canMoveToCalendar:fromCalendar:error:](self, "canMoveToCalendar:fromCalendar:error:", v6, v7, a4);

  return (char)a4;
}

- (BOOL)canMoveToCalendar:(id)a3 fromCalendar:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  char v22;
  int v23;
  char v24;
  uint64_t v25;

  v8 = a3;
  v9 = a4;
  if (a5)
    *a5 = 0;
  -[EKObject eventStore](self, "eventStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "eventAccessLevel") == 1)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[EKObject eventStore](self, "eventStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKObject CADObjectID](self, "CADObjectID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cachedConstraintsForEventOrSourceWithCADObjectID:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = v14;
        v16 = v15;
        if (!v9)
          goto LABEL_13;
        goto LABEL_10;
      }
    }
  }
  else
  {

  }
  objc_msgSend(v9, "constraints");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  if (!v9)
    goto LABEL_13;
LABEL_10:
  if ((objc_msgSend(v9, "allowsContentModifications") & 1) == 0
    && (objc_msgSend(v9, "isMutableSuggestionsCalendar") & 1) == 0
    && (objc_msgSend(v9, "isMutableNaturalLanguageSuggestionsCalendar") & 1) == 0)
  {
LABEL_20:
    if (a5)
    {
      v25 = 6;
      goto LABEL_22;
    }
LABEL_26:
    v24 = 0;
    goto LABEL_27;
  }
LABEL_13:
  if ((objc_msgSend(v8, "allowsContentModifications") & 1) == 0)
    goto LABEL_20;
  -[EKCalendarItem organizer](self, "organizer");
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v17 || (v18 = (void *)v17, v19 = -[EKCalendarItem hasAttendees](self, "hasAttendees"), v18, !v19))
  {
    v24 = 1;
    goto LABEL_27;
  }
  objc_msgSend(v8, "source");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "source");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqual:", v21);

  if ((v22 & 1) == 0)
  {
    if (a5)
    {
      v25 = 43;
      goto LABEL_22;
    }
    goto LABEL_26;
  }
  v23 = objc_msgSend(v15, "requiresOutgoingInvitationsInDefaultCalendar");
  v24 = v23 ^ 1;
  if (a5 && v23)
  {
    v25 = 12;
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", v25);
    v24 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_27:

  return v24;
}

- (id)propertiesThatCanBeModifiedOnReadOnlyCalendars
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[EKCalendarItem calendar](self, "calendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  if (v3 == 4)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    v5 = *MEMORY[0x1E0D0B2A0];
    v9[0] = *MEMORY[0x1E0D0B268];
    v9[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v4, "setWithArray:", v6);

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B3F8]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)validate:(id *)a3
{
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  id v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  BOOL v30;
  void *v31;
  objc_super v33;

  -[EKObject changeSet](self, "changeSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasUnsavedChangeForKey:", *MEMORY[0x1E0D0B2A8]);

  if (!v7)
  {
    v33.receiver = self;
    v33.super_class = (Class)EKCalendarItem;
    v11 = -[EKObject validate:](&v33, sel_validate_, a3);
    if (!v11)
      return v11;
    -[EKCalendarItem calendar](self, "calendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      if (a3)
      {
        v8 = (void *)MEMORY[0x1E0CB35C8];
        v9 = 1;
        goto LABEL_4;
      }
      goto LABEL_37;
    }
    -[EKCalendarItem calendar](self, "calendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "allowsContentModifications") & 1) == 0)
    {
      -[EKCalendarItem calendar](self, "calendar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "isMutableSuggestionsCalendar") & 1) == 0)
      {
        -[EKCalendarItem calendar](self, "calendar");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isMutableNaturalLanguageSuggestionsCalendar") & 1) == 0)
        {
          -[EKObject eventStore](self, "eventStore");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v16, "skipModificationValidation") & 1) == 0)
          {
            -[EKCalendarItem propertiesThatCanBeModifiedOnReadOnlyCalendars](self, "propertiesThatCanBeModifiedOnReadOnlyCalendars");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = -[EKObject _areOnlyChangedKeys:](self, "_areOnlyChangedKeys:", v29);

            if (!v30)
            {
              if (a3)
              {
                v8 = (void *)MEMORY[0x1E0CB35C8];
                v9 = 6;
                goto LABEL_4;
              }
              goto LABEL_37;
            }
            goto LABEL_15;
          }

        }
      }

    }
LABEL_15:
    v17 = *MEMORY[0x1E0D0B280];
    if (-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B280])
      && !-[EKObject isNew](self, "isNew"))
    {
      -[EKObject committedValueForKey:](self, "committedValueForKey:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKCalendarItem.m"), 1934, CFSTR("Committed Value class is incorrect!"));

      }
      -[EKCalendarItem calendar](self, "calendar");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[EKCalendarItem canMoveToCalendar:fromCalendar:error:](self, "canMoveToCalendar:fromCalendar:error:", v19, v18, a3);

      if (!v20)
        goto LABEL_37;
    }
    -[EKCalendarItem constraints](self, "constraints");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "supportsStructuredLocations"))
      goto LABEL_23;
    -[EKCalendarItem calendar](self, "calendar");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isSuggestedEventCalendar"))
    {

LABEL_23:
LABEL_24:
      LOBYTE(v11) = 1;
      return v11;
    }
    -[EKCalendarItem calendar](self, "calendar");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isNaturalLanguageSuggestedEventCalendar");

    if ((v24 & 1) != 0)
      goto LABEL_24;
    if (!-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B3E0])
      || (-[EKCalendarItem structuredLocation](self, "structuredLocation"),
          v25 = (void *)objc_claimAutoreleasedReturnValue(),
          v26 = objc_msgSend(v25, "isStructured"),
          v25,
          !v26))
    {
      if (!-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B400]))
        goto LABEL_24;
      -[EKCalendarItem travelStartLocation](self, "travelStartLocation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isStructured");

      if (!v28)
        goto LABEL_24;
    }
    if (a3)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = 19;
      goto LABEL_4;
    }
LABEL_37:
    LOBYTE(v11) = 0;
    return v11;
  }
  if (!a3)
    goto LABEL_37;
  v8 = (void *)MEMORY[0x1E0CB35C8];
  v9 = 67;
LABEL_4:
  objc_msgSend(v8, "errorWithEKErrorCode:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = 0;
  *a3 = v10;
  return v11;
}

- (void)moveToCalendar:(id)a3
{
  -[EKCalendarItem _moveToCalendar:forSavingItem:](self, "_moveToCalendar:forSavingItem:", a3, self);
}

+ (BOOL)_shouldDeleteAndAddForMoveFromCalendar:(id)a3 toCalendar:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqual:", v8))
  {
    objc_msgSend(v5, "constraints");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "shouldUseDeleteAndAddInsteadOfMoveBetweenCalendars");

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (BOOL)hasCalendarChangeThatRequiresDeleteAndAdd
{
  uint64_t v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v3 = *MEMORY[0x1E0D0B280];
  v4 = -[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B280]);
  if (v4)
  {
    -[EKCalendarItem calendar](self, "calendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKObject _previousValueForKey:](self, "_previousValueForKey:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKObject eventStore](self, "eventStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "meltedObjectInStore:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend((id)objc_opt_class(), "_shouldDeleteAndAddForMoveFromCalendar:toCalendar:", v8, v5);
    LOBYTE(v4) = v9;
  }
  return v4;
}

- (BOOL)hasRecurrenceRuleAdditionOrRemoval
{
  BOOL v3;

  v3 = -[EKCalendarItem _hadRecurrenceRules](self, "_hadRecurrenceRules");
  return v3 ^ -[EKCalendarItem hasRecurrenceRules](self, "hasRecurrenceRules");
}

- (void)_moveToCalendar:(id)a3 forSavingItem:(id)a4
{
  id v6;
  EKCalendarItem *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  EKCalendarItem *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char isKindOfClass;
  void *v33;
  void *v34;
  EKCalendarItem *v35;
  id v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  EKCalendarItem *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[5];
  _QWORD v48[4];
  id v49;
  EKCalendarItem *v50;
  EKCalendarItem *v51;
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (EKCalendarItem *)a4;
  -[EKCalendarItem originalItem](self, "originalItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    -[EKObject _previousValueForKey:](self, "_previousValueForKey:", *MEMORY[0x1E0D0B280]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKObject eventStore](self, "eventStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "meltedObjectInStore:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v12, "isEqual:", v6) & 1) != 0)
    {
LABEL_27:

      goto LABEL_28;
    }
    v37 = v12;
    if (objc_msgSend((id)objc_opt_class(), "_shouldDeleteAndAddForMoveFromCalendar:toCalendar:", v12, v6))
    {
      if (_moveToCalendar_forSavingItem__onceToken != -1)
        dispatch_once(&_moveToCalendar_forSavingItem__onceToken, &__block_literal_global_89);
      -[EKCalendarItem detachedItems](self, "detachedItems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v14 + 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v14);
      -[EKObject changeSet](v7, "changeSet");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "copy");
      objc_msgSend(v18, "removeAllChangesExceptRemovals");
      v19 = -[EKObject copyMeltedObjectCache](v7, "copyMeltedObjectCache");
      -[EKObject setChangeSet:](v7, "setChangeSet:", v18);
      -[EKObject _resetAfterUpdatingChangeSetOrBackingObject](v7, "_resetAfterUpdatingChangeSetOrBackingObject");
      -[EKCalendarItem setCalendar:](v7, "setCalendar:", v6);
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __48__EKCalendarItem__moveToCalendar_forSavingItem___block_invoke_2;
      v48[3] = &unk_1E47859F8;
      v20 = v15;
      v49 = v20;
      v50 = self;
      v21 = v7;
      v51 = v21;
      v22 = v16;
      v52 = v22;
      -[EKCalendarItem _recursivelyPerformBlockOnSelfAndDetachedItems:forSavingItem:](self, "_recursivelyPerformBlockOnSelfAndDetachedItems:forSavingItem:", v48, v21);
      -[EKObject updatePersistentObject](v21, "updatePersistentObject");
      -[EKObject setChangeSet:](v21, "setChangeSet:", v17);
      -[EKObject _resetAfterUpdatingChangeSetOrBackingObject](v21, "_resetAfterUpdatingChangeSetOrBackingObject");
      -[EKObject augmentMeltedObjectCache:](v21, "augmentMeltedObjectCache:", v19);
      -[EKObject setCachedMeltedObjects:forMultiValueKey:](self, "setCachedMeltedObjects:forMultiValueKey:", v22, *MEMORY[0x1E0D0B2A8]);
      if (v21 != self)
        -[EKCalendarItem setOriginalItem:](v21, "setOriginalItem:", self);
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __48__EKCalendarItem__moveToCalendar_forSavingItem___block_invoke_3;
      v47[3] = &unk_1E4785A20;
      v47[4] = self;
      -[EKCalendarItem _recursivelyPerformBlockOnSelfAndDetachedItems:forSavingItem:](self, "_recursivelyPerformBlockOnSelfAndDetachedItems:forSavingItem:", v47, v21);

    }
    else
    {
      v20 = 0;
    }
    -[EKCalendarItem _setCalendarRecursively:forSavingItem:](self, "_setCalendarRecursively:forSavingItem:", v6, v7);
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v23 = v20;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v44 != v26)
            objc_enumerationMutation(v23);
          v28 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          -[EKObject eventStore](self, "eventStore");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "_deleteObject:", v28);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
      }
      while (v25);
    }

    if (self != v7)
    {
      -[EKObject eventStore](self, "eventStore");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "_addObjectToPendingCommits:", self);

    }
    -[EKObject eventStore](self, "eventStore");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v37;
    if (objc_msgSend(v31, "eventAccessLevel") == 1)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v34 = 0;
        goto LABEL_26;
      }
      -[EKObject eventStore](self, "eventStore");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKObject CADObjectID](self, "CADObjectID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "cachedConstraintsForEventOrSourceWithCADObjectID:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v34 = 0;
    }

LABEL_26:
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __48__EKCalendarItem__moveToCalendar_forSavingItem___block_invoke_4;
    v38[3] = &unk_1E47859F8;
    v39 = v37;
    v40 = v6;
    v41 = v34;
    v35 = v7;
    v42 = v35;
    v36 = v34;
    -[EKCalendarItem _recursivelyPerformBlockOnSelfAndDetachedItems:forSavingItem:](self, "_recursivelyPerformBlockOnSelfAndDetachedItems:forSavingItem:", v38, v35);
    -[EKCalendarItem _updatePersistentObjectOfSelfAndDetachedItemsExceptForSavingItem:](self, "_updatePersistentObjectOfSelfAndDetachedItemsExceptForSavingItem:", v35);

    goto LABEL_27;
  }
  objc_msgSend(v8, "_moveToCalendar:forSavingItem:", v6, v7);
LABEL_28:

}

void __48__EKCalendarItem__moveToCalendar_forSavingItem___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0D0B3F8];
  v6[0] = *MEMORY[0x1E0D0B620];
  v6[1] = v1;
  v2 = *MEMORY[0x1E0D0B358];
  v6[2] = *MEMORY[0x1E0D0B2A8];
  v6[3] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_moveToCalendar_forSavingItem__propertiesToSkip;
  _moveToCalendar_forSavingItem__propertiesToSkip = v4;

}

void __48__EKCalendarItem__moveToCalendar_forSavingItem___block_invoke_2(id *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "persistentObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "addObject:", v3);
  objc_msgSend(v14, "calendarItemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "selfAttendee");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rebaseSkippingRelationProperties:", _moveToCalendar_forSavingItem__propertiesToSkip);
  objc_msgSend(v14, "setCalendarItemIdentifier:", v4);
  objc_msgSend(v14, "persistentObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addCoCommitObject:", v3);

  objc_msgSend(v14, "insertPersistentObjectIfNeeded");
  if (v5)
  {
    objc_msgSend(v14, "changeSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "persistentObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "forceChangeValue:forKey:", v8, *MEMORY[0x1E0D0B358]);

  }
  if (a1[5] != v14)
  {
    objc_msgSend(v14, "frozenObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "addMultiChangedObjectValue:forKey:", v9, *MEMORY[0x1E0D0B2A8]);
    objc_msgSend(a1[5], "persistentObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addCoCommitObject:", v9);

    v11 = a1[7];
    if (a1[6] == v14)
    {
      objc_msgSend(a1[5], "eventStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "meltedObjectInStore:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v13);

    }
    else
    {
      objc_msgSend(a1[7], "addObject:");
    }

  }
}

void __48__EKCalendarItem__moveToCalendar_forSavingItem___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_generateNewUniqueID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUniqueID:", v4);

}

uint64_t __48__EKCalendarItem__moveToCalendar_forSavingItem___block_invoke_4(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "_adjustAfterMovingOrCopyingFromOldCalendar:toNewCalendar:cachedConstraintsForOldCalendar:savingItem:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)_updatePersistentObjectOfSelfAndDetachedItemsExceptForSavingItem:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__EKCalendarItem__updatePersistentObjectOfSelfAndDetachedItemsExceptForSavingItem___block_invoke;
  v6[3] = &unk_1E4785A20;
  v7 = v4;
  v5 = v4;
  -[EKCalendarItem _recursivelyPerformBlockOnSelfAndDetachedItems:forSavingItem:](self, "_recursivelyPerformBlockOnSelfAndDetachedItems:forSavingItem:", v6, v5);

}

void __83__EKCalendarItem__updatePersistentObjectOfSelfAndDetachedItemsExceptForSavingItem___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(void **)(a1 + 32) != a2)
  {
    v2 = (void *)MEMORY[0x1E0C99E60];
    v7 = *MEMORY[0x1E0D0B2A8];
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = a2;
    objc_msgSend(v3, "arrayWithObjects:count:", &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setWithArray:", v5, v7, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updatePersistentObjectSkippingProperties:", v6);

    objc_msgSend(v4, "insertPersistentObjectIfNeeded");
  }
}

- (void)_setCalendarRecursively:(id)a3 forSavingItem:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__EKCalendarItem__setCalendarRecursively_forSavingItem___block_invoke;
  v8[3] = &unk_1E4785A20;
  v9 = v6;
  v7 = v6;
  -[EKCalendarItem _recursivelyPerformBlockOnSelfAndDetachedItems:forSavingItem:](self, "_recursivelyPerformBlockOnSelfAndDetachedItems:forSavingItem:", v8, a4);

}

void __56__EKCalendarItem__setCalendarRecursively_forSavingItem___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setCalendar:", v2);
  objc_msgSend(v3, "_resetFieldsAfterMovingToNewCalendar");

}

- (void)_resetFieldsAfterMovingToNewCalendar
{
  -[EKCalendarItem setExternalID:](self, "setExternalID:", 0);
}

- (void)_recursivelyPerformBlockOnSelfAndDetachedItems:(id)a3 forSavingItem:(id)a4
{
  void (**v6)(id, id);
  id v7;
  EKCalendarItem *v8;
  EKCalendarItem *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, id))a3;
  v7 = a4;
  v8 = self;
  v9 = v8;
  if (-[EKObject isEqual:](v8, "isEqual:", v7))
  {
    v9 = (EKCalendarItem *)v7;

  }
  -[EKCalendarItem detachedItems](v8, "detachedItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v9);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "_recursivelyPerformBlockOnSelfAndDetachedItems:forSavingItem:", v6, v7, (_QWORD)v16);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (void)setOriginalItem:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    v5 = objc_opt_class();
    if (v5 != objc_opt_class())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKCalendarItem.m"), 2193, CFSTR("Original item class must match our class"));

    }
  }
  -[EKObject updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:](self, "updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:", v7, *MEMORY[0x1E0D0B338], objc_msgSend((id)objc_opt_class(), "frozenClass"));

}

- (void)setDetachedItems:(id)a3
{
  -[EKObject updateMeltedAndCachedMultiRelationObjects:forKey:](self, "updateMeltedAndCachedMultiRelationObjects:forKey:", a3, *MEMORY[0x1E0D0B2A8]);
}

- (void)_removeDetachedItem:(id)a3
{
  -[EKObject removeCachedMeltedObject:forMultiValueKey:](self, "removeCachedMeltedObject:forMultiValueKey:", a3, *MEMORY[0x1E0D0B2A8]);
}

- (void)_deleteSelfAndDetached
{
  id v3;

  -[EKObject persistentObject](self, "persistentObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem _deletePersistentItemAndDetachedItems:forSavingItem:](self, "_deletePersistentItemAndDetachedItems:forSavingItem:", v3, self);

}

- (void)setEkExceptionDates:(id)a3
{
  -[EKObject updateMeltedAndCachedMultiRelationObjects:forKey:](self, "updateMeltedAndCachedMultiRelationObjects:forKey:", a3, *MEMORY[0x1E0D0B2B0]);
}

- (id)exceptionDatesAdjustedForFloatingEvents
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (-[EKCalendarItem isFloating](self, "isFloating") && !-[EKCalendarItem isAllDay](self, "isAllDay"))
  {
    -[EKCalendarItem exceptionDates](self, "exceptionDates");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          -[EKCalendarItem timeZone](self, "timeZone", (_QWORD)v17);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            v14 = v12;
          }
          else
          {
            -[EKObject eventStore](self, "eventStore");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "timeZone");
            v14 = (id)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v11, "dateInTimeZone:fromTimeZone:", v14, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v16);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    return v5;
  }
  else
  {
    -[EKCalendarItem exceptionDates](self, "exceptionDates");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)setExceptionDates:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  EKExceptionDate *v12;
  EKExceptionDate *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v12 = [EKExceptionDate alloc];
        v13 = -[EKExceptionDate initWithDate:](v12, "initWithDate:", v11, (_QWORD)v14);
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[EKCalendarItem setEkExceptionDates:](self, "setEkExceptionDates:", v5);
}

- (void)_addExceptionDate:(id)a3
{
  id v4;
  EKExceptionDate *v5;

  v4 = a3;
  v5 = -[EKExceptionDate initWithDate:]([EKExceptionDate alloc], "initWithDate:", v4);

  -[EKObject addCachedMeltedObject:forMultiValueKey:](self, "addCachedMeltedObject:forMultiValueKey:", v5, *MEMORY[0x1E0D0B2B0]);
}

- (void)_removeExceptionDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[EKCalendarItem ekExceptionDates](self, "ekExceptionDates", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
      objc_msgSend(v10, "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToDate:", v4);

      if ((v12 & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    v13 = v10;

    if (!v13)
      goto LABEL_13;
    -[EKObject removeCachedMeltedObject:forMultiValueKey:](self, "removeCachedMeltedObject:forMultiValueKey:", v13, *MEMORY[0x1E0D0B2B0]);
    v5 = v13;
  }
LABEL_12:

LABEL_13:
}

- (void)_deletePersistentItemAndDetachedItems:(id)a3 forSavingItem:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[EKCalendarItem _recursivelyPerformBlockOnSelfAndDetachedItems:forSavingItem:](self, "_recursivelyPerformBlockOnSelfAndDetachedItems:forSavingItem:", &__block_literal_global_96, a4);
  -[EKObject eventStore](self, "eventStore");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_deleteObject:", v6);

}

uint64_t __70__EKCalendarItem__deletePersistentItemAndDetachedItems_forSavingItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDetachedItems:", 0);
}

- (void)_updateModifiedAlarmByAcknowledging
{
  _BOOL4 v3;
  unsigned int v4;
  uint64_t v5;

  v3 = -[EKCalendarItem isOnlyAlarmAcknowledgedPropertyDirty](self, "isOnlyAlarmAcknowledgedPropertyDirty");
  v4 = -[EKCalendarItem modifiedProperties](self, "modifiedProperties");
  if (v3)
  {
    v5 = v4 | 0x1000;
  }
  else
  {
    if ((v4 & 0x1000) == 0)
      return;
    v5 = -[EKCalendarItem modifiedProperties](self, "modifiedProperties") & 0xFFFFEFFFLL;
  }
  -[EKCalendarItem setModifiedProperties:](self, "setModifiedProperties:", v5);
}

- (void)_willSave
{
  void *v3;
  id v4;

  -[EKCalendarItem uniqueID](self, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[EKCalendarItem _generateNewUniqueID](self, "_generateNewUniqueID");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[EKCalendarItem setUniqueID:](self, "setUniqueID:", v4);

  }
}

+ (id)timeZoneNameFromTimeZone:(id)a3
{
  if (!a3)
    return CFSTR("_float");
  objc_msgSend(a3, "name");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)canonicalizedEqualityTestValue1:(id)a3 value2:(id)a4 key:(id)a5 object1:(id)a6 object2:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  unsigned __int8 v17;
  objc_super v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if ((objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D0B310]) & 1) != 0)
  {
    v17 = 1;
  }
  else
  {
    v19.receiver = a1;
    v19.super_class = (Class)&OBJC_METACLASS___EKCalendarItem;
    v17 = objc_msgSendSuper2(&v19, sel_canonicalizedEqualityTestValue1_value2_key_object1_object2_, v12, v13, v14, v15, v16);
  }

  return v17;
}

- (void)updateWithVCSEntity:(id)a3 inCalendar:(id)a4
{
  id v6;
  void *v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _UNKNOWN **v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  _UNKNOWN **v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  EKCalendarItem *v67;
  id v68;
  uint64_t v69;
  void *v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v68 = a3;
  v6 = a4;
  -[EKCalendarItem timeZone](self, "timeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[EKObject eventStore](self, "eventStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeZone");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  v66 = v6;
  -[EKCalendarItem setCalendar:](self, "setCalendar:", v6);
  objc_msgSend(v68, "propertyForName:", CFSTR("DESCRIPTION"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "singleValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem setNotes:](self, "setNotes:", v13);

  objc_msgSend(v68, "propertyForName:", CFSTR("SEQUENCE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "singleValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "value");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem setSequenceNumber:](self, "setSequenceNumber:", objc_msgSend(v16, "intValue"));

  objc_msgSend(v68, "propertyForName:", CFSTR("CREATED"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "singleValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "value");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = v19;
  v71 = v9;
  objc_msgSend(v19, "nsDateWithLocalTimeZone:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItem setCreationDate:](self, "setCreationDate:", v20);

  objc_msgSend(v68, "propertyForName:", CFSTR("SUMMARY"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "singleValue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "value");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  if (v23)
    v25 = (const __CFString *)v23;
  else
    v25 = &stru_1E4789A58;
  -[EKCalendarItem setTitle:](self, "setTitle:", v25);

  objc_msgSend(v68, "propertyForName:", CFSTR("URL"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "singleValue");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "value");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = self;
  -[EKCalendarItem setURL:](self, "setURL:", v28);

  v29 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v68, "alarms");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "arrayWithCapacity:", objc_msgSend(v30, "count"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  objc_msgSend(v68, "alarms");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v77 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
        v37 = objc_msgSend(v36, "triggerType");
        if (v37 == 1)
        {
          objc_msgSend(v36, "triggerDuration");
          +[EKAlarm alarmWithRelativeOffset:](EKAlarm, "alarmWithRelativeOffset:");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else if (v37)
        {
          v40 = 0;
        }
        else
        {
          objc_msgSend(v36, "triggerDate");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "nsDateWithLocalTimeZone:", v9);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          +[EKAlarm alarmWithAbsoluteDate:](EKAlarm, "alarmWithAbsoluteDate:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v41 = objc_msgSend(v36, "alarmType");
        if (v41 <= 3)
          objc_msgSend(v40, "setType:", qword_1A244A388[v41]);
        if (objc_msgSend(v40, "type") != 3 && objc_msgSend(v40, "type") != 2)
          objc_msgSend(v70, "addObject:", v40);

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
    }
    while (v33);
  }

  -[EKCalendarItem setAlarms:](v67, "setAlarms:", v70);
  objc_msgSend(v68, "propertyForName:", CFSTR("ATTACH"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "values");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v43, "count"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v45 = v43;
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
  if (v46)
  {
    v47 = v46;
    v48 = 1;
    v49 = &off_1E4782000;
    v50 = *(_QWORD *)v73;
    do
    {
      v51 = 0;
      v69 = v47;
      do
      {
        if (*(_QWORD *)v73 != v50)
          objc_enumerationMutation(v45);
        v52 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v51);
        v53 = objc_alloc_init((Class)v49[342]);
        objc_msgSend(v52, "value");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setURL:", v54);

        objc_msgSend(v53, "fileNameRaw");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v55, "length");

        if (!v56)
        {
          if (v48 == 1)
          {
            objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "localizedStringForKey:value:table:", CFSTR("Attachment"), &stru_1E4789A58, 0);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v59 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "localizedStringForKey:value:table:", CFSTR("Attachment %lu"), &stru_1E4789A58, 0);
            v60 = v50;
            v61 = v44;
            v62 = v49;
            v63 = v45;
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "localizedStringWithFormat:", v64, v48);
            v58 = (void *)objc_claimAutoreleasedReturnValue();

            v45 = v63;
            v49 = v62;
            v44 = v61;
            v50 = v60;
            v47 = v69;
          }

          objc_msgSend(v53, "setFileNameRaw:", v58);
          ++v48;

        }
        objc_msgSend(v44, "addObject:", v53);

        ++v51;
      }
      while (v47 != v51);
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
    }
    while (v47);
  }

  -[EKCalendarItem setAttachments:](v67, "setAttachments:", v44);
}

+ (id)EKObjectChangeSummarizer_singleValueDiffKeys
{
  if (EKObjectChangeSummarizer_singleValueDiffKeys_onceToken_98 != -1)
    dispatch_once(&EKObjectChangeSummarizer_singleValueDiffKeys_onceToken_98, &__block_literal_global_99);
  return (id)EKObjectChangeSummarizer_singleValueDiffKeys_diffKeys_97;
}

void __88__EKCalendarItem_EKObjectChangeSummarizer__EKObjectChangeSummarizer_singleValueDiffKeys__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[11];
  _QWORD v8[12];

  v8[11] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B410];
  v7[0] = *MEMORY[0x1E0D0B280];
  v7[1] = v0;
  v8[0] = CFSTR("EKChangedCalendar");
  v8[1] = CFSTR("EKChangedTitle");
  v1 = *MEMORY[0x1E0D0B328];
  v7[2] = *MEMORY[0x1E0D0B3E0];
  v7[3] = v1;
  v8[2] = CFSTR("EKChangedLocation");
  v8[3] = CFSTR("EKChangedNotes");
  v2 = *MEMORY[0x1E0D0B3D8];
  v7[4] = *MEMORY[0x1E0D0B308];
  v7[5] = v2;
  v8[4] = CFSTR("EKChangedAllDay");
  v8[5] = CFSTR("EKChangedTimeZone");
  v3 = *MEMORY[0x1E0D0B258];
  v7[6] = *MEMORY[0x1E0D0B3D0];
  v7[7] = v3;
  v8[6] = CFSTR("EKChangedStartDate");
  v8[7] = CFSTR("EKChangedURL");
  v4 = *MEMORY[0x1E0D0B368];
  v7[8] = *MEMORY[0x1E0D0B348];
  v7[9] = v4;
  v8[8] = CFSTR("EKChangedPriority");
  v8[9] = CFSTR("EKChangedSequence");
  v7[10] = *MEMORY[0x1E0D0B2E8];
  v8[10] = CFSTR("EKChangedFlags");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 11);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)EKObjectChangeSummarizer_singleValueDiffKeys_diffKeys_97;
  EKObjectChangeSummarizer_singleValueDiffKeys_diffKeys_97 = v5;

}

+ (id)EKObjectChangeSummarizer_multiValueDiffKeys
{
  if (EKObjectChangeSummarizer_multiValueDiffKeys_onceToken_101 != -1)
    dispatch_once(&EKObjectChangeSummarizer_multiValueDiffKeys_onceToken_101, &__block_literal_global_102);
  return (id)EKObjectChangeSummarizer_multiValueDiffKeys_diffKeys_100;
}

void __87__EKCalendarItem_EKObjectChangeSummarizer__EKObjectChangeSummarizer_multiValueDiffKeys__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];
  _QWORD v5[3];
  _QWORD v6[3];
  _QWORD v7[3];
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = *MEMORY[0x1E0D0B268];
  v6[0] = CFSTR("add");
  v6[1] = CFSTR("remove");
  v7[0] = CFSTR("EKChangedAlarmsAdded");
  v7[1] = CFSTR("EKChangedAlarmsRemoved");
  v6[2] = CFSTR("modify");
  v7[2] = CFSTR("EKChangedAlarmsModified");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = *MEMORY[0x1E0D0B350];
  v9[0] = v0;
  v4[0] = CFSTR("add");
  v4[1] = CFSTR("remove");
  v5[0] = CFSTR("EKChangedRecurrenceRule");
  v5[1] = CFSTR("EKChangedRecurrenceRule");
  v4[2] = CFSTR("modify");
  v5[2] = CFSTR("EKChangedRecurrenceRule");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)EKObjectChangeSummarizer_multiValueDiffKeys_diffKeys_100;
  EKObjectChangeSummarizer_multiValueDiffKeys_diffKeys_100 = v2;

}

- (void)snoozeAlarm:(id)a3 withTimeIntervalFromNow:(double)a4 pinsTriggerToStartDate:(BOOL)a5
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (id)_generateNewUniqueID
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (void)selfAttendee
{
  NSObject *v1;
  id v2;
  void *v3;
  id v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a1;
  v3 = (void *)OUTLINED_FUNCTION_2_3();
  v4 = OUTLINED_FUNCTION_0_7(v3);
  _os_log_error_impl(&dword_1A2318000, v1, OS_LOG_TYPE_ERROR, "selfAttendee is not an attendee; it's a %{public}@. Ignoring invalid selfAttendee and pretending there is no self attendee.",
    v5,
    0xCu);

  OUTLINED_FUNCTION_4_0();
}

- (void)setSelfAttendee:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A2318000, log, OS_LOG_TYPE_DEBUG, "Attempting to set the same selfAttendee using a different EKAttendee instance. There is no work to be done, but if the passed in instance had changes then they will not be saved when this calendar item is saved.", v1, 2u);
}

- (void)setSelfAttendee:(void *)a1 .cold.2(void *a1)
{
  NSObject *v1;
  id v2;
  void *v3;
  id v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a1;
  v3 = (void *)OUTLINED_FUNCTION_2_3();
  v4 = OUTLINED_FUNCTION_0_7(v3);
  _os_log_fault_impl(&dword_1A2318000, v1, OS_LOG_TYPE_FAULT, "Ignoring attempt to set the selfAttendee to something that's not an attendee (%{public}@)", v5, 0xCu);

  OUTLINED_FUNCTION_4_0();
}

@end
