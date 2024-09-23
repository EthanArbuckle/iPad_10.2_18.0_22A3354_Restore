@implementation CCSQLCommandCriterion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subQuery, 0);
  objc_storeStrong((id *)&self->_subCriteria, 0);
  objc_storeStrong((id *)&self->_columnValues, 0);
  objc_storeStrong((id *)&self->_comparingTableName, 0);
  objc_storeStrong((id *)&self->_comparingColumnName, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_columnName, 0);
}

+ (CCSQLCommandCriterion)criterionWithColumnName:(id)a3 onTable:(id)a4 EQUALSColumnValue:(id)a5
{
  id v7;
  id v8;
  id v9;
  CCSQLCommandCriterion *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[CCSQLCommandCriterion initWithColumnName:tableName:columnValue:sqlOperator:]([CCSQLCommandCriterion alloc], "initWithColumnName:tableName:columnValue:sqlOperator:", v9, v8, v7, 1);

  return v10;
}

+ (CCSQLCommandCriterion)criterionWithColumnName:(id)a3 EQUALSColumnValue:(id)a4
{
  id v5;
  id v6;
  CCSQLCommandCriterion *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CCSQLCommandCriterion initWithColumnName:columnValue:sqlOperator:]([CCSQLCommandCriterion alloc], "initWithColumnName:columnValue:sqlOperator:", v6, v5, 1);

  return v7;
}

- (CCSQLCommandCriterion)initWithColumnName:(id)a3 tableName:(id)a4 columnValue:(id)a5 sqlOperator:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  CCSQLCommandCriterion *v13;
  uint64_t v14;
  NSString *columnName;
  uint64_t v16;
  NSString *tableName;
  NSString *comparingColumnName;
  NSString *comparingTableName;
  uint64_t v20;
  NSArray *columnValues;
  NSArray *subCriteria;
  CCDatabaseSelect *subQuery;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v25.receiver = self;
  v25.super_class = (Class)CCSQLCommandCriterion;
  v13 = -[CCSQLCommandCriterion init](&v25, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    columnName = v13->_columnName;
    v13->_columnName = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    tableName = v13->_tableName;
    v13->_tableName = (NSString *)v16;

    comparingColumnName = v13->_comparingColumnName;
    v13->_comparingColumnName = 0;

    comparingTableName = v13->_comparingTableName;
    v13->_comparingTableName = 0;

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v12);
    v20 = objc_claimAutoreleasedReturnValue();
    columnValues = v13->_columnValues;
    v13->_columnValues = (NSArray *)v20;

    subCriteria = v13->_subCriteria;
    v13->_sqlOperator = a6;
    v13->_subCriteria = 0;

    subQuery = v13->_subQuery;
    v13->_subQuery = 0;

  }
  return v13;
}

