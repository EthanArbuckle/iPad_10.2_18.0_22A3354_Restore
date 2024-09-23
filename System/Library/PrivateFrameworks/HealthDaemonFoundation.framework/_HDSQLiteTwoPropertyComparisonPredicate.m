@implementation _HDSQLiteTwoPropertyComparisonPredicate

- (_HDSQLiteTwoPropertyComparisonPredicate)initWithProperty:(id)a3 comparisonType:(int64_t)a4 otherProperty:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HDSQLiteTwoPropertyComparisonPredicate;
  return -[HDSQLiteComparisonPredicate initWithProperty:value:comparisonType:](&v6, sel_initWithProperty_value_comparisonType_, a3, a5, a4);
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
  -[_HDSQLiteTwoPropertyComparisonPredicate otherProperty](self, "otherProperty");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@ %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)SQLForEntityClass:(Class)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x24BDD17C8];
  -[objc_class disambiguatedSQLForProperty:](a3, "disambiguatedSQLForProperty:", self->super.super._property);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSQLiteComparisonPredicate _comparisonTypeString]((uint64_t *)self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HDSQLiteTwoPropertyComparisonPredicate otherProperty](self, "otherProperty");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class disambiguatedSQLForProperty:](a3, "disambiguatedSQLForProperty:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("(%@ %@ %@)"), v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
