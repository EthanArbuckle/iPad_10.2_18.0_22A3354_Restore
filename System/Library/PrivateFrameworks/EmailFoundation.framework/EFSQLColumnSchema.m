@implementation EFSQLColumnSchema

- (NSString)name
{
  return self->_name;
}

- (void)setTable:(id)a3
{
  objc_storeWeak((id *)&self->_table, a3);
}

+ (id)blobColumnWithName:(id)a3 nullable:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:type:collation:nullable:defaultValue:", v6, 4, 0, v4, 0);

  return v7;
}

+ (id)textColumnWithName:(id)a3 collation:(unint64_t)a4 nullable:(BOOL)a5
{
  objc_msgSend(a1, "textColumnWithName:collation:nullable:defaultValue:", a3, a4, a5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)initRowIDWithAlias:(id)a3 isAutoincrementing:(BOOL)a4
{
  return -[EFSQLColumnSchema initWithName:isPrimaryKey:isAutoincrementing:type:collation:nullable:defaultValue:](self, "initWithName:isPrimaryKey:isAutoincrementing:type:collation:nullable:defaultValue:", a3, 1, a4, 1, 0, 0, 0);
}

+ (id)textColumnWithName:(id)a3 collation:(unint64_t)a4 nullable:(BOOL)a5 defaultValue:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:type:collation:nullable:defaultValue:", v10, 3, a4, v7, v11);

  return v12;
}

+ (id)integerColumnWithName:(id)a3 nullable:(BOOL)a4
{
  objc_msgSend(a1, "integerColumnWithName:nullable:defaultValue:", a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)integerColumnWithName:(id)a3 nullable:(BOOL)a4 defaultValue:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:type:collation:nullable:defaultValue:", v8, 1, 0, v6, v9);

  return v10;
}

- (EFSQLColumnSchema)initWithName:(id)a3 type:(unint64_t)a4 collation:(unint64_t)a5 nullable:(BOOL)a6 defaultValue:(id)a7
{
  return -[EFSQLColumnSchema initWithName:isPrimaryKey:isAutoincrementing:type:collation:nullable:defaultValue:](self, "initWithName:isPrimaryKey:isAutoincrementing:type:collation:nullable:defaultValue:", a3, 0, 0, a4, a5, a6, a7);
}

- (EFSQLColumnSchema)initWithName:(id)a3 isPrimaryKey:(BOOL)a4 isAutoincrementing:(BOOL)a5 type:(unint64_t)a6 collation:(unint64_t)a7 nullable:(BOOL)a8 defaultValue:(id)a9
{
  _BOOL4 v12;
  id v16;
  id v17;
  EFSQLColumnSchema *v18;
  EFSQLColumnSchema *v19;
  void *v21;
  objc_super v23;

  v12 = a4;
  v16 = a3;
  v17 = a9;
  if (!v16 && !v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLColumnSchema.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name || isPrimaryKey"));

  }
  v23.receiver = self;
  v23.super_class = (Class)EFSQLColumnSchema;
  v18 = -[EFSQLColumnSchema init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_name, a3);
    if (!v16 && v12)
      objc_storeStrong((id *)&v19->_name, CFSTR("ROWID"));
    v19->_isPrimaryKey = v12;
    v19->_isAutoincrementing = a5;
    v19->_type = a6;
    v19->_collation = a7;
    v19->_nullable = a8;
    objc_storeStrong(&v19->_defaultValue, a9);
  }

  return v19;
}

- (EFSQLTableSchema)table
{
  return (EFSQLTableSchema *)objc_loadWeakRetained((id *)&self->_table);
}

- (EFSQLColumnExpression)columnExpressionWithFullName
{
  EFSQLColumnExpression *v3;
  void *v4;
  void *v5;
  void *v6;
  EFSQLColumnExpression *v7;

  v3 = [EFSQLColumnExpression alloc];
  -[EFSQLColumnSchema name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLColumnSchema table](self, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EFSQLColumnExpression initWithName:table:](v3, "initWithName:table:", v4, v6);

  return v7;
}

- (void)associateWithTable:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "rowIDColumn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLColumnSchema.m"), 228, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("table.rowIDColumn"));

  }
  -[EFSQLColumnSchema foreignKeyTarget](self, "foreignKeyTarget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

    goto LABEL_5;
  }
  -[EFSQLColumnSchema foreignKeyTargetString](self, "foreignKeyTargetString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLColumnSchema.m"), 229, CFSTR("Cannot set association for table that already has a foreign key target"));

  }
  -[EFSQLColumnSchema setAssociatedTable:](self, "setAssociatedTable:", v10);
  objc_msgSend(v10, "addAssociatedColumn:", self);

}

