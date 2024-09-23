@implementation IRRuleOutput

- (IRRuleOutput)initWithRule:(id)a3
{
  id v5;
  IRRuleOutput *v6;
  IRRuleOutput *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IRRuleOutput;
  v6 = -[IRRuleOutput init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rule, a3);

  return v7;
}

- (id)evaluateRuleOutputWithCandidateIdentifier:(id)a3
{
  return 0;
}

- (IRRule)rule
{
  return self->_rule;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rule, 0);
}

@end
