@implementation NSPredicateRule

- (NSPredicateRule)init
{
  void *v3;
  NSPredicateRule *v4;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSPredicateRule initWithPredicate:](self, "initWithPredicate:", v3);

  return v4;
}

- (NSPredicateRule)initWithPredicate:(id)a3
{
  id v5;
  NSPredicateRule *v6;
  NSPredicateRule *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSPredicateRule;
  v6 = -[NSPredicateRule init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_predicate, a3);

  return v7;
}

- (NSPredicateRule)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSPredicateRule *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predicate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[NSPredicateRule initWithPredicate:](self, "initWithPredicate:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_predicate, CFSTR("predicate"));
}

- (BOOL)evaluatePredicateWithSystem:(id)a3
{
  NSPredicate *predicate;
  id v4;
  void *v5;

  predicate = self->_predicate;
  v4 = a3;
  objc_msgSend(v4, "constants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(predicate) = -[NSPredicate evaluateWithObject:substitutionVariables:](predicate, "evaluateWithObject:substitutionVariables:", v4, v5);

  return (char)predicate;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPredicate debugDescription](self->_predicate, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ : IF '%@'"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
