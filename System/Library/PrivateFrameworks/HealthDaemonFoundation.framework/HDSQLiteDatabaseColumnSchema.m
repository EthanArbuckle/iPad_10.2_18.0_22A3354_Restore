@implementation HDSQLiteDatabaseColumnSchema

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  NSUInteger v7;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_type, "hash") ^ v3;
  v5 = v4 ^ -[NSString hash](self->_defaultValue, "hash") ^ self->_isAutoincrement;
  v6 = self->_isPrimaryKey ^ (unint64_t)self->_isNullable;
  v7 = v6 ^ -[NSString hash](self->_foreignKeyTargetTable, "hash");
  return v5 ^ v7 ^ -[NSString hash](self->_foreignKeyTargetColumn, "hash") ^ self->_deletionAction;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *name;
  NSString *v6;
  NSString *type;
  NSString *v8;
  NSString *defaultValue;
  NSString *v10;
  NSString *foreignKeyTargetTable;
  NSString *v12;
  NSString *foreignKeyTargetColumn;
  NSString *v14;
  BOOL v15;

  v4 = a3;
  name = self->_name;
  v6 = (NSString *)v4[2];
  if (name != v6 && (!v6 || !-[NSString isEqual:](name, "isEqual:")))
    goto LABEL_20;
  type = self->_type;
  v8 = (NSString *)v4[3];
  if (type != v8 && (!v8 || !-[NSString isEqual:](type, "isEqual:")))
    goto LABEL_20;
  if (((defaultValue = self->_defaultValue, v10 = (NSString *)v4[4], defaultValue == v10)
     || v10 && -[NSString isEqual:](defaultValue, "isEqual:"))
    && self->_isAutoincrement == *((unsigned __int8 *)v4 + 8)
    && self->_isPrimaryKey == *((unsigned __int8 *)v4 + 9)
    && self->_isNullable == *((unsigned __int8 *)v4 + 10)
    && ((foreignKeyTargetTable = self->_foreignKeyTargetTable, v12 = (NSString *)v4[5], foreignKeyTargetTable == v12)
     || v12 && -[NSString isEqual:](foreignKeyTargetTable, "isEqual:"))
    && ((foreignKeyTargetColumn = self->_foreignKeyTargetColumn, v14 = (NSString *)v4[6], foreignKeyTargetColumn == v14)
     || v14 && -[NSString isEqual:](foreignKeyTargetColumn, "isEqual:")))
  {
    v15 = self->_deletionAction == v4[7];
  }
  else
  {
LABEL_20:
    v15 = 0;
  }

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  NSString *foreignKeyTargetTable;
  NSString *foreignKeyTargetColumn;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%@ %@"), self->_name, self->_type);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_isPrimaryKey)
    objc_msgSend(v3, "appendString:", CFSTR(" PRIMARY KEY"));
  if (self->_isAutoincrement)
    objc_msgSend(v4, "appendString:", CFSTR(" AUTOINCREMENT"));
  if (!self->_isNullable)
    objc_msgSend(v4, "appendString:", CFSTR(" NOT NULL"));
  foreignKeyTargetTable = self->_foreignKeyTargetTable;
  if (foreignKeyTargetTable)
  {
    foreignKeyTargetColumn = self->_foreignKeyTargetColumn;
    HDSQLForForeignKeyDeletionAction(self->_deletionAction);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" REFERENCES %@(%@) ON DELETE %@"), foreignKeyTargetTable, foreignKeyTargetColumn, v7);

  }
  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isAutoincrement
{
  return self->_isAutoincrement;
}

- (void)setIsAutoincrement:(BOOL)a3
{
  self->_isAutoincrement = a3;
}

- (BOOL)isPrimaryKey
{
  return self->_isPrimaryKey;
}

- (void)setIsPrimaryKey:(BOOL)a3
{
  self->_isPrimaryKey = a3;
}

- (BOOL)isNullable
{
  return self->_isNullable;
}

- (void)setIsNullable:(BOOL)a3
{
  self->_isNullable = a3;
}

- (NSString)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)foreignKeyTargetTable
{
  return self->_foreignKeyTargetTable;
}

- (void)setForeignKeyTargetTable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)foreignKeyTargetColumn
{
  return self->_foreignKeyTargetColumn;
}

- (void)setForeignKeyTargetColumn:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)deletionAction
{
  return self->_deletionAction;
}

- (void)setDeletionAction:(int64_t)a3
{
  self->_deletionAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foreignKeyTargetColumn, 0);
  objc_storeStrong((id *)&self->_foreignKeyTargetTable, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
