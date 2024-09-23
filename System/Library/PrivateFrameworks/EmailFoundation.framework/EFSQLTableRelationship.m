@implementation EFSQLTableRelationship

- (EFSQLColumnSchema)sourceColumn
{
  return self->_sourceColumn;
}

- (NSString)tableAlias
{
  return self->_tableAlias;
}

- (EFSQLColumnSchema)destinationColumn
{
  return self->_destinationColumn;
}

- (BOOL)useLeftOuterJoin
{
  return self->_useLeftOuterJoin;
}

- (EFSQLTableRelationship)initWithSourceColumn:(id)a3 destinationColumn:(id)a4 useLeftOuterJoin:(BOOL)a5
{
  return -[EFSQLTableRelationship initWithSourceColumn:destinationColumn:useLeftOuterJoin:tableAlias:isProtectedTable:](self, "initWithSourceColumn:destinationColumn:useLeftOuterJoin:tableAlias:isProtectedTable:", a3, a4, a5, 0, 0);
}

- (EFSQLTableRelationship)initWithSourceColumn:(id)a3 destinationColumn:(id)a4 useLeftOuterJoin:(BOOL)a5 tableAlias:(id)a6 isProtectedTable:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  EFSQLTableRelationship *v16;
  EFSQLTableRelationship *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)EFSQLTableRelationship;
  v16 = -[EFSQLTableRelationship init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_sourceColumn, a3);
    objc_storeStrong((id *)&v17->_destinationColumn, a4);
    v17->_useLeftOuterJoin = a5;
    objc_storeStrong((id *)&v17->_tableAlias, a6);
    v17->_isProtectedTable = a7;
  }

  return v17;
}

- (NSString)ef_publicDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EFSQLTableRelationship sourceColumn](self, "sourceColumn");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "table");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLTableRelationship sourceColumn](self, "sourceColumn");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLTableRelationship destinationColumn](self, "destinationColumn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "table");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLTableRelationship destinationColumn](self, "destinationColumn");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%p>: source: %@[%@] destination: %@[%@]"), v4, self, v14, v5, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (BOOL)isProtectedTable
{
  return self->_isProtectedTable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableAlias, 0);
  objc_storeStrong((id *)&self->_destinationColumn, 0);
  objc_storeStrong((id *)&self->_sourceColumn, 0);
}

@end
