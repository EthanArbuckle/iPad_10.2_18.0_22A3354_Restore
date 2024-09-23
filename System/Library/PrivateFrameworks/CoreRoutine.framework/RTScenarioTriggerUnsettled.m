@implementation RTScenarioTriggerUnsettled

- (RTScenarioTriggerUnsettled)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RTScenarioTriggerUnsettled;
  return -[RTScenarioTrigger initWithType:](&v3, sel_initWithType_, 2);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)RTScenarioTriggerUnsettled;
  -[RTScenarioTrigger description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
