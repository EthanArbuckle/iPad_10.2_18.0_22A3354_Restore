@implementation EKOrganizer

- (int64_t)participantType
{
  return 1;
}

- (int64_t)participantStatus
{
  return 2;
}

- (BOOL)isCurrentUser
{
  void *v2;
  char v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B840]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)organizerWithName:(id)a3 emailAddress:(id)a4 phoneNumber:(id)a5 address:(id)a6 isCurrentUser:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v7 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:emailAddress:phoneNumber:address:isCurrentUser:", v15, v14, v13, v12, v7);

  return v16;
}

- (EKOrganizer)initWithName:(id)a3 emailAddress:(id)a4 phoneNumber:(id)a5 address:(id)a6 isCurrentUser:(BOOL)a7
{
  _BOOL8 v7;
  EKOrganizer *v8;
  EKOrganizer *v9;

  v7 = a7;
  v8 = -[EKParticipant initWithName:emailAddress:phoneNumber:url:](self, "initWithName:emailAddress:phoneNumber:url:", a3, a4, a5, a6);
  v9 = v8;
  if (v8)
    -[EKOrganizer setCurrentUser:](v8, "setCurrentUser:", v7);
  return v9;
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
    v11.super_class = (Class)EKOrganizer;
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
    +[EKOrganizer organizerWithName:emailAddress:phoneNumber:address:isCurrentUser:](EKOrganizer, "organizerWithName:emailAddress:phoneNumber:address:isCurrentUser:", v6, v7, v8, v9, -[EKOrganizer isCurrentUser](self, "isCurrentUser"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (int64_t)participantRole
{
  return 3;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%p> {UUID = %@; name = %@; email = %@; phone = %@; isSelf = %d}"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    -[EKOrganizer isCurrentUser](self, "isCurrentUser"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)owner
{
  return -[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", *MEMORY[0x1E0D0B830]);
}

- (void)setCurrentUser:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B840]);

}

- (int64_t)scheduleAgent
{
  void *v2;
  int64_t v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B848]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setScheduleAgent:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B848]);

}

@end
