@implementation ML3NegationPredicate

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)ML3NegationPredicate;
  -[ML3NegationPredicate description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(NOT %@)"), v4, self->super._predicate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4
{
  id v6;

  v6 = a3;
  objc_msgSend(v6, "appendString:", CFSTR("(NOT "));
  -[ML3Predicate appendSQLToMutableString:entityClass:](self->super._predicate, "appendSQLToMutableString:entityClass:", v6, a4);
  objc_msgSend(v6, "appendString:", CFSTR(")"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
