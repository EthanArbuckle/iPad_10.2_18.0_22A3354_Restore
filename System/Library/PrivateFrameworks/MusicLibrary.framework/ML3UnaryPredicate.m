@implementation ML3UnaryPredicate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
}

+ (id)predicateWithPredicate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPredicate:", v4);

  return v5;
}

- (ML3UnaryPredicate)initWithPredicate:(id)a3
{
  id v4;
  ML3UnaryPredicate *v5;
  ML3UnaryPredicate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ML3UnaryPredicate;
  v5 = -[ML3UnaryPredicate init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ML3UnaryPredicate setPredicate:](v5, "setPredicate:", v4);

  return v6;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (ML3UnaryPredicate)initWithCoder:(id)a3
{
  id v4;
  ML3UnaryPredicate *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ML3UnaryPredicate;
  v5 = -[ML3UnaryPredicate init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predicate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ML3UnaryPredicate setPredicate:](v5, "setPredicate:", v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ML3UnaryPredicate;
  v4 = a3;
  -[ML3Predicate encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[ML3UnaryPredicate predicate](self, "predicate", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("predicate"));

}

- (BOOL)isEqual:(id)a3
{
  ML3UnaryPredicate *v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  v4 = (ML3UnaryPredicate *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ML3UnaryPredicate;
    if (-[ML3Predicate isEqual:](&v9, sel_isEqual_, v4))
    {
      -[ML3UnaryPredicate predicate](self, "predicate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ML3UnaryPredicate predicate](v4, "predicate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 == v6)
        v7 = 1;
      else
        v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ML3UnaryPredicate;
  v3 = -[ML3Predicate hash](&v7, sel_hash);
  -[ML3UnaryPredicate predicate](self, "predicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (unint64_t)v3 + objc_msgSend(v4, "hash");

  return v5;
}

- (id)SQLJoinClausesForClass:(Class)a3
{
  return -[ML3Predicate SQLJoinClausesForClass:](self->_predicate, "SQLJoinClausesForClass:", a3);
}

- (id)databaseStatementParameters
{
  return -[ML3Predicate databaseStatementParameters](self->_predicate, "databaseStatementParameters");
}

- (ML3Predicate)predicate
{
  return self->_predicate;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
