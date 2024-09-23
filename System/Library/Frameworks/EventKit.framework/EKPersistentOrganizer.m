@implementation EKPersistentOrganizer

- (int)entityType
{
  return 8;
}

+ (id)defaultPropertiesToLoad
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__EKPersistentOrganizer_defaultPropertiesToLoad__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultPropertiesToLoad_onceToken_7 != -1)
    dispatch_once(&defaultPropertiesToLoad_onceToken_7, block);
  return (id)defaultPropertiesToLoad_defaultPropertiesToLoad_6;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

+ (id)relations
{
  if (relations_onceToken_11 != -1)
    dispatch_once(&relations_onceToken_11, &__block_literal_global_49);
  return (id)relations_relations_11;
}

- (BOOL)isCurrentUser
{
  return -[EKPersistentObject primitiveBoolValueForKey:](self, "primitiveBoolValueForKey:", *MEMORY[0x1E0D0B840]);
}

void __34__EKPersistentOrganizer_relations__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B330]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:ownsRelated:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:ownsRelated:", CFSTR("CalendarItem"), 0, v4, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, *MEMORY[0x1E0D0B830], 0);
  v3 = (void *)relations_relations_11;
  relations_relations_11 = v2;

}

void __48__EKPersistentOrganizer_defaultPropertiesToLoad__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___EKPersistentOrganizer;
  objc_msgSendSuper2(&v6, sel_defaultPropertiesToLoad);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0D0B848];
  v7[0] = *MEMORY[0x1E0D0B840];
  v7[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "arrayByAddingObjectsFromArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_6;
  defaultPropertiesToLoad_defaultPropertiesToLoad_6 = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  EKPersistentOrganizer *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = objc_alloc_init(EKPersistentOrganizer);
  if (v4)
  {
    -[EKPersistentParticipant UUID](self, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    -[EKPersistentParticipant setUUID:](v4, "setUUID:", v6);

    -[EKPersistentParticipant displayNameRaw](self, "displayNameRaw");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPersistentParticipant setDisplayNameRaw:](v4, "setDisplayNameRaw:", v7);

    -[EKPersistentOrganizer setIsCurrentUser:](v4, "setIsCurrentUser:", -[EKPersistentOrganizer isCurrentUser](self, "isCurrentUser"));
    -[EKPersistentOrganizer setScheduleAgent:](v4, "setScheduleAgent:", -[EKPersistentOrganizer scheduleAgent](self, "scheduleAgent"));
    -[EKPersistentObject eventStore](self, "eventStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v8, "eventAccessLevel");

    if ((_DWORD)v6 == 2)
    {
      -[EKPersistentParticipant emailAddress](self, "emailAddress");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKPersistentParticipant setEmailAddress:](v4, "setEmailAddress:", v9);

      -[EKPersistentParticipant phoneNumber](self, "phoneNumber");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKPersistentParticipant setPhoneNumber:](v4, "setPhoneNumber:", v10);

      -[EKPersistentParticipant URLString](self, "URLString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKPersistentParticipant setURLString:](v4, "setURLString:", v11);

    }
  }
  return v4;
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EKPersistentParticipant UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentParticipant displayNameRaw](self, "displayNameRaw");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentParticipant emailAddress](self, "emailAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentParticipant phoneNumber](self, "phoneNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentParticipant firstName](self, "firstName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentParticipant lastName](self, "lastName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%p> {UUID = %@; displayName = %@; email = %@; phoneNumber = %@; firstName = %@; lastName = %@; isSelf = %d}"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    -[EKPersistentOrganizer isCurrentUser](self, "isCurrentUser"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setIsCurrentUser:(BOOL)a3
{
  -[EKPersistentObject primitiveSetBoolValue:forKey:](self, "primitiveSetBoolValue:forKey:", a3, *MEMORY[0x1E0D0B840]);
}

- (void)setOwner:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B830]);
}

- (id)owner
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B830]);
}

- (int64_t)scheduleAgent
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B848]);
}

- (void)setScheduleAgent:(int64_t)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", a3, *MEMORY[0x1E0D0B848]);
}

+ (id)organizerWithName:(id)a3 emailAddress:(id)a4 address:(id)a5 isCurrentUser:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:emailAddress:address:isCurrentUser:", v12, v11, v10, v6);

  return v13;
}

- (EKPersistentOrganizer)initWithName:(id)a3 emailAddress:(id)a4 address:(id)a5 isCurrentUser:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  EKPersistentOrganizer *v13;
  EKPersistentOrganizer *v14;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = -[EKPersistentObject init](self, "init");
  v14 = v13;
  if (v13)
  {
    -[EKPersistentParticipant setDisplayNameRaw:](v13, "setDisplayNameRaw:", v10);
    -[EKPersistentParticipant setEmailAddress:](v14, "setEmailAddress:", v11);
    -[EKPersistentParticipant setURLString:](v14, "setURLString:", v12);
    -[EKPersistentOrganizer setIsCurrentUser:](v14, "setIsCurrentUser:", v6);
  }

  return v14;
}

@end
