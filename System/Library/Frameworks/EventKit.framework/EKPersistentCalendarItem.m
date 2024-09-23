@implementation EKPersistentCalendarItem

- (id)startTimeZoneName
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B3D8]);
}

- (id)startDateRaw
{
  return -[EKPersistentObject primitiveDateValueForKey:](self, "primitiveDateValueForKey:", *MEMORY[0x1E0D0B3D0]);
}

- (id)originalItem
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B338]);
}

- (BOOL)isAllDay
{
  return -[EKPersistentObject primitiveBoolValueForKey:](self, "primitiveBoolValueForKey:", *MEMORY[0x1E0D0B308]);
}

- (BOOL)hasRecurrenceRules
{
  return -[EKPersistentObject primitiveBoolValueForKey:](self, "primitiveBoolValueForKey:", *MEMORY[0x1E0D0B300]);
}

- (id)clientLocation
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B290]);
}

- (id)unlocalizedTitle
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B410]);
}

- (id)calendar
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B280]);
}

- (id)uniqueID
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B408]);
}

- (id)structuredLocationWithoutPrediction
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B3E0]);
}

- (id)selfAttendee
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B358]);
}

- (id)travelStartLocation
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B400]);
}

- (id)notes
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B328]);
}

- (id)attendeesRaw
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B278]);
}

- (id)recurrenceRulesSet
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B350]);
}

void __37__EKPersistentCalendarItem_relations__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;

  v38 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B158]);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:", CFSTR("Alarm"), 1, v42);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = *MEMORY[0x1E0D0B268];
  v0 = *MEMORY[0x1E0D0B830];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B830]);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:", CFSTR("Attachment"), 1, v41);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = *MEMORY[0x1E0D0B270];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:", CFSTR("Attendee"), 1, v40);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = *MEMORY[0x1E0D0B278];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:", CFSTR("ExceptionDate"), 1, v39);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = *MEMORY[0x1E0D0B2B0];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B8F0]);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:", CFSTR("RecurrenceRule"), 1, v37);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = *MEMORY[0x1E0D0B350];
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:ownsRelated:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:ownsRelated:", CFSTR("Calendar"), 0, 0, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *MEMORY[0x1E0D0B280];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:", CFSTR("Organizer"), 0, v34);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *MEMORY[0x1E0D0B330];
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:", CFSTR("Attendee"), 0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *MEMORY[0x1E0D0B358];
  v1 = *MEMORY[0x1E0D0B758];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B758]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:", CFSTR("Location"), 0, v31);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0D0B3E0];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:", CFSTR("ClientLocation"), 0, v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0D0B290];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:", CFSTR("StartLocation"), 0, v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0D0B400];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("calendarItemOwner"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:", CFSTR("EndLocation"), 0, v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0D0B2B8];
  v2 = *MEMORY[0x1E0D0B338];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B338]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:", CFSTR("CalendarItem"), 1, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D0B2A8];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B2A8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:ownsRelated:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:ownsRelated:", CFSTR("CalendarItem"), 0, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B5D0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:", CFSTR("Error"), 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v38, "initWithObjectsAndKeys:", v46, v36, v45, v35, v44, v33, v43, v32, v30, v29, v27, v26, v25, v24, v22, v21, v19,
         v18,
         v17,
         v16,
         v12,
         v14,
         v11,
         v13,
         v10,
         v3,
         v5,
         v2,
         v7,
         *MEMORY[0x1E0D0B3F8],
         0);
  v9 = (void *)relations_relations_17;
  relations_relations_17 = v8;

}

+ (id)relations
{
  if (relations_onceToken_17 != -1)
    dispatch_once(&relations_onceToken_17, &__block_literal_global_72);
  return (id)relations_relations_17;
}

- (BOOL)hasAttendees
{
  return -[EKPersistentObject primitiveBoolValueForKey:](self, "primitiveBoolValueForKey:", *MEMORY[0x1E0D0B2F0]);
}

- (id)ekExceptionDates
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B2B0]);
}

- (id)detachedItems
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B2A8]);
}

+ (id)propertyKeyForUniqueIdentifier
{
  return (id)*MEMORY[0x1E0D0B820];
}

+ (id)defaultPropertiesToLoad
{
  return 0;
}