- (NSString)definition
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  _BOOL4 v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  _BOOL4 v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  __CFString *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  id v27;
  void *v28;
  __CFString *v29;
  id v30;
  void *v31;
  void *v32;
  void *v34;

  +[EFSQLColumnSchema stringForColumnType:](EFSQLColumnSchema, "stringForColumnType:", -[EFSQLColumnSchema type](self, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(CFSTR(" "), "stringByAppendingString:", v3);
    v4 = objc_claimAutoreleasedReturnValue();

    v34 = (void *)v4;
  }
  else
  {
    v34 = v3;
  }
  v5 = &stru_1E62A84D8;
  if (-[EFSQLColumnSchema isPrimaryKey](self, "isPrimaryKey"))
  {
    v6 = -[EFSQLColumnSchema isAutoincrementing](self, "isAutoincrementing");
    v7 = CFSTR(" PRIMARY KEY");
    if (v6)
      v7 = CFSTR(" PRIMARY KEY AUTOINCREMENT");
    v8 = v7;
    v9 = &stru_1E62A84D8;
    v10 = &stru_1E62A84D8;
  }
  else
  {
    EFSQLStringForCollation(-[EFSQLColumnSchema collation](self, "collation"));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString length](v11, "length"))
    {
      objc_msgSend(CFSTR(" "), "stringByAppendingString:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v5 = (__CFString *)v12;
    }
    else
    {
      v5 = v11;
    }
    v13 = -[EFSQLColumnSchema nullable](self, "nullable");
    v14 = CFSTR(" NOT NULL");
    if (v13)
      v14 = &stru_1E62A84D8;
    v9 = v14;
    -[EFSQLColumnSchema defaultValue](self, "defaultValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v15, "ef_quotedSQLEscapedString");
        v16 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v16;
      }
      v10 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" DEFAULT %@"), v15);

      v8 = &stru_1E62A84D8;
    }
    else
    {
      v8 = &stru_1E62A84D8;
      v10 = &stru_1E62A84D8;
    }
  }
  -[EFSQLColumnSchema foreignKeyTargetString](self, "foreignKeyTargetString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    goto LABEL_19;
  -[EFSQLColumnSchema foreignKeyTarget](self, "foreignKeyTarget");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    v17 = 0;
LABEL_29:
    v29 = &stru_1E62A84D8;
    goto LABEL_30;
  }
  v22 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v21, "name");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "rowIDColumn");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "name");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("%@(%@)"), v23, v25);

  if (!v17)
    goto LABEL_29;
LABEL_19:
  if (-[EFSQLColumnSchema foreignKeyDeleteAction](self, "foreignKeyDeleteAction"))
  {
    v18 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[EFSQLColumnSchema _stringForForeignKeyAction:](self, "_stringForForeignKeyAction:", -[EFSQLColumnSchema foreignKeyDeleteAction](self, "foreignKeyDeleteAction"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (__CFString *)objc_msgSend(v18, "initWithFormat:", CFSTR(" ON DELETE %@"), v19);

  }
  else
  {
    v20 = &stru_1E62A84D8;
  }
  v26 = &stru_1E62A84D8;
  if (-[EFSQLColumnSchema foreignKeyUpdateAction](self, "foreignKeyUpdateAction"))
  {
    v27 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[EFSQLColumnSchema _stringForForeignKeyAction:](self, "_stringForForeignKeyAction:", -[EFSQLColumnSchema foreignKeyUpdateAction](self, "foreignKeyUpdateAction"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (__CFString *)objc_msgSend(v27, "initWithFormat:", CFSTR(" ON UPDATE %@"), v28);

  }
  v29 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" REFERENCES %@%@%@"), v17, v20, v26);

LABEL_30:
  v30 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[EFSQLColumnSchema name](self, "name");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v30, "initWithFormat:", CFSTR("%@%@%@%@%@%@%@"), v31, v34, v8, v5, v9, v10, v29);

  return (NSString *)v32;
}

- (EFSQLTableSchema)foreignKeyTarget
{
  return (EFSQLTableSchema *)objc_loadWeakRetained((id *)&self->_foreignKeyTarget);
}

- (void)setAsForeignKeyForTable:(id)a3 onDelete:(unint64_t)a4 onUpdate:(unint64_t)a5
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "rowIDColumn");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLColumnSchema.m"), 211, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("table.rowIDColumn"));

  }
  -[EFSQLColumnSchema associatedTable](self, "associatedTable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

    goto LABEL_5;
  }
  -[EFSQLColumnSchema foreignKeyTargetString](self, "foreignKeyTargetString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLColumnSchema.m"), 212, CFSTR("Cannot set association for table that already has a foreign key target or associated table"));

  }
  -[EFSQLColumnSchema setForeignKeyTarget:](self, "setForeignKeyTarget:", v14);
  -[EFSQLColumnSchema setForeignKeyDeleteAction:](self, "setForeignKeyDeleteAction:", a4);
  -[EFSQLColumnSchema setForeignKeyUpdateAction:](self, "setForeignKeyUpdateAction:", a5);
  objc_msgSend(v14, "addForeignKeyReference:", self);

}

