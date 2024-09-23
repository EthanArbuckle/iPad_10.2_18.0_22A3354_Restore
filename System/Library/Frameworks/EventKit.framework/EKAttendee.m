@implementation EKAttendee

- (int64_t)participantStatus
{
  return objc_msgSend((id)objc_opt_class(), "_ekParticipantStatusFromCalAttendeeStatus:", -[EKAttendee statusRaw](self, "statusRaw"));
}

- (int)statusRaw
{
  void *v2;
  int v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B248]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

+ (int64_t)_ekParticipantStatusFromCalAttendeeStatus:(int)a3
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (*MEMORY[0x1E0D0A290] == a3)
    return -1;
  v4 = *(_QWORD *)&a3;
  if (a3 < 8)
    return qword_1A244A680[a3];
  v5 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    +[EKAttendee _ekParticipantStatusFromCalAttendeeStatus:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
  return 0;
}

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)knownSingleValueKeysForComparison
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__EKAttendee_knownSingleValueKeysForComparison__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (knownSingleValueKeysForComparison_onceToken_5 != -1)
    dispatch_once(&knownSingleValueKeysForComparison_onceToken_5, block);
  return (id)knownSingleValueKeysForComparison_keys_5;
}

void __47__EKAttendee_knownSingleValueKeysForComparison__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v12;
  _QWORD v13[11];

  v13[10] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D0B230];
  v13[0] = *MEMORY[0x1E0D0B218];
  v13[1] = v2;
  v3 = *MEMORY[0x1E0D0B228];
  v13[2] = *MEMORY[0x1E0D0B238];
  v13[3] = v3;
  v4 = *MEMORY[0x1E0D0B248];
  v13[4] = *MEMORY[0x1E0D0B240];
  v13[5] = v4;
  v5 = *MEMORY[0x1E0D0B8A0];
  v13[6] = *MEMORY[0x1E0D0B898];
  v13[7] = v5;
  v6 = *MEMORY[0x1E0D0B8B0];
  v13[8] = *MEMORY[0x1E0D0B880];
  v13[9] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 10);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)knownSingleValueKeysForComparison_keys_5;
  knownSingleValueKeysForComparison_keys_5 = v7;

  v12.receiver = *(id *)(a1 + 32);
  v12.super_class = (Class)&OBJC_METACLASS___EKAttendee;
  objc_msgSendSuper2(&v12, sel_knownSingleValueKeysForComparison);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayByAddingObjectsFromArray:", knownSingleValueKeysForComparison_keys_5);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)knownSingleValueKeysForComparison_keys_5;
  knownSingleValueKeysForComparison_keys_5 = v10;

}

+ (id)attendeeWithEmailAddress:(id)a3 name:(id)a4
{
  return (id)objc_msgSend(a1, "participantWithName:emailAddress:phoneNumber:url:", a4, a3, 0, 0);
}

+ (id)attendeeWithName:(id)a3 url:(id)a4
{
  return (id)objc_msgSend(a1, "participantWithName:emailAddress:phoneNumber:url:", a3, 0, 0, a4);
}

+ (id)attendeeWithName:(id)a3 emailAddress:(id)a4
{
  return (id)objc_msgSend(a1, "participantWithName:emailAddress:phoneNumber:url:", a3, a4, 0, 0);
}

+ (id)attendeeWithName:(id)a3 phoneNumber:(id)a4
{
  return (id)objc_msgSend(a1, "participantWithName:emailAddress:phoneNumber:url:", a3, 0, a4, 0);
}

