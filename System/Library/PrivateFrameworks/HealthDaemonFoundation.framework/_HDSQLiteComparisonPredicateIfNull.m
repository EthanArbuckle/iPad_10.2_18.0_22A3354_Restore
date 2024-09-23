@implementation _HDSQLiteComparisonPredicateIfNull

- (_HDSQLiteComparisonPredicateIfNull)initWithProperty:(id)a3 ifPropertyIsNullValue:(id)a4 value:(id)a5 comparisonType:(int64_t)a6
{
  id v10;
  _HDSQLiteComparisonPredicateIfNull *v11;
  NSObject *v12;
  NSObject *ifPropertyIsNullValue;
  objc_super v15;

  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_HDSQLiteComparisonPredicateIfNull;
  v11 = -[HDSQLiteComparisonPredicate initWithProperty:value:comparisonType:](&v15, sel_initWithProperty_value_comparisonType_, a3, a5, a6);
  if (v11)
  {
    if (objc_msgSend(v10, "conformsToProtocol:", &unk_254A90A00))
      v12 = objc_msgSend(v10, "copy");
    else
      v12 = v10;
    ifPropertyIsNullValue = v11->_ifPropertyIsNullValue;
    v11->_ifPropertyIsNullValue = v12;

  }
  return v11;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  id v7;

  _BindValueToStatement(self->_ifPropertyIsNullValue, a3, a4);
  -[HDSQLiteComparisonPredicate value](self, "value");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  _BindValueToStatement(v7, a3, a4);

}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_HDSQLiteComparisonPredicateIfNull;
  v3 = -[HDSQLiteComparisonPredicate hash](&v7, sel_hash);
  -[_HDSQLiteComparisonPredicateIfNull ifPropertyIsNullValue](self, "ifPropertyIsNullValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSObject *ifPropertyIsNullValue;
  NSObject *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HDSQLiteComparisonPredicateIfNull;
  if (!-[HDSQLiteComparisonPredicate isEqual:](&v9, sel_isEqual_, v4))
    goto LABEL_5;
  ifPropertyIsNullValue = self->_ifPropertyIsNullValue;
  v6 = v4[5];
  if (ifPropertyIsNullValue == v6)
  {
    v7 = 1;
    goto LABEL_7;
  }
  if (v6)
    v7 = -[NSObject isEqual:](ifPropertyIsNullValue, "isEqual:");
  else
LABEL_5:
    v7 = 0;
LABEL_7:

  return v7;
}

- (id)SQLForEntityClass:(Class)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[HDSQLitePropertyPredicate property](self, "property");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class disambiguatedSQLForProperty:](a3, "disambiguatedSQLForProperty:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD17C8];
  -[HDSQLiteComparisonPredicate _comparisonTypeString]((uint64_t *)self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("(IFNULL(%@, ?) %@ ?)"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  NSObject *ifPropertyIsNullValue;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HDSQLitePropertyPredicate property](self, "property");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ifPropertyIsNullValue = self->_ifPropertyIsNullValue;
  -[HDSQLiteComparisonPredicate _comparisonTypeString]((uint64_t *)self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSQLiteComparisonPredicate value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<\"(%@, %@)\" %@ %@>"), v4, ifPropertyIsNullValue, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSObject)ifPropertyIsNullValue
{
  return self->_ifPropertyIsNullValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ifPropertyIsNullValue, 0);
}

@end
