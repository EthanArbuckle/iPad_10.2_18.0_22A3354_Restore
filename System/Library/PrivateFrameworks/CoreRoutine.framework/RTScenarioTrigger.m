@implementation RTScenarioTrigger

+ (id)scenarioTriggerTypeToString:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("Unknown");
  else
    return off_1E4FB09F8[a3];
}

+ (id)scenarioTriggerSettledStateToString:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 2)
    v3 = CFSTR("Settled");
  if (a3 == 1)
    return CFSTR("Unsettled");
  else
    return (id)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  unint64_t type;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  type = self->_type;
  v5 = a3;
  objc_msgSend(v3, "numberWithUnsignedInteger:", type);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("type"));

}

- (RTScenarioTrigger)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  return -[RTScenarioTrigger initWithType:](self, "initWithType:", v6);
}

- (RTScenarioTrigger)init
{
  uint64_t v2;

  objc_opt_class();
  NSRequestConcreteImplementation();
  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithType_);
}

- (RTScenarioTrigger)initWithType:(unint64_t)a3
{
  RTScenarioTrigger *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTScenarioTrigger;
  result = -[RTScenarioTrigger init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  +[RTScenarioTrigger scenarioTriggerTypeToString:](RTScenarioTrigger, "scenarioTriggerTypeToString:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("RTScenarioTriggerType, %@ (%lu)"), v4, self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  RTScenarioTrigger *v4;
  RTScenarioTrigger *v5;
  RTScenarioTrigger *v6;
  unint64_t v7;
  uint64_t v8;
  BOOL v9;

  v4 = (RTScenarioTrigger *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4 && -[RTScenarioTrigger isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v6 = v5;
    v7 = -[RTScenarioTrigger type](self, "type");
    v8 = -[RTScenarioTrigger type](v6, "type");

    v9 = v7 == v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = objc_msgSend((id)objc_opt_class(), "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTScenarioTrigger type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

@end
