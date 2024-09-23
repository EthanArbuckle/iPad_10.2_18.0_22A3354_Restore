@implementation CCSQLCommandJoinCriterion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subCriteria, 0);
  objc_storeStrong((id *)&self->_comparingTableName, 0);
  objc_storeStrong((id *)&self->_comparingColumnName, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_columnName, 0);
}

- (NSString)tableName
{
  return self->_tableName;
}

- (NSArray)subCriteria
{
  return self->_subCriteria;
}

- (int64_t)sqlOperator
{
  return self->_sqlOperator;
}

- (CCSQLCommandJoinCriterion)initWithColumnName:(id)a3 onTable:(id)a4 comparingColumnName:(id)a5 comparingTableName:(id)a6 sqlOperator:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CCSQLCommandJoinCriterion *v17;
  CCSQLCommandJoinCriterion *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CCSQLCommandJoinCriterion;
  v17 = -[CCSQLCommandJoinCriterion init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_columnName, a3);
    objc_storeStrong((id *)&v18->_tableName, a4);
    objc_storeStrong((id *)&v18->_comparingColumnName, a5);
    objc_storeStrong((id *)&v18->_comparingTableName, a6);
    v18->_sqlOperator = a7;
  }

  return v18;
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

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSString copyWithZone:](self->_columnName, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_tableName, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_comparingColumnName, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSString copyWithZone:](self->_comparingTableName, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v5[5] = self->_sqlOperator;
  v14 = -[NSArray copyWithZone:](self->_subCriteria, "copyWithZone:", a3);
  v15 = (void *)v5[6];
  v5[6] = v14;

  return v5;
}

- (NSString)comparingTableName
{
  return self->_comparingTableName;
}

- (NSString)comparingColumnName
{
  return self->_comparingColumnName;
}

- (NSString)columnName
{
  return self->_columnName;
}

+ (CCSQLCommandJoinCriterion)criterionWithColumnName:(id)a3 onTable:(id)a4 EQUALSColumnName:(id)a5 comparingTableName:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  CCSQLCommandJoinCriterion *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[CCSQLCommandJoinCriterion initWithColumnName:onTable:comparingColumnName:comparingTableName:sqlOperator:]([CCSQLCommandJoinCriterion alloc], "initWithColumnName:onTable:comparingColumnName:comparingTableName:sqlOperator:", v12, v11, v10, v9, 1);

  return v13;
}

- (CCSQLCommandJoinCriterion)initWithSubCriteria:(id)a3 sqlOperator:(int64_t)a4
{
  id v6;
  CCSQLCommandJoinCriterion *v7;
  CCSQLCommandJoinCriterion *v8;
  NSString *columnName;
  NSString *comparingColumnName;
  NSString *v11;
  NSString *comparingTableName;
  uint64_t v13;
  NSArray *subCriteria;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CCSQLCommandJoinCriterion;
  v7 = -[CCSQLCommandJoinCriterion init](&v16, sel_init);
  v8 = v7;
  if (v7)
  {
    columnName = v7->_columnName;
    v7->_columnName = 0;

    comparingColumnName = v8->_comparingColumnName;
    v8->_comparingColumnName = 0;

    v11 = v8->_comparingColumnName;
    v8->_comparingColumnName = 0;

    comparingTableName = v8->_comparingTableName;
    v8->_comparingTableName = 0;

    v8->_sqlOperator = a4;
    v13 = objc_msgSend(v6, "copy");
    subCriteria = v8->_subCriteria;
    v8->_subCriteria = (NSArray *)v13;

  }
  return v8;
}

+ (CCSQLCommandJoinCriterion)criterionWithANDSubCriteria:(id)a3
{
  id v3;
  CCSQLCommandJoinCriterion *v4;

  v3 = a3;
  v4 = -[CCSQLCommandJoinCriterion initWithSubCriteria:sqlOperator:]([CCSQLCommandJoinCriterion alloc], "initWithSubCriteria:sqlOperator:", v3, 10);

  return v4;
}

@end