+ (id)propertiesToUnloadOnCommit
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__EKPersistentCalendarItem_propertiesToUnloadOnCommit__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (propertiesToUnloadOnCommit_onceToken_2 != -1)
    dispatch_once(&propertiesToUnloadOnCommit_onceToken_2, block);
  return (id)propertiesToUnloadOnCommit_propertiesToUnloadOnCommit_2;
}

void __54__EKPersistentCalendarItem_propertiesToUnloadOnCommit__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v10;
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)&OBJC_METACLASS___EKPersistentCalendarItem;
  objc_msgSendSuper2(&v10, sel_propertiesToUnloadOnCommit);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)propertiesToUnloadOnCommit_propertiesToUnloadOnCommit_2;
  propertiesToUnloadOnCommit_propertiesToUnloadOnCommit_2 = v1;

  v3 = (void *)propertiesToUnloadOnCommit_propertiesToUnloadOnCommit_2;
  v4 = *MEMORY[0x1E0D0B2F0];
  v11[0] = *MEMORY[0x1E0D0B2F8];
  v11[1] = v4;
  v5 = *MEMORY[0x1E0D0B360];
  v11[2] = *MEMORY[0x1E0D0B300];
  v11[3] = v5;
  v6 = *MEMORY[0x1E0D0B658];
  v11[4] = *MEMORY[0x1E0D0B3F0];
  v11[5] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)propertiesToUnloadOnCommit_propertiesToUnloadOnCommit_2;
  propertiesToUnloadOnCommit_propertiesToUnloadOnCommit_2 = v8;

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  EKUUIDString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUUID:", v5);

  -[EKPersistentCalendarItem calendar](self, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCalendar:", v6);

  objc_msgSend(v4, "setIsAllDay:", -[EKPersistentCalendarItem isAllDay](self, "isAllDay"));
  -[EKPersistentCalendarItem startDateRaw](self, "startDateRaw");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStartDateRaw:", v7);

  -[EKPersistentCalendarItem startTimeZoneName](self, "startTimeZoneName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStartTimeZoneName:", v8);

  -[EKPersistentCalendarItem endTimeZoneName](self, "endTimeZoneName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEndTimeZoneName:", v9);

  -[EKPersistentCalendarItem unlocalizedTitle](self, "unlocalizedTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUnlocalizedTitle:", v10);

  -[EKPersistentCalendarItem notes](self, "notes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNotes:", v11);

  -[EKPersistentCalendarItem URLString](self, "URLString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setURLString:", v12);

  objc_msgSend(v4, "setSequenceNumber:", -[EKPersistentCalendarItem sequenceNumber](self, "sequenceNumber"));
  -[EKPersistentCalendarItem calendarScale](self, "calendarScale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCalendarScale:", v13);

  objc_msgSend(v4, "setPriority:", -[EKPersistentCalendarItem priority](self, "priority"));
  -[EKPersistentCalendarItem actionString](self, "actionString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActionString:", v14);

  -[EKPersistentCalendarItem structuredData](self, "structuredData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStructuredData:", v15);

  -[EKPersistentCalendarItem localStructuredData](self, "localStructuredData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocalStructuredData:", v16);

  objc_msgSend(v4, "setDefaultAlarmWasDeleted:", -[EKPersistentCalendarItem defaultAlarmWasDeleted](self, "defaultAlarmWasDeleted"));
  -[EKPersistentCalendarItem sharedItemCreatedByDisplayName](self, "sharedItemCreatedByDisplayName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSharedItemCreatedByDisplayName:", v17);

  -[EKPersistentCalendarItem sharedItemCreatedByAddressString](self, "sharedItemCreatedByAddressString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSharedItemCreatedByAddressString:", v18);

  -[EKPersistentCalendarItem sharedItemCreatedByFirstName](self, "sharedItemCreatedByFirstName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSharedItemCreatedByFirstName:", v19);

  -[EKPersistentCalendarItem sharedItemCreatedByLastName](self, "sharedItemCreatedByLastName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSharedItemCreatedByLastName:", v20);

  -[EKPersistentCalendarItem sharedItemCreatedDate](self, "sharedItemCreatedDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSharedItemCreatedDate:", v21);

  -[EKPersistentCalendarItem sharedItemCreatedTimeZoneName](self, "sharedItemCreatedTimeZoneName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSharedItemCreatedTimeZoneName:", v22);

  -[EKPersistentCalendarItem sharedItemModifiedByDisplayName](self, "sharedItemModifiedByDisplayName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSharedItemModifiedByDisplayName:", v23);

  -[EKPersistentCalendarItem sharedItemModifiedByAddressString](self, "sharedItemModifiedByAddressString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSharedItemModifiedByAddressString:", v24);

  -[EKPersistentCalendarItem sharedItemModifiedByFirstName](self, "sharedItemModifiedByFirstName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSharedItemModifiedByFirstName:", v25);

  -[EKPersistentCalendarItem sharedItemModifiedByLastName](self, "sharedItemModifiedByLastName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSharedItemModifiedByLastName:", v26);

  -[EKPersistentCalendarItem sharedItemModifiedDate](self, "sharedItemModifiedDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSharedItemModifiedDate:", v27);

  -[EKPersistentCalendarItem sharedItemModifiedTimeZoneName](self, "sharedItemModifiedTimeZoneName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSharedItemModifiedTimeZoneName:", v28);

  -[EKPersistentObject eventStore](self, "eventStore");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "eventAccessLevel");

  if (v30 == 2)
  {
    -[EKPersistentCalendarItem externalData](self, "externalData");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setExternalData:", v31);

  }
  return v4;
}

