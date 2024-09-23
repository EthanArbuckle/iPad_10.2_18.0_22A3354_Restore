@implementation _HDSQLiteComparisonPredicateSubquery

- (_HDSQLiteComparisonPredicateSubquery)initWithProperty:(id)a3 comparisonType:(int64_t)a4 subqueryDescriptor:(id)a5 subqueryProperties:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _HDSQLiteComparisonPredicateSubquery *v15;
  uint64_t v16;
  HDSQLiteQueryDescriptor *subqueryDescriptor;
  uint64_t v18;
  NSArray *subqueryProperties;
  objc_super v21;

  v10 = a5;
  v11 = a6;
  v12 = (void *)MEMORY[0x24BDBCEF8];
  v13 = a3;
  objc_msgSend(v12, "null");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)_HDSQLiteComparisonPredicateSubquery;
  v15 = -[HDSQLiteComparisonPredicate initWithProperty:value:comparisonType:](&v21, sel_initWithProperty_value_comparisonType_, v13, v14, a4);

  if (v15)
  {
    v16 = objc_msgSend(v10, "copy");
    subqueryDescriptor = v15->_subqueryDescriptor;
    v15->_subqueryDescriptor = (HDSQLiteQueryDescriptor *)v16;

    v18 = objc_msgSend(v11, "copy");
    subqueryProperties = v15->_subqueryProperties;
    v15->_subqueryProperties = (NSArray *)v18;

  }
  return v15;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_HDSQLiteComparisonPredicateSubquery;
  v3 = -[HDSQLiteComparisonPredicate hash](&v9, sel_hash);
  -[_HDSQLiteComparisonPredicateSubquery subqueryDescriptor](self, "subqueryDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[_HDSQLiteComparisonPredicateSubquery subqueryProperties](self, "subqueryProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v3;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  HDSQLiteQueryDescriptor *subqueryDescriptor;
  HDSQLiteQueryDescriptor *v6;
  NSArray *subqueryProperties;
  NSArray *v8;
  char v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_HDSQLiteComparisonPredicateSubquery;
  if (!-[HDSQLiteComparisonPredicate isEqual:](&v11, sel_isEqual_, v4))
    goto LABEL_8;
  subqueryDescriptor = self->_subqueryDescriptor;
  v6 = (HDSQLiteQueryDescriptor *)v4[5];
  if (subqueryDescriptor != v6
    && (!v6 || !-[HDSQLiteQueryDescriptor isEqual:](subqueryDescriptor, "isEqual:")))
  {
    goto LABEL_8;
  }
  subqueryProperties = self->_subqueryProperties;
  v8 = (NSArray *)v4[6];
  if (subqueryProperties == v8)
  {
    v9 = 1;
    goto LABEL_9;
  }
  if (v8)
    v9 = -[NSArray isEqual:](subqueryProperties, "isEqual:");
  else
LABEL_8:
    v9 = 0;
LABEL_9:

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HDSQLitePropertyPredicate property](self, "property");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSQLiteComparisonPredicate _comparisonTypeString]((uint64_t *)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSQLiteQueryDescriptor selectSQLForProperties:](self->_subqueryDescriptor, "selectSQLForProperties:", self->_subqueryProperties);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@ (%@)>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  -[HDSQLiteQueryDescriptor bindToSelectStatement:bindingIndex:](self->_subqueryDescriptor, "bindToSelectStatement:bindingIndex:", a3, a4);
}

- (id)SQLForEntityClass:(Class)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x24BDD17C8];
  -[objc_class disambiguatedSQLForProperty:](a3, "disambiguatedSQLForProperty:", self->super.super._property);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSQLiteComparisonPredicate _comparisonTypeString]((uint64_t *)self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSQLiteQueryDescriptor selectSQLForProperties:](self->_subqueryDescriptor, "selectSQLForProperties:", self->_subqueryProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("(%@ %@ (%@))"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HDSQLiteQueryDescriptor)subqueryDescriptor
{
  return self->_subqueryDescriptor;
}

- (NSArray)subqueryProperties
{
  return self->_subqueryProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subqueryProperties, 0);
  objc_storeStrong((id *)&self->_subqueryDescriptor, 0);
}

@end
