@implementation HDAssociationEntityIsAssociatedPredicate

+ (id)predicateWithInvertedCondition:(BOOL)a3
{
  _BYTE *v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[8] = a3;
  return v4;
}

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set", a3);
}

- (id)SQLForEntityClass:(Class)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDAssociationEntity, "disambiguatedDatabaseTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)-[objc_class entityClassForEnumeration](a3, "entityClassForEnumeration"), "disambiguatedDatabaseTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("data_id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v5, CFSTR("source_object_id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_inverted)
    v10 = CFSTR("IS NULL");
  else
    v10 = CFSTR("IS NOT NULL");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("((SELECT 1 FROM %@ WHERE (%@ = %@) LIMIT 1) %@)"), v5, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
