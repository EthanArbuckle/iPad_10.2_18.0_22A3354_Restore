@implementation GKRule

- (BOOL)evaluatePredicateWithSystem:(GKRuleSystem *)system
{
  return 0;
}

+ (GKRule)ruleWithPredicate:(NSPredicate *)predicate assertingFact:(id)fact grade:(float)grade
{
  id v7;
  NSPredicate *v8;
  _GKNSPredicateRule *v9;
  double v10;
  _GKNSPredicateRule *v11;

  v7 = fact;
  v8 = predicate;
  v9 = [_GKNSPredicateRule alloc];
  *(float *)&v10 = grade;
  v11 = -[_GKNSPredicateRule initWithPredicate:fact:grade:asserting:](v9, "initWithPredicate:fact:grade:asserting:", v8, v7, 1, v10);

  return (GKRule *)v11;
}

+ (GKRule)ruleWithPredicate:(NSPredicate *)predicate retractingFact:(id)fact grade:(float)grade
{
  id v7;
  NSPredicate *v8;
  _GKNSPredicateRule *v9;
  double v10;
  _GKNSPredicateRule *v11;

  v7 = fact;
  v8 = predicate;
  v9 = [_GKNSPredicateRule alloc];
  *(float *)&v10 = grade;
  v11 = -[_GKNSPredicateRule initWithPredicate:fact:grade:asserting:](v9, "initWithPredicate:fact:grade:asserting:", v8, v7, 0, v10);

  return (GKRule *)v11;
}

+ (GKRule)ruleWithBlockPredicate:(void *)predicate action:(void *)action
{
  void *v5;
  void *v6;
  _GKBlockRule *v7;

  v5 = action;
  v6 = predicate;
  v7 = -[_GKBlockRule initWithPredicate:action:]([_GKBlockRule alloc], "initWithPredicate:action:", v6, v5);

  return (GKRule *)v7;
}

- (NSInteger)salience
{
  return self->_salience;
}

- (void)setSalience:(NSInteger)salience
{
  self->_salience = salience;
}

@end