- (CCSQLCommandCriterion)initWithColumnName:(id)a3 columnValue:(id)a4 sqlOperator:(int64_t)a5
{
  return -[CCSQLCommandCriterion initWithColumnName:tableName:columnValue:sqlOperator:](self, "initWithColumnName:tableName:columnValue:sqlOperator:", a3, 0, a4, a5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSString copyWithZone:](self->_columnName, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_tableName, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_comparingTableName, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = -[NSString copyWithZone:](self->_comparingColumnName, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  v14 = -[NSArray copyWithZone:](self->_columnValues, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  v5[6] = self->_sqlOperator;
  v16 = -[NSArray copyWithZone:](self->_subCriteria, "copyWithZone:", a3);
  v17 = (void *)v5[7];
  v5[7] = v16;

  v18 = -[CCDatabaseCommand copyWithZone:](self->_subQuery, "copyWithZone:", a3);
  v19 = (void *)v5[8];
  v5[8] = v18;

  return v5;
}

+ (CCSQLCommandCriterion)criterionWithANDSubCriteria:(id)a3
{
  id v3;
  CCSQLCommandCriterion *v4;

  v3 = a3;
  v4 = -[CCSQLCommandCriterion initWithSubCriteria:sqlOperator:]([CCSQLCommandCriterion alloc], "initWithSubCriteria:sqlOperator:", v3, 10);

  return v4;
}

- (CCSQLCommandCriterion)initWithSubCriteria:(id)a3 sqlOperator:(int64_t)a4
{
  id v6;
  CCSQLCommandCriterion *v7;
  CCSQLCommandCriterion *v8;
  NSString *columnName;
  NSString *tableName;
  NSString *comparingColumnName;
  NSString *comparingTableName;
  NSArray *columnValues;
  uint64_t v14;
  NSArray *subCriteria;
  CCDatabaseSelect *subQuery;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CCSQLCommandCriterion;
  v7 = -[CCSQLCommandCriterion init](&v18, sel_init);
  v8 = v7;
  if (v7)
  {
    columnName = v7->_columnName;
    v7->_columnName = 0;

    tableName = v8->_tableName;
    v8->_tableName = 0;

    comparingColumnName = v8->_comparingColumnName;
    v8->_comparingColumnName = 0;

    comparingTableName = v8->_comparingTableName;
    v8->_comparingTableName = 0;

    columnValues = v8->_columnValues;
    v8->_columnValues = 0;

    v8->_sqlOperator = a4;
    v14 = objc_msgSend(v6, "copy");
    subCriteria = v8->_subCriteria;
    v8->_subCriteria = (NSArray *)v14;

    subQuery = v8->_subQuery;
    v8->_subQuery = 0;

  }
  return v8;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (CCDatabaseSelect)subQuery
{
  return self->_subQuery;
}

- (NSArray)subCriteria
{
  return self->_subCriteria;
}

- (int64_t)sqlOperator
{
  return self->_sqlOperator;
}

- (NSArray)columnValues
{
  return self->_columnValues;
}

- (NSString)columnName
{
  return self->_columnName;
}

+ (CCSQLCommandCriterion)criterionWithColumnName:(id)a3 LESSTHANColumnValue:(id)a4
{
  id v5;
  id v6;
  CCSQLCommandCriterion *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CCSQLCommandCriterion initWithColumnName:columnValue:sqlOperator:]([CCSQLCommandCriterion alloc], "initWithColumnName:columnValue:sqlOperator:", v6, v5, 2);

  return v7;
}

- (CCSQLCommandCriterion)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CCSQLCommandCriterion)initWithColumnName:(id)a3 columnValues:(id)a4 sqlOperator:(int64_t)a5
{
  id v8;
  id v9;
  CCSQLCommandCriterion *v10;
  uint64_t v11;
  NSString *columnName;
  NSString *tableName;
  NSString *comparingColumnName;
  NSString *comparingTableName;
  uint64_t v16;
  NSArray *columnValues;
  NSArray *subCriteria;
  CCDatabaseSelect *subQuery;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CCSQLCommandCriterion;
  v10 = -[CCSQLCommandCriterion init](&v21, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    columnName = v10->_columnName;
    v10->_columnName = (NSString *)v11;

    tableName = v10->_tableName;
    v10->_tableName = 0;

    comparingColumnName = v10->_comparingColumnName;
    v10->_comparingColumnName = 0;

    comparingTableName = v10->_comparingTableName;
    v10->_comparingTableName = 0;

    v16 = objc_msgSend(v9, "copy");
    columnValues = v10->_columnValues;
    v10->_columnValues = (NSArray *)v16;

    subCriteria = v10->_subCriteria;
    v10->_sqlOperator = a5;
    v10->_subCriteria = 0;

    subQuery = v10->_subQuery;
    v10->_subQuery = 0;

  }
  return v10;
}

- (CCSQLCommandCriterion)initWithColumnName:(id)a3 tableName:(id)a4 otherColumnName:(id)a5 otherTableName:(id)a6 sqlOperator:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  CCSQLCommandCriterion *v16;
  uint64_t v17;
  NSString *columnName;
  uint64_t v19;
  NSString *tableName;
  uint64_t v21;
  NSString *comparingColumnName;
  uint64_t v23;
  NSString *comparingTableName;
  NSArray *columnValues;
  NSArray *subCriteria;
  CCDatabaseSelect *subQuery;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v29.receiver = self;
  v29.super_class = (Class)CCSQLCommandCriterion;
  v16 = -[CCSQLCommandCriterion init](&v29, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    columnName = v16->_columnName;
    v16->_columnName = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    tableName = v16->_tableName;
    v16->_tableName = (NSString *)v19;

    v21 = objc_msgSend(v14, "copy");
    comparingColumnName = v16->_comparingColumnName;
    v16->_comparingColumnName = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    comparingTableName = v16->_comparingTableName;
    v16->_comparingTableName = (NSString *)v23;

    columnValues = v16->_columnValues;
    v16->_columnValues = 0;

    subCriteria = v16->_subCriteria;
    v16->_sqlOperator = a7;
    v16->_subCriteria = 0;

    subQuery = v16->_subQuery;
    v16->_subQuery = 0;

  }
  return v16;
}

- (CCSQLCommandCriterion)initWithColumnName:(id)a3 subQuery:(id)a4 sqlOperator:(int64_t)a5
{
  id v9;
  id v10;
  CCSQLCommandCriterion *v11;
  CCSQLCommandCriterion *v12;
  NSString *tableName;
  NSString *comparingTableName;
  NSString *comparingColumnName;
  NSArray *columnValues;
  NSArray *subCriteria;
  uint64_t v18;
  CCDatabaseSelect *subQuery;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CCSQLCommandCriterion;
  v11 = -[CCSQLCommandCriterion init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_columnName, a3);
    tableName = v12->_tableName;
    v12->_tableName = 0;

    comparingTableName = v12->_comparingTableName;
    v12->_comparingTableName = 0;

    comparingColumnName = v12->_comparingColumnName;
    v12->_comparingColumnName = 0;

    columnValues = v12->_columnValues;
    v12->_columnValues = 0;

    subCriteria = v12->_subCriteria;
    v12->_sqlOperator = a5;
    v12->_subCriteria = 0;

    v18 = objc_msgSend(v10, "copy");
    subQuery = v12->_subQuery;
    v12->_subQuery = (CCDatabaseSelect *)v18;

  }
  return v12;
}