+ (id)attendeeWithName:(id)a3 emailAddress:(id)a4 address:(id)a5
{
  return (id)objc_msgSend(a1, "participantWithName:emailAddress:phoneNumber:url:", a3, a4, 0, a5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  if (objc_msgSend(MEMORY[0x1E0D0C278], "isProgramSDKAtLeast:", 0x7E30901FFFFFFFFLL))
  {
    v11.receiver = self;
    v11.super_class = (Class)EKAttendee;
    return -[EKObject copyWithZone:](&v11, sel_copyWithZone_, a3);
  }
  else
  {
    -[EKParticipant name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKParticipant emailAddress](self, "emailAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKParticipant phoneNumber](self, "phoneNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKParticipant URL](self, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[EKAttendee attendeeWithName:emailAddress:phoneNumber:url:](EKAttendee, "attendeeWithName:emailAddress:phoneNumber:url:", v6, v7, v8, v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "setParticipantStatus:", -[EKAttendee participantStatus](self, "participantStatus"));
      objc_msgSend(v5, "setParticipantRole:", -[EKAttendee participantRole](self, "participantRole"));
      objc_msgSend(v5, "setParticipantType:", -[EKAttendee participantType](self, "participantType"));
      objc_msgSend(v5, "setPendingStatus:", -[EKAttendee pendingStatus](self, "pendingStatus"));
    }
  }
  return v5;
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EKParticipant UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKParticipant name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKParticipant emailAddress](self, "emailAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKParticipant phoneNumber](self, "phoneNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%p> {UUID = %@; name = %@; email = %@; phone = %@; status = %ld; role = %ld; type = %ld}"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    -[EKAttendee participantStatus](self, "participantStatus"),
    -[EKAttendee participantRole](self, "participantRole"),
    -[EKAttendee participantType](self, "participantType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)owner
{
  return -[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", CFSTR("owner"));
}

+ (int)_calAttendeeStatusFromEKParticipantStatus:(int64_t)a3
{
  int result;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = 7;
  switch(a3)
  {
    case -1:
      result = *MEMORY[0x1E0D0A290];
      break;
    case 0:
      return result;
    case 1:
      result = 0;
      break;
    case 2:
      result = 1;
      break;
    case 3:
      result = 2;
      break;
    case 4:
      result = 3;
      break;
    case 5:
      result = 4;
      break;
    case 6:
      result = 5;
      break;
    case 7:
      result = 6;
      break;
    default:
      v5 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        +[EKAttendee _calAttendeeStatusFromEKParticipantStatus:].cold.1(a3, v5, v6, v7, v8, v9, v10, v11);
      result = 7;
      break;
  }
  return result;
}

- (void)setStatusRaw:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B248]);

}

- (void)setParticipantStatus:(int64_t)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_opt_class(), "_calAttendeeStatusFromEKParticipantStatus:", a3);
  -[EKAttendee setStatusRaw:](self, "setStatusRaw:", v4);
  -[EKAttendee setPendingStatusRaw:](self, "setPendingStatusRaw:", v4);
}

- (BOOL)_isParticipantStatusDirty
{
  return -[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B248]);
}

- (int64_t)participantRole
{
  void *v2;
  int64_t v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B230]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setParticipantRole:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B230]);

}

- (int)pendingStatusRaw
{
  void *v2;
  int v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B240]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setPendingStatusRaw:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B240]);

}

- (int64_t)pendingStatus
{
  return objc_msgSend((id)objc_opt_class(), "_ekParticipantStatusFromCalAttendeeStatus:", -[EKAttendee pendingStatusRaw](self, "pendingStatusRaw"));
}

- (void)setPendingStatus:(int64_t)a3
{
  -[EKAttendee setPendingStatusRaw:](self, "setPendingStatusRaw:", objc_msgSend((id)objc_opt_class(), "_calAttendeeStatusFromEKParticipantStatus:", a3));
}

- (int64_t)participantType
{
  void *v2;
  int64_t v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B238]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setParticipantType:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B238]);

}

- (NSDate)lastModifiedParticipationStatus
{
  return (NSDate *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B228]);
}

- (BOOL)isCurrentUser
{
  void *v4;
  char v5;

  if (-[EKObject isNew](self, "isNew"))
    return 0;
  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B220]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (unsigned)flags
{
  void *v2;
  unsigned int v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B218]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (void)setFlags:(unsigned int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B218]);

}

