@implementation HDSQLitePropertyPredicate

- (unint64_t)hash
{
  id v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDSQLitePropertyPredicate;
  v3 = -[HDSQLitePredicate hash](&v7, sel_hash);
  -[HDSQLitePropertyPredicate property](self, "property");
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
  void *v9;
  char v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDSQLitePropertyPredicate;
  if (-[HDSQLitePredicate isEqual:](&v12, sel_isEqual_, v4))
  {
    -[HDSQLitePropertyPredicate property](self, "property");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "property");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend(v4, "property");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[HDSQLitePropertyPredicate property](self, "property");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "property");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  return (id)-[objc_class joinClausesForProperty:](a3, "joinClausesForProperty:", self->_property);
}

- (BOOL)isCompatibleWithPredicate:(id)a3
{
  _QWORD *v4;
  NSString *property;
  NSString *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDSQLitePropertyPredicate;
  if (!-[HDSQLitePredicate isCompatibleWithPredicate:](&v9, sel_isCompatibleWithPredicate_, v4))
    goto LABEL_5;
  property = self->_property;
  v6 = (NSString *)v4[1];
  if (property == v6)
  {
    v7 = 1;
    goto LABEL_7;
  }
  if (v6)
    v7 = -[NSString isEqual:](property, "isEqual:");
  else
LABEL_5:
    v7 = 0;
LABEL_7:

  return v7;
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
