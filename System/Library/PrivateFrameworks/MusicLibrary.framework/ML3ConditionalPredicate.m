@implementation ML3ConditionalPredicate

- (ML3ConditionalPredicate)initWithConditionPredicate:(id)a3 thenPredicate:(id)a4 elsePredicate:(id)a5
{
  id v9;
  id v10;
  id v11;
  ML3ConditionalPredicate *v12;
  ML3ConditionalPredicate *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ML3ConditionalPredicate;
  v12 = -[ML3ConditionalPredicate init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_conditionPredicate, a3);
    objc_storeStrong((id *)&v13->_thenPredicate, a4);
    objc_storeStrong((id *)&v13->_elsePredicate, a5);
  }

  return v13;
}

- (ML3ConditionalPredicate)initWithCoder:(id)a3
{
  id v4;
  ML3ConditionalPredicate *v5;
  uint64_t v6;
  ML3Predicate *conditionPredicate;
  uint64_t v8;
  ML3Predicate *thenPredicate;
  uint64_t v10;
  ML3Predicate *elsePredicate;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ML3ConditionalPredicate;
  v5 = -[ML3Predicate initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("condition"));
    v6 = objc_claimAutoreleasedReturnValue();
    conditionPredicate = v5->_conditionPredicate;
    v5->_conditionPredicate = (ML3Predicate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("then"));
    v8 = objc_claimAutoreleasedReturnValue();
    thenPredicate = v5->_thenPredicate;
    v5->_thenPredicate = (ML3Predicate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("else"));
    v10 = objc_claimAutoreleasedReturnValue();
    elsePredicate = v5->_elsePredicate;
    v5->_elsePredicate = (ML3Predicate *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ML3ConditionalPredicate;
  v4 = a3;
  -[ML3Predicate encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[ML3ConditionalPredicate conditionPredicate](self, "conditionPredicate", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("condition"));

  -[ML3ConditionalPredicate thenPredicate](self, "thenPredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("then"));

  -[ML3ConditionalPredicate elsePredicate](self, "elsePredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("else"));

}

- (BOOL)isEqual:(id)a3
{
  ML3ConditionalPredicate *v4;
  id v5;
  id v6;
  int v7;
  char v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = (ML3ConditionalPredicate *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)ML3ConditionalPredicate;
    if (-[ML3Predicate isEqual:](&v15, sel_isEqual_, v4))
    {
      -[ML3ConditionalPredicate conditionPredicate](self, "conditionPredicate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[ML3ConditionalPredicate conditionPredicate](v4, "conditionPredicate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (v5 == v6)
      {

      }
      else
      {
        v7 = objc_msgSend(v5, "isEqual:", v6);

        if (!v7)
        {
          v8 = 0;
LABEL_18:

          goto LABEL_19;
        }
      }
      -[ML3ConditionalPredicate thenPredicate](self, "thenPredicate");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[ML3ConditionalPredicate thenPredicate](v4, "thenPredicate");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (v9 == v10)
      {

      }
      else
      {
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (!v11)
        {
          v8 = 0;
LABEL_17:

          goto LABEL_18;
        }
      }
      -[ML3ConditionalPredicate elsePredicate](self, "elsePredicate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ML3ConditionalPredicate elsePredicate](v4, "elsePredicate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 == v13)
        v8 = 1;
      else
        v8 = objc_msgSend(v12, "isEqual:", v13);

      goto LABEL_17;
    }
    v8 = 0;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ML3ConditionalPredicate;
  v3 = -[ML3Predicate hash](&v11, sel_hash);
  -[ML3ConditionalPredicate conditionPredicate](self, "conditionPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[ML3ConditionalPredicate thenPredicate](self, "thenPredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[ML3ConditionalPredicate elsePredicate](self, "elsePredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash") ^ v3;

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)ML3ConditionalPredicate;
  -[ML3ConditionalPredicate description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3ConditionalPredicate conditionPredicate](self, "conditionPredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3ConditionalPredicate thenPredicate](self, "thenPredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3ConditionalPredicate elsePredicate](self, "elsePredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(If %@ then %@ else %@)"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)SQLJoinClausesForClass:(Class)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3ConditionalPredicate conditionPredicate](self, "conditionPredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "SQLJoinClausesForClass:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionOrderedSet:", v7);

  -[ML3ConditionalPredicate thenPredicate](self, "thenPredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "SQLJoinClausesForClass:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionOrderedSet:", v9);

  -[ML3ConditionalPredicate elsePredicate](self, "elsePredicate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "SQLJoinClausesForClass:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionOrderedSet:", v11);

  return v5;
}

- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4
{
  id v6;
  const __CFString *v7;
  id v8;

  v6 = a3;
  v8 = v6;
  if (self->_conditionPredicate && self->_thenPredicate)
  {
    objc_msgSend(v6, "appendString:", CFSTR("(CASE WHEN "));
    -[ML3Predicate appendSQLToMutableString:entityClass:](self->_conditionPredicate, "appendSQLToMutableString:entityClass:", v8, a4);
    objc_msgSend(v8, "appendString:", CFSTR(" THEN "));
    -[ML3Predicate appendSQLToMutableString:entityClass:](self->_thenPredicate, "appendSQLToMutableString:entityClass:", v8, a4);
    if (self->_elsePredicate)
    {
      objc_msgSend(v8, "appendString:", CFSTR(" ELSE "));
      -[ML3Predicate appendSQLToMutableString:entityClass:](self->_elsePredicate, "appendSQLToMutableString:entityClass:", v8, a4);
    }
    else
    {
      objc_msgSend(v8, "appendString:", CFSTR(" ELSE 1"));
    }
    v7 = CFSTR(" END)");
    v6 = v8;
  }
  else
  {
    v7 = CFSTR("1");
  }
  objc_msgSend(v6, "appendString:", v7);

}

- (id)databaseStatementParameters
{
  id v3;
  ML3Predicate *conditionPredicate;
  void *v5;
  ML3Predicate *thenPredicate;
  void *v7;
  ML3Predicate *elsePredicate;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  conditionPredicate = self->_conditionPredicate;
  if (conditionPredicate)
  {
    -[ML3Predicate databaseStatementParameters](conditionPredicate, "databaseStatementParameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v5);

  }
  thenPredicate = self->_thenPredicate;
  if (thenPredicate)
  {
    -[ML3Predicate databaseStatementParameters](thenPredicate, "databaseStatementParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v7);

  }
  elsePredicate = self->_elsePredicate;
  if (elsePredicate)
  {
    -[ML3Predicate databaseStatementParameters](elsePredicate, "databaseStatementParameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v9);

  }
  return v3;
}

- (BOOL)isDynamicForEntityClass:(Class)a3
{
  return -[ML3Predicate isDynamicForEntityClass:](self->_conditionPredicate, "isDynamicForEntityClass:")
      || -[ML3Predicate isDynamicForEntityClass:](self->_thenPredicate, "isDynamicForEntityClass:", a3)
      || -[ML3Predicate isDynamicForEntityClass:](self->_elsePredicate, "isDynamicForEntityClass:", a3);
}

- (id)spotlightPredicate
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  -[ML3Predicate spotlightPredicate](self->_conditionPredicate, "spotlightPredicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[ML3Predicate spotlightPredicate](self->_thenPredicate, "spotlightPredicate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[ML3Predicate spotlightPredicate](self->_elsePredicate, "spotlightPredicate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v8;

  }
  return v5;
}

- (ML3Predicate)conditionPredicate
{
  return self->_conditionPredicate;
}

- (ML3Predicate)thenPredicate
{
  return self->_thenPredicate;
}

- (ML3Predicate)elsePredicate
{
  return self->_elsePredicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elsePredicate, 0);
  objc_storeStrong((id *)&self->_thenPredicate, 0);
  objc_storeStrong((id *)&self->_conditionPredicate, 0);
}

+ (id)predicateWithConditionPredicate:(id)a3 thenPredicate:(id)a4 elsePredicate:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithConditionPredicate:thenPredicate:elsePredicate:", v9, v8, v7);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
