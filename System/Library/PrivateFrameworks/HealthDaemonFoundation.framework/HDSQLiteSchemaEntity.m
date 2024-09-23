@implementation HDSQLiteSchemaEntity

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 0;
  return (const $48FC7E0170F5E23E940B831877C707BE *)&+[HDSQLiteSchemaEntity columnDefinitionsWithCount:]::columnDefinitions;
}

+ (id)databaseName
{
  return 0;
}

+ (id)tableAliases
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (BOOL)isTemporary
{
  return 0;
}

+ (id)orderingTermForSortDescriptor:(id)a3
{
  return 0;
}

+ (id)privateSubEntities
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)joinClausesForProperty:(id)a3
{
  return 0;
}

+ (id)uniquedColumns
{
  return 0;
}

+ (id)checkConstraints
{
  return 0;
}

+ (id)foreignKeys
{
  return (id)MEMORY[0x24BDBD1B8];
}

+ (id)indices
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)triggers
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)disambiguatedSQLForProperty:(id)a3
{
  HDSQLiteEntityDisambiguatedSQLForProperty(a1, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)createTableSQL
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v12 = 0;
  v3 = objc_msgSend(a1, "columnDefinitionsWithCount:", &v12);
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  objc_msgSend(a1, "foreignKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "primaryKeyColumns");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uniquedColumns");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "checkConstraints");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteEntityCreateTableSQL(v4, v3, v5, v6, v7, v8, v9, objc_msgSend(a1, "hasROWID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)hasColumnWithName:(id)a3
{
  return HDSQLiteEntityHasColumnWithName(a1, a3);
}

+ (void)enumerateColumnsWithBlock:(id)a3
{
  HDSQLiteEntityEnumerateColumns(a1, a3);
}

+ (Class)entityForProperty:(id)a3
{
  HDSQLiteEntityForProperty(a1, a3);
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)insertSQLForProperties:(id)a3 shouldReplace:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;

  v4 = a4;
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD16A8];
  if (v4)
    v8 = CFSTR(" OR REPLACE");
  else
    v8 = &stru_24CB19CC0;
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("INSERT%@ INTO %@ (%@) VALUES ("), v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v6, "count");
  if (v12)
  {
    v13 = CFSTR("?");
    do
    {
      objc_msgSend(v11, "appendString:", v13);
      v13 = CFSTR(", ?");
      --v12;
    }
    while (v12);
  }
  objc_msgSend(v11, "appendString:", CFSTR(")"));

  return v11;
}

+ (id)updateSQLForProperties:(id)a3 predicate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  const __CFString *v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "hk_map:", &__block_literal_global_5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = &stru_24CB19CC0;
  if (v6)
    v12 = CFSTR(" WHERE ");
  else
    v12 = &stru_24CB19CC0;
  if (v6)
  {
    objc_msgSend(v6, "SQLForEntityClass:", objc_opt_class());
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "stringWithFormat:", CFSTR("UPDATE %@ SET %@%@%@"), v9, v10, v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)

  return v13;
}

id __57__HDSQLiteSchemaEntity_updateSQLForProperties_predicate___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ = ?"), a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)_copyDeleteSQLWithTableName:(void *)a3 columnName:
{
  id v4;
  id v5;
  uint64_t v6;

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ = ?;"), v4, v5);

  return v6;
}

+ (id)deleteStatementWithProperty:(id)a3 database:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HDSQLiteStatement *v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)+[HDSQLiteSchemaEntity _copyDeleteSQLWithTableName:columnName:]((uint64_t)a1, v8, v6);

  v10 = -[HDSQLiteStatement initWithSQL:database:]([HDSQLiteStatement alloc], "initWithSQL:database:", v9, v7);
  return v10;
}

+ (id)databaseTable
{
  id result;

  objc_opt_class();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_8();
  return result;
}

+ (BOOL)hasROWID
{
  objc_opt_class();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2();
  return 1;
}

+ (id)primaryKeyColumns
{
  id result;

  objc_opt_class();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_8();
  return result;
}

@end