- (CCSQLCommandCriterion)initWithSubQuery:(id)a3 sqlOperator:(int64_t)a4
{
  id v6;
  CCSQLCommandCriterion *v7;
  CCSQLCommandCriterion *v8;
  NSString *columnName;
  NSString *tableName;
  NSString *comparingTableName;
  NSString *comparingColumnName;
  NSArray *columnValues;
  NSArray *subCriteria;
  uint64_t v15;
  CCDatabaseSelect *subQuery;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CCSQLCommandCriterion;
  v7 = -[CCSQLCommandCriterion init](&v18, sel_init);
  v8 = v7;
  if (v7)
  {
    columnName = v7->_columnName;
    v7->_columnName = 0;

    tableName = v8->_tableName;
    v8->_tableName = 0;

    comparingTableName = v8->_comparingTableName;
    v8->_comparingTableName = 0;

    comparingColumnName = v8->_comparingColumnName;
    v8->_comparingColumnName = 0;

    columnValues = v8->_columnValues;
    v8->_columnValues = 0;

    subCriteria = v8->_subCriteria;
    v8->_sqlOperator = a4;
    v8->_subCriteria = 0;

    v15 = objc_msgSend(v6, "copy");
    subQuery = v8->_subQuery;
    v8->_subQuery = (CCDatabaseSelect *)v15;

  }
  return v8;
}

+ (CCSQLCommandCriterion)criterionWithColumnName:(id)a3 onTable:(id)a4 EQUALSColumnName:(id)a5 onTable:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  CCSQLCommandCriterion *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[CCSQLCommandCriterion initWithColumnName:tableName:otherColumnName:otherTableName:sqlOperator:]([CCSQLCommandCriterion alloc], "initWithColumnName:tableName:otherColumnName:otherTableName:sqlOperator:", v12, v11, v10, v9, 1);

  return v13;
}

+ (CCSQLCommandCriterion)criterionWithColumnName:(id)a3 ISColumnValue:(id)a4
{
  id v5;
  id v6;
  CCSQLCommandCriterion *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CCSQLCommandCriterion initWithColumnName:columnValue:sqlOperator:]([CCSQLCommandCriterion alloc], "initWithColumnName:columnValue:sqlOperator:", v6, v5, 12);

  return v7;
}

+ (CCSQLCommandCriterion)criterionWithColumnName:(id)a3 ISNOTColumnValue:(id)a4
{
  id v5;
  id v6;
  CCSQLCommandCriterion *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CCSQLCommandCriterion initWithColumnName:columnValue:sqlOperator:]([CCSQLCommandCriterion alloc], "initWithColumnName:columnValue:sqlOperator:", v6, v5, 13);

  return v7;
}

+ (CCSQLCommandCriterion)criterionWithColumnName:(id)a3 NOTEQUALSColumnValue:(id)a4
{
  id v5;
  id v6;
  CCSQLCommandCriterion *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CCSQLCommandCriterion initWithColumnName:columnValue:sqlOperator:]([CCSQLCommandCriterion alloc], "initWithColumnName:columnValue:sqlOperator:", v6, v5, 6);

  return v7;
}

+ (CCSQLCommandCriterion)criterionWithColumnName:(id)a3 LESSTHANOrEqualColumnValue:(id)a4
{
  id v5;
  id v6;
  CCSQLCommandCriterion *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CCSQLCommandCriterion initWithColumnName:columnValue:sqlOperator:]([CCSQLCommandCriterion alloc], "initWithColumnName:columnValue:sqlOperator:", v6, v5, 3);

  return v7;
}

+ (CCSQLCommandCriterion)criterionWithColumnName:(id)a3 GREATERTHANOrEqualColumnValue:(id)a4
{
  id v5;
  id v6;
  CCSQLCommandCriterion *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CCSQLCommandCriterion initWithColumnName:columnValue:sqlOperator:]([CCSQLCommandCriterion alloc], "initWithColumnName:columnValue:sqlOperator:", v6, v5, 4);

  return v7;
}