- (void)_setFlag:(unsigned int)a3 value:(BOOL)a4
{
  _BOOL4 v4;
  unsigned int v7;
  uint64_t v8;

  v4 = a4;
  v7 = -[EKAttendee flags](self, "flags");
  if (v4)
    v8 = v7 | a3;
  else
    v8 = v7 & ~a3;
  -[EKAttendee setFlags:](self, "setFlags:", v8);
}

- (BOOL)_valueForFlag:(unsigned int)a3
{
  return (-[EKAttendee flags](self, "flags") & a3) != 0;
}

- (BOOL)commentChanged
{
  return -[EKAttendee _valueForFlag:](self, "_valueForFlag:", 2);
}

- (void)setCommentChanged:(BOOL)a3
{
  -[EKAttendee _setFlag:value:](self, "_setFlag:value:", 2, a3);
}

- (BOOL)statusChanged
{
  return -[EKAttendee _valueForFlag:](self, "_valueForFlag:", 4);
}

- (void)setStatusChanged:(BOOL)a3
{
  -[EKAttendee _setFlag:value:](self, "_setFlag:value:", 4, a3);
}

- (id)proposedStartDate
{
  void *v2;
  double v3;
  id v4;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B898]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  if (fabs(v3) >= 2.22044605e-16)
    v4 = v2;
  else
    v4 = 0;

  return v4;
}

- (void)setProposedStartDate:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B898]);
}

- (BOOL)hasProposedStartDate
{
  void *v2;
  BOOL v3;

  -[EKAttendee proposedStartDate](self, "proposedStartDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)proposedStartDateForEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v10;

  v4 = a3;
  -[EKAttendee proposedStartDate](self, "proposedStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = (id)objc_msgSend(v4, "adjustedPersistedDateForDate:withAdjustmentMode:pinMode:clientCalendarDate:", v5, 1, 0, &v10);
  v7 = v10;

  objc_msgSend(v7, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setProposedStartDate:(id)a3 forEvent:(id)a4
{
  void *v6;
  char v7;
  id v8;

  objc_msgSend(a4, "adjustedPersistedDateForDate:withAdjustmentMode:pinMode:clientCalendarDate:", a3, 0, 0, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[EKAttendee proposedStartDate](self, "proposedStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v8, "isEqualToDate:", v6);

  if ((v7 & 1) == 0)
  {
    -[EKAttendee setProposedStartDate:](self, "setProposedStartDate:", v8);
    -[EKAttendee setProposedStartDateStatus:](self, "setProposedStartDateStatus:", 0);
    if (a3)
    {
      if (-[EKAttendee participantStatus](self, "participantStatus") == 2
        || -[EKParticipant needsResponse](self, "needsResponse"))
      {
        -[EKAttendee setParticipantStatus:](self, "setParticipantStatus:", 4);
      }
    }
  }

}

- (int)proposedStartDateStatus
{
  void *v2;
  int v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B8A0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setProposedStartDateStatus:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B8A0]);

}

- (BOOL)proposedStartDateChanged
{
  return -[EKAttendee _valueForFlag:](self, "_valueForFlag:", 8);
}

- (void)setProposedStartDateChanged:(BOOL)a3
{
  -[EKAttendee _setFlag:value:](self, "_setFlag:value:", 8, a3);
}

- (void)markAsForward
{
  -[EKAttendee _setFlag:value:](self, "_setFlag:value:", 32, 1);
}

- (BOOL)rsvpRequested
{
  return -[EKAttendee _valueForFlag:](self, "_valueForFlag:", 1);
}

+ (void)_ekParticipantStatusFromCalAttendeeStatus:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A2318000, a2, a3, "Unexpected CalAttendeeStatus: %d", a5, a6, a7, a8, 0);
}

+ (void)_calAttendeeStatusFromEKParticipantStatus:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A2318000, a2, a3, "Unexpected EKParticipantStatus: %d", a5, a6, a7, a8, 0);
}

@end
