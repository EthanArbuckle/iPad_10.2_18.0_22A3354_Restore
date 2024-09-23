@implementation _HFCompoundConditionMatch

+ (id)matchWithCondition:(id)a3 matchedPredicates:(id)a4
{
  id v5;
  id v6;
  _HFCompoundConditionMatch *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(_HFCompoundConditionMatch);
  -[_HFCompoundConditionMatch setMatchedCondition:](v7, "setMatchedCondition:", v6);

  -[_HFCompoundConditionMatch setMatchedPredicates:](v7, "setMatchedPredicates:", v5);
  return v7;
}

- (HFCondition)matchedCondition
{
  return self->_matchedCondition;
}

- (void)setMatchedCondition:(id)a3
{
  objc_storeStrong((id *)&self->_matchedCondition, a3);
}

- (NSArray)matchedPredicates
{
  return self->_matchedPredicates;
}

- (void)setMatchedPredicates:(id)a3
{
  objc_storeStrong((id *)&self->_matchedPredicates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedPredicates, 0);
  objc_storeStrong((id *)&self->_matchedCondition, 0);
}

@end
