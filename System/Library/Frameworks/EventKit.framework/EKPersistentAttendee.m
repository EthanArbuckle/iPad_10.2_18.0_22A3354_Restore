@implementation EKPersistentAttendee

- (int)entityType
{
  return 7;
}

+ (id)defaultPropertiesToLoad
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__EKPersistentAttendee_defaultPropertiesToLoad__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultPropertiesToLoad_onceToken_4 != -1)
    dispatch_once(&defaultPropertiesToLoad_onceToken_4, block);
  return (id)defaultPropertiesToLoad_defaultPropertiesToLoad_4;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

+ (id)relations
{
  if (relations_onceToken_7 != -1)
    dispatch_once(&relations_onceToken_7, &__block_literal_global_32);
  return (id)relations_relations_7;
}

- (int)statusRaw
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B248]);
}

void __33__EKPersistentAttendee_relations__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B278]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:ownsRelated:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:ownsRelated:", CFSTR("CalendarItem"), 0, v4, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, *MEMORY[0x1E0D0B830], 0);
  v3 = (void *)relations_relations_7;
  relations_relations_7 = v2;

}

void __47__EKPersistentAttendee_defaultPropertiesToLoad__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___EKPersistentAttendee;
  objc_msgSendSuper2(&v7, sel_defaultPropertiesToLoad);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0D0B238];
  v8[0] = *MEMORY[0x1E0D0B230];
  v8[1] = v2;
  v3 = *MEMORY[0x1E0D0B898];
  v8[2] = *MEMORY[0x1E0D0B248];
  v8[3] = v3;
  v8[4] = *MEMORY[0x1E0D0B220];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "arrayByAddingObjectsFromArray:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_4;
  defaultPropertiesToLoad_defaultPropertiesToLoad_4 = v5;

}

- (id)copyWithZone:(_NSZone *)a3
{
  EKPersistentAttendee *v4;
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

  v4 = objc_alloc_init(EKPersistentAttendee);
  if (v4)
  {
    -[EKPersistentParticipant UUID](self, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    -[EKPersistentParticipant setUUID:](v4, "setUUID:", v6);

    -[EKPersistentParticipant displayNameRaw](self, "displayNameRaw");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPersistentParticipant setDisplayNameRaw:](v4, "setDisplayNameRaw:", v7);

    -[EKPersistentAttendee setStatusRaw:](v4, "setStatusRaw:", -[EKPersistentAttendee statusRaw](self, "statusRaw"));
    -[EKPersistentAttendee setParticipantRole:](v4, "setParticipantRole:", -[EKPersistentAttendee participantRole](self, "participantRole"));
    -[EKPersistentAttendee setPendingStatusRaw:](v4, "setPendingStatusRaw:", -[EKPersistentAttendee pendingStatusRaw](self, "pendingStatusRaw"));
    -[EKPersistentAttendee lastModifiedParticipationStatus](self, "lastModifiedParticipationStatus");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPersistentAttendee setLastModifiedParticipationStatus:](v4, "setLastModifiedParticipationStatus:", v8);

    -[EKPersistentParticipant proposedStartDate](self, "proposedStartDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPersistentParticipant setProposedStartDate:](v4, "setProposedStartDate:", v9);

    -[EKPersistentParticipant setProposedStartDateStatus:](v4, "setProposedStartDateStatus:", -[EKPersistentParticipant proposedStartDateStatus](self, "proposedStartDateStatus"));
    -[EKPersistentAttendee setParticipantType:](v4, "setParticipantType:", -[EKPersistentAttendee participantType](self, "participantType"));
    -[EKPersistentParticipant setScheduleForceSend:](v4, "setScheduleForceSend:", -[EKPersistentParticipant scheduleForceSend](self, "scheduleForceSend"));
    -[EKPersistentParticipant comment](self, "comment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPersistentParticipant setComment:](v4, "setComment:", v10);

    -[EKPersistentParticipant commentLastModifiedDate](self, "commentLastModifiedDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPersistentParticipant setCommentLastModifiedDate:](v4, "setCommentLastModifiedDate:", v11);

    -[EKPersistentObject eventStore](self, "eventStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v12, "eventAccessLevel");

    if ((_DWORD)v6 == 2)
    {
      -[EKPersistentParticipant emailAddress](self, "emailAddress");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKPersistentParticipant setEmailAddress:](v4, "setEmailAddress:", v13);

      -[EKPersistentParticipant phoneNumber](self, "phoneNumber");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKPersistentParticipant setPhoneNumber:](v4, "setPhoneNumber:", v14);

      -[EKPersistentParticipant URLString](self, "URLString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKPersistentParticipant setURLString:](v4, "setURLString:", v15);

    }
  }
  return v4;
}

+ (id)propertiesToUnloadOnCommit
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__EKPersistentAttendee_propertiesToUnloadOnCommit__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (propertiesToUnloadOnCommit_onceToken_0 != -1)
    dispatch_once(&propertiesToUnloadOnCommit_onceToken_0, block);
  return (id)propertiesToUnloadOnCommit_propertiesToUnloadOnCommit_0;
}

void __50__EKPersistentAttendee_propertiesToUnloadOnCommit__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___EKPersistentAttendee;
  objc_msgSendSuper2(&v7, sel_propertiesToUnloadOnCommit);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)propertiesToUnloadOnCommit_propertiesToUnloadOnCommit_0;
  propertiesToUnloadOnCommit_propertiesToUnloadOnCommit_0 = v1;

  v3 = (void *)propertiesToUnloadOnCommit_propertiesToUnloadOnCommit_0;
  v8[0] = *MEMORY[0x1E0D0B220];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)propertiesToUnloadOnCommit_propertiesToUnloadOnCommit_0;
  propertiesToUnloadOnCommit_propertiesToUnloadOnCommit_0 = v5;

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
  void *v12;

  v12 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  -[EKPersistentParticipant UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentParticipant displayNameRaw](self, "displayNameRaw");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentParticipant emailAddress](self, "emailAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentParticipant phoneNumber](self, "phoneNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentParticipant firstName](self, "firstName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentParticipant lastName](self, "lastName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ <%p> {UUID = %@; displayName = %@; email = %@; phoneNumber = %@; firstName = %@, lastName = %@, status = %ld; role = %ld; type = %ld}"),
    v3,
    self,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    -[EKPersistentAttendee statusRaw](self, "statusRaw"),
    -[EKPersistentAttendee participantRole](self, "participantRole"),
    -[EKPersistentAttendee participantType](self, "participantType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setStatusRaw:(int)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", *(_QWORD *)&a3, *MEMORY[0x1E0D0B248]);
}

