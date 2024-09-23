@implementation AMSSQLiteComparisonPredicate

+ (id)predicateWithProperty:(id)a3 equalToLongLong:(int64_t)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (objc_class *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithLongLong:", a4);
  objc_msgSend(a1, "predicateWithProperty:equalToValue:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateWithProperty:(id)a3 equalToValue:(id)a4
{
  return (id)objc_msgSend(a1, "predicateWithProperty:value:comparisonType:", a3, a4, 1);
}

+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5
{
  id v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;

  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init((Class)objc_opt_class());
  v9[2] = a5;
  v10 = objc_msgSend(v8, "copy");

  v11 = (void *)v9[1];
  v9[1] = v10;

  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EE0668B8))
    v12 = (id)objc_msgSend(v7, "copy");
  else
    v12 = v7;
  v13 = (void *)v9[3];
  v9[3] = v12;

  return v9;
}

- (void)applyBinding:(id)a3 atIndex:(int *)a4
{
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "bindString:atPosition:", self->_value, *a4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "bindNumber:atPosition:", self->_value, *a4);
  }
  ++*a4;

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[AMSSQLitePropertyPredicate property](self, "property");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[AMSSQLiteComparisonPredicate value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") + v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSSQLiteComparisonPredicate;
  if (-[AMSSQLitePropertyPredicate isEqual:](&v12, sel_isEqual_, v4)
    && (v5 = -[AMSSQLiteComparisonPredicate comparisonType](self, "comparisonType"),
        v5 == objc_msgSend(v4, "comparisonType")))
  {
    -[AMSSQLiteComparisonPredicate value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v10 = 1;
    }
    else
    {
      -[AMSSQLiteComparisonPredicate value](self, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)SQLForEntityClass:(Class)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[AMSSQLitePropertyPredicate property](self, "property");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class disambiguatedSQLForProperty:](a3, "disambiguatedSQLForProperty:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  -[AMSSQLiteComparisonPredicate _comparisonTypeString](self, "_comparisonTypeString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ %@ ?"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_comparisonTypeString
{
  int64_t v2;

  v2 = -[AMSSQLiteComparisonPredicate comparisonType](self, "comparisonType");
  if ((unint64_t)(v2 - 1) > 6)
    return 0;
  else
    return off_1E2545BB0[v2 - 1];
}

- (int64_t)comparisonType
{
  return self->_comparisonType;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
}

@end
