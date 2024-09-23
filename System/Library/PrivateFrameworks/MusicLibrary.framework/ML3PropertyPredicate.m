@implementation ML3PropertyPredicate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_property, 0);
}

- (id)SQLJoinClausesForClass:(Class)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  -[objc_class subselectStatementForProperty:](a3, "subselectStatementForProperty:", self->_property);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    || (-[objc_class joinClausesForProperty:](a3, "joinClausesForProperty:", self->_property),
        (v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6 = 0;
  }
  else
  {
    v8 = (void *)v7;
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4
{
  NSString *property;
  id v6;
  id v7;

  property = self->_property;
  v6 = a3;
  -[objc_class disambiguatedSQLForProperty:](a4, "disambiguatedSQLForProperty:", property);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v7);

}

+ (id)predicateWithProperty:(id)a3
{
  id v3;
  ML3PropertyPredicate *v4;

  v3 = a3;
  v4 = -[ML3PropertyPredicate initWithProperty:]([ML3PropertyPredicate alloc], "initWithProperty:", v3);

  return v4;
}

- (ML3PropertyPredicate)initWithProperty:(id)a3
{
  id v4;
  ML3PropertyPredicate *v5;
  ML3PropertyPredicate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ML3PropertyPredicate;
  v5 = -[ML3PropertyPredicate init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ML3PropertyPredicate setProperty:](v5, "setProperty:", v4);

  return v6;
}

- (void)setProperty:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BOOL)isDynamicForEntityClass:(Class)a3
{
  return -[objc_class libraryContentsChangeForProperty:](a3, "libraryContentsChangeForProperty:", self->_property) ^ 1;
}

- (BOOL)isEqual:(id)a3
{
  ML3PropertyPredicate *v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  v4 = (ML3PropertyPredicate *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ML3PropertyPredicate;
    if (-[ML3Predicate isEqual:](&v9, sel_isEqual_, v4))
    {
      -[ML3PropertyPredicate property](self, "property");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ML3PropertyPredicate property](v4, "property");
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

- (NSString)property
{
  return self->_property;
}

- (ML3PropertyPredicate)initWithCoder:(id)a3
{
  id v4;
  ML3PropertyPredicate *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ML3PropertyPredicate;
  v5 = -[ML3Predicate initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("property"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ML3PropertyPredicate setProperty:](v5, "setProperty:", v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ML3PropertyPredicate;
  v4 = a3;
  -[ML3Predicate encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[ML3PropertyPredicate property](self, "property", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("property"));

}

- (unint64_t)hash
{
  id v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ML3PropertyPredicate;
  v3 = -[ML3Predicate hash](&v7, sel_hash);
  -[ML3PropertyPredicate property](self, "property");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (unint64_t)v3 + objc_msgSend(v4, "hash");

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)ML3PropertyPredicate;
  -[ML3PropertyPredicate description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%@)"), v4, self->_property);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
