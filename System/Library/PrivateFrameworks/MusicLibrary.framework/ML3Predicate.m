@implementation ML3Predicate

- (id)databaseStatementParameters
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;

  if (self == a3)
    return 1;
  v3 = objc_opt_class();
  return v3 == objc_opt_class();
}

- (id)spotlightPredicate
{
  return 0;
}

- (ML3Predicate)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ML3Predicate;
  return -[ML3Predicate init](&v4, sel_init, a3);
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

- (id)SQLJoinClausesForClass:(Class)a3
{
  return 0;
}

- (id)SQLForEntityClass:(Class)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3Predicate appendSQLToMutableString:entityClass:](self, "appendSQLToMutableString:entityClass:", v5, a3);
  return v5;
}

- (BOOL)isDynamicForEntityClass:(Class)a3
{
  return 0;
}

- (BOOL)isTrueAlways
{
  return 0;
}

- (BOOL)isFalseAlways
{
  return 0;
}

- (BOOL)containsPropertyPredicate:(id)a3 matchingValue:(id)a4 usingComparison:(int)a5
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
