@implementation EKPersistentEvent

- (int)entityType
{
  return 2;
}

+ (id)defaultPropertiesToLoad
{
  if (defaultPropertiesToLoad_onceToken_9 != -1)
    dispatch_once(&defaultPropertiesToLoad_onceToken_9, &__block_literal_global_52);
  return (id)defaultPropertiesToLoad_defaultPropertiesToLoad_8;
}

- (id)endDateRaw
{
  return -[EKPersistentObject primitiveDateValueForKey:](self, "primitiveDateValueForKey:", *MEMORY[0x1E0D0B680]);
}

- (id)birthdayContactIdentifier
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B630]);
}

- (id)travelTime
{
  return -[EKPersistentObject primitiveNumberValueForKey:](self, "primitiveNumberValueForKey:", *MEMORY[0x1E0D0B710]);
}

- (unint64_t)invitationStatus
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B6A8]);
}

- (int64_t)status
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B6F8]);
}

- (int64_t)privacyLevel
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B6D0]);
}

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__EKPersistentEvent_relations__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (relations_onceToken_13 != -1)
    dispatch_once(&relations_onceToken_13, block);
  return (id)relations_relations_13;
}

- (id)proposedStartDate
{
  return -[EKPersistentObject primitiveDateValueForKey:](self, "primitiveDateValueForKey:", *MEMORY[0x1E0D0B6D8]);
}

- (unsigned)invitationChangedProperties
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B6A0]);
}

void __30__EKPersistentEvent_relations__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
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
  objc_super v13;

  v13.receiver = *(id *)(a1 + 32);
  v13.super_class = (Class)&OBJC_METACLASS___EKPersistentEvent;
  objc_msgSendSuper2(&v13, sel_relations);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  v3 = *MEMORY[0x1E0D0B830];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B830]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:", CFSTR("EventAction"), 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v5, *MEMORY[0x1E0D0B620]);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:", CFSTR("ExceptionDate"), 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v7, *MEMORY[0x1E0D0B2B0]);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:", CFSTR("SuggestedEventInfo"), 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v9, *MEMORY[0x1E0D0B700]);

  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:ownsRelated:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:ownsRelated:", CFSTR("Image"), 0, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v10, *MEMORY[0x1E0D0B698]);

  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:ownsRelated:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:ownsRelated:", CFSTR("Color"), 0, 0, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v11, *MEMORY[0x1E0D0B650]);

  v12 = (void *)relations_relations_13;
  relations_relations_13 = (uint64_t)v2;

}

- (id)participationStatusModifiedDate
{
  return -[EKPersistentObject primitiveDateValueForKey:](self, "primitiveDateValueForKey:", *MEMORY[0x1E0D0B6C8]);
}

- (id)organizer
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B330]);
}

- (unint64_t)junkStatus
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B6B0]);
}

void __44__EKPersistentEvent_defaultPropertiesToLoad__block_invoke()
{
  uint64_t v0;
  void *v1;

  CADEKPersistentEventDefaultPropertiesToLoad();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_8;
  defaultPropertiesToLoad_defaultPropertiesToLoad_8 = v0;

}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (id)birthdayID
{
  return -[EKPersistentObject primitiveNumberValueForKey:](self, "primitiveNumberValueForKey:", *MEMORY[0x1E0D0B640]);
}

- (void)setBirthdayID:(id)a3
{
  -[EKPersistentObject primitiveSetNumberValue:forKey:](self, "primitiveSetNumberValue:forKey:", a3, *MEMORY[0x1E0D0B640]);
}

- (void)setEndDateRaw:(id)a3
{
  -[EKPersistentObject primitiveSetDateValue:forKey:](self, "primitiveSetDateValue:forKey:", a3, *MEMORY[0x1E0D0B680]);
}

- (void)setTravelTime:(id)a3
{
  -[EKPersistentObject primitiveSetNumberValue:forKey:](self, "primitiveSetNumberValue:forKey:", a3, *MEMORY[0x1E0D0B710]);
}

- (void)setProposedStartDate:(id)a3
{
  -[EKPersistentObject primitiveSetDateValue:forKey:](self, "primitiveSetDateValue:forKey:", a3, *MEMORY[0x1E0D0B6D8]);
}