- (id)UUID
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B820]);
}

- (void)setUUID:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B820]);
}

- (void)setCalendar:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B280]);
}

- (void)setNotes:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B328]);
}

- (BOOL)hasNotes
{
  return -[EKPersistentObject primitiveBoolValueForKey:](self, "primitiveBoolValueForKey:", *MEMORY[0x1E0D0B2F8]);
}

- (void)setHasNotes:(BOOL)a3
{
  -[EKPersistentObject primitiveSetBoolValue:forKey:](self, "primitiveSetBoolValue:forKey:", a3, *MEMORY[0x1E0D0B2F8]);
}

- (void)setUnlocalizedTitle:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B410]);
}

- (BOOL)phantomMaster
{
  return -[EKPersistentObject primitiveBoolValueForKey:](self, "primitiveBoolValueForKey:", *MEMORY[0x1E0D0B340]);
}

- (void)setPhantomMaster:(BOOL)a3
{
  -[EKPersistentObject primitiveSetBoolValue:forKey:](self, "primitiveSetBoolValue:forKey:", a3, *MEMORY[0x1E0D0B340]);
}

- (id)calendarScale
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B288]);
}

- (void)setCalendarScale:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B288]);
}

- (void)setStructuredLocationWithoutPrediction:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B3E0]);
}

- (void)setClientLocation:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B290]);
}

- (void)setTravelStartLocation:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B400]);
}

- (id)endLocation
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B2B8]);
}

- (void)setEndLocation:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B2B8]);
}

- (id)lastModifiedDate
{
  return -[EKPersistentObject primitiveDateValueForKey:](self, "primitiveDateValueForKey:", *MEMORY[0x1E0D0B310]);
}

- (void)setLastModifiedDate:(id)a3
{
  -[EKPersistentObject primitiveSetDateValue:forKey:](self, "primitiveSetDateValue:forKey:", a3, *MEMORY[0x1E0D0B310]);
}

- (id)creationDate
{
  return -[EKPersistentObject primitiveDateValueForKey:](self, "primitiveDateValueForKey:", *MEMORY[0x1E0D0B298]);
}

- (void)setCreationDate:(id)a3
{
  -[EKPersistentObject primitiveSetDateValue:forKey:](self, "primitiveSetDateValue:forKey:", a3, *MEMORY[0x1E0D0B298]);
}

- (void)setStartDateRaw:(id)a3
{
  -[EKPersistentObject primitiveSetDateValue:forKey:](self, "primitiveSetDateValue:forKey:", a3, *MEMORY[0x1E0D0B3D0]);
}

- (void)setStartTimeZoneName:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B3D8]);
}

- (id)endTimeZoneName
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B2C0]);
}

- (void)setEndTimeZoneName:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B2C0]);
}

- (void)setIsAllDay:(BOOL)a3
{
  -[EKPersistentObject primitiveSetBoolValue:forKey:](self, "primitiveSetBoolValue:forKey:", a3, *MEMORY[0x1E0D0B308]);
}

- (int)priority
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B348]);
}

- (void)setPriority:(int)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", *(_QWORD *)&a3, *MEMORY[0x1E0D0B348]);
}

