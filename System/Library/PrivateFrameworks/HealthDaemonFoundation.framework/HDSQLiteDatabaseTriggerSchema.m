@implementation HDSQLiteDatabaseTriggerSchema

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_tableName, "hash");
  return -[NSString hash](self->_sql, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *tableName;
  NSString *v6;
  NSString *sql;
  NSString *v8;
  char v9;

  v4 = a3;
  tableName = self->_tableName;
  v6 = (NSString *)v4[2];
  if (tableName != v6 && (!v6 || !-[NSString isEqual:](tableName, "isEqual:")))
    goto LABEL_7;
  sql = self->_sql;
  v8 = (NSString *)v4[3];
  if (sql == v8)
  {
    v9 = 1;
    goto LABEL_9;
  }
  if (v8)
    v9 = -[NSString isEqual:](sql, "isEqual:");
  else
LABEL_7:
    v9 = 0;
LABEL_9:

  return v9;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%@: %@"), self->_name, self->_sql);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)tableName
{
  return self->_tableName;
}

- (void)setTableName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)sql
{
  return self->_sql;
}

- (void)setSql:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sql, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
