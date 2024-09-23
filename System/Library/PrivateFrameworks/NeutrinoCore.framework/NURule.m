@implementation NURule

- (BOOL)evaluatePredicateWithSystem:(id)a3
{
  return 0;
}

- (int64_t)salience
{
  return self->_salience;
}

- (void)setSalience:(int64_t)a3
{
  self->_salience = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)ruleWithPredicate:(id)a3 assertingFact:(id)a4 grade:(double)a5
{
  id v7;
  id v8;
  _NSPredicateRule *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[_NSPredicateRule initWithPredicate:fact:grade:asserting:]([_NSPredicateRule alloc], "initWithPredicate:fact:grade:asserting:", v8, v7, 1, a5);

  return v9;
}

+ (id)ruleWithPredicate:(id)a3 retractingFact:(id)a4 grade:(double)a5
{
  id v7;
  id v8;
  _NSPredicateRule *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[_NSPredicateRule initWithPredicate:fact:grade:asserting:]([_NSPredicateRule alloc], "initWithPredicate:fact:grade:asserting:", v8, v7, 0, a5);

  return v9;
}

+ (id)ruleWithPredicate:(id)a3 action:(id)a4
{
  id v5;
  id v6;
  _NSPredicateBlockRule *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_NSPredicateBlockRule initWithPredicate:action:]([_NSPredicateBlockRule alloc], "initWithPredicate:action:", v6, v5);

  return v7;
}

+ (id)ruleWithBlockPredicate:(id)a3 action:(id)a4
{
  id v5;
  id v6;
  _NUBlockRule *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_NUBlockRule initWithPredicate:action:]([_NUBlockRule alloc], "initWithPredicate:action:", v6, v5);

  return v7;
}

@end