- (int)sequenceNumber
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B368]);
}

- (void)setSequenceNumber:(int)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", *(_QWORD *)&a3, *MEMORY[0x1E0D0B368]);
}

- (id)actionString
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B260]);
}

- (void)setActionString:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B260]);
}

- (id)URLString
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B258]);
}

- (void)setURLString:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B258]);
}

- (void)setAllAlarmsSet:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B268]);
}

- (id)allAlarmsSet
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B268]);
}

- (void)addAlarm:(id)a3
{
  -[EKPersistentObject primitiveAddRelatedObject:forKey:](self, "primitiveAddRelatedObject:forKey:", a3, *MEMORY[0x1E0D0B268]);
}

- (void)removeAlarm:(id)a3
{
  -[EKPersistentObject primitiveRemoveRelatedObject:forKey:](self, "primitiveRemoveRelatedObject:forKey:", a3, *MEMORY[0x1E0D0B268]);
}

- (BOOL)defaultAlarmWasDeleted
{
  return -[EKPersistentObject primitiveBoolValueForKey:](self, "primitiveBoolValueForKey:", *MEMORY[0x1E0D0B2A0]);
}

- (void)setDefaultAlarmWasDeleted:(BOOL)a3
{
  -[EKPersistentObject primitiveSetBoolValue:forKey:](self, "primitiveSetBoolValue:forKey:", a3, *MEMORY[0x1E0D0B2A0]);
}

- (void)setHasRecurrenceRules:(BOOL)a3
{
  -[EKPersistentObject primitiveSetBoolValue:forKey:](self, "primitiveSetBoolValue:forKey:", a3, *MEMORY[0x1E0D0B300]);
}

- (void)setRecurrenceRulesSet:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B350]);
}

- (void)addRecurrenceRule:(id)a3
{
  -[EKPersistentObject primitiveAddRelatedObject:forKey:](self, "primitiveAddRelatedObject:forKey:", a3, *MEMORY[0x1E0D0B350]);
}

- (void)removeRecurrenceRule:(id)a3
{
  -[EKPersistentObject primitiveRemoveRelatedObject:forKey:](self, "primitiveRemoveRelatedObject:forKey:", a3, *MEMORY[0x1E0D0B350]);
}

- (id)singleRecurrenceRule
{
  void *v2;
  void *v3;

  -[EKPersistentCalendarItem recurrenceRulesSet](self, "recurrenceRulesSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setEkExceptionDates:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B2B0]);
}

- (void)setHasAttendees:(BOOL)a3
{
  -[EKPersistentObject primitiveSetBoolValue:forKey:](self, "primitiveSetBoolValue:forKey:", a3, *MEMORY[0x1E0D0B2F0]);
}

- (void)setAttendeesRaw:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B278]);
}

- (void)addAttendee:(id)a3
{
  -[EKPersistentObject primitiveAddRelatedObject:forKey:](self, "primitiveAddRelatedObject:forKey:", a3, *MEMORY[0x1E0D0B278]);
}

- (void)removeAttendee:(id)a3
{
  -[EKPersistentObject primitiveRemoveRelatedObject:forKey:](self, "primitiveRemoveRelatedObject:forKey:", a3, *MEMORY[0x1E0D0B278]);
}

- (void)setSelfAttendee:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B358]);
}

- (id)organizer
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B330]);
}

- (void)setOrganizer:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B330]);
}

- (int)selfParticipantStatusRaw
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B360]);
}

- (void)setSelfParticipantStatusRaw:(int)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", *(_QWORD *)&a3, *MEMORY[0x1E0D0B360]);
}

- (void)setUniqueID:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B408]);
}

- (id)externalID
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B2D0]);
}

- (void)setExternalID:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B2D0]);
}

- (id)externalScheduleID
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B2E0]);
}

- (void)setExternalScheduleID:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B2E0]);
}

- (id)externalModificationTag
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B2D8]);
}

- (void)setExternalModificationTag:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B2D8]);
}

- (id)externalData
{
  return -[EKPersistentObject primitiveDataValueForKey:](self, "primitiveDataValueForKey:", *MEMORY[0x1E0D0B2C8]);
}

- (void)setExternalData:(id)a3
{
  -[EKPersistentObject primitiveSetDataValue:forKey:](self, "primitiveSetDataValue:forKey:", a3, *MEMORY[0x1E0D0B2C8]);
}