- (NSString)foreignKeyTargetString
{
  return self->_foreignKeyTargetString;
}

- (void)setForeignKeyUpdateAction:(unint64_t)a3
{
  self->_foreignKeyUpdateAction = a3;
}

- (void)setForeignKeyTarget:(id)a3
{
  objc_storeWeak((id *)&self->_foreignKeyTarget, a3);
}

- (void)setForeignKeyDeleteAction:(unint64_t)a3
{
  self->_foreignKeyDeleteAction = a3;
}

- (EFSQLTableSchema)associatedTable
{
  return (EFSQLTableSchema *)objc_loadWeakRetained((id *)&self->_associatedTable);
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)isPrimaryKey
{
  return self->_isPrimaryKey;
}

+ (id)stringForColumnType:(unint64_t)a3
{
  if (a3 - 2 > 2)
    return CFSTR("INTEGER");
  else
    return off_1E62A6FF0[a3 - 2];
}

- (BOOL)nullable
{
  return self->_nullable;
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (unint64_t)collation
{
  return self->_collation;
}

- (void)setAssociatedTable:(id)a3
{
  objc_storeWeak((id *)&self->_associatedTable, a3);
}

- (BOOL)isAutoincrementing
{
  return self->_isAutoincrementing;
}

- (EFSQLColumnExpression)columnExpression
{
  EFSQLColumnExpression *v3;
  void *v4;
  EFSQLColumnExpression *v5;

  v3 = [EFSQLColumnExpression alloc];
  -[EFSQLColumnSchema name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[EFSQLColumnExpression initWithName:](v3, "initWithName:", v4);

  return v5;
}

+ (unint64_t)columnTypeForString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v3 = a3;
  if (columnTypeForString__onceToken != -1)
    dispatch_once(&columnTypeForString__onceToken, &__block_literal_global_30);
  v4 = (void *)columnTypeForString__sColumnTypeMap;
  objc_msgSend(v3, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  if (!v7)
  {
    if (objc_msgSend(v3, "length"))
      v7 = 1;
    else
      v7 = 4;
  }

  return v7;
}

void __41__EFSQLColumnSchema_columnTypeForString___block_invoke()
{
  void *v0;

  v0 = (void *)columnTypeForString__sColumnTypeMap;
  columnTypeForString__sColumnTypeMap = (uint64_t)&unk_1E62BDD20;

}

+ (id)realColumnWithName:(id)a3 nullable:(BOOL)a4
{
  objc_msgSend(a1, "realColumnWithName:nullable:defaultValue:", a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)realColumnWithName:(id)a3 nullable:(BOOL)a4 defaultValue:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:type:collation:nullable:defaultValue:", v8, 2, 0, v6, v9);

  return v10;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)EFSQLColumnSchema;
  -[EFSQLColumnSchema description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLColumnSchema name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ %@"), v4, v5);

  return v6;
}

- (id)_stringForForeignKeyAction:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return CFSTR("NO ACTION");
  else
    return off_1E62A7008[a3 - 1];
}

- (id)fullNameWithDatabaseName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[EFSQLColumnSchema table](self, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v5, "fullNameWithDatabaseName:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EFSQLColumnSchema name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@.%@"), v7, v8);

  }
  else
  {
    -[EFSQLColumnSchema name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)setAsForeignKeyForString:(id)a3 onDelete:(unint64_t)a4 onUpdate:(unint64_t)a5
{
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[EFSQLColumnSchema foreignKeyTarget](self, "foreignKeyTarget");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    goto LABEL_3;
  }
  -[EFSQLColumnSchema associatedTable](self, "associatedTable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
LABEL_3:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLColumnSchema.m"), 221, CFSTR("Cannot set association for table that already has a foreign key target or associated table"));

  }
  -[EFSQLColumnSchema setForeignKeyTargetString:](self, "setForeignKeyTargetString:", v12);
  -[EFSQLColumnSchema setForeignKeyDeleteAction:](self, "setForeignKeyDeleteAction:", a4);
  -[EFSQLColumnSchema setForeignKeyUpdateAction:](self, "setForeignKeyUpdateAction:", a5);

}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EFSQLColumnSchema name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> column name:%@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setForeignKeyTargetString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unint64_t)foreignKeyDeleteAction
{
  return self->_foreignKeyDeleteAction;
}

- (unint64_t)foreignKeyUpdateAction
{
  return self->_foreignKeyUpdateAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foreignKeyTargetString, 0);
  objc_storeStrong(&self->_defaultValue, 0);
  objc_destroyWeak((id *)&self->_associatedTable);
  objc_destroyWeak((id *)&self->_foreignKeyTarget);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_table);
}

@end
