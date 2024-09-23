@implementation HDAssociationEntityParentIDForTypePredicate

+ (id)predicateWithParentID:(int64_t)a3 type:(unint64_t)a4
{
  _QWORD *v6;

  v6 = objc_alloc_init((Class)objc_opt_class());
  v6[1] = a3;
  v6[2] = a4;
  return v6;
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
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDAssociationEntity, "disambiguatedDatabaseTable", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDAssociationEntity, "disambiguatedDatabaseTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@ = ? AND %@.%@ = %lld"), v5, CFSTR("destination_object_id"), v6, CFSTR("type"), self->_type);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  sqlite3_bind_int64(a3, *a4, self->_parentID);
  ++*a4;
}

@end
