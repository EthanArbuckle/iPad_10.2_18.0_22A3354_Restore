@implementation HDWorkoutActivityPredicate

+ (id)predicateForSubPredicate:(id)a3
{
  id v3;
  HDWorkoutActivityPredicate *v4;
  _QWORD *v5;
  void *v6;
  objc_super v8;

  v3 = a3;
  v4 = [HDWorkoutActivityPredicate alloc];
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)HDWorkoutActivityPredicate;
    v5 = objc_msgSendSuper2(&v8, sel_init);
  }
  else
  {
    v5 = 0;
  }
  v6 = (void *)v5[1];
  v5[1] = v3;

  return v5;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  -[HDSQLitePredicate bindToStatement:bindingIndex:](self->_subPredicate, "bindToStatement:bindingIndex:", a3, a4);
}

- (id)SQLForEntityClass:(Class)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  -[HDSQLitePredicate SQLForEntityClass:](self->_subPredicate, "SQLForEntityClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB3940];
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDWorkoutActivityEntity, "disambiguatedDatabaseTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D29618];
  +[HDDataEntity disambiguatedSQLForProperty:](HDWorkoutEntity, "disambiguatedSQLForProperty:", *MEMORY[0x1E0D29618]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDWorkoutActivityEntity, "disambiguatedSQLForProperty:", CFSTR("owner_id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDWorkoutActivityEntity, "disambiguatedSQLForProperty:", CFSTR("is_primary_activity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDWorkoutActivityEntity, "disambiguatedDatabaseTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDataEntity disambiguatedSQLForProperty:](HDWorkoutEntity, "disambiguatedSQLForProperty:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDWorkoutActivityEntity, "disambiguatedSQLForProperty:", CFSTR("owner_id"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("(EXISTS (SELECT 1 FROM %@ WHERE %@ = %@ AND (%@) AND (%@ = 0 OR (SELECT COUNT(*) FROM %@ WHERE %@ = %@) = 1)))"), v4, v6, v7, v3, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subPredicate, 0);
}

@end