- (id)attachmentsSet
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B270]);
}

- (void)setAttachmentsSet:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B270]);
}

- (id)sharedItemCreatedByDisplayName
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B378]);
}

- (void)setSharedItemCreatedByDisplayName:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B378]);
}

- (id)sharedItemCreatedByAddressString
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B370]);
}

- (void)setSharedItemCreatedByAddressString:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B370]);
}

- (id)sharedItemCreatedByFirstName
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B380]);
}

- (void)setSharedItemCreatedByFirstName:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B380]);
}

- (id)sharedItemCreatedByLastName
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B388]);
}

- (void)setSharedItemCreatedByLastName:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B388]);
}

- (id)sharedItemCreatedDate
{
  return -[EKPersistentObject primitiveDateValueForKey:](self, "primitiveDateValueForKey:", *MEMORY[0x1E0D0B390]);
}

- (void)setSharedItemCreatedDate:(id)a3
{
  -[EKPersistentObject primitiveSetDateValue:forKey:](self, "primitiveSetDateValue:forKey:", a3, *MEMORY[0x1E0D0B390]);
}

- (id)sharedItemCreatedTimeZoneName
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B398]);
}

- (void)setSharedItemCreatedTimeZoneName:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B398]);
}

- (id)sharedItemModifiedByDisplayName
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B3A8]);
}

- (void)setSharedItemModifiedByDisplayName:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B3A8]);
}

- (id)sharedItemModifiedByAddressString
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B3A0]);
}

- (void)setSharedItemModifiedByAddressString:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B3A0]);
}

- (id)sharedItemModifiedByFirstName
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B3B0]);
}

- (void)setSharedItemModifiedByFirstName:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B3B0]);
}

- (id)sharedItemModifiedByLastName
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B3B8]);
}

- (void)setSharedItemModifiedByLastName:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B3B8]);
}

- (id)sharedItemModifiedDate
{
  return -[EKPersistentObject primitiveDateValueForKey:](self, "primitiveDateValueForKey:", *MEMORY[0x1E0D0B3C0]);
}

- (void)setSharedItemModifiedDate:(id)a3
{
  -[EKPersistentObject primitiveSetDateValue:forKey:](self, "primitiveSetDateValue:forKey:", a3, *MEMORY[0x1E0D0B3C0]);
}

- (id)sharedItemModifiedTimeZoneName
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B3C8]);
}

- (void)setSharedItemModifiedTimeZoneName:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B3C8]);
}

- (unsigned)modifiedProperties
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B320]);
}

- (void)setModifiedProperties:(unsigned int)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", *(_QWORD *)&a3, *MEMORY[0x1E0D0B320]);
}

- (id)structuredData
{
  return -[EKPersistentObject primitiveDataValueForKey:](self, "primitiveDataValueForKey:", *MEMORY[0x1E0D0B3E8]);
}

- (void)setStructuredData:(id)a3
{
  -[EKPersistentObject primitiveSetDataValue:forKey:](self, "primitiveSetDataValue:forKey:", a3, *MEMORY[0x1E0D0B3E8]);
}

- (id)localStructuredData
{
  return -[EKPersistentObject primitiveDataValueForKey:](self, "primitiveDataValueForKey:", *MEMORY[0x1E0D0B318]);
}

- (void)setLocalStructuredData:(id)a3
{
  -[EKPersistentObject primitiveSetDataValue:forKey:](self, "primitiveSetDataValue:forKey:", a3, *MEMORY[0x1E0D0B318]);
}

- (id)syncError
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B3F8]);
}

- (void)setSyncError:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B3F8]);
}

- (BOOL)suppressNotificationForChanges
{
  return -[EKPersistentObject primitiveBoolValueForKey:](self, "primitiveBoolValueForKey:", *MEMORY[0x1E0D0B3F0]);
}

- (void)setSuppressNotificationForChanges:(BOOL)a3
{
  -[EKPersistentObject primitiveSetBoolValue:forKey:](self, "primitiveSetBoolValue:forKey:", a3, *MEMORY[0x1E0D0B3F0]);
}

- (int)flags
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B2E8]);
}

- (void)setFlags:(int)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", *(_QWORD *)&a3, *MEMORY[0x1E0D0B2E8]);
}

- (void)setOriginalItem:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B338]);
}

- (void)setDetachedItems:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B2A8]);
}

@end
