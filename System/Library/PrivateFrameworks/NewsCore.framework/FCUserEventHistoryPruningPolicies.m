@implementation FCUserEventHistoryPruningPolicies

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policies, 0);
}

+ (id)defaultPolicy
{
  FCUserEventHistoryPruningPolicies *v2;
  FCUserEventHistoryPruningPolicy *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(FCUserEventHistoryPruningPolicies);
  v3 = -[FCUserEventHistoryPruningPolicy initWithType:value:]([FCUserEventHistoryPruningPolicy alloc], "initWithType:value:", 1, 5000000);
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserEventHistoryPruningPolicies setPolicies:](v2, "setPolicies:", v4);

  return v2;
}

- (FCUserEventHistoryPruningPolicies)initWithDictionary:(id)a3
{
  id v4;
  FCUserEventHistoryPruningPolicies *v5;
  void *v6;
  void *v7;
  FCUserEventHistoryPruningPolicy *v8;
  void *v9;
  FCUserEventHistoryPruningPolicy *v10;
  void *v11;
  FCUserEventHistoryPruningPolicy *v12;
  uint64_t v13;
  FCUserEventHistoryPruningPolicies *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FCUserEventHistoryPruningPolicies;
  v5 = -[FCUserEventHistoryPruningPolicies init](&v16, sel_init);
  if (!v5)
    goto LABEL_12;
  v6 = (void *)objc_opt_new();
  FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("maxSizeOnDisk"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[FCUserEventHistoryPruningPolicy initWithType:value:]([FCUserEventHistoryPruningPolicy alloc], "initWithType:value:", 1, objc_msgSend(v7, "unsignedIntegerValue"));
    objc_msgSend(v6, "addObject:", v8);

  }
  FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("maxSessionAge"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = -[FCUserEventHistoryPruningPolicy initWithType:value:]([FCUserEventHistoryPruningPolicy alloc], "initWithType:value:", 3, objc_msgSend(v9, "unsignedIntegerValue"));
    objc_msgSend(v6, "addObject:", v10);

  }
  FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("maxSessionCount"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = -[FCUserEventHistoryPruningPolicy initWithType:value:]([FCUserEventHistoryPruningPolicy alloc], "initWithType:value:", 2, objc_msgSend(v11, "unsignedIntegerValue"));
    objc_msgSend(v6, "addObject:", v12);

  }
  v13 = objc_msgSend(v6, "count");
  if (v13)
  {
    -[FCUserEventHistoryPruningPolicies setPolicies:](v5, "setPolicies:", v6);
  }
  else
  {

    v5 = 0;
  }

  if (!v13)
  {
    v14 = 0;
  }
  else
  {
LABEL_12:
    v5 = v5;
    v14 = v5;
  }

  return v14;
}

- (void)setPolicies:(id)a3
{
  objc_storeStrong((id *)&self->_policies, a3);
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserEventHistoryPruningPolicies policies](self, "policies");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; policies: %@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (NSArray)policies
{
  return self->_policies;
}

@end