+ (CCSQLCommandCriterion)criterionWithColumnName:(id)a3 MATCHSearchPhrase:(id)a4
{
  id v5;
  id v6;
  CCSQLCommandCriterion *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CCSQLCommandCriterion initWithColumnName:columnValue:sqlOperator:]([CCSQLCommandCriterion alloc], "initWithColumnName:columnValue:sqlOperator:", v6, v5, 5);

  return v7;
}

+ (CCSQLCommandCriterion)criterionWithColumnName:(id)a3 LIKEWildcardPattern:(id)a4
{
  id v5;
  id v6;
  CCSQLCommandCriterion *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CCSQLCommandCriterion initWithColumnName:columnValue:sqlOperator:]([CCSQLCommandCriterion alloc], "initWithColumnName:columnValue:sqlOperator:", v6, v5, 9);

  return v7;
}

+ (CCSQLCommandCriterion)criterionWithColumnName:(id)a3 INColumnValues:(id)a4
{
  id v5;
  id v6;
  CCSQLCommandCriterion *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CCSQLCommandCriterion initWithColumnName:columnValues:sqlOperator:]([CCSQLCommandCriterion alloc], "initWithColumnName:columnValues:sqlOperator:", v6, v5, 8);

  return v7;
}

+ (CCSQLCommandCriterion)criterionWithColumnName:(id)a3 INSubQuery:(id)a4
{
  id v5;
  id v6;
  CCSQLCommandCriterion *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CCSQLCommandCriterion initWithColumnName:subQuery:sqlOperator:]([CCSQLCommandCriterion alloc], "initWithColumnName:subQuery:sqlOperator:", v6, v5, 8);

  return v7;
}

+ (CCSQLCommandCriterion)criterionWithEXISTSSubQuery:(id)a3
{
  id v3;
  CCSQLCommandCriterion *v4;

  v3 = a3;
  v4 = -[CCSQLCommandCriterion initWithSubQuery:sqlOperator:]([CCSQLCommandCriterion alloc], "initWithSubQuery:sqlOperator:", v3, 15);

  return v4;
}

+ (CCSQLCommandCriterion)criterionWithNOTEXISTSSubQuery:(id)a3
{
  id v3;
  CCSQLCommandCriterion *v4;

  v3 = a3;
  v4 = -[CCSQLCommandCriterion initWithSubQuery:sqlOperator:]([CCSQLCommandCriterion alloc], "initWithSubQuery:sqlOperator:", v3, 16);

  return v4;
}

+ (CCSQLCommandCriterion)criterionWithColumnName:(id)a3 BETWEENLowerColumnValue:(id)a4 ANDUpperColumnValue:(id)a5
{
  id v7;
  id v8;
  id v9;
  CCSQLCommandCriterion *v10;
  void *v11;
  CCSQLCommandCriterion *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [CCSQLCommandCriterion alloc];
  v14[0] = v8;
  v14[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[CCSQLCommandCriterion initWithColumnName:columnValues:sqlOperator:](v10, "initWithColumnName:columnValues:sqlOperator:", v9, v11, 7);
  return v12;
}

+ (CCSQLCommandCriterion)criterionWithORSubCriteria:(id)a3
{
  id v3;
  CCSQLCommandCriterion *v4;

  v3 = a3;
  v4 = -[CCSQLCommandCriterion initWithSubCriteria:sqlOperator:]([CCSQLCommandCriterion alloc], "initWithSubCriteria:sqlOperator:", v3, 11);

  return v4;
}

+ (CCSQLCommandCriterion)criterionWithNOTSubCriteria:(id)a3
{
  id v3;
  CCSQLCommandCriterion *v4;
  void *v5;
  CCSQLCommandCriterion *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = [CCSQLCommandCriterion alloc];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[CCSQLCommandCriterion initWithSubCriteria:sqlOperator:](v4, "initWithSubCriteria:sqlOperator:", v5, 14);
  return v6;
}

- (id)description
{
  void *v3;
  NSString *columnName;
  NSArray *columnValues;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CCSQLCommandCriterion;
  -[CCSQLCommandCriterion description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  columnName = self->_columnName;
  columnValues = self->_columnValues;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_sqlOperator);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" columnName: %@, columnValues: %@, sqlOperator: %@, subCriteria: %@"), columnName, columnValues, v6, self->_subCriteria);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)comparingColumnName
{
  return self->_comparingColumnName;
}

- (NSString)comparingTableName
{
  return self->_comparingTableName;
}

@end