- (void)setStatus:(int64_t)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", a3, *MEMORY[0x1E0D0B6F8]);
}

- (int64_t)locationPredictionState
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B6B8]);
}

- (void)setLocationPredictionState:(int64_t)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", a3, *MEMORY[0x1E0D0B6B8]);
}

- (void)setInvitationStatus:(unint64_t)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", a3, *MEMORY[0x1E0D0B6A8]);
}

- (void)setInvitationChangedProperties:(unsigned int)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", *(_QWORD *)&a3, *MEMORY[0x1E0D0B6A0]);
}

- (int64_t)availability
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B628]);
}

- (void)setAvailability:(int64_t)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", a3, *MEMORY[0x1E0D0B628]);
}

- (void)setPrivacyLevel:(int64_t)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", a3, *MEMORY[0x1E0D0B6D0]);
}

- (int64_t)travelAdvisoryBehavior
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B708]);
}

- (void)setTravelAdvisoryBehavior:(int64_t)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", a3, *MEMORY[0x1E0D0B708]);
}

- (id)responseComment
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B6E8]);
}

- (void)setResponseComment:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B6E8]);
}

- (int)externalTrackingStatus
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B688]);
}

- (void)setExternalTrackingStatus:(int)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", *(_QWORD *)&a3, *MEMORY[0x1E0D0B688]);
}

- (BOOL)canForward
{
  return -[EKPersistentObject primitiveBoolValueForKey:](self, "primitiveBoolValueForKey:", *MEMORY[0x1E0D0B648]);
}

- (void)setCanForward:(BOOL)a3
{
  -[EKPersistentObject primitiveSetBoolValue:forKey:](self, "primitiveSetBoolValue:forKey:", a3, *MEMORY[0x1E0D0B648]);
}

- (BOOL)disallowProposeNewTime
{
  return -[EKPersistentObject primitiveBoolValueForKey:](self, "primitiveBoolValueForKey:", *MEMORY[0x1E0D0B678]);
}

- (void)setJunkStatus:(unint64_t)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", a3, *MEMORY[0x1E0D0B6B0]);
}

- (void)setDisallowProposeNewTime:(BOOL)a3
{
  -[EKPersistentObject primitiveSetBoolValue:forKey:](self, "primitiveSetBoolValue:forKey:", a3, *MEMORY[0x1E0D0B678]);
}

- (id)originalStartDate
{
  return -[EKPersistentObject primitiveDateValueForKey:](self, "primitiveDateValueForKey:", *MEMORY[0x1E0D0B6C0]);
}

- (void)setOriginalStartDate:(id)a3
{
  -[EKPersistentObject primitiveSetDateValue:forKey:](self, "primitiveSetDateValue:forKey:", a3, *MEMORY[0x1E0D0B6C0]);
}

- (id)actions
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B620]);
}

- (void)setActions:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B620]);
}

- (id)conferenceURLString
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B660]);
}

- (void)setConferenceURLString:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B660]);
}

- (void)setBirthdayContactIdentifier:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B630]);
}

- (id)birthdayContactName
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B638]);
}

- (void)setBirthdayContactName:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B638]);
}

- (id)recurrenceSet
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B6E0]);
}

- (void)setRecurrenceSet:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B6E0]);
}

- (void)setParticipationStatusModifiedDate:(id)a3
{
  -[EKPersistentObject primitiveSetDateValue:forKey:](self, "primitiveSetDateValue:forKey:", a3, *MEMORY[0x1E0D0B6C8]);
}

- (id)conferenceURLDetectedString
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B658]);
}

- (void)setConferenceURLDetectedString:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B658]);
}

- (id)specialDayString
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B6F0]);
}

- (void)setSpecialDayString:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B6F0]);
}

- (id)image
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B698]);
}

- (void)setImage:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B698]);
}

- (id)color
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B650]);
}

