@implementation WFCountryFieldParameter

- (id)currentCountry
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDBCAE8];
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDBCAE8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayNameForKey:value:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultSerializedRepresentation
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  objc_super v12;

  v4 = -[WFCountryFieldParameter stateClass](self, "stateClass");
  if (v4 != objc_opt_class())
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCountryFieldParameter.m"), 21, CFSTR("-stateClass expected to be WFVariableStringParameterState"));

  }
  -[WFCountryFieldParameter currentCountry](self, "currentCountry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BEC4188]);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC4180]), "initWithString:", v5);
    v8 = (void *)objc_msgSend(v6, "initWithVariableString:", v7);

    objc_msgSend(v8, "serializedRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)WFCountryFieldParameter;
    -[WFCountryFieldParameter defaultSerializedRepresentation](&v12, sel_defaultSerializedRepresentation);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)textContentType
{
  return (id)*MEMORY[0x24BEC1BE8];
}

@end
