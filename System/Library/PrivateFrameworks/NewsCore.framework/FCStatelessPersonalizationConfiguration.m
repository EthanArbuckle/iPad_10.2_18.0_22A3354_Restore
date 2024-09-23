@implementation FCStatelessPersonalizationConfiguration

- (FCStatelessPersonalizationConfiguration)initWithDictionary:(id)a3
{
  id v4;
  FCStatelessPersonalizationConfiguration *v5;
  void *v6;
  FCStatelessPersonalizationEnablementRequirements *v7;
  FCStatelessPersonalizationEnablementRequirements *enablementRequirements;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FCStatelessPersonalizationConfiguration;
  v5 = -[FCStatelessPersonalizationConfiguration init](&v10, sel_init);
  if (v5)
  {
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("enablementRequirements"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[FCStatelessPersonalizationEnablementRequirements initWithDictionary:]([FCStatelessPersonalizationEnablementRequirements alloc], "initWithDictionary:", v6);
    enablementRequirements = v5->_enablementRequirements;
    v5->_enablementRequirements = v7;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enablementRequirements, 0);
}

- (FCStatelessPersonalizationEnablementRequirements)enablementRequirements
{
  return self->_enablementRequirements;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCStatelessPersonalizationConfiguration enablementRequirements](self, "enablementRequirements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; enablementRequirements: %@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (void)setEnablementRequirements:(id)a3
{
  objc_storeStrong((id *)&self->_enablementRequirements, a3);
}

@end
