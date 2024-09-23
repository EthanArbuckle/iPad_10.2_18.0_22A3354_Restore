@implementation IRInspectionOrderOfExectionElement

- (IRInspectionOrderOfExectionElement)initWithRuleName:(id)a3 andRuleType:(id)a4
{
  id v6;
  id v7;
  IRInspectionOrderOfExectionElement *v8;
  IRInspectionOrderOfExectionElement *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IRInspectionOrderOfExectionElement;
  v8 = -[IRInspectionOrderOfExectionElement init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[IRInspectionOrderOfExectionElement setRuleName:](v8, "setRuleName:", v6);
    -[IRInspectionOrderOfExectionElement setRuleType:](v9, "setRuleType:", v7);
  }

  return v9;
}

- (NSString)ruleName
{
  return self->_ruleName;
}

- (void)setRuleName:(id)a3
{
  objc_storeStrong((id *)&self->_ruleName, a3);
}

- (NSString)ruleType
{
  return self->_ruleType;
}

- (void)setRuleType:(id)a3
{
  objc_storeStrong((id *)&self->_ruleType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ruleType, 0);
  objc_storeStrong((id *)&self->_ruleName, 0);
}

@end