- (void)setColor:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B650]);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EKPersistentCalendarItem title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentCalendarItem calendar](self, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentCalendarItem allAlarmsSet](self, "allAlarmsSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentCalendarItem URLString](self, "URLString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentCalendarItem lastModifiedDate](self, "lastModifiedDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%p> \n\t {title = %@; \n\t calendar = %@; \n\t alarms = %@; \n\t URLString = %@; \n\t lastModified = %@}"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0CB3940];
  v22 = objc_opt_class();
  -[EKPersistentCalendarItem structuredLocationWithoutPrediction](self, "structuredLocationWithoutPrediction");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentCalendarItem travelStartLocation](self, "travelStartLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentCalendarItem startDate](self, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentEvent endDate](self, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[EKPersistentCalendarItem isAllDay](self, "isAllDay");
  -[EKPersistentCalendarItem startTimeZoneName](self, "startTimeZoneName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentEvent travelTime](self, "travelTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");
  -[EKPersistentCalendarItem recurrenceRulesSet](self, "recurrenceRulesSet");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentCalendarItem attendeesRaw](self, "attendeesRaw");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("%@ <%p> {%@; \n\t location = %@; \n\t startLocation = %@; \n\t startDate = %@; \n\t endDate = %@; \n\t allDay = %u; \n\t timeZone = %@; \n\t travelTime: %ld; \n\t recurrences = %@; \n\t attendees = %@}"),
    v22,
    self,
    v24,
    v21,
    v10,
    v11,
    v12,
    v13,
    v14,
    v16,
    v17,
    v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)EKPersistentEvent;
  v4 = -[EKPersistentCalendarItem copyWithZone:](&v14, sel_copyWithZone_, a3);
  -[EKPersistentEvent endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEndDate:", v5);

  objc_msgSend(v4, "setStatus:", -[EKPersistentEvent status](self, "status"));
  objc_msgSend(v4, "setAvailability:", -[EKPersistentEvent availability](self, "availability"));
  objc_msgSend(v4, "setPrivacyLevel:", -[EKPersistentEvent privacyLevel](self, "privacyLevel"));
  -[EKPersistentEvent travelTime](self, "travelTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTravelTime:", v6);

  -[EKPersistentEvent originalStartDate](self, "originalStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOriginalStartDate:", v7);

  objc_msgSend(v4, "setTravelAdvisoryBehavior:", -[EKPersistentEvent travelAdvisoryBehavior](self, "travelAdvisoryBehavior"));
  -[EKPersistentEvent responseComment](self, "responseComment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResponseComment:", v8);

  -[EKPersistentEvent proposedStartDate](self, "proposedStartDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProposedStartDate:", v9);

  objc_msgSend(v4, "setLocationPredictionState:", -[EKPersistentEvent locationPredictionState](self, "locationPredictionState"));
  -[EKPersistentEvent birthdayContactIdentifier](self, "birthdayContactIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBirthdayContactIdentifier:", v10);

  -[EKPersistentEvent birthdayContactName](self, "birthdayContactName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBirthdayContactName:", v11);

  -[EKPersistentEvent birthdayID](self, "birthdayID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v4, "setBirthdayID:", v12);
  objc_msgSend(v4, "setCanForward:", -[EKPersistentEvent canForward](self, "canForward"));
  objc_msgSend(v4, "setDisallowProposeNewTime:", -[EKPersistentEvent disallowProposeNewTime](self, "disallowProposeNewTime"));

  return v4;
}

- (id)suggestionInfo
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B700]);
}

- (void)setSuggestionInfo:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B700]);
}

- (BOOL)firedTTL
{
  return -[EKPersistentObject primitiveBoolValueForKey:](self, "primitiveBoolValueForKey:", *MEMORY[0x1E0D0B690]);
}

- (void)setFiredTTL:(BOOL)a3
{
  -[EKPersistentObject primitiveSetBoolValue:forKey:](self, "primitiveSetBoolValue:forKey:", a3, *MEMORY[0x1E0D0B690]);
}

+ (id)eventWithRandomUUID
{
  EKPersistentEvent *v2;
  void *v3;

  v2 = objc_alloc_init(EKPersistentEvent);
  EKUUIDString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentCalendarItem setUUID:](v2, "setUUID:", v3);

  return v2;
}

@end
