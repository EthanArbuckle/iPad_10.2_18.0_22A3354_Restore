@implementation CCDatabaseInsertBuilder

- (CCDatabaseInsertBuilder)initWithTableName:(id)a3 columnNames:(id)a4
{
  id v6;
  CCDatabaseInsertBuilder *v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *columnNames;
  CCDatabaseInsertBuilder *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v21;

  v6 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CCDatabaseInsertBuilder;
  v7 = -[CCDatabaseCommandBuilder initWithTableName:](&v21, sel_initWithTableName_, a3);
  if (!v7)
    goto LABEL_4;
  v8 = objc_msgSend(v6, "count");
  v7->_numberOfColumns = v8;
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    columnNames = v7->_columnNames;
    v7->_columnNames = (NSArray *)v9;

LABEL_4:
    v11 = v7;
    goto LABEL_8;
  }
  __biome_log_for_category();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[CCDatabaseInsertBuilder initWithTableName:columnNames:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

  v11 = 0;
LABEL_8:

  return v11;
}

- (id)buildWithError:(id *)a3
{
  unint64_t numberOfColumns;
  void *v6;
  void *v7;
  CCDatabaseInsert *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  numberOfColumns = self->_numberOfColumns;
  if (numberOfColumns == -[NSArray count](self->_columnValues, "count"))
  {
    -[CCDatabaseCommandBuilder tableName](self, "tableName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandGenerator insertCommandStringWithTableName:columnNames:returningColumns:onConflict:](CCSQLCommandGenerator, "insertCommandStringWithTableName:columnNames:returningColumns:onConflict:", v6, self->_columnNames, self->_returningColumns, self->_onConflict);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[CCDatabaseCommand initWithCommandString:parameters:]([CCDatabaseInsert alloc], "initWithCommandString:parameters:", v7, self->_columnValues);
  }
  else
  {
    -[CCDatabaseInsertBuilder _setError:withCode:](self, "_setError:withCode:", a3, 1);
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CCDatabaseInsertBuilder buildWithError:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

    v8 = 0;
  }
  return v8;
}

- (void)setColumnValues:(id)a3
{
  NSArray *v4;
  NSArray *columnValues;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  columnValues = self->_columnValues;
  self->_columnValues = v4;

}

- (void)setReturningColumns:(id)a3
{
  NSArray *v4;
  NSArray *returningColumns;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  returningColumns = self->_returningColumns;
  self->_returningColumns = v4;

}

- (void)setOnConflict:(id)a3
{
  objc_storeStrong((id *)&self->_onConflict, a3);
}

- (BOOL)_setError:(id *)a3 withCode:(int64_t)a4
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.DatabaseInsert"), a4, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a3 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onConflict, 0);
  objc_storeStrong((id *)&self->_returningColumns, 0);
  objc_storeStrong((id *)&self->_columnValues, 0);
  objc_storeStrong((id *)&self->_columnNames, 0);
}

- (void)initWithTableName:(uint64_t)a3 columnNames:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_237B25000, a1, a3, "Cannot construct DatabaseInsertBuilder with empty columnNames array", a5, a6, a7, a8, 0);
}

- (void)buildWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_237B25000, a1, a3, "columnValues array size does not match columnNames array size", a5, a6, a7, a8, 0);
}

@end
