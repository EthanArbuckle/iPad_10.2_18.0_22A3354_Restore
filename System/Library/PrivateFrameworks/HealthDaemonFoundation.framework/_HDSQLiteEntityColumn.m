@implementation _HDSQLiteEntityColumn

- (_HDSQLiteEntityColumn)initWithName:(id)a3 columnType:(id)a4 keyPathType:(unsigned __int8)a5
{
  return -[_HDSQLiteEntityColumn initWithName:columnType:keyPathType:foreignKey:](self, "initWithName:columnType:keyPathType:foreignKey:", a3, a4, a5, 0);
}

- (_HDSQLiteEntityColumn)initWithName:(id)a3 columnType:(id)a4 keyPathType:(unsigned __int8)a5 foreignKey:(id)a6
{
  int v7;
  id v11;
  id v12;
  id v13;
  _BOOL4 HasForeignKey;
  _HDSQLiteEntityColumn *v15;
  uint64_t v16;
  NSString *name;
  uint64_t v18;
  NSString *columnType;
  void *v21;
  objc_super v22;

  v7 = a5;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  HasForeignKey = HDKeyPathTypeHasForeignKey(v7);
  if (!v13 && HasForeignKey)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSQLiteEntityColumn.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("foreignKey != nil"));

  }
  v22.receiver = self;
  v22.super_class = (Class)_HDSQLiteEntityColumn;
  v15 = -[_HDSQLiteEntityColumn init](&v22, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v11, "copy");
    name = v15->_name;
    v15->_name = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    columnType = v15->_columnType;
    v15->_columnType = (NSString *)v18;

    v15->_keyPathType = v7;
    objc_storeStrong((id *)&v15->_foreignKey, a6);
  }

  return v15;
}

- (_HDSQLiteEntityColumn)initWithName:(id)a3 columnType:(id)a4 keyPathType:(unsigned __int8)a5 targetEntityClass:(Class)a6 targetProperty:(id)a7 deletionAction:(int64_t)a8
{
  uint64_t v11;
  id v15;
  id v16;
  id v17;
  void *v18;
  HDSQLiteEntityForeignKey *v19;
  _HDSQLiteEntityColumn *v20;
  void *v22;

  v11 = a5;
  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = v17;
  if (a6)
  {
    if (!v17)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSQLiteEntityColumn.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("targetProperty != nil"));

    }
    v19 = -[HDSQLiteEntityForeignKey initWithEntityClass:property:deletionAction:]([HDSQLiteEntityForeignKey alloc], "initWithEntityClass:property:deletionAction:", a6, v18, a8);
  }
  else
  {
    v19 = 0;
  }
  v20 = -[_HDSQLiteEntityColumn initWithName:columnType:keyPathType:foreignKey:](self, "initWithName:columnType:keyPathType:foreignKey:", v15, v16, v11, v19);

  return v20;
}

- (id)creationSQL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (self->_foreignKey)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    -[_HDSQLiteEntityColumn _columnNameAndTypeString]((uint64_t)self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSQLiteEntityForeignKey creationSQL](self->_foreignKey, "creationSQL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[_HDSQLiteEntityColumn _columnNameAndTypeString]((uint64_t)self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)_columnNameAndTypeString
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  const __CFString *v6;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)MEMORY[0x24BDD17C8];
    v3 = *(_QWORD *)(a1 + 16);
    v4 = objc_msgSend(*(id *)(a1 + 24), "length");
    v5 = " ";
    if (!v4)
      v5 = "";
    v6 = *(const __CFString **)(v1 + 24);
    if (!v6)
      v6 = &stru_24CB19CC0;
    objc_msgSend(v2, "stringWithFormat:", CFSTR("%@%s%@"), v3, v5, v6);
    a1 = objc_claimAutoreleasedReturnValue();
  }
  return (id)a1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[_HDSQLiteEntityColumn _columnNameAndTypeString]((uint64_t)self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_keyPathType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)columnType
{
  return self->_columnType;
}

- (unsigned)keyPathType
{
  return self->_keyPathType;
}

- (HDSQLiteEntityForeignKey)foreignKey
{
  return self->_foreignKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foreignKey, 0);
  objc_storeStrong((id *)&self->_columnType, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
