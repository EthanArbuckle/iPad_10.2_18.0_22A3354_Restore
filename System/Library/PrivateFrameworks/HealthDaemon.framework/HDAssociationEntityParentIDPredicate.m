@implementation HDAssociationEntityParentIDPredicate

+ (id)predicateWithParentID:(int64_t)a3
{
  _QWORD *v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[1] = a3;
  return v4;
}

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D29870];
  objc_msgSend((id)-[objc_class entityClassForEnumeration](a3, "entityClassForEnumeration"), "disambiguatedDatabaseTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "innerJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:", v4, objc_opt_class(), 0, CFSTR("data_id"), CFSTR("source_object_id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)SQLForEntityClass:(Class)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDAssociationEntity, "disambiguatedDatabaseTable", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@ = ?"), v4, CFSTR("destination_object_id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  sqlite3_bind_int64(a3, *a4, self->_parentID);
  ++*a4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<\"%@\" = %lld>"), CFSTR("destination_object_id"), self->_parentID);
}

@end
