@implementation HDAssociationEntityParentIDExistsPredicate

+ (id)predicateWithParentID:(int64_t)a3 exists:(BOOL)a4
{
  _QWORD *v6;

  v6 = objc_alloc_init((Class)objc_opt_class());
  v6[1] = a3;
  *((_BYTE *)v6 + 16) = a4;
  return v6;
}

- (id)SQLForEntityClass:(Class)a3
{
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDAssociationEntity, "disambiguatedDatabaseTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  if (self->_exists)
    v7 = CFSTR("(EXISTS");
  else
    v7 = CFSTR("(NOT EXISTS");
  objc_msgSend((id)-[objc_class entityClassForEnumeration](a3, "entityClassForEnumeration"), "disambiguatedSQLForProperty:", CFSTR("data_id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ (SELECT 1 FROM %@ cor WHERE ((cor.%@ = ?) AND (%@=cor.%@)) LIMIT 1))"), v7, v5, CFSTR("destination_object_id"), v8, CFSTR("source_object_id"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  sqlite3_bind_int64(a3, *a4, self->_parentID);
  ++*a4;
}

- (id)description
{
  const __CFString *v2;

  if (self->_exists)
    v2 = CFSTR("exits");
  else
    v2 = CFSTR("does not exist");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<\"%@\" = %lld %@>"), CFSTR("destination_object_id"), self->_parentID, v2);
}

@end
