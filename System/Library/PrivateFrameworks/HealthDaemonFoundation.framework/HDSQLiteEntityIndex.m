@implementation HDSQLiteEntityIndex

- (HDSQLiteEntityIndex)initWithEntity:(Class)a3 name:(id)a4 columns:(id)a5
{
  return -[HDSQLiteEntityIndex initWithEntity:name:columns:unique:predicateString:](self, "initWithEntity:name:columns:unique:predicateString:", a3, a4, a5, 0, 0);
}

- (HDSQLiteEntityIndex)initWithEntity:(Class)a3 name:(id)a4 columns:(id)a5 unique:(BOOL)a6 predicateString:(id)a7
{
  return -[HDSQLiteEntityIndex initWithEntity:name:columns:collationForColumn:unique:predicateString:](self, "initWithEntity:name:columns:collationForColumn:unique:predicateString:", a3, a4, a5, MEMORY[0x24BDBD1B8], a6, a7);
}

- (HDSQLiteEntityIndex)initWithEntity:(Class)a3 name:(id)a4 columns:(id)a5 collationForColumn:(id)a6 unique:(BOOL)a7 predicateString:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HDSQLiteEntityIndex *v18;
  HDSQLiteEntityIndex *v19;
  uint64_t v20;
  NSString *name;
  uint64_t v22;
  NSDictionary *collationColumnMapping;
  uint64_t v24;
  NSArray *columns;
  uint64_t v26;
  NSString *predicateString;
  objc_super v29;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v29.receiver = self;
  v29.super_class = (Class)HDSQLiteEntityIndex;
  v18 = -[HDSQLiteEntityIndex init](&v29, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_entityClass, a3);
    v20 = objc_msgSend(v14, "copy");
    name = v19->_name;
    v19->_name = (NSString *)v20;

    v19->_unique = a7;
    v22 = objc_msgSend(v16, "copy");
    collationColumnMapping = v19->_collationColumnMapping;
    v19->_collationColumnMapping = (NSDictionary *)v22;

    v24 = objc_msgSend(v15, "copy");
    columns = v19->_columns;
    v19->_columns = (NSArray *)v24;

    v26 = objc_msgSend(v17, "copy");
    predicateString = v19->_predicateString;
    v19->_predicateString = (NSString *)v26;

  }
  return v19;
}

- (NSString)disambiguatedName
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSString *name;
  void *v8;
  uint64_t v10;

  -[objc_class databaseName](self->_entityClass, "databaseName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[objc_class databaseTable](self->_entityClass, "databaseTable");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  name = self->_name;
  if (v3)
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@_%@"), v3, v5, name);
  else
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@_%@"), v5, name, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)creationSQL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("CREATE "));
  v4 = v3;
  if (self->_unique)
    objc_msgSend(v3, "appendString:", CFSTR("UNIQUE "));
  v5 = (void *)MEMORY[0x24BDD17C8];
  -[HDSQLiteEntityIndex disambiguatedName](self, "disambiguatedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class databaseTable](self->_entityClass, "databaseTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSQLiteEntityIndex _columnsAndCollations](self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("INDEX IF NOT EXISTS %@ ON %@ (%@)"), v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v10);

  if (self->_predicateString)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" WHERE (%@)"), self->_predicateString);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v11);

  }
  objc_msgSend(v4, "appendString:", CFSTR(";"));
  return v4;
}

- (_QWORD)_columnsAndCollations
{
  _QWORD *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[5];
  id v8;

  v1 = a1;
  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v3 = (void *)v1[4];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __44__HDSQLiteEntityIndex__columnsAndCollations__block_invoke;
    v7[3] = &unk_24CB19788;
    v7[4] = v1;
    v4 = v2;
    v8 = v4;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);
    v5 = v8;
    v1 = v4;

  }
  return v1;
}

void __44__HDSQLiteEntityIndex__columnsAndCollations__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(void **)(a1 + 40);
  if (!v3)
  {
    objc_msgSend(v5, "addObject:", v12);
    goto LABEL_5;
  }
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = objc_msgSend(v3, "integerValue");
  if (v7 < 3)
  {
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ %@"), v12, *(&off_24CB197A8 + v7));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

LABEL_5:
    return;
  }
  v9 = v7;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString * _Nonnull SQLCollationStringFromType(HDSQLiteIndexCollationType)");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("HDSQLiteEntityIndex.m"), 27, CFSTR("Invalid HDSQLiteIndexCollationType type: %ld"), v9);

  __break(1u);
}

- (Class)entityClass
{
  return self->_entityClass;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)columns
{
  return self->_columns;
}

- (BOOL)isUnique
{
  return self->_unique;
}

- (NSString)predicateString
{
  return self->_predicateString;
}

- (NSDictionary)collationColumnMapping
{
  return self->_collationColumnMapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collationColumnMapping, 0);
  objc_storeStrong((id *)&self->_predicateString, 0);
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_entityClass, 0);
}

@end
