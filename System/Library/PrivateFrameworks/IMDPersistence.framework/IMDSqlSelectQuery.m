@implementation IMDSqlSelectQuery

- (IMDSqlSelectQuery)initWithTableName:(id)a3
{
  IMDSqlSelectQuery *v3;
  IMDSqlSelectQuery *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMDSqlSelectQuery;
  v3 = -[IMDSqlQuery initWithTableName:](&v6, sel_initWithTableName_, a3);
  v4 = v3;
  if (v3)
    -[IMDSqlQuery setColumns:](v3, "setColumns:", CFSTR("*"));
  return v4;
}

- (id)createQueryString
{
  void *v3;
  NSString *v4;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("SELECT %@ FROM %@"), -[IMDSqlQuery columns](self, "columns"), -[IMDSqlQuery tableName](self, "tableName"));
  v4 = -[IMDSqlQuery where](self, "where");
  if (v4)
    objc_msgSend(v3, "appendFormat:", CFSTR(" WHERE %@"), v4);
  if (-[IMDSqlQuery limit](self, "limit"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" LIMIT %lld"), -[IMDSqlQuery limit](self, "limit"));
  objc_msgSend(v3, "appendString:", CFSTR(";"));
  return v3;
}

+ (id)selectQueryForTable:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](a1, sel_databaseQuery_);
}

+ (id)selectQueryForTable:(id)a3 withColumns:(id)a4
{
  void *v5;

  v5 = (void *)objc_msgSend(a1, "selectQueryForTable:", a3);
  objc_msgSend(v5, "setColumns:", a4);
  return v5;
}

+ (id)selectQueryForTable:(id)a3 withColumns:(id)a4 where:(id)a5
{
  void *v7;

  v7 = (void *)objc_msgSend(a1, "selectQueryForTable:", a3);
  objc_msgSend(v7, "setColumns:", a4);
  objc_msgSend(v7, "setWhere:", a5);
  return v7;
}

@end
