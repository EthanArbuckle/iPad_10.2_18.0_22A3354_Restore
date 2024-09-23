@implementation AMSSQLitePropertyPredicate

- (unint64_t)hash
{
  id v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AMSSQLitePropertyPredicate;
  v3 = -[AMSSQLitePredicate hash](&v7, sel_hash);
  -[AMSSQLitePropertyPredicate property](self, "property");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (unint64_t)v3 + objc_msgSend(v4, "hash");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSSQLitePropertyPredicate;
  if (-[AMSSQLitePredicate isEqual:](&v11, sel_isEqual_, v4))
  {
    -[AMSSQLitePropertyPredicate property](self, "property");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "property");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
    {
      v9 = 1;
    }
    else
    {
      -[AMSSQLitePropertyPredicate property](self, "property");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "property");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  void *v3;
  void *v4;

  -[objc_class joinClauseForProperty:](a3, "joinClauseForProperty:", self->_property);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)property
{
  return self->_property;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_property, 0);
}

@end
