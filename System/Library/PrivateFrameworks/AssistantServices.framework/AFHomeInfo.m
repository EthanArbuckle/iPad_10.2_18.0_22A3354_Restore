@implementation AFHomeInfo

- (AFHomeInfo)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFHomeInfoMutation *);
  AFHomeInfo *v5;
  AFHomeInfo *v6;
  _AFHomeInfoMutation *v7;
  void *v8;
  uint64_t v9;
  NSUUID *homeIdentifier;
  objc_super v12;

  v4 = (void (**)(id, _AFHomeInfoMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)AFHomeInfo;
  v5 = -[AFHomeInfo init](&v12, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFHomeInfoMutation initWithBase:]([_AFHomeInfoMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFHomeInfoMutation isDirty](v7, "isDirty"))
    {
      -[_AFHomeInfoMutation getHomeIdentifier](v7, "getHomeIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      homeIdentifier = v6->_homeIdentifier;
      v6->_homeIdentifier = (NSUUID *)v9;

      v6->_activityNotificationsEnabledForPersonalRequests = -[_AFHomeInfoMutation getActivityNotificationsEnabledForPersonalRequests](v7, "getActivityNotificationsEnabledForPersonalRequests");
    }

  }
  return v6;
}

- (AFHomeInfo)init
{
  return -[AFHomeInfo initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFHomeInfo)initWithHomeIdentifier:(id)a3 activityNotificationsEnabledForPersonalRequests:(BOOL)a4
{
  id v6;
  id v7;
  AFHomeInfo *v8;
  _QWORD v10[4];
  id v11;
  BOOL v12;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__AFHomeInfo_initWithHomeIdentifier_activityNotificationsEnabledForPersonalRequests___block_invoke;
  v10[3] = &unk_1E3A35870;
  v11 = v6;
  v12 = a4;
  v7 = v6;
  v8 = -[AFHomeInfo initWithBuilder:](self, "initWithBuilder:", v10);

  return v8;
}

- (NSString)description
{
  return (NSString *)-[AFHomeInfo _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10.receiver = self;
  v10.super_class = (Class)AFHomeInfo;
  -[AFHomeInfo description](&v10, sel_description);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_activityNotificationsEnabledForPersonalRequests)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {homeIdentifier = %@, activityNotificationsEnabledForPersonalRequests = %@}"), v5, self->_homeIdentifier, v7);

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[NSUUID hash](self->_homeIdentifier, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_activityNotificationsEnabledForPersonalRequests);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  AFHomeInfo *v4;
  AFHomeInfo *v5;
  _BOOL4 activityNotificationsEnabledForPersonalRequests;
  NSUUID *v7;
  NSUUID *homeIdentifier;
  BOOL v9;

  v4 = (AFHomeInfo *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      activityNotificationsEnabledForPersonalRequests = self->_activityNotificationsEnabledForPersonalRequests;
      if (activityNotificationsEnabledForPersonalRequests == -[AFHomeInfo activityNotificationsEnabledForPersonalRequests](v5, "activityNotificationsEnabledForPersonalRequests"))
      {
        -[AFHomeInfo homeIdentifier](v5, "homeIdentifier");
        v7 = (NSUUID *)objc_claimAutoreleasedReturnValue();
        homeIdentifier = self->_homeIdentifier;
        v9 = homeIdentifier == v7 || -[NSUUID isEqual:](homeIdentifier, "isEqual:", v7);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (AFHomeInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  AFHomeInfo *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeInfo::homeIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeInfo::activityNotificationsEnabledForPersonalRequests"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "BOOLValue");
  v8 = -[AFHomeInfo initWithHomeIdentifier:activityNotificationsEnabledForPersonalRequests:](self, "initWithHomeIdentifier:activityNotificationsEnabledForPersonalRequests:", v5, v7);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *homeIdentifier;
  id v5;
  id v6;

  homeIdentifier = self->_homeIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", homeIdentifier, CFSTR("AFHomeInfo::homeIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_activityNotificationsEnabledForPersonalRequests);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("AFHomeInfo::activityNotificationsEnabledForPersonalRequests"));

}

- (AFHomeInfo)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  AFHomeInfo *v7;
  void *v8;
  id v9;
  uint64_t v10;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "objectForKey:", CFSTR("homeIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

    objc_msgSend(v4, "objectForKey:", CFSTR("activityNotificationsEnabledForPersonalRequests"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    v10 = objc_msgSend(v9, "BOOLValue");
    self = -[AFHomeInfo initWithHomeIdentifier:activityNotificationsEnabledForPersonalRequests:](self, "initWithHomeIdentifier:activityNotificationsEnabledForPersonalRequests:", v6, v10);

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)buildDictionaryRepresentation
{
  id v3;
  void *v4;
  NSUUID *homeIdentifier;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  homeIdentifier = self->_homeIdentifier;
  if (homeIdentifier)
    objc_msgSend(v3, "setObject:forKey:", homeIdentifier, CFSTR("homeIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_activityNotificationsEnabledForPersonalRequests);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("activityNotificationsEnabledForPersonalRequests"));

  v7 = (void *)objc_msgSend(v4, "copy");
  return v7;
}

- (NSUUID)homeIdentifier
{
  return self->_homeIdentifier;
}

- (BOOL)activityNotificationsEnabledForPersonalRequests
{
  return self->_activityNotificationsEnabledForPersonalRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
}

void __85__AFHomeInfo_initWithHomeIdentifier_activityNotificationsEnabledForPersonalRequests___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setHomeIdentifier:", v3);
  objc_msgSend(v4, "setActivityNotificationsEnabledForPersonalRequests:", *(unsigned __int8 *)(a1 + 40));

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFHomeInfoMutation *);
  _AFHomeInfoMutation *v5;
  AFHomeInfo *v6;
  void *v7;
  uint64_t v8;
  NSUUID *homeIdentifier;

  v4 = (void (**)(id, _AFHomeInfoMutation *))a3;
  if (v4)
  {
    v5 = -[_AFHomeInfoMutation initWithBase:]([_AFHomeInfoMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFHomeInfoMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFHomeInfo);
      -[_AFHomeInfoMutation getHomeIdentifier](v5, "getHomeIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      homeIdentifier = v6->_homeIdentifier;
      v6->_homeIdentifier = (NSUUID *)v8;

      v6->_activityNotificationsEnabledForPersonalRequests = -[_AFHomeInfoMutation getActivityNotificationsEnabledForPersonalRequests](v5, "getActivityNotificationsEnabledForPersonalRequests");
    }
    else
    {
      v6 = (AFHomeInfo *)-[AFHomeInfo copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFHomeInfo *)-[AFHomeInfo copy](self, "copy");
  }

  return v6;
}

@end
