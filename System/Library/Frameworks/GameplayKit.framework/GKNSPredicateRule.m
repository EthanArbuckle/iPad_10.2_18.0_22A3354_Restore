@implementation GKNSPredicateRule

- (GKNSPredicateRule)initWithPredicate:(NSPredicate *)predicate
{
  NSPredicate *v5;
  GKNSPredicateRule *v6;
  GKNSPredicateRule *v7;
  objc_super v9;

  v5 = predicate;
  v9.receiver = self;
  v9.super_class = (Class)GKNSPredicateRule;
  v6 = -[GKNSPredicateRule init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_predicate, predicate);

  return v7;
}

- (BOOL)evaluatePredicateWithSystem:(GKRuleSystem *)system
{
  NSPredicate *predicate;
  GKRuleSystem *v4;
  void *v5;

  predicate = self->_predicate;
  v4 = system;
  -[GKRuleSystem state](v4, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(predicate) = -[NSPredicate evaluateWithObject:substitutionVariables:](predicate, "evaluateWithObject:substitutionVariables:", v4, v5);

  return (char)predicate;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
