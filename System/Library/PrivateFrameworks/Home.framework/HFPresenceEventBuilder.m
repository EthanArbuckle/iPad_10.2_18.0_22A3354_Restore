@implementation HFPresenceEventBuilder

+ (id)_selectedUsersForPresenceEvent:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  HFSelectedUserCollection *v10;

  v3 = a3;
  v4 = HFSelectedUserCollectionTypeFromPresenceEventUserType(objc_msgSend(v3, "presenceUserType"));
  v5 = (void *)MEMORY[0x1E0C99E60];
  if (v4 == 2)
  {
    objc_msgSend(v3, "users");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = v6;
    else
      v8 = MEMORY[0x1E0C9AA60];
    objc_msgSend(v5, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = -[HFSelectedUserCollection initWithType:specificUsers:]([HFSelectedUserCollection alloc], "initWithType:specificUsers:", v4, v9);

  return v10;
}

- (HFPresenceEventBuilder)initWithEvent:(id)a3
{
  id v4;
  HFPresenceEventBuilder *v5;
  HFPresenceEventBuilder *v6;
  void *v7;
  uint64_t v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HFPresenceEventBuilder;
  v5 = -[HFEventBuilder initWithEvent:](&v10, sel_initWithEvent_, v4);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      -[HFPresenceEventBuilder setLocationEventType:](v5, "setLocationEventType:", objc_msgSend(MEMORY[0x1E0CBA780], "hf_locationEventTypeForPresenceEventType:", objc_msgSend(v4, "presenceEventType")));
      objc_msgSend((id)objc_opt_class(), "_selectedUsersForPresenceEvent:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFPresenceEventBuilder setUsers:](v6, "setUsers:", v7);

      v8 = objc_msgSend(v4, "hf_activationGranularity");
    }
    else
    {
      -[HFPresenceEventBuilder setLocationEventType:](v5, "setLocationEventType:", 0);
      v8 = 0;
    }
    -[HFPresenceEventBuilder setActivationGranularity:](v6, "setActivationGranularity:", v8);
  }

  return v6;
}

- (unint64_t)presenceEventType
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v6;
  void *v7;
  void *v8;

  v3 = -[HFPresenceEventBuilder locationEventType](self, "locationEventType");
  if (v3 == 1)
  {
    v6 = -[HFPresenceEventBuilder activationGranularity](self, "activationGranularity");
    if (v6 == 1)
      return 3;
    if (!v6)
      return 1;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HFPresenceEventBuilder locationEventType](self, "locationEventType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HFPresenceEventBuilder activationGranularity](self, "activationGranularity"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Unexpected event type %@ or activation granularity %@"), v7, v8);

    return 1;
  }
  if (v3 != 2)
    goto LABEL_8;
  v4 = -[HFPresenceEventBuilder activationGranularity](self, "activationGranularity");
  if (v4 != 1)
  {
    if (!v4)
      return 2;
    goto LABEL_8;
  }
  return 4;
}

- (unint64_t)presenceUserType
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[HFPresenceEventBuilder users](self, "users");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 2;
  -[HFPresenceEventBuilder users](self, "users");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = HMPresenceEventUserTypeFromSelectedUserCollectionType(objc_msgSend(v4, "type"));

  return v5;
}

- (id)buildNewEventsFromCurrentState
{
  unint64_t v3;
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = -[HFPresenceEventBuilder presenceUserType](self, "presenceUserType");
  v4 = objc_alloc(MEMORY[0x1E0CBA780]);
  v5 = -[HFPresenceEventBuilder presenceEventType](self, "presenceEventType");
  v6 = -[HFPresenceEventBuilder presenceUserType](self, "presenceUserType");
  if (v3 == 3)
  {
    -[HFPresenceEventBuilder users](self, "users");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "specificUsers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v4, "initWithPresenceEventType:presenceUserType:users:", v5, v6, v9);

  }
  else
  {
    v10 = (void *)objc_msgSend(v4, "initWithPresenceEventType:presenceUserType:", v5, v6);
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HFStringFromHFLocationEventType(-[HFPresenceEventBuilder locationEventType](self, "locationEventType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("locationEventType"));

  NSStringFromHFPresenceEventActivationGranularity(-[HFPresenceEventBuilder activationGranularity](self, "activationGranularity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("activationGranularity"));

  -[HFPresenceEventBuilder users](self, "users");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  if (v7 == 2)
  {
    -[HFPresenceEventBuilder users](self, "users");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "specificUsers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v10, CFSTR("specificUsers"), 0);

  }
  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (id)eventType
{
  return CFSTR("HFEventTypeLocation");
}

- (id)comparisonKey
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)HFPresenceEventBuilder;
  -[HFEventBuilder comparisonKey](&v7, sel_comparisonKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%lu:%lu"), v4, -[HFPresenceEventBuilder presenceEventType](self, "presenceEventType"), -[HFPresenceEventBuilder presenceUserType](self, "presenceUserType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)naturalLanguageNameWithOptions:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CBA4D0];
  v5 = a3;
  -[HFPresenceEventBuilder buildNewEventsFromCurrentState](self, "buildNewEventsFromCurrentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_naturalLanguageNameWithOptions:presenceEvent:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HFSelectedUserCollection)users
{
  return self->_users;
}

- (void)setUsers:(id)a3
{
  objc_storeStrong((id *)&self->_users, a3);
}

- (unint64_t)locationEventType
{
  return self->_locationEventType;
}

- (void)setLocationEventType:(unint64_t)a3
{
  self->_locationEventType = a3;
}

- (unint64_t)activationGranularity
{
  return self->_activationGranularity;
}

- (void)setActivationGranularity:(unint64_t)a3
{
  self->_activationGranularity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_users, 0);
}

- (id)compareToObject:(id)a3
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
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HFPresenceEventBuilder;
  -[HFEventBuilder compareToObject:](&v16, sel_compareToObject_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsCriticalDifference") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HFPresenceEventBuilder presenceEventType](self, "presenceEventType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "presenceEventType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFPropertyDifference compareObjectA:toObjectB:key:priority:](HFPropertyDifference, "compareObjectA:toObjectB:key:priority:", v6, v7, CFSTR("presenceEventType"), 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "add:", v8);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HFPresenceEventBuilder activationGranularity](self, "activationGranularity"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "activationGranularity"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFPropertyDifference compareObjectA:toObjectB:key:priority:](HFPropertyDifference, "compareObjectA:toObjectB:key:priority:", v9, v10, CFSTR("activationGranularity"), 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "add:", v11);

    -[HFPresenceEventBuilder users](self, "users");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "users");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFPropertyDifference compareObjectA:toObjectB:key:priority:](HFPropertyDifference, "compareObjectA:toObjectB:key:priority:", v12, v13, CFSTR("users"), 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "add:", v14);

  }
  return v5;
}

@end
