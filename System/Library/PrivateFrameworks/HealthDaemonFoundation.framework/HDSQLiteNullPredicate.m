@implementation HDSQLiteNullPredicate

+ (id)isNotNullPredicateWithProperty:(id)a3
{
  id v3;
  _BYTE *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[16] = 0;
  v5 = objc_msgSend(v3, "copy");

  v6 = (void *)*((_QWORD *)v4 + 1);
  *((_QWORD *)v4 + 1) = v5;

  return v4;
}

+ (id)isNullPredicateWithProperty:(id)a3
{
  id v3;
  _BYTE *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[16] = 1;
  v5 = objc_msgSend(v3, "copy");

  v6 = (void *)*((_QWORD *)v4 + 1);
  *((_QWORD *)v4 + 1) = v5;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _BOOL4 v5;
  int v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDSQLiteNullPredicate;
  if (-[HDSQLitePropertyPredicate isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = -[HDSQLiteNullPredicate matchesNull](self, "matchesNull");
    v6 = v5 ^ objc_msgSend(v4, "matchesNull") ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)SQLForEntityClass:(Class)a3
{
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  const __CFString *v9;
  void *v10;

  -[HDSQLitePropertyPredicate property](self, "property");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class disambiguatedSQLForProperty:](a3, "disambiguatedSQLForProperty:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = -[HDSQLiteNullPredicate matchesNull](self, "matchesNull");
  v9 = CFSTR("IS NOT NULL");
  if (v8)
    v9 = CFSTR("IS NULL");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("(%@ %@)"), v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HDSQLitePropertyPredicate property](self, "property");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (self->_matchesNull)
    v6 = "";
  else
    v6 = "NOT ";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<\"%@\" IS %sNULL>"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isCompatibleWithPredicate:(id)a3
{
  unsigned __int8 *v4;
  BOOL v5;
  objc_super v7;

  v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)HDSQLiteNullPredicate;
  if (-[HDSQLitePropertyPredicate isCompatibleWithPredicate:](&v7, sel_isCompatibleWithPredicate_, v4))
    v5 = self->_matchesNull == v4[16];
  else
    v5 = 0;

  return v5;
}

- (BOOL)matchesNull
{
  return self->_matchesNull;
}

@end