- (int64_t)participantRole
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B230]);
}

- (void)setParticipantRole:(int64_t)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", a3, *MEMORY[0x1E0D0B230]);
}

- (int64_t)participantType
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B238]);
}

- (void)setParticipantType:(int64_t)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", a3, *MEMORY[0x1E0D0B238]);
}

- (int)pendingStatusRaw
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B240]);
}

- (void)setPendingStatusRaw:(int)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", *(_QWORD *)&a3, *MEMORY[0x1E0D0B240]);
}

- (void)setLastModifiedParticipationStatus:(id)a3
{
  -[EKPersistentObject primitiveSetDateValue:forKey:](self, "primitiveSetDateValue:forKey:", a3, *MEMORY[0x1E0D0B228]);
}

- (id)lastModifiedParticipationStatus
{
  return -[EKPersistentObject primitiveDateValueForKey:](self, "primitiveDateValueForKey:", *MEMORY[0x1E0D0B228]);
}

- (unsigned)flags
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B218]);
}

- (void)setFlags:(unsigned int)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", *(_QWORD *)&a3, *MEMORY[0x1E0D0B218]);
}

- (BOOL)isCurrentUser
{
  return -[EKPersistentObject primitiveBoolValueForKey:](self, "primitiveBoolValueForKey:", *MEMORY[0x1E0D0B220]);
}

+ (id)attendeeWithName:(id)a3 emailAddress:(id)a4 address:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:emailAddress:address:", v10, v9, v8);

  return v11;
}

+ (id)attendeeWithEmailAddress:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEmailAddress:name:", v7, v6);

  return v8;
}

- (EKPersistentAttendee)initWithEmailAddress:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  EKPersistentAttendee *v8;
  EKPersistentAttendee *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[EKPersistentObject init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[EKPersistentParticipant setEmailAddress:](v8, "setEmailAddress:", v6);
    -[EKPersistentParticipant setDisplayNameRaw:](v9, "setDisplayNameRaw:", v7);
  }

  return v9;
}

- (EKPersistentAttendee)initWithName:(id)a3 emailAddress:(id)a4 address:(id)a5
{
  id v8;
  id v9;
  id v10;
  EKPersistentAttendee *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[EKPersistentObject init](self, "init");
  if (v11)
  {
    objc_msgSend(v10, "absoluteString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPersistentParticipant setURLString:](v11, "setURLString:", v12);

    -[EKPersistentParticipant setEmailAddress:](v11, "setEmailAddress:", v9);
    -[EKPersistentParticipant setDisplayNameRaw:](v11, "setDisplayNameRaw:", v8);
  }

  return v11;
}

- (EKPersistentAttendee)initWithAddress:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  EKPersistentAttendee *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[EKPersistentObject init](self, "init");
  if (v8)
  {
    objc_msgSend(v6, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPersistentParticipant setURLString:](v8, "setURLString:", v9);

    -[EKPersistentParticipant setDisplayNameRaw:](v8, "setDisplayNameRaw:", v7);
  }

  return v8;
}

@end
