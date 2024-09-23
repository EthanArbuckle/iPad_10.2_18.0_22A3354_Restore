@implementation IRRuleInspection

- (IRRuleInspection)initWithRuleName:(id)a3 evaluation:(id)a4
{
  id v6;
  id v7;
  IRRuleInspection *v8;
  IRRuleInspection *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IRRuleInspection;
  v8 = -[IRRuleInspection init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[IRRuleInspection setRuleName:](v8, "setRuleName:", v6);
    -[IRRuleInspection setEvaluation:](v9, "setEvaluation:", v7);
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

- (IRRuleOutputEvaluation)evaluation
{
  return self->_evaluation;
}

- (void)setEvaluation:(id)a3
{
  objc_storeStrong((id *)&self->_evaluation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evaluation, 0);
  objc_storeStrong((id *)&self->_ruleName, 0);
}

@end
