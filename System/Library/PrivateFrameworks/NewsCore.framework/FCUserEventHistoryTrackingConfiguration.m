@implementation FCUserEventHistoryTrackingConfiguration

- (FCUserEventHistoryTrackingConfiguration)initWithDictionary:(id)a3
{
  id v4;
  FCUserEventHistoryTrackingConfiguration *v5;
  void *v6;
  FCUserEventHistoryPruningPolicies *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FCUserEventHistoryTrackingConfiguration;
  v5 = -[FCUserEventHistoryTrackingConfiguration init](&v10, sel_init);
  if (v5)
  {
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("pruningPolicies"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[FCUserEventHistoryPruningPolicies initWithDictionary:]([FCUserEventHistoryPruningPolicies alloc], "initWithDictionary:", v6);
    if (v7)
    {
      -[FCUserEventHistoryTrackingConfiguration setPruningPolicies:](v5, "setPruningPolicies:", v7);
    }
    else
    {
      +[FCUserEventHistoryPruningPolicies defaultPolicy](FCUserEventHistoryPruningPolicies, "defaultPolicy");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCUserEventHistoryTrackingConfiguration setPruningPolicies:](v5, "setPruningPolicies:", v8);

    }
  }

  return v5;
}

- (void)setPruningPolicies:(id)a3
{
  objc_storeStrong((id *)&self->_pruningPolicies, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pruningPolicies, 0);
}

- (FCUserEventHistoryPruningPolicies)pruningPolicies
{
  return self->_pruningPolicies;
}

- (FCUserEventHistoryTrackingConfiguration)init
{
  return -[FCUserEventHistoryTrackingConfiguration initWithDictionary:](self, "initWithDictionary:", 0);
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserEventHistoryTrackingConfiguration pruningPolicies](self, "pruningPolicies");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; pruningPolicies: %@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

@end
