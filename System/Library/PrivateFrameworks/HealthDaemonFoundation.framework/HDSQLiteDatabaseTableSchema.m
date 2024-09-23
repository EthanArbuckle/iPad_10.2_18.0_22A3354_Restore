@implementation HDSQLiteDatabaseTableSchema

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSDictionary hash](self->_columns, "hash") ^ v3;
  return v4 ^ -[NSSet hash](self->_indices, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *name;
  NSString *v6;
  NSDictionary *columns;
  NSDictionary *v8;
  NSSet *indices;
  NSSet *v10;
  char v11;

  v4 = a3;
  name = self->_name;
  v6 = (NSString *)v4[1];
  if (name != v6 && (!v6 || !-[NSString isEqual:](name, "isEqual:")))
    goto LABEL_10;
  columns = self->_columns;
  v8 = (NSDictionary *)v4[2];
  if (columns != v8 && (!v8 || !-[NSDictionary isEqual:](columns, "isEqual:")))
    goto LABEL_10;
  indices = self->_indices;
  v10 = (NSSet *)v4[3];
  if (indices == v10)
  {
    v11 = 1;
    goto LABEL_11;
  }
  if (v10)
    v11 = -[NSSet isEqual:](indices, "isEqual:");
  else
LABEL_10:
    v11 = 0;
LABEL_11:

  return v11;
}

- (id)description
{
  void *v3;
  NSString *name;
  void *v5;
  void *v6;
  void *v7;
  NSSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  const __CFString *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16A8];
  name = self->_name;
  -[NSDictionary allValues](self->_columns, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("CREATE TABLE %@ (%@);"), name, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_indices;
  v9 = -[NSSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isUnique"))
          v15 = CFSTR("UNIQUE ");
        else
          v15 = &stru_24CB19CC0;
        objc_msgSend(v7, "appendFormat:", CFSTR(" CREATE %@INDEX %@ on %@;"), v14, v15, v13);

      }
      v10 = -[NSSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)columns
{
  return self->_columns;
}

- (void)setColumns:(id)a3
{
  objc_storeStrong((id *)&self->_columns, a3);
}

- (NSSet)indices
{
  return self->_indices;
}

- (void)setIndices:(id)a3
{
  objc_storeStrong((id *)&self->_indices, a3);
}

- (NSSet)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
  objc_storeStrong((id *)&self->_triggers, a3);
}

- (NSString)createTableSchema
{
  return self->_createTableSchema;
}

- (void)setCreateTableSchema:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createTableSchema, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_indices, 0);
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
