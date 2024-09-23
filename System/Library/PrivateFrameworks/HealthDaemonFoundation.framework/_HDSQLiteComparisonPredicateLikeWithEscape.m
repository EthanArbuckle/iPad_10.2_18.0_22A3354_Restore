@implementation _HDSQLiteComparisonPredicateLikeWithEscape

- (_HDSQLiteComparisonPredicateLikeWithEscape)initWithProperty:(id)a3 value:(id)a4 escapeCharacter:(id)a5
{
  id v9;
  _HDSQLiteComparisonPredicateLikeWithEscape *v10;
  _HDSQLiteComparisonPredicateLikeWithEscape *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_HDSQLiteComparisonPredicateLikeWithEscape;
  v10 = -[HDSQLiteComparisonPredicate initWithProperty:value:comparisonType:](&v13, sel_initWithProperty_value_comparisonType_, a3, a4, 8);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_escapeCharacter, a5);

  return v11;
}

- (id)SQLForEntityClass:(Class)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[HDSQLitePropertyPredicate property](self, "property");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class disambiguatedSQLForProperty:](a3, "disambiguatedSQLForProperty:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@ LIKE ? ESCAPE '%@')"), v6, self->_escapeCharacter);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)escapeCharacter
{
  return self->_escapeCharacter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_escapeCharacter, 0);
}

@end
