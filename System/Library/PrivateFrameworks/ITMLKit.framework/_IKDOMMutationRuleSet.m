@implementation _IKDOMMutationRuleSet

- (_IKDOMMutationRuleSet)initWithMutationRules:(id)a3
{
  id v4;
  _IKDOMMutationRuleSet *v5;
  uint64_t v6;
  NSArray *mutationRules;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_IKDOMMutationRuleSet;
  v5 = -[_IKDOMMutationRuleSet init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    mutationRules = v5->_mutationRules;
    v5->_mutationRules = (NSArray *)v6;

  }
  return v5;
}

- (NSArray)mutationRules
{
  return self->_mutationRules;
}

- (NSSet)dependentPathStrings
{
  return self->_dependentPathStrings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependentPathStrings, 0);
  objc_storeStrong((id *)&self->_mutationRules, 0);
}

@end
