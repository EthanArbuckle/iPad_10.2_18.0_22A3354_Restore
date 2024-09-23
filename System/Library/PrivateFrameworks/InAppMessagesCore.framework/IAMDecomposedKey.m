@implementation IAMDecomposedKey

- (IAMDecomposedKey)init
{
  IAMDecomposedKey *v2;
  void *v3;
  uint64_t v4;
  NSMutableArray *rawPredicateConditions;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IAMDecomposedKey;
  v2 = -[IAMDecomposedKey init](&v7, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[IAMDecomposedKey setRuleDestructuredIdentifiers:](v2, "setRuleDestructuredIdentifiers:", v3);

    v4 = objc_opt_new();
    rawPredicateConditions = v2->rawPredicateConditions;
    v2->rawPredicateConditions = (NSMutableArray *)v4;

    v2->compoundPredicateNeedsInitialization = 1;
  }
  return v2;
}

- (void)addPredicateCondition:(id)a3
{
  NSMutableArray *rawPredicateConditions;
  void *v5;

  rawPredicateConditions = self->rawPredicateConditions;
  v5 = (void *)objc_msgSend(a3, "copy");
  -[NSMutableArray addObject:](rawPredicateConditions, "addObject:", v5);

  self->compoundPredicateNeedsInitialization = 1;
}

- (BOOL)hasPredicates
{
  return -[NSMutableArray count](self->rawPredicateConditions, "count") != 0;
}

- (BOOL)predicatesMatchFigaroEventProperties:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[NSMutableArray count](self->rawPredicateConditions, "count"))
  {
    -[IAMDecomposedKey constructCompoundPredicateIfNeeded](self, "constructCompoundPredicateIfNeeded");
    v5 = -[NSCompoundPredicate evaluateWithObject:](self->compoundPredicate, "evaluateWithObject:", v4);
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)constructCompoundPredicateIfNeeded
{
  NSCompoundPredicate *v3;
  NSCompoundPredicate *compoundPredicate;
  id v5;

  if (self->compoundPredicateNeedsInitialization)
  {
    -[NSMutableArray iam_compactMap:](self->rawPredicateConditions, "iam_compactMap:", &__block_literal_global_0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (NSCompoundPredicate *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14C0]), "initWithType:subpredicates:", 1, v5);
    compoundPredicate = self->compoundPredicate;
    self->compoundPredicate = v3;

    self->compoundPredicateNeedsInitialization = 0;
  }
}

id __54__IAMDecomposedKey_constructCompoundPredicateIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSMutableDictionary)ruleDestructuredIdentifiers
{
  return self->_ruleDestructuredIdentifiers;
}

- (void)setRuleDestructuredIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_ruleDestructuredIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ruleDestructuredIdentifiers, 0);
  objc_storeStrong((id *)&self->compoundPredicate, 0);
  objc_storeStrong((id *)&self->rawPredicateConditions, 0);
}

@end
